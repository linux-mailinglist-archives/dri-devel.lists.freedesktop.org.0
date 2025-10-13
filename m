Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE368BD5B15
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E9610E202;
	Mon, 13 Oct 2025 18:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IeL/toz3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013013.outbound.protection.outlook.com [52.101.72.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354DA10E202
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:24:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuopUDI6MmpikG13of0osT9tJvLI8PbppZSU02OZImsTrSxo68aejLYkbe6H2D5qWF+4nCFCeHG6mTdcPrTICJDF2XzrPvEzHfjJyam4lffxtS4Bi+c4mUNSLHTKDCbzXlQZ4TPC7bKsEHSV1ixJbaiJT/fMavpFgkDdOug8rC6XoIy7t067AJ2w5vZMhlEjKC/T0q81upiEPr9x+LM27Br74M+wMwbGpmRyiJeyogsB1D1C1OQm8a2EjX3n2sGaSzEo6xCzsqUGZdYgTGAbvXg8S7AOEyOzb7PFYOMxN+1ykBzcoZ019VtyNIOapgsRKrwsWfS94aSDFV0GXrL9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Slm7r/nMVDRbwJ5zzCwVq5bt4H0M+Nem7jZhx5Dt1BE=;
 b=xdvodFxC/U60D9x1zrQNV63nTVfFU7JhkNY8JfwjNocSSQQMZefVFI9jX7sgEisZ0VQeGtGMmgSI8DWfv5QYkdJz3+taf78Hlrju/hUkb8UJECgVjrPJHdwGuc1v3jwWby605ZzHhHP6YMJ4llFGoA2bK3sVw0Qr5Ok87i1AaR1JEHaSFuw9F8Mgqr2TosdITqEAOMYhSrNmro/Hww+1oXZhZr0k9yOx934Hg+l+/q4a1zF2ac0dxTOKZHFwIVaV0wN9VP1ObpuiLEi6Y7ake4RK0FR/918fQR6HP4sS0lQXBtkJuVbaMqQ2nWSLaHnLSkGzYSw3MjYUkVHBJS9gCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Slm7r/nMVDRbwJ5zzCwVq5bt4H0M+Nem7jZhx5Dt1BE=;
 b=IeL/toz3WZyU5x23uNk2tVCbI2wo/WSf7jrcTom6r5y7MlzmHcszqTYTPTYCxNZY/IwZZE55pN2D9xgN+1/5+CVNiQCHWOqBohigIMWtc5Fj3wW+ap3S/fjvTggAe+iJW/NsVzRQYpRi4POlo8SleQLGLbeZIf9tzYlMlIpYOCySAKS0tOO//aFVosvZ+r9JzgeaCwIaBhSxpucAmtIiA6Y1xQlppxSrBnfUVEPob9gjKT2Pnf+p5qQo+QewoZt29HmaTM3bQeTjK9olwnLFSS0Cp37FFbetQFgXCbZopRZLmw/7u12hE5Kh+60w9zCdMwdX5GpbhzrVyFI1csWjgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DBAPR04MB7272.eurprd04.prod.outlook.com (2603:10a6:10:1ad::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 18:24:19 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 18:24:19 +0000
Date: Mon, 13 Oct 2025 14:24:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 09/39] drm/imx: dc: ed: Rework dc_ed_pec_src_sel() to
 drop ARRAY_SIZE() use
