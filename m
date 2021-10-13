Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFD142B388
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 05:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EF86E067;
	Wed, 13 Oct 2021 03:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300131.outbound.protection.outlook.com [40.107.130.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628916E067
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 03:28:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgTgL3+Xb/0ACR0YLb0yJQGRurl7Kbkifsi4t4jOwqO1D4hFmVbEh7asQk9HPx6Jsl0QgtKtB7ggZEn+ED845sEopxkGLeU+1K8Cyk/6xSxnvZ+3MCPJroRRXPtCjeq2FiVeMISyLOTw2I+W+6dYOY4d7HPS+rnWHVVhpRP+DNgemK9tDrcDoFoLHvfDuu2eAQrKQ/kSY2RzaDLQ1wfHHzqPfYg6ghUqiRfIl090twwD/4yQ93rywElL/ivOaWGICWarsx8b+stp3v2OMi/6HNfJWkGRnorE7XwU+hPdZqYcO/5NUpkaXRkhmMv4pTERms1ivIkBklO1kr5qRK0JGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86U+SnTm0ZlbVa88xEGhPJnUWzWJHbJOsg6SqD+Bb7o=;
 b=hN59sDjijg0qEx7M37OewMvVIXg+rKz75JueKw9xJV2p0JXKrVOQNxiB2oV37XG3ZEQj8Fc19dmHv2KFa+IK3SgYQQ5YxBHJMtZm6pcTHWGiCla2o6PnLw4Zm///K1/yHXfueO41vZ1HpLFXkeZ74WgHnCbGuHFINYv5rjSg6IE7k73/CAcm5k7tU+7WI2nk0JdcJ+0FX6ggwNQtPXlRIAjtcQdVn+A/h/oE4HL3Nr+IzdFo1HUt/moR68a+e03V6RpW8kaulYS53LsicxeM1sGJre0t2Zi/V/q2MiFmSxKgLDAa9tHw+Xla2hF2LcoVYEXcenkil8a6NKTg20fb7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86U+SnTm0ZlbVa88xEGhPJnUWzWJHbJOsg6SqD+Bb7o=;
 b=ICAsMsDjSJJ9wKYcAN/foNVGf+T15hPxxEtVcvDp45BKkWM2eyTwvwYFOZAwXVZyW01Y3h0eSrVYahdB8LRPRPiuOVxyOHBpe3en7HGrDOYNqWr9C0oPxXcKW1GQhE+dyVtTEddFEZG+sFm3Kp39c7B3PRC2iWR/nPVjD4MnfaQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB2955.apcprd06.prod.outlook.com (2603:1096:100:3d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 03:28:31 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4587.024; Wed, 13 Oct 2021
 03:28:31 +0000
From: Qing Wang <wangqing@vivo.com>
To: linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Qing Wang <wangqing@vivo.com>
Subject: [PATCH] video: omapfb: replace snprintf in show functions with
 sysfs_emit
Date: Tue, 12 Oct 2021 20:28:13 -0700
Message-Id: <1634095693-4428-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0169.apcprd02.prod.outlook.com
 (2603:1096:201:1f::29) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by
 HK2PR02CA0169.apcprd02.prod.outlook.com (2603:1096:201:1f::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4587.21 via Frontend Transport; Wed, 13 Oct 2021 03:28:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc6f5614-7e66-4324-6891-08d98df987d6
X-MS-TrafficTypeDiagnostic: SL2PR06MB2955:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB29552416023E338CE38B8EF1BDB79@SL2PR06MB2955.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:225;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1gRIftN/hR7aBn3Kp/2FJBE2BZwIYUvat4OJ67bFcV8FG0dpPZa47iwMOIbdeIyVneFsZG3V2cltY/HYIw3olKQx4iAU6P8EHC0QYHb2KVe1gj8L4DmvNaCBjdqfydqFE09gPzCmwt3rGtDB3saZNFz9OI2Qxa3dtWayD04rxmebhz8w9ltMWMiZJjYFY7/7uUGkAH7MLnChx1+yLQiAY6Lt3yuHHg1Ww/nmW+jnSwS1nehBqboh+xhVXud3BQnWKXOMfZQHtPK5R9OW3Ff8rTw8ZUbbuHO8qwQhQJv28s2MrFFnwKRFAb47Fpo/u+XypDOnThs/4BIDUDZqfnTdhuLWcCaGUASdYnKfBlzZLwatp0rbZ9mzLxjOTPfSpM2jgg8dZJEfv/hbtlIS1PdQ0l9D9gt+TH4cyM4qJbAnnyub7JhGdVdfoq2Jl7HvN57B8oOuJSLefaRRTj93k/qLL1AdpG2hy6CmWPgBJt5m8o1l0vFqmIgqpYPkI3WHuZkubvKfBVkgsDHGYqK2QuKw+WzwvdL+S5TrF2/cBq17n83DPlsl9nsBiPm+PUOLj5yFTctf0rY+HBId938NYLj0ZVdirBghOGEwQkTfZTdsuRBXXKCjiyZbO048f5E28pcBazXI4Ap5Vin+zbJMhRqpw5O/Cfl0IAUW5Lgl6sboX3MvkbKdPKzpYH22s74EbsRsQN94cn8WxfG4DisJBQUvHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(508600001)(186003)(6666004)(107886003)(66476007)(66556008)(8936002)(66946007)(26005)(2906002)(6486002)(30864003)(2616005)(36756003)(83380400001)(4326008)(52116002)(6512007)(6506007)(86362001)(8676002)(316002)(38350700002)(5660300002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WEvEKLpjKHWnHaMsSrO8nfu7yUFwU1kY0TYp5aLS/gNMtuhE0cUsyifvEtFX?=
 =?us-ascii?Q?hW8HP/M+qcN7Tpz5rqF5pgLkdjIs2p4L/2t3dTGyjBki4IswO26RZ7E0J877?=
 =?us-ascii?Q?iZBmafzjxyR3BTpZkYYDVHTUaetLU9/IztOLcmvfbFRQDpv6n255AsYtr9qn?=
 =?us-ascii?Q?sQ45Ag/6j0rasIc2z0xPyPM4TZ0DCz+lqIDd+DtL5xGpuY9kTm4G8UYazSHS?=
 =?us-ascii?Q?eMEiF1EnPau4/CdF7bpllfFI3whx3aPiY67iMUJnMUQNbrXNMjG6fqcctXdW?=
 =?us-ascii?Q?3iTYg26yAUFO8c/2mHKdptMZjw39R5XTo4tj4jCZIilteR3q4cnz2Ra6vnr2?=
 =?us-ascii?Q?bmBIA4ZL5/+jkq1m/qNPwYgAVUrRwAqDVmv7zLKq6+Opd211wYOMXwif0M6D?=
 =?us-ascii?Q?IlfwWlqLXpTSexILG+mb66o4Rz3ufTOZISAulQm3Iqdx0OV1WYbouQhm7zv8?=
 =?us-ascii?Q?cjxIAhMpRcq9zyjQxfL7f0oW/bB38DNPRfMGuEPRtEk+3lrYcxQezhqVLCKg?=
 =?us-ascii?Q?E7jol7hSouPN3a97ibfJHjwgsTC+lELP5XETx41pWPmpvNAMZOQ4Hyu5dbmw?=
 =?us-ascii?Q?uNgJRZUzQWyCEOo7TsfAYRxxC4ryATBSIsJLthUxtYrxaZoZ1RY9Zupx5eB/?=
 =?us-ascii?Q?5X7Dm1kYOrrh5Bm8iS8PM49e1CUMiiIcbMlrWf+Yd82oGwC8l61qJ2SdiEXj?=
 =?us-ascii?Q?gbUWPmHFfrHqRux+wXGxOfI2d9jwcuez76tfIXdGy/zZgLHN8LDVSKEN8UX4?=
 =?us-ascii?Q?0WbzQFghpJ9BppDIqoImPELlTWXhUzKx7p1kWe37TdIiZxObeMq1sRRlFF4H?=
 =?us-ascii?Q?pQ7hXKc0TiJIZ3cMCEgJIpnl/5IKEcN/8iNMs/ZI0yovrkISB2VS9gnFiWEu?=
 =?us-ascii?Q?1ONF407sRDb0kIFrLiM921KayxaKRhb6FepcQUA1RmUG54abktaSNWGyFbpF?=
 =?us-ascii?Q?Xn7Z47MOOCoG0tTV4SjgPy02BWuzb9kH3XSpShc/lh5i/i9l1jxd4uBPoNqA?=
 =?us-ascii?Q?t5Y/SDAzGZ4d3efGwfoeVrx8TqmB6qu9GySJkJWJGMbPFwTFRKWqiWuQNJOt?=
 =?us-ascii?Q?c7Vc8lRowTze8krrL0xB7+8qjnCHULDYRmBCxRGrU/GE20QxGQ/JwzTzckVJ?=
 =?us-ascii?Q?bEgtuXDY72qSRbp/o0ThnCbMiAQxKt7ueXck01QXwuHCyfu+x1ZCag5qHtOA?=
 =?us-ascii?Q?+6qYYc2j3Kw4mVww8SIuDfDbi0e/AxmtEKQJs+H4din7GBcAj9unfBElThrD?=
 =?us-ascii?Q?11c93/nI3ONQheufO+HjjfvxrYkBl9U/2ZCSNAQLg0cYz+0Qil/xij/HotmQ?=
 =?us-ascii?Q?TbkSQB/jL27mHYFo8sg02Ihz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6f5614-7e66-4324-6891-08d98df987d6
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 03:28:31.6283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaVgU9tVZD/1Gk0DWugG+EMxU/tpVjqTdJE8Yj7mZZzgJDP6yU4JmmQUwNy1nfCXltb+o5+N4xk8T/mCwHL1YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB2955
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

coccicheck complains about the use of snprintf() in sysfs show functions.

Fix the coccicheck warning:
WARNING: use scnprintf or sprintf.

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c | 14 +++++++-------
 drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c | 18 +++++++++---------
 drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c | 20 ++++++++++----------
 drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c      | 12 ++++++------
 4 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
index 6dbe265..8f355d1 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
@@ -19,14 +19,14 @@
 
 static ssize_t display_name_show(struct omap_dss_device *dssdev, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			dssdev->name ?
 			dssdev->name : "");
 }
 
 static ssize_t display_enabled_show(struct omap_dss_device *dssdev, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			omapdss_device_is_enabled(dssdev));
 }
 
@@ -59,7 +59,7 @@ static ssize_t display_enabled_store(struct omap_dss_device *dssdev,
 
 static ssize_t display_tear_show(struct omap_dss_device *dssdev, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			dssdev->driver->get_te ?
 			dssdev->driver->get_te(dssdev) : 0);
 }
@@ -93,7 +93,7 @@ static ssize_t display_timings_show(struct omap_dss_device *dssdev, char *buf)
 
 	dssdev->driver->get_timings(dssdev, &t);
 
-	return snprintf(buf, PAGE_SIZE, "%u,%u/%u/%u/%u,%u/%u/%u/%u\n",
+	return sysfs_emit(buf, "%u,%u/%u/%u/%u,%u/%u/%u/%u\n",
 			t.pixelclock,
 			t.x_res, t.hfp, t.hbp, t.hsw,
 			t.y_res, t.vfp, t.vbp, t.vsw);
@@ -143,7 +143,7 @@ static ssize_t display_rotate_show(struct omap_dss_device *dssdev, char *buf)
 	if (!dssdev->driver->get_rotate)
 		return -ENOENT;
 	rotate = dssdev->driver->get_rotate(dssdev);
-	return snprintf(buf, PAGE_SIZE, "%u\n", rotate);
+	return sysfs_emit(buf, "%u\n", rotate);
 }
 
 static ssize_t display_rotate_store(struct omap_dss_device *dssdev,
@@ -171,7 +171,7 @@ static ssize_t display_mirror_show(struct omap_dss_device *dssdev, char *buf)
 	if (!dssdev->driver->get_mirror)
 		return -ENOENT;
 	mirror = dssdev->driver->get_mirror(dssdev);
-	return snprintf(buf, PAGE_SIZE, "%u\n", mirror);
+	return sysfs_emit(buf, "%u\n", mirror);
 }
 
 static ssize_t display_mirror_store(struct omap_dss_device *dssdev,
@@ -203,7 +203,7 @@ static ssize_t display_wss_show(struct omap_dss_device *dssdev, char *buf)
 
 	wss = dssdev->driver->get_wss(dssdev);
 
-	return snprintf(buf, PAGE_SIZE, "0x%05x\n", wss);
+	return sysfs_emit(buf, "0x%05x\n", wss);
 }
 
 static ssize_t display_wss_store(struct omap_dss_device *dssdev,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
index b52cc1a..3ffb1fe 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/manager-sysfs.c
@@ -22,14 +22,14 @@
 
 static ssize_t manager_name_show(struct omap_overlay_manager *mgr, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n", mgr->name);
+	return sysfs_emit(buf, "%s\n", mgr->name);
 }
 
 static ssize_t manager_display_show(struct omap_overlay_manager *mgr, char *buf)
 {
 	struct omap_dss_device *dssdev = mgr->get_device(mgr);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", dssdev ?
+	return sysfs_emit(buf, "%s\n", dssdev ?
 			dssdev->name : "<none>");
 }
 
@@ -120,7 +120,7 @@ static ssize_t manager_default_color_show(struct omap_overlay_manager *mgr,
 
 	mgr->get_manager_info(mgr, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%#x\n", info.default_color);
+	return sysfs_emit(buf, "%#x\n", info.default_color);
 }
 
 static ssize_t manager_default_color_store(struct omap_overlay_manager *mgr,
@@ -165,7 +165,7 @@ static ssize_t manager_trans_key_type_show(struct omap_overlay_manager *mgr,
 	key_type = info.trans_key_type;
 	BUG_ON(key_type >= ARRAY_SIZE(trans_key_type_str));
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", trans_key_type_str[key_type]);
+	return sysfs_emit(buf, "%s\n", trans_key_type_str[key_type]);
 }
 
 static ssize_t manager_trans_key_type_store(struct omap_overlay_manager *mgr,
@@ -200,7 +200,7 @@ static ssize_t manager_trans_key_value_show(struct omap_overlay_manager *mgr,
 
 	mgr->get_manager_info(mgr, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%#x\n", info.trans_key);
+	return sysfs_emit(buf, "%#x\n", info.trans_key);
 }
 
 static ssize_t manager_trans_key_value_store(struct omap_overlay_manager *mgr,
@@ -236,7 +236,7 @@ static ssize_t manager_trans_key_enabled_show(struct omap_overlay_manager *mgr,
 
 	mgr->get_manager_info(mgr, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", info.trans_enabled);
+	return sysfs_emit(buf, "%d\n", info.trans_enabled);
 }
 
 static ssize_t manager_trans_key_enabled_store(struct omap_overlay_manager *mgr,
@@ -275,7 +275,7 @@ static ssize_t manager_alpha_blending_enabled_show(
 
 	mgr->get_manager_info(mgr, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 		info.partial_alpha_enabled);
 }
 
@@ -316,7 +316,7 @@ static ssize_t manager_cpr_enable_show(struct omap_overlay_manager *mgr,
 
 	mgr->get_manager_info(mgr, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", info.cpr_enable);
+	return sysfs_emit(buf, "%d\n", info.cpr_enable);
 }
 
 static ssize_t manager_cpr_enable_store(struct omap_overlay_manager *mgr,
@@ -358,7 +358,7 @@ static ssize_t manager_cpr_coef_show(struct omap_overlay_manager *mgr,
 
 	mgr->get_manager_info(mgr, &info);
 
-	return snprintf(buf, PAGE_SIZE,
+	return sysfs_emit(buf,
 			"%d %d %d %d %d %d %d %d %d\n",
 			info.cpr_coefs.rr,
 			info.cpr_coefs.rg,
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
index 36acf36..421dcb7 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/overlay-sysfs.c
@@ -22,12 +22,12 @@
 
 static ssize_t overlay_name_show(struct omap_overlay *ovl, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n", ovl->name);
+	return sysfs_emit(buf, "%s\n", ovl->name);
 }
 
 static ssize_t overlay_manager_show(struct omap_overlay *ovl, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			ovl->manager ? ovl->manager->name : "<none>");
 }
 
@@ -108,7 +108,7 @@ static ssize_t overlay_input_size_show(struct omap_overlay *ovl, char *buf)
 
 	ovl->get_overlay_info(ovl, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%d,%d\n",
+	return sysfs_emit(buf, "%d,%d\n",
 			info.width, info.height);
 }
 
@@ -118,7 +118,7 @@ static ssize_t overlay_screen_width_show(struct omap_overlay *ovl, char *buf)
 
 	ovl->get_overlay_info(ovl, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", info.screen_width);
+	return sysfs_emit(buf, "%d\n", info.screen_width);
 }
 
 static ssize_t overlay_position_show(struct omap_overlay *ovl, char *buf)
@@ -127,7 +127,7 @@ static ssize_t overlay_position_show(struct omap_overlay *ovl, char *buf)
 
 	ovl->get_overlay_info(ovl, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%d,%d\n",
+	return sysfs_emit(buf, "%d,%d\n",
 			info.pos_x, info.pos_y);
 }
 
@@ -166,7 +166,7 @@ static ssize_t overlay_output_size_show(struct omap_overlay *ovl, char *buf)
 
 	ovl->get_overlay_info(ovl, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%d,%d\n",
+	return sysfs_emit(buf, "%d,%d\n",
 			info.out_width, info.out_height);
 }
 
@@ -201,7 +201,7 @@ static ssize_t overlay_output_size_store(struct omap_overlay *ovl,
 
 static ssize_t overlay_enabled_show(struct omap_overlay *ovl, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", ovl->is_enabled(ovl));
+	return sysfs_emit(buf, "%d\n", ovl->is_enabled(ovl));
 }
 
 static ssize_t overlay_enabled_store(struct omap_overlay *ovl, const char *buf,
@@ -231,7 +231,7 @@ static ssize_t overlay_global_alpha_show(struct omap_overlay *ovl, char *buf)
 
 	ovl->get_overlay_info(ovl, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			info.global_alpha);
 }
 
@@ -273,7 +273,7 @@ static ssize_t overlay_pre_mult_alpha_show(struct omap_overlay *ovl,
 
 	ovl->get_overlay_info(ovl, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 			info.pre_mult_alpha);
 }
 
@@ -314,7 +314,7 @@ static ssize_t overlay_zorder_show(struct omap_overlay *ovl, char *buf)
 
 	ovl->get_overlay_info(ovl, &info);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", info.zorder);
+	return sysfs_emit(buf, "%d\n", info.zorder);
 }
 
 static ssize_t overlay_zorder_store(struct omap_overlay *ovl,
diff --git a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
index 2d39dbf..deed5c7 100644
--- a/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
+++ b/drivers/video/fbdev/omap2/omapfb/omapfb-sysfs.c
@@ -29,7 +29,7 @@ static ssize_t show_rotate_type(struct device *dev,
 	struct fb_info *fbi = dev_get_drvdata(dev);
 	struct omapfb_info *ofbi = FB2OFB(fbi);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ofbi->rotation_type);
+	return sysfs_emit(buf, "%d\n", ofbi->rotation_type);
 }
 
 static ssize_t store_rotate_type(struct device *dev,
@@ -83,7 +83,7 @@ static ssize_t show_mirror(struct device *dev,
 	struct fb_info *fbi = dev_get_drvdata(dev);
 	struct omapfb_info *ofbi = FB2OFB(fbi);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", ofbi->mirror);
+	return sysfs_emit(buf, "%d\n", ofbi->mirror);
 }
 
 static ssize_t store_mirror(struct device *dev,
@@ -415,7 +415,7 @@ static ssize_t show_size(struct device *dev,
 	struct fb_info *fbi = dev_get_drvdata(dev);
 	struct omapfb_info *ofbi = FB2OFB(fbi);
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", ofbi->region->size);
+	return sysfs_emit(buf, "%lu\n", ofbi->region->size);
 }
 
 static ssize_t store_size(struct device *dev, struct device_attribute *attr,
@@ -492,7 +492,7 @@ static ssize_t show_phys(struct device *dev,
 	struct fb_info *fbi = dev_get_drvdata(dev);
 	struct omapfb_info *ofbi = FB2OFB(fbi);
 
-	return snprintf(buf, PAGE_SIZE, "%0x\n", ofbi->region->paddr);
+	return sysfs_emit(buf, "%0x\n", ofbi->region->paddr);
 }
 
 static ssize_t show_virt(struct device *dev,
@@ -501,7 +501,7 @@ static ssize_t show_virt(struct device *dev,
 	struct fb_info *fbi = dev_get_drvdata(dev);
 	struct omapfb_info *ofbi = FB2OFB(fbi);
 
-	return snprintf(buf, PAGE_SIZE, "%p\n", ofbi->region->vaddr);
+	return sysfs_emit(buf, "%p\n", ofbi->region->vaddr);
 }
 
 static ssize_t show_upd_mode(struct device *dev,
@@ -516,7 +516,7 @@ static ssize_t show_upd_mode(struct device *dev,
 	if (r)
 		return r;
 
-	return snprintf(buf, PAGE_SIZE, "%u\n", (unsigned)mode);
+	return sysfs_emit(buf, "%u\n", (unsigned)mode);
 }
 
 static ssize_t store_upd_mode(struct device *dev, struct device_attribute *attr,
-- 
2.7.4

