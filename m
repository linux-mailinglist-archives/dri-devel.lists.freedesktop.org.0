Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FCBA2CD57
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 20:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30EA10E2A8;
	Fri,  7 Feb 2025 19:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LlAvLLsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEA010E2A8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 19:57:34 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-54298ec925bso2905705e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 11:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738958253; x=1739563053; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=x0T9/ZuNkQ4ks8pt7svCxV1BQmZdwdu/CWy/f/RDblk=;
 b=LlAvLLsMxtvGwIZhqrr4dTTkdKRcbvej8mzsbN4LcvUIagxZUvCBHfs+HY1a0USPzi
 wo28A5VvdpR8Ea5k4mLaihNqTlJLvgQxLUTSXaxnL8da8OBLc21cmdIaOdPTDd3Ewo/Q
 r5S9KT0eJ7KGoa7vdKvFhm7w4RIRu92tIaOp036vBU2z2DQZKIkHrExMHIG0gWQQybqm
 IgxNeyblYuHCwKFOkNjA2QyB443id4DyE97I1ppkDNQLD0pRzwN2QZabopDOiTYE6r3A
 ByYvVPa6Kj7ty+XS5rJy/OZTdSBesoOe7SzmDiR0p99N7Lp0tKTr2y2r90ctiXRCSGUH
 GXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738958253; x=1739563053;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x0T9/ZuNkQ4ks8pt7svCxV1BQmZdwdu/CWy/f/RDblk=;
 b=GfegOXnydvfNxTvIT3Mf1wDG28b9cVuUOhB1fm5b9fOBu17qUQBPdCLeK+dKEtEc0j
 7dkATPJuHM7loED2ErBqCVo5YDLJwp5fYjE3iNOCqop9X0i4ucXuvPzqsIcJh776VUBt
 Au59ZRHAJZfLeiVYzWH44bn3VH+Y85IWCYeT/IDJJoxo1/2BUrkL2jSRs3e23YDDnAxu
 Br+pVz9NwodQidpE1Rbp/cRlllRTrOJ/djtqMaNUwOh7ccggI/mU6kR374a6TwsyvieV
 hSjOY3IQZ88XG7tqUKhVCeukT5Yip/Nj6bOrROiuy0/qpOGWSe376QhkCkpuCvZtcG20
 O6wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSGy7q4yV1sV8ZmiX9TSoXKJhSy4FkGVAv4kWauR/k1MkoxlTYvEA08zbNyOzlxZB0odhMPtvrm7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYKhwMR9MJVVyz5Rk70TO/Lvv4VBhYJ6ZvTTk0jRx0GukVezoJ
 o2SsAL3qXfY97m0fi4cHnwMhoq7rRUJBMVhMa4fefxzKBeD8Hd63olHOzqloK1k=
X-Gm-Gg: ASbGncvgfeBmuR8MHDB9OUHhitbjWUEe0hfaqqMPV+CFkVO5DIdglsN2xUdolkEYale
 9sZobXbRLzhhskpfv0yVmz6HKePhhBJcdLLW7AohxBgQ5gSM4wN79+mCvXiaN3uIs0zSCcAUfz7
 574+YJOiSynebZM2h41z8wgMmygIqRdg4Je3MtvPud5lFQCRqhlx3T+3XqFbUISA/qsxUKBnOcC
 KhgS/ZB+E7/+bDeSRsAd4AJz2RVzFko8h9Bq02YB/v62JhwGPbkDmYxfgYyJSZoWgy38IFwoNEr
 ayjelNxgkQMlo4P4uc+Bxfegl2bIIEffYiy0sf5weKfxYBOhK8JwXVpEOGPkhgXfjvPuHT0=
X-Google-Smtp-Source: AGHT+IGHcoDCGXH/LL0Tkb8Pbbsjc+ii5rlqX6YsqqRGWi5SEaXype8ZThbpCLSTDmjeyW4IMVV6kA==
X-Received: by 2002:ac2:4e07:0:b0:540:353a:df8e with SMTP id
 2adb3069b0e04-54414b052a7mr1658512e87.39.1738958253085; 
 Fri, 07 Feb 2025 11:57:33 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441053ed99sm547105e87.3.2025.02.07.11.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 11:57:32 -0800 (PST)
Date: Fri, 7 Feb 2025 21:57:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 15/26] drm/bridge: devm_drm_of_get_bridge and
 drmm_of_get_bridge: automatically put the bridge
Message-ID: <k6endeznshwoftdmhyezuavg6vlemujukfybtqeil66cmjnhtv@yh6knwpabpno>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
 <w3qufv73ldzdcfuz6n3prx4di2dhoq2wfqmmvxvxkea6uqxkge@pjwmugvicsbt>
 <20250207114401.7869b422@booty>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207114401.7869b422@booty>
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

On Fri, Feb 07, 2025 at 11:44:01AM +0100, Luca Ceresoli wrote:
> On Fri, 7 Feb 2025 05:17:43 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Thu, Feb 06, 2025 at 07:14:30PM +0100, Luca Ceresoli wrote:
> > > Add a devm/drmm action to these functions so the bridge reference is
> > > dropped automatically when the caller is removed.  
> > 
> > I think the get() should go to the underlying of_drm_bridge_find() function.
> 
> It is done in the following patch.
> 
> Indeed I could swap patches 15 and 16 for clarity. Or I could squash
> together patches 14+15+16, as they are various parts or the refcounted
> bridge implementation, but I felt like keeping them separated would
> help reviewing.

I think most of refcounting should be introduced as a single patch,
otherwise you risk having memory leaks or disappearing bridges.

> 
> > Also it really feels like it's an overkill to keep the wrappers. After
> > getting bridge being handled by the panel code would it be possible to
> > drop all of them?
> 
> Do you mean having only drm_of_get_bridge_by_node(), without any devm
> or drmm variant? I'm not sure it is a good idea. Most DRM code (well,
> all of it, technically) is currently unable of working with refcounted
> bridges, but if they use the devm variant they will put the ref when
> they disappear.
> 
> > Then this patch might introduce one new devm_
> > function? Or are drmm_ functions actually being used to store data in
> > the drmm-managed memory?
> 
> Which devm function are you thinking about? Sorry, I'm not following
> here.

drmm_of_get_bridge() / devm_of_get_bridge(). I have a feeling (which of
course might be wrong), that they were used somewhat randomly in some
cases.

> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
