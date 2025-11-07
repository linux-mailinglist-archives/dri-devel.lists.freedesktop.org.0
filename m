Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4476CC406B1
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812C310EAEF;
	Fri,  7 Nov 2025 14:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="IAedv59e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E05910EAFC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:49:22 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso791635f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 06:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762526961; x=1763131761;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RUD1Jd43ZASIpcsxuX1N2ssGIFWOzPtdxIFtmeCDnJw=;
 b=IAedv59eotz8HlwkzJkiLjFW2IL8q6tF6nWfWUw2nAJXPleoC5T9kFyHk9IZqy8obO
 gg+tZYiJpRUqEvGR351xXReKXfA8OuQRcYXQOKXwvTJv+Bg1brKPsZJeOujzFTWBBgf2
 VSVIohYqg7Nwc6OzNt64EY77ED5+xHq5fKj3Rc07tJbp6YMFboMVdLovlwzXvkQcRVYJ
 pM3JtKQVYazxA12dwzfVkGyPTZmo51/8Tz8PIGJ4++663prOrJ8uvzKdjCiFRHH0HXY0
 Xfte80P9XB1uyTKDLDb3Y01cWgRaiqUQ7ZoAgxBINyVBAWlc2o48Mp8pkybcxquE7dNX
 T74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762526961; x=1763131761;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RUD1Jd43ZASIpcsxuX1N2ssGIFWOzPtdxIFtmeCDnJw=;
 b=gPFr7q7S/uJL6bY4b45LENtE7rj5SG+CxBso2RLwmOOzCxQF7S+1D900GqGTc/eiTM
 WrnDNnGxr9Ffxrx/YnxMnbZP9AwhszeURka86cuu56nf4AjjGgnrdrUUbVOZERsxDtQ1
 HMeZZspyVUQtGDeUovj+VqE8Ci0HScrWer0SSj5i9SSnMljk3McZadC0sEOQNBFhNq65
 AHutbnP2qDtNyDRgguuykmXLPl77Qr5DFB8xmPAS5SRbLIyi9fIl5PweMTO1DBeu1cOl
 4V4u+iC2wBCk7aVIQEaHn9ig3+QdXZB+voNgj7fYUIynS4pu2UbsyAk54O/5zaqruQop
 pwFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqeBNxbS3W656jASYGbBgyia6HTVwUyI95pK3Pmhn5Ps1DkQEf3OaGAmwXH/f6aiM3LXu2qNoB5xU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7mjqso2II8xCoMmTZdAsmk9byTNLLUzXT/mMDAByltGQBNPun
 t2xETIsfjlMNj2JLN2BH5m8hYNReskR2dxIjZd68N7lqaQuvTqL5jZ6PDdpy4vbskNQ=
X-Gm-Gg: ASbGncvrq1dfn2s6SziWKylMJGSAxBxnBa7jy0rafF9QAAyqD9nSBtopWxEYXsh+TDE
 b9ZW1kGkmfULzZIELTtSvveabKhIRFpD9alljUEuDh4TWZwhGI0TR/aBrdXSdxQN5I2N4WjgmPt
 cJGq0fvcBcStBcqz0jYt5mkLmkFmp9PSgqaoIj34kUUFcQ77AQlTw1g+Xg0qLb8/J3ZitePX7hl
 TZPVWm+ieF7w1w68VVnZFkIdN7idXpRqQI9ADzM48hGa/yrr8ZwYCcRsZoJ65bIM0X3LkFbJ4IU
 uGIMn6NLpjC8h6BIynGqpRJ15UB1oAHTqHqmzTLNzFJSA8QTc2htRTl5sbjAFKpzHeK4yKWh1T0
 Kkj21fMpNOL9ILQTsLM9jRDlTF90UlICqaRY24tuIxe0WB3ciWDNI+pwFFnqFC0p/+OrCEeEcAM
 QBz/gflTjcLgdkhqDySDgzUGgWV5fqy8kADTQvlpFyFQAPPF7riZpqCBEj6zU=
X-Google-Smtp-Source: AGHT+IGVSynVCb+VhjrR6Z2aEb6MRhX4htxmgyYFU/R10GQ6nAy3fDU1kADzW8iu4OBmJz15vaN2pw==
X-Received: by 2002:a05:6000:200d:b0:427:454:43b4 with SMTP id
 ffacd0b85a97d-42ae5ae8448mr2952999f8f.48.1762526960292; 
 Fri, 07 Nov 2025 06:49:20 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe62bf40sm5596030f8f.9.2025.11.07.06.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 06:49:19 -0800 (PST)
Date: Fri, 7 Nov 2025 14:51:15 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, Lee Jones <lee@kernel.org>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pengutronix <kernel@pengutronix.de>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: apply the initial backlight state
 with sane defaults
Message-ID: <aQ4HY5Hncv1fvxVk@aspen.lan>
References: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
 <aQNRK5ksNDMMve0x@aspen.lan>
 <t6wtfnmnclnzwdpbmdcalvyf3mulmpexnryolxkygqkpx7vdwz@dqwbwvlzawrr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <t6wtfnmnclnzwdpbmdcalvyf3mulmpexnryolxkygqkpx7vdwz@dqwbwvlzawrr>
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

On Fri, Nov 07, 2025 at 09:00:33AM +0100, Uwe Kleine-König wrote:
> On Thu, Oct 30, 2025 at 11:51:07AM +0000, Daniel Thompson wrote:
> > On Thu, Jul 31, 2025 at 10:47:18AM +0200, Michael Grzeschik wrote:
> > > Currently when calling pwm_apply_might_sleep in the probe routine
> > > the pwm will be configured with an not fully defined state.
> > >
> > > The duty_cycle is not yet set in that moment. There is a final
> > > backlight_update_status call that will have a properly setup state.
> > > However this change in the backlight can create a short flicker if the
> > > backlight was already preinitialised.
> > >
> > > We fix the flicker by moving the pwm_apply after the default duty_cycle
> > > can be calculated.
> > >
> > > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> >
> > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
>
> I guess this tag resulted in Lee picking up the change. I wonder if you
> share my concern and who's responsibility it is now to address it.

You mean the ordering the backlight registration versus setting the
properties in the probe method?

I definitely share the concern that there's a short window where
something could request a brightness via sysfs and then have it
overwritten by the remains of the probe method. Likewise I can't see
why there would be any problem moving the call to
pwm_backlight_initial_power_state() before the backlight is registered.
Thus I'd be happy to see the backlight registered later in the probe
method.

On the other hand I don't see any problem calling
backlight_update_status() from the probe method. This is a relatively
common approach in backlight drivers to impose the initial brightness
on the hardware without needing extra code paths.
backlight_update_status() is guarded with a mutex and should be
idempotent for most drivers. Therefore it is OK even if something gets
in via sysfs and provokes an update before the probe method has started
it's own update.

In terms of who should follow up I've got no strong opinions on that.
It's worth noting that I don't own any hardware that uses a PWM
backlight so I'm not in a position to test it!


Daniel.
