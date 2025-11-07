Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D6C40D7B
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD7F10EB13;
	Fri,  7 Nov 2025 16:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Ku+DwkWR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0040B10EB13
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 16:20:39 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso4921655e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762532438; x=1763137238;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wDYDeeQ/vWAVkTVZ2tumPs2hnzhDw4b29aU1EHWCyII=;
 b=Ku+DwkWR4JEcnvjRquuQo1JfBOjQhN8OGJyIqA92Ng3ohJszDEnzjSGTGi4lV2Jf/4
 xWcYDQH7yL9PnNKTPnQL9YFBlW9tkmS7kFhTEE6YNg4t8SNfZGVvIHo/U+mINpSvcUXG
 1JSqvCT1f1F8fbR1i6fEL7XxMY+Ivd4WXRGojhaK7tKEo6bky6y934qp0dFR9Nux8jbN
 KCzoKiKwQCXh9ko40v+yqfiJuPUij7jIFAuJ2krRNA4sFg7pH+xUNDtAzpeD7FMuRa3w
 aDvKjQ0Q3J3ZMzbEN5d9B18CrUaM8ISnJvPoxDZdc+kd3g7rrAA+jDZOw/Wlc8XAcGTV
 LfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762532438; x=1763137238;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDYDeeQ/vWAVkTVZ2tumPs2hnzhDw4b29aU1EHWCyII=;
 b=KU2KpdFbEr8757KK8SIcUK4SdAWNiA+nctHjYBmKh13+isvkoJZA9rfqQvF2H+zFQW
 K95GW0extWHd5fnkpRoZwlsSanQdgHjuOIN/RPtZRXs4AjS33N2IzzjfIm7lPaG0hnE4
 umI99QnANNLTCi2R4kKvD8pDMOzWoGDqo6XCGMrkaGOmbgAQMEs/5Ejz9nMC3Ho4G8Xa
 761L13ZpHhqaAfTbu5RyhQZbiVtHCUoeOVxfU9N4PJogyUTOznTWoZJdY0417gGltsuT
 r4uCQQ62g00u60Fuv8hqWe40hmCpZW2mtY4kBgU8pIlTLCOVvB8IE2Xi2Lij1LeCTPNm
 gEZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGJlMC5w2t5mcPe70jv53ibABwcmmIVva+kamN4lE2fJSiheFv5mHBPeTHsI6BdeOadhinxBWTTf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsUCLOADljGCVDQREqjyy1jthoPFq8sbc+w1QH7D2/X1IgIQAG
 ZALW4tAVrlMYAvuv10rI/45l5nqAQ9MVyL7aC8voSb2b3HZWUT7IF8FdYZT8aGx88WU=
X-Gm-Gg: ASbGncu7tjvUrLsE/SzXtb6QW20AaOIr+w6H0Y/Pre8JOYdMYjfZAWjsnQV7yTFDcLt
 GKMkyY9OcBl5nqAVa13f6MhJc1UjNGZyUL4bNbwpXLcaddR0pb8bIbGjhG55Wg17NjnEvLnHzBc
 a1mtv8IkOkN5vse/imtmuo5M/BQo1SwK5SWNz0U3nyS1O2V5DWIfx4e4w5VVMapdjFyXuimEQV4
 kYSd8XXd+ULZuA18o4UuJcgfSiihqm1ygDuhcMaVvG2aBa4OjckRkw9kumLuFr+yWKWZeiOkOcX
 dmLZvrq2qF31gPQbwxgI3NwK07Ln+8NIQO2xr96CWgMfmeESXG0PoZbs7XF6r8Rh5qAtpIEkkd6
 pdO+SVe307Fz1ZQiLq8oYMn3jv1IGZYbbkXHQvWXChsnutrWZQfA1hXgCUfJZMz1ZQzzPtG/FZA
 K3jA4k8OMNPBkF+5J+G7vu9N+m/70muPNo4J1PLhHOE5tmb0/Yam7pR+6w+NE=
X-Google-Smtp-Source: AGHT+IFcgdIpQe62FnRg4rVkke0TruBClBrbAABNqXTY7mPIIJ+cQeAzHNDnmh9vCKPrBQJ6NHkN0w==
X-Received: by 2002:a05:600c:1c8e:b0:475:ddf7:995e with SMTP id
 5b1f17b1804b1-4776bca6415mr30487885e9.12.1762532438329; 
 Fri, 07 Nov 2025 08:20:38 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477641fdbd8sm48938385e9.5.2025.11.07.08.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 08:20:37 -0800 (PST)
Date: Fri, 7 Nov 2025 16:22:33 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
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
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlighty
Message-ID: <aQ4cyVKzgBUfpsj9@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>
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

On Fri, Nov 07, 2025 at 10:51:11AM -0500, Frank Li wrote:
> On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > with integrated boost controller.
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

<snip>

> > +static int max25014_probe(struct i2c_client *cl)
> > +{
> > +	struct backlight_device *bl;
> > +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> > +	struct max25014 *maxim;
> > +	struct backlight_properties props;
> > +	int ret;
> > +	uint32_t initial_brightness = 50;
>
> try keep reverise christmas order

I thought reverse christmas tree order only applied to code where the
maintainers called it out in Development/process (e.g. netdev and tip).


Daniel.
