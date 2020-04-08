Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0771A1C8B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8C16E97D;
	Wed,  8 Apr 2020 07:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBAA6E97C;
 Wed,  8 Apr 2020 07:24:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id F162980512;
 Wed,  8 Apr 2020 09:24:32 +0200 (CEST)
Date: Wed, 8 Apr 2020 09:24:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 10/44] drm/vboxvideo: Use devm_gen_pool_create
Message-ID: <20200408072431.GH14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-11-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-11-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=20KFwNOVAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=-CMvVFbeQHhLWgntBVsA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 03:57:54PM +0200, Daniel Vetter wrote:
> Aside from deleting all the cleanup code we're now also setting a name
> for the pool
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>

Nice cleanup.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index 1336ab9795fc..d68d9bad7674 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -121,7 +121,8 @@ int vbox_hw_init(struct vbox_private *vbox)
>  		return -ENOMEM;
>  
>  	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
> -	vbox->guest_pool = gen_pool_create(4, -1);
> +	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
> +						"vboxvideo-accel");
>  	if (!vbox->guest_pool)
>  		return -ENOMEM;
>  
> @@ -130,12 +131,12 @@ int vbox_hw_init(struct vbox_private *vbox)
>  				GUEST_HEAP_OFFSET(vbox),
>  				GUEST_HEAP_USABLE_SIZE, -1);
>  	if (ret)
> -		goto err_destroy_guest_pool;
> +		return ret;
>  
>  	ret = hgsmi_test_query_conf(vbox->guest_pool);
>  	if (ret) {
>  		DRM_ERROR("vboxvideo: hgsmi_test_query_conf failed\n");
> -		goto err_destroy_guest_pool;
> +		return ret;
>  	}
>  
>  	/* Reduce available VRAM size to reflect the guest heap. */
> @@ -147,30 +148,23 @@ int vbox_hw_init(struct vbox_private *vbox)
>  
>  	if (!have_hgsmi_mode_hints(vbox)) {
>  		ret = -ENOTSUPP;
> -		goto err_destroy_guest_pool;
> +		return ret;
>  	}
>  
>  	vbox->last_mode_hints = devm_kcalloc(vbox->ddev.dev, vbox->num_crtcs,
>  					     sizeof(struct vbva_modehint),
>  					     GFP_KERNEL);
> -	if (!vbox->last_mode_hints) {
> -		ret = -ENOMEM;
> -		goto err_destroy_guest_pool;
> -	}
> +	if (!vbox->last_mode_hints)
> +		return -ENOMEM;
>  
>  	ret = vbox_accel_init(vbox);
>  	if (ret)
> -		goto err_destroy_guest_pool;
> +		return ret;
>  
>  	return 0;
> -
> -err_destroy_guest_pool:
> -	gen_pool_destroy(vbox->guest_pool);
> -	return ret;
>  }
>  
>  void vbox_hw_fini(struct vbox_private *vbox)
>  {
>  	vbox_accel_fini(vbox);
> -	gen_pool_destroy(vbox->guest_pool);
>  }
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
