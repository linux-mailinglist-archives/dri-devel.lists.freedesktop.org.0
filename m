Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0437893C9E4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 22:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A8F10E2B1;
	Thu, 25 Jul 2024 20:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UZqPcJXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552C710E2B1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 20:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgb+xSMh+nks+Df7MCmcxx7tqbghQy5i+BhR0xZkt8Ro7QZMgvNft2377ppQUdPN8a0T+IDsImcGttFBnviSN/AhI7mV7TLNZha45uIc6FRzPtV8GAlAuAg+DDRpVh4cPXVwKkssttlCRsrqMKW2ix4tpiEFU+CAqrYoM+CvLV8AbW9kjVODzglEt1xu7oYKcrtjnQtniuLjCCCcMyxXfdxUwOsucty1zXdraAnNefiV3NO+NXHY6TS1jnfLocyiUVLcYjbAjR30vh/A6++fw+ko+UvjNu61vOJ5pvqwBVhko2RtbwkeRpxv74YtOpYJi45GOwKbivCltAvaxjGU7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtfwXOPe3qO3QNNqIaBRIF3Tdg1FOMBm4VEVFEal2r8=;
 b=K4yH7oh9AVNznbySWshMeG+DZ6mnCILB0VytLqIGVltzkHEDcHPZyhLCcNY8a6LsS0g2wmeYryHztzzdgym/eAHUnMEkJswAvvl3PV/ehtHujc/YutMNvMkqLNZZdukZULViCjXb8gv1jAsAs2mH59Xq4hxo3JDZ6strT9G3jKBHRWrAkZ3M/RPP2Qxh1lk1x+w8eUWaKtWRCRowfAxh59jaaAAdTmVg/HhtJtZnxOQQeGwyEzFwb9XLm3nd9L8nrLydrSwRs07XTCGuKk/Zwmc3ppIA7iJar2XEZXueSLD0KZqx7cdJM6y17/uivepiOMOjAc0S6nK/uq3sEY0B9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtfwXOPe3qO3QNNqIaBRIF3Tdg1FOMBm4VEVFEal2r8=;
 b=UZqPcJXMVGit9nH1K+iM8Q6Dz4i2r+NoPN57QpYNWd6AvaAZ5ST5IZTifhiTLW2XtzaNJw1eSfldn5yDwXAeWgXn/1MAQcj5VwGUiOM1ZTRujJnPvxrNZ4eQaTRPp1+2amRV2w8pJuFrPP2n1u1o0j9gQAd3V4y+/xj+a88do50=