Message-ID: <aO1Dyo3O8FwdkZXo@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-10-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-10-marek.vasut@mailbox.org>
X-ClientProxiedBy: PH0PR07CA0097.namprd07.prod.outlook.com
 (2603:10b6:510:4::12) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DBAPR04MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: e03d2dce-b6b7-4591-7c6b-08de0a85b96b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|19092799006|366016|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sN4T9jfG0elEm2TWtMrrx9+QoB0wALfuOj4ETAoMWim4U3c9cKzJMAg9Fc7G?=
 =?us-ascii?Q?Tki8p9v+Pz6IWWIB43ffnrOGVcBaGleWUDI5glGynoENdAN64kqW8M8XOqub?=
 =?us-ascii?Q?gRw4rq4wjD6I5BVJRWmTSQ/o++ujiPyd1z96qwFjzl0934f3wUBm/zgJFw48?=
 =?us-ascii?Q?FBk5DUGjT6HdYGOekLpIM2UP3ulP6QiyHsvspABYN1t0VrUfDcq9iYJQ57pR?=
 =?us-ascii?Q?x0CX0WrBHPRfAejA1bUYvuuFC3xAe0LRPyL2tWPcuEUgjpnKbsQA7B/PvZB3?=
 =?us-ascii?Q?N/FlBX6JewvickHAlBNRsTG22mrEaJ6fpJWVFtW+/B4aOLfQjTEqWzSerN63?=
 =?us-ascii?Q?QqX+yTx2hNiSjE72j/6yU5cxV8I6xNRtRDzARlPbvnnrEHW+/a3MtVxW0gxt?=
 =?us-ascii?Q?Cw/7Wp5EkFFURBLIY5buwm4O+bjSQmzdymiIKE7HxbawRgLponitqVbFyJ48?=
 =?us-ascii?Q?lpQS0QP6BdGYIPP2jmMbkBiQF/cVgjqwUXUruujRCCdikEzbTSioFVE+NfK9?=
 =?us-ascii?Q?uYC7jUqYChNA15/OX3jxyl7wS2NEqveQ+enu5HGNYiTBw5yo3B1dN2pOYS96?=
 =?us-ascii?Q?DwbNZd8xYibyC8khxkOzch7VkIKTnHs7clA3Dw3TEmABQM0oWhaKW6unYK/1?=
 =?us-ascii?Q?TDD+WNrTQC35TibumBl/baOJyIhRpk3Rz/TeEeOjzugfYvKkrh5rnpxQNU+F?=
 =?us-ascii?Q?XbVMRFsBkdGAuTuSWR6n025GGKP4HgxBexwg3+91WnGa3/3Zlf4h5iKGwuA2?=
 =?us-ascii?Q?ogw6YMavBIsi9awktEtgwJhRRDy+Eq7yURI/QwtCnzUbIIn2pSppFzDi/up9?=
 =?us-ascii?Q?d4lMvAfpaMEZCE29ULKmjvpDJLNvzSiyqg8FQ5YkQz+SRHVavP0R5U7t2Z/G?=
 =?us-ascii?Q?fWGWBjgIb72yef5rQ+UO4x5lMugytt2PDXj/RAM1PQENjLpRGxKHdwvLltml?=
 =?us-ascii?Q?cDHjwId57gTtFbcfZ04Qr+picOmoAiKY37lpZSRy1/EXj3ThsOYmNZfQ7+FS?=
 =?us-ascii?Q?dr+rA2koBi976DG6CqK0mwTZjTDA2xCxHDPTrAoGw+wEO2UADqb/fuledFmd?=
 =?us-ascii?Q?9rfPKGt7W2HaF/YXoiCpRBuz2HLu9+bXRRtULiJ4HiNeqqyXEm9i+/fiKeOq?=
 =?us-ascii?Q?DFPBKT98RQyXluQm0b1gjQiuH+/oZQjLs5vyCBkaRuiBAS4ACfHKsjAMiAa9?=
 =?us-ascii?Q?tkwbalDDXyspbBwIJuCK7NrmRgNzIQuEP0PSEK5P0SRs3j1LGeK61whbpIvL?=
 =?us-ascii?Q?mkOpM0CcYDiDIW4BAFv3sWuOigZroEIlGiXOTYFIam+v26WdmVL4LQoM1LBA?=
 =?us-ascii?Q?Mugo37n4jrANNafP41LaMHX1xBvf63qLYiNcMkIQMClqceJSEaZjZ5DFHa3n?=
 =?us-ascii?Q?V8i3r3/6FOzWVmCMnpJDDe3Yw5bzbwjhuJ3TTlZnOW3SHPHzVZ6hQeLHXxtY?=
 =?us-ascii?Q?BDahoF1RqZC+63ZvLGDOYpL8AASxC4oWxrZZKZ5qODPSKgjR0yIbAhzAXFlG?=
 =?us-ascii?Q?vT9ALFK5/gyNzfN1CtmPV8vetr2eDj9ipTIa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(19092799006)(366016)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2b94fQnLKfC09HTy5eerEnSUk8cYo+cmkR4euCbVvBJSjojihsmRHk3LlXhn?=
 =?us-ascii?Q?w12iIrgQ0LubF96QEsBdE22U0b7XP122fSZva42z975vGkLuWt7kuNohvsJI?=
 =?us-ascii?Q?Er/vNYNVpBUpb7d40j+EYWgV1Ue+TdpJIIOaPN0dLx5xI2b3RyBG/VEt5Shq?=
 =?us-ascii?Q?FEyIQEzgDnV3Qtlnx5IRYZENcSV33dduk4aSFNapW3JeyqWfRo9EUdanElgI?=
 =?us-ascii?Q?h0Q9YFM5/d7YwtHEgEUxp8DHnBxGDIj9DFFCa2CshgFinKUxnpoPvQ3ei+11?=
 =?us-ascii?Q?CtZNogxgP3uorCVSBZL1E/co4oN3cJ/nKECBSw8uqlgzuayhq287EMv91oDJ?=
 =?us-ascii?Q?D/YrKvACy5HLq4mRBS5kpt+/xr/BgWoOUmfzpP+jz5Q+U6Pxbk4z8jJ/HNE0?=
 =?us-ascii?Q?mZgThuwsiDaz+q1/bjTWe8T6Dflj1K6lFj80Hb33gOLkk90ZAg50rFHrKOEt?=
 =?us-ascii?Q?MDeSLNaRZOisLa9P1vlBsS0DUo8Y6gd3P+1ePv6zterkudHBwspuK7sRwDcg?=
 =?us-ascii?Q?9MRuTRN1pvlhU9mblq7F5reHN1RQqtBtrm9CdBWBa95eJZHYO0U5CxKpZ9go?=
 =?us-ascii?Q?6DRH9Pdyjx5PZeqo9Fd9pYrlKhMfEU8svSSdVyij2zsXgOszXAz23S2iWgRw?=
 =?us-ascii?Q?lwyDE2JOVM7+vm9sZJnFEn6DilUw7zgW1xjHsY/IlAEDptzitq8Ya63mduLT?=
 =?us-ascii?Q?IVbFZbOqgQyWkwCm8mRNtPq8Lr35A4FWCzApsMPV4UgSyti7Xc4O4/GOp30B?=
 =?us-ascii?Q?ft+PgC8uM3zUXuFMVPbEESsaaYC3IPcZ6rvjK6qmppdznZW5KCrw4sV9XYB8?=
 =?us-ascii?Q?lJs04iSr7U47FAKCzDl8vQucE0llIV6Pl6QLEMsP/UTc7A/qcb2EW88Zsjm4?=
 =?us-ascii?Q?xcmP6UVLr9DNPn6U8qriHxITijCWWUROvMaCFX/4wAvdR2cfFMkkDryudk32?=
 =?us-ascii?Q?1Niv3fvpJWa8EfZq2Tp0H4ZLvGlc5RZtZ8u7BK8fnsKSkZD3vwbqYzF5+QFj?=
 =?us-ascii?Q?7DVmaCvQ4C+PUAE21stH/7GD+6hkXxqHPvbnXF1e3e9V7JHseZsTpfFS6fAT?=
 =?us-ascii?Q?CuHwZYd/Uk/K8Cp+PWvgSdCPF1vkKa+2JHsEu3dOf5nu7xNvX4xDES7DAPOH?=
 =?us-ascii?Q?eMd+wll0OtEzjGoTH4VXeFaCNjPSbaP56JOx6B7553WocP/28AXW/8sPZGuz?=
 =?us-ascii?Q?7WTOebGxX9khv8QaGhcx2Ge2UEdN1ZpguPA4kL4r+TgbfVzOeVoCuj1R9t3g?=
 =?us-ascii?Q?LHW0PU8popawBfVwVtbq2SR1jornAYH6R2kLF+fxHv6ZRdC3Sg9X9As//PO1?=
 =?us-ascii?Q?oIKYbBPs+QDMf9GYqslMuHQIJ08QpnmmlkfQZalF0lfxHdpq8kelcUnBUTp2?=
 =?us-ascii?Q?BYAylfDgDvHaw/3/W9TvOoRXFLmQ2vrJ1T7fT7/nN4YeVJCbe20skmOl0TDX?=
 =?us-ascii?Q?IsPtDyA1i7R7hMi1X8D6xClEAiUoN6JECDWxhDieGk7LX4b/BjF9cq47LVob?=
 =?us-ascii?Q?vGRNtea1k7aoPZSGrqD9yyjfnsyP8h3Lev4ec8si2isa8JRNh9qnc+rKFbJQ?=
 =?us-ascii?Q?8we/oygq8l/K0lU360U=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03d2dce-b6b7-4591-7c6b-08de0a85b96b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 18:24:19.5337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ErVtCTVqmE11LC/0xsRwDREchD4cSV8t/35SXC0PlzYZYU7ypI2XDsJgMs73aTdP/kbJVVpoP19MHqAU5CoGFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7272
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

