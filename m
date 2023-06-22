Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B389739CF5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 11:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC67B10E507;
	Thu, 22 Jun 2023 09:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055E810E50B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 09:28:51 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
 by laurent.telenet-ops.be with bizsmtp
 id C9Uq2A00B1yfRTD019Uqq2; Thu, 22 Jun 2023 11:28:50 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGcS-000Byz-IC;
 Thu, 22 Jun 2023 11:28:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qCGcU-003W5Y-50;
 Thu, 22 Jun 2023 11:28:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] fbdev: sh_mobile_lcdcfb: Fix ARGB32 overlay format typo
Date: Thu, 22 Jun 2023 11:28:48 +0200
Message-Id: <a48665d08e6d4d2bbbff1d53aab06dfeb19136f4.1687426052.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-renesas-soc@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When configurating a CHn Source Image Format Register (LDBBSIFR), one
should use the corresponding LDBBSIFR_RPKF_* definition for overlay
planes, not the DDFR_PKF_* definition for the primary plane.

Fortunately both definitions resolve to the same value, so this bug did
not cause any harm.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 093f035d12463a80..0adb2ba965e7120d 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -824,7 +824,7 @@ static void sh_mobile_lcdc_overlay_setup(struct sh_mobile_lcdc_overlay *ovl)
 		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDBBSIFR_RPKF_RGB24;
 		break;
 	case V4L2_PIX_FMT_BGR32:
-		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
+		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDBBSIFR_RPKF_ARGB32;
 		break;
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV21:
-- 
2.34.1

