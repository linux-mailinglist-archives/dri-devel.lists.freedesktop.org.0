Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81858B1E6DD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 12:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A7E10E249;
	Fri,  8 Aug 2025 10:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Se+cEQpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF94110E249
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 10:56:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUAhqNRt7dai8KBJ4kdHTDNl9OOEs16kWCvbgKdtslhsNQf9YUNjqduOOeuuHoPGdtodrkH06qQz3i3MaIY3Zy0cMA5Z7FGfJGn+mmXADCQNWItKSDs4/i3pXOVkP5dtscpJB7Ymq9t5Yxo+x5jHuQoIPeVFE3VEP2uhf4CqBiLu1tIBiI8H4U1PxO72DaZMZ871AxfQiHP6veyYHUMYsZkqp29R0nUaKlJlEFzm98qMF4ptgUvqgIa4r63K2e4mHI6hlIGKRucpaaXZagJFtdwYARzydYl+vb946MVTkSSbb8iWDUEYm0ZxyFulUUZq1Ui85Kfz5WLz/wA1t1P90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jqMW3+Umh+qYlUi72pC3P5ykcyfLImRUOvT5LcK9uQ=;
 b=QNImyk9EWeYBCjCKlRHLQevxsZTgaTIUQqhk7endf2ZmzsAMGhw951nxDmOB3Uhrf2lwYpfzKcWzszr1P5VzZNHqeYceZtz9eo52GZe60pc1rnggGcLE0q/Af2Z2Wn2N/4rcLn0KFC8pPIC3ZY3q/SLM7Cxtdj44NbwiQbWZPyEYLEwm+Uk8zVDpMa6NdzkAYL9hBYLsW6wBslb1XqFogCxUGSBsA8Tti6Oja26xn7WeGdxsp3Yk0or+1+GXcxlEmgtzW8kf+hUSt4lBanEAy9q3O78iFNxnqBx+GXVnyS83VngCUa3BCScaIC4s3+XMw51IPQ3DdObn2ijPe8qK3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jqMW3+Umh+qYlUi72pC3P5ykcyfLImRUOvT5LcK9uQ=;
 b=Se+cEQpajh0xCS/KQKD1QPM57g6cQPgTkrmoEn6pwAIdLWkajF1iJeZZQIOtojum2lgGjbrP8jENRkM/pfJa7KCSj4V1TTCAfCNT9TH/oMtpog+9DyeJrgbXwsAkKR2Dsx90egdo5qJJkpIrJv8Hxd4IKirtBFcTZFT9mnyX5rnQiKj75mEpqUNw8y/l2L5VGUIqFaPr11eEi5nAMYBUUiX3oOPAArKxFl41yzf7PNQhXbCbxe+iLUQzH26jPun9fhZ2KLXswXIs86LqE9bATvHLaAXD0Xr3uK+VsyFHyiNvOy6a8GxSAMsnEE8UWJDZBLG8q2QdDMBBVJ8ktvde6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by AM9PR04MB8601.eurprd04.prod.outlook.com (2603:10a6:20b:438::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 10:56:01 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 10:56:00 +0000
Date: Fri, 8 Aug 2025 13:55:56 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 "open list:NXP i.MX 8MQ DCSS DRIVER" <dri-devel@lists.freedesktop.org>, 
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/imx: Remove goto label that are only used once
Message-ID: <h7z2pwzyemgbjxopa5ql3g3cdulxohjltj5df6u67a5oqa2v5p@3xrp2rgl57xd>
References: <20250806123545.380325-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806123545.380325-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: AM0PR10CA0085.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::38) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|AM9PR04MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: cc07edad-899f-44ff-de4f-08ddd66a293b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qSjulfATQtRKCQOuDs2A3oXk/0ZOCNoZPQA4oUL3ra5v5fURBGkisDmsUW2x?=
 =?us-ascii?Q?G3Am0r5KYH0LFpcdTJR19GE1XmoamXUnUymffMacCMNBdAdss99avG4tdCYs?=
 =?us-ascii?Q?1VRVTGguOw+hdOC2TqbutlxYFehhdkM7i1FlINHAZ6LfNMavanf1TbCYcBCL?=
 =?us-ascii?Q?HvDny+e21Sd5paKiu+AyparibRzhpQRyYsOuUia/SeHbMcLj8XhZt/uufiwR?=
 =?us-ascii?Q?WhViIDB7OgXrzOFpRD+gO097zKzPmPNwzQCoscBWM5VgUHWNn0HDf0qKcCRH?=
 =?us-ascii?Q?561b2ElAKF//lBxOU8fHGJRcmrbmAvplev5r/v72gMD8fai44d8ACkoOhIj5?=
 =?us-ascii?Q?JR955cuW6NxVXZbA0A2ysaPnTk5hmRPMbgE5Q8QPAP98OwCWAAMZ5sZGk4D+?=
 =?us-ascii?Q?u4byZIKmS5oSGowyJ9uBqXcI8UqDWS56MS6O8050IvuYY4kpJ6H7FTMMBlzG?=
 =?us-ascii?Q?xjkrXlXJW7hwYlnCG1VFQHK3cuvhd2mNQohpds0Dsi9jsDNTavp1b4nPY4qp?=
 =?us-ascii?Q?CIz1nApgh0dihQfbJqj0tPNxqG/EBF1vX5d10Wb5012RjWFQYbn2hdQSAlvR?=
 =?us-ascii?Q?w1oPAolVDfBJapuMdF/cqKhwVE6oXhGQ+WWLsc7GHJ61mFxBSJpsGiwEwb0T?=
 =?us-ascii?Q?DyF4q9SycAsJEDdSlG1mt0Ny9+xalcg9NuG0hEPyr+PsA/l2dAxDbr8NyXXl?=
 =?us-ascii?Q?vcsTGyXkZJArhrJCoHMsm2T8dXnzVmusmUWgkuAD3JEpgwqBxVfwGPEGwMY3?=
 =?us-ascii?Q?vYD2yakM/3EeQzhowqUg7ofk+0JAGaJvZ+OePNHpnDluYaeRehK11JentCFr?=
 =?us-ascii?Q?hOOcfWB2KBp/YlZ9+J5gYXiO7b5cbpdMnSyW2oWrre7WtF0guXDXZ1gesTDd?=
 =?us-ascii?Q?eahJC8Q+LVeqY4zx0AsQQaX2kHXyyaa7JMfrwvRy/zMalrnRf+Ha6ZhcU255?=
 =?us-ascii?Q?I8O14G8M+FwVX54+qrD9YF0JbW+IYxq25KMValABBLmDoLAs0nFcLGBsgfjo?=
 =?us-ascii?Q?Bxa3/gZvhFsN7HzIB3YBO0bCeOhuwLWJO5wrwSiJ1uU+t9LjL7+jWSnITbE6?=
 =?us-ascii?Q?nGY27nJuQ4hFNJLXlOB7xGcALXBQS3xmOSFQPqTxno72j1IkFrlzp6DsgMWl?=
 =?us-ascii?Q?Hq9e8wkBp+cb27zaQHPKZm2uhjdrdOZP25XS7grgfDWEkgpgbToLUTnNdl67?=
 =?us-ascii?Q?PL7w72to7qfB+z5vCHAGHy/kA97ryeff62Tc2D3KR7K1QpwLzFTZ9Tgmpi67?=
 =?us-ascii?Q?jJziyQ5VIS0XGMbaN1K9cFgidgEtNL4UCBqWtZW949Zf4AkVRzOrEwF3+nri?=
 =?us-ascii?Q?WjkwFTMHoIGMx4GOMxv5KEHPLSp0QZhUb8AwwPiTI1nJ/j2gg4W9z1jMn3oF?=
 =?us-ascii?Q?I2VOPpIma/3ObJXfzCe75nTrVEuR8S3olYLJdmGjW6KC5gSJyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vtz9Q+R6CrvL7vlxi4Sj2/VlivnK2qqqy40cVFCOHmRg5SjQ+aZMOf1nCiVO?=
 =?us-ascii?Q?I5v59vkwodmI3zEsf7FgEE7WSBJKmsJnQmZghtzgG7Typxu6sECK4PHlEzgu?=
 =?us-ascii?Q?Nzjb4cSXkqQUFtIN2pF2XvrOHMZ7wy/PbOJYasRoD0ayrUdJNf1/NNtWbEcA?=
 =?us-ascii?Q?38pBAiQBoIUiDhl9pNcxVVN4xX/l7fJfcrNBU21YuU+0s8EU8T6pPCk8LqcX?=
 =?us-ascii?Q?EUd9bSrIY3B7/Hv1RZQRF9BQYiSZWVysOR/DAestH9UXwwgh8h8ncTQyK61k?=
 =?us-ascii?Q?PFwFDKvGTH2LqLQ7hf6q5TXNU8WmgrYILCjA+vA7YTy4oJySZCHS2o5W8/3V?=
 =?us-ascii?Q?cEJKAK6cKeAba39o5hCLC2SngEPwHX8ZtmEKHPhsyMf146/fJQLmNEFoDb/H?=
 =?us-ascii?Q?NxwpSLUbgjZrLc0n9IJywTuz77GdJx1unVVhK6NoxXsAPKGrClRE0qYjOAKi?=
 =?us-ascii?Q?frnEGKheINkmdlrP41Y4HsT8mE4kYOvBzg20MQbpHJw8U03ubeU3NUnbfE31?=
 =?us-ascii?Q?HIrVgKyi5Ekte8o1aJ0vdmmfknxpJ3Hn5hVAO/hMWobL7tFnFB9y1eqwFhQA?=
 =?us-ascii?Q?ryOTggHrd0F9iX4BaExfZPZBL/r9axUdlqSklu1+QwDBanYS05cYQHmVa8gz?=
 =?us-ascii?Q?G315TG9NvyST6nJE37Jj19Ymt1lJMCIDrMB+vWwfRxc0uidAyIz0bZcsUwxA?=
 =?us-ascii?Q?hxzGK/qLmvEoIktC3BQvRWDhsMldQy9BZA2YxQteA37xBZOFvf22uhWBaAvU?=
 =?us-ascii?Q?p1jkrJUU0kfwHAhQiITG4yRvQSJjzArLuubR0PpUI4y3gnDisOp//iKH5cPc?=
 =?us-ascii?Q?JdB1mvAyf6gu1LqRXrQ4n01iZYoA7nB7jUHCpm+n6YTTbTsCSBsLvmk+V9UR?=
 =?us-ascii?Q?RYFdn2gj/0dFzV0Rn9UwPO0npPclalzhJyLEhvfdyD4FTNQ6Rcg73rnuuHU6?=
 =?us-ascii?Q?kJ1wIVbt/IttIPCw9Ea1QTGFRyrh2VO9A1He/NnnkX9hICklsMr9wGEyqI0C?=
 =?us-ascii?Q?rIajWsREg/HMKYYwho/NqaxAbMRok9mYxmL4DTR3SOp1G57Wn0Jugap5EH5P?=
 =?us-ascii?Q?IwGAhbtfrhuwZiSiYxTRZckqsgs651NfGTzEbvYsZogXUNz0jOLVMnxAiOeX?=
 =?us-ascii?Q?tCW129+IoOo3jWPJiWsUeuwnb02weHEJnr6bE96Cu6zMCHhe0tThGgOup2G/?=
 =?us-ascii?Q?Je05DEqW9DkmeU1zpuYDz68oD9qUv21I/VhXHzReSHq9MWqWb1ef+CbZOS5f?=
 =?us-ascii?Q?XcLNjyhoiq29UOMyRoXCKcvbZsT0gMAjnSdSYImkClAaIhwAu4Pl93EoKl4s?=
 =?us-ascii?Q?JpZ+lTpYpfCxmhIPv4q/v3ZHn8nz3zbbtOn5pQNI2qQljtOljI1jcyIskQZe?=
 =?us-ascii?Q?LiQoEUjeONl9yKgu7s9G/oWZAh2G10EP+isVTYI4zKmMzatejV/Gw31g637b?=
 =?us-ascii?Q?Be1Fpz2Lr75Fo9jDiqoMuIEenKY6z+RuN98+iUi7DPkWN8XC5KXqHWsXb9kK?=
 =?us-ascii?Q?NdtS1N8ZS7KRc6QFVIh0L4nZ11ZfbtYlmoCzmEaNuw9OIZUMzS9qvTt4wdB2?=
 =?us-ascii?Q?3JtpG0sCqtnNAcKu+PecYIyrT9jVvlL/FPhOWdGGfubOM3/Ljls7sdiCoxff?=
 =?us-ascii?Q?gA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc07edad-899f-44ff-de4f-08ddd66a293b
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 10:56:00.8303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnjkeCRHs3eMffISblWXJFoGpNWgtgIPd3liGJaP+i4fIhujxk/6LqaFOCFZVyivcP5cd1V5JvGTtu28A1iDvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8601
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

