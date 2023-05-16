Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9947044C4
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 07:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D783710E2DF;
	Tue, 16 May 2023 05:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0178210E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 05:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOi6kfKki6WlvwAocbxDrcb6Mq5hIJtV5D9j7rg3m+K14okeVE6wkPJNAog+sCIrxInYcuOB6nofc7qnckwKrHUSmMo5nKSl1Zawb8x17yoxDsMBzlTphKVfUR0gGoCtD6Yz7wQ89ZS6wGU5vuL5YzRKlWphiOsaBh1T3U5SmbHCZZbHNlFXjKVGc4irzQ3c5zMax70/uWCY+KUXy2jxO3FHQCcqwZD3h3LtecWR79hs0mTT5DOWINyhCeCKLTERnHjdqjjpkcXj8ZePJqyILxmoTPwOnjfWVBfaHL6VP46deigkY1hl7mw7vMgsjw3rAsHJpYWGA5aJyzA61MjzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=menevtcfHh6sl6gXB+KTjKNyRZmH92+HqlWh0WAnZJk=;
 b=HqVMuWAIEx3C5jFyQ/80vyy/OfEAK5awFLWthPFj+LHT67uHihoB0ZSRxvKUttMVVuKDgUirQm/Hjs0r7ZcHzJ+xbBnZgAaF8imK8TnEVMYmja2WiRQ89Gl7JKZvwmfgt/3HuNSmdwnOTm1WESWjsXmH8/lY7TpdoYjHFZqIR/oGuq/PVAchcjmNkX6n8gdj1Zt9ryylrq6lP9TRqSg2mbwmCFPMyICgT9qQL17hKHDUp+K4Td78t/18uJwOu6PqdO71Bn+cjobUJY5mFf8bmwNVDr+dEkfTzYeTvrYvZqcYPDIlsQK2cWzTSOdJGZD6z2g2aCVISQQFBrwRBQ8qjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=menevtcfHh6sl6gXB+KTjKNyRZmH92+HqlWh0WAnZJk=;
 b=Qw9plM52v+LJXANVwIqk+6UA/kvW7G/h0ssaEhIlMmeyYhUKk73naLocTfg9HfquvKmVljGwsT+2KY1ox9yyCI0lbb3S2LB/tkVI+iW+KCwuA8JggHFGR3RCnM5N+ivOzt/+gwczCZS9gfSMjyVI5zTjZ+i1+WIYcoyRE3IddFs=
