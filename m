Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05515F4ACB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 23:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9099610E182;
	Tue,  4 Oct 2022 21:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C172F10E181;
 Tue,  4 Oct 2022 21:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHfpQQaKgIl5ZCb+yyAkxxQnMxc5oD5Pg9kSfwWJfJTfjqyVGqLT7HMsEs9VT09GIdpgyCxnxLh2pGbihwQPDdIG1I9wt8jEt6UO5PiDboz/WmdLcPRISJD56EJPPYmJRTFIyDUO3/hCnCcqfXZMMxGNqNHy5MorOU5gPVP7zar4s+drQ3Ur+f7fNA+7tBRZJsP+40C7iPKM3oDcfOo2fb54mX/FSYjpjw1q19l/erdBB74azhxft4UGxzlh0FhCP1FNdjUUHOsxy0K3gDVvxrxZMVHbl+B+FbrksjkFC4OH3uIho8TpyS2+iB/hbJeW9N4S11jLKlseoEEewkMo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIlJkbPyLgSJCw70p+2jXO7bmqW7crW7J4sADHN6Swc=;
 b=DutJueUGRu+KqwlcGSI7TMBnxW9fKvgmiFNBPf5Tah7rnxxN4XCs2a6zP0e8EaMR5TJRIhf9qj8+nW2zuRTJ2yAE1IY6YG/VN99HB/6NxFfzFSean8oJZjOqPaY/C9XbK2NEOQMgvAXm5+ORcoMDFn3xLsBE4Um8tFTh1xltZVbFVsvqguZ42CJoktK7C5TNQ40cGt2azb1o9PzQ0n98t+2yvuWynwwbrLPXTBAWuB7Y/omES7murabLzdbz+KQYpHDf26kG7wXGKirmnZIztkjm1ZDkw+Xj2NixcIMV+Do38cWWfdc2CO6DkA0iSRqO3GZj6iwwP5o4SaRBvuczGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIlJkbPyLgSJCw70p+2jXO7bmqW7crW7J4sADHN6Swc=;
 b=wV2kxwEw4lXUmWYp9hcEnQLzV/L1QKS9a3xGFhzcNSC8rg+wTybnGjXBSlBUudkltrXTuo2VayEvWCO7vO1Yii/DvV0munChPpzIBTSelP3s2diEVcz0ftQPX55fFhcyqT1ggfqsb/1P0W2pYRxFWZLxk4mghSrjHn1AYXE/Z7g=
Received: from BN9PR03CA0386.namprd03.prod.outlook.com (2603:10b6:408:f7::31)
 by PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 21:16:03 +0000
Received: from BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::88) by BN9PR03CA0386.outlook.office365.com
 (2603:10b6:408:f7::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19 via Frontend
 Transport; Tue, 4 Oct 2022 21:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT091.mail.protection.outlook.com (10.13.176.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 4 Oct 2022 21:16:03 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 4 Oct
 2022 16:16:02 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 5/5] drm/amd/display: Fill 3D LUT from userspace
Date: Tue, 4 Oct 2022 15:14:51 -0600
Message-ID: <20221004211451.1475215-6-alex.hung@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004211451.1475215-1-alex.hung@amd.com>
References: <20221004211451.1475215-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT091:EE_|PH7PR12MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 228564bc-9456-42e1-590c-08daa64da4fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0aTQ4g3m9Mctvk7YOUAQapp5MNsokv1sEeDIXp9xc3yr4KaM7L6JPWKWeUTy+ac62hosr3O64AJRKJ8BWSDrrz1aPFQSNETNg3wlSz/JXL4FPhpS7pMYax/8QVvzalz2VYLk/CEljyPkmcnkOvgVOItAhwG8792B9F3dVncY49TYNOCZXxD8ZhzfFWnlEfGwex7daJxSQh/PhNcPaGZI0gqKzO4BQ0u9vG7SwX1pAKO9vltWWTif2kZiKo34SLDusIrwLZl2ux1raUqZcISv0RvgGEnUBB6eGwi4NREQI6LWdZADEQ/un8K6/YU6BUdn1APRodLJ8V2L+ULqRkc9OULJfjh/xPLtASmKDX8TQFpT0NiOavv1W3p+K1yM1g0BfA3IMxLDNjV21w+StJuXrGUZG0dHFe7sRZQzX99jN62JO3zs6L7AsT+/+261BwWRtZ99BYWIh/79VHdYs9X3Tx/ky/SWVmYZZE5kJ4DftdgR51n0pts8B2jGg7mb4OAAWCQ0ExtX0b2vTXoTQ76JehNoa/27ShLfVntmhhBjeGFiuZd2StV1bvOfQaxgBUSXszEQRo5wyFoMJdkF3gH7dlHhsyane1Lt5UKrdqMXBC1NlBcvo4ey/FfnxJ5zupFQ85hwpX/w2VsFrpu3WVF+FTamiy2t+Yz27mL8Nnm+uE20CdtKGBpydsymiDSvF8vGWjv+DXmconUmWn/9dIWyzrxOnk4Yfn4smGVjf/lm8Y1svCo+E1S7cHqiTL7f6Sgw7yPoSadzAac1ENLDvw/WAGPkuXUVDeQyHKQcNWWFhha3jesIl21CRGJMvWCDFH+a
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(40460700003)(82740400003)(356005)(83380400001)(40480700001)(478600001)(86362001)(36860700001)(26005)(6666004)(7696005)(2906002)(186003)(8936002)(44832011)(36756003)(82310400005)(70206006)(316002)(70586007)(110136005)(8676002)(81166007)(1076003)(2616005)(41300700001)(336012)(5660300002)(426003)(16526019)(47076005)(4326008)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 21:16:03.6284 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 228564bc-9456-42e1-590c-08daa64da4fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7282
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
Cc: mwen@igalia.com, bhawanpreet.lakha@amd.com, Alex Hung <alex.hung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the 3D LUT interface, convert and pass the data for amdgpu
driver.

Note: A patchset "IGT tests for pre-blending 3D LUT interfaces" for this
proposal is sent to IGT mailing list.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  13 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 181 ++++++++++++++++++
 3 files changed, 195 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7094578a683f..10e6dc5c8552 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5656,6 +5656,19 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 		dc_plane_state->in_transfer_func->type = TF_TYPE_HWPWL;
 	}
 