On Sat, Oct 11, 2025 at 06:51:24PM +0200, Marek Vasut wrote:
> Rework dc_ed_pec_src_sel() to drop ARRAY_SIZE() use and use new sentinel
> trailing entry LINK_ID_LAST to stop iterating over src_sels array instead.
> This allows passing of this array around as OF match data, which will be
> useful when using this pipeline on i.MX95, which has different src_sels
> array.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/gpu/drm/imx/dc/dc-ed.c | 7 ++++---
>  drivers/gpu/drm/imx/dc/dc-pe.h | 1 +
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
> index 9a141c6aa0812..2fdd22a903dec 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ed.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ed.c
> @@ -116,6 +116,7 @@ static const enum dc_link_id src_sels[] = {
>  	LINK_ID_LAYERBLEND2_MX8QXP,
>  	LINK_ID_LAYERBLEND1_MX8QXP,
>  	LINK_ID_LAYERBLEND0_MX8QXP,
> +	LINK_ID_LAST	/* sentinel */
>  };
>
>  static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
> @@ -141,10 +142,10 @@ static inline void dc_ed_pec_div_reset(struct dc_ed *ed)
>
>  void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
>  {
> -	int i;
> +	int i = 0;
>
> -	for (i = 0; i < ARRAY_SIZE(src_sels); i++) {
> -		if (src_sels[i] == src) {
> +	while (src_sels[i] != LINK_ID_LAST) {
> +		if (src_sels[i++] == src) {
>  			regmap_write(ed->reg_pec, PIXENGCFG_DYNAMIC, src);
>  			return;
>  		}
> diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
> index 866859403a79d..1e1e04cc39d4b 100644
> --- a/drivers/gpu/drm/imx/dc/dc-pe.h
> +++ b/drivers/gpu/drm/imx/dc/dc-pe.h
> @@ -33,6 +33,7 @@ enum dc_link_id {
>  	LINK_ID_LAYERBLEND1_MX8QXP	= 0x22,
>  	LINK_ID_LAYERBLEND2_MX8QXP	= 0x23,
>  	LINK_ID_LAYERBLEND3_MX8QXP	= 0x24,
> +	LINK_ID_LAST			= 0xffffffff, /* sentinel */
>  };
>
>  enum dc_lb_mode {
> --
> 2.51.0
>
