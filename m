Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB11B60B74D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 21:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B8110E779;
	Mon, 24 Oct 2022 19:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5516410E761;
 Mon, 24 Oct 2022 19:22:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2nReaG1mCRiKbCZjQgb4YgXzFQlU7/T+Rc0H2wStkOnyKACYpqX8DsKXHYnsscLx49YzCGRNR6NZIXtCpQtwKO0hsVYFXleX248XDizUdnzzuxpzDX4KAb72fFanUlWB+Yrj/LANu72ieJs1aim+jC4TSWyiSIklP7RShvmSNsz11GQ7zlMgEOMXp0jbxIKg2T7MlBR7kalbsDzpemIVN1RO3o35xPGTejuoysR4MIipwL/GVTeutAbNgnuI+mPBCGI9HDDwZBG7hoRbQhtWxojW5r7WGm8Z2TGt37XgvVdLaXjDd6Sk6IvudNMFVvcKnIxG0yfgh6HroW3/Y6aRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FZIDUtBWWbZ/wPiPscK9ZnHx0FFs3KSQkoOu752NP0=;
 b=HEKcYgU1FlICKplRGmCY6hF87pLKGPAUPc7jBzkrlFsyVCkCJ8uZyRUsRnvqEtX9nOvOzgRG3KskYBTue2DAt2aPEQqkf81dsG9AGkrGMxnH+jNlOYgWtl78eIvnPhWe3r38anglVlrWAjAeZcqodAq3730q0PLufR2U53kL2Vp6dxIUInOa5Y4OBj2H2wEKdJYNP5ErXcIE9mYFV7eya1lTwZfpQeJhUjY0hT1G3cONLdBH6emmzwyyiO6BCQn3z2PoOIRohXqVslQG+4iWEL/YZ27ny/86cGcd7Okkfl47vnvFHnaaOLS66G5fnT6FN5GbQdDsU/hCHn7NKzC+9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FZIDUtBWWbZ/wPiPscK9ZnHx0FFs3KSQkoOu752NP0=;
 b=mMmO6XxfxfGp5b/UPFZxaxuggkTDabq1DYUe1lNqmUDWZEW9y7oNi/tbyqvX6vgt59OOWRiLfr9wt+1z7E+yJg2LNRQguRB3q/bdqWOi4Re6EjM87EDmOYA7y7D2+p+goeL/bWYszYfwK9N1MfgrqTzSKy3XFCDnKeTv06LI/r8=
Received: from BN9PR03CA0717.namprd03.prod.outlook.com (2603:10b6:408:ef::32)
 by BY5PR12MB4146.namprd12.prod.outlook.com (2603:10b6:a03:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 19:22:17 +0000
Received: from BL02EPF0000C406.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::25) by BN9PR03CA0717.outlook.office365.com
 (2603:10b6:408:ef::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26 via Frontend
 Transport; Mon, 24 Oct 2022 19:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C406.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Mon, 24 Oct 2022 19:22:17 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 14:22:15 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] Revert "drm/amd/display: Limit max DSC target bpp for
 specific monitors"
