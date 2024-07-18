Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC974934D3C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 14:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447EC10E7FB;
	Thu, 18 Jul 2024 12:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ovIq0grk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA85010E7FB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 12:31:59 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52ea5765e75so354337e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 05:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721305918; x=1721910718; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7bFckFnWty7GT0h7WRWkKM0jPqUcetmJUm4oCOzxQM0=;
 b=ovIq0grkAVcWAhdDPyfxfrOAo3VNQtSjg9jC259X4ZwYvKuEXA760PuGgy/Gob9kLm
 +AU7afpXAADVvhEcNsFvUHH/KIM3QAw4V7hM3PSVg7O3RIG7iaaMArBMGcV25DJM3HEx
 8b3/S/do1awTRWqQntguX3TOZQGr3aESI/OabpZVk7GVqgGi+9j5WZ41DhpXeGM8DfXV
 07TdjQaxrDd68HkkuUS1yTqNy5PlVUS/mk1JKOmhPg0KBRmZ+CX2xeiMew4LANBP1NFv
 bWjaDp/oFRHo9JCGBG4sGgYsNbJaoVumvnReGPa/5MNydil91Oh9jqJIObuQeVkyPU3x
 +yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721305918; x=1721910718;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7bFckFnWty7GT0h7WRWkKM0jPqUcetmJUm4oCOzxQM0=;
 b=eT1Vyh5ni85gq/SW/F5cCGRo5n0nBRQCcc2r7z9XsYQ1JMoPCFdx1AYwVk3sf90Xcc
 8td6kmIO+Zz0PCVZUgbJ2LT1GohWZGHbNOj2guI/UBjE0tgFWYKYkFgonSe6qwGSBNyK
 ZssyrVlOCBvx493DhubGq9f2WcPPiqx1ZL4za/Dxr1tvnTpsWYo/Xasn8/oOLdKEIvG0
 am0IGm0yEymdpyBBhot3ClkyV9DRrMBmSZDX/T3/RII6ABzT2RkCGFnJ8dodnXVeKp1E
 Qo13F9Z/fUcHt7bVjCgFbzxuTUiyt7iQwp4Wgcin7EvjkaYchcEv85z45g2dDiEsBD4v
 oigw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSp8Aj0tX3Rc+LbwK9jh5p4JExx4btjNbnvW95LDm1f9YP2Ji2Qm7b3+oBBlpVovLpO0mB6bUOTyv2Ne7rJ+FPa+nfuPQn4lksao7Lj7Bd
X-Gm-Message-State: AOJu0Yz0nCb3M+BKCDQyqE2cZ0M4lOQRt3s+apWD1Gdn0h3vx1YMsZ2t
 sgYyzmNxcxSrmJGvFrfkD8OezF0O2qysRDAKxmHseczxPQLrvVzR7Z3XCbvcdlo=
X-Google-Smtp-Source: AGHT+IHV353nj9C2X6K4hspGVal2ktaseN9D4EwDrW1RpkZb5c5QpQoMkz6JS4I1iUevAj4265AQlQ==
X-Received: by 2002:a05:6512:1253:b0:52e:9cf0:69db with SMTP id
 2adb3069b0e04-52ee5411212mr3381313e87.46.1721305917750; 
 Thu, 18 Jul 2024 05:31:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef0744d6esm76255e87.171.2024.07.18.05.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 05:31:57 -0700 (PDT)
Date: Thu, 18 Jul 2024 15:31:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
Message-ID: <d5vfynn6ba4fwkaw7cegzillhw5qkl5z5huw2xb347j3tv7gnu@etgiotbc2x3r>
References: <20240717215847.5310-1-robdclark@gmail.com>
 <CAD=FV=XCOKJHJ-yzENpvm_MD34tMR5LRy2m2jYdcWzZXP4pfXQ@mail.gmail.com>
 <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGuBZqV4zg1asUNbMLvq0-i-iyFwfi37uKS3kWNuRSOU+g@mail.gmail.com>
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

On Wed, Jul 17, 2024 at 06:09:29PM GMT, Rob Clark wrote:
> On Wed, Jul 17, 2024 at 5:19 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Wed, Jul 17, 2024 at 2:58 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Just a guess on the panel timings, but they appear to work.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > > This adds the panel I have on my lenovo yoga slim 7x laptop.  I couldn't
> > > find any datasheet so timings is just a guess.  But AFAICT everything
> > > works fine.
> > >
> > >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > Given that this is a Samsung ATNA<mumble>, is there any chance it's an
> > OLED panel? Should it be supported with the Samsung OLED panel driver
> > like this:
> >
> > https://lore.kernel.org/r/20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org
> 
> it is an OLED panel, and I did see that patchset and thought that
> samsung panel driver would work.  But changing the compat string on
> the yoga dts only gave me a black screen (and I didn't see any of the
> other mentioned problems with bl control or dpms with panel-edp).  So
> :shrug:?  It could be I overlooked something else, but it _seems_ like
> panel-edp is fine for this panel. Plus, it would avoid awkwardness if
> it turned out there were other non-samsung 2nd sources, but so far
> with a sample size of two 100% of these laptops have the same panel
> ;-)
> 
> But that was the reason for posting this as an RFC.  I was hoping
> someone had some hint about where to find datasheets (my google'ing
> was not successful), etc.

Panelook has a datasheet for ATNA45DC01. It's behind a 'register new
business email' paywall.

> 
> BR,
> -R

-- 
With best wishes
Dmitry
