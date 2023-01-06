Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA965FDCC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 10:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E7D10E844;
	Fri,  6 Jan 2023 09:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D0110E83F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 09:23:33 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d17so741461wrs.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 01:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=U+l18cm7JsXF7JdoRVRxHI90ltZepKvBdBgtxnvmYJo=;
 b=R01N5tSiChNTWmptaLB86srJ2/fdU6o1p+bwJmBoaChOufuBNaeqC93T9BFc1x1PL+
 Wu3P82SdmoZZQcpOIl+V411BrgabkySpulsdvQEc0AJ6AS9xrOkPG1GTSbp2mdlGsjlk
 +z12zHrk5LCdM2O68WxH4NSIeT48DkulRsJxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U+l18cm7JsXF7JdoRVRxHI90ltZepKvBdBgtxnvmYJo=;
 b=hPnipaauCcYfE5v6u8IifZC6c/gYbNoXV0tA403ewGg1pARiizBdw+yekVquROemGc
 /ECtGCR5ThMcXfU3vfPo/DZUx/7mWMyjgdo1aepKMi3VvScuBksbHsCqU6FPH2XRje2b
 SDANwmyTKT29SWO18LabEuOblf792p6I/84nNZ6o2fpWclBPynB3GapD3INLPv64pO60
 T+klXEV4RbHBUNYmpw3WepEGSWDyvsisR/7WoJMoMRhrtBidUKo0Wx4Kk/HYrJv8hfdp
 5sk1Ehba0GGaGf1U+pLFt5hmzTAF7ihusIWUCUDvcs9SuVL/5c6biGHVc02LZ8Y2rXfK
 qqxA==
X-Gm-Message-State: AFqh2koyRyziXzDBd2DGGSh4lo0f1c5i0Ruwpxm9HSuYk6GJoCYiOMca
 6/A+5Q+HvkEzHeDSszKRjUsAwg==
X-Google-Smtp-Source: AMrXdXvKO0K2rF70WbqtVd/lzrLxfZ6Yvu5KlTsjckbUhsX5Ie5HyKkPdAVmes/20jY1UtQipICp4w==
X-Received: by 2002:a5d:66c3:0:b0:2b2:c9de:3e06 with SMTP id
 k3-20020a5d66c3000000b002b2c9de3e06mr2914859wrw.68.1672997012305; 
 Fri, 06 Jan 2023 01:23:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adff00e000000b0024cb961b6aesm575058wro.104.2023.01.06.01.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 01:23:31 -0800 (PST)
Date: Fri, 6 Jan 2023 10:23:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vkms: introduce prepare_fb and cleanup_fb functions
Message-ID: <Y7fokah1eYGUFw25@phenom.ffwll.local>
References: <20230105162148.234218-1-mcanal@igalia.com>
 <20230105184313.uziimfnsk3cu3gzd@mail.igalia.com>
 <e1ba3ad8-a6fe-4279-1d98-e060fc845fea@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1ba3ad8-a6fe-4279-1d98-e060fc845fea@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 09:10:17AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.01.23 um 19:43 schrieb Melissa Wen:
> > On 01/05, Maíra Canal wrote:
> > > With commit 359c6649cd9a ("drm/gem: Implement shadow-plane {begin,
> > > end}_fb_access with vmap"), the behavior of the shadow-plane helpers
> > > changed and the vunmap is now performed at the end of
> > > the current pageflip, instead of the end of the following pageflip.
> > > 
> > > By performing the vunmap at the end of the current pageflip, invalid
> > > memory is accessed by the vkms during the plane composition, as the data
> > > is being unmapped before being used.
> > 
> > Hi Maíra,
> > 
> > Thanks for investigating this issue. Can you add in the commit message
> > the kernel Oops caused by this change?
> > 
> > Besides that, I wonder if the right thing would be to restore the
> > previous behavior of vunmap in shadow-plane helpers, instead of
> > reintroduce driver-specific hooks for vmap/vunmap correctly to vkms.
> > 
> > Maybe Thomas has some inputs on this shadow-plane changing to help us on
> > figuring out the proper fix (?)
> 
> The fix looks good. I left some minor-important comments below.
> 
> I would suggest to rethink the overall driver design. Instead of keeping
> these buffer pinned for long. It might be better to have a per-plane
> intermediate buffer that you update on each call to atomic_update. That's
> how real drivers interact with their hardware.

That would mean more copying, and vkms already copies a lot by recomputing
the crc every frame. Fundamentally with vkms the cpu is the display
engine, and it needs a mapping for as long as the buffer is in use.

Also I guess we really need gitlab ci going, it's a bit silly we're
breaking pure sw drivers :-/
-Daniel

> 
> > 
> > Best Regards,
> > 
> > Melissa
> > 
> > > 
> > > Therefore, introduce again prepare_fb and cleanup_fb functions to the
> > > vkms, which were previously removed on commit b43e2ec03b0d ("drm/vkms:
> > > Let shadow-plane helpers prepare the plane's FB").
> > > 
> > > Fixes: 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_access with vmap")
> > > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> > > ---
> > >   drivers/gpu/drm/vkms/vkms_plane.c | 36 ++++++++++++++++++++++++++++++-
> > >   1 file changed, 35 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > > index c3a845220e10..b3f8a115cc23 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > @@ -160,10 +160,44 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
> > > 	return 0;
> > >   }
> > > 
> > > +static int vkms_prepare_fb(struct drm_plane *plane,
> > > +			   struct drm_plane_state *state)
> > > +{
> > > +	struct drm_shadow_plane_state *shadow_plane_state;
> > > +	struct drm_framebuffer *fb = state->fb;
> > > +	int ret;
> > > +
> > > +	if (!fb)
> > > +		return 0;
> 
> IIRC this cannot be NULL. Only active planes will be 'prepared'.
> 
> > > +
> > > +	shadow_plane_state = to_drm_shadow_plane_state(state);
> > > +
> > > +	ret = drm_gem_plane_helper_prepare_fb(plane, state);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
> > > +}
> > > +
> > > +static void vkms_cleanup_fb(struct drm_plane *plane,
> > > +			    struct drm_plane_state *state)
> > > +{
> > > +	struct drm_shadow_plane_state *shadow_plane_state;
> > > +	struct drm_framebuffer *fb = state->fb;
> > > +
> > > +	if (!fb)
> > > +		return;
> 
> Same here. This function won't be called if there has not been a
> framebuffer.
> 
> > > +
> > > +	shadow_plane_state = to_drm_shadow_plane_state(state);
> > > +
> > > +	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
> > > +}
> > > +
> > >   static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
> > > 	.atomic_update		= vkms_plane_atomic_update,
> > > 	.atomic_check		= vkms_plane_atomic_check,
> > > -	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> 
> You're still installing {being/end}_fb_access, which should not be necessary
> now. Open-coding DRM_GEM_SHADOW_PLANE_HELPER_FUNCS without those helpers
> would fix that.
> 
> Best regards
> Thomas
> 
> > > +	.prepare_fb		= vkms_prepare_fb,
> > > +	.cleanup_fb		= vkms_cleanup_fb,
> > >   };
> > > 
> > >   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> > > --
> > > 2.39.0
> > > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
