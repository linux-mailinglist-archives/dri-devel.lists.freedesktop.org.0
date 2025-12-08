Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50F0CACE3C
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC40610E426;
	Mon,  8 Dec 2025 10:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JVVMUDC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD4C10E428
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:36:01 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so54842055e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 02:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765190159; x=1765794959;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+E3SOYkqsEc+5aDXpHHAZRqmKpJ7LXworventsdWgtI=;
 b=JVVMUDC2lObmYMb3Y+2lYgC1WMfi7/MxhFOgZx+Onag9o2NgKHSjY5CmAw+VINKS1/
 leBXGynTltQP7pztMGfFb2B/pjzTa+Uk/KLl2/841L4YFOTX/C2CtkpqjYumwLF8kovw
 2GZRNijJlTAuqRSDy4GzXHAMfPYIyyu5e0ktVIkrFYbjcv0M/fkc3kH6Z41AcE3OYFTF
 CBW1JnltcBLRZWXdlvpOH3fsiS/DJCiWPDwKJB1+MYZPYnmDpYUrTxBHyI7BcDbOtAZo
 FHaFOXFMQ4iMl81zxLR9V5rpBWBkcudMw5Ogb7/F3rsYnmfsz0UJwygo3xoI8FLdYOXI
 mDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765190159; x=1765794959;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+E3SOYkqsEc+5aDXpHHAZRqmKpJ7LXworventsdWgtI=;
 b=pFxN9y0F8BICRg+/L5qpjNDlMg/4kkhaAVrpQSzo3XXpV9FBsEXmytSA5frsBS/9eP
 CEiN5fxcRTOJ/yeQDM2MZKOBIDmGldY35OGHa/gkw+mgK8odZjpU57YZ7EazxnqS0yyZ
 j+oZzgBwDL8/fdleBlKpKKofVgf/3Xjqf8MVDnix8EcEev/0Lm+Voc3I+GqXT7ZmTblz
 fEyUUZTNaj6eV9hjkQsnMafMHlE1bg2cV2cR4tF9RuQfQf5pfon4//Au6ddlgcmTs9Ih
 mrNV+MB5zoedgtbSHaM1+eZrfQGFVNLjSZ3ara1mv6Vz9tOcwEW4yQij07pE0+hyuIgr
 iotw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw62xJOeusASJWbRwnMYdHTwcl7bE20vkN2xBwBCEYqsm4rHt4GiSROH0BGHIOXnXK9cBTZgoAtBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIhLtgr/oppL3PPT2kvyce0ym18noD64uxbn07n8p49ARZFXs0
 LAGAx78Z58KSSvdtzD6tpjcf7W8kFqiv/GlHfWLigea0iobGs3XqqZSbQ5ZFtftd3M0=
X-Gm-Gg: ASbGncuMz8bESQqNcc2ipjh5VBBViB2FVTxAce+npNVkEoIZ5V0P2Xy9+EPaZjiJL9Z
 e5qhYZUe5u+B0/IdW+KE5v9UxF0Vy6dH2vMh+eSkuwWbSG+tzRlnsq+wnD8Ls3bcR7xFUrU4h2S
 bDfHKiqPpJwEV/kN9UNArnyoUJmYuhWcf6P8T7dto8BnSbcBmTptNM80I1Xsveom6t+qXkdmCz+
 4LGiz55LFqjJR+TMwx1XnpvSNkyEQTYIfWRzK6Ivc/e56MsCTGGLY1flIL2sUXlDB24LUUPHAFi
 PuXKOG74tRzBx2MfgFbC49otgbp8RVDi4ZL+Ntd5JZsDCCH1CuD9QrqOREvuLyaUuDTx5C5accr
 3725Q7SxeBESjbqPWjKg5r69sbWZXPsqqHVfv/4YePmdn8zLHR+1FGtDNQXAxfa/noXNgtarUEt
 aAHGj3Pwy+9Cjdni0sTSS0c39wba0wu/z3TkBMvwe96O0X+IzmF7i8NONqtvH+HZZ9J/rzCw==
X-Google-Smtp-Source: AGHT+IGge21HXj48TLUzsA7ggUbHSFC0xO5HgqxGNKT4MTX7Oe0oV8kQd6FtV8OIYLtnHQGrRwLESw==
X-Received: by 2002:a05:600c:818e:b0:477:9fcf:3fe3 with SMTP id
 5b1f17b1804b1-47939c87088mr76977635e9.0.1765190159388; 
 Mon, 08 Dec 2025 02:35:59 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311e712fsm240407865e9.9.2025.12.08.02.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 02:35:58 -0800 (PST)
Date: Mon, 8 Dec 2025 10:35:55 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aTaqCxsGj_waN92Y@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
 <aTG0EK_zuSB-U_bb@aspen.lan>
 <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
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

On Fri, Dec 05, 2025 at 04:20:55PM +0100, Maud Spierings wrote:
> Thanks for the review.
>
> On 12/4/25 17:17, Daniel Thompson wrote:
> > On Mon, Dec 01, 2025 at 12:53:21PM +0100, Maud Spierings via B4 Relay wrote:
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with integrated boost controller.
> > >
> > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>
> <snip>
>
> > > +static int max25014_update_status(struct backlight_device *bl_dev)
> > > +{
> > > +	struct max25014 *maxim = bl_get_data(bl_dev);
> > > +	uint32_t reg;
> > > +	int ret;
> > > +
> > > +	if (backlight_is_blank(maxim->bl))
> > > +		bl_dev->props.brightness = 0;
> >
> > This isn't right. Why would you change the backlight level just because
> > it is currently blanked (and sorry I missed this one last time).
>
> so just remove this bit then jeah?

Yes. backlight_get_brightness() is all you should need.


> > > +
> > > +	reg  = TON_STEP * bl_dev->props.brightness;
> >
> > The correct way to honour blanking is just go call
> > backlight_get_brightness() instead of reading the property directly.
>
> will do.

Thanks.


Daniel.
