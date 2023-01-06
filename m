Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5196607F7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 21:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D1F10E8E3;
	Fri,  6 Jan 2023 20:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB7E10E8DD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 20:13:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so4362161wmb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 12:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7xieYE8mBpb1zWbGtj34+UVblL8Un4jpJMUJ2HZ6ukk=;
 b=lfTjW7aU2kjl5D0SGUqbrP8nSNBw/RwH8Im0VbqKJMnV7K1BpvKc6e1RsiLfl5+dIQ
 rTeUI7Bt2HawDjfVbp3dudGRTt1AA8fNomXUZ16nHUqjF4qefQR6lzFHwyRrsDwNh+fu
 jw3Fb2DGRS3DCEJD3Zb/aWSj9WbLivYHsCfwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7xieYE8mBpb1zWbGtj34+UVblL8Un4jpJMUJ2HZ6ukk=;
 b=vT5gbZHmjHUiUC64PqnrRLqbNWX2cqUPWP/7pT0fcmGGzGTx1H377Ru76KRjORIZJs
 J0zSn0rj9AtWZ5q14nW3UDZeUbxx6822vajOkGPephHIo3vX2TLEFmID+t89R0zX2d8i
 YrwZw8oATk04ohlOO2ntBL+JVkc8+mGANhRpSNZ36bF5+Y28OsvaKjgRKW/vbT18nWj8
 6FRG5NdDG9awO2NAkpAGkVrlzMzmUycQwf159aCu0bIFRs2zvaVqpts3Yl+is0R4SYGM
 UNtR9GVMfxe9b8uVITZAf5jkOPMICmQenJbO6AK2Pi98uU4ehuiQ1QjZE0eaFmqc1hiC
 Avbw==
X-Gm-Message-State: AFqh2koVVlAZNBkf6eiwb3p4uNEfR2lrzezvOuCnDpcLMSTBoXCbTb78
 vrxOREh/Mpu9eLPH9CRzxAnJyw==
X-Google-Smtp-Source: AMrXdXsj9kgeiG3EibUxDNk6UypfxxD2L/JfNyL4SO/j9rqI4qerIbYLTIwsj06dFiUJlycuH5YDXA==
X-Received: by 2002:a05:600c:42d5:b0:3d6:e790:c9a0 with SMTP id
 j21-20020a05600c42d500b003d6e790c9a0mr48758832wme.10.1673035998414; 
 Fri, 06 Jan 2023 12:13:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm7522572wmc.13.2023.01.06.12.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 12:13:17 -0800 (PST)
Date: Fri, 6 Jan 2023 21:13:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/vkms: introduce prepare_fb and cleanup_fb functions
Message-ID: <Y7iA21y29/B2z2hb@phenom.ffwll.local>
References: <20230105162148.234218-1-mcanal@igalia.com>
 <20230105184313.uziimfnsk3cu3gzd@mail.igalia.com>
 <e1ba3ad8-a6fe-4279-1d98-e060fc845fea@suse.de>
 <19951367-2ef0-0f26-ddf0-893259d9a5ef@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19951367-2ef0-0f26-ddf0-893259d9a5ef@igalia.com>
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
 Haneen Mohammed <hamohammed.sa@gmail.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 08:34:13AM -0300, Maíra Canal wrote:
