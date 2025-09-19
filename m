Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C515B8A286
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D2110EA28;
	Fri, 19 Sep 2025 15:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="jaAESvus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA68910E241
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:04:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U26tYJOuqNNAkIWEUf5lppqXLTQDeMBoLWh0laW74fXHhNKY2qXwekn0FtOhDleCVX/0An8Y5cbu8PcWf4wPys5bn/vwaISlW70ocsKj0Dvys3olfOuB/jbxyg8XDGM1jh05mnhCMdHLinR2EoiEjqpwQJLhdabFP0iRgzxD51ivNnqO+Sc4gsOm6rhjA4N3irJl+/Q5ejuV/XNaLtCd0Y2H6bk2AYyS3MyV5ou6hl7Ri455WA7CwdLEUROGCtSRmWJHQxxLbbrpyaJhMKQVKTsrO+O1OgFRDZlOlbbsZ1ouhPTS+uzDNxuTq7otWur72IssjBkb/sNeS2+UpQbSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnlQvBij3DkvbsGPse+HcfQpLDrJbbH5Mh3diu1dv/Q=;
 b=Dm4QUF5WbW9kN4EvrYoyKk9U/NLM5ylkNhgBVZDV6Z68w85cWAZbKBVklkbei1EpI6aVmBemkZhHMfvArdtmW0M3V+Ed5YZ1lMmDJ8UJWWQ1qamC6W7OQQUZG9K8wdlG8cFUnEnTYQkNtzNuUt+jWAuODke7dkWjULSUVIexHU+Wny3NzWnDvHgDEPNCUl5PPmhncAHtIx7P8jLDlswUVKcLocPPUw6Z1BoOD7jdorpWZeXpyhxgdE4rxxGjnMs6cEhSKI5VHlt/FhVdd5JAr2skdJ3bSYDGi/IenPDGDqxn+QleDbvixkVK3J6/UuZVq2Fm3YFzUNmG2BeSVMqaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnlQvBij3DkvbsGPse+HcfQpLDrJbbH5Mh3diu1dv/Q=;
 b=jaAESvus7UQAH8zz77TEGFJuBidieMCB8Dr5NND2p4vW32z9TJapUJaHsHJJ2cd2szCaTAEcRDWfsSXLXhhNeBW2Wga5cHP4Vs6XQEvWF+Z2NhLAaumfn+dKPO6ZPClEsK7dRczvsEVu7Z9smGVdJPDhb38VPrcJmuSwcWYq71JLtedmPLhKdE8CByf6Cz134dCoTUNkBQAcL5I+Cj1IT7Ya/cWy1V0kOvG0Rhi+41U9nn91A8HGetQVW3zVw2u73XPq7UYaFfcnokEzT5D2L1T0qHz4hvMMU66SYRi051W18Veawzx25ADXP3/lf+/mkCyWY5Ea9MSBqNGOfXc6cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 15:04:10 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 15:04:10 +0000
