Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB8193C9E2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 22:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B87F10E1D1;
	Thu, 25 Jul 2024 20:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a8BQSFiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502D410E1D1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 20:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhtcd8yWWCHKOY+DhzpAx1LB8NB08ZJgZdWHVn1QosHN6wQWv7cjt7bBSSRqEbXegZkqG14uDpIrUfNL7rTeCCLUmkBhd6YUiGkr1AYS+uine0TunLEBkgki/DQK7nGe64XupJGT/jLBwrhdrMO5/78nM621TobDSh53zwiZceU4GodHXxrWPoQfPNw1k2buIUe9BT7xUsZiRGDFDxMBvjka/KTw5YAntxzJdEe556Rqr9+MkKIwRRsMhmnvFqS+y2h9qFhl8aPrWGEhGOdT0Cjb3Hsnc9P3fNLGrm9nR2h0LeBSHx2oZvWSxms9kzZ3vGpDAI48K6WxCLt2mpBrtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPecyj4eYjATZFI96bmg3+15NHkJdhBCm5Sm/z/4k1o=;
 b=Q+/luu/J88YMGwr0HhCvM3Is+HK+0qhTAlkZPIZL0TUFLMrdsBj6sPsCuJtIjXc+1QgIXjQkxL92pEG87fVLWG/a6NfsmKtCZQ0ZIdyNClCylQDGMDSp5p5CLdKzTJY+ZYPLYhBoFgVuQXIrrbzCgha4txg10LpDM11Vh2sri0NXM3WOYxamssdkED1uwutKEfNR1Ea2LgA2aIMXg7uXRd09C73ovVGwSo1eqFT7OspzGvixfqajh6299q4fQO1bPg470BfhqBhAznIOkbqqBWmMFJDdFdumRTEbwgwKBzI8HqT1fHLcQKMAokHVpdo3MmpdWYtZ61qmQlGqXYCUPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPecyj4eYjATZFI96bmg3+15NHkJdhBCm5Sm/z/4k1o=;
 b=a8BQSFiSVgk2E6dy3Bho2skGqV8FRNsaYkGN+TanaGuxiPCEXc+UsM/WU1kiF7qM+6USv6JjpvHyLsJYtIYJiEZsFgXw000ocBvfxKhkT4/82g9gPTw4FQFhCP4L1nwmMEfbxuJEGRMIFQhIg1JTs1kYN5LucfyWri9hSLQ25bQ=
