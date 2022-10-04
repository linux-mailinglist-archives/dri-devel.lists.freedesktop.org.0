Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF395F4AC7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 23:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85B410E17C;
	Tue,  4 Oct 2022 21:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2074.outbound.protection.outlook.com [40.107.96.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B58D10E17C;
 Tue,  4 Oct 2022 21:15:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDBZauqvmjWoZlMTW3M151fsoFE+vGxzcOynyNPLxQIKATwJ9KD6s41IfBrjaWy/wXGfgORKSWaxMvBxCKYZdggFkGkbIIjkQcxrTitDHGkR+IkMZCvaOeY2BzqxKzzCAghoF4DH75zasO/cCvFz1+zrBDEMv4Rq3pWR/+Nfmm4tP75uUedxkoVtkkyNdN8hUf0F5YQQlyjlQXJEl3HvprSOkz1lh7qtGyX0CSUperwUYfM3q1K2lC/dep2hBrOxwmVFO3LnqeIBuL28W0X7Vk9xACXYLDywpci1E1BcquL7bqzv695wKNpxTnuaJ2dzA+NWJzLsjy05YwazPHkEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3afo120obYNF6Gm4zQlRRP7aTATA+4Qr7LwuRCOt0Mc=;
 b=Y7MXpV7FA0nHDMhe5joZbyniPF9x8+y+y4RJh7eVw4a2R9wnAHasDlGJgMozstf+2r8T1gEQWChJQ2h6+oSlocaPzQ0WuXkhFTHPoaSrFA5Lo2wOROGLaeXhkvBEQ09pcmnczXMjsveTB92ByxQH83o2Ztqbk75wHaGB9GEZoJuzpo1s9CQkFwzTdvcAZeItr5A/8X8j78LUazE7CsyiUdOvEwHy8lrTI1IBNLvI33fZh4piWnfDMEvMs8NHGo8nNYr+TFLbMqZvMjn2UjBH9kpFHc1RsBHNv+6LDtekJd50eK75JP5sCfDTfxEYY+OeDLe7N1Ja7QZQMTxeoyJFtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3afo120obYNF6Gm4zQlRRP7aTATA+4Qr7LwuRCOt0Mc=;
 b=UPoBOGp+L61YyTkjkKa9WchbfnaSL0tUf2ghvkToYw1T5H78kduvec9H0TfHBfF2XUakkjvaYdXNPap/7kN7lTHX0TUueFS9lDCXariyGf9+OwM96LyUA/xdscJN0W+mnFAGHW5VqIN0otjaipag7FUeWIbburnLhWbvBDpL64U=
Received: from BN9PR03CA0174.namprd03.prod.outlook.com (2603:10b6:408:f4::29)
 by CH0PR12MB5187.namprd12.prod.outlook.com (2603:10b6:610:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 21:15:51 +0000
Received: from BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::21) by BN9PR03CA0174.outlook.office365.com
 (2603:10b6:408:f4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Tue, 4 Oct 2022 21:15:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT115.mail.protection.outlook.com (10.13.177.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 4 Oct 2022 21:15:51 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 4 Oct
 2022 16:15:50 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 4/5] drm/amd/display: Enable plane 3DLUT mode
Date: Tue, 4 Oct 2022 15:14:50 -0600
Message-ID: <20221004211451.1475215-5-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT115:EE_|CH0PR12MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: 59495d62-4951-4384-b1cd-08daa64d9de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nRpYLl9jLho5i21EYCA2Qi4hirSBd7ud2TYvgAORqMCL9s2UbVhw0WJmMxUVhMng0CIduvUVSKWBlvynwnQvaiv6VXF7X2NM0oNueUxdEBTBN9nc7OtIKws/E0KImXRB/HPcalvlTXpewWop3dmOcAs500gabaLrBBf4EZrgwYsdnglovEExsq0lrT2gss9zplqrMRKQ3b9kEUCmQqpgUs5QJXNi5LrmXc1foDVPg7QOmZr9LCxV9KwUzqbYikhloEZAxTXjWdWAAJ8E9Y015FeMas6H7FScxiZldskH1SPu3VzGA8CyiClXOooHYDUFJ5uGWC5Buji5LaSS2WNDCyj4MiNouKacYWNLHh8E2pRay+EJh+w+UJbY6TN/fTikDS8Ap1wdkT0HVYMmXNoXjz4wySTH8H77V76Wm0Tgrx5PfKVv6DBXqljQQTP2EHkSB1CgFJVnBHkpsMnciZvjSgRY78bJ4Kxp5JbIxwM3kBCMA/mnGNMXPQqVhs2fqlf8wAViJbh7IHTM9DKqS7d4UoLy+0BMyyQ32vMpGp3ZagdfdQPs9G16EzYyn98C80Ahc8sdqsBdwEgEcGRqAFcsZ+3lp+Ml4ISue23s+C6x4wxg8JW6eSYAGrzTM5PRV6Dq8QgwzO/oTdRSKtQXd8t5Oe5QyahImxxgaZkjSxVaUwwa3IyQY46G3LDT/KMP3ABmj+yzDiTNpfpBFJBOnLBv1/ut/btrcjWhNK5ksu4dxEKLnvk+BBtuPtqdNLydOMZmDng22+rLnYQh1GAAhoHq540euVPgGq7pZADea9xrg6wANA+uLeGQRr3M/ChSVBwv
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(4326008)(110136005)(70586007)(70206006)(478600001)(41300700001)(8936002)(316002)(54906003)(36756003)(36860700001)(40480700001)(356005)(40460700003)(82740400003)(82310400005)(7696005)(1076003)(2616005)(26005)(426003)(16526019)(186003)(47076005)(86362001)(81166007)(336012)(44832011)(2906002)(8676002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 21:15:51.7359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59495d62-4951-4384-b1cd-08daa64d9de3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5187
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

Enable the 3D LUT mode supported by amdgpu.

Note: A patchset "IGT tests for pre-blending 3D LUT interfaces" for this
proposal is sent to IGT mailing list.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++
 drivers/gpu/drm/drm_color_mgmt.c              | 31 +++++++++++++++++++
 include/drm/drm_plane.h                       |  2 ++
 3 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ee277f357140..7094578a683f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8008,6 +8008,9 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 
 	/* TODO need to check ASICs */
 	drm_plane_create_3d_lut_properties(plane->dev, plane, 1);
+	res = drm_plane_color_add_3dlut_mode(plane, "3dlut_17_12bit", &lut_3d_mode_17_12bit, sizeof(lut_3d_mode_17_12bit));
+	if (res)
+		return res;
 	drm_plane_attach_3dlut_properties(plane);
 
 	/* Create (reset) the plane state */
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 4bfe5b5c9670..5418ca24db73 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -743,6 +743,37 @@ void drm_plane_attach_3dlut_properties(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_plane_attach_3dlut_properties);
 
+int drm_plane_color_add_3dlut_mode(struct drm_plane *plane,
+						 const char *name,
+						 const struct drm_mode_3dlut_mode *mode_3dlut,
+						 size_t length)
+{
+	struct drm_property_blob *blob;
+	struct drm_property *prop = NULL;
+	int ret;
+
+	prop = plane->lut_3d_mode_property;
+
+	if (!prop)
+		return -EINVAL;
+
+	if (length == 0 && name)
+		return drm_property_add_enum(prop, 0, name);
+
+	blob = drm_property_create_blob(plane->dev, length, mode_3dlut);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	ret = drm_property_add_enum(prop, blob->base.id, name);
+	if (ret) {
+		drm_property_blob_put(blob);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_color_add_3dlut_mode);
+
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 4e272144170f..f94f91466675 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -946,6 +946,8 @@ int drm_plane_create_3d_lut_properties(struct drm_device *dev,
 					   struct drm_plane *plane,
 					   int num_values);
 void drm_plane_attach_3dlut_properties(struct drm_plane *plane);
+int drm_plane_color_add_3dlut_mode(struct drm_plane *plane, const char *name,
+						 const struct drm_mode_3dlut_mode *mode_3dlut, size_t length);
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
-- 
2.37.3