Date: Mon, 24 Oct 2022 15:22:23 -0400
Message-ID: <20221024192224.180507-3-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221024192224.180507-1-hamza.mahfooz@amd.com>
References: <20221024192224.180507-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C406:EE_|BY5PR12MB4146:EE_
X-MS-Office365-Filtering-Correlation-Id: 22709067-cc6e-47c9-9188-08dab5f5107d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lOoDvX2nGXwNv9SYB5BSZlI2uz3IMgJi/ZFQR3ZgEH0R8IU44rxVHhqQLAImVL/v2NzK2LjkkrDMgAxlkS8saG53BxQWDCeCjXSyrRsRTs1ACL7OxZMphtPMe+jSi8VKXXDpQboha5b2B1itEzt8/07m+SuQgwf9OPsBFDltbgLmw4SwiIaUzt4Cn6mAywQ1YADChEYsW3UbSyjpARCWTU3YuK7YRLGqHX5NTIMOpLDySWx/lQsCypJHm3uAZSxpXsrty976cZcKAej8Q6+DUS1dNZqjGDlthkWCIO6hHWtN4MzJZAheY2cUBCT4DQHEmVXXIC7Ksgp4CPJaiHe42LDIWMoJf/EH7QmOyXNR7QC6OfJJLbFIKkJBwlm7LWpadxyu5i2Df6F6+TM98CwmXRtUhhGDwd3Xh37OmTBoieevHCvG57pgMHKet7KHiTVASjU50CjokKy9yOJlXD/cqh3uTHJ9rGnMYLZF/I76lpVNTA06KTfj9w2kLrqUo7+/WGiRHK7/7+YcEnDqFnJ2RZSY3JQ5S8TQ65PWSKEKisldz7qH4Bc0aZKROtLZDCD+AvxonYCMR+6q4L9gYdsFwSp8ep+9OlnE9PxO2ZEfGcSrCb2OzF24WgOzeymov4JsyzLuSKwLOFS4xlX4MzbSDdtmTZJEfyUqoxaJ3IoZd1CuoczhocSAhyoNhf9GmrqJ0wZ7YaSpMEwFKBGklXh9JWyl141zuAqhTuUjNymjgNYy6tyTQF8b5bKsM46qg1/uiMQVjIn2xzxyonStAcNDLXt/+eVLR425rmt3NFUkUupoPzu0aHptIfcPluXuMAj3LiKgU94vi2oS/NKYVByZOg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(6666004)(316002)(36860700001)(54906003)(6916009)(426003)(47076005)(8936002)(40480700001)(40460700003)(2906002)(186003)(16526019)(2616005)(1076003)(70206006)(7416002)(8676002)(7696005)(5660300002)(44832011)(4326008)(26005)(83380400001)(336012)(70586007)(86362001)(41300700001)(478600001)(36756003)(81166007)(82310400005)(356005)(82740400003)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 19:22:17.4157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22709067-cc6e-47c9-9188-08dab5f5107d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C406.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
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
Cc: Ian Chen <ian.chen@amd.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Leo Li <sunpeng.li@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Roman Li <roman.li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@intel.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 55eea8ef98641f6e1e1c202bd3a49a57c1dd4059.

This quirk is now handled in the DRM core, so we can drop all of
the internal code that was added to handle it.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 35 -------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 4956a0118215..a21e2ba77ddb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -41,39 +41,6 @@
 #include "dm_helpers.h"
 #include "ddc_service_types.h"
 
-struct monitor_patch_info {
-	unsigned int manufacturer_id;
-	unsigned int product_id;
-	void (*patch_func)(struct dc_edid_caps *edid_caps, unsigned int param);
-	unsigned int patch_param;
-};
-static void set_max_dsc_bpp_limit(struct dc_edid_caps *edid_caps, unsigned int param);
-
-static const struct monitor_patch_info monitor_patch_table[] = {
-{0x6D1E, 0x5BBF, set_max_dsc_bpp_limit, 15},
-{0x6D1E, 0x5B9A, set_max_dsc_bpp_limit, 15},
-};
-
-static void set_max_dsc_bpp_limit(struct dc_edid_caps *edid_caps, unsigned int param)
-{
-	if (edid_caps)
-		edid_caps->panel_patch.max_dsc_target_bpp_limit = param;
-}
-
-static int amdgpu_dm_patch_edid_caps(struct dc_edid_caps *edid_caps)
-{
-	int i, ret = 0;
-
-	for (i = 0; i < ARRAY_SIZE(monitor_patch_table); i++)
-		if ((edid_caps->manufacturer_id == monitor_patch_table[i].manufacturer_id)
-			&&  (edid_caps->product_id == monitor_patch_table[i].product_id)) {
-			monitor_patch_table[i].patch_func(edid_caps, monitor_patch_table[i].patch_param);
-			ret++;
-		}
-
-	return ret;
-}
-
 /* dm_helpers_parse_edid_caps
  *
  * Parse edid caps
@@ -148,8 +115,6 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	kfree(sads);
 	kfree(sadb);
 
-	amdgpu_dm_patch_edid_caps(edid_caps);
-
 	return result;
 }
 
-- 
2.38.0

