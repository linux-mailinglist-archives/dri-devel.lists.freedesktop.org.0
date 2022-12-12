Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DA964A6F4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE3F10E26E;
	Mon, 12 Dec 2022 18:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2198410E264;
 Mon, 12 Dec 2022 18:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X8UluuN6/kYyXrTM9ij63sGdx5mnQK1jLAjjn8O19lFl46ADfbVTni8lVuv6R8q6913MOL1QgcrZP5gnkcJLbVfeldShQ8q5otMq5CAklboh+5snW2Y1Qa2bIq5kGuvuy8/foHUuynVzE63/4SvKh9fmos9/wFeRbAVvPlXVeTgq5NEMaxr52jPljYipEQ5TWslBLZ9nJuYiRSi3GERzK00Ir8NyG1lEDffDOXjXfXwVLOYZuZIyjs9Pzu7xSgiejrq4CuPlYbjfR0hcl3YaTNJnSP2hYUnz9M9dgRj/JjzHKSp/km81cSBYpl6Qbv4SdGW+pnZnvPjv2oFOnH5vZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wo4pjxNpws7oCxvcuSS9zFF5/vrFTw0qZY+COUa3CrA=;
 b=SeZEBfgE0K8z/r3uY42+yspZ6u6g/X72ooneFHp3kcvG7ybdCRbt9iSRUEdaxcXtLq5oVbqX31qGp5Fk7Q4TIOtpbkCvf9A1rWOO2/KD0RcAFRFXkMogzmGa65h9kslFGs64RInkFXALXsZMVkwa8AGTCr0NCj5vltOMsn9L5W8v/mpkYq5XokhiTfmgzTalrjvin9YhypZOfP4veLUyOy2DUYMGdQCVhLgbm/U6CjlTkXHtLVaK0f/pcfjiIOOsIOoWoH6IBJtWzU14Ibsn18TwtiS1OvbfujqchpHCLtd7Flh7aR1HHJ0Hk37wQrsSQN2XW90ImLqT6qIJ33NHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wo4pjxNpws7oCxvcuSS9zFF5/vrFTw0qZY+COUa3CrA=;
 b=YabgOqOmegxRCjItosbOx8PXgzYA7ugJpTKDO5Nsl9VEC4QjPm8ukcF5PM4xF7vx9lyOJGTiWM4vSaGAt+JUYtgzWtbGw2wAbp/8M44gxX5K8dD6BC0Ii/OA51oEB5EMPYF8sgQUyA/McXM9bZ7cdU44btsZ4J6oi/A2qcAkixs=
Received: from DM6PR07CA0037.namprd07.prod.outlook.com (2603:10b6:5:74::14) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:23 +0000
Received: from DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::32) by DM6PR07CA0037.outlook.office365.com
 (2603:10b6:5:74::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT115.mail.protection.outlook.com (10.13.173.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:13 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:12 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/16] drm/amd/display: Register Colorspace property for DP
 and HDMI
Date: Mon, 12 Dec 2022 13:21:30 -0500
Message-ID: <20221212182137.374625-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT115:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 227d6966-5053-4524-7502-08dadc6dd09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zuHiOM2yaGW71ZNBbeGrJxJGnOPF4gv5GvX99zeRTqZpWnwywxxQAZGdUI6SNb+RTVMa6wnhKeMUcQGtLUBg2Ib7cvyPdhAD5i+8NGEDlQKYCCqJ9Li6UbBg5KPtPTlTx8x49S2/supb2M9s37foq9CKXJkEa0PCOXQCZvQWwvIZ/1+S82Boe5y4v7rL5oOCARCErKIGts3pGLwPmZwiUPaErwEwjux+vqXlez+4SwJbUSkXCU7IrygmL2ji706YyZaLwaR0s+tCnz5hmKQYia2vQ1IzMy8z+dlwsLu8t7FXzd3cvu7NMbJm0/+v+RE/7uZ9y2lI1AEkGb6Qc4yb4Xl80HdPkwd2j4sarLG1duVsh6BPlTywE0OVkIcLVv8m8XCqXaRGbj2a5lSNNx9vtomayQRSWsyaQpjiMjYzCt3VkNSjzVNIbt8N2LyYiZQqZ22my7IdNwbRDPiVJLhTRmNeDmdopj1TYZgLpW3dradgrl7tX75nSvRd8addRrbP23tMGER1JDyuPsCsQsVTWl/Y+2sBJ/98/nYF/nDC0Hm5rjeDn4N5/k//cnfTXRi/ShHnwnXuvub0whAdSfz09FX0PCKcztZZucXV9SZMXX0W8EFiAQ+fVFCRmks/8Sj8jLwwPobGi1eCSQ/94NRnK/1KGaGCUSVIRV/1Swd0L3JZvakOor+OEcVU/uBXRvslW6vj5yQxiI63fPRC3Xz8ahf9YJQ0yl03YWzMkocG0Y0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(36840700001)(46966006)(40470700004)(426003)(36756003)(2906002)(186003)(336012)(47076005)(44832011)(54906003)(1076003)(110136005)(316002)(40460700003)(6666004)(7696005)(40480700001)(86362001)(2616005)(478600001)(26005)(70206006)(70586007)(82310400005)(41300700001)(82740400003)(8676002)(4326008)(36860700001)(5660300002)(81166007)(356005)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:23.4960 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 227d6966-5053-4524-7502-08dadc6dd09b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT115.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want compositors to be able to set the output
colorspace on DP and HDMI outputs, based on the
caps reported from the receiver via EDID.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 74cb0e200d90..67def042e9b4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7019,6 +7019,12 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
 	return amdgpu_dm_connector->num_modes;
 }
 
+static const u32 supported_colorspaces =
+	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
+	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
+
 void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				     struct amdgpu_dm_connector *aconnector,
 				     int connector_type,
@@ -7096,6 +7102,15 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				adev->mode_info.abm_level_property, 0);
 	}
 
+	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
+		if (!drm_mode_create_hdmi_colorspace_property(&aconnector->base, supported_colorspaces))
+			drm_connector_attach_colorspace_property(&aconnector->base);
+	} else if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
+		   connector_type == DRM_MODE_CONNECTOR_eDP) {
+		if (!drm_mode_create_dp_colorspace_property(&aconnector->base, supported_colorspaces))
+			drm_connector_attach_colorspace_property(&aconnector->base);
+	}
+
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 	    connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
 	    connector_type == DRM_MODE_CONNECTOR_eDP) {
-- 
2.38.1

