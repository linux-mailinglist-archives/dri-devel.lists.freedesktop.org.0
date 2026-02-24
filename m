Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDpVJ7oXnmm2TQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF418CC20
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E6D10E62E;
	Tue, 24 Feb 2026 21:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LNFkdaMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F7F10E623;
 Tue, 24 Feb 2026 21:27:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5x+RWnd8nk3vY0NRV0j+8rwUThNV2LcE/bb/fK1sEsXUiDKXdoLMcUq5elOQuMEDZC8YpWNN6fmdZ10TF2pwFxftaqAsjOcNYo7aFX8Z+B2H2eRsuXOCz3/yGQreqS3IACxyQDjue0ccp8U7NjBg5IDBQH/D50jNH6rbUCRebopB38io9Fo/9IcC1H5v8Fp6rrr2oWE5wAAZxcOGTf85+QncA9ndS6frEUGSLFgcYPsqSHELkyBPQ98GxPh+ODqHTM3EE2wy9vLVFp5NVkTSfSYPbXzpuwm/uAd2XK7up2Vfyfw1ZoIwacZgiYdd3ZDgHdJowrH7hMSMjIr9AJrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCucqD0Pe6rSf55FBTKCJURv6lsxC1Jcb87jC6+9z3Y=;
 b=Q8enqP3cIK+8M9UnxtLeoiUC4A2mv0n2xhNZ5FNdUjnwJTrytUSqx5CVgpnjbwaTJ5R91MbogJSRrogSLv1ll4NQvwJW8xyTEWIG+FDlPhgb50Sgwu8aQUkYMYs6Vqb5J2TnceR9qon13EssXLYfUB4nA/DZBlW8T7lHVKB7F6QD/tzTQnGppIWIrLUIWU9KoHQfF4mQjMIIWoup0CWP03srz4C6+bpUx27pvWqSVntXvqgOi1taL77CYuF9b9sFa8raYucJfDYFyA8mGAvm4tOdJMuEOG+MPoGxndgplh5Plp5N9j19SICDmPdXqTJaOlvB6JZeGm5WJWF2cfRpXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCucqD0Pe6rSf55FBTKCJURv6lsxC1Jcb87jC6+9z3Y=;
 b=LNFkdaMN0XTSfIU/g0OWTORFwXQj7VxOj9eK1dDdk2+jv5pUGvvyGNIaHwoq+AAhJCGHT4S/NEWf47J7vY3IOWHdbFDec0/Y/Vb417luJhdLaZuAtN8cRoLyzQKo9GyexWxa9N4l0kDNfI+tWJ4RPzNcn6h04YiAfnz8e49PvK4=
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 21:27:06 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::fc) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 21:27:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 21:27:05 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 15:27:00 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 15:27:00 -0600
Received: from thonkpad (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Tue, 24 Feb 2026 15:26:59 -0600
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <superm1@kernel.org>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 4/5] drm/amd/display: Implement deferred vblanks on IPS
 platforms
