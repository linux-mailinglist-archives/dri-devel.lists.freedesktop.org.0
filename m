Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A5E30A70D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 13:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E7889DE1;
	Mon,  1 Feb 2021 12:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A260E89DDD;
 Mon,  1 Feb 2021 12:01:59 +0000 (UTC)
IronPort-SDR: se2IYS/+0nHF0cRx+DOixL73MhbHFmIrXSFXN1ECmWzqajjuu1zFXYGfAVVgxY01bMF45WeRX2
 xc639x72V7pQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="178108174"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="178108174"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 04:01:57 -0800
IronPort-SDR: 5te+dSWzpMjVjVAiMVuT0uYTTW+X4Fm9d9PDwHyO2uO0y6kdDAkJIbTf+KhPwe3nBlIcjMOLQt
 +pchkhiYUWMw==
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="390880803"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 04:01:52 -0800
From: Imre Deak <imre.deak@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/dp_mst: Don't report ports connected if nothing is
 attached to them
Date: Mon,  1 Feb 2021 14:01:42 +0200
Message-Id: <20210201120145.350258-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reporting a port as connected if nothing is attached to them leads to
any i2c transactions on this port trying to use an uninitialized i2c
adapter, fix this.

Let's account for this case even if branch devices have no good reason
to report a port as unplugged with their peer device type set to 'none'.

Fixes: db1a07956968 ("drm/dp_mst: Handle SST-only branch device case")
References: https://gitlab.freedesktop.org/drm/intel/-/issues/2987
References: https://gitlab.freedesktop.org/drm/intel/-/issues/1963
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: <stable@vger.kernel.org> # v5.5+
Cc: intel-gfx@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index e82b596d646c..deb7995f42fa 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4224,6 +4224,7 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
 
 	switch (port->pdt) {
 	case DP_PEER_DEVICE_NONE:
+		break;
 	case DP_PEER_DEVICE_MST_BRANCHING:
 		if (!port->mcs)
 			ret = connector_status_connected;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
