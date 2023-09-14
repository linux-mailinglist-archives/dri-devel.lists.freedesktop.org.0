Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F8A7A0519
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B3510E56D;
	Thu, 14 Sep 2023 13:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6047F10E56D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694697108; x=1726233108;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9eVtr7Sm2yrP7NrW5lUGQE9mQKVpwxVDMhXgaOG0os0=;
 b=kjh/cKTmZxxn2Y1kBgRJBjZ4MkGxp+QRja86FZXy5akjCxLcA0uRj0YU
 iKdlrjgRPxtGwnQmEIEq4YG7nwkZBWgHdsDna95C8WcOT5i95mA0twCVP
 ONcgpcLW2NKGCXxuVsQK0s+cvc79dPNTV9Keu2NR7ctMAB4YZXeFBuRNt
 IrmbIhzuqp3LqtnRQO4QUi60iXcs3Xc+cAH4SoolYBXmyP6kRok5B8eP5
 RodFe4RJsV7BchND1LYvTsdFoc0tN0GvTT8N8Y2zqvbunj4OLaPKV5JeW
 Uee2duGwbt8ltq2j//DlOSSxZpMg6xf9bQNhzaJhUritsAFzYxZOflidO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358366685"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="358366685"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="859696945"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="859696945"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 06:10:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: fix memory leak on ->hpd_notify callback
Date: Thu, 14 Sep 2023 16:10:15 +0300
Message-Id: <20230914131015.2472029-1-jani.nikula@intel.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, jani.nikula@intel.com,
 Kevin Hilman <khilman@baylibre.com>, stable@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The EDID returned by drm_bridge_get_edid() needs to be freed.

Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: <stable@vger.kernel.org> # v5.17+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

UNTESTED
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 9913971fa5d2..25ea76558690 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -334,6 +334,8 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 			return;
 
 		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
+
+		kfree(edid);
 	} else
 		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
 }
-- 
2.39.2

