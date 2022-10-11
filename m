Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 577165FB3BF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B83F10E5C2;
	Tue, 11 Oct 2022 13:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6A310E5C2;
 Tue, 11 Oct 2022 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496216; x=1697032216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N3PY5sTqIakd3ZAwXZ6GV5DaCIbckAbCs/P3GPnyNCI=;
 b=EJ4IpyvCWznpmXhMOuJYH+a9i9PZT/Dr7v48e+N/7ChW3i3lX5F2XFw4
 7hEXqoknhvle63cagNvVUXkdelPtBMqv/ZQvYSIACwHD0KK3Vb6NjxFRF
 P2pFetOG1avfYs4nkCiNl9cAEUy6Vpqht0baRFzVr5RdqXGg1LjXgxw9Z
 m9AbR+u2uaHiHkXnsNXcr2L+Rd28f1XxgP7ndb24dUjA9EZ1HEWhFwQOE
 QMEGIdqu8CzDEMffqV6X17UGn1N9zxGcxofFFLOe/EqhPlBK5vaPjrhAA
 69UI6TCSXTTEWWTixyiYbWEq50KFOjZ+HY7N9ExenfObINXPSS/yJI0qH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="287770986"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="287770986"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:15 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="659539857"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="659539857"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:13 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/15] drm/edid: debug log EDID override set/reset
Date: Tue, 11 Oct 2022 16:49:38 +0300
Message-Id: <3673fe73231b4eced1b3fe7da131950c602bb16e.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's useful debugging information to know if and when an override EDID
was set or reset.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 47465b9765f1..a863cffa2dc5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2194,6 +2194,9 @@ int drm_edid_override_set(struct drm_connector *connector, const void *edid,
 
 	connector->override_edid = false;
 
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override set\n",
+		    connector->base.id, connector->name);
+
 	ret = drm_connector_update_edid_property(connector, edid);
 	if (!ret)
 		connector->override_edid = true;
@@ -2206,6 +2209,9 @@ int drm_edid_override_reset(struct drm_connector *connector)
 {
 	connector->override_edid = false;
 
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override reset\n",
+		    connector->base.id, connector->name);
+
 	return drm_connector_update_edid_property(connector, NULL);
 }
 
-- 
2.34.1

