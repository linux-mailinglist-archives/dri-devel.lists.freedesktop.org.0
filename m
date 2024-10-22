Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F99AA01B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 12:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A305210E309;
	Tue, 22 Oct 2024 10:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZugQ+dNW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7589610E309
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729593058;
 bh=ckwdXkesd1lkAUGXB2NkOvoDnLV225VqIN/edVwVwvc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZugQ+dNW06+dJxsk1cWVB+lYF0mpPSqkQYI/H3V6ossWlAgrWOLWyA7p1B8q27PrB
 l8twj9/sEBjLFl18AyixCNfEeif9uS6QGxJryyxGUL2ERta8Q/6JNYh1P4VOOnL/HT
 OD8VsV2vB2lVJ+GvQtvk3T/3m/CO1B/C+lKCjyYcaCFJHg9SXZyvPSLRV/T1zu0iYK
 wZD6FUFQZ6Cma4BpUAnRnoSOv0p9g7yZcy6hjeTw8ow3jZ4G8UeCQZTAp7PquALZdQ
 Fm+qFuO8iCbEz1QfJCb3hPBvdc4kUxCi5Ci8oxEDNBTZ4t6qN4X8groTTTNdpt3/wN
 JldAru3d8U/Jg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CBB9D17E1522;
 Tue, 22 Oct 2024 12:30:57 +0200 (CEST)
Date: Tue, 22 Oct 2024 12:30:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 faith.ekstrand@collabora.com
Subject: Re: [PATCH] drm/syncobj: ensure progress for syncobj queries
Message-ID: <20241022123052.3e0f3f17@collabora.com>
In-Reply-To: <20241017162054.2701638-1-olvaffe@gmail.com>
References: <20241017162054.2701638-1-olvaffe@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Oct 2024 09:20:53 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> Userspace might poll a syncobj with the query ioctl.  Call
> dma_fence_enable_sw_signaling to ensure dma_fence_is_signaled returns
> true in finite time.
> 
> ---
> 
> panvk hits this issue when timeline semaphore is enabled.  It uses the
> transfer ioctl to propagate fences.  dma_fence_unwrap_merge converts the
> dma_fence_chain to a dma_fence_array.  dma_fence_array_signaled never
> return true unless signaling is enabled.

Looks like a bugfix to me. Should we add Fixes+Cc-stable tags so it
gets backported to stable branches.

> ---
>  drivers/gpu/drm/drm_syncobj.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 4fcfc0b9b386c..58c5593c897a2 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1689,6 +1689,9 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  			    DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED) {
>  				point = fence->seqno;
>  			} else {
> +				/* ensure forward progress */
> +				dma_fence_enable_sw_signaling(fence);
> +
>  				dma_fence_chain_for_each(iter, fence) {
>  					if (iter->context != fence->context) {
>  						dma_fence_put(iter);

