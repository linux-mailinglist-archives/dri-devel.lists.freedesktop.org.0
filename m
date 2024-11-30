Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0669DF02D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 12:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3661310E21F;
	Sat, 30 Nov 2024 11:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JjClAUS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9595E10E21F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 11:36:53 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53de84e4005so3097540e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732966611; x=1733571411; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=S/Pf8loTaik8LYCta5Jf2Zin0SqS3BgDup0y9NRq4n4=;
 b=JjClAUS1UhnVNlDhFlvedVZXU5UWZxt1/Z8i48H6+ac9JAvJTjFJCLB84m74p8BkZx
 tAg5PU2sDgb6OD5JWZuLWwJyZGFRRUpuwNVQgE2j1Vr3qVoFMOeLkEmxbfHVn8LTGpD5
 xBjm6wBIjuF9kt8Ycz0uv6m1DDE65WJU7X3RR611JPvkIV5NdHPtxzS0pvJwgMpniUyJ
 65XcYEGWH+vCxC1XCpi598WQkKwXZeLPF6j0mfHmXROSDUNUpFNB9xTEXUIGBtvSoOvi
 q2bO2fcKyxjIaulnnJJSOo8iizUZnALdw26EL+NFmXdjly0+DxucEh/+ZQkPCDgdFByS
 P3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732966611; x=1733571411;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/Pf8loTaik8LYCta5Jf2Zin0SqS3BgDup0y9NRq4n4=;
 b=AABaR0Wr5afevPEuALD/BrrPP9wL9d1+IJd0IjLqfYg/ojwu44jD0PzHz0G1W6Y8E+
 WAs/aFU0khRTGrxpLnLIX06MKvgjd4zVDIsXPofms9UuHhyfZiV5D4YzSd99YQ6fKIEO
 6QI4sQmU5lbG+Jdr2dZa/ze5+7O/ZvfknLoPtiUnIaa8aKHcil0v0j6p4ZYm795CVFpN
 q2BVU/0+bxuDL5k5sPKcKpWfvv/CgCTwWylceVNBWd0iAXSCp8KeWm1RLMDGzaQow2v5
 r7CJO5YdzltpNGPhql2rbTw98lYtwFQ2/t4/RqX/ZIdmQiDvmQ1RZzFZb0hHQV55zl9I
 pSRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV38ajUBy8kTgOOt5rNHgM/aOzEfPsqthRTrKi9uYknUkSr3M8g6teHu2prtuqbjSAQ3n+SE5Cwu1c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaSaxn3jSZkOL24ZU7vuCqS84lZ7oZOcXJb3A5VmYPO5XCIRHC
 cqOrJyEPJVVNe+XDXrMlTiXKLvmH7XnRODs+gE30coYZWnlhqiyOy7Aj49HtRAs=
X-Gm-Gg: ASbGncs8mFvVLBlRIvcV2VwnSXSriGDNAh/ijwJEZc5bLi/awIUKq6yUdXWO7AgUCrk
 clsXCYvkbgCGpaMNsGaAnXaBJ3NA49CHKu4ONgi41AlOEJ/vHMW6vxGGRmM4x+431wIyr9VTs3F
 OsGe/DBK4y2czu9WNsHkZ6tS0jsS+DP7Ug4i5Jyc3AyLV9YotxgV+tPGL9eATEtj9jrDoGAHtje
 RG3u5JZKYq7YZPM8TPtVHVF8/GWGuhxd5Lm6W12xwRvP4Ew31Fd+lLbrlJePh6zWCuaMgIQyJbO
 TQFnSs4jLP0qxeLRQOe0IVdC0WrWHg==
X-Google-Smtp-Source: AGHT+IGIIEiDb6qXnTmJUVDYgM6wgGw7GPagKQ9KPPyyX5Q/cb5H82b2qn+Ew6KeyuYbpTeKoPB4zw==
X-Received: by 2002:a05:6512:3f1f:b0:53d:d3ff:77f6 with SMTP id
 2adb3069b0e04-53df010900cmr9945955e87.46.1732966611547; 
 Sat, 30 Nov 2024 03:36:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649f71asm754516e87.244.2024.11.30.03.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 03:36:50 -0800 (PST)
Date: Sat, 30 Nov 2024 13:36:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: Add a panel driver for the Summit
 display
Message-ID: <qowuzrx7s76r3soelwcvlbnksvstlpdind5xxejuqeeohjzsbh@evmuvvzxp3qh>
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
 <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
 <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com>
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

On Sat, Nov 30, 2024 at 12:15:25PM +0100, Sasha Finkelstein wrote:
> On Sat, 30 Nov 2024 at 10:29, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > > +
> > > +static int summit_resume(struct device *dev)
> > > +{
> > > +     return summit_set_brightness(dev);
> >
> > Doesn't the generic code already handle that for you?
> 
> Apparently not, I have commented out the pm ops, entered sleep
> and the display stayed on.

Please add BL_CORE_SUSPENDRESUME option to the backlight device.
But interestingly enough, none of the panels set that flag.

-- 
With best wishes
Dmitry
