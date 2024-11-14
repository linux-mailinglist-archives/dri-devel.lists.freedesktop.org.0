Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F99C9C8DA5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 16:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E1F10E7F3;
	Thu, 14 Nov 2024 15:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazon11020132.outbound.protection.outlook.com
 [52.101.227.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D7B10E7F3;
 Thu, 14 Nov 2024 15:12:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRHM493IX+agAr90lTBFfUIvdstVXwp1Ta8yl25M3chiLb0RorGnX8zk/JxbRTij0ZMNYOYdtjLOTBrOI1JHplBhBtfBQtYSkc4X+qV4m1wUmcVo00NsgmYerZ+b5fSvqxQ4+dTfaRqM/cKmkDfluD8iCdfd09JTN0YdhAhjdOFiJ3bCUv0myzqOxORtB+Zck69fUz8umMZXxJe29lp18nTttMfa4FS9D+mVSX24Opv7MHWWuCS0Mven796ZXOrD2tPTZWMhmidBFR5pcrfDxrBRH0bB/PObkkq/Ixbqp+Fp2ujp8vMtcW0Nk9PymNJstvCjntFkITwlEfSKptgrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uUvdOuhqBe7Pbl87fnfvKIwEnho5Dss421hPJnKNxQ=;
 b=ZZE3PNC0XZZ3HwpCm00Zru24SLn3gyb6i1GizQOOupd29eWsF1X1cedht2wL+QQRMUt16noo45sBHQdFTnBsojqvm0ggxNRwq1jL6fsm4ZXFsaEcvXvPiquOrL3mYSop3SEGW9HhnihDZH4Vz0oJwp4EqkK4JBLZrWXV1ViQYUAmHPk6PlSQtwLiZDzjOabDRIobKKH14cO2PJi7kYP50A/qMMV5trzMzV6midQzL1eKu0fnCrZzKf2Owr1orJzt4IRMq94DNWv9VLcM2PMxLuclZO/7ChsEOauSCwKf1m+Qsx79CR3oBwYQzI0FTLsB2IJBtIgeghg/S3HGIuVNUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::5)
 by PN3P287MB1340.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 15:12:37 +0000
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::c75a:632:1645:5db]) by PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::c75a:632:1645:5db%4]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 15:12:37 +0000
From: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
To: alexander.deucher@amd.com,
	alex.hung@amd.com
Cc: Bhavin Sharma <bhavin.sharma@siliconsignals.io>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Chris Park <chris.park@amd.com>,
 Roman Li <roman.li@amd.com>, Leo Ma <hanghong.ma@amd.com>,
 Ryan Seto <ryanseto@amd.com>, Jose Fernandez <josef@netflix.com>,
 Ilya Bakoulin <ilya.bakoulin@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/amd/display: remove redundant is_dsc_possible check
