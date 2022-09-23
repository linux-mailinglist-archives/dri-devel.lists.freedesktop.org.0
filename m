Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3443A5E845E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C3410E99C;
	Fri, 23 Sep 2022 20:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C016F10E993;
 Fri, 23 Sep 2022 20:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSpfBGoukY5A1r2ot67wVWFYJNU3FTN9fy2ZyjP8yPsB15X3iRVlq7B0YCyY0KSOEVUfToVcJ0xmJBe/H/kWKbPjiRBSvWMZ3a8RcVeU82S8kO9D/KrCQ2gDq+FzOyn1MZb9DzFGs7bxNXGCtsHTJXt0KGP+jqs1OrFMHQF++MSxIUi40xxGXZfhOiZsTpi+bUI7b3cS9T/HeN2lwcetHVbAwEcjyQYfLinKmUwUGkfWs+AlOAvPmZUAUD3SUbWKLwIEC+ZLH0iLcuMMQJ0aCSKEtC5KXKSiZkW5pHcDbA6RqEhy+NLW8K2lyHIsz1NDCeL7t8eaVFrpbLzRYGaVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPPpZbvK0rrna2XUNIBSgOVGlDsfDzSm/99WzeOdlao=;
 b=Ye4Zb0vqoRriLSJVA5UXTDP+ZPx77aNYIomkKD+NUDFR7pjlPs19j57lvha+/2ByYjatvlPt0W7eoecqzbBnC4wmPVlb4hWhI6zpBK7lhArOTNnemJfqbNHCY7ySV16+b3SrDXA38K2qTKId2HLx/qqWLBILxEulfxyqCrRXB8veQD5InkhEux+E2PiNPnaw9hFmRYLdj8l7/XlRFdo5SQR5s6OHkhCwW/k5lS6KPmY0aa4nX0tYT8XMmfRwumrAmdOpjqZWRiqdxgDYURhRjsLBZH1SZmJBWXYXj5a31ULF1Sam9ywQkjUL514DVsBjv05yPAwqr5xDinZJc3o/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPPpZbvK0rrna2XUNIBSgOVGlDsfDzSm/99WzeOdlao=;
 b=xO+A57WVISAIm7tULeUTotwxuoDmwXyXP4EY/G/LlQR0ksHOp0doQR0LP8TL0kcS88Jlk+8BlE1JhRYx1mfeLAOpyA6Fm0usXnk+LWi8JZ2aFS43Lxhyja90Mp/UGW39n+T1T8bMNCvrHdsPi3AoniQjmqZBknCZGB08vVUzQuM=
Received: from DM6PR02CA0125.namprd02.prod.outlook.com (2603:10b6:5:1b4::27)
 by DM4PR12MB5326.namprd12.prod.outlook.com (2603:10b6:5:39a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 20:52:51 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::e9) by DM6PR02CA0125.outlook.office365.com
 (2603:10b6:5:1b4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20 via Frontend
 Transport; Fri, 23 Sep 2022 20:52:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Fri, 23 Sep 2022 20:52:51 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 23 Sep
 2022 15:52:49 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] drm/amd/display: save and restore a connector's HDCP
 properties
