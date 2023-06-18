Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7F07345DA
	for <lists+dri-devel@lfdr.de>; Sun, 18 Jun 2023 12:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC20210E06C;
	Sun, 18 Jun 2023 10:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37B410E06C
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jun 2023 10:39:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrSUjtg0E2j/KBHXFyMMgGi3I2NbMfIoOoCHcI5hO2MkD1+0t1G1hICcKF/MTiW6kTBxumFkCNKoQj0AmhkdlGP/F0heNErfU1OpNf9ILXanCBeL1mXhTlE/bOWLSUkT805nOSwM8vbCOEjGs6NbLnXw3Sg67QKaQODtLceYxEEQYld5Qyo/UzTl8oH7cqT1EknAl2UaUA0/kiqFo3lKeepmrCR+lM0btD+hCJLwRvI302VaR9mwmkrYXjjlUzVDlDqFPHyqSC2oL7IH3Zwl5LRjCN6npCwpeL3KWSPL7YNF79VtP7xRPLrOOKcZI7ees82tWO03OqWdvCmN95iCQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdW5b5yMcQeLmjHwpqm/Wnq+vlTS6RW5aKXlkFREj1c=;
 b=Kzs2xN4OGL7iOZp0IAxXQ6V8DHFOPLLzjfkR0Zil0kEfBYNffseslbw8FGPqgS840pJ4F9xzO+FWvh0l1uROvTui6tDFVyIgvbcR84QfXHwvdOtU4eGiusHhmuAWcmkT8GRwHYr+9Lzb1YWNM+cz8c1Vw3hHHzh2mw+9uMhCHd7dLSLA4sa1bbxPL7gFVNTMHWg6bKEEHc7lgV2bmq4SGUBRl7tE7LRphAePZtjF1qcbiqaVd8aPn2HP2I2ujeTwDhEmvhiBY5j82SHxygLBJTGVmSPZ7gc2M5Kh+hs0cPt2JzdmeXAjAkX+49AXv4GLrunfRciqW8bvD7ltjfc+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdW5b5yMcQeLmjHwpqm/Wnq+vlTS6RW5aKXlkFREj1c=;
 b=W8M8OrHgrZXjZLDCXo6sQ2ly+bVEl5RIRItgKoL+8oud0A5ikhr7P/u2+5d8HNgRF+dpTBfTazGi/Pwwuw48my4agg1Mos92NRjzyLro7Xj3ZImjW+ajs+Vl3gjPhAnXXs3YOLnDH7PFZglKhgNylwm5bpWuQvLtg80r4RWeu9o=
Received: from CY8PR22CA0003.namprd22.prod.outlook.com (2603:10b6:930:45::8)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Sun, 18 Jun
 2023 10:39:20 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:45:cafe::7d) by CY8PR22CA0003.outlook.office365.com
 (2603:10b6:930:45::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35 via Frontend
 Transport; Sun, 18 Jun 2023 10:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.17 via Frontend Transport; Sun, 18 Jun 2023 10:39:20 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 18 Jun
 2023 05:39:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 18 Jun
 2023 03:39:19 -0700
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Sun, 18 Jun 2023 05:39:12 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 3/3] drm/amd/display: Implement the retrieval of
 checksum_region's CRC data
