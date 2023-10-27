Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6493B7D9D55
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123E010E9F4;
	Fri, 27 Oct 2023 15:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EF510E9EF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 15:48:16 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a11d:fe3:b715:706f])
 by xavier.telenet-ops.be with bizsmtp
 id 33oE2B00E2Q454m013oEyA; Fri, 27 Oct 2023 17:48:14 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qwP4A-007cgg-B9;
 Fri, 27 Oct 2023 17:48:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qwP4I-00HHn5-9F;
 Fri, 27 Oct 2023 17:48:14 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v4 5/9] modetest: add support for parsing big-endian
 formats
Date: Fri, 27 Oct 2023 17:48:08 +0200
Message-Id: <0ceba194749b0a7d40e5e86ed367b7c540aa0b1e.1698416179.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698416179.git.geert@linux-m68k.org>
References: <cover.1698416179.git.geert@linux-m68k.org>
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

When specifying a frame buffer format like "RG16_BE" (big-endian RG16),
modetest still uses the little-endian variant, as the format string is
truncated to four characters.

Fix this by increasing the format string size to 8 bytes (7 characters +
NUL terminator).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v4:
  - No changes,

v3:
  - Update for suffix change from "be" to "_BE", cfr. commit
    ffb9375a505700ad ("xf86drm: handle DRM_FORMAT_BIG_ENDIAN in
    drmGetFormatName()"),
  - Replace hardcoded numbers in code by sizeof(),

v2:
  - New.
---
 tests/modetest/modetest.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index 9b1aa537be8716cf..cc96015f4a555dd3 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -817,7 +817,7 @@ struct pipe_arg {
 	unsigned int num_cons;
 	uint32_t crtc_id;
 	char mode_str[64];
-	char format_str[5];
+	char format_str[8]; /* need to leave room for "_BE" and terminating \0 */
 	float vrefresh;
 	unsigned int fourcc;
 	drmModeModeInfo *mode;
@@ -841,7 +841,7 @@ struct plane_arg {
 	unsigned int old_fb_id;
 	struct bo *bo;
 	struct bo *old_bo;
-	char format_str[5]; /* need to leave room for terminating \0 */
+	char format_str[8]; /* need to leave room for "_BE" and terminating \0 */
 	unsigned int fourcc;
 };
 
@@ -2032,8 +2032,9 @@ static int parse_connector(struct pipe_arg *pipe, const char *arg)
 	}
 
 	if (*p == '@') {
-		strncpy(pipe->format_str, p + 1, 4);
-		pipe->format_str[4] = '\0';
+		len = sizeof(pipe->format_str) - 1;
+		strncpy(pipe->format_str, p + 1, len);
+		pipe->format_str[len] = '\0';
 	}
 
 	pipe->fourcc = util_format_fourcc(pipe->format_str);
@@ -2047,6 +2048,7 @@ static int parse_connector(struct pipe_arg *pipe, const char *arg)
 
 static int parse_plane(struct plane_arg *plane, const char *p)
 {
+	unsigned int len;
 	char *end;
 
 	plane->plane_id = strtoul(p, &end, 10);
@@ -2085,8 +2087,9 @@ static int parse_plane(struct plane_arg *plane, const char *p)
 	}
 
 	if (*end == '@') {
-		strncpy(plane->format_str, end + 1, 4);
-		plane->format_str[4] = '\0';
+		len = sizeof(plane->format_str) - 1;
+		strncpy(plane->format_str, end + 1, len);
+		plane->format_str[len] = '\0';
 	} else {
 		strcpy(plane->format_str, "XR24");
 	}
-- 
2.34.1

