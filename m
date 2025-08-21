Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67882B2EB7C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 04:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA74110E0ED;
	Thu, 21 Aug 2025 02:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 468 seconds by postgrey-1.36 at gabe;
 Thu, 21 Aug 2025 02:53:59 UTC
Received: from c64.rulez.org (c64.rulez.org [79.139.58.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552A110E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 02:53:59 +0000 (UTC)
Received: by c64.rulez.org (Postfix, from userid 1000)
 id 4BB8A102AD; Thu, 21 Aug 2025 04:46:09 +0200 (CEST)
From: Zsolt Kajtar <soci@c64.rulez.org>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Zsolt Kajtar <soci@c64.rulez.org>
Subject: [PATCH] fbdev: core: fix ubsan warning in pixel_to_pat
Date: Thu, 21 Aug 2025 04:42:48 +0200
Message-Id: <20250821024248.7458-1-soci@c64.rulez.org>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It could be triggered on 32 bit big endian machines at 32 bpp in the
pattern realignment. In this case just return early as the result is
an identity.

Signed-off-by: Zsolt Kajtar <soci@c64.rulez.org>
---
 drivers/video/fbdev/core/fb_fillrect.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_fillrect.h b/drivers/video/fbdev/core/fb_fillrect.h
index 66042e534..f366670a5 100644
--- a/drivers/video/fbdev/core/fb_fillrect.h
+++ b/drivers/video/fbdev/core/fb_fillrect.h
@@ -92,8 +92,7 @@ static unsigned long pixel_to_pat(int bpp, u32 color)
 		pattern = pattern | pattern << bpp;
 		break;
 	default:
-		pattern = color;
-		break;
+		return color;
 	}
 #ifndef __LITTLE_ENDIAN
 	pattern <<= (BITS_PER_LONG % bpp);
-- 
2.30.2

