Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC5361FE7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 14:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21576E0DE;
	Fri, 16 Apr 2021 12:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2456E0DE
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 12:31:16 +0000 (UTC)
IronPort-SDR: K31fCGObzCep4gmfT/9Re1rDEHgR/lAoCcWAte3UBB/KDdRnN0gR3iTOtYRM5hJwE9zBE/2mLY
 7WpkXcZnGZ9w==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="182158063"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="182158063"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 05:31:16 -0700
IronPort-SDR: IxumiiRIJwpJIuwk28rwAKWbEPw6iGRwlTfxtJIvWbuclrEnn3yybu9rpcJwu3q4mtazbBUoOp
 RDfvU03krWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="522699204"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2021 05:31:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C093D142; Fri, 16 Apr 2021 15:31:31 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] fbtft: Don't spam logs when probe is deferred
Date: Fri, 16 Apr 2021 15:31:17 +0300
Message-Id: <20210416123117.4993-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210416123117.4993-1-andriy.shevchenko@linux.intel.com>
References: <20210416123117.4993-1-andriy.shevchenko@linux.intel.com>
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

When requesting GPIO line the probe can be deferred.
In such case don't spam logs with an error message.
This can be achieved by switching to dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/staging/fbtft/fbtft-core.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 67c3b1975a4d..a564907c4fa1 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -75,20 +75,16 @@ static int fbtft_request_one_gpio(struct fbtft_par *par,
 				  struct gpio_desc **gpiop)
 {
 	struct device *dev = par->info->device;
-	int ret = 0;
 
 	*gpiop = devm_gpiod_get_index_optional(dev, name, index,
 					       GPIOD_OUT_LOW);
-	if (IS_ERR(*gpiop)) {
-		ret = PTR_ERR(*gpiop);
-		dev_err(dev,
-			"Failed to request %s GPIO: %d\n", name, ret);
-		return ret;
-	}
+	if (IS_ERR(*gpiop))
+		dev_err_probe(dev, PTR_ERR(*gpiop), "Failed to request %s GPIO\n", name);
+
 	fbtft_par_dbg(DEBUG_REQUEST_GPIOS, par, "%s: '%s' GPIO\n",
 		      __func__, name);
 
-	return ret;
+	return 0;
 }
 
 static int fbtft_request_gpios(struct fbtft_par *par)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
