Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C527044C6
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 07:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FD210E2DE;
	Tue, 16 May 2023 05:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE93A10E2E4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 05:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffElhMWby9mKIt3iHk0c2TnkPMe/EOro/hEsrpIx/prPVLId2AhGBbuX+jR9vZFqOEE3yJ2EkB7ieUktg8yh5gsv4C4gRiZdVquV8w1KV/HCQE6g6qxVS0MtUWKmsKy7eYh35g6HoznFUC9mNSgyUgXMLzz0DuPPZn00SsX4CYksdc4+Un//mgZwY6OV0x/WNomjaM5rg/sX6qhTOT3lCT1EoYn4rhA6MrIt0j2da+fc5pHy9we2yvUOfojnx7CRMHR87lWPLSt/M74Ykjy6mEjPg17QJ3jHTaFyTPEz/ezWwnVB5X1+jsi9t1xueS0YKrWW/bLW1GPlc72PdU9UBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTqy0kiJ16I69pKNEj7Uwj/qiomvttMwO6EIM+mQGk8=;
 b=TAsXIdgZ4zGAiZvg3MHz/T24yBBe+Z4IxfT1VL29mHL76A5jxGKWrBpUR6lLZLoW7dWlzxSUy7CSV8ua8lG/Zm2020mtUaTc2Xi6XV+/fOxqJNMip/TKH25T5lP8doENFG53aZ6cs83jP9jiBS41LBxhpPbDwcYJY12V88+T0/MAq2KaDsHTMjRrjfllyAVwjz0275phBIEDnx8csCoXgDsVEJNWi/1TzPa67quU6F8YsOgy/sHESGbcb4sTAE6W92to7753v/lxfkVNd/WjzdlIjzOQxAJDIVXHM8v8HMUU96raaAxHs8FQ2KUoN9+IaBGjXu3KbMvJTRTicKIalA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTqy0kiJ16I69pKNEj7Uwj/qiomvttMwO6EIM+mQGk8=;
 b=HFIfDt049ZVsWHnNYZuEEsSnzgZguSvESPJyLnzZUvdaD5w4V30Ag2NrWFlGcrtu6eWxHoBBvb8HQbwMqz5D88R6AGUm8IFu35PaKO36tI21S6f0ueu9D590u6NXu/uPTbf0L4MwxV6eYo89NAIrKOgKZcUJ6+d1xOMAYSpycYo=
Received: from MW4PR04CA0248.namprd04.prod.outlook.com (2603:10b6:303:88::13)
 by SA1PR12MB8643.namprd12.prod.outlook.com (2603:10b6:806:387::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 05:40:01 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::5e) by MW4PR04CA0248.outlook.office365.com
 (2603:10b6:303:88::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 05:40:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 05:40:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 00:40:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 15 May
 2023 22:40:00 -0700
Received: from alan-new-dev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 16 May 2023 00:39:58 -0500
From: Alan Liu <HaoPing.Liu@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/7] drm/amd/display: Block the requests for secure display
 ROI/CRC until data ready
