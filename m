Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5559AD0C0B6
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3AB10E93C;
	Fri,  9 Jan 2026 19:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i9Dv6wQZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013011.outbound.protection.outlook.com
 [40.107.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8527C10E939;
 Fri,  9 Jan 2026 19:21:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv/8bTvH3GEXCuYNs41+PcbOlx5l9LeGxUjdQliBA7X1YovymMsrgge4eeorKmEWHcj7okq6onqrtGwquGrAByBfSv2xCxnRDD6m1JRE8Yrbav4D3+9uzG5Z+i5ECjLEoSaYjiipe0+eKjzgqcqvVAavYZ0VgLogC2f+uxbatWjXv9fZ/fPVJrJj5kb42NAtcXWtzt0oTVExUhe8swcHSnD/k+3/daNagBSANf6c0k0EnTU9ZGl5PbLAvLe7g/jUcZLDQYVMDwlMBMdNT6w0RXS4IHGIcEBR8ROR4mxwWXz4vl2+WWhLfYYadyHQIyPadLeSzdS3ARYE51cZVWmh3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7v47fwJ45Ae6eGPkjgxSo50feMji4VJKRCXmTz/AceY=;
 b=Cw6f/M3JVUQBPQnCgb4nxL1XoYfGjqmLFoiVfyfOIyKtivyrDhqd7V8zyhjwKJO+EMSoq21hmrb6nclBCb3hHtewf/Nxmtm+PsXc2JfYmML9WfetO5RjcvV4vrgmrEPLO+h8JTHWuaF2G12+rLXBRQZzmRoDT/EiE0ZDVTuUVtT5BEfAnZ/bO86oN0NcX5RaSlW3Jn6eXgmTNrAvi5p3OpUkEu2CovCHwpaU5A71tUUMtKI5vPEg7FcnHrzNz8ZDOkGBTDI8JD73DTi4e6M6ftd6dFjyQ0PdtHqhz0Pq9lyd0MO8/I/pfAoqiw8vyvRXJMBWpYC2cJgMe0JgI2SK4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7v47fwJ45Ae6eGPkjgxSo50feMji4VJKRCXmTz/AceY=;
 b=i9Dv6wQZZ7XXgzJkUXCivt1c3atb+k9DYfjUejmRlaeFpFhHIf4YBVarHJwUAIWFh2HAnOVOwJGTnXDZ8+ApECr5U7DYrRH/4aAMXRzk7JXLqBovAyO0oBzDFybyQDriQHNWLn51ddVKwZ2uwjSNUA70QuC/asSvAHCbo4Ss5Fk=
Received: from BY5PR13CA0031.namprd13.prod.outlook.com (2603:10b6:a03:180::44)
 by LV3PR12MB9120.namprd12.prod.outlook.com (2603:10b6:408:1a3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 19:21:05 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:180:cafe::ba) by BY5PR13CA0031.outlook.office365.com
 (2603:10b6:a03:180::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.0 via Frontend Transport; Fri, 9
 Jan 2026 19:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 19:21:02 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 13:21:02 -0600
Received: from thonkpad (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Fri, 9 Jan 2026 13:20:59 -0600
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH v3 2/2] drm/amd/display: Implement prepare_vblank_enable
 callback
Date: Fri, 9 Jan 2026 14:20:27 -0500
Message-ID: <20260109192027.116325-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109192027.116325-1-sunpeng.li@amd.com>
References: <20260109192027.116325-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|LV3PR12MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: d50370a4-0f11-4913-4a99-08de4fb43ab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bai13+FdKibZZxNAQluMCwAhq2rUKo8oO4K22+GwubAuQLd9bcLkPeqC6lY9?=
 =?us-ascii?Q?5g2bSph8+ZZSGJ8YMnjWPqJzAu0W+Xi4Z1JpNrxbmmJnTw7xTURX3A1H5gkr?=
 =?us-ascii?Q?3oaOv7xd/AO6+auR1h01TxXSfj0LhJsWliGSV2ueoyrL9XUgD8mDf/ZoxV9Z?=
 =?us-ascii?Q?RSfJDgHLvk3D5nzf4JiBWua+G/vUYXcAobfSX9YMhKOM3rRjfR+cUopop7H/?=
 =?us-ascii?Q?4apmsbuHF5H4MJJpRh0C6Ge6DTXu2M/c6gm3SBRrXRKW8jZe5B2W3MNpWtnm?=
 =?us-ascii?Q?17B2liYMGOchcOQ3r+cVvoEulT3I6tTrCPI1FoerqVyc5MRJaLiJKf30y14A?=
 =?us-ascii?Q?p0Np973UDWzhCEThciDTf+7w94ZjBwkGuN5/Li5xZoVHpe6YeF7mbufpe6NR?=
 =?us-ascii?Q?8X1hzvJV7CVhwHWq5PF2ZGM7YgFGTEWmJLyiTxzKwX3+gcpN1pEp2Dqz1DsL?=
 =?us-ascii?Q?pW12fRtkykJ66DGXfVhdmTUUJ3/0MA11tCuclKfXQ8zCB6PHOOu01J1MDoD3?=
 =?us-ascii?Q?dgEIjqhCoJVldq9FcJ1+Ql7RcR2M0MEehubB4lpxHoQi9foFI7NnKk3H/NSo?=
 =?us-ascii?Q?WNTPyZdYRmXgDERMp76lS8VK+OA/kCV6XoRxlCnn+cseKj75HUC/Fu+hzYzj?=
 =?us-ascii?Q?3jA9NTciouWpQHMK+8wKjvfrn9AzgeTZQ13cRrlDOmaYwwgUxFa653FPArGb?=
 =?us-ascii?Q?jIh9wTYa3ikc8nh8gKmX3HJMPvG32cd9AH5XEoN38n6narao6W7MKjIrSJGl?=
 =?us-ascii?Q?nAk/kNji09wRBcQbmkYxBjxACGvghxUhoV1AAs0bUUZpfVRLpnLgqv4IyAOk?=
 =?us-ascii?Q?tv0W2xaSc6dhGZe3lySrTeOccRXCYOSr4/C5k0TlAYbC91pAwm4bw+L0x7ZX?=
 =?us-ascii?Q?yttfk6XmF+VIDl0lsArrag/w+Wh+o8tU2JSrpQfgz0iTO8RfcNUeXNXEVSeP?=
 =?us-ascii?Q?5b3Gh4f6T7quaCo4sVJToKISPsNYc9hB68mOVTH5ewfqRerYdtm//dQlNWf3?=
 =?us-ascii?Q?KJz+cWjqfT2PaFRdpTbX4W2qJ7ciaEo/MLcv9o/bN+VSrnBy7+KcRH15TW6h?=
 =?us-ascii?Q?h55Jlf7FaIaB6S6QGgtejctkioVw/cCX3VrpjRYQE06oAGaZciJ2LEojLNtg?=
 =?us-ascii?Q?RGQvANPFRddOndon6Be0uyBMsS1/5JTbLdb2nowx/7H9CiKmN5C1fnt1Crpl?=
 =?us-ascii?Q?3oamrBZXddPIOVXBBI8WoUucm67McWBGKN6QVcNOcXT5NWdVv3dFkII+3MnH?=
 =?us-ascii?Q?ptRpw1GoIkFfwJkcCoXyBzYcGiozc7HMbHe7msVWlVbmPURmR8qg0lVAA58/?=
 =?us-ascii?Q?8AQ7ixrwgoTIzx2exlX1YwdsV9/WP0ngalKl3peURslDvmPct9/cq3NmmQGi?=
 =?us-ascii?Q?2LpI70IIp9WHY0JZFx0KH3UVE8e6/1ta3urd+yLkv/pFLMbkV7DxSb3kx6Dz?=
 =?us-ascii?Q?geSqfa7tH81S/CYA6PqUwXjPOaJf7DF6BS4uEjSBGcBmhWXRiNvlUhsMNfnr?=
 =?us-ascii?Q?1aFU7tKm0IBxGENl+ir/iVdTEk/ShEXtd6ON?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:21:02.9986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d50370a4-0f11-4913-4a99-08de4fb43ab4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9120
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

Note that the only place that should unconditionally IPS allow is the
vblank disable path. All other paths shall check whether IPS was
previously allowed. If so, they can re-allow after all programming is
complete. They also need to hold the dc_lock for the duration of the IPS
disallow to re-allow. (This is not the for all of amdgpu_dm today,
cleanup will come in future patches.)

v2: Add missing semicolon, add docstring for prepare_vbl_disallow_idle
v3: Do prepare work (IPS exit) directly, instead of routing through DRM

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 37 ++++++++++++------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  6 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 38 +++++++++++++++++--
 4 files changed, 75 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 740711ac1037c..d0c412260be0c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9681,7 +9681,8 @@ static void update_stream_irq_parameters(
 	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 }
 
-static void amdgpu_dm_handle_vrr_transition(struct dm_crtc_state *old_state,
+static void amdgpu_dm_handle_vrr_transition(struct amdgpu_display_manager *dm,
+					    struct dm_crtc_state *old_state,
 					    struct dm_crtc_state *new_state)
 {
 	bool old_vrr_active = amdgpu_dm_crtc_vrr_active(old_state);
@@ -9696,8 +9697,11 @@ static void amdgpu_dm_handle_vrr_transition(struct dm_crtc_state *old_state,
 		 * We also need vupdate irq for the actual core vblank handling
 		 * at end of vblank.
 		 */
-		WARN_ON(amdgpu_dm_crtc_set_vupdate_irq(new_state->base.crtc, true) != 0);
-		WARN_ON(drm_crtc_vblank_get(new_state->base.crtc) != 0);
+		scoped_guard(mutex, &dm->dc_lock) {
+			dc_exit_ips_for_hw_access(dm->dc);
+			WARN_ON(amdgpu_dm_crtc_set_vupdate_irq(new_state->base.crtc, true) != 0);
+			WARN_ON(drm_crtc_vblank_get(new_state->base.crtc) != 0);
+		}
 		drm_dbg_driver(new_state->base.crtc->dev, "%s: crtc=%u VRR off->on: Get vblank ref\n",
 				 __func__, new_state->base.crtc->base.id);
 	} else if (old_vrr_active && !new_vrr_active) {
@@ -10122,7 +10126,11 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		 */
 		if (acrtc_attach->base.state->event &&
 		    acrtc_state->active_planes > 0) {
-			drm_crtc_vblank_get(pcrtc);
+
+			scoped_guard(mutex, &dm->dc_lock) {
+				dc_exit_ips_for_hw_access(dm->dc);
+				drm_crtc_vblank_get(pcrtc);
+			}
 
 			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
 
@@ -10138,13 +10146,19 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 					&acrtc_state->stream->vrr_infopacket;
 		}
 	} else if (cursor_update && acrtc_state->active_planes > 0) {
-		spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
-		if (acrtc_attach->base.state->event) {
-			drm_crtc_vblank_get(pcrtc);
-			acrtc_attach->event = acrtc_attach->base.state->event;
-			acrtc_attach->base.state->event = NULL;
+
+		scoped_guard(mutex, &dm->dc_lock) {
+			dc_exit_ips_for_hw_access(dm->dc);
+
+			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
+			if (acrtc_attach->base.state->event) {
+				drm_crtc_vblank_get(pcrtc);
+				acrtc_attach->event =
+					acrtc_attach->base.state->event;
+				acrtc_attach->base.state->event = NULL;
+			}
+			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
 		}
-		spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
 	}
 
 	/* Update the planes if changed or disable if we don't have any. */
@@ -10976,7 +10990,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			manage_dm_interrupts(adev, acrtc, dm_new_crtc_state);
 		}
 		/* Handle vrr on->off / off->on transitions */
-		amdgpu_dm_handle_vrr_transition(dm_old_crtc_state, dm_new_crtc_state);
+		amdgpu_dm_handle_vrr_transition(dm, dm_old_crtc_state,
+						dm_new_crtc_state);
 
 #ifdef CONFIG_DEBUG_FS
 		if (new_crtc_state->active &&
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index bd0403005f370..b2fbdaa7c5c9c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -585,6 +585,15 @@ struct amdgpu_display_manager {
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
index e20aa74380665..4477a0212893c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -656,7 +656,11 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 	 */
 	enabled = amdgpu_dm_is_valid_crc_source(cur_crc_src);
 	if (!enabled && enable) {
-		ret = drm_crtc_vblank_get(crtc);
+		scoped_guard(mutex, &dm->dc_lock) {
+			dc_exit_ips_for_hw_access(dm->dc);
+			ret = drm_crtc_vblank_get(crtc);
+		}
+
 		if (ret)
 			goto cleanup;
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 697e232acebfb..5edc035ec152a 100644
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
 
@@ -423,6 +434,26 @@ static inline int amdgpu_dm_crtc_set_vblank(struct drm_crtc *crtc, bool enable)
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
+		/*
+		 * Prevent the disable worker from re-allowing idle until
+		 * interrupts are enabled. Ensure compiler emits the write
+		 * before disallowing idle.
+		 */
+		WRITE_ONCE(dm->prepare_vbl_disallow_idle, true);
+		dc_exit_ips_for_hw_access(dm->dc);
+	}
+
+	return 0;
+}
+
 int amdgpu_dm_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	return amdgpu_dm_crtc_set_vblank(crtc, true);
@@ -590,6 +621,7 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
 	.get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
 	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
+	.prepare_enable_vblank = amdgpu_prepare_enable_vblank,
 	.enable_vblank = amdgpu_dm_crtc_enable_vblank,
 	.disable_vblank = amdgpu_dm_crtc_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
-- 
2.52.0