Received: from DM6PR03CA0097.namprd03.prod.outlook.com (2603:10b6:5:333::30)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 05:39:54 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::bc) by DM6PR03CA0097.outlook.office365.com
 (2603:10b6:5:333::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 05:39:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:39:53 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:39:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 22:39:53 -0700
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:39:51 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/amd/display: Add new blob properties for secure
 display CRC
Date: Tue, 16 May 2023 13:39:27 +0800
Message-ID: <20230516053931.1700117-4-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
References: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT013:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a658bf2-ae62-4543-9f93-08db55cff9ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Kgcq+pXL6RqMGP1TOrKljnx2Mj3WaOtx0QhvpFwdjomdq0kqtqL7p1aX2H29uUhNUcuqycVW4xDheJwdlFobC8w13I+OKEShdvoVgWuTq38gvOv8Eszyfn3dIyImC11qXB690ZxaoaLWLJqCLTrufmjBd4fitLBQMaxXACieWK7GoNqLKoT7HWz53vul0QQwYM8L/RcMJbd+9cLSNsYk19GXT0awsmanEcKxQWs66D62dGnPeVcnR05/PYXrJ2NokdYU3b/4MzwamgFMyF8zfDE2OMdqhJAiWNGOGgug/kI/fivhiXtjlOEnkLwCXPdtGJBDY1KL6bSWPKRgpXTGXYCrm1IyV7YzzxNRAVz1QLg6t9qVJ/VBhzbNcEnR6WdzDnTXRDrLr0aIgVcA4GOXoilrTC08CeLw/6oLILcAReM8P7X02uEXRRpQC99wKc+BQmJ7IDYAAdfsDOjYk07IMOwgQEESZI5zfvXLjug/4/S/IkVBiLWemrnyfSVnhe+ZjioT7J82znh6W9Nl0FGoQdRaOsDT8d/X0GvePbHWTD/qYNVJg4aJsyGkXvrvhJpcfhO/x0uBVX9X54MyBQ9c4ThEYRLuDRfHcD1F3fUQ7Tn3Wqs3mRQHBquHlc2sUusoAeoTquy/7P4sy+PZsNqMwfVCQqWWjQFIBU5axQHAOPuivNhl6LVt84pc1Qou7eCeORi3AGv68cB3C+HUAu1Zdv7GHAWhqdpDKxTjzn0zgQhbL+pzbJ6/boolfocvOtNWF2o7fMHvcQW3xD83FuwoQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(40480700001)(82310400005)(2616005)(336012)(316002)(4326008)(186003)(426003)(41300700001)(6666004)(40460700003)(36860700001)(47076005)(478600001)(83380400001)(54906003)(70206006)(1076003)(26005)(7696005)(2906002)(6916009)(70586007)(36756003)(86362001)(8676002)(356005)(81166007)(82740400003)(8936002)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:39:53.9935 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a658bf2-ae62-4543-9f93-08db55cff9ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7172
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

Add a new blob properties and implement the property creation and
attachment functions for the CRC result values of secure display.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  3 +++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  1 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h | 10 ++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 23 ++++++++++++++++---
 include/uapi/drm/drm_mode.h                   | 19 +++++++++++++++
 5 files changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ee57c659f230..74e42257a608 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -503,6 +503,9 @@ struct amdgpu_display_manager {
 
 	/* properties for secure_display ROI configuration */
 	struct drm_property *secure_display_roi_property;
+
+	/* properties for secure_display CRC information */
+	struct drm_property *secure_display_crc_property;
 #endif
 	/**
 	 * @hpd_rx_offload_wq:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index e7259ec1d644..a83cabb9b1a6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -550,6 +550,7 @@ amdgpu_dm_crtc_secure_display_create_contexts(struct amdgpu_device *adev)
 		DRM_ERROR("amdgpu: failed to create secure display properties.\n");
 
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
+		spin_lock_init(&secure_display_ctxs[i].crc.lock);
 		INIT_WORK(&secure_display_ctxs[i].forward_roi_work, amdgpu_dm_forward_crc_window);
 		INIT_WORK(&secure_display_ctxs[i].notify_ta_work, amdgpu_dm_crtc_notify_ta_to_read);
 		secure_display_ctxs[i].crtc = &adev->mode_info.crtcs[i]->base;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index 66f29e3de9f9..f2def8c20d83 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -40,6 +40,14 @@ enum amdgpu_dm_pipe_crc_source {
 };
 
 #ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+struct crc_data {
+	uint32_t crc_R;
+	uint32_t crc_G;
+	uint32_t crc_B;
+	uint32_t frame_count;
+	spinlock_t lock;
+};
+
 struct crc_window_param {
 	uint16_t x_start;
 	uint16_t y_start;
@@ -64,6 +72,8 @@ struct secure_display_context {
 
 	/* Region of Interest (ROI) */
 	struct rect rect;
+
+	struct crc_data crc;
 };
 #endif
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index e1a17f2d6f2d..4457eac8273e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -299,16 +299,30 @@ int amdgpu_dm_crtc_create_secure_display_properties(struct amdgpu_device *adev)
 {
 	struct amdgpu_display_manager *dm = &adev->dm;
 	struct drm_device *dev = adev_to_drm(adev);
-	struct drm_property *roi_prop;
+	struct drm_property *roi_prop, *crc_prop;
 
 	roi_prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
 					"SECURE_DISPLAY_ROI", 0);
-	if (!roi_prop)
-		return -ENOMEM;
+
+	crc_prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+					"SECURE_DISPLAY_CRC", 0);
+
+	if (!roi_prop || !crc_prop)
+		goto fail;
 
 	dm->secure_display_roi_property = roi_prop;
+	dm->secure_display_crc_property = crc_prop;
 
 	return 0;
+
+fail:
+	if (roi_prop)
+		drm_property_destroy(dev, roi_prop);
+
+	if (crc_prop)
+		drm_property_destroy(dev, roi_prop);
+
+	return -ENOMEM;
 }
 
 void amdgpu_dm_crtc_attach_secure_display_properties(struct amdgpu_device *adev,
@@ -318,6 +332,9 @@ void amdgpu_dm_crtc_attach_secure_display_properties(struct amdgpu_device *adev,
 
 	if (dm->secure_display_roi_property)
 		drm_object_attach_property(&crtc->base, dm->secure_display_roi_property, 0);
+
+	if (dm->secure_display_crc_property)
+		drm_object_attach_property(&crtc->base, dm->secure_display_crc_property, 0);
 }
 
 static int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 98e0a0aaa1c3..8c488ce59e7a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1323,6 +1323,25 @@ struct drm_roi {
 	__u8 pad[7];
 };
 
+/**
+ * struct drm_crc - The CRC value of the corresponding ROI of secure display.
+ * @crc_r: CRC value of red color.
+ * @crc_g: CRC value of green color.
+ * @crc_b: CRC value of blue color.
+ * @frame_count: a referenced frame count to indicate which frame the CRC values
+ *  are generated at.
+ *
+ * Userspace uses this structure to retrieve the CRC value of the current ROI of
+ * secure display. @frame_count will be reset once a new ROI is updated or it reaches
+ * its maximum value.
+ */
+struct drm_crc {
+	__u32 crc_r;
+	__u32 crc_g;
+	__u32 crc_b;
+	__u32 frame_count;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