Date: Tue, 16 May 2023 13:39:31 +0800
Message-ID: <20230516053931.1700117-8-HaoPing.Liu@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
References: <20230516053931.1700117-1-HaoPing.Liu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT032:EE_|SA1PR12MB8643:EE_
X-MS-Office365-Filtering-Correlation-Id: 20affe10-866a-4eb7-83fc-08db55cffe28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +fxO8mjfhBbSeIcMvZkK28DHg04dWcPwvU2fXTKpNBajQsnH3eQoVACD2cLVqz85Q3BK+YHc3bqND75F0FMq8fsp3xXMr/myTgoSqaOrCrH+EzFxqUBQ9adfjLBoiDXissL5ISyf4v9/1VORtqaxd7P99FwSq4bE5b/HYxxyaS52Ok5ctvnDTBgZtD1KsAN9P9g+YfQR1lEt8gcs+AdAvIzZ5UFNDU4grHJtqLC+G/R8XthSaz0X1AlQty17lltCrPGSaxeW3q+DiDjiCcsCn5piW3toqOstg1SFK8DWmlUA7fpfpsJ35/k4E9y4pmuvQ1EDnMmKZ0Nd3S2jsGkzAxVsxdwpoHu2XGXLNhkhUnJcyhz7JwYhvuLbgOm24yzvLbbfyMCby9WWEqgkLWH5L+AElv4+Trwg6uHK/AyODqnEpRVxCULAA0Z+D3ekchctc13sMGX4RXqKhihzDfOdlD6wBjZqPG7jt5GJfzm/VoVPP5xlSJ7Lt/t9ARNqkKiAwvRH2J7NXKPgFmD694MH0ApZJJjCZ1VK1eE4IQg3496P5q48wF9I+vNf7py4RviL2T8AW5DDgaBIysa1qT772Y7k9tP/DeLXO+xlWa1dBjZhZuv0T23N4f5BASgGHL8qYQnwd409OVtlPIgRr+DgZ4sN9hHrqFbHSUkYKV8rp2cDJNYms7OZl0Exvpr697dqkMlRVpNYc47M7yl5iBqmJ9kVSTikUgAsKzvtCU10Rgf416Kc/1uFjfCn2bRyP059N+Hhd1rkD3uZz5WzgIx2bg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(478600001)(40460700003)(54906003)(8676002)(86362001)(8936002)(5660300002)(2906002)(36756003)(82310400005)(4326008)(6916009)(70586007)(70206006)(82740400003)(356005)(81166007)(316002)(40480700001)(41300700001)(36860700001)(47076005)(186003)(2616005)(1076003)(26005)(83380400001)(336012)(426003)(7696005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 05:40:01.2154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20affe10-866a-4eb7-83fc-08db55cffe28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8643
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

When the user requests for secure display ROI or CRC data, the
request will be blocked until the CRC result of current frame is
calculated and updated to secure display ctx in vline0 irq handler.

Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c      | 8 +++++++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c  | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h  | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 4 ++++
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ee016d5be7ac..7b7ff9a5458a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8864,7 +8864,12 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 				(struct drm_roi *)dm_new_crtc_state->secure_display_state.roi_blob->data;
 
 			if (roi_data->secure_display_enable) {
+				struct secure_display_context *secure_display_ctx =
+					&dm->secure_display_ctxs[acrtc->crtc_id];
+
 				if (!amdgpu_dm_crc_window_is_activated(crtc)) {
+					init_completion(&secure_display_ctx->crc.completion);
+
 					/* Enable secure display: set crc source to "crtc" */
 					amdgpu_dm_crtc_set_secure_display_crc_source(crtc, "crtc");
 
@@ -8874,7 +8879,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 					spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 					acrtc->dm_irq_params.window_param.activated = true;
 					spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
-				}
+				} else
+					reinit_completion(&secure_display_ctx->crc.completion);
 
 				/* Update ROI: copy ROI from dm_crtc_state to dm_irq_params */
 				spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index f0ccf29af4f8..85cedd207c8d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -619,6 +619,7 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 		secure_display_ctx->crc.crc_R = crc[0];
 		secure_display_ctx->crc.crc_G = crc[1];
 		secure_display_ctx->crc.crc_B = crc[2];
+		complete_all(&secure_display_ctx->crc.completion);
 	}
 
 	spin_unlock_irqrestore(&secure_display_ctx->crc.lock, flags1);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index 1b85d60488b6..64a0fd0f165f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -46,6 +46,7 @@ struct crc_data {
 	uint32_t crc_B;
 	uint32_t frame_count;
 	spinlock_t lock;
+	struct completion completion;
 };
 
 struct crc_window_param {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 0e9834e0506d..af1c4a62a482 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -380,6 +380,10 @@ static int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
 	struct secure_display_context *secure_display_ctx =
 		&adev->dm.secure_display_ctxs[crtc->index];
 
+	if (amdgpu_dm_crc_window_is_activated(crtc))
+		wait_for_completion_interruptible_timeout(
+			&secure_display_ctx->crc.completion, 10 * HZ);
+
 	if (property == adev->dm.secure_display_roi_property)
 		*val = (dm_state->secure_display_state.roi_blob)
 			? dm_state->secure_display_state.roi_blob->base.id : 0;
-- 
2.34.1

