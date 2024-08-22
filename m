Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D0895AD8D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FA510E748;
	Thu, 22 Aug 2024 06:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="gXOu0ClY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2040.outbound.protection.outlook.com [40.107.255.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674C210E748;
 Thu, 22 Aug 2024 06:32:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZuNP9y13tuy7cVxm97MY6jzqEAmflPSFKTk0t8s0eDjVwPGr92BqndjQV2o2v/kAycm/GaBEzZeK7ejavUobbZpbtiMAbzkIfNx6rJ6p9O9sZTBngsV9IJj7WiCwdPS40L4K2DRBKfIuB3JJkX27R+q4V4GW5BfQgc5uPYVlKE+ubWIYqjpgGi8z5EQ5YzcV8pGrwydLpXWY6RWnVSi5Z4k2ybgo4Z9BkT3hgxMyfwmXf7CtSt3ELUZ9ZyDy+wZhoBBnwn13fJ80F0+uDR0rs75D+VmBveiWP9vN0hdPygoJvM3rUy4RHW80buRU0UuoYN+tqkxSHFznd3lirg/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfXf3Thi8Fu04hOU5bFN2rxfQbx13dEfeKLe0Ovid+0=;
 b=qWNaH8XxfCvlIZoe0I2FGHfumtFmC+n+N7JfLAySaM1DDMEWX9njgYupYqI2AtZZvTrPQEbTvt9JLCfn0MayjMWWhRS8cDX+FbIBy4N7k+KKBNBo4vvNSLYxY2d/Biv8PjvcfyeDrIc0qMDoFcHXLL6M/imiRzKN+A47dqgcHfMsq+dnZcWwdpDueXj1nKWE3YqK2HI/XEembgA2AOmTrj/ug/45cq6pcdmqwogXZcUSevj++Sl5PmhMfOU3/4KoZrW2NRqKXajQZmtxIwVjUJjiSfMv1acxS74HVSyYKENkZfQd5FwTCZJGzI9zxLokthj0Q4UPsduSC9IFIeBHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WfXf3Thi8Fu04hOU5bFN2rxfQbx13dEfeKLe0Ovid+0=;
 b=gXOu0ClY7j4MIa5idbiUl+aKuR/IbCc/gTnC2rMJFwyPhNw2dp9wY1tDH3ncK9g70RCyI/ZJh6aiC22hQ9d1kf60HS5Cmqzim804Vo9z9Utbo+qoLdhrbSikWqpk+0S8+i0ijpQ459/5C0ZrA1td6dzin/XnHjpg9rojZuhD27DE9PgiS8Ob3eQfvzQYpjHEkTmMb8mOvJ65RziktuJ8tWlg2rjNzO6WXbc050Pt488a6b+b3W4xlytt21R4N1z3N5yxLxPw4SlbjLFLsWtN3YQPI88UFTirLpESK+Li7f+FJFfd+MaellzJS0J/c19BRpQ9nYrUMr8bK2YD+CGQXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by JH0PR06MB6344.apcprd06.prod.outlook.com (2603:1096:990:17::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:32:41 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:32:41 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Samson Tam <Samson.Tam@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 5/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:29:31 +0800
Message-Id: <20240822062947.1318340-6-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822062947.1318340-1-yujiaoliang@vivo.com>
References: <20240822062947.1318340-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|JH0PR06MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a5c5b8-49bd-4c96-d2a2-08dcc274396f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z3lIDAgZd1kLUOil1pvbHA558VzVN13Euv+RtTRzaulPc8f1ymWeMTjJfnvh?=
 =?us-ascii?Q?8d5friHdRuFGIBaVmPhvAMy8jCNAB+LximYdb9PjFkc544JY+2FWWyBZTJk+?=
 =?us-ascii?Q?tigGjELd2kZbQVyd2NlP8uw+5vDALFb4YibNOjHxtOV/5wTE133m99vG0C/k?=
 =?us-ascii?Q?1jZyLiRuIYfEsE8gRS/H1bcT6QPEPsgow/wTd7MzaWve/X5GKcimxs2FEPID?=
 =?us-ascii?Q?5d7+AkxAMZsxfaAjxaKIFo+oOV9VxNnFJ9nE2PRNDbUaBY9Up4JlaUq1RJIn?=
 =?us-ascii?Q?UOpzD2bB8YeF35EC4opi+DOG4htpoqU3Ah7IMvM/1yerWyR8uHj2gAwVOMR0?=
 =?us-ascii?Q?B5TdbFOVh9Rz0EWjVTVLAsqgz/C/urDJRILsBQMm3kZ2udBiNyhuDOL7l4VD?=
 =?us-ascii?Q?4MbuQ9ClxPO7aNodjs+L2iyExEmx/AjPGbHvWK4eY5K67aYLAS/NUBg9LqdL?=
 =?us-ascii?Q?mHBrD6mrNUuDl+zvVF/p2PVXVA8+EOdp8yd8nHt5XRw6dfsIipoWTMdZpOAQ?=
 =?us-ascii?Q?E6Ki6xh1IRZ2iS4FE7buPhOYMexHYSpTgNjmbRevfRKlpw2wfsKyCc6y8EVc?=
 =?us-ascii?Q?sU5LWx9WI7XACLF13ickB3lj158ZKod6aKcaEHzV2Ok6tjiN5aisZm+9RgMd?=
 =?us-ascii?Q?FmxZsel3gvgPSNA9jsJmhuSfMJI+d6jXQprkay/ZJslVMIaUyQ9YcyPH4hvy?=
 =?us-ascii?Q?ZYNe8pna45xrMOourDa2CSpG2Jl1kAslzUexeVupzDQW8jUkhD39TRIbBplt?=
 =?us-ascii?Q?7F4ChIizoYZQj1wHQ82vF+lUolxybsQiFB6/h/HF6JoAwb1FoEUhKObqpRLA?=
 =?us-ascii?Q?+NHAFSXnzeMEKlBezBrshe2EmXF0UyisbJqWWHfBHWHCxbfjkU4Rdg8FdzQM?=
 =?us-ascii?Q?SHrE0UDvmtI+Fb6iNEi8xPDdGdZFwdZ5IRCccI5n4YEyN9QlhVDhCn/QVmV+?=
 =?us-ascii?Q?hztZP+4yV02rOv7MwHDT1V7F63CO76Fct2Xi4IGLK7EGR5NVwVTblMlj9ESE?=
 =?us-ascii?Q?QmY7uIFECUg3rE1VBv6g9/Iwdsr9if6Ln3J9Xk0BwoZY5Un+JS9tUWkdnvtQ?=
 =?us-ascii?Q?6T4mJYI73MB9Fy28gTxpLoHR7sCWXE5bJ/CK7qZocS6wApwkDHoaBIQ7ivk+?=
 =?us-ascii?Q?jHFoLsd/aZXEvN3hgbxCakx88OtFCnfAjBBLCOcC4dDDFjcqW1r7HG2wAiAB?=
 =?us-ascii?Q?OH/bqO+ByJtQYU67o+MlVtccRH8noO95IVf30wWTAutqi4VmfPvMVuSDUS/H?=
 =?us-ascii?Q?Vmhe9G20HAztE0LdN3ao24ryhrT0f8TnouP/iTlGHxDfyyA4yheTuU4q8igb?=
 =?us-ascii?Q?7efsTKjXbyk10crlsD67kGc+QsytrE/Jv9/20rHG79uFnZYQAuZnYpjQb5y/?=
 =?us-ascii?Q?UnDrPql44QiFKc09+FBi4IO2aerRIqGvtzmQRVMXGSTwCJTK2h+bPNv+l1wa?=
 =?us-ascii?Q?Zt8ZqUZA0cY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fl8IbiRPxQ5aEl3zeUT6XsmlQp38Nx1vdFgX4BHuVHPBFIQ4KxQi91N4piaE?=
 =?us-ascii?Q?skd3UX7WyvamoY/X9a0U/p5tZ80giR1+Y6i0l1Blf3WQwIIkxdroaS3zB9Jl?=
 =?us-ascii?Q?8NPglo0P6qakMtB2ZXtXSqlIWZQQM4EuRNxWNis71SJC3NaqLFeTtFqt8EeL?=
 =?us-ascii?Q?8lkv+Xri2LVPCwiq69l7tZ1+Luy1IZ8D/JTdRpiHewup4g7sfa9doEYyG0P7?=
 =?us-ascii?Q?8BbQOEWVtP3DdvAMdrjejV9OfLwStA69b+EqZipk2uww++UM0f0b4FKcpB81?=
 =?us-ascii?Q?QmuMZ+qJJ7yfBi2h5+qeok1iauo5uf1kgndzvHbKMK6+FDlpuFf6+5O4+xs1?=
 =?us-ascii?Q?KwkqX1yv0HNHiKeAdTj62lXTTAyGGmwAro0ijZA/fdoSkeJr3HewodwbfmlY?=
 =?us-ascii?Q?C3QjYxnFFGP/JDgnrYX+5cRRmAqy6nAWvBv/uPI5fHBs1nui1LeTYqE06zko?=
 =?us-ascii?Q?9sTsXyKsMzlfPtmMulPxPVZIbkP7Z08Fjr8QAYBC5/+aFOu7cUEnQ0rOqul2?=
 =?us-ascii?Q?jR4klrL8mbC/ccMUHXyP0yQWw2jLibMjZofVbi1LvVDfoFiptBZeTYcHMVHN?=
 =?us-ascii?Q?TQeQT+YA7BqaTCi6sqamLtfxictb0JBKJEDmtdCbMqCy9CjabBnlpW5Nb4Ar?=
 =?us-ascii?Q?iq3yf2YAoz+nPdZ7NzLDwnHIB16FgiW5BzXhxoeq5Mt1a6Z6+hN38N1mppPI?=
 =?us-ascii?Q?J/6YiBfqleEqqS6dw/tEl6UVX/luTJ0ioobfQexkArTlDG/smag7zMw6RJLM?=
 =?us-ascii?Q?m84E7FUSFPzMm1ssLTzE8t79RCZ850i9+ojFYWuXJ3FYEIy7QM1Hf1ezYi5b?=
 =?us-ascii?Q?KqwemxBXyBTQ4tyrqPL2O9PvNAPN4uZiGtP3ykgGOepS5eCFLNedLetuBFJ1?=
 =?us-ascii?Q?b/n9Fr8+JxWlOfn6Hp9S9D4AURRdu29F1/kU86GHXh3kk7YIgjDjhWBCrKBq?=
 =?us-ascii?Q?rJKZdzZJX/Tz8Dg5e5R5rY51U+tmPKDpEWKqKNgUYhFWMXPQ5XmwhloQSjdK?=
 =?us-ascii?Q?Y5CRJpJxS40jmfn+ZjPC2HIsuZ6yX6MAQIJcz0dwrYmRhXqJNCMA7bE1pHO7?=
 =?us-ascii?Q?i7h7p9EDlf9FDociqFVuJwp7pbjFk9O/SA6WZBf37KhzP+5VeCvkYEV6nl0s?=
 =?us-ascii?Q?KNvVJwmKMlGanP+ZE+kn6/8vB8PvxKbvwLsOX/JsccnggcVx6VDBWDpoaepQ?=
 =?us-ascii?Q?xjaqkhJEhhc0ZghBYKIaXBnUX4ZiSsCd6TrlGOTFUCCXwTOS/knDksT1cOdu?=
 =?us-ascii?Q?RA8lKtIKkMCpvUczfGBz3aKvu3PApuEkm82R9PkbpvNe1UUvg2aPd3Ko/qnn?=
 =?us-ascii?Q?KU5PWZ+BYsNyU4NtKB3ZAXJ7Lygr972FhX5xktAswzkMFBcIiBGoW0lSQUqV?=
 =?us-ascii?Q?pWBhTFOzQxTqWoMZB1aLA9tFgzN+uwwUkzEOEWYNpjkA1HHB85EDe4efmB+S?=
 =?us-ascii?Q?FoJAzryFTWYsmSadY0o3B6hQCdPXiXiQToARUTC+OGvzQHJzEP+yEQ8Z2Dke?=
 =?us-ascii?Q?tLca24ah2av9B5BgRTHCWpefN0qZppO1hLeL2NGUnpY8hfAlpW0UdBTNWMhp?=
 =?us-ascii?Q?biiibCFZNQvai3K8WqySbNsO7QbzEcqsRrqDSTJy?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a5c5b8-49bd-4c96-d2a2-08dcc274396f
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:32:41.7272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4L/NP5YwrkDg6AVwHM59fW/OhAum5Eg99e+vj6RGlYR65PZv6orbnZcQHzHNu6DWUuqHfXqC74Ng7oVcculExA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6344
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

