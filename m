Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5FAA4CF8F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 01:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1052110E00E;
	Tue,  4 Mar 2025 00:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wOI8Xf4m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9171E10E00E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 00:01:13 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-547bcef2f96so5678458e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 16:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741046472; x=1741651272; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nkqxBKG8Qf6FiNEdeYYpYgDqec2n3GJdXjk7zy/AcfA=;
 b=wOI8Xf4m4sQrmlG2qXpYyNagjG8VX+Fe8z5rqaMAves+KH3EV2QmoQmxQkf/34TYef
 FB508L8QX8Kvvx0IsxKWUX39xXYRbScsJBPy8oLUneq9CBuBsuZjpHVEh4fFaH5zjk0k
 rBMMtJCIxTVm6gQk9bWmg2mcXCTaFK1W/fa0b0+BHr8tUgVdf0cwLN7s8wl3oATAmPYT
 YenMMYtYXi0qZW65t6cYqPJ8YrqHCzk4ePjeDTxgdl9UBtcnUL5PTd0TrcR/EBDEmCi3
 zSlmNk3f70o65F6nuT4c5/AIoeD6L/fD5RYbjtbwe8GwZ6oe/o1EZZDYwepQnxs+9CSg
 8i1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741046472; x=1741651272;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nkqxBKG8Qf6FiNEdeYYpYgDqec2n3GJdXjk7zy/AcfA=;
 b=Zyn6w6r3rJeE9hHd054YqOi1TzkIWLKrlW9IpUbLR4acj1dFhAEAHsSgP4JBfWOn0V
 u6eLL3o0fR8wVNj9+TbBHXzWGCHMRbh/X+vJlumBrdfBrRD6H27BOsL5UyDpsNZ4p+M2
 D1714NDdC6cnsoNI5hWnESwgeECpxheEsIYh+qg3dos+AXSz835hkaG1t481k2oXM3Js
 gRq1Gl1yKpXeTMWhrVRp1wSpleIhGGClW0koS+Zn800QMctN8sOGLtxkwV7xa3313c9F
 4P1r79/tpE9V5tkC/zJ8xfXkOMg9WoTdgOCah4/NHPfI+sRofirPPAgClLXHV9m2bZC2
 dBZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK901LyZb7H0RSimucYGQY6pmzvAHhg3dKZae7Ss9B5vd8grkJM32eylsEK6Ped+LBFFYbDCROq4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMRIOphMk/I/G7adjLXaLMWuPqCfTLNKmF0psgAr8oNxnfwDJT
 zpHGNb+ayUBCQYVg2WhVDnx40Nnba80CsMi/eJDxmaD+IF7iSe8vL+yZXOSWRJgQBwPPdxlx7dK
 +k/hoFA==
X-Gm-Gg: ASbGncuEl9LE9aK3oXV9Frw3E3cKCY0B09uzA7qXv43QF0Lp5GTBwXBzRzmaRI7Kgof
 Mma7m6pRZDpJ+SIKdn6tKWwvHoUmf4WkxvtkLoRJ0VRJMVOxxXdLWxoZwsf2G6BRKDXeI11E9E7
 vvhJQYt4cBvDlcTpGLKcISrKG9K/7tcwT5MuRzWyCJyZKzQAQ5APiC+EZm2D91QdObA0NR1x8Pb
 aJqwiVAvdMvslS3E0n//MZLJniGIc5TUZm2lefkkqwQKUuYvFCk8Pn2JX6NtG3jn7g7/iUiB2wM
 KXErV/tlyCXgFOFJvzRk5HNFeXfyxp+SpNGQ3ncPeFjrRJRvUM0kEK8Dd1ygoO3KBOUENmCBbYU
 LCUTwEt6XEK/kt9vipxS+MS7d
X-Google-Smtp-Source: AGHT+IGAn6gM1TyoFfcxy1mqC0F4XhADSkCvoUeeALC8/A3I1KfzwKl6LMwy2iUWuocM+y/26k7tHw==
X-Received: by 2002:a05:6512:234f:b0:549:6451:7ea0 with SMTP id
 2adb3069b0e04-54964517fb8mr2749118e87.19.1741046471766; 
 Mon, 03 Mar 2025 16:01:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443cd03dsm1427182e87.244.2025.03.03.16.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 16:01:10 -0800 (PST)
Date: Tue, 4 Mar 2025 02:01:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
Message-ID: <dn7zskhxgdgr25nvbnsjyn5brc3yoc446dxz3vqgbiwoccvlcr@5l6f4byj53fo>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
 <Z8XcH7xoDC7TA7ZC@blossom>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8XcH7xoDC7TA7ZC@blossom>
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

On Mon, Mar 03, 2025 at 11:43:11AM -0500, Alyssa Rosenzweig wrote:
> > > Sasha Finkelstein (5):
> > >        dt-bindings: display: Add Apple pre-DCP display controller
> > >        drm: adp: Add Apple Display Pipe driver
> > >        drm: panel: Add a panel driver for the Summit display
> > >        arm64: dts: apple: Add touchbar screen nodes
> > >        MAINTAINERS: Add entries for touchbar display driver
> > > 
> > >   .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
> > >   .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
> > >   .../bindings/display/panel/apple,summit.yaml       |  58 ++
> > >   MAINTAINERS                                        |  16 +
> > >   arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
> > >   arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
> > >   arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
> > >   arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
> > >   drivers/gpu/drm/Kconfig                            |   2 +
> > >   drivers/gpu/drm/Makefile                           |   1 +
> > >   drivers/gpu/drm/adp/Kconfig                        |  17 +
> > >   drivers/gpu/drm/adp/Makefile                       |   5 +
> > >   drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
> > >   drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
> > >   drivers/gpu/drm/panel/Kconfig                      |   9 +
> > >   drivers/gpu/drm/panel/Makefile                     |   1 +
> > >   drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
> > >   17 files changed, 1489 insertions(+)
> > > ---
> > > base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> > > change-id: 20241124-adpdrm-25fce3dd8a71
> > > 
> > > 
> > 
> > All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?
> 
> I'm planning to do so today, just need to get dim setup first :)

Nice! As a heads up, it would be really-really nice if you can send any
kind of 'applied' message. If you are using 'dim b4-shazam', then
'b4 ty -a' might do that for you. Otherwise just a simple 'hey, applied'
email is useful enough.

-- 
With best wishes
Dmitry
