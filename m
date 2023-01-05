Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365965F541
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 21:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76B910E80E;
	Thu,  5 Jan 2023 20:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480AD10E80E;
 Thu,  5 Jan 2023 20:34:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2OEKleDsgWliDxgmFtlJKb1TVhhXY1mjLpjiW9k/JlEWQ3QRDaOUiS/Ueepbr6M7yneTqjdaeNh/7q1wWW2P1D4eax5mUFqT+cUS5P7ks1eTmPgPioHms5PKukI0z13PcEsjAnnlAR+HAK+WA4JbJQ2BwnPRil7mu029CplB4/UnXvcZ8XGIoooCeSwG3X2jy07GS8G7V6sIXDVR5NsGcD582Kv4KBMZ3BJRAvki+EgUxKVFY6e0uPCNBsazUHGU/ETuSYoHJ8WYMzhg5YXMFrNg39ezJtA5N98G4ajLuopYrMPoWKKtqaRpbKTstoheeMMvTEs+rympOkj9m/OBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BhHmMprS3cHj6RuoN2L9pvN1wQhd3ChfSV3QwcCl3A=;
 b=ARPqHY4XKcS5O9r+Le0VhEy1z3mJylqY+oKy0/i3mZBmYWdE14PUje9CXT1BelzURPIhFZ3DI5t58+vGLbn/9PS1T63Es2vHVU6ciL32Wqgm+WMJ5L19ck3Sk6qv16LQZsM3G+k4hON3VkXC5E+jSQGF6GxM3u9rR6NXUwueTDFEbQXRepH7iOQPjmw49uH/swdSECGgrkfxgnz1XnF6/4AIUNfZz7W0zBmxYDHOKROXnc0pb1IFboRIYqy7zmbZ9vdYYYEO0Mf3TEb16aNr0+F5q812NckP9dyY/ctddX7eKo3UnMK1x6/iwpsmzpt09a9WV89Z4mzhw0UB0Z2weQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BhHmMprS3cHj6RuoN2L9pvN1wQhd3ChfSV3QwcCl3A=;
 b=GNIkCUKYz6c16aUlPz80ZC2i5JksC179AOmug0UuAPCCi6ulT/HVIEZpu/T4LwPaqsJCkn2jLuYgxBqKbfuirb4NSX7CakAgqW18bnu3bfLZIC3DbMrGfhx8J0fS1qvmmi2DSZftWlRA8qeQ2P1a52hfLc4nDSMMTbik4xVccWQ=
