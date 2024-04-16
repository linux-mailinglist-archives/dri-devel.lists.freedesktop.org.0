Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB78D8A6C2F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A81112C91;
	Tue, 16 Apr 2024 13:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vz4oS926";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A837112C91
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273834; x=1744809834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9ad/OeNIb41awZjNgaw6mdG+DAmsdITzEiZNtm/IXMU=;
 b=Vz4oS926MMxVxpJJ6vzLc7QI+Lxj3b+b/zF54XzKAL/T/30+OvDhe7RD
 Ql2rdxwxD1Oab1Ob1M+xIVFCWAu7RKPaORrVYuzDXBNcD6ZV2FaVgzzbo
 KNVnV1WHjjSukjLXS2ARMXpVfBVa2X9dkl6p9OkCbD03hjTsIWfN1Ade7
 zN85um2nPzHsBVYFztqrwcaHHV1A1peiqGJ3wm5WKzqp4D/iR7xXmUJvx
 +JWrfK1741WKzuaYTOrTU45GbHdoAdMHIPRsM6zEpUg5tRlIHFX4jzBz5
 hpkFY1w1vGvA7/5jRduemnPF7uRtvRrdSvMj5q/J5ukthZFXCcKYkVBJY Q==;
X-CSE-ConnectionGUID: geoIYSMyRJCzBzNAMS/PPQ==
X-CSE-MsgGUID: acpFOnYjQSyX7pRbBovIKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8571789"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8571789"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:54 -0700
X-CSE-ConnectionGUID: v7ShSl14RJeH8tmgR1Fa1Q==
X-CSE-MsgGUID: yY7cMnh0TZelqeNhrO7x7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="53438796"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH 15/15] drm/rockchip: rk3066_hdmi: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:29 +0300
Message-Id: <56ee6b7c3c018df55f5fe48a3e6d705dbad5ef74.1713273659.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 95cd1b49eda8..784de990da1b 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -466,18 +466,16 @@ rk3066_hdmi_connector_detect(struct drm_connector *connector, bool force)
 static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct rk3066_hdmi *hdmi = connector_to_rk3066_hdmi(connector);
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

