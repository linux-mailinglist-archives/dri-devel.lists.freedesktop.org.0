Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE1B97318
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 20:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9D610E157;
	Tue, 23 Sep 2025 18:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="a4t/tPLj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB58D10E15E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 18:29:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDLMgzJBbcuhMetuQNiK96h6zF/X3MQtjhnQTLKPl1Zl08gMSSgizI487zPnQHtSw2ZhqVYkvOBaXFQZ9tOdhnyaLmlRocrRl3z2oEinyoHJ63ZofEhJKhivzOIeND92zplrMS7A3NMurq/iFviv7/iAZIML/8k6B27F32H9FW6nXxmvc70iNlSYGHi9DGPJHtJq7sz765GD8vXf5IK5yklqP/UbJOk1/U4Jk+B+xZJjUHAsWVBcZiggYoQB+9mCs5NElQoJKa7Q4KecPSvj61zMb//R42V8S1HlUkWD9cc9WizFVg199vxkZiv8FK2XLhhdDVHHHZ0j1fteH8ew8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSLdUX3+QJj7uJMhnq/eZQvgqqDlXGvRY+hHSsv5+Zs=;
 b=KF+t8DDIZvbIV1n7xvhP2PIw4pmeYkgzYft3pr39B5uilnaDBYUFYnbHh1+WAbqmy5UXwHlUYNbloFAYUkyeHDZ4c99IMQxh57+PxDxAbUWGHHbtIfjQcFwAOVwkW2RlYYvSBUoWyibV8ZLCjSOjDN0gJUdb/5wui1zwD0iD0MV39sYdE7blkX1SRX+DOh4onuQVwmWv8+zTTqHj6vHNpZWxJz3iI/awhuZNObPGCYuk6smf1KijWpuHjw/EFx+uEC+eMJeWajRsnwlkmWDxGj2fcVupi3HbQQ+LUk5S+HKL+NlGvvz3F/HzrKiD2PtbgQ7M8EG11HnXOSwg6rZb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSLdUX3+QJj7uJMhnq/eZQvgqqDlXGvRY+hHSsv5+Zs=;
 b=a4t/tPLj5xz46yg3up5tAf6qkbzFg00OxOsKr14uPzsJvqDcMB1vbslPlElgH8kvTKCYZUwDAyi8KTCXq6A34j/zn0THtbURiBoC89y2/xFcFo5KrINMeohLLu4YgAPtHXjRoY3tMF4+XxSmp4dhUYa8+9AS/lDXszSht0cflpGNogF9wHkRegO8BakiR2nOz8IWF8+XxrwF4cBE8OPRA0hq2H0gXZRf42CY3Tz7nK6KmXjEA/KBE8xwGAMntio0qudUXZwCHXj1VaLO1j1VklTOanQq7wliUaNvlEiWz7l1o9Z7g/dT/t+6xY/uccjoebZTJITprxmDKDSd7X+i7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB7799.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 18:29:31 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 18:29:31 +0000
Date: Tue, 23 Sep 2025 14:29:25 -0400
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
Subject: Re: [PATCH v2 07/14] drm/imx: dc: Add DPR channel support
Message-ID: <aNLnBbSr5BGDvmsG@lizhi-Precision-Tower-5810>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
 <20250923-imx8-dc-prefetch-v2-7-5d69dc9ac8b5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-imx8-dc-prefetch-v2-7-5d69dc9ac8b5@nxp.com>
