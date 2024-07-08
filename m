Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82E892AA94
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 22:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DE410E40F;
	Mon,  8 Jul 2024 20:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nvM6vIwG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8987710E40C;
 Mon,  8 Jul 2024 20:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqViuHdvZjrS25I84XL2NKN+XDCc553JOeBtfVBjjdB0UMW3fM9JMcil+HeICUcDQb2pjDBcYgd/OxGl7FOqExoNcuCxgKguj6dV1OtK3h6aOPDV4+0+UgDSY8E6vdHUkGoyKhCb7nUxbVyAVTYz15MR3NkooocX3/RUKSZ9Hk2b5dplUHzKMl0U8h/sNtKYufsfl9CGuuFuuURpoCqr7MKNXo9UI5Iizzz4oTqeUW0rYoO17bs6maqnVuFKJUrK77eIk9/WmW0PMffLQ38gGoGhNGGHWLmbCF0HYSQwsObH+EfjE7Bs7cqfMV5Wi4W6h2+kc0LQR7KpbEcvG9bdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIlH7fda8DVA/8CuDVAlsl6a9iCsX0SToxk1IZvCgcc=;
 b=aqfpj3CerMGkuPBjOzmJJer1+VNF9Zuu060ACAQkhJNw7QGE4luw/ghAVYh7MbR98skYqIi09ChFSvl/gaMtBeJ/+7kzA+zHMTWNchCVwYxLykecuiRVCCnEvj9HBcTWshdRHnFJBo5wwMFb4/BAPQfx1tUPsvqhzX3WVmvA8JTBlwYL/BSzbF4hnWCPyZCLqqkil6X4sNLDVHEE/Wi2skHwrD6RFtkrcBmnxm2+kmp8Vdxpp1qeaEuicv0yM/If4h1iIPjv54AExbR7lXiplkhu/A9i+oCVn0wd+C2a0HBEyU/tkZv4jxYv1gni3qSf1JNhZ3OaO8CllqNNJNcjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIlH7fda8DVA/8CuDVAlsl6a9iCsX0SToxk1IZvCgcc=;
 b=nvM6vIwGp/+jE0chPWfmuSxe+pNtBuEQEleKlS1W1BGwe2Oz2uyKlar+SpB1AVW+nFANPID4EXunK9rPX/aR2+t2xlaBCZ0ducswZbPMPpJ2UIuZEgcqvqrDn3hE/7SlL6uiqfpu77AACaO6hsjDTLRPKxEtJ4s76GG6lI3mKHg=
