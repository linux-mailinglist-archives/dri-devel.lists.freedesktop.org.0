Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A86DACDC27
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892D610E600;
	Wed,  4 Jun 2025 10:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iwt2UIhb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE20610E600
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 10:51:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA178A501B7;
 Wed,  4 Jun 2025 10:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FF2C4CEE7;
 Wed,  4 Jun 2025 10:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749034279;
 bh=UCEfnjbgjemB7iS4saU8V8U10oXHF3AzXkN2nknaRYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwt2UIhbRd8AU4xNki733+dLh8FsjWptGhN9vrPhQXVx1FGbPApH6zUYi6TyEQGM9
 l01qXdVdepzevbXPjjmhKPI5MJL3jNamFtTurnd8oUNmx3bvZIBo9CthMbYkUxMXE4
 tSl1oCwfUOinlJnJmdNVs2UAznZrSY0WFFqabbJJoHbT5Tf/ayGVSZijLo8mSmIVBA
 A3wSuAUYsTFmIu4BAqalR9NqmNR1O4he5PLGHX9F+sEiSFVa+TqFp7aK2LJUSWAW2X
 lfjaG0jkbMUowyIB8nOfQRTjGmuAPhlSVGRfQf8hU/oE3nK10gYPnlWgiO0orPMnvX
 pWsmehfU6X4lg==
Date: Wed, 4 Jun 2025 10:51:16 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Helge Deller <deller@gmx.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 Zsolt Kajtar <soci@c64.rulez.org>, stable@vger.kernel.org
Subject: Re: [PATCH] sysfb: Fix screen_info type check for VGA
Message-ID: <aEAlJMrX8VfkkVaI@google.com>
References: <20250603154838.401882-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603154838.401882-1-tzimmermann@suse.de>
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

On Tue, Jun 03, 2025 at 05:48:20PM +0200, Thomas Zimmermann wrote:
> Use the helper screen_info_video_type() to get the framebuffer
> type from struct screen_info. Handle supported values in sorted
> switch statement.
> 
> Reading orig_video_isVGA is unreliable. On most systems it is a
> VIDEO_TYPE_ constant. On some systems with VGA it is simply set
> to 1 to signal the presence of a VGA output. See vga_probe() for
> an example. Retrieving the screen_info type with the helper
> screen_info_video_type() detects these cases and returns the
> appropriate VIDEO_TYPE_ constant. For VGA, sysfb creates a device
> named "vga-framebuffer".
> 
> The sysfb code has been taken from vga16fb, where it likely didn't
> work correctly either. With this bugfix applied, vga16fb loads for
> compatible vga-framebuffer devices.
> 
> Fixes: 0db5b61e0dc0 ("fbdev/vga16fb: Create EGA/VGA devices in sysfb code")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>
> Cc: Zsolt Kajtar <soci@c64.rulez.org>
> Cc: <stable@vger.kernel.org> # v6.1+
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