+	/* 3D LUT from userspace */
+	if (plane_state->color_mgmt_changed) {
+		if (plane_state->lut_3d && dc_plane_state->lut3d_func) {
+			ret = amdgpu_dm_fill_3dlut_data(plane_state, &dc_plane_state->lut3d_func->lut_3d);
+			if (!ret)
+				dc_plane_state->lut3d_func->state.bits.initialized = 1;
+			else
+				return ret;
+		} else {
+			/* TODO disable 3D LUT */
+		}
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 667957087ccf..644c5ff6ee9a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -726,6 +726,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state);
 
 void amdgpu_dm_fill_pwl_data(struct drm_property_blob *lut_blob, struct pwl_params *lut_params, struct drm_color_lut_range *pwl_definition, int pwl_size);
+int amdgpu_dm_fill_3dlut_data(const struct drm_plane_state *plane_state, struct tetrahedral_params *param);
 void amdgpu_dm_update_connector_after_detect(
 		struct amdgpu_dm_connector *aconnector);
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index ae633fe52525..705852bf63e7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -22,6 +22,7 @@
  * Authors: AMD
  *
  */
+ #include <linux/videodev2.h>
 #include "amdgpu.h"
 #include "amdgpu_mode.h"
 #include "amdgpu_dm.h"
@@ -469,6 +470,186 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
 	return 0;
 }
 
