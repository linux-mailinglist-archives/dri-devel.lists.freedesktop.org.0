Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D4864A6E2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086DC10E25D;
	Mon, 12 Dec 2022 18:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F27A10E24D;
 Mon, 12 Dec 2022 18:22:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqCWLpUwDx8C248V9ohvNA/n01T6bmUHCLhjc2+mEypBaGBbcT6NTVU2bepTdq4zO17v3KKhaThLEKSsqqkLYKCNqLDoWwxnS5lZID+iPp4NittXrXUVOUma9aKa8eDEOWeUZGzgHWzTLG3rOxVknnpVINBUXZcCUO1U4IIOutZ8MsC3kwuIQ7JSct29XDgQyJGxyTF/Ew5zgOLjFfTtWJ58loile3GV5jKWlSng/2EMPlgyJhprB+C1+hhjT8NiNdUu0lk37RkXrDaRjGHrMs70QaBx7hHOpZW1/m3nzr30TMqnMGPpw0GOhBU3Lr2pIKm3az/5TkD1cI9nDwPl8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGslImqR+p0erx3X4NkO3J7qAhaJFNDv5A6RVvCGHjA=;
 b=GIPEQX14mfAw2kyrGSad3VZWjTpprAZFTdeeQwNAXTDuTqhmAvEjQM+66hGR/nLqPfjj7W71ZG5quAVH1YyHqugXDKTDrG8ZuLj32hc7DlClFbec/+88A73P4+Cvw3bTbqtDNkw6idiN0ZaqIZosiZ8Se/fTO/hirffAkB0qlA0Pw736bVVAvGnEmjlw5c2AsTlEPpSA0cBF1Mw6oDjQCSgMkXoOQeWuzJ6iY1BWuCrn2fcaw8iVNjceYPT2LiYLUoIji18NueOo6RDqQwYGoeFXvYVJkzzVlN9OsYz9G3iOYIwcCPhj1iSby4V3wumc/ZvZJo5hslAyWZZimAIH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGslImqR+p0erx3X4NkO3J7qAhaJFNDv5A6RVvCGHjA=;
 b=I1WKuFEcNI8xqGZFsIbQCjQZSoCbqG4J69LzxU6QgqhQy3VSc15/pvlK85PSCJejupftRjD6urFLJc81T7Pxg72CWlTITcS8ImIyyK354rGZ/dz5Y/85+gHIJ3r1JVvDokAVwcA8M4bwFPOWl9rzkUbrwIKUXsc+jLAKy/zgUCE=
Received: from DS7PR05CA0004.namprd05.prod.outlook.com (2603:10b6:5:3b9::9) by
 IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 18:22:08 +0000
Received: from DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::2c) by DS7PR05CA0004.outlook.office365.com
 (2603:10b6:5:3b9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.6 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT028.mail.protection.outlook.com (10.13.173.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:06 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:05 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/16] drm/connector: Drop COLORIMETRY_NO_DATA
Date: Mon, 12 Dec 2022 13:21:24 -0500
Message-ID: <20221212182137.374625-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT028:EE_|IA1PR12MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: ee695529-ff0c-4ff4-65af-08dadc6dc729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /PLyYLTXZhTzrbYQhMkNq5HxExeq8Msg2gVW+S1VafhoF/kBWblkuUi5YGo8MCzVK1n71kZfintErVOP4EVMWaA1RwI1CabYT6VZYn0vmTZz2hKdeBeYRky12BmsGNNMrwm9b00gRIpURVNMXhxtUh1estT/2q2TWRPaDTdpnVgSGlmKVTLwhVlhtiqKSYXM+93OaX7dN6keezmSZpIFWAeIiExVM41eMFQNBiuHnPNufbuwqqmNtHXYvOWcYuL4GPffsA0cMn4Pympdi8uMR68+JVYJIIesgO+jXiGQVubrv0SgWFdcQFL48NdHpom6tUFLdGXycFhI8GqJ9aIUe9pOy4ah99JrGzFji88oYcN8on6YBi342CkrcSWu9gYQ3xd5bxcRKRmppxn+E+CoQWxQUZOp/lLiz++k2z87yfjO2hMbHVwWTLfSTIyDY8z+OHGV5CV46AxB40IR2imZiQobAjhgH2UsVA9Emy1wQGeGHvl0BgN3W1l8+ti5/DOmt9raG1+oPS3LbN3zohWZXkaT0BiVIbihURXBCgIrHkkfook+DpO5yzzZAux5jF3YNChJ9ZUucz72e6SkFl2xQFHrCyltmNDYH5f+gAQ778uuic/S543dyGWoE3K79YYliKxfZn4zcYZ5pWS/YpJhjr9auGo5xJ/YT9rvmcwVBLQ8ahphw9T8oYn1hlBRD+M09XN/2tVAJbPT77AT4NeVnPUXxofni9B2q/QCrfFmM78=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(110136005)(44832011)(2906002)(66899015)(8936002)(316002)(54906003)(70586007)(36860700001)(8676002)(82310400005)(70206006)(36756003)(41300700001)(4326008)(186003)(1076003)(336012)(478600001)(5660300002)(26005)(40460700003)(86362001)(2616005)(81166007)(47076005)(426003)(83380400001)(82740400003)(7696005)(6666004)(356005)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:07.5240 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee695529-ff0c-4ff4-65af-08dadc6dc729
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626
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

The value is the same as DEFAULT. The HDMI_COLORIMETRY_NO_DATA
makes sense for the infopacket but it's meaningless for the
connector colorspace. or, in otherwise, just means to go with
driver default.

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
 drivers/gpu/drm/display/drm_hdmi_helper.c | 2 +-
 include/drm/drm_connector.h               | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index faf5e9efa7d3..c1e6851b2606 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -103,7 +103,7 @@ EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
 #define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
 
 static const u32 hdmi_colorimetry_val[] = {
-	[DRM_MODE_COLORIMETRY_NO_DATA] = HDMI_COLORIMETRY_NO_DATA,
+	[DRM_MODE_COLORIMETRY_DEFAULT] = HDMI_COLORIMETRY_NO_DATA,
 	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] = HDMI_COLORIMETRY_SMPTE_170M_YCC,
 	[DRM_MODE_COLORIMETRY_BT709_YCC] = HDMI_COLORIMETRY_BT709_YCC,
 	[DRM_MODE_COLORIMETRY_XVYCC_601] = HDMI_COLORIMETRY_XVYCC_601,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4d830fc55a3d..62c814241828 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -375,7 +375,6 @@ enum drm_privacy_screen_status {
 /* For Default case, driver will set the colorspace */
 #define DRM_MODE_COLORIMETRY_DEFAULT			0
 /* CEA 861 Normal Colorimetry options */
-#define DRM_MODE_COLORIMETRY_NO_DATA			0
 #define DRM_MODE_COLORIMETRY_SMPTE_170M_YCC		1
 #define DRM_MODE_COLORIMETRY_BT709_YCC			2
 /* CEA 861 Extended Colorimetry Options */
-- 
2.38.1

