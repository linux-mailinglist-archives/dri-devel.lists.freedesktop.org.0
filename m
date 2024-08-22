Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B16395AE0E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0357910E77D;
	Thu, 22 Aug 2024 06:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="BzE0cB7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2067.outbound.protection.outlook.com [40.107.215.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D812910E77C;
 Thu, 22 Aug 2024 06:52:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0WmE4GtDfYkepZXcElcDX5LB/AcWS9ln4nP5D3iorvWidxS+yGGey5tQVX7cI/D/++GyP1OXhi+D5shFHAoHjSsJ5ZIdluEMBo0jY+a0LGITGW87ZhUVDL9OXtu0Z45aGjpK4h5Fe7i6xoX+dwwXvKt9qli69SLuLwe65rCvFgd+jjNCL9sjwEGGnsxzCoZcYsSHJlbrhV9RIaEB0m2OuYEUy0QgTD8009yJE6VXNq0vw2tnnNDY8BQOrj2z1Qp/NOPoQmGTH8tHcxnJ/XCBlly9xVO/FM5es3Pbf6ghZ7lMsYJdikUJ97h9Qw6LuDcig0KEwJhV2rVvexNbNS1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfXf3Thi8Fu04hOU5bFN2rxfQbx13dEfeKLe0Ovid+0=;
 b=STECH2s4qbzCckGEX6u9D7xWe7qNJny1l5sdyReJtfw4iSq0ZMhkDDLm/yHiy3NeLONZAa6XUOvbDMSe74pu0LpPQG9kq/4vVP+ODBo/9jd3PJjn8QdMkJjj7XhbNDWWn2cqX3PoABiboikI7EhXZbG5EHqjUivUjvvfk6AGleThbs3cZDkcz2BrkqP53rd7Mj3khDqqiTRco63TyylBaij16sdE9ghMWLH3SII3VJcCwJmN1PW4SYfH/SINCoZSnNPCZqJ7Qy12SCeph5350rEs1qg8xMHgAmgDBLgu03OaEmT6yn+xlmlAFUmPV1fZinlr57m8kvvMnrbt1g5nIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfXf3Thi8Fu04hOU5bFN2rxfQbx13dEfeKLe0Ovid+0=;
 b=BzE0cB7BuuRdnZHtzfuHi/YEOjFvRZl7FosmiSqEqHUG99QH6QrfpWfyHLB/wiwToXhA58BMQd1yGc+M79FK9rW4Y/HPNeWDLrfe9gag2HOa9KAy9hWQXojuVfG6tUClws0ypE51wZ0oFmeoSxXGFXqR9ORJNRapMPIRn5bI7o9G5kcBTiq4BSwXIEz9JvfNlCug/MThNJuXCN6HIGOxdMPcqXvLhdcvhW8AfhwNDnejO8jZBPQBBIBSi18pVmCZusNpF6UsEugK7vTaT7Fdu9UoMi3oFNwJ+zqKU3HzCZ9mcFMuoK6IfbIRrrG9F6f5rTA2bFQGfIjXxY5wjso/Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB5417.apcprd06.prod.outlook.com (2603:1096:400:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:52:36 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:52:36 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 5/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:51:36 +0800
Message-Id: <20240822065137.1331172-6-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822065137.1331172-1-yujiaoliang@vivo.com>
References: <20240822065137.1331172-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0168.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::24) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TYZPR06MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dfcb33d-8363-478c-b8ef-08dcc2770173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VEpLO+K9xyx/Dloy5UdyRUQtSo0Axbo2mYU81RRatmFVKHrk3jQmiNLDyyNP?=
 =?us-ascii?Q?r+HvVvpekJRf8Qo3Xl5OG/qKFCtiD/OuVLMdgM6LiGn598JrZyF3zydCXDmF?=
 =?us-ascii?Q?SNmgeQKGz9UOvLv5egF0A9Mota0+qBp84IEkjN5geZERwvjRuCSFRBkZxi3Y?=
 =?us-ascii?Q?fMYq0oGhJb7UwpAWhDzPw3FjNLQzZcXVdpl+eSz6wI6Rq/doUN6F08wHDvRQ?=
 =?us-ascii?Q?hLZbJDchzdlo9TeCdOQDRfqvEQ6SS9i8PnEH+UAtYwX9VypTjpAUQqnogT7e?=
 =?us-ascii?Q?hiDyGzDWggQLqiHk3GZ771MLoq92jESoxyRS0PM/j+PNKL1MlrNUWAUB0EOs?=
 =?us-ascii?Q?egBCArO8ARMgiBdpNq1iLZe9QIG8IFVYlrdoREExrdxcHPPoz1qivKKm+5U6?=
 =?us-ascii?Q?e5SCBYwvGd6/4746ocwrE3ZCnSKM3bhlc4yY85+Mzt3XGNvdIG8fJlyzV7FV?=
 =?us-ascii?Q?bCw48+FImYR5MfWpRMLPIsOUV3plFGT7bNScl0lVuYrnulqlEtylqAF625Y/?=
 =?us-ascii?Q?/PSozyT/hCutarnsK/KyqS/ervWJKNvgYXy96IEgZ07PgAsO6tbOpIFdXonP?=
 =?us-ascii?Q?HrGFipGwvfB4FqD6yc7q2pToVCPlZLmnG6xanZt0WQfoB8XuG1xpFi0NYp95?=
 =?us-ascii?Q?gVvgVZwaT8BDLCH3HMTZMhTvIYweCJYME7S8HAQQ1HJ/eDQjqeQ/vz2vM1ec?=
 =?us-ascii?Q?U1cZ8Oq/xh9xD3rUxaDleaba5GcpcOJ4XHQEEiVXj6T8HHDldoFyqgfoMJJ3?=
 =?us-ascii?Q?lC2takZwBP1epdD3EHJQ8VEZgouEQUzqvD3R5y4x3cbGTMUoDDaLWdPk/tO2?=
 =?us-ascii?Q?IPYzVx4xDphaOE3vZYhwdf+Mu6RZO5yaNEU8frhzMc+NL8+xXcRxvRL+VhMP?=
 =?us-ascii?Q?F5Xud1D6ac2AkJw9CvKKG7QVutYnIovjcuawjZai1M9qZ045x8nJ/LOpT/Vf?=
 =?us-ascii?Q?jsWDEsjQjeVgc7HXKSfs2jvpcxqdmeqSy8qsOuljhUaEEhP0YiMlJ3vKdcV5?=
 =?us-ascii?Q?7woHMqQyr3m+Rt1hzBmp9Acj59OKhTjz0/igdMbUrjkofxI7vZn5MbmwA21x?=
 =?us-ascii?Q?cyq6y5s4NO9GuUYQqr7AVE1kpwVdhz1SQf/zfZYjOp6whCUIWtYIbqZCE6sM?=
 =?us-ascii?Q?dacvuqUA6sqqY7dCLGXtMvIcRfDrRD268Ezrk0jPiSSKYv0WIklXoskyKp/Q?=
 =?us-ascii?Q?f5Zkcjn3XIrcUpOeVP3u8FAEqlxxvoGQ4gVCjgJFCsfPR1urLtZP3vpNFjQe?=
 =?us-ascii?Q?XH+rl/xEf3CVcbUt+/OrILazsykFCjZOz2jtAu5nB8D+CcBOgBSF6bo86apA?=
 =?us-ascii?Q?QQ56LTkJRjSbm8naZBdV1tUQ4GiJDVCafBe7fbtRaENCvJcgopTxeXZFrgt3?=
 =?us-ascii?Q?kSLBuv2N4kHX1dii8VvHxJyC7Q2jTd9K+6TWSE2Esy+YN+ZnH2pe8nNp/32L?=
 =?us-ascii?Q?LVsyDQrBuuc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iwQOyJHx3aOG9jwvcFRnL18HKW8rcaVuoO6yDkxQJ2WgY8P60IWuKJtcIykZ?=
 =?us-ascii?Q?nZV5cqBxp9g9sF5Q6RP9f73ns7AAqxmRstjVyK0Tqgh5s+6mJY6878ixE3ZI?=
 =?us-ascii?Q?K90PCMc6h7S2PkUFVSPj3Wn6YSNaFLH8ogxPKi8XmT5kotOaQ8GI2w3yu5L9?=
 =?us-ascii?Q?DqGE+rrdWKOpEqWTCOAHM4VwNTtB8He7gB6T17+ZYvGSHlA1er1DpUW/o45g?=
 =?us-ascii?Q?Hc88DnG4qBRZvzrHAHdklUBMDp/XoJSoEIqS+dXVwC9n0PiRJVNwjsh54el9?=
 =?us-ascii?Q?u1SfQNTxOI0VXHEtr/Vi/22SKBCb+cJg0AVgJd7MiFhNFBqe8Je1RZoQk1dE?=
 =?us-ascii?Q?lBkkEYZ3PjgvlKZrJ4zpHbLo/GRjdj41yN4cu3X4bETMZage5b+wbidQcmkl?=
 =?us-ascii?Q?/F2hi+0B1tEUoWujrF37q6KjVYkaKLVnRVp9qganVmFrfo41EvzuS+sZE+gP?=
 =?us-ascii?Q?/FWcQRMnjKTwLRko9Rbh+dVBTZJce6nMj8W1fcwPlQQ8viXyDYyc/chnT0Hv?=
 =?us-ascii?Q?gJ5a48j+X5kua1O3ycSZ8LKIBgpfx7ANL3ImUIz1VoqwSiGhsMbwvCINEL7g?=
 =?us-ascii?Q?dDBzzly3hqob2MFphGyETa97Zw4gEjjx7uyhMqDZJCS46GmcpioUaeKy6vSo?=
 =?us-ascii?Q?zI6xCKtv4xIg+dmK9SJswQHx3hz/vmPujMxDoas9Mao+IzIQ36XG0Cfsqpy0?=
 =?us-ascii?Q?ESKmvLkC4hhBLOo5yBVaBPAfEbT8baajzXUswjpAlI6O4aNz0sYW9yX/OHsQ?=
 =?us-ascii?Q?9kGxVmLpwO0xWaxL4ehWTKn+bm+lFHtpZIZHI9rs0MgSSC+8OTh77FX3qg4K?=
 =?us-ascii?Q?lyPoy7Ny4TDLQWAjjvh+4A8UOiU8cYhFSkXhSdOWmSrm8EQ7Yo7jSFjhywvR?=
 =?us-ascii?Q?uHl7QuQChlq8qK8UtVCkRwL8aFt8Pudiu/2JS4sf58bAe5H97SIpz72tPxdz?=
 =?us-ascii?Q?DRelcjMzdL9zZoN58XR4PbjXMuygLmeoMYRg4Bj0whNK7v3F2VDA1rBdxvLa?=
 =?us-ascii?Q?V2zOhTeYWkMjEKez0i5AE28ai3PJ1ZWlBCAseRdCVIBDRNCYCEv4dTMZ5WE2?=
 =?us-ascii?Q?1s6CnySVNH5M4djmFB3XliHK5RoRQeq85WJTz5ci0nyc4rWUgcUnuR/zS8Mi?=
 =?us-ascii?Q?N6LjoNLUJZw+6dSLsSvrGY8HxPDrdyY+WX+OZqwpS1v4nh3WMLaID+6LJi74?=
 =?us-ascii?Q?+LT+RZafX/6RufaMUtZ7Db22edxalpV9kDPJm/PfwALiEmjZp3cq2QN5XuqN?=
 =?us-ascii?Q?RGaauZgVTHIDaQNgaEZUUDKSUWJk4UnftNvo+W0oLZUBkM6ggrna4CU1x9z4?=
 =?us-ascii?Q?Q6MJGSBszNRDTo563ThXX5Pws4AZNA5JeDNnDun28DQrJX83kOLEvUU66U7A?=
 =?us-ascii?Q?En/QRA2rcJMdn9jq58Ng66+n0MaBgpHkJydNw0UugfZd7Zfc/c2uX2UjFRFj?=
 =?us-ascii?Q?yQCmN/iDTELw38nJGYwutmcUvfY9Kx8O+wdziY3ip6HdfHcglrCVMOSvk9ji?=
 =?us-ascii?Q?IEgz/cf4eBcIuffsi8b5G2US+A8pi3XET8s4x6mZ8jMjj6IkodLZIo1476FU?=
 =?us-ascii?Q?5OKGLrBM/DgW3x0/XSjBYLd27KkIyn5txrTABtvG?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfcb33d-8363-478c-b8ef-08dcc2770173
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:52:36.2637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SIJHlCOAJyQG/AnJravbXKWo9LGwJKtr/xHxoEntN1StLeyIrN4oHAPstQvhlQ+8ZG7PX9zUwR/2WwYuNDFeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5417
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

Use the macro instead of ternary operator.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
index 9eccdb38bed4..d5fa6e79fdff 100644
--- a/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
+++ b/drivers/gpu/drm/amd/display/dc/spl/dc_spl.c
@@ -17,9 +17,9 @@ static struct spl_rect intersect_rec(const struct spl_rect *r0, const struct spl
 	int r0_y_end = r0->y + r0->height;
 	int r1_y_end = r1->y + r1->height;
 
-	rec.x = r0->x > r1->x ? r0->x : r1->x;
+	rec.x = max(r0->x, r1->x);
 	rec.width = r0_x_end > r1_x_end ? r1_x_end - rec.x : r0_x_end - rec.x;
-	rec.y = r0->y > r1->y ? r0->y : r1->y;
+	rec.y = max(r0->y, r1->y);
 	rec.height = r0_y_end > r1_y_end ? r1_y_end - rec.y : r0_y_end - rec.y;
 
 	/* in case that there is no intersection */
-- 
2.34.1