+#define R_3DLUT	0
+#define G_3DLUT	1
+#define B_3DLUT	2
+
+static __u16 extract_rgb_value(void *lut_3d, __u32 color_format, __u8 color)
+{
+	__u64 val = *(__u64 *) lut_3d;
+
+	switch (color_format) {
+	case DRM_FORMAT_XRGB16161616:
+		if (color == R_3DLUT)
+			return val & 0xFFFF;
+		else if (color == G_3DLUT)
+			return (val >> 16) & 0xFFFF;
+		else if (color == B_3DLUT)
+			return (val >> 32) & 0xFFFF;
+		break;
+	case DRM_FORMAT_XBGR16161616:
+		if (color == B_3DLUT)
+			return val & 0xFFFF;
+		else if (color == G_3DLUT)
+			return (val >> 16) & 0xFFFF;
+		else if (color == R_3DLUT)
+			return (val >> 32) & 0xFFFF;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		if (color == R_3DLUT)
+			return val & 0xFF;
+		else if (color == G_3DLUT)
+			return (val >> 8) & 0xFF;
+		else if (color == B_3DLUT)
+			return (val >> 16) & 0xFF;
+		break;
+	case DRM_FORMAT_XBGR8888:
+		if (color == B_3DLUT)
+			return val & 0xFF;
+		else if (color == G_3DLUT)
+			return (val >> 8) & 0xFF;
+		else if (color == R_3DLUT)
+			return (val >> 16) & 0xFF;
+			break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static bool extract_rgb_data(const struct drm_plane_state *plane_state, struct drm_mode_3dlut_mode *mode, __u16 *lut_data)
+{
+	__u16 i, lut_volume;
+	void *lut_3d = plane_state->lut_3d->data;
+	__u32 cfmt = mode->color_format;
+
+	/* copy RGB accordingly */
+	lut_volume = mode->lut_size * mode->lut_size * mode->lut_size;
+	for (i = 0; i < lut_volume; i += 3) {
+		lut_data[i] = extract_rgb_value(lut_3d, cfmt, R_3DLUT);
+		lut_data[i+1] = extract_rgb_value(lut_3d, cfmt, G_3DLUT);
+		lut_data[i+2] = extract_rgb_value(lut_3d, cfmt, B_3DLUT);
+
+		if (cfmt == DRM_FORMAT_XRGB16161616 || cfmt == DRM_FORMAT_XBGR16161616)
+			lut_3d += sizeof(__u64);
+		else if (cfmt == DRM_FORMAT_XRGB8888 || cfmt == DRM_FORMAT_XBGR8888)
+			lut_3d += sizeof(__u32);
+		else
+			return false;
+	}
+	return true;
+}
+
+static void convert_3dlut_to_tetrahedral_params(struct dc_rgb *rgb,
+	bool is_17x17x17, bool is_12_bits, struct tetrahedral_params *params)
+{
+	struct dc_rgb *lut0;
+	struct dc_rgb *lut1;
+	struct dc_rgb *lut2;
+	struct dc_rgb *lut3;
+	int i, lut_i;
+
+	int num_values;
+
+	if (is_17x17x17 == false) {
+		lut0 = params->tetrahedral_9.lut0;
+		lut1 = params->tetrahedral_9.lut1;
+		lut2 = params->tetrahedral_9.lut2;
+		lut3 = params->tetrahedral_9.lut3;
+		num_values = 729;
+	} else {
+		lut0 = params->tetrahedral_17.lut0;
+		lut1 = params->tetrahedral_17.lut1;
+		lut2 = params->tetrahedral_17.lut2;
+		lut3 = params->tetrahedral_17.lut3;
+		num_values = 4913;
+	}
+
+	params->use_12bits = is_12_bits;
+	params->use_tetrahedral_9 = !is_17x17x17;
+
+	for (lut_i = 0, i = 0; i < num_values - 4; lut_i++, i += 4) {
+		lut0[lut_i].red   = rgb[i].red;
+		lut0[lut_i].green = rgb[i].green;
+		lut0[lut_i].blue  = rgb[i].blue;
+
+		lut1[lut_i].red   = rgb[i + 1].red;
+		lut1[lut_i].green = rgb[i + 1].green;
+		lut1[lut_i].blue  = rgb[i + 1].blue;
+
+		lut2[lut_i].red   = rgb[i + 2].red;
+		lut2[lut_i].green = rgb[i + 2].green;
+		lut2[lut_i].blue  = rgb[i + 2].blue;
+
+		lut3[lut_i].red   = rgb[i + 3].red;
+		lut3[lut_i].green = rgb[i + 3].green;
+		lut3[lut_i].blue  = rgb[i + 3].blue;
+	}
+
+	lut0[lut_i].red      = rgb[i].red;
+	lut0[lut_i].green    = rgb[i].green;
+	lut0[lut_i].blue     = rgb[i].blue;
+}
+
+/* only use for 17x17x17 */
+bool convert_to_tetrahedral(unsigned short rgb_lib[17*17*17*3], struct tetrahedral_params *params)
+{
+	bool ret = false;
+	struct dc_rgb *rgb_area = NULL;
+	int ind = 0;
+	int ind_lut = 0;
+	int nir, nig, nib;
+
+	rgb_area = kvcalloc(17 * 17 * 17, sizeof(struct dc_rgb), GFP_KERNEL);
+	if (rgb_area == NULL)
+		goto release;
+
+	memset(rgb_area, 0, sizeof(17 * 17 * 17 * sizeof(struct dc_rgb)));
+
+	for (nib = 0; nib < 17; nib++) {
+		for (nig = 0; nig < 17; nig++) {
+			for (nir = 0; nir < 17; nir++) {
+				ind_lut = 3 * (nib + 17*nig + 289*nir);
+
+				rgb_area[ind].red = rgb_lib[ind_lut + 0];
+				rgb_area[ind].green = rgb_lib[ind_lut + 1];
+				rgb_area[ind].blue = rgb_lib[ind_lut + 2];
+				ind++;
+			}
+		}
+	}
+	convert_3dlut_to_tetrahedral_params(rgb_area, true, true, params);
+	kvfree(rgb_area);
+	ret = true;
+
+release:
+	return ret;
+}
+
+int amdgpu_dm_fill_3dlut_data(const struct drm_plane_state *plane_state, struct tetrahedral_params *param)
+{
+	const struct drm_mode_3dlut_mode *mode = &lut_3d_mode_17_12bit;
+	unsigned short *lut_data;
+
+	lut_data = kmalloc(mode->lut_size * mode->lut_size * mode->lut_size * sizeof(__u16) * 3, GFP_KERNEL);
+	if (!extract_rgb_data(plane_state, mode, lut_data))
+		return -EINVAL;
+
+	if (!convert_to_tetrahedral(lut_data, param))
+		return -EINVAL;
+
+	kfree(lut_data);
+
+	if (mode->lut_size == 17)
+		param->use_tetrahedral_9 = false;
+
+	if (mode->bit_depth == 12)
+		param->use_12bits = true;
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
  * @crtc: amdgpu_dm crtc state
-- 
2.37.3

