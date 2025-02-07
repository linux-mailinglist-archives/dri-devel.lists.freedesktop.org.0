Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C201A2C394
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 14:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38F210E31D;
	Fri,  7 Feb 2025 13:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OoZpBxZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E06C10E31D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 13:30:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7B1D442F5;
 Fri,  7 Feb 2025 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738935005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4uLJEtoS2PPJFMr0I1tAyocsm8P41/TMCB7vqODm0mU=;
 b=OoZpBxZVH/MaCQGmcz4JeZqJ48Oqd3LrSrTxiEnH0uO9644BdWBqRtn6n0Po58+Fu4amN0
 9bPks+EnjQIvq3wD4XxW2cxFKbMsDIWEwkA909n5rmpr5Ei5RIBdaZU7GUexzRQJ/J3AWG
 BH6BimoOaVQNFxGTsv1m65LeCDF+0G5FxUDq2+y034cUmUMlXrKLTEmWrFlme3eC1e0Ehp
 B5L1IHtZJXS/dBqZrIhdaSO4RJH4ssqOZKO4GOgub9I1Uv5PB5R4Ni5M5dUMHaoODFaCgo
 V6EEHxvUY9E8hGGTmHW6JHt0DXkS+ATUCf46+WzfEd2xk9r4TLw+hK1/HWQPeQ==
Date: Fri, 7 Feb 2025 14:30:03 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Tony Lindgren
 <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>, Tomi Valkeinen
 <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH] backlight: led_bl: Hold led_access lock when calling
 led_sysfs_disable()
Message-ID: <20250207143003.1c518df3@bootlin.com>
In-Reply-To: <20250122091914.309533-1-herve.codina@bootlin.com>
References: <20250122091914.309533-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghltheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhinhhgohhohhgrnhdusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehprghvvghlsehutgifrdgtiidprhgtphhtthhopehtohhmi
 hdrvhgrlhhkvghinhgvnhesthhirdgtohhmpdhrtghpthhtohepjhhjhhhisghlohhtsehtihdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
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

Hi Lee, Daniel, Jingoo,

On Wed, 22 Jan 2025 10:19:14 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Lockdep detects the following issue on led-backlight removal:
>   [  142.315935] ------------[ cut here ]------------
>   [  142.315954] WARNING: CPU: 2 PID: 292 at drivers/leds/led-core.c:455 led_sysfs_enable+0x54/0x80
>   ...
>   [  142.500725] Call trace:
>   [  142.503176]  led_sysfs_enable+0x54/0x80 (P)
>   [  142.507370]  led_bl_remove+0x80/0xa8 [led_bl]
>   [  142.511742]  platform_remove+0x30/0x58
>   [  142.515501]  device_remove+0x54/0x90
>   ...
> 
> Indeed, led_sysfs_enable() has to be called with the led_access
> lock held.
> 
> Hold the lock when calling led_sysfs_disable().
> 
> Fixes: ae232e45acf9 ("backlight: add led-backlight driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

I didn't receive any feedback.

v6.14-rc1 has been released since the patch was sent but the patch applies on
top of v6.14-rc1 without any issue.

Of course if really needed, I can resend the patch. Just tell me.

Best regards,
Hervé
