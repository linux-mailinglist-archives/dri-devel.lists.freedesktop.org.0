Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A00C929CF63
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 11:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C85A6E09C;
	Wed, 28 Oct 2020 10:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.codeweavers.com (mail.codeweavers.com [50.203.203.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D006E09C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 10:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Nz/iRdy9kd+9psMnMTqsojf4xuuX3dsb0mdKOh+BRo=; b=tmz8Vv3ecuD+BFkIA/rUvwRB0c
 cq2V8fmVGwTL8oKJtVhqyNASfNDFTuzIf39C6rTOl48r7QsS1i1+GGeB8rdDw4gYDevwdw/Whc33H
 7vFg03LywChQjPQRs4FP7pdo53raOL+o5lT877blKk+pVxZ9CC4J0EY259itcaQ4pN9c=;
Received: from [10.69.141.123] (helo=dell.localdomain)
 by mail.codeweavers.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <pgofman@codeweavers.com>)
 id 1kXiLP-0006Qe-IU; Wed, 28 Oct 2020 05:06:17 -0500
From: Paul Gofman <pgofman@codeweavers.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 1/2] include: Factor out log2_int() function.
Date: Wed, 28 Oct 2020 13:06:01 +0300
Message-Id: <20201028100602.168752-1-pgofman@codeweavers.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Spam-Score: -40.4
X-Spam-Report: Spam detection software,
 running on the system "mail.codeweavers.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Paul Gofman <pgofman@codeweavers.com> ---
 radeon/radeon_surface.c
 | 20 + util_math.h | 14 ++++++++++++++ xf86drm.c | 16 3 files changed, 15
 insertion [...] 
 Content analysis details:   (-40.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 USER_IN_WELCOMELIST    user is listed in 'welcomelist_from'
 -20 USER_IN_WHITELIST      DEPRECATED: See USER_IN_WELCOMELIST
 -20 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.5 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
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
Cc: Paul Gofman <pgofman@codeweavers.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Paul Gofman <pgofman@codeweavers.com>
---
 radeon/radeon_surface.c | 20 +-------------------
 util_math.h             | 14 ++++++++++++++
 xf86drm.c               | 16 ----------------
 3 files changed, 15 insertions(+), 35 deletions(-)

diff --git a/radeon/radeon_surface.c b/radeon/radeon_surface.c
index ea0a27a9..c59dcc83 100644
--- a/radeon/radeon_surface.c
+++ b/radeon/radeon_surface.c
@@ -38,6 +38,7 @@
 #include "xf86drm.h"
 #include "radeon_drm.h"
 #include "radeon_surface.h"
+#include "util_math.h"
 
 #define CIK_TILE_MODE_COLOR_2D			14
 #define CIK_TILE_MODE_COLOR_2D_SCANOUT		10
@@ -47,10 +48,6 @@
 #define CIK_TILE_MODE_DEPTH_STENCIL_2D_TILESPLIT_512      3
 #define CIK_TILE_MODE_DEPTH_STENCIL_2D_TILESPLIT_ROW_SIZE 4
 
-#define ALIGN(value, alignment) (((value) + alignment - 1) & ~(alignment - 1))
-#define MAX2(A, B)              ((A) > (B) ? (A) : (B))
-#define MIN2(A, B)              ((A) < (B) ? (A) : (B))
-
 /* keep this private */
 enum radeon_family {
     CHIP_UNKNOWN,
@@ -887,21 +884,6 @@ static int eg_surface_init(struct radeon_surface_manager *surf_man,
     return r;
 }
 
-static unsigned log2_int(unsigned x)
-{
-    unsigned l;
-
-    if (x < 2) {
-        return 0;
-    }
-    for (l = 2; ; l++) {
-        if ((unsigned)(1 << l) > x) {
-            return l - 1;
-        }
-    }
-    return 0;
-}
-
 /* compute best tile_split, bankw, bankh, mtilea
  * depending on surface
  */
diff --git a/util_math.h b/util_math.h
index 35bf4512..e2fa95f5 100644
--- a/util_math.h
+++ b/util_math.h
@@ -31,4 +31,18 @@
 #define __align_mask(value, mask)  (((value) + (mask)) & ~(mask))
 #define ALIGN(value, alignment)    __align_mask(value, (__typeof__(value))((alignment) - 1))
 
+static inline unsigned log2_int(unsigned x)
+{
+    unsigned l;
+
+    if (x < 2) {
+        return 0;
+    }
+    for (l = 2; ; l++) {
+        if ((unsigned)(1 << l) > x) {
+            return l - 1;
+        }
+    }
+    return 0;
+}
 #endif /*_UTIL_MATH_H_*/
diff --git a/xf86drm.c b/xf86drm.c
index dbb7c14b..ca4738e1 100644
--- a/xf86drm.c
+++ b/xf86drm.c
@@ -124,22 +124,6 @@ static drmServerInfoPtr drm_server_info;
 static bool drmNodeIsDRM(int maj, int min);
 static char *drmGetMinorNameForFD(int fd, int type);
 
-static unsigned log2_int(unsigned x)
-{
-    unsigned l;
-
-    if (x < 2) {
-        return 0;
-    }
-    for (l = 2; ; l++) {
-        if ((unsigned)(1 << l) > x) {
-            return l - 1;
-        }
-    }
-    return 0;
-}
-
-
 drm_public void drmSetServerInfo(drmServerInfoPtr info)
 {
     drm_server_info = info;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
