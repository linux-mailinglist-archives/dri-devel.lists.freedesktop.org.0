Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5852688185B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 21:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7A510E797;
	Wed, 20 Mar 2024 20:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uj3S9lnx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04AA10E6D9;
 Wed, 20 Mar 2024 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710965493; x=1742501493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DmggUTF2ymA+MnUG35CLxTBhJVrdVFJDrR4vmN0IyCw=;
 b=Uj3S9lnxSsc+zTaQM0PlOdxnuVfLocjzMrHvsGtNLhBy30x/RsOdWo8e
 bn9m4HRLMLSPaHGvM11nnxZMLEIeB8z1/bNrvVSW2yM3oTH7ZeRtpDrRo
 RpnIpxQHGB2f9j95aMj/VY56eM7aNjwD3rdVRU1Lpiy0xsTuS/uRpMwIn
 kOKTP+yL/6eHaSh2ll3AECzHt8sPRO3V8fzEpH9TSYxRGVgIuYF79kTtL
 wTgIzFk88sncPYvIQ8jmohxMpWtYsyCIBxGFWAAXLs5wvCMb6zZx/GjGX
 3050IQzt/9QlZgyLfZnpaEzYvh4Vaw94cgCg2JjFoH06rDfjCIwq5t9Y4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="31352346"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="31352346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="14246526"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 13:11:32 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/11] drm/dp_mst: Add drm_dp_mst_aux_for_parent()
Date: Wed, 20 Mar 2024 22:11:49 +0200
Message-ID: <20240320201152.3487892-10-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240320201152.3487892-1-imre.deak@intel.com>
References: <20240320201152.3487892-1-imre.deak@intel.com>
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

Add a function to get the AUX device of the parent of an MST port, used
by a follow-up i915 patch in the patchset.

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 6bd471a2266ce..d70f7de644371 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -6004,6 +6004,22 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
 	return false;
 }
 
+/**
+ * drm_dp_mst_aux_for_parent() - Get the AUX device for an MST port's parent
+ * @port: MST port whose parent's AUX device is returned
+ *
+ * Return the AUX device for @port's parent or NULL if port's parent is the
+ * root port.
+ */
+struct drm_dp_aux *drm_dp_mst_aux_for_parent(struct drm_dp_mst_port *port)
+{
+	if (!port->parent || !port->parent->port_parent)
+		return NULL;
+
+	return &port->parent->port_parent->aux;
+}
+EXPORT_SYMBOL(drm_dp_mst_aux_for_parent);
+
 /**
  * drm_dp_mst_dsc_aux_for_port() - Find the correct aux for DSC
  * @port: The port to check. A leaf of the MST tree with an attached display.
-- 
2.43.3

