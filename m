Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168659E258E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E3D10EA95;
	Tue,  3 Dec 2024 16:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgjUWK7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC6F10EA8F;
 Tue,  3 Dec 2024 16:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733241718; x=1764777718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+nOs+80lMIHl40t5HhS52o11lMNNl2IDEbDjqkpZU8E=;
 b=NgjUWK7Ptx+8/qskwkH7sR5Of+Y2sOewj/GT8jndPCMlTMaTffO0+C1i
 t/fXUmkuY4hQQpJhVa9quRr46RcPUoc5kbbjnh7zDXhFzQiR6bJIBG5mk
 1Gtm6CFxSQY5So8dnFxTROBdvSRkrMqoqsmJ7SMvKZ3VC1I+RRE/OEb5M
 p33DbHC0E+Go68MJ4fAnjsk+akanJHw7Rp0Y58aiC0VAg4uask4+2VBvG
 2zACxd5uXqb8iRr5K5tvqAWEX9yVHiPTinDHvXHGSRQmCyiJbVLu4eylo
 Nf+lOFnOpwlVFXSVOJNvxqgJO/xrHpTsc9FynmtM75zH/1LuUF2h4F+5q A==;
X-CSE-ConnectionGUID: hSbjHRCDSges/IBYkAYIcg==
X-CSE-MsgGUID: FZelZKuSTkqbNJYaR73ngA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37236083"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="37236083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:58 -0800
X-CSE-ConnectionGUID: FYxi946kTdKypkyeBwWDWg==
X-CSE-MsgGUID: pI15cn30Sam8Sh7LewNuyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93313106"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 08:01:54 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH 7/7] drm/dp_mst: Use reset_msg_rx_state() instead of open
 coding it
Date: Tue,  3 Dec 2024 18:02:23 +0200
Message-ID: <20241203160223.2926014-8-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241203160223.2926014-1-imre.deak@intel.com>
References: <20241203160223.2926014-1-imre.deak@intel.com>
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

Use reset_msg_rx_state() in drm_dp_mst_handle_up_req() instead of
open-coding it.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index d6452a15daf6a..b6fb94b66bf79 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4184,7 +4184,7 @@ static int drm_dp_mst_handle_up_req(struct drm_dp_mst_topology_mgr *mgr)
 out_put_primary:
 	drm_dp_mst_topology_put_mstb(mst_primary);
 out_clear_reply:
-	memset(&mgr->up_req_recv, 0, sizeof(struct drm_dp_sideband_msg_rx));
+	reset_msg_rx_state(&mgr->up_req_recv);
 	return ret;
 }
 
-- 
2.44.2

