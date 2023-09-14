Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61BE7A0559
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1041310E266;
	Thu, 14 Sep 2023 13:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCF910E266
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694697495; x=1726233495;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CyfAwXIGzlI10RnfLvRO0I9qqTFdV9kGEZ5Hpj5bsLA=;
 b=JXy4yHb7Gwj81jIp2flEN/wkU0mLIXPH8swfiKLIVf2EzOHegN2D8O9d
 b/OH5zroeyMX+YAq2wTB1jGNw381xOlfKZMklVig8eQjAFtJGE0RGcLb5
 1PGjiFhPXYuJb9wnutzV6TaPTsYPxTeotGxvIBpBrWNeogyT484U/jwSs
 ljl+gEkkYNeBht6To86Wq7RxwZLDR7s5M1HXS2Y47SZtIdSsqgfTtpm1R
 T7pqYBWb5xOVJRIATohmbDoZZt2WJzJw+ZPsRIS4JTYM3NoNMvOSfHZq4
 35lQcQlMuDT6WZIyQ7nkYubCwxiE149Q0CYMFeUuARYznXMmEZXVSSqLS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="442977293"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="442977293"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918246568"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="918246568"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:12:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: bridge: it66121: ->get_edid callback must not return err
 pointers
Date: Thu, 14 Sep 2023 16:11:59 +0300
Message-Id: <20230914131159.2472513-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, jani.nikula@intel.com,
 Robert Foss <robert.foss@linaro.org>, Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Phong LE <ple@baylibre.com>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm stack does not expect error valued pointers for EDID anywhere.

Fixes: e66856508746 ("drm: bridge: it66121: Set DDC preamble only once before reading EDID")
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Phong LE <ple@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: <stable@vger.kernel.org> # v6.3+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

UNTESTED
---
 drivers/gpu/drm/bridge/ite-it66121.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 3c9b42c9d2ee..1cf3fb1f13dc 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -884,14 +884,14 @@ static struct edid *it66121_bridge_get_edid(struct drm_bridge *bridge,
 	mutex_lock(&ctx->lock);
 	ret = it66121_preamble_ddc(ctx);
 	if (ret) {
-		edid = ERR_PTR(ret);
+		edid = NULL;
 		goto out_unlock;
 	}
 
 	ret = regmap_write(ctx->regmap, IT66121_DDC_HEADER_REG,
 			   IT66121_DDC_HEADER_EDID);
 	if (ret) {
-		edid = ERR_PTR(ret);
+		edid = NULL;
 		goto out_unlock;
 	}
 
-- 
2.39.2

