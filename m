Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF17051757D
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88AA10ED24;
	Mon,  2 May 2022 17:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-centralusazon11021020.outbound.protection.outlook.com [52.101.62.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36AF210EFCA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 17:10:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iz82rLC/u3RMIgxaZqYb4+Fm5a2CupVlhO4TI8/0EF3T57u0t7B/ULvN2UOV/wkJ1Mb2vsMcMcV8LPYRwY5zNZC3r7hUGsLpgvSkk39nexHXKKj7mlnyJG6YFeN6fPiGmoXsYTm70tEMsxuthSdvZFILodb34NRokgea9YJYO8xxU/0XhHIv72MJKvOBZ7BaZAEKXEMLD9UQE/jXb/EKFVWU2C2KOd/60Ae/JY6vYyWLWDQbeSZHLzhTOAkJ/WbXiN6NqO+vjuaf+KGa07f/4Yy6P1zdMzu839jb1kIE6BZCJftLkn4dV6AjCVDiMfRGG2KJxWGI3Dmv8tDeG6PnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpm0B8znkiT/KSp9Hgvhde9feu11S0SLNlKNoQjIs1Q=;
 b=PZ6jXehPs1MEys/q3SyXlecJRpJ6renYfL/7FFeAAUUYD1SMKnnsvu01g5NhmSD1TuC4i33+vJTnP0Z+9rUlMurGTEPLDSIbwgItlrVKMhr1v+FocD6ndz/XBNDsZJgOy/MIcLTge6LgBpFSkA0k06FUf5TnxYVDAUlW8ImvYP0CFn57ku1Q+iZEFQO9TCRqfU3NuxBkhuzDg8qzl6cN4qscyFHGMhp+kvreOKmg3TybFYzcHwx1tMyEHlQfQcz44nVPPKv/r2Xb6LSI+ujUSo0g9URYN5M5iPsvRh6p3Fd6wndb4Zru0Q1l18SWjI76hi6VnpVYCOu+eNuRS7aozw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpm0B8znkiT/KSp9Hgvhde9feu11S0SLNlKNoQjIs1Q=;
 b=beQ3VwpKCVjbx7FL1qckRFU3ibTfhQ+mga+j0EioOUvqoKKmfwa/F9KzsqxA3SBI5BFTb7edQp6YYF0EecLhkv5vW7LdfaqixdaNHdWNtcHG5Z1BeIWi1eGUJ7mMmzxHgl23r3MWN8UNrwg+V1Up/T/s+AOa5SfNSGTNYhyP/iM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
Received: from DM6PR21MB1370.namprd21.prod.outlook.com (2603:10b6:5:16b::28)
 by DM6PR21MB1180.namprd21.prod.outlook.com (2603:10b6:5:161::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.4; Mon, 2 May
 2022 16:37:06 +0000
Received: from DM6PR21MB1370.namprd21.prod.outlook.com
 ([fe80::588e:9ede:461a:2372]) by DM6PR21MB1370.namprd21.prod.outlook.com
 ([fe80::588e:9ede:461a:2372%4]) with mapi id 15.20.5250.004; Mon, 2 May 2022
 16:37:06 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, vkuznets@redhat.com, decui@microsoft.com,
 drawat.floss@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jejb@linux.ibm.com, martin.petersen@oracle.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-scsi@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 3/4] video: hyperv_fb: Remove support for Hyper-V 2008 and
 2008R2/Win7
Date: Mon,  2 May 2022 09:36:30 -0700
Message-Id: <1651509391-2058-4-git-send-email-mikelley@microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
References: <1651509391-2058-1-git-send-email-mikelley@microsoft.com>
Content-Type: text/plain
X-ClientProxiedBy: MW2PR2101CA0020.namprd21.prod.outlook.com
 (2603:10b6:302:1::33) To DM6PR21MB1370.namprd21.prod.outlook.com
 (2603:10b6:5:16b::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b53f87e5-7e92-4268-ba56-08da2c59fea0
X-MS-TrafficTypeDiagnostic: DM6PR21MB1180:EE_
X-LD-Processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR21MB11804512435C9597ACAE9FA5D7C19@DM6PR21MB1180.namprd21.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Zq4TsfllzaIWCrUOLCcwScJduGamnW9zCM3iWb0s2bZiWPihXtBHCSiWO7FIPGV2NklAO+V0T+zEXv2Pt5KwfXh2kNyLnilCrZwPtZw9mzwXHKmbdzX3cLkFf1rLgnySb6GKmvn0cx4McGnRY6Cj3Y6IPDPeUbI9RAZWHbsPOUbV35sDQBYXNcL4fm+MfNgPy+jo1MEQloirVirFrezKTburAEpobmbj7Hi5v/GvWFuLR+/gnNdQOol7PSNp/piAb8yUd9lrIjJdGHlYJIgRV5n7jXAqvP+VjG1K2yW+pKDGZNRYgY2ORvemAOxBouZ/Lu7zo5kxOBIxcIyGO4X0YDAgFJ6pLzybaqKt8t+NYCdBhTljKzaARqN9RtBpnwx8xonRuKjLsWcIZTMDcMRMGRDMX9IF/rnfp89t1XbKIFhCHTUYz1OGg6Oy8+Yl2oI5ikfte3QmwmBOuDq33S8FUqzsMInXTlBF6FpOlEZXkQueH/x0/QpvcMORTTyH3SzSbsPCF09DPmAFq3GumSuNJkYVB24pwM8XhVDySa3P80EiAZoDbC+d/0ZMToOVjd+HxMW6S+nd6hN6D3Htx64kbFVAAJIc4llpqteo2+DwrOlDfCB1RyF6NUROmWZjAT057ZeXFduGYSEYxlwdh1b/aFeFW0ow3OyjLq5soyIQ17BS6LWx/eEmRPS+GARNHg5xgS440aPcFlByrt00bJY9Sofoh2tDNeOEetU4F5TU7Qhnj97VgscQezpz7os6/eqvvG1pOaGbuwWLCsyiz91jA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR21MB1370.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(82950400001)(7416002)(10290500003)(66946007)(6486002)(66556008)(66476007)(2616005)(107886003)(6512007)(26005)(921005)(5660300002)(6506007)(83380400001)(508600001)(82960400001)(86362001)(6666004)(316002)(8936002)(38350700002)(38100700002)(186003)(52116002)(4326008)(36756003)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m2xUdC9Y2FCkZAsF0GqyQMSUK5RZezP756VMHCDmJyKcjKg4RiYFiRpKW2pI?=
 =?us-ascii?Q?YVw41uV4rIVLDqiKCzTcWhak0AeBYr+HOnBT+UDty3UI+3V3DbmZD3U37Rzt?=
 =?us-ascii?Q?XNz6OfN3mTNW5j/MMBtBT8vMOCZ8LiGYApfbS4VXCFcLrmRy4HmQLVD/arOE?=
 =?us-ascii?Q?mpjxHEzd08RfbsmYJYg9mabFc6mso/2D/y729xKHH6UlHBlmMyu+ibFpZszp?=
 =?us-ascii?Q?bn7HlH7VjmjBmm78ko93OWs4PretiT4LBVZNCCGeS5v/SyUgmoI68rdTd1qA?=
 =?us-ascii?Q?fh2m/t3vKh4+pz488VNlqgts0hedESuxF/vaixe/1E0PgbSQVXEwPqCZdFFL?=
 =?us-ascii?Q?XMGyVEgcIXHq1fB6tbw5SkcB98utvNX7166afANyZ/Akl6SmVwjfdKhHax+4?=
 =?us-ascii?Q?E/tchIw8mqTXRZ7Mow4khAWsvq1/OGibRa+af+qRz44DOOL5XBEzAzMpgv0H?=
 =?us-ascii?Q?mU/iZTirDU/IRw8bQzLFel1/UrcwnJsLsnJVavYOjtWsHX0VKoCokppLYGhl?=
 =?us-ascii?Q?v/2eue/KF3h4lkM5pUdK6d9ozcVm/T+VfhzB8RITqLZO2sdvjLMZwHBw0dGv?=
 =?us-ascii?Q?3X0kSlgr9mgWdwa0UDnuJd4f4AcCi/ZfbOPLiBX3WLoVh/upJfxR/yCTy2K8?=
 =?us-ascii?Q?pGNPgeJdf9oq4AvOIWOpXv5KTaW7OkfEYBAO6K9sPHoZEMHoGWTg9cSUBC0n?=
 =?us-ascii?Q?vLlwmvxectwL8MrQtHaVxbhCG6y7GH6Rmn+fAuAYj6Nw8apkRfDpiFSk4pQg?=
 =?us-ascii?Q?pJbVhlxqRwjpYDAFVqB6WST6XxGhyr5VJ/JyW6elOTWRJxOb4hQTUkNaSoyn?=
 =?us-ascii?Q?O4XEluHDr6YSAsrNZczl/kWtRzcsrY3Be3gH5544XhVYBr1FsQuUNZoSmKvm?=
 =?us-ascii?Q?aok2GBxr94klaNFIMiwZEbFHo+cfmDItuLc7b0ByUgrCS3eRhahgHyoBl2sA?=
 =?us-ascii?Q?QUGV7vwe6P8WHTgdMvzyiiA+DNd0tP5iVeA36uIrB5GBZ40ezTNXf77EhQ7t?=
 =?us-ascii?Q?3eouJ6dsFS+26BcOQJbIocGWJdQD6RdnX0YxjuIDRcKfL+aDtseyrSydcjTE?=
 =?us-ascii?Q?uDRPQDF/a2qG6THNmwH2z5nFnqbmD1zJsWjf+V5hagmndJpSBB6mqvK5sVMN?=
 =?us-ascii?Q?/o9IsttB8R4OF9gvJ5wztO2bXV3jhLiBVi6Beu1vGL1T6mw0rXZPtvbGI4fP?=
 =?us-ascii?Q?VpdpVbXzCkbC2kkL0c7fqLi9XXKR8MhOdDdIlnbTbB6p3SkTAG+pexIaGnR3?=
 =?us-ascii?Q?m1SFQ7ilaESEJ06sTmlXCwhVMvkVQZi5UbXvFdWFo/HBdpVJBYYnuVRhMROF?=
 =?us-ascii?Q?vlAsF30ZMJNNsPMm6hCy3ST7ObblRvGgefpWH3UviYyRwmTeyvoI9QBmec4O?=
 =?us-ascii?Q?1EIqmRup5EnAgLtp37XbbBocmlj2lVqXzSVzjTbvd0M3vzL5LVV+nDDeMrR7?=
 =?us-ascii?Q?fPro31AYneq72HEYnt1rgJ1Y7OUfkLxjAuQ1OmsZQTXImce9Z1I0AFv+L0cP?=
 =?us-ascii?Q?i87qAYgtTDFMb2NeePUxzLS1xtCpU4LspC4nsJ2ybYcmZ6HEokZWVwvC6ndx?=
 =?us-ascii?Q?hjQDO1iDLzbZ6ALCixyty/HBg2LaAlDjNL/SvXoioR41xj8F2KMOD/GBP90D?=
 =?us-ascii?Q?lrvSIOWz3S9cFm7dKO209g/Ce24aip9G73R8pOfsCvH2Rt/jZK3Y/vUUM8Kf?=
 =?us-ascii?Q?/mgraPzei48s3JGUhmHw1NFVj+FMJrXS+2JGNAKLDyeYZawiEVJQBPmPJsf/?=
 =?us-ascii?Q?S92ItCYN/giLuA+JjLjbP4bJ41ASYUk=3D?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b53f87e5-7e92-4268-ba56-08da2c59fea0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR21MB1370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 16:37:06.3304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKc8XnBF7m9mKYfGGLlBkk18aJp+R0IjlU/tov84Ea9Ra4RBaBppFDTxJSItLnEwp3Rt3O+NRYbzitXUmPaq3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1180
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
Cc: mikelley@microsoft.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hyperv_fb driver has special case code for running on the first
released versions of Hyper-V: 2008 and 2008 R2/Windows 7.  These versions
are now out of support (except for extended security updates) and lack
support for performance features that are needed for effective production
usage of Linux guests.

The negotiation of the VMbus protocol versions required by these old
Hyper-V versions has been removed from the VMbus driver.  So now remove
the handling of these VMbus protocol versions from the hyperv_fb driver.

Signed-off-by: Michael Kelley <mikelley@microsoft.com>
---
 drivers/video/fbdev/hyperv_fb.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index c8e0ea2..7563d54 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -63,6 +63,7 @@
 #define MAX_VMBUS_PKT_SIZE 0x4000
 
 #define SYNTHVID_VERSION(major, minor) ((minor) << 16 | (major))
+/* Support for VERSION_WIN7 is removed. #define is retained for reference. */
 #define SYNTHVID_VERSION_WIN7 SYNTHVID_VERSION(3, 0)
 #define SYNTHVID_VERSION_WIN8 SYNTHVID_VERSION(3, 2)
 #define SYNTHVID_VERSION_WIN10 SYNTHVID_VERSION(3, 5)
@@ -70,13 +71,7 @@
 #define SYNTHVID_VER_GET_MAJOR(ver) (ver & 0x0000ffff)
 #define SYNTHVID_VER_GET_MINOR(ver) ((ver & 0xffff0000) >> 16)
 
-#define SYNTHVID_DEPTH_WIN7 16
 #define SYNTHVID_DEPTH_WIN8 32
-
-#define SYNTHVID_FB_SIZE_WIN7 (4 * 1024 * 1024)
-#define SYNTHVID_WIDTH_MAX_WIN7 1600
-#define SYNTHVID_HEIGHT_MAX_WIN7 1200
-
 #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
 
 #define PCI_VENDOR_ID_MICROSOFT 0x1414
@@ -644,12 +639,6 @@ static int synthvid_connect_vsp(struct hv_device *hdev)
 	case VERSION_WIN8:
 	case VERSION_WIN8_1:
 		ret = synthvid_negotiate_ver(hdev, SYNTHVID_VERSION_WIN8);
-		if (!ret)
-			break;
-		fallthrough;
-	case VERSION_WS2008:
-	case VERSION_WIN7:
-		ret = synthvid_negotiate_ver(hdev, SYNTHVID_VERSION_WIN7);
 		break;
 	default:
 		ret = synthvid_negotiate_ver(hdev, SYNTHVID_VERSION_WIN10);
@@ -661,11 +650,7 @@ static int synthvid_connect_vsp(struct hv_device *hdev)
 		goto error;
 	}
 
-	if (par->synthvid_version == SYNTHVID_VERSION_WIN7)
-		screen_depth = SYNTHVID_DEPTH_WIN7;
-	else
-		screen_depth = SYNTHVID_DEPTH_WIN8;
-
+	screen_depth = SYNTHVID_DEPTH_WIN8;
 	if (synthvid_ver_ge(par->synthvid_version, SYNTHVID_VERSION_WIN10)) {
 		ret = synthvid_get_supported_resolution(hdev);
 		if (ret)
@@ -933,9 +918,7 @@ static void hvfb_get_option(struct fb_info *info)
 	    (synthvid_ver_ge(par->synthvid_version, SYNTHVID_VERSION_WIN10) &&
 	    (x * y * screen_depth / 8 > screen_fb_size)) ||
 	    (par->synthvid_version == SYNTHVID_VERSION_WIN8 &&
-	     x * y * screen_depth / 8 > SYNTHVID_FB_SIZE_WIN8) ||
-	    (par->synthvid_version == SYNTHVID_VERSION_WIN7 &&
-	     (x > SYNTHVID_WIDTH_MAX_WIN7 || y > SYNTHVID_HEIGHT_MAX_WIN7))) {
+	     x * y * screen_depth / 8 > SYNTHVID_FB_SIZE_WIN8)) {
 		pr_err("Screen resolution option is out of range: skipped\n");
 		return;
 	}
-- 
1.8.3.1

