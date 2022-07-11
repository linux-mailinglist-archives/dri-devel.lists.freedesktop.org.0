Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3AA5707B3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1C18F3EF;
	Mon, 11 Jul 2022 15:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11DB8F3F0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:54:50 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by baptiste.telenet-ops.be with bizsmtp
 id trup2700B4C55Sk01rupBw; Mon, 11 Jul 2022 17:54:49 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvkG-00371G-Tw; Mon, 11 Jul 2022 17:54:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvkG-006sqv-GJ; Mon, 11 Jul 2022 17:54:48 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] util: Fix grey in YUV SMPTE patterns
Date: Mon, 11 Jul 2022 17:54:46 +0200
Message-Id: <d6baedf436195f6cfd6d3e81ddea5219e09d861d.1657554831.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The YUV SMPTE patterns use RGB 191/192/192 instead of 192/192/192 for
the grey color in the top color bar.

Change it to 192/192/192, to match the RGB SMPTE patterns.

Fixes: a94ee624292bff96 ("modetest: Add SMPTE test pattern")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 tests/util/pattern.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/util/pattern.c b/tests/util/pattern.c
index 158c0b160a2ee870..f28fad311ec3de11 100644
--- a/tests/util/pattern.c
+++ b/tests/util/pattern.c
@@ -162,7 +162,7 @@ static void fill_smpte_yuv_planar(const struct util_yuv_info *yuv,
 				  unsigned int height, unsigned int stride)
 {
 	const struct color_yuv colors_top[] = {
-		MAKE_YUV_601(191, 192, 192),	/* grey */
+		MAKE_YUV_601(192, 192, 192),	/* grey */
 		MAKE_YUV_601(192, 192, 0),	/* yellow */
 		MAKE_YUV_601(0, 192, 192),	/* cyan */
 		MAKE_YUV_601(0, 192, 0),	/* green */
@@ -265,7 +265,7 @@ static void fill_smpte_yuv_packed(const struct util_yuv_info *yuv, void *mem,
 				  unsigned int stride)
 {
 	const struct color_yuv colors_top[] = {
-		MAKE_YUV_601(191, 192, 192),	/* grey */
+		MAKE_YUV_601(192, 192, 192),	/* grey */
 		MAKE_YUV_601(192, 192, 0),	/* yellow */
 		MAKE_YUV_601(0, 192, 192),	/* cyan */
 		MAKE_YUV_601(0, 192, 0),	/* green */
-- 
2.25.1

