Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A897DB7EC
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639B610E288;
	Mon, 30 Oct 2023 10:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D0410E289
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:23:45 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7082:5ab3:115b:c8d0])
 by baptiste.telenet-ops.be with bizsmtp
 id 4APi2B00A1qcjVs01APi8N; Mon, 30 Oct 2023 11:23:42 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qxPQq-007p3A-SH;
 Mon, 30 Oct 2023 11:23:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qxPQs-006o5O-GS;
 Mon, 30 Oct 2023 11:23:42 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v5 5/9] modetest: add support for parsing big-endian
 formats
Date: Mon, 30 Oct 2023 11:23:32 +0100
Message-Id: <9bc9d1e0fb57060f2ead3924f0e0f942dc8ce981.1698661177.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698661177.git.geert@linux-m68k.org>
References: <cover.1698661177.git.geert@linux-m68k.org>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When specifying a frame buffer format like "RG16_BE" (big-endian RG16),
modetest still uses the little-endian variant, as the format string is
truncated to four characters.

Fix this by increasing the format string size to 8 bytes (7 characters +
NUL terminator).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v5:
  - Add Reviewed-by,

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

