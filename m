Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B4C14C13
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:06:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A9810E3D7;
	Tue, 28 Oct 2025 13:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazolkn19012062.outbound.protection.outlook.com [52.103.43.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D0A10E3BE;
 Tue, 28 Oct 2025 12:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wc4Q2zv6i/MSHogqNteWeo3Gn39JopYxAoB2tS7LWTWaJ7FAaqb9YFwMpbSo6MkUauP8CTivp3K3UKgWGJgpYDc7U35Ujs9wzhHCQJwKNn6F3u43yM7lRfJvKJ4HaWmLBRIlK5pXVyZXGw0SzGM8sAEWvOKsQis9QEibPui+YXzvY3akJskimNOGXTr75jF/Z7Qu63q7JWHUZkKJG57swqMyoPiGQbTyyuHPse4KS/XMCEng6cLFTEO0b3XjP2RG2z92SNxQ4YOHBqMtxdHgTZfR2En+EG2LkIrZtJfXnOc1we/EvKRbI4qx/CdXvP6NZiowPHevZAMjolrKDPbBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtfCMPonMQnZTfsWU/6SNbxFTo/0NcddAbicn0/c52k=;
 b=kbOn7dRUiQXDXs9O3MutccMMGkqSjUXwNUEFSPtSJIW2QltUkVd9tfQNHdm5zeeFBge++ctruHDqAT1cZrJCsip2D/FHS6WYaTjqD7iszPQMRq3HXwPCYRVbDkO2bAB473C1AO/MqN7Xs5QV1mTFfFaUHCOX3kpCM4dDFrvpBWF/0jq6PrjDCuy8Zd7FDmT9BWmdI39WLs8ftkiVorRIH7lQhYC3ZdOhwfJ+nusTHuY4FAE3FzlklGLis2HOluxSyUdUYvb7jnaS/3JpXgjNVMbW7ZWaf9OMuWZDZREnIwOOHDg1SuDw/h1x15q+A7poiieiU4DEwFMDAkD+IpgDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYUPR06MB6099.apcprd06.prod.outlook.com (2603:1096:400:356::8)
 by SEZPR06MB5607.apcprd06.prod.outlook.com (2603:1096:101:9a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 12:36:56 +0000
Received: from TYUPR06MB6099.apcprd06.prod.outlook.com
 ([fe80::2223:6c27:d5c2:aa47]) by TYUPR06MB6099.apcprd06.prod.outlook.com
 ([fe80::2223:6c27:d5c2:aa47%5]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 12:36:56 +0000
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
Subject: [PATCH] drm/msm/dpu: Set vsync source irrespective of mdp top support
Date: Tue, 28 Oct 2025 20:36:35 +0800
Message-ID: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::29) To TYUPR06MB6099.apcprd06.prod.outlook.com
 (2603:1096:400:356::8)
X-Microsoft-Original-Message-ID: <20251028123635.3523769-1-teguh@sobir.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYUPR06MB6099:EE_|SEZPR06MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b8274f-45ab-49a1-410a-08de161eadca
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|5072599009|461199028|5062599005|23021999003|8060799015|15080799012|41001999006|3412199025|440099028|39105399003|40105399003|41105399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0KkIK1Rggj8CeZCNOlhABX9edZrEWeu6zkYfn61L0bcAsSUQH1P32ZtlMU52?=
 =?us-ascii?Q?zHUnUkfhdk9Rb0oCL1u0e1V/0z88B3GdXl/WeZ+Suzn1huqCUaP0VXVJLJh6?=
 =?us-ascii?Q?DN83ZpT2yRZn147m6lIvVqhAkMvDl7WVSPNMcailSMPgw5U8u+GLh4tel/Y3?=
 =?us-ascii?Q?fPNnEpYciK8+hCReC9610uuo+8BRT6ftLZqOLJbzJpiC46RuVd7eeMdN8fKm?=
 =?us-ascii?Q?HnTEHLSxVOM8URb8gb5vhajcLBHZhBx3ie3FSL1KXVvJ85czQH8+N91fy50y?=
 =?us-ascii?Q?y3B+LP9/Y6un6FxjzDQDJW3KY2oiMDZ58DEiP5bZYep8h2BMgJtg9HNat3MJ?=
 =?us-ascii?Q?5ZezXX5dG8WU3gNS43mQUAKe4oZsVV0KVMTwAQYVItn/LQvJAIX1d16B9PsN?=
 =?us-ascii?Q?Zv+fzaZP33lgDoYbhMm7X2BBo6TgZXEazWvZKaEZcfXukQmwYRNTv2wHd3iN?=
 =?us-ascii?Q?+eUkakxrP5N/YqKmijw8KJpdAumsreKfR8rTKlbs247htZILhaAEVoRwJZHR?=
 =?us-ascii?Q?nZRjclbhzMCgHaIgg2KD/dHUKxLGJyUomks1CNnHRn51sSDHTHaBjQRZnrNR?=
 =?us-ascii?Q?bYUhjEHz9i89urqDWmFKXDZ5FdDFHh0/qZy2MK6GLaOj28/5v74EgUd6l9TD?=
 =?us-ascii?Q?C8lQShHbhYg7dFIoDJrIqJxpOd8v6nQs5lNU5jSm4S12jpavujqQidkSIVnT?=
 =?us-ascii?Q?kW2DQPDlbos3OCgwTdmjlEjgN2WDiGZ7BWYOSe3jaV8IJzyy4EWGdG2Klm4v?=
 =?us-ascii?Q?vzcmV0WNaiLUSetNl0wfqh9OiiW6w7PbaqiT6P+LwQR1sFI+jYmehMaPRnuu?=
 =?us-ascii?Q?Ox0N8Y10KhaeBorzkA8eN1CR3icVuUeUIg2k/gORkIfmwKSh1NREZDFE2Tyc?=
 =?us-ascii?Q?Ex44gR/eltGnJ/7YgRMERsxYLl1rUqDoeRGl7FSn4JCVPO5C8msIIX6Nk3Dp?=
 =?us-ascii?Q?e3QM8vVKFYOV7WuN4+JXD6eWsDQD1FJM4re+ZD/JjR+Ux0AR1D6QYqVJNBT/?=
 =?us-ascii?Q?uHJkK+IKSNkD67yHITjZC6TK+PbXcpgUvD92I7LfPkBzG7htCuIdYEBArnSb?=
 =?us-ascii?Q?VMJGSDwbZSjJwKeqDM4icuJ+aTYoP9ouU+i7g9TYJ2z4wetMN51cIjG9U2aU?=
 =?us-ascii?Q?O9jK7DPlDRO4tXZivLUJFkEVAgdRCo0Qttzqnhs5KP1HYIbYaZtQ5ZkmrIZV?=
 =?us-ascii?Q?wmI+tu2PUuTlbgBr1Ybv0F8ay3fkQERnJcUQ5V8A66ENynvYIb5Mqa1V2qF6?=
 =?us-ascii?Q?zP6HSnrvLrytxdobq8yjezZ+k8p4uGgiSS2YUP2JNmR7h0FKuiSAHlH0pQBx?=
 =?us-ascii?Q?bCA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TFqIriSk0PXiLFrg8W/nNwBdaXYN2sc45gebu0SEIC2aLQOccg4QOZdbQxae?=
 =?us-ascii?Q?b37vbcAhKjzuy1pIBUiOQG6ZvkJULf5ZwPJ5T5jZMTJJHBzs+wxkogAZjSwA?=
 =?us-ascii?Q?sJP29KPQ/w/Cb4hDBonn7lcIyMRaEQ28JzBhUIl4zMCnezYgupbDRPCRMz/B?=
 =?us-ascii?Q?YRtXuq/eSLTojWDZ2SNGCn6GdiOQtthqF+egaxT7mOR1vlLBO74m8zJIwfQm?=
 =?us-ascii?Q?Y4aGr0zNLciDDiWnAgKOkfBMkCLxpUjRTvZOzHibdKAM/J32KsuMm3PpRkk+?=
 =?us-ascii?Q?2ua/WDXLAwR//luWPWnfRnv+6YmZGDAwjm8wz89Ih9qbPgiaGwv2sdpD2xZm?=
 =?us-ascii?Q?dpc/J3wIkUKFcvHoTobPdg1E/oyU26hBUiCsgS2G3ZNHXBKzJocQ01yfMqhQ?=
 =?us-ascii?Q?CC3Dl8pm/ZbR5kRovr71YHT/zJoYYuVCItM/bCq/psu1x8ATEYJMVytY4fAV?=
 =?us-ascii?Q?yKuG9oHroqF0pbVNR8FDpjRjiL1jp4ICOBy4FNzkCiFXgb1GxFL6GV00hupp?=
 =?us-ascii?Q?/YIc7jv702wxeq16ZGj7Q51ixk+hRgk/MyXP24+Lf+0C8crvW/hPpwoUgKjv?=
 =?us-ascii?Q?alja9Q58Im5VAhg90MTbLhlruJoz3U4+Soxt/HV3nQOvBePt7NHn30wWa2hy?=
 =?us-ascii?Q?zOJoOAh4I3pOyDo03DG5ukjPMGz/cjWZI3aTjpU1h878c4TyWAsKtZmzqIi2?=
 =?us-ascii?Q?rXHdZ6Rmh3fcykqtQhmuYrTOtVz/yAvz2oXNTp6t//SQx3aQUc1/cFVE+sj0?=
 =?us-ascii?Q?dgc5EpCggikwpSO7VGdqKBDS6PrMcZa4H3/RpoD4AZn8K0XeSQTLbaagUKKx?=
 =?us-ascii?Q?D6S+3QnUdhc6DXhjzNJeY1TgAQdlmmWzwX6KXjJxUV+p8YV9/GbZTaSVleNy?=
 =?us-ascii?Q?iAx4KiGrzBw4fISua6uC1XFQu9g9M7x7Gcd3BJZyXfOYUXkPoyjbkhTiUdjS?=
 =?us-ascii?Q?PHV1Zi/SMGY9plEb1JWsF1t7Ecd6E8x1mnmptAdi8GosOOsrmg+iHvUqbB2y?=
 =?us-ascii?Q?gAqxL+Yvoh1QVjP3Z8lYX/5YEVSzGi2dXsYMP8EIkjZqU0H3JNOOAwlnxjj0?=
 =?us-ascii?Q?sgnNapbts8RI5EwTjIY3DOZDQ9LLW6pHyil7tBjsoizXFRJYSlX+3cuGarSB?=
 =?us-ascii?Q?ZyP9w6xQ1GizRPPo4uCEv7H/Fig22CvJyJKJUEF8CJ3wSp+GfMYXkzPR6eHx?=
 =?us-ascii?Q?WAfO9EJAKVvRdjU3zYFj3UU56FQgxrJc30e5Yw=3D=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-6a509.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b8274f-45ab-49a1-410a-08de161eadca
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6099.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 12:36:56.1972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5607
X-Mailman-Approved-At: Tue, 28 Oct 2025 13:06:26 +0000
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

Move the loop over phys_encs outside the
hw_mdptop->ops.setup_vsync_source block.
This way, vsync_sel() is called for each interface.

This change ensures TE vsync selection works
even if setup_vsync_source is not implemented.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 258edaa18fc0..f36c5c7924a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -784,24 +784,20 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
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

