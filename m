Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891EA456AF6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 08:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BA76E9F9;
	Fri, 19 Nov 2021 07:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2095.outbound.protection.outlook.com [40.107.215.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E86A6E9FD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 07:33:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2jcRIQICQHuQmvFSZRIDmsRfC/Ja3gdo5o9+Axlree0NmsZznQLASC6uody6df2Z+tWSWZAQAnaw45mP52VNPim76vIaqjGlesJs2xTTkd/zRdC0EoVVNHm0CsWjUcyZXqCVAWF1Kzx6aN885a3hy/l0jSTkODC7Ctq3TCgh6QA1G3A4y5n6JMX8kXc1jlZ1KG8xhPHjbK6Zu5XEshFEhkq3N2NuFIPMjRKi+5/vFES5D0QQ51yeOLQjSMAXa/arq546ff8U6GW8Z01BPVrT/P/MukLmuCgfQbX/J8VSybTylt4nEFtTM4uip4som3uh7z7BGtnTC/as7CKN9Q3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7WGpVYbJ2fu58L5txpZ47ZzRmzY1LIqlcm0FX3LOO0=;
 b=PkeHvhwi/Iz5OmkRNse+QEDmst39CNKTgtQqqTH3PsDwwyfRp4pRuj3cReXx7n3PjiL0R/kwAeIzrwSMbAlD2BQBKmaCWN8CyqNGAjlaAzKOBO4gIZ/KSGF0ZKSROZEMg4JOJu3BTdqHVDZqGKac5dgE0pWgOM/EWqOM0nEuNcgcZbi6EV8iyO18nIitkAOPmYf+vmJhIx7vfQWj3gST/MJpYp1yJCTl30R+FABvWBxhUyg4a0al1UrvYhF4bEtxdzABdiUqOzYTAlSU+5KneXIfQEvzhi7QXE+mtSQ7NBv8oDrVPwza5LrA8w8WHGBRUTeO86Hupyo+5JQsh1XeUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7WGpVYbJ2fu58L5txpZ47ZzRmzY1LIqlcm0FX3LOO0=;
 b=LGPfMP0/N3AaJG96QH3QXv1UN49ukxBb4ifkHqb+tGjMZGPJoWiugrRAFRoDETM0ieQM/oQyCQUhfeBs/QBDQA2SiQPqoOjSQ+RnfiUApjxK0c0yJedjA2y/IQdi5p1loQ/rnAqKA3+5GUcMaOBjS6EWMAiBdWQLVqUaveiuNRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by HK2PR0601MB2033.apcprd06.prod.outlook.com (2603:1096:202:8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 07:33:11 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::814a:4668:a3bd:768]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::814a:4668:a3bd:768%7]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 07:33:10 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Guo Zhengkui <guozhengkui@vivo.com>,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] video: omapfb: Use sysfs_emit() instead of snprintf()
