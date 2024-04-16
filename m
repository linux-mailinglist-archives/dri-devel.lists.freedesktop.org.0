Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBDB8A6C2D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4ED112C8F;
	Tue, 16 Apr 2024 13:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIpB+vsJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCF2112C8F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273829; x=1744809829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5nXrXIDLBlKi4Z6zegaSBQ/zMeZdxeF3Ujvn8Hi1gnk=;
 b=dIpB+vsJRDZZ9qPVXDt143bVJVsh7pociZ1wsADlXyKe0eo0m4Fll0wt
 pIRxbfsDTWaKmBydr206H9nefQ4iW4w131qOC6wmBd4l9p5WOm9ytvYbr
 eyH/exZragP4YkaiVfBlNDMQPSKfCBfQtKIs3LvTbIXd6l5UbxHBN0VhG
 ODsKqk+AGfX93mno2598AHa6qgcVuHl+MUXkj/uFwIKwcQVVrdE9O437J
 pjTawaH10DSw6DQvCP+j+gACx/LiwGzHLO9THnEDsZKF6AiXSJ2/fa8/O
 gNPU25fswvlmTHvSD26EoY3WySqxLofYM/kpCaR4ScyMBBC5YOtAN5C/W w==;
X-CSE-ConnectionGUID: JzFXzR0TTNy31a5FQAOcEw==
X-CSE-MsgGUID: JKVJXqSTTCqcMBYGQje0Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31191367"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="31191367"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:48 -0700
X-CSE-ConnectionGUID: BovRYRspTR2fPsG8cCa1qw==
X-CSE-MsgGUID: aN/gRYSTT62HH5y/HjjR9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22326162"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH 14/15] drm/rockchip: inno_hdmi: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:28 +0300
Message-Id: <1218cb4fd79149c90dc0c82c42ae0c8a36acf055.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
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

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 1d2261643743..3df2cfcf9998 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -606,18 +606,16 @@ inno_hdmi_connector_detect(struct drm_connector *connector, bool force)
 static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret = 0;
 
 	if (!hdmi->ddc)
 		return 0;
 
-	edid = drm_get_edid(connector, hdmi->ddc);
-	if (edid) {
-		drm_connector_update_edid_property(connector, edid);
-		ret = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-	}
+	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
+	drm_edid_connector_update(connector, drm_edid);
+	ret = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return ret;
 }
-- 
2.39.2