Date: Thu, 14 Nov 2024 20:41:11 +0530
Message-ID: <20241114151150.19576-2-bhavin.sharma@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241114151150.19576-1-bhavin.sharma@siliconsignals.io>
References: <20241114151150.19576-1-bhavin.sharma@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::10) To PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1a1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1171:EE_|PN3P287MB1340:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b72bba-51eb-4bae-0903-08dd04bec625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oxKunaSt08X+790CX4Dy9U7RZ1E6/46p1mIgZJBn9ANkYT22C2Pq04ESU1VB?=
 =?us-ascii?Q?ziTLHSqV5tKSEnnZM6sDw6sFzpL9LEOXRMvfe2AI2ugzaPe1NFtJ1v1yZKRG?=
 =?us-ascii?Q?sC5XNn3Ucy32yw5JkKBzpE+0qw8ZajnBpc9XQ5vYsPGIwOskykNq+pbql8Zp?=
 =?us-ascii?Q?oEyt+1Fmqe4V7eWveUUQ2j7YZBHSP8bCaQ4s0SAhIrYmNEuoG3Qwb9XfL75P?=
 =?us-ascii?Q?Z7jH5Rjk+ZHTHZzACOz8DYgDCq/Nj+Y6hk6fVbio1+6gOyBns9Tnn3/ScQL7?=
 =?us-ascii?Q?Hp5wNPXfnJEQtKYAZDgkHld6N4NAfyVdwWKoH5x1823uTy1hcqhjMh8rl+1g?=
 =?us-ascii?Q?kBoWDOVzNLwRCHIEF/DBLlppnr1WP86W9iPPLvNiEtuVV7Fa3ouEdoeIog+w?=
 =?us-ascii?Q?ivYBdQzgKTbX/sk8bErsDNt6wYYFlsQrjCJfRGuMMld0u+FKIUbM9xMckC12?=
 =?us-ascii?Q?GH/U+hN07zESGfxVomvTxp82e6RsPs2l5eNn5FG+mwE2IYXZZsSAfjx2WQ1F?=
 =?us-ascii?Q?ZhxdNC055RboE4RJa+g65CuCvYX235iRKKzJXG0x3iovxKnX/ICKS2HWo/Rk?=
 =?us-ascii?Q?m1zHh2GAnxoCvecApFA00gWR2lPX8ZKxPvpyGsy9OKUlqXQij02ltr8QqoJa?=
 =?us-ascii?Q?igU3cE7t/Yg0VH8d9yV5c7cnODf9cRD/0gP2PDU17ONOzSnK4y05T5jO3+5N?=
 =?us-ascii?Q?Bhw7woDAv44tjZE3csPkdrhNep5LDRpCZ9ZF+Rd19PVcE/B3g/yAx1swziG+?=
 =?us-ascii?Q?a+q5jI1VkyQCsQyYqG0oyzJxC+Yl7P6GfyW2i9FiTA+CILpKajWmV4OlHZfv?=
 =?us-ascii?Q?+jppZcRa3r/jLcS2UH3WHU/3M0kEU4IXIIeWTXVxSBTls4GrOwAqylAcF5Ta?=
 =?us-ascii?Q?rJsfseCPjB2zJaqkUAgXkq1UTDDOBZY36WXN4gNzADiIRklBz8hf5mRYcaSq?=
 =?us-ascii?Q?hs3xQJl0jTI9lL+BIegw9klGGeFZ9fxMOp4LL3iGr7vRtQeEJVj3Peh5ah1P?=
 =?us-ascii?Q?6PuDvDJ9wySl/B28SPEQKhlCX/kuA3eTFMh4Sxhn62VB0wFW4nunxbkKvQpw?=
 =?us-ascii?Q?WJh25xou+HfuJz2QxivbdtHqzoioqAJRfSn1kNZkLm2j6PzRE6E3sn6rHq6b?=
 =?us-ascii?Q?j4Dklq77XKuOq5NnvfKQKVgp4sQeBMfgk7Z8tRKOnWT8EBC4wyfQDoc59/4X?=
 =?us-ascii?Q?WE6LLjJxMEShAC+FBtuPXgTauZJEVXpe2lq1VYwj80U115gQw05fOfzZLzT4?=
 =?us-ascii?Q?KkQPFXfT7mXp6lXJW8lw/CFJaAhlnfYZBzbwfrlz03z2OleP9xzjjeMBUTIm?=
 =?us-ascii?Q?oao91PFz+7UeNAUMTaL0dj+44zRR/IUszU1jxLTnNf4ziAuMjrbqjIYYAuvW?=
 =?us-ascii?Q?TyIM2cI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN3P287MB1171.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/LzR39LnB8BMJ5Xz++wz4wAEynkMkSGSAcNEDnLY572GeTtl4p92hJra2AWK?=
 =?us-ascii?Q?MqoAIczyNRme9nP+dUPUnL+e94MQaqRtxtyklbo8zyhac4nJ1m6w+W2+4wIk?=
 =?us-ascii?Q?ZspH3Am77I/PoQ+kW4blMoNyf0P6noi/6WeG5qym/UndT8pMwywEJ7k3SbKW?=
 =?us-ascii?Q?YoWElq0krf38/xazqfKvIas0ix3WjMa/CyGVrh2ccKWKYdqeZKqyMIYdy0CX?=
 =?us-ascii?Q?AVEtA6OaiS4c58jGF/qPV1Ro4kePrRQiuv7hLwbkKB7xbYyVLYwXH3GvvDfY?=
 =?us-ascii?Q?cViZIGUxXte/WaY8QSRdZ9uAAgLdJB3rvUVZe3jj6xIQoRExmdoec5sl8V3E?=
 =?us-ascii?Q?UEozVWCa/mWuSPk8R9VwK2xjufNRzzVIORiIayVTHo3PYJLKKPIgcyaWQEzi?=
 =?us-ascii?Q?2EEKkxoacXbiVVSRlQSsqzKPA8bzNMsxLyD0B9leR62lgsBymu+p/dfuBH6Y?=
 =?us-ascii?Q?WeQJ+Xyh78yopZQqwNs/ghK1ehT5i54bvkYSd50yMw6KE8ie/Bdf3ju4UdVe?=
 =?us-ascii?Q?0O1KrKzGK5tgGzzuKWUtrIWucX6HJdmmSaopxJ3sLIsG64EvEk5aTDgIA4Fm?=
 =?us-ascii?Q?AsNCsaXNVnJUDAhQ/UQiFvMXksKL2AF1O8wPZ6Rss/0/8zu3I6doXi3YHN1u?=
 =?us-ascii?Q?cw43C8R8j4MQllCOh3YG+H78G05ttOQLTym6HxpTa+Z5LtabB333okdJs6qp?=
 =?us-ascii?Q?jngI4Nl9B4HIkGOmfc7qEHQXeDJJ1DDea30YQDFynzj8yo0574TQ/hRcMuX8?=
 =?us-ascii?Q?6Z6crt9Sc3ODtzWy28W826j1nCwVnrpARsxmL5PzyhIDZr5mRnuYa5nTTvq6?=
 =?us-ascii?Q?W6fM/8Z7CCxS1bfkLFnLxsUWv6M9wxUr6K667bPMLQlgfcPIvLlFtQQZjoRq?=
 =?us-ascii?Q?hN8cP98EK3l1VqXd79YeJiCSU5rDqN4rxGa0/12s+rf1rVQA8ZJzrjQHWhCE?=
 =?us-ascii?Q?9lGuAT8zhTFf0jCvoPc1dwc3S/vQfdVftk3zKdCJZEso/IyrkpyEmGGUp015?=
 =?us-ascii?Q?TCoSyHfgdpcHGWJXSG2DUorDhB2PltouaVYrhWFFspdqx3uAI5Ow0sCbGE/1?=
 =?us-ascii?Q?GStp1AVGb/JBeMp2pjeGgmn3mfx2s8s+Pa2QNhc6ZDJLRYNO2OtrHbPTSoMg?=
 =?us-ascii?Q?jN8hC5JcG8EXtdmwILanvgqYc9qKFkLfncrwBNvGgcFh6UHJRr/3Und5Lgry?=
 =?us-ascii?Q?CQAMNMpkzHPXG50f/kBfL1rxWtNH507kRfQxhvWC1yNiIZ9jF2nEQA/v750H?=
 =?us-ascii?Q?6Z631MXXCH9cm5V1qOsSWaP7GZPZTkW4Is6ONg1TX/cEYOGcP01zF6bRBXa3?=
 =?us-ascii?Q?ugOReUzNigSlTT+FNHuxqWVSVBXjxJFkJoZQa1W+9lNBeGkQfzxnhZyVUhKC?=
 =?us-ascii?Q?fxZti8hMvYq0R5PH/DKodt/IZfT8MzPXCABlAIWtUEHJIwzHJmgnYKXnVTYl?=
 =?us-ascii?Q?MJncOLonIQWPOVuRlr4gUwj3YysAdGyu5Z0BOjcOd81Oe9qvomsfzpjEtIrx?=
 =?us-ascii?Q?xAw4YwQWoOqim77eoF3UfuTakq1JNxbZ77auPDjqOACNJf0pb63EymLkc4Lw?=
 =?us-ascii?Q?aaSm9PUc2d85/eUGuAnV2kcycdCKC3o7beuUYC9rbpzKEeh9FaRc44DHYBOA?=
 =?us-ascii?Q?COxcih3RbqYetoRI1KCUOR8=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b72bba-51eb-4bae-0903-08dd04bec625
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 15:12:37.1987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49+0rgPXYVJ2f34TJ3O/tFdAnEGjdtEH4N1w4EDeD4BByC2SPpT0Qn5b2qKSFKdIQi8TnmlXDQe2vLExurmjT7xCNRZN+FYbl0aHKNcy9ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1340
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

