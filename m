Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C088D1D76
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 15:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EDE11228F;
	Tue, 28 May 2024 13:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WgDihtUv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB4D11228F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 13:50:15 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52388d9ca98so1458992e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716904213; x=1717509013; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+YOjKZxiHniPt2FbhVxoFXUUn7j1oHntVdmo/lNO0HI=;
 b=WgDihtUvnPO61DlMTF07r4Id6koA6uqYcQKaqdG10DF6phbdXzKw7tB5Q59smEfjtv
 d/C2ewBXzaTVjmg2jMFg1fif1C9uCUoLXMruQhLj7wlGmTgLLPle0H6+87gzvmHjGEVB
 eR/OL3JQfgH3NdTzoPOFuIYjuho/yFCwDLXgiv7JSeKSu/GqHi3324EMVPqUV/XSHG7+
 MmccgPQhUY95eJ0yE1fvvqzBSU2Yi9HSfunL7F28Y3Jf3fbL5NSPmnx2yxMoQDUi6Tym
 OBwK7aFloCgr2wDFm7AC9hnliCx5FqE4Gcx7nNmGgLz+Yj3yyT2ecdRRGnjveKwrJivk
 xMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716904213; x=1717509013;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+YOjKZxiHniPt2FbhVxoFXUUn7j1oHntVdmo/lNO0HI=;
 b=n8NCeA8n2iVKwGJBpD0zo1cCmAoSNSSGqs8KrJ1FvNJJJZu6OrHOD7ae23a3L6xtgq
 Zo847oTCmGBpi5Vx+ji0H2yGFHD8N9J2la7LOHnoJ8dCDVwBO225DINl2mZM0RtcbthV
 3P5MGKAfhfDkkhYdqSHBivEzZIAFhgP9EntdL2K0TEmKI95tCIyBh61308nweFmgCxq6
 r8ny5iGHz2aUsUI6hrmc7cwRYDS1Sv/bmgc74HKxaqrhlQ1ylW1JzybWjYXhJSoZ2opY
 OZWp6I0rKLF+OLTLSQyAeqi7xWKixEuPXxu0fV+j5er2MMQYeo39/IGbQsWlBXLrwh9R
 ok3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLirklATyjnAyVmQc6XW+t3ess/R9In+d3BvsOguZ6Do+FR4QS9rkyb/USa77+uyyKk6LrqJD7sxDFsJJlLB3pybSSHBKq5P6d0PQoXacM
X-Gm-Message-State: AOJu0YzJ6nzOL+cXvgI4LSAoK3pKArEch0cov8AofixvUKNQ6wUdsJkW
 lEaBHb+GWDe4ZRUMIuhE43pQ3nozUh7nLD9x0BRwe5XlWtaxuqigD7nreHU3vU8=
X-Google-Smtp-Source: AGHT+IEYdENVELxM1Ej78vo7fOdCUMMC32ELkIDmnKyQ4bpI8/w9kVUIb1v5HVJnEKodMA4+swLpiw==
X-Received: by 2002:ac2:5111:0:b0:523:772c:2c1c with SMTP id
 2adb3069b0e04-52966005f5emr9200307e87.38.1716904212845; 
 Tue, 28 May 2024 06:50:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529712f1f42sm976495e87.280.2024.05.28.06.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 06:50:12 -0700 (PDT)
Date: Tue, 28 May 2024 16:50:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Arnaud Vrac <avrac@freebox.fr>, Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v1] drm/bridge: simple-bridge: Add support for TI TDP158
Message-ID: <3tiuyvc2bg3d3wz3eqrou3ngkpb3h5gamtocv74bfkkqty4qag@it5publzvl5z>
References: <d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr>
 <20240528-potoo-of-pragmatic-tempering-df08f1@houat>
 <0cd0136a-bbaf-482f-8e81-a858a6cdce2e@freebox.fr>
 <20240528-prophetic-masterful-hyrax-563f82@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528-prophetic-masterful-hyrax-563f82@houat>
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

On Tue, May 28, 2024 at 11:17:56AM +0200, Maxime Ripard wrote:
> On Tue, May 28, 2024 at 10:05:50AM GMT, Arnaud Vrac wrote:
> > On 28/05/2024 09:43, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Mon, May 27, 2024 at 06:03:56PM GMT, Marc Gonzalez wrote:
> > > > From: Arnaud Vrac <avrac@freebox.fr>
> > > > 
> > > > The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
> > > > DVI 1.0 and HDMI 1.4b and 2.0b output signals.
> > > > 
> > > > Since it's an I2C-programmable bridge, it could have a proper driver,
> > > > but the default settings work fine, thus simple bridge is sufficient.
> > > 
> > > No it doesn't. That bridge supports HDMI 2.0 which means you'll need to
> > > change the TMDS clock ratio when programming a TMDS character rate
> > > higher than 340MHz. And you'll need hotplug support to deal with it
> > > properly too.
> > > 
> > > So sorry, you need a real driver there.
> > 
> > Hello, this is an HDMI redriver, which simply cleans up the HDMI
> > signal, so no programming is needed to support HDMI 2.0.
> 
> I mean, if I'm to trust the datasheet, it is more complicated than that.
> It snoops the DDC bus so it can update the TMDS clock ratio bit if it's
> sent on its input side, but that wouldn't happen with DP for example.

If I understand correctly, this chip can work in two modes: dummy and
I2C-programmed. In the former case it is fully transparent, including
HPD passthrough, it doesn't require any additional programming, just
Vcc, Vdd and pin straps, etc.  And the second mode is a 'brainy' one,
when the chip is fully controlled over I2C.

From the Linux standpoint these two modes will use single compat string,
but two distinct drivers: for the former mode is is enough to use
simple-bridge (fixed to support two supplies), while the latter one
needs a proper I2C driver.

Does that solve your concern?

-- 
With best wishes
Dmitry