X-ClientProxiedBy: AM0PR04CA0089.eurprd04.prod.outlook.com
 (2603:10a6:208:be::30) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c18edd-3941-4d4b-f6a1-08ddfacf22e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U8VBy1A1ETTKxS+9KukEI549V8/4j7waqvyqAKYMmkgaeywQgDNacroucxfO?=
 =?us-ascii?Q?gdSNkaiGQb7XCop5n4Q8bfpBcDlEPOByHGYVPgLpPaQ3BeCoo6P6vNuMJyKk?=
 =?us-ascii?Q?jXfQr5noEkOPgHI6LNOOO1Ub67Y7FWCKBTzJ2AqZCp7Ti6caI4BC780lpxhh?=
 =?us-ascii?Q?FTltq4R26/LL3svazOq3pI10DEqyu7MKtgma+7lWcdw3nieoRQWEJmIwEU81?=
 =?us-ascii?Q?jzwdD/UKUCdHb9QJw7hDZoqZgflIifPueWYlr2NP92UIJQSpR3JwTL2aBsUN?=
 =?us-ascii?Q?e62g5h+ji/Te49YKHDd+W6ipXBhVAJL2F+lq1INcEpz22apUnjf/AOFqzkl8?=
 =?us-ascii?Q?/LbJudLhrOGFYvEyhxG9zAKY2nxB+9tBKF3Ub9AA2z6s0qBbzj00mRvq390v?=
 =?us-ascii?Q?7x7eF+SuHIcXMN+/uQ7AoxZaXbKiQCct5EIbDNgf7oGeE6NAvf+sr2hk+YfL?=
 =?us-ascii?Q?wSXEGM1WG3aftK8i3L1AizSGU4AlSVTOHHYREI2XnblCOXrvkciQOYgGNEwF?=
 =?us-ascii?Q?0dpbbyGdLUNyHaWaNbjghRvvHzDDKce+y2pIQ7Zc8sYD2TU/8cNFovOU6sHp?=
 =?us-ascii?Q?zJQUBGGHGN61uECzZEk5fepNHuz3TE8XQlQtYW2OOqSSqqFOUHYnkP2NowCf?=
 =?us-ascii?Q?Kbk8QDBqmP27n+Jfrz4/vFH3wmf6Be0PUAUyITyStFtI9l3YkCz3LYVgtq9M?=
 =?us-ascii?Q?Y+jgvoZPmplaj2Steg5CaPb+LYYMjGrZ4j8CwA+9pu4dQWB4y8RMapHqKP1Z?=
 =?us-ascii?Q?6gbjfzSwN/9QO8AHeDa85vIB5HzXylFvewB5c+MyUfEvOPYtINPIgUM+tsF9?=
 =?us-ascii?Q?+c8XL2dnexSxUF6Hk0ewZ//jKhQuVN09PsuT4EjR0nOWqkpdOkheAvxSSF3K?=
 =?us-ascii?Q?hC85qVFRzyJk2thrNFFN+3Q5FdYVNNJRKaPgKAT6U0dOw2xx8uItJrArrOLL?=
 =?us-ascii?Q?BRCzRBlNYQHMDeIMcMCJTiXLDuXVsMpS/b38ex8xbRp0WLNAHXxBudz0RjAx?=
 =?us-ascii?Q?VO0VCvOnTmxGMsv5mt8KrYgdn+NM2gxjCf7E4OnFPrtuxsileoHampVF0ZuT?=
 =?us-ascii?Q?yagYpQAoyXH8Ud6H0MVT5cEAKX2+i5BiveKqWblzGEU8OeBijfUi+m1Mug9e?=
 =?us-ascii?Q?RBp+yCjgux5uVLI0cXOFXjgYccYAZcyw+kv4XLV8Y4TheLYaLxKmfxowVF+C?=
 =?us-ascii?Q?gxIW6GyiFT9OMAiVdaKlumMrxe/vzVmE6EGLKJT3jClIL1SLsRT5iedM+KDN?=
 =?us-ascii?Q?54jvwC4nGryEpCRhVKGQpr11liB3nb0CFl49yvwDDxR7ZNxhCwSJWUwi+3bf?=
 =?us-ascii?Q?WL4Hau3QthjN4GFfOiU6+06zF+kB1kmrEXvSn2o/t+JI051yaFXIPj1Vq8vu?=
 =?us-ascii?Q?ol5TnrMvIO+uZ/cTufRwLeDYfX/K7TzIrCL3m69C21aWsc5rrW0auMaLWorr?=
 =?us-ascii?Q?v9uT4a4yNsJcF0cjQuAtlHbPMl460X8tymG/0Dr9+1Cw7xmMBmcA/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9i1rzS6YHezyy7SOY7YitIqbUuvM+XSujTFQC7uoVrvQpkUDtUOKwCVgYy64?=
 =?us-ascii?Q?Qqq2WpDlg+TSa9x3PHvrC4k9uJqsMUbQ2pUhGeaw9rGqATTmWr2FKkUZFiwN?=
 =?us-ascii?Q?aBMpqtVmdsSsAVPqF1ky3jjs7v/QNjFYyCr7ZhzxhTzmcZdopKOeRGoXkTBb?=
 =?us-ascii?Q?qIgFoVtb5T0dXhyXuQjVhi1X5tbXJaBtxgdQB4UeZHSYXFBuOj32r1pFCAbp?=
 =?us-ascii?Q?Pv5as9OCsvhVx5e2Qk+RGhcw3ha9ZsAz4PCIm8dt7jF6pX5Rva4g0mCQL3Ev?=
 =?us-ascii?Q?qSxsZbOmMDLeqb85zZDXo8YU9zd9NZcnJcu/Oakm3yNN7XNYrBVeYhRkN5TZ?=
 =?us-ascii?Q?ddewV0Kw7Ml9a7Qwn6hYoib7+BNjJIE6iH51CvInSj2iBO+Spzh6/k36g818?=
 =?us-ascii?Q?/i+99T4ytaYcDi4QxwKC3OlZ1wd+HVVfpR8o2aEDwnXAM5VVyNcPwN8909aX?=
 =?us-ascii?Q?ma44IFfbHmUbo9HzsRE1IIMpGF0Lf1Yox/qURUdTi2qfpFZfduSnAqR3IxKU?=
 =?us-ascii?Q?bADX6y7bBsNMfl0thvFh7UitQXjDjYU57TH5rt1KVnGI6dVVmGScmXnwhU13?=
 =?us-ascii?Q?hurgpkWgFuew1nMVQaqL3gDdyd9Qo4jhZp5qWD9ZW6GZyvqQOUov93zH8QKq?=
 =?us-ascii?Q?HQ8gUaKA4Nn9jDmkvcvkSmzR0KnBqF0YuZIlpyjnHPspssXiJ/COXiiJ7Wbr?=
 =?us-ascii?Q?o9OLjgqpeuARHmq9lUfdGEfKbUuBbybBq4gSZkeNWJYdwZLJGXNmtUF/7Vo5?=
 =?us-ascii?Q?29sDVdsXsvFxjgH/ydwsbFTAcaW0IMKvg7Ki7m4gB6aKbiWcrFMLdFjaR6VS?=
 =?us-ascii?Q?/DmJlpQe8X7DKgVA9vLpoM7MlDvX7NAs0LZpnyvf6cElX90Ew+6laaQzWLcv?=
 =?us-ascii?Q?ahPgHmxc69Ouimb9YYRhb24mF9dUd6qEU0T07Uaen/D3eqP7kuUPoA59V6p6?=
 =?us-ascii?Q?tc20QmJl/XPxxatBNxtxoNW4v5g08XkSRf4EDF2gaptwLpcsVCLKM6RfJJiN?=
 =?us-ascii?Q?dOWLY9C2wnO9RED7Bv12GtajbPCo5g4An8JleGsiRQWIVY+aEfIWhigs6FE4?=
 =?us-ascii?Q?epTzPwEJTH/nNOR9gulvGBZMfhn91cyU8xzqFzZMPPorIs0NxikQDHUDPAxt?=
 =?us-ascii?Q?iq/nfRzFkp7u60tf7bfFD+7j7j4X2QaUdaP5AWhFDoHVUdNXep4Hx26gS5zW?=
 =?us-ascii?Q?NOiWS1FLFKX8X3U5ohlOvxWb+4SS7NJ72EMXwcq6qEmoujWcjhwyPDdzuy6F?=
 =?us-ascii?Q?YcyfT6Lq4RvlDVXREmdeFzQNKwn3cVhvAAgsMqgOtkY5F4ead95i30MwIwNg?=
 =?us-ascii?Q?cj/eAH4ANrRPFb3kYn0dk18P1oI3PX8vyf35FQJdtu+Tr6lP8ExGLrISkY9K?=
 =?us-ascii?Q?8SEgXteX/dddFh9cST4EUj1KCMypWennEuM5ld5JFerdIaAwZeH8IGErZU0h?=
 =?us-ascii?Q?IOZzdG37f0/WkQSF0CpTRnXgz/JNdxvTBJWBRoQ6tcAkEXyOWYjD/x7CMj1v?=
 =?us-ascii?Q?CzKfdGUjpNPBVgPxIIgb6SUnxqNast5okCSsQ1d4LNEU3oZajvSaqh8jmK9o?=
 =?us-ascii?Q?7/vtdhKsiMznKp0O33+n5emK9ZwFPhDtG5SWE4uj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c18edd-3941-4d4b-f6a1-08ddfacf22e9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 18:29:31.0756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkHudsmYVZVNAMnYpqOb5gXjsi6AbmDypvbB7DRNSMGuTvg4ZPqI2LyLbYheGyfBRr4NnNIh7qm/zHJOW4584w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7799
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

