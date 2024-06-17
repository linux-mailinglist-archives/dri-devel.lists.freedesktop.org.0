Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C190B10F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F4610E3DB;
	Mon, 17 Jun 2024 14:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="WDoZlkHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8215610E3DB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:09:24 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2eb1cd51e05so4904421fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718633362; x=1719238162; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u5n6unhG89aEhQNtetOcAr9RgdHuXzyN1J8LzFmwaso=;
 b=WDoZlkHD8jQiE5+AS69IcHNkf2QG7eaSvJCyB9+GWFeG5Y6riW5Y3dn4ZTcwnfIonY
 l0dG8W8jSYSSXvUhELuo/eNSRzk7fX1fDgiacDKvysFSSDXYkmkH1g3dxLoNdWzRHbTP
 NDenZ2TLMtx9NQkx8P+QN8tm/BjBU5ntV6pnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718633362; x=1719238162;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u5n6unhG89aEhQNtetOcAr9RgdHuXzyN1J8LzFmwaso=;
 b=RA7xnaV3iDtQUFyli+SAF/w5iKPkcIr9HFvDyOHwiF+QOyQNz/Tj0P0Jzi7Tmo8dDk
 n2XMDooYzsrpn7SLsnefStqis2d8V12pMhdo+vCurHlWNS1fLrQnXLM6saITmwJACFZV
 FK7623TTbx6Mv4/hWelvNfAuNIkssjUTvP0sJQFs42u2UzXzhfEhVmN5NPudAgRYJbfa
 OXPEQr8DB6zy5H363uGya/3rkzdBrQmSyRoKTk8uRel/uyZHNUWBXSxQxdDS7qn+jhjq
 XddGGCoehNFAc1tSJ+eoryM/OgRF1NuvtiKyL0xlh/T21O2HQRCaCQFCGm4AlBYclRMT
 E3/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiDLQeiHsLFaO0oUb6/0RAah58sNhaEw1+jBXQ7zNXWpot2cyun9IeywjH7RXMXPasio/3dDMXABA4NsOJClJR43KjXIwr9Anotr7rndA/
X-Gm-Message-State: AOJu0Yw6nGXS80vVxBIQNVaZ4eOhguEsjQQXHt0oxvkh79DqY86/qFum
 O3C7Xs3m5tvyib+5uoJZCF986mcppHH7VTQeBZSVAQ6IXRj/84Xzamw2/aR3fwI=
X-Google-Smtp-Source: AGHT+IHb1LmHZoCdyR9BvmFgsEhfcdrU3ejbVsbNyhiIbOxnK8ExuzSQZLQ5pMgs5z4coXE3SFcELw==
X-Received: by 2002:a2e:9345:0:b0:2ec:16c4:ead5 with SMTP id
 38308e7fff4ca-2ec16c4effcmr50743691fa.2.1718633362433; 
 Mon, 17 Jun 2024 07:09:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870e95eesm197740135e9.25.2024.06.17.07.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 07:09:22 -0700 (PDT)
Date: Mon, 17 Jun 2024 16:09:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Doug Anderson <dianders@chromium.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/panel: Avoid warnings w/ panel-simple/panel-edp at
 shutdown
Message-ID: <ZnBDjxwdyomF0B6I@phenom.ffwll.local>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f746b93621749c@changeid>
 <20240612-garnet-condor-from-saturn-1c51bb@houat>
 <CAD=FV=Xpu0-_kEvRWy9w8ypjo7pF7tsFWxHfhMZ=YjHugTqG1w@mail.gmail.com>
 <Zmm6_27GikpmT3HQ@phenom.ffwll.local>
 <CAD=FV=XpJtCU+8aSaT0e5Ob5Owcn8b0gcdZzUrQoSdE5f9CerA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XpJtCU+8aSaT0e5Ob5Owcn8b0gcdZzUrQoSdE5f9CerA@mail.gmail.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Wed, Jun 12, 2024 at 09:52:40AM -0700, Doug Anderson wrote:
> Sima,
> 
> On Wed, Jun 12, 2024 at 8:13 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > > I ran the coccinelle script we started with, and here are the results:
> > > >
> > > > ./drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1640:25-39: ERROR: KMS driver vmw_pci_driver is missing shutdown implementation
> > > > ./drivers/gpu/drm/kmb/kmb_drv.c:621:30-49: ERROR: KMS driver kmb_platform_driver is missing shutdown implementation
> > > > ./drivers/gpu/drm/tiny/arcpgu.c:422:30-52: ERROR: KMS driver arcpgu_platform_driver is missing shutdown implementation
> > >
> > > Sure, although I think we agreed even back when we talked about this
> > > last that your coccinelle script wasn't guaranteed to catch every
> > > driver. ...so I guess the question is: are we willing to accept that
> > > we'll stop disabling panels at shutdown for any drivers that might
> > > were missed. For instance, looking at it by hand (which also could
> > > miss things), I previously thought that we also might need:
> > >
> > > * nouveau
> > > * tegra
> > > * amdgpu
> > > * sprd
> > > * gma500
> > > * radeon
> > >
> > > I sent patches for those drivers but they don't go through drm-misc
> > > and some of the drivers had a lot of abstraction layers and were hard
> > > to reason about. I'm also not 100% confident that all of those drivers
> > > really are affected--they'd have to be used with panel-simple or
> > > panel-edp...
> >
> > Aside from amdgpu and radeon they're all in -misc now, and Alex is
> > generally fairly responsive.
> 
> Sorry for not keeping up with things, but can you point to where this
> was documented or what patch changed things so that these drivers went
> through drm-misc? From the MAINTAINERS file I see commit 5a44d50f0072
> ("MAINTAINERS: Update drm-misc entry to match all drivers") and that
> shows several of these drivers as "X:". As far as I can tell that
> means that they _aren't_ handled by drm-misc, right? Maybe the
> decision was made elsewhere and MAINTAINERS was just not updated, or
> I'm not looking at the right place? I checked drm-misc-next and
> drm/next and, for instance, "tegra" and "kmb" still show as excluded.

Hm tegra moved meanwhile, but I guess it's not yet update in MAINTAINERS
(or not everywhere), at least for bugfixes. I think nouveau also has
partially moved?

Anyway past a certain point of unresponsiveness, drm-misc serves as the
catch-all for everything and you can land with an ack from drm or drm-misc
maintainers.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