Date: Fri, 19 Nov 2021 15:31:26 +0800
Message-Id: <20211119073139.18832-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
Received: from guozhengkui.debian (203.90.234.87) by
 SG2PR03CA0125.apcprd03.prod.outlook.com (2603:1096:4:91::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.11 via Frontend Transport; Fri, 19 Nov 2021 07:33:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 166350bc-ffd5-4cf2-48cc-08d9ab2ed67f
X-MS-TrafficTypeDiagnostic: HK2PR0601MB2033:
X-Microsoft-Antispam-PRVS: <HK2PR0601MB203379AC009E8F5F86A2E4F5C79C9@HK2PR0601MB2033.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:82;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Hm8fqlNZ8K+lqlB6sBtXiC1zALwEcVa+ENrTuKOl13bkjWO9qu7yfgscj5cIuYiA5h2LO/G5fnUk87KkaKtKW/Qw5J8m0KLceBO/hT4uoGBoFU+hn/pRh7Kwiw5sPM+O/FD01dUK7976t+sFQ20WHQ6cXjv37D9KIpR85v1ICssIo6z4QcDA7mIYphMrgw717WYNgm7CW6gVKMEI9t661KCwrvYYT26fFS+riTT7KZcx44GUOHHkvLOY4c/R1gV4d1uWJfFUfgSJaRw5ifJPMTod/X3ke/SYFV/0NGtQ2yajNrH+5DKO2nZ9dLMfzyA9yZC9gng0WMAd4qV2KBYt36gBG0El6BlaUOkQbh4vi4vqTss+mWUnMY+dm/BNB1oUQongMWB7/qqOLcQXv9bnXFIIYwMEVH3xmq5ldduLYeKimGhNghgb6g8DUX6dhW2wZ/fXHHr3HW7n10bY8lPTlFjWMaSi8RHZvp4ZgLv0nYORg+owjXaz2ko0xhJNFmPy0DD94OU9k2f/KT1FqDIDxyacQ6LF74G5WK3xv/zfrh6JhdlzXhsZvnGcJO/ADZSuXjiED9/iE0rSqc/VuuA1DgLQR8dXoIE37IRR6ZYp+3Sn0iEIjXM5cEaZML8mBObMv6jc45rkWMrSoyQ0AJGGvPH1lH3Sxr8TWOgjWtzOjRurl6Ez7nKoGAqjnawM/DsIc+ABxJ3T9ib2XYZn7T1Fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(38100700002)(26005)(52116002)(2906002)(956004)(4326008)(508600001)(186003)(316002)(110136005)(6666004)(8936002)(5660300002)(38350700002)(1076003)(86362001)(66556008)(6512007)(66476007)(6506007)(107886003)(36756003)(83380400001)(66946007)(2616005)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a4hKdYsY4e5SovbhUwQRSjZogFjn+3HcsgKQjTNBr2mhRC9FFJmxRKYsicB3?=
 =?us-ascii?Q?n8USvZCxbA4PIG7Ngn3+LDoRsZUmOhufRWui4LwrWtPhaQm/o0lEfnytOG7/?=
 =?us-ascii?Q?pdSAu7tANfo3Gwf52d/6sMKSr7+KX1mJeEVfMkw18Su7u3bWg8k0iO5ovLG1?=
 =?us-ascii?Q?mISbtCqgdwzA2xY8E52KE8ptU5Gy2gE4ZQrlmdplLED+XeGuuAHJcrLE0t5/?=
 =?us-ascii?Q?c3lQqFMTPhYleVngbq+xOsziHFt5bOikctoQbBGt44xqsEzypMcv8oTie5wr?=
 =?us-ascii?Q?xC+qsaPTt5396ftlgyeGpgvui4OyQcVHk7PxJ5jgEzd3l8cpYZEbfgZ+yN81?=
 =?us-ascii?Q?9WbJFuO3XJcXH2VxH58YCXUGC2yXgJPQI9/wKB9c6VfdB5Om/7PnJRrwpEoi?=
 =?us-ascii?Q?Hg0kELmz4oonGJtjTDYIR9erAER7ewhazKE8Imjdlm4kWkvM8aVDz1hf2kGQ?=
 =?us-ascii?Q?ZayYAnvHYJaLK/zzGDi2f7PsD69ru90CH+vwX6TW7PNs771DPWGbMTAVTNfI?=
 =?us-ascii?Q?2IGWaGCt9jahVGr0DKmkJOakr03Xv8WiRR07XfzmdKIcScBxqhc9Dfb/UUOt?=
 =?us-ascii?Q?AQFPZ78pWXtwPJ32F5OGso44sCicHPUFZpR3Up+gzOCYVmb41eyJzZBKXHHI?=
 =?us-ascii?Q?3uIb6V+AgPd+fDffE37H8Jl4pbL3XWK3/Sb8Xru+ks/huimC3pJsu6/V1IvC?=
 =?us-ascii?Q?KjorAcHXpGbEEaNsl+xOLQWP5sR+BtbQFd+hGreDhp68ImaxKyRTIBcGicyy?=
 =?us-ascii?Q?A/V45zzf23FkIpzENMNGdkRcDFMM+Z+9Ecn0LBVx9GOxPT2gBQxWtQF0704P?=
 =?us-ascii?Q?fUpjHmK8Qpn6N/4nWEq4iMvD2+7dFsSt+Z64+cryQnST02zW23OT0DUP4YFx?=
 =?us-ascii?Q?CLh83WnkWEm1d7IwmVviTIIuNRJvuGd7HL5XYovdRI3+H0kQQG5HuWJ0UOQn?=
 =?us-ascii?Q?GmiBlD5UJSEe/r7ostNVM0rT4EyYvVuOoMUmNSoaeG/5p2IiTXrduU5DLwZ2?=
 =?us-ascii?Q?GhRigArZXBzt+rbTvBM0vv46YQDcyoOlb/qOv+NnIuW/G26aTjr9avHLgsss?=
 =?us-ascii?Q?EAhQ3pGvPMMalNAHs04obsQzcQwnyavMRrgqZU+IXEO//MFDBhqkD3iiml0R?=
 =?us-ascii?Q?xEL6eRPfmo7E7yQUIp6ADfUA4LubqtxgX/P1NQnkde5hUkw62a78DLKJQg/F?=
 =?us-ascii?Q?B4jUgm13a8dp5IT92YcJoLTjW8Q/xqhTIyx2+CVWK5nDQzuOwj5gfciIR30k?=
 =?us-ascii?Q?c39YmvL5r72+j8m5za1q342n9kjsp65JyrCGohnDSF+4/FFQX6i1uqsBPno+?=
 =?us-ascii?Q?8F4LDb3zXrTizq4GhxEKO64sxTRp/urR+qLdqn+p/cGKzh0hQCpJb8/0P6AV?=
 =?us-ascii?Q?0PwDegglxa3ymxH7bERjofOJT0pHbduFtLSP+wAR7/zU+xCKBZNnTlOpL5yU?=
 =?us-ascii?Q?q4GpptH4chp+aCSXkCQXAtfCvA6osYfpfrxzIrEXXHfzg8bo7hkhRSYa6GC5?=
 =?us-ascii?Q?ovdfwoxCZHtTXMfW3cPsupeRxPHLfWUehfxJ1ZNUm7AZ6GqVxf44NYGeUPRQ?=
 =?us-ascii?Q?zk3hScg3TedOPMNqm1LvSqUwytochuvhnR/STLaaVcXiJoqmcINFyG9uwHNI?=
 =?us-ascii?Q?tkw30BuCTzpK+RV5D3KJuWE=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 166350bc-ffd5-4cf2-48cc-08d9ab2ed67f
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 07:33:10.7855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuAiyYw1Z0aQFCDYiERa4yYyAjG9ap3osROt0XDly6GuU4HH2RaULan8hJHP8V8jBoCNJioyGJqWh9eDEFSgIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB2033
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
Cc: kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use sysfs_emit() instead of snprintf().

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/video/fbdev/omap/omapfb_main.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index b495c09e6102..083388a4ceeb 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/module.h>
+#include <linux/sysfs.h>
 
 #include <linux/omap-dma.h>
 
@@ -1303,7 +1304,7 @@ static ssize_t omapfb_show_panel_name(struct device *dev,
 {
 	struct omapfb_device *fbdev = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", fbdev->panel->name);
+	return sysfs_emit(buf, "%s\n", fbdev->panel->name);
 }
 
 static ssize_t omapfb_show_bklight_level(struct device *dev,
@@ -1314,8 +1315,8 @@ static ssize_t omapfb_show_bklight_level(struct device *dev,
 	int r;
 
 	if (fbdev->panel->get_bklight_level) {
-		r = snprintf(buf, PAGE_SIZE, "%d\n",
-			     fbdev->panel->get_bklight_level(fbdev->panel));
+		r = sysfs_emit(buf, "%d\n",
+			       fbdev->panel->get_bklight_level(fbdev->panel));
 	} else
 		r = -ENODEV;
 	return r;
@@ -1348,8 +1349,8 @@ static ssize_t omapfb_show_bklight_max(struct device *dev,
 	int r;
 
 	if (fbdev->panel->get_bklight_level) {
-		r = snprintf(buf, PAGE_SIZE, "%d\n",
-			     fbdev->panel->get_bklight_max(fbdev->panel));
+		r = sysfs_emit(buf, "%d\n",
+			       fbdev->panel->get_bklight_max(fbdev->panel));
 	} else
 		r = -ENODEV;
 	return r;
@@ -1379,7 +1380,7 @@ static ssize_t omapfb_show_ctrl_name(struct device *dev,
 {
 	struct omapfb_device *fbdev = dev_get_drvdata(dev);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", fbdev->ctrl->name);
+	return sysfs_emit(buf, "%s\n", fbdev->ctrl->name);
 }
 
 static struct device_attribute dev_attr_ctrl_name =
-- 
2.20.1

