Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18A6B8A488
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381C210EA44;
	Fri, 19 Sep 2025 15:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="C/6yRpic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011041.outbound.protection.outlook.com
 [40.107.130.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D2E10EA44
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDpZTXFE+rBuNKZcKAAFOLdFLB8vaXulRGQYqwKSSgYsZPBgipz/bxju/JniVn2X6RLrX++nTDGDkOQi738KWQV5khEIXIap8fg6+5r62k+s1ReOd55SU5SuJSaAcOk43Y4MmSHHi0w4QLLttXrSXh0U2gFonCMq2wG15+A4ugdceLj2q6fXOie8LdXI9+DTfkeXwC1WX1+VCWQJlrGyACF0q8ya3ZUlPy7BWKzyIyKDZAU1aflktpsEvdCEVh7tq1yHgR9z6Koqu5Fp4f0v5QAeFmXdTHD6HhzAkOjbXRnepBHCeQgPgI2hLJwAZzgg9H1CstqV/thdaMVNtW4FQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwbEbjuH3N6BlIDjbWtXaMISGvxTGrtwBxOHPqEB0Q8=;
 b=Hy43RI5khfntVpiFZJR0+3QMGS5FNzsa/mKnLO5dcwERc9JLdFWrQSai3LjnWaEOgPeTfpEeUXkdaRmxN++/6k+Yed+JtHqsE11n1yV8agLhHjMk21QRXMBuCNinQWhXx8/SjhmbAWtZ30JJW8MXFQtkPRQYqxoDpy4+8XhAYOqPgfjpYuAEaSSM9bLa5BPKcexlpbl+s8ONh9gyw0WG6QcssjxXq3Wh9L7erMedfr+Xz/veNbKBwG61H0MOdv+xg2sA2Bz77pvuGUErRuHeHgMTNvxumFd+F7EuZA3UksGzZKNirbH0Pll7oT24yHT1QaCd39Yg7V+L4P9OzFjmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwbEbjuH3N6BlIDjbWtXaMISGvxTGrtwBxOHPqEB0Q8=;
 b=C/6yRpicTiD/Qkx5w+039XJbefYhobF2HyYWblyBxwPbZrDDqpbiLN16GRnz6AusC9JWWTROI8R2R50TZYiB+MU+0mXpN3h+jkEf3KG3Q57k+79fc/8KVd0vPusybUaGrmjAflEuLY0vY7XG2Me4SEy+5InOcIU4oNvcytosTbqHDcA+TD17VrrbnMvH9p3+Kiscco21ySHqQBCYCrbPdMVSkhSF73DXWpQ7XCGyf/XJwTnedqnPYYu9Ziaa8x64Fa9qqNVBiv+foHPKjqQtJ70P5bPpqb1lSMqWYI/B8jLMmSL6d7Zj7y3nnxhJlXzKbVhDvxoiO7bHpJzIBNi5EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10098.eurprd04.prod.outlook.com (2603:10a6:102:45b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 15:27:27 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 15:27:27 +0000
Date: Fri, 19 Sep 2025 11:27:18 -0400
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
Subject: Re: [PATCH 11/14] drm/imx: dc-ed: Drop initial source selection
Message-ID: <aM12Vp95NRGqqpX1@lizhi-Precision-Tower-5810>
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-11-784c03fd645f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-imx8-dc-prefetch-v1-11-784c03fd645f@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:334::22) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10098:EE_
X-MS-Office365-Filtering-Correlation-Id: f964a136-092a-4f7b-ba45-08ddf7910a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YRoVewRbhib/QhWpe0DwCPzvOTaicKwRc7xnPHhqsYf1OSB0nQ63SYZLHkmQ?=
 =?us-ascii?Q?7PeYfZ8QCLNprqprG0MPHG0mBjhP0u++FJcGzTTsUJFmsceMhO95sQBZSniA?=
 =?us-ascii?Q?CY1TeGgtrepL5MFKgVB0iB4+0pASzkpnhj4udMnpcAwWTt3cldlmQxoodpz2?=
 =?us-ascii?Q?H5q0wNWiXqPK8k/CANoEN8TtGSfszS+iw92YihTpwO+R8vdEtGYR1dIBb1MS?=
 =?us-ascii?Q?7Hux1ZE4KV+Vby10BTjlKqErz3unV0X6ROZw67rGsXgKt/DZoXGUiOdTAf1O?=
 =?us-ascii?Q?zmydTtvPaGsEnfiAMN0PPUQ9HX5k5OJ4XrNnwtbEOhb73Knh86xXKSghVSfw?=
 =?us-ascii?Q?nsKe19H+/yGFhtB6aTxitwfV7tTEW9SDrUiD0lOS79X7t92yoXuBDAwbiQS1?=
 =?us-ascii?Q?+bKQue/epz/NhaF6wChkcNHv5hA+OHNJeSOfYKIS1//MiIZDLUoer7B/uWnr?=
 =?us-ascii?Q?beAUVnFS0/a4wrX2/TbaFRl9d6v3RZZ+CeSl3/sWlOZc7niqy2qIz0yP9Usb?=
 =?us-ascii?Q?oCFwSES67gAgGaypnpbH3opeMsdii2v+aUca21QSXGqya+dGN0JJcvRjlmxm?=
 =?us-ascii?Q?5kVZmxZpdcFtuXF+VQDnOSncLs/20BF9S2FtDQq1ZeJeDKvPjl1mGPYc++sw?=
 =?us-ascii?Q?HhQMOSDEhTTMJyIWikV3uJkO+yOUtiFff0UNbyQf3Re5us8ZEZj9SexAEczT?=
 =?us-ascii?Q?IEElf8zy6Zz4K7vd1VCrtRCos70EtM4O875YhhBNoztKnhb5NtC6nYld48Zg?=
 =?us-ascii?Q?5kFVBzNxafroBv1XF7e1NFuUrzfU/yUpAztwFssA6QPyAjxhq56bBlN1pgzV?=
 =?us-ascii?Q?2ECZVCmUNQ4fZuYbMZM1sUWcZXRIrMF9JqAXFodLJnVzpKBWeQ5xeetnjPxy?=
 =?us-ascii?Q?z07D9Suil1w09E6XEk62jfUG4v0wUbzlBbof4yiIxxn37ulJCsr7F5xHLYTw?=
 =?us-ascii?Q?UhVdVeY4PS8AK4+i+rtKr2Fpf3NPY0/dtKB8kx1zZTLLz8te0XiZPPda76lY?=
 =?us-ascii?Q?Dcu1E733X3g/ha/d0lnpE0fUzCTELGIb2laoxng9HfpR7awmgHDtpU0a5AUJ?=
 =?us-ascii?Q?yQHYNClHjWpWnYu6+x6EKT8+AnjKXGoO3Uibz72It9UTlK1E6uMAJ7XWLa/g?=
 =?us-ascii?Q?QgQgrMp6I/04nKEwC24r+lAMBLGhVEaZ1UrhhzvLMcF6EVYOD9nE3VB5ScUR?=
 =?us-ascii?Q?wT7/vgMQ3uPLuDFYCysMv66fDxdKzVotNPYUDvwGNLd3nt5L29+UckUL9RGh?=
 =?us-ascii?Q?Tl3NFE6jrkgzroC3kGo+bgr6cswS4IMIvRHuDBP49hohflBzkzje6OZfbI1L?=
 =?us-ascii?Q?elhsu4dAE4cqNWKI1Vdgbo8kWcT6KFyAsC+iZIDOH/HWOTpIQlnY5huW4Pcn?=
 =?us-ascii?Q?mGGZH4qsc6yl1qKzeNVKwyCJHUuEnZKtapRvv3ebnjz/VdIyF2jy3Vq7R45n?=
 =?us-ascii?Q?9d6G8ssZQDlutofCiujC5ydQ0yIW2QTpAxn6IsjFgGjxxBzWZREceg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b7K/XnSz0M0RY6RTIZuOEgGMV3B4S7WXxNLSV0wsf/DRUPX+XXmBNeq1KBjX?=
 =?us-ascii?Q?r3DVZ9/3/4XWdqZ00R+Z34yS4bXpvsZODUhuD2ykjhr3x+umfl+/SsIZMkJb?=
 =?us-ascii?Q?FwaNHnwnTdAAFKjEfjmbsvK02CKN3jFN4+rQ8DE3Jlhp5SpcVei5PtKekmBi?=
 =?us-ascii?Q?TFb1IJFvucgtS2RwcyzFILPomHmcJRJQbeUV5A+rw+hS8Kt5mQClyhCOj2tR?=
 =?us-ascii?Q?VZtVupRmJ/87d8LQ13elSQE4fa3Fohip5z956hZM5+zs0I51Md8GxnI3Ai/k?=
 =?us-ascii?Q?AcEUdaz+D+fgF31nS2the7Z/ShXJiUfJEx8hM/ZbpKGO0JpYYC9gCcm8l1I3?=
 =?us-ascii?Q?NDMoIz/qY7TereT8ZCzn4UIUY9J9Atq+kF5qdSZ4nG16hL3BISq0k5CKyRaf?=
 =?us-ascii?Q?/oc9Vi9mKV3T9as/KVLJFyr5j0ytb8N56IIQwVB5S4d5HBk2DY271UCUnk0b?=
 =?us-ascii?Q?sLPeamJ4ymWiiedk19/GvRVnqZqbkpXcI2fWkZj8KeEQatZtl/ZJQbIeNRu7?=
 =?us-ascii?Q?cd+R1rlS6s9+ms8eUOEwu/7aE1LebLTEocegDBgIr0jcxiQsODaQ9EaWU9Sm?=
 =?us-ascii?Q?Dca5VIQrrPNccYApCggIn5c0CgcPe9yrsbNenLMrgak5DWwtS2Mt9qTfEj1U?=
 =?us-ascii?Q?/xDT+VyH3/n8Dw9SD2VaiZbvF8MK7pjaosc1q8sj/b9UUGmw73O8aLHLZXpU?=
 =?us-ascii?Q?GyphDumKS0szI721mcmjO7rb6l4HT+F5+W8my4rEbLowrObVJDISWXdFa3F3?=
 =?us-ascii?Q?4zBaObsP8+0VTS82K9KesjqpfwZE1K4Sa+C7jtWodTDtOxYCVrdWDduQX/s/?=
 =?us-ascii?Q?3BjGbSG8y6h5QccSsRMrl3GVBjXnInKDl7dWF3BWfaRUKIlOQ6U9+5DxUtiX?=
 =?us-ascii?Q?kpEaisJlx14qdpx+gYV5cxCSOP8JZRvdvI8ZfwIKn3yODUCSzfaFyJ5WaGY3?=
 =?us-ascii?Q?tgAZEehbDAx5aO5pBB+URjkTiNkler+dgNiX82SDiPoE47KcIzyEhM5ia7Fy?=
 =?us-ascii?Q?Z3agJjUt6Iv4XmwtJl7SfZ/wWgaO5X3VQww0SglSFDriGkr3rkwyzLvqrYSJ?=
 =?us-ascii?Q?+dRwQJsIh8DOO866vil2g411s/ATtLoJYRhBjDbv8fYlft/cN1Pk7mQkJhXJ?=
 =?us-ascii?Q?ZrJuevAuE/rqda6z1GBJ0n3ueJ6+rKJ6cBYM6lW4MCECw1M+ytVnWnM7auEH?=
 =?us-ascii?Q?VOVDgtUDG7KVhw0Q7eIKROsjW5tMdU5/wzXPftuyePweKatmWw32gjr/2ulO?=
 =?us-ascii?Q?DyWnTLPtyxfrrJMlMAnEmIlbTncwLKONrwhVi3QIfNcBTEYd7sWMm8GcN7YS?=
 =?us-ascii?Q?xYdd4NeGVrh2kXNTaFMpbZ2nu2SgP8WhkYqSr7mLNtDNIZmrvqSue9o/cdUF?=
 =?us-ascii?Q?U0vME7pzbF9kUsVDCbx076NFBk6I+dzIEl7SYHs9tHTfP6lxf5/NCDmxyClp?=
 =?us-ascii?Q?1c9IbXUJQYl/ZTYnOr/LQtEwNe03lfJEZwcpgkbpCBB07+BdWDWSBFoMfZ+B?=
 =?us-ascii?Q?3SOkr4ZekZPHFs8yx6Ie+SJftelfeFpT+8igMVskjn8WqnpKgn9by51XUV0j?=
 =?us-ascii?Q?LDVFzohvxsKWZ0kNyl4KO+pMGJDe/i9w4lgofF+U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f964a136-092a-4f7b-ba45-08ddf7910a83
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 15:27:27.8470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnDBxK0iHTJCoPqOboD2ZXVV6cC1G7BHB78QIT+r+WNnVWFag8Je/Y60MyzhCBd4DwO72WSRqHyzW89bC2n/pA==
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

On Fri, Jul 04, 2025 at 05:03:58PM +0800, Liu Ying wrote:
> It's unnecessary to set initial ExtDst source selection because KMS
> driver would do that when doing atomic commits.  Drop the selection.
> This is needed as a preparation for reading ExtDst source selection
> when trying to disable CRTC at boot in an upcoming commit.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpu/drm/imx/dc/dc-ed.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
> index b514790bb765329295553f89d16ee1167ef411dd..1b141ced57b895c24b6358332cbe5e308dad7c01 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -203,7 +203,6 @@ static inline void dc_ed_disable_gamma_apply(struct dc_ed *ed)
>
>  void dc_ed_init(struct dc_ed *ed)
>  {
> -	dc_ed_pec_src_sel(ed, LINK_ID_NONE);
>  	dc_ed_pec_enable_shden(ed);
>  	dc_ed_pec_poweron(ed);
>  	dc_ed_pec_sync_mode_single(ed);
>
> --
> 2.34.1
>