Received: from SA1P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::35)
 by CY8PR12MB7123.namprd12.prod.outlook.com (2603:10b6:930:60::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 25 Jul
 2024 20:51:22 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::61) by SA1P222CA0008.outlook.office365.com
 (2603:10b6:806:22c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Thu, 25 Jul 2024 20:51:22 +0000
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
 2024 15:51:20 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Wayne Lin <wayne.lin@amd.com>, Rodrigo Siqueira
 <rodrigo.siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>
Subject: [PATCH 1/2] drm/vblank: add dynamic per-crtc vblank configuration
 support
Date: Thu, 25 Jul 2024 16:51:08 -0400
Message-ID: <20240725205109.209743-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|CY8PR12MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a18b50-5d3c-40f5-df46-08dcaceb8aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MJqIsu1qrT1xHzDp2wMvIA8bhJkS3JYkP4LIrgk5IyZCOZbUEBOJLIz7x5jQ?=
 =?us-ascii?Q?nobN2QHSO+OjduG1TM55aoYN1OCxEa4GUJdXb/lpCC/rV69jVefeW+uQfb4E?=
 =?us-ascii?Q?TXQZVmDkwm/yE5MVz0uBwJMX+ZGda1giEcMMUbNCpjO83Zxml94JZtNVLueO?=
 =?us-ascii?Q?XElIenji9EwxTKWl863Mn64TbWCcmwHcIpPNwKRVVmZc6us+hSD09ZXgfxpq?=
 =?us-ascii?Q?aabIex2cPGWSbkxZSAFFEC5AHfQuesrhweUDCC+lpjF9+ZJvuDIdX6KoWuee?=
 =?us-ascii?Q?AXDDeIMU1yx67Rpxb563iWHdjS56+OvprgnAMJePT9G9TkSJ1NuublJ/gGqP?=
 =?us-ascii?Q?UVqDIV4JoQXNvOj9EMj+7i/agaNLx4LJLTZqTGaJvFwq+CVqvV2EaMN2+k+Z?=
 =?us-ascii?Q?F0Kq9vV0M2ZU6Qf+XCNyqu/4jpAxJj8U5IFffj1U9SenaVhkgUTPsJ1MDsDK?=
 =?us-ascii?Q?fRsS41havrod9TsrqYmZsx4n+ZE9nVUDuc+COrJzEtN02n4hbZz5QYb/Sj9Q?=
 =?us-ascii?Q?HfCAQi+YPqPpcJgAGiNe87LC6zWD2j3OdyiR0mgfJqEST1JM74tsuj8w/YJq?=
 =?us-ascii?Q?/Ok2wrn5DAZFHMukjvLWqZ/1ai9EJKWmS4WGGklhie9VxfvqjPadEpsXdTVZ?=
 =?us-ascii?Q?XfWvDbf50bXYszglU5U9bI+2ARVe9Np6epJy6oC5UwYbXtZFxQLaN7u62zzQ?=
 =?us-ascii?Q?yTGbqjioW5WNGDYmh11wAl+U5+ZbhvlO027zKIMPsS6OC+Y5Qm13mlG0IppE?=
 =?us-ascii?Q?PQMmhQCYllhfK0P2P6fbXSJdDXw9acQrPq4y+lzGcCQlNRkqE2Y4WZfVc1rA?=
 =?us-ascii?Q?80PRsazB+U9JX9OewR2XKk0SeIr4XyOaa7emai8r5j+dNvAdsyPF8x2j+LrN?=
 =?us-ascii?Q?DGoVkItesSnPwG9AxPd23fsigAXqFM9BSB4lll0xcJoBscwSC2LJM11zQpC3?=
 =?us-ascii?Q?222LcAKeV1Fa/30g603BuM3CAnEZ3TsUjdmlF84zRlMHokwfHNOVJUIW/dRZ?=
 =?us-ascii?Q?7z6YYiUCduN/zS9tH0OSaakYsodc42MIVdiVV2fWFx8R5XZFt8mqEqelhcnX?=
 =?us-ascii?Q?kuhz82OUWzCaCFuAJAWYwDAE8O95KV0QujPdn00fZJmdBXMrgl+4xgUw8Awd?=
 =?us-ascii?Q?hh7TyZE5372UnZD7NVTDmIVF/9uNm1YHA3rABsza4mj/8+EHjNCGLCA1li1G?=
 =?us-ascii?Q?WfnB3uX/gIcf/oKCFRohHU1iMYo5kxH5OZb1sSGnKILhevgIx9SA7x3lFQji?=
 =?us-ascii?Q?cdjFBJymCDqvDeD/e4L/TUZ2lmQwGVtS9vhjIZ9L2gpyFUSz2T8TLcSgJlko?=
 =?us-ascii?Q?0ol+6FgvfYf4uoxcfKJMy2n3SXuXDG1NeLeowRCttDltavbtm/k08s7X38ej?=
 =?us-ascii?Q?fY31gEGBpIOsnGh/VaSAtFbsIwJSsgaKWVzh6uBDY5/n8D3lFWGLsQoMpG4+?=
 =?us-ascii?Q?uCtSTdp5yRo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 20:51:22.2435 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a18b50-5d3c-40f5-df46-08dcaceb8aaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7123
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

We would like to be able to enable vblank_disable_immediate
unconditionally, however there are a handful of cases where a small off
delay is necessary (e.g. with PSR enabled). So, we would like to be able
to adjust the vblank off delay and disable imminent values dynamically
for a given CRTC. Since, it will allow drivers to apply static screen
optimizations more quickly and consequently allow users to benefit more
so from the power savings afforded by the aforementioned optimizations,
while avoiding issues in cases where an off delay is still warranted.
In particular, the PSR case requires a small off delay of 2 frames,
otherwise display firmware isn't able to keep up with all of the
requests made to amdgpu. So, introduce drm_crtc_vblank_on_config() which
is like drm_crtc_vblank_on(), but it allows drivers to specify the
vblank CRTC configuration before enabling vblanking support for a given
CRTC.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/drm_vblank.c | 57 ++++++++++++++++++++++++++----------
 include/drm/drm_vblank.h     | 25 ++++++++++++++++
 2 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index cc3571e25a9a..c9de7d18389a 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1241,6 +1241,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_get);
 void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
