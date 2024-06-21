Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D26691215B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 11:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FDB10F140;
	Fri, 21 Jun 2024 09:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="WnbR6HHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD7C10F138
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 09:56:49 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dfe43dca3bfso2041160276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 02:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1718963809; x=1719568609;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5S/DOskxSjOdtm9/NmVLciwGWaYxt81vJwqpaW2JcYg=;
 b=WnbR6HHdShlKdO4Ekp7OYXdzQlpp0vkvgqciE97seHfTSherslo/C6yLayF09k5khT
 df0K3pIYuARnuHa4tBYnt+Kic7+RJ/ZNTmO+jbWk1wY98GWiPaBxO4zyaMqhHdqtaS3x
 BlKrGZUH2cL5/LdyMlPU2ARYBDGPbMifi1RsAZl9Ruh90lAvwtJofiBNHEmh+TIN1ok6
 aKTe5qI2Srr2y+rBMtlw0InRKIZqh4I1KIca9wooAisVL0m0X7ogn8modwPM5GBAIw7p
 890n0WYiyvGk5/becUAhU7LH4X0nTco1zoDsirfwX9WC6XVHuIT9Via440n3dUqUEWxi
 Qm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718963809; x=1719568609;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5S/DOskxSjOdtm9/NmVLciwGWaYxt81vJwqpaW2JcYg=;
 b=kcI9NG2fSb3g3TuC39CYgyZIYMzvcdqDG25omEqhrl5++WBA4LxSjz8veJhymGZVMb
 /aQgNPpZM0ZdI86lBXg/HTX9jOvVKTRASFM2u6hLf1BjQbln+ERMD1EaJtBRW3WFThHL
 wMvzKqDah7qgIVBXNobDOjb+j2dbBMnvVehvs1SUvFhh0yIPr1Cw42b1Wv6I/hqeB8Vq
 rw1sXduymyXDkt4icEzt+Kak1+Vn614UkHB4cuU/2NtrB5rNzhDDmSCxpiAYlyun8ruY
 7M0YkyV61Z7/6+UQbDsDm34josKhnqkfJskunFC0WubzZeFp79NZLvHa7bPlsVr6Kiwq
 /07w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPiLNhhNzRP9H3BuyEyV9rooVzcAU+aGmr6Vg0ts90zZ7B8iL+QvLdBN9Hl1vXra4z9ZM46n2R1R3a+yWZeM7j7T3SOR6pa7JcEnDlpdhe
X-Gm-Message-State: AOJu0YztWV0CWqb8lkx4LOGeBY//+LzOoQU41HoZhMj3n5+pNcuxgDrq
 aa61kyUM5LgQG2HN6Lo0+eoPkmzKj1e6rUSTAlThnpqdFQ7uF1CI7gtxJMY6zfVkqwIH8irOz7U
 rzAj8E2oxO3R5MpY3LWiTRr0KQLJ7l64gpiiTOr5G7UlrdfVt
X-Google-Smtp-Source: AGHT+IGFeBrg0qPbpvh1AyMS6zTs5VfueyCxCP0YeYWmpICVTTglfPw7mlM+P4ZfcjQ3+XoZSsm2WXYWIbfGscFyzvg=
X-Received: by 2002:a25:b21d:0:b0:dcc:9aed:6282 with SMTP id
 3f1490d57ef6-e02be230e94mr8328330276.65.1718963808649; Fri, 21 Jun 2024
 02:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240620154632.4125308-1-dave.stevenson@raspberrypi.com>
 <20240620154632.4125308-6-dave.stevenson@raspberrypi.com>
 <20240621-spry-zippy-chamois-2b7ad2@houat>
In-Reply-To: <20240621-spry-zippy-chamois-2b7ad2@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 21 Jun 2024 10:56:33 +0100
Message-ID: <CAPY8ntCSx6+7FoZkhc4TsZvgyrM3Xink0AoHLYsnc4L_rNKpEg@mail.gmail.com>
Subject: Re: [PATCH 05/31] drm/vc4_plane: Add support for YUV444 formats
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jun 2024 at 09:57, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Thu, Jun 20, 2024 at 04:46:06PM GMT, Dave Stevenson wrote:
> > From: Dom Cobley <popcornmix@gmail.com>
> >
> > Support displaying DRM_FORMAT_YUV444 and DRM_FORMAT_YVU444 formats.
> > Tested with kmstest and kodi. e.g.
> >
> > kmstest -r 1920x1080@60 -f 400x300-YU24
> >
> > Note: without the shift of width, only half the chroma is fetched,
> > resulting in correct left half of image and corrupt colours on right half.
> >
> > The increase in width shouldn't affect fetching of Y data,
> > as the hardware will clamp at dest width.
> >
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
>
> Also, this is missing your Signed-off-by. It needs to be there for all
> the patches you send on someone's behalf.

Drat. I went through checking and adding my Sob, and obviously missed this one.

Will add in v2.

> Maxime
