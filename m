Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3229C4AB8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 01:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9181710E058;
	Tue, 12 Nov 2024 00:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01on2129.outbound.protection.outlook.com [40.107.222.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AFA10E1E8;
 Mon, 11 Nov 2024 12:10:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qx3u41FEHmOAMFVSUJEhto3K8CsNqUus0crZlRi2IukrHu43ogUTFclz9AoSwBpUtMxiAtyAa4gvwdxrs2mv1Y6+ner5JwXRPxUrNmuGJVXuVn38zyGyOd9BMuiEgXTpo9S+2/DUk/ufi4dqShJ/BvXwjS+rAOOPeZh+kaXdFgW7Ts04rmsankjBxEYVy7R0oOIE2Zc0Tan1MmlwuMaZZpNHfPTp+v3zkQep1pmzDq74MqDUkt6sF0b6hmvZSRM58a78Fu7qqUmvEGXgDn+A/wpTobz/zfQ4AFbiWugvpOnf2n/b+Q2rb6ExAyEs9dRP/a6X5Oi0NyNXEA6P4F3kcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zso/yW8wtF76QU2td8fVa8ZbR7jk9zNX6Oj9Teb2xY8=;
 b=rTCygOpinUIdvlNcHL8lNXj1RTtPd+yEtUqM7pp6vlubK/6vS+/cDjb7ENNeIIus1jOlTC3LQhinbxU25CIuRII96ABIUkjqZhnXyIBXUD6EmIjhseuXnEeH+OVPbir63d6XQYLDE8HYxdb5NhCi7L2CJIeJKiu5pPGIKXCrmhzK22AzYlhlptGCKsRa+eNaJllFRU2FYfCcGjUphh4LRvwEs+BlqhTAMDaHiPRyfXlTnsUMLra8ZUt675IPwIi3I3vOe1UTzi99MFd9uCXAQXjiS/PpjCm5Ra6RV2zqMJ7VN73BRB/Uit23VsRGw157JkuLME5S0xjKem/kwNEUPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::5)
 by PN2P287MB0675.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 12:09:57 +0000
