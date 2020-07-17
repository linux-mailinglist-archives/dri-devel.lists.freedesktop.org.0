Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8202243AE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 21:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277C76E1AA;
	Fri, 17 Jul 2020 19:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FE16E15C;
 Fri, 17 Jul 2020 19:03:58 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f11f5a80000>; Fri, 17 Jul 2020 12:02:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 17 Jul 2020 12:03:57 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 17 Jul 2020 12:03:57 -0700
Received: from [172.20.40.65] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 Jul
 2020 19:03:56 +0000
Subject: Re: [PATCH] drm/nouveau: Accept 'legacy' format modifiers
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, "Kirill A . Shutemov" <kirill@shutemov.name>
References: <20200717185757.2786-1-jajones@nvidia.com>
X-Nvconfidentiality: public
From: James Jones <jajones@nvidia.com>
Message-ID: <30456e2c-7a46-257b-fccf-7f9f964d8cec@nvidia.com>
Date: Fri, 17 Jul 2020 12:03:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717185757.2786-1-jajones@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595012521; bh=qUHdziigmnyKzkypaq2hc9GuqFe2nrQm0s0BzwYqEVg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=K3cRuINs8kD4a/sgHc8o38ox5Zap4ezpe4aThUORNdYAl881spqW4OK+D6B5j9He4
 kUybWw4OGogKzZmwVxREc/k0lRp8MqN8y8OCmFHK160aMPajcsqcsC6R+/XKR1D/dQ
 AUGFAF3mbg/lloVtYgeBjh74Cjot1VztDNpHYT/AjJ+hFZasJP/1Tln7ba6DJCQQq4
 tuqHDIivGBvIs3oXaUPcxqTQAvCXowjocx0pjWjdyLVh+NMW1e6p3VOZmC+g9nrgkM
 u24oyjqKgyyyPLe9GvqFGhVyuvswxtnXZxkMV/E4bX+M6qI4sLKYDH8zokAyllKCL+
 KxFZZE7Awewdg==
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
Cc: Nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This should resolve the inability to start X with the new NV format 
modifier support in nouveau.  FYI, I'm offline next week, but I'll check 
in tonight in case there are any review comments.  When I'm back, I'll 
get the associated userspace fixes cleaned up and out to the appropriate 
lists.

Thanks,
-James

On 7/17/20 11:57 AM, James Jones wrote:
> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> family of modifiers to handle broken userspace
> Xorg modesetting and Mesa drivers.
> 
> Tested with Xorg 1.20 modesetting driver,
> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> gnome & KDE wayland desktops from Ubuntu 18.04,
> and sway 1.5
> 
> Signed-off-by: James Jones <jajones@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 496c4621cc78..31543086254b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
>   		   uint32_t *tile_mode,
>   		   uint8_t *kind)
>   {
> +	struct nouveau_display *disp = nouveau_display(drm->dev);
>   	BUG_ON(!tile_mode || !kind);
>   
> +	if ((modifier & (0xffull << 12)) == 0ull) {
> +		/* Legacy modifier.  Translate to this device's 'kind.' */
> +		modifier |= disp->format_modifiers[0] & (0xffull << 12);
> +	}
> +
>   	if (modifier == DRM_FORMAT_MOD_LINEAR) {
>   		/* tile_mode will not be used in this case */
>   		*tile_mode = 0;
> @@ -227,6 +233,16 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
>   	}
>   }
>   
> +static const u64 legacy_modifiers[] = {
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
>   static int
>   nouveau_validate_decode_mod(struct nouveau_drm *drm,
>   			    uint64_t modifier,
> @@ -247,8 +263,14 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
>   	     (disp->format_modifiers[mod] != modifier);
>   	     mod++);
>   
> -	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> -		return -EINVAL;
> +	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID) {
> +		for (mod = 0;
> +		     (legacy_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
> +		     (legacy_modifiers[mod] != modifier);
> +		     mod++);
> +		if (legacy_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> +			return -EINVAL;
> +	}
>   
>   	nouveau_decode_mod(drm, modifier, tile_mode, kind);
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
