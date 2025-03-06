Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28888A553DB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 19:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8121610EA4B;
	Thu,  6 Mar 2025 18:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QrJ2VCnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2071.outbound.protection.outlook.com [40.107.22.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A5710EA4B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 18:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+2m0ZgLBAC13Iu5O5rp32uvoEJfn2WTNQwLqOZ2SOpQn5Pi/dBGYx+MDciHyIuJrupY/wAJKasddoo7Vw4P1KUXKWdQzF1LO6ctg7/gY2/cvku/KFguSjECKluY22MaVVwiN1eJC+WBQ2FJwy7cU094a6dYs3X1YvtpNG/Trfh81zKMG2CN1U9M9WH+WuFIIz4ty+W26y3gAPbL4pc2rdH77JERFrCRyz/p/GF0Sbi5dhrNT6nEy7rsaevNwxTMX1yMCxUWgpMVU1TdRBxnboM8YO8kUu6BYZ8aWO6JHxB74FJln7REgFzshcF4zb4CNRi9txzJ52kiStaQHIewMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUPAMa6+gDybghrWwe5MvD4fILg/dT5xk/RICA9m8Uw=;
 b=HaP6dLLSgv8P+eaME7fI8bLKcarMC35u8R4eRSJEmWFITNOX0ZVsNM21JuWzczYqFF9qVBpYp26Z92geL4smMs0NAOJzqMGitysI3WTJS07f71vWsbJV3cdyL7bQUsycLOIsao+kYOgFlkJxYFQaMEkrMim0uYLp3DXc6DQBIxm/2Y5XUf22fWPDwGWrhErEGBabfeXvfA98fRBED0NShd6TIKF8Zn2jk2FyK98tIzmvDd5Eq8ALNymkmz6WyYb4z+BZ6FnWbkpyOJ/qRNwAsOI6Tngckz9/3d80KfnOQjaEZjSuc53JWWcFxC0SM2PBX/XxAlHmabyYcqRdEith+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUPAMa6+gDybghrWwe5MvD4fILg/dT5xk/RICA9m8Uw=;
 b=QrJ2VCnMWhIRThhQK4SuGthqpi5KRkjSLTaYSZ6NiGMtJzcxnsWYRIYX7ap3EOqD90IsrruUFSnJXknMdSoSm4UxLvz+ZwqpQgD5ZPSolx9QPUJypvP2zsFtTEk80SPgYJsYJzpQp24nzVSk5H7QLWZHIdf9mzRjMF57SrJ3dY6M7uFIpJvbu/OqooT235xDYtrMOVaKRwV1QYJKIIT+Hkl+60gVVD2b3jhBcpi82yTRvkrveB9gdv+TxdIYz4Iunf4oAgklVII2BERTESVJ2VwPTPGi61Q0gCJALC/yix1qEYA+iU2fA+ZviH0DorufgBGvLzqJtPuLfY3lNDaHEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10550.eurprd04.prod.outlook.com (2603:10a6:10:586::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 18:02:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 18:02:19 +0000
Date: Thu, 6 Mar 2025 13:02:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: imx8qxp-ldb: cleanup return value
Message-ID: <Z8njIsHSQcRq2S+g@lizhi-Precision-Tower-5810>
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
 <20250306-drm-two-ldb-improvements-v1-1-f139d768b92c@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-drm-two-ldb-improvements-v1-1-f139d768b92c@bootlin.com>
X-ClientProxiedBy: SJ0P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10550:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc2fbee-21f4-4614-76f2-08dd5cd909a3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sCxeL7pwneGWwTFacyxFfLOgrTAFw4F9kLY0ShDB9EqQu13G8ePj1lMY5IwC?=
 =?us-ascii?Q?w6R2CDbigGc37/wlIbFCWBhKHpA96upfLMAWMAuVcL+IL4M21yr3TpWd1L2S?=
 =?us-ascii?Q?ZmJ2NfuzYcx3ifsZv3mII9xfqcKjlIn9C127K7vVrR6f0i/U7LLiwn9ca2BA?=
 =?us-ascii?Q?EeZ7D5aXXWyAUlBYVmrzp0nomy02qEO2t01HRXNfFn/fG2CIEXLbiyO/rhtt?=
 =?us-ascii?Q?TwhhvXpkROGwKoeiwY+MMnobRHbe6p/8/NcJewMEt0+usj7AFXlru29hbHis?=
 =?us-ascii?Q?267XH1NYI0EsILuv/LVdaD1LAfseph9CXuLsqy/+C2gOV1oB3LW1TwomudHZ?=
 =?us-ascii?Q?VkURiXus3dT1PudOhAIbUvjQKbCuD/GpR5V2BlDChiYKpikKoH4OgaC3dyXn?=
 =?us-ascii?Q?RZ/cGNH2OGdoZKCyCUS0BpJdwwmmvZNiCkNP2/1zQ0jCHhUUODWp9ypDy8cd?=
 =?us-ascii?Q?sGP4Ico2V5UTZbpWG4pDLmD109Fte8BkHrCB1yIxYhNrbhLrFdw0XdN11IRc?=
 =?us-ascii?Q?LhKPWFTGlk23Y9fbX26RcWwnUXBf9HOYfXO19wqx2k7zHPlqhMEqvCliiN+R?=
 =?us-ascii?Q?geJdcwBO88xtP5AD0FN7GApck4t6ZcYH4LXEo7tqsGT5CfbSyRrEqJPWSrgy?=
 =?us-ascii?Q?hZHxbHtlRR8LhXUhI/79bWdYhZYhgxolbQ/NTMDzGh8w+BNMt2w8gsAl72YN?=
 =?us-ascii?Q?6OKVymDGQm3fs1ztfg1dGhL3JiDQtu4n9KAmbt8gQujn9dwrvNz+KESPwltH?=
 =?us-ascii?Q?lZU1LdySbZUl3+N5I12QuxwhAijbJXoPSWxQ+O441Q2DWYdcJcvy1/KapNP0?=
 =?us-ascii?Q?oae5g2xaawTxZv/IzeMlm0COaBu3d51zLDdeBc3vZeszeEO+CfTq0kX7uuRo?=
 =?us-ascii?Q?+f0j3obnzcZk5OuudHiY3hvdb/C24e4uEm3tImvL/9r0DGRmzkKLi1aLxTUj?=
 =?us-ascii?Q?MdDfoDPr35DZeFSbZR4xNmacdBeErGnfvLhZFaQnxOJ64VnNcfVY9Q/6SR/U?=
 =?us-ascii?Q?3nsP74E0JCnIhDjqHp4qnqO/7cz9gEe60vrNSO4o4yLGgHQMebFmR/GW0R63?=
 =?us-ascii?Q?QFsH5AEg6npl5qPuNnoM/bASh0LnKDMxS6nG4GXH5dKId1lLR0MkMjYsSdct?=
 =?us-ascii?Q?6RjGefyaBsvr0I1w3/3i1J85hRNTmGCAU3fgb09h/W5vRvZQvFRRD8Gvo7xG?=
 =?us-ascii?Q?wtP9+vXdeO2mua3uEhrEGBss6r5cBF5vIraVeY9Lb8eqEv+dUQ+CjdDEqOz0?=
 =?us-ascii?Q?Ga4imo2rWoao2L2hLAGzKhjUZPGEtYidX6xXYgKHTQMs5JzaUw1RxI+FtL2A?=
 =?us-ascii?Q?XLvkoCBYSQejBWb9Hv+0KwnJD+d+TwQeQxEvKUy7cJRxvPB9pMk9cxB1y6nt?=
 =?us-ascii?Q?q5+xfPZkJzuXNIovZKWtUue9GkdIfAnJAVf+dra/R9dgjEAQ+0AQtCFehmyd?=
 =?us-ascii?Q?NMZxWZDVJyFvhobqcIOOudoij3nyPkC2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7V8mdNjGiWBelmBbb1+ABmfJvt6boU13tbinRRMSkdaAy9fKFfH9yahmg6PH?=
 =?us-ascii?Q?msmvM/E/Yy7e+aH1GPuyPoKraDLZP2KrSPfrZ53ju5he1apXjRyw3DvvEE1R?=
 =?us-ascii?Q?V8+Gp2Mug8EoVBBhRk9cN+cmsZ/bgS5EbWOu6sLiS+Li0SX9NrmuoX+Ycwwv?=
 =?us-ascii?Q?xfXdgsKRXGqwZ4xxDTWlIkow076OjO/k09t/VhdEZEhiRPmHtK1g0aADZQ7G?=
 =?us-ascii?Q?0yZq65nYBHnUX/1C8XiG3hmzdEorvrJHx8V8cowNW/nSCJ59sIIcUGqoAOWL?=
 =?us-ascii?Q?fNla7Z6q5BZTI9BVzE6YSQ8mzQqOnTSnGXZdzQBo1TyLtSnfAtNBJqNMfDCj?=
 =?us-ascii?Q?t/9Fra72kCEPiLFwP9uxuiurUMrOGXpPwJcE0yCY/gPPVOV4KUIIUhZ7XB/E?=
 =?us-ascii?Q?IjsQeR/3mKLS8hhTIFoEyXR9H1vZrY+3aLhuVDxd5oLBleGo/GxsICG+cqQ9?=
 =?us-ascii?Q?LqEttQ/vNaOqOHKrW+7ZKA82L0zcZtV4D9H512vdlbzQHTS5rHuX3Ue+QVGt?=
 =?us-ascii?Q?UDFxvuvty6XY5YG9pv5qGgxfWW0gru4CrMz/L8ElkbGPmWat+hK2owJTcHkp?=
 =?us-ascii?Q?OaE5tABsXYvMDw4OW9ibqswwTOsun1fEJKl/iPNN6sykdYfS57azRX8WLH4Q?=
 =?us-ascii?Q?/whRRahKIKBEBId8l8u5vanhSNoLd5j63Sz2ifEGKOTs836XlKxj8MCrae1F?=
 =?us-ascii?Q?yxL1YO1NwEk6k8iWVcgolnTMfSJ5ToHKTUHsHZIOKtBPdzzSwncyeXztBN3Q?=
 =?us-ascii?Q?zqlOE0iq/JdIYKVKhOdDyNYwcsB2qm1dRq9C+mgMACZAbN0bpXZ4pbfMKsHx?=
 =?us-ascii?Q?jvKt+bCvaXpfLBOEgfQpxrUncI+p2ujF+M2tVam4qcft5n05JWdLBufHe9GP?=
 =?us-ascii?Q?0DgWT27uwQ7WxCU+dhtvzbYXyUBoSpBMZHL3dwJnWPLN4adlYKeQRDgd/bJG?=
 =?us-ascii?Q?ovi7gv5/QMKGDHtu55GXs1GRHqHdcd4AgXZTR9eWbOWTHf9Qm8d+Am7zQZxi?=
 =?us-ascii?Q?a81UGNvAaFS+hSyW67Rd0oyX+/+2c9IlJJ5pLOpijikvaAAqc5+ryKcTBlkq?=
 =?us-ascii?Q?hR4HEPoHHsA55JI+4RNBR+sZ1sPl1SEmKTQlTPCnsNDq3G9T3l6NTU8hlHby?=
 =?us-ascii?Q?DeqYNYcVwtweqdLoeMwtagyZ5EvQipKrio/dOpopBj4fM3kPhiA1KTZd8WE1?=
 =?us-ascii?Q?mORwEBcaMC13nPq3YehNEzKhYdPjIHCgdmHesM1bWCb/kKUpQdGCURhuz67n?=
 =?us-ascii?Q?yjYiKAayC0f5kj72h0DMZjYI4nXUb7oozUIXAIBcvFmUpwrjbeAe+Dy9z6+v?=
 =?us-ascii?Q?F0+8Mf1azHl81VKkXVuxkQX8UUpM0+u9IFZ/KDg6EnzcjWavN3MUQuTbsONT?=
 =?us-ascii?Q?HjEI5D1mkKkWtMPL0dsqlhrsHW3LkFo379z8oEiA6smUqBebahwsiSjDyM8E?=
 =?us-ascii?Q?tt4DSbTfzKdohLYlw2pJ7uaq8chXbPnA5aQckG+PyjfNe/OFtOExc9DMxjo+?=
 =?us-ascii?Q?yzgPA9zNLdipMfjzWfu2WXt1xu4nByvZK7H+rWX8CliRYqNd/ROtCgk8g97c?=
 =?us-ascii?Q?JQWnbthlsWX8RmVesak=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc2fbee-21f4-4614-76f2-08dd5cd909a3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 18:02:19.7559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcB4R2A6+nLxUNFdFFOrXzG2Clh6uurFW5lGhdPDpahhCGrPmXXaEBKfVDp2GzBjNaaNs/mQUqEUjiJ88NclLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10550
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

On Thu, Mar 06, 2025 at 06:28:40PM +0100, Luca Ceresoli wrote:
> 'ret' can only be 0 at this point, being preceded by a 'if (ret) return
> ret;'. So return 0 for clarity.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> index 7bce2305d676714cdec7ce085cb53b25ce42f8e7..bee1c6002d5f84dc33b6d5dc123726703baa427e 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -665,7 +665,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
>
>  	ldb_add_bridge_helper(ldb, &imx8qxp_ldb_bridge_funcs);
>
> -	return ret;
> +	return 0;

I don't think it is necessary, no difference.

Frank

>  }
>
>  static void imx8qxp_ldb_remove(struct platform_device *pdev)
>
> --
> 2.48.1
>
