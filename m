Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF427044C5
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 07:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E442F10E2E0;
	Tue, 16 May 2023 05:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72D810E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 05:39:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+y8tM2FUb0MJdRi+E8wPccbl7xWPe5fbH4wcxhl5fhqaAeqeuP6GGCbMUEsUEJTM87Yq4CwfIS7bqwPflXClFOkyW4ZtR52u2mewCXz8Awg3sUcovaEpx2yxOmsKLW5Soc9NsOpXvHo0GgaTF7nyauLHAeG62GMvg0PfLXK/RXoIlzw0Ukm591wo2yEFGM9+yEZbGRxBdoc3DZZ4+7HoPlUwYQQMve9ua5CA+82exp5vodSulo6zxDJbsh2Y64MuvSkg/VV2SR6o6Tlu+AqrZi3aAPoomz7y3V0WqvBuCYlekbbxis1p8rinP+xwfkD1KPZ6QitejthVFtnfPEsxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHJ4tWioPLI246wXAlBlk8gBlJ0XqEpNb14dtxET4AY=;
 b=g/7bRLrqWmCn9JvzUwgXoYPCAFxM/G4v2kNPD5GLNLgtg+EI3elYAdpoiZ1spye1NULLMAvffRev6ZuIblxBB4d8S+7UeC/WpQMz7gmxhmWXqDpGV3zh3SDnNLoH3xsDsM0LZtNOFlLSaSd3PcF4ixG2J2b/k5/3NFmrsa6lqSgB54onv++xliWWXoRYaG+XnhJvtPioa4W3aqIXUbs6eIR+jrTCIaUbyeUJF22EisIuSrj7EdL44aqsF3IEvIp7b7pmFF8h7MTwS3MOq4mPuSV0AeyuQFIttnhHU1bmxwieHJ+L4+nv+VQ9PyrZzD0w37WBADhg3iWC7LFXJdXcHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHJ4tWioPLI246wXAlBlk8gBlJ0XqEpNb14dtxET4AY=;
 b=SlbLddmkRFNoD3pkBuXuxdNPvdGr0nFPF2sKtW1GrW+JHxAbrWIJmKf0TI4/mGgK8fA5wj1SjWXDZhbnRIcHKFoyIRpGLKsw/KzXtCgqGVQLMCrmuHDe/CXvF8Sq7m8CYe9h/D2/rg/57t5tYBQElOZQd3r6X0g2Si+G0ahv8iA=
Received: from MW4PR04CA0233.namprd04.prod.outlook.com (2603:10b6:303:87::28)
 by DS7PR12MB5911.namprd12.prod.outlook.com (2603:10b6:8:7c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18; Tue, 16 May
 2023 05:39:56 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::d5) by MW4PR04CA0233.outlook.office365.com
 (2603:10b6:303:87::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 05:39:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:39:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:39:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:39:55 -0500
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:39:53 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/7] drm/amd/display: Implement set/get functions for secure
 display CRC properties
