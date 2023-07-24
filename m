Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2A775ED6B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 10:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A961810E27C;
	Mon, 24 Jul 2023 08:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4575B10E27C;
 Mon, 24 Jul 2023 08:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690187109; x=1721723109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/0rsj8A0b5wTWXkiO061pramtAIL3iSBnO8ANxq5Bto=;
 b=mS2AVJvPLximhpM8fwhxfSWn4eHNsFMKdSCqJSJU3b1hR4vtgyMFiBYk
 x+oPnPHV/CuRdF2lEyUwQSwNnzYLVQpWKgVq86i+GVf+P1Hg5QQcGvx65
 ysL96mnYCcaZZauwFqDKwNcZD+kT+i7c+ThIj7th3BVp9fOmF6WJdzTIU
 xxW6YeRMXnMUsU7/LZwCmXEBBizXHRyQrb6o53WuUx+BJVXZ8mAPe25y4
 ZB9DzilgTAEorxD+B3kghPE3h1q2vNKhVzJ4U5YwMlLMvpOA8Eroieade
 bkNCQIOPVCrl0SLMTSehcxOHhszZlDfBB3ukUS9L/4o12RgTwQz8v2qVO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="433624411"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="433624411"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 01:25:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="795686172"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="795686172"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2023 01:25:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 65FC51A6; Mon, 24 Jul 2023 11:25:13 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v3 1/1] drm/i915: Move abs_diff() to math.h
Date: Mon, 24 Jul 2023 11:25:11 +0300
Message-Id: <20230724082511.3225-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, Stephen Boyd <sboyd@kernel.org>,
 Helge Deller <deller@gmx.de>, Andi Shyti <andi.shyti@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nikita Shubin via B4 Relay <devnull+nikita.shubin.maquefel.me@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

abs_diff() belongs to math.h. Move it there.
This will allow others to use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org> # tty/serial
---
v3: added tag (Jiri), removed space after a cast (fdo CI)
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h |  7 -------
 drivers/gpu/ipu-v3/ipu-image-convert.c        | 15 +++++++--------
 drivers/tty/serial/omap-serial.c              |  7 +------
 drivers/video/fbdev/core/svgalib.c            |  7 +------
 include/linux/math.h                          |  7 +++++++
 6 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index 6b2d8a1e2aa9..290e856fe9e9 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/math.h>
 #include <linux/string_helpers.h>
 
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
index ba62eb5d7c51..04e6810954b2 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.h
@@ -29,13 +29,6 @@
 
 #include "intel_wakeref.h"
 
-/*FIXME: Move this to a more appropriate place. */
-#define abs_diff(a, b) ({			\
-	typeof(a) __a = (a);			\
-	typeof(b) __b = (b);			\
-	(void) (&__a == &__b);			\
-	__a > __b ? (__a - __b) : (__b - __a); })
-
 enum tc_port;
 struct drm_i915_private;
 struct intel_atomic_state;
diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index af1612044eef..841316582ea9 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -7,7 +7,10 @@
 
 #include <linux/interrupt.h>
 #include <linux/dma-mapping.h>
+#include <linux/math.h>
+
 #include <video/imx-ipu-image-convert.h>
+
 #include "ipu-prv.h"
 
 /*
@@ -543,7 +546,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
 		unsigned int in_pos;
 		unsigned int in_pos_aligned;
 		unsigned int in_pos_rounded;
-		unsigned int abs_diff;
+		unsigned int diff;
 
 		/*
 		 * Tiles in the right row / bottom column may not be allowed to
@@ -575,15 +578,11 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
 		    (in_edge - in_pos_rounded) % in_burst)
 			continue;
 
-		if (in_pos < in_pos_aligned)
-			abs_diff = in_pos_aligned - in_pos;
-		else
-			abs_diff = in_pos - in_pos_aligned;
-
-		if (abs_diff < min_diff) {
+		diff = abs_diff(in_pos, in_pos_aligned);
+		if (diff < min_diff) {
 			in_seam = in_pos_rounded;
 			out_seam = out_pos;
-			min_diff = abs_diff;
+			min_diff = diff;
 		}
 	}
 
diff --git a/drivers/tty/serial/omap-serial.c b/drivers/tty/serial/omap-serial.c
index 82d35dbbfa6c..9be63a1f1f0c 100644
--- a/drivers/tty/serial/omap-serial.c
+++ b/drivers/tty/serial/omap-serial.c
@@ -222,16 +222,11 @@ static inline int calculate_baud_abs_diff(struct uart_port *port,
 				unsigned int baud, unsigned int mode)
 {
 	unsigned int n = port->uartclk / (mode * baud);
-	int abs_diff;
 
 	if (n == 0)
 		n = 1;
 
-	abs_diff = baud - (port->uartclk / (mode * n));
-	if (abs_diff < 0)
-		abs_diff = -abs_diff;
-
-	return abs_diff;
+	return abs_diff(baud, port->uartclk / (mode * n));
 }
 
 /*
diff --git a/drivers/video/fbdev/core/svgalib.c b/drivers/video/fbdev/core/svgalib.c
index 9e01322fabe3..2cba158888ea 100644
--- a/drivers/video/fbdev/core/svgalib.c
+++ b/drivers/video/fbdev/core/svgalib.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/fb.h>
+#include <linux/math.h>
 #include <linux/svga.h>
 #include <asm/types.h>
 #include <asm/io.h>
@@ -372,12 +373,6 @@ EXPORT_SYMBOL(svga_get_caps);
  *  F_VCO = (F_BASE * M) / N
  *  F_OUT = F_VCO / (2^R)
  */
-
-static inline u32 abs_diff(u32 a, u32 b)
-{
-	return (a > b) ? (a - b) : (b - a);
-}
-
 int svga_compute_pll(const struct svga_pll *pll, u32 f_wanted, u16 *m, u16 *n, u16 *r, int node)
 {
 	u16 am, an, ar;
diff --git a/include/linux/math.h b/include/linux/math.h
index 449a29b73f6d..4459d1786f77 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -157,6 +157,13 @@ __STRUCT_FRACT(u32)
 	__builtin_types_compatible_p(typeof(x), unsigned type),		\
 	({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
 
+#define abs_diff(a, b) ({			\
+	typeof(a) __a = (a);			\
+	typeof(b) __b = (b);			\
+	(void)(&__a == &__b);			\
+	__a > __b ? (__a - __b) : (__b - __a);	\
+})
+
 /**
  * reciprocal_scale - "scale" a value into range [0, ep_ro)
  * @val: value
-- 
2.40.0.1.gaa8946217a0b

