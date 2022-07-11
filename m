Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99F5707B4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C67F8F4FC;
	Mon, 11 Jul 2022 15:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441138F4FB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:55:21 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by baptiste.telenet-ops.be with bizsmtp
 id trvL2700H4C55Sk01rvLGB; Mon, 11 Jul 2022 17:55:21 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvkm-00371U-Im; Mon, 11 Jul 2022 17:55:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvkl-006ssK-UF; Mon, 11 Jul 2022 17:55:19 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] modetest: Fix mode_vrefresh() for
 interlace/dblscan/vscan
Date: Mon, 11 Jul 2022 17:55:16 +0200
Message-Id: <020962e08d4ed88c332f3363cfb857dc416e987d.1657554896.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mode_vrefresh() does not take into account interlaced, doublescan, and
multiscan modes, leading to incorrect refresh rates.

Fix this, based on drm_mode_vrefresh() in Linux.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 tests/modetest/modetest.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index 8ff6c80da8ba6db6..9ceb5688f7683ffc 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -137,8 +137,19 @@ static inline int64_t U642I64(uint64_t val)
 
 static float mode_vrefresh(drmModeModeInfo *mode)
 {
-	return  mode->clock * 1000.00
-			/ (mode->htotal * mode->vtotal);
+	unsigned int num, den;
+
+	num = mode->clock;
+	den = mode->htotal * mode->vtotal;
+
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		num *= 2;
+	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
+		den *= 2;
+	if (mode->vscan > 1)
+		den *= mode->vscan;
+
+	return num * 1000.00 / den;
 }
 
 #define bit_name_fn(res)					\
-- 
2.25.1

