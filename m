Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E016068C475
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 18:20:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F41510E426;
	Mon,  6 Feb 2023 17:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFED010E426
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 17:20:51 +0000 (UTC)
Received: from [192.168.2.90] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 65EE06602D99;
 Mon,  6 Feb 2023 17:20:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675704050;
 bh=bUXajhXwEiwkWVZseXMgMhjWWpNFCinbZK0tN5zlI0E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iRouOPwVTFFBPGErZ39RidCmc2XoyCy49AsxdNFCe6RbwIGG2UxxLMQk3REXIahwH
 LJvcWihdRomC45IeuSnGCh7MSnuP5kEp3qBIdsqrr6h+W7i0Q9rKPtDRG/V6dj69RY
 v5GCuZfJGHpuz8sr3nL/Yd3zfrgWk6FmVNjwtDh9cC5dDfc23hgilbiHNr7ws/2QZE
 RUl8EBnePY8mWeJDk83b214EM0hoDsoIegCTdPIHshCmbU47+3Zq2IwoxxWnLSZbDx
 nqDZ0SlgnzBoL400Ss9Ou7meywSX61Swi1TLbPTjEVOvaFrrSziN/VULMknESzG3W6
 MrQVHF6WY0jTg==
Message-ID: <c06c005d-41a8-5403-818b-f66264fe8c0b@collabora.com>
Date: Mon, 6 Feb 2023 20:20:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] drm/virtio: exbuf->fence_fd unmodified on interrupted
 wait
To: Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20230203233345.2477767-1-ryanneph@chromium.org>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230203233345.2477767-1-ryanneph@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Yiwei Zhang <zzyiwei@chromium.org>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/23 02:33, Ryan Neph wrote:
> An interrupted dma_fence_wait() becomes an -ERESTARTSYS returned
> to userspace ioctl(DRM_IOCTL_VIRTGPU_EXECBUFFER) calls, prompting to
> retry the ioctl(), but the passed exbuf->fence_fd has been reset to -1,
> making the retry attempt fail at sync_file_get_fence().
> 
> The uapi for DRM_IOCTL_VIRTGPU_EXECBUFFER is changed to retain the
> passed value for exbuf->fence_fd when returning anything besides a
> successful result from the ioctl.
> 
> Fixes: 2cd7b6f08bc4 ("drm/virtio: add in/out fence support for explicit synchronization")
> Signed-off-by: Ryan Neph <ryanneph@chromium.org>
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> 
> ---
> 
> Changes in v2:
> - No longer modifies exbuf->fence_fd unless DRM_IOCTL_VIRTGPU_EXECBUFFER
>   succeeds.
> - Added r-b tags (Rob/Dmitry) from v1.

Thanks! Applied to misc-fixes

-- 
Best regards,
Dmitry

