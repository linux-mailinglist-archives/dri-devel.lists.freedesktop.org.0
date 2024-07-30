Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE12940F97
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 12:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592FE10E17C;
	Tue, 30 Jul 2024 10:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NSR5oPaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E7910E17F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 10:38:50 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52f008aa351so6640363e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 03:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722335928; x=1722940728; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+U97O4VKbER7c77DAivCOtGbIut3AV5EqhrmEVNx9ZQ=;
 b=NSR5oPaXdPqc4UsxtuQxf48Vdipqbf6MPu0BF0/61RNKzXUgt0pjeuw2xJ8vOfaT0t
 Bvtpt2+aDAr+EC1zXo7QfIp5+qhmASvUA1lrYsdDrvtnZ/aOVfEghxQUjeHg+C0YMLd0
 1/HHfdUBWjn9Enuu/gKPnzg+6wKRSFEQ0g0XCRTEptD1LcYC/i49Kb3HDd0sw92B9Fue
 /Ekt1bcTEQbb7r5T55Md3STnKzaGJ9SssmQt52bdflrrSmxsBZvzO5FhH0M4TIT3XNae
 QaeHZKdYyh8YQgU7xgPt3oUH/Lmo86q+RI7yUwoLyenkdHGTmUIipVCNH2ypakHp1CHb
 6mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722335928; x=1722940728;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+U97O4VKbER7c77DAivCOtGbIut3AV5EqhrmEVNx9ZQ=;
 b=p3vuguQyd0iGaj+vW/9Mj3LLM+niVSoC6JIsVKdmSNqSmKR9xgS7aOr208VRyUv64H
 WIK7VigOg5GfRGntjLmbF+wKbPw9spyzC0j0k1QQxWFFU9jmI71tS4HuY0VotIbuduYF
 C7j3Fnbc3oIEHZX6m5C9VzbvRxL2WdnMc7sPl/jyYI070j+SEO83lrBMJ3tbO3ZH1YTz
 Xz6nF4czvHIHUkx70OT+wG7e+uUMfatkyfwuHKOEXvyT12R1KS0eL/HDVlexzu49ddcD
 EvrIIklGrEX/fjucx+uEJKvgN7tqwJyG2a8NWUXVviahUrjm3clpYnH/KAAP3WAa1PFA
 vWsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXynmtG+U90mbh0eC8B3cazAy6tk6JD1N+X98eQBQHc7DZQ7rnGktzBSOta4m5Sswr8fQ/Fw8AiaK1YfYc+mJXQuAWIuofklDSRUpqakbfT
X-Gm-Message-State: AOJu0YxMwBYzRMdOYUxXceh9zHBGOfuL9qBPRNfagjbz1pYcvabgA00R
 Z75QBIsDtOudErN/fvWUU9+su6Z0YEpkfyrr73XaykxnHwLGw3sKv5TYSwpsjJE=
X-Google-Smtp-Source: AGHT+IF6VKB4D32RCp9CERdBwiA6MVKDWqI+JR21hITdyzolHsRceFaO1kh1POQ/RRF1GjMQ6ImKsQ==
X-Received: by 2002:a05:6512:451:b0:52c:8596:5976 with SMTP id
 2adb3069b0e04-5309b2c5bbcmr6704911e87.55.1722335927871; 
 Tue, 30 Jul 2024 03:38:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bd0a6esm1874512e87.65.2024.07.30.03.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 03:38:47 -0700 (PDT)
Date: Tue, 30 Jul 2024 13:38:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <qxovk44ezmgvfmmp44gkpytvegnn627nlui24l5zmiimsbnvlr@pnrcemh2iprl>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e55d0f0e-a104-4790-b832-120dbddd93ad@freebox.fr>
 <20240715-stirring-purple-toad-7de58c@houat>
 <c302bc47-6492-44af-86a1-3ff6a815e314@freebox.fr>
 <20240730-eminent-venomous-condor-8ef421@houat>
 <CAA8EJprQJJ2AuB99RFU+d074PV+NHMPwjFWn_auju7HYQQ8R7w@mail.gmail.com>
 <20240730-miniature-wonderful-okapi-01aa0f@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730-miniature-wonderful-okapi-01aa0f@houat>
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