On Tue, Sep 23, 2025 at 10:07:57AM +0800, Liu Ying wrote:
> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
> It fetches display data, transforms it to linear format and stores it
> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
> driver to support the DPRC.
>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> - Manage clocks with bulk interfaces.  (Frank)
> - Sort variables in probe function in reverse Christmas tree fashion.  (Frank)
> ---
>  drivers/gpu/drm/imx/dc/Kconfig   |   1 +
>  drivers/gpu/drm/imx/dc/Makefile  |   6 +-
>  drivers/gpu/drm/imx/dc/dc-dprc.c | 465 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-dprc.h |  35 +++
>  drivers/gpu/drm/imx/dc/dc-drv.c  |   1 +
>  drivers/gpu/drm/imx/dc/dc-drv.h  |   1 +
>  drivers/gpu/drm/imx/dc/dc-prg.c  |  12 +
>  drivers/gpu/drm/imx/dc/dc-prg.h  |   4 +
>  8 files changed, 522 insertions(+), 3 deletions(-)
>
...
> +
> +static void dc_dprc_reset(struct dc_dprc *dprc)
> +{
> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + SET, SOFT_RESET);
> +	fsleep(20);
> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, SOFT_RESET);
> +	fsleep(20);
> +}
> +
> +static void dc_dprc_enable(struct dc_dprc *dprc)
> +{
> +	dc_prg_enable(dprc->prg);
> +}
> +
> +static void dc_dprc_reg_update(struct dc_dprc *dprc)
> +{
> +	dc_prg_reg_update(dprc->prg);
> +}
> +
> +static void dc_dprc_enable_ctrl_done_irq(struct dc_dprc *dprc)
> +{
> +	guard(spinlock_irqsave)(&dprc->lock);
> +	regmap_write(dprc->reg, IRQ_MASK + CLR, IRQ_DPR_CRTL_DONE);
> +}
> +
> +void dc_dprc_configure(struct dc_dprc *dprc, unsigned int stream_id,
> +		       unsigned int width, unsigned int height,
> +		       unsigned int stride,
> +		       const struct drm_format_info *format,
> +		       dma_addr_t baddr, bool start)
> +{
> +	unsigned int prg_stride = width * format->cpp[0];
> +	unsigned int bpp = format->cpp[0] * 8;
> +	struct device *dev = dprc->dev;
> +	unsigned int p1_w, p1_h;
> +	u32 val;
> +	int ret;
> +
> +	if (start) {
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to get RPM: %d\n", ret);
> +			return;
> +		}
> +
> +		dc_dprc_set_stream_id(dprc, stream_id);
> +	}
> +
> +	p1_w = round_up(width, format->cpp[0] == 2 ? 32 : 16);
> +	p1_h = round_up(height, 4);
> +
> +	regmap_write(dprc->reg, FRAME_CTRL0, PITCH(stride));
> +	regmap_write(dprc->reg, FRAME_1P_CTRL0, BYTE_1K);
> +	regmap_write(dprc->reg, FRAME_1P_PIX_X_CTRL, NUM_X_PIX_WIDE(p1_w));
> +	regmap_write(dprc->reg, FRAME_1P_PIX_Y_CTRL, NUM_Y_PIX_HIGH(p1_h));
> +	regmap_write(dprc->reg, FRAME_1P_BASE_ADDR_CTRL0, baddr);
> +	regmap_write(dprc->reg, FRAME_PIX_X_ULC_CTRL, CROP_ULC_X(0));
> +	regmap_write(dprc->reg, FRAME_PIX_Y_ULC_CTRL, CROP_ULC_Y(0));
> +
> +	regmap_write(dprc->reg, RTRAM_CTRL0, THRES_LOW(3) | THRES_HIGH(7));