Received: from PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::12a8:c951:3e4b:5a8a]) by PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 ([fe80::12a8:c951:3e4b:5a8a%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 12:09:57 +0000
From: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
To: alexander.deucher@amd.com
Cc: tarang.raval@siliconsignals.io,
 Bhavin Sharma <bhavin.sharma@siliconsignals.io>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Roman Li <roman.li@amd.com>,
 Alex Hung <alex.hung@amd.com>, Leo Ma <hanghong.ma@amd.com>,
 Jose Fernandez <josef@netflix.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Ilya Bakoulin <ilya.bakoulin@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/amd/display: Remove redundant check
Date: Mon, 11 Nov 2024 17:38:28 +0530
Message-ID: <20241111120900.63869-2-bhavin.sharma@siliconsignals.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111120900.63869-1-bhavin.sharma@siliconsignals.io>
References: <20241111120900.63869-1-bhavin.sharma@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::13) To PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1a1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1171:EE_|PN2P287MB0675:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0c3c7e-ca7d-4245-b36b-08dd0249c276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1W8bv3qQpsB8flFlOdAPeX+AiHGto7A1stiCkg8IaEAuXz3iHvLncQ3uPKw3?=
 =?us-ascii?Q?kpm1dNvTO4gUvROXCNKbTrWzWV+Zlob7gDyKuilp7duyrfpea93gJJXzkv0g?=
 =?us-ascii?Q?rqCIatAYFSKZDELKuHUVhEDdDaaohxzOZ2pjqiTzeCtpFKFN1UM9ZRzZ0mHT?=
 =?us-ascii?Q?iePSE/qkRC0RsoNDh/gx0i5h6qu3PH4AYOVVrdL829kc4tqOKLu8VJNDiful?=
 =?us-ascii?Q?EE5gCc9hjc9Fjp36OVJZY5QyjkxEdkSCEw76jB/l/C1P4Edo/i889s5LakA9?=
 =?us-ascii?Q?6/60hUo7ZG/LyJR9F4yp++NWDa2rrSHJvCB4TygNBqp09wEhz4dKSnHGMCt8?=
 =?us-ascii?Q?aKcwCTN6SMqMJ0WRpQhJLAjLGGPc6mvN+OIC/J3t7D1L7tceeWqtvlTcWU3H?=
 =?us-ascii?Q?YiUBrJr1ZGOTh4n/tOPkoJ21R0MTRLIrB4Vm2A+f7bKkJ39CMo5DyQmdo7SF?=
 =?us-ascii?Q?qC/IoeAmuAQ8iSLm5Er3l7KKegUarK8qHrZ0BBiTC5Hyy+4R6d5EAfRMzDaw?=
 =?us-ascii?Q?+HK4Gja1B64Nk8tEGiUJkX1tYNGBrQp/esAMrCuMCkFPpc/vspJkZuX3dzv6?=
 =?us-ascii?Q?G3KFPHbz8KnEa70yc8qVh0BQvNGxJDy1+i7jSZltn7RgW4kQA910zbagjp9J?=
 =?us-ascii?Q?vVGFJNvcAIQHKmp/NXU52WCEh7vjDr7AxpvWRXERmucDIbFV+dkD+Kt56uQm?=
 =?us-ascii?Q?cfjf6xtI77+uzmbUj2U47IvQ9YBrRfcDw9f2ZL650JuY80MOQCTI4Eqv+ktx?=
 =?us-ascii?Q?L7hCB7GI9wpb7+WvoHpHWwTww7CVn7DmVACyzJBx/IBf6s+oYeUDAlGdie+E?=
 =?us-ascii?Q?zErt3ji5dOdN4PMZ1D1NEAnk2hqVjor08ZFpl+q/DENVjNAI3P1VWl/T8P/P?=
 =?us-ascii?Q?ovRsR2zIjS3jLJO7oTHd+f3U1h3dqPK6CujMyabUSAzL8MVHlxYl52HrAmBI?=
 =?us-ascii?Q?apX3FtoiRZCxubk5r6BXQUgUWedH5IuW7KcSfVSHxXzhyuAtxO+KzhDa+gLQ?=
 =?us-ascii?Q?L91Sha71w73ld3F3as+otF6B3cmrUnbfEDkkXGMZ8LOUyw/S49/QWEg9vrd9?=
 =?us-ascii?Q?qvFbvN7NDXZoLhPpxNMM1aiLruNsFF8jLpzwpIJSaFTjuYHtQ6pbZ7dOkpSx?=
 =?us-ascii?Q?kF3WYGU4w3aqGxH3qAE0MTST95EkI6z0MMh6UD9j/JHSHOFd+i5u8aK5iJLb?=
 =?us-ascii?Q?m50UepgyhfIRO6wBk1uPj12Y1tvIBYxedTLa3XvnBvnuq+G8JmtjR1bvoV1n?=
 =?us-ascii?Q?geDb2RlaAUpsILOm98XEsQptMTJu7M6+znrTuL7IZWeSbsEvOJUUnkvwLqhZ?=
 =?us-ascii?Q?xsCJx7qKWmbaGHbP+QEoFK24Q+PfpWW7qWtk718MJViaX4B1o0f1TLwJUkgW?=
 =?us-ascii?Q?Btx1gz4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN3P287MB1171.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xf/QOrOIj5ENeYzT31zQhRGun4B52PRQQqi4YWidcuLIKAD2RNHs9S/TUq/y?=
 =?us-ascii?Q?rptLv/apS+vLGe/0wfZ0aUzN4Itlp+QoDGoZf4YdboUTbYBVVe50jONoqYs1?=
 =?us-ascii?Q?qM6jHOkRXmBQXmDB4AlgI25KobVaw7KalcII7+JJUfjAQI7p/85ptkmdbJly?=
 =?us-ascii?Q?skdhXFyHWBw/o47gWmELm7+OBWvjq7ja1LZ5mEDmED9wtAxyAEqVdrFfpoTm?=
 =?us-ascii?Q?ctzdPMl++dX+D/SJd+KT4rD9XzJo+SSTftUVjFZsJwO6p3/rHa7wQ8uoL4QR?=
 =?us-ascii?Q?0P4REWiH3jGWDhERoUpiACpP9B2LEth3uBiLJcim+StQmWrFSnV+icA2V8E/?=
 =?us-ascii?Q?60fSGMNaiYo4W++fIyfM3LXvqXY95lXFaCgQIkpYhZGVi9hym2o+o0pW4TTu?=
 =?us-ascii?Q?Ea1p98xFAzqb89BP14hNc49+Rt9Bz5s5k0NIqwat1o96hgEoGC70bbM8zr9m?=
 =?us-ascii?Q?r67SzW8/AxQ0qdJXOAJKsSlKw67FEgxnN0MGLYyY5CGkyiUElxXHi1cp5ra1?=
 =?us-ascii?Q?BRgmXfRyTG1NIc1wyOQ1JLjdZ+ev/H/0iCkfjI4kYvpgyV1ODvnKewDKLMqa?=
 =?us-ascii?Q?eObZlvj4tXEaFGcnJmvsdXsj6AzceViCNew/5tOFuMraVtBzopxzIO4lKI+z?=
 =?us-ascii?Q?lCIcg5FTf7X4hVEfpmBO2RLeZsYEYa7DXs1kydm7wfaTzimhSKh7GtxXC+mI?=
 =?us-ascii?Q?FjplCZm0fLA78c0vPoHW/yLFgxW1Qh0VbJcp+oGsSMJLs/17xpvBK0xfKlwP?=
 =?us-ascii?Q?QK/5b5t5r+X/zyfKp+P859MR/lBaK2WOvjshH8YWNGe/QinS8KzSTDXGZ/EX?=
 =?us-ascii?Q?TOSn/mI41hvlMShRD6m7ViUR1gcWEPgvAXr2ekkgpK5eNSwgbkUnR/RVYR5L?=
 =?us-ascii?Q?etmTplEEtifLSszPyuJFghM/p3lxJMnJlh1eVJ3oLm2t2nBeBYMRpa31itps?=
 =?us-ascii?Q?TkRBGilLSSJP3+bk+00+f9t0mWieeZeGxxxxoi1rqByItghxV5vNAzRdprU5?=
 =?us-ascii?Q?NshVtAHEKKoqqP0n2KUpeuVjN2Hx3Avu2utGxd/2K3DBw7UuNVzxVVcp7Mdx?=
 =?us-ascii?Q?TeflFIM4ZXByZ/n6tzXGhmeBq4NoNdRLgKbvW8tVn2aM7anJbFSDosTbRPk/?=
 =?us-ascii?Q?u6vFX9xcdbHT3vQq11o+nfUyj7VsPVdQ1wH9Ev1E3qDOtTb5hqfPh4fSDn0S?=
 =?us-ascii?Q?4nF382uxCN02coHrco0ZkeDvHgQfB0NXbzruYfhB41Mrkv6MFgu3rjZArexp?=
 =?us-ascii?Q?XdqAn6Zuk9GX2DtcA2iSnk6Em2Obi3CsW8IpYiNhKlauom0iGu0EAQZJkgcc?=
 =?us-ascii?Q?RMBzgaWkEN0l11acDXlKI16RcF1py1VYZ7OhRVVactR/CYZSSZYxsh3QR03w?=
 =?us-ascii?Q?E6eDVw91nYXXB4eHnVDAmw0yycHz6kFfqscg4OGqSoHoH+rkxYTlfBrn/FNY?=
 =?us-ascii?Q?aonTbR4SOQIDpHdPCudI5++2i2NWgm/JpPp2wom0k4QZ2pNkvy0nau2UJaR5?=
 =?us-ascii?Q?TGrsUCAjiqZuw0BeKNQPguw4h1BjJTZkV42EVrWU2FJ9scKQ2zI8GjHYN/Va?=
 =?us-ascii?Q?MZPPIRYQWobQ1laOLJHeGW3T3Ve3bYcvBk/DXVYlSYyQuoFuiO3ot1n4DVyD?=
 =?us-ascii?Q?21P64RioLdBE4AJYqLGPBDU=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0c3c7e-ca7d-4245-b36b-08dd0249c276
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1171.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 12:09:57.5956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzr+DBbgm3ZjscTc1++6thrgUFDXvqx/UqKxbFCkQG9mItoCgH/ULP6kEUHGMHqFANCI4hQYkHVl0lkR94IQ7GZfnm7iQ5tM3iMdDGbdE+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0675
X-Mailman-Approved-At: Tue, 12 Nov 2024 00:28:18 +0000
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

The mode_422 variable is initialized to zero, making mode_422 ? 2 : 1
always false.

Since is_dsc_possible is already checked just above, there's no need to
check it again before filling out the DSC settings.

Removing this redundant check simplifies the code without affecting
functionality.

Signed-off-by: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
---
 .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c         | 13 +++++--------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
index d8bfc85e5dcd..705ddabb5024 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
@@ -564,7 +564,7 @@ static void get_surf_rq_param(
 	unsigned int vp_height = 0;
 	unsigned int data_pitch = 0;
 	unsigned int meta_pitch = 0;
-	unsigned int ppe = mode_422 ? 2 : 1;
+	unsigned int ppe = 1;
 	bool surf_linear;
 	bool surf_vert;
 	unsigned int bytes_per_element;
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

