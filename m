Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F070895307
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 14:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B21210FCEE;
	Tue,  2 Apr 2024 12:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MPao5FQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC8110FCEE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712061220;
 bh=JLmZSWuKKx+DVDXAfY3j+SHJ7sahDXjArNMQEbFiR2A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MPao5FQWlgblzY4+H4T7w1x53Xgi2A22qSAWdaDILfOuL0LXfVA7Ebap+eNPpKBCu
 ovvfKyrcDo8wWY8OOLpZLu8qAfNNwyv7vgWJKw66R4NWee0dPjZnBEUUyKf1enABbS
 ofcyWYPSxJ0XpbPG9AkzQVTbEiE1SWojFlRLTcBNbgDTOlovCMgxx2lZwYuYRUbM2f
 F5TLUFOpRqUpQuNJX3dc2myKejsI/JPKOCalAnSU88jdmyVRo9M6xKTWPkIdvVJBlx
 U63np1fBvPCJEm8q9HZ1OqjGSZnwEVQKUDp0vaHrcBCtKU77bOUtkO1h7fellVI6/i
 tQOFBfmce5LwQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3DC1A3781144;
 Tue,  2 Apr 2024 12:33:39 +0000 (UTC)
Date: Tue, 2 Apr 2024 14:33:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dan.carpenter@linaro.org,
 kernel-janitors@vger.kernel.org, error27@gmail.com
Subject: Re: [PATCH] drm/panthor: Fix NULL vs IS_ERR() bug in
 panthor_ioctl_tiler_heap_destroy()
Message-ID: <20240402143337.38e864e9@collabora.com>
In-Reply-To: <20240402103358.1689379-1-harshit.m.mogalapalli@oracle.com>
References: <20240402103358.1689379-1-harshit.m.mogalapalli@oracle.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

Hello Harshit,

On Tue,  2 Apr 2024 03:33:58 -0700
Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:

> panthor_vm_get_heap_pool() returns ERR_PTR on failure.
> 
> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is spotted by smatch and the patch is only compile tested
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 11b3ccd58f85..050b905b0453 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1090,8 +1090,8 @@ static int panthor_ioctl_tiler_heap_destroy(struct drm_device *ddev, void *data,
>  		return -EINVAL;
>  
>  	pool = panthor_vm_get_heap_pool(vm, false);
> -	if (!pool) {
> -		ret = -EINVAL;
> +	if (IS_ERR(pool)) {
> +		ret = PTR_ERR(pool);

Actually, panthor_vm_get_heap_pool() will return NULL if there's no
heap pool attached to this VM and create=false, so this was correct.
This being said, I'm fine making that consistent by returning
ERR_PTR(-ENOENT) instead of NULL in that case. This way we don't have
two different semantics based on the 'create' value.

Oh, and please merge everything into a single patch instead of one patch
per call-site.

Regards,

Boris

>  		goto out_put_vm;
>  	}
>  

