Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541FAB8A449
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24A210EA3F;
	Fri, 19 Sep 2025 15:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="J1xHFiuv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D0510EA3F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:25:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6YoABOr8HqXSnboLlKR+AvXpy8KtA3w8WHps4zb8Yf/09mPcPGLJ//RtYqOKGn+J987b5aMlw4W+VWZ94nfsRUUZ6qPOwUrx2l/kOEL+aBGPtqoeuRWay5FcsfKzFefQ9eUHkCYx1l2WpfAYMUtCecAAT15UgAiJZIfRey7hVIUye+tLy9XxsSU9deZhquDFTO9GQxEkqp3d8ARgJxbQPFNqBW9ATXMsj1/TkSdr00Qz431LdRswmdeSOm8XS2YH1aMH7SP/eA0LnIJcNpZ60IEFONWDkYQbqjdRSWvU7Jq0FoaEJS847Foqz5geEd2fzYNtQpoGAxEvId+SznDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12MDBWYP5RzGA0C720lNDe4CjTlJOqeATF8h81bFfXQ=;
 b=I8TICSRVcS2pBjDdeS57zprFpIqMdnS5QRaqsUnJ//hyXqirwBfjbQ+K0NCSaeJYTXjmo2b9fdA1sHpw6RWoi4n0BfdaQj8am2+pIEY61ncazlESivnHDVWUBIJAq16bSaRvVP22bG5h472juybnqAORVDieteqWw1YZlDUIl7h7CPlkgTsVeEu8/HyPDgdgMRFEeHZVW0HpB7xy2EvXLzozn6fS/3Qcq0XmkhnCNV6niN7LGWImwL0tgbNjvAv2kIBinm1CDo2EtEVSU7fI/O3NAEXllL8o0zGhmt4z2bPtPJkMXxAPojwnilni9uzHG3ZKvEo5GhFlBufSujwQ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12MDBWYP5RzGA0C720lNDe4CjTlJOqeATF8h81bFfXQ=;
 b=J1xHFiuvgT+qP8ZNkFgad/LrTkufYPp/xnepF77pBhBHzTHl4/JlmmkGjbSmTAeDjtgH4yWHE/pQf/1WYKLWUEPzDNdnfXH5dczvxBLe8p8pMAZwIx+qI+R3qQya2E+lSEtebFth0kKnyctgTchZbLdjbgPJ+typzu5Zp5/QIaIj3HSbbNY6gNdoP+LZxDIm6NOEgRp6VMYRMPq+tKnv5xA3WexRMvwavsCTifY+cpp8THklTZEHwsp26/UWCr5cNvSxcFY+8txMG9ClP/fZZBVNBdErbkvoG+HK5Km548UCU9j1iVwcZxKEFKCPUuw0dtOgfEuiaZKrkq9sc+5gvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10098.eurprd04.prod.outlook.com (2603:10a6:102:45b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 15:25:23 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 15:25:22 +0000
Date: Fri, 19 Sep 2025 11:25:17 -0400
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
Subject: Re: [PATCH 09/14] drm/imx: dc-ed: Support getting source selection
Message-ID: <aM113cxd3sLwEyD1@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-9-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-9-784c03fd645f@nxp.com>
X-ClientProxiedBy: AM0PR03CA0047.eurprd03.prod.outlook.com (2603:10a6:208::24)
 To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10098:EE_
X-MS-Office365-Filtering-Correlation-Id: fca124c1-4f1f-41be-9050-08ddf790c02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ah1VN07di/6K9wisQqS6yJPZhssCDpsFn2lmWivRCf0CHOCkGB2e3XUaLBv8?=
 =?us-ascii?Q?k6mOtODaMdAhFkf5x52cdWAFEhsjhzew19ls61BNQmRhYpOfUTG7MWH0RhiT?=
 =?us-ascii?Q?wkh41NPrwIBDnkHL57CEL1Ut0+5hfDNJFwe8bo3+/R8PIx7htYnPVHGtU3ge?=
 =?us-ascii?Q?hpI/dJPOq15OtnhWfL0SgJdMFgJ0Sr0Kj6kvC5vtmgTnH4hPjJmBVwV1r2tM?=
 =?us-ascii?Q?W7EKDZSk3ZITHrsbwDYZG/I5OgOLSWFpPr0SHT6HosSXA2H+wOZ1bOLXCeQc?=
 =?us-ascii?Q?Bbey8bQyD/yIzEMphJy59ySCbedxcB9Op3yKuPS2zbvrmUIm+JkbkulM1qgq?=
 =?us-ascii?Q?SHlo/hsdfLD28cvjJkmFRI+kTeH45oNcD1gAbG7aK5I4SVlsiKUhZ2Tv+xC3?=
 =?us-ascii?Q?B1+LVhTu3jOSoSNxRgPIE5LcSfrcnzRQ4bIuQpsWnvO4sNnbc6Ngm205jwek?=
 =?us-ascii?Q?vTAwRanv8lmxU5OWZ85dXEF4cQm6iYsxsBXNu2jab666iB33wPzo2HkQS0Da?=
 =?us-ascii?Q?rOcAjjD9yyJHU08fW7BGbWv/1Xky/WqjnEgYG6/5eg/r0Xmw3te7DZh4DU6F?=
 =?us-ascii?Q?UkgSlqVsTEUchbf3OzcTUkXlRpc63Kzymb579fKC5amb9FUiar9j5OaBkFzB?=
 =?us-ascii?Q?IHk3QBlXbCF3TLBRwK4iw3sFwT8nRPrAr+5Skd7KLq4X/ivQRLtqm+RhwAnJ?=
 =?us-ascii?Q?i4QmbkX8LLN+YNByfd2E0K+Vyy4/g7SWC1Hrx/Uny7mpOgadsZnwtojCL5Mr?=
 =?us-ascii?Q?+xGfTKNrS/9YnVdJlnwMNREfvVmmEwOXcd316t/5X71E3BDlNXrc4stQm7p/?=
 =?us-ascii?Q?yJvYwWn/v12zM+KR73P7CRv6ez/fGoSVQMQjB70+SKTfvCZUS7GtoRJT8QMO?=
 =?us-ascii?Q?L4kzDVMFuWxrMFg2BUnYV0Q48zeev1AnS6SdkhJsVmhMAiED0VGgXxH5jVm7?=
 =?us-ascii?Q?XCqzQ1LOGt8anu1/OtI0dAsK4qOC/EUIYMEvB0hb0adyc9ygOjB5e2tw8rUL?=
 =?us-ascii?Q?gSVTP5SiSS33vi/KLLYnoqBqIh6XxoVS0ImyyFLe/LHHwUnzsKBqz+dRqizj?=
 =?us-ascii?Q?b1EwHLHliO1MaZ6zZlW+wxmwZqH2zxg4x0PxC81YPA2ne6bzjkATOjzx1okm?=
 =?us-ascii?Q?FBuKKOqAkGA+uAB8hlJunIHxmeZc8fkf3jP0EYbrusLJX0aLDeggb+1JmEQU?=
 =?us-ascii?Q?TUXjFFsuysD4y74C+N91WJ1IVB1pzs6QD7WTg1cZ0U5nAGRxy5sMxx1i8u4T?=
 =?us-ascii?Q?D51UgM1xFHa6O+xJWMXmEi9exj2sWS39Rqam21dPDh1lVbpKG42tWom53Ak3?=
 =?us-ascii?Q?4/JgWsGkAPnIqruiYJrxO1RE18K1F+wXsA2NcCCOJ1VTPlyAYVwxELrd91U0?=
 =?us-ascii?Q?k2KT6u7QDjVJsSiFWKz/6MQsQpQGi04KM0usDH9JxuWat1cRfFv6zST9LjsG?=
 =?us-ascii?Q?34HDP+jZ5+rRKsdiqfqP0ZuGqeBpv+fiZ+gUDDUooBIS4upbaW3Szw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X02dZ6iBniy4eyavpeTdeoHP7YOex91up6EkMDxKShoMuB6dUkp2d8xEtJUw?=
 =?us-ascii?Q?PBft9INpm6EKaQZ0D3Zvef5ZZwOoUJ+m5C/c+ALg7uQrj5IwaOMjSwSzjtNG?=
 =?us-ascii?Q?naGGkxIEWc3LpP1vKqc0Qk0LV2p9wXjAeD1biFbdPlQbgAsBRrIrokBBgSeY?=
 =?us-ascii?Q?KXmAepj1GFaQ7iOFBTRK91uySiJecBJs7UUJiuPAKtYTB+e0hX5BmBLA0VLw?=
 =?us-ascii?Q?jRvqD3ikwja54kw6iidLcOlWDREmKd0I4dhDOgRfMKa3Qnu2S+aYvbNA9zeA?=
 =?us-ascii?Q?1T3HjmUfQ2WOukU8qAnxlarKEjRwmoBNpNXaV01FAjOci3xYO72Ujii69nXa?=
 =?us-ascii?Q?uVsowxlSW+LV8o5VXaQzUtlLTNmGYwI0k9oDFZgtCWbGXxn/TaYNa84myfgC?=
 =?us-ascii?Q?HIR0r/22KtLObcVaigboILTA9uTnRA0R8bBWQcnouCWOmIXsVIiPVADikPKC?=
 =?us-ascii?Q?50ew2yApSLyl25pIJ7GzvXw4UMLMoC/BecTVUtYo81VIttSOjb975r/o85Cq?=
 =?us-ascii?Q?dHq2zv5gBWiEZYJDNLWKBtm/7Sl909WsxnBcsaXN66UYSkoBSNdA63+ClGNP?=
 =?us-ascii?Q?HIszxHwF+xDnC55lcTnxBHwbjtDHGz9/NdVY6mSVM4o3USDGh5zDMXZlihik?=
 =?us-ascii?Q?klZFdMX99N7tNG3A+T0Ub8bvLgBhSsUsRZe5BrRJjkL46lMDgEuTK0l7e7Pf?=
 =?us-ascii?Q?+jYHx5subX/P/TTMj2n1j6UBUp8j5mQvNauz/9wwAj6ZzSqOnjdQvF2WoTjE?=
 =?us-ascii?Q?tZXaSoLzdK5LcwBAJxeJkYZ71E/+HJbuWU01lvOBbZNyTKLntmcw9hwTJiIy?=
 =?us-ascii?Q?yhtg5nWhBqYMxLQuw85kjhlsnMCHHLjDwPSkK9tR+cOIrspSwxqUdUAIRli2?=
 =?us-ascii?Q?u4NixE/AD/0rjop59vZRQ2kPTSli+u30rhChhTgLevRJ1+HJqZYRS8XhRMhy?=
 =?us-ascii?Q?Jn7K8XIOBPGuEyiidC2O2tPMNx0M9839833fP2RPPaO7knkMg4wFRySch7Da?=
 =?us-ascii?Q?fvVxgU06WDtfRiKa+l+eIqS7miYPTM962BTr8olY7Jzud6eymdB6qAidlSSj?=
 =?us-ascii?Q?r4N/X6EqxGTSXegbau77y0pUpRqVk6nDkBcxwA2PmYHSAX/3U+oAQ6WIESaA?=
 =?us-ascii?Q?ZuZkQrFHFho6iXS9uNjzC9zRAzs4CY/W7oFwUYIc15E79kwA3cqf95pqx5SB?=
 =?us-ascii?Q?Mtq3um+xEpBgq148OgyeHWcVXdOzLPbXp1t+GKPbU4Tu55euIqlELR8DP1VR?=
 =?us-ascii?Q?7GufqkJ3hUb4ZAKos50S+EwjwVKgnJPyNNMvE1XTnvOw0EDYvXw6NIfMJhrS?=
 =?us-ascii?Q?OO8k+OzwOrZnG+E7jNmW6ZUk8qzCIPXlvFQEMKHbdXA5BMWfowjB5cfHojk5?=
 =?us-ascii?Q?Rpi0vqSoJsR3H26qtsrCvyxw9DuUYZ+CUWiRDwq0Zuy6mVjAW79IA/d3IUay?=
 =?us-ascii?Q?yb8/ohgpeBA35/XkwndpDV7FyZ91KHGBgLDCvUKphXUT/Ifk0EB4b+y0zL+8?=
 =?us-ascii?Q?jebbdukcXuvquCLbCWXy7pUyYOhe1ROfdnczDrudjTjkkNCb16pYs1VF+WQz?=
 =?us-ascii?Q?2hUmU+Wr/jGJnDjDAaBOmvdouJo0ayROYBgOXVKW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca124c1-4f1f-41be-9050-08ddf790c02a
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 15:25:22.8956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1+L9wfVWVSzoh9c45e4STcujPC0nlKoeTD+Vnp66s0KKzCYDrE7yNHXikgrHv/JgZNymlMpW1QHxOYIuLz1kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10098
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

On Fri, Jul 04, 2025 at 05:03:56PM +0800, Liu Ying wrote:
> Add a helper to get ExtDst source selection.  This is needed by
> disabling CRTC at boot in an upcoming commit which tries to get
> the source selection.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/gpu/drm/imx/dc/dc-ed.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-pe.h |  1 +
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
> index 86ecc22d0a554bf3eced218df0312b513e10e179..b514790bb765329295553f89d16ee1167ef411dd 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -150,6 +150,32 @@ void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
>  	}
>  }
>
> +int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src)
> +{
> +	u32 val;
> +
> +	regmap_read(ed->reg_pec, PIXENGCFG_DYNAMIC, &val);
> +
> +	switch (val) {
> +	case LINK_ID_NONE:
> +	case LINK_ID_CONSTFRAME0:
> +	case LINK_ID_CONSTFRAME4:
> +	case LINK_ID_CONSTFRAME1:
> +	case LINK_ID_CONSTFRAME5:
> +	case LINK_ID_FETCHWARP2:
> +	case LINK_ID_FETCHLAYER0:
> +	case LINK_ID_LAYERBLEND0:
> +	case LINK_ID_LAYERBLEND1:
> +	case LINK_ID_LAYERBLEND2:
> +	case LINK_ID_LAYERBLEND3:
> +		*src = val;
> +		dev_dbg(ed->dev, "get source selection: 0x%02x\n", val);
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  void dc_ed_pec_sync_trigger(struct dc_ed *ed)
>  {
>  	regmap_write(ed->reg_pec, PIXENGCFG_TRIGGER, SYNC_TRIGGER);
> diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
> index f5e01a6eb9e918516adfc89949665fdd2ff1e40e..0b81dc6b251c452e7ca72f1cd12af065bafaa198 100644
> --- a/drivers/gpu/drm/imx/dc/dc-pe.h
> +++ b/drivers/gpu/drm/imx/dc/dc-pe.h
> @@ -85,6 +85,7 @@ void dc_cf_init(struct dc_cf *cf);
>
>  /* External Destination Unit */
>  void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src);
> +int dc_ed_pec_src_sel_get(struct dc_ed *ed, enum dc_link_id *src);
>  void dc_ed_pec_sync_trigger(struct dc_ed *ed);
>  void dc_ed_init(struct dc_ed *ed);
>
>
> --
> 2.34.1
>
