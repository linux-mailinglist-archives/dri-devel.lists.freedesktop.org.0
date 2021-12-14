Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F6474239
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 13:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F151710E422;
	Tue, 14 Dec 2021 12:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2109.outbound.protection.outlook.com [40.107.255.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D01810E41F;
 Tue, 14 Dec 2021 12:18:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeiTFDpPGu1zL4hagBi/CYGPKV/bFO3+9J4FYBpynPFjv7RxJQuDFwbAQHY6YWPInk+FEdOnaYtCEYHJMruKBTJujSd4LIM9GBzxcHHjW9/lAKrWYHS9vzq8squgbt+ddh+wOIxzX/ZzS4W4iFiLDkqgDrJj/THG7U1OEObH4pv8ilKLi+lTtorKUiPmOYB50FFrlu6fEzYQdWSZgtcpH4gR/Er6eqFRUnj8ehKJtfAp+LpMfYqnAzcmxV3N8BAUEiCxfTySIazBr3N89GTD7odyOd4KGGb8cTScHj+CDenTwjlZQdwo8XcFkBKq96pICcwAGTBPVmmDR9rD3Jbsqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qarb1zlIk6SEFIQ9kuG92GCPO+xkARTN4H9Hklzzz9E=;
 b=CqSz9X6Grb1a4VnAzWD8S0TClrsBU5AnYgmn7NMoAbjTNL7mQot4yaIEBGiPJKJdF2l13MMcf9mumBxw6AQh5NbLn8ZZNdqS1BF+9l61rvYI9lIGFWCebTWnxpi77XeWGQ2iQX4+wtEJOOr4mdwMUrBnjWJjij1tkexJvCFfMv4D6PvBDBIte9cGXQv47gUUtCU45CI9TYTgIbVRXnouHjeN+mfg7fMHBurD7t5QvFKyw12ZBLdi8Lkyd3D5hAhAcbuTv6iuEWFLtJAPQsRGsLYBMbUUp+3et/JLuUCSHwRX/34aNUP7FpBQGmi9vMr20B5ew1H0CrnlKysqhm7zLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qarb1zlIk6SEFIQ9kuG92GCPO+xkARTN4H9Hklzzz9E=;
 b=ALeBAOw/eYc5EmyN92xM4kFKTycjHTZkHmTBmsfM4upeUeXRA9gf5F4NdZtEYNGD47oK8k25TWVzG2WGseAGl8jiIexrnp7SBhdAqQWTS+z4+3xf3mbcd+oJ/iIrDs4lE21ihEroxb0AiPI0mhkB9FYrlk2dNUuRW9ePHmolVfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3003.apcprd06.prod.outlook.com (2603:1096:100:33::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Tue, 14 Dec
 2021 12:18:11 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396%4]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:18:11 +0000
From: Qing Wang <wangqing@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: nouveau: lsfw: cleanup coccinelle warning
Date: Tue, 14 Dec 2021 04:18:03 -0800
Message-Id: <1639484284-75779-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0009.apcprd03.prod.outlook.com
 (2603:1096:202::19) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b6ff759-b3a8-41a1-9802-08d9befbcbe3
X-MS-TrafficTypeDiagnostic: SL2PR06MB3003:EE_
X-Microsoft-Antispam-PRVS: <SL2PR06MB30036A5D14CB510FA68DD8A4BD759@SL2PR06MB3003.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /3geq2svV1uOipTPkXErhi60YYGpY75shipH8xo1rniWFrZlHKbNQoH5OnPVpEd0ipVfYLIF1/17XUIy8rliCy+I0+b8oxlasLi0IUjYaUGXLgPxx86nnaI8VSj5VIdnm3hXzxKBqow3lAnaXNUoijztAnoYe4mqobuFl4IC9ppnRBmS9VfBCP1ZOslMUiL4RO61vsXAmdQ6UivfFvy1cls6yqUnWJC64Z1L77RpR6tUzbmzRGfySo+tl4OFYz90kkNVX21K6+VllG4446xmGKWCkwHW/rmmfxbFu04C2sG7mqbePhVrlM6bK6/SUGxVNuREsf0bQEVvLRKalKffzTvye92YZlOaYEGPzMqaJ2bbd3ExOWPx7QuYv3/+DHVt+JfJ+EfC/YIuYfmDyz1w5UFNvCqE2SlzdmC/E2q5iUqnZyH91cB63c321mqSgw8odKhYXNF/HRSwJxwH46+xundsPXQ5qOr1zMqhiEn/rjSmeFdtgD2wr1OoisO0WTRyxERfrM1zHlsQTA2tRnyfCWuDgXPecT3kyhuIaVcvJEfgmAVitdpjP3wGq/luOnqi1Mmuma+hUVYxSIr4t3C+NFFy4/xbQzUSWgBB7tri9l0Fe2mMgn5QNBxaIqyyQM1ieghnFm70qgpGmGLeJXv0nBUVgE7f386pd1iUFVU07RoSMJWwvynKQXJ/za1wbbjmAuN75UL2nEHohXkgpvnQqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(186003)(6506007)(83380400001)(6666004)(66946007)(6486002)(2616005)(4744005)(66556008)(66476007)(316002)(110136005)(8676002)(86362001)(5660300002)(8936002)(508600001)(6512007)(4326008)(2906002)(36756003)(52116002)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+FM9Db5puACbHqofa9TTK652ai0UHP2t8FrA5hNE896V2c9yd0/iwwDKgFd+?=
 =?us-ascii?Q?XFYh6sZPcEFAzzMQ8A+iuwlud/GLWrNFF2v0+8YrcF+tzdUeVrw/M9Nt3i2h?=
 =?us-ascii?Q?QeYqWIjZPUJjRDzni2eBq6N5ky5h97bopFDTeUEA2CEYIMXH48h0VEBUtl16?=
 =?us-ascii?Q?AXI58PVK4Inp9MFuYucneDcFU+lTJcEOO1Kg7C/Nl9N9hvm1qDiGkQ+5NmGr?=
 =?us-ascii?Q?uUMmDGhiCCr31K53DjzNdQmwZ1NIJ3roC1TAipBbyhGTXDb5EHxPiOfYQZ8c?=
 =?us-ascii?Q?MgEFRZoswZblyYBQanPsFrBeSwH0LxU/Psh6IveR3e2vQt4yv3MgsLPU4Ar4?=
 =?us-ascii?Q?2ebEtlB7ROuha3KSqPzRHohf4wTiSh1JnBgIR5TfS2HUj5NQXsH/LOOI9giG?=
 =?us-ascii?Q?qz8PpMBT9Ovwt4Y0feIr+KD2LiERh6n5NRJBw5r3MrAsPRsC21z24swbBC/A?=
 =?us-ascii?Q?x4yIfUGh3gEWv13cW5MPO5cgmrTdvfyHciZsLVo9ypizigRk0pek/RqSYr7q?=
 =?us-ascii?Q?jYGfOTGHcKFHbQsnWZR9qaqXC1Tz/J0yOLxoS+xdsaIhGLyMfK+I1p9v8Vdf?=
 =?us-ascii?Q?46Iskqe0kCK9acf8lgyuAWNQG+ZiDM+icq1FDo5Sf9dMxiphyVpi057Bb+ij?=
 =?us-ascii?Q?XhxVXxHIKngno3UvAM6dfg3xrKx/0t3ob/w5hishN6tH8VUjmxQBatbwQqf3?=
 =?us-ascii?Q?Ukq9iEz6WqedRweAZemEdUOnq7izvXCPf38Xcl0aWI2/DQ9aQynkA4Vod9ag?=
 =?us-ascii?Q?tClOljrtrr6JbRKik9SJUsWzEYw0kwIlFV5M75zCJsOqXahW+hpGw978hWLr?=
 =?us-ascii?Q?qNLEbVu9N67TWzUW+6tkFU3df96rF+26ZC0iY+id0F/6A1mzYdHO54sKIx8L?=
 =?us-ascii?Q?OJ0ir2Kc7dhiSykr0a/GUHh6SIZIYj2A5AJkyNMokFbkgcghGuNXQvIgsuOS?=
 =?us-ascii?Q?xT9cDczfP3+0ghWjObsNnUC65aj8/KKOudEZvxkB7FeeEDmJYDZVCHV8s070?=
 =?us-ascii?Q?xES/BcWcFmk53BtTyNXfCzo7AcCC9YPe5aEbHPEYu6Yn9t4+5WwCq6VF9D4x?=
 =?us-ascii?Q?4G2H1q02HeMcOlyyaiXq5xVj8F5t8SJ3F6hgcgi3RyL+yMCLnLLbQlZBOn6z?=
 =?us-ascii?Q?aG2MYJC0gxm5omdepHckGYZXwcGYnKk3Ni21+lEyg/Lv9g6kT5YFhfist32D?=
 =?us-ascii?Q?imRiuTATEJMR/s73MUtHi4rAPCA9mPru+6/LLD92tJ66U47SAolAcpBxU8c2?=
 =?us-ascii?Q?2dkQqTlql1JAJOk1ERLo1SrERSzeUYE65GrAn/14t46nZBnNIPTqyvbf7t0W?=
 =?us-ascii?Q?51njl9HyXEFi1XrzwoKuePEkjwqin1VjjzJ4WRodEug87BRMc0OasoZEVowh?=
 =?us-ascii?Q?/cl4QwocvgoKxB6+k324feceNc2HIS25NEFowLEE1xVHCu04s56k9bDsiNEI?=
 =?us-ascii?Q?UZ0eUiiSjHESQfoJKnbXbshoPraOtrF7UYSMwoO8vSBEFJ2PxMBJsiL63B5z?=
 =?us-ascii?Q?IXyvXE2ce6B9GM4jC5rr7fvsMUFnPbO6EPPI/ZZU51EogY1rwVm6j8tjvsaJ?=
 =?us-ascii?Q?gyrFB/lV92c8LvFxxXbADp0aOwpzCc5DBDwRA725UUR08sulcUZ3S132ua01?=
 =?us-ascii?Q?1XIA/YnhrtagS7nNNcCDHKE=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6ff759-b3a8-41a1-9802-08d9befbcbe3
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 12:18:11.8054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAgQ+sdnYeingLGn870G+sNKQN+43XLcM7DgHUkFFK6JkqDNxB7zkRnsIlOY9jPmnxrjTUjUOiiazpC67RsbXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3003
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

odd_ptr_err.cocci has complained about this warning for a long time:
lsfw.c:194:5-11: inconsistent IS_ERR and PTR_ERR on line 195.

Although there is no actual impact, it can improve scanning efficiency.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
index 9b1cf67..0f70d14
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
@@ -191,7 +191,8 @@ nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
 	u32 *bldata;
 	int ret;
 
-	if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
+	lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id);
+	if (IS_ERR(lsfw)
 		return PTR_ERR(lsfw);
 
 	ret = nvkm_firmware_load_name(subdev, path, "bl", ver, &bl);
-- 
2.7.4

