Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770F4B9755A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 21:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F9E10E18B;
	Tue, 23 Sep 2025 19:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="AlM/ci9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011068.outbound.protection.outlook.com
 [40.107.130.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F03C10E05A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 19:26:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjV0BYrxszzMlK0X4XHKxsA1yff17WEuGvORABAFbBkDzl/512XWtzleQEBO/rZGhK0FxcGox3HOCBgl1qMhag1VQ8/lQazvyyPx2MuPx5d1mjGmPSC/PKx7Cd/65dlm7q6zSjBJNAMahxcV+D9umOCiEUtqT/I2xd66uyOkMmmXL3NIs+JdiWlHdynb50d/IugjyjtNXIcti8u7HNikEig9jSCb6P1nf8lXnidfNq9hbggqy32hAmadjhggkhmqTfhW4mKXkWnQ+RPKEX4q+7rfoNwAYUYapKIcwbOkfFi+OFZ6IwNB05n2/2Im0GFpPZxVInT3M8LyBsVuNUtnxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Mxa4OMJjTCCVRoisPxv/hSmAdFQ+SSJzKMYEVxZ0Fs=;
 b=Mciai87Ql6IgET+0BArUt1lxYSip9xqRhmoRKGPTDUtpkh9TFTO5nLfl6n1DvQdguhpY9283PZqUMLvf0bOEYRDBw1YfubD3d6G5uJWsQpqR1IdmrOvaOffFUrmILuiozyyKDs0Z5a3lODnm793djnw4i9b3maRdf0W08ODbORawMuJSi7Hq5y+LCI3H8+nM/cPnVYPtl5q2XdjFuKlNAUeL+JZdVp3UGPZo8CXk4UaltkGhXiS3EAhwCsON7K4N5eS2v+zwtW3m6ms7LrdqscgUdHKEI5IqXS6ixpn4oxazJQyq4xnYNrrvm+XXTo0iw6WyMf6krLK/A40E4+hB6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Mxa4OMJjTCCVRoisPxv/hSmAdFQ+SSJzKMYEVxZ0Fs=;
 b=AlM/ci9q6XilSrrzlogVwpuBxnjaEHjbgIV1aY8zlyrkwiSifkyaADMwUdbDPaHS5TczO5nv/rgtgA7y5Z9KCNULvMfbNkeiwwEOoicLtppiCuXDSiiXnFclpTnBOwY5xV70eJDzN670Lr3QIJW4QtXXta1SzcHKzihjCdKTIQNrSwdHXZSg48791QpPD73RWhgO8CtLRNSN8y7VO5d42PMRg/mbYWODKYp+VU/I90itmLOz7JGHc7wXMJQsS+0esIxke213NrzAyt5g57t2VRbJmNRq8HYPL+7vXJeti/LOMSUQoVmAbYoqZD2UiPfKkCYKKOcM+/AZlMbwNV5/eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PAXPR04MB8491.eurprd04.prod.outlook.com (2603:10a6:102:1df::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 19:26:18 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 19:26:18 +0000
Date: Tue, 23 Sep 2025 15:26:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Johan Hovold <johan@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/imx/tve: fix probe device leak
Message-ID: <aNL0UgyGgCmoVEeM@lizhi-Precision-Tower-5810>
References: <20250923151346.17512-1-johan@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923151346.17512-1-johan@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:a03:331::21) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PAXPR04MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: d8046d98-2383-4a2d-14b8-08ddfad7121c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|7416014|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zicaz9q1tfZmMchXB5IkP+IF+fGHKH3mIXg/rq/qedZxQoJrnT1ObAnKdcz5?=
 =?us-ascii?Q?+3FQZjab2JFQSe9RUYq/C2BJTEC437xVYxAjjU9kps0CQ22VNMDf3gqzowfX?=
 =?us-ascii?Q?tKFqe/dqtCVplGJ1tgvLRiv/GeJQMeUA5cb+EIx2bC8FrkKlIqQeFoFCg2ok?=
 =?us-ascii?Q?20gJFb3uuGHatpsem/QcPDRsLOz+Qv4rFrNZXZm8Xxm2VBpiuhdIOMw1LLCx?=
 =?us-ascii?Q?C9X0X7q4kdQKbIZz+rVgYZ1ofmI9Hsx+Sv2vo7rolxSu3iJeLhRl3wIos8bh?=
 =?us-ascii?Q?4ZtNm0ovlGMfFHcaWIwiMWp8kjrqMTXBWm67xwE1KpUxEDaysub74Gnkw2vk?=
 =?us-ascii?Q?VzODq4i6qQzi7tfKo3DOqN3ansMqR9TyFE+cR3wRAnvYuyZptpEhp5/GzPGo?=
 =?us-ascii?Q?dvnbsU5W/4ZPzYGYhNb0LMK2j4j4mSm710czQbftaGJCBet2xqvk4LHA7QlS?=
 =?us-ascii?Q?JRtgkbOUuvsr2BbKoJ5Gv3ztkdutXiyx1beemLNZe1XiH3HVR9gyqFshjsNW?=
 =?us-ascii?Q?y5VwOck3OvBpzupMhbrVplioHE5njDQbpghA3ZPJcEHOHUruUWQpbiufwl1F?=
 =?us-ascii?Q?9vAYVPYkoxMD0trrDnkkojppJx6ZAxMpGbHlTjE5o7gDEjm2ZdfmoG2KL3LP?=
 =?us-ascii?Q?OTrXv4mLGqtneuCzZpRhTJuji3SF8sw0OhJ+RW6dsVSB2kBxHyuz7MDT/FfZ?=
 =?us-ascii?Q?5Hh7KbEUaDzzDsq01a7Z/SDeh3GXY7S/eEyKeVoEOLx7jb9W6s+nKGlcqSco?=
 =?us-ascii?Q?MTP+ppwm+moPD0z6XJJL/5Ifd7furA5wyFXuQcbS8eOIE8gwYQ5X7coWdvd/?=
 =?us-ascii?Q?R/4+m2QoHHfHS7kmkB6hxlMM3HGXX51G2BGV1XYqqU4tdP5Y5oxjfh+CrQlo?=
 =?us-ascii?Q?aU1dcQLeXBWIaxXlXFb25nsKXV/acMKzpRtpNDLXuR+MzAfMZHPLOBtLA6x3?=
 =?us-ascii?Q?U4Os9dugGQUnfyFd4WAyetPT/+9sppvP0NmhdgLDcHmk/0sal3QZ2NGUcmpT?=
 =?us-ascii?Q?X/4buVwcQMatAKAcKh9fEOXsvD6jBt1YyXOqeyboMAHhUaeqkJavMZIlYNqF?=
 =?us-ascii?Q?dbaNzOWxN3HGfUfuDHhlLdlT3Sn4P3ClgLdvAT0JYBwntStcafIOwI3/QeX8?=
 =?us-ascii?Q?zvBfiSIZ0pgNmaryM9tBjZ2WrrhiNL2rtRTcQoL4J5JNAT+/PbmAToj4+Ymq?=
 =?us-ascii?Q?4nFekG5BQsJqOWKPgAZ3aMbmFIa36ghjXqBytyGFHItnhedEWZg+yimheoUw?=
 =?us-ascii?Q?r0QcIbGlo2jcY3Q0obcMdy5WUHGyu/sEIsF7qJzljyIf3oKJvS+b7tTQD45f?=
 =?us-ascii?Q?FC5jJlYIfdwcTVUyBPXoz480s2WwDrGvNgCHd4PlCxc4mm8KgT1GEOV6joZ/?=
 =?us-ascii?Q?Eo2l5dRb+KsG1Nk68ld0xR4s+Z2dtwxr4a5/df0y+sjhZB9cnZi8IRfdppQ7?=
 =?us-ascii?Q?iJ9FldfI2XrP/Gq+eaKD4P7/GvQ7wP00NfhdaGaltOtBnA9ZVNj2Rw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(376014)(366016)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7BZYb9vOHasDPIGCNTNZlCVME1fsBMcrQPyC9hY2GBiapyJrOyXTEvBIEmFB?=
 =?us-ascii?Q?I8YR2LXCMLrfSbDK43ccwXuWjUqR6W7SjoaozwnoleW+DJFMeb9fL6iAVAuF?=
 =?us-ascii?Q?UB4yWSFmR/GYGfDSqfqLLr3X2pNb+S1YOAh/jeWatq3ORrM/dqTQb7TrDbW9?=
 =?us-ascii?Q?ymgNUvokcpk2GGbHhtol1HH64j8gLnM/SimNIneCgL/6vesZNzBF38I6QAC3?=
 =?us-ascii?Q?aBwS8DMeXTvPaOwhvHnU57Cg0fzzBzA4SvZ7KpSMar3VRq63RaelDChzCsoj?=
 =?us-ascii?Q?e9g401u1dw5aSUeo98mFXOUc0red+kXFMDNvqCovEpYexDFxHGwfjE53/3OP?=
 =?us-ascii?Q?gm3Ombc1dgS4e1AAFgq5P9SirIIzDbrrrF7eER2fJbxSJhUpstuzK5kfGc96?=
 =?us-ascii?Q?Es0RBBWWO3i2/ABYAXODBNWHsotDcUEJIhFT4WbryBtsn9AdVP5jEktTNGp2?=
 =?us-ascii?Q?GvwC+ENw3Sj+KmgrMIBAHEc2OdHc1ekEUMHE5RNBA9GSSun7N5FPeYUVj9w1?=
 =?us-ascii?Q?bRN0RQc8pG9G+M9BFnI/7YBJ7BfKnbWh7F9hofVyq5zbojVphSHwn6TXTckR?=
 =?us-ascii?Q?NqIR+STY2U07ohvUmcqmrKS/URnPOG3HkTVbdZFK3af+MCnVmX9bwQ2cMzQ7?=
 =?us-ascii?Q?ZJ3gEdm82r83tNr5gCX5ekuYG++jdfBIb9oS0rWpfDwt8sXotvwzVRRRMN+R?=
 =?us-ascii?Q?S2tN2fQuYcm5mdz8NFGp0IS0Kqf9rfhpQxlJAjdpBxmRdlekeXFQ8qz8l8wT?=
 =?us-ascii?Q?lU+bjWYxJnJ+PsjjXZczF7896gfJPCO6n4KT6Es+NoZbI/WUfzkD/mKAcSGK?=
 =?us-ascii?Q?JDtVnUs9Pu4/3CHiIN0XvoPHxuw3sXYoVERgpN5oivjN3an6w4qKVMr1jedB?=
 =?us-ascii?Q?aYpLeDcisd0Z+5a9Ec9L090jbFXT0hRrHj1GIzcURU/HeKy+SPYDD0sqSmWz?=
 =?us-ascii?Q?tA4CxAKrvX8pcwVJNKchYbtkI/EbjcBwctxrpgjD+Rluu+ffW/1K0lO8MDzX?=
 =?us-ascii?Q?98TklvXD9hS4ujVHo8E0FvBc5q4B0e6jfaNcZsgFuGWbJz/uY9s331rRsp9M?=
 =?us-ascii?Q?bjVv4v8WoXr7DcNcXIXhTQVIijnKdWReukrYJEvXGhxlEEu8gLxTNrQSY16A?=
 =?us-ascii?Q?8melg7MAJab7TmHuQ59/GX9uBJ0NBDm2J3jLRCapmNrE2PyhQvzZnovChn35?=
 =?us-ascii?Q?/4YMRSbNOWqRA53ExZ7DXgz+hsYUhW+r/niJJ4fCpI/Pinu+o6ox6QqAVTy/?=
 =?us-ascii?Q?b6thpyHIeva2yq02w2jhUlQi0kHDGDN2ic4VU7hG9vupKFAcCFY329FP3wZ4?=
 =?us-ascii?Q?z6lPXpoVCK16Nkjeg0DQB0cQpNh4+liCX/Vi8ihmXlH9Z22rRLhw+SzsqA8m?=
 =?us-ascii?Q?dypH11bVBcAtlmlYaBPM73iMB4TvcMl017rlzyiv2QlD0aD6K3umnomj7wPx?=
 =?us-ascii?Q?CRcuUhEywEh/mbE0Bat7B627CnC24ImMO6+bjQbKC5gZsEiAD9fSrSJ6P1ts?=
 =?us-ascii?Q?GlIN3d7qBL8Od9lQ/2RW5lucPK2Cu9N3Z7IuV5ZLuPPDa/Op+1mmiroH23Y5?=
 =?us-ascii?Q?armnM+VAAwYsOXo+I9YqiY2TVq0GYNBkSad+hKnw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8046d98-2383-4a2d-14b8-08ddfad7121c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 19:26:18.7276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjtNJ3EQwsXqSbw6Ligf0o1OKaoNKe88bCP7f4BsHmGUCwOuLfG6iA2srDzi1ecQaIM1Y3+KThbEYQxbhJxpOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8491
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

On Tue, Sep 23, 2025 at 05:13:46PM +0200, Johan Hovold wrote:
> Make sure to drop the reference taken to the DDC device during probe on
> probe failure (e.g. probe deferral) and on driver unbind.
>
> Fixes: fcbc51e54d2a ("staging: drm/imx: Add support for Television Encoder (TVEv2)")
> Cc: stable@vger.kernel.org	# 3.10
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/gpu/drm/imx/ipuv3/imx-tve.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> index c5629e155d25..895413d26113 100644
> --- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> +++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
> @@ -525,6 +525,13 @@ static const struct component_ops imx_tve_ops = {
>  	.bind	= imx_tve_bind,
>  };
>
> +static void imx_tve_put_device(void *_dev)
> +{
> +	struct device *dev = _dev;
> +
> +	put_device(dev);
> +}
> +
>  static int imx_tve_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -546,6 +553,11 @@ static int imx_tve_probe(struct platform_device *pdev)
>  	if (ddc_node) {
>  		tve->ddc = of_find_i2c_adapter_by_node(ddc_node);
>  		of_node_put(ddc_node);
> +
> +		ret = devm_add_action_or_reset(dev, imx_tve_put_device,
> +					       &tve->ddc->dev);
> +		if (ret)
> +			return ret;
>  	}
>
>  	tve->mode = of_get_tve_mode(np);
> --
> 2.49.1
>
