Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02F7A09CC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 17:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C388E10E143;
	Thu, 14 Sep 2023 15:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90E710E143
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 15:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694706807; x=1726242807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Iq4mvDCPkc5NX/TTMSnD5WIVQgpzL/9/gki1RmIoCo=;
 b=kv/Om4kGfPmxvQO5jd41RRf6lnzI/h9NFFeFRjJDR+zeub7wy/2MIDSN
 zKHQ3lnuSEJljkPWWbbvtFW8QWRRKOt3gfohTDDnqWlXhU9SPhP0c7FJp
 FiE+rzIVs7zTsLxfxjZE3NHDm/NCaOcKHISX22Ftj/3dp+/Rhi2PO8doB
 8FfF7SsZHYTy/xCnIWcclpjKfXaccQohCJvO7tP57Ts1NGvZ2fmRE+a0a
 4QijMe2SHedzU9AzvoPON3VjP+6vfaq2oH5+eeF5ut0PWm2YTy11LjDdV
 IQWXLPtdVe0zZZPimEDnHnxZRR62LiuK0xJXUcqLk83bMczITJ5tK3h0G A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="382809805"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="382809805"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="991445022"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="991445022"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:53:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback audio
 detection
Date: Thu, 14 Sep 2023 18:53:17 +0300
Message-Id: <20230914155317.2511876-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914131058.2472260-1-jani.nikula@intel.com>
References: <20230914131058.2472260-1-jani.nikula@intel.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sads returned by drm_edid_to_sad() needs to be freed.

Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
Cc: Guillaume Ranquet <granquet@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: <stable@vger.kernel.org> # v6.1+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Found another one. UNTESTED.
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 8fc6eff68e30..0e285df6577e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2034,7 +2034,6 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	bool enabled = mtk_dp->enabled;
 	struct edid *new_edid = NULL;
 	struct mtk_dp_audio_cfg *audio_caps = &mtk_dp->info.audio_cur_cfg;
-	struct cea_sad *sads;
 
 	if (!enabled) {
 		drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
@@ -2054,7 +2053,11 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	}
 
 	if (new_edid) {
+		struct cea_sad *sads;
+
 		audio_caps->sad_count = drm_edid_to_sad(new_edid, &sads);
+		kfree(sads);
+
 		audio_caps->detect_monitor = drm_detect_monitor_audio(new_edid);
 	}
 
-- 
2.39.2

