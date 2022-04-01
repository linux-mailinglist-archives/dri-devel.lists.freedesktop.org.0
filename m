Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED0B4EE653
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 05:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB11010F662;
	Fri,  1 Apr 2022 03:00:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2123.outbound.protection.outlook.com [40.107.255.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0A610F662;
 Fri,  1 Apr 2022 03:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YK/4Kksv0qRUCQXOl9ELgV2H3p4d0bFyh9ZkqrYVeS2TYuPSYxt/n/gX8zNECWu4wudt8ZaX9+0H9yHPqhrYx6WgpgX3HcwN2ZZQiAV6HlfUqm5zgiO/IeU07nGuQGlcwzYfwzDywXzYKtnyGwNf8hhDSJDFoPPozTtAbeNa4tWFECnOoAL+3lUr9jW9kBcHhWfAR49ibLeXaPRQbS7bMWf16QkbuGDuBRzwyTlMW7L/rJGlN4g5SV/fV5Nt1eL7MkNu0WZXEXHcZ/tyrKf4mLmXA5myvtTpQgCEnUtpFyQdTeHiewEyoaypjsT44ChJVQzoXuEl3x3GczFggF1J7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJ1rRgtFDy1WnNLW2a9FrBZWicHNfdHknBZaI60DBG8=;
 b=JmOEqcdIs67XkKJjzWUzpcpIqL9Q0GI3/TpSW8s8l/qM2R61h8m+wTONr6llwOX1kej2jo9v+FBMFFy3Lnrd4F/2viC88CmjH7oJzz6o50YROlQe0PZ5fIcnigjj6YQrlMYPc0X+wRu5ud+t+tZcKuthkC6NWajLxZPLgQexPudocpjXVqQt1GiJgzlPQrArzL32207E7LkX4zSZYl+oETxfkqXnRImEoG8hUERxJrSxK3go+efONOZgZer4p/2n0yzHGWAS17HjE9496T4gV/98IEUtzrUDdtEJ3in2nJWYoE0pYuegVCeCLEcAv3Mymz8YmEATOlUwyMdPhw3aCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJ1rRgtFDy1WnNLW2a9FrBZWicHNfdHknBZaI60DBG8=;
 b=oEsJSvfFqBz6w/jQimof15n9JZ94HufgHZDHNn1sOzcC5tikPtvAfd7cjLB1j7ypInv4n2KUfa3pOy2YifPfYrDDO8ym3+3KC3JUHUwZK8Blk+K/qCFBuvzrNqykRaeLC0brnZM8lp+XNJ9RKMRq2Z0PkBa27pTlbY2RS+SQ/wE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by TYZPR06MB3904.apcprd06.prod.outlook.com (2603:1096:400:4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Fri, 1 Apr
 2022 03:00:05 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::5aa:dfff:8ca7:ae33]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::5aa:dfff:8ca7:ae33%6]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 03:00:05 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/radeon: simplify if-if to if-else
