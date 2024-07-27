Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E2D93DFEF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2024 17:21:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CDC10E033;
	Sat, 27 Jul 2024 15:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dtrPzDin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CD410E00D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722093662;
 bh=WtGgi1jB+7GuW/ovN0wMJJZUjOGWtNRhIUs4G2YYmuA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dtrPzDindDUqtKeTfN/U9eGJTxRtiORH+sBa4/KNusvAqNIamb5HittPoxrpr2T9P
 f+ytVSEqe/UU70hK3AktguP/3/gbUb96f8aMfdxownRIlyezL0gD/EDw3ut5jbYzWX
 bKgCM1F8uo4JWeJ0T6vZur1olslCOP2QnJkW7voH8o4R5cw+43Y6/pdfp+9fDRna8T
 vWM06z/XkdocbNZ1fFmmfxU/Qdm42BkQ3oXJM2VF7wan57j+qTMBbyzmioMCyzeSKz
 OwulObdUDPl3Y9Iq9wJROgy4gU+6I7tfe7fUBV5FiglhZMa+oyBInIrma5JBLdE5zO
 jWmIL30pe/V+A==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6E87837821B7;
 Sat, 27 Jul 2024 15:21:00 +0000 (UTC)
Message-ID: <25a6acd4-551f-439f-bd5d-7026b3b5d2fe@collabora.com>
Date: Sat, 27 Jul 2024 18:20:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/client: Fix error code in
 drm_client_buffer_vmap_local()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Zack Rusin <zack.rusin@broadcom.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <89d13df3-747c-4c5d-b122-d081aef5110a@stanley.mountain>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <89d13df3-747c-4c5d-b122-d081aef5110a@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/24/24 19:09, Dan Carpenter wrote:
> This function accidentally returns zero/success on the failure path.
> It leads to locking issues and an uninitialized *map_copy in the
> caller.
> 
> Fixes: b4b0193e83cb ("drm/fbdev-generic: Fix locking with drm_client_buffer_vmap_local()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/drm_client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 2803ac111bbd..bfedcbf516db 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -355,7 +355,7 @@ int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
>  
>  err_drm_gem_vmap_unlocked:
>  	drm_gem_unlock(gem);
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vmap_local);
>  

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry

