Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A6B28E73
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 16:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE3810E079;
	Sat, 16 Aug 2025 14:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="RfWEPhNf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012003.outbound.protection.outlook.com [52.101.126.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7610E079;
 Sat, 16 Aug 2025 14:23:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juoTNfWYonfmWYQesYTppRc3vFhMnaCZq3uZ8vs8RPnO7E4vl3deIVXNi8n+39fB5WfNq9rWzMYP1Bj4OiKJko3Vca1FRQt6IM2TVdOtOeoFB9AGz2Q2funyV95gPgZe5eeWJ/0ayoBZIS+EUnsR52MKUjNEBYE/P5ceunWUpgr0JtsgOWpGc4//4UahaGfWokj6oTqB7KgiAzBtALbudPp3eg6t7xkMddTk6DOz+pQRmsq4b7u30KRCqnCPkCQovaO2KOZBfZEGDOzFGcPgFsHGozggbyBS3vZB7gfQIbpiF2IadwfjFwYsrF66Qvlh7TkmIaqD2+pScWfYt2U9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyDx/ETY04IRC6PZPHz3QGYJuNGjtvRCv5yuXrAbzWU=;
 b=EBzklDZWSrWTjOKUVM3p771AEQSBtb6j7m1dWo6pf14KQrYjcxAIby3V6/B7PAW8q6MgXrMtAnU3cdeOwK0ANBwxVvGeWeG+Ut2vL+Il8nu89Gu63MDXvk4WoNXd1rkK6nDnjZaVCEfUgkjOrpMkcayks2AsC/cLQQuyRHzCFo5WwMgzBO3PVOiRJgcEztz4mwP0LApAJjqXO7kr05VGZ9c9UkI2iQE8wSo2IQiCUxBRLU8h2cztsMfdT9pOFfzxqasLOrDR0zgT4iW7NEHiqB3RKH7L/LGgAEpS/k+eeZjhIRmCUJQYUxXGPldQqpppXfNp4Ouyg9F+7QcQQab1zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyDx/ETY04IRC6PZPHz3QGYJuNGjtvRCv5yuXrAbzWU=;
 b=RfWEPhNf0b1QBF6W5w5feqZGkvX5HsM2eKwIsWOoniT9F1B9xOXKB61X3XrQrec7IG6Y+e5Dfj1EaXNFVcvlf9RJvhs4sbK3SprhjFXiDsLL4lBv0Wl0EJu4YhtDupmHsoAplxx0QOepLM6ySiBhPw9zyp0iRcSHcYPm7T/PcbiTenLF7Gf4tyTGUwlFCwpIgm3vkaN6rVLj/CXOj4d7uzm+5x8l0fhlANRas6Lt/33WaOFXgzYryi21r3Q8xuV7BzI5VyDHMtWKijaxPgM89AASM6ZuylYvRXYo/p1oRA3z1RNEDAAXR6l2CfCkzbHyrT9OO2Lu6evGPtFvAzStrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TY0PR06MB5803.apcprd06.prod.outlook.com (2603:1096:400:27f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Sat, 16 Aug
 2025 14:23:24 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.018; Sat, 16 Aug 2025
 14:23:24 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Alvin Lee <Alvin.Lee2@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Clayton King <clayton.king@amd.com>, Sung Lee <Sung.Lee@amd.com>,
 Alex Hung <alex.hung@amd.com>, Samson Tam <Samson.Tam@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Karthi Kandasamy <karthi.kandasamy@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Rafal Ostrowski <rostrows@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] drm/amd/display: use max() to improve code
Date: Sat, 16 Aug 2025 22:23:05 +0800
Message-Id: <20250816142312.393795-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0195.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::17) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TY0PR06MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 9083ace4-3732-46e8-fc7e-08dddcd07577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3vMWg4UUahHEX69GdYL/AX2E9myW8ELnET+vp43OgPvBUDynW4v1dKL1JSp1?=
 =?us-ascii?Q?auelVZu3b3uYm4ypjVa75BuKO4c2sMZxbBsVAr4GdVy2D+hhkfK+3ubeMp+e?=
 =?us-ascii?Q?vZjbiXJWYMUCXBm76W/JLCax/2gu8YVipKlfkQpg1BPrGh2ZFOIGlLgRpwpF?=
 =?us-ascii?Q?N7SFJ3W5U1JdfmynrL/oOogVDerYs4UDzlEQMjVTNPECYwXTFk1L3bFdMDAz?=
 =?us-ascii?Q?SsmoOmKuLwDealX48/UqNhXxB1Jw6CPhUhs+cbBlyvkzv8jrky/EHpiXolJk?=
 =?us-ascii?Q?sW6SzOH5LjXtHhhQCnazJxLVrVXLZGqegtDCHDYs2tYWJLiLohUpJNae9ZTf?=
 =?us-ascii?Q?HTe4TGEW+08M/YQSu5NwIdPKncL7rwRKosCY46WG6yiRJgWPUNUm70fiw6Wv?=
 =?us-ascii?Q?yTeVa4GvVfbvsQy5gYZbmg8ZjON8IfroH5abZePnuAbvwZ5bRkG440Ryv8/+?=
 =?us-ascii?Q?iAJYb2J87MGXHibLfbcWeGG80Thf1vhk3v2LfEFdqRt1w5yk2BcWM4Hr3K57?=
 =?us-ascii?Q?FfWebwE6rvuGJRpYw09xGotbIFyx/brCPk8u+N6iNu8qW1qAzl5qs+87OzEz?=
 =?us-ascii?Q?7zn26N4PjmFyANBHBjaI88smxfvqW8wol1ZOipTrPzL/bEkfKgoOwE9hXSQh?=
 =?us-ascii?Q?Ksd8RlECTSGD9NUL4ejBBhYcXjtJgjqQdfPeGxsZIC+5f0nkFcokpQ3t0O6u?=
 =?us-ascii?Q?GgyRvuc2RlJELnRXXL8kXFW74cKcv7Z0eNcQ9w8smfqaGK4HSglSlcZHgbDf?=
 =?us-ascii?Q?cfTVW6zuvSJTQobRkzxdsnx26IWKMWAI1MqrT4m6zNWkylVgFO5naWBNjdFd?=
 =?us-ascii?Q?EduTIjL1LBX23aSawR9iMASlPrVTNhy0OPAse1OrZ7lT+FFqvpS3SMJslc3c?=
 =?us-ascii?Q?zQLZ26L15g5zvOeYIT6MUStWIfXQ1ld/HVrQIVjes3G1NGnSbQYkgQZcQ6X2?=
 =?us-ascii?Q?xILmlV7PbUNIyxW8ELvyX1eKSdMOj2HPA5IMsVzOIp01Al/KfP0PBofd5tuM?=
 =?us-ascii?Q?arpAO3ZNKV7f0SU3IJ2gEbOJ92i/Uf3s986ub4Frrn+ASuTe/iKo4W8NFkgO?=
 =?us-ascii?Q?SOvb6/pJP6207p8laP6rSYgs6csywcQnvyAuaUTsOk3VUJjn/lc13cPVGIVK?=
 =?us-ascii?Q?/54i2YnxQm7Qd0fX5MFWFllPKORlcnN5fQ0AIEY5eNBG9vhMUUeDdJ/Cbau4?=
 =?us-ascii?Q?aScbRw39CLX88c3c4HwvvjipfNV2NLXorb86l1hMEVhCQtzAD7ZF8stfiZw7?=
 =?us-ascii?Q?wQlxwdJrlOfb66TqtFVTCmUQ5foeCHP3k12OLdSdlUX3pwuQCGSUujMxc3IO?=
 =?us-ascii?Q?Z069YO/QJId1koSsPDXlnvIWFZatmj9ULBk87/jboB5IWyzJO6oGUWd3AIxa?=
 =?us-ascii?Q?o/cKVqxEMinT4qu3eGYlZdMdrlRQg5rzscr5fEBFgKt5TbR7nb3H2jmeaun8?=
 =?us-ascii?Q?+3CwvpofKjQk5Jdxd2MfPgYDQ3DZfbehqQt5jzq6G7eeUCuZH16WkZwfM4t9?=
 =?us-ascii?Q?fEPmc5o6gdGpNj0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?seTxRzDBADYGqKIjzOIcODDs8XTTlkyzD29Ng1q+o6HysDDv8IRZUbyAs1cm?=
 =?us-ascii?Q?MzkiTJDny9wcx3thrBBVX2lLfgInNp4JKjofgNuQH8Qoe7aZxti4xf8ldyhs?=
 =?us-ascii?Q?v5zIlXqCWF382UeM18iRhgZaxIeqzer47uGNArhwRqsxKYFbdWbKYgJXCreP?=
 =?us-ascii?Q?PlPpgnb3wEBUbkSt+kEAiQMiwj3eUJeqhtp9ZM407Wz5iN1snIFNzXyBxHYG?=
 =?us-ascii?Q?QuxMP7hgSDQ/ku4hmSr8l/myhvLypPGIpquqno/alSxBcMzHh0dChEGPDNkA?=
 =?us-ascii?Q?R3LI2TxSWdOrCBPK1XVJoeXRlK+/b0Jv09oyJK+5CVghDvDphbCw4LErvclr?=
 =?us-ascii?Q?CTbVmcC/PsESNP6ldzjTFbJKlwUlUMadSIli9VEKurQ4O06MzF0iT8WYLKiM?=
 =?us-ascii?Q?SNgfL98HK/lYp5oj9XFNMocPbCFAPpbGt4FXx8LqjomIQ2FAy1KubUpPqxtJ?=
 =?us-ascii?Q?vaMp9kjMJteVti/jKFBUogieLDo2aVK/OPQop/z0aG0LoPjQn3Fm6aq+ek0/?=
 =?us-ascii?Q?krmW6aEQ2iizXWLDlDBSP/i8Uq2E/qPEeBmNQYOqU6FpiUtOd57z3YE9AySg?=
 =?us-ascii?Q?whIX0n0MwgPPibnn8xepV7lhyyc63mkqeSOFOtHzRLAEMrXv+bgx8EkOTI0q?=
 =?us-ascii?Q?Vi3yl15Ra19G/jml8XxioRn+S5a4DpAS1Tvm1jeSVddbrXk0skjdy/l277MP?=
 =?us-ascii?Q?YXt91Edq8wuj3KmHTnNd0TBV6mLBXp2SUGVvzVNt/z/b20SOHYWD5+ZQIDKy?=
 =?us-ascii?Q?B6SPukEZOxr9mNGMMst2p4fEhJA0MwuYEQLD7M1bX6Uz/ZOtoimFVmVw5cOR?=
 =?us-ascii?Q?1/xMU/gk7CcP8dpNgWfHQRGScgqAVUhSbqS4207p/KrITz+Ku3ldiHUtaWfc?=
 =?us-ascii?Q?9U8An2PrNEUbkNeTtE3S3CpBYSJ0jxQd6gH/ZuAtSfB9DzzZvgfJ0Kz2PlYX?=
 =?us-ascii?Q?NQY1QxzhKGI5WFGxzrIShpXWQ09EiFp0kYTN//cpEJgq9IMjgDGHkeCraPk5?=
 =?us-ascii?Q?Xo7uBrRUOGq7B0Cc29ZT2t+ZYJ4P/cdVXdy/aXd39g18oLsbJVAGoEcMvKUR?=
 =?us-ascii?Q?AuJQONRR6mKbZqK5+Lkin8Y6nhPkohv7Q62XNMStUcjQNsITjc7tyCk39/2M?=
 =?us-ascii?Q?RRDQZdMZzWpjOOb/dZRJcbK0wOhINKCcDv5Eae7+rH8HykHunOJZ9SrBbixU?=
 =?us-ascii?Q?OuTnbCKmAGxxfArryO8Zv8S3lVn4CmPnjEOECkvrNWW834jvh8titeKNEwHk?=
 =?us-ascii?Q?yV4DMTjGTvBNv+UJ4gllxk3lJWBxMcuTLdsYugFQL5TJH/ZlNkVsIeMUfoO+?=
 =?us-ascii?Q?4Pl7eh9kKvKVBHFHrR49GrbSbEOeguxjQc8lXojM+3w80m/g80hNQ4YThJNM?=
 =?us-ascii?Q?ol8n+WUJk8rfdlxDbaKubKUowU4zUwTEY5z0Eboy0s1nmHGgLLH+1KY+xJco?=
 =?us-ascii?Q?z7XElGVuWvEAIoudG/K4jyUvNXkDqS3+fo89WwTb77zeEUuaC9i2M/HkR34W?=
 =?us-ascii?Q?LEfqXd3GImFCSwOlJFJQUQcRwEbyeYOpLNEaGszbV+cohi3lJ2XH5ZdChn5w?=
 =?us-ascii?Q?hbXxC8bcP/eQKtfJ2TaCxE/VSmIFGUuY6blyZiB3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9083ace4-3732-46e8-fc7e-08dddcd07577
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2025 14:23:24.1435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ug+hxfjrU1aPhN+/9DuEOphuss/gI4irnsn17MBR2piIxUD7BQsd38xNlkojnsAm6Ba+l5SU9P7XQ3k2/Vy7YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5803
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

Use max() to reduce the code and improve readability.

No functional changes.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   | 7 ++-----
 .../gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c | 6 +-----
 .../amd/display/dc/dml2/dml21/dml21_translation_helper.c   | 6 +-----
 3 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
index 084994c650c4..8376e2b0e73d 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -1047,11 +1047,8 @@ static void dcn32_get_memclk_states_from_smu(struct clk_mgr *clk_mgr_base)
 			&num_entries_per_clk->num_fclk_levels);
 	clk_mgr_base->bw_params->dc_mode_limit.fclk_mhz = dcn30_smu_get_dc_mode_max_dpm_freq(clk_mgr, PPCLK_FCLK);
 
-	if (num_entries_per_clk->num_memclk_levels >= num_entries_per_clk->num_fclk_levels) {
-		num_levels = num_entries_per_clk->num_memclk_levels;
-	} else {
-		num_levels = num_entries_per_clk->num_fclk_levels;
-	}
+	num_levels = max(num_entries_per_clk->num_memclk_levels, num_entries_per_clk->num_fclk_levels);
+
 	clk_mgr_base->bw_params->max_memclk_mhz =
 			clk_mgr_base->bw_params->clk_table.entries[num_entries_per_clk->num_memclk_levels - 1].memclk_mhz;
 	clk_mgr_base->bw_params->clk_table.num_entries = num_levels ? num_levels : 1;
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
index b59703467128..47ff4c965d76 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
@@ -1404,11 +1404,7 @@ static void dcn401_get_memclk_states_from_smu(struct clk_mgr *clk_mgr_base)
 			clk_mgr_base->bw_params->clk_table.entries[num_entries_per_clk->num_fclk_levels - 1].fclk_mhz)
 		clk_mgr_base->bw_params->dc_mode_limit.fclk_mhz = 0;
 
-	if (num_entries_per_clk->num_memclk_levels >= num_entries_per_clk->num_fclk_levels) {
-		num_levels = num_entries_per_clk->num_memclk_levels;
-	} else {
-		num_levels = num_entries_per_clk->num_fclk_levels;
-	}
+	num_levels = max(num_entries_per_clk->num_memclk_levels, num_entries_per_clk->num_fclk_levels);
 
 	clk_mgr_base->bw_params->clk_table.num_entries = num_levels ? num_levels : 1;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index a06217a9eef6..21cc30f9b8a8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -463,11 +463,7 @@ static void populate_dml21_timing_config_from_stream_state(struct dml2_timing_cf
 				(stream->timing.h_total * (long long)calc_max_hardware_v_total(stream)));
 	}
 
-	if (stream->timing.min_refresh_in_uhz > min_hardware_refresh_in_uhz) {
-		timing->drr_config.min_refresh_uhz = stream->timing.min_refresh_in_uhz;
-	} else {
-		timing->drr_config.min_refresh_uhz = min_hardware_refresh_in_uhz;
-	}
+	timing->drr_config.min_refresh_uhz = max(stream->timing.min_refresh_in_uhz, min_hardware_refresh_in_uhz);
 
 	if (dml_ctx->config.callbacks.get_max_flickerless_instant_vtotal_increase &&
 			stream->ctx->dc->config.enable_fpo_flicker_detection == 1)
-- 
2.34.1