+	int vblank_offdelay = vblank->config.offdelay_ms;
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
@@ -1250,13 +1251,13 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
 
 	/* Last user schedules interrupt disable */
 	if (atomic_dec_and_test(&vblank->refcount)) {
-		if (drm_vblank_offdelay == 0)
+		if (!vblank_offdelay)
 			return;
-		else if (drm_vblank_offdelay < 0)
+		else if (vblank_offdelay < 0)
 			vblank_disable_fn(&vblank->disable_timer);
-		else if (!dev->vblank_disable_immediate)
+		else if (!vblank->config.disable_immediate)
 			mod_timer(&vblank->disable_timer,
-				  jiffies + ((drm_vblank_offdelay * HZ)/1000));
+				  jiffies + ((vblank_offdelay * HZ) / 1000));
 	}
 }
 
@@ -1466,16 +1467,16 @@ void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
 EXPORT_SYMBOL(drm_crtc_set_max_vblank_count);
 
 /**
- * drm_crtc_vblank_on - enable vblank events on a CRTC
+ * drm_crtc_vblank_on_config - enable vblank events on a CRTC with custom
+ *     configuration options
  * @crtc: CRTC in question
+ * @config: Vblank configuration value
  *
- * This functions restores the vblank interrupt state captured with
- * drm_crtc_vblank_off() again and is generally called when enabling @crtc. Note
- * that calls to drm_crtc_vblank_on() and drm_crtc_vblank_off() can be
- * unbalanced and so can also be unconditionally called in driver load code to
- * reflect the current hardware state of the crtc.
+ * See drm_crtc_vblank_on(). In addition, this function allows you to provide a
+ * custom vblank configuration for a given CRTC.
  */
-void drm_crtc_vblank_on(struct drm_crtc *crtc)
+void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
+			       const struct drm_vblank_crtc_config *config)
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = drm_crtc_index(crtc);
@@ -1488,6 +1489,8 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
 		    pipe, vblank->enabled, vblank->inmodeset);
 
+	vblank->config = *config;
+
 	/* Drop our private "prevent drm_vblank_get" refcount */
 	if (vblank->inmodeset) {
 		atomic_dec(&vblank->refcount);
@@ -1500,10 +1503,31 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 	 * re-enable interrupts if there are users left, or the
 	 * user wishes vblank interrupts to be enabled all the time.
 	 */
-	if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
+	if (atomic_read(&vblank->refcount) != 0 || !vblank->config.offdelay_ms)
 		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
 	spin_unlock_irq(&dev->vbl_lock);
 }
