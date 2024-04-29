Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52A8B62CE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E5C112111;
	Mon, 29 Apr 2024 19:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CW4D8BJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9A110FFE6;
 Mon, 29 Apr 2024 19:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzLIteZy8DRpFIl6XMGB5F8k/FDXt+kwQGo76MoYZV//hTlO9I/HJyhOakyNvCKDHqs8f01IJmPkkL6gZH9VpFVkSEKiEd+VKnDORJu+9KMnMINBKRdocd3qg57igiji7OiY6Erwnp2Z+BFrUibF7u/jlGPFepQVu6jI1SJGqYyAqWinSR3QszB3G/KabY9LXEg30tZLokA37fNeQrH8I84yzOlzD62zqh4ZWFW18MfSCpZZenuLa9nMtJQ3fqVKhdd1WHioLvpMmTeNw8pBvIsZvXO//c7OMZCbO+f6lvfqs6xuWJqjb16c+8FTH8JGk9lodOLq9fes6UGHRG99Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9Vr4KLLPhKTieIFwagpFBKbda+8mYUmf7zrjsGo4D4=;
 b=LagXSaKZozoeFz99DF6A8h0xjaR5FGdWVHaCJn9SJH9JN+Nn/PFvLaaW3Cd5Q1zGqBpurgdDAp6mGMJwl5iZ7maV1Gn+EnbLR9Q0cVmcap6p9eZqpe4St13nRr2MQFyOnUUsFoTEcg4MKHFM4nlBtjgKsvNB638Ybg7ao1vVRB2+uZ6uum4L1aDm7w9o8VYXEqXAp2JLbwzhO8AmosviT31Pon8ctxeW0TTU9vG5WfQaIgoJHQbxKOdgm1edTAbWEU2g+/vdd+KpDaj74+k9QqjfBEi6zDK/2cXeH4Lrnqn1ACqqLCf91sTIExUs7QguHimko8nR8x6W/KfUqUC0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9Vr4KLLPhKTieIFwagpFBKbda+8mYUmf7zrjsGo4D4=;
 b=CW4D8BJCvO1q0sHrirmgpAjXhKqt9UVJnf/yzlKpuHV4bRH4QP6jj0Mxbl0Pwvwb8u5g4w3+K5SLCduwMQ3OdbLdGE6jhUfFmz9fA08UsyM6FSfeD8FYiAp25K3Q/fJoZpqw5/kPDd28q5EPMRMin5Qp92GOcXvgdlNrzOdh1Kc=
Received: from BN0PR02CA0001.namprd02.prod.outlook.com (2603:10b6:408:e4::6)
 by SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 19:48:29 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:e4:cafe::a4) by BN0PR02CA0001.outlook.office365.com
 (2603:10b6:408:e4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35 via Frontend
 Transport; Mon, 29 Apr 2024 19:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.0 via Frontend Transport; Mon, 29 Apr 2024 19:48:29 +0000
Received: from thonkpad.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Apr
 2024 14:48:27 -0500
From: <sunpeng.li@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: Joshua Ashton <joshua@froggi.es>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>, Robert Mader
 <robert.mader@posteo.de>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 "Sean Paul" <sean@poorly.run>, Simon Ser <contact@emersion.fr>, Shashank
 Sharma <shashank.sharma@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 "Sebastian Wick" <sebastian.wick@redhat.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH v2 1/2] drm/amd/display: Introduce overlay cursor mode