On Tue, Jul 30, 2024 at 11:30:01AM GMT, Maxime Ripard wrote:
> On Tue, Jul 30, 2024 at 11:46:24AM GMT, Dmitry Baryshkov wrote:
> > On Tue, 30 Jul 2024 at 11:27, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Wed, Jul 24, 2024 at 07:59:21PM GMT, Marc Gonzalez wrote:
> > > > On 15/07/2024 16:40, Maxime Ripard wrote:
> > > > > On Thu, Jul 04, 2024 at 07:04:41PM GMT, Marc Gonzalez wrote:
> > > > >> On 01/07/2024 15:50, Maxime Ripard wrote:
> > > > >>
> > > > >>> The i2c register access (and the whole behaviour of the device) is
> > > > >>> constrained on the I2C_EN pin status, and you can't read it from the
> > > > >>> device, so it's also something we need to have in the DT.
> > > > >>
> > > > >> I think the purpose of the I2C_EN pin might have been misunderstood.
> > > > >>
> > > > >> I2C_EN is not meant to be toggled, ever, by anyone from this planet.
> > > > >
> > > > > Toggled, probably not. Connected to a GPIO and the kernel has to assert
> > > > > a level at boot, I've seen worse hardware design already.
> > > > >
> > > > >> I2C_EN is a layout-time setting, decided by a board manufacturer:
> > > > >>
> > > > >> - If the TDP158 is fully configured once-and-for-all at layout-time,
> > > > >> then no I2C bus is required, and I2C_EN is pulled down forever.
> > > > >>
> > > > >> - If the board manufacturer wants to keep open the possibility
> > > > >> to adjust some parameters at run-time, then they must connect
> > > > >> the device to an I2C bus, and I2C_EN is pulled up forever.
> > > > >
> > > > > How do you express both cases in your current binding?
> > > >
> > > > It's not that I'm ignoring your question.
> > > >
> > > > It's that I don't understand what you're asking.
> > >
> > > And that's fine, you just need to say so.
> > >
> > > Generally speaking, you're focusing on the driver. The driver is not the
> > > issue here. You can do whatever you want in the driver for all I care,
> > > we can change that later on as we wish.
> > >
> > > The binding however cannot change, so it *has* to ideally cover all
> > > possible situations the hardware can be used in, or at a minimum leave
> > > the door open to support those without a compatibility breakage.
> > >
> > > That's why I've been asking those questions, because so far the only
> > > thing you've claimed is that "I can't test the driver for anything
> > > else", but, again, whether there's a driver or not, or if it's
> > > functional, is completely missing the point.
> > >
> > > > SITUATION 1
> > > > tdp158 is pin strapped.
> > > > Device node is child of root node.
> > > > Properties in proposed binding are valid (regulators and power-on pin)
> > > > Can be supported via module_platform_driver.
> > > >
> > > > SITUATION 2
> > > > tdp158 is sitting on I2C bus.
> > > > Device node is child of i2c bus node.
> > > > (robh said missing reg prop would be flagged by the compiler)
> > > > Properties in proposed binding are valid (regulators and power-on pin)
> > > > Supported via module_i2c_driver.
> > > >
> > > > If some settings-specific properties are added later, like skew,
> > > > they would only be valid for the I2C programmable mode, obviously.
> > >
> > > I think there's a couple more combinations:
> > >
> > >   - The device is connected on an I2C bus, but I2C_EN is tied low
> > 
> > No, this is not possible. I2C pins are repurposed if I2C_EN is low.
> > You can not call that an i2c bus anymore.
> > 
> > >   - The device is connected on an I2C bus, but I2C_EN is connected to a
> > >     GPIO and the kernel needs to assert its state at boot.
> > 
> > This is a pretty strange configuration.  The I2C_EN pin isn't supposed
> > to be toggled dynamically. Anyway, if that happens, I'd use pinctrl /
> > hog to control the pin.
> 
> ACK. I still believe it would be valuable, but I don't really want to be
> part of that conversation anymore. Marc, do whatever you want.

Just to explain it, from my way of thinking the I2C_EN pin is the same
as the address-strapping pins: they are usually hardwired by the device
manufacturer.

-- 
With best wishes
Dmitry