Date: Tue, 16 May 2023 13:39:28 +0800
Message-ID: <20230516053931.1700117-5-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
References: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|DS7PR12MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: fddb1820-18df-4031-1ad9-08db55cffb4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t/Mq25K67CKh2emBqcdcwBzU4AuMunbs1ZT2zlnSXUS9Zuhsa3UGLGRP5wzTKvJv5H08QWuC5tRBh/qOHiulyutoZbYmOpqbjIEtixSfBDuAcDn/Razg+TKz/nGPwH+IcJHx3aeitwW5TOFZsHObiJ2sJSiwr7xFdyTfaRoQLOofmU8S9Lr031AlzkoZcOPvfI/+aTyVNzBFV/M+hEjaZ/70BLEO3GO9yCI9du0QBoG5WD++MJVZv5Df38xDb0k1S7yECGPUTuauh/jnCLBO/LY9Ay7FsJ1LmawSO7EkuKFfUWcfaVHryXRnm/krtWi3cBKAzFaOrNC/dhACXhxW6A9StqZPd5bWsHpCfyY3/PdcCvIH5kbR65Bcw/qOHbR7h+t8oS67e9Vi8U2XXu6kK8Q5y7Cu9Pfn93o8zodrGBu97NaijkkkB0bKbF7z7CO93AeOqSjrD4v7hacwDYn7+FUWE5rtz3KfpN6eBmdQz2tstlJDOa+wG1x96lQEEVYs1Tv5HFQ+tIcPK+isb+UK40KhlUctk3QuM9w26anjmTByf7jIRNEgX9GkSF3lcqANV2cBMsVtFNNgokP0FWp+kh1QASgXpAg+i6w0sklA1phnWhy+6d3kDrjlhP8SQPL1xJlQY/cBssPI73SBve9aka9udJb24GzaVhWYjZiEHntmM9wpkmish0xpJRGbLm4Zq9E9fsPDoyQIuiiG6nBlplfMVSyL2Y+aUqEvrSjqPVuJelv0H3ywLWbbeJvUoFGK1ILrx794ilzrfW1CK3u+7w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(81166007)(40480700001)(316002)(4326008)(6916009)(186003)(26005)(86362001)(1076003)(70206006)(70586007)(40460700003)(82310400005)(54906003)(478600001)(356005)(8936002)(36756003)(5660300002)(7696005)(47076005)(6666004)(83380400001)(36860700001)(2906002)(41300700001)(82740400003)(8676002)(426003)(336012)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:39:56.4154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fddb1820-18df-4031-1ad9-08db55cffb4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5911
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, wayne.lin@amd.com, lili.gong@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement set/get functions as the callback for userspace to get the CRC
result values of the corresponding ROI configuration of secure display.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 38 ++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 74e42257a608..b389b1d1c370 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -736,6 +736,7 @@ struct dm_crtc_state {
 #ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
 	struct {
 		struct drm_property_blob *roi_blob;
+		struct drm_property_blob *crc_blob;
 		bool roi_changed : 1;
 	} secure_display_state;
 #endif
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 4457eac8273e..0e9834e0506d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -359,6 +359,10 @@ static int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
 		dm_state->secure_display_state.roi_changed |=
 			drm_property_replace_blob(old_blob, new_blob);
 
+	} else if (property == adev->dm.secure_display_crc_property) {
+		/* don't let user set CRC data */
+		return -EPERM;
+
 	} else
 		return -EINVAL;
 
@@ -373,12 +377,44 @@ static int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct dm_crtc_state *dm_state = to_dm_crtc_state(crtc_state);
+	struct secure_display_context *secure_display_ctx =
+		&adev->dm.secure_display_ctxs[crtc->index];
 
 	if (property == adev->dm.secure_display_roi_property)
 		*val = (dm_state->secure_display_state.roi_blob)
 			? dm_state->secure_display_state.roi_blob->base.id : 0;
 
-	else
+	else if (property == adev->dm.secure_display_crc_property) {
+		struct drm_crc *blob_data;
+		struct drm_property_blob *blob;
+		unsigned long flag;
+
+		if (!amdgpu_dm_crc_window_is_activated(crtc)) {
+			*val = 0;
+			return 0;
+		}
+
+		/* save new value to blob */
+		blob = drm_property_create_blob(dev,
+						sizeof(struct drm_crc),
+						NULL);
+		if (IS_ERR(blob)) {
+			*val = 0;
+			return -ENOMEM;
+		}
+
+		blob_data = (struct drm_crc *) blob->data;
+		spin_lock_irqsave(&secure_display_ctx->crc.lock, flag);
+		blob_data->crc_r = secure_display_ctx->crc.crc_R;
+		blob_data->crc_g = secure_display_ctx->crc.crc_G;
+		blob_data->crc_b = secure_display_ctx->crc.crc_B;
+		blob_data->frame_count = secure_display_ctx->crc.frame_count;
+		spin_unlock_irqrestore(&secure_display_ctx->crc.lock, flag);
+
+		drm_property_replace_blob(&dm_state->secure_display_state.crc_blob, blob);
+		*val = blob->base.id;
+
+	} else
 		return -EINVAL;
 
 	return 0;
-- 
2.34.1