Received: from BN0PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:e8::25)
 by MN6PR12MB8589.namprd12.prod.outlook.com (2603:10b6:208:47d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 20:29:36 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::e1) by BN0PR04CA0050.outlook.office365.com
 (2603:10b6:408:e8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 20:29:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 20:29:35 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 15:29:33 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Maxime Ripard <mripard@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Alex Hung <alex.hung@amd.com>, Wayne Lin
 <wayne.lin@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 <amd-gfx@lists.freedesktop.org>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: [PATCH 2/2] drm/amd/display: use drm_crtc_set_vblank_offdelay()
Date: Mon, 8 Jul 2024 16:29:07 -0400
Message-ID: <20240708202907.383917-2-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240708202907.383917-1-hamza.mahfooz@amd.com>
References: <20240708202907.383917-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|MN6PR12MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: ab16d5af-c2a1-4cc0-3844-08dc9f8caefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XT4ygjos652NjZ7qdyN5DxwEnjYk6OI1t46Sb0Gh8+dnRDLFLQfb1gt8jYea?=
 =?us-ascii?Q?ZEASbynurzuG/PPaPH+4pCl4ZHH6WfLZQ2J34DzdjKf56+1EY82iGQ4ZJw+0?=
 =?us-ascii?Q?RX8e/4Mz3M+le2xKPFPMwgfzIuiumAuhZsANru4+wXILwt9bEBEL9LJT0f67?=
 =?us-ascii?Q?houXGtjc2dADoqyy+h0EUr2c9KL7PS41zh7iNtPai1asI0r1aHlYwOFVVsQP?=
 =?us-ascii?Q?MNoU7RKDxkddGzZWopuQ1eeIrUjAFCQf2ZHdNvd9k12UkDw5x6jWdpx2aG5E?=
 =?us-ascii?Q?mxRCbzm+IItf3QZkC6560Q/XF8cvqboacf6XAk6fHiIR3MMzWmB+COf3fss+?=
 =?us-ascii?Q?mmNKIyFRbVLP8N9OXt1L6+X6bvThKAUn9DiGXl6Atg4VDy79ebIXHrg+JiCG?=
 =?us-ascii?Q?qSbORQ26pSh81S6PPWVADzginM5zhAyryhDurlrhn8R6171pcDQoGmWXpph2?=
 =?us-ascii?Q?dZWEtHCQ+HAa1WuUXfhWZVV4wRJEWs+n8ZNoz4P5hOChNLKcU/t28Z6Eiiaw?=
 =?us-ascii?Q?XyIZmozoN++xmnyCMyMhfSaKqp/es0cq05oB3dWJTjJHDu/lrY7VPY3N+X8V?=
 =?us-ascii?Q?eqYBm+SOqiHDVyg+yRR0PadMH0zQ5UBO8nLNcevHmnFtauMDTHMyV/bGwXdF?=
 =?us-ascii?Q?OeUAZFSJlS4INzidpAZiDJz1HIbpXBW8MnON5kjqdmvbn2lWtYP2mpUN4GEs?=
 =?us-ascii?Q?F5d7V4M0ESIcA7+HSZmWQzE0d4Us0gHot99Q37y+ubc86Tg5FcXZYnJg8UPV?=
 =?us-ascii?Q?1zgtMjnlTY4ZgI3Z8L8HvYe+9rGRICRDOgEbOJw0oOEgIiDqfm+f1NL5BcHH?=
 =?us-ascii?Q?x34w1JAuc8Oj003Ljg0IAyMoQhcwvKdJ5e0mQ5SF3aQUmW0NKPO8EzX5aTGE?=
 =?us-ascii?Q?gMOGncvh8IlilgWTS8N1C5aL8ggW6JX5lpCQN5EmRg9zxUeXiY7gNejp+PQr?=
 =?us-ascii?Q?osj/BkMKihNEpvmTpRVh4egXvoitzFS2227pHWQyjyy8DgUstG0B4MCNS2l9?=
 =?us-ascii?Q?XwZMSKMK9CUIPt3GV7x12AN4fkYtZgZCCKv4ztmlICPDo16imc5j1AP949zr?=
 =?us-ascii?Q?utMFDvHQnT5freQlrzQFKz9Wmw62ELBMiPlARn3kuMXJIAw2vD9XZ3uds6sY?=
 =?us-ascii?Q?QUU6/ypHKql//LEzHP7UimEZJlXeszebhHIR0vDdprSMMODNYU7lZ1D/eNrj?=
 =?us-ascii?Q?J9iUGLTF7WMLVaWync0GkTKF5kK3crOmmOF19cbvL0dwWl21VPV+A4hOKnQB?=
 =?us-ascii?Q?3QhXhkChfiVtxFbDiXkvafbNo17DCE8R9kG3tStpi6cju4f+N3LKbm9FHKpe?=
 =?us-ascii?Q?+oDq7XaTPe8ZI7RXHOC+OoCqaJsgWC6/gTeMy32R+p0ezHkBXibHWvrEWcXN?=
 =?us-ascii?Q?lJoqQwhe14a1fq7VVyCzHwgrE3FyEw4LW+KyLYRZ0tST4+GFDGEBH9GqZCr+?=
 =?us-ascii?Q?SrpMzu/LHnHH6U5VyPkViWtlzfsnmNqr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 20:29:35.7804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab16d5af-c2a1-4cc0-3844-08dc9f8caefd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8589
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

Hook up drm_crtc_set_vblank_offdelay() in amdgpu_dm, so that we can
enable PSR more quickly for displays that support it.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 30 ++++++++++++++-----
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index fdbc9b57a23d..ee6c31e9d3c4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8231,7 +8231,7 @@ static int amdgpu_dm_encoder_init(struct drm_device *dev,
 
 static void manage_dm_interrupts(struct amdgpu_device *adev,
 				 struct amdgpu_crtc *acrtc,
-				 bool enable)
+				 struct dm_crtc_state *acrtc_state)
 {
 	/*
 	 * We have no guarantee that the frontend index maps to the same
@@ -8239,12 +8239,25 @@ static void manage_dm_interrupts(struct amdgpu_device *adev,
 	 *
 	 * TODO: Use a different interrupt or check DC itself for the mapping.
 	 */
-	int irq_type =
-		amdgpu_display_crtc_idx_to_irq_type(
-			adev,
-			acrtc->crtc_id);
+	int irq_type = amdgpu_display_crtc_idx_to_irq_type(adev,
+							   acrtc->crtc_id);
+	struct dc_crtc_timing *timing;
+	int offdelay;
+
+	if (acrtc_state) {
+		timing = &acrtc_state->stream->timing;
+
+		/* at least 2 frames */
+		offdelay = 2000 / div64_u64(div64_u64((timing->pix_clk_100hz *
+						       (uint64_t)100),
+						      timing->v_total),
+					    timing->h_total) + 1;
+
+		if (acrtc_state->stream->link->psr_settings.psr_version <
+		    DC_PSR_VERSION_UNSUPPORTED &&
+		    amdgpu_ip_version(adev, DCE_HWIP, 0) >= IP_VERSION(3, 5, 0))
+			drm_crtc_set_vblank_offdelay(&acrtc->base, offdelay);
 
-	if (enable) {
 		drm_crtc_vblank_on(&acrtc->base);
 		amdgpu_irq_get(
 			adev,
@@ -9319,7 +9332,7 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_state *state,
 		if (old_crtc_state->active &&
 		    (!new_crtc_state->active ||
 		     drm_atomic_crtc_needs_modeset(new_crtc_state))) {
-			manage_dm_interrupts(adev, acrtc, false);
+			manage_dm_interrupts(adev, acrtc, NULL);
 			dc_stream_release(dm_old_crtc_state->stream);
 		}
 	}
@@ -9834,7 +9847,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
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
2.45.1

