Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CAC822B05
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63A910E287;
	Wed,  3 Jan 2024 10:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614A010E287
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276698; x=1735812698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SdS8ErvE2o0wsD7Bvf3Lu0Ie3+LMTWu1Pe9aqp51eUc=;
 b=CZbqD1XlC5bl7qAJHwvQNspuUzz6LU54lJ8oaTequTA8UDT01+1XwxBv
 4cZ+QDhaaNxge3A92J2iiC+NP+m00BdQFIcfpvrnqe83Nc7VTbUDvL3mx
 M7PvCKHK6o+/gac13C5Qy1FB0IMRPVd3GLzfKIlEZWQV41cXcdxP4RLra
 GmWrLnRT4FOFbUnvAkN/wqRZVoir5Dn8mLsZjftv6Vn33i95ysGChOH9T
 NxwHgDC9f5nR+CIhgRR81ZInEySJYZk3Chbe4Kz9ZDJcRnmUK964Yu0fF
 6/5WhZ82j7mIsKK63fnlCSEnmcYJ+ProFef6+Ash9p3qQdyputR8Xl1M8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396721215"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="396721215"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="756172552"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="756172552"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 24/39] drm/bridge: sii902x: use display info is_hdmi
Date: Wed,  3 Jan 2024 12:08:38 +0200
Message-Id: <8611d4c1e514bde26abfb0a53d25e11be8e0c00e.1704276309.git.jani.nikula@intel.com>
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

Use the pre-parsed information instead of parsing EDID again.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 2bdc5b439beb..2f876b805b83 100644
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

