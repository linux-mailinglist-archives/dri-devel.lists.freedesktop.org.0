Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093A795AE24
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834A510E77F;
	Thu, 22 Aug 2024 06:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="cNB7iYUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2048.outbound.protection.outlook.com [40.107.117.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF51110E77F;
 Thu, 22 Aug 2024 06:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmCUtLEyR2Ntf4ztRdo/7ZDrOgj5DDSFAGFCid/KgMiIJNhvAXlASZxPbfvZDXQaVIup1fx/hwXJsPEaGeuo+gZudAPlROB+PQInK4kfE0ne/4KAvk70vlOm52jGMZoYPCLw98JOL4tPEJVBbr7tDyuS/Sy2aU6jlbEDX33lf/PhDPzvOFd/hTnZ6a3I+AOGCo8tJqa/Yu9tnsSp4kOlpXWQ/ffWVGaW9oCCZv6kRFjQMNLqQSZWv7dwsJ2DaahqL0U3/D16SIAFzaSKq3/Pp8SDEySWNiMOBOZp1iyKQlyYvC9QUMRrL6JzC2tCPSTgck0jL6t7kh+urdlcQ00zDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDzZO710rFLkj1elfDytM9c007FIqcUXwciJ5i4GCmw=;
 b=pBaRVWrD4khZvBObk2Kb+rOdzeek5VG7YlhZY6+bR5qz6LOAu4rXzZ/0fa4zj0nKVZkhfWrRA3UBjg//Sn6JSzU3fTwLBpuYBOLF4DBrgdTZzaEdZH9KNfUmAIaxkDBkRm7NICFegec2MbXDD338UtuOfDGktrTBHQis5dUEtBoEu1bMNBENNm+pTQB3+sIq2JzSW0c8HW7n2vL7dduZ0/fD8cdUNkt4WA3tJJlmW+ar4CgCTelFSAipL8SGWUt5uNyb8mjjPyI+dxs+WIMTu/b6EjiKuKuLoGglWYu+gTGKi/6X7z7cBNYy5qCzRNyrgLi+50XZ94jn0A5vLIVb+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDzZO710rFLkj1elfDytM9c007FIqcUXwciJ5i4GCmw=;
 b=cNB7iYUFbzcio043P8//oGWKeiLs2kX/BqpPIwqf1Cjgyb2wX2QI3iNdER9Tw5RQ1zsxSvRoM4jA30PMUayY5hDrB+F/LDfNNXbdkEGkCicxgqIJMSJQh42pm+QUrC1GX12iK9GC6SpV07wpijOPUCntNFxwX2cLqvkE/7E6Zcx3vAedC5IU4abnpu/VI58oE3POImQTRLeL5hjfGzLPyXw8mjjetl8k3dB5cI6W4YGLdLpD25Y3wMs03ExUv3uvrLDn0j3J/5KkVl7iN/kODBjJkUlV/1Wh1Vs0VAYJoGr0JI/kA5r7E7brnmAYcwA2mEsMztkG0xfFpqksNzp1aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by PUZPR06MB5982.apcprd06.prod.outlook.com (2603:1096:301:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 06:55:10 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:55:10 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 2/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:54:43 +0800