Date: Fri, 19 Sep 2025 11:04:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/14] drm/imx: dc-crtc: Disable at boot
Message-ID: <aM1w4URkELrmK7No@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-5-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-5-784c03fd645f@nxp.com>
X-ClientProxiedBy: PH0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::34) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA4PR04MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cc43b1-5ad3-4f77-9fb5-08ddf78dc9e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8cVvUuefnQ13BIcFAEtRIo86UVS7UWP3AVib91+yWAvMlxlh2htUc73FEHOd?=
 =?us-ascii?Q?nDTTvvXC8ggvoLQWLZbVj20TfUSvHH/0t0uXu/ZFMnHdh12dtl8JA/GrSr33?=
 =?us-ascii?Q?RTAty9RtX9wk48J4JYA9MmVxGHQOqFA0lTV5zKQvaAy8sRdgfERLR9kh2Zz1?=
 =?us-ascii?Q?7OnVnTDdC+I88iy2Tmq7HZuSCLlYCi6rfbFWt1oNLJpxfQ7iD0J8rRNSGQGA?=
 =?us-ascii?Q?BH+9G3JABJKj10k3rg5j0M6vRDzxwaWjv2XZyB5RnZBrkI3JMM1ZlPyAqFUO?=
 =?us-ascii?Q?ICJciYuddYHSfffqGfoCrTrivGZs6Uz3sd+xDljF2I4e0p5UnrHb4qy9miSD?=
 =?us-ascii?Q?Cxxy8s/RZhmK9GgRWlUCumbaAhuBY0b4Shq2mPyHPGO0tXKpPB0sgX46GqBf?=
 =?us-ascii?Q?kASKQpl16qRhVvwYrMFlhW0N6n/4gm1YwVaWBvCAR819Hv1nsJYRh7jmSojh?=
 =?us-ascii?Q?lHbE2d6tVrtjd7bmL4Y1Tf2Kj0eEI3jxX1lUBVG6HUaykwBUdA8qYl/l63FH?=
 =?us-ascii?Q?9xoUtySKFOgXqnHrrYZNuKsbh2kT2WUd0pa2LCaS8xMoaVoMR+Yj3dhEBLDz?=
 =?us-ascii?Q?X/0gIq/lsBJANiH2YlLQ1hIMIQjN6yJPFYBfLNFxLD8MAWVKrPbTLsom9e2S?=
 =?us-ascii?Q?usi5nx+D4WmvUos2LEDhaOkJ1AZr92m2WGHHwJcrvlz/9a664Zq7xTO2Tnij?=
 =?us-ascii?Q?fh9S/uk7QJsr4t8nUS7h1SITwF5T5sDcOxH9EYocqbSTHxyl6o6zWPTd25E8?=
 =?us-ascii?Q?KbuR0Dgsjepq/K2QQf+uMWOrEAkJXPBeUDO7yGyjQIg5JxPWy2jtgzSbx+Ox?=
 =?us-ascii?Q?j+6Rjd+RS9tZhRv7pBHvIpOD0bUBu6BrFaLJj/oo9ViLJUXStCRQ09osxorN?=
 =?us-ascii?Q?kWOkCorxhV8zGIVpjJ5cTlaDBzGUE/qUXIZZyCS0YOR2JrEJ+RjMQMklhj+x?=
 =?us-ascii?Q?D/xRzfBAxi+W6Nx9pg/ty2VyQjgLLiDWoF2YVGYuOdcw6aEfH4zZHd67Ylpa?=
 =?us-ascii?Q?9/U3qLAvTn/dCiWriYGHbz7ZE7WoLGKszaILvgJIBxagZFfqgmVnBheUy3ha?=
 =?us-ascii?Q?tzxWhupXIN9sScrxBw0/k8hvk0/Jg2KmXhGeU2bUhojnHldwY43CaGgr4V83?=
 =?us-ascii?Q?ag97R0LjjFcTdqvwd2LG4ipBq8xY7bSShNwooe7maAivzRGcetBx2dCz/52s?=
 =?us-ascii?Q?03Qf0WZKqnwkQS+2YoiZSjPND5u5d6UI7RxgXow1pHgo9jEtsQAc77EPni2F?=
 =?us-ascii?Q?zfW7vW3QS9ozTQChyZvEOrfKWiIb7ztrhcxDlTQnNBR13ir75RyJ+TTpl9Sk?=
 =?us-ascii?Q?NZ85YEESXIbPdCmAXBT+CkadfJDdhiCfxiMPfQViT5MZy0d3zvoEHwWPjEuO?=
 =?us-ascii?Q?7DY2cwULYTVrSXxjR46DeO+3nqGO9X72DbHolD6t8T8B5wkk1F3jrGNL5nan?=
 =?us-ascii?Q?G66WbpEOUA0sqpoLtrfJriQ1hWC+BbJzbM8eusQC6uuIdET+7Fo4aA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bGS/Re0SFx3xOlQaWW+AierLmtHE/vTiMa4CK21OHpL4CtVPmtMcdBF1RFca?=
 =?us-ascii?Q?fxGi2ePT5UN1goUETrssbw6+5FA29KND86IOOV6lx6E5oqcs9Jv0A+ogALuG?=
 =?us-ascii?Q?Q6cHJbtYPPfS17zQAjXfK2dnuQlTS5E3JdsD4tPkz0w4JcaT7sEZV+KKr/Ad?=
 =?us-ascii?Q?OfZHfqFQf3XZ8vtTuTz5bgXzAqTIh9Wi81uEdlz8aYubUx41RiZe4uTf6jSq?=
 =?us-ascii?Q?uj5H9nABIQ9XrNp9DdkhcMJx/WKD0TM8MINCyv+iegFVFEQhmzoSsjFlC2op?=
 =?us-ascii?Q?t4uojiea3bR962O0hGZA/VqKbBN/mKA5dDIcgHF0/Xl5T6W39x1Ik4TGUY/T?=
 =?us-ascii?Q?DdIedlqIh5QXqVztPIssGZ6ybQlOKkNnJzk/CDdtPIIVgy+s4UJemALBLZCu?=
 =?us-ascii?Q?148XqWER1EKP/x0WdRFn2uq8U+O7tB9Z847IQ5r2cHiHyF64hQel6v/zqmOw?=
 =?us-ascii?Q?dzA05AUM7sgLK/OXABVMZ/Xnz9s/ku6ZnknSg1R5qawSykLF17pQpvXxYzvR?=
 =?us-ascii?Q?OnIQYSXNEf+Y2DJC5nqkOx3+2L3oZR1rkNgvX7zoyoHDS6wbsAtHViCIuChd?=
 =?us-ascii?Q?prB3djccih59hijSQ3gY5h23Eh4J1ATZwXQfLqnFaZdjlDe/WsrMEuhtj9L6?=
 =?us-ascii?Q?cR9YL4Of58cu/jitbRwGelf3qUHLUfO7zHrGxjNWjtfF+GN9jxv07at5qLMv?=
 =?us-ascii?Q?VnTkVPzTSpvqkKALxiHDPbqiMPgxYByHn8NJpEY9OLxaIQKddBW0h4aQWfvX?=
 =?us-ascii?Q?g77tmRAwCAU0fLH0tLyCgQbuHQzQDpkrctdQ42GADaHcS6CZe88IxjMOywZh?=
 =?us-ascii?Q?C+ekaqflnzTt+aIwFHYRM+YMN0grI0XGPagJ5bXa3TPWJuvd0zF5x5rlLakJ?=
 =?us-ascii?Q?ov23O4Na2tVXeEEucvxqnUdgI0y5CsGnpp9ZN8QTtlIiRfRshemG0s8WRyUG?=
 =?us-ascii?Q?H/ni8GwuATGIlOd6vC5jbhEhR/QhK7aVcov3Hu3Bjrtnp5p9b20/FGOhFPv2?=
 =?us-ascii?Q?k5vzO4E/cgv9OCDpcViP4GcRVssVBMZhfHnvoYQ8e3Qajeypf70fXDpE/pU6?=
 =?us-ascii?Q?1Kiymd+/jTkpwYVMJzE1Elg01K0XH3JvaYJ006XETW1yJfrduLJe8B+Ru6z5?=
 =?us-ascii?Q?vSpJ2wlSjKt2zHOpMCA1JLb7SOWm+/XUG6T8liEcZ3VgBPDbpp3W0wx1uRo6?=
 =?us-ascii?Q?8k8vSfFBB3R57gPq23277O2rfcKy/UYVnE4FAdmQ949XyDBSffZ8INsvfjuz?=
 =?us-ascii?Q?cY2yWQbAz8UZZFASVgEtvdZQw0AKNSgtGcMMurlIs08R/dxUpZ1pNDBN8I4d?=
 =?us-ascii?Q?OLMbV2rqCzVLqruGxL1jzRo76hsPeNO/W7GbzOSScyBCdxmlQd6c9bvknm7Z?=
 =?us-ascii?Q?ap6l9aP6igoQmO/po7ME8a7QLMMyhFnf6Zpi/7sw9BKuFadnnr41L2ivPNC1?=
 =?us-ascii?Q?L51mlo3M2uA/9IAHcPc4ep8PE02aNbcsiHHXA/RpIBoqujJG5uHL1PLUOYPs?=
 =?us-ascii?Q?ixtsBt9mTObiwOiGJ65PVrRCdWnuSRfvcC6aIJwbp5E9LTGjH5CD/eWqKtNp?=
 =?us-ascii?Q?ol+v+0BYwUhsWV8cr+i1NLclLNKRFENtlPOcg0im?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cc43b1-5ad3-4f77-9fb5-08ddf78dc9e6
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 15:04:10.7688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62tNBOLDYqw0zmj3w5P/jKlNS9X2UZw+iazClRIm3VGTB8/jGvfr6dTxlmaYu3rVAQqkM2I/ZXll0Y5QcYQUSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7743
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

