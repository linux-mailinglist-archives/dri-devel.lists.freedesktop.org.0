Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15BA48FEA1
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jan 2022 20:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360F910E2FB;
	Sun, 16 Jan 2022 19:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020025.outbound.protection.outlook.com [52.101.61.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E7510E2FB
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 19:19:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjlECkt6aBpApv7wgU+I2lvQ1pUYinZknTo3pOTjww6tDeZki7Kb+SRTg1y8ANgEx4IxE2YwHRqIXSvEvC1t4ZR/rSQV3Zg79NDvvst+c34k78mPNnGKonHJ5r+Y6XIVCyYLACsUlgeT/KftD7KxAo+17QzSJoPtuLvArdN2oN2Zmvt2KsSHbA5CL7Huj1QGN0FjDajqpqW++r50gIHcoDZ+/4zxvMWbTNeLZ681WqP2eW9A0Op6YsQV/e3M4BfPGLRlXR3BS8xOO+IWTdkJWWL7d/7qp6ohNvznTyUS9pcwArZhlS8ainHA+QwUjbT+58XDMSGIlKxEmjAmwMnWuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbFVsnYqOFA6Ccxb2fTotwfR84qmaaubbli1Y6SKQbY=;
 b=d6ajq3dlj81lwK6InAMdxjgTNeln/SV5P1IMSFhyXLVOuDdQFcVg7VcU9s/4gEK7Hu7ThYAEE/7rnJR73YcYDedsA2qBkgq42MVVxX3+TRwJ2fp0VoIuuN+Qq6jUwy01ykEzaGyt7Ra9gLezVPevZSvLz2lyxS5EvE2pW59KmIS4B7EHVr83D8NGcHFSISoZy+v8ovhTQlwhtHoDzcY99f7FyxQeWVklDmEM9qkzUUcBUW91/6Tt0wyft6mOe6kufnAbHGN58bJ5TJK/VBGKkYniMpp7mYwc9hFWIYP7ig5B8Vt0tWF0E/tiWJb43z4oYKVLQ62o86Z7+ZOzQEPmuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbFVsnYqOFA6Ccxb2fTotwfR84qmaaubbli1Y6SKQbY=;
 b=fcmDi+pj8lzABbiDu0Je8jAygHIskmh6fLSJAZu/ILY6mlTiDwqryKML8l9L97sH7FwJhX1dBOklY8RGFFz+XE1/Jv/7CuQ4OV/iDMlZ2ayLG10zG8tonmRXjL4ihCtQ1cKB1334Oy+rEFOs0Q1pHbz/vC1YjEH0K+gToWtc0yY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
Received: from DM6PR21MB1514.namprd21.prod.outlook.com (2603:10b6:5:22d::11)
 by MW2PR2101MB1787.namprd21.prod.outlook.com (2603:10b6:302:8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.2; Sun, 16 Jan
 2022 19:18:59 +0000
Received: from DM6PR21MB1514.namprd21.prod.outlook.com
 ([fe80::100f:fc03:7d7b:c35a]) by DM6PR21MB1514.namprd21.prod.outlook.com
 ([fe80::100f:fc03:7d7b:c35a%6]) with mapi id 15.20.4930.000; Sun, 16 Jan 2022
 19:18:59 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, weh@microsoft.com, decui@microsoft.com,
 drawat.floss@gmail.com, hhei@redhat.com, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] video: hyperv_fb: Fix validation of screen resolution
Date: Sun, 16 Jan 2022 11:18:31 -0800
Message-Id: <1642360711-2335-1-git-send-email-mikelley@microsoft.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: CO2PR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:104:3::19) To DM6PR21MB1514.namprd21.prod.outlook.com
 (2603:10b6:5:22d::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 366f5643-6cce-453b-b986-08d9d9250c3d
X-MS-TrafficTypeDiagnostic: MW2PR2101MB1787:EE_
X-LD-Processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS: <MW2PR2101MB1787D5D923C41AC47E20B44FD7569@MW2PR2101MB1787.namprd21.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uSk2u1pFHmyKauQIJC0v3nEmp97RosFM5AQWmon9nb9yvK7LjvYcSX0Q2biYIpb8dxUE0lWQYVFP02BkwfL6h65ku197+6bgKURNfJViQSk5CPfCYbBogUI3z6ip/hYl2BmdmV9ypO0b9T6EYaL7MgvtCXsMRSL2h/kM/5SYG03wCEnGsBaNiBIh4bIDLgubfq3lOYwvavUaprljgs/KXGw1EW2Wk1OFq9hbBf2xq5nL7bnW7BhfK69I4+esDKzQ3QxLUZSR7KM4H8YngW3xsbC5iWcicGhCzFD9lEEvgv2j883pdxklLNtkILOSXepZ9zw357FYlN3v84TRm+6/gTEJIs1HUdx9Ky/sdkxa6Bqy33HstofX9BZysX8t22MaBPnYUiPMlMmyIdosmHq+Ph8iRV5+bY7piEznhQUW9D1xeJlKxk7Eh2XzE7VGG1x+DmPcaLYYqrrTobC7Nl7aNTCBoCAz9Lt0ScjIvixI59DrGSrjQ7SqQWmS3pQYnl6ZgzJLb1QCC8Hr9BfgO4h3g3bnZDSUCqTuXr4RWnpkxWzukF7uQ8SxMVrfybCSTI0RGM0dUaZEMSP6VNtSuNlF3J+nRIjeTvqoSCxhDl2oFWVpbV999Gaj+Iig1AgzFTiBVpUpQEYznutg45YvWc4X3i5uDSThd5mymnOHlIErAlhFOd3eLitmhfVo+fuTWj/ap2c0G5ENV2cFm1Sd5ZeJ9x4qALtOaNw6EZBE+0X9nYWftEnRQazVhvLLRTJsi1Yklm/n64CPTU3wUUB88fq3xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR21MB1514.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(5660300002)(26005)(186003)(82960400001)(82950400001)(36756003)(6512007)(107886003)(2616005)(8676002)(8936002)(6666004)(4326008)(38100700002)(2906002)(52116002)(6486002)(66946007)(66476007)(86362001)(66556008)(6506007)(38350700002)(316002)(508600001)(10290500003)(921005)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XCu/X5HkYE31DSmNmdUUYgTt9zoGcol+gyDE6Ke1lF0w98DVLzuAw+yqDPQH?=
 =?us-ascii?Q?qn/+XMBHKLk4FgfCd+Z4zzCQrh5hkgOI1uI+Vs4yX1JQlJAIxZQFNUfluHHo?=
 =?us-ascii?Q?rugVhvD4cJS/AAxZ7V+ClwUMO7/7TJWJSoukbH+tkASPidRxDONHHg+2Gd5e?=
 =?us-ascii?Q?1lNMfngdgPr1jJT6vZfDkmP0KTvOj1ojiR2E1Q5rrTxp5jfANPlIspC20ff3?=
 =?us-ascii?Q?vbviuJBIGBOvG/aDsVimZOejWA08y8stZbP/M/KU7sPefXYcIuV9/+5v1N2j?=
 =?us-ascii?Q?8kxY1tP1VuiIeY1NMKdFVV+8VUdrKEUHBEjwksgWtRrr6uFyWIpI7c8s2Pl8?=
 =?us-ascii?Q?zFrVmJumS0Nfk8dI/WWpxn7z3KIPF+qN+V+bt4WVDMy+/kIkWwMh6yUIB5YG?=
 =?us-ascii?Q?iyYcSWx14gmYcFcd5+XUUFPa4ecqPODtla+F0OxmzrVm+Ur+fu/MxM+JL5y/?=
 =?us-ascii?Q?GJphngjw4FyIjookxJV2i+tbxT4KhBWzEinDtYMw33O9tyJ5jDM+xNO8CkoJ?=
 =?us-ascii?Q?89yJuyvWQn2v38zymbAzM+ZhSmGaMCnm1LphsDd2NZGE7lFYVZMop5/iKyP6?=
 =?us-ascii?Q?0U0qoVXJddgPoF8vz4R8079JQxrb5o0XyQa9+CFC5XAFTV/aa6D0h7bfbnyP?=
 =?us-ascii?Q?C1IIQwMhw7pNsk0rtM+uq3YNcYuq/xjNTcx5hMcJNAWCdXQcL508Um4UkKHz?=
 =?us-ascii?Q?vIpDtWRfSaMl83IOgnuQVOV41VeehzDwN890uPb1Ucv3UUSxhJz7ClIMp/Tg?=
 =?us-ascii?Q?ZpuFxSv9PWbv01fqM+bXwE8jAwzTN8vYjPKtfgGrmj97wtt02NZfzmP2GArn?=
 =?us-ascii?Q?0Nl/gd9q8BsSuzaJW+/DlIMB5NhPd+hTe0yTXXgXL8ZF0QSb8wP5SsIWIxeJ?=
 =?us-ascii?Q?24NLF0qj/dGFKDIs6k87QTj6O5xwNapBGcEgXA19fojnkk5nFepzxZHmai0W?=
 =?us-ascii?Q?askInJq4M6ZLNyAIBEgFeaKllPbnXb/9suSIGWSPBnfr2Zn0Xejovk32mlSC?=
 =?us-ascii?Q?6nPP5bDC7WTaUQlXgFfCSA78zbC7m2lzH7jVpHuDffscYa8MSOPUteHWkHfL?=
 =?us-ascii?Q?3uaWbTaLAdp7R9k/zpBzbZupC8iTguWDfIHNR4r2EmCbGmq0rhxqFCjnY307?=
 =?us-ascii?Q?sKDlUAnWl82OEixZ5Fplm8C44USnUG6jZjKK/EHq0gSisGS7H5CCLJUIg5Tx?=
 =?us-ascii?Q?Qv5k71uoCCS91Wu+unyk7Ui00/isXLCEHCYktTQbsXZOfAhhs1Qu84jWGCbC?=
 =?us-ascii?Q?eOoFhqzKp/Q81ZYH3GEFpxuik1QFx1+yK4wukWqkGhbjc+827H05tret1yRD?=
 =?us-ascii?Q?9u3NwH/mscdWCDOreczwi78+/rkC4XoPXz7uKBwuGlEYqyEZsPBjwMF+fIJ5?=
 =?us-ascii?Q?qSuLO3xAX92G+viAjVobGdXUvxyPtt/iGn0FkX6lRH+MRHaJ1YZyjtwhwPs1?=
 =?us-ascii?Q?fiSi1Fr4FkFBsfBspjrMfFTN/X8ToIzxuAsnyeoCIPuJKzjcwgvYRvD91UMx?=
 =?us-ascii?Q?uh9OFKbPh7z/NjRRufDmgDg6WBBlfGLLH78nP8Moolr2UecKsFT/q7loop4q?=
 =?us-ascii?Q?rrnmRf6VlpN6ee9O4g32E8GAvJ+d+7mbHuU7kAsRyM7BfxQOT7CAJDUKHjJT?=
 =?us-ascii?Q?P95S75amInA5n1VuHMLyZKw=3D?=
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366f5643-6cce-453b-b986-08d9d9250c3d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR21MB1514.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2022 19:18:59.3473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CV/Xs2Ud6KQ8YI1bkrprsrts0xlXy2kma3kYAxYqJPxYy0OEvQRDxYH9YBqUPohu8RjsVYFByJsZI/kQCZkKEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB1787
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

In the WIN10 version of the Synthetic Video protocol with Hyper-V,
Hyper-V reports a list of supported resolutions as part of the protocol
negotiation. The driver calculates the maximum width and height from
the list of resolutions, and uses those maximums to validate any screen
resolution specified in the video= option on the kernel boot line.

This method of validation is incorrect. For example, the list of
supported resolutions could contain 1600x1200 and 1920x1080, both of
which fit in an 8 Mbyte frame buffer.  But calculating the max width
and height yields 1920 and 1200, and 1920x1200 resolution does not fit
in an 8 Mbyte frame buffer.  Unfortunately, this resolution is accepted,
causing a kernel fault when the driver accesses memory outside the
frame buffer.

Instead, validate the specified screen resolution by calculating
its size, and comparing against the frame buffer size.  Delete the
code for calculating the max width and height from the list of
resolutions, since these max values have no use.  Also add the
frame buffer size to the info message to aid in understanding why
a resolution might be rejected.

Fixes: 67e7cdb4829d ("video: hyperv: hyperv_fb: Obtain screen resolution from Hyper-V host")
Signed-off-by: Michael Kelley <mikelley@microsoft.com>
---
 drivers/video/fbdev/hyperv_fb.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 23999df..c8e0ea2 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -287,8 +287,6 @@ struct hvfb_par {
 
 static uint screen_width = HVFB_WIDTH;
 static uint screen_height = HVFB_HEIGHT;
-static uint screen_width_max = HVFB_WIDTH;
-static uint screen_height_max = HVFB_HEIGHT;
 static uint screen_depth;
 static uint screen_fb_size;
 static uint dio_fb_size; /* FB size for deferred IO */
@@ -582,7 +580,6 @@ static int synthvid_get_supported_resolution(struct hv_device *hdev)
 	int ret = 0;
 	unsigned long t;
 	u8 index;
-	int i;
 
 	memset(msg, 0, sizeof(struct synthvid_msg));
 	msg->vid_hdr.type = SYNTHVID_RESOLUTION_REQUEST;
@@ -613,13 +610,6 @@ static int synthvid_get_supported_resolution(struct hv_device *hdev)
 		goto out;
 	}
 
-	for (i = 0; i < msg->resolution_resp.resolution_count; i++) {
-		screen_width_max = max_t(unsigned int, screen_width_max,
-		    msg->resolution_resp.supported_resolution[i].width);
-		screen_height_max = max_t(unsigned int, screen_height_max,
-		    msg->resolution_resp.supported_resolution[i].height);
-	}
-
 	screen_width =
 		msg->resolution_resp.supported_resolution[index].width;
 	screen_height =
@@ -941,7 +931,7 @@ static void hvfb_get_option(struct fb_info *info)
 
 	if (x < HVFB_WIDTH_MIN || y < HVFB_HEIGHT_MIN ||
 	    (synthvid_ver_ge(par->synthvid_version, SYNTHVID_VERSION_WIN10) &&
-	    (x > screen_width_max || y > screen_height_max)) ||
+	    (x * y * screen_depth / 8 > screen_fb_size)) ||
 	    (par->synthvid_version == SYNTHVID_VERSION_WIN8 &&
 	     x * y * screen_depth / 8 > SYNTHVID_FB_SIZE_WIN8) ||
 	    (par->synthvid_version == SYNTHVID_VERSION_WIN7 &&
@@ -1194,8 +1184,8 @@ static int hvfb_probe(struct hv_device *hdev,
 	}
 
 	hvfb_get_option(info);
-	pr_info("Screen resolution: %dx%d, Color depth: %d\n",
-		screen_width, screen_height, screen_depth);
+	pr_info("Screen resolution: %dx%d, Color depth: %d, Frame buffer size: %d\n",
+		screen_width, screen_height, screen_depth, screen_fb_size);
 
 	ret = hvfb_getmem(hdev, info);
 	if (ret) {
-- 
1.8.3.1

