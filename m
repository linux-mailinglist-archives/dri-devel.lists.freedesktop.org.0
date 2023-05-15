Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BDD7026FC
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 10:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27AB10E16B;
	Mon, 15 May 2023 08:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D9110E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 08:17:03 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-94f9cd65b1aso335535566b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1684138619; x=1686730619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xXXIa0SG9wbz5/D/IhjDOFuNfq4mxzG+fvBmBSfOzoU=;
 b=aPoIMSMFhuswED2FXxs3zgoT8Xnco0v1zPENcW0zP2eDOkz99spwxQguBYhSrvwFQ+
 /r/C+CfxWvcH+2UQahWxhnx2PRKMdEcvTIrpd7SoDU++8qGe5q1KMpAtt3Dsik8ShRuO
 /K+y5j5OsFVPq23CI8ad/lkyeZMiXuF0w8Znc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684138619; x=1686730619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xXXIa0SG9wbz5/D/IhjDOFuNfq4mxzG+fvBmBSfOzoU=;
 b=c50SxAG3pHEbavbRX5LMmUde6P22NgzM2oeRLKExIRYwksWAas3h+Y7BWZBWoyt0yE
 QwGCp4hLNSIne60G+yIOorJllGnzFmxiP+TlP0IpyilrvW0OI823ThRW21H/QaYpyk0H
 xI772OxeRL3TKrrnEg7rZy2Jq8jqkOfOZPtudR5Li5LU+5kSm2vZrKyZLs6VKQRqRxEK
 XBkDZOFHfOOqQdaP53mIxcKbev/cptbVRL3FYBjBa2KvKsccMHJL6m30DkLs5i/QxUWU
 CHL+aZjaeSe4ROKK18foRPiFgGqnZrv5Gj5vWJG1T+EC1Zukr8VoWYZicDxaSP7Ry4NP
 35Og==
X-Gm-Message-State: AC+VfDzFteYO52yp3I3tUwO5W/crw1Mnsiest9FC7J26xIG0lYnGu2Qz
 A3CMkPoQ3mQUVIlQMu0mHfEw2g==
X-Google-Smtp-Source: ACHHUZ6MmBnd/60/FDMPYNjUgSSWd4JgT0wLOPOmT/bBEzljWR2R7hFO4DAFzj4EJpQpha3MafcqAw==
X-Received: by 2002:a17:906:64cd:b0:965:a6c1:9b96 with SMTP id
 p13-20020a17090664cd00b00965a6c19b96mr28159704ejn.2.1684138619156; 
 Mon, 15 May 2023 01:16:59 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 i19-20020a170906265300b0096595cc0810sm9197089ejc.72.2023.05.15.01.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 01:16:58 -0700 (PDT)
Date: Mon, 15 May 2023 10:16:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
Message-ID: <ZGHqeLcWw5tEL3Fy@phenom.ffwll.local>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
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
Cc: mairacanal@riseup.net, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 04:11:48PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 12.05.23 um 15:20 schrieb Linus Walleij:
> > Sorry for late regression detection but this patch regresses
> > the Integrator AB IMPD-1 graphics, I bisected down to this
> > patch.
> [...]
> > This is the driver:
> > drivers/gpu/drm/pl111/pl111_versatile.c
> > with the pl110_impd1 variant, so these are the supported modes:
> > 
> > /* PL110 pixel formats for Integrator, vanilla PL110 */
> > static const u32 pl110_integrator_pixel_formats[] = {
> >          DRM_FORMAT_ABGR8888,
> >          DRM_FORMAT_XBGR8888,
> >          DRM_FORMAT_ARGB8888,
> >          DRM_FORMAT_XRGB8888,
> >          DRM_FORMAT_ABGR1555,
> >          DRM_FORMAT_XBGR1555,
> >          DRM_FORMAT_ARGB1555,
> >          DRM_FORMAT_XRGB1555,
> > };
> > (...)
> > /*
> >   * The IM-PD1 variant is a PL110 with a bunch of broken, or not
> >   * yet implemented features
> >   */
> > static const struct pl111_variant_data pl110_impd1 = {
> >          .name = "PL110 IM-PD1",
> >          .is_pl110 = true,
> >          .broken_clockdivider = true,
> >          .broken_vblank = true,
> >          .formats = pl110_integrator_pixel_formats,
> >          .nformats = ARRAY_SIZE(pl110_integrator_pixel_formats),
> >          .fb_bpp = 16,
> > };
> > 
> > Notice the absence of RGB565!
> > Then we initialized the frambuffer like this:
> > 
> >          drm_fbdev_dma_setup(drm, priv->variant->fb_bpp);
> > 
> > And as you see priv->variant->fb_bpp will be 16, so we want some
> > 16bpp mode however the only supported depth is 15 (the 1555 modes)
> > so it would use that by scaling back depth to 15.
> > 
> > However after this patch that doesn't work anymore.
> > 
> > Any hints on how we can fix this?
> 
> According to a quick grep for fb_bpp, it's only used for the call to
> drm_fbdev_dma_setup(), right? In this case, you should set it to 15 for the
> models without rgb565. The switch at [1] should then pick the correct
> values.
> 
> The preferred_bpp parameter had a change in semantics. It used to be the
> number of bits per pixel. But that makes it hard to select between RGB1555
> and RGB565.  So it's now a special color-mode value that works like the
> kernel's video= parameter. Values of 15 and 32 are different from the rest.
> That switch at [1] explains it. Maybe you should rename fb_bpp to color_mode
> for clarity.
> 
> Let me know if this helps.

Shouldn't the helpers try to do this automatically? I think they kinda did
that in the past in some limited circumstances like this ...
-Daniel

> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.4-rc1/source/drivers/gpu/drm/drm_fb_helper.c#L1827
> 
> > 
> > Yours,
> > Linus Walleij
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