Is it okay to access register if start is false since
pm_runtime_resume_and_get() have not called.

> +
> +	val = LINE4 | BUF2;
> +	switch (format->format) {
> +	case DRM_FORMAT_XRGB8888:
> +		/*
> +		 * It turns out pixel components are mapped directly
> +		 * without position change via DPR processing with
> +		 * the following color component configurations.
> +		 * Leave the pixel format to be handled by the
> +		 * display controllers.
> +		 */
> +		val |= A_COMP_SEL(3) | R_COMP_SEL(2) |
> +		       G_COMP_SEL(1) | B_COMP_SEL(0);
> +		val |= PIX_SIZE_32BIT;
> +		break;
> +	default:
> +		dev_err(dev, "unsupported format 0x%08x\n", format->format);
> +		return;
> +	}
> +	regmap_write(dprc->reg, MODE_CTRL0, val);
> +
> +	if (start) {
> +		/* software shadow load for the first frame */
> +		val = SW_SHADOW_LOAD_SEL | SHADOW_LOAD_EN;
> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
> +
> +		/* and then, run... */
> +		val |= RUN_EN | REPEAT_EN;
> +		regmap_write(dprc->reg, SYSTEM_CTRL0, val);
> +	}
> +
> +	dc_prg_configure(dprc->prg, width, height, prg_stride, bpp, baddr, start);
> +
> +	dc_dprc_enable(dprc);
> +
> +	dc_dprc_reg_update(dprc);
> +
> +	if (start)
> +		dc_dprc_enable_ctrl_done_irq(dprc);
> +
> +	dev_dbg(dev, "w: %u, h: %u, s: %u, fmt: 0x%08x\n",
> +		width, height, stride, format->format);
> +}
> +
> +void dc_dprc_disable_repeat_en(struct dc_dprc *dprc)
> +{
> +	regmap_write(dprc->reg, SYSTEM_CTRL0 + CLR, REPEAT_EN);
> +	dev_dbg(dprc->dev, "disable REPEAT_EN\n");
> +}
> +
> +void dc_dprc_disable(struct dc_dprc *dprc)
> +{
> +	dc_prg_disable(dprc->prg);
> +
> +	pm_runtime_put(dprc->dev);

You call pm_runtime_put() in dc_dprc_disable(), but not call
pm_runtime_resume_and_get() at dc_dprc_enable().

Is it more reasonable to call pm_runtime_resume_and_get() in dc_dprc_enable()

dc_dprc_enable()
{
	...
	pm_runtime_resume_and_get();
}

dc_dprc_configure()
{
	unconditional call
	pm_runtime_resume_and_get()
	...
	pm_runtime_put()

	if (start) //look like only need enable when start is true
		dc_dprc_enable(dprc);
}

> +
> +	dev_dbg(dprc->dev, "disable\n");
> +}
> +
> +void dc_dprc_disable_at_boot(struct dc_dprc *dprc)
> +{
> +	dc_prg_disable_at_boot(dprc->prg);
> +
> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
> +

you have runtime functions dc_dprc_runtime_suspend()

If runtime pm status is correct, needn't call clk_bulk_disable_unprepare().

Look like call pm_runtime_put() here to let runtime pm management clks.

otherwise, runtime pm state will not match clock enable/disable state.

> +	dev_dbg(dprc->dev, "disable at boot\n");
> +}
> +
> +static void dc_dprc_ctrl_done_handle(struct dc_dprc *dprc)
> +{
> +	regmap_write(dprc->reg, SYSTEM_CTRL0, REPEAT_EN);
> +
> +	dc_prg_shadow_enable(dprc->prg);
> +
> +	dev_dbg(dprc->dev, "CTRL done handle\n");
> +}
> +
...
> +
> +static int dc_dprc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct resource *res;
> +	struct dc_dprc *dprc;
> +	void __iomem *base;
> +	int ret, wrap_irq;
> +
> +	dprc = devm_kzalloc(dev, sizeof(*dprc), GFP_KERNEL);
> +	if (!dprc)
> +		return -ENOMEM;
> +
> +	ret = imx_scu_get_handle(&dprc->ipc_handle);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get SCU ipc handle\n");
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	dprc->reg = devm_regmap_init_mmio(dev, base, &dc_dprc_regmap_config);
> +	if (IS_ERR(dprc->reg))
> +		return PTR_ERR(dprc->reg);
> +
> +	wrap_irq = platform_get_irq_byname(pdev, "dpr_wrap");
> +	if (wrap_irq < 0)
> +		return -ENODEV;
> +
> +	dprc->num_clks = devm_clk_bulk_get_all(dev, &dprc->clks);
> +	if (dprc->num_clks < 0)
> +		return dev_err_probe(dev, dprc->num_clks, "failed to get clocks\n");
> +
> +	ret = of_property_read_u32(np, "fsl,sc-resource", &dprc->sc_resource);
> +	if (ret) {
> +		dev_err(dev, "failed to get SC resource %d\n", ret);
> +		return ret;
> +	}
> +
> +	dprc->prg = dc_prg_lookup_by_phandle(dev, "fsl,prgs", 0);
> +	if (!dprc->prg)
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "failed to lookup PRG\n");
> +
> +	dc_prg_set_dprc(dprc->prg, dprc);
> +
> +	dprc->dev = dev;
> +	spin_lock_init(&dprc->lock);
> +
> +	ret = devm_request_irq(dev, wrap_irq, dc_dprc_wrap_irq_handler,
> +			       IRQF_SHARED, dev_name(dev), dprc);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request dpr_wrap IRQ(%d): %d\n",
> +			wrap_irq, ret);
> +		return ret;
> +	}
> +
> +	dev_set_drvdata(dev, dprc);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> +
> +	return 0;
> +}
> +
> +static int dc_dprc_runtime_suspend(struct device *dev)
> +{
> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(dprc->num_clks, dprc->clks);
> +
> +	return 0;
> +}
> +
> +static int dc_dprc_runtime_resume(struct device *dev)
> +{
> +	struct dc_dprc *dprc = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(dprc->num_clks, dprc->clks);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dc_dprc_reset(dprc);
> +
> +	/* disable all control IRQs and enable all error IRQs */
> +	guard(spinlock_irqsave)(&dprc->lock);
> +	regmap_write(dprc->reg, IRQ_MASK, IRQ_CTRL_MASK);

write one 32bit register is atomic, look like needn't spinlock.

Only other place use dprc->lock is in dc_dprc_enable_ctrl_done_irq(), which
write 32bit clr register.

Frank
> +
> +	return 0;
> +}
> +
...
> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc)
> +{
> +	prg->dprc = dprc;
> +}
> +
> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg)
> +{
> +	return prg->dprc;
> +}
> +
>  static int dc_prg_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> diff --git a/drivers/gpu/drm/imx/dc/dc-prg.h b/drivers/gpu/drm/imx/dc/dc-prg.h
> index 6fd9b050bfa12334720f83ff9ceaf337e3048a54..f29d154f7de597b9d20d5e71303049f6f8b022d6 100644
> --- a/drivers/gpu/drm/imx/dc/dc-prg.h
> +++ b/drivers/gpu/drm/imx/dc/dc-prg.h
> @@ -32,4 +32,8 @@ bool dc_prg_stride_supported(struct dc_prg *prg,
>  struct dc_prg *
>  dc_prg_lookup_by_phandle(struct device *dev, const char *name, int index);
>
> +void dc_prg_set_dprc(struct dc_prg *prg, struct dc_dprc *dprc);
> +
> +struct dc_dprc *dc_prg_get_dprc(struct dc_prg *prg);
> +
>  #endif
>
> --
> 2.34.1
>
