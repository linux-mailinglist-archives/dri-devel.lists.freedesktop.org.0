Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6176AE41F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 16:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A690310E507;
	Tue,  7 Mar 2023 15:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEAE10E4E8;
 Tue,  7 Mar 2023 15:11:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkiTfVGoJzFkR7gIKgZWhnnRzt1py8j6EDJ/4loFUqnN4ULP56yuQOyzpGH1iNOJSbtVcJImSqud2l1yzfnoA7HD9ysvHbQBjiIsLv/jAxW26LuINJlyLCB3ToqgqhRRSTSwKOqqZGohDUoYDoKFM3io/QjXSJxh+737OUMgX+nRNKaUlCfATQsAs3b5aq5UKPjRbW73s4+fuEDU7IuKJX3LiKF8BXy+WsAYkHLKi42Zyt93lqi4SRjH9YX7tovLJt2MQtA5z0lJ0ZulcsdaQaH2013b54dGhHPwVBkGM3DdTiO3SuOC0E9/2zLiBkrlYgJUuu0JYVBAIh2UncnsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ0GG44IziKAl/NiSieEYFzH9v3uExI1fyfz5ZCvdcY=;
 b=nHwJe0Z8wySL2BvMWQ8u2Kw3nuP+Vum4PksKQG3r2QFD05tkwvTakcdYzwoBUdOOOc82k9Sm/bs3uAtbMfIYIGWxjzwNJ7mFtGNEe0Rt13hHYrpKR+vfEOib9Qc2GKh5ok9UcyRu1UX4/y1Nxbpxyyn9+CLGB2Rtc5yj/OER7Fw2DqkM5E4hJxTU8G1kpOLtIVSkzP7Ta4hUmnESSPRzohfLokQdl4Wx1UlB96ksb6MQOqRjNXiVyKeXm7P+ZWp9o3WlGqvK/gcuPhacX2QEXYOvZD8faWbWcbwU4A3Ge+PKOwfXxIz9B5TF0mlAmqzcC71nEzPZI1EvbikMWrKGHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZ0GG44IziKAl/NiSieEYFzH9v3uExI1fyfz5ZCvdcY=;
 b=Gwr99g7DrrIlupbl+w83/gJidOK9pM3YpGXJ+Wi/tjx2XqE9aeFh1Bd3ceCtVtCixau6v4gmdO7dlQ88KF1lm6XYIZFc9W/yu2lhgZZ/vAxDYd7PLHRv+G9CspxVUMTMXEI0V5gR2yk/FovOogA7uUifhKp32qHpe0CWWapNQxI=
Received: from DM6PR17CA0031.namprd17.prod.outlook.com (2603:10b6:5:1b3::44)
 by MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 15:11:24 +0000
Received: from DS1PEPF0000E633.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::1a) by DM6PR17CA0031.outlook.office365.com
 (2603:10b6:5:1b3::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 15:11:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E633.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Tue, 7 Mar 2023 15:11:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 09:11:23 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Mar 2023 09:11:22 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 09/17] drm/amd/display: Register Colorspace property for DP
 and HDMI
Date: Tue, 7 Mar 2023 10:10:59 -0500
Message-ID: <20230307151107.49649-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307151107.49649-1-harry.wentland@amd.com>
References: <20230307151107.49649-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E633:EE_|MW4PR12MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f87348b-3402-4974-323f-08db1f1e375f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMiqmfoK6U5afVxC8HQ2qDzUkS6PhI7lqA8m6De6XLDrW7DAXgWksFVfJ52W/mo4AEd8KkSadA1G2sCga7jXGZ3L9Zkfm+XGaOqaxVxqGcky13d76sSzJu3/dqLdca8WzJmDuf0DeMUVflPktXEF829R+v5sFzXZLutMy08oEAShjfGi/OgLI0Fg1E72b/jTtJr3g72Bu2XvETlugqGrn5QuFAs8xldynsIKiJjqbQyiAJStLd27eSUFqGvVNHw5iMli2ps/EL1MqXV8y7yHpn/pRIOi2z39g3lpcnJsc9QT1EiINr+IWwWBlhXbgkByx5r07BlthFU1VsZDE1fw7vorqMR9RJo+t0w46eHabD5qc8oGsackr5LoYIFA3GZWFhI3b03XNj7tDjb0Vjrt5yKJYDFdmeygHcik0z7/TRSqHhS1JmMgTSft4wxfmEPYrlY+RYEdGxZ30QpwjDLpDLd9vvgSdWByCPmR0lyR319vJRQOdsosQ6ZWGoh8EVz2Vah1ly7oH4yjvGQ6VUo/7J4SKB85ycYJnGZsXesJ37LYuBTXzbj0wUUUJBS0nF4fm4dRV1f34/mcMfaMgxaRLb9WkA0JoDPvd9iKYq6OO6mQscy/MDGuZ+qrq7GakNTgLglcUdsnAigSkB+NQjJ9aPwuwSgBLPbfqu27BCCMg6EQ+QDR/V1oFMuGBWVhBePbAhghGCZM5rPidMXmXI400e9DB1KXkuGXHcVizH/27HQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199018)(46966006)(40470700004)(36840700001)(2906002)(44832011)(8936002)(5660300002)(336012)(41300700001)(70206006)(8676002)(40460700003)(4326008)(70586007)(36756003)(316002)(54906003)(478600001)(40480700001)(86362001)(6666004)(81166007)(36860700001)(26005)(186003)(356005)(426003)(2616005)(47076005)(1076003)(110136005)(82310400005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 15:11:24.0741 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f87348b-3402-4974-323f-08db1f1e375f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E633.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want compositors to be able to set the output
colorspace on DP and HDMI outputs, based on the
caps reported from the receiver via EDID.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Joshua Ashton <joshua@froggi.es>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f91b2ea13d96..2d883c6dae90 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7184,6 +7184,12 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
 	return amdgpu_dm_connector->num_modes;
 }
 
+static const u32 supported_colorspaces =
+	BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
+	BIT(DRM_MODE_COLORIMETRY_OPRGB) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020) |
+	BIT(DRM_MODE_COLORIMETRY_BT2020_DEPRECATED);
+
 void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 				     struct amdgpu_dm_connector *aconnector,
 				     int connector_type,
@@ -7264,6 +7270,15 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
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
2.39.2

