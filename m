Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A2C90620
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 00:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A87C10E86C;
	Thu, 27 Nov 2025 23:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JtYS/dOe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013044.outbound.protection.outlook.com
 [40.107.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A58910E8AB;
 Thu, 27 Nov 2025 23:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0iNtjGVPsuzSlQM/L8kArOZbLGag8Uc20h4ZLKCnqaIcy6Jgyl32c6EOP8t+ljDebQKRaJt3hx9nAEoOfjc91Fle7ZUCQnyXQYqLDlYjOobQ53Lg6eht7wky3c6tf4GKi7AoDDImQhq0GVwYooQmGepOmH0E+b77GhhRXTt7xHyrSFozcG0E1RiI1beVXiX/l2mJ3woaBwwUuaH/Fr0Ai/fepd9wC9nIf6P6AhHGRLVIAZzz2slpugMCTcGwSc1Nf4fNQORurttc10l8a69Pd2dK9GwXQI7+dZACTgAx+arZTbQXny+4SBG43dAga9QkjQrSHSU3PZbUpBu0tFhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPWo0HcB7YqxNl7a11qmDunjniivyYCT6003UuwAtAs=;
 b=mXrOcepum/cOarH2hyVa4yCRd+vknjTLSXnB0cgD8lu1a3g1XycqkomSCJJT5/gxB6ZtDw6hME2xJX5S7vQ5xJIWWVq9gwwerv/7RIFSDV3i/5T1R37G9vTWkzO2SO8n6SyEXfjIFcEzMv48A1cJPMcR2ZDp8Vq5EeMIAcaUWUG57Q/M2UUFqFwKJ9EzF8iYW/U1TkTqxl6DhpfynSNyjC6J5It/n/xiiJaRVSJF7L2ggVJ/F9hkCFH+Bk62LzkiLhdya2E4fg76wAXUGpXExuyQhZ0rRct0l8Ba81DH5raWb635/Cgfzm7Li8L/MlJ2+9NFr38VIFEM7nnylR01Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPWo0HcB7YqxNl7a11qmDunjniivyYCT6003UuwAtAs=;
 b=JtYS/dOe9YGju9EXJHHUZAG9RtESpXplVIrIB2Z0h4LarvtOWHmu+OlOw+c1+/qLT4vyicYtfZVY/bIqMJHgeRF4Ts9+FTUB/Ofj94BKq4/cNkAydi5TwsPZEgBhlOhRy0izS3JhdhPT8hqVWdLNnlBcKWadpIUKKfCq9VovLho=
Received: from BYAPR02CA0056.namprd02.prod.outlook.com (2603:10b6:a03:54::33)
 by CH3PR12MB9456.namprd12.prod.outlook.com (2603:10b6:610:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 23:58:25 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:a03:54:cafe::66) by BYAPR02CA0056.outlook.office365.com
 (2603:10b6:a03:54::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 23:58:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 23:58:25 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 27 Nov
 2025 17:58:24 -0600
Received: from thonkpad (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Thu, 27 Nov 2025 15:58:23 -0800
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 2/2] drm/amd/display: Implement prepare_vblank_enable callback
Date: Thu, 27 Nov 2025 18:58:00 -0500
Message-ID: <20251127235800.831297-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127235800.831297-1-sunpeng.li@amd.com>
References: <20251127235800.831297-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|CH3PR12MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a0a6c92-20e2-4832-4b0c-08de2e10da7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vMhfYfM7SlzVswyHBzkTZkf0wDrWnUKaty4H4XumW+sTMQ8Rf9b9U0uzawUZ?=
 =?us-ascii?Q?lOEGzDjBlGoixwcc5xK6QyoUwA2yxrWq1G2ZwTNBe2LI797A+eJBkbWbbL8O?=
 =?us-ascii?Q?s558szBzVLv0loOF9FWVDgkjebTbo6rtF6obMrqHcU5592ozXTEpNCErzafa?=
 =?us-ascii?Q?KV/xram0CCujWi46y7DjlhhPn54Hdb/a7OvTW3WPxtuuMJQiTR4yRSRjIE/Q?=
 =?us-ascii?Q?9uj+L1RgiFjT8bdQZLB/KpwUNRw8He2cp/aQ1gAqYMGggWg86UdLm6RfVkej?=
 =?us-ascii?Q?hF5MWtInsWDOOWXtKjof/paSfNU9E1nxlJhCLK2GI/w5SjOwkcO3GrkXD5vH?=
 =?us-ascii?Q?B960mS8jeFagImmUBtRvobuu8q19VfvsMxE/kz9zzyduzM5zjellxLrUjhKE?=
 =?us-ascii?Q?RcBUHx7NWEXWz1IlDMylsTPa36e8IhtGMAwBOr3mzDz7j3MXGxSOQcrDv4+j?=
 =?us-ascii?Q?I8F3dGfl7IsEEHtz+vqX6CwjEi6I1tXVA2+uhSPZd5FvmUBTIBWptEkz9W2Q?=
 =?us-ascii?Q?3/P6XnGP97ExlLVZq1Q584Z12nKJY4zxemn4ri/YYhC10lQEJ19pD3X1Q58s?=
 =?us-ascii?Q?yO7DoiS1Tt99Hn2tWOwqH28S7tiH3AN7yMWhgcU9umEpbGI4k4BBYsLsdv56?=
 =?us-ascii?Q?NQr0wL0DEOgazQmGukPfB4+BsDWM0ST2AphMfID9SX45y9tK5pMEFX0XkWuh?=
 =?us-ascii?Q?dYRS3Oa5+vRx+Edg3eHXx3jsWwdWe6wijTdxAy+KWH0Ol21smVdsDxIt1WO/?=
 =?us-ascii?Q?NQkvv8RF81YBumzoott1E6287jb0R3Lltkq1SZFaw1CgoIhoyX++fInaX8Xi?=
 =?us-ascii?Q?L7coDy+EAqx2gxC6ojG3+8FIIlVDEpcqVqo9hZm+RMwtiFuwJBt1CHmrc7lg?=
 =?us-ascii?Q?4DbdV5C8WHOWi0E1P0BCBqFFp1u4cyypkSeVQ/0A7KLNEnGUt8L2dw6gnSQ1?=
 =?us-ascii?Q?y35BuslbtnwZjtiZooVxFSa/SU+VrHbCMC4wphVKRuCqC2Kd8+5YKWI+EolY?=
 =?us-ascii?Q?U6Z45b38gEyu7I101fQdvo57G1qUBZmIZHhHLN4RSmOUYw2qGVDPShPjSq6C?=
 =?us-ascii?Q?v97EMrS0RM9rqSGnBauNcR7iJengxJ/YtkABET/utYGvWSLPESLchL5JI/xu?=
 =?us-ascii?Q?1oEKqSqYoj2uhmmo/TvkV8rLPtVINaMeKsJJ9Jh0zpxHDtVXROeVw0gbxCph?=
 =?us-ascii?Q?qNXPfRMSEH21DaZKRkUjbj3Yx69EQP5v8QTMU1vj5u4GXt+8tdd8uKcjUHw5?=
 =?us-ascii?Q?OGzaGzz1HtJ/faQ3ddymela2vwjLY+km7cBoJJa8iI0X87ai9Fu3twDXJJxl?=
 =?us-ascii?Q?VZVXRVpmbul+hjW0bp9wIRMiDRZ8GOsHA+5bCOuOWOxvNgsfaij0m16WvSFe?=
 =?us-ascii?Q?BrYYkDNlYS1YicCCSoQtujPIxJRQrhMI72USjJbtNCuUnlHNUkLCVckoG8me?=
 =?us-ascii?Q?3xCvk99pWWkkCUptbbBV33C2D3kzARp1EkgvO7uQ2GHH6I1hoVVMDyDZvw2H?=
 =?us-ascii?Q?YAoc5gHX//ftGSsP2VXRzGIFOAMwbBs9FN1E5fO/8UFxNo8pUremdtELvMR/?=
 =?us-ascii?Q?2iUlIsKHsWir41oe6w8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 23:58:25.1922 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0a6c92-20e2-4832-4b0c-08de2e10da7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9456
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

From: Leo Li <sunpeng.li@amd.com>

[Why]

APU DCN generations since DCN3.5 have the capability to power down
almost all of the DCN hw block during idle periods. This is referred to
as  IPS -- idle power states. In combination with a panel remote-buffer
feature (like PSR or Panel Replay), IPS can save additional power.

Once DCN is in an IPS, no register access can occur. This includes
control registers for vblank interrupts; IPS must first be exited.

Transitioning in or out of IPS requires synchronization with the rest of
DC, as it powers up or down DCN, and may communicate with other MCUs on
the SOC to do so. This is done via the dc_lock mutex.

While calling enable_vblank, the DRM vblank core holds spinlocks that
prevent blocking operations. Yet acquiring the dc_lock mutex is
blocking. Thus, IPS can not be exited piror to programming vblank
interrupt registers from within enable_vblank. At least not in a
race-free way.

Prior to this change, amdgpu_dm was exiting IPS(*) without holding the
dc_lock, opening the door for races:
https://gitlab.freedesktop.org/drm/amd/-/issues/5233

(*) From touching the interrupt registers. All register reads today have
an implicit IPS exit, see dm_read_reg_func()

To solve this, the prepare_vblank_enable callback can be implemented to
exit IPS, as it is called from process context.

[How]

Implement the prepare_vblank_enable callback for amdgpu_dm. In it,
the dc_lock mutex is acquired, and IPS is exited.

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 ++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  4 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 36 +++++++++++++++++--
 4 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0346052f2e574..842a93e2d6ce0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9682,6 +9682,7 @@ static void amdgpu_dm_handle_vrr_transition(struct dm_crtc_state *old_state,
 		 * We also need vupdate irq for the actual core vblank handling
 		 * at end of vblank.
 		 */
+		WARN_ON(drm_crtc_vblank_prepare(new_state->base.crtc) != 0);
 		WARN_ON(amdgpu_dm_crtc_set_vupdate_irq(new_state->base.crtc, true) != 0);
 		WARN_ON(drm_crtc_vblank_get(new_state->base.crtc) != 0);
 		drm_dbg_driver(new_state->base.crtc->dev, "%s: crtc=%u VRR off->on: Get vblank ref\n",
@@ -10108,6 +10109,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 */
 		if (acrtc_attach->base.state->event &&
 		    acrtc_state->active_planes > 0) {
+			drm_crtc_vblank_prepare(pcrtc);
 			drm_crtc_vblank_get(pcrtc);
 
 			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
@@ -10124,6 +10126,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 					&acrtc_state->stream->vrr_infopacket;
 		}
 	} else if (cursor_update && acrtc_state->active_planes > 0) {
+		drm_crtc_vblank_prepare(pcrtc);
 		spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
 		if (acrtc_attach->base.state->event) {
 			drm_crtc_vblank_get(pcrtc);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 7065b20aa2e6b..801414e755dce 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -587,6 +587,8 @@ struct amdgpu_display_manager {
 	 */
 	uint32_t active_vblank_irq_count;
 
+	bool prepare_vbl_disallow_idle
+
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 	/**
 	 * @secure_display_ctx:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index e20aa74380665..7839b56859391 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -656,6 +656,10 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 	 */
 	enabled = amdgpu_dm_is_valid_crc_source(cur_crc_src);
 	if (!enabled && enable) {
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret)
+			goto cleanup;
+
 		ret = drm_crtc_vblank_get(crtc);
 		if (ret)
 			goto cleanup;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 38f9ea313dcbb..dd693419111db 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -258,8 +258,8 @@ static void amdgpu_dm_crtc_vblank_control_worker(struct work_struct *work)
 	else if (dm->active_vblank_irq_count)
 		dm->active_vblank_irq_count--;
 
-	if (dm->active_vblank_irq_count > 0)
-		dc_allow_idle_optimizations(dm->dc, false);
+	/* prepare_vblank_enable must disallow idle first */
+	ASSERT(dm->dc->idle_optimizations_allowed == false);
 
 	/*
 	 * Control PSR based on vblank requirements from OS
@@ -277,7 +277,13 @@ static void amdgpu_dm_crtc_vblank_control_worker(struct work_struct *work)
 			vblank_work->acrtc->dm_irq_params.allow_sr_entry);
 	}
 
-	if (dm->active_vblank_irq_count == 0) {
+	/*
+	 * If this worker runs disable between prepare_vblank and enable_vblank,
+	 * we need to block idle re-allow. Leave it to the next vblank disable
+	 * to re-allow idle.
+	 */
+	if (dm->active_vblank_irq_count == 0 &&
+	    !READ_ONCE(dm->prepare_vbl_disallow_idle)) {
 		dc_post_update_surfaces_to_stream(dm->dc);
 
 		r = amdgpu_dpm_pause_power_profile(adev, true);
@@ -308,6 +314,8 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
 	int irq_type;
 	int rc = 0;
 
+	ASSERT(dm->dc->idle_optimizations_allowed == false);
+
 	if (enable && !acrtc->base.enabled) {
 		drm_dbg_vbl(crtc->dev,
 				"Reject vblank enable on unconfigured CRTC %d (enabled=%d)\n",
@@ -399,6 +407,9 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
 	}
 #endif
 
+	/* Ensure compiler emits the write before worker is queued */
+	WRITE_ONCE(dm->prepare_vbl_disallow_idle, false);
+
 	if (amdgpu_in_reset(adev))
 		return 0;
 
@@ -423,6 +434,24 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
 	return 0;
 }
 
+static int amdgpu_prepare_enable_vblank(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_display_manager *dm = &adev->dm;
+
+	guard(mutex)(&adev->dm.dc_lock);
+
+	if (dm->dc->idle_optimizations_allowed) {
+		/* Prevent the disable worker from re-allowing idle until
+		 * interrupts are enabled. Ensure compiler emits the write
+		 * before disallowing idle. */
+		WRITE_ONCE(dm->prepare_vbl_disallow_idle, true);
+		dc_allow_idle_optimizations(dm->dc, false);
+	}
+
+	return 0;
+}
+
 int amdgpu_dm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	return amdgpu_dm_crtc_set_vblank(crtc, true);
@@ -590,6 +619,7 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
 	.get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
 	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
+	.prepare_enable_vblank = amdgpu_prepare_enable_vblank,
 	.enable_vblank = amdgpu_dm_crtc_enable_vblank,
 	.disable_vblank = amdgpu_dm_crtc_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
-- 
2.51.0