Since is_dsc_possible is already checked just above, there's no need to
check it again before filling out the DSC settings.

Signed-off-by: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
---
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index ebd5df1a36e8..85f6f8e43947 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -1093,14 +1093,11 @@ static bool setup_dsc_config(
 	if (!is_dsc_possible)
 		goto done;
 
-	// Final decission: can we do DSC or not?
-	if (is_dsc_possible) {
-		// Fill out the rest of DSC settings
-		dsc_cfg->block_pred_enable = dsc_common_caps.is_block_pred_supported;
-		dsc_cfg->linebuf_depth = dsc_common_caps.lb_bit_depth;
-		dsc_cfg->version_minor = (dsc_common_caps.dsc_version & 0xf0) >> 4;
-		dsc_cfg->is_dp = dsc_sink_caps->is_dp;
-	}
+	// Fill out the rest of DSC settings
+	dsc_cfg->block_pred_enable = dsc_common_caps.is_block_pred_supported;
+	dsc_cfg->linebuf_depth = dsc_common_caps.lb_bit_depth;
+	dsc_cfg->version_minor = (dsc_common_caps.dsc_version & 0xf0) >> 4;
+	dsc_cfg->is_dp = dsc_sink_caps->is_dp;
 
 done:
 	if (!is_dsc_possible)
-- 
2.43.0
