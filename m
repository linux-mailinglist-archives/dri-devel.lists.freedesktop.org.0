Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEF892AA93
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 22:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5405C10E408;
	Mon,  8 Jul 2024 20:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1RFt6xzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE2410E3FC;
 Mon,  8 Jul 2024 20:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPg97p5hSYvkydgm9am2+M3mqpA9D9Bi+TR9u6/CykYSonAJh3KJ4SsOo4vikHDG4KFOTJltUeCrLPHfIr8pXf8hBTghiYuIGLAsssNAbTD5IveL2L8/wMo3a+1ln1lAd0Lh8Q2H4r8TcVAvojG1+dcTkL4F0YtbSDG0hu83BshlbtWvMv3NtRhHFkF3/1zt4Ux1Pa3OWAmIGlzkBi2vvF0eJBaEtE0myWhB4TK70ZeSrgU61kNk9WNKoKzKdxcA4FOEBh1zfqO8bGi9gU1qmPRDRZ95LUlystvmWCmZv6/C1U/RyXVmel9tgkmnbfQO9Qkq7gxFgaa2ezLekUZu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOn7OGUFtmR3yQYfZeCPz87TVtKGjgQWgsqjmz6YvK4=;
 b=EAlCPGnKeinDy3ld64ADTzY4xu77CsHMpSlwEpMV2pUiM3h8cbfyfaWZqB+hPXvHXY9NW06wYfNi5KUiabQuDCm9TB9422WdFioOVyOWOFL4OPnz3fNnjcUu2lgqtXZdYlVk0F9VnYUyM5BzxbJCnDZyk3HaOtQ13A5DoUthNVC70Efv548E/oWLvgSFf7q1U/SyGdUZqzOOfED60/vQ3e0Hz6HRxNAAe4SPYpbXNPgEYymQl47/amofvVfefiQE699SHodulfuM2NwS0LRygQMavobJ25g29B5HN/a+qeecHQflvZcJkfjShprvvFkpb7tbeA4noIxFzM3H5QeWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOn7OGUFtmR3yQYfZeCPz87TVtKGjgQWgsqjmz6YvK4=;
 b=1RFt6xzX2FQBV0CCcF9QuwPZdR5FqWl4JIyYln6NKM8vNlP22U6mwIXlUR91RHbHujIh2zGuqaQX+kbXa2Kwt9e+0v1XY//SWFPZju29mA6YR8JyrlznJw0IK+ODwvTG7e85upgPsidk+4dR5PXIPgh4+TepPy2qx/pxraF1aoY=
