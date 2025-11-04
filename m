Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D87DC31C99
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7405710E621;
	Tue,  4 Nov 2025 15:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="fDIRjrW6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azhn15010010.outbound.protection.outlook.com [52.102.149.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E0110E621
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:15:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHiUqqDvazCnphTgbcMjD9uDnrgNLq9I42ho9038k1Vb3FIVRzc9Jg0TKOEAZfJh/KZ1NwLWRbH3Ge1vigRuBBX9AicfjheAVnEDHyKslMBL7xK/W+62OjbDDkHbmVHDl7gU6cIWdQjlEUVpAJMDlK5EYgS9buavkfWF5y2JkQYRkrO/sAlF5ma/zbYIEP8auZGzkcnl+WRSllPHuNdG0cIupySGb+KAPRnKjXb34mKIw/TMk3OCjTapRpc7I+OJLrbaMJQzfPFbJhTX0icW70QEIrwgrrTi9EkEXe9R25WVT7y7R8chb92y800BdQcOSmT/0yaTfB6MzBLeoLHt7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM4iMTD7PH4U9ruG5aXe4R1Dt2U4/gsw4+SIZo94DFo=;
 b=PRv2Ut0qPlnBUDBWG6aTGj2/Ea0R1ahorq5B2vLcf3WgLWq06fP86vv5iRr4hmsYpdCWh0vu5Up9J8OosF8IlS5LMRGdQwo0hxIAqk3sgNTuwnU5HdLwLjShrqx9J3+EOeNKjMCvmsJn68xN669ATlRAehwrCNxQ1iGSXlrZkbpG8BFBcQZirm4H3iuFgB2FazR70R5hLRSOHLiiqpPwwimE8YFrVcGuXY46i4UwzTEkD8gLWTPOUoxVqLeI1yC6xvNbVGMobNutHBIamojq6jdpu4lrSOc/k+84H5wpW/Hs4ZKxw34GEW1Ox8qQlJK3VXHaSqUqyvb5c0TqFo7t9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wM4iMTD7PH4U9ruG5aXe4R1Dt2U4/gsw4+SIZo94DFo=;
 b=fDIRjrW6PUKMKTCQOY93ogkP4/8EVTLWNMKN621BPkVaH4adzwwwTXB2J1OmnZAHtL75orvVf7PDG6UMvZox6SfXzZjtCmCFhXgoS2evgd8s7ah4Vd+1hL5/tvENK9WvVR6hxzfiG5Lo7/nZkhXbUeRGHu8tNKd/wx8ENNxcZrQ=