On Wed, Aug 06, 2025 at 08:35:45PM +0800, Liao Yuanhong wrote:
> Remove unnecessary goto labels to improve code readability. 
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Thanks,
Laurentiu

> ---
> Changes in v2:
> 	Further simplify the return value by using dev_err_probe()
> ---
>  drivers/gpu/drm/imx/dcss/dcss-drv.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> index 19b027cc1dc4..51665a9b9533 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> @@ -37,7 +37,6 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *remote;
>  	struct dcss_drv *mdrv;
> -	int err = 0;
>  	bool hdmi_output = true;
>  
>  	if (!dev->of_node)
> @@ -63,17 +62,11 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
>  
>  	mdrv->kms = dcss_kms_attach(mdrv->dcss);
>  	if (IS_ERR(mdrv->kms)) {
> -		err = PTR_ERR(mdrv->kms);
> -		dev_err_probe(dev, err, "Failed to initialize KMS\n");
> -		goto dcss_shutoff;
> +		dcss_dev_destroy(mdrv->dcss);
> +		return dev_err_probe(dev, PTR_ERR(mdrv->kms), "Failed to initialize KMS\n");
>  	}
>  
>  	return 0;
> -
> -dcss_shutoff:
> -	dcss_dev_destroy(mdrv->dcss);
> -
> -	return err;
>  }
>  
>  static void dcss_drv_platform_remove(struct platform_device *pdev)
> -- 
> 2.34.1
> 
