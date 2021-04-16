Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF0F36220B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45E16EB6C;
	Fri, 16 Apr 2021 14:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9CB6EB52
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:20:59 +0000 (UTC)
IronPort-SDR: ABU/LxcaEPruQrUDm5zif16LZnB/5QW5u97JfyslrJNPtZzkJWOGubsefnyUDsDpHOEItxVy3L
 OO8UxQwl08PA==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="215579666"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="215579666"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 07:20:41 -0700
IronPort-SDR: GYu6JtG5Ljri3illY5pAkNqdRIMGeZB9jA00ZkEx+9ITdC1xn+Vlv7jzTeS4pwIlrFa0ARbQ02
 GCpT6BWm5VAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="522722965"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2021 07:20:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 2E488147; Fri, 16 Apr 2021 17:20:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] fbtft: Don't spam logs when probe is deferred
Date: Fri, 16 Apr 2021 17:20:43 +0300
Message-Id: <20210416142044.17766-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210416142044.17766-1-andriy.shevchenko@linux.intel.com>
References: <20210416142044.17766-1-andriy.shevchenko@linux.intel.com>
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
v2: no changes
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
