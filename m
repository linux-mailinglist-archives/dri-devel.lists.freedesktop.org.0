Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EDE4BB632
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5001410ED5F;
	Fri, 18 Feb 2022 10:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8557510ED5F;
 Fri, 18 Feb 2022 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178679; x=1676714679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kIHz5LyphEwplMOK8Vl69NdXOnwV8iIPnZkXldYaenM=;
 b=W6U6bqcSdBlw7A4HvksDaP4ALE/tSRMtYGbPISykhU2PMGA0SY6aDvKK
 IS3aRcU7iPrObrnGMFa0qO3bQI4S2hhqADsW1mOuGXw5tq93sy4OrLj1G
 MEHLmSvvgveIT2E+lLFrqTDps9k75TLQu7nhdDCVpHZ6dmP9q2ILK+Gsr
 a51ez5vU6kyzmSxWOc0U6TKcbH6xyhssrkgbrvBpTfUo2IUpB5tF4OcKf
 NWg4loXE31ffHzdCAZ09cUtpNdQq+fWl2c0SwFzYqlpJqr2IYVWcqfxG7
 P6vuYJxn0BbhWLeivtMv10FTGejCC2qVTnm0SQGq+3K7jqSpy4EtX4uBL Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="251296809"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="251296809"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="626574286"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by FMSMGA003.fm.intel.com with SMTP; 18 Feb 2022 02:04:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:34 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/22] drm/bridge: Use drm_mode_copy()
Date: Fri, 18 Feb 2022 12:03:47 +0200
Message-Id: <20220218100403.7028-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 intel-gfx@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

struct drm_display_mode embeds a list head, so overwriting
the full struct with another one will corrupt the list
(if the destination mode is on a list). Use drm_mode_copy()
instead which explicitly preserves the list head of
the destination mode.

Even if we know the destination mode is not on any list
using drm_mode_copy() seems decent as it sets a good
example. Bad examples of not using it might eventually
get copied into code where preserving the list head
actually matters.

Obviously one case not covered here is when the mode
itself is embedded in a larger structure and the whole
structure is copied. But if we are careful when copying
into modes embedded in structures I think we can be a
little more reassured that bogus list heads haven't been
propagated in.

@is_mode_copy@
@@
drm_mode_copy(...)
{
...
}

@depends on !is_mode_copy@
struct drm_display_mode *mode;
expression E, S;
@@
(
- *mode = E
+ drm_mode_copy(mode, &E)
|
- memcpy(mode, E, S)
+ drm_mode_copy(mode, E)
)

@depends on !is_mode_copy@
struct drm_display_mode mode;
expression E;
@@
(
- mode = E
+ drm_mode_copy(&mode, &E)
|
- memcpy(&mode, E, S)
+ drm_mode_copy(&mode, E)
)

@@
struct drm_display_mode *mode;
@@
- &*mode
+ mode

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c          | 2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
 drivers/gpu/drm/bridge/tc358767.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 963a6794735f..881cf338d5cf 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -857,7 +857,7 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
 	/* Save the new desired phy config */
 	memcpy(&dsi->phy_cfg, &new_cfg, sizeof(new_cfg));
 
-	memcpy(&dsi->mode, adjusted_mode, sizeof(dsi->mode));
+	drm_mode_copy(&dsi->mode, adjusted_mode);
 	drm_mode_debug_printmodeline(adjusted_mode);
 
 	if (pm_runtime_resume_and_get(dev) < 0)
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 4befc104d220..a563460f8d20 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2830,7 +2830,7 @@ static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 	mutex_lock(&hdmi->mutex);
 
 	/* Store the display mode for plugin/DKMS poweron events */
-	memcpy(&hdmi->previous_mode, mode, sizeof(hdmi->previous_mode));
+	drm_mode_copy(&hdmi->previous_mode, mode);
 
 	mutex_unlock(&hdmi->mutex);
 }
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index c23e0abc65e8..7f9574b17caa 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1312,7 +1312,7 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 
-	tc->mode = *mode;
+	drm_mode_copy(&tc->mode, mode);
 }
 
 static struct edid *tc_get_edid(struct drm_bridge *bridge,
-- 
2.34.1

