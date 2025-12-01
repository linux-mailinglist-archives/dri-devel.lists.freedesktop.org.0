Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB68EC99936
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 00:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E2C10E4D2;
	Mon,  1 Dec 2025 23:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0GGTVR8w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012027.outbound.protection.outlook.com
 [40.93.195.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91AA10E4D0;
 Mon,  1 Dec 2025 23:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qm5pJszHszJd5WxWyiqoiNXsptegOKYu5pJEnBw4ZDjV12hIAhrSgyw2t1km/ZTmhHPvmv4ppxBRiszUgZPEPLwzP71cUoVMAMVDfJ+fCvF8PUvqXQHCqbzinaXDrt7dQLcFoVuwHF9upsVL044xHQCEOkTbO9maIyE1OQpJpY+yvqK+U/P4EYuCwlHmAO2s11LZF8XkL2/9831NVTiqBHI7Tyy0BoM3rEVrphHiKPMNnwcwt+9XWAIM/wERK9ik7KipJrpJVXQhD6JDnVbDUM8YK6AK9xXzEOlDaA/1qUSt2QU9WYPrRHvrFFi/WPFX1+s0HBZgq1nk/scO+xMh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GjD1jJZ3+relln7Yb2rZ38nxQoLZvUkSA6S3aqgnPg=;
 b=HqNW3hbmEEk2aR647nF+iA5afIGUBcoiMwLJ2BWLYc3NWB51idg5z/C79l8OvDcI86p0wouHWnvIu4o/CEzR8mfxSN7mdfdcqeT84nzHuhIhyOIYdPnWabu5hX9IYfRhCyQ1Tpv2h7x4PagPwLF5UaMwDRYFaDPQ1UmZTjO6Qz0lHs14zvrRuMJBQEuq4IpYdsgWfIY/UI4oxNHE7jtXfJNfqy+smqKWKNjmbxRIFAOo28lxjvPnlgPjrPc2UU9SQeclJ7868rMXb4x33fdsuGNT3QYblE+cGxW7ftqcvZL/i/0BbsVSjeYCratGd3+t5FlG+k1qBGrk1m42EMhLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GjD1jJZ3+relln7Yb2rZ38nxQoLZvUkSA6S3aqgnPg=;
 b=0GGTVR8wAvdeJtFMeV8OQeU/oODBI5xP0pcxiZsyIYixOWzvKIy9ppmf1et0MjW0SQwAF2oyPKr63WfUwQnNGm7SnaQdfgTDTW4AfYONqqC6GHO9QB94aaxKgjCC6QJYqv2uFDid8FTBHWQT8yNZ5t8m/LdNUFg7jkQvm7eqfEo=
Received: from PH0PR07CA0102.namprd07.prod.outlook.com (2603:10b6:510:4::17)
 by SA1PR12MB8920.namprd12.prod.outlook.com (2603:10b6:806:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:23:11 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:4:cafe::f8) by PH0PR07CA0102.outlook.office365.com
 (2603:10b6:510:4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:23:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:23:10 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 17:23:09 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 15:23:09 -0800
Received: from thonkpad.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 1 Dec 2025 15:23:09 -0800
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH v2 2/2] drm/amd/display: Implement prepare_vblank_enable
 callback
Date: Mon, 1 Dec 2025 18:18:07 -0500
Message-ID: <20251201231807.287414-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251201231807.287414-1-sunpeng.li@amd.com>
References: <20251201231807.287414-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SA1PR12MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc4e34d-55ad-4dad-b0eb-08de3130978f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OkRZAv9urm3zG7QemqOvtzi6lKnOcsTyIHHd15G4kDhv74KX9e8mXq8OXLAr?=
 =?us-ascii?Q?CfkhE+LSgmcYCPBXBSmSeTjPVWpwxAr1yg0kTRzQIl7vgIPrUyKNaVHpFpqI?=
 =?us-ascii?Q?Z4VglV/2lYRw0Yw5wHFiP5Sli6TOOv4c8FqpwBW6kUL5gnz3KP25/vHtm0e9?=
 =?us-ascii?Q?5rxuYEkJX5lfY+XhKJQw0kIqfAjL8WTJ6y1IO6GdKWgT52j1AroT2M0fBQix?=
 =?us-ascii?Q?pUXsEzaTJBRRPEMRUX4FdgAWYHTX/h+oDk2dD81aZH8OYuOeVOUMq5mnjDaz?=
 =?us-ascii?Q?6DvyHbo0FZRn+ETvDYLMlUkIeksuxvzgP3/cy9MWZc+D7LKjbK8Iz2znDYfz?=
 =?us-ascii?Q?tVJphoZn4HZtkN4aPuEmP+MaoL9eG7vcCj+2ORwQxbzviBD+tfKOV3k9oySc?=
 =?us-ascii?Q?/hE+fHxEejkKZ1eaypZI5SpaKTrCsK6geCwxQe6dV3ESoPE2MWoPD+02gxyO?=
 =?us-ascii?Q?OFMxDkw7DcC3NQpJ/K6H71n+7fkTqIchsX3Ca3gdmgO4CDx8Yycve4rVeeNg?=
 =?us-ascii?Q?RYbH6+v5WTsbJSPEaK4u6HXT8fTs4p+PrLMMKeaSMNZwETqPNBVRE5a7l/Ad?=
 =?us-ascii?Q?ijAjO1vmXipf/hLeMLIbZj31XOimvQlwQXILABN9KwwdtELMKjQDCZuxcu5c?=
 =?us-ascii?Q?mnDGnXmCBVCZTGHCkD8+NUyH1yOaOdpXIVzZufchXXZDW5+IcZ9YjItV1hlr?=
 =?us-ascii?Q?y1fzPk0nQ4EmJO6bXO0Wvj8uCvECj1hq8RF/IBNOH/Tb8opZE5LOt8u/aPvE?=
 =?us-ascii?Q?0GtX/s125tS2Vbbr6+JZ5uL1Dn1lEX1l+Sw3vaYJQ+tms/KKzzNVFbjRFoty?=
 =?us-ascii?Q?l9DVOJgGkPVP3TGobMoEtlT0tLzRmJrjfBYmvDIQOTtNBhqtGk3iIQas31m7?=
 =?us-ascii?Q?WMnlsZKFKx5r6Fy7iV7us+T4c8/tWg+89if6l0wZSQlmILiSWNW8i9fpP/fd?=
 =?us-ascii?Q?s40RcpLD0gkxWULPBLdm06No2wofCNmUbTWoQQaRLVwISmpVVDpcEuqkQikJ?=
 =?us-ascii?Q?Ej5aamQLOrpJouqptZWeu12rKJrCgX5sdBoCRJfDGmdXov1EmqrwJVWMp0Tl?=
 =?us-ascii?Q?KkT7PkfJNPSLa7tGbiGH2NSEi4bCmyZEa2s0x3mHPCWn8MJ9rQ5RBfdgQz9O?=
 =?us-ascii?Q?6uaEpJy8qLBj581FVCSUyp0VlChGdrb+WP1VOjmwZK4Bl0Ge2lsx+M2Mpfd8?=
 =?us-ascii?Q?7w509qTy0mLuJKRJwPjfpdWeIVjzOQK5Ib1yft6UHvCs5Kmb1Q6IKexia13f?=
 =?us-ascii?Q?JGJJ/akkpP+C/eu9dW0+PCiIpD0tmcjx/7Xpa3E0Qo2R7/W2Z+LzRImYxGYv?=
 =?us-ascii?Q?pqBD8AqTfANOndZ6H7JdW5EW1s8ADbzL2z+1tVrdHMWSLl0eZIZVYr8Qe36a?=
 =?us-ascii?Q?E49GEsmbUslYCBjy4CbjBTH2Asu4vCOqErdpYAQW9N+NhXPoIA4vsIq4Uchl?=
 =?us-ascii?Q?5Dz64cMfaFPxwrWjicS8dEUiRy9ZnIONMThbAzAwZgBvm70WAJJz7SM6Dxjm?=
 =?us-ascii?Q?FXy+e/mQ8XVoRDd28tYkRK0FysmYxYOZ5leu2DqY73bHB9IsT+Zs7aGTV3+i?=
 =?us-ascii?Q?Y1pVS7mtBiutHCxukGY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:23:10.3280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc4e34d-55ad-4dad-b0eb-08de3130978f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8920
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

v2: Add missing semicolon, add docstring for prepare_vbl_disallow_idle

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  4 +++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 36 +++++++++++++++++--
 4 files changed, 49 insertions(+), 3 deletions(-)

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
index 7065b20aa2e6b..a99612fb3467a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -587,6 +587,15 @@ struct amdgpu_display_manager {
 	 */
 	uint32_t active_vblank_irq_count;
 
+	/**
+	 * @prepare_vbl_disallow_idle:
+	 *
+	 * Set to true when idle has been disallowed. Set to false when vblank
+	 * interrupts have been enabled. i.e. idle re-allow on vblank disable is
+	 * blocked if this is true.
+	 */
+	bool prepare_vbl_disallow_idle;
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

