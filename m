Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DDD3D79B3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 17:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8A76E44A;
	Tue, 27 Jul 2021 15:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAF36E44A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 15:26:39 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 12df8879-eeef-11eb-8d1a-0050568cd888;
 Tue, 27 Jul 2021 15:26:54 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E8394194BAE;
 Tue, 27 Jul 2021 17:26:57 +0200 (CEST)
Date: Tue, 27 Jul 2021 17:26:35 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 0/5] video: fbdev: ssd1307fb: Optimizations and
 improvements
Message-ID: <YQAlq0/vmutrXCzi@ravnborg.org>
References: <20210727134730.3765898-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727134730.3765898-1-geert@linux-m68k.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,
On Tue, Jul 27, 2021 at 03:47:25PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series optimizes console operations on ssd1307fb, after the
> customary fixes and cleanups.
> 
> Currently, each screen update triggers an I2C transfer of all screen
> data, up to 1 KiB of data for a 128x64 display, which takes at least 20
> ms in Fast mode.  While many displays are smaller, and thus require less
> data to be transferred, 20 ms is still an optimistic value, as the
> actual data transfer may be much slower, especially on bitbanged I2C
> drivers.  After this series, the amount of data transfer is reduced, as
> fillrect, copyarea, and imageblit only update the rectangle that
> changed.
> 
> Changes compared to v1[1]:
>   - Add Acked-by,
>   - Use two separate helpers instead of a single combined helper,
>   - Reorder operands in DIV_ROUND_UP() to improve readability.
> 
> This has been tested on an Adafruit FeatherWing OLED with an SSD1306
> controller and a 128x32 OLED, connected to an OrangeCrab ECP5 FPGA board
> running a 64 MHz VexRiscv RISC-V softcore, where it reduced the CPU
> usage for blinking the cursor from more than 70% to ca. 10%.
> 
> Thanks for applying!
Thanks for the respin - patches are now applied to drm-misc-next.

	Sam