Date: Fri, 23 Sep 2022 16:52:29 -0400
Message-ID: <20220923205234.207628-2-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220923205234.207628-1-hamza.mahfooz@amd.com>
References: <20220923205234.207628-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT051:EE_|DM4PR12MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd4d57a-9507-4b53-26c4-08da9da594c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bttjQjTJcajWq/pQske2jYN4vZ4Nnt0Pd8wb+qYJ563t1TKlNt4E7a/ZwCyzgc5TokV8E/LhuDDMs5S3PXbhdYvQWkiIkmJFWL4jNHRQSu3EmJC3XEzzfGPLe8nGUnMxXWL54a9V/09A2NXrJ9yqkWzTPgn+WERs5M52AE1fXE6EjdFGB8evxQ+jwGPurhbsroK2ZoIY0YThz0sIixtD95qsVvcI7hUnfodiuJXkxmQdwkIiTS6/Dlrwc3WezCPqP+8CzC65sbruhGbc+EU54FilN/LYfcnXV30zwRh+84X0z+MGEk/G8X61VGO9fB8VxuNpPYzHq7WV9ZTcyTWND6ZVDDz4dJIkeXlzRGermMcHpNEXjQH2zc2ooSf6SwHBNb2vU79dAhrLgMZaTtd77wquh7+QpSSHh8oSWhXxkN3T92N6jKkOILGdDrFKOESbCputBuuRpIXUs52aubRuO/iIC1B61t+nnPxIpIwmTVQLQWLodSNm3G9Y2gtUUyRP1sWIjYn8q2BUI+rl2+9xovxkun4ZA0QziV8LgXFXtSQphbGky6SY7pbEYzYJbZ1NeuQL9q9LNgXVjQl9STUGI6IjESLNOs1rbLEaeBbFZ+sucNGvAgez9NkhFvZCsLFwGQYoKtYwQe26CWXpLww3OMsyS1iG6wI61T9Tjgf6/miSa48g16JZPhi4PO/c+wvTa0MHyhlZYUBHwk/jRnxc/GjGUCZJgSr2/X/Z5XS8CIY9/CU7R3r+YbWHUvLgQZUXxluGntKHX//yPNO8+IalXwgu78LP3yrH4hhKqhso0RYrK1oNFf5aWx+iVJA99ZfSAEtRqv/8idK9AiBLLR1WPA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(2906002)(44832011)(356005)(82310400005)(26005)(81166007)(36756003)(40460700003)(2616005)(1076003)(16526019)(186003)(4326008)(70586007)(70206006)(5660300002)(86362001)(8676002)(8936002)(426003)(6916009)(316002)(54906003)(478600001)(6666004)(7696005)(82740400003)(36860700001)(40480700001)(41300700001)(336012)(47076005)(83380400001)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 20:52:51.6194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd4d57a-9507-4b53-26c4-08da9da594c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5326
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Leo Li <sunpeng.li@amd.com>, Jude Shih <shenshih@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne
 Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a display is unplugged from a MST hub, the connector will be
destroyed in dm_dp_mst_connector_destroy(). The connector's HDCP
properties, like HDCP state will be lost. So, save the connector's HDCP
properties into hdcp_work in amdgpu_dm_atomic_commit_tail(). Also, if
the same display is plugged back in with the same display index, restore
its HDCP properties from hdcp_work in dm_dp_mst_get_modes().

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 56 +++++++++++++++++--
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.h    | 13 +++++
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 33 +++++++++++
 3 files changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ece2003a74cc..8d8788792f7d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7990,6 +7990,12 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct drm_connector *connector;
 	struct drm_connector_state *old_con_state, *new_con_state;
 	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
+#ifdef CONFIG_DRM_AMD_DC_HDCP
+	struct dc_edid_caps *edid_caps;
+	struct hdcp_workqueue *hdcp_work, *hdcp_w;
+	unsigned int index;
+	bool enable_encryption = false;
+#endif
 	int crtc_disable_count = 0;
 	bool mode_set_reset_required = false;
 
@@ -8165,11 +8171,51 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			continue;
 		}
 
-		if (is_content_protection_different(new_con_state, old_con_state, connector, adev->dm.hdcp_workqueue))
-			hdcp_update_display(
-				adev->dm.hdcp_workqueue, aconnector->dc_link->link_index, aconnector,
-				new_con_state->hdcp_content_type,
-				new_con_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED);
+		if (is_content_protection_different(new_con_state,
+						    old_con_state,
+						    connector,
+						    adev->dm.hdcp_workqueue)) {
+
+			if (new_con_state->content_protection ==
+			    DRM_MODE_CONTENT_PROTECTION_DESIRED)
+				enable_encryption = true;
+
+			if (aconnector->dc_link && aconnector->dc_sink &&
+			    aconnector->dc_link->type ==
+			    dc_connection_mst_branch) {
+				hdcp_work = adev->dm.hdcp_workqueue;
+				hdcp_w = &hdcp_work[
+					aconnector->dc_link->link_index];
+				edid_caps = &aconnector->dc_sink->edid_caps;
+				index = connector->index;
+
+				hdcp_w->sink_edid_id[index].manufacturer_id =
+					edid_caps->manufacturer_id;
+				hdcp_w->sink_edid_id[index].product_id =
+					edid_caps->product_id;
+				hdcp_w->sink_edid_id[index].serial_number =
+					edid_caps->serial_number;
+				hdcp_w->sink_edid_id[index].manufacture_week =
+					edid_caps->manufacture_week;
+				hdcp_w->sink_edid_id[index].manufacture_year =
+					edid_caps->manufacture_year;
+
+				hdcp_w->hdcp_content_type[index] =
+					new_con_state->hdcp_content_type;
+				hdcp_w->content_protection[index] =
+					new_con_state->content_protection;
+
+				if (new_crtc_state &&
+				    new_crtc_state->mode_changed)
+					enable_encryption = true;
+			}
+
+			hdcp_update_display(adev->dm.hdcp_workqueue,
+					    aconnector->dc_link->link_index,
+					    aconnector,
+					    new_con_state->hdcp_content_type,
+					    enable_encryption);
+		}
 	}
 #endif
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
index b2dbc0719472..31a81ee5ab69 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.h
@@ -37,6 +37,14 @@ struct mod_hdcp_link;
 struct mod_hdcp_display;
 struct cp_psp;
 
