Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8203B3D775A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 15:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711D26E993;
	Tue, 27 Jul 2021 13:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6E96E8FA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:47:38 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b0a9:7e88:5ca4:551a])
 by xavier.telenet-ops.be with bizsmtp
 id aDnb250021fSPfK01Dnbz1; Tue, 27 Jul 2021 15:47:37 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m8NQk-001Pbz-Ll; Tue, 27 Jul 2021 15:47:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m8NQk-00Fnh8-9y; Tue, 27 Jul 2021 15:47:34 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Sam Ravnborg <sam@ravnborg.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/5] video: fbdev: ssd1307fb: Optimizations and improvements
Date: Tue, 27 Jul 2021 15:47:25 +0200
Message-Id: <20210727134730.3765898-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

This patch series optimizes console operations on ssd1307fb, after the
customary fixes and cleanups.

Currently, each screen update triggers an I2C transfer of all screen
data, up to 1 KiB of data for a 128x64 display, which takes at least 20
ms in Fast mode.  While many displays are smaller, and thus require less
data to be transferred, 20 ms is still an optimistic value, as the
actual data transfer may be much slower, especially on bitbanged I2C
drivers.  After this series, the amount of data transfer is reduced, as
fillrect, copyarea, and imageblit only update the rectangle that
changed.

Changes compared to v1[1]:
  - Add Acked-by,
  - Use two separate helpers instead of a single combined helper,
  - Reorder operands in DIV_ROUND_UP() to improve readability.

This has been tested on an Adafruit FeatherWing OLED with an SSD1306
controller and a 128x32 OLED, connected to an OrangeCrab ECP5 FPGA board
running a 64 MHz VexRiscv RISC-V softcore, where it reduced the CPU
usage for blinking the cursor from more than 70% to ca. 10%.

Thanks for applying!

[1] https://lore.kernel.org/dri-devel/20210714145804.2530727-1-geert@linux-m68k.org

Geert Uytterhoeven (5):
  video: fbdev: ssd1307fb: Propagate errors via
    ssd1307fb_update_display()
  video: fbdev: ssd1307fb: Simplify ssd1307fb_update_display()
  video: fbdev: ssd1307fb: Extract ssd1307fb_set_{col,page}_range()
  video: fbdev: ssd1307fb: Optimize screen updates
  video: fbdev: ssd1307fb: Cache address ranges

 drivers/video/fbdev/ssd1307fb.c | 151 ++++++++++++++++++++++----------
 1 file changed, 104 insertions(+), 47 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