Message-Id: <20240822065447.1333390-3-yujiaoliang@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: d08ff8a7-3eed-4cbe-cb93-08dcc2775d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KzUxEynLxyolLZQy3NibDxSYA6QBFfPouAzlSR4Ig8jNfObBit45gLUXONe+?=
 =?us-ascii?Q?jg5rX0fId/l+ZLvbvbdCU1+qdLXJL589QoengIHlyF8NRjTK4JOuVHQ5i7W5?=
 =?us-ascii?Q?d3aMrNe8DPTEHFpKlo1exO3rIlVJyKmq1N0hXElvoFdJw8SVmIM3g80XBbnU?=
 =?us-ascii?Q?UFtsAj/44/3hCKbXKT6LR2BvpmWxegW/yaT7Y9G1AVXczN6nlvPh/SMHRTr8?=
 =?us-ascii?Q?85Lj2aTUWportsURn5TV+hI2F6gFtbhy7H1bFytDcz6CceRZ0WcHcjoqW7Wr?=
 =?us-ascii?Q?dPXWPFEP9X6T94Nsz2D2IzM9ObEgEpQnOCyZI9P+rXunUOEitiyaMPn6/sC3?=
 =?us-ascii?Q?BTSzddhQuq6WBMSPFv0awitbD1XJhV8FcevC0dZfmfLrPxbImrOUHnF23ox8?=
 =?us-ascii?Q?OI/g5F8y94VR1OOMOw+QU68pBmGpUq8EISC7yIsoxWgcSFAJA/lDAbaDoFTv?=
 =?us-ascii?Q?xGnWwrMMlfN3Kuxf+L3zUkbiBO90sCJwZDBUUKBFYTIgZFF8XG17p84xOobd?=
 =?us-ascii?Q?iCtENExJR3TuCtFeUwdpWzrg+Gga1OUCM2mFpD4z4Bnd9AnFbKApQZcTwQgf?=
 =?us-ascii?Q?xwdCbr+C7YlChJsEo8AMeGwu0hUQiRZHCi0cwWSIho/wRqaJcA47iyIZmT2J?=
 =?us-ascii?Q?Xl//pN/opFr916g7So8Fj24hYDuZqD2Lz5OfuSnC7fA2tEZUJr7sOwmcgm6p?=
 =?us-ascii?Q?VwlhbyQNkNrMxpV+kqe4ZEFdDpL95YPoVfdsrvP1gNA7aSyytnrWoH0e0yCc?=
 =?us-ascii?Q?JkojOJJlo/Hl56YT5U1icc5WRu6n9//H2Ag+f64er7onVLotLKEMerePnZrr?=
 =?us-ascii?Q?CuNrIYofT0NekQ4ZzykrdCuF+unOzDB0pBV4za4P/TFFcQ6HxS9R4Kk7mEU8?=
 =?us-ascii?Q?aPnjVUnOtO8NV8u0JzWtkWsdNhj1bWdYRmNeGrfbz7pfcnVA5BzHG0iir1tz?=
 =?us-ascii?Q?aeLQzYMKQL4WLVnc87EkkFLFLDMH9JD/8Tqc+vlVen8013rw921bZ18ezqYP?=
 =?us-ascii?Q?ocFpHQ9v4KsuxQvQAn9G6lL1K5CtxUWyMktgkYQR/BuSLGPAbloIu/bNRgqE?=
 =?us-ascii?Q?UcUeew7/gVMcepmcqrxOmsvvdI8Iaaoi69idkRQykIxQKPGpuqebtOC347eo?=
 =?us-ascii?Q?cG8nc0OH05hRa5RziV9ly9lRaFwQl18eCPKz+mMu+GmXvZyRae0bDc4z40rN?=
 =?us-ascii?Q?IQpiMkt/2GtAJam8mzwbfFi9zDE+Dg6KBOopjrueN7qxl0N0WzFpZkqQ52RH?=
 =?us-ascii?Q?6WGConDC4SWxuVb3cpaginlJAqh5Q4sGEdLRHgusijy2Rpb9y1Gd5DZni7lo?=
 =?us-ascii?Q?airkvi4/3zhgVORVHEfhCJKubQrwKw2TmA883jCGJEFc6D/aTidHhLjE3udW?=
 =?us-ascii?Q?t0kNQF4Ha3tZzl18TGe6x5cHKrqWl/iDH5JCoIZ/posBDDJ1drsDOXkB6aKC?=
 =?us-ascii?Q?11hG+XejsfM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?maFf9Pnth8IAf2kQU4sLshP+El9u7hPICOlTyaMNUqudmNTe0Zk3j/YTx9m4?=
 =?us-ascii?Q?vhHXZRjjunJQJE09owTgaOeyujFpiwYE3phtmoCVnTE105F9oML+mOYpoeBS?=
 =?us-ascii?Q?0AdMhfy7JA1I9SxzE/d34ioprKvZ5q2v7oRaVAAk3GMqQ8/IhvoAYy6NPdB4?=
 =?us-ascii?Q?w1ydjXdTXb/LBgPreSt9r60GYUXglXYFbMz5qK4tORHShUHpmFwmkTJDTyjC?=
 =?us-ascii?Q?lmzSSXBuXYotFlj19CHbUtjyYA04fjG4xQhK9jSRkmcKvFNRrtqWSKgDe+Mx?=
 =?us-ascii?Q?Qu1vMKAiiGlqxyFzR9OoDlnD7iK9aI+vXq1QZ+FTTx2HIFu5SKmk3wcqjUrk?=
 =?us-ascii?Q?mT7yLeBHDW+UL8NhVowmC8bmduTW85G0lVJspheUcwqj82ptdAi86BUqU7el?=
 =?us-ascii?Q?RBEuVRGLCXJVokV4G5t6pbi8AMBFjbQAwr2vhrKEFJPSU4/+RbIrgT8pNFbd?=
 =?us-ascii?Q?p4k8q8GzvV7Nm61EqTOM763GbA16CkgLqA9ExZDu0UDfcp3ZinOI1AEd/bbv?=
 =?us-ascii?Q?2pfAN6HrKnOh7VQgJHzPDKDeNs4d2HpL9fI60GjkOkWeOEngQ3QF4/RNTkTx?=
 =?us-ascii?Q?eiXSc/8x94OeDRHExhPJkat6cHS44mreQTvXlaSOB/3Tx8Mvoq906GEYrH0+?=
 =?us-ascii?Q?N0/z72U/cTPS6tEIs2oLFQBo1SWuMXteSteyWZRDv11tN69jQWR69KxUJCZZ?=
 =?us-ascii?Q?rJNi/ZV8hNoJ399xAdI5EnicQ+t8pvB0HQuwIi1JDcf3Xl50jS2I5eY0jAtW?=
 =?us-ascii?Q?/nt4r9Y/l1fEkGJhq+rgbBGMTuPxHjY7Zql1P65z1Dmjb7SOE1VWPKhC9dD3?=
 =?us-ascii?Q?K/kFesXHGIVLMdUcHNiycoBs4lOWdjzlRRC4Sihsvwi+qjx27HN4f6weAPlq?=
 =?us-ascii?Q?vgITzAcxGNO+nuGQ1RYi5OoRSuW7jLfYUPZXixcvxKxxORc9JDR6XEJ4T5zO?=
 =?us-ascii?Q?y8C+LS+SdOh6myvRNsvzLyTDak3zhuwXdxpfTFbVxgL1jcBW2QAkElEHG7rf?=
 =?us-ascii?Q?SjA1apxjawWuRIzxYR3HGOQFUZXYqeb6lnEVGKkmohPsn6jCOlZgi4fZY8l1?=
 =?us-ascii?Q?wKhbJDHCjW9ECvRRbNCVyi1Fp/u4NPdQ2NbIbhh3myfEcmQtPBNh39mY8qmT?=
 =?us-ascii?Q?gBZwDV5s4VFOCcxbZBttHPbE0JyRoE7XF8yDEYLDidKtY9Vwq+RaPGkPQKUA?=
 =?us-ascii?Q?83btTC/0mXTuc/E1bG44Wtez6H+go/9O+nH7MSYbWynXdiL6cl9cI4DJVwvN?=
 =?us-ascii?Q?eBBJHQNd0v2/7LCiOH78ycjzkTQHyyXbd1LAYeQN/pS4p7PUoVouidcvlLsd?=
 =?us-ascii?Q?R1HtF/5760AJSBCa9ww9ErO6SuZDjLFNVkkzbSwXYBHpHoeQkK/6i4amzAAg?=
 =?us-ascii?Q?Q2ibmS8rSFPvGy15RQa/tw5wjKs0OWkj/OkxCxlq86dgXct1wwfmYcPKLPGz?=
 =?us-ascii?Q?4qha7G8blPGitj0kMWVTR7HY8a+TuI6ZTn8MLiDPAukBf5PNjYcPj3OlEzm5?=
 =?us-ascii?Q?hCWACQ64kJgueumXOu6vXgnwPhhWh3SuQDdI/6rXmpg3YyDOFWpKFXQFNdxn?=
 =?us-ascii?Q?2dXlsYSJO0xbec2KLzAi7G40WfO00IG3A5BXWV9n?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08ff8a7-3eed-4cbe-cb93-08dcc2775d81
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:55:10.7316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1x2Vo8HI2RGPnQs8OQHkgCCD1mvhlgHX369PcqWhuj91ZiNwocBDJ4FfyGJY+zi7OPv91aF4qhRMjiWN/DOWTA==
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
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
index bb4f3bd7532e..4975d47b66d8 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
@@ -311,7 +311,9 @@ void dcn2_update_clocks(struct clk_mgr *clk_mgr_base,
 		new_clocks->disp_dpp_voltage_level_khz = new_clocks->dppclk_khz;
 
 		if (update_dispclk)
-			new_clocks->disp_dpp_voltage_level_khz = new_clocks->dispclk_khz > new_clocks->dppclk_khz ? new_clocks->dispclk_khz : new_clocks->dppclk_khz;
+			new_clocks->disp_dpp_voltage_level_khz =
+				max(new_clocks->dispclk_khz,
+				    new_clocks->dppclk_khz);
 
 		clk_mgr_base->clks.disp_dpp_voltage_level_khz = new_clocks->disp_dpp_voltage_level_khz;
 		if (pp_smu && pp_smu->set_voltage_by_freq)
-- 
2.34.1