Date: Mon, 29 Apr 2024 15:48:04 -0400
Message-ID: <20240429194805.141626-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|SJ1PR12MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: c1133a90-8a08-4a7c-d5bf-08dc688557b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|7416005|82310400014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5wG5WbTBgwK5fd4xSaPTNmo6IVFe7LQdaVU/LUuQQVGkDbdbPIj0ekQi+rp3?=
 =?us-ascii?Q?unKw1wBbPkhrifnh7gB33WpVwV6F9TGW5JDbN/Q4U6NqHN29YfKJTzv97g7M?=
 =?us-ascii?Q?fVr+nOfsXuySD1/nhjMZHMnTTO1m2YLNbu9RtUwJYWV9YDcUgZhc4VMuAqec?=
 =?us-ascii?Q?1duzt5jLolU3j7K6X5VpuW5qE34pHH1WmMLadu1GmP3T+vvCLh1B1kF7sLut?=
 =?us-ascii?Q?nOBskuIVzbB3AdkNYDh1oP3nSgr2KLgddivKrp2qK4Lxon/LjyPTMaw9iRML?=
 =?us-ascii?Q?cyNslIiWXSQEy4cCxjTgJBOyg9kOMGTpvUYOTHkCSTIE7+Abe2aN6D+cbFO9?=
 =?us-ascii?Q?HQ8vC5d9P7MU0bc8juKHB5lIBI/9J6Cib00e3Nx3OBu/n/K8YS0qmd+4UlyT?=
 =?us-ascii?Q?kyY1AkJ99zkPHH63l5nz3MK8yGphpTTxdd5WuA3fLlIGEJll5zGB2lx66qAX?=
 =?us-ascii?Q?1XxQ1NbMLub9bz5Mpee+MsliT7SMHXPuRuAEEJq330Zgw4AGpKDM/1CEAHLx?=
 =?us-ascii?Q?8K4oJ97ewz8eN+SzqwZ96TbTOkdWD1bfCh08AW/AKqb5n3v2z440oc4Kj+PT?=
 =?us-ascii?Q?jNsKGk86ykMsBEsGG69BtGPaLMjlHdUKVrtIZR2wfY+xXF7B+SJYOxSkJrZZ?=
 =?us-ascii?Q?jcA52hNkz3nIt6Tq/HSjShG+941hET4VnG7q0CJvqnVdXPGieGX8rXSL/eHA?=
 =?us-ascii?Q?U2toiJwXTsXodlcvBsnoLH7rfWmOE0I0wZrDiFv8uYw+PeHOFDWxcNrg9FYj?=
 =?us-ascii?Q?7/J+aU77V1JcZDrK/zIZZGln3Az+KJ5NFqsE1x+y+rC/KC4aZsg8xa9g+can?=
 =?us-ascii?Q?DZ3XPKbSWXDeQDWj5zZsELFnq6eBAcpvcxmouWQicRGbo2MGJ9DbWGchVADd?=
 =?us-ascii?Q?M1/WEaLQBrF01AA4mtDqZ9v/EYYMzF1lAEGBve1UIUkDnP0DOUxh/ksT/Ga/?=
 =?us-ascii?Q?ZdppEAEyyRQXI8RkAVusUdRBkHdNZmZLH6NdTGPmaz6+5dFW0QrwA1Ad9FB5?=
 =?us-ascii?Q?KEbp/2jlWz2ZBXXis9cfEVcKoJlgi5KoOVPxItprb3Pspi4jLiCu3Zey6yQ8?=
 =?us-ascii?Q?WD5zwYUXk0Z5taLX7bMIK+50q8wzyMAq1F95cwJdKcdJL7OZdUP2cP6rWZ5t?=
 =?us-ascii?Q?CzEuuB2Qf1sQCOwueOKqGwcrDdfBfzlP7KXwN8J0LG25CU5/tq+H4Msh/AQ0?=
 =?us-ascii?Q?fGU2FTJaNxsCJbQ4eI9LfK8GFPjoRO9C9yGu6U9I4obwJO2w7G7MRqMb3wR2?=
 =?us-ascii?Q?rSu5cVRPJAMrJL0Me4OWybvYuvT9V173GVgGkJ+xbdH7DdkAdpFGDsxuwGcM?=
 =?us-ascii?Q?pWLe6gMHeFtXAIavnQn8f4KseIVMJ1w3LMTL55mWIALejmDYkJJDc1JcvJon?=
 =?us-ascii?Q?ZWd7LkcA3VGknA3DJI4WqjuRz/fU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(7416005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 19:48:29.0772 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1133a90-8a08-4a7c-d5bf-08dc688557b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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

DCN is the display hardware for amdgpu. DRM planes are backed by DCN
hardware pipes, which carry pixel data from one end (memory), to the
other (output encoder).

Each DCN pipe has the ability to blend in a cursor early on in the
pipeline. In other words, there are no dedicated cursor planes in DCN,
which makes cursor behavior somewhat unintuitive for compositors.

For example, if the cursor is in RGB format, but the top-most DRM plane
is in YUV format, DCN will not be able to blend them. Because of this,
amdgpu_dm rejects all configurations where a cursor needs to be enabled
on top of a YUV formatted plane.

From a compositor's perspective, when computing an allocation for
hardware plane offloading, this cursor-on-yuv configuration result in an
atomic test failure. Since the failure reason is not obvious at all,
compositors will likely fall back to full rendering, which is not ideal.

Instead, amdgpu_dm can try to accommodate the cursor-on-yuv
configuration by opportunistically reserving a separate DCN pipe just
for the cursor. We can refer to this as "overlay cursor mode". It is
contrasted with "native cursor mode", where the native DCN per-pipe
cursor is used.

[How]

On each crtc, compute whether the cursor plane should be enabled in
overlay mode. If it is, mark the CRTC as requesting overlay cursor mode.

Overlay cursor should be enabled whenever there exists a underlying
plane that has YUV format, or is scaled differently than the cursor. It
should also be enabled if there is no underlying plane, or if underlying
planes do not cover the entire CRTC.

During DC validation, attempt to enable a separate DCN pipe for the
cursor if it's in overlay mode. If that fails, or if no overlay mode is
requested, then fallback to native mode.

v2:
* Update commit message for when overlay cursor should be enabled
* Also consider scale and no-underlying-plane case (cursor on crtc bg)
* Consider all underlying planes when determinig overlay/native, not
  just the plane immediately beneath the cursor, as it may not cover the
  entire CRTC.
* Fix typo s/decending/descending/
* Force native cursor on pre-DCN hardware

Signed-off-by: Leo Li <sunpeng.li@amd.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 490 +++++++++++++-----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  13 +-
 4 files changed, 386 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8245cc63712f..b4b5b73707c1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8490,8 +8490,22 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	 * Disable the cursor first if we're disabling all the planes.
 	 * It'll remain on the screen after the planes are re-enabled
 	 * if we don't.
+	 *
+	 * If the cursor is transitioning from native to overlay mode, the
+	 * native cursor needs to be disabled first.
 	 */
-	if (acrtc_state->active_planes == 0)
+	if (acrtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE &&
+	    dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE) {
+		struct dc_cursor_position cursor_position = {0};
+
+		dc_stream_set_cursor_position(acrtc_state->stream,
+					      &cursor_position);
+		bundle->stream_update.cursor_position =
+				&acrtc_state->stream->cursor_position;
+	}
+
+	if (acrtc_state->active_planes == 0 &&
+	    dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE)
 		amdgpu_dm_commit_cursors(state);
 
 	/* update planes when needed */
@@ -8505,7 +8519,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		struct dm_plane_state *dm_new_plane_state = to_dm_plane_state(new_plane_state);
 
 		/* Cursor plane is handled after stream updates */
-		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
+		if (plane->type == DRM_PLANE_TYPE_CURSOR &&
+		    acrtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE) {
 			if ((fb && crtc == pcrtc) ||
 			    (old_plane_state->fb && old_plane_state->crtc == pcrtc)) {
 				cursor_update = true;
@@ -8863,7 +8878,8 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	 * to be disabling a single plane - those pipes are being disabled.
 	 */
 	if (acrtc_state->active_planes &&
-	    (!updated_planes_and_streams || amdgpu_ip_version(dm->adev, DCE_HWIP, 0) == 0))
+	    (!updated_planes_and_streams || amdgpu_ip_version(dm->adev, DCE_HWIP, 0) == 0) &&
+	    acrtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE)
 		amdgpu_dm_commit_cursors(state);
 
 cleanup:
@@ -10176,7 +10192,8 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 {
 	struct drm_plane *other;
 	struct drm_plane_state *old_other_state, *new_other_state;
-	struct drm_crtc_state *new_crtc_state;
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct dm_crtc_state *old_dm_crtc_state, *new_dm_crtc_state;
 	struct amdgpu_device *adev = drm_to_adev(plane->dev);
 	int i;
 
@@ -10198,10 +10215,24 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 
 	new_crtc_state =
 		drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
+	old_crtc_state =
+		drm_atomic_get_old_crtc_state(state, old_plane_state->crtc);
 
 	if (!new_crtc_state)
 		return true;
 
+	/*
+	 * A change in cursor mode means a new dc pipe needs to be acquired or
+	 * released from the state
+	 */
+	old_dm_crtc_state = to_dm_crtc_state(old_crtc_state);
+	new_dm_crtc_state = to_dm_crtc_state(new_crtc_state);
+	if (plane->type == DRM_PLANE_TYPE_CURSOR &&
+	    old_dm_crtc_state != NULL &&
+	    old_dm_crtc_state->cursor_mode != new_dm_crtc_state->cursor_mode) {
+		return true;
+	}
+
 	/* CRTC Degamma changes currently require us to recreate planes. */
 	if (new_crtc_state->color_mgmt_changed)
 		return true;
@@ -10353,6 +10384,68 @@ static int dm_check_cursor_fb(struct amdgpu_crtc *new_acrtc,
 	return 0;
 }
 
+/*
+ * Helper function for checking the cursor in native mode
+ */
+static int dm_check_native_cursor_state(struct drm_crtc *new_plane_crtc,
+					struct drm_plane *plane,
+					struct drm_plane_state *new_plane_state,
+					bool enable)
+{
+
+	struct amdgpu_crtc *new_acrtc;
+	int ret;
+
+	if (!enable || !new_plane_crtc ||
+	    drm_atomic_plane_disabling(plane->state, new_plane_state))
+		return 0;
+
+	new_acrtc = to_amdgpu_crtc(new_plane_crtc);
+
+	if (new_plane_state->src_x != 0 || new_plane_state->src_y != 0) {
+		DRM_DEBUG_ATOMIC("Cropping not supported for cursor plane\n");
+		return -EINVAL;
+	}
+
+	if (new_plane_state->fb) {
+		ret = dm_check_cursor_fb(new_acrtc, new_plane_state,
+						new_plane_state->fb);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static bool dm_should_update_native_cursor(struct drm_atomic_state *state,
+					   struct drm_crtc *old_plane_crtc,
+					   struct drm_crtc *new_plane_crtc,
+					   bool enable)
+{
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
+
+	if (!enable) {
+		if (old_plane_crtc == NULL)
+			return true;
+
+		old_crtc_state = drm_atomic_get_old_crtc_state(
+			state, old_plane_crtc);
+		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
+
+		return dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE;
+	} else {
+		if (new_plane_crtc == NULL)
+			return true;
+
+		new_crtc_state = drm_atomic_get_new_crtc_state(
+			state, new_plane_crtc);
+		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+
+		return dm_new_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE;
+	}
+}
+
 static int dm_update_plane_state(struct dc *dc,
 				 struct drm_atomic_state *state,
 				 struct drm_plane *plane,
@@ -10368,8 +10461,7 @@ static int dm_update_plane_state(struct dc *dc,
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct dm_crtc_state *dm_new_crtc_state, *dm_old_crtc_state;
 	struct dm_plane_state *dm_new_plane_state, *dm_old_plane_state;
-	struct amdgpu_crtc *new_acrtc;
-	bool needs_reset;
+	bool needs_reset, update_native_cursor;
 	int ret = 0;
 
 
@@ -10378,24 +10470,16 @@ static int dm_update_plane_state(struct dc *dc,
 	dm_new_plane_state = to_dm_plane_state(new_plane_state);
 	dm_old_plane_state = to_dm_plane_state(old_plane_state);
 
-	if (plane->type == DRM_PLANE_TYPE_CURSOR) {
-		if (!enable || !new_plane_crtc ||
-			drm_atomic_plane_disabling(plane->state, new_plane_state))
-			return 0;
+	update_native_cursor = dm_should_update_native_cursor(state,
+							      old_plane_crtc,
+							      new_plane_crtc,
+							      enable);
 
-		new_acrtc = to_amdgpu_crtc(new_plane_crtc);
-
-		if (new_plane_state->src_x != 0 || new_plane_state->src_y != 0) {
-			DRM_DEBUG_ATOMIC("Cropping not supported for cursor plane\n");
-			return -EINVAL;
-		}
-
-		if (new_plane_state->fb) {
-			ret = dm_check_cursor_fb(new_acrtc, new_plane_state,
-						 new_plane_state->fb);
-			if (ret)
-				return ret;
-		}
+	if (plane->type == DRM_PLANE_TYPE_CURSOR && update_native_cursor) {
+		ret = dm_check_native_cursor_state(new_plane_crtc, plane,
+						    new_plane_state, enable);
+		if (ret)
+			return ret;
 
 		return 0;
 	}
@@ -10423,15 +10507,15 @@ static int dm_update_plane_state(struct dc *dc,
 
 		ret = dm_atomic_get_state(state, &dm_state);
 		if (ret)
-			return ret;
+			goto out;
 
 		if (!dc_state_remove_plane(
 				dc,
 				dm_old_crtc_state->stream,
 				dm_old_plane_state->dc_state,
 				dm_state->context)) {
-
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 
 		if (dm_old_plane_state->dc_state)
@@ -10461,20 +10545,14 @@ static int dm_update_plane_state(struct dc *dc,
 
 		ret = amdgpu_dm_plane_helper_check_state(new_plane_state, new_crtc_state);
 		if (ret)
-			return ret;
+			goto out;
 
 		WARN_ON(dm_new_plane_state->dc_state);
 
 		dc_new_plane_state = dc_create_plane_state(dc);
-		if (!dc_new_plane_state)
-			return -ENOMEM;
-
-		/* Block top most plane from being a video plane */
-		if (plane->type == DRM_PLANE_TYPE_OVERLAY) {
-			if (amdgpu_dm_plane_is_video_format(new_plane_state->fb->format->format) && *is_top_most_overlay)
-				return -EINVAL;
-
-			*is_top_most_overlay = false;
+		if (!dc_new_plane_state) {
+			ret = -ENOMEM;
+			goto out;
 		}
 
 		DRM_DEBUG_ATOMIC("Enabling DRM plane: %d on DRM crtc %d\n",
@@ -10487,13 +10565,13 @@ static int dm_update_plane_state(struct dc *dc,
 			new_crtc_state);
 		if (ret) {
 			dc_plane_state_release(dc_new_plane_state);
-			return ret;
+			goto out;
 		}
 
 		ret = dm_atomic_get_state(state, &dm_state);
 		if (ret) {
 			dc_plane_state_release(dc_new_plane_state);
-			return ret;
+			goto out;
 		}
 
 		/*
@@ -10510,7 +10588,8 @@ static int dm_update_plane_state(struct dc *dc,
 				dm_state->context)) {
 
 			dc_plane_state_release(dc_new_plane_state);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 
 		dm_new_plane_state->dc_state = dc_new_plane_state;
@@ -10525,6 +10604,16 @@ static int dm_update_plane_state(struct dc *dc,
 		*lock_and_validation_needed = true;
 	}
 
+out:
+	/* If cursor overlay failed, attempt fallback to native mode */
+	if (ret == -EINVAL && plane->type == DRM_PLANE_TYPE_CURSOR) {
+		ret = dm_check_native_cursor_state(new_plane_crtc, plane,
+						    new_plane_state, enable);
+		if (ret)
+			return ret;
+
+		dm_new_crtc_state->cursor_mode = DM_CURSOR_NATIVE_MODE;
+	}
 
 	return ret;
 }
@@ -10558,99 +10647,64 @@ dm_get_plane_scale(struct drm_plane_state *plane_state,
 	*out_plane_scale_h = plane_state->crtc_h * 1000 / plane_src_h;
 }
 
-static int dm_check_crtc_cursor(struct drm_atomic_state *state,
-				struct drm_crtc *crtc,
-				struct drm_crtc_state *new_crtc_state)
+/*
+ * The normalized_zpos value cannot be used by this iterator directly. It's only
+ * calculated for enabled planes, potentially causing normalized_zpos collisions
+ * between enabled/disabled planes in the atomic state. We need a unique value
+ * so that the iterator will not generate the same object twice, or loop
+ * indefinitely.
+ */
+static inline struct __drm_planes_state *__get_next_zpos(
+	struct drm_atomic_state *state,
+	struct __drm_planes_state *prev)
 {
-	struct drm_plane *cursor = crtc->cursor, *plane, *underlying;
-	struct drm_plane_state *old_plane_state, *new_plane_state;
-	struct drm_plane_state *new_cursor_state, *new_underlying_state;
-	int i;
-	int cursor_scale_w, cursor_scale_h, underlying_scale_w, underlying_scale_h;
-	bool any_relevant_change = false;
-
-	/* On DCE and DCN there is no dedicated hardware cursor plane. We get a
-	 * cursor per pipe but it's going to inherit the scaling and
-	 * positioning from the underlying pipe. Check the cursor plane's
-	 * blending properties match the underlying planes'.
-	 */
-
-	/* If no plane was enabled or changed scaling, no need to check again */
-	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
-		int new_scale_w, new_scale_h, old_scale_w, old_scale_h;
-
-		if (!new_plane_state || !new_plane_state->fb || new_plane_state->crtc != crtc)
-			continue;
-
-		if (!old_plane_state || !old_plane_state->fb || old_plane_state->crtc != crtc) {
-			any_relevant_change = true;
-			break;
-		}
-
-		if (new_plane_state->fb == old_plane_state->fb &&
-		    new_plane_state->crtc_w == old_plane_state->crtc_w &&
-		    new_plane_state->crtc_h == old_plane_state->crtc_h)
-			continue;
-
-		dm_get_plane_scale(new_plane_state, &new_scale_w, &new_scale_h);
-		dm_get_plane_scale(old_plane_state, &old_scale_w, &old_scale_h);
+	unsigned int highest_zpos = 0, prev_zpos = 256;
+	uint32_t highest_id = 0, prev_id = UINT_MAX;
+	struct drm_plane_state *new_plane_state;
+	struct drm_plane *plane;
+	int i, highest_i = -1;
 
-		if (new_scale_w != old_scale_w || new_scale_h != old_scale_h) {
-			any_relevant_change = true;
-			break;
-		}
+	if (prev != NULL) {
+		prev_zpos = prev->new_state->zpos;
+		prev_id = prev->ptr->base.id;
 	}
 
-	if (!any_relevant_change)
-		return 0;
-
-	new_cursor_state = drm_atomic_get_plane_state(state, cursor);
-	if (IS_ERR(new_cursor_state))
-		return PTR_ERR(new_cursor_state);
-
-	if (!new_cursor_state->fb)
-		return 0;
-
-	dm_get_plane_scale(new_cursor_state, &cursor_scale_w, &cursor_scale_h);
-
-	/* Need to check all enabled planes, even if this commit doesn't change
-	 * their state
-	 */
-	i = drm_atomic_add_affected_planes(state, crtc);
-	if (i)
-		return i;
-
-	for_each_new_plane_in_state_reverse(state, underlying, new_underlying_state, i) {
-		/* Narrow down to non-cursor planes on the same CRTC as the cursor */
-		if (new_underlying_state->crtc != crtc || underlying == crtc->cursor)
+	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
+		/* Skip planes with higher zpos than the previously returned */
+		if (new_plane_state->zpos > prev_zpos ||
+		    (new_plane_state->zpos == prev_zpos &&
+		     plane->base.id >= prev_id))
 			continue;
 
-		/* Ignore disabled planes */
-		if (!new_underlying_state->fb)
-			continue;
-
-		dm_get_plane_scale(new_underlying_state,
-				   &underlying_scale_w, &underlying_scale_h);
-
-		if (cursor_scale_w != underlying_scale_w ||
-		    cursor_scale_h != underlying_scale_h) {
-			drm_dbg_atomic(crtc->dev,
-				       "Cursor [PLANE:%d:%s] scaling doesn't match underlying [PLANE:%d:%s]\n",
-				       cursor->base.id, cursor->name, underlying->base.id, underlying->name);
-			return -EINVAL;
+		/* Save the index of the plane with highest zpos */
+		if (new_plane_state->zpos > highest_zpos ||
+		    (new_plane_state->zpos == highest_zpos &&
+		     plane->base.id > highest_id)) {
+			highest_zpos = new_plane_state->zpos;
+			highest_id = plane->base.id;
+			highest_i = i;
 		}
-
-		/* If this plane covers the whole CRTC, no need to check planes underneath */
-		if (new_underlying_state->crtc_x <= 0 &&
-		    new_underlying_state->crtc_y <= 0 &&
-		    new_underlying_state->crtc_x + new_underlying_state->crtc_w >= new_crtc_state->mode.hdisplay &&
-		    new_underlying_state->crtc_y + new_underlying_state->crtc_h >= new_crtc_state->mode.vdisplay)
-			break;
 	}
 
-	return 0;
+	if (highest_i < 0)
+		return NULL;
+
+	return &state->planes[highest_i];
 }
 
+/*
+ * Use the uniqueness of the plane's (zpos, drm obj ID) combination to iterate
+ * by descending zpos, as read from the new plane state. This is the same
+ * ordering as defined by drm_atomic_normalize_zpos().
+ */
+#define for_each_oldnew_plane_in_descending_zpos(__state, plane, old_plane_state, new_plane_state) \
+	for (struct __drm_planes_state *__i = __get_next_zpos((__state), NULL); \
+	     __i != NULL; __i = __get_next_zpos((__state), __i))		\
+		for_each_if(((plane) = __i->ptr,				\
+			     (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
+			     (old_plane_state) = __i->old_state,		\
+			     (new_plane_state) = __i->new_state, 1))
+
 static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm_crtc *crtc)
 {
 	struct drm_connector *connector;
@@ -10681,6 +10735,162 @@ static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm
 	return drm_dp_mst_add_affected_dsc_crtcs(state, &aconnector->mst_root->mst_mgr);
 }
 
+/**
+ * DOC: Cursor Modes - Native vs Overlay
+ *
+ * In native mode, the cursor uses a integrated cursor pipe within each DCN hw
+ * plane. It does not require a dedicated hw plane to enable, but it is
+ * subjected to the same z-order and scaling as the hw plane. It also has format
+ * restrictions, a RGB cursor in native mode cannot be enabled within a non-RGB
+ * hw plane.
+ *
+ * In overlay mode, the cursor uses a separate DCN hw plane, and thus has its
+ * own scaling and z-pos. It also has no blending restrictions. It lends to a
+ * cursor behavior more akin to a DRM client's expectations. However, it does
+ * occupy an extra DCN plane, and therefore will only be used if a DCN plane is
+ * available.
+ */
+
+/**
+ * dm_crtc_get_cursor_mode() - Determine the required cursor mode on crtc
+ * @adev: amdgpu device
+ * @state: DRM atomic state
+ * @dm_crtc_state: amdgpu state for the CRTC containing the cursor
+ * @cursor_mode: Returns the required cursor mode on dm_crtc_state
+ *
+ * Get whether the cursor should be enabled in native mode, or overlay mode, on
+ * the dm_crtc_state.
+ *
+ * The cursor should be enabled in overlay mode if there exists an underlying
+ * plane - on which the cursor may be blended - that is either YUV formatted, or
+ * scaled differently from the cursor.
+ *
+ * Since zpos info is required, drm_atomic_normalize_zpos must be called before
+ * calling this function.
+ *
+ * Return: 0 on success, or an error code if getting the cursor plane state
+ * failed.
+ */
+static int dm_crtc_get_cursor_mode(struct amdgpu_device *adev,
+				   struct drm_atomic_state *state,
+				   struct dm_crtc_state *dm_crtc_state,
+				   enum amdgpu_dm_cursor_mode *cursor_mode)
+{
+	struct drm_plane_state *old_plane_state, *plane_state, *cursor_state;
+	struct drm_crtc_state *crtc_state = &dm_crtc_state->base;
+	struct drm_plane *plane;
+	bool consider_mode_change = false;
+	bool entire_crtc_covered = false;
+	bool cursor_changed = false;
+	int underlying_scale_w, underlying_scale_h;
+	int cursor_scale_w, cursor_scale_h;
+	int i;
+
+	/* Overlay cursor not supported on HW before DCN */
+	if (amdgpu_ip_version(adev, DCE_HWIP, 0) == 0) {
+		*cursor_mode = DM_CURSOR_NATIVE_MODE;
+		return 0;
+	}
+
+	/*
+	 * Cursor mode can change if a plane's format changes, scale changes, is
+	 * enabled/disabled, or z-order changes.
+	 */
+	for_each_oldnew_plane_in_state(state, plane, old_plane_state, plane_state, i) {
+		int new_scale_w, new_scale_h, old_scale_w, old_scale_h;
+
+		/* Only care about planes on this CRTC */
+		if ((drm_plane_mask(plane) & crtc_state->plane_mask) == 0)
+			continue;
+
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			cursor_changed = true;
+
+		if (drm_atomic_plane_enabling(old_plane_state, plane_state) ||
+		    drm_atomic_plane_disabling(old_plane_state, plane_state) ||
+		    old_plane_state->fb->format != plane_state->fb->format) {
+			consider_mode_change = true;
+			break;
+		}
+
+		dm_get_plane_scale(plane_state, &new_scale_w, &new_scale_h);
+		dm_get_plane_scale(old_plane_state, &old_scale_w, &old_scale_h);
+		if (new_scale_w != old_scale_w || new_scale_h != old_scale_h) {
+			consider_mode_change = true;
+			break;
+		}
+	}
+
+	if (!consider_mode_change && !crtc_state->zpos_changed)
+		return 0;
+
+	/*
+	 * If no cursor change on this CRTC, and not enabled on this CRTC, then
+	 * no need to set cursor mode. This avoids needlessly locking the cursor
+	 * state.
+	 */
+	if (!cursor_changed &&
+	    !(drm_plane_mask(crtc_state->crtc->cursor) & crtc_state->plane_mask)) {
+		return 0;
+	}
+
+	cursor_state = drm_atomic_get_plane_state(state,
+						  crtc_state->crtc->cursor);
+	if (IS_ERR(cursor_state))
+		return PTR_ERR(cursor_state);
+
+	/* Cursor is disabled */
+	if (!cursor_state->fb)
+		return 0;
+
+	/* For all planes in descending z-order (all of which are below cursor
+	 * as per zpos definitions), check their scaling and format
+	 */
+	for_each_oldnew_plane_in_descending_zpos(state, plane, old_plane_state, plane_state) {
+
+		/* Only care about non-cursor planes on this CRTC */
+		if ((drm_plane_mask(plane) & crtc_state->plane_mask) == 0 ||
+		    plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
+		/* Underlying plane is YUV format - use overlay cursor */
+		if (amdgpu_dm_plane_is_video_format(plane_state->fb->format->format)) {
+			*cursor_mode = DM_CURSOR_OVERLAY_MODE;
+			return 0;
+		}
+
+		dm_get_plane_scale(plane_state,
+				   &underlying_scale_w, &underlying_scale_h);
+		dm_get_plane_scale(cursor_state,
+				   &cursor_scale_w, &cursor_scale_h);
+
+		/* Underlying plane has different scale - use overlay cursor */
+		if (cursor_scale_w != underlying_scale_w &&
+		    cursor_scale_h != underlying_scale_h) {
+			*cursor_mode = DM_CURSOR_OVERLAY_MODE;
+			return 0;
+		}
+
+		/* If this plane covers the whole CRTC, no need to check planes underneath */
+		if (plane_state->crtc_x <= 0 && plane_state->crtc_y <= 0 &&
+		    plane_state->crtc_x + plane_state->crtc_w >= crtc_state->mode.hdisplay &&
+		    plane_state->crtc_y + plane_state->crtc_h >= crtc_state->mode.vdisplay) {
+			entire_crtc_covered = true;
+			break;
+		}
+	}
+
+	/* If planes do not cover the entire CRTC, use overlay mode to enable
+	 * cursor over holes
+	 */
+	if (entire_crtc_covered)
+		*cursor_mode = DM_CURSOR_NATIVE_MODE;
+	else
+		*cursor_mode = DM_CURSOR_OVERLAY_MODE;
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_atomic_check() - Atomic check implementation for AMDgpu DM.
  *
@@ -10850,6 +11060,21 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		goto fail;
 	}
 
+	/*
+	 * Determine whether cursors on each CRTC should be enabled in native or
+	 * overlay mode.
+	 */
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+
+		ret = dm_crtc_get_cursor_mode(adev, state, dm_new_crtc_state,
+					      &dm_new_crtc_state->cursor_mode);
+		if (ret) {
+			drm_dbg(dev, "Failed to determine cursor mode\n");
+			goto fail;
+		}
+	}
+
 	/* Remove exiting planes if they are modified */
 	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
 		if (old_plane_state->fb && new_plane_state->fb &&
@@ -10930,11 +11155,28 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			DRM_DEBUG_DRIVER("MPO enablement requested on crtc:[%p]\n", crtc);
 	}
 
-	/* Check cursor planes scaling */
+	/* Check cursor restrictions */
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
-		ret = dm_check_crtc_cursor(state, crtc, new_crtc_state);
+		enum amdgpu_dm_cursor_mode required_cursor_mode;
+
+		/* Overlay cusor not subject to native cursor restrictions */
+		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+		if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
+			continue;
+
+		/* If HW can only do native cursor, check restrictions again */
+		ret = dm_crtc_get_cursor_mode(adev, state, dm_new_crtc_state,
+					      &required_cursor_mode);
 		if (ret) {
-			DRM_DEBUG_DRIVER("dm_check_crtc_cursor() failed\n");
+			drm_dbg_driver(crtc->dev,
+				       "[CRTC:%d:%s] Checking cursor mode failed\n",
+				       crtc->base.id, crtc->name);
+			goto fail;
+		} else if (required_cursor_mode == DM_CURSOR_OVERLAY_MODE) {
+			drm_dbg_driver(crtc->dev,
+				       "[CRTC:%d:%s] Cannot enable native cursor due to scaling or YUV restrictions\n",
+				       crtc->base.id, crtc->name);
+			ret = -EINVAL;
 			goto fail;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 79469cdc3b10..5194defb8dd6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -830,6 +830,11 @@ struct dm_plane_state {
 	enum amdgpu_transfer_function blend_tf;
 };
 
+enum amdgpu_dm_cursor_mode {
+	DM_CURSOR_NATIVE_MODE = 0,
+	DM_CURSOR_OVERLAY_MODE,
+};
+
 struct dm_crtc_state {
 	struct drm_crtc_state base;
 	struct dc_stream_state *stream;
@@ -860,6 +865,8 @@ struct dm_crtc_state {
 	 * encoding.
 	 */
 	enum amdgpu_transfer_function regamma_tf;
+
+	enum amdgpu_dm_cursor_mode cursor_mode;
 };
 
 #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 83ea0afddda7..e16eecb146fd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -361,6 +361,7 @@ static struct drm_crtc_state *amdgpu_dm_crtc_duplicate_state(struct drm_crtc *cr
 	state->regamma_tf = cur->regamma_tf;
 	state->crc_skip_count = cur->crc_skip_count;
 	state->mpo_requested = cur->mpo_requested;
+	state->cursor_mode = cur->cursor_mode;
 	/* TODO Duplicate dc_stream after objects are stream object is flattened */
 
 	return &state->base;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index a64f20fcddaa..3e467244ad07 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -104,7 +104,7 @@ void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state
 	*global_alpha = false;
 	*global_alpha_value = 0xff;
 
-	if (plane_state->plane->type != DRM_PLANE_TYPE_OVERLAY)
+	if (plane_state->plane->type == DRM_PLANE_TYPE_PRIMARY)
 		return;
 
 	if (plane_state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ||
@@ -1190,10 +1190,21 @@ static int amdgpu_dm_plane_atomic_check(struct drm_plane *plane,
 static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
 					      struct drm_atomic_state *state)
 {
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_plane_state *new_plane_state;
+	struct dm_crtc_state *dm_new_crtc_state;
+
 	/* Only support async updates on cursor planes. */
 	if (plane->type != DRM_PLANE_TYPE_CURSOR)
 		return -EINVAL;
 
+	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
+	dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
+	/* Reject overlay cursors for now*/
+	if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.44.0

