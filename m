Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7256F0390
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 11:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8030410EB11;
	Thu, 27 Apr 2023 09:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E09F10EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 09:44:01 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-95227e5164dso235605966b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 02:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1682588640; x=1685180640;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9h6Btw8PHhXUr3L5p9rqPUrFBGBJRem5mhcTJAFeicc=;
 b=Y9rOx+v2OjHfDAzkBBWQLdEZjt5mPqrsIx+pVlefyRrj6VNmwN4JeAiAUO7L+c6BcA
 XmkSIVfT+SVnA6LBr+6rhotImic+iSOmdCH0plrL/+uzgY4IGYXyELCdDN8V8S4Hhxnz
 FMoFmwbHgYz9UCBL+AJ7EjqAa1zeFw0WWT/Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682588640; x=1685180640;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9h6Btw8PHhXUr3L5p9rqPUrFBGBJRem5mhcTJAFeicc=;
 b=YrOMkbtBSx2DAatlJakFM4W4vvV29RxoHawGh5Hy8ONh8CUMXDQLntdVvjaukzUZH+
 pTL0nZob2vLj1F/cb/BhZ3N2NfGA9cGSL0t36iI8ABFBoFqNke52RjDKW4ohrjTfqUx8
 wDe1TDSQ3n/vF3j8swBxqnqDiei/+cN1IuQX1M+O7tN/BEGDd5HLrqAS+JQ6EukIXuLN
 LnfaJ9ZKYeYMr5PxFdOzHiliMd4lttsMhTyVTDs7PwIVkI5uIbXYWU7inkHELBNXdXDa
 a4Mc8/04AhEVuRv3D5SUt6rAueY7NGqZdYxsihh8OkY2WbsqFKEeSKdyCM10u+DJsaon
 2sPg==
X-Gm-Message-State: AC+VfDxal8CjTFDeT/aFIAMkgV2WQIehtWfGdD8dUg87gxD05bKS9ImW
 nRwdojXI3JrKxmsIG0ohkeZHQA==
X-Google-Smtp-Source: ACHHUZ6VAmexrUu0fojeJELeltvCH9VnpMyeG2fW/GKlGgRxjxerL3jAv+fxsEx651bYl1RCOHnZ5Q==
X-Received: by 2002:a05:6402:518d:b0:502:1f7b:f069 with SMTP id
 q13-20020a056402518d00b005021f7bf069mr1128721edd.2.1682588639727; 
 Thu, 27 Apr 2023 02:43:59 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 b13-20020aa7df8d000000b004fa012332ecsm7743325edy.1.2023.04.27.02.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 02:43:59 -0700 (PDT)
Date: Thu, 27 Apr 2023 11:43:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/fb-helper: Fix height, width, and accel_flags in
 fb_var
Message-ID: <ZEpD3atNuBycOcLX@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2b6073d9c2d869c6a4eac6edebd616e0568dec91.1681843245.git.geert+renesas@glider.be>
 <ZEAY5Sf/V10ipDZk@phenom.ffwll.local>
 <CAMuHMdWbsFHP7Amoz16o5ge5a=wv5u2x0B+yP7e-0bRJufqrQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWbsFHP7Amoz16o5ge5a=wv5u2x0B+yP7e-0bRJufqrQQ@mail.gmail.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 11:15:24AM +0200, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Wed, Apr 19, 2023 at 6:38 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Tue, Apr 18, 2023 at 08:42:46PM +0200, Geert Uytterhoeven wrote:
> > > Fbtest contains some very simple validation of the fbdev userspace API
> > > contract.  When used with shmob-drm, it reports the following warnings
> > > and errors:
> > >
> > >     height changed from 68 to 0
> > >     height was rounded down
> > >     width changed from 111 to 0
> > >     width was rounded down
> > >     accel_flags changed from 0 to 1
> > >
> > > The first part happens because __fill_var() resets the physical
> > > dimensions of the first connector, as filled in by drm_setup_crtcs_fb().
> > > Fix this by retaining the original values.
> > >
> > > The last part happens because __fill_var() forces the FB_ACCELF_TEXT
> > > flag on, while fbtest disables all acceleration on purpose, so it can
> > > draw safely to the frame buffer.  Fix this by setting accel_flags to
> > > zero, as DRM does not implement any text console acceleration.
> > > Note that this issue can also be seen in the output of fbset, which
> > > reports "accel true".
> > >
> > > Fixes: ee4cce0a8f03a333 ("drm/fb-helper: fix input validation gaps in check_var")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/drivers/gpu/drm/drm_fb_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > > @@ -2066,7 +2068,7 @@ static void drm_fb_helper_fill_var(struct fb_info *info,
> > >       info->pseudo_palette = fb_helper->pseudo_palette;
> > >       info->var.xoffset = 0;
> > >       info->var.yoffset = 0;
> > > -     __fill_var(&info->var, fb);
> > > +     __fill_var(&info->var, info, fb);
> >
> > Bit a bikeshed since it zeroed-allocated anyway, but I'd pass NULL here
> > for info and catch that in __fill_var and then keep the explicit = 0;
> 
> Yeah, it's a bit unfortunate this is done in two places, and
> info->var.{height,width} are initialized by drm_setup_crtcs_fb()
> only later.
> 
> Most of the var contents cannot change as mode changes are not
> supported, so drm_fb_helper_check_var() should just do
> 
>     if (var->foo > info->var.foo)
>             return -EINVAL;
>     var->foo = info->var.foo;
> 
> For the parts that can change, based on earlier discussions I saw pass
> by, I believe there should be a call into atomic try-modesetting at
> the end of drm_fb_helper_check_var()?

Yeah ideally that's what we do. And I guess we could limit that to
atomic-only drivers since with legacy kms there's really no way to
correctly implement any fbdev mode changes (because there's just no
check/commit split there and fbdev wants that).

I guess the trickier part is reworking the drm fbdev code so that it won't
tamper with it's internal structures (or roll them back) when only doing a
TEST_ONLY commit.

And in theory we could then actually support proper mode changes through
fbdev, as long as it fits into the fb we allocated at least. Reallocating
fbs would be a lot more intrusive but also not impossible.
-Daniel

> > Either way Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
