Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A62B1E0BA
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 04:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC6510E8B0;
	Fri,  8 Aug 2025 02:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="E6oOlaeu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013053.outbound.protection.outlook.com
 [40.107.44.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFFB10E8B0;
 Fri,  8 Aug 2025 02:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xM2lfcC3IXQBIug02f/TpJBL/DQDDS8PXWNupLvgD7bjCgn9PMKFyyk3ysO4hZM40L71DNZsrnKg6UANR/LDzUhTKWVibUL/S4QmpNmhQjxV6fKh4z0WUBRXFndikbxBC/AhoSIzE40KRQo0Horuq4bXDzfa2JR9OeYbpeLrSE/K1RusnXCGUt1hF+wMvLuDptQTf6GvB8tyUiSmKuSAxSSBZ/5L0Vze+nHmszZYRunE1rtDxQiBn48sb8kR5X15N6q8m4qfIenq/pXzNfaQBzAfWN3axOr+kLNzzVNBtEvZZh3G5SEGCpPtQ92HdK3rgW61o55JKN0P6UFCQKS87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLdMdNTprGyocuu+cnpLjyCOZLG8Dy8G5EUnwVVJ32g=;
 b=asitxN1XjHuHn36mI9afO895qgQImb4zuiwbwhPwawz2ccj41vU0ZciGymvEJhMEFzqY6XRxGoVP4bjLhnwBCkWXQ8gIJUP3F5PMdUT+LGmh+NYXKaO6R3BmxfrmOwbLT3YJ2Pzx98HU7nVOtfo+JLdxx1zjmgFtUp0Sqg0LQn7+n/BgDXX64lVGF+VRg+f7mpw33ZylER+OT+AV2kYsuQFiH9PhNphWuMWyt9wCypobq8Xtk3AUnVDg5bGl3cVbmg9W4zvluNxrazSZQQiwEeksl9qYfCc/AS3jCQEuJMC15VOR2i6RB7m8F7XIvJdj7qE7gvMGA2DLR/sgdcaVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLdMdNTprGyocuu+cnpLjyCOZLG8Dy8G5EUnwVVJ32g=;
 b=E6oOlaeu0vHPXqZap4oWeMw1ZEXRzTXasOjEjF1hwTmZR5amp8wmVnJsVuNzhGRi/Ac62clUbEGNgRJ3dN5sbEszCLvkRh+DnD91TIvxHcdDjPWoxIRMKWg9j/QELwXp1KSA0Y8askT5c5a8/LA3TGSKy/33Fb8nCHOS1IDNgFkxOeuyGJ5o3p4158xddvvwRhp44AnGUhk46SKiyxd8Em5SAepkQoaP6LhOGCHejwpeNPbzlTkPklfrM6XV/KsgCizZm/k2N+/bO13GaqZsyAjmSW1zyxhFVx8QGv6o+haZHhTk60hKfPXYhyTiEsEP6jS6zpXSgFF6/M1eJxha2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by TYZPR06MB5481.apcprd06.prod.outlook.com (2603:1096:400:286::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 02:52:22 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 02:52:22 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: austin.zheng@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: siqueira@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] drm/amd/display: replace min/max nesting with clamp()
Date: Fri,  8 Aug 2025 10:52:09 +0800
Message-Id: <20250808025209.120448-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To KL1PR06MB6020.apcprd06.prod.outlook.com
 (2603:1096:820:d8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|TYZPR06MB5481:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d4b360-61d4-4696-e1f8-08ddd62698ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wVk60xYz9S7fSOTNbKO+oWP+81ZwqDZT7Mi8GY48zh9qyZMx/pSxiSTIV45v?=
 =?us-ascii?Q?YQR2ZLcuqA/MV9HkMl1q7cc+hpwQ6JL1CpUt3KOT36W4lcFbgD0r67C2RXro?=
 =?us-ascii?Q?2inBRDMrE5Tj/gLGnn0ZDEVOPRGwjmGfDBJGsa6yxUuKFSLnVKxAepkZnF8j?=
 =?us-ascii?Q?forKpBNOdu0XJsAEblxpB2N78NyfOu1MAW4G9M3ZiZdwUmShVzoUuAWV7gyc?=
 =?us-ascii?Q?0yWtCC3I2AX8bIZunMzPvwBMsLzq3kzNisQfvq9krCowaR5I9IPtspdiQXSs?=
 =?us-ascii?Q?4FPgmvg77C31+Tbh+Zc88t81OmSXTIwE53xsfIIyHZWdqbe8tHFIVbhFYKml?=
 =?us-ascii?Q?DrOPymFQPlU1mWmfH9lii3urg6a6rJHoY8Bo74D249sEw7RIZYLIdvioV9Ao?=
 =?us-ascii?Q?3VVFD/ib6ZyEX28H/bRU9iDrgDpCdrB3ymPAl06ww1eFbkLLfF4W9nEGaBdS?=
 =?us-ascii?Q?Lx+5UXU+1YfdmHOEFTUPgCG4mkN+PgzcCqtucZpBkyPrWddj+Tx4uoDhINrj?=
 =?us-ascii?Q?AHHMtLN5SVZ5ykaJmgY9Qqx83+7O2uRoovzlZ+bsHHt3t/A2SJagTWqlIU8H?=
 =?us-ascii?Q?nNMJt3H7wMunY6Ux9axf7CA/g07dbUz7lj37rauogyNUlA9pzMjv1qI9HFVs?=
 =?us-ascii?Q?ck1wgil39q+geb50Yv44MhUDEtekoEuDtED0JXMDJ5u5fGDgm3lt7Ia+4sNQ?=
 =?us-ascii?Q?6VqbxZ3Qp1BjTMdy0xs8utVrYCRlcfad+QEqbZe3AXZN01H/TSTczYtDPAaD?=
 =?us-ascii?Q?zrAJTBcftrX1wDbe7IvTT+0Lg31xuOxDA15lsoybqt8UNBJxTI/3zdNBQgfW?=
 =?us-ascii?Q?YmQ9DdqYkfTDnCv+zbpX6GhA9f4Z9X1En97cHd5YMXHhrGFTnvtQDBx3licX?=
 =?us-ascii?Q?poA925EUVEwpFQbwhRRXjbtaQG1j5AkETLAjIIo9UsaRDOzd709xPyWN8+ZT?=
 =?us-ascii?Q?mCKzxmfOTxUkrDgvOQMEGaSt+Q5dQW9gGE8MoeYCaK2Y/bnvjvzpR718wiO3?=
 =?us-ascii?Q?gglVo1bQ/u6NdSGBAEHE1pa42u9Etu3Dhf7oMWxfsAGqXuARdSdH78eijqyq?=
 =?us-ascii?Q?vs3kFoEXYcr3CVpTznxbeXX78/py1IQKzv35g1FvullrU6Jaa4M49TL7MibE?=
 =?us-ascii?Q?ZmMbhG4HFoMLYbG+7o2lEKJKppglcUEhRa2r3LyCIuGNuSL/1+/xETfuGI2Q?=
 =?us-ascii?Q?sDf3dYnOX5oxRl4Wfx+yqm/ReB1lWwWZJJHo5dFEu3/E0QAtHbcazS5hpLl/?=
 =?us-ascii?Q?arDV5tY1zm+e61NEy1rzqdznVs5V/48hRGFFzFkPgk+BTZf0HSZvvpyIH9S9?=
 =?us-ascii?Q?iZdfaRhT6fJinnyDohcKXxD3xQFP0EpDvyH3thS/HI/W5a5UVmnohLdFblze?=
 =?us-ascii?Q?FnLuBfL6T9sJenkYJwwl67Ov/SqWtvZSzxcReaj3NplZOxfOWOAde9EgDbvW?=
 =?us-ascii?Q?Q1RCIXGui9IN2yqnQZgweqSsQqdB246YEcLFMkvlKJl3EO80nS+XPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR06MB6020.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2enXPvcWXGtcv6r4LdrjwufCr41OIIdB8hgbWJGCPOACXR0is0dnwXpPhRXg?=
 =?us-ascii?Q?OYqDXRyWL77HkdicO/suKKy7Y6C7llS/Xfw5NL9AA1CNUquGp4lylkj+SbnF?=
 =?us-ascii?Q?In8jYjvlZPFF0Qj+SU4a84dqPpPFHq3qZV7dzU4Pcuh4TroEkH8B8D0QDNab?=
 =?us-ascii?Q?UDhCqQ52SImqRIqZ3IWyLTJxpDCO8gALIRmv6tScBIiI+d2zhlQnjXdSJlJc?=
 =?us-ascii?Q?8TtsAAiThALVtJvGwD+hHexD1TtSpsQhCSFv26m+zWRx10QIGjEt3e7mCUjf?=
 =?us-ascii?Q?TL/RUdINA3VUjpexekHu61G5v2TmrQYHEsPoonnJqjmSYFIGqyXUtm7lpRoY?=
 =?us-ascii?Q?O61vB7XbXYOgHT+C/+1q9661qh18rgheNjomzmvj27RwgeOKYVjvzWTYLXSq?=
 =?us-ascii?Q?zN4zC+LGfixBBwkBHfVyNobGHYRwJFmofazPMySZNZvtg2rIUkrNMuZ8nx5Z?=
 =?us-ascii?Q?a2SXc1yVRJFscKeT1tndJfBXBBCGTrirPG8DgvoSKzR3MG5cH5Fk30dixiXE?=
 =?us-ascii?Q?XDWBQvJgoleFzQdooG/mczP/ySxr12jvScdeHIeVG8UGCwDk03HLRgvxW/1I?=
 =?us-ascii?Q?eDDsJAvApFb5Mge5ON5E4+7lPoq7S0MmkSCHLB8Ho07fA4QgwYEg+0FdUu27?=
 =?us-ascii?Q?UmsDIGJsjMoJY1ZdvUhma2Ep4DuB9cqoVbh8jD6HgNzyEhI6mfYWn/i81WLM?=
 =?us-ascii?Q?Dwma+kiLLy4A8N5Sjclzdo6B+HJXpCG0PFRcnBKqK71buvzzWrkkx+YjLva/?=
 =?us-ascii?Q?q2lNfUVpnK64YOkTLPBfNJcNUoAqRl+a8QyXX5FIduP9CUke8VQYNDP3u+x4?=
 =?us-ascii?Q?S3/jVK8EJuzPEGUlYGBJJ4dECwu9B7F6DMSoJNCB7KZKSAVgZaA6sB8429PK?=
 =?us-ascii?Q?ISYJS5anfi6OFOq/X9xRZK+F7vVBziLMn8l806uvrT5QA/utMZ3kLS0FPlKQ?=
 =?us-ascii?Q?S0+/Ksq90Cy9xm4taXYkR/Oa9LH2NOlncQDtb1dF6nxOCorf10cTuGpk94mZ?=
 =?us-ascii?Q?VjTq42cT9yEdx6ddxpYB26WpZCxckEwNtvY0wh5p56OK9CJFcUJkS6eM2FBR?=
 =?us-ascii?Q?9JT8d0NoomLU7EQ6ViZKmoMkQo96sFT0cQkyietqxV9umtxyV+06PFSWl2eX?=
 =?us-ascii?Q?XhzZBntbifQrZfQBXozWMg9IqZIBz3mNkpQPYgEQf1hI3ecS3/EBU6XsqMQh?=
 =?us-ascii?Q?n/4LcAp3Y48c3aXGWWC9PTrk4IQfuMQUBvPAhfdijC7MBPLWYLDLsfc55ZKL?=
 =?us-ascii?Q?nzKD1koyk9oVrDb2h7pxJe918tCEgg0TzT64uF9okr9FRGtqrPNNN9kNJDUd?=
 =?us-ascii?Q?FAZwXz88zD+g3lAlWERmntihh3vODl67lhBKxHl7Eq2CDLCh82FeRsLhcX05?=
 =?us-ascii?Q?Bdzo7N24CZ3ypmePkRjk7kC4ZdDo7A2ZpJAK8quSD0y2rkKcSLa6BvnrNDj7?=
 =?us-ascii?Q?6x2cK9RLGL9mBDaDNYX0UY8Yt1bThvNHRAx29CbkENPFHKRNPsRZNFK5Xqqr?=
 =?us-ascii?Q?NL1xWcGox3m2Ad0sFWXOaVqVeV1Pl3u0alONE51Pgm1dm/Mh74NFtw/2Cl7Z?=
 =?us-ascii?Q?wSCYnOQ1gh6sjTrlkhv87bJTeahMs2QdRq075edq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d4b360-61d4-4696-e1f8-08ddd62698ec
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 02:52:22.2046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1sjsSMZV+JzAH1J2HkImGDAtHR0kuii0URzHwHezT8ymjpCrmwFeV8npwSvlWg+72EoWAG9DI2cNum7IBAIYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5481
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

The clamp() macro explicitly expresses the intent of constraining
a value within bounds.Therefore, replacing min(max(a, b), c) with
clamp(val, lo, hi) can improve code readability.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
index 0c0b2d67c9cd..00767b8ccdae 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
@@ -435,12 +435,12 @@ void dcn301_fpu_calculate_wm_and_dlg(struct dc *dc,
 						&context->bw_ctx.dml, pipes, pipe_cnt);
 	/* WM Set C */
 	table_entry = &bw_params->wm_table.entries[WM_C];
-	vlevel = min(max(vlevel_req, 2), vlevel_max);
+	vlevel = clamp(vlevel_req, 2, vlevel_max);
 	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.c,
 						&context->bw_ctx.dml, pipes, pipe_cnt);
 	/* WM Set B */
 	table_entry = &bw_params->wm_table.entries[WM_B];
-	vlevel = min(max(vlevel_req, 1), vlevel_max);
+	vlevel = clamp(vlevel_req, 1, vlevel_max);
 	calculate_wm_set_for_vlevel(vlevel, table_entry, &context->bw_ctx.bw.dcn.watermarks.b,
 						&context->bw_ctx.dml, pipes, pipe_cnt);
 
-- 
2.34.1

