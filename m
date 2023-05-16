Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B317044C2
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 07:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E852A10E2D8;
	Tue, 16 May 2023 05:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1353F10E2D8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 05:39:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYkoEtGDyNi2tqF1McaE2j5NpWYpxcGlkJxdeH9jA6sSBymHWwgzRpB0iEx0tzJQFyQa2Jebg/cOoknsZNpdEGL9ZLuUXBGHEzCCVshYHy/rpR2kXWEnfl4GlCpzGAO230WiMK4XtZhzvhDsYlyiI4aPR4ILq3KXJt77jF9bp76iUnr4O40fAAmQzBw8q1qKyTUQ0h0lat2GcP87fUGvPajBGVioR3zIWXTzH8pmQI3SLXddeucjFImY8pmxsherfWgkCLkf5uEnbbstWnYA/2FpMHUi2aSHMtRqfnc4tgW5/TIyJRmgsHHaKaYmYNKHQFucmJjU5QQcETsiipn0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mv6oRpP7Ka/gp1J5Gman1Q81wdLD68ci6itqEiM2yj4=;
 b=j/DfTkYtztylz6diJbnbNQ+LHUz1UiV/7FkirQMvuGnKiBICuBECJCbdergyFA8lNYkDMsfX/wQ8KHf6rq33svt3tV6UOd6iM6Ri6eKE4oV9GT/duiw1G33iOo+bwW4VJ61uS7jP1dAnGAfkptHLKgjeBSLBKBB3IAPJBZ1Lhy22a6S0uHZmz7kYWlgYNFuy9NGFePWmV4lEgO6ndXTtEbmWtK5lwkva0rKNQcPATZLRX1M++J3tZ01foVlMRP/jMGB8cAMoy6nAzp3VPT3jhdlXJNDcVsaQNkCmfYlvjTyK8Ypqul/S0gL4031JkEx1CRhlu+DlzjDXuPX2ItGW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mv6oRpP7Ka/gp1J5Gman1Q81wdLD68ci6itqEiM2yj4=;
 b=A6BGhC5Y5TQj8Jf71zIRE2lhjEMwx9npEEY8BKu1+uZfnG2M5KifucR/WZQ22zsxefUNYv/4Awt+pG8VIGhprG7yepth9PELIov+GDw/IXBjPqWtlYuYdG6BOZrVpFkrJYqtT70wVstObw2chRxpDCcqVRk40qntH9TZZxey/NI=
Received: from DS7PR03CA0073.namprd03.prod.outlook.com (2603:10b6:5:3bb::18)
 by SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Tue, 16 May
 2023 05:39:51 +0000
