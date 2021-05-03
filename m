Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08544371E68
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 19:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209526E9F3;
	Mon,  3 May 2021 17:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8FD6E9E4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 17:21:40 +0000 (UTC)
IronPort-SDR: MuTHmkA0qwkRRMktFUcW8Td6+XSzvx6LadvNgOnkGwAY6ZVRyC6KQFqbXZDg9G2SdzeiZefI/i
 +pwsQab2831Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="283192189"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="283192189"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 10:21:03 -0700
IronPort-SDR: 96bxu0AiS3P5X6A43cWBaiY/Fm37+dvIa566SwGUL8xzMt5zPjOG6VzmFn8rCuKBbcBzrDpj/Y
 1MRHZqwX68EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; d="scan'208";a="606706347"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 03 May 2021 10:21:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id EA90C348; Mon,  3 May 2021 20:21:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Phil Reid <preid@electromag.com.au>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] staging: fbtft: Replace custom ->reset() with generic
 one
Date: Mon,  3 May 2021 20:21:13 +0300
Message-Id: <20210503172114.27891-5-andriy.shevchenko@linux.intel.com>
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

The custom ->reset() repeats the generic one, replace it.

Note, in newer kernels the context of the function is a sleeping one,
it's fine to switch over to the sleeping functions. Keeping the reset
line asserted longer than 20 microseconds is also okay, it's an idling
state of the hardware.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/fb_agm1264k-fl.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
index b545c2ca80a4..207d578547cd 100644
--- a/drivers/staging/fbtft/fb_agm1264k-fl.c
+++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
@@ -77,19 +77,6 @@ static int init_display(struct fbtft_par *par)
 	return 0;
 }
 
-static void reset(struct fbtft_par *par)
-{
-	if (!par->gpio.reset)
-		return;
-
-	dev_dbg(par->info->device, "%s()\n", __func__);
-
-	gpiod_set_value(par->gpio.reset, 1);
-	udelay(20);
-	gpiod_set_value(par->gpio.reset, 0);
-	mdelay(120);
-}
-
 /* Check if all necessary GPIOS defined */
 static int verify_gpios(struct fbtft_par *par)
 {
@@ -439,7 +426,6 @@ static struct fbtft_display display = {
 		.set_addr_win = set_addr_win,
 		.verify_gpios = verify_gpios,
 		.request_gpios_match = request_gpios_match,
-		.reset = reset,
 		.write = write,
 		.write_register = write_reg8_bus8,
 		.write_vmem = write_vmem,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