Date: Tue, 24 Feb 2026 16:26:38 -0500
Message-ID: <20260224212639.390768-5-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224212639.390768-1-sunpeng.li@amd.com>
References: <20260224212639.390768-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: 65099abb-f118-4106-8b15-08de73eb7582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QW0Z7LFbbJbIk9Z9C6mv4OpC1NiLvCvZ/9erp59+KXaJn75nejt0LLalxq9N?=
 =?us-ascii?Q?7ruavAURb2LnOQqyGW04qWzrm6uCwDVXO18YubnBSoqlO3TNQCk5Fr4PuF02?=
 =?us-ascii?Q?EfsHtwpwijrSOq4e8c+lZfRELvVg/RP2Redjhyh7vaO9cYCgQfJr7krwk5E+?=
 =?us-ascii?Q?rRl15OChIyJ27dOst4ekLITYe1L3JWZBNT4nuAfKNnym6Y3Bjb99oHwjxOaa?=
 =?us-ascii?Q?18KhvjTqokb9HCyhNwsg8Yac3/2xMoCy+jSj6WnCx9uk4y1+Urlf5bi5SgdS?=
 =?us-ascii?Q?pAgHpHZIUYCPld+7t5wZJp3rZVvrNx1EldWEeB/uYdFRPupsGgzAPwwWfH2J?=
 =?us-ascii?Q?/biT3gCwpRMosanN89MooSUbmcF2RaOiJstZe7MPNDm2v2oSxs7VABhHFZIX?=
 =?us-ascii?Q?BoJ19EToIbloSI9gT44P3SjbU7nUfmWylK1QMJFsjjVbbWLRC70Bc3xoiW1b?=
 =?us-ascii?Q?aEjnoKIlg2cEzI7nLHmRduXPvJCZS6eUrHGUsOgrgSN7PZw+5poNi42xc7Iy?=
 =?us-ascii?Q?Vr/D/vM7rRVsbrrZ+AxlydGtkFb5JwnOQBmK+m9RUuK7aiKePiu8QNGq12ZK?=
 =?us-ascii?Q?oZkosGYYwA6BBQxG95xYdMkroGwLfVkn3I0YA9oXRHARidyeEaoBYqArULIK?=
 =?us-ascii?Q?a9VO1UAIkSR1HnC/ahx/ZhxEJpYmhyMSIYn8ixuc8JeLzUfJAR9kGJETtevC?=
 =?us-ascii?Q?3u68yL9mZcW9BZ3Gyu9qz4gZRR+x2JaHaMDzFkrTnh2rKumJu5DlQj4MXyvX?=
 =?us-ascii?Q?hiItYdCP+kQl9a+QgIXYo9kCFm3Nm2l85cfYxyipPfquCpw2ZJWZ/Jq3J3kT?=
 =?us-ascii?Q?EMQlMYBr/rQX4pb0K0EmjqUdQPbKcGgtmH/3Wgi71nFaDAAGr17NyHhxQZXK?=
 =?us-ascii?Q?lG+SMGFwMM5NDaIkedLBtAqGygnRtYIZ89UgDxhRjSYfX9HpJJNek6/vaL6I?=
 =?us-ascii?Q?NNcy864YQu8B0YjoJu0N2i2VYmny8XbYQlRmHowVAWc/ewc2lrC8+c9tVLCb?=
 =?us-ascii?Q?zox9JknHwx47AyOtONBAwJMviINcvYjlO+z/w3KtYqKd+BlkaYWjn7TxVYOH?=
 =?us-ascii?Q?BRBZhoTV0Q6yu85mp2UW0T8EptVQyhW5hTlffMrRa9zIkNiAR9WvsobH97zV?=
 =?us-ascii?Q?ZTyof4k7IltaBj2NgaDTM7Qf63Lqq2IQaX082mdfCOQGeQtE/zSV6ICVcPwu?=
 =?us-ascii?Q?buV6TFcrLJoZFC37yNocIU1/axo8zG/eZT+nvb0E2lY+0rrJxgdVy1MVOlq7?=
 =?us-ascii?Q?QOhwnZ57nwTdu6Q9Y01+LbCMuxVXXmJ+TBncFzcSVN8dIfpP7vpV7Dm+6VMG?=
 =?us-ascii?Q?zBFHS3RDt+o+l4iDmtcpGm9+dspz4KMylM5kC0skdMKwfnRROUBHqjtvWTPp?=
 =?us-ascii?Q?bcV/42IPKwvdD2fDKwWhyp14DLw/f39F5zOouI3Xrov0LZ03qxp6FiiIc9lX?=
 =?us-ascii?Q?3C7aNTONJgp3RR/u071FDLIU9cTDt5jVqqfcx7XRWgj+brbF4k3rONgM3ggN?=
 =?us-ascii?Q?fb33bNwzBgy04zk/LhQCuW0twG8MYVanzkLDu3dtrBNKi2db68dRqzgDqY0r?=
 =?us-ascii?Q?wMpAIwmSF6HPPGz1rg0efxY9xO7wZdJU+JY/30GsgoemMDI/2Lh+AfJqNiiv?=
 =?us-ascii?Q?Efl4UQntmavw1MmRCL/1m4VsoDAOa4X6XrFNGQHGtbWwCxU49I8R7Ga0M8Bl?=
 =?us-ascii?Q?nkBDYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EDyRCfzohb15iN7+Mek2qfP6cRelxXR8z/ED6JXvVlW6spZNHkmCIY7LUZJPZVUofdy7peQJakQKY2yTuq87Awe9xazBPCx+iscnvCdwpiY0zZOkMqRva1Rn+3lbp4jsMN7b1Z0tIJcgT7of920YI/xq2vSHwGlkA2NdkOpiNbKtuZFATbWv5Xu7lsj2So9eJpMtIk1lKpZhNx+l+TjQlRpJDzHfsoV+rHR0Fw9Y7KgIsxoFcAkGTQiaza3OZxntWifA9JEynafas/Okb3NkS1xHFzF+A6P2ZRxnW19ALfOFeHr3kubKNroiYnDRxq+hGzUzaweN4eNa2eNnf8kQ9Ke4Dq2b2y+ggtbttn2ppKAR20Pph4dw50KFTnxShj97t48fB6e2/aN4fWmx4rHeSlZQsiVCURGdH8rzSw4A3uC/1F4f1DH+9R1UzLn+9Bzh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:27:05.8380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65099abb-f118-4106-8b15-08de73eb7582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,vblank_work.stream:url];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 50EF418CC20