On Fri, Jul 04, 2025 at 05:03:52PM +0800, Liu Ying wrote:
> CRTC(s) could still be running after the DRM device is unplugged by
> calling drm_dev_unplug(), because the CRTC disablement logic is
> protected and bypassed by the drm_dev_enter()/drm_dev_exit() pair.
> Hence, Pixel Engine's AXI clock use count(managed by Pixel Engine
> driver's runtime PM) and pixel clock use count could be inbalanced
> after removing and re-installing the driver module.  To fix this,
> add a helper dc_crtc_disable_at_boot() and call it to properly
> disable all CRTCs before advertising DRM device to user-space by
> calling drm_dev_register().
>
> Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/imx/dc/dc-crtc.c | 50 ++++++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/imx/dc/dc-drv.c  |  5 ++++
>  drivers/gpu/drm/imx/dc/dc-drv.h  |  3 +++
>  3 files changed, 53 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
> index 31d3a982deaf7a0390937285c9d5d00100323181..45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7 100644
> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
> @@ -293,6 +293,16 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	dc_crtc_queue_state_event(new_crtc_state);
>  }
>
> +static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
> +{
> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> +
> +	enable_irq(dc_crtc->irq_dec_seqcomplete);
> +	dc_fg_disable(dc_crtc->fg);
> +	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
> +	disable_irq(dc_crtc->irq_dec_seqcomplete);
> +}
> +
>  static void
>  dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  {
> @@ -305,11 +315,7 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	if (!drm_dev_enter(crtc->dev, &idx))
>  		goto out;
>
> -	enable_irq(dc_crtc->irq_dec_seqcomplete);
> -	dc_fg_disable(dc_crtc->fg);
> -	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
> -	disable_irq(dc_crtc->irq_dec_seqcomplete);
> -
> +	__dc_crtc_disable_fg(crtc);
>  	dc_fg_disable_clock(dc_crtc->fg);
>
>  	/* request pixel engine power-off as plane is off too */
> @@ -337,6 +343,40 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>  	spin_unlock_irq(&crtc->dev->event_lock);
>  }
>
> +void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
> +{
> +	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
> +	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
> +	if (ret < 0) {
> +		dc_crtc_err(crtc, "failed to get DC display engine RPM: %d\n",
> +			    ret);
> +		return;
> +	}
> +
> +	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
> +		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
> +		goto out;
> +	}
> +
> +	dc_crtc_dbg(crtc, "disabling at boot\n");
> +	__dc_crtc_disable_fg(crtc);
> +	dc_fg_disable_clock(dc_crtc->fg);
> +
> +	if (!dc_drm->pe_clk_axi_disabled) {
> +		clk_disable_unprepare(dc_drm->pe->clk_axi);
> +		dc_drm->pe_clk_axi_disabled = true;
> +	}