Date: Fri,  1 Apr 2022 10:59:29 +0800
Message-Id: <20220401025930.16365-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::34) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c606c30-4812-4b96-1f66-08da138bb8bd
X-MS-TrafficTypeDiagnostic: TYZPR06MB3904:EE_
X-Microsoft-Antispam-PRVS: <TYZPR06MB39041688BF7EDF15F635FB7DC7E09@TYZPR06MB3904.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1cRiIqkCrF4HgehTX7eHScOc6fdBX78lmAvw8wvlVrXEQfsbo4pneXMXnSikKpF+Dv3XocNYtqf+7tDrN0ABAtOgzhM6zmxlJiZCZGrTOIQjPyw3XsUmXbYv+9lwMZoYvKMbvJkmE1V4I0Fe1cPhW4l23Iw94TQSB4MlgQ3Jd6sOzti7WmlbraP5dfjvM8W7TaPkd8WY9VpbvfVYR6TYhn/f9OELW0qlvDnEziw+Dwc1qIoRuugminviXgS0TzNTli+2PYbEVUc7LuLD/npWJAwFJWNCQes8gDUdXN/iRTmJX4OY2cotVnxlmB8WTM9Qg4J1beiFu7eCHBRTIX+FTbXGQwOUhhnjYalER7camU6FtTi77d/MOlLnzofcs3pHtzFSK2ysU+kG821ieQ9QIOz5sRjOCe/BFpUMJT/MuJQvtijqS6wf65Q+688pvV/Lf7HQjfqDMDeNsai4914VJu14mt1YPhQcIjcEuHUnEQM2DHb0ygsukzn2WOEuwLS4WOLP2T0Jf5jdrOhgp49y+P4NsfovNgA7M2IseGd9pGdLeSR7gdieiGQrrA4ls+gmNn2zqnnNOWskZVTYj7AyFbaKgVsnFoCb0lJ2TsSOJEg22eUaa9hzqWhjElE9I3a6SIlweGDoRB1B0nKmnh/KYPE2D0YLLkHWeruSx4ixL3b1Qh71G74ISDpXRCvojGL/jHCfc4XfApCWnVijtwjfIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(2906002)(86362001)(6486002)(110136005)(36756003)(508600001)(6506007)(83380400001)(66946007)(4744005)(6666004)(5660300002)(6512007)(26005)(186003)(316002)(1076003)(2616005)(38100700002)(38350700002)(107886003)(4326008)(66476007)(8676002)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pRxX2MYb7oZRT0fYfQzfWtwMHDsp+fk2PqyTv/3zzeQxWPwG9qrz8PkqLTZh?=
 =?us-ascii?Q?v5zKJ/B0/i2+w8E0M2uTnlj+HBJts/SqnUrwqaW2TYZmLaOFEhj0S9T9Q6jK?=
 =?us-ascii?Q?5s6s3dEnssWLeX2954qDBcEKBBRNWbtIc2QI7nHNfece2Pxf0xU4uh+gdoXE?=
 =?us-ascii?Q?kGfZu+TZ7b1u6a8cQF0LisSEaSzyHvJ8DSsX74p3miOQxBRn9+9rE5KJDpf6?=
 =?us-ascii?Q?HQrB2A8fJaqFmtRoBkLd01Uim+oVLWcO4KQeusijazek9Bt4xU/VXlA7uJJa?=
 =?us-ascii?Q?R6w9CpQHz4zOBU0H2BO33Hymg2vRjQ0XZGR4WX3NVHilZYkWq+e0BqX0H/SL?=
 =?us-ascii?Q?hULybdp9sbJkbHtYEh8XMA+hJCgfYl1QG4uR5d5/utKTcJYX/lSa0iqdUhBO?=
 =?us-ascii?Q?V6KXkWEZxFtQeJGT0V9jgp0EsH+Hm3D+7ATjT3qDhaELUh985wge9h0jsiHi?=
 =?us-ascii?Q?c+57QI0oLWsFy9mgpdg0LFO//gZErVlFslkllDgC4asFNzQXHi2/8Acd/psq?=
 =?us-ascii?Q?zm9a5e52k4RYFhsppyma7c6uc3pa172iLtdIxB8E8dghcmuPVZDQjpIyiGY5?=
 =?us-ascii?Q?7e+iskmVoqbFyZp1/WCWMXlevXUm97tM7NCOmrk+C6Y9N9nPelklBGS5f68m?=
 =?us-ascii?Q?8N8fUGllgaxwXXeRRZGauiSbuiFQls8wD3lLCHx075VslOoHcRQ9QE1wucJx?=
 =?us-ascii?Q?+nfry3EQmSFww8BYPSLuOqioKd7cuwKPehJw1Ue07pnCHaEpsfqOpKnpWLX7?=
 =?us-ascii?Q?spsFb6cGhGG4GG5CqpTD2Mnle96mvPzfp4yoyhOb9cApCywXL+uiLQ/XtFeN?=
 =?us-ascii?Q?qPODuKlvivinjqsB2I9ly616ckrVk7iVZpto3qjjy6LuZVps5mCkE8pUAfY/?=
 =?us-ascii?Q?ecmJmTjp7s0Y225M/osiOmQLveF7Id+sArzPRUHWFxtP896g+ZVLrzUPgMMl?=
 =?us-ascii?Q?y1ZihTrPmUpAdDM+BbrJxZWEXdcwS4CGXQd47d6KhLkb0x5g/RnZqiZanr0b?=
 =?us-ascii?Q?746T/7gDoofjeAyO/b6Kta7d0xayQTVH8vKQW5O1A4w1a6DqFOOQynDoSYa9?=
 =?us-ascii?Q?32paR/WWaDo8Qx+dY1dFNEUDmmtvmsHfkmct6qL2npYhiXTd7I1mJyHLWguW?=
 =?us-ascii?Q?AYtjPijrGyxEH7uWXctlxr8p1M1rKPWV5MtVeyO5AldDxvqffcbOxbMrnzSR?=
 =?us-ascii?Q?hzbCwdTtjV6+HOiQNYal8CfrQHfPVw0NJeeu+yhiK55wLtH3Urd0WM4LKZ3M?=
 =?us-ascii?Q?xqhZMMfI2N2gd+BR/OdsU2QrbIH5V/ceZ+E/T916zyls7ZAfGmvIgDvFWkn1?=
 =?us-ascii?Q?xrfIgLJTndpxFUlOJx3eS518svvs5l9fDSG22yeU7hWWGOM636WflsLkw8cD?=
 =?us-ascii?Q?EtKFC6cQU56L6Wpmz8XAVOBtNbU0v6OX8wMH8p5P8wVBy3kt7rHak+GR5zu7?=
 =?us-ascii?Q?8/48M9tlIdiSGbaP4atASU7z7uiV5ZjznDeu/UoKZNF8/5XXcnZMbgNhFPfc?=
 =?us-ascii?Q?Z1JX5Sd+ptNDKgdkpyK+Kxkury28iIUGb48s7IffyIcnCbrKFsE8nrJRCe3o?=
 =?us-ascii?Q?n/1PrJk0tjtqF2vkprLFcDWMTwtIN2oo1QtkJfizFcJkd0B/366YqKn4mzeE?=
 =?us-ascii?Q?M8hU+ktpr0ErSK4kcFYHLyuNk1oYnOSg9S+5+OOhKKHPBdZ8cyWK5b6agzhM?=
 =?us-ascii?Q?dOoFTN7AwqWRflvyGUiTkCseVo9Sn9swdRx/mEZs71dC/8QuJBOw6OwbKrA5?=
 =?us-ascii?Q?G2MTVPzuJg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c606c30-4812-4b96-1f66-08da138bb8bd
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 03:00:05.0099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sz8QHDhYUNjz0X+KVfTdPgoMM869RirOrewyFx+pQ6TdS3xB/FtsCvpJlnNuMCIciUBZiB8SaEOc4aETMtL9qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3904
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
Cc: zhengkui_guo@outlook.com, Guo Zhengkui <guozhengkui@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace `if (!ret)` with `else` for simplification.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/radeon/radeon_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/radeon_pm.c
index c67b6ddb29a4..e765abcb3b01 100644
--- a/drivers/gpu/drm/radeon/radeon_pm.c
+++ b/drivers/gpu/drm/radeon/radeon_pm.c
@@ -1629,7 +1629,7 @@ int radeon_pm_late_init(struct radeon_device *rdev)
 			ret = device_create_file(rdev->dev, &dev_attr_power_method);
 			if (ret)
 				DRM_ERROR("failed to create device file for power method\n");
-			if (!ret)
+			else
 				rdev->pm.sysfs_initialized = true;
 		}
 	}
-- 
2.20.1

