Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C450E822AFD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA3310E296;
	Wed,  3 Jan 2024 10:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B7410E296
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276650; x=1735812650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3bi336qNdVKLv7Oe0t6dIo7X3g/wOyaVBYR60m//wzc=;
 b=QdsBM7SQC/jdENhhXXpNOVobogoF8bZ+ES1x3gsXf/FX6UENYFk/y5m8
 8ITo+zgO3uPWrrFmIe07xfwkC7BGrloVGwakmgvcV1IM26zxwVOoX0x/+
 lEUEgbDDYOTMxGcyIjr2XbXeYsRLJeiALUi1oKMt9bh+unIV2yXyx9m3X
 s5h798DgPviLSY6VJdkG0hoLDB66VkafqrqigswlZeW6LJgzOpC6VHnN2
 HigPK0/HKbzkorOK/qoT9sokDD3MvYP47ecpVFTWvwuZZhkRFOHDxM619
 QK4qv1558v+pcc3BIXWBUJi48gbrkmL0XRrZn2RHfG3L+QXTwvdiIHE9b A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396721113"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="396721113"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="756172455"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="756172455"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 16/39] drm/bridge: cdns-mhdp8546: clear the EDID property
 on failures
Date: Wed,  3 Jan 2024 12:08:30 +0200
Message-Id: <1c4830fe81cf202dc07dd273be77582a4f15dc45.1704276309.git.jani.nikula@intel.com>
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

If EDID read fails, clear the EDID property.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index e44cb89c33f0..e226acc5c15e 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -1524,12 +1524,14 @@ static int cdns_mhdp_get_modes(struct drm_connector *connector)
 		return 0;
 
 	drm_edid = cdns_mhdp_edid_read(mhdp, connector);
+
+	drm_edid_connector_update(connector, drm_edid);
+
 	if (!drm_edid) {
 		dev_err(mhdp->dev, "Failed to read EDID\n");
 		return 0;
 	}
 
-	drm_edid_connector_update(connector, drm_edid);
 	num_modes = drm_edid_connector_add_modes(connector);
 	drm_edid_free(drm_edid);
 
-- 
2.39.2

