Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D114195AE05
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F2D10E777;
	Thu, 22 Aug 2024 06:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="UJOnDTLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2055.outbound.protection.outlook.com [40.107.215.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5299F10E777;
 Thu, 22 Aug 2024 06:52:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdqPlNkilRtwM1F/dD0+qZ0AGd37sy2BVbuteXIUKFzcLSiZxITGSKzzFWNegEiI16fUM2UIag8bhqZK1Z5rc6EFZi3rG7rQsun6ytX7fTDtlT8hhw70t1ZyFnxAPvKyAACam1swEScm4lirm0rnr9WgFcFogFp4E16N2VDwijocbVjaGwhnIPHjzDrTXI+1xVSrJasJOzSD8/aF3ziLHIvNDg0xBsJkcUhgYAieeyrqOV41zTWOJ2doQs+D1/nAIgUXv1db/hXK5izcaA/pf6sqLVtivQ8f8/1NdHq5fl+RedAqVEjvRnZDI4YCH+IRqbTmZ+/Npxg36ctLrQai/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AaG5MbNUU+PU5oj5mUfga4yQ1Xw2kXZCJD+gDoOUTgg=;
 b=y1ENyunFphoU3RWEELS5sumxRFSmv76vQHczdsD00FS22LCaPkY4R04PwjeOYRSbtO5jCi76F3oShMhfI3mrEP+e54xTKttZxY5wWYdhvj4Bcqp4XmCr8pYFi+AHjslwvKe35AY/L+7Is+ctx5fbchqNcI0TCjJUAfsd4ybwbN6t2WKoQmAxR9zcL3C3dG9SXVAWB64uVIR2Uez/mR9f3RxN9MyDN4Zr9b5KZuDGY92qPvacGvQngyvstwMRh1JRxUQnmidW+3O0LhRb3/t5vApBtPTYwvzaoxAknGoNhOa79WTuCGCiZt7gG14tkbXsFGzcQD2lo1A9Gwz9+lOY2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaG5MbNUU+PU5oj5mUfga4yQ1Xw2kXZCJD+gDoOUTgg=;
 b=UJOnDTLDMcoloexC4otI0fPq6E6yZnec+5IlWK4QLIXJSol9rpppz823i/4MheSndxpWMPP1STGbB7paAH+EdY7GojjWg+7tfo6TXvk8yBFaqxCoDOVbfkINZuZQUn3ifHiBPY9Ujggot2DVAjsI9fcUpD053WyP47G1/A5W+FfyqXRdQyib2vLwpBwnHE8ki4uEc3kLvEUpDabTytgxR0L2bIEbQKGDH9Rm2ySwkk2K4U46Rulu7IvXEezG82nDyKb3rM/lZyI1riZEZDDjlcwl4p6XrZTUZqzvNs4R0TAB0RL6Jynb8EsRbU4axr4xqeOO9Jr1wfmbLCbv6Vw3Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB5417.apcprd06.prod.outlook.com (2603:1096:400:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:51:58 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:51:58 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 1/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:51:32 +0800
Message-Id: <20240822065137.1331172-2-yujiaoliang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 38239651-7806-4161-16da-08dcc276eb1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pdTk4f0IAlKCi7A0zpkiCzp1y7NsB2MbhIZ+GYESIF9DM0QAzo/+Q/y60KSZ?=
 =?us-ascii?Q?OgBcc4foiImnOY7z4XDEzh+IGv5ffKYF98p4ysWcdVKVk2W7cMPbzfLxZtsp?=
 =?us-ascii?Q?lk534wD51WswmNopvsGu/eIPGID2WIvR54Y8AeMtvjVAo2N7CMYSjIefl/dX?=
 =?us-ascii?Q?k+O0YV7BIz2dQR/Y4n9hK6S6R1HT8NlwfxMuPCS8lSkQuSLjYocstWpF9BXT?=
 =?us-ascii?Q?32sywfc07UAkALzF5UprAW6RSUJZU9BqAbBMJkUCBgvEXi6KMK+FaD/kE+1C?=
 =?us-ascii?Q?v9UPUBSCRaSektGGDFdj5fVn5THbpKfnGTnZSSQXHPlN4+itHDhxClOLCcwc?=
 =?us-ascii?Q?zRglCcuqI7Gnudrml/fDR1/aekKrqlX0a6Z84Np6yojsOForuhRKHwZ0T/Ui?=
 =?us-ascii?Q?3x0M+CcNbJpX3fRxmt7brKxEv6Q3doAEJmiBrdCHYLmGd54276A1REURL1dx?=
 =?us-ascii?Q?lVxySgJUhg/VVNhbCAlNFWEmg7bKscbnHQoAr4ddIQubh//DpevlfyJG0iBR?=
 =?us-ascii?Q?44VqA4ktEq3ww9juKpgUpUcDCsqvBIXHxUXRF1bzrPSP/cs1XI50KsmmuaKF?=
 =?us-ascii?Q?exiap5EWQIsay/yjrqaUvO41w4OSYFmIlU05N2qmZmEyU/xw7Qr3K+D+xPPk?=
 =?us-ascii?Q?tWED+7luYpvu6dvl6dg65QAgDgCp6yB9xQwVZq5csc5T7Xgh5Fw1dvsDYaJE?=
 =?us-ascii?Q?VXmni05+Ej/eAZi7pjL6O12aGhCV+eqapQoSWFBl3Wn+O9nT3VjFyD9E/ciB?=
 =?us-ascii?Q?hJl5GXUEyYskP+Jolky4Dj2y878oLj2WSmFJnNUYx5gbFGMyL6pBqJ5b40Nc?=
 =?us-ascii?Q?0t0oj4lDodOcNUJg43YjJoTAmpoX2+P19CESUV4DCYtmDMnwlIakeT9EyxIg?=
 =?us-ascii?Q?WQbMDGqPPZwu4tBN50sUw7sZuSTY5WzoUqbkF8sEzotX9XEnyofq8ivyGpTI?=
 =?us-ascii?Q?WX0aUaiueHeZL2ca3QUZQx587gqDVgUnVzy3S2qt2xBmkUUT/CmbMfkN3fC/?=
 =?us-ascii?Q?1Moo5WISDtTAv1zigu9mhG/Nm8XPmTP7ztuIRbXpBKTLMYPsBp7/G7gM33Ls?=
 =?us-ascii?Q?S/GO8pwm7pTi3sXopF0RSG+ua5pN5HdYasHKmaEzUlrNXjnBipANG0yhlYL3?=
 =?us-ascii?Q?RTOXW4n0uzrcniB9LPg4T6e3vKj+72gzW5qir0Fhhm4QTK5u5yqojQzdxTPA?=
 =?us-ascii?Q?MkuexsPn877PMxyuGZmUJDte9Yy0/oF7X/pKsbmwUzQdhJzZrYWQiDWdfurS?=
 =?us-ascii?Q?5ULa/aFLhTRiBQkUNZV5YN/FNkQpVuIU84B5alDu+8oJG5uSTUaXrF/8Y5G7?=
 =?us-ascii?Q?l/Qjr7HD0/r02dTgKRmowEY79McdGZSXJqSp4uWpxsr4PT5oq+YvvSzduxUA?=
 =?us-ascii?Q?szuLVno/djlufbxzfmhBKx5VorN5uZOiAP1FwVlz/ufHiDDFRxbMicY8jfvy?=
 =?us-ascii?Q?mw/Fm6L/eME=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ir0y29G0SOc39FRqWz90V5TmNHOSoGooLHD1CyD6U9xIFuMPssifkIM6vAkW?=
 =?us-ascii?Q?+1j7tPBB0E3fKoC08tdUp4yeJtZVbpf7JNyoCH8kQgMCfvnfhtGbZ4PbCxUO?=
 =?us-ascii?Q?D8rvDdj4p/29lqWGqhhcdAOvixVYlhtdhOvjUo5bOZ5UsmIRnUSv4qk7X8GO?=
 =?us-ascii?Q?Kl9N3V8APtTNpjRzTSzv3wG6GMTQ6Ocztt/grjqxvFBe1SIdcJF1cK+ukqei?=
 =?us-ascii?Q?OukhuL0OcCUw0J9oLPRDge8GXWTFOdvlYEopa3kBI+siuhhh3wMu+8Ft2sHa?=
 =?us-ascii?Q?KF/6l3VdRD2mVkJrnxpfV4yxY46f3rwnemq8Qbf/goAOGWuqsDMakXH4y7K5?=
 =?us-ascii?Q?L5UO6aVTP0wCj9lzZWe4dZ3euCKynPG4MtWHcvvw/cMJGe5bFmsn6H2Ana2o?=
 =?us-ascii?Q?VgpmXIvDEVeGqJHSgWDC+O9s+BWzdsGrF5pelMMioiA5ISzXEWl+WGmSN38K?=
 =?us-ascii?Q?kE1V8M816SqJo9jkhAnHN4F11vORuqKeI6uOA26U8cdTLHOi6fsT1qDVoNvf?=
 =?us-ascii?Q?MDICL8R3TtSyutKKUIHaiOIFdTWljnLBezEyxFc1tcmbNbmrOZq5UrGmwHzy?=
 =?us-ascii?Q?1bPM/VKiVR43ssSHG/O5qPC8cyHqfXoUcHngEeattTr/15pcaa5Ol2qP0mln?=
 =?us-ascii?Q?44byRC98U/K49IQGnn1GNEDSQM6ZjzYtqJbd5m0Wobb5PBpW65PeiDlDQDt+?=
 =?us-ascii?Q?74Zf52jDP2Bo0P6r/6E7WHFK0I+yBv7tzyecY9T4/B7V5H3THEhsBGGzd6r7?=
 =?us-ascii?Q?aSbsbemw5L0sJj/P0zK65pJtp+N5NAi8XiqhSUUaKRbpZXLL9G78isScTaon?=
 =?us-ascii?Q?iJCHi3oX9yisMJLRZ284kxq4gmcEqnsjDN4xk5A4RPvc+6T8DHaa6CjR2TWk?=
 =?us-ascii?Q?Yzr5D/z+oXtk+aMRe8yGwJakwTb592Hp25mRR0QHSQccByMTYYLM2mMrlwmP?=
 =?us-ascii?Q?r245k8P4UY9T6mKHqJbPPUzBX791kdR2JAFKkfI0h2S6yjFoEYEIyiANqk3t?=
 =?us-ascii?Q?ctLatknOdF32W/lfmj/t1qPFqheg3YM+Y42p7RZqe46ylQkdHNIMyHhF+zLq?=
 =?us-ascii?Q?w+AHYiTsc4N/3xTM9vzlNwI6gcNbIt3KJwt/Fa2qLPEYcRAT5s1KLYRxbGrg?=
 =?us-ascii?Q?+C7egH0V3WUGcIHz9ubfLboiaLyzTQEzaTVaZDRMwYRnkCHQI3aEB9bSl5zU?=
 =?us-ascii?Q?drLicnccUR31rT22yjXjOo/XleWKgc8Myew3919H2NGA+vkedb1z2ahvoF2d?=
 =?us-ascii?Q?FWNoQpGgOhrcCBJzGNylYA1yuPeJ8TU3rPQYHdNkiQV5Qm0qRLY1WFwe4D/9?=
 =?us-ascii?Q?AqOOG25DjPbOs1C8nZclCJUObnTfem04ft2gWnhB0/OGlz42JbogdzAyabNc?=
 =?us-ascii?Q?osSnYogtLEJ4WhQIdcLDdKbTU6G1dbTVC1FOtzRxwaKbETqlOKX8VHYFgzMn?=
 =?us-ascii?Q?9/FJPvtArAN6yzBqYNzf9iSb0OcDng/y4lyHRv5N9hZUtbf8pM8IEDzoaPw/?=
 =?us-ascii?Q?m/HFDqvbhI1rV+avVQwRdi3+MQR5MDRxCxgfSro1qq44R2763IAvZSupmKY3?=
 =?us-ascii?Q?GHBQqAxGRnwWdqQQpLkhf4041rBgRfqjVUiH/1h+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38239651-7806-4161-16da-08dcc276eb1c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:51:58.8304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FEL8rz1yjE9ZMU/O1pjbhDZMqbn7wK/Dc0baa0xLtEXapDxBptsC0vtlny9MTDaIjG88afmTmTQhRl+Rmsr7g==
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
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index 3bacf470f7c5..f8c1650eb21f 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -2300,8 +2300,8 @@ static enum bp_result get_integrated_info_v8(
 		le32_to_cpu(info_v8->ulNbpStateNClkFreq[0]);
 	for (i = 1; i < 4; ++i)
 		info->minimum_n_clk =
-			info->minimum_n_clk < le32_to_cpu(info_v8->ulNbpStateNClkFreq[i]) ?
-			info->minimum_n_clk : le32_to_cpu(info_v8->ulNbpStateNClkFreq[i]);
+			min(info->minimum_n_clk,
+			    le32_to_cpu(info_v8->ulNbpStateNClkFreq[i]));
 
 	info->idle_n_clk = le32_to_cpu(info_v8->ulIdleNClk);
 	info->ddr_dll_power_up_time =
-- 
2.34.1

