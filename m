Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3777395AE28
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F0610E787;
	Thu, 22 Aug 2024 06:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="n/sqiZD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2080.outbound.protection.outlook.com [40.107.215.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC2C10E786;
 Thu, 22 Aug 2024 06:55:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l77BFyYHmGTsYXFhzSm5E9Sdh5T6j6abinQCA455+Mb/4zpeDIVETRwbLUnab5lseDizKG+PABYlF6sRAXixxNakdvF03X/a4vhsS/9qIqlHS6zyhLdjlcDcMYauJHobvUA2Sqdg+C0r9/DR9sprVva1HXs2+o3r4Ts/9Eq/yxumH9U4wEyMZemLjq1XV4AmO8JZS8Qo2b8J9g9mgsY1C0oUfHywfJsoxKDnA70sSRPx50vW5p1rmtNUt10ySGhPo8x96lOqL1xrY/m+JmhD66CMQCLH4YaQB1mOM0CBV5FgIQO8Ap7CVoone9FDNk22X5zsV9kSUVT8T6Gvz9TLmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTsu0wrvbdIEE6vA3MQgBXlaN79AI4+N6lS1tqsz9ss=;
 b=faYNCsaUuXM9udTR+4AK0qnHxgDKE9ksKsaaSOq8me9WKko57NIGwvywSuX+fCeUJFFp+Zc3e+HGX5iUIHBSwRR/t93jBnKyQYis2ye5IJnKT0Vhq9/frsPKl9HdBpoo8Ix/QuLLI2Ew7yE1Q6LC5PmH//CwbH27RMDcB2CpXSKoftIYqSpe7HWZ5JJd43EACkFdQFcT+fGallYevtwDG0IVXGECvORsvp3FSHJWlTNsstnB00izW0sg/mkJQZ3qT7VqH8nrDGiAVjGx2PKUmgOjLZ21RZE/yJK61rR5ruMZi0Spi2ILytZ2mxRphTibUZ0gK+ztnXRhh/pJEh2Ppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTsu0wrvbdIEE6vA3MQgBXlaN79AI4+N6lS1tqsz9ss=;
 b=n/sqiZD8jP6H+62tXUx2GV1hfocf5+c2ZbvO0rF0SGM6NNW8VKWaIwkokW8vPDNwvM1QChyIzmIceG28+eMWRPyGP2BYHI6el8PEzqID4sG40rGb3ChKNQPgfhYzbtwdOH3CCjvKPTN9noMDJJl0nMRe66KfEeMxw05LIkT8yuMp1pHj/dfZTYb3/0OT4kWh+EDI2KwWsJUmpQvHznKLhfG8gMf2Gi/1MAQ2aZ2bULyqsf4gN3G8hp0I8zDEw08Taxq/sC4LLShWFgVViC0sHBp7Xm9Rf7l0PFNOCgFfoSVUL7qCSBGXLrMsIaXR4X87ecoWRr9XPwdGLid4Mp3+MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by PUZPR06MB5982.apcprd06.prod.outlook.com (2603:1096:301:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 06:55:17 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:55:17 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 4/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:54:45 +0800
Message-Id: <20240822065447.1333390-5-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822065447.1333390-1-yujiaoliang@vivo.com>
References: <20240822065447.1333390-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|PUZPR06MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: de5766f6-a67e-4262-29a6-08dcc2776194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vjU/vMxmyuhiqygfdPQaK53WTqAYRvL/NiQmmcywaZYGE5XcHYTcEk3Q3/ji?=
 =?us-ascii?Q?vSWQABMHLh4KWrM9Y78JlfKBrRkdr5T0ZV3sLr93brlHFB7GPalTD+pTRdz9?=
 =?us-ascii?Q?DbmqyIVIll6SRW20xxYzzrX5wl1V0RuBrabLjzlcMuZDqiVYFpXiX8bP581w?=
 =?us-ascii?Q?+TEWpER7jrWZJaJOCl3J6URPi0vobe9XE9bj79oWDrhFw7eJ0djoLOBL94dP?=
 =?us-ascii?Q?haidxjp/vlkbRwfdQ1+xbkbfdBE7La7eFH4qlM0xvNkbPah92LlWFBibJkQ+?=
 =?us-ascii?Q?cOe6HRmUBUEoP4Tvhk3ZiUqgrEdObwp8h6wYiAzKV+jTnCaYQj3fkSbnVI43?=
 =?us-ascii?Q?KKtp0njwSUlps/GYnS7jwvQaswUp2OtYggx7BVY8ORyvB2ulePKpPzbOWGv2?=
 =?us-ascii?Q?cQZpzuAAjoOB8t9uK8R2b6BBbQhiaoAq05Ge5Ni6nPNCf+hqYJ5HOqwTigrY?=
 =?us-ascii?Q?ap2eNqsG44X++Vt8yAgA4CMizAwTyaMbGBfEcl5SMEkbKHFmGtAohUtpL7Ud?=
 =?us-ascii?Q?nUcLCOD9nEONFETtmeltlExsnpYgwoiwZ1Avruh9zDzydEzdiZZYsuIhAJKW?=
 =?us-ascii?Q?IQQQjhuI2osNsjaGN+SzNi2+xH4RSMwj/mMrBq9iq0JU2WHKpiz/02Z0LRm5?=
 =?us-ascii?Q?19yM2+F6FMXHUzib22HwioMUs24sbQKSc91mPof82ULuAfemMK8ZyGJaN+Pl?=
 =?us-ascii?Q?DH9jBCpO73r91IQf2xHxve8LcEYejBOHLU6NvZAN0+GJ8LwBdqG/aZZq5i6l?=
 =?us-ascii?Q?PrJi130YU5KTHwp1moeL5nPf02yMKcQA9/VIlPuYzM7qN13aP00VIfr9Tj2P?=
 =?us-ascii?Q?Qsoir36fy8hXHM/ODgx/qmB8aE2qmMJ56JDaET0GRHmwNllaYtq4xPL6itEW?=
 =?us-ascii?Q?d0I9+Tdhoy87YTS5ckfTjUPFJuc5hr7QgHlyXLyuAlyLLusMrRwnUqQwF+pb?=
 =?us-ascii?Q?GQDAUVp2WyjHhi/Dqt8tYXb6ob4h9Qa9SPriQDnl813fEjD3qO6VF6kq4sQK?=
 =?us-ascii?Q?dssgg+yjXlxI5jd6LvLCeSQ7Wo2culntZ/EoYqBRbn9af0oVLRtUsXm475+i?=
 =?us-ascii?Q?mOPQs49odaYTho5feBj0gbm0LZR2o/HcmrE26d8ZuPwB7E+tx52WOmAmMlqm?=
 =?us-ascii?Q?SanBKNlBLFo2JirSU8MSATc5Nkk1pLtKbMKONUuUSkJ/dZlMqGRFihHTNqcX?=
 =?us-ascii?Q?bhlY5+RhcIXaphUnXW6OnGzr+qaYbDX0Hnqy9J0CbsgLxMbV0QLsP1YL5IoY?=
 =?us-ascii?Q?6lg+ePMQdIbqSmAPLy713B/LGM6We8I9kE6irSvzKEw7M1l1qOH2flGKD2kS?=
 =?us-ascii?Q?rPegqGXiGpvJmoyFONWkAujlUKjX4tt9afHW6f+hIvkYF6Es/gH+G/oA22tq?=
 =?us-ascii?Q?XMzOPAKCCR9MCithNX8xaXVmW+/UwB1YdC8mLUJPrXkA/FhMwj2xouV3p+CE?=
 =?us-ascii?Q?pt3Kr220je0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E/l1g/N3/ZoOYIwagU4mMyss7j+Mx0FC9gGvVH94dhUFCRuwkbRXHOstyF3m?=
 =?us-ascii?Q?hRtC+KqN3sUO7CtkLFy2RjHKSnViWXPoeZf3K6HZ4426+72WTUHh5Kvljynj?=
 =?us-ascii?Q?7Fu24zDjo+TepGMNXAXBh7xDsqehscCDu49edYb/+qyu/ANHXlhQgYes5Hia?=
 =?us-ascii?Q?he5TsiEwdlh5TMrluEJek0bOrctgX3IAhJr36hsDAoQ8fs/Vnl2wCbm+UW4z?=
 =?us-ascii?Q?1lkoWuqq3kPZEerK5YBbxOMGP04bFWNchmQClVh5qrMOntTzpi1HV1xdFe1J?=
 =?us-ascii?Q?BVvWoVoXei9uM3vsSgouzH+rmoaZpjFp1T6LNQF+d8lM2bDNITc06cOnXdTq?=
 =?us-ascii?Q?Zo4FAbSeOJUqJlDHdR1Puy0CS6KLK4DmAJavX/4cxPARxz0UF3H/KJDExhhk?=
 =?us-ascii?Q?/7zY5YVlRE/p0DKVuRYWhByoFEH1JqrvciuBCmGswdFNZ0OZXqCjWori/9XX?=
 =?us-ascii?Q?YEuuZ+rvH1icTDQlWuHAknZyAwkrXKX9BC0lP0pVMfRdCCHinQjYuT+NDSPM?=
 =?us-ascii?Q?AwvalWGEfle/gkfl0nwSmcr0oEUbzIN6tJcvFtHUXXbjgQLw6jsC+9XcyFjN?=
 =?us-ascii?Q?wutTHFBzsnj1OxNg2MdhpfTgvmGRM4d8WnqyjYaMHHummZipIgOYcUDOMw26?=
 =?us-ascii?Q?HtK0g/I/yBsSMoeZu0YdAnnKfr3TTHv5pDrK9KW6VlOUneaZMN6mWoEXQuOV?=
 =?us-ascii?Q?WuZmbDRnGI4mS5KXV9P1LTtDchHiCr+6LGarIrWvKiWkJW8Fm7xeSyVwEsl/?=
 =?us-ascii?Q?VW9H0djJZbA+/RGzWRC6sciAMuNuKMoERSdYLhkNHijHg4+KzHuzrUhAJ8JE?=
 =?us-ascii?Q?9GRkYiSTHOrvpw3Gb28izO2Dhfzy6cdygrKxFszqGRTjpymWZC8GaxRxuNP3?=
 =?us-ascii?Q?E5o7IEfKNJcRh0f5YcE0UxNR9BNFkVPUnRt548y14UdY8klH6pZWQg5/+C1n?=
 =?us-ascii?Q?yd+DELskdEAoyCbgfs2Wpp1BCxbSP2eUhNYX4tyOBGYIkGAZDlDcpUVFPZWs?=
 =?us-ascii?Q?E0JkB5irPiGTyoMA5AnvEMo9+xQu+UquS8IDhDWOIVrDTMykdmG0/1z3RM07?=
 =?us-ascii?Q?VmZyob46qBlHjpG1FyUxjsHe5l0eejkmye3aF3IW4p4jqxVfAb4UL5o45hly?=
 =?us-ascii?Q?VNYFXq57wZ079xao5cLkMv5h4iIyqOFzJPyLdwk791+emHTbxKrgt41HZji1?=
 =?us-ascii?Q?9Rf/sMYCurOImXgb348K7HWQweu+rFoFsY3qFSxwZdLKBYjoV0wrV7BxH+l9?=
 =?us-ascii?Q?WA2Q81QxZiNIOMfo8cT28MGAqd9FXE2ufrO3e9tO/wU5dfJN4BTyGxQGl3HX?=
 =?us-ascii?Q?C16wkJAUB27T2D65jqxbPWtTdbR7NVndkSpFF/c+SOmfqcG8TbDwaHeR/CpK?=
 =?us-ascii?Q?b/rReLPlUEspSBqJcR5f6y7Boyb4kWs0LjwTsSjx16wlZjbvJoGamKWCPm9x?=
 =?us-ascii?Q?yGXU/alPJcMAIkMDx9BZOAjpRu0ZB4dbv0dKnl04BMsdRF9YYrnAUpa+bV2p?=
 =?us-ascii?Q?I+11GHRuls5iPs/0FU19ysxLJaCwGjWRhyVU9xqLG4SlpI57jVHSQWhh4RRU?=
 =?us-ascii?Q?CY7BywvnH2koyCHPqIYCAx3EbQOagkxtd+EzDgcS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5766f6-a67e-4262-29a6-08dcc2776194
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:55:17.5527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGQCHCRxng08gSgleLRfFGqhT+fJAYWKH1xWGEbPOoiKeMsxykg3plBpMLYdGzu6TyIZEMxL83I/h5QNACnOiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5982
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
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index b1265124608b..f48f8cf1e232 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -606,7 +606,7 @@ static void populate_subvp_cmd_drr_info(struct dc *dc,
 	max_drr_vblank_us = div64_u64((subvp_active_us - prefetch_us -
 			dc->caps.subvp_fw_processing_delay_us - drr_active_us), 2) + drr_active_us;
 	max_drr_mallregion_us = subvp_active_us - prefetch_us - mall_region_us - dc->caps.subvp_fw_processing_delay_us;
-	max_drr_supported_us = max_drr_vblank_us > max_drr_mallregion_us ? max_drr_vblank_us : max_drr_mallregion_us;
+	max_drr_supported_us = max(max_drr_vblank_us, max_drr_mallregion_us);
 	max_vtotal_supported = div64_u64(((uint64_t)drr_timing->pix_clk_100hz * 100 * max_drr_supported_us),
 			(((uint64_t)drr_timing->h_total * 1000000)));
 
-- 
2.34.1

