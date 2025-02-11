Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C9A30DD9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 15:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B3710E2F8;
	Tue, 11 Feb 2025 14:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zqm4MJiI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E4610E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 14:12:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87AF5A40451;
 Tue, 11 Feb 2025 14:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C21C4CEDD;
 Tue, 11 Feb 2025 14:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739283173;
 bh=mKSUCR+IxE2qXFtP516xYX1WLmqPO++UTOjw4oSFExU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Zqm4MJiIkFFoWcKdN3F0zazpM02h7BwB8rgHvGPCSG4u52Eb1rUEc70R1Wa1b9dlu
 1D1lqWnIUeYrB3TsjWc9qKX9r8rmQ3oG9+XeB5FSaWaFxGvIu+lG4V+DV+2yhWBl8d
 HI5mdo5/OY7qx3UBTtn1w1OCaDrkGRXdF7YbBtNPDTbiwJCRPzAUXqYYzKE2XnUYic
 +MxdOdwWNQP6UwEkZVKU8o9GlFV/JYwJl3ZP5lJ7s3NjaRNGgyenpo2/hmnbDi73oL
 vOyrrkx2Be2TGovr6cUYn0OZMrjjms2FJSCWZ9R0kA6Cb2r7d5Q42WDvppnkZUzLu3
 J+YqE/RwSDm2Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Jean-Jacques Hiblot <jjhiblot@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, stable@vger.kernel.org
In-Reply-To: <20250122091914.309533-1-herve.codina@bootlin.com>
References: <20250122091914.309533-1-herve.codina@bootlin.com>
Subject: Re: (subset) [PATCH] backlight: led_bl: Hold led_access lock when
 calling led_sysfs_disable()
Message-Id: <173928317062.2187723.11690130605159710532.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 14:12:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
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

On Wed, 22 Jan 2025 10:19:14 +0100, Herve Codina wrote:
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
> [...]

Applied, thanks!

[1/1] backlight: led_bl: Hold led_access lock when calling led_sysfs_disable()
      commit: 276822a00db3c1061382b41e72cafc09d6a0ec30

--
Lee Jones [李琼斯]

