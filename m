Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58052A5FC9A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 17:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C632810E8F3;
	Thu, 13 Mar 2025 16:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R5CTubo1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5147E10E8F5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 16:51:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C3FE1A477C4;
 Thu, 13 Mar 2025 16:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790F2C4CEDD;
 Thu, 13 Mar 2025 16:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741884716;
 bh=3By9eSGkfs1OocLuxqTAkYFCwAaFekwTeLaEzkR5MFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R5CTubo102Ea9x3jFPg4R2esDt5NDpMcacotXLl5Rk7XZjf7jWM0euGtmzy/VaR4h
 owngy/DiIUS4uzNHx9R+2TztXmwI96F25Wl4Jxd3gw4BIsRdmbQNT18L9ju2TXrwZa
 X39nB1IVa1iy31WiOojIY27Fs5wSgw1KCwJV19zt8HWPYLNMLt9IKhs+6TxoqTxw6w
 sBr+OA2/K7XPYAH0xRlmzv09GWkiFIN5miGqC4QBcY3We4XcXtEYvY3CHMxX5uUoHC
 khlKlMmDPUQJG3wzqZJokKIommY/DFaJEmeq8MopYrDL5jX7FVkRb3Y9hdyJVCg7dp
 5rjgTby9aOtYA==
Date: Thu, 13 Mar 2025 16:51:51 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 00/11] backlight, lcd, led: Remove fbdev dependencies
Message-ID: <20250313165151.GE3645863@google.com>
References: <20250306140947.580324-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250306140947.580324-1-tzimmermann@suse.de>
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

On Thu, 06 Mar 2025, Thomas Zimmermann wrote:

> This series removes the remaining dependencies on fbdev from the
> backlight, lcd and led subsystems. Each depends on fbdev events to
> track display state. Make fbdev inform each subsystem via a dedicated
> interface instead.
> 
> Patches 1 to 3 make fbdev track blank state for each display, so that
> backlight code doesn't have to.
> 
> Patches 4 to 6 remove fbdev event handling from backlight code. Patches
> 7 and 8 remove fbdev event handling from lcd code and patches 9 and 10
> do the same for led's backlight trigger.
> 
> The final patch removes the event constants from fbdev.
> 
> With the series applied, the three subsystems do no longer depend on
> fbdev. It's also a clean up for fbdev. Fbdev used to send out a large
> number of events. That mechanism has been deprecated for some time and
> converted call to dedicated functions instead.
> 
> Testing is very welcome, as I don't have the hardware to test this
> series.
> 
> v3:
> - export several symbols
> - static-inline declare empty placeholders
> v2:
> - avoid IS_REACHABLE() in source file (Lee)
> - simplify several interfaces and helpers
> - use lock guards
> - initialize global lists and mutices
> 
> Thomas Zimmermann (11):
>   fbdev: Rework fb_blank()
>   fbdev: Track display blanking state
>   fbdev: Send old blank state in FB_EVENT_BLANK
>   backlight: Implement fbdev tracking with blank state from event
>   backlight: Move blank-state handling into helper
>   backlight: Replace fb events with a dedicated function call
>   backlight: lcd: Move event handling into helpers
>   backlight: lcd: Replace fb events with a dedicated function call
>   leds: backlight trigger: Move blank-state handling into helper
>   leds: backlight trigger: Replace fb events with a dedicated function
>     call
>   fbdev: Remove constants of unused events
> 
>  drivers/leds/trigger/ledtrig-backlight.c |  48 +++++-----
>  drivers/video/backlight/backlight.c      |  93 +++++--------------
>  drivers/video/backlight/lcd.c            | 108 +++++++++--------------
>  drivers/video/fbdev/core/fb_backlight.c  |  12 +++
>  drivers/video/fbdev/core/fb_info.c       |   1 +
>  drivers/video/fbdev/core/fbmem.c         |  82 ++++++++++++++---
>  drivers/video/fbdev/core/fbsysfs.c       |   8 +-
>  include/linux/backlight.h                |  22 ++---
>  include/linux/fb.h                       |  12 +--
>  include/linux/lcd.h                      |  21 ++++-
>  include/linux/leds.h                     |   6 ++
>  11 files changed, 205 insertions(+), 208 deletions(-)

No immediately obvious issues from the LEDs side.

Still needs reviews from Backlight and fbdev.

-- 
Lee Jones [李琼斯]