X-Rspamd-Action: no action

From: Leo Li <sunpeng.li@amd.com>

[Why]

Newer generations of Display Core Next (DCN) hardware allow for the
entire DCN block to be power-gated in a feature called Idle Power States
(IPS). Once DCN is in IPS, HW register access will timeout. Therefore,
allowing/disallowing IPS requires synchronization with the rest of the
driver through the big dc_lock mutex. It happens that writing vblank
interrupt control and reading counter/scanout position registers
requires IPS disallow. Since that requires the dc_lock, it turns into a
blocking operation.

The immediately obvious (not)solution is to disable IPS. But since it
provides sizable power savings, and it's not going away for future APUs,
it's not a good option.

The other (non)solution is to get rid of the dc_lock or make it not
block. But since all hardware (HW) and Display Micro-controller (DMCU)
access is invalid when DCN is in IPS (because everything is gated), it
needs to be synchronized with all other HW/DMCU access. It happens that
the dc_lock is responsible for that. I don't think replacing it with a
spinlock is a valid solution either. Consider link training: IPS cannot
be allowed while that is happening, yet the timescale of link training
can be in the 100ms. A spinlock would spin too long here.

So let's implement the newly introduced deferred vblank enable/disable
callbacks in DRM vblank core.

[How]

Implement the deferred CRTC callbacks to request the DRM vblank core to
defer vblank enable/disable. Only implement for ASICs that have IPS
support. Otherwise, keep the non-deferred behavior.

To ensure interrupts are enabled before programming flips (otherwise the
page flip interrupt for event delivery may not fire), call
drm_crtc_vblank_wait_deferred_enable() in the commit_planes code when
getting a reference on vblanks.

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   8 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 177 +++++++++++++++++-
 2 files changed, 184 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a8e4e3ab5e402..0405466666e2f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10268,6 +10268,14 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 				&acrtc_attach->dm_irq_params.vrr_params.adjust);
 			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
 		}
+
+		/*
+		 * If vblank is being enabled in worker thread, wait for it to
+		 * enable interrupts before programming pflips, otherwise the
+		 * interrupt may not fire.
+		 */
+		drm_crtc_vblank_wait_deferred_enable(pcrtc);
+
 		mutex_lock(&dm->dc_lock);
 		update_planes_and_stream_adapter(dm->dc,
 					 acrtc_state->update_type,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 3df38f3cb7423..fd84977f55ecd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -454,6 +454,140 @@ static void amdgpu_dm_crtc_disable_vblank(struct drm_crtc *crtc)
 						 acrtc_state, false);
 }
 
