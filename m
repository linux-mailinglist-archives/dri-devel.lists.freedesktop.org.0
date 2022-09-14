Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE905B824C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 09:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3B410E8AD;
	Wed, 14 Sep 2022 07:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2124.outbound.protection.outlook.com [40.107.117.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255BF10E8A7;
 Wed, 14 Sep 2022 07:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeXFHCzrAnVkWhbylnIB98hkWE2T8cWMECO0aQyfmWuzfLVNvwMcV+kL/MATHNaBV1qF6tXDoLIqDY8vK8lutTxKtRaPazUfG3C2JNqet9sQ/B3sZ0bxH5sW0gBF6Vaei6SFWacA3bgqNseRTpv/qOeTu6YRMTaxzWIeeoLYl2mprdbsGOLigvSRiGxql0s1h7/fXUwIVksMuBlbvdsxiavz82lM6W3kUfoevTgriAIE2NlDkpXjsA2hDDGif1jWsu57J9kVdKZXGmWCgWRLogoGlR79eDidxRjHEJX4StEnywM9XeTi0017dsPJB8mZZ4qCQcj2g48J4/nnDSlr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fN+szO0HFlgejUoeGo32gr7wnzrzo4F4vicD6kwnpWQ=;
 b=Y3+8At2IHdcXRpwUGPlYPzsNl6z50yWAmBHFCNA6AU5RNrOC3jOMl2CgyoRP6i2NLAM4IrVGDHbP9LGZXO4maoD7Xpmrmh+9FPEIOidvQO7wa0cWK7Sp4fpxKnm+cflDQLF7HRaeVKLnt9kJIrQHTwJTirXRL5qACmTbHD8UUOSg4D9jA4i9nIlx/ZdwirGFz99+qe/CWs2zJGs2l5dZModa3T3o4QQvVevKm9CVmQTqIkw/hppZuDmlhXxn2UMrpXh9lIqT5gaO+Grsubh5eRNkhuetLB1d55W5+9cUCvkBl+rNARSPORpd4VI19Yl+3Mbtozmp+q4GsikZMiitZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fN+szO0HFlgejUoeGo32gr7wnzrzo4F4vicD6kwnpWQ=;
 b=GleMC1To7nt1ZUM9wzddt2ryU3rlNpNZB2hfvS+WDMV/qxGHvgEhqPzTPEECznMPZIotNj6OynjiaTiIS68A3b7N1gX8dHbk2EqQash0FD9YLSs8sn3/CNDZd2S9ynaM9Y6P7bfuLFXu/LlCxZ94kYSyF/mLW5AgAvN3WROxvYI7XbvwMa2KWKgkIMpMNE24BQEWhov7aeudNrQSryKjj7MDMCnfuzDN1o9Rq76eLhdtjEhLjWv2zQ3SIUfIAtjP7OU89h3If7qCL70Lc/ML/43e7vptx4kFqT5EIJ4SI9EwItBeJ8cW3TtxcEKt0nHKfVlagx4SU2cNcWHiMAxVMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by KL1PR0601MB4196.apcprd06.prod.outlook.com (2603:1096:820:30::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 14 Sep
 2022 07:53:10 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::f9ad:4efb:64f6:856b]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::f9ad:4efb:64f6:856b%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 07:53:10 +0000
From: Yihao Han <hanyihao@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Yihao Han <hanyihao@vivo.com>,
 Martin Leung <Martin.Leung@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: fix boolconv.cocci warning
Date: Wed, 14 Sep 2022 00:47:49 -0700
Message-Id: <20220914075213.4998-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4173:EE_|KL1PR0601MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: f6836017-41a2-4e8d-c2d1-08da96262b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HVUq5R6FU5sRkb758KrhTzI9RSkqsV+y4AxCzPoe0kNd598OfIPojh/yidohyvjd76RCwkJRN1xKxd/frZsvSEsFwhPWpBbr1p6Q/3n9tkDNdg+mUVNahmvnSE6qcZBbrYOJ6sgxemPOzY64HTwgk++qFxxzhCV1KirGVc6G6VYI+jlorH8sHQglHpjnFaUr+G1jyeJ81AAV9Wum4Jo3t0nTENX8wTzfnMUL0kXnmCk3fm98P+565LacAvzSdEnB3V452sZ8ajDwfIfotJSycGw2r/QO0JAgu+8U9c0fjACTJ068XHzFHBtujpCw24tcymTod3feprI2KwbYUCdybizJjhFpqZMuZvlFxlff+8Kd0AUA99VY7Z+0l82quRv5X7D8uR3hCjx5YlndoSoE4YZOyT7YMxA1XJcG9Dy8s509FzuRYTlAtGnlgZVSMpY2q4P+t9Rq/c6QGoZVAfp41Fbo2evSnH1Kn9jxCNP1LJtbw4qcvzJU8AGZexGvh0Xo5aUUTRtVonni74zuz05xUQVpGIC070Jq0yyTdytWjj3SOTwKY2Q6h1SGVF9k1N1Mkv+o219LGXGRI1P8qlkR4687mJsUKzVKyjh+s89ldmSvhZGSGSioEnBoUYAnws3o+sGOZ1LwhlDvDrkFWD/tESO60YgbVGp/bPBhqGzPuMtbpYsKK55xnToEbhookepwB22RaRusS1/8fIWi4EElw7L9Ieak1A3NNCcLJxRcD3BSbOUCj/bNK/hwxITgcg2VA84dh7zwQgxHvuTtmQjaGYV0V/DsrIu7ei96Dw+su0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4173.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199015)(6512007)(1076003)(186003)(6486002)(26005)(83380400001)(6666004)(921005)(8936002)(6506007)(41300700001)(86362001)(478600001)(52116002)(8676002)(2906002)(5660300002)(2616005)(66946007)(36756003)(38100700002)(4744005)(316002)(66556008)(110136005)(38350700002)(7416002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XcgYJy/IAnjBaJR1Z2tmov+i5mpA7VKClsiau+QA2PsmQ4Zxybb+8wKiSBTs?=
 =?us-ascii?Q?FzCL8S/o2XffAxipI9wS2WKQQfGHMAjLgKIkBYyKibj5isSSS4uZqOt+OKbY?=
 =?us-ascii?Q?QXmTphj2cWFPGlqLymb7I65LCRDwsFgqGWNGUi/mDPpLkw6GyjmPZvBkWBWG?=
 =?us-ascii?Q?4bw3FUPKaBfafoW9bzIitsX+iQiBtEzwG+sbXqHV0vK/XqAu5+q5G6jrMiog?=
 =?us-ascii?Q?iwopeF+56mdF+Quz8ZKMAuPKt3wXbXvxUzEbv14zivgnGkp0qsfuxugX2Wt5?=
 =?us-ascii?Q?Jc9IwztCSvrNFfcS8qn12KYf14xAwiDTXlQ+YyTdT8PqSDdsu/+8SvDHatfo?=
 =?us-ascii?Q?SANaD6a+Q9qzLOMI0tu86X+kW2HusG5Ew0p6zdixsIOQqNAzOP1o9rx8Kcab?=
 =?us-ascii?Q?gHbxmFgtrt9arWj9AGlwIMUCp8wYCnfuOE8ruZ1G849sGw8NWtfEb4u2kA6f?=
 =?us-ascii?Q?d+GKNZc4RuoGNAhQPvTiUliQb+WMcfXIyQZ60/JKCZpODzwiWhGAZBb/IywY?=
 =?us-ascii?Q?cSS/HhcyBZPeW8L0sR3Bzy1nFMSbUFajq+4os+GHGEb12VZNL74HizeAdK4/?=
 =?us-ascii?Q?/qSH9nR4tXOP55fvlO/Ju8rt693MGCFQrAWpELX36oP7DUbwHZupN5FTonEC?=
 =?us-ascii?Q?rt36b+A0SYmipXnq+kUkOgghshRuDL2ynIPi4W6x+JLDt604FyismIGDQh1L?=
 =?us-ascii?Q?/Ofs8LmVgAOCZj+41d7HU/rhYMpT/Tzw8uw/zUKfpv9u6AZcwh6oVFEXI3Wx?=
 =?us-ascii?Q?+iKKtv0+AcS3y3+rThLu90ZtAgQBghMG4vBav8fIdrYk+w3ZAdSoi+1LSEa5?=
 =?us-ascii?Q?1afXin3snN/hNgqelvGPZBsfF0C41bFWoEJ2qWY9z5siHgm6ADYtMg1g2A0U?=
 =?us-ascii?Q?d8eudREPK1pNNIBOq0aSAp3FFlgJ0zxRLoZuFSMKA/YSSyRV5LfjMkyUUY2o?=
 =?us-ascii?Q?EWfnttH5iOpjDSuNjFqJTiyySzciLAVuKcox/N6Uiu+XAu5UDoQlrLJUGqbr?=
 =?us-ascii?Q?pHKw3aRGKjottDDE427WjB8HEstYPHsnV9/jseijtkptbsUS3vl8BDTjDYGT?=
 =?us-ascii?Q?I/bS3h4NUNj18fq0NNzp09+0mNXhHPViNKhI/fsQ44YRgCEn+YwIhga2xTic?=
 =?us-ascii?Q?iz2h9ghsercgTQtDsUeegz9ul4MmP4BGXKSvaqF/aBwJ/0AOy2wPXQ+wIvQ7?=
 =?us-ascii?Q?sx35lr6vVBzXhOo8MTvBrvtSydsEFy3ahxC8LSxUtzYAltOPpUn2GM4jrVdT?=
 =?us-ascii?Q?530TfOVQySg00pML6sU42ykmpOayJvRcIQED3Bnvm7AyIw3NSMO9gNM2PT2u?=
 =?us-ascii?Q?QoEf1WMQCuIRfWBFUkDYx4Kd8LHEOLmGtAJP7/c6sS2ZeoIojJNxogZQMdd8?=
 =?us-ascii?Q?m94onZgX+bSG35hv2eQBobsZdSrLUMgR6UxpP4Ghe803xjOA7vlV+aTy8xxq?=
 =?us-ascii?Q?OkW/DqaQ2b4FNGwMknzCi9VDv915znXG0zPgBI2c66oLLAAyIF4Rgnq4chrt?=
 =?us-ascii?Q?8Kdm3BLEJrtdYDMtreLxjnpQuZVB3fMeZwCf8OKLhFUVpxVEcEzLFEICG34e?=
 =?us-ascii?Q?mXh+A+mz2O6Sh24d7A1gcAaAwO0rROeEQXJ6vNBp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6836017-41a2-4e8d-c2d1-08da96262b19
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 07:53:10.4253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERBzJgkDEhm9U5YR5COvi/BXxkShvWMBI+6GsSas9se6uHP52FCyOOLtAfRS0E52PBSHO1YRT/Bsh/n8d/F3Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4196
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

./drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c:729:63-68:
WARNING: conversion to bool not needed here

Generated by: scripts/coccinelle/misc/boolconv.cocci
Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
index f4bc77972c4e..4edd0655965b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
@@ -726,7 +726,7 @@ static bool mpc32_program_shaper(
 	else
 		next_mode = LUT_RAM_A;
 
-	mpc32_configure_shaper_lut(mpc, next_mode == LUT_RAM_A ? true:false, mpcc_id);
+	mpc32_configure_shaper_lut(mpc, next_mode == LUT_RAM_A, mpcc_id);
 
 	if (next_mode == LUT_RAM_A)
 		mpc32_program_shaper_luta_settings(mpc, params, mpcc_id);
-- 
2.17.1

