Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A79669DE6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4368810EA51;
	Fri, 13 Jan 2023 16:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDE310EA45;
 Fri, 13 Jan 2023 16:26:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlPADZLElNamxQbEn4Io1xV5f0my5B3gx+HsTYIa31kRKSPyuq5X8nr0a4d4lxqaIhWfOqvgebvV85Eg1lKY7E+KtwAgYgcDda+geJJDYdsZNhkWsPLEYteM4KC9XQRE51YhWeEVuuuXJXFjlv/3TrgEdi1FrklNdw9hLSb2DIi29kARRbVfaMncJ9x2rJQSVWm9flDDKWlGxH87X4d+wPgdTD+GoQ2JTI2P4is5NrtxpZjTXmGJVGmNYUq/nntHx/rhFo1n4q4qTULQdYfGULAr9E8VG7YD3Vb9wlJTqJAVWOxgp6IuCGWX0ipcur368ImFP/7LUALMmtJa1gSuIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOV+nHYTTMSI0b6q6UJK7Byijo1r75PpB0THduwiPTw=;
 b=EThr/2GeD23DbWie0guA/Esd5bt+fR/GhCBgf081MEUTsWRwTOBmVUiYUfkEg5IkX7zLhDwy2VWAl6IlctcJ8eUM0BNkgjXGdXuyLLPx9FSZHd19/jVlad7BLfA6zpT6DssotIGpxkMaVXmNgsXYK/EukD7cA1tIOslgCHJF3SaoIprFJYaetzYHT6NgnZQYHfMLx71Gk69YM89QgjCEruh6e99MiLcxV1HJyMwaxjQGDxkpUT/wExc/oYYRWZ4HPvNpOyu9IMQLJkDlOetrfU9IbMvGZ/dltQdYUlgpB8yUueMxwAQtdl1srzh6abQJ5VVJcKe0t+MUKAPP6tXXyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOV+nHYTTMSI0b6q6UJK7Byijo1r75PpB0THduwiPTw=;
 b=Vmhw+FQlAqq27Av7UC3KM6eiytwV/iZwbTZBv559lBAxB7RVYsBAAbCQnwwc28yy3JMT+NDAIaD2CKQxbTErVlCqaBY0Q/SmQ3Ot3wDVGQxTcfpOd0NHt3JabxhOOBGzEXEI4wbE7sdP/cb2lkDAYAa/fo/+PoVogZc0aTHlcu0=
Received: from CY5PR15CA0164.namprd15.prod.outlook.com (2603:10b6:930:81::6)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 16:26:44 +0000
Received: from CY4PEPF0000C96E.namprd02.prod.outlook.com
 (2603:10b6:930:81:cafe::b0) by CY5PR15CA0164.outlook.office365.com
 (2603:10b6:930:81::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.16 via Frontend
 Transport; Fri, 13 Jan 2023 16:26:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C96E.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 16:26:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 10:24:58 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 08:24:58 -0800
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 13 Jan 2023 10:24:57 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 09/21] drm/amd/display: Register Colorspace property for DP
 and HDMI
Date: Fri, 13 Jan 2023 11:24:16 -0500
Message-ID: <20230113162428.33874-10-harry.wentland@amd.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96E:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b68492-a622-45d1-8546-08daf582f54f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uQYMFosUt8LVZALGFGtgcBMkwJ9xj2QQ4hiPY0SwRw8gbQdMrhneHdW/eDS6tVKgor4edKC41klx8Ej07/gNjrvQsV0j3gVIvevKE+TIoWKOK5PATYPVz+R9CJuUcgqO/PRZGio2xOkVU+ZDcjdxoF68Ql8UhGx8Lq6rEFxpn7VXTZPGCMKpFK9BPJsOLTJIU6lVaPb/sT4zneOHHP8qBDquowbIZTcn95wBk4FIXnA8DysUW/8HfAEMH0XL72VDXM/LxL619jEEydk4KK77rJwCa3B4DAJfm+GT0LdVveQeTH6xiRezMDWyS3Lnc8bTX8W7nPcKUguKmMhVx35u9kGoEGtyE7XC61hyyV55R9D6VUxGcxYfp/5bvkhh2t8lvJeYCbbU9X15kWOjQfKyKt8loWIsc1m1/HSl7l1UxcogJGVQT47kH5+PhUwonB81sE51v1pU5cDulG/OxJHyGaoDjEAhax/Rwb+ajjER4uLnmcDqifziEAeeH1khq93ohEIq7N4ozp4dvUIJDJbrlIyAAcWXsadM+GHK/42a+5rb+Bkq1zFU58734iEeOIN5H9wnIu/vDIq6UIpsL9jvyBQiA4ZF6uLQkCJDw/UVu/Zup1rpHBU35NjIJwEUWHsB6rY3xDAXyFq/Q82JeLpj2ldQSfF8BMTJUv/fi9vb23x2wMPXMBWkIgWcdbtOpugpSvzcpL0CAUSDbGWgLXtDDWD9Yzn6zKwvBFkaXF0g4hM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(6666004)(7696005)(478600001)(26005)(186003)(2616005)(36756003)(110136005)(70586007)(70206006)(336012)(4326008)(41300700001)(316002)(40460700003)(47076005)(426003)(1076003)(8676002)(5660300002)(44832011)(54906003)(82740400003)(8936002)(81166007)(40480700001)(36860700001)(86362001)(82310400005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 16:26:43.5435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b68492-a622-45d1-8546-08daf582f54f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C96E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554
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
index bc10ac5e772d..c311135f1e6f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7035,6 +7035,12 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
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
@@ -7112,6 +7118,15 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
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
2.39.0

