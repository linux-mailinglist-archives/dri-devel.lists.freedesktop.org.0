Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C2A07E7F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 18:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D33810EEEC;
	Thu,  9 Jan 2025 17:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NDNegEXI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9989610EEE7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 17:15:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 05C13A42464;
 Thu,  9 Jan 2025 17:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC03FC4CEE1;
 Thu,  9 Jan 2025 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736442930;
 bh=3HlqvF1gFu/ouXfon4HTvBR/I+5OhI7gGNbobwdgUWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NDNegEXI702D2udL3wNx6CfldwqoekpJ2rRwAlWiJZl095k7XoTxDBhSQXF17ZTp6
 h65IjeIkUPFLVw9bmIgOPGTd3qwxMvJjOi0g8Rwuy/M2AkspSsalZQ6huOJ+pu2ceF
 q2ElZ2DKDYYMVBhWCGepZq0fwbrfbymYQAxWCwvh5cXtxRVgQF4baSl0uOiH6yrQ9m
 UMAyDai6PXmC9YGgjFVqLE4C60uVGnysbpYQtn+4vBI+f6tvfx+rJ0Jbw+dU2t/Tdd
 5DwvMFWZjsIGf9avahbyqhKU/md38tyBY77AvAI41PmcPZtXJYF7aI+3wsNvWHh166
 n8LZa9iQx7+aQ==
Date: Thu, 9 Jan 2025 17:15:23 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <Z4AEK1LzFeR1DnPk@aspen.lan>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-3-towinchenmi@gmail.com>
 <Z35Y9rzS6tLVgsRo@aspen.lan>
 <ad3cbf5a-6322-4256-9284-f739d4c3aa45@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad3cbf5a-6322-4256-9284-f739d4c3aa45@gmail.com>
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

On Thu, Jan 09, 2025 at 11:52:56PM +0800, Nick Chan wrote:
>
> Daniel Thompson 於 2025/1/8 下晝6:52 寫道:
> > On Wed, Dec 11, 2024 at 07:34:38PM +0800, Nick Chan wrote:
> >> Add driver for backlight controllers attached via Apple DWI 2-wire
> >> interface, which is found on some Apple iPhones, iPads and iPod touches
> >> with a LCD display.
> >>
> >> Although there is an existing apple_bl driver, it is for backlight
> >> controllers on Intel Macs attached via PCI, which is completely different
> >> from the Samsung-derived DWI block.
> >>
> >> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> >> ---
> >>  drivers/video/backlight/Kconfig  |  12 +++
> >>  drivers/video/backlight/Makefile |   1 +
> >>  drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++
> > I'd rather this was called apple_dwi_bl.c to match that config options,
> > etc.
> Still trying to determine the type of the backlight control, I think
> it is linear however and I will send a new version when I am more
> certain.

If you've got an physicalinstance of the backlight then you can get a
general idea by comparing levels: 512, 1024, 1536 and 2047.

A linear backlight will feel make the gaps feel uneven (e.g. the
difference between 1536 and 2047 will look very different to the
difference difference between 512 and 1024). A logarithmic backligt
will make the perceived brightness intervals between the above all
feel pretty similar.


Daniel.