look like dc_crtc_disable_at_boot() call by dc_drm_bind(), does it call
twice without call unbind()? Most like other place paired function have
not correct.

Frank

> +
> +out:
> +	ret = pm_runtime_put(dc_crtc->de->dev);
> +	if (ret < 0)
> +		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
> +			    ret);
> +}
> +
>  static bool dc_crtc_get_scanout_position(struct drm_crtc *crtc,
>  					 bool in_vblank_irq,
>  					 int *vpos, int *hpos,
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
> index 04f021d2d6cfc93972aa8d9073be24d347152602..f93766b6bfbfae8510db05278d104820ca0719c4 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.c
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.c
> @@ -17,6 +17,7 @@
>
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_fourcc.h>
> @@ -96,6 +97,7 @@ static int dc_drm_bind(struct device *dev)
>  	struct dc_priv *priv = dev_get_drvdata(dev);
>  	struct dc_drm_device *dc_drm;
>  	struct drm_device *drm;
> +	struct drm_crtc *crtc;
>  	int ret;
>
>  	dc_drm = devm_drm_dev_alloc(dev, &dc_drm_driver, struct dc_drm_device,
> @@ -118,6 +120,9 @@ static int dc_drm_bind(struct device *dev)
>  	if (ret)
>  		return ret;
>
> +	drm_for_each_crtc(crtc, drm)
> +		dc_crtc_disable_at_boot(crtc);
> +
>  	ret = drm_dev_register(drm, 0);
>  	if (ret) {
>  		dev_err(dev, "failed to register drm device: %d\n", ret);
> diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
> index eb61b8c7626933adc7688f046139e2167665dad1..68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7 100644
> --- a/drivers/gpu/drm/imx/dc/dc-drv.h
> +++ b/drivers/gpu/drm/imx/dc/dc-drv.h
> @@ -50,6 +50,8 @@ struct dc_drm_device {
>  	struct dc_pe *pe;
>  	/** @tc: tcon list */
>  	struct dc_tc *tc[DC_DISPLAYS];
> +	/** @pe_clk_axi_disabled: disablement flag at boot */
> +	bool pe_clk_axi_disabled;
>  };
>
>  struct dc_subdev_info {
> @@ -96,6 +98,7 @@ static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
>  	return -EINVAL;
>  }
>
> +void dc_crtc_disable_at_boot(struct drm_crtc *crtc);
>  void dc_de_post_bind(struct dc_drm_device *dc_drm);
>  void dc_pe_post_bind(struct dc_drm_device *dc_drm);
>
>
> --
> 2.34.1
>
