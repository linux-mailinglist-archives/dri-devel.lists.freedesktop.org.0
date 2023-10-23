Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F62C7D3663
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 14:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233F310E0C8;
	Mon, 23 Oct 2023 12:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50C510E0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 12:24:19 +0000 (UTC)
Received: from [192.168.2.43] (109-252-153-31.dynamic.spd-mgts.ru
 [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5BD1B660576C;
 Mon, 23 Oct 2023 13:24:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698063858;
 bh=ecWwmeWmDvPYCEKnLkUnP/4Fw/T4/LPA7GdW3Vb0ZUo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cwk9ca40s0UQZES4cxKolZ+L8MlbAlSQCdx0pM1sS1m9OjMbZK/lKHaHWhAIO0ABm
 kacQ21mD1niNK35we9MM8KFLlac2/Q1RM0VbpYyFAsuEmF5cl6+vfOA4l2V1PjYA3M
 /OOqetfiDeVDqAWv1AbrS4CJzxSbuM+axYOQSw77XS35yt8tgOQna4l8ivyAEx8E7l
 U7aUbUSbaVcJhLCNBrVZ6/cpmU35kGJOUmeFe0fIOGvLX/bf8WYQzzSrNAMNGvxjW8
 hA+l/Y5xlqve4l/wxgSquM/zVlwqliXSkUYL9YsOSL5f+Pumy02Vh5M0CPxHpocFFO
 75xL6MuIv8X1g==
Message-ID: <675400bf-74fb-8495-b2b8-3ff717979369@collabora.com>
Date: Mon, 23 Oct 2023 15:24:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v2 1/1] drm/virtio: new fence for every plane update
Content-Language: en-US
To: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org
References: <20231003010013.15794-1-dongwon.kim@intel.com>
 <20231003010013.15794-2-dongwon.kim@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20231003010013.15794-2-dongwon.kim@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: kraxel@redhat.com, vivek.kasireddy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/3/23 04:00, Dongwon Kim wrote:
> Having a fence linked to a virtio_gpu_framebuffer in the plane update sequence
> would cause conflict when several planes referencing the same framebuffer
> (e.g. Xorg screen covering multi-displays configured for an extended mode)
> and those planes are updated concurrently. So it is needed to allocate a
> fence for every plane state instead of the framebuffer.
> 
> The plane state for virtio-gpu, "struct virtio_gpu_plane_state" is added for
> this. This structure represents drm_plane_state and it contains the reference
> to virtio_gpu_fence, which was previously in "struct virtio_gpu_framebuffer".
> 
> "virtio_gpu_plane_duplicate_state" is added as well to create a
> virtio_gpu_plane_state on top of duplicated drm plane state.
> 
> Several drm helpers were slightly modified accordingly to use the fence in new
> plane state structure. virtio_gpu_plane_cleanup_fb was completely removed as
> dma_fence_put shouldn't be called here as it can mess up with the ref count
> of the fence. The fence should be put after the fence is signaled in
> virtio_gpu_resource_flush then released in virtio_gpu_array_add_fence while
> the next virtio message is being queued.
> 
> Also, the condition for adding fence, (plane->state->fb != new_state->fb) was
> removed since we now allocate a new fence for the new plane state even if both
> old and new planes are pointing to the same framebuffer.
> 
> v2: removed virtio_gpu_plane_duplicate_state as the existing helper,
>     drm_atomic_helper_plane_destroy_state does the same.
> 
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 66 +++++++++++++++++---------
>  2 files changed, 51 insertions(+), 22 deletions(-)

Please write a guide how to test it. Are you using spice for the
multi-display viewer?

-- 
Best regards,
Dmitry