Date: Sun, 18 Jun 2023 18:38:47 +0800
Message-ID: <20230618103847.614721-4-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230618103847.614721-1-HaoPing.Liu@amd.com>
References: <20230618103847.614721-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: a29d26fe-9662-4f07-ca18-08db6fe84613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+R3S7i/WRm+utOBif1bmqhGWqQ7V0XJW8+9XjANcQNJjcbpGyi9xhczYRRRBZ7jxWIkp+sa4OQZ7sGJFPMy7meBIHkc4NYC62tauhmO2RMTcySoK/8XSbEBYvoS1ILv9TxNzIdQmKNGLBoFQzn6hE+sAJTB0FFJUo3HTFTip2xFldCaOmus96+7gdi+i2z6xWuDcD6i+JG0k2cOpT7yEV4QEf8N9KHmF9c4r0OfSQbggyN4ru2efM2myx0bKR7+EKnVkZekT5HvyM7wixRy/rLyHerBMpA/Gk3PSNsoFvWYs/OZvI7WJT2Zw7HLRn5idKITO8UOJ2OD0duyImFI/cRnA/2d4StjNLo1vlR0abLG0AvKDz+/Hrd+kAyGIUunJgB/n9o3jaZJ1W+SMDem2GxQW9f6qYnB5w9t/7dt1R/3JAc31FPHYXVQX9QMsUpRbHLRiEtJ2lJFrHJulHz//blUqPFFOon4dpv13+ZpmQWMUHUcwqni1c2vmC5hrsPCr6MkzwAA9hEuh1xnxCVfof8eSYXqP7ed0dksMCARly4/2voRsk/UUbo08jqAQ4zGkcOs8n7548cv4swPNOGceZQ7Qu8FeM2oG3me4TRhNcbQ0Qy3BsPphxHxPc8mpO2aDa5w0rZALhDRPZRxsHUeEiPXIq/lD42IvFWHThvlaX4w2j55Ns30R/13TssOPFKqTZosOtiCEuEFHftiCfBDUXByOcDXxKfjjcOZNqlMLpcsICgqG2/hZosEyxVk+9ArJspALhxsTajUP60qGTGeTw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(346002)(376002)(451199021)(36840700001)(40470700004)(46966006)(40480700001)(36860700001)(426003)(336012)(47076005)(83380400001)(6916009)(70206006)(70586007)(1076003)(26005)(7696005)(6666004)(4326008)(478600001)(2616005)(54906003)(186003)(86362001)(2906002)(8676002)(8936002)(5660300002)(36756003)(40460700003)(82740400003)(81166007)(356005)(41300700001)(316002)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2023 10:39:20.0917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a29d26fe-9662-4f07-ca18-08db6fe84613
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Wayne.Lin@amd.com, Lili.Gong@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Retrieve and store checksum_region's CRC data from the DC hardware in vline0 irq
handler. A new function amdgpu_dm_crtc_update_checksum_region_crc() is
implemented and hooked to CRTC callback for updating the latest CRC values
to the checksum CRC blob.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 55 +++++++++++++++----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h | 11 ++++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 47 ++++++++++++++++
 4 files changed, 110 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 26da07a25085..9fd08281fe27 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8877,7 +8877,12 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 				(struct drm_checksum_region *)new_crtc_state->checksum_region.region_blob->data;
 
 			if (region_data->checksum_region_enable) {
+				struct secure_display_context *secure_display_ctx =
+					&dm->secure_display_ctxs[acrtc->crtc_id];
+
 				if (!amdgpu_dm_crc_window_is_activated(crtc)) {
+					init_completion(&secure_display_ctx->crc.completion);
+
 					/* Enable secure display: set crc source to "crtc" */
 					amdgpu_dm_crtc_set_secure_display_crc_source(crtc, "crtc");
 
@@ -8887,7 +8892,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 					spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 					acrtc->dm_irq_params.window_param.activated = true;
 					spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
-				}
+				} else
+					reinit_completion(&secure_display_ctx->crc.completion);
 
 				/* Update ROI: copy ROI from crtc_state to dm_irq_params */
 				spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 26017e9fbc4a..f881ccd93a25 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -529,6 +529,8 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 	struct amdgpu_crtc *acrtc = NULL;
 	struct amdgpu_device *adev = NULL;
 	struct secure_display_context *secure_display_ctx = NULL;
+	bool reset_crc_frame_count = false, crc_is_updated = false;
+	uint32_t crc[3] = {0};
 	unsigned long flags1;
 
 	if (crtc == NULL)
@@ -543,15 +545,14 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 
 	/* Early return if CRC capture is not enabled. */
 	if (!amdgpu_dm_is_valid_crc_source(cur_crc_src) ||
-		!dm_is_crc_source_crtc(cur_crc_src))
-		goto cleanup;
-
-	if (!acrtc->dm_irq_params.window_param.activated)
-		goto cleanup;
+	    !dm_is_crc_source_crtc(cur_crc_src)) {
+		spin_unlock_irqrestore(&drm_dev->event_lock, flags1);
+		return;
+	}
 
-	if (acrtc->dm_irq_params.window_param.skip_frame_cnt) {
-		acrtc->dm_irq_params.window_param.skip_frame_cnt -= 1;
-		goto cleanup;
+	if (!acrtc->dm_irq_params.window_param.activated) {
+		spin_unlock_irqrestore(&drm_dev->event_lock, flags1);
+		return;
 	}
 
 	secure_display_ctx = &adev->dm.secure_display_ctxs[acrtc->crtc_id];
@@ -562,16 +563,23 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 		secure_display_ctx->crtc = crtc;
 	}
 