Received: from CH0PR08CA0015.namprd08.prod.outlook.com (2603:10b6:610:33::20)
 by LV3PR10MB8035.namprd10.prod.outlook.com (2603:10b6:408:281::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 15:15:03 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::4) by CH0PR08CA0015.outlook.office365.com
 (2603:10b6:610:33::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 15:14:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 4 Nov 2025 15:15:02 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 09:14:38 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 09:14:37 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 09:14:37 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A4FENHc2142428;
 Tue, 4 Nov 2025 09:14:33 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <mripard@kernel.org>,
 <tomi.valkeinen@ideasonboard.com>, <jyri.sarha@iki.fi>,
 <maarten.lankhorst@linux.intel.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <tzimmermann@suse.de>, <h-shenoy@ti.com>
CC: <praneeth@ti.com>, <u-kumar1@ti.com>, <vigneshr@ti.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <s-jain1@ti.com>
Subject: [PATCH v8 2/2] drm/tidss: Move OLDI mode validation to OLDI bridge
 mode_valid hook
Date: Tue, 4 Nov 2025 20:44:22 +0530
Message-ID: <20251104151422.307162-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104151422.307162-1-s-jain1@ti.com>
References: <20251104151422.307162-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|LV3PR10MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ac0ee2-d44d-4d8d-67bc-08de1bb4edc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|34020700016|1800799024|82310400026|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nFvVfO+49Un9lpMik8iABI9KNJCHNMDGiFIOieAerCb/zk0BoSdY+vFkvEeY?=
 =?us-ascii?Q?7yY4b6Wnzwq3SVA9A2ssDGgMm86Mw+alZnZFQ84h70Vdl6ddlAz+RDKhodnO?=
 =?us-ascii?Q?Dz5JvHPIaukjuwC9PcHGiVo6aSRB1liHmB6MHNmiVI4WBsalyQbkMypUYyN4?=
 =?us-ascii?Q?HozqSpTqmnVEChPglCC/DetetWLWcoWrdAHF3yxNLf8IIy8hEBtoUwvpg074?=
 =?us-ascii?Q?BXDueAEDf8rCbXo6OxyGuA8piLi8WIBvXT4/3uE87M3TNoVmcRaG4sdEmkO5?=
 =?us-ascii?Q?7la7hSEWQLe+x+2ohoV+3tu/9wVpFttpEU6ojGU+XMIvTHXX6VXQfhYZ/ENj?=
 =?us-ascii?Q?IyTR/oO5sJ1lKG2BbLsrvgIlClPe7XQCDt+3xsXqW1WoW7Nkyvvz6hiHKR7l?=
 =?us-ascii?Q?1eiifffNOhp7/fXdh7iDNY6MmVcsV4vGKBVz3Ns++ftK0mC2qVj84vR3S6+H?=
 =?us-ascii?Q?dE5AWvX57OR8aBSlxXEnCMBmLvK2wzYesgsYsEtIFAcHx5XhqXCpZ3Hq97lC?=
 =?us-ascii?Q?ILYQOYcIY0sEqhIk3xMOQF3jqa++an5zcNOYlJC5c7sleCNdTClZPRWBDArE?=
 =?us-ascii?Q?e6R2nNQtQH7Dg0N4IgEmXoUzLLHP1Um2RI+QnD3vf+nM5VVG56lRAwmOP0K9?=
 =?us-ascii?Q?YCMgWJLqYQkZszaDW/hvCtxJpd8bFLnr3ZJiatno/sJ5qqIYl1PMF9+SLVR6?=
 =?us-ascii?Q?fVgTUFtZeu9qCpSJdjhLOr5kUtjZO72wG/5W6D3oqXa7BnzLRwOgiKl1uLv9?=
 =?us-ascii?Q?i767d9F03ZI0+j0Dbcxeu1nBEV3nDkTCZXh/nVJ/RgcDxDjb78tTMFGyyDUo?=
 =?us-ascii?Q?S/Idur0lXwiKHHFU6wTXGdxQ5NPprG1uBUfrjrZtPDwVIDUBoSnenfHGkmTo?=
 =?us-ascii?Q?TJ9GwbNCWcw1oSeVapsCjOnyrXJACQJ3efknmhey3b8hT9uoRmtC685da9GI?=
 =?us-ascii?Q?2YPtHXLH1nMmJx5C8LvcjEgLB5lJpaMMem/HkLnWAgupj+ZFCU0fXhEsyddS?=
 =?us-ascii?Q?l9GnKEsG0KmaOOxz/yXW/gd4YS5fu5Sl3cmIx57tQS2RHbTkjzxB2R8h/Csj?=
 =?us-ascii?Q?HS0OxE1F2UicHcyu3Td1bZz1nfB7+XCVF8rKmdd4yrQ3TgxG7tJzmjOVYhPS?=
 =?us-ascii?Q?dcUB16i8GwmY1uAV5MpzVSiSchTErIHR7WSYq8bTldJ+DB9FZo94F2208/cy?=
 =?us-ascii?Q?hc6DHqJLmzBEDKeanqlF72foVENbTk61QyGYXFak3x5DJsUM9Pewyl3oX3s4?=
 =?us-ascii?Q?ERh05zWHHR+0zQb0do4drg18y91RO9TgiyWPg9ium2fwASE47GL7l2M2nXaL?=
 =?us-ascii?Q?M0p+pHIbbTQXypnqEW/4MFnaeSsHJdqpo1icMiucyrlODxZt0arYizbeqW71?=
 =?us-ascii?Q?Lff7RpnlCcGARg3Ky1e4BdeJz9mtICuKsRM2Qc4gTNkG+TtSgH+zq6D7ZALG?=
 =?us-ascii?Q?EICFVD1idsHwRC0sLc/Ek0khl1+hQfF1Tkl0JJDBQqUO6iWYK4u9JEsMS/2m?=
 =?us-ascii?Q?yqBvUWkny4pQl0QfCIAbU6w3ezcxW6tAXjSL3IxAzJ+7RH0jS4bnS8WLWKdI?=
 =?us-ascii?Q?Gn1rxyqWqkAWpN/y4OcXwzEH/HPUvtKX1B4EiFbD?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(34020700016)(1800799024)(82310400026)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 15:15:02.9204 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ac0ee2-d44d-4d8d-67bc-08de1bb4edc2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8035
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

From: Jayesh Choudhary <j-choudhary@ti.com>

After integrating OLDI support[0], it is necessary to identify which VP
instances use OLDI, since the OLDI driver owns the video port clock
(as a serial clock). Clock operations on these VPs must be delegated to
the OLDI driver, not handled by the TIDSS driver. This issue also
emerged in upstream discussions when DSI-related clock management was
attempted in the TIDSS driver[1].

To address this, add an 'is_ext_vp_clk' array to the 'tidss_device'
structure, marking a VP as 'true' during 'tidss_oldi_init()' and as
'false' during 'tidss_oldi_deinit()'. TIDSS then uses 'is_ext_vp_clk'
to skip clock validation checks in 'dispc_vp_mode_valid()' for VPs
under OLDI control.

Since OLDI uses the DSS VP clock directly as a serial interface and
manages its own rate, mode validation should be implemented in the OLDI
bridge's 'mode_valid' hook. This patch adds that logic, ensuring proper
delegation and avoiding spurious clock handling in the TIDSS driver.

[0]: https://lore.kernel.org/all/20250528122544.817829-1-aradhya.bhatia@linux.dev/
[1]: https://lore.kernel.org/all/DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org/

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Tested-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c |  7 +++++++
 drivers/gpu/drm/tidss/tidss_drv.h   |  2 ++
 drivers/gpu/drm/tidss/tidss_oldi.c  | 22 ++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index b11880178cba..ea5001311f1a 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1315,6 +1315,13 @@ static inline int check_pixel_clock(struct dispc_device *dispc,
 {
 	unsigned long round_clock;
 
+	/*
+	 * For VP's with external clocking, clock operations must be
+	 * delegated to respective driver, so we skip the check here.
+	 */
+	if (dispc->tidss->is_ext_vp_clk[hw_videoport])
+		return 0;
+
 	round_clock = clk_round_rate(dispc->vp_clk[hw_videoport], clock);
 	/*
 	 * To keep the check consistent with dispc_vp_set_clk_rate(), we
diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 84454a4855d1..e1c1f41d8b4b 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -24,6 +24,8 @@ struct tidss_device {
 
 	const struct dispc_features *feat;
 	struct dispc_device *dispc;
+	bool is_ext_vp_clk[TIDSS_MAX_PORTS];
+
 
 	unsigned int num_crtcs;
 	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 7688251beba2..17c535bfa057 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -309,6 +309,25 @@ static u32 *tidss_oldi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
+static enum drm_mode_status
+tidss_oldi_mode_valid(struct drm_bridge *bridge,
+		      const struct drm_display_info *info,
+		      const struct drm_display_mode *mode)
+{
+	struct tidss_oldi *oldi = drm_bridge_to_tidss_oldi(bridge);
+	unsigned long round_clock;
+
+	round_clock = clk_round_rate(oldi->serial, mode->clock * 7 * 1000);
+	/*
+	 * To keep the check consistent with dispc_vp_set_clk_rate(),
+	 * we use the same 5% check here.
+	 */
+	if (dispc_pclk_diff(mode->clock * 7 * 1000, round_clock) > 5)
+		return -EINVAL;
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
 	.attach	= tidss_oldi_bridge_attach,
 	.atomic_pre_enable = tidss_oldi_atomic_pre_enable,
@@ -317,6 +336,7 @@ static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.mode_valid = tidss_oldi_mode_valid,
 };
 
 static int get_oldi_mode(struct device_node *oldi_tx, int *companion_instance)
@@ -430,6 +450,7 @@ void tidss_oldi_deinit(struct tidss_device *tidss)
 	for (int i = 0; i < tidss->num_oldis; i++) {
 		if (tidss->oldis[i]) {
 			drm_bridge_remove(&tidss->oldis[i]->bridge);
+			tidss->is_ext_vp_clk[tidss->oldis[i]->parent_vp] = false;
 			tidss->oldis[i] = NULL;
 		}
 	}
@@ -580,6 +601,7 @@ int tidss_oldi_init(struct tidss_device *tidss)
 		oldi->bridge.timings = &default_tidss_oldi_timings;
 
 		tidss->oldis[tidss->num_oldis++] = oldi;
+		tidss->is_ext_vp_clk[oldi->parent_vp] = true;
 		oldi->tidss = tidss;
 
 		drm_bridge_add(&oldi->bridge);