+struct sink_identification {
+	uint16_t manufacturer_id;
+	uint16_t product_id;
+	uint32_t serial_number;
+	uint8_t manufacture_week;
+	uint8_t manufacture_year;
+};
+
 struct hdcp_workqueue {
 	struct work_struct cpirq_work;
 	struct work_struct property_update_work;
@@ -53,6 +61,11 @@ struct hdcp_workqueue {
 
 	enum mod_hdcp_encryption_status encryption_status[
 		AMDGPU_DM_MAX_DISPLAY_INDEX];
+
+	struct sink_identification sink_edid_id[AMDGPU_DM_MAX_DISPLAY_INDEX];
+	unsigned int hdcp_content_type[AMDGPU_DM_MAX_DISPLAY_INDEX];
+	unsigned int content_protection[AMDGPU_DM_MAX_DISPLAY_INDEX];
+
 	uint8_t max_link;
 
 	uint8_t *srm;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index ce6929224a6e..872c83e61a13 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -31,6 +31,9 @@
 #include "amdgpu.h"
 #include "amdgpu_dm.h"
 #include "amdgpu_dm_mst_types.h"
+#ifdef CONFIG_DRM_AMD_DC_HDCP
+#include "amdgpu_dm_hdcp.h"
+#endif
 
 #include "dc.h"
 #include "dm_helpers.h"
@@ -272,6 +275,10 @@ static bool retrieve_downstream_port_device(struct amdgpu_dm_connector *aconnect
 static int dm_dp_mst_get_modes(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
+#ifdef CONFIG_DRM_AMD_DC_HDCP
+	struct hdcp_workqueue *hdcp_work, *hdcp_w;
+	unsigned int index;
+#endif
 	int ret = 0;
 
 	if (!aconnector)
@@ -344,6 +351,32 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 		/* dc_link_add_remote_sink returns a new reference */
 		aconnector->dc_sink = dc_sink;
 
+#ifdef CONFIG_DRM_AMD_DC_HDCP
+		if (aconnector->dc_sink && connector->state) {
+			hdcp_work =
+				drm_to_adev(connector->dev)->dm.hdcp_workqueue;
+			hdcp_w = &hdcp_work[aconnector->dc_link->link_index];
+			index = connector->index;
+
+			if (hdcp_w->sink_edid_id[index].manufacturer_id ==
+			    aconnector->dc_sink->edid_caps.manufacturer_id &&
+			    hdcp_w->sink_edid_id[index].product_id ==
+			    aconnector->dc_sink->edid_caps.product_id &&
+			    hdcp_w->sink_edid_id[index].serial_number ==
+			    aconnector->dc_sink->edid_caps.serial_number &&
+			    hdcp_w->sink_edid_id[index].manufacture_week ==
+			    aconnector->dc_sink->edid_caps.manufacture_week &&
+			    hdcp_w->sink_edid_id[index].manufacture_year ==
+			    aconnector->dc_sink->edid_caps.manufacture_year) {
+
+				connector->state->hdcp_content_type =
+					hdcp_w->hdcp_content_type[index];
+				connector->state->content_protection =
+					hdcp_w->content_protection[index];
+			}
+		}
+#endif
+
 		if (aconnector->dc_sink) {
 			amdgpu_dm_update_freesync_caps(
 					connector, aconnector->edid);
-- 
2.37.2

