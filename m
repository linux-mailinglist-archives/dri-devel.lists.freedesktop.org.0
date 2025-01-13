Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD0A1021F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB3610E878;
	Tue, 14 Jan 2025 08:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="bpnelLRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2093.outbound.protection.outlook.com [40.107.223.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD6410E6DF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:28:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd9mOUNjn7xulFbPh1jvwvVvVmGSlmEAS2XXiCdASVVT4VuU5lgs42/9N+aoA1wUVqaVPTFO6GOL5ZTjPTaTrbiWfVPj6Nw1/Rrl8kdbB5p8ehxeWVqLfgOzWrVO5WCagOsqvSnvXFOyKoZMWTmDhSbjhQWNLEJT1Ge+lfFW9idXXU1N5y3TVTuL/07CSCw88NneDBXNvi8qLmn7dRkburiNnNXn5NuzpuG4M6KIssFIYggO0HSqSIv/ZEwNp/Kh8KYCxJ3dCf5qiDTRygHkcAYi4ZsTncb+EnA25ZgJBaxxWzFwXczsGoy12raOqOe3oDeBwyGC01eb3jIDlP46kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8oV6gs0Gn9i42Ohy+HtPGWy/FPOVrO/IdVHIU1gJM8=;
 b=X2mJnb2+Yppeu07u+K3bNTEdDQQBOvOpxnbqRj5AlhgjB7yMz85DbGL/luoSmtzdLZ8HkNjd15RDaQLNdwso32MxWYO3QQ/1FvKH4xcEHeZrh6TBuaCzaPK3UbQ+IvYD8gz97bQmTW3wHEZ1FnF6UVCWzjsv5bUqPdrNndtIxLDoRVLD/DwM0Znbd9vaDHLynfpVaEo4ohP77YxY6r3iC5vH3bWvVytGwa8ZRx/4zT2uN/xJEXK83d06KbSk64MF63bpwn4l50cUG/qWaUnJFH0J9X0Q80UjrADZoA/5sKKpS8YpKPetv1ebUKvDvvtCgrZEu5TDIfto6d9IrCqIKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8oV6gs0Gn9i42Ohy+HtPGWy/FPOVrO/IdVHIU1gJM8=;
 b=bpnelLRdEAti5tkKp/LC0ASRi9/fm3HIzWdvsVJhY6rf6vyFMi7JFr8xQhOGXTIuLARJTTUmUoIzFcjZJiwamJlHy66cUqqNn2Gwv4YLQkvhGDQf0T1oETEoCB9opQe0CXJaxz0fxGxqMtrm7usw/PdlaNGIWZsoXNjEH6+Wnio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by CH3PR08MB9065.namprd08.prod.outlook.com (2603:10b6:610:1c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:28:12 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 15:28:12 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/ssd130x: ensure ssd132x pitch is correct
Date: Mon, 13 Jan 2025 15:27:51 +0000
Message-ID: <20250113152752.3369731-4-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
References: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::20) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|CH3PR08MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d6f105-b322-483e-2f20-08dd33e6e444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KQpB/zFhpH8hcSw+qvJ2yC3B3sxaNpJu4CAdK1xQA85ZHkYx4dyFMH8d0+HP?=
 =?us-ascii?Q?K6mu3Qa7NEsXnnC8F6zroOctMq84VB3rbRD+P+vmYIB/5PpUYXisYuGWebmx?=
 =?us-ascii?Q?oLGhMyM8onOXAl8kU/Ifgm6OLHKpIvfFzkfWVk+GC01LSsI0fuEs5Feup5Pu?=
 =?us-ascii?Q?VNgZH+BgGnCGE8TWyrgdW3zKiUb3mT+WEAnkHC5me/9zxTYFKVH9j1EUOTxy?=
 =?us-ascii?Q?gDErvhu8DA7aMVhuhXWYgWSYO8stK0B/jEeNnsOEaNQxVnWYB1QuSUTEJZW1?=
 =?us-ascii?Q?8VEViGHsLcEiAfVrccA+PtOlKINhNlvtYmBc4X5uB9+Deq0XMdcR2AeC6lmE?=
 =?us-ascii?Q?avQefGD9Kr+yDNqlG7ZeKGzOpEnwTpok7nQ/BjwWowQQYanC8t6fpq2VMnwv?=
 =?us-ascii?Q?Aey522ZoCzr0UaM2rGbYlt/ZzJ7rtGWES1c/vnux1vq4XQpl+w5iZaQnkXHg?=
 =?us-ascii?Q?MQwNs3lLRK1/V3fvc98UKBVps2uGwYqGm9ashR5PT1fi5Yt8PUniT7nZA9H1?=
 =?us-ascii?Q?QSweXwAh/+dKN2LgwpwNnJPkeB6Pmtdj8oXXoUcLpoE5FN6Lo8tT847TDXZg?=
 =?us-ascii?Q?lMb/IfyVuJEVflcnCCtySnA6a895IMi2nybYGhNPfmPtTrE2SKyjbsqMMrLr?=
 =?us-ascii?Q?VEEAFd+mJhOcXkVimLzRSqJnvLp/UNmIjxrV/lNm/7qmQ+VpRSsYKMjz+xeR?=
 =?us-ascii?Q?MTpXKHvTvMZLfr6ztv/SbBp1hG3xxdhRQ7F7Kr15D3cWECCmdJ7aObN2ahnu?=
 =?us-ascii?Q?xrNF89cf9Y09pSc8SYcLGO/D7YCuG4BYuaREcN1TbB2G1SzQLSGg+iR9vpU1?=
 =?us-ascii?Q?X1ZKYVUuHdbW6TDpOdW4L1Sneml0l3C0l5e+5lQfA6k/cl8WhJMdEfXFzm8S?=
 =?us-ascii?Q?9iWBQB/Eg3zOtvF4dO9NVgHvwgPNRyRSc1QskZxOejakRIbyZo/EUoeBTJhC?=
 =?us-ascii?Q?tFKVOS2WCOEdfiXJlqgq0QYlQVB4emIWj9OtTa5puKN3LKo1BRZ5numUNGvh?=
 =?us-ascii?Q?ALyQDoEar2LtkHMgq1A3hDsaVE1//Gp8XGoD7h/3gcpSxS8B9p4eZB5eCLYo?=
 =?us-ascii?Q?X6KTXuokidHbLI92EdKrAuh2g8PvdvXBsjhFkWBoV4f/nCPusN75hL61/biL?=
 =?us-ascii?Q?dGiFWVYjjLxvb8gdf3LYpS4qu2x3zwo46AjoNNyPEbHuTOu4LyhdhyXYlMWQ?=
 =?us-ascii?Q?qb79wCCgirTX//Q9oGFXE3Ajwi0H6BdGs1CpbGTAMWgMgsyDpN7lkLTKvO7s?=
 =?us-ascii?Q?BvbUKGxXNtWcFIcE++9bHxO4i7eNmJYpLISGzGaPcwRmo7zfK5V7fBz7/yVb?=
 =?us-ascii?Q?ulmyyqKbIjoQQP1RxZbjTdbQ1OBLCdGobTWGPf54G4ymPkJg+OQWbQtcDjaw?=
 =?us-ascii?Q?2y+XpnDVrcdxIxuI0/9u63eZN7ucwq3zQXp2aOoKPq0IUC3apXxY3/UOwSpR?=
 =?us-ascii?Q?cQKfs95eujn1NlZGZT4X8yv0YVKUGKX8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LcTXT3BPM76oGgVOUFRu+IV1sk0t6NN0h2Yl5urPPaJo8zTW6MpT1VJCw7Hq?=
 =?us-ascii?Q?YQCZfiEaaALtnEO6fk79CM0IBTyRE7DVOM/eLCl0poI5Lo3akEVRcGDjMVGE?=
 =?us-ascii?Q?h5Ugwv81uGNtOfB3GfgBcLZT3usapx73AyT7mtDHb5iC/2QjNMmKFLAVoDQF?=
 =?us-ascii?Q?gBq1yOgxlVDFOsKBvNAq23nKWvWJevEr53c6XNCyfuoCx1vm3bZea0+1k5Ga?=
 =?us-ascii?Q?RJrCGnNa6wmO2xCxlmdg69nhaX6xfxq49ew4xLb+GonmSwqiKu5Ehq3idyT0?=
 =?us-ascii?Q?cpTylruHmfjrU6CfI9+m+gzrqC1VSdWJJGvWaCeCw8gtusLrNftiAOPCBeji?=
 =?us-ascii?Q?OBBVdndgJgTYeQBJK8/rvcE+KyBMJPUR4SsE7uUHMtgmA3YxWfg4NiH1N1ba?=
 =?us-ascii?Q?Xi0Th75khSz55ZXSDlXzloFtFXdwBAyF+IfxX71SzQRsV5VgNQll6MSjqfNE?=
 =?us-ascii?Q?+nZFgdCSdG4z1j3wUi8WK9tuYw80Yjsw50t4LmHVY8BCJ1HFUvrQBLyMpERU?=
 =?us-ascii?Q?DscVmO9P5KK0FA7I5rYB/vR5/jCSCVsX4vvJLnp/UnAfNzpyVAnnckhRur9c?=
 =?us-ascii?Q?N9qjdoQDlLv2RtxBA93f0Pmh9nzCcMTXZmURStpcpZEHQH0xetTKPvZ3eCGI?=
 =?us-ascii?Q?85Baa6sM1FQSpo/9VahwzpE4QnmB9Rd4fWoQ3iifC3ISiP79VaIQX5oeQQIL?=
 =?us-ascii?Q?kxoEbm2T04EuFvEq2tJT3s//jwvH1y2OHCIphNBJ9W2Yl52AJhCl1ZShZoki?=
 =?us-ascii?Q?5ukwY8W9EKxYkkeq28q6HtfBk6DqGaCM5UKez6uu2nwxP7Zjn5SV7eShPOr2?=
 =?us-ascii?Q?GN91Z9uQFhaahub7AkQGJT8fMouYVwSq3nRH0Qlka8tOcoiIvPyqszBH0ebR?=
 =?us-ascii?Q?UP08lEUuUlh4CJqFSU4KvJ/egQwH6DfUX2VMcycsPoE/CgUTvJdS/ZY4Bv1w?=
 =?us-ascii?Q?nkdYugAJL1GNwBxiPuoKWFI/rP5YmN/Kzn2zP1ZGEuq+LHh6UJbexJAqPatd?=
 =?us-ascii?Q?zfRJ6uW4uJwWB3jdK4H49fmfz0Qf92Vlz+/VCzkthw2lRVx8TR9onnE7CvGP?=
 =?us-ascii?Q?eqKDCMeXmzb4p0A62yiJ7w1vUT+YvbSAHUHm2PJ3f3t6xBqzlKMoyueA6P25?=
 =?us-ascii?Q?dT9X0wRyIi1M3dHReRKudESgVJ3LhJr23pOZKHJBqtOLBGPxLDftN8UWlQvb?=
 =?us-ascii?Q?tpHQ9AZ5Hz8+RZAUwKaVeAQ0CxrA9tOKyIhGCl2r/64UIAXN0Ir5f6hLqalq?=
 =?us-ascii?Q?9KdWvFesqSJcT4DwcbsZ5khDH/Atr6+oJgf1ppKG0YhFik0124KCOhzjPNOG?=
 =?us-ascii?Q?vSV/SGBbY9OpZnkr7eYsuI0xRbm4svsXpKykxLfCS/3NO7+MErQQi91Dj3C0?=
 =?us-ascii?Q?pkijpCSkbrbRLT7D7dmFV/zR07BlhypFH5qykz17Vh7qLmbWQyu/IvGHQM/y?=
 =?us-ascii?Q?ae3i19uV5/pgtiOnpjbMKWIQc0+JSuYYa99c5vYdQ2z6qmNbaj0XdUEb7ink?=
 =?us-ascii?Q?Y6k6RYexxO+14ieoOyLUZayOw5fBKfFdgh0Fi5fr1dBt2M6sGAvL71ygWiDA?=
 =?us-ascii?Q?zFzZ5G0nDOq2mKeoTkmO7Almtga00wASN0QpmRR04Dkq9gncgHCmOJAOdFWX?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d6f105-b322-483e-2f20-08dd33e6e444
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:28:12.4532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOMvMiF+T9FzPRWcd64kILYGzRUhU+QQSnJepwFlx6GuhDanUH4dwbg8KTxVr0vWd1xXCyn/zVjrM2riR3mXOnL2fCzAZ3ml/dqyTTR5tgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9065
X-Mailman-Approved-At: Tue, 14 Jan 2025 08:33:59 +0000
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

The bounding rectangle is adjusted to ensure it aligns to
SSD132X_SEGMENT_WIDTH, which may adjust the pitch.  Calcuate the pitch
after alighting the left and right edge.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 64f1123080996..38f31c3624062 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -1037,7 +1037,7 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
 				struct drm_format_conv_state *fmtcnv_state)
 {
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(fb->dev);
-	unsigned int dst_pitch = drm_rect_width(rect);
+	unsigned int dst_pitch;
 	struct iosys_map dst;
 	int ret = 0;
 
@@ -1046,6 +1046,8 @@ static int ssd132x_fb_blit_rect(struct drm_framebuffer *fb,
 	rect->x2 = min_t(unsigned int, round_up(rect->x2, SSD132X_SEGMENT_WIDTH),
 			 ssd130x->width);
 
+	dst_pitch = drm_rect_width(rect);
+
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
 		return ret;
-- 
2.47.1

