Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO+bDBEVeWl3vAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:42:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48339A13A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3AF10E5B9;
	Tue, 27 Jan 2026 19:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cdiuVJk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013070.outbound.protection.outlook.com
 [40.107.201.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84EE10E5B7;
 Tue, 27 Jan 2026 19:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvAJ5w6C9ksNGMcFflsYZF5T27xTKyZGkmafawpbMXAGw73rQjXoE/FkGuDE6wFvzUP8D1PYawfjb4r1I3L3PerDavG6uGzm9tal0TR4c+K2XRv7qXc2ixbprblQFnYeHXFRFiykaglHgs0OgII8B+IeJ9UBLyuVTHIJkyQ1F5hPw83xd/AIBhuljwc0Bea1h3vvDk0/H7bn0tg6gM6AGtjXV9SE9BrKz3zZGzcOGXfIQevrJz63JdHG2kwLs7W381AB7daw35QGnunsj3TIKQBwQWlsdp6ai5DlJApeoEIdITp1qqLeV+/6pggMybw9WN4CY73rleVQv+Jvv1Aibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40SLbjF+RPVGdgFwDBzsWRwTOEHNuZlMoumMXJoP/BY=;
 b=o+ikintOtnqsPvo4OxbhfGEvTcqUYR3+K4MO+1wilINi5N2CKjNOXUqyKqpaJL0eWesEfW4zmrHhgqI1ZDDgh/60rHr3PQPUGd8Zc/uyXH0Bt5jbFfeUPftylCnXZs+5WlHAHfwoH10oVtVFij/cGR1wOonHJygCTO95ZZ71U0uKAKhENbWomrd4qvDmaZcrcrWqSY1hoBY5ZG6guClo3g7Tlff/B/1PX8wVI9RVYf0+oK1zUwL0VEwmF+3MJb1Km+O/WHZcSD9Bgs3PfusQ8uunvAmYvNDb6+WO0K0pHKSEMzdEmLZ0Zid06BUTQ3CDtf4dF+t7h7V0I0SLB9S6cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40SLbjF+RPVGdgFwDBzsWRwTOEHNuZlMoumMXJoP/BY=;
 b=cdiuVJk9YJUCYGGL9COHpzfqjMDlSjyaa2+gdA+wB2yfHrpiET4usZ/+F+lnGlOCRO1T5PNBeKWmOkiIkc2BP/D8liZ4k9gZ1XBlh6T46zjAs7W7JQ600Sk0Emhr8TQm6Y/o2bRwOnscNmqGTTW951gm7BZRN35+Mcfuf3bLMlQ=
Received: from IA4P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::6)
 by SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 19:41:58 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::f7) by IA4P220CA0008.outlook.office365.com
 (2603:10b6:208:558::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Tue,
 27 Jan 2026 19:42:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 19:41:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 27 Jan
 2026 13:41:57 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 27 Jan
 2026 11:41:57 -0800
Received: from thonkpad (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Tue, 27 Jan 2026 11:41:56 -0800
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <superm1@kernel.org>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH v4 2/2] drm/amd/display: Implement prepare_vblank_enable
 callback
Date: Tue, 27 Jan 2026 14:41:43 -0500
Message-ID: <20260127194143.176248-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127194143.176248-1-sunpeng.li@amd.com>
References: <20260127194143.176248-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 5737f9c3-729b-4303-821b-08de5ddc21fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kb9JTkoJXS1xESxZLSLFlqCCm3WC7C5F6z0qL34X79RcghLBL3UKQL0kQaWq?=
 =?us-ascii?Q?LF2COu05tSNHxtqH15DWnNLowriUJR/gqV8hRrl3JUnKq8z5ECbpU9saZcdo?=
 =?us-ascii?Q?KsZYLB6HWskWXDo8vn5ZL+ceZbjQ1Rw+PBxXRylBRhP++sW31OxAR5IR094o?=
 =?us-ascii?Q?OkJz4nt2yTlYHg2TODC7bR1B5q11YiAFLjsVgK/VYjQsivdgCKW9xcqtLWAz?=
 =?us-ascii?Q?k1C0zAs+JjC7n63Ije2FxpXHUryHn7+nFsq3nr0p6mTD81NsqWFaDscZ6OXl?=
 =?us-ascii?Q?pGrghF+zo/ZQqFl3Gc82kiW5bjpZRznfiEplWTygR0Yqi4mXGZEpIffMQqg4?=
 =?us-ascii?Q?O/PwPpbE8vNEUUj9rjeHWc4kno0PeWNzSdR1sw1nRseh/26ashiIxf6QzLJ4?=
 =?us-ascii?Q?FPauGnHDHCZ/cMx1ETz9kiwiqzVIn/HPpfTJFqaJNE6JG2mETRriz4mHinxp?=
 =?us-ascii?Q?bBcJCpEgRTLuiRgrEPEyp2tXZIMsxleUP3mCXjTuOXHCl7gSXygYtNunvWpU?=
 =?us-ascii?Q?wBvH1PXBP/rwt4hL4esTWfmY8E4PqedpdwTz/nVprTHunJa2YN+vhAPxHEPt?=
 =?us-ascii?Q?7tOCPCEEdl5Fx8hZ50RtVbckRGzGNqAY/fzaDSKNcQzRdG0LennnP4ude4Yh?=
 =?us-ascii?Q?zJvXO85JsZOJYpMfVsOfYnujbQZfjwy5y6zY3It9gMXByxIe9+SQMDiG27Wt?=
 =?us-ascii?Q?NvRkcApKcd6XhQ/UfUebbUOBz1iTnPLSbmLv4VD3xbldLNQYqO2VV4dbOU9l?=
 =?us-ascii?Q?k4CTUK/lOrDkQPxkmwZsk82iPaLAGF21DG+3x7A4BhQRwD7YwQI1xK1Mvl7B?=
 =?us-ascii?Q?FBs1BZFJriwOWctI58qn8/g6bACztiqROZmi6ZHKgnd5lIU4rtElcXKYBR9K?=
 =?us-ascii?Q?6W1TRHsUelouZU+tdNKkVjNq3M3iRw26g1RlR/8FI9Gt+Pn2ExXeuFmJaCbc?=
 =?us-ascii?Q?A9pWnW2+EiYQ9uHAmzKgT6yWF5erpV73ZlSAPwYoUs+cur+OavLOQeiDvmrY?=
 =?us-ascii?Q?LOjEUumG3YZ3yi7Tmv0Zoijgeif1uSFxdVxYoiqblZMPNHDDM57POzVY1z8z?=
 =?us-ascii?Q?6SvbKxNgq1TfNqLzD9mi7Q7v8mVNHY56vr7Y6ReKfAHVsw/YT8xcUFdcKeDk?=
 =?us-ascii?Q?sf06f/zJXN1bfVa+XzuNmcdBN8RhfF9C5WwtIj/wz5dtb8Pyfock5Enrx68Z?=
 =?us-ascii?Q?cBrrxeJEfHN0eRl42OIfHQ2Bjl6L1BaCx9m0P7S5jS7S8jqUwxljGi0d4CfR?=
 =?us-ascii?Q?m8E/lqnuDuAKiMlPJyS9XoUT0OXlODdGbfbgP2ubkzocyrySNGfLKflM6Zfx?=
 =?us-ascii?Q?WbGKy5oS6albXaayb5DDLNfSlgjHI27X5mqi3hyY8rHV43i1H0fEXxI6vsTX?=
 =?us-ascii?Q?O+sD/ljLIDv/TyIx6/LCklHmoeZYR+Pj/8O93WV5A6TrIL2vSWlPm6lZZUTn?=
 =?us-ascii?Q?nuDEe2btE8j5082KTlKkAaBt5rf/gtehP34H4YuNOC/Xrj5PdrJUZJHesYLo?=
 =?us-ascii?Q?RtcVlOsw2l+r6rpy16mGGD1sK/3B4VB4YtUcShcGVkYyDvGLa6yONY/nW0Eb?=
 =?us-ascii?Q?sbIFQOstEegRUX0a7eRksb+JvPYWLzsOo1J1L6Ailk9MDX+qST9kkADlK1p9?=
 =?us-ascii?Q?dA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:41:57.7075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5737f9c3-729b-4303-821b-08de5ddc21fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D48339A13A
X-Rspamd-Action: no action

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
v4: Fix build error on CONFIG_DRM_AMD_SECURE_DISPLAY not set

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 37 ++++++++++++------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  9 +++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  8 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 38 +++++++++++++++++--
 4 files changed, 75 insertions(+), 17 deletions(-)

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
index e20aa74380665..2d2eda804735a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -547,10 +547,8 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 	struct drm_crtc_commit *commit;
 	struct dm_crtc_state *crtc_state;
 	struct drm_device *drm_dev = crtc->dev;
-#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 	struct amdgpu_display_manager *dm = &adev->dm;
-#endif
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 	struct drm_dp_aux *aux = NULL;
 	bool enable = false;
@@ -656,7 +654,11 @@ int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
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

