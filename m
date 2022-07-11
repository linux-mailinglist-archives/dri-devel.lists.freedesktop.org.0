Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BAC57079A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884C18F45C;
	Mon, 11 Jul 2022 15:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E94F8F44D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:50:39 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id trqe2700d4C55Sk01rqe4f; Mon, 11 Jul 2022 17:50:38 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgD-0036x0-N6; Mon, 11 Jul 2022 17:50:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgC-006shU-Tl; Mon, 11 Jul 2022 17:50:36 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 04/10] video: fbdev: atari: Fix ext_setcolreg()
Date: Mon, 11 Jul 2022 17:50:28 +0200
Message-Id: <f807e1c6deedb2b819a309347295b0fd2f89c2c2.1657554353.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657554353.git.geert@linux-m68k.org>
References: <cover.1657554353.git.geert@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The red, green, and blue color values are 16-bit, while the external
graphics hardware registers are 8-bit.
Add the missing conversion from 16-bit to 8-bit.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Untested due to lack of hardware.
---
 drivers/video/fbdev/atafb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 39c3b860a797d4bc..a36cd8f1f4200dd5 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2206,6 +2206,10 @@ static int ext_setcolreg(unsigned int regno, unsigned int red,
 	if (regno > 255)
 		return 1;
 
+	red >>= 8;
+	green >>= 8;
+	blue >>= 8;
+
 	switch (external_card_type) {
 	case IS_VGA:
 		OUTB(0x3c8, regno);
-- 
2.25.1

