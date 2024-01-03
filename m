Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA7822AF9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FB210E29A;
	Wed,  3 Jan 2024 10:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43AB10E29A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276624; x=1735812624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fdhGERFC02rkb+dK2SMrz68fbHDv5PCApK1v1TrSgm0=;
 b=awp6H3lZ1Hoe4FesqUHOKPdPbpfTChDd6w0XrsxGAUTycBU6tXnWCQ5n
 vahA94ccWQSAWqXYPz3sGxbiLcdEBcF3PwKIXjPBPCCN+x6qwHp/SoccV
 WW+oeIEUZWSdjip+Xl/a7Ne4Tsmy71nyH8e3Gp3Yinfib0+Uz9MJg/05E
 S20aRnBABepkbowc+u/NFZBaTHU66nRuKtUkGlyZZdI9TmQLUZIfpCQye
 9f+136MHIc2BWQTRpj5bbM4/D1kRFy6KqBkKaW4KqwJ6x1CL8aNiq31G5
 nuOJJQ6EPeq4MLE7+6/G58MIDw+wEPEENp5a3NzGNAYPj77BtLKxQEtAO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396721077"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="396721077"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="903398432"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="903398432"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 12/39] drm/meson: switch to drm_bridge_edid_read()
Date: Wed,  3 Jan 2024 12:08:26 +0200
Message-Id: <82e11fe658fc39db6c7d65fdca3e4f36cd56dc67.1704276309.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer using the struct drm_edid based functions.

Not ideal, should use source physical address from connector info.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 25ea76558690..fff6ce394f98 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,19 +323,31 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  enum drm_connector_status status)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
-	struct edid *edid;
 
 	if (!encoder_hdmi->cec_notifier)
 		return;
 
 	if (status == connector_status_connected) {
-		edid = drm_bridge_get_edid(encoder_hdmi->next_bridge, encoder_hdmi->connector);
-		if (!edid)
+		const struct drm_edid *drm_edid;
+		const struct edid *edid;
+
+		drm_edid = drm_bridge_edid_read(encoder_hdmi->next_bridge,
+						encoder_hdmi->connector);
+		if (!drm_edid)
 			return;
 
+		/*
+		 * FIXME: The CEC physical address should be set using
+		 * cec_notifier_set_phys_addr(encoder_hdmi->cec_notifier,
+		 * connector->display_info.source_physical_address) from a path
+		 * that has read the EDID and called
+		 * drm_edid_connector_update().
+		 */
+		edid = drm_edid_raw(drm_edid);
+
 		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
 
-		kfree(edid);
+		drm_edid_free(drm_edid);
 	} else
 		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
 }
-- 
2.39.2

