Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JTINrMXnmmcTQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843D18CBDD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 22:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F2710E61F;
	Tue, 24 Feb 2026 21:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5NcMEJCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6538F10E335;
 Tue, 24 Feb 2026 21:27:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u54HVFMWUba8lCrsoyJz9kDNU8Do1WZmYbsdW156eikM36o+bKk8OGlId51W5udZ+oanz0e3xdig/l2r/qZg0uMVaz3HK9hO4Obca+wT0wrFLt1TD7XWrUPMVZ7ZknF0oOu7MC0BCvoDkd1ZWtzBgbiDCZQHpAwGvCqXvK5XZGfdqi9geQ1uPUBmuVrqnlZNrMwI/5Ov8Gk4kp/gZ/OuA+YZJ/XjhiCOy/2VILIqSiqmeVRkZaTiuZGqGQlbsZFsmFH/lbp+bgmdFrdqPzXLmRxmsydRkAai6+Rk72dwUyGkeoW6fjJwdPm6IB4te8dWHKiq7KJy9BkfQyO1JF5Mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKgkgtrAI2WjD3UBe9MBT+3J6NWiagt5F9moTsaq8lI=;
 b=JIgHZZ0epnevh3wJLY39Qoa2KhzmTCnar80Kcw8AhTUbXGaVR9EZhBRsE6G2QkLBfIHxnrQGxN5bvyV4fBNVow7/23lS/NVgToQ5LSvWDykzx8eh7tzrxegSVufZVQ5IMnhNsFVNnQEMCJeha+OtP2G5CySE51FUMLfzWkracAg2E3Bio7EjxHgNcUnB0HBu5SEJETcXnu1i086rtX8Elkvt+RSRiMt9JCCfAiXN4ErrXzAHq29uqW3mwXRtIc+5dOBtgc92mjG8tKDVBA5xVS1mwbrQLreTnfnDJAI5GcMWfPSeRsqwMjQEFcyLdpfVis+yedxGN3BoHCztfmzULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKgkgtrAI2WjD3UBe9MBT+3J6NWiagt5F9moTsaq8lI=;
 b=5NcMEJCtjoYFFSRTMUvKtzbMT7kwrpqHgOQCX+2lvn8qI8/OnTOG/ZY/LQqf5+qrofqHN+rXrAVJw0nz43NaRbeK3V8Lv13KYvKhKmiN2W2IHklDHRgUxuglHjuMfu/SvXMGSoeqmJmf4cDqdU/l16Yj3Fy3ILZYOxgfYSoVTu0=
