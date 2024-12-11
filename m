Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824869EDABD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593CB10EC50;
	Wed, 11 Dec 2024 23:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="luBo8kR8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB4010EC4C;
 Wed, 11 Dec 2024 23:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733958175; x=1765494175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6vj+6m0y6CENXxyub1QD6Q84DwS6vI2KU/FS8bllgt8=;
 b=luBo8kR8FjzI5nC00bjGAp1PCKO8pLKMn4LaLBcuxLGWd6qJDZLtbtTK
 cSUSZQApBRA0RqCtdVVorSvFJrN74UMAzKYXliDVCtgFbaDzAKkdpJuHv
 GkDUIOtGUGoxws1dkJ1FjKO0PL+zNxP5HRglWOzpaI5+0zai/hQzslZW7
 bPn1VxmGZxmmaXh3oR/OHjbhkyXcLa6zBKO1Na1xII8BtZuAXGdX4+suj
 Fc2dNsJRtlYhRMBVxOlzAED6c6WHyfFqlsJSljmoCD++Nil3xJ7lpcsnt
 mMCohpNZNM06rYe2PjKcLV9VB0gpip72spPTZxkxJyPb1OM7P1atMcQxj A==;
X-CSE-ConnectionGUID: VGnTFwIETc2mbslWuOGUtQ==
X-CSE-MsgGUID: wz9ANd/ZTt2j34UywKl1sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34401474"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34401474"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:55 -0800
X-CSE-ConnectionGUID: SnW0xtP/Sx+ByTtx4/4aqw==
X-CSE-MsgGUID: N2TSx91KRjKPeL/YH/xZTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126962374"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:53 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 03/11] drm/connector: Add deprication notes for
 drm_connector_register/unregister
Date: Thu, 12 Dec 2024 01:03:20 +0200
Message-ID: <20241211230328.4012496-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241211230328.4012496-1-imre.deak@intel.com>
References: <20241211230328.4012496-1-imre.deak@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers should register/unregister only dynamic (MST) connectors
manually using drm_connector_dynamic_register()/unregister().
Static connectors are registered/unregistered by the DRM core
automatically. Some drivers still call drm_connector_register()/
unregister() for static connectors, both of which should be a nop
for them and hence are scheduled to be removed. Update the function
documentation for these functions accordingly.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_connector.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a53e5629ba6c1..c322dbf6e3161 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -767,14 +767,17 @@ EXPORT_SYMBOL(drm_connector_cleanup);
  * drm_connector_register - register a connector
  * @connector: the connector to register
  *
- * Register userspace interfaces for a connector. Only call this for connectors
- * which can be hotplugged after drm_dev_register() has been called already,
- * e.g. DP MST connectors. All other connectors will be registered automatically
- * when calling drm_dev_register().
+ * Register userspace interfaces for a connector. Drivers shouldn't call this
+ * function. Static connectors will be registered automatically by DRM core
+ * from drm_dev_register(), dynamic connectors (MST) should be registered by
+ * drivers calling drm_connector_dynamic_register().
  *
  * When the connector is no longer available, callers must call
  * drm_connector_unregister().
  *
+ * Note: Existing uses of this function in drivers should be a nop already and
+ * are scheduled to be removed.
+ *
  * Returns:
  * Zero on success, error code on failure.
  */
@@ -863,9 +866,14 @@ EXPORT_SYMBOL(drm_connector_dynamic_register);
  * drm_connector_unregister - unregister a connector
  * @connector: the connector to unregister
  *
- * Unregister userspace interfaces for a connector. Only call this for
- * connectors which have been registered explicitly by calling
- * drm_connector_register().
+ * Unregister userspace interfaces for a connector. Drivers should call this
+ * for dynamic connectors (MST) only, which were registered explicitly by
+ * calling drm_connector_dynamic_register(). All other - static - connectors
+ * will be unregistered automatically by DRM core and drivers shouldn't call
+ * this function for those.
+ *
+ * Note: Existing uses of this function in drivers for static connectors
+ * should be a nop already and are scheduled to be removed.
  */
 void drm_connector_unregister(struct drm_connector *connector)
 {
-- 
2.44.2

