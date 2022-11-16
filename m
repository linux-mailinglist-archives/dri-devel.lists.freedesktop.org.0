Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4B62B68B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 10:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661E810E456;
	Wed, 16 Nov 2022 09:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9516F10E455
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 09:31:08 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id f27so42676906eje.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 01:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HjyZCC6mzAlcil/3Af99i3KpLOyclBBNfeVRU7CSIAE=;
 b=LHtl2Tgd5FPR7Heid0sVtCKUqpgoPCqPEGQgDAgH6wRkyxqcjMk+iUtyQbQ/AyjYCT
 F370Mz0ANIGP7pKYzSjeIkQXaJh3Yh3+Ay/+qXC0Dk1wc1ZfEdOBWco8YydP/YFO7Ka4
 QvfVqSmVANbizTK0N/y2puTD56FbZDLqz7pgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HjyZCC6mzAlcil/3Af99i3KpLOyclBBNfeVRU7CSIAE=;
 b=UoVKpu4i9DhrhzRS0Fw2DrHLM9sJOVvhp2Ded0wgiKzoZHaUy48nHG5f2E1u50TuOq
 9vjBw5INstr1npUJO3zxNznj3w/DjKmb3hFVc9UH7l3nG3H7fSm/JaiLXaNFFRwOb3Ex
 locxORiUcsANjPx1yTn5Mp10mk7Otuuh4xGmtlKM7vLOlA0/PoHSdFMK/sJvSv2A4gom
 m/EeqtIHAHZA8CgOxe4dKG5ChJ1OD/nHmQZ7Yj4EYMqFHvrlWQKKDQuJbRGakgRh9uf8
 sOSdTGRoKAip+ncv3atb1n/DWmIP/SxKjiIQgirbJwDciDaVenJjAmCkhzZyaoQvTt5c
 NT7w==
X-Gm-Message-State: ANoB5pmDHD3zC74CfHww9Fa+QacytanFaGo2f+9kTrdvFEq0mC9S2nuO
 URf9dDhjumSI4ZcZ0MKBppvCCA==
X-Google-Smtp-Source: AA0mqf66vYi+w1ziwmJSZJjyt4isaqo8LekZnwcJhozY0nIHZ76J0Qs726qIUArR79L/TgZaIQWkyw==
X-Received: by 2002:a17:907:c70f:b0:78d:9723:d9c3 with SMTP id
 ty15-20020a170907c70f00b0078d9723d9c3mr16781755ejc.316.1668591067120; 
 Wed, 16 Nov 2022 01:31:07 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b0078b83968ad4sm6591153ejo.24.2022.11.16.01.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 01:31:06 -0800 (PST)
Date: Wed, 16 Nov 2022 10:31:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/fb-helper: Try to protect cleanup
 against delayed setup
Message-ID: <Y3St2VHJ7jEmcNFw@phenom.ffwll.local>
References: <20210713135922.1384264-1-daniel.vetter@ffwll.ch>
 <60b5de09-7a3c-3a61-a7a2-a856c8be108e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60b5de09-7a3c-3a61-a7a2-a856c8be108e@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 10:30:01AM +0100, Andrzej Hajda wrote:
> On 13.07.2021 15:59, Daniel Vetter wrote:
> > Some vague evidences suggests this can go wrong. Try to prevent it by
> > holding the right mutex and clearing ->deferred_setup to make sure we
> > later on don't accidentally try to re-register the fbdev when the
> > driver thought it had it all cleaned up already.
> > 
> > v2: I realized that this is fundamentally butchered, and CI complained
> > about lockdep splats. So limit the critical section again and just add
> > a few notes what the proper fix is.
> > 
> > References: https://intel-gfx-ci.01.org/tree/linux-next/next-20201215/fi-byt-j1900/igt@i915_pm_rpm@module-reload.html
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> 
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

I just dropped this one from my patch pile a while ago, because there were
conflicts. If you like it, feel free to resurrect&rebase and then merge it
(but maybe cc intel-gfx so the CI there can test it).
-Daniel

> 
> Regards
> Andrzej
> 
> > ---
> >   drivers/gpu/drm/drm_fb_helper.c | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index 9d82fda274eb..8f11e5abb222 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -598,6 +598,9 @@ EXPORT_SYMBOL(drm_fb_helper_alloc_fbi);
> >    * A wrapper around unregister_framebuffer, to release the fb_info
> >    * framebuffer device. This must be called before releasing all resources for
> >    * @fb_helper by calling drm_fb_helper_fini().
> > + *
> > + * Note that this is fundamentally racy on hotunload because it doen't handle
> > + * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() instead.
> >    */
> >   void drm_fb_helper_unregister_fbi(struct drm_fb_helper *fb_helper)
> >   {
> > @@ -611,6 +614,9 @@ EXPORT_SYMBOL(drm_fb_helper_unregister_fbi);
> >    * @fb_helper: driver-allocated fbdev helper, can be NULL
> >    *
> >    * This cleans up all remaining resources associated with @fb_helper.
> > + *
> > + * Note that this is fundamentally racy on hotunload because it doen't handle
> > + * open fbdev file descriptors at all. Use drm_fbdev_generic_setup() instead.
> >    */
> >   void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
> >   {
> > @@ -2382,6 +2388,10 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
> >   {
> >   	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
> > +	mutex_lock(&fb_helper->lock);
> > +	fb_helper->deferred_setup = false;
> > +	mutex_unlock(&fb_helper->lock);
> > +
> >   	if (fb_helper->fbdev)
> >   		/* drm_fbdev_fb_destroy() takes care of cleanup */
> >   		drm_fb_helper_unregister_fbi(fb_helper);
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
