Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4150374C863
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 23:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE8710E077;
	Sun,  9 Jul 2023 21:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187D010E059
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 21:23:24 +0000 (UTC)
Received: from [192.168.2.126] (109-252-154-2.dynamic.spd-mgts.ru
 [109.252.154.2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 373FD6606F26;
 Sun,  9 Jul 2023 22:23:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688937801;
 bh=fDBD+lOxivT6+A978ggYOvnFWesHT0JvJuylq7lyOiM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=MTatBhgDrwhxDSy35p2SIOoWUeUHjx1/dFNEUBmDX+Wl4lGtfjXBQOjb24OdOsXg9
 Ju0dDj8W1m8JZX00X71CDy7cfUSgo3IDiLV7IRrekRS/fFAtmHS8hPmQXj5h63Obg/
 bCIGUjiCpifFt/MZ8RcM/jPkuu6zujodO2KkusbsAoAYK93PaXdfygGUnio0UETQcY
 EXc5GYY+bP5znYNBLW8VoKns+JZ0iiVuCmKKjZtG6OIw9zv5DfZzYoZrcdN9uR+5fn
 7W+wGQxwlHfXnFGZpNT/BgkCVQMzSa1ruDZVJf7//5K5g+A+GSIrUC+IfNaB6GcVDJ
 HMkNkR1Vlayow==
Message-ID: <dacb11d8-a945-107a-9a20-2f8386f78bd8@collabora.com>
Date: Mon, 10 Jul 2023 00:23:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v4] drm/virtio: conditionally allocate virtio_gpu_fence
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
References: <2cc27163-c8d2-45bc-abd7-26ea567c4aea@collabora.com>
 <20230707213124.494-1-gurchetansingh@chromium.org>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230707213124.494-1-gurchetansingh@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

08.07.2023 00:31, Gurchetan Singh пишет:
> We don't want to create a fence for every command submission.  It's
> only necessary when userspace provides a waitable token for submission.
> This could be:
> 
> 1) bo_handles, to be used with VIRTGPU_WAIT
> 2) out_fence_fd, to be used with dma_fence apis
> 3) a ring_idx provided with VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
>    + DRM event API
> 4) syncobjs in the future
> 
> The use case for just submitting a command to the host, and expecting
> no response.  For example, gfxstream has GFXSTREAM_CONTEXT_PING that
> just wakes up the host side worker threads.  There's also
> CROSS_DOMAIN_CMD_SEND which just sends data to the Wayland server.
> 
> This prevents the need to signal the automatically created
> virtio_gpu_fence.
> 
> In addition, VIRTGPU_EXECBUF_RING_IDX is checked when creating a
> DRM event object.  VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK is
> already defined in terms of per-context rings.  It was theoretically
> possible to create a DRM event on the global timeline (ring_idx == 0),
> if the context enabled DRM event polling.  However, that wouldn't
> work and userspace (Sommelier).  Explicitly disallow it for
> clarity.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  v2: Fix indent (Dmitry)
>  v3: Refactor drm fence event checks to avoid possible NULL deref (Dmitry)
>  v4: More detailed commit message about addition drm fence event checks (Dmitry)
> 
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 28 +++++++++++++------------
>  1 file changed, 15 insertions(+), 13 deletions(-)

Applied to misc-next

-- 
Best regards,
Dmitry

