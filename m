Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAE48399B7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF3F10E855;
	Tue, 23 Jan 2024 19:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AF410E88D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038821; x=1737574821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rafFYomq2GdJunfLEWInWA9g+F+g0HAsyzqa41pi/PQ=;
 b=kKzGO6fsESFrioqprY/q7Us0KMWoAO0ulOtvZrRvUGlQMFtxUmKcGtQV
 7+s50/75kZQF24mO4khmXmU9L2YouZVWQfRczYyQ3gvyIVyf9g902A1EO
 Fea2cbR3EnYCbO1EnRfGTFVn0wZfFrg2OjfvJuy7K4DqQBSkUAUB5Qw/w
 JvYNRnYAiNzsBjWMoohnEAoSH6JhofAZSUadfM9E2f8XbjX/AuNOKaQSa
 S4UQkKiHC6a1l2vbWIKHmJKQuctyXYm5omnJCtvv73vrv0pc0cxIjjlyQ
 ydWnFBdllWvCniBXuBDZ3YGZsw2pVgiTCgy8cMfaIaZRk/0vMUxwJrmcQ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8747473"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8747473"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1648133"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 24/39] drm/bridge: sii902x: use display info is_hdmi
Date: Tue, 23 Jan 2024 21:37:30 +0200
Message-Id: <9350875730b332ab2cac58fcbe7f4812fab567b8.1706038510.git.jani.nikula@intel.com>
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

Use the pre-parsed information instead of parsing EDID again.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 4560ae9cbce1..d59e668498c3 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -286,12 +286,6 @@ static struct edid *sii902x_get_edid(struct sii902x *sii902x,
 	mutex_lock(&sii902x->mutex);
 
 	edid = drm_get_edid(connector, sii902x->i2cmux->adapter[0]);
-	if (edid) {
-		if (drm_detect_hdmi_monitor(edid))
-			sii902x->sink_is_hdmi = true;
-		else
-			sii902x->sink_is_hdmi = false;
-	}
 
 	mutex_unlock(&sii902x->mutex);
 
@@ -311,6 +305,8 @@ static int sii902x_get_modes(struct drm_connector *connector)
 		kfree(edid);
 	}
 
+	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
+
 	return num;
 }
 
-- 
2.39.2