Received: from MW4PR02CA0014.namprd02.prod.outlook.com (2603:10b6:303:16d::29)
 by PH0PR12MB7790.namprd12.prod.outlook.com (2603:10b6:510:289::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 20:34:37 +0000
Received: from CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::dc) by MW4PR02CA0014.outlook.office365.com
 (2603:10b6:303:16d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 20:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT108.mail.protection.outlook.com (10.13.175.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 20:34:37 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 14:34:34 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3] drm/amd/display: fix PSR-SU/DSC interoperability support
Date: Thu, 5 Jan 2023 15:33:52 -0500
Message-ID: <20230105203353.378805-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT108:EE_|PH0PR12MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f27c48a-5d28-4aa6-f1fb-08daef5c4362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8btZJwoDoVlahqgOmjFm78YEYn9Vbtc/OEAMop+8SHyag3CyT6pm/1qY0HarId0BxERhvtOc23PXun18CCXCRI0rK6itjcRTWs3wTZ9HzL4UhnpxLDDd6M6xng8hz67sfoBitMhwjCgcJAS6gSt5Qzc2DBRpZUQQBn108F6T6/4zF24a+oCkOjyHPTEyRvr7F4GruP7NUehbK1QAnLiynnvf/JmIG3Yhyi3zHbOfHf0nM6eKBSE+2M5sYh/DkFG6RpYOdxZVcQVecKWqee0EPi4kYRrsBEcl/bTxg45z9i131/+kOYk9nA4DwJuNC0/szmO79boudsLFqi5x5uoAAza/bnrOSFWkHhb4DlPe2qgoigc5b858WSotcUebwJF1pY8Zt/ijOad7AK7Q8ljo+UZWefdhAGyKyujv1RDzlNPadTItTgeKMgCyp5tt+D5qVzsqPvlLs/l8w7QstiqYrbqSnE6Mt8+V5/40UxqaFE1Js4GBSdLj2YwRhDvRo30Zeq/gwnAngHKgsV7EurWcgApcaM6w+1mDAJ2PflySYR5MuFMialjEUTFxcr21JPfXnWe95Y1Yq7azI9gRoJMq9KNhHHKK0kE2zvEAiQo8Wo1x4NlHN/Nmmhq/1ShMLIxd8sn2ouPqGyWXgIw8qZuddo0kaKq+3h0DgsyqDDnKWBYgB+9ET6Le/yvs8+UoaGs0o9OqW5QLgjYMEDtgw7pfnDEzrkOQcRG3Z1N+yoxj9YcSVcD/s3b9ODTmW9eMOvxISgWqGCCPXtvnBB/3hgeLeA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(47076005)(8936002)(44832011)(426003)(83380400001)(6666004)(41300700001)(2906002)(336012)(70586007)(1076003)(36860700001)(70206006)(4326008)(5660300002)(82740400003)(8676002)(186003)(6916009)(2616005)(478600001)(356005)(16526019)(26005)(40480700001)(81166007)(316002)(54906003)(36756003)(40460700003)(82310400005)(86362001)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 20:34:37.1215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f27c48a-5d28-4aa6-f1fb-08daef5c4362
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7790
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
Cc: Robin Chen <po-tchen@amd.com>, David Zhang <dingchen.zhang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicholas
 Kazlauskas <nicholas.kazlauskas@amd.com>, Alex Hung <alex.hung@amd.com>,
 Camille Cho <Camille.Cho@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Shirish S <shirish.s@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Po Ting Chen <robin.chen@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there are issues with enabling PSR-SU + DSC. This stems from
the fact that DSC imposes a slice height on transmitted video data and
we are not conforming to that slice height in PSR-SU regions. So, pass
slice_height into su_y_granularity to feed the DSC slice height into
PSR-SU code.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: move code to modules/power.
v3: use ASSERT() instead of WARN() and add a condition that clarifies
    that PSR-SU + DSC can only be enabled on an eDP connection.
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c |  3 ++
 .../amd/display/modules/power/power_helpers.c | 31 +++++++++++++++++++
 .../amd/display/modules/power/power_helpers.h |  3 ++
 3 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
index 26291db0a3cf..872d06fe1436 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
@@ -122,6 +122,9 @@ bool amdgpu_dm_link_setup_psr(struct dc_stream_state *stream)
 		psr_config.allow_multi_disp_optimizations =
 			(amdgpu_dc_feature_mask & DC_PSR_ALLOW_MULTI_DISP_OPT);
 
+		if (!psr_su_set_y_granularity(dc, link, stream, &psr_config))
+			return false;
+
 		ret = dc_link_setup_psr(link, stream, &psr_config, &psr_context);
 
 	}
diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
index 9b5d9b2c9a6a..381f708ef756 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.c
@@ -916,3 +916,34 @@ bool mod_power_only_edp(const struct dc_state *context, const struct dc_stream_s
 {
 	return context && context->stream_count == 1 && dc_is_embedded_signal(stream->signal);
 }
+
+bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
+			      struct dc_stream_state *stream,
+			      struct psr_config *config)
+{
+	uint16_t pic_height;
+	uint8_t slice_height;
+
+	if (!dc->caps.edp_dsc_support ||
+	    link->panel_config.dsc.disable_dsc_edp ||
+	    !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT ||
+	    !(link->connector_signal & SIGNAL_TYPE_EDP) ||
+	    !stream->timing.dsc_cfg.num_slices_v)
+		return true;
+
+	pic_height = stream->timing.v_addressable +
+		stream->timing.v_border_top + stream->timing.v_border_bottom;
+	slice_height = pic_height / stream->timing.dsc_cfg.num_slices_v;
+
+	if (slice_height) {
+		if (config->su_y_granularity &&
+		    (slice_height % config->su_y_granularity)) {
+			ASSERT(0);
+			return false;
+		}
+
+		config->su_y_granularity = slice_height;
+	}
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
index 316452e9dbc9..bb16b37b83da 100644
--- a/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
+++ b/drivers/gpu/drm/amd/display/modules/power/power_helpers.h
@@ -59,4 +59,7 @@ void mod_power_calc_psr_configs(struct psr_config *psr_config,
 		const struct dc_stream_state *stream);
 bool mod_power_only_edp(const struct dc_state *context,
 		const struct dc_stream_state *stream);
+bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
+			      struct dc_stream_state *stream,
+			      struct psr_config *config);
 #endif /* MODULES_POWER_POWER_HELPERS_H_ */
-- 
2.38.1

