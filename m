Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D948CD7B8
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 17:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9077C10E994;
	Thu, 23 May 2024 15:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilfjOes6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F78210E994;
 Thu, 23 May 2024 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716479494; x=1748015494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9fYv1QeB6WK06AnnzgZ8h5bb4qnXHz4G7xbA7xVKRSA=;
 b=ilfjOes6mE/PudxpOzaX1UVFnn3kX0+9noxRVllKDHpbDy0hUmZyerJV
 FtaQ4lHRwIoroRfpFd2Ugpdq08TxcSFciDd3QwcpEV/gCkNO0GQ6YB3Am
 i+hOcd6/KCEKBrqlEUb/Ceh4+1Xb1gBtoSL5mJ9K8Jf0VgyW57MXUIAid
 OIppE7JE0TYekAFKXGn4mTfPnexmUo9ikLkRGNSUsFTEkmCV0rU1G//Ms
 oIMZ8LIJ63SJ1YOKBwBRcUy2j+28AjDY8KDpw1cduqmTKInwpW3pCqYdP
 FpTp0oLzp1b32nqM74NbzIacS3N+vuEatKuZ/va/B2dDbCnU9o/lEtT/X w==;
X-CSE-ConnectionGUID: rAzXqMNXQKm57YnDHW0pBA==
X-CSE-MsgGUID: BLHk4cWJS0emdQsMUrHWjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16644301"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="16644301"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:51:33 -0700
X-CSE-ConnectionGUID: fw3YigMGQgmGMLtqUIo16g==
X-CSE-MsgGUID: 4DkX+wT7R9y6f8dqz8tXNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="34324959"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 08:51:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/4] drm/imx: fix -Wformat-truncation warning in
 imx_ldb_probe()
Date: Thu, 23 May 2024 18:51:08 +0300
Message-Id: <c257c4174743f35bafee8492ec60e1d2734450cf.1716479340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1716479340.git.jani.nikula@intel.com>
References: <cover.1716479340.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enabling -Wformat-truncation yields the following warning:

../drivers/gpu/drm/imx/ipuv3/imx-ldb.c: In function ‘imx_ldb_probe’:
../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:57: error: ‘_sel’ directive output may be truncated writing 4 bytes into a region of size between 3 and 13 [-Werror=format-truncation=]
  658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
      |                                                         ^~~~
../drivers/gpu/drm/imx/ipuv3/imx-ldb.c:658:17: note: ‘snprintf’ output between 8 and 18 bytes into a destination of size 16
  658 |                 snprintf(clkname, sizeof(clkname), "di%d_sel", i);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Silence the warning by checking the snprintf() return value.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 71d70194fcbd..46f779fe60ee 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -654,8 +654,12 @@ static int imx_ldb_probe(struct platform_device *pdev)
 	 */
 	for (i = 0; i < 4; i++) {
 		char clkname[16];
+		int len;
+
+		len = snprintf(clkname, sizeof(clkname), "di%d_sel", i);
+		if (len >= sizeof(clkname))
+			dev_err(dev, "clkname truncated\n");
 
-		snprintf(clkname, sizeof(clkname), "di%d_sel", i);
 		imx_ldb->clk_sel[i] = devm_clk_get(imx_ldb->dev, clkname);
 		if (IS_ERR(imx_ldb->clk_sel[i])) {
 			ret = PTR_ERR(imx_ldb->clk_sel[i]);
-- 
2.39.2

