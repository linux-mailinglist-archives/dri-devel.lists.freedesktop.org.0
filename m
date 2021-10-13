Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC8D42B387
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 05:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E466E05C;
	Wed, 13 Oct 2021 03:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300120.outbound.protection.outlook.com [40.107.130.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9EB6E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 03:28:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYGzaPBSylpEFj2WtCIfEDmm8e28XVsVH7B/x4J7+93uOfsKHymy9wLiMuk76tok0TwikZuxI0znZ+Lo+WFpeNAOR00pjrZdwVjM9nagTj0Xk3DlGaMEUrbTzuZ1ttkACc7jYryk05XdWMMcIAlzc6PXkhd3xA41BcdX4QyTX2kCRtsCk9t64PmIgPrzwFwoaqUFHYx/yO1ijoKLRNmumQM4IvsdvxkypACmOLGofIo7YLZsLdGfKjZIHyGVW98FBlJX2XeqaqwEN3m8Hff8Aff7cBetIw+gD875XDlZ+HSaiO5xfzaHVGq/GMKHhbUPBOpgH/4nLD5QUnFttqB+Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBsGomjr2NBGqyTpxOrG9ymusuXmJxFk4AMVvy6+Dg0=;
 b=S1nX700FmZnrlwxFWH8KKFJyUOkwxypEWMGDViLa+Q7R1zwLHt5fzHtEbdrjykbZizHgxpI6+mcugS/azROlad0bBUCm+8j+9ZxRjoxWCJmLNfcz5SlOvGxi7NU2rmBvLF6cxM5PE2YgoUz5fMWaw0aFSaic2ZAR/an/obMN+rfehSbe6f0hwgbxMHACLQsqrsqf5IfqfubSSVPQhozyEwPVpVHeeYof02AW9yDo5aKYXZckfU7ei9mHi5YbqFfpWF9PqYpLyudb9nABkJTrg+pV/mjSuz1Z9+rGbT5ndA5LMJQhLK/GMyPkAp/Yc3tb2hjHL7pHaKP2NKEnrx3ApQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBsGomjr2NBGqyTpxOrG9ymusuXmJxFk4AMVvy6+Dg0=;
 b=TV6SsiUSlMfNPv+cvZWpsNU5Rg2VtmcNwrOOq5bS+nS7SD27VnP7Lt3mIbaXdrQZcB8bqKoHoDNP5HevbXxpeT+1KQ2rT7OHj2c184UHfYUzJkavAM3cLRJmpuZJCZb6SEpSL5GEJLO+kqBJuBr5/x+GlelJVNvY6C9jzfP+q68=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3243.apcprd06.prod.outlook.com (2603:1096:100:35::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 03:28:05 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4587.024; Wed, 13 Oct 2021
 03:28:05 +0000
From: Qing Wang <wangqing@vivo.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Qing Wang <wangqing@vivo.com>
Subject: [PATCH] video: fbdev: replace snprintf in show functions with
 sysfs_emit
Date: Tue, 12 Oct 2021 20:28:00 -0700
Message-Id: <1634095680-4377-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0010.apcprd03.prod.outlook.com
 (2603:1096:203:c8::15) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (103.220.76.181) by
 HKAPR03CA0010.apcprd03.prod.outlook.com (2603:1096:203:c8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4608.13 via Frontend Transport; Wed, 13 Oct 2021 03:28:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e540211f-6b8b-46bd-d4ea-08d98df97870
X-MS-TrafficTypeDiagnostic: SL2PR06MB3243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB3243B9F9DE282ECD76F6097EBDB79@SL2PR06MB3243.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TPCgqrfQafC2tRr0W2YMN2eKs339PBdhUF1E59llFU4moqdCDD482V/WoQPhR3p2BaOWCgMqGZuCUZJMv4Od+ct1vAlxaSBYAkTvpVouILxqsG+GWrdUFoiI+N19KDbTT+q/SK07Sxez+qCTaQu5xfVjkiJcwAVzGN2jqEqcb3Qc18Cje2qXNKCo+B4rrrtUgnq8eDQhkbmSkHzsAl/6Xe21PVVGepR2gj0x7ZzPwGSNP0D5YGG60dWZZtrPpcTFjqYu3fWKL1RdZ0tbBrv8anxphcHxzMvJ0k5Ux59I/PKIY0Sx512logrzuzIVhKXFerdeM7RWOICpQmcS1zZ7VHxNxEudO/CzbqLrInebN1E7Q6z/pjMvid4IEDpxVZzDbA6ALFxvm14iKp3DFQPLmPfcF2egIXFX/1GNItTaY/14g6zOH+yjInu2ebJSxLt2YbAjcenDEgU3x+3f6EwDpfawwF1eYsRsu77XCXNHRbtOy4y2oUUOPNew74AKhGXSP1+y73I/NhIrdZ0XIcXyNcx6N5qAlTrJQBdgdMJE9rOCxFGeyQlM0bCoMMH0/Zi5KdzoVHI6ibzeFw2SGYjGWaFNNsgu2p1Gs2al62RfB+83pUET23q1pDXxMvD+V5TnDryBpKnwXRnY+CaZOIE/fM4deuty4nVF1/gk764twCyKQgDbGn1pX1B8T+uTwuSjeljCg7hYYCnJKXDGwETkWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(2906002)(26005)(6512007)(4326008)(66946007)(8676002)(36756003)(66476007)(83380400001)(38100700002)(6666004)(66556008)(38350700002)(107886003)(316002)(52116002)(186003)(8936002)(6486002)(5660300002)(6506007)(956004)(2616005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wJ4eURR2anbJR/Hp9Wjy2C3zWEVl+qFDC3Kzlc87dmQQ5W+G5VsYGFvxUEev?=
 =?us-ascii?Q?crvu/DwztmOSgM/TiEWRn3qOG7GFP44T1Vtt0FG8PnD2RYaPI9HqIIf2pDXk?=
 =?us-ascii?Q?gu9psyYCkgxZmySK3GPjFhsW92B+x+caV2wcZ0nhF8+O+GI3MQpV0Tgr6/ig?=
 =?us-ascii?Q?9Ix5IFfIwOHOeoVJhrISs3g+SsAyWaNpgCzkSaPKv7wmBKipJfZE0foBmUtF?=
 =?us-ascii?Q?rpmaVCiJl1SAfu5qZTSQKo7tMrjnFC/bmkceIteEIrKGlALTNP7dipENBYPj?=
 =?us-ascii?Q?qWcwp+W3NGhQSHJF4e/gyYLnQtuYKhmUdHHVgZCmApPZkQspuwLZeNzwK5FC?=
 =?us-ascii?Q?ztcQIVDGLAaZBHYk8N7Ok3hDIgp3Q8p9U6GdgoPO7du32n8EoHEoUIJe8Ki8?=
 =?us-ascii?Q?zgnW1PNLUMAQNSjB56L/sWjgnoOnQKls1joIQT8DscBpIZaZLmGO5IG0weEM?=
 =?us-ascii?Q?w20LYg1sCw/JSbe7s01umOOByFG8O34r7HMNI8x4r7d6JaMVBR9id1kHdkNk?=
 =?us-ascii?Q?18IAyJpZBTR7K4dJMOcwBZEmXkB4OnZ9+s2PVMSKmW4P/g+iHUOz0kY1eIxT?=
 =?us-ascii?Q?5Rb08MxEpNbY+CABQRJx/TnYcWGGrB3N5CqB5FEXkQgAkftRZUSuLMujUKYl?=
 =?us-ascii?Q?ZAkMpvP7/mcnbpTFPZyJfHU16TsINCkKMKFq4xGod1F8VmqXaU0wVrhU1rXr?=
 =?us-ascii?Q?ajppfrQ7aX4GL68c4gr9LIvBY5TPF4DYfFnIK3rmXJ45fkF7OWzJLOXf8xm6?=
 =?us-ascii?Q?WRA5qi9kxbOOEgVbfENhokTPrcZ0BWMZ4Pr7hJKBSpLpNJaBIO7ce7QFAXf0?=
 =?us-ascii?Q?se/pqOql6YBOuMAbgt4zli33oStUuGRm6Hxy+xBhNfTtahQJcv2CN0swMezn?=
 =?us-ascii?Q?uFDFC1C4+rsQJdwJmzp97U94uI+NwMhlWIyMipEAu5xso1QkShRPsljznkMl?=
 =?us-ascii?Q?1G/V2ki0DL6NxsdI4wAaNaYN56aItjqICFZ3T58SGEStXgcVZbLamcSSF2UU?=
 =?us-ascii?Q?fJY4Nq89hIljkEVwbvEm+0OkJc4uV7HE5kQxr/q6zofvZFTjkpIJXqERN+PP?=
 =?us-ascii?Q?ggaBLn6TmqzEoAZah7EbHjrGNN/TUYGpQx+qFPMfMvSFfDAty7g96bBnjCtp?=
 =?us-ascii?Q?84lrzpNef+Kl8fmA/NBfkhFXfI+Rr1/Hl37LLrGSQ2rcqkTiRSh+lduBgZ9c?=
 =?us-ascii?Q?W+3C4fVzP8cEXoUW6RPTILtUHRi00tLeJcJ+gRI2gj1IoLF4MvdTi2Or5yQE?=
 =?us-ascii?Q?0si3znTR4FpkwqlAj4bFywDpU2xTOEjWkn8KjUaCEPImLuOM2YwV8Q2UVuiq?=
 =?us-ascii?Q?/3Vow/+xYXIeMx5Hu0nJV4RS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e540211f-6b8b-46bd-d4ea-08d98df97870
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 03:28:05.8078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjVNeFG/YSC4Duuqbqiy7qFAw3bW4/OwJPvp21wb8xpDxnxw/Dwi3SukL8t7hz0jOn/Ks38HQCYUbxgZ+Jc2Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3243
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
 drivers/video/fbdev/core/fbsysfs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 65dae05..2689294 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -230,7 +230,7 @@ static ssize_t show_bpp(struct device *device, struct device_attribute *attr,
 			char *buf)
 {
 	struct fb_info *fb_info = dev_get_drvdata(device);
-	return snprintf(buf, PAGE_SIZE, "%d\n", fb_info->var.bits_per_pixel);
+	return sysfs_emit(buf, "%d\n", fb_info->var.bits_per_pixel);
 }
 
 static ssize_t store_rotate(struct device *device,
@@ -257,7 +257,7 @@ static ssize_t show_rotate(struct device *device,
 {
 	struct fb_info *fb_info = dev_get_drvdata(device);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", fb_info->var.rotate);
+	return sysfs_emit(buf, "%d\n", fb_info->var.rotate);
 }
 
 static ssize_t store_virtual(struct device *device,
@@ -285,7 +285,7 @@ static ssize_t show_virtual(struct device *device,
 			    struct device_attribute *attr, char *buf)
 {
 	struct fb_info *fb_info = dev_get_drvdata(device);
-	return snprintf(buf, PAGE_SIZE, "%d,%d\n", fb_info->var.xres_virtual,
+	return sysfs_emit(buf, "%d,%d\n", fb_info->var.xres_virtual,
 			fb_info->var.yres_virtual);
 }
 
@@ -293,7 +293,7 @@ static ssize_t show_stride(struct device *device,
 			   struct device_attribute *attr, char *buf)
 {
 	struct fb_info *fb_info = dev_get_drvdata(device);
-	return snprintf(buf, PAGE_SIZE, "%d\n", fb_info->fix.line_length);
+	return sysfs_emit(buf, "%d\n", fb_info->fix.line_length);
 }
 
 static ssize_t store_blank(struct device *device,
@@ -381,7 +381,7 @@ static ssize_t show_pan(struct device *device,
 			struct device_attribute *attr, char *buf)
 {
 	struct fb_info *fb_info = dev_get_drvdata(device);
-	return snprintf(buf, PAGE_SIZE, "%d,%d\n", fb_info->var.xoffset,
+	return sysfs_emit(buf, "%d,%d\n", fb_info->var.xoffset,
 			fb_info->var.yoffset);
 }
 
@@ -390,7 +390,7 @@ static ssize_t show_name(struct device *device,
 {
 	struct fb_info *fb_info = dev_get_drvdata(device);
 
-	return snprintf(buf, PAGE_SIZE, "%s\n", fb_info->fix.id);
+	return sysfs_emit(buf, "%s\n", fb_info->fix.id);
 }
 
 static ssize_t store_fbstate(struct device *device,
@@ -418,7 +418,7 @@ static ssize_t show_fbstate(struct device *device,
 			    struct device_attribute *attr, char *buf)
 {
 	struct fb_info *fb_info = dev_get_drvdata(device);
-	return snprintf(buf, PAGE_SIZE, "%d\n", fb_info->state);
+	return sysfs_emit(buf, "%d\n", fb_info->state);
 }
 
 #if IS_ENABLED(CONFIG_FB_BACKLIGHT)
-- 
2.7.4

