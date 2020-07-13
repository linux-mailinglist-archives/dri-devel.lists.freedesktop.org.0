Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E362321E8FB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DE66E910;
	Tue, 14 Jul 2020 07:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 612 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jul 2020 12:39:24 UTC
Received: from smtp.al2klimov.de (smtp.al2klimov.de [78.46.175.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F50489BF4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 12:39:24 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id 36565BC0CA;
 Mon, 13 Jul 2020 12:39:21 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: jsarha@ti.com, tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tidss: Replace HTTP links with HTTPS ones
Date: Mon, 13 Jul 2020 14:39:13 +0200
Message-Id: <20200713123913.34205-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:44 +0000
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
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 drivers/gpu/drm/tidss/tidss_crtc.c        | 2 +-
 drivers/gpu/drm/tidss/tidss_crtc.h        | 2 +-
 drivers/gpu/drm/tidss/tidss_dispc.c       | 2 +-
 drivers/gpu/drm/tidss/tidss_dispc.h       | 2 +-
 drivers/gpu/drm/tidss/tidss_dispc_regs.h  | 2 +-
 drivers/gpu/drm/tidss/tidss_drv.c         | 2 +-
 drivers/gpu/drm/tidss/tidss_drv.h         | 2 +-
 drivers/gpu/drm/tidss/tidss_encoder.c     | 2 +-
 drivers/gpu/drm/tidss/tidss_encoder.h     | 2 +-
 drivers/gpu/drm/tidss/tidss_irq.c         | 2 +-
 drivers/gpu/drm/tidss/tidss_irq.h         | 2 +-
 drivers/gpu/drm/tidss/tidss_kms.c         | 2 +-
 drivers/gpu/drm/tidss/tidss_kms.h         | 2 +-
 drivers/gpu/drm/tidss/tidss_plane.c       | 2 +-
 drivers/gpu/drm/tidss/tidss_plane.h       | 2 +-
 drivers/gpu/drm/tidss/tidss_scale_coefs.c | 2 +-
 drivers/gpu/drm/tidss/tidss_scale_coefs.h | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 89a226912de8..a591c70b8386 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.h b/drivers/gpu/drm/tidss/tidss_crtc.h
index 09e773666228..040d1205496b 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.h
+++ b/drivers/gpu/drm/tidss/tidss_crtc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 629dd06393f6..e7d28ec8f7f3 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2016-2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016-2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
index 902e612ff7ac..5984e0de2cd9 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_dispc_regs.h b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
index 88a83a41b6e3..13feedfe5d6d 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc_regs.h
+++ b/drivers/gpu/drm/tidss/tidss_dispc_regs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2016-2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2016-2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 99edc66ebdef..f00fadbead3e 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 3b0a3d87b7c4..7de4bba52e6f 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 30bf2a65949c..e278a9c89476 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_encoder.h b/drivers/gpu/drm/tidss/tidss_encoder.h
index 06854d66e7e6..ace877c0e0fd 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.h
+++ b/drivers/gpu/drm/tidss/tidss_encoder.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
index 1b80f2d62e0a..a5ec7931ef6b 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.c
+++ b/drivers/gpu/drm/tidss/tidss_irq.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
index aa92db403cca..4aaad5dfd7c2 100644
--- a/drivers/gpu/drm/tidss/tidss_irq.h
+++ b/drivers/gpu/drm/tidss/tidss_irq.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 4b99e9fa84a5..71dbd331640f 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_kms.h b/drivers/gpu/drm/tidss/tidss_kms.h
index 99aaff099f22..632d79f5983f 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.h
+++ b/drivers/gpu/drm/tidss/tidss_kms.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 0a563eabcbb9..43e72d0b2d84 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_plane.h b/drivers/gpu/drm/tidss/tidss_plane.h
index 80ff1c5a2535..e933e158b617 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.h
+++ b/drivers/gpu/drm/tidss/tidss_plane.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_scale_coefs.c b/drivers/gpu/drm/tidss/tidss_scale_coefs.c
index 5ec68389cc68..c2b84fea89a5 100644
--- a/drivers/gpu/drm/tidss/tidss_scale_coefs.c
+++ b/drivers/gpu/drm/tidss/tidss_scale_coefs.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_scale_coefs.h b/drivers/gpu/drm/tidss/tidss_scale_coefs.h
index 64b5af5b5361..9c560d0fdac0 100644
--- a/drivers/gpu/drm/tidss/tidss_scale_coefs.h
+++ b/drivers/gpu/drm/tidss/tidss_scale_coefs.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com/
+ * Copyright (C) 2018 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
