Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A35DC45C6E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 10:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8725D10E36F;
	Mon, 10 Nov 2025 09:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bpoH+2eE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479C310E36F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 09:59:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42b31507ed8so1414179f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 01:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762768741; x=1763373541;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wKdtCn/XoTBMU0W91zbNyyVRdCbCwPGBIxEuE5k5q+8=;
 b=bpoH+2eEdnxmENQhF+nq9ga240aFthTPUzEOc6+ShR8UcqF+rZ4GcyLJ6tCg7xVfBd
 63R7rlhwMgADcjWpLdaRVi9R4d68uVOehv8HTYUdNd9u6+DGL/58mOFy3Nf3PAOei9YY
 AKS+CI1ITqkuvRxyDLI2TAefrL1PB/qX/zvMpm15OkeE/blxZJ+/fHzk1VTv17a9sSvk
 yiejyU0wk9VVT0KBzxQJ1PK3TylCNQQIFYK2JJCB0DN17ExsjFrmEi+RvbCEa6fIF8pH
 mjC3OOqvONSd/PLS7PXd1nt3lPcP5WuEYvAn/qUaWomPH0OPU8VQAjaO/EbMhV3x4/3l
 cFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762768741; x=1763373541;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKdtCn/XoTBMU0W91zbNyyVRdCbCwPGBIxEuE5k5q+8=;
 b=VFija+EBuTRUsAWtDc6mSoMj+dWWHIxFo/sWsEnSPzMUNptLfccUCpREnayA6ekRge
 gJgX4H3or+vxyo6IRazk5PxoIFf5aAJmnuLnPAy00rc9CCW5Ww12iDopgwUPHlY5t5T/
 vBYMOG4YKMaiMLK+YxSi6rRyfy8sev0dlxkLuyTP//22LkZHZOzVMxvWSkFYdXDP+fbi
 j7Zh7WWEh+EgO+f3O9Bog0wFIHs3YDpQRYUkFewOcoNaVGI0T81QjeSzBpT4CiOd8sFo
 nuG5wRVFh9r2oHIVsqUIXBMFeCIU0pRDo7O//SWIY9RuOksUNz8G3EOPMbuJGwlPBxAq
 ZWAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjpc3bGdyMCsXh3XT+e7xcR9AKEDhoE6aGNqqXSUWCMR752sFM+98bUn8hHlxQiSoF9P0u8TFKP/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKDPoxB2haQGZtNnrzWIJjaibQrxvUt+JU+hZMOkmXXO8ZSgML
 HFcbNoj9Su38+19GefhyTHfyAHabJoPvzegYVo/wZlo7E15tXNyL1CK3KDZPRnC5bj0=
X-Gm-Gg: ASbGncsMGCl0B333GdhaYotXxHFZgrJL+oe2jC7Al3n5+XgzgEYXhcxjMpdy6suBj1w
 6HNL3WQymhUGj9z/mF9vkJqyUIJLCZvRnKSKxKp1H+zMyirx0Hsx7ihvikwyPGynCLzeEHFSLU3
 IZshgVCth9G1QP+QqmlCxioby3G6GkyBGziCwnvJc+83X58RRYw+/fJKleLfqsvLqn+T+1PqYLU
 l2Gsulf/qy+plEqESGwZseDQxUSEmnw7jfgH9F/qynLcAhRbzqyMfw5FBdwfFdgJxrxq2lSVfIM
 htHdSCf4YFMTIqrqfip1qHw9De+OhK0qu4AzvgxAuJkg8DB49SBFMxZ8TMUpclTktIzbVajRPDQ
 j87hSEVYzO9R/jewrNlWOJeiN6xq1UXKspqMlykdm98sJLRaYh2Vj9RBAnLMcjSDKaWpvRUBDpK
 lK8Wj2hdWjOh4lPHtICjdWW+D9+fxFvsnyYDRNjFsun/1tktzX0qmdKtCDmc4=
X-Google-Smtp-Source: AGHT+IESDCHlcbXRXRa2TG5aApGtSH2moJB6JVIAkSw02ybwWPI2qmXCnmEZcdOIcRiKJ320ee1qvg==
X-Received: by 2002:a5d:5885:0:b0:429:d19f:d959 with SMTP id
 ffacd0b85a97d-42b2dc1ab24mr7071023f8f.15.1762768740534; 
 Mon, 10 Nov 2025 01:59:00 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b32ecf522sm9799000f8f.45.2025.11.10.01.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 01:58:59 -0800 (PST)
Date: Mon, 10 Nov 2025 10:01:11 +0000
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
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlight
Message-ID: <aRG359gIeP48V2ZZ@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4a2SBDldYgQb56@aspen.lan>
 <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
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

On Mon, Nov 10, 2025 at 09:40:07AM +0100, Maud Spierings wrote:
> On 11/7/25 17:14, Daniel Thompson wrote:
> > On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > > +/**
> > > + * @brief control the brightness with i2c registers
> > > + *
> > > + * @param regmap trivial
> > > + * @param brt brightness
> > > + * @return int
> > > + */
> > > +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
> >
> > This isn't a good name for a function. It doesn't really say what it
> > does. Please find a more descriptive name.
>
> Having a lot of difficulties find a succinct name that fits better,
> max25014_register_brightness_control()?
> max25014_i2c_brightness_control()?

I'd focus on what it does rather than how it does it meaning something
like max25014_update_brightness() would work.

However, at present, this code is only called from
max25014_update_status() so the simplest thing to do is to move the
code into max25014_update_status() and remove this function entirely
(then it doesn't matter what it is called ;-) ).


> > > +/*
> > > + * 1. disable unused strings
> > > + * 2. set dim mode
> > > + * 3. set initial brightness
> >
> > How does this code set the initial brightness? It doens't set the
> > MAX25014_TON* registers.
>
> Yep forgot to remove that, I discovered the backlight core takes care of the
> default brightness, so I removed it from here.

What do you mean by this? Are you sure you aren't relying on another
driver to enable the backlight rather than the backlight core?

> > > + * 4. set setting register
> > > + * 5. enable the backlight
> > > + */
> > > +static int max25014_configure(struct max25014 *maxim)


> > > +static int max25014_probe(struct i2c_client *cl)
> > > <snip>
> > > +
> > > +	/* Enable can be tied to vin rail wait if either is available */
> > > +	if (maxim->enable || maxim->vin) {
> > > +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> > > +		usleep_range(2000, 2500);
> > > +	}
> >
> > If you really want to keep the devm_regulator_get_optional() I guess
> > maybe you could persuade me it's need to avoid this sleep... although
> > I'd be fairly happy to remove the NULL checks here too!
>
> Just wait unconditionally?

If you think it will be unusual for the driver to be used without enable
or regulator then it's ok to wait unconditionally (all examples you
have added so far have an enable pin).


Daniel.
