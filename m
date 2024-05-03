Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7422D8BA776
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 09:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9660E10E6D8;
	Fri,  3 May 2024 07:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sRTyb8do";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CEB10F799
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 07:15:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7E0F1CE17E1;
 Fri,  3 May 2024 07:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E93C116B1;
 Fri,  3 May 2024 07:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714720042;
 bh=qxJUpV3gcX4/29yYO+koZ314peU2n/kHV9AlfZoyi5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sRTyb8dogQOZnKoJuQbHnsuaxIkRgxDoZmBwsgYyXQsyLYKkt57pVLa7iEqIJ44yG
 K7LvKmqylnQSQfzAaX+uccVS91DLtR6uRMDbGrav0s+QQXsmOHfiMB7pGJiMrv+Btl
 aWQTZaSm77pk7P5cYvj8oYof96lxwl9yZU4YIlk2bX9j/URqQmr+YO9lZ+vHO4Snxg
 W2Z0wzqdYB48whz22KMOoyu2VnnocvXskeH57lFaEtyfzks2tOBYWDxtHHUTbyHVTt
 kor8i4kqqg9MJmGNagrNKcM1K/PxLzeZ9SHMgGm9FvqGpaje38IXh7CDd0rIX90YVP
 Aa70vh6LNaRZQ==
Date: Fri, 3 May 2024 08:07:17 +0100
From: Lee Jones <lee@kernel.org>
To: FLAVIO SULIGOI <f.suligoi@asem.it>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: EXTERNAL: Re: (subset) [PATCH v1 1/1] backlight: mp3309c: fix
 leds flickering in pwm mode
Message-ID: <20240503070717.GB1227636@google.com>
References: <20240417153105.1794134-1-f.suligoi@asem.it>
 <20240417153105.1794134-2-f.suligoi@asem.it>
 <171466849494.1206441.17324969195592920195.b4-ty@kernel.org>
 <20240502164853.GB1200070@google.com>
 <PH0PR22MB37891FE6DC843E8EF05BDF7DFA1F2@PH0PR22MB3789.namprd22.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH0PR22MB37891FE6DC843E8EF05BDF7DFA1F2@PH0PR22MB3789.namprd22.prod.outlook.com>
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

On Fri, 03 May 2024, FLAVIO SULIGOI wrote:

> Hi Lee,
> 
> ...
> 
> > Subject: EXTERNAL: Re: (subset) [PATCH v1 1/1] backlight: mp3309c: fix
> > leds flickering in pwm mode
> > 
> > [Use caution with links & attachments]
> > 
> > 
> > 
> > On Thu, 02 May 2024, Lee Jones wrote:
> > 
> > > On Wed, 17 Apr 2024 17:31:05 +0200, Flavio Suligoi wrote:
> > > > The mp3309 has two configuration registers, named according to their
> > > > address (0x00 and 0x01).
> > > > In the second register (0x01), the bit DIMS (Dimming Mode Select)
> > > > must be always 0 (zero), in both analog (via i2c commands) and pwm
> > > > dimming mode.
> > > >
> > > > In the initial driver version, the DIMS bit was set in pwm mode and
> > > > reset in analog mode.
> > > > But if the DIMS bit is set in pwm dimming mode and other devices are
> > > > connected on the same i2c bus, every i2c commands on the bus
> > > > generates a flickering on the LEDs powered by the mp3309c.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/1] backlight: mp3309c: fix leds flickering in pwm mode
> > >       commit: ce60cddc2abf61902dfca71d630624db95315124
> > 
> > Applied, but in future it's; I2C, PWM and LED, thanks.
> 
> Sorry for my question, but do you mean that I also have to add the I2C,
> PWM and LED mailing lists in my messages related to the mp33309c patches?

Just use proper capitalisation when you abbreviate the names these
subsystems please.

-- 
Lee Jones [李琼斯]
