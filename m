Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD9829F60
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 18:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F84410E7A2;
	Wed, 10 Jan 2024 17:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1EE10E7A2;
 Wed, 10 Jan 2024 17:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704908383; x=1736444383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kt4Dv9nU/nsKErTSHELW2YbFBqZ+mZeCNoZ4ynrCmmY=;
 b=blq3zE6LSjitOIgk/YHlNVqfWlkUMZ5LxVlCa9jM9V+UH3LJfVEfOHrl
 y4ih23lPsI4L57sFiyF4bC8A6c6zWbO07GD4K2uTdMLGQRTQkyDD3p709
 TDMvN6whBlnOfKqctk7gXnxFzaU2eTeF79WtpGYp0CwB5DGQaTxFvxGof
 +/knTBRfvKzXhd8ViESUrQ/LnWJDKm9DDEj6J0DEvT4rtwaJKLvCFDEyt
 wVd1li5e78OdTfAHd7p7zx/SFdY3abCjFmFnPTQFGXItaMATT7Dv5NgsC
 9CriaZBfUi1GkYH2iZLNbwLdBtBLW8Qxn/yUMuSNcICcm21MB8Xm0sbGm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="462878602"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="462878602"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:39:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1029221861"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1029221861"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.36.240])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:39:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/imx: prefer snprintf over sprintf
Date: Wed, 10 Jan 2024 19:39:14 +0200
Message-Id: <14c0108a54007a8360d84162a1d63cba9613b945.1704908087.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704908087.git.jani.nikula@intel.com>
References: <cover.1704908087.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This will trade the W=1 warning -Wformat-overflow to
-Wformat-truncation. This lets us enable -Wformat-overflow subsystem
wide.

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 53840ab054c7..71d70194fcbd 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -655,7 +655,7 @@ static int imx_ldb_probe(struct platform_device *pdev)
 	for (i = 0; i < 4; i++) {
 		char clkname[16];
 
-		sprintf(clkname, "di%d_sel", i);
+		snprintf(clkname, sizeof(clkname), "di%d_sel", i);
 		imx_ldb->clk_sel[i] = devm_clk_get(imx_ldb->dev, clkname);
 		if (IS_ERR(imx_ldb->clk_sel[i])) {
 			ret = PTR_ERR(imx_ldb->clk_sel[i]);
-- 
2.39.2

