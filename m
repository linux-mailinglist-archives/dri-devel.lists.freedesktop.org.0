Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6921C8A7785
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 00:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BCD112EBB;
	Tue, 16 Apr 2024 22:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcDhZYYj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B10112EAD;
 Tue, 16 Apr 2024 22:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713305390; x=1744841390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9chYD/PbjE2mjvsyAXUzfis40R4bYbqDVget9kchoug=;
 b=kcDhZYYjdcFNKGtc2/nboyluX+lqR7Dx0mLQk+znqcXFi6JClh4lHGUc
 n1vZPpGZlbt54PauccjclDDJF14pxxAeF2KR3zcfR3qytBlnEhRdRlWRz
 MCndrEngZaxcRYafaLzjTKPIQST/BYI8LrTK/WRs44j78HhOa/jEYAQtZ
 3M3tBNRm21dy0dhcY5j1/ANFZRRh9NqAJRYk0YqUuHfyJmJa6undVnQPs
 /HKmyQPzM7lDMtQaxzTpF/I/SzCVMIsIy+3N8M0efkMxD7ZD5WdBa1FCA
 U1DTvCBDKPmwtGHoygPnaWsOWZvi4+7S+3vZa5m8qvkABnlUeZ4irsJmh A==;
X-CSE-ConnectionGUID: hU0lO7diRw2Hvo3dIXBtlQ==
X-CSE-MsgGUID: DWKHjWxwRziQlZ9Xc0XoJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20165183"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="20165183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:09:50 -0700
X-CSE-ConnectionGUID: /69XeE08Rs+AEFMIo3jqUA==
X-CSE-MsgGUID: 4a8tCrXGQ02YvEAheClqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="26965507"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 15:09:48 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 09/11] drm/dp_mst: Add drm_dp_mst_aux_for_parent()
Date: Wed, 17 Apr 2024 01:10:08 +0300
Message-ID: <20240416221010.376865-10-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
In-Reply-To: <20240416221010.376865-1-imre.deak@intel.com>
References: <20240416221010.376865-1-imre.deak@intel.com>
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

v2: Move drm_dp_mst_aux_for_parent() forward declaration to this patch
    (Ankit)

Cc: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 16 ++++++++++++++++
 include/drm/display/drm_dp_mst_helper.h       |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 46b99d5fe0086..3577786b5db2c 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -6010,6 +6010,22 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
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
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index f00e32b0315d7..3546b58a121bc 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -954,6 +954,7 @@ bool drm_dp_mst_port_is_logical(struct drm_dp_mst_port *port)
 	return port->port_num >= DP_MST_LOGICAL_PORT_0;
 }
 
+struct drm_dp_aux *drm_dp_mst_aux_for_parent(struct drm_dp_mst_port *port);
 struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port);
 
 static inline struct drm_dp_mst_topology_state *
-- 
2.43.3

