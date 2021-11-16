Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F997452568
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 02:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E4E6E44F;
	Tue, 16 Nov 2021 01:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2111.outbound.protection.outlook.com [40.107.215.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F10F6E44F;
 Tue, 16 Nov 2021 01:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZljxmMRDUy2dTFA6mq2nW7nHe4y6nJBHwRyyvsn2Ryk8Ke8xDQxBPb8sYK6TVNaLOWZ6IHDo+lEVIo5xy6haAxzgi0WvpaoFs6hAyruI4q0udU+pv7p8uWmt2wVsfK5xQ2zHy90dei1PhsU4lWCau66GNfMIlA9eZdHAxW+JnDZk8wrI/zXksMghedRyitFyJcs4mdpaEC2YWWur06Cu4WOwDRl0V+cFohtKRlzA19YeefEkZakp8hevqlLLbaHAZnV/R6t1nHKX/1qXNX6ObPUB8O2OLpwrVtXPB8JAyNQW3XdwFe/KLqFDuqQ8jFpE31/nx0bqgf6kabtln4y0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6D/bvbNQ1BOUel3ue4cnvlTn/AaJvZleYcpPioWnQY=;
 b=HOMyHAKGqyx2qSCjy3xVsKzSem0uxbYKnKqtpjKfco1JQyqTN2zgNNp7pHa3mu1qte7ps0uZBKDnjDeuIpN5NxtgzMRsvoDA8Di2hZkhj0gpKUECQIXYDXy8hyZ+k1b/L4inA7H1fo9CeCi9wXhhSu5Dl9zjdOG9Im1POgSLK8ATVdQxspVeESIT/EIw9kmAMoOKakAdk4AeJChj6PCEArnLiH1tDas0uu8PMumzsqB9+/Ao73vXTrMgRR6xbxBGB+RWE9/7BWItLWZ54XowallIu8XmMTCDOmeNOjiDy2Xe7B5w1ZuaTKfpyqUCD8c8YtVZrjVsivlG6sjdy/kc4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6D/bvbNQ1BOUel3ue4cnvlTn/AaJvZleYcpPioWnQY=;
 b=Jf2pnswv4jQzFi+gOyia7y//K+CHTcUZ6bn0np1vzBtl0AxzdIKicfSmEBMKar21td/cZ3RPTIlnwtsB+tMBOIxiD9/WdVlXy/jCw6PrkCkF36EMgCTln9LBR9EXOt6UvUUoGo17Cs8bB83JJh6ILgUn5x1e9RG36C7+cQmcHvQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PU1PR06MB2181.apcprd06.prod.outlook.com (2603:1096:803:3b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 01:48:05 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 01:48:05 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Solomon Chiu <solomon.chiu@amd.com>,
 "Li, Roman" <Roman.Li@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Eric Bernstein <Eric.Bernstein@amd.com>, Bernard Zhao <bernard@vivo.com>,
 Atufa Khan <Atufa.Khan@amd.com>, Jimmy Kizito <Jimmy.Kizito@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: remove no need NULL check before kfree
Date: Mon, 15 Nov 2021 17:47:50 -0800
Message-Id: <20211116014752.26868-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK0PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:203:b0::24) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by
 HK0PR03CA0108.apcprd03.prod.outlook.com (2603:1096:203:b0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.19 via Frontend Transport; Tue, 16 Nov 2021 01:48:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1feb11a-a4de-48e5-10f3-08d9a8a3223b
X-MS-TrafficTypeDiagnostic: PU1PR06MB2181:
X-Microsoft-Antispam-PRVS: <PU1PR06MB2181760289DB1588A142730CDF999@PU1PR06MB2181.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QR91AmmnwAkC9VWIyD0ALba3kQ1gtnHDhREXcPmnim5Xk4HmSUtHWvar6Sh/ro7/Z3QiUx2iSaYbZm6/DQh4OBFTCXEVrZQKV7C7odAlkTymqOaF+/VD0ZYe8TP44CmPexpOM2iwbZffE5UQTsYDbHx1pLa5JJyKmlP8ve73lmPHxbusC1E7VPHvoi/LH4uKdxx5LgM0NP69exlei5hedhwnaoanQkurow6mIhRJpwUzUug3Oe5z9lWjd7wIg5WI9/xVZ1/jClo3XEwabL2cj9lPH4J59VnUj3+dveSAfzjtTM8NTAWtv6F4CK18Y83pZRB0eDwgdMPj45DvKTcGaig2EqnYGFCx1AtvEItav94P84i5UCK1W8kB7u7iwNOBNax9h8QEdt2RwXOT5z7vgGcd7HdvxtHj4UyvEZAZqE3Ff/QHayW3WpkdvEsgZ3fQcBeeaR8Hv3h+Hz/km+WQuTDDCSEuuP7Faz24CkZWBVwM+SlPxMwMBigw96cQ4+w1eHuQutegpXc9PnQmBY8LtNryoe1TDnhY8rRFAE2gKi76m/WqLDSGYs8gaeKaQE6afn96Zg4Wv1nPOkEjHsYm0JZ+MjMUqiORwRDq+1+TCVM36u9WJGJhmtLvYM7YAMLUeCSZhgAttgv80vIN6MFPB1VZCK5mMDv/Jyv4ZQuhtvJJNo5ieUedcoLtgdTn3V4uGJHRQV5jJEngEePC+mhD8+03cdmT6OWcXEhDC0J0Bq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(66556008)(66946007)(8936002)(6486002)(508600001)(7416002)(186003)(36756003)(316002)(110136005)(66476007)(1076003)(26005)(956004)(921005)(6666004)(6506007)(2616005)(52116002)(6512007)(86362001)(8676002)(38350700002)(83380400001)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1CmVtjrSpRghPDV8JDYd2mOJ3XXdRZik5d65DpE5QHJa8UF2C0OKChF4aH07?=
 =?us-ascii?Q?A0G5m6I82cBrLXPsbpjhTLkvz9RZv3CNhstyVIzaTEXk/6PI6WziZccqvogB?=
 =?us-ascii?Q?/5NT8+zb86Xr2/gA6LM00zrsNLwh0PrS8reKy9TyKtXKmoPfwMNPlE8MFIhE?=
 =?us-ascii?Q?pmtMjp0ikQ1quBqTM7Gl2JwsCT0sgCgmK5X6znFaXlugqSn1OEMgOOzYoVkj?=
 =?us-ascii?Q?zWGENB5MHX+oM+KDfzR1tfidRes7k5DUgkT+PR7ZyN+2F2Xp6+FZf1cxO2wc?=
 =?us-ascii?Q?mlTODjJ3SF0d4oyZ94weip1OR+ra4m3/v/6PkbOAsLFHhmbiFWGEEpoZOW4i?=
 =?us-ascii?Q?y3FmKoE+rdID6MzFKy5aP9FK+ClV3DuQr1wTc6+w8SLHzRBb6G8ATqmpDYey?=
 =?us-ascii?Q?3f7Z8IZsXsAHQ5zDHck7WVCFwqZXZY2Kem4HMnx/f5b9EF3lQSG1V3rXx+Iz?=
 =?us-ascii?Q?wcRBxEm49InZic3poHTqBd7N+l0tqRiIz3en90vG03OodgxOqex50soLLOKo?=
 =?us-ascii?Q?xSMKORFKl8LU6CqiOKzbJnMGu+bgUlRBPpkF8BJDAqsjaqL+Cn7mij8UlP8J?=
 =?us-ascii?Q?9lgdEtpUsaZB/HMz9PBQgOMAfC7Sw1ir/XGpAPSFRe4dbrmwFJXuHk9Q5s15?=
 =?us-ascii?Q?d7WPqJJBpVwXFiGzYkDf9+W4mZM2rW6V+VY7mqWnnwuS6e4ai2g8s4+P26tf?=
 =?us-ascii?Q?fMWmLE13EbEgmVggT/wPi2/zahA3YkxBPSDEC4gvkTkMPrUyf2vZh8Lp4NzB?=
 =?us-ascii?Q?WhZiPxbv/ge/YF8+bZbUXXOzrtVJh685KPOwROMhgbheHb+fMJQB9SpQNzU6?=
 =?us-ascii?Q?HN+N+s5VBHCvQf/PexJjpqtnlUhdMmsqV/UDE0wHBhLt2Y2HK8ztLPS737Ay?=
 =?us-ascii?Q?aWb5PSQcg8FOWsa8OGSDUI/hivYmafhsZh+c/2fWzXhdQEdrcckpfsdWr4ch?=
 =?us-ascii?Q?VqIZAmAU3inJCTFjD3hrHlaFkdmts7fs1OCSKZY0qL6CZr+3TzE8OVuLIfBC?=
 =?us-ascii?Q?I6muN1Yuoj4MR0lMk0arB+XiGdtJYBeQNRUQ18vhqa+a1Z/LOfIm3xD3B2jE?=
 =?us-ascii?Q?wyycV3WDTcT4P+M9iUCF7YW3/PDmyXQa4JQ/NUTf/tYu79Eb7n1h9TDSHKvj?=
 =?us-ascii?Q?sa2OlkAxBavFXL1bGWl/RAkwAiNoNkR4jPRh87zNQwFgT4vWN/TvyI23pA0B?=
 =?us-ascii?Q?dhVyrOw5vrVI8NvUmBU/KKj5TbP9uKbJK1fpozavF5PJ+dXAjwfJnpoSYodN?=
 =?us-ascii?Q?iNOSiUvOOfy+KtlRty7OkZL91uQmpLjuwaGzhIRBHT4U9MOMIR/vljp9eQL/?=
 =?us-ascii?Q?emk5h3GMp2xphlyPuBXHlbOJrmSAVsePKVmaQbDoYL6QpUpED8DCdChz8i/G?=
 =?us-ascii?Q?6tEt2lPvDxM7a1sJH3L1F8BMuUD0lAjRZjuFrIHEAzrE6Sy+EDuQLwXf45qi?=
 =?us-ascii?Q?5jG3nD9/NrLfwTAmWwOoR+SHLjLLYZ6tQ/MfHFoDH2D0JkcTgYN3PWpJVXg4?=
 =?us-ascii?Q?CXqeKwE+YDnZLYxGhBiHMXL8GI9681hLfo/CdX7wx5Ktebj1TPeS3SlZxqNu?=
 =?us-ascii?Q?qyS03CQink7jG1f1Zo43AGi874SXWCL2QI3RulYurSdf+JUke6jCnw8pyUq/?=
 =?us-ascii?Q?BCk8DyWgH65ebLl7JRLj5wo=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1feb11a-a4de-48e5-10f3-08d9a8a3223b
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 01:48:05.8391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+738thejscLQhfsIgrLs2aHITk1EURW4ReDcaW6LfW5eOwBVo3TXtwolKx1MiDKSXWEhRYMgygWt0YS1UsWYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2181
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

This change is to cleanup the code a bit.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 .../drm/amd/display/dc/dcn10/dcn10_resource.c  | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index f37551e00023..0090550d4aee 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -978,10 +978,8 @@ static void dcn10_resource_destruct(struct dcn10_resource_pool *pool)
 		pool->base.mpc = NULL;
 	}
 
