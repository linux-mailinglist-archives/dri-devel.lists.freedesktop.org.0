Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B43D78E78D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD6C10E586;
	Thu, 31 Aug 2023 08:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3B110E586
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:04:42 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-57328758a72so136471eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 01:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1693469081; x=1694073881; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eVDMUJusfvGNMe6U/cv080svMtDMV7FPoLJOG6+JEFs=;
 b=ag+yQU1+eOTfll2E3e0ssMY2UF2vZ2MF116asI0DpNNvqLtZy/G6d0bKEddP4kE2aC
 BWeGElls7tvEzQp/wEUtyHc9wRQPsUD3Zer+KLuUC8GaInwIjgaWQGSRHFjjktWtWFsi
 dOuHvdeWAFy+jc7RN8jQWyNcO/Ms0uH3BersQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693469081; x=1694073881;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eVDMUJusfvGNMe6U/cv080svMtDMV7FPoLJOG6+JEFs=;
 b=fpNe/8G6VW6ujoecFv3IchpbyHuuXcGulckxNnbSLfEw11sRk7X4RiDCifLvIfms7g
 j1c+sFAv+gMZQmAALdKNGCQGmhdYw6IYhgCiOiG0jIqSO5ba1SPgW+nFyWuPU6WZzPda
 PYzx2O62XMArdK1MDdXHyhGVD+JkS0i3Zg+FkUaPpQrnyNET24CA3B7Bsuhb7cdoU0b2
 EUEEbTpaLbZzOS6QeXWWhJII7H19b3jalFJuRUlMcCzuEkEPiL17EkpRJw/1EjPJx10v
 yFvD1mbg47ld1sO0087hEkpb0kZcoB+G7aCjyAuo5k4XNOsb+krKluFg1b5BtU1jf5ps
 j9YQ==
X-Gm-Message-State: AOJu0YzPx0hD1sWi7EUT31DOFm3q+O9ECXIgYPWi+HztZ55YSBCoqiNn
 MGRQH3bZYqjxbIs8Bcgb6vNCMsPu3imtJSRnfHYVSw==
X-Google-Smtp-Source: AGHT+IGWkMZOGIbYg6RTVpBdYwZ0wSp1dixetG9/GzXcL6XTQaOyBZFg8pRUTYx0QUQCxznHWIEgBIXfNBI6sha82yQ=
X-Received: by 2002:a05:6808:3c45:b0:3a9:e85d:b689 with SMTP id
 gl5-20020a0568083c4500b003a9e85db689mr5038337oib.0.1693469081676; Thu, 31 Aug
 2023 01:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
 <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
In-Reply-To: <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 31 Aug 2023 10:04:29 +0200
Message-ID: <CAKMK7uFDn_R+c=YErf7gEHVW4pg+odYKVjrs0EofvpG544Po6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we support
 display
To: Mikko Perttunen <cyndis@kapsi.fi>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 08:33, Mikko Perttunen <cyndis@kapsi.fi> wrote:
>
> On 8/30/23 13:19, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 25.08.23 um 15:22 schrieb Thierry Reding:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> Tegra DRM doesn't support display on Tegra234 and later, so make sure
> >> not to remove any existing framebuffers in that case.
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >>   drivers/gpu/drm/tegra/drm.c | 8 +++++---
> >>   1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> >> index b1e1a78e30c6..7a38dadbc264 100644
> >> --- a/drivers/gpu/drm/tegra/drm.c
> >> +++ b/drivers/gpu/drm/tegra/drm.c
> >> @@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct
> >> host1x_device *dev)
> >>       drm_mode_config_reset(drm);
> >> -    err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
> >> -    if (err < 0)
> >> -        goto hub;
> >> +    if (drm->mode_config.num_crtc > 0) {
> >
> > If you don't support the hardware, wouldn't it be better to return
> > -ENODEV if !num_crtc?
>
> While display is not supported through TegraDRM on Tegra234+, certain
> multimedia accelerators are supported, so we need to finish probe for those.

Ideally you also register the tegra driver without DRIVER_MODESET |
DRIVER_ATOMIC in that case, to avoid unecessary userspace confusion.
Most userspace can cope with a display driver without any crtc, but I
think xorg-modesettting actually falls over. Or at least I've seen
some hacks that the agx people added to make sure X doesn't
accidentally open the wrong driver.
-Sima

>
> Cheers,
> Mikko
>
> >
> > Best regards
> > Thomas
> >
> >> +        err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
> >> +        if (err < 0)
> >> +            goto hub;
> >> +    }
> >>       err = drm_dev_register(drm, 0);
> >>       if (err < 0)
> >
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
