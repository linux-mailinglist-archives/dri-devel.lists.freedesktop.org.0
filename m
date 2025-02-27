Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593DA486AF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED3410EB59;
	Thu, 27 Feb 2025 17:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Vf08ghY1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012046.outbound.protection.outlook.com [52.101.66.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D34510EB59
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 17:33:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iL0x0aAaFUThprCr7wClNdm8NYpB3l8K8TOIrjBm+9oP7NGg8VEP2M2y9yBUHPPCArVybe5R5VWAAvpQf8YwAAIL9LhgSjhfFeDzRpc+fhtJhOSXxGLfhs0FNr5iVpqPy7eykNQra/fuYFdvQ3ZptW2n+v3gX3ls1KLVQMQdQE3BiYXCW7OFgXJMCihDE+uHfpAzqnY9hDdZM2Cwy9ShlNoK6SJzHK46ibOnCcehPbg0qIRdSkedLX2eEolD2Y6+FFGBSsdY3L2Uq4HknQfCApfJEUB0SnjBOvZHPTdxrIBe6rJ7jXNQNdDIILwiL8pdUEVb9hGL1cEWwYt+we2gTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Sz4SdxzAARvsY+N3YeRxla4TDuyviqCGLEUvlFmWvw=;
 b=Wj01mpdZVxiCIoJleUb/uxHXzUDdXalF2PaVCVdfdGSHIUYFuJ/s58bvbysCfZK9S6klyenid/h2OlFgQQ7ABCyF2za4w6qB3BFC2Fq6IFIBWNgBBE7ulZed5ZQS2gpX+xscjNsmy2yQ4P/FED4rUXQiprrMIQfC8yiIc04zvLB8zp989bS3h/0sFmnNx31wGGo43nus4YQ8uuNdQBIXL5oFUDAUNZperEGCUKMPmwkQLgOR88IqyzRIzchVoSvn7t9b1fEVV6rWXHyBd5u8CK+iuR13mxRF5F2g+oWx+bqYzUdstO+DV78mvuVze6N6Tu5+oIy0KkqiHFtWBwBc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Sz4SdxzAARvsY+N3YeRxla4TDuyviqCGLEUvlFmWvw=;
 b=Vf08ghY1p5o11ZxhBrjtB+aWy4Ju9GhXvbDZ9I/WbLJ+erBGTIW3BC1hsClSHc/oHuB/d3RwNKE+9lFWbH3DkrOhhD70B018bn5obFa2rMgB6oBeE16YhvyCO6p8nJPgRtYx52ard7pu5muGWTLO7Tu6ibcmLTM0vo2TPBhDsp/ndCsthEOksGs4iHJuGCx95QmMbaFLgyrZ0pi81SfPStt/uw8VBsCf8q2GmsMkBxXEyP+mQjCmXeADP6YwUa2DA2WZtz8o4OY5xbGlbpChvXdgRkSlT2gNeCm0XRG/4Vho7+/mPu4j+fHols+x/ChYooPMham8qJD2Up9iSAP/qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8828.eurprd04.prod.outlook.com (2603:10a6:20b:40b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 17:33:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 17:33:36 +0000
Date: Thu, 27 Feb 2025 12:33:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH 3/9] dt-bindings: gpu: mali-valhall-csf: Document
 optional reset
Message-ID: <Z8Ch5upc5KigzKrK@lizhi-Precision-Tower-5810>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-4-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227170012.124768-4-marex@denx.de>
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8828:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ede435-f2cf-4380-34c1-08dd5754ddc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|1800799024|376014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sdlTkOFcY91CQNFpqv+8JWlimWq5u3EfkN+l/At4FIxe+p4mNDA7m9rHCxOO?=
 =?us-ascii?Q?3Sm/aEbHf6ZzbdpHpR2KuQW9mZItGdpn1v9hPwYgMBjP7M6b262Rfs9FaQPP?=
 =?us-ascii?Q?P6vv+k05z90/kBI8RSYzFs+fJjmMVMVAKnQCrz9M4vh7ME9Uj9Bh9STfMq79?=
 =?us-ascii?Q?zQwkkURRW5ABABeAL2yAJF57W5Bs+wAc2k8WLsOQ6WNRueNEaazVnt+oMAYW?=
 =?us-ascii?Q?o6WWUYnJhaAdLESp7Gb8ozd+QwggABb1pruyX8yOQdzKA6blPzy8lBbju2Sf?=
 =?us-ascii?Q?Su2jRFSgIErufJmroC4qkdajNTpNKYyw/3ilw24C48XNeo8JGI4XttK+W6Ae?=
 =?us-ascii?Q?tHZtvwJS4qXxXeca9BovR36f9iDZWXoP5O0T6ReAhjgBiLfS4Z82BeThcdKE?=
 =?us-ascii?Q?rrlx+taATf/8vpHtd3zdqNCw3ELDAxqKsI1F8c95sujgW4hOQMsRUCOAFF17?=
 =?us-ascii?Q?okS7lQYrNNRHWjrNfgvfNenwlz5BuzVIlnQPn1x4x/b0BF7BB3VZ6QXSyazn?=
 =?us-ascii?Q?lLHMXIPuL55tDhrHiUeOOyMmQnlPIlrBzJi3RbPvP7UxZNa9VRUzSv5AsEH2?=
 =?us-ascii?Q?hpAtMRw0Zv/xE9Qqudq0O3JgDoswjD6f7xN5QfltlXuLdLTDa0N+vLOuoLXH?=
 =?us-ascii?Q?7428u+BE3/bybH0n3aKsJm+/XnC/mzE0NUHcQzT744QOiq1qPh7H4c/47Qkn?=
 =?us-ascii?Q?BXPqeBh1wlUFwE3uikH9vfBGwd75yaHiK+KI89y4JXoRSBJ3O8j3pXeMnI6o?=
 =?us-ascii?Q?KiUOLgxZzh324do5H9LOyF9683pAf8Qx8U67euI9O/kbnXTYMaBcdPwU61ze?=
 =?us-ascii?Q?7fDe7hOfM4drxz+xz9AgiwTU0qoEXsFsFMs6AnD4LzxDfxb4CwXCzxk0A1p1?=
 =?us-ascii?Q?m7VF+WuLezbjpa6wQ2+tn74Ld8RtOrqtZVGlV0B+Nod5VnTLWQZyQrjTES86?=
 =?us-ascii?Q?XRwpKVIz+/4nQRb0+2iDLg3zRHYxAwlBXYVCqG2Ae+hLePTsWTHdAP8dzQgF?=
 =?us-ascii?Q?ETuQlKbJ3QwXCsi6uJwcSoDaV2vmg4LsTuuzybc36btvfnt3u/soBuwpZprV?=
 =?us-ascii?Q?xLxrtfKsryRCTE6ibuCNOjRG3MNkya1i+GdFG0XT/KRguSI5s3ANBQb51+x+?=
 =?us-ascii?Q?esgq5FPLoYsF20yydSb6Cgt2zO7VvODJMsCycfTm1skZQq6Uksy1CBQ0gGcQ?=
 =?us-ascii?Q?WFhI3l/W+khSqq3c3JmZ3/w4xyJMkqOOqY7T3XqK1yaqIHfQQCcJqaC/K7Is?=
 =?us-ascii?Q?WapFCnGta8ywrH5b8lchGoWcVonRkrIUDTgHQG/oFlNQux2cQRflyeM23nxM?=
 =?us-ascii?Q?Qgt9tGfXJTU7wOVOng0LnBtEJDXR7+nZ8NiXN44hVr3wB2G9K7D6FKviFJsS?=
 =?us-ascii?Q?RaGPFhg9NkfBteW5uERLfMoudfF1gTWuz69W7WMQi6nj4zr+nEpy7Rzlo25P?=
 =?us-ascii?Q?rDy6/+NblKmgKwXKhZKb6WJznj5ktVFO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(1800799024)(376014)(7416014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wBGGyI1EW9ljgCQBQXb9N214fojFDaF+pYTtjLoWxwJ3ApXXnHYgQWeNYrEj?=
 =?us-ascii?Q?I0EuH25tAkms07zXzc1Y0wTv8EDsckjUMmGsVBTxw8UBz2xr3+oqMfyamFoZ?=
 =?us-ascii?Q?M2GsWeR38ZIUH+fqumr7McsYlxkj23bvIZojgy9HaodGslQJxYsdrK1zz/8Q?=
 =?us-ascii?Q?d81zFhsH0G84OkX7kwamAD2uAwxj4GQoGrPD/k7C2dWmMbAWuVdi/IuKsyQk?=
 =?us-ascii?Q?msjiz4yMg1+WnpLa9vCZAYgNhO9rnJ/EaKSgHLKN3NOnkrIeCgoy8Yx4jTdS?=
 =?us-ascii?Q?0esGHGwJCO8kz7RjHNbdYHeMcG8LhugVpsscRaYD8UF0RXBZlXovtxp6P+dA?=
 =?us-ascii?Q?fvR8wW5wrIZGNLMLuppo70RljC/yIcfUnUEahTXwPYNampz5o3JbPkawAD1V?=
 =?us-ascii?Q?cn6d+hC0y1w33Nn4HPPA9A1k0690EvXG0O0kT/PfFBpUPR6WFzOlOwrz45T3?=
 =?us-ascii?Q?aiB/0PH9fy4wasRqRZPKpL/thzS8/hnQWJeOLH77CZqsxlP3PqaDul5zyggF?=
 =?us-ascii?Q?iFeyS4RNvnytITOUm4nUZKNEQRUHlWQ5YWrKkXX/4ySOoiGD68J3aEccUGDu?=
 =?us-ascii?Q?jtJtyW2aCgYFB5BwE4n0lTsraG86GuQMpqTijNQNmF32/KfgCSkBv9NlAOLe?=
 =?us-ascii?Q?PkpITU47gPAr5lpYIxeJgS547mX3RD4eK4xY31PvDXlC2pEz2i01yHOpIrad?=
 =?us-ascii?Q?/pnMI3taS2ykqqNl74fd8EN/6+p5KcnXasnyhQpqBZ4P1ITuPrIuPNshCHHh?=
 =?us-ascii?Q?iHDGj/EqD9pcumBfQyccBPm9kq5AxrwDYxXV8VVbSSq5VhY4KNmfSb4yiAur?=
 =?us-ascii?Q?2b93RDlcGZU/4mHXtimMMQSjTOEG9hRB0n2q+v7OC5z9jYvECprQ2DGX3vuq?=
 =?us-ascii?Q?Yp9BBCwZFjulZgAKq6x79Iu1E/Of7FEB9rzvxAAtjK3WFIERElCtTNk1KITH?=
 =?us-ascii?Q?+ZL+5iNwjr09QbbHeA7Z9NKafbiMd/rxrzR7738cki0IIMWf3aHHC24lA0Z1?=
 =?us-ascii?Q?Y84nyrj+FH/h5nx7UUAck6b938dH6cfDnAIVP+P5t+vYavkEcRwCIwIIW3V4?=
 =?us-ascii?Q?vix6dtRmEKwE1H4Zj/Efi5IvZu9QTVOtkzba6w+NH7QD+ku2HMLqkhjf1ESr?=
 =?us-ascii?Q?0ZR828A2x400x5Q3WqGV6SjDw4weCSu7DkQUym3+F4tLzX/g52Mbk85oKzxn?=
 =?us-ascii?Q?lTjSebGLrD5SHiEtPTUFJt9wRzonEcdAyy9JxBb0rMSL0JSw+Qy/JPHYB6t4?=
 =?us-ascii?Q?/wSCYTsA119NyhkugZiTRbEjo+ohQ28+rF081BnjMVQZPULB8iw929zLvvX7?=
 =?us-ascii?Q?55kea2xbHhUT28VmThY936XlF0/j9Dq4ZaLeiCZSwBAKEhTNNCvC71LVVq1y?=
 =?us-ascii?Q?yNaQdiptHsjd06wDrh0Sj7sGe/wg6P0wzkmWXTdg5CtqlaOkBbDde3DmXjvZ?=
 =?us-ascii?Q?3lGGvTs3VUD1tDgB8ykUeicEDSmVxg+lwPRHV80f2UbuS1cC8BXw0PrHDfCr?=
 =?us-ascii?Q?vi6d4c585n17qr8KkJctwykNV/pqCoyVBjs/bF0tfaB1NXCJERlHYKMpiRW8?=
 =?us-ascii?Q?lrwcoZJ5AfiyHlQ/wU+GWQf+UlQU2RXnKolxTtfx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ede435-f2cf-4380-34c1-08dd5754ddc2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 17:33:36.6836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WccP879QQuALHVEhiMsmKb5SSH9CEVHj6VhER9AmcNSkbqzfQXLZFNm3PDZxTg32X5p1F7zsEY7ujaGkMu0Wqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8828
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

On Thu, Feb 27, 2025 at 05:58:03PM +0100, Marek Vasut wrote:
> The instance of the GPU populated in Freescale i.MX95 does require
> release from reset by writing into a single GPUMIX block controller
> GPURESET register bit 0. Document support for one optional reset.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> index a5b4e00217587..0efa06822a543 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> @@ -61,6 +61,9 @@ properties:
>      minItems: 1
>      maxItems: 5
>
> +  resets:
> +    maxItems: 1
> +
>    sram-supply: true
>
>    "#cooling-cells":
> --
> 2.47.2
>
