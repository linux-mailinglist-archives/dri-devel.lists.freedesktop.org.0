Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9910F56BEB9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA5E10EC14;
	Fri,  8 Jul 2022 18:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDC410EC1D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:22:31 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id siNW2700c4C55Sk01iNWyH; Fri, 08 Jul 2022 20:22:30 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9scY-002fP0-Fp; Fri, 08 Jul 2022 20:22:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9scX-00BtXe-Uq; Fri, 08 Jul 2022 20:22:29 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] modetest: Add support for named modes containing dashes
Date: Fri,  8 Jul 2022 20:22:26 +0200
Message-Id: <509f0c272b2bf50c2bb937cf520d554ce970808e.1657302118.git.geert@linux-m68k.org>
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

It is fairly common for named video modes to contain dashes (e.g.
"tt-mid" on Atari, "dblntsc-ff" on Amiga).  Currently such mode names
are not recognized, as the dash is considered to be a separator between
mode name and vertical refrsh.

Fix this by skipping any dashes that are not followed immediately by a
digit when looking for the separator.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Please refer to [1] for related Linux DRM patches and background
information.

v2:
  - New.

[1] "[PATCH v3 00/10] drm: Add support for low-color frame buffer formats"
    https://lore.kernel.org/r/cover.1657294931.git.geert@linux-m68k.org
---
 tests/modetest/modetest.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
index 7c6c21ef5174c41a..09f026764a07aad9 100644
--- a/tests/modetest/modetest.c
+++ b/tests/modetest/modetest.c
@@ -1903,8 +1903,11 @@ static int parse_connector(struct pipe_arg *pipe, const char *arg)
 
 	arg = endp + 1;
 
-	/* Search for the vertical refresh or the format. */
+	/* Search for the vertical refresh or the format, */
+	/* The former must be followed by a number */
 	p = strpbrk(arg, "-@");
+	while (p && *p == '-' && !isdigit(p[1]))
+		p = strpbrk(p + 1, "-@");
 	if (p == NULL)
 		p = arg + strlen(arg);
 	len = min(sizeof pipe->mode_str - 1, (unsigned int)(p - arg));
-- 
2.25.1