Received: from DM6NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::44) by DS7PR03CA0073.outlook.office365.com
 (2603:10b6:5:3bb::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 05:39:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT069.mail.protection.outlook.com (10.13.173.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:39:50 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:39:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 22:39:49 -0700
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:39:48 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/7] drm/amd/display: Add new blob properties for secure
 display ROI
Date: Tue, 16 May 2023 13:39:25 +0800
Message-ID: <20230516053931.1700117-2-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
References: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT069:EE_|SJ0PR12MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f58f7e-98d7-4ba5-b3f1-08db55cff7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3V169W75oL8rst5saIPF7YtRucu0AET5Dm2c9C1tTuw6flgxMWGBkguFn2XViznAztWFjGaXa8McGoNiIGkrUCbizyAki8DqIUSeUHl+oPzX6qOTcTC5UU+1BIR4Lp0jc6/Vi9aGl93gCd/Z+1l3gmsUVnPGLmJUMv98IJm+F1Rj0jtTn8g6R8zasBOltBSiI2RlLmrzIi29Ot+93G3gfODAnxeK1UcaK/bddynkKvuoS/T4M76tsivbGPKsNW7hV8Mk4IXPe8dSFtmDWb/9kr+mDGf0k1jHb/xNFsFCzIixhg8GabXvO94tGHIqAKyJlOXpcWO9wEhpxqO08EalqW4+G5Cy9r/xskP5+asNeOxSGRO9cLV9QvXZOzTGsUWpkbxblMjpM6YCbEomfR8cNJFPtwP+9z/E/v/C03ntAS+MRtxJU6ldypTFbdR7fBmlmEBWpVpZZ2F3gKgQh4H6iDL1GT3fThS8ebRP48jfW58V1jO92g1q8mfesSdBP1YFNBejuK9NO7UpyuLbLh8I3FfjVFksEaWfFdAGq9Yc502PD5rZO9oAcvDa6PLIS3yvtIfPHB/9gJkLXedvdJaO9ATZWoqRINm1Dt8t9hrNHzPgPOpm1iJz3fuaYnyCqkOQ763313exyZ3Yg7C1SjiriMGwhWfuAR5s38Ke/SOb7BQdfUhrvRI09FJ+HdB+YOlp1cqa6pqeAtC4Z4YvDMHiKtE7cUbRwezkvpFkCs4CXGIKyQ6aoVDlFHQ/pxDI824jRtQSV2j22QhmQhjyU/tgEw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(81166007)(83380400001)(478600001)(316002)(26005)(1076003)(356005)(47076005)(70206006)(41300700001)(70586007)(426003)(336012)(6916009)(4326008)(82740400003)(54906003)(2616005)(7696005)(8676002)(8936002)(86362001)(6666004)(82310400005)(36756003)(186003)(2906002)(40460700003)(5660300002)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:39:50.5206 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f58f7e-98d7-4ba5-b3f1-08db55cff7bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6942
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

Add a new blob properties as well as the create and attach functions
for configuring region of interested (ROI) of secure display.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 10 ++++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  4 +++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |  5 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 31 +++++++++++++++++++
 include/uapi/drm/drm_mode.h                   | 20 ++++++++++++
 5 files changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 2e2413fd73a4..ee57c659f230 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -500,6 +500,9 @@ struct amdgpu_display_manager {
 	 * all crtcs.
 	 */
 	struct secure_display_context *secure_display_ctxs;
+
+	/* properties for secure_display ROI configuration */
+	struct drm_property *secure_display_roi_property;
 #endif
 	/**
 	 * @hpd_rx_offload_wq:
@@ -726,6 +729,13 @@ struct dm_crtc_state {
 	struct dc_info_packet vrr_infopacket;
 
 	int abm_level;
+
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+	struct {
+		struct drm_property_blob *roi_blob;
+		bool roi_changed : 1;
+	} secure_display_state;
+#endif
 };
 
 #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 0802f8e8fac5..e7259ec1d644 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -546,10 +546,14 @@ amdgpu_dm_crtc_secure_display_create_contexts(struct amdgpu_device *adev)
 	if (!secure_display_ctxs)
 		return NULL;
 
+	if (amdgpu_dm_crtc_create_secure_display_properties(adev))
+		DRM_ERROR("amdgpu: failed to create secure display properties.\n");
+
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
 		INIT_WORK(&secure_display_ctxs[i].forward_roi_work, amdgpu_dm_forward_crc_window);
 		INIT_WORK(&secure_display_ctxs[i].notify_ta_work, amdgpu_dm_crtc_notify_ta_to_read);
 		secure_display_ctxs[i].crtc = &adev->mode_info.crtcs[i]->base;
+		amdgpu_dm_crtc_attach_secure_display_properties(adev, &adev->mode_info.crtcs[i]->base);
 	}
 
 	return secure_display_ctxs;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index 748e80ef40d0..66f29e3de9f9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -97,10 +97,15 @@ bool amdgpu_dm_crc_window_is_activated(struct drm_crtc *crtc);
 void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc);
 struct secure_display_context *amdgpu_dm_crtc_secure_display_create_contexts(
 						struct amdgpu_device *adev);
+int amdgpu_dm_crtc_create_secure_display_properties(struct amdgpu_device *adev);
+void amdgpu_dm_crtc_attach_secure_display_properties(struct amdgpu_device *adev,
+						struct drm_crtc *crtc);
 #else
 #define amdgpu_dm_crc_window_is_activated(x)
 #define amdgpu_dm_crtc_handle_crc_window_irq(x)
 #define amdgpu_dm_crtc_secure_display_create_contexts(x)
+#define amdgpu_dm_crtc_create_secure_display_properties(x)
+#define amdgpu_dm_crtc_attach_secure_display_properties(x)
 #endif
 
 #endif /* AMD_DAL_DEV_AMDGPU_DM_AMDGPU_DM_CRC_H_ */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index e3762e806617..4af7ea6fbd65 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -265,6 +265,10 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
 	state->crc_skip_count = cur->crc_skip_count;
 	state->mpo_requested = cur->mpo_requested;
+
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+	state->secure_display_state = cur->secure_display_state;
+#endif
 	/* TODO Duplicate dc_stream after objects are stream object is flattened */
 
 	return &state->base;
@@ -290,6 +294,33 @@ static void dm_crtc_reset_state(struct drm_crtc *crtc)
 	__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+int amdgpu_dm_crtc_create_secure_display_properties(struct amdgpu_device *adev)
+{
+	struct amdgpu_display_manager *dm = &adev->dm;
+	struct drm_device *dev = adev_to_drm(adev);
+	struct drm_property *roi_prop;
+
+	roi_prop = drm_property_create(dev, DRM_MODE_PROP_BLOB,
+					"SECURE_DISPLAY_ROI", 0);
+	if (!roi_prop)
+		return -ENOMEM;
+
+	dm->secure_display_roi_property = roi_prop;
+
+	return 0;
+}
+
+void amdgpu_dm_crtc_attach_secure_display_properties(struct amdgpu_device *adev,
+				struct drm_crtc *crtc)
+{
+	struct amdgpu_display_manager *dm = &adev->dm;
+
+	if (dm->secure_display_roi_property)
+		drm_object_attach_property(&crtc->base, dm->secure_display_roi_property, 0);
+}
+#endif
+
 #ifdef CONFIG_DEBUG_FS
 static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
 {
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 46becedf5b2f..98e0a0aaa1c3 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1303,6 +1303,26 @@ struct drm_mode_rect {
 	__s32 y2;
 };
 
+/**
+ * struct drm_roi - The enablement and region of interest (ROI) of secure display
+ * @x_start: Horizontal starting coordinate of ROI.
+ * @y_start: Vertical starting coordinate of ROI.
+ * @x_end: Horizontal ending coordinate of ROI.
+ * @y_end: Vertical ending coordinate of ROI.
+ * @secure_display_enable: To enable or disable secure display.
+ *
+ * Userspace uses this structure to configure the region of interest and
+ * enablement for secure display.
+ */
+struct drm_roi {
+	__u32 x_start;
+	__u32 y_start;
+	__u32 x_end;
+	__u32 y_end;
+	__u8 secure_display_enable;
+	__u8 pad[7];
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.34.1

