Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1639B56BEB1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048C210EBDE;
	Fri,  8 Jul 2022 18:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F2610EBE1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:54 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id siMt2700F4C55Sk01iMtsX; Fri, 08 Jul 2022 20:21:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbx-002fNi-4p; Fri, 08 Jul 2022 20:21:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbw-00BtVS-5Q; Fri, 08 Jul 2022 20:21:52 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v2 06/10] modetest: Add support for parsing big-endian
 formats
Date: Fri,  8 Jul 2022 20:21:45 +0200
Message-Id: <dd41bffb34336cec5838d88b83b9f46b01e28d4d.1657302103.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657302103.git.geert@linux-m68k.org>
References: <cover.1657302103.git.geert@linux-m68k.org>
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

When specifying a frame buffer format like "RG16be" (big-endian RG16),
modetest still uses the little-endian variant, as the format string is
truncated to four characters.

Fix this by increasing the format string size to 7 bytes (6 characters +
NUL terminator).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - New.
---
 tests/modetest/modetest.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index f70043d1e6815497..7c6c21ef5174c41a 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -821,7 +821,7 @@ struct pipe_arg {
 	unsigned int num_cons;
 	uint32_t crtc_id;
 	char mode_str[64];
-	char format_str[5];
+	char format_str[7];
 	float vrefresh;
 	unsigned int fourcc;
 	drmModeModeInfo *mode;
@@ -843,7 +843,7 @@ struct plane_arg {
 	unsigned int old_fb_id;
 	struct bo *bo;
 	struct bo *old_bo;
-	char format_str[5]; /* need to leave room for terminating \0 */
+	char format_str[7]; /* need to leave room for "be" and terminating \0 */
 	unsigned int fourcc;
 };
 
@@ -1917,8 +1917,8 @@ static int parse_connector(struct pipe_arg *pipe, const char *arg)
 	}
 
 	if (*p == '@') {
-		strncpy(pipe->format_str, p + 1, 4);
-		pipe->format_str[4] = '\0';
+		strncpy(pipe->format_str, p + 1, 6);
+		pipe->format_str[6] = '\0';
 	}
 
 	pipe->fourcc = util_format_fourcc(pipe->format_str);
@@ -1970,8 +1970,8 @@ static int parse_plane(struct plane_arg *plane, const char *p)
 	}
 
 	if (*end == '@') {
-		strncpy(plane->format_str, end + 1, 4);
-		plane->format_str[4] = '\0';
+		strncpy(plane->format_str, end + 1, 6);
+		plane->format_str[6] = '\0';
 	} else {
 		strcpy(plane->format_str, "XR24");
 	}
-- 
2.25.1