Received: from SN1PR12CA0043.namprd12.prod.outlook.com (2603:10b6:802:20::14)
 by IA0PR12MB7721.namprd12.prod.outlook.com (2603:10b6:208:433::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 21:27:04 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:802:20:cafe::38) by SN1PR12CA0043.outlook.office365.com
 (2603:10b6:802:20::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
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
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 21:27:04 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 15:26:58 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 15:26:58 -0600
Received: from thonkpad (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Tue, 24 Feb 2026 15:26:57 -0600
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <superm1@kernel.org>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH 1/5] drm/vblank: Add drm_crtc_vblank_is_off() helper
Date: Tue, 24 Feb 2026 16:26:35 -0500
Message-ID: <20260224212639.390768-2-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224212639.390768-1-sunpeng.li@amd.com>
References: <20260224212639.390768-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|IA0PR12MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: b69783fc-62ed-480a-1aa7-08de73eb749c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hSc4oZMii/18Ihk0CPobh9YQDC6OFJEyCRDy/L4aiKPy5srIClh/TZmQd10N?=
 =?us-ascii?Q?QrwrpYSQm/bJok1EwxNBrGUG8nBQd1Vt7EqqFV1C1jFAVxnO/9bFUyOq5EaU?=
 =?us-ascii?Q?ye53tBz2N1Y+c93d+1NBM3W1aPB8XtZlnpAr/PEsb4bdM+SlBnFO6OroA60B?=
 =?us-ascii?Q?Xp/Yilb7rpTtoxu7oypxvDcdJmLkWuJi8rXCkayC5kGPu/e5XbZKc5O4NtKn?=
 =?us-ascii?Q?lCkkjBpwQ2SjsOR9wpq2TGz3NIIzQ3X2VTtclDWHGtSNGLkPLaqGIbDXyE3q?=
 =?us-ascii?Q?GgYMDByp6g8TVkvM3RpTGTBMIs+3VqP6oRbpBlXiS2Ybx+qmH7R7FobDVziA?=
 =?us-ascii?Q?D0+UaFwAgX++ix11tjXeVwdmCNQ+5B+zRB9gtvTy5CA1hS0S7FUbBAdFU3ZO?=
 =?us-ascii?Q?4hzSJ8fyPt48janbSVIoKM1sObqJ3NtaLlwCGgbUH3VpDrol7kr05uG92Y2W?=
 =?us-ascii?Q?XqFIyx0eOzK4GFhTKjyiFgsTANTfOJRGjiU/j8tJecUYiLo06zm3D4K7rGjL?=
 =?us-ascii?Q?J7dk/WBZgLLKjurMpd5yaY10pntNWerqtwjk2BNqNkFN0BwVVT4dG8MMfSpK?=
 =?us-ascii?Q?8B/AHcPq4hbncrvtyKLBnUzdAJfG1eBtXthW+ueirhW8TwSWabxGGNrLvUy6?=
 =?us-ascii?Q?L9sZU97umDqxIPs6E6gX011KoA2KrTfTSWCnQ+rbDguyA+yg5eqBa8jtHGe/?=
 =?us-ascii?Q?piXuO/kZemIhRDl1S3X8FR2Yf/8cBQVIgTekTAfgU+ICe0bMMLYI7XHSB9YR?=
 =?us-ascii?Q?l4lvedbHdf4jXy7FyFZMVTGmwlx3zc5Wey08MLZTNsXwWvbd4MhQZKHP/UVz?=
 =?us-ascii?Q?1QSdQ3z4uL88ZG42hISosq1muMn5K04UN/pjZaRSt3OxIkABiZnstRIIVik/?=
 =?us-ascii?Q?2mAF2sHdUR7H/xAbJLA1lQTPN55PkFBaBD3uR7Mlq5LLj523uGNY55vrk56w?=
 =?us-ascii?Q?A9w050YsYIDkj9+Q6nnIzx8xVx0XOT75TvkXRK9if2GaRh2Y/dyDCsBkf+Jw?=
 =?us-ascii?Q?CfvdSg9Ducg5I3maZjxeEpjMWd2Rs2zKWqIF/CiKIF9VJs0P1H+6rT7Sx+Q3?=
 =?us-ascii?Q?ZG5zwPWAf3ROUgxEjFbAUtELM5uOXcTifi10E83t3eZ8CsdsD/5iS6TIj7NO?=
 =?us-ascii?Q?yvdZ6iWTbRDiKNZzPrtRHtx+rwrRyJr2sFX0P25gWgXvHxW/gBndp1o/Nhb9?=
 =?us-ascii?Q?R3BBRZ9BVgr4UeWRU4RNOmkiJ+/J8N1qmqBjFsssMfnAZrw+FD1+RkP6D+eO?=
 =?us-ascii?Q?DLLowrR9kRWL/XqKcSSGJ+WtDelFHSE+DkqlnjJZ8zo6f2F3Kv14uLFfKCOn?=
 =?us-ascii?Q?/WEzALiCZ1IbRG/wRNM6ft8UYGB6+cZQ0CUkNJIvKJljKTVHdGB5LS/9vwAE?=
 =?us-ascii?Q?20f40lcm+uTUctaDsMnqBPmQJYtoSTBMVQK7lBHkoqQJNhi/6x93mXIUC96u?=
 =?us-ascii?Q?7F//kKSgmM5GQyMCKsngLT+5jZkUiHPNpK0PumbCAckIvRCLb0dGPl3Vvvt8?=
 =?us-ascii?Q?+bcbGppVJi200v0LS1GkPiZlYyiG/UxJWVc+SbBaSk/EWaSAi3aIyZiWw4Jh?=
 =?us-ascii?Q?fsALKOevpDYKi05PqZSoieZWT/kdEda/oSNmRWGnz6vTu0Ct+FS4gRppOfge?=
 =?us-ascii?Q?wOeL++A/hOvIxJ/UTgweagr32rBCQixqGgMw9YGU84kUgWpIOyf4TJN9F4ji?=
 =?us-ascii?Q?2CtyNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: C8joD4q0OQaaY8Uoq2Iv5LhsoM2L9iicLYNltuzliWERvZTftoT6DWrT+8rq8Sh2cIr7vMgnO2QitjRODuZZBJNmBfLUtw3chkcMHvo3zV330wAfeMVS5E0gT2k9qfPM+XdHmniRS76qMSDLQl7TQsCaUXJ5JA7xeZKhMqFORM+d6vN3pOrql/AC8hQzlJJdsd/TBhu7qlfDSqfoIefviuqHNE6An4WjU8UI0VDU8nWJQU9Sf1jXcRIwpMs07xodBd73AwBp5/7VejgY0MBsq0T17WfdmATDtTgR2zrefHSLEA/nBcwXsBItwEXPVlVW24Uwi877C/3Id7uf8wos2UuxQOEfXvL9rRPofxcsHBsRvq2RbtStXoWOohHxQaaKsIih6R/pxSyvi4NAF75jX4mkt+kULl5mXCCFt9X476R6yTy40W8CuBTU/5xAzp1K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:27:04.3492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b69783fc-62ed-480a-1aa7-08de73eb749c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7721
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8843D18CBDD
X-Rspamd-Action: no action

From: Leo Li <sunpeng.li@amd.com>

Add and use an drm internal helper to check if vblanks have been turned
off (via drm_crtc_vblank_off()) for a CRTC, rather than relying on the
return value of drm_crtc_vblank_get().

This is in preparation of introducing deferred vblank enable/disable, as
vblank_get() will not return the expected error code when the driver
defers vblank enable.

No functional change is intended.

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 11 +++++------
 drivers/gpu/drm/drm_internal.h      |  1 +
 drivers/gpu/drm/drm_vblank.c        | 17 +++++++++++++++++
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 26953ed6b53e8..102937e3ff35b 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -48,6 +48,7 @@
 
 #include "drm_crtc_helper_internal.h"
 #include "drm_crtc_internal.h"
+#include "drm_internal.h"
 
 /**
  * DOC: overview
@@ -1259,7 +1260,7 @@ drm_atomic_helper_commit_crtc_disable(struct drm_device *dev, struct drm_atomic_
 
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
-		int ret;
+		bool vblank_off;
 
 		/* Shut down everything that needs a full modeset. */
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
@@ -1287,19 +1288,17 @@ drm_atomic_helper_commit_crtc_disable(struct drm_device *dev, struct drm_atomic_
 		if (!drm_dev_has_vblank(dev))
 			continue;
 
-		ret = drm_crtc_vblank_get(crtc);
+		vblank_off = drm_crtc_vblank_is_off(crtc);
 		/*
 		 * Self-refresh is not a true "disable"; ensure vblank remains
 		 * enabled.
 		 */
 		if (new_crtc_state->self_refresh_active)
-			WARN_ONCE(ret != 0,
+			WARN_ONCE(vblank_off,
 				  "driver disabled vblank in self-refresh\n");
 		else
-			WARN_ONCE(ret != -EINVAL,
+			WARN_ONCE(!vblank_off,
 				  "driver forgot to call drm_crtc_vblank_off()\n");
-		if (ret == 0)
-			drm_crtc_vblank_put(crtc);
 	}
 }
 EXPORT_SYMBOL(drm_atomic_helper_commit_crtc_disable);
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index f893b1e3a596e..7d10515fe2ed5 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -131,6 +131,7 @@ static inline void drm_vblank_destroy_worker(struct drm_vblank_crtc *vblank)
 int drm_vblank_worker_init(struct drm_vblank_crtc *vblank);
 void drm_vblank_cancel_pending_works(struct drm_vblank_crtc *vblank);
 void drm_handle_vblank_works(struct drm_vblank_crtc *vblank);
+bool drm_crtc_vblank_is_off(struct drm_crtc *crtc);
 
 /* IOCTLS */
 int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index f78bf37f1e0a7..983c131b23694 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -2318,3 +2318,20 @@ void drm_crtc_vblank_get_vblank_timeout(struct drm_crtc *crtc, ktime_t *vblank_t
 	*vblank_time = ktime_sub(*vblank_time, vtimer->interval);
 }
 EXPORT_SYMBOL(drm_crtc_vblank_get_vblank_timeout);
+
+/**
+ * drm_crtc_vblank_is_off - check if vblank is off on a CRTC
+ * @crtc: CRTC in question
+ *
+ * Return true if vblanks is currently turned off via drm_crtc_vblank_off().
+ * Return False otherwise.
+ */
+bool drm_crtc_vblank_is_off(struct drm_crtc *crtc)
+{
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
+
+	/* Spinlock adds the necessary barriers */
+	guard(spinlock_irqsave)(&crtc->dev->vbl_lock);
+	return vblank->inmodeset && !vblank->enabled;
+}
+EXPORT_SYMBOL(drm_crtc_vblank_is_off);
-- 
2.52.0