+	if (acrtc->dm_irq_params.window_param.skip_frame_cnt) {
+		acrtc->dm_irq_params.window_param.skip_frame_cnt -= 1;
+		goto cleanup;
+	}
+
 	if (acrtc->dm_irq_params.window_param.update_win) {
 		/* prepare work for dmub to update ROI */
 		secure_display_ctx->rect.x = acrtc->dm_irq_params.window_param.x_start;
 		secure_display_ctx->rect.y = acrtc->dm_irq_params.window_param.y_start;
 		secure_display_ctx->rect.width = acrtc->dm_irq_params.window_param.x_end -
-								acrtc->dm_irq_params.window_param.x_start;
+					acrtc->dm_irq_params.window_param.x_start;
 		secure_display_ctx->rect.height = acrtc->dm_irq_params.window_param.y_end -
-								acrtc->dm_irq_params.window_param.y_start;
+					acrtc->dm_irq_params.window_param.y_start;
 		schedule_work(&secure_display_ctx->forward_roi_work);
 
+		reset_crc_frame_count = true;
+
 		acrtc->dm_irq_params.window_param.update_win = false;
 
 		/* Statically skip 1 frame, because we may need to wait below things
@@ -582,12 +590,39 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 		acrtc->dm_irq_params.window_param.skip_frame_cnt = 1;
 
 	} else {
+		struct dc_stream_state *stream_state = to_dm_crtc_state(crtc->state)->stream;
+
+		if (!dc_stream_get_crc(stream_state->ctx->dc, stream_state,
+					&crc[0], &crc[1], &crc[2]))
+			DRM_ERROR("Secure Display: fail to get crc\n");
+		else
+			crc_is_updated = true;
+
 		/* prepare work for psp to read ROI/CRC and send to I2C */
 		schedule_work(&secure_display_ctx->notify_ta_work);
 	}
 
 cleanup:
 	spin_unlock_irqrestore(&drm_dev->event_lock, flags1);
+
+	spin_lock_irqsave(&secure_display_ctx->crc.lock, flags1);
+
+	if (reset_crc_frame_count || secure_display_ctx->crc.frame_count == UINT_MAX)
+		/* Reset the reference frame count after user update the ROI
+		 * or it reaches the maximum value.
+		 */
+		secure_display_ctx->crc.frame_count = 0;
+	else
+		secure_display_ctx->crc.frame_count += 1;
+
+	if (crc_is_updated) {
+		secure_display_ctx->crc.crc_R = crc[0];
+		secure_display_ctx->crc.crc_G = crc[1];
+		secure_display_ctx->crc.crc_B = crc[2];
+		complete_all(&secure_display_ctx->crc.completion);
+	}
+
+	spin_unlock_irqrestore(&secure_display_ctx->crc.lock, flags1);
 }
 
 struct secure_display_context *
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index f4765bcae840..7c7bd5922b7b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -40,6 +40,15 @@ enum amdgpu_dm_pipe_crc_source {
 };
 
 #ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+struct crc_data {
+	uint32_t crc_R;
+	uint32_t crc_G;
+	uint32_t crc_B;
+	uint32_t frame_count;
+	spinlock_t lock;
+	struct completion completion;
+};
+
 struct crc_window_param {
 	uint16_t x_start;
 	uint16_t y_start;
@@ -64,6 +73,8 @@ struct secure_display_context {
 
 	/* Region of Interest (ROI) */
 	struct rect rect;
+
+	struct crc_data crc;
 };
 #endif
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index e94fe4a7e492..b673338f048d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -280,6 +280,50 @@ static void dm_crtc_reset_state(struct drm_crtc *crtc)
 	__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+static bool amdgpu_dm_crtc_update_checksum_region_crc(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct secure_display_context *secure_display_ctx =
+		&adev->dm.secure_display_ctxs[crtc->index];
+	struct drm_checksum_crc *new_data;
+	struct drm_property_blob *new_blob, **old_blob;
+	unsigned long flag;
+
+	if (!amdgpu_dm_crc_window_is_activated(crtc))
+		goto fail;
+
+	wait_for_completion_interruptible_timeout(
+		&secure_display_ctx->crc.completion, 10 * HZ);
+
+	new_blob = drm_property_create_blob(crtc->dev,
+					sizeof(struct drm_checksum_crc),
+					NULL);
+	if (IS_ERR(new_blob))
+		goto fail;
+
+	/* save new value to blob */
+	new_data = (struct drm_checksum_crc *) new_blob->data;
+	spin_lock_irqsave(&secure_display_ctx->crc.lock, flag);
+	new_data->crc_r = secure_display_ctx->crc.crc_R;
+	new_data->crc_g = secure_display_ctx->crc.crc_G;
+	new_data->crc_b = secure_display_ctx->crc.crc_B;
+	new_data->frame_count = secure_display_ctx->crc.frame_count;
+	spin_unlock_irqrestore(&secure_display_ctx->crc.lock, flag);
+
+	old_blob = &crtc_state->checksum_region.crc_blob;
+	if (!drm_property_replace_blob(old_blob, new_blob))
+		goto fail;
+	
+	return true;
+
+fail:
+	DRM_WARN("Checksum Region: fail to update checksum_region CRC\n");
+	return false;
+}
+#endif
+
 #ifdef CONFIG_DEBUG_FS
 static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
 {
@@ -307,6 +351,9 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 #if defined(CONFIG_DEBUG_FS)
 	.late_register = amdgpu_dm_crtc_late_register,
 #endif
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+	.update_checksum_region_crc = amdgpu_dm_crtc_update_checksum_region_crc,
+#endif
 };
 
 static void dm_crtc_helper_disable(struct drm_crtc *crtc)
-- 
2.34.1

