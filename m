Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1B58399B3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E3D10E874;
	Tue, 23 Jan 2024 19:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190D610E874
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038802; x=1737574802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aBBYA3RzHh2/QQ0UwL4PUfV0hJR5WAU4PpeFt5TUwtM=;
 b=a9U74MaZOCBsks3BNeJIl2ey58vZs4PfkaMvd0n8z1zb192kFuc1harW
 5IVCSTqL9mR4o6hQgFKtzLYu+AvKOZARGIuGD4RUu1K7G8/nQg5uzhr2t
 ZtHEbPgdlc7kbcVmOjlBe3c8ZvdrgIcT/bQ/5RhhrkCaggNyoDwni+9FN
 85U/x85Q8QQxPN9uF4xoH5vD6Zghwqz10dC5DKBe3uOrr4LGHSCuUq91M
 As7NvvXiftCRQ/qoMTCNPfl4/YiazKeGNbW7Hk7n3WnL4gS8Ks3Es0VPU
 l3FWGUUDsLyYclbLJus2zOKeO0VQCdsfioB9CHY3KLBjseA0xjgU3YPzT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15150432"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="15150432"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959259998"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="959259998"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 21/39] drm/bridge: lt9611uxc: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:27 +0200
Message-Id: <40fc5eaf2fa34a9d604fe5291ae2a41623dd391d.1706038510.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706038510.git.jani.nikula@intel.com>
References: <cover.1706038510.git.jani.nikula@intel.com>
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

Prefer using the struct drm_edid based callback and functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 4eaf99618749..bcf8bccd86d6 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -495,8 +495,8 @@ static int lt9611uxc_get_edid_block(void *data, u8 *buf, unsigned int block, siz
 	return 0;
 };
 
-static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
-					      struct drm_connector *connector)
+static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *bridge,
+							 struct drm_connector *connector)
 {
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
 	int ret;
@@ -510,7 +510,7 @@ static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
 		return NULL;
 	}
 
-	return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
+	return drm_edid_read_custom(connector, lt9611uxc_get_edid_block, lt9611uxc);
 }
 
 static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
@@ -518,7 +518,7 @@ static const struct drm_bridge_funcs lt9611uxc_bridge_funcs = {
 	.mode_valid = lt9611uxc_bridge_mode_valid,
 	.mode_set = lt9611uxc_bridge_mode_set,
 	.detect = lt9611uxc_bridge_detect,
-	.get_edid = lt9611uxc_bridge_get_edid,
+	.edid_read = lt9611uxc_bridge_edid_read,
 };
 
 static int lt9611uxc_parse_dt(struct device *dev,
-- 
2.39.2