Received: from SA1P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::34)
 by SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 20:51:23 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::34) by SA1P222CA0001.outlook.office365.com
 (2603:10b6:806:22c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Thu, 25 Jul 2024 20:51:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 20:51:22 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 25 Jul
 2024 15:51:21 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Wayne Lin <wayne.lin@amd.com>, Rodrigo Siqueira
 <rodrigo.siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>
Subject: [PATCH 2/2] drm/amd/display: use drm_crtc_vblank_on_config()
Date: Thu, 25 Jul 2024 16:51:09 -0400
Message-ID: <20240725205109.209743-2-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240725205109.209743-1-hamza.mahfooz@amd.com>
References: <20240725205109.209743-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|SA1PR12MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d8ac48-ab0b-4f4e-5022-08dcaceb8b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hf/JmMePaWbfbIXf8qqSTrWXaS3KaKZCGhkctJPK1YGt+vQ2RI0KlEFQ9V7M?=
 =?us-ascii?Q?fiMuz+UFF9ieX/jh3IJwINAnZQGKlcv2k9cdboWmhBvYT4FAxnRMmd9XAW6o?=
 =?us-ascii?Q?Is2s7j5C3lCCIoPxV/L2F7fXY3ffo6zwxfGLmE0P6G0HMGovS7bHbbY4FpQF?=
 =?us-ascii?Q?hrErLFORHmW9yT0eJJfbA+zb+SgT/76JEWay+UXHO5os0vWgmN7KroU3wPF4?=
 =?us-ascii?Q?QEpGTTx033L3Y1h3QRSvvzSwZZB+O9FEO1scszmbIYCqWBEfBkiElLQ1xmfK?=
 =?us-ascii?Q?XLcBysy6skh9ISKNs+Sua6+lNKv4OPzhROzdAcCvEl3I1Km81Q2j2GkJNjPe?=
 =?us-ascii?Q?IXBGKWDnR7nhg3mTUgNJuc2QGcPNrHRTlG2gFg/L6u6hcFW7rvooAiMTm4cr?=
 =?us-ascii?Q?UHoPrikVnLnAjFt2Xqe7PsiLfFPMGWJZki3neXIYUHWXA4/x5j3NTOsQw/1a?=
 =?us-ascii?Q?7Pc4tbGIICqTfQNjmudntlbIePxy/9/HcNvA9vdCkdYee68h75t9oGdVHFun?=
 =?us-ascii?Q?1O/x6N1Igz2CMlUNYtxvE9n4CKXnv6Wvb/fJTkYOeQn4nuDxT5P2+pwbR0vS?=
 =?us-ascii?Q?8QbV5BhO0dVSoG7oMzHTAfFbLOZrPj0F4fAWF7rimIeoxsKzs1xW2qqxWvRb?=
 =?us-ascii?Q?1v8b7AF++AiYY6S1h9ZMPRBTXy4loFK4vuxV/K0ZUi/A6PB4pYN4eoM5LM8M?=
 =?us-ascii?Q?nl1wtHesf/RBaKz1RkoRKudNBq9rxMS2lXRUkkfeiaeeRA3Wih1qlIJu3Nmd?=
 =?us-ascii?Q?m1CICxh0lsLUp3ZLnCM4hVm+vue2kNWtgoEQYwBSOKE3kZqsS7tHfa2LvIF1?=
 =?us-ascii?Q?jUIXYZVUkyk8Ym5Jk1xBY7KCYtmeot2aXsSPv7/GrF8qQrgiWr+X5J2cWYot?=
 =?us-ascii?Q?6Nnqkl7yMDJsyuKwah7/oGcdPY5nsEvhaPNflWm6NpDKwxEuRairIEaQuZyv?=
 =?us-ascii?Q?jEO1BFHj8ouMVH3m4k5Kls4ZRO4QDS440rVHkMu6Pirp8rHtlnZU/EUj+ubX?=
 =?us-ascii?Q?ZD/LXboQF0Ff+iv6qecbtQT+4iiCICKYmB+SU7lu0waHN0y+OsuicPc11xkw?=
 =?us-ascii?Q?ZQSYEpPl/5KsfqNvbJxDbuM7d7LePZlJd5hgKmjC+Yjhtq8pJ8nL2oUzYM+3?=
 =?us-ascii?Q?xi0obIW573vqCqxeYN1CZh/xAK5ZQZU5L6wJjKcM/kTu5uCNKFS1cQIrpuVk?=
 =?us-ascii?Q?n2VNJemu0YH4EGnoNDRG93B1t4a0OOxqfRblWjisK3Zce3Jx+j1r+eeQrrE5?=
 =?us-ascii?Q?vZGDKatbnFLBAasrsFmAMxxobrlXkkLTmiKi95iM5jNXtsZwWFBO1XSDVgWr?=
 =?us-ascii?Q?XaRGad0zMMkDe2rFACjQCMMtZ+86kybgLtQevsi7jB1bu7A7HM9Epxr2rpQ4?=
 =?us-ascii?Q?IVe6Cw+TGrZZ2yi9d7TZFiVZqNpNXbE2eBvscEyAg/6f8ydjbuuXUJdfH6Qf?=
 =?us-ascii?Q?nxHPieD4b94ULyAYuCfe7T8u5yLGYtNI?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 20:51:22.8841 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d8ac48-ab0b-4f4e-5022-08dcaceb8b22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hook up drm_crtc_vblank_on_config() in amdgpu_dm. So, that we can enable
PSR and other static screen optimizations more quickly, while avoiding
stuttering issues that are accompanied by the following dmesg error:

[drm:dc_dmub_srv_wait_idle [amdgpu]] *ERROR* Error waiting for DMUB idle: status=3

This also allows us to mimic how vblanking is handled by the windows
amdgpu driver.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 49 +++++++++++++++++--
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 07e373deb814..780e31a2d456 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7952,7 +7952,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
 
 static void manage_dm_interrupts(struct amdgpu_device *adev,
 				 struct amdgpu_crtc *acrtc,
-				 bool enable)
+				 struct dm_crtc_state *acrtc_state)
 {
 	/*
 	 * We have no guarantee that the frontend index maps to the same
@@ -7964,9 +7964,47 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
 		amdgpu_display_crtc_idx_to_irq_type(
 			adev,
 			acrtc->crtc_id);
+	struct dc_crtc_timing *timing;
+	int vsync_rate_hz;
+	int offdelay = 30;
+
+	if (acrtc_state) {
+		timing = &acrtc_state->stream->timing;
+
+		vsync_rate_hz = div64_u64(div64_u64((timing->pix_clk_100hz *
+						     (uint64_t)100),
+						    timing->v_total),
+					  timing->h_total);
+
+		if (amdgpu_ip_version(adev, DCE_HWIP, 0) >=
+		    IP_VERSION(3, 5, 0) && (adev->flags & AMD_IS_APU)) {
+			if (vsync_rate_hz)
+				/* at least 2 frames */
+				offdelay = 2000 / vsync_rate_hz + 1;
+
+			if (acrtc_state->stream->link->psr_settings.psr_version <
+			    DC_PSR_VERSION_UNSUPPORTED) {
+				const struct drm_vblank_crtc_config config = {
+					.offdelay_ms = offdelay,
+					.disable_immediate = false
+				};
+
+				drm_crtc_vblank_on_config(&acrtc->base,
+							  &config);
+			} else {
+				const struct drm_vblank_crtc_config config = {
+					.offdelay_ms = 0,
+					.disable_immediate = true
+				};
+
+				drm_crtc_vblank_on_config(&acrtc->base,
+							  &config);
+			}
+
+		} else {
+			drm_crtc_vblank_on(&acrtc->base);
+		}
 
-	if (enable) {
-		drm_crtc_vblank_on(&acrtc->base);
 		amdgpu_irq_get(
 			adev,
 			&adev->pageflip_irq,
@@ -8947,7 +8985,7 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_state *state,
 		if (old_crtc_state->active &&
 		    (!new_crtc_state->active ||
 		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
-			manage_dm_interrupts(adev, acrtc, false);
+			manage_dm_interrupts(adev, acrtc, NULL);
 			dc_stream_release(dm_old_crtc_state->stream);
 		}
 	}
@@ -9465,7 +9503,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
 			dc_stream_retain(dm_new_crtc_state->stream);
 			acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
-			manage_dm_interrupts(adev, acrtc, true);
+			manage_dm_interrupts(adev, acrtc,
+					     to_dm_crtc_state(new_crtc_state));
 		}
 		/* Handle vrr on->off / off->on transitions */
 		amdgpu_dm_handle_vrr_transition(dm_old_crtc_state, dm_new_crtc_state);
-- 
2.45.2