+/*
+ * Deferred vblank enable/disable works differently: the drm vblank core manages
+ * the workqueue instead of amdgpu_dm, sandwiching the vblank_enable/disable()
+ * with the crtc pre/post callbacks. Therefore, they need to be sequenced
+ * differently from their non-deferred variants.
+ */
+
+static int amdgpu_dm_crtc_deferred_enable_vblank(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_display_manager *dm = &adev->dm;
+	int ret;
+
+	ret = amdgpu_dm_crtc_set_vblank(crtc, true);
+	if (!ret)
+		dm->active_vblank_irq_count++;
+
+	return ret;
+}
+
+static void amdgpu_dm_crtc_deferred_disable_vblank(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_display_manager *dm = &adev->dm;
+
+	amdgpu_dm_crtc_set_vblank(crtc, false);
+
+	if (dm->active_vblank_irq_count)
+		dm->active_vblank_irq_count--;
+}
+
+
+static void amdgpu_dm_crtc_pre_enable_vblank(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_display_manager *dm = &adev->dm;
+
+	mutex_lock(&dm->dc_lock);
+	dc_allow_idle_optimizations(dm->dc, false);
+}
+
+static void amdgpu_dm_crtc_post_enable_vblank(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_display_manager *dm = &adev->dm;
+	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
+	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc->state);
+	struct vblank_control_work vblank_work = { 0 };
+
+	/* If crtc disabled, skip panel optimizations exit */
+	if (!crtc->enabled) {
+		mutex_unlock(&dm->dc_lock);
+		return;
+	}
+
+	vblank_work.dm = dm;
+	vblank_work.acrtc = acrtc;
+	vblank_work.enable = true;
+	if (acrtc_state->stream) {
+		dc_stream_retain(acrtc_state->stream);
+		vblank_work.stream = acrtc_state->stream;
+	}
+
+	/*
+	 * Control PSR based on vblank requirements from OS
+	 *
+	 * If panel supports PSR SU, there's no need to disable PSR when OS is
+	 * submitting fast atomic commits (we infer this by whether the OS
+	 * requests vblank events). Fast atomic commits will simply trigger a
+	 * full-frame-update (FFU); a specific case of selective-update (SU)
+	 * where the SU region is the full hactive*vactive region. See
+	 * fill_dc_dirty_rects().
+	 */
+	if (vblank_work.stream && vblank_work.stream->link && vblank_work.acrtc) {
+		amdgpu_dm_crtc_set_panel_sr_feature(
+			&vblank_work, true,
+			vblank_work.acrtc->dm_irq_params.allow_sr_entry);
+	}
+
+	if (vblank_work.stream)
+		dc_stream_release(vblank_work.stream);
+
+	mutex_unlock(&dm->dc_lock);
+}
+
+static void amdgpu_dm_crtc_pre_disable_vblank(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_display_manager *dm = &adev->dm;
+
+	mutex_lock(&dm->dc_lock);
+}
+
+static void amdgpu_dm_crtc_post_disable_vblank(struct drm_crtc *crtc)
+{
+	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
+	struct amdgpu_display_manager *dm = &adev->dm;
+	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
+	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(crtc->state);
+	struct vblank_control_work vblank_work = { 0 };
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+
+	/* If a vblank_get got ahead of us (can happen when !disable_immediate),
+	 * skip panel optimizations */
+	if (atomic_read(&vblank->refcount) > 0) {
+		mutex_unlock(&dm->dc_lock);
+		return;
+	}
+
+	vblank_work.dm = dm;
+	vblank_work.acrtc = acrtc;
+	vblank_work.enable = false;
+	if (acrtc_state->stream) {
+		dc_stream_retain(acrtc_state->stream);
+		vblank_work.stream = acrtc_state->stream;
+	}
+
+	if (vblank_work.stream && vblank_work.stream->link && vblank_work.acrtc) {
+		amdgpu_dm_crtc_set_panel_sr_feature(
+			&vblank_work, false,
+			vblank_work.acrtc->dm_irq_params.allow_sr_entry);
+	}
+
+	if (vblank_work.stream)
+		dc_stream_release(vblank_work.stream);
+
+	if (dm->active_vblank_irq_count == 0) {
+		dc_post_update_surfaces_to_stream(dm->dc);
+		dc_allow_idle_optimizations(dm->dc, true);
+	}
+
+	mutex_unlock(&dm->dc_lock);
+}
+
 static void amdgpu_dm_crtc_destroy_state(struct drm_crtc *crtc,
 				  struct drm_crtc_state *state)
 {
@@ -623,6 +757,33 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 #endif
 };
 
