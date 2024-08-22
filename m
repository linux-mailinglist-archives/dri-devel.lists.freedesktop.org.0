Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F295AD8A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAB810E035;
	Thu, 22 Aug 2024 06:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="VoqjnAiW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2056.outbound.protection.outlook.com [40.107.255.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720B110E035;
 Thu, 22 Aug 2024 06:32:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXtIpO/d550ydKBI6J9APSpMsCPI3CcUP15lt8O1uQ22Wc+a/lBEgAS77KWCo0LB7dVpyzZ8sJaY/dR/5ruhCCtiwNN5Z+C1wdv9bM/3Mzow8qkMilhDgVqsTvRTSVDgWb0I+bBBVwWIYQ4PW4ng4Y6q6PtOl2Go7lbJi0MJYJowIWX15x6gd1n3/kmPXpkcvD8qpyBpU8vM79FzgRQWu4sv4lGM62V7v4mnaEHz8gpl9jblTC/t0kfmP20oMryB8w+cuQzNqXKZIGOi/M94hz/YkRY9fddtQXqfVHUOYDXS0cOy6hodOijbsuQkDHDM0nuJ36KHKIRoiUyo1JcNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTsu0wrvbdIEE6vA3MQgBXlaN79AI4+N6lS1tqsz9ss=;
 b=hcjvOBc5uUG4WiGxO8w0++9psOjt9MrpA4HPaI3EOJttxCBR6gVVnirgAk+oMoChPwL76wi9CZlK93mBIvTdfEySi5Xqp+sAIPbc52Rn9b76ZhnxOblh4/DWTjBUW0RW+iVFO/SudaG3B5c2jNN5UjIcHmZbpPqGGUErWnY+R8UApSBBoOgg7Si9YevY/QsJcWcZkNcdSvQJHaCiQqMYVRTypl+X3902PrgftQzoISlWHCQuO1fSdyamQRVLueWxeudxrc1bg/1jwHFsk2259nnLNKxNAnjldPaTPreCMXcKg6vYeirfsU6p57DYLKnSU6EgleRHnTPq7yi7jdVtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTsu0wrvbdIEE6vA3MQgBXlaN79AI4+N6lS1tqsz9ss=;
 b=VoqjnAiWk/n2rW702B2OD0/CkHDtz0/5bNBVz5qNxqEuso7vUumEC3Yb+KIAy5CZ2sMOn8m4Ind5PqKo0xFFbaCk5QcXP/LADbJovUtrTDuBUDt3NYkEsLKmSXEJ93Hb+91z2OjoginTy+iKX5TNIx6cg2Pb72JhUzRgtBIycjSAI9vZGgUnW/zb4NNf4kED/bXN5skElPT0zHSTNx2CjtduWZWwUTXWeUInq40KpVbFcAvIl2Gz/F4d1UVImHD7hM1CTISH6CiXyLQQNepHgJt4ppGYmzRwyTF8BpMeBV1NcDWnSYzOLpZwugbg4hLrDiMc00jDrvd83kHxT4VV0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by JH0PR06MB6344.apcprd06.prod.outlook.com (2603:1096:990:17::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:32:04 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:32:04 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Duncan Ma <duncan.ma@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, "JinZe.Xu" <jinze.xu@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 4/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:29:30 +0800
Message-Id: <20240822062947.1318340-5-yujiaoliang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1dbc1ecf-2852-4624-a0ad-08dcc274236b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sEQpezvNG+V42wvvOrLhsCqxeJ2C4IXAOez9CzSSAGeAFP5xuY2EzJkgAJOA?=
 =?us-ascii?Q?6yPn2dhqksGPgpuBjiV9hHpTIcxj2iPfoleHF1kqMyQ8epSmlHJn1T3qHCkd?=
 =?us-ascii?Q?JrIWokBTfiMDo6grRr0ZzCETZmpaPOdv3XfaFHnX21F9RrE64s35SW/iQPpt?=
 =?us-ascii?Q?drR6ibh3pAoP2ei/W8Ba/VKVkiGkVFTTObgMZz+fPdii4/+00SUOp7fIFv8a?=
 =?us-ascii?Q?skR4Clz3KY8Czp8+O3d7rqiJD7yM++r4K7e4VC0PJ3TtSNedjlEpFJRfRFoL?=
 =?us-ascii?Q?eFi5hIhObmOPBg9vp3khFwzkt73oP6MG+OnMIXllup3+sxtPxRudqMVnBYOb?=
 =?us-ascii?Q?FrIq1y6JT3C3W+Rkg9kVMLJNVtDSDxDr1NCsX9lf1XGmmZ8uDok8dWU9M5VU?=
 =?us-ascii?Q?Gxk0WJvicyjPaWF1BhNclJp27bPaKCCNuq/hDSBafFaN7UJ3MN0HRNwurcNi?=
 =?us-ascii?Q?zQ5BoMVZ+yNW8uhkR3v4mEIRVrbnY30sQz3q0fqPEQk0PfCS5NEYLRh5Ixq+?=
 =?us-ascii?Q?KKZoQwFsMp3p+Rjs7ZTFuEMIHIIt9tpQgCVIGv6XKiAbW4bjfHOU36cVo9H4?=
 =?us-ascii?Q?aLXyOCpZXNc8zP5/ukFv4nm8Nu7V22qZaN6ysjnHJIKNJlogXA1N6peJraUi?=
 =?us-ascii?Q?RIm1pwMyvk71qF1VJDdSYGq4qlB8H1AUCXhxKhZOYw8j6r7yv2R1NAXwptYi?=
 =?us-ascii?Q?DASojzBfhebh8cTR4hT4fQM2ZvOfrzh6eOuDg8RHEIscDTB4nyhz1SkkqZTs?=
 =?us-ascii?Q?rwwiryHf04yd72fiXLDmHbm5FuRLusc5jj70+/iEt+/skv2A3lRl6ZdiCFxW?=
 =?us-ascii?Q?aEADfEEI5SbV+/kyxtzBko790Jwj3cjM+ByMRTJRNb6eTPxuxpSFyASP0gtc?=
 =?us-ascii?Q?NTzNI8k+uHEgwuecAhI3y/jCZ6fKiQaecQnB5QHT3qThRBNCpJ3OUyTV+gEw?=
 =?us-ascii?Q?tf7x5R6asAm3uBVC7ahvoJ5dmsUOvsnDY5NxEgZlTpQq0mRmIfYJY1jYnLsB?=
 =?us-ascii?Q?+QlzN0sJDK4AXfca7GggAKwXg4oOn5EG+TUeE4RSLxkfhiganyT5Usk7F3vi?=
 =?us-ascii?Q?myKehSpwCu05eV6DWYPrULConNfPODKPb3jOiQfVxmsSSRcrfM89Wbxn4Hek?=
 =?us-ascii?Q?QzhJHoRxB1uNx5qhRtScdFR5on4jbvkaPb5Jvc4KmwsLZa7KIAu3wa8C5tSD?=
 =?us-ascii?Q?o2OGeKmyiouNQKLWsZVi+km5Z7/ReUMlo8ctHD6JgyH6S+zyjOmlN3ZBDEbe?=
 =?us-ascii?Q?51N+Tcji13MFifAws58l3SR1Ro7STlPTS67eTwblyeoFmhgmCJV4wupU+bwT?=
 =?us-ascii?Q?YAw2Z6yZxGgMy6AyqCCXs+i0tqDaBf5wtXUxffl+XD6183XIZ2qWY+0jU90u?=
 =?us-ascii?Q?UoGW27vjyofRccJTlgIMcer0BMZEHdmS/zIjI+rhjvRG4euMReROolDKJa0X?=
 =?us-ascii?Q?JzEMP8WDDP4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x6nDsXL4LoTy4H+pgeoSoGsffTyokPjFPucE9L+SSH0/t4rJfAOOUlfuJrBP?=
 =?us-ascii?Q?lJuDdNoEFXmkQ+VBak5wdZ2DU6PqEFSZ71t+vTDMY/mFbYyprBZ5Z4RWDUzd?=
 =?us-ascii?Q?NfFU1JTwmlQeNZjQs/xL8MVOrBDHoj/i5EY8hqPerMM3BFSyzsGEkVlspsQ0?=
 =?us-ascii?Q?y4E93zXhKeJe3m9Eda4ELMhLxEvxwpzDtjXG4bTe2Dk2T9xEKoWtJ7QvdG5P?=
 =?us-ascii?Q?q6HhSKkohEiTM5/7ljf5nKdidoHeaS/e6NEV6MjfoV3OvxVPrItlQJNAKzSr?=
 =?us-ascii?Q?TZtDLep6rBgrOErInbl10E8+zvPWoVwcDHFGqxTjqJnnQa8NVayyWlq1o7fz?=
 =?us-ascii?Q?HroBR9pC7KOOoQLEeJfxIPyOG8Mr2lIaLsvkmho9mz0vD4ibGfw3pnailZde?=
 =?us-ascii?Q?xsvauVlquluuMWHZmUjgB37PiN+34HA5POiqKHpb9kjQbvyj7Dyg/Wb24tCv?=
 =?us-ascii?Q?vpgvm/U7RTyxnHCUpy/kPQoHe2h2tZYNdoc0jPCv2l9H9ZwO+6XjxCE53vE6?=
 =?us-ascii?Q?M27728UunkYEfUh93dkVa6YVn3glok2z6tA1HamzMbEQhYmwH+D/9BwhFMbt?=
 =?us-ascii?Q?c3qlS/xnQd2GExx/Mfcv5l3XJ7UsxtlJyseyUByyoiTU6EL4yn7g+QaLeJeo?=
 =?us-ascii?Q?ISbYJNbe3XkFZAut2M0o9kXovXVGZKt3Hsv+OduzHAUkQL9uUCvbQFGUJx2U?=
 =?us-ascii?Q?pApf/c0vBJx/6kkOKbudkPraeevA8FbxUuvR1JvgobaIV0cYvqX1TkVJBrZr?=
 =?us-ascii?Q?zVDMFli9sC3Dkq890SOPOBkfovEX80UefQdThBTQQCwx8rJZFa1Yydg+cNfU?=
 =?us-ascii?Q?k8pOcc/2obPvn3030EZMNNRsv8ikMG9W+WPqDhWhqUmUzGJRZRCbhtNgoG9s?=
 =?us-ascii?Q?XKGHuivPNTQIh1mJ02qzAJhIp105I0ItvDXv3ecVpb2mEyOgHQz4o1ZDS0/m?=
 =?us-ascii?Q?rQSgdnVlaWOFEFMHRxeiK74KYLIM0DppPeegLWGjf1K8AXk5DEJGccij2dj+?=
 =?us-ascii?Q?ISaAcKtEyNBHV4naiifn15MJ/0tYvbN8mtTrJ81+SM2YMw8PKxdJsAxYuNEj?=
 =?us-ascii?Q?a7fMd7A5d0sxq2cqN08PqhErclZ+m1fRAV0xNgn26HQ2C0/wbI2Tu+A5Cm6R?=
 =?us-ascii?Q?jSoezBgIJ7vq41cRydpjsNhnQnAhK8XUK177CSjAevij3d0p7OuUsAiP2zAu?=
 =?us-ascii?Q?8kCA+zjMQ0bU9BE0Jf2UAiM2HtMBPOzLKUZZbN1kwFuPRo9kN/X6dBjrkrQH?=
 =?us-ascii?Q?ziBNDPb8sj4W9CNhVeb8zjwZN8qgEM/H2/dlS/5bcafOUk7Yms+MpKHvCgxr?=
 =?us-ascii?Q?XxgSM6/Qz1XKEn93JqL8qcFKhaCVq5zhxx2Ja52GEH8aZqDF7CUOShXpkRqK?=
 =?us-ascii?Q?7lQBzI41P1VJIKwvtMA0zArmFZkaa6wo8d0VfPFxBQwsiwxm4Ta++LJOD+YN?=
 =?us-ascii?Q?V7LbkALzA2uMaxh7mJtwAjc4zTfoVd8kAPR0Rtca5UbKi/dkyy1Atey/e+k2?=
 =?us-ascii?Q?pEJGDIKqMsRxblnfRvO3l5cRigsjHt2dZy7AoOP+7J17EoqpuZe/SrfeX4oZ?=
 =?us-ascii?Q?RkjCeCzwYEsM/KiL+XpyAFhSs46vKEJkSjRD31mB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbc1ecf-2852-4624-a0ad-08dcc274236b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:32:04.7786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNIfOZqtVb9Dsh988jBlM3ai6HkP9QV2GYp3mp+HJze7vpp65212O8Ly5bwkR2mXlB5qhoyf7PGEtS+sqoUZwQ==
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

