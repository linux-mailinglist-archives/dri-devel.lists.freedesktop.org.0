Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7FB6D0A0C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CE810EEF4;
	Thu, 30 Mar 2023 15:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B3010EEDD;
 Thu, 30 Mar 2023 15:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190873; x=1711726873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1I+tValqQeHIgImoR7kpRtE0U+EgMNCzeIU/wxgbpQk=;
 b=gj85bGNIagx0prxuUqJDhmTjZLJvkg1mIM5VNibamBa26m8TgVF3wLAZ
 SnP2QiRCVV8EZpfhVhp96pAJ8qYtnD1cKWzT6iN9npuiLXHCAg0crIlQC
 rsB6MIuaw8DecigyUfGRpv9bEbOBy58sPDAC22dmxUjfMal7o1MKJxJFk
 hDT5s6wR0Rh8HKW5JRp8s9+meNm4izBizuuFuVe4jBmQZ6rLFPTVBbyx1
 BEwGF+2N+gwmHbMGIH7wdg6RaAknYW4YRG6TktIEZSZ3n2sXypbzarG1b
 YbXwCcLCoJRZFVmPSfOvJDdCCKuO6SvycS7paU+i+pfyI6XHK37swpjZA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="406196701"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="406196701"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662068011"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="662068011"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/12] drm/rockchip: cdn-dp: call
 drm_connector_update_edid_property() unconditionally
Date: Thu, 30 Mar 2023 18:39:47 +0300
Message-Id: <e7c6d561ab086e2348611c374cb590eaa7b27dce.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling drm_connector_update_edid_property() should be done
unconditionally instead of depending on the number of modes added. Also
match the call order in inno_hdmi and rk3066_hdmi.

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stübner <heiko@sntech.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 8526dda91931..b6afe3786b74 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -273,10 +273,9 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 				  edid->width_cm, edid->height_cm);
 
 		dp->sink_has_audio = drm_detect_monitor_audio(edid);
+
+		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
-		if (ret)
-			drm_connector_update_edid_property(connector,
-								edid);
 	}
 	mutex_unlock(&dp->lock);
 
-- 
2.39.2