-	if (pool->base.hubbub != NULL) {
-		kfree(pool->base.hubbub);
-		pool->base.hubbub = NULL;
-	}
+	kfree(pool->base.hubbub);
+	pool->base.hubbub = NULL;
 
 	for (i = 0; i < pool->base.pipe_count; i++) {
 		if (pool->base.opps[i] != NULL)
@@ -1011,14 +1009,10 @@ static void dcn10_resource_destruct(struct dcn10_resource_pool *pool)
 	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
 		if (pool->base.engines[i] != NULL)
 			dce110_engine_destroy(&pool->base.engines[i]);
-		if (pool->base.hw_i2cs[i] != NULL) {
-			kfree(pool->base.hw_i2cs[i]);
-			pool->base.hw_i2cs[i] = NULL;
-		}
-		if (pool->base.sw_i2cs[i] != NULL) {
-			kfree(pool->base.sw_i2cs[i]);
-			pool->base.sw_i2cs[i] = NULL;
-		}
+		kfree(pool->base.hw_i2cs[i]);
+		pool->base.hw_i2cs[i] = NULL;
+		kfree(pool->base.sw_i2cs[i]);
+		pool->base.sw_i2cs[i] = NULL;
 	}
 
 	for (i = 0; i < pool->base.audio_count; i++) {
-- 
2.33.1