> Hi,
> 
> Thanks for the review!
> 
> On 1/6/23 05:10, Thomas Zimmermann wrote:
> > Hi
> > 
> > Am 05.01.23 um 19:43 schrieb Melissa Wen:
> > > On 01/05, Maíra Canal wrote:
> > > > With commit 359c6649cd9a ("drm/gem: Implement shadow-plane {begin,
> > > > end}_fb_access with vmap"), the behavior of the shadow-plane helpers
> > > > changed and the vunmap is now performed at the end of
> > > > the current pageflip, instead of the end of the following pageflip.
> > > > 
> > > > By performing the vunmap at the end of the current pageflip, invalid
> > > > memory is accessed by the vkms during the plane composition, as the data
> > > > is being unmapped before being used.
> > > 
> > > Hi Maíra,
> > > 
> > > Thanks for investigating this issue. Can you add in the commit message
> > > the kernel Oops caused by this change?
> > > 
> > > Besides that, I wonder if the right thing would be to restore the
> > > previous behavior of vunmap in shadow-plane helpers, instead of
> > > reintroduce driver-specific hooks for vmap/vunmap correctly to vkms.
> > > 
> > > Maybe Thomas has some inputs on this shadow-plane changing to help us on
> > > figuring out the proper fix (?)
> > 
> > The fix looks good. I left some minor-important comments below.
> > 
> > I would suggest to rethink the overall driver design. Instead of keeping these buffer pinned for long. It might be better to have a per-plane intermediate buffer that you update on each call to atomic_update. That's how real drivers interact with their hardware.
> > 
> > > 
> > > Best Regards,
> > > 
> > > Melissa
> > > 
> > > > 
> > > > Therefore, introduce again prepare_fb and cleanup_fb functions to the
> > > > vkms, which were previously removed on commit b43e2ec03b0d ("drm/vkms:
> > > > Let shadow-plane helpers prepare the plane's FB").
> > > > 
> > > > Fixes: 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_access with vmap")
> > > > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > 
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > 
> > > > ---
> > > >   drivers/gpu/drm/vkms/vkms_plane.c | 36 ++++++++++++++++++++++++++++++-
> > > >   1 file changed, 35 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > index c3a845220e10..b3f8a115cc23 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > @@ -160,10 +160,44 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
> > > >     return 0;
> > > >   }
> > > > 
> > > > +static int vkms_prepare_fb(struct drm_plane *plane,
> > > > +               struct drm_plane_state *state)
> > > > +{
> > > > +    struct drm_shadow_plane_state *shadow_plane_state;
> > > > +    struct drm_framebuffer *fb = state->fb;
> > > > +    int ret;
> > > > +
> > > > +    if (!fb)
> > > > +        return 0;
> > 
> > IIRC this cannot be NULL. Only active planes will be 'prepared'.>
> > > > +
> > > > +    shadow_plane_state = to_drm_shadow_plane_state(state);
> > > > +
> > > > +    ret = drm_gem_plane_helper_prepare_fb(plane, state);
> > > > +    if (ret)
> > > > +        return ret;
> > > > +
> > > > +    return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state->data);
> > > > +}
> > > > +
> > > > +static void vkms_cleanup_fb(struct drm_plane *plane,
> > > > +                struct drm_plane_state *state)
> > > > +{
> > > > +    struct drm_shadow_plane_state *shadow_plane_state;
> > > > +    struct drm_framebuffer *fb = state->fb;
> > > > +
> > > > +    if (!fb)
> > > > +        return;
> > 
> > Same here. This function won't be called if there has not been a framebuffer.
> 
> After removing those two checks, I started to get some NULL pointer dereference
> errors, so I believe they are somehow necessary.

I'm honestly not sure whether any driver does not have this check ...
might be worth to go through them, and if they all have it, pull it into
helpers. It does look a bit silly like that :-)
-Daniel

> 
> > 
> > > > +
> > > > +    shadow_plane_state = to_drm_shadow_plane_state(state);
> > > > +
> > > > +    drm_gem_fb_vunmap(fb, shadow_plane_state->map);
> > > > +}
> > > > +
> > > >   static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
> > > >     .atomic_update        = vkms_plane_atomic_update,
> > > >     .atomic_check        = vkms_plane_atomic_check,
> > > > -    DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> > 
> > You're still installing {being/end}_fb_access, which should not be necessary now. Open-coding DRM_GEM_SHADOW_PLANE_HELPER_FUNCS without those helpers would fix that.
> 
> I'm sorry but I didn't understand this comment. AFAIK I {being/end}_fb_access are
> NULL as I removed the DRM_GEM_SHADOW_PLANE_HELPER_FUNCS macro.
> 
> Best Regards,
> - Maíra Canal
> 
> > 
> > Best regards
> > Thomas
> > 
> > > > +    .prepare_fb        = vkms_prepare_fb,
> > > > +    .cleanup_fb        = vkms_cleanup_fb,
> > > >   };
> > > > 
> > > >   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> > > > -- 
> > > > 2.39.0
> > > > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