+static const struct drm_crtc_funcs amdgpu_dm_crtc_deferred_vblank_funcs = {
+	.reset = amdgpu_dm_crtc_reset_state,
+	.destroy = amdgpu_dm_crtc_destroy,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = amdgpu_dm_crtc_duplicate_state,
+	.atomic_destroy_state = amdgpu_dm_crtc_destroy_state,
+	.set_crc_source = amdgpu_dm_crtc_set_crc_source,
+	.verify_crc_source = amdgpu_dm_crtc_verify_crc_source,
+	.get_crc_sources = amdgpu_dm_crtc_get_crc_sources,
+	.get_vblank_counter = amdgpu_get_vblank_counter_kms,
+	.enable_vblank = amdgpu_dm_crtc_deferred_enable_vblank,
+	.disable_vblank = amdgpu_dm_crtc_deferred_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+#if defined(CONFIG_DEBUG_FS)
+	.late_register = amdgpu_dm_crtc_late_register,
+#endif
+#ifdef AMD_PRIVATE_COLOR
+	.atomic_set_property = amdgpu_dm_atomic_crtc_set_property,
+	.atomic_get_property = amdgpu_dm_atomic_crtc_get_property,
+#endif
+	.pre_enable_vblank = amdgpu_dm_crtc_pre_enable_vblank,
+	.post_enable_vblank = amdgpu_dm_crtc_post_enable_vblank,
+	.pre_disable_vblank = amdgpu_dm_crtc_pre_disable_vblank,
+	.post_disable_vblank = amdgpu_dm_crtc_post_disable_vblank,
+};
+
 static void amdgpu_dm_crtc_helper_disable(struct drm_crtc *crtc)
 {
 }
@@ -755,6 +916,7 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 			       struct drm_plane *plane,
 			       uint32_t crtc_index)
 {
+	const struct drm_crtc_funcs *crtc_funcs;
 	struct amdgpu_crtc *acrtc = NULL;
 	struct drm_plane *cursor_plane;
 	bool has_degamma;
@@ -771,12 +933,25 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 	if (!acrtc)
 		goto fail;
 
+	/*
+	 * Only enable deferred vblank enable/disable for ASICs with IPS
+	 * support
+	 */
+	if (dm->dc->caps.ips_support) {
+		crtc_funcs = &amdgpu_dm_crtc_deferred_vblank_funcs;
+		drm_dbg_driver(dm->ddev,
+			       "Initializing CRTC %d with deferred vBlank enable/disable\n",
+			       crtc_index);
+	} else {
+		crtc_funcs = &amdgpu_dm_crtc_funcs;
+	}
+
 	res = drm_crtc_init_with_planes(
 			dm->ddev,
 			&acrtc->base,
 			plane,
 			cursor_plane,
-			&amdgpu_dm_crtc_funcs, NULL);
+			crtc_funcs, NULL);
 
 	if (res)
 		goto fail;
-- 
2.52.0

