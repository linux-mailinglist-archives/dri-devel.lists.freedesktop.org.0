Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B9976EA39
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 15:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC9C10E1C3;
	Thu,  3 Aug 2023 13:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4238010E1C3;
 Thu,  3 Aug 2023 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691069333; x=1722605333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W1vGWvXnwAY/f51FTl0188tECkxF+EFRNzlkxGetUxc=;
 b=Mg+RCcC36fO1Cz6nE7dQr+nyqloSBjHHOy9U2cKmPWwfgwvs78AYtCMN
 uW6UF3Yd8v/BBHFw4TLodPeqVRck3HwKwVGZFZboaq+F0TWQg52rDM2Eu
 VkQWOEn8GVyi3TquVpZr3eDJTkeuRC9H+ox1qSeIvsszn3e23UVvqi2r4
 SgcKZB8iTDQh6IzOklgoiAH7CRcY1ELSxuZSwOzbwoe0anrPIUTNIblod
 3W4rG5kuM4VGwhMluw/k4LwFyXq5+EcL7JBff7jBbW44OikyRQlYGiN0i
 acCPN9oOJC0AsPz8WfQB5RWEXcy+j3KyfOSVlafx7m3MTJzpC+V6BnlIY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373499607"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="373499607"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 06:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="794985503"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="794985503"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2023 06:19:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DC3932AB; Thu,  3 Aug 2023 16:19:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v4 1/1] drm/i915: Move abs_diff() to math.h
Date: Thu,  3 Aug 2023 16:19:18 +0300
Message-Id: <20230803131918.53727-1-andriy.shevchenko@linux.intel.com>
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
 Helge Deller <deller@gmx.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

abs_diff() belongs to math.h. Move it there.
This will allow others to use it.

Reviewed-by: Jiri Slaby <jirislaby@kernel.org> # tty/serial
Acked-by: Jani Nikula <jani.nikula@intel.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # gpu/ipu-v3
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v4:
- Cc'ed to Andrew (as Jani told he is okay to route it via other tree)
- added tags
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
index 3dc14dcb01ca..0ead88c5a19a 100644
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
index 2d388650c556..336e3e3678e7 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -155,6 +155,13 @@ __STRUCT_FRACT(u32)
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

