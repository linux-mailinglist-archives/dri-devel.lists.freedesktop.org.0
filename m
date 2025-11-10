Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAD4C45DEA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 11:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06DD10E18A;
	Mon, 10 Nov 2025 10:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eFT2QYkg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DC510E2A2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 10:17:47 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42b3c965cc4so230239f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 02:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762769866; x=1763374666;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+cGOOrdlJvwUvrBTIxkNqf0S9KSK2YAvxzQBiD0nhFs=;
 b=eFT2QYkgolgguhBK6twBxCA8aNyik3/TUg7NxqCBY1PyB9mcw9bGVrd0/jzlL3tN4T
 m+r28OQ/QZ1PGlYYX28hMzB40KfDEx/01zUar+KjkfEM1YPNRC4kgxo9BAdiWAX3bjhK
 frewin0FeybJBOWrsuSGuRAv0cn7tEU68/IfdshrdX6NTtjk1ENZs+RTYnL33jowkthl
 H7q271P7Ix0eBxdswGMoELOxRfB4gIDZHaTRwLBAQ5H11Z+tf5A+8wOeUO9vk1nojJyB
 vBHcKdZ2FfwDlD8u0JtfNjTsAmYt8PXt9q+hanQgt3Hzg6I82lNOnIHoJW4PPJQ+h2jB
 ecIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762769866; x=1763374666;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cGOOrdlJvwUvrBTIxkNqf0S9KSK2YAvxzQBiD0nhFs=;
 b=LZ4SgszS5ZqQvlw3tqxFM7gMU4RHKSnREGBbV4gYRtBqJYm63DbtC5B76Z91kAwkfp
 erBsWEiwN8Xv903NoH0OZp1Ca5SsAnnLIcB5Lr6WwULA9h6Vzw4BZDIiM0kqNKq/PY4E
 vLODliLd6TtzrxkmwWKTkxsDEpAlU/P98EwDZlx5p0lKiejDiVF2xFg0QXGNU0Ge2w4S
 spSEacj4HG9/giLobW/oUDroXmnLagxskL4XBHxz+/cNomLKRc/LiPK90px0jgxzqI0R
 FZkt4Js/ghj7jnAJ6eqU/LFAXDvzsUeOljiyooCrzQ9AOMSnWIy0fSjmH+xPtJGESrNf
 LP5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1+JHIuj7SAVruNwfgKyPjHf0zlxeXAnHjeV0lDLb7GL4REHDYaezNmevfl3gC72Zc0SDlIhHoZ4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF2n5/OLD34V0e+nIT/zM3oj2YkpQ5xGzEMpCWngxjivwR9xhJ
 WjfbMhb3obyBCjACoG0WsZOgMnWDELtB/FFFwJttdxaxJjFtJSfaHu21yi3ZGX/LHrM=
X-Gm-Gg: ASbGnctIdmcvi3ZkW36xPS/bJq2wg3MXK46UzxpkPBBp+HGNdR7ofa6rNvvERHdaIMO
 b8LKAfXZqdCcokG5Thg7S3GUAP7RlngozmzlKpjGBtY3o/H2mYURHuyz2ul62zB1J3fmN4gXfy9
 RKB9kDR2ltGOsP9rVLi/SFT8yTf7iixxJvlJUmcDFzmLcIsdWJ77wje6qWxeXafRCaPj9kpNPoD
 6u6hDo2jfA7gLC45iXWOdhN2YXGVLH+wPiHfUv9BtdMotqyRzuwXEp7k6jbh8zyEyDebVEvnOpm
 idDz8zSfkNvt2XqY5cWHbdeLknWYhpvLyGQFpAhlThpSrkiwIk5YIxryDMMkBrQM+pJxsN7KuLD
 hr1o2/WuBMKfvBZ/Vr33CcgAw17DJo34wf7+HE13u8OyeBeW+D8x+PjWvK41sL7WupTaFfC0oI2
 bDtHz36vbA71hApuWuFwoQZKh5TfYLatYYpAELuznZ1L6fCROKtDh3kNDCCZM=
X-Google-Smtp-Source: AGHT+IGUpHSfeagdIBM88vePaTs3yIVY9gCWpK2lN42s3k1Y6AfvZPuuxOVOOc+I4rI5U6e1xXLxSw==
X-Received: by 2002:a05:6000:228a:b0:429:f088:7fb with SMTP id
 ffacd0b85a97d-42b2c655058mr7359131f8f.7.1762769866339; 
 Mon, 10 Nov 2025 02:17:46 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b2e96441dsm13918929f8f.23.2025.11.10.02.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 02:17:44 -0800 (PST)
Date: Mon, 10 Nov 2025 10:19:56 +0000
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
Message-ID: <aRG8TMqehv-oR6v1@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4a2SBDldYgQb56@aspen.lan>
 <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
 <aRG359gIeP48V2ZZ@aspen.lan>
 <59c36699-ee54-467f-9342-6756a0092a98@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59c36699-ee54-467f-9342-6756a0092a98@gocontroll.com>
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

On Mon, Nov 10, 2025 at 11:03:27AM +0100, Maud Spierings wrote:
> On 11/10/25 11:01, Daniel Thompson wrote:
> > On Mon, Nov 10, 2025 at 09:40:07AM +0100, Maud Spierings wrote:
> > > On 11/7/25 17:14, Daniel Thompson wrote:
> > > > On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > > > > +/*
> > > > > + * 1. disable unused strings
> > > > > + * 2. set dim mode
> > > > > + * 3. set initial brightness
> > > >
> > > > How does this code set the initial brightness? It doens't set the
> > > > MAX25014_TON* registers.
> > >
> > > Yep forgot to remove that, I discovered the backlight core takes care of the
> > > default brightness, so I removed it from here.
> >
> > What do you mean by this? Are you sure you aren't relying on another
> > driver to enable the backlight rather than the backlight core?
>
> Not that I know of, there is the systemd backlight service, but I am pretty
> sure I can see it first turn on, then get switched to the old value by the
> systemd service. Unless the simple-panel driver controls it? The backlight
> is linked to that.

I think you should look at the code. I think it's likely the backlight
is only coming on due to the link to simple-panel.

Normal way to handle that case (if you want to avoid the backlight
turning on "too early") is to set the power mode to BACKLIGHT_POWER_OFF
if (and only off) the backlight is linked to a panel. See
pwm_backlight_initial_power_state() for an example.

If you are relying on "the backlight core [to take] care of the default
brightness" then you have to request it in the driver (by calling
backlight_update_status() after registering the backlight).


> > > > > + * 4. set setting register
> > > > > + * 5. enable the backlight
> > > > > + */
> > > > > +static int max25014_configure(struct max25014 *maxim)
> >
> >
> > > > > +static int max25014_probe(struct i2c_client *cl)
> > > > > <snip>
> > > > > +
> > > > > +	/* Enable can be tied to vin rail wait if either is available */
> > > > > +	if (maxim->enable || maxim->vin) {
> > > > > +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> > > > > +		usleep_range(2000, 2500);
> > > > > +	}
> > > >
> > > > If you really want to keep the devm_regulator_get_optional() I guess
> > > > maybe you could persuade me it's need to avoid this sleep... although
> > > > I'd be fairly happy to remove the NULL checks here too!
> > >
> > > Just wait unconditionally?
> >
> > If you think it will be unusual for the driver to be used without enable
> > or regulator then it's ok to wait unconditionally (all examples you
> > have added so far have an enable pin).
>
> I think it may actually be a very common implementation to have the enable
> pin attached to Vin, we don't have it set up that way. But it is displayed
> that way in an example schematic in the datasheet.

Your call.


Daniel.