Received: from BN0PR04CA0040.namprd04.prod.outlook.com (2603:10b6:408:e8::15)
 by CH3PR12MB8657.namprd12.prod.outlook.com (2603:10b6:610:172::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 20:29:35 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::c1) by BN0PR04CA0040.outlook.office365.com
 (2603:10b6:408:e8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 20:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 20:29:34 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 15:29:32 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Maxime Ripard <mripard@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, Alex Hung <alex.hung@amd.com>, Wayne Lin
 <wayne.lin@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 <amd-gfx@lists.freedesktop.org>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: [PATCH 1/2] drm/vblank: allow dynamic per-crtc vblank off delay
Date: Mon, 8 Jul 2024 16:29:06 -0400
Message-ID: <20240708202907.383917-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|CH3PR12MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a77c423-fd92-4514-a183-08dc9f8cae64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+WXuojlIl3VM5J61XCNjNp3fvvJgKT8+zkwH0J2ps1UM8T0c+TI/9stPNAS6?=
 =?us-ascii?Q?EUdWfk4CwDARPKv7UL/jF6sJfKAoTCL5u9CfIFuxkwRtIBfajkKW66zIWSyj?=
 =?us-ascii?Q?jBRCntx+r+8bQk2CVMJ/qhZF0dbSqAi/DUSSGzgeFrMhu4O6ulnXHbmWKM8h?=
 =?us-ascii?Q?zslLQuYgDdWzXDYsXdODZZ64gC+AuKeEG9SN55Yv6boW3uJQ0XIxCJDVtjri?=
 =?us-ascii?Q?dcTz0xVvH4xiXANTY9IM9Xn5KLGtWd2V0zT0CFESeL688ajzvkBioSkE3Fi+?=
 =?us-ascii?Q?ZIKaK6jsIxkoKRNDfkCnSVPfckzenA/iLThVdclEvhqBP7XJ3baYJk1xVPZS?=
 =?us-ascii?Q?mYvgVIv5YQ1qyOpwSuO4recbFFgT67vxBbMnfaWg05YkCfBg+LHqac+mzofb?=
 =?us-ascii?Q?YY3qpU/U+sS3m0RLoddTzdm8LVXWdgiUoKCNBY9i/grZkns9kehg1qus3zqS?=
 =?us-ascii?Q?lFFGToTOr5hNQ6HsHzXGAQZukZtUbJsevLqkWULnr05oadRO1z8uf+tB6urZ?=
 =?us-ascii?Q?xHwMCBCd+6AWMVzJdlvjURW42Wyquch9BgR4dMvuvz9axzCHxksewYLPwm9x?=
 =?us-ascii?Q?1YD/e1WH/NNa6sRA6QTh/y1MA1aITIFH15SibV39PbAENbLtxQNuH51JXr3K?=
 =?us-ascii?Q?m0w4sXjSukTLjwqJ6VvonQeOY9mJcQnlthprLFUp9ojdVL6G0qS/d+wh/E06?=
 =?us-ascii?Q?5z5qxs2O2mC6Sydga6IDyx2qR1fpdvkjo7uWk/vRsZ7JFV7S4Cg1hzU8ODdl?=
 =?us-ascii?Q?II9ktmityN/FWrPWe9yueaI+a3AEBaLtqIsQAw/8DBRfny0505bTTmlqGKqu?=
 =?us-ascii?Q?Gls5ou41GkLL8IMW7tGtvGN3br+pKSKnlqYCOqkwDfOOv5Q0i5/VwsfTgAmH?=
 =?us-ascii?Q?iAT2geVDRLoCPZD5DhVPljkqr+B2tesgHj8S7eWjE8OJFvGdizGG5exIiolj?=
 =?us-ascii?Q?Fc6EwCj68mA3Snj/y8hhsnU6QAqjA7dwGvHuAAIqKor8i/AeuXbuE3I+2zfo?=
 =?us-ascii?Q?plcbY9hjYiNhmxzdHouKc7MKsXo3Ny/VwXvHB2SWb6d9K7sF2ye27FixpZ2u?=
 =?us-ascii?Q?pLBnVCpM/3QkEhfSThgrReioAhJXEzQ4mBvHgXNZxkfpg+Al7ythesK4g08k?=
 =?us-ascii?Q?22x4gsMukP3dDzK0gWsPOvUVaP8b41nwpbajxHM5NNDOmeUh+aqwIXR1Nm4/?=
 =?us-ascii?Q?1j51tLEihIfGX9VAtvcXq+Jl2XrsB90R2F3zI/dPU2eDOZIe9jVVkTV5JFkQ?=
 =?us-ascii?Q?y9k7yjLdircPx45+wbapXWu4LxFUec1MIVZ8kb31hiYTOZtebQeQpqDPu+vl?=
 =?us-ascii?Q?hA+ePkPeuj7635wljicHT7P3nfhHrYGQQwnXZ4qpI3OOSLamfIT/VjINdS8I?=
 =?us-ascii?Q?4tWKLIKUSTahQO3OL4L10XqcvTSTAr2teyntc/9tFriXiWNlczxG4/vOLLFf?=
 =?us-ascii?Q?1jW4GktxCQqzuxFticcXioMDFjMn/HNy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 20:29:34.7961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a77c423-fd92-4514-a183-08dc9f8cae64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8657
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

We would like to be able to adjust the vblank off delay dynamically for
a given CRTC. Since, it will allow drivers to apply static screen
optimizations more quickly and consequently allow users to benefit more
so from the power savings afforded by the aforementioned optimizations.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/drm_vblank.c | 31 ++++++++++++++++++++++++++-----
 include/drm/drm_vblank.h     |  7 +++++++
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 702a12bc93bd..4f475131a092 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -529,6 +529,7 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
 
 		vblank->dev = dev;
 		vblank->pipe = i;
+		vblank->offdelay_ms = drm_vblank_offdelay;
 		init_waitqueue_head(&vblank->queue);
 		timer_setup(&vblank->disable_timer, vblank_disable_fn, 0);
 		seqlock_init(&vblank->seqlock);
@@ -1229,6 +1230,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_get);
 void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	int vblank_offdelay = vblank->offdelay_ms;
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
@@ -1238,13 +1240,13 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 
 	/* Last user schedules interrupt disable */
 	if (atomic_dec_and_test(&vblank->refcount)) {
-		if (drm_vblank_offdelay == 0)
+		if (!vblank_offdelay)
 			return;
-		else if (drm_vblank_offdelay < 0)
+		else if (vblank_offdelay < 0)
 			vblank_disable_fn(&vblank->disable_timer);
 		else if (!dev->vblank_disable_immediate)
 			mod_timer(&vblank->disable_timer,
-				  jiffies + ((drm_vblank_offdelay * HZ)/1000));
+				  jiffies + ((vblank_offdelay * HZ) / 1000));
 	}
 }
 
