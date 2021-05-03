Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B9371E69
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 19:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E59E6E9ED;
	Mon,  3 May 2021 17:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6456E9E9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 17:21:41 +0000 (UTC)
IronPort-SDR: BabomcaC+whjk8APzETbKclYRPzjR8fH6zHwi+D+GdfGKrcconIDW3+rwXw99ZxU8HcSyJWt/H
 PTdK+S7wPIwg==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197851351"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="197851351"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 10:21:03 -0700
IronPort-SDR: nlS4Frt1SdF8kCykuPTDbddhTHcV1QLR3BF/vtEqPMuajwN2ShenForDcwU71gV7p98WRLf5Rz
 02PKb9a+94qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="618062686"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 03 May 2021 10:21:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DEEFD2E4; Mon,  3 May 2021 20:21:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phil Reid <preid@electromag.com.au>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/5] staging: fbtft: Add support for orientation on Himax
 HX8347d
Date: Mon,  3 May 2021 20:21:12 +0300
Message-Id: <20210503172114.27891-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503172114.27891-1-andriy.shevchenko@linux.intel.com>
References: <20210503172114.27891-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Himax HX8347d has non-standard register to control orientation.
Add support for different orientation values.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/fb_hx8347d.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fb_hx8347d.c b/drivers/staging/fbtft/fb_hx8347d.c
index 37eaf0862c5b..a9b72a8b42b5 100644
--- a/drivers/staging/fbtft/fb_hx8347d.c
+++ b/drivers/staging/fbtft/fb_hx8347d.c
@@ -68,9 +68,6 @@ static int init_display(struct fbtft_par *par)
 	mdelay(40);
 	write_reg(par, 0x28, 0x3C);
 
-	/* orientation */
-	write_reg(par, 0x16, 0x60 | (par->bgr << 3));
-
 	return 0;
 }
 
@@ -87,6 +84,31 @@ static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, int ye)
 	write_reg(par, 0x22);
 }
 
+#define MEM_Y   BIT(7) /* MY row address order */
+#define MEM_X   BIT(6) /* MX column address order */
+#define MEM_V   BIT(5) /* MV row / column exchange */
+#define MEM_L   BIT(4) /* ML vertical refresh order */
+#define MEM_BGR (3) /* RGB-BGR Order */
+static int set_var(struct fbtft_par *par)
+{
+	switch (par->info->var.rotate) {
+	case 0:
+		write_reg(par, 0x16, MEM_V | MEM_X | (par->bgr << MEM_BGR));
+		break;
+	case 270:
+		write_reg(par, 0x16, par->bgr << MEM_BGR);
+		break;
+	case 180:
+		write_reg(par, 0x16, MEM_V | MEM_Y | (par->bgr << MEM_BGR));
+		break;
+	case 90:
+		write_reg(par, 0x16, MEM_X | MEM_Y | (par->bgr << MEM_BGR));
+		break;
+	}
+
+	return 0;
+}
+
 /*
  * Gamma string format:
  *   VRP0 VRP1 VRP2 VRP3 VRP4 VRP5 PRP0 PRP1 PKP0 PKP1 PKP2 PKP3 PKP4 CGM
@@ -144,6 +166,7 @@ static struct fbtft_display display = {
 	.fbtftops = {
 		.init_display = init_display,
 		.set_addr_win = set_addr_win,
+		.set_var = set_var,
 		.set_gamma = set_gamma,
 	},
 };
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
