Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0205864A6F2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E01910E262;
	Mon, 12 Dec 2022 18:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2051.outbound.protection.outlook.com [40.107.96.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1365410E262;
 Mon, 12 Dec 2022 18:22:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc74E0JHEh2geZ6lQ0J5EDUo9NrmcfyhkCNn5a/bqei9TV4SssZX/7LK/sJXuRq3Nrj7SKdxofXkpIDkXSxaGtBLIRN+1TtnhJM/7w8gKUEwVw+bHhYRDspAjk/TY3IY0Oj7tTzw38TL7RYU9kLsS1mKK/5VUmYvS0wd+ieNlrmF9STgQGoCE55reQfeFpV6lyHDJZFRK2wM+is98xKJuIIzR7shvgLsokgXC+34lnpFzoc40RQ3tVVqwU2xROiRIoxnQbq6lQ2Df4GylKAvMlm26p4hB5kHInyAiRCuM4Sojmt5iIn+qVaMWiZf++T9Nqx+V+dBSIoGw41Y6CWsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iK87zqqznC9FrU/NRQaUnHSRP554WbcOEFf+Q554LA=;
 b=j89aR+qwlfSFq0kmvgY1u8FTeFgRLSkFhfa5P6Xjj4BXx0rfAclhIOG8XrlIemr0u/kLM3jxzFN7yixBFwaaM4gQnRZ/lc7hNIsrAxNeBdkYaZCqqqPn25O+wlWWRGBuB/97RhSfV/lsf1zrhxRcjsvl34ZMzsUAic7QbEG3NJXCFf++s2a4nJCXD0EXYtwq1pq/OYnAFklAtehzbBJKWk5WpOhHwaeZLQ/r09SHy0KQKVCkU8nQbFBjGx7jsdCZNuDR4II/SaSYqmusG50ptpj0Jy6KJSz1XzOtUbOi0xENNazR+Kypvr2iyutACbWvak/BA2XffPa0hWwLJie9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iK87zqqznC9FrU/NRQaUnHSRP554WbcOEFf+Q554LA=;
 b=5e7Q275iBuFyaz2p/ufv1q/5MmL7HeontXUmruCriYNcYrm0KwYZgcn7LDyRdW57351VpZA+JIfFpGIADdup4nfQYAiOg8KBQwXR6dfgecNofc8LRkyHY1V5rstog7yCwrD65L+NHYvm5Hu2lhLjasCHV2MGOCPUAHK0/L7QFhI=
Received: from BN9PR03CA0469.namprd03.prod.outlook.com (2603:10b6:408:139::24)
 by SA0PR12MB7004.namprd12.prod.outlook.com (2603:10b6:806:2c0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18; Mon, 12 Dec
 2022 18:22:23 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::a7) by BN9PR03CA0469.outlook.office365.com
 (2603:10b6:408:139::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Mon, 12 Dec 2022 18:22:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 18:22:10 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 12:22:07 -0600
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 12:22:06 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/16] drm/connector: Convert DRM_MODE_COLORIMETRY to enum
Date: Mon, 12 Dec 2022 13:21:25 -0500
Message-ID: <20221212182137.374625-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212182137.374625-1-harry.wentland@amd.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|SA0PR12MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2689fb-f870-4f50-9a9f-08dadc6dd03f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SwSU5vnXIOkUxaZEPrrLXoYD1wdIqp0+Il8WIk94PTwsYxNCdRi25R3KzmOtE/uqcqlGH9X97Vyw9kdlH5omTXuZu1zeuRLl0PuTfBwB7ozWRpBlumooKkk7Q3xq/Msr14pGmnDNEtLQ6J0WVIfuWFsDMjtAeNVqO6g4m+5rVTz59H+Dh2GJNz7cIDKqjy/3dfS8J2BNWRT78G7P+C1x7hItj1MZjwLYQFeyNp6ah8FyreFmRoyETVbEr+1ziziKFxdMhCarAd3WY1Ch0pKidbh9cj7VJjr5IWKnbYhoiwsmQjx9oqXDA8CFykDe5lDofRojwE9ucPbusIKFzpIfAFsHiG98n/4rsXLRc5ZZYMmz7LfaQSuOTyOVoMCKXYi1lAQND1IGiX6KhMCGpx0WpzRuz+UN9V18RokZJPTbIpxnOdveFUOjfWcJLdJXi6GaSKT9xQ3ntXRl1rmIOMiMt7cXgXuPEzW2DnRXubwa3J4h+ZjaIGpV26XiX/0rQSJ7G99Om2rZ2FZxMeUwg3sfX9p3LUxNacA/nO1Yz68Mqcr3s1xpfcnDccT9pIYXhLcyPV9DUVfz/HqbGu6HXRUO5wvOZUzeZgj4WrfAZ22BrE4C6dKoAePZhZxMVh97nTArCgjaz7RDvOxkNlHsARoIehdBh41CMAWf6rgigzfHebgl1rjimK6Jp94qfNyxb4w6cKjcs6kABHRHxNXyQtzUdlztwmkt2IwB/zQd4pGgrAU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:CA; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(66899015)(83380400001)(36860700001)(2906002)(1076003)(41300700001)(36756003)(336012)(70586007)(70206006)(40460700003)(86362001)(40480700001)(81166007)(186003)(356005)(316002)(26005)(82740400003)(82310400005)(66574015)(44832011)(4326008)(47076005)(5660300002)(8676002)(426003)(110136005)(478600001)(54906003)(7696005)(6666004)(2616005)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 18:22:10.0511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2689fb-f870-4f50-9a9f-08dadc6dd03f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7004
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

This allows us to use strongly typed arguments.

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
 include/drm/display/drm_dp.h |  2 +-
 include/drm/drm_connector.h  | 47 ++++++++++++++++++------------------
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 4d0abe4c7ea9..b98697459f9c 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1615,7 +1615,7 @@ enum dp_pixelformat {
  *
  * This enum is used to indicate DP VSC SDP Colorimetry formats.
  * It is based on DP 1.4 spec [Table 2-117: VSC SDP Payload for DB16 through
- * DB18] and a name of enum member follows DRM_MODE_COLORIMETRY definition.
+ * DB18] and a name of enum member follows &enum drm_colorimetry definition.
  *
  * @DP_COLORIMETRY_DEFAULT: sRGB (IEC 61966-2-1) or
  *                          ITU-R BT.601 colorimetry format
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 62c814241828..edef65388c29 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -371,28 +371,29 @@ enum drm_privacy_screen_status {
  * a colorspace property which will be created and exposed to
  * userspace.
  */
-
-/* For Default case, driver will set the colorspace */
-#define DRM_MODE_COLORIMETRY_DEFAULT			0
-/* CEA 861 Normal Colorimetry options */
-#define DRM_MODE_COLORIMETRY_SMPTE_170M_YCC		1
-#define DRM_MODE_COLORIMETRY_BT709_YCC			2
-/* CEA 861 Extended Colorimetry Options */
-#define DRM_MODE_COLORIMETRY_XVYCC_601			3
-#define DRM_MODE_COLORIMETRY_XVYCC_709			4
-#define DRM_MODE_COLORIMETRY_SYCC_601			5
-#define DRM_MODE_COLORIMETRY_OPYCC_601			6
-#define DRM_MODE_COLORIMETRY_OPRGB			7
-#define DRM_MODE_COLORIMETRY_BT2020_CYCC		8
-#define DRM_MODE_COLORIMETRY_BT2020_RGB			9
-#define DRM_MODE_COLORIMETRY_BT2020_YCC			10
-/* Additional Colorimetry extension added as part of CTA 861.G */
-#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65		11
-#define DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER		12
-/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry Format */
-#define DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED		13
-#define DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT		14
-#define DRM_MODE_COLORIMETRY_BT601_YCC			15
+enum drm_colorspace {
+	/* For Default case, driver will set the colorspace */
+	DRM_MODE_COLORIMETRY_DEFAULT,
+	/* CEA 861 Normal Colorimetry options */
+	DRM_MODE_COLORIMETRY_SMPTE_170M_YCC,
+	DRM_MODE_COLORIMETRY_BT709_YCC,
+	/* CEA 861 Extended Colorimetry Options */
+	DRM_MODE_COLORIMETRY_XVYCC_601,
+	DRM_MODE_COLORIMETRY_XVYCC_709,
+	DRM_MODE_COLORIMETRY_SYCC_601,
+	DRM_MODE_COLORIMETRY_OPYCC_601,
+	DRM_MODE_COLORIMETRY_OPRGB,
+	DRM_MODE_COLORIMETRY_BT2020_CYCC,
+	DRM_MODE_COLORIMETRY_BT2020_RGB,
+	DRM_MODE_COLORIMETRY_BT2020_YCC,
+	/* Additional Colorimetry extension added as part of CTA 861.G */
+	DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65,
+	DRM_MODE_COLORIMETRY_DCI_P3_RGB_THEATER,
+	/* Additional Colorimetry Options added for DP 1.4a VSC Colorimetry Format */
+	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED,
+	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT,
+	DRM_MODE_COLORIMETRY_BT601_YCC,
+};
 
 /**
  * enum drm_bus_flags - bus_flags info for &drm_display_info
@@ -825,7 +826,7 @@ struct drm_connector_state {
 	 * colorspace change on Sink. This is most commonly used to switch
 	 * to wider color gamuts like BT2020.
 	 */
-	u32 colorspace;
+	enum drm_colorspace colorspace;
 
 	/**
 	 * @writeback_job: Writeback job for writeback connectors
-- 
2.38.1