+EXPORT_SYMBOL(drm_crtc_vblank_on_config);
+
+/**
+ * drm_crtc_vblank_on - enable vblank events on a CRTC
+ * @crtc: CRTC in question
+ *
+ * This functions restores the vblank interrupt state captured with
+ * drm_crtc_vblank_off() again and is generally called when enabling @crtc. Note
+ * that calls to drm_crtc_vblank_on() and drm_crtc_vblank_off() can be
+ * unbalanced and so can also be unconditionally called in driver load code to
+ * reflect the current hardware state of the crtc.
+ */
+void drm_crtc_vblank_on(struct drm_crtc *crtc)
+{
+	const struct drm_vblank_crtc_config config = {
+		.offdelay_ms = drm_vblank_offdelay,
+		.disable_immediate = crtc->dev->vblank_disable_immediate
+	};
+
+	drm_crtc_vblank_on_config(crtc, &config);
+}
 EXPORT_SYMBOL(drm_crtc_vblank_on);
 
 static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
@@ -1754,7 +1778,7 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	/* If the counter is currently enabled and accurate, short-circuit
 	 * queries to return the cached timestamp of the last vblank.
 	 */
-	if (dev->vblank_disable_immediate &&
+	if (vblank->config.disable_immediate &&
 	    drm_wait_vblank_is_query(vblwait) &&
 	    READ_ONCE(vblank->enabled)) {
 		drm_wait_vblank_reply(dev, pipe, &vblwait->reply);
@@ -1918,8 +1942,8 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 	 * been signaled. The disable has to be last (after
 	 * drm_handle_vblank_events) so that the timestamp is always accurate.
 	 */
-	disable_irq = (dev->vblank_disable_immediate &&
-		       drm_vblank_offdelay > 0 &&
+	disable_irq = (vblank->config.disable_immediate &&
+		       vblank->config.offdelay_ms > 0 &&
 		       !atomic_read(&vblank->refcount));
 
 	drm_handle_vblank_events(dev, pipe);
@@ -1992,7 +2016,8 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 	pipe = drm_crtc_index(crtc);
 
 	vblank = drm_crtc_vblank_crtc(crtc);
-	vblank_enabled = dev->vblank_disable_immediate && READ_ONCE(vblank->enabled);
+	vblank_enabled = READ_ONCE(vblank->config.disable_immediate) &&
+		READ_ONCE(vblank->enabled);
 
 	if (!vblank_enabled) {
 		ret = drm_crtc_vblank_get(crtc);
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index c8f829b4307c..e70d4383a674 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -78,6 +78,24 @@ struct drm_pending_vblank_event {
 	} event;
 };
 
+/**
+ * struct drm_vblank_config - vblank configuration for a CRTC
+ */
+struct drm_vblank_crtc_config {
+	/**
+	 * @offdelay_ms: Vblank off delay in ms, used to determine how long
+	 * @disable_timer waits before disabling.
+	 */
+	int offdelay_ms;
+
+	/**
+	 * @disable_immediate: See @struct drm_device.vblank_disable_immediate.
+	 * Additonally, this tracks the disable_immediate value per crtc, just
+	 * in case it needs to differ from the default value for a given device.
+	 */
+	bool disable_immediate;
+};
+
 /**
  * struct drm_vblank_crtc - vblank tracking for a CRTC
  *
@@ -198,6 +216,11 @@ struct drm_vblank_crtc {
 	 */
 	struct drm_display_mode hwmode;
 
+	/**
+	 * config: Stores vblank configuration values for a given CRTC.
+	 */
+	struct drm_vblank_crtc_config config;
+
 	/**
 	 * @enabled: Tracks the enabling state of the corresponding &drm_crtc to
 	 * avoid double-disabling and hence corrupting saved state. Needed by
@@ -247,6 +270,8 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe);
 void drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
 void drm_crtc_vblank_off(struct drm_crtc *crtc);
 void drm_crtc_vblank_reset(struct drm_crtc *crtc);
+void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
+			       const struct drm_vblank_crtc_config *config);
 void drm_crtc_vblank_on(struct drm_crtc *crtc);
 u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc);
 void drm_crtc_vblank_restore(struct drm_crtc *crtc);
-- 
2.45.2

