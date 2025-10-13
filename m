Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2F0BD4937
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 17:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6246D10E084;
	Mon, 13 Oct 2025 15:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="e2jGZahp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AC310E084
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 15:53:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Swle5RTNYcnx8lVU+26rf0kk5aQJZdGGzvAcfTxM6EMm+5/34IouT0Tdyb2/0LG0uESb4UAWbXUJibvbuH6ox5hXoh7bndei4SL2pPVRzw/6RXuOgGP+OWgDZ/mgQnJCIqmO9NTuV1MFk1+yLWz29lz7RARYYRYcYdrznQ1uY64LCxP/RRbDQaMOf2JaCJFndj8JCatQMfcvZAgz2TqCdZ4y8x/eBFszHMW02hTAZYmzInY0SFBTZyM6bHlsU30Dd25DVGkgZnpdJK4Z3YvmL0wRcw1ZbLS25yeloK5Lp6RnRZYf7bRIH5qO+BU239E8eA6XH6pz1yE+fKOuBWuvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbPbfc0aVm5bNp2C/i2ms303pAKpS70GwpEy5Rz9+xY=;
 b=NyfeNzJCyQDcu2KOAelYIUhauzNmVzPq783WbOwKDnGByI66FOFGHufOVeebKrDedYMRZcj2L5vjRh83S94Pj7tGNald4vM7k5o9HjuzlIrNZB4K8ayCtv9tgPfycxYmgRjZa4hrGEMhYi/qbXtMm1Bn4eQ6ugCDy6lse5rpuDGeQGMH4s3LfP88Nad3wwkVTaNaJjQFnMER+vEASaaGPTaIetYAfO27GUv5eeTTknBonBycypatlOBmwyg4CD9clY7N/6tG2SH9tK7Jhp6sXgtD3aRPRDLE4GKJMIkF1DT+WMlSEyg48dzViFfucx3l2M2ld52suWtQc2tr9J68Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbPbfc0aVm5bNp2C/i2ms303pAKpS70GwpEy5Rz9+xY=;
 b=e2jGZahp1J26ryF5c7YKiBAXm2S3uuNNwB7MdIR9gjhCTc/cwTYMcWLBO8HRoZDfWddwhQspiNtEnj9b3pHg1RVp2Wt5ghxDGHL+rhXuhDtWz4rNjQVUyTd9yqXt9eGuh8/83gvyT+P4S3WUCjX5BgUCFNX99hAUQqEhBRkslyPUpWU2STxthb2qLlbIeqGYw5nCB39xOHdxgWhA0WJljn6K/uFbQLhw/RAL0yBMqhqlgNXP3BZA63MI9vFJ8YKLj/ke3puoFEe9VoehxqW9u8536b65phKclqZCG3oieQxW3psugvOgMldWIGVDSWzsndAoH3Hhuv/MjEDVAHnESQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU2PR04MB8583.eurprd04.prod.outlook.com (2603:10a6:10:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 15:53:45 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 15:53:45 +0000
Date: Mon, 13 Oct 2025 11:53:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 22/24] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
Message-ID: <aO0gfGn+F6iQBaP/@lizhi-Precision-Tower-5810>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-23-clamor95@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008073046.23231-23-clamor95@gmail.com>
X-ClientProxiedBy: PH7PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:510:339::30) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU2PR04MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 4401d476-0d78-40a7-a706-08de0a70b08e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kiCEUJAbPH+Dts8qcAuLgBl8IVLJcrUYEuL0FZ6v1mLGBwLdWN9PV94xEeRf?=
 =?us-ascii?Q?aYUNSEo6oUxKifOXZOTWvKGJ+QVQYbBnUcOyQbkjRy7yFj4KR3/k7rUdqu+U?=
 =?us-ascii?Q?HjY//ksmpzQVhx278uDinsUYolbdFSAeCU0GxzKxrUS9O1swfvUpHqTVNb+Z?=
 =?us-ascii?Q?4X0YZLXYX7e42/oG2SUGxI3k22d2NPlvrk+j+/YfZFY8RVBAFFgeDA9AahsW?=
 =?us-ascii?Q?qDm9MMHi3CZ8JbAuZscw1AKz9oxuvKlkUAtCEIrcTyce/5Q6kxaoEjhkmJh8?=
 =?us-ascii?Q?aJt00+k6c/Loyjq8GnsQAZu5MhDUlz937KjcG3sx44knJgqUQlkkzm/2Colr?=
 =?us-ascii?Q?UG7Ng7A3AUjIVuRkM+w9zI977nzEeKS9XfG59fR+552FfGtQxWzYkpwP1fJd?=
 =?us-ascii?Q?1+t0yDZvleE3Mm5i0GYO0LPDstlxURbpGF1RxTx4cwchAVltGv1fRhvwUgfy?=
 =?us-ascii?Q?25WA9oMK5+4azNkBvHu2pyaeCF9dBrskHr+tCVDbVQovTpZ6q5XgvCBjjArE?=
 =?us-ascii?Q?JtOSv+8o0TK3vsCxHj2npDAhfJ5XVcyoGonCBxrsGMartjNa3noBuKpIhdDY?=
 =?us-ascii?Q?fZKQ1JJRQC2aF3u6A5MkR3OJx6VtxjOMzDogDuzdGHFvud/DnVeDIcxJLxSo?=
 =?us-ascii?Q?AxwT05lB9agv3IbgE7adAt9JmRX/r1k9T6bayq7jQUunbjqmhXFUE5Pjcv26?=
 =?us-ascii?Q?+ScQfkEJM4Dld2aJVmdChCBhh5R6yHe6bf/vTbGQouIElpwhubGTsUemuAyt?=
 =?us-ascii?Q?S2l1aKjsoyGa5NCVbO7LuZr25npKlFwKlZiJqYhhAdKnDeeHSfi8h4VzgCPk?=
 =?us-ascii?Q?4rWhmZzNmKixIZOdk6E+Yzg6tcRuWzfwcYylu+2V6IRQD+9fhhh+OlbbwgSk?=
 =?us-ascii?Q?PmpSrDcoFO+qrBnn4Ese6ShdowJhddw0rN7TnfqXVEJxae3wIOujO6j0h4AH?=
 =?us-ascii?Q?6eSrbXpldFxwA/HbS68KrnAawZJbq/dsu+n/n5ycHycbDTidzRKbAXket7LG?=
 =?us-ascii?Q?L2e+WdLdABpFQURg5uqvyaS+AsS4PiRGT3DI58udtoSEdRHvOEOvIpA/4w0g?=
 =?us-ascii?Q?DN7VtuWoON32hSvNScexYnKWXmeNmwov8iByoEfuuMgsm9rffyJZ1GnTOtej?=
 =?us-ascii?Q?wjb5IKjD+wb3RgN4VoPCFzqjATHmSD3ckPuS83DCjYPsqM4Ziv9Qb/6IXKSr?=
 =?us-ascii?Q?AaPjC62VKPskYgxChEbESkSwIt1aLXOb/PtWeWhIl/SoiI7c6mf9l1Zbd9FP?=
 =?us-ascii?Q?SR/Y4aDTB8cJtKOCzR2sW7EyxpqOQDFAvdF1XFi6SdK5ogtSXdz0tiFLIwtL?=
 =?us-ascii?Q?pb5Ar8UuXHr1uysFYe2jAh3UNgeR+ZT5c3gMz6+pCWIce2KHEce4ua5IdQsg?=
 =?us-ascii?Q?+fZhJU4tEnKGdNLz2QN8FDtVV/SManKZaGNTrt4DEHatCl+argEkQxwRdQbL?=
 =?us-ascii?Q?tOLgqYLel97Z5QHhIH4b9g08l1POjsW/cWKvSGzfOUPiirkcpDzDZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(7053199007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P+jiQ+UtGH3Au+oSlTgBkXxXW8q+jaRrfhJN0UNWRaqydhu7xpYRL5NYnigF?=
 =?us-ascii?Q?5ZHp24N/DeBXqTh8dtPyROEIIlosIc3F4UQIF4oVDEQeN6JxcdkVeMXFg49d?=
 =?us-ascii?Q?PpsG2hx+UpEOhF6EuNON/76jK9owMHSqmR4+auhMtpPMiHzVnN5yur52DieR?=
 =?us-ascii?Q?+rrJtJ9YI9kYmevu1xyDUltUnWzNDlsrSyjaGWaozKQws8xOD7a7G6NnqasC?=
 =?us-ascii?Q?WBbJmwCfow+sL2wBVjcGp+IDmqyFA5NSkdq2hb7K8IdjrEKKMIL+DVVVnp4l?=
 =?us-ascii?Q?J3wpc3PzCX31+wdYpbndhx4SVwum8datzGXLqrnvWO1ZK2TbtoWpiDHxHs0Z?=
 =?us-ascii?Q?geTrmY1W2V3bBRmxBkstvL6xqfk8XtjWclhRx9ZCRaUSBqiayj/XcWp8IQMg?=
 =?us-ascii?Q?gCKC+ayZ3yVxKA3Qq7fABZQsIay0Ww+WxzEFQnMQtG2Qc73f0rKMokqgaFmy?=
 =?us-ascii?Q?QAhRaHWOhDAmCCyNv/MZ2Glzw3vQzy3kNOIv6ULBsWULIr1YPe+CCuXb92wz?=
 =?us-ascii?Q?R6objkLzqihlDu4fGh39qX4jCjUp040QkPfNNDsfBuIkqwjJ95cIgO7RHAg5?=
 =?us-ascii?Q?whq0GsTuNHy1FbiybiX3/yZlmzQOp8Zu0dNfh0+bsPs/VUyryUcsrg/Z0xs3?=
 =?us-ascii?Q?ktPNI1DZuRbaWsx3cyOut6EvWavBuOHPzLrwKhbZDvEENb2uLedP9qsdamVA?=
 =?us-ascii?Q?04UzMey/07v9y18R59mJRMII8KV+wznXicLLCGAozLieA/EKGqAbywkZpur2?=
 =?us-ascii?Q?C6NRP4nS0iobGJ5v9SiHkWnyH2BPMOp4cd8Z5RZvQlPFb1eaDCjMLzneTbKw?=
 =?us-ascii?Q?uUJhsnaEdg3aXLeMNDHM/Sa1xrrhpSGVXyvUXIsdyHEJDUPdqJGLyCu/9+/T?=
 =?us-ascii?Q?pHZ2eKbfw9nMqc5pywH2dDJz1A2C8OEGa2Pzbq5WxUA2O6ojHWNtQtzIznUb?=
 =?us-ascii?Q?4w1LOq3L4sL5HZtcId+QVg0pDkQ3TdC51omf28bm22JjW2Tfn1gYWcu+ElTq?=
 =?us-ascii?Q?BSkHnMRgB32BjgL+LMShtPbY8kavXqIYMmU7dP/CZx8fbSxz+dLZ7kjBJd6j?=
 =?us-ascii?Q?QN3LXN/lUWPSwkCx4XSuspTUiG+Ot9d97LSW2rg3IWBC9ggqp2Cyid7SdKyX?=
 =?us-ascii?Q?z6SugOP2zxKb3hY+LU/D1gAkTYb4xZlgkyLTehQy4EI2/sYQKns1PQkHw+mM?=
 =?us-ascii?Q?CM8bvr1A3B7Ux2THuVNI6hu7SIJMPhjGBP6DtzxNUizl5fFr3wewN6bq85Vi?=
 =?us-ascii?Q?JjR/1EvtFFUn0zh9sfGfrKEp0dEQazU5EwSWtAAyi7Djhg6oFWeVJ/Z78z9e?=
 =?us-ascii?Q?DOKn/VvxzCvbYiCooCxXc/UWqQ9Z0pV1Ma9fT4N7UvVzIX0w7Gq65d4RFsHG?=
 =?us-ascii?Q?NJCOqtuydhA4I5kkZLi7nyXGFZQcsnINBlcVenRt3Hu7bgjLu9BsG6ADi1uV?=
 =?us-ascii?Q?PIhKUgyAWr2FTpDdi2OB3a8wlMyXnD2hK6+bON21WqjwntDs62HmvjNbIcae?=
 =?us-ascii?Q?RMSWuibum0FxHppLjYhL+TzO/GIJ7uTo76Ww5Qp2T7iyyeYD0Wiz8nNDGMAU?=
 =?us-ascii?Q?GyU98H1QGGy0P6qjA2TYWJVsEZoyXBg9ksZ67zxW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4401d476-0d78-40a7-a706-08de0a70b08e
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 15:53:44.9843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlBjdPSydaaxZDWVN0UGYiTC0xfL+XC6dyPwtZ4+FFxo58EHRbk8CuAQN9F8naQJrSovkk8WCPVn/Xg9Q7QYfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8583
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

On Wed, Oct 08, 2025 at 10:30:44AM +0300, Svyatoslav Ryhel wrote:
> Document CSI HW block found in Tegra20 and Tegra30 SoC.
>
> The #nvidia,mipi-calibrate-cells is not an introduction of property, such
> property already exists in nvidia,tegra114-mipi.yaml and is used in
> multiple device trees. In case of Tegra30 and Tegra20 CSI block combines
> mipi calibration function and CSI function, in Tegra114+ mipi calibration
> got a dedicated hardware block which is already supported. This property
> here is used to align with mipi-calibration logic used by Tegra114+.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++++++
>  1 file changed, 135 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> new file mode 100644
> index 000000000000..817b3097846b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-csi.yaml
> @@ -0,0 +1,135 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra20 CSI controller
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra20-csi
> +      - nvidia,tegra30-csi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks: true

Need limit how many clocks needs

clocks:
  maxItems: <?>

> +  clock-names: true

Need provide exact list, I saw you provide list at if branch, but here
need provide numbers limitations.

clock-names:
  maxItems: 3
  minItems: 1

> +
> +  avdd-dsi-csi-supply:
> +    description: DSI/CSI power supply. Must supply 1.2 V.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#nvidia,mipi-calibrate-cells":
> +    description:
> +      The number of cells in a MIPI calibration specifier. Should be 1.
> +      The single cell specifies an id of the pad that need to be
> +      calibrated for a given device. Valid pad ids for receiver would be
> +      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^channel@[0-1]$":
> +    type: object
> +    description: channel 0 represents CSI-A and 1 represents CSI-B
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maximum: 1
> +
> +      nvidia,mipi-calibrate:
> +        description: Should contain a phandle and a specifier specifying
> +          which pad is used by this CSI channel and needs to be calibrated.
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: port receiving the video stream from the sensor
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: port sending the video stream to the VI

The other systems looks, put port@<n> under ports.

ports {
  port@0
  ...
  port@1
  ...
}


> +
> +    required:
> +      - reg
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra20-csi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: module clock
> +
> +        clock-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra30-csi
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: module clock
> +            - description: PAD A clock
> +            - description: PAD B clock
> +
> +        clock-names:
> +          items:
> +            - const: csi
> +            - const: csia-pad
> +            - const: csib-pad

This is new binding

at top

clock-names
  items:
    - const: csi
    - const: csia-pad
    - const: csib-pad
  minItems: 1


here, just limit number

  clock-names:
    minItems: 3

Frank
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +# see nvidia,tegra20-vi.yaml for an example
> --
> 2.48.1
>
