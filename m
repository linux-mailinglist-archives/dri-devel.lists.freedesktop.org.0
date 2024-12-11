Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCB39EDAB9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6136510EC4B;
	Wed, 11 Dec 2024 23:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MyzeSJKC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD0D10EC48;
 Wed, 11 Dec 2024 23:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733958174; x=1765494174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sps+KDb4UQ16DhP3fbAtZbfumgJPH20/L0ttyJUy/DQ=;
 b=MyzeSJKCYXAZlcxnCx5UJuJcRdiUg/+Ufqu7+bSkLnIpQyCbvVXwVehr
 r189JfYS/M/6ke1xskyhBt8lliy9PMl6sCfPxV+VQRXn+1A9U1OTelTQk
 VueamnhoGRJyoAJHHz0kabJWTcgkIvr90PdWHL5chCmefI8oydN2ChWM5
 73YKaCugoscYMfNo/yrEGoKr6ayPf8+srzBFSVElvyaJfkXAQ7MCpG6qH
 ImVqCRGCPOsOkMkGczwsXHjWhwhwQ5br+/ye07YGEFYrz9ShlBmLWCkJB
 ayy4gFVKIjLsP+vwbv6N1JiAmjaJBJigJsxZsgacp2BdB4OUnMQhb3kXA A==;
X-CSE-ConnectionGUID: cTArqJ9qT/y/4dsGuHeGlg==
X-CSE-MsgGUID: fNsxSc1YTZqLI20hxdgkvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34401470"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34401470"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:54 -0800
X-CSE-ConnectionGUID: JtABZAq9Q3yeIt3jPd4B2g==
X-CSE-MsgGUID: KS3ymazJT4asewfMbg8Ekw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126962339"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:52 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v3 02/11] drm/connector: Add FIXME for GETRESOURCES ioctl wrt.
 uninited connectors
Date: Thu, 12 Dec 2024 01:03:19 +0200
Message-ID: <20241211230328.4012496-3-imre.deak@intel.com>
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

The connectors enumerated by the GETRESOURCES ioctl may not be fully
initialized yet wrt. to the state set up during connector registration
(for instance the connector's debugfs/sysfs interfaces may not exist
yet). This can happen in two ways:

1. Connectors initialized and added to the
   drm_mode_config::connector_list during driver loading will be visible
   to the GETRESOURCES ioctl caller once the driver is registered via
   drm_dev_register()->drm_minor_register(DRM_MINOR_PRIMARY) and before
   the connectors are registered via drm_dev_register()->
   drm_modeset_register_all().

2. Dynamic connectors (MST) - after being initialized - may be added to
   the connector_list after the driver is loaded and registered and before
   the connector's userspace interfaces (debugfs, sysfs etc.) are added
   in drm_connector_dynamic_register().

A solution for 1. would be to register the driver only after the
connectors are registered, for 2. to add the connector to connector_list
only after the userspace interfaces are registered.

The fix would require a bigger change, not the topic of this patchset,
so adding only a FIXME comment here.

Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_mode_config.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 37d2e0a4ef4be..8642a2fb25a90 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -150,6 +150,15 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	count = 0;
 	connector_id = u64_to_user_ptr(card_res->connector_id_ptr);
+	/*
+	 * FIXME: the connectors on the list may not be fully initialized yet,
+	 * if the ioctl is called before the connectors are registered. (See
+	 * drm_dev_register()->drm_modeset_register_all() for static and
+	 * drm_connector_dynamic_register() for dynamic connectors.)
+	 * The driver should only get registered after static connectors are
+	 * fully initialized and dynamic connectors should be added to the
+	 * connector list only after fully initializing them.
+	 */
 	drm_for_each_connector_iter(connector, &conn_iter) {
 		/* only expose writeback connectors if userspace understands them */
 		if (!file_priv->writeback_connectors &&
-- 
2.44.2

