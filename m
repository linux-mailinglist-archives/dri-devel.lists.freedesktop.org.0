Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E70D61FE94
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D6D10E3AB;
	Mon,  7 Nov 2022 19:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9B610E3A3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667849171; x=1699385171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pLqm1QgEZZjJt/2JM8FqPTfV0l2zyKImmtAMSKtBXaE=;
 b=F03BLpg0nakG1Rx6DBxQmWOaHfL9mWtD00PVAU/nO1+kZr8AtYGN4bS3
 uQ2T8kYqMUomlBEmDj+64+YNP75U861fKR7VaaLbETNTg199s5BXmXfTs
 h68OdVyeDM1pdzMaZrT/knGrXiM5+fVBWoixeIVHLzttzEva+L+KEUVV5
 IYoJy6T0Nt4XXCTxnFRIQwnIGGs9OGjzr4/0mRgZXyrxf+BOAWp5Fu2EJ
 tcV/5/Em0rMmbVojSioFBnMN8q8SNg7vMPlCRAkLuk/e3CmEy+KKSlKZR
 x72wfpq852P7ZuJRCm7xUFvDsgXnaF1Lb7pNPDBbh6wrXPhHfMUNAdsFu A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308125651"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="308125651"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 11:26:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705009825"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="705009825"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga004.fm.intel.com with SMTP; 07 Nov 2022 11:26:09 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 21:26:08 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/rockchip: Use drm_mode_copy()
Date: Mon,  7 Nov 2022 21:25:44 +0200
Message-Id: <20221107192545.9896-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
References: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
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
Cc: linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c   | 2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 518ee13b1d6f..8526dda91931 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -571,7 +571,7 @@ static void cdn_dp_encoder_mode_set(struct drm_encoder *encoder,
 	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
 	video->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
 
-	memcpy(&dp->mode, adjusted, sizeof(*mode));
+	drm_mode_copy(&dp->mode, adjusted);
 }
 
 static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 87b2243ea23e..f51774866f41 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -499,7 +499,7 @@ static void inno_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 	inno_hdmi_setup(hdmi, adj_mode);
 
 	/* Store the display mode for plugin/DPMS poweron events */
-	memcpy(&hdmi->previous_mode, adj_mode, sizeof(hdmi->previous_mode));
+	drm_mode_copy(&hdmi->previous_mode, adj_mode);
 }
 
 static void inno_hdmi_encoder_enable(struct drm_encoder *encoder)
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index cf2cf51091a3..90145ad96984 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -395,7 +395,7 @@ rk3066_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
 
 	/* Store the display mode for plugin/DPMS poweron events. */
-	memcpy(&hdmi->previous_mode, adj_mode, sizeof(hdmi->previous_mode));
+	drm_mode_copy(&hdmi->previous_mode, adj_mode);
 }
 
 static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder)
-- 
2.37.4

