Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C167044C8
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 07:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A058C10E2EC;
	Tue, 16 May 2023 05:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949C810E2E5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 05:40:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miVvGSJj/P81O+Z1HrU20RD2Uu3e5r+K27AB4xFxgbXau9b888K/wNxSpp0ve/PuT3PPfA0NJ7feSaToYnqTPX73KySUq8t+d1O52lpee9dngKH9ehhvc28E4aeKyCkmr2sKixWg/7Ai7IJfJ3YjhSGjdVUWaXFWsdgVKpN1PzgQXxDBL/+LNt41gO6DUMOutb8Pt7WQ7RjkhsZ7chMh9EB5FnjPfJr0EiifZHKdQ98sgmdFUXzYc8XY9JiBIWIDS6e9aNp620kGCw/0ycOMpp01rUUdh3NBkheMmWmLswNXkLaCjvsSZfxnvkbIqbSq6xOPwz9njrJGKF/+LNFeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTJEk0q3REv2AFvd38Bncqxyu6375XmExJ+0XbRHUAE=;
 b=aD8Glcz+TEog1KRCihyP9engoQig8w1BXuVvF/sT7qrQuS2vtUjacUcftBylNWYskhZZrbhJicUbT6T9S3hFot/HifyYdCoyDNqlzCRnYRtgZN4ckN7VXeIOrv4YkEZ6XpVnmUBdSTGK0f68AgtqpqJaGkmjDauitWn8b8bxpVx9IuP876iNfF/BO9I2rIocC/VPLEoryIoKEN0RT7VAOws178wImsNfCqMQ8rYTmTHg5d0TkS5RJ3IJirc1UwupxygZ4LE428qzBCoo8JgDP8BvwUEXZGYN4n4TWgdXkGLbM9+TMZuzVbDnshLBIFLAkLnyav326iCG2Vdw1I3JkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTJEk0q3REv2AFvd38Bncqxyu6375XmExJ+0XbRHUAE=;
 b=i7wZbcYSm+nsLjUd5eN4Ppuyrj9SJY5pa84mw8pdvrP8NkUSyc8B0IU/QaoTXjUIpxb4gpZcGMZJciQsG1/p25G4imleximfc1h1IRJnCzPeTxrYr8Bl7nSYQv4O2xETJQNUOqHzVxBxdvcK4UzDd6SpjqlVGlC3923pvZnE2Jo=
Received: from DM6PR08CA0033.namprd08.prod.outlook.com (2603:10b6:5:80::46) by
 SA3PR12MB7976.namprd12.prod.outlook.com (2603:10b6:806:312::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 05:40:32 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::9e) by DM6PR08CA0033.outlook.office365.com
 (2603:10b6:5:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 05:40:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:40:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:40:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:39:58 -0500
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:39:57 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/amd/display: Implement the retrieval of secure
 display CRC data
Date: Tue, 16 May 2023 13:39:30 +0800
Message-ID: <20230516053931.1700117-7-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
References: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT053:EE_|SA3PR12MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 762f8b4d-63cc-4d94-77b9-08db55d010a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMs//STFp5jWjfwLEWzcp7zykjscKftiOXPvkM/OP+YYHilQ9nhqN5z9XAMX27HvDqs5uYvGSxvdAHvEcQJ85DsnOYVKlt1bq4aghIWLC5z1XzD8VxfjKo7sdeyCgKsohcjI9X0Q1wSk0routMamixJWDPxOJtUhc1DecuPLuvCjwVeOO4KQWD9+B3qA0tT0lyxZ/lLHGdZpcbApbA5ReI/0rzMtcdfomqFouZwkrTvTefwxIT5Fb005axBqUCtZQBCGq/ws9nX+xDhTfdcSRqq/1cTFe8mVjWi3lGWt26Ia344H4c2rU8eGtBqAkJs1OF9yBd8Us6doHPc29v94/VJk5T6iN3VEzk3jWCvByT34qnvEMjKqljLLBp3VY5MxSZi8RyVlL/H9ozl8t8CLumwqTlGloEo+bYl/Ro3Z4VKI5p4dhQ1pXfKkeIg45XkjfjBC4dDWBidX4+lbzSV0GbK1WCcsCbxVp0YGrW86m0JbuoE8XfHcASG6tFImUAAarEan10IrULWr+bhvPsZiGot8zcTk5wHIQJcM+ICGaWHV6ModxjGBePbFaDon/a+0inVAtjAdPrymed6BX/W+nKdyneBt+57pmI/NbnbJ/Yf6NHyRtL9WEH0LgXKh9nH4outsFAZgQwv5az9rDvUsnKTN1VLFnaxgGlll2p1vovk8Ll1u39T83pGOiw7lTh+VFeUcsZyPjemCTuDLVnTaZvTYjW1Qk7Xy7acKbETr7D9aepF/KAR2Nik3HMPOfcoqgH6YfOIqCLcm4ZfGjrDoag==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(36840700001)(40470700004)(46966006)(86362001)(40460700003)(2906002)(82310400005)(40480700001)(316002)(70206006)(70586007)(4326008)(6916009)(7696005)(6666004)(36756003)(47076005)(54906003)(478600001)(36860700001)(336012)(83380400001)(26005)(8936002)(1076003)(82740400003)(186003)(8676002)(356005)(81166007)(426003)(41300700001)(2616005)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:40:32.2136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 762f8b4d-63cc-4d94-77b9-08db55d010a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7976
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

Retrieve secure display's CRC data from the DC hardware in vline0 irq
handler, and store the values in secure display contexts.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 50 ++++++++++++++++---
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 81e9995183ad..f0ccf29af4f8 100644
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
@@ -562,6 +563,11 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
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
@@ -572,6 +578,8 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 								acrtc->dm_irq_params.window_param.y_start;
 		schedule_work(&secure_display_ctx->forward_roi_work);
 
+		reset_crc_frame_count = true;
+
 		acrtc->dm_irq_params.window_param.update_win = false;
 
 		/* Statically skip 1 frame, because we may need to wait below things
@@ -582,12 +590,38 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
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
+	}
+
+	spin_unlock_irqrestore(&secure_display_ctx->crc.lock, flags1);
 }
 
 struct secure_display_context *
-- 
2.34.1