@@ -1455,6 +1457,25 @@ void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_set_max_vblank_count);
 
+/**
+ * drm_crtc_set_vblank_offdelay - configure the vblank off delay value
+ * @crtc: CRTC in question
+ * @offdelay: off delay value
+ *
+ * If used, must be called before drm_vblank_on().
+ */
+void drm_crtc_set_vblank_offdelay(struct drm_crtc *crtc, int offdelay)
+{
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+
+	drm_WARN_ON(dev, dev->vblank_disable_immediate);
+
+	vblank->offdelay_ms = offdelay;
+}
+EXPORT_SYMBOL(drm_crtc_set_vblank_offdelay);
+
 /**
  * drm_crtc_vblank_on - enable vblank events on a CRTC
  * @crtc: CRTC in question
@@ -1490,7 +1511,7 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 	 * re-enable interrupts if there are users left, or the
 	 * user wishes vblank interrupts to be enabled all the time.
 	 */
-	if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
+	if (atomic_read(&vblank->refcount) != 0 || !vblank->offdelay_ms)
 		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
 	spin_unlock_irq(&dev->vbl_lock);
 }
@@ -1909,7 +1930,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	 * drm_handle_vblank_events) so that the timestamp is always accurate.
 	 */
 	disable_irq = (dev->vblank_disable_immediate &&
-		       drm_vblank_offdelay > 0 &&
+		       vblank->offdelay_ms > 0 &&
 		       !atomic_read(&vblank->refcount));
 
 	drm_handle_vblank_events(dev, pipe);
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 7f3957943dd1..f92f28b816af 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -187,6 +187,12 @@ struct drm_vblank_crtc {
 	 */
 	int linedur_ns;
 
+	/**
+	 * @offdelay_ms: Vblank off delay in ms, used to determine how long
+	 * @disable_timer waits before disabling.
+	 */
+	int offdelay_ms;
+
 	/**
 	 * @hwmode:
 	 *
@@ -255,6 +261,7 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc);
 void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
 				   u32 max_vblank_count);
+void drm_crtc_set_vblank_offdelay(struct drm_crtc *crtc, int offdelay);
 
 /*
  * Helpers for struct drm_crtc_funcs
-- 
2.45.1

