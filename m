Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E569EDAC2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8131110EC59;
	Wed, 11 Dec 2024 23:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SrOCrmZ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CC910EC53;
 Wed, 11 Dec 2024 23:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733958178; x=1765494178;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7/nOdPtf+5lAMIbv9oQ0HbQU5bIXHkU0aUSQmj+8K7M=;
 b=SrOCrmZ9ljgTfUL3/qJoPNXhTjvn29zIOCHZhddrJs5VvwOKHaZcvN8+
 /yuugUmyuXugaoBiPb9OiTwlI0GKyQXJNAnPxNbxBXGEzy7WwVvuloLon
 CA03XNLH64uarndGLZOHN904wRV/hxM3xa7x7CrYtdIRYleKooSewAJ1I
 uJim8/7xec2vUlFy3LYFP0+Zc3jgVzNsE4WKgwYb9PwNgcik/JiMD7blE
 WmP4q8BtlJCpNqiJGnB7Z4I2QnAa179/uyPSClu597bhWyfs63izUdpCV
 0wa0FNLwiTEKnmDmikYFL4e9GGs7/Et2A5nAR7ZrGRd01KTkQckYMhBAc A==;
X-CSE-ConnectionGUID: aILRzOfLSlqMHdllJIYL/A==
X-CSE-MsgGUID: T8CNNra7SLerzemIfsen+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34401479"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34401479"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:58 -0800
X-CSE-ConnectionGUID: lrk1rqh9RSaI+8uFsPshgA==
X-CSE-MsgGUID: UJkpOf6tR6OLST4KE41aNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126962423"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:54 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 04/11] drm/dp_mst: Register connectors via
 drm_connector_dynamic_register()
Date: Thu, 12 Dec 2024 01:03:21 +0200
Message-ID: <20241211230328.4012496-5-imre.deak@intel.com>
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

MST connectors should be initialized/registered by calling
drm_connector_dynamic_init()/drm_connector_dynamic_register(). The
previous patch adding these functions explains the issue with the
current drm_connector_init*()/drm_connector_register() interface for
MST connectors.

Based on the above adjust here the registration part and change the
initialization part in follow-up patches for each driver.

For now, drivers are allowed to keep using the drm_connector_init*()
functions, by drm_connector_dynamic_register() checking for this (see
drm_connector_add()). A patch later will change this to WARN in such
cases.

Cc: Lyude Paul <lyude@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 687c70308d82b..f8cd094efa3c0 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -2281,7 +2281,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
 		port->cached_edid = drm_edid_read_ddc(port->connector,
 						      &port->aux.ddc);
 
-	drm_connector_register(port->connector);
+	drm_connector_dynamic_register(port->connector);
 	return;
 
 error:
-- 
2.44.2

