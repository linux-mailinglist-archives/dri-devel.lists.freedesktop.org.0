Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78D0C777F8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 07:03:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0915110E7E9;
	Fri, 21 Nov 2025 06:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazolkn19013082.outbound.protection.outlook.com [52.103.43.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB3C10E7E8;
 Fri, 21 Nov 2025 06:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYSDLH+wsQq1NrAP1pIpZx/aicnyZMREH84UKfI7UlpAIMReQ/CGxO6Br+dvdNB9RAW7XvP4YUdQYdA46mwcwyrAqhTeiQB7qHjrQ2qTgs7yZUJZmn4sRtBOqI4SIqiUhj9yQ1l8b9B6601bZN8BJxDuWSErz9ETArvzwMO5fH85Cvj7mrBztKqIAQBp7QRFU66W9V3b6FzZiD37+XN+4P3DVRgLNp7x/TmTSyuRn3U6haO3rp6Wqcuw/rmumfsknifSHh+DjNKRdQ7ClZwWNNARyL15wAY4KEcAJ4BbnD4lt6cBFdn4+yenmZ+kPSG4TuN/ekImDDHiHavdK1SGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEuXGghlXifS3UFu6BCDdTcCQ0MF2WWGO1PZOe+x6gE=;
 b=aIVlAfkXxgAxPBhYntWFt7494WooOFmZxWjqXrc4/QuEyziimakTc5oc9h10HvFvToEYBd3+jNOtKHwHAgQ6l2ST2ZtI6+VHEDzqrtER+ovw1t3GMIft4VGSWMAD2n7vCuBIiVrzVRZvgNN3wyJfQcLKIX6w8pG6XyjkmSbevNwFO6BQlQ92I88tstbMAcTz6n66WVA/0wRY1exQ5E3Ls6JQwoG7l+QaxxSuEhRcDlF7afENfDnCgwoESFVKof/qdxrdqTmKE5ptYRI/mbCc3GfYtes/d7X6Zog4uMwFbrUXAiWt+2clec9pMKCCDmdpdLpqmyiCUwF8qX54ol87FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYUPR06MB6099.apcprd06.prod.outlook.com (2603:1096:400:356::8)
 by KL1PR06MB6710.apcprd06.prod.outlook.com (2603:1096:820:fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 06:03:38 +0000
Received: from TYUPR06MB6099.apcprd06.prod.outlook.com
 ([fe80::2223:6c27:d5c2:aa47]) by TYUPR06MB6099.apcprd06.prod.outlook.com
 ([fe80::2223:6c27:d5c2:aa47%5]) with mapi id 15.20.9320.013; Fri, 21 Nov 2025
 06:03:38 +0000
From: Teguh Sobirin <teguh@sobir.in>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Teguh Sobirin <teguh@sobir.in>
Subject: [PATCH v2] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Date: Fri, 21 Nov 2025 14:02:08 +0800
Message-ID: <TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:217::16) To TYUPR06MB6099.apcprd06.prod.outlook.com
 (2603:1096:400:356::8)
X-Microsoft-Original-Message-ID: <20251121060207.148684-1-teguh@sobir.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYUPR06MB6099:EE_|KL1PR06MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a688eb9-d040-4d9f-3f83-08de28c3b614
X-MS-Exchange-SLBlob-MailProps: a+H6FLLcF3rgze9d9FGU1K9+vGKRAfgQURV+DDaV8ESDn5UT3UKppYR+0Dkw2lkRA9grYQNvS7snCv7t+QU8YjPA10tZOesc0eypjp9U24GVrYhV+tPkaTlmI7NXL9xUVi3AdEk48YZslvpED+IiYPIWVm0mvDorHow1F1JEHpiRIIquejBfvUx2NpyEQmPeCZUK4OpgWX1wytmkOX4tfOZk+k6AEm3LFkWwSR9vY6wZCYJwctHW6e40+1ueAqsI/efD2YAb6bxvUmTCtIuweSiQ6NYoEgEBWhzC1Egef5G2Bp+8kYlgji+PMheAe+yfukLQ+dBLkxoWU93laqS6puO1hitx6eftBGbl3eSPm6onYNzww5PZVTMwjK+kZdLCR96kO5QvJ/10KrWN5rlxii9D9G22KqgBHKFuXG/KxMVh/6hK6zpOEqaFMEg9Dr6DvnA5X11xq7MHqW/otmkyT58DE/hFEc31ulgZvvl/Hanv1YQTu3s0jzdf52WRYUkJ39S7+Kchzg+qIZ/1GtohHcWFTbFwuh5HyOGbL758NhQGDl4TBudJepL+VtWI4bycKqfw0SRMhxesoEY4rS05fe/IHoX05UQiI2q7noWTQ/KsfTbwDPUTiDyH4ls32SuNtE+ocFoRgd6tDuchJtCOIWcli7h7BUhZ2JoHfEedAtJxZIDr/k6FpF02Zvz0Yv7p82ttV+c+h+wdW043Hr/XpBPrv/44rdh7+mKK0TUS+77v76D71ogRsqA7jHkmqY7cVPRn38ESN/ZNRYsrajnnfMJmTd+WI3zPyZQsiaTwCuuvVjJ9otjk2iBGCRDGsgzn
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|51005399006|461199028|19110799012|15080799012|8060799015|23021999003|41001999006|5062599005|5072599009|1602099012|40105399003|3412199025|4302099013|440099028|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZO8GW+acHbrczRdORbVJH3hzkacXIHzCLRpxcdDX7dnBD3N4Ee9ljHhLCdi0?=
 =?us-ascii?Q?y9QkF5p4lpQKxz5Fp7YEmLs7ahtGFafzm6Y8Ntp2i2Z0zIujNuwso2clBX6+?=
 =?us-ascii?Q?IF8KCBQ9bbf7KIzzqMZ0x92w0g5jMtzsw1rPA6VXSf8+//OJuHS5SyQtrWGa?=
 =?us-ascii?Q?sGJ3Kn+pmdjxoXXt3xGRJYeB7+LelUqeJGz4a4bH78vlJE6TF4cN4gE0WPxg?=
 =?us-ascii?Q?PvU/raR5f/4Fzm9jIKDVGNKePL+Oq2DwK66KPWqouGBZSgnty2RgZb4OUICC?=
 =?us-ascii?Q?QEziezeShWgy83rn8pRwvuRjypN9BWmaxoCEznF2Mx8HzWFDNE3DSUu/03FU?=
 =?us-ascii?Q?RADqXO4NUSCwEHK8t/tM/5Q/CasfeAXfMqys+tKd3LmPJI1kqhwgt5N8V0r9?=
 =?us-ascii?Q?BsRkK8h7fUaEdBqVTIqMPDf9P5SuhSWDc04vUbp58YdZQ1jI+6YPT0yUMDn8?=
 =?us-ascii?Q?FDFFNR3jj18AajdiKf4S3Xhcw3jUIHWJOdQM+6cfTjYXaT7arJKHc45TnXNm?=
 =?us-ascii?Q?wSaoDkiookMiVULKTBubfdXrPTARvw95IvKvhJVRY1qZ/GXFBpVM5aIos5KH?=
 =?us-ascii?Q?L/FqK1W75euwRPQuVkjO3i377e4NkHSzEGUsrwWp+JDzoJMBSM5jFK9VzFwg?=
 =?us-ascii?Q?C34AXL+iZ78ufuwx2GtMRpy8uq53A4nf8jIO1idwU0hvpLBlqbyoN0z5AVR4?=
 =?us-ascii?Q?FGA4FNTIYiStsrpUHGN2dtZmaLsYKt5q07soq2E0GtRTSuSXGp4ypy+t+bpm?=
 =?us-ascii?Q?DzMmQ9vHLOthncz7SatKU6s8C65VptgNZLg5FcGotL1DRGqc0WOPz8eJE68a?=
 =?us-ascii?Q?3pJot+3MR6jTd9mdNnWFLO7BJmGvA0q0IsbyldxdPDjeuAJb8pe+f7kI6yZy?=
 =?us-ascii?Q?MLYSudLZbBYB3ZzmHaxlIrIJzbIKvCvsAmJU1bH8F8pEsvcV9c2fNhnikc1Z?=
 =?us-ascii?Q?04wf11eF5i+B/qC9ff1bdoaf/axfykWG9YRFNK4ANT68tc9n3Hf4UiRY2FHi?=
 =?us-ascii?Q?ZxRvZ4aOGld4ZAH42vp2gKuXsuncH4DCQgRpEQYb7Nnv+04YslbLmL1oBSGm?=
 =?us-ascii?Q?YVerMUV2FViTewhYRHcK4tRBaEjYFFUJ1VY8mYtMzRwgIGDdmoM4tE8yv/OP?=
 =?us-ascii?Q?3N8atav8W58GxtoLnO+4HBeN90MWdqIpA5ACSDtPRHjtoIbDdR2R+S3wvnqp?=
 =?us-ascii?Q?9VLMEcwxDly8ftEmf9Yte29HErsRN6ldtGWwTs12OQcQREVNJWvyIa4gLsCd?=
 =?us-ascii?Q?aRaNVI02d2adDsa7sP5w4OMOlN5B25KHAhzQzx3D1p9dfrQb6iyfFVztWRXH?=
 =?us-ascii?Q?fn+kegJDBmIALABmiZ/XzkQ9ah/Fr20d7XKIJH6Os9iYZXT+6P9/9Ic5kTKc?=
 =?us-ascii?Q?LZLwRPqa6Ajf5Pi6U+qKOd/LsUzyF2qZbx/d5ivU7c8dAcxMjQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A/knN+E/Btn3MTED0pS0eLtLTWLpJK3YUsc3vf+kIdEHDs2qtwcZiBiX7JbS?=
 =?us-ascii?Q?UoDxSu8L9fwAaQHlZsilorWeKkeqv7uCkuhkIvFTA+YjkaGHWQCOTLpIvqbc?=
 =?us-ascii?Q?EhqT8HN3ZOG8akjvc7dZwDUJq/hFEe13tqGTt8ouZd/QD74mhu2ONMrvFzR5?=
 =?us-ascii?Q?fsj8CF6x6D45dtgOFcE4Z8cRonBixwfC13YL1A+JEdOE13zzdzg+mtxg+Y53?=
 =?us-ascii?Q?l+HL8GBFR/HwNmtCm2NDyNOOzd2EIT7XUASvZmoMoPrIZu1GIelJgULufvMz?=
 =?us-ascii?Q?qKQPg26cywLKQV6JwZDeeVQVnVEAxs/Kq8d57xO+qGWGNGWnIMuNUu+TWJsl?=
 =?us-ascii?Q?tpyqE3WE6yisn/LQntAedwPOxrrYNh8f3WERcAyoVaFZ69P/h3mZuW0AxR+U?=
 =?us-ascii?Q?iJkdm0DO2N5+W1gktozZbzCodED6MwSLFP6JitHaLXWqSZr3JSoDg9FX5hfR?=
 =?us-ascii?Q?ppgwiX67A9sp8LGpoKeQ5yt07RT7SfN4aH8ctLswDcKf0+4W+1qR3wFm7J4Q?=
 =?us-ascii?Q?Su6RTo/uvI3o+WUyxD4TtOsXwVsdKFkCqp1SgAKnYf/tyHE+JC3Zzbj8WS3u?=
 =?us-ascii?Q?RVMUT9ZwsAWi1JyXqbCbSWpg2BF5XZNm/oLpA/Cno9TRGFiM3OOABA6jexjy?=
 =?us-ascii?Q?m3qT/epxEu/fyEilD8+KMf8GXyM0ukAnUWV6+bcpXNJGtdCPi3kQB8Sajrpb?=
 =?us-ascii?Q?ehEQGMkpZ0iOQcyn7/aPlUWlcSsuTtmFQUSre2Rs5EHr6QBtGl4VnIBl4X3x?=
 =?us-ascii?Q?Lg3lWNjVusxh+d6rOp2HjKuwJAvb8kif3KiYYFHLwtEDLS6JzHUrqXQ+hjGy?=
 =?us-ascii?Q?mUTlWg6r/ycBM6XYYygPqQaqEV9s+WsRazPedKs1tCkSsHCbkgYXAJSjfDWe?=
 =?us-ascii?Q?HaIw9BA571g+pZdOph4uEFV0vQDCBjZUyJ4RcSG/wi3DW6t7oMOwMaci85s2?=
 =?us-ascii?Q?6zVnzJ1KWBNW96moqqwz4rvqXcgvJzrsV1UXvz01bJ20T2ts+8ETJqg7kM/n?=
 =?us-ascii?Q?3ldGgrmVcgIu83NN/8zUpCGfbrRAjHBYKM27w4W5CJ8R+uwrPM+F6at34BGY?=
 =?us-ascii?Q?KArFMh4t1CNxHTziHtDepmL81gQtHGFFjIIMKX/Ap85eXUXed0++YQpg7D1f?=
 =?us-ascii?Q?4SHwcE0hr6dYNrqsAQ+juqoAijR2AUiy+t8vd2TbxEPGtbY91mvdOEiQn7IT?=
 =?us-ascii?Q?v79iIdgt7gD6H/mf1yBlFwAWYnqx5E1lzEB9sQ=3D=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-6a509.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a688eb9-d040-4d9f-3f83-08de28c3b614
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6099.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 06:03:37.9359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6710
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

Since DPU 5.x the vsync source TE setup is split between MDP TOP and
INTF blocks.  Currently all code to setup vsync_source is only exectued
if MDP TOP implements the setup_vsync_source() callback. However on
DPU >= 8.x this callback is not implemented, making DPU driver skip all
vsync setup. Move the INTF part out of this condition, letting DPU
driver to setup TE vsync selection on all new DPU devices.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
---
Changes in v2:
- Corrected commit message suggested by Dmitry Baryshkov.
- Link to v1: https://lore.kernel.org/linux-arm-msm/TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..f468d054f5bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -774,24 +774,20 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
+	/* Set vsync source irrespective of mdp top support */
+	vsync_cfg.vsync_source = disp_info->vsync_source;
+
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
+	}
 
-		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
-		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
-
-		vsync_cfg.vsync_source = disp_info->vsync_source;
-
-		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
-
-		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-			phys_enc = dpu_enc->phys_encs[i];
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		phys_enc = dpu_enc->phys_encs[i];
 
-			if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
-				phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-						vsync_cfg.vsync_source);
-		}
+		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
+			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
+					vsync_cfg.vsync_source);
 	}
 }
 
-- 
2.34.1

