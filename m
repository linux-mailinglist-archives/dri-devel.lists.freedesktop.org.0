Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9EB0A860
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 18:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9EE10E9F7;
	Fri, 18 Jul 2025 16:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QmvXmLeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012037.outbound.protection.outlook.com [52.101.71.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E14610E9F7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 16:25:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3JbHqYEdTh89JMpyndZkMSDfU8dKJ2u8prjScFlGAGdMD8cbnaGodAMrkS+wbv57a8UOJGyfprlqXm/pZkD63LZUYXhFXeYXP8dDO5asai3vStvcefe5Q7IUZkU7Kb6aYUhjei294emXwhBB4OcLJIn6t8uOdrdLhG2H0qwTpicfeLgUqJuuDqw0uuASO4z7rCCIWyZdYZXBjO2NvdH7Qk+CrxUWCv9B4QqsD3yxYeU49b1i8FLvIOXA8EweYG8N6uV4o8MV98LSVBjwQVOZFDWXBvTzqPfWxpYkWIHLLc2wdOdWM7N4kUMaNI90zlQD8tKkrTNmpblasl++0nyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPc0vJDBAhlOz6r0DLS/mf5IG2IV5+PnS7VItYG/Sw0=;
 b=zLURUemQ0w9TmVMIVvv7kJzMpXHwYLhP+L0IQKyWKDeMVz4LPqQd8/djVocfO8FL1OO5FjVH7r/mmC5OYRn9mv3IGsMcjA4ezpx8mXZ9tHd9Lc7kGNHxPzD10QO66sM5AkEKdJM4xIrgmkZ5LoVpviz1KjyDNGTI0ozjuMlGtnobBE13OhLK3vVzByTAAy/Z03n1hDj1+XsIH1YNVbKn8bIiczJkR+l9BZ5gbzrIc8glv8zQL4owEi4DRhEqBpq/83uUsxjXtxD8JcqJruwwxm9HkAYiGGBlEa7ZGMq3mjnVF+bMVrJ7JByBcNrR8aTlzAKL5NEvrI0BbKxpvDz7GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPc0vJDBAhlOz6r0DLS/mf5IG2IV5+PnS7VItYG/Sw0=;
 b=QmvXmLeFDW6j/z+zWCcmtTuGtXHTmAQ3HjyIQEvxVclnreWjuRa9g9+KXK/MYVoErDGZWOUjOpFu21UDZQoynW4VKB5IVe2xUqW9Hzcnbht5VKUIJz303YaAA9ncXl89uh33xHAmNJZMudgBQW15JWJkXCMNT5rW4IkDb9TC+g9eK0NE5wRInTJeyWpmdhU/TrcvvZXsZPqzE2QuU5n41+fC+4w4qzuh+kNJ13dzrJo5tO/HXMr6EnLjBfGJIDdqBH2nQ65H8PPJU64gCAqrxKudCGpt4tR++zUVHF1nRwOOqrUb2XEiveYHyMZngaZmY7lEr+oEJgbqdp6xFw11ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7580.eurprd04.prod.outlook.com (2603:10a6:10:1f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.26; Fri, 18 Jul
 2025 16:25:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 16:25:24 +0000
Date: Fri, 18 Jul 2025 12:25:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, l.stach@pengutronix.de, shengjiu.wang@gmail.com
Subject: Re: [PATCH 3/4] dt-bindings: display: imx: add binding for i.MX8MP
 HDMI PAI
Message-ID: <aHp1be6omEO8qB8o@lizhi-Precision-Tower-5810>
References: <20250718101150.3681002-1-shengjiu.wang@nxp.com>
 <20250718101150.3681002-4-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718101150.3681002-4-shengjiu.wang@nxp.com>
X-ClientProxiedBy: AM0PR02CA0150.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e96cc2-f820-4f20-29da-08ddc617b2b7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZX5SUMGLphqxe+pV4D93WdB/18UBRJDMAuWhiYLDid5wvd0jILnw1Q/xZJhp?=
 =?us-ascii?Q?AffNenhzaBVE2Lx2BmtmWc8OYNUT/xxP9cGBn0ZP/8gHbrz+BResLQp/8ACG?=
 =?us-ascii?Q?4E+PMEZlYesVRP6oMi/BYcXhnW0drSIbMoUa2FInra+iXy/IY2b/rwbwuzQ0?=
 =?us-ascii?Q?aO6ySkF0iUDxd+7ul5WgXFMJE59550cxV/EjjuDVyRSVJCUHw7xFyyJ0Mhdv?=
 =?us-ascii?Q?ZTwfoCjzkpeya4p0IUUfxefYKLJD1ECtbLyeiaLYyTBFD4nrdZ43va1KYEu5?=
 =?us-ascii?Q?GQJr2tgbtBb0ifnVEwjWfndZnKVTrwWR7RJJI0NRdSu5cAuvvgwhWc+CWQei?=
 =?us-ascii?Q?2PIHk82k8JQyZr57kOzFp9Tn63UfS74/gQHjrmleQc+IStqGPI4PM/rSs/6W?=
 =?us-ascii?Q?Gab0VivM9RhSCXujtXUCi+g3xSD/DV2IJPo8L0HjqDTvkBs0LqCp4LoXkzI7?=
 =?us-ascii?Q?jnoNII06fAfUbzBj4UMocbLZZ+xpRd/L9WwL7gM4Tv14YE8/sKwCtPUAHNvi?=
 =?us-ascii?Q?3inN/mf1JoEmADYQ9thCsYGfK5n+Dg1SGYINhXGuPmwRa3/Rbn0E6XYeaxo7?=
 =?us-ascii?Q?fZkDZ43eiF/buIXzxSV5gK3553maRC1+jHp9rz9qv+JzS6MXLcMnldh0tSYy?=
 =?us-ascii?Q?49AfPpvux8FbVe9IJXuIEn0iBVqwg9bDRz+vNSmc0V/hyrm2beS7eb6c9sD2?=
 =?us-ascii?Q?y/niKYia4baqFFQx0Ntyobfa0OIgU2EGGl6MJCyrRVpWErtTSRqTo0qvryxQ?=
 =?us-ascii?Q?5qzRsE5dRqMl5n8GgpdrZgpEWNDbvl/z+b0ZmNzLjlWpkSVXXoUFFej7goZV?=
 =?us-ascii?Q?hBfxl4Rak08TekQZKtxN5uV3/id/6EoxEXhExmdt4J+W9MmEvyE8pJFxAbeY?=
 =?us-ascii?Q?1Pgf22mK8Da6V0WJZCZQMADh+lUBoyhJok8M/JG2huyzMBRZNPs6f1bKA/9V?=
 =?us-ascii?Q?M+yd1+x8aVMqcWWSxVKTKToqaqVGATJAoBdIG3UCC39U5nbLoeKxTmIlQRMp?=
 =?us-ascii?Q?rBmujIUmm/bYrBzoOcSrs9MYwpCWqCjyxeb746GAI/FTWICkgQB1XmsWIPPD?=
 =?us-ascii?Q?IPUTpsjgif04K4k3S0OLMDTpGpyUYircorzI19Dkg6tyeD4XnGGrH7/ni4iw?=
 =?us-ascii?Q?xyLlLArlBsNIMrcDFft0tthAuADWcBHTZmr7DD9zXxpaMSDQn8+MjEGKKdPt?=
 =?us-ascii?Q?m6UUqs2yZQRt/zS40Ysqmu3Djfkds5G2Id5wA6WG7oVALAxCFOJH7c4Dbz9K?=
 =?us-ascii?Q?9mvD3WPx7Mwb5gTXAVNwZSUrN2juN8CSE1Wktl81ChpZz2MVdGIdjCMf0b0a?=
 =?us-ascii?Q?ebkUyTZHfsBBPY2kp1b6eAOVrZliBCtvcHsUfnKA4mBdM/wObHBt/5smV+K6?=
 =?us-ascii?Q?cOiwu2OzzYAInqW8NAy9Et8m7qxLgQWlomMKAZgI38LwBzW3n5HM8fUFmvlZ?=
 =?us-ascii?Q?xQm/vpi+aQrOLNu5edKtbB1jS8XdHezb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gwX8LSfFUh6lE6jHjL1wgMiUF9tnqsmYMuF8FlGQMVP9gmc0B23Q7iy6Cn/l?=
 =?us-ascii?Q?Xm1Er+KN+BwbB5bH80v672Ybk1fKEzJx02YkgnNGGcDOkRppvu3An3+lMhxT?=
 =?us-ascii?Q?BZRxwWKesJbIuNvVLMnsQRL8CJmF1Eaz+A96dqcRWhJYeUf2FpEXi8pn5rWN?=
 =?us-ascii?Q?RCJNlI9BacjnEE+7/HIcJw0pZPD6sw7VZ9gudRk3kVvj2LTPgIW0dY7IRWJc?=
 =?us-ascii?Q?bH5zYZo6roeAPF6hNRl9bgIOsG7l0bTYkKv54DnKiZz/BpzTeMhWih7DhFTd?=
 =?us-ascii?Q?ckalLNB+HdieDoFe0B0o2+jJ4SxE9LFCGz1Ge9cOoGQ4IXUwG/qyjH3aGiI9?=
 =?us-ascii?Q?MUFvWN9RSz24MRHmb8hnIJ3MDa1enxkNOePeCsHD9CA67DKPyH132OGUhklH?=
 =?us-ascii?Q?vtQDXSx68WGVCroXS7tahO20MTWoTZcLoXx1rN4achl7KeZd2EN4fCYX0yDV?=
 =?us-ascii?Q?eOlRqwtLdQr79/av5SuEcn5EOKIyMWOuGVWeiLFO0SYi4oCRZJCPTNWsXFd4?=
 =?us-ascii?Q?4Uz8seFIFzrjaeJLxgHehZge4qTgECXkyyhNDLSni3qMJ7qXCsiWnABKB23j?=
 =?us-ascii?Q?7+ilS1Pq7oyFjQgLsW6WhCXthKTcXd6mJCiWk/ngU7CWQymrW/VNolUEKMez?=
 =?us-ascii?Q?Dm0pLeMAPr/TjNom2hs4hXFtnZJ818/+SpWIggFwjYfn12Ux9WXDOtfWFgux?=
 =?us-ascii?Q?X+MsyChJf2KTdFjdQTGYtmwu6AFC9HFb03ZpFKCchJXYWrvBQK3+gD4ul5x+?=
 =?us-ascii?Q?ri6YNLDWMQvu3ZVdtkjDOldnATQzx7nCeutw97/fvXN3a/KKm6CSyutsipiI?=
 =?us-ascii?Q?xVfPCEYMrnKrg3my6HLGDsAHA9E1bIIsCoMzWuq8YHtvGFd2XMhD1VKoNB2f?=
 =?us-ascii?Q?JI7Srye5Q7wWEirV58DQlE/Lo8mn/1plxogOLxYfKclXfsvHOd/MxoyEI48p?=
 =?us-ascii?Q?S2UhFppQXWdVOFZolodE0nyuCtEwuDwMdkXibuZmIRbIEh9KD6fs8Oa7r9Ai?=
 =?us-ascii?Q?kRr5iRNI51VKD9KPqm+OO7S6dEn5HFdxNOA1fkZbNyk+44uhh8219Tgnwe7t?=
 =?us-ascii?Q?Ujqd8kF0Ymnp0uEtyApdqwCqgJNrSrZhQCYSSg8imlbS9JCgNLydNDsiv16/?=
 =?us-ascii?Q?Aw6j5wVAISyqGDOjoZ9a+RMSC7VUyED1IUtGh4kfJmahCgf6m7WOLQ+GauS2?=
 =?us-ascii?Q?hPRhriNU6r5stkut2cRm6uaJf9UnkW9wPF7uzZ+iXLBySLpmM8zW/hLMT2Z5?=
 =?us-ascii?Q?RfdTcbLG9ZLk6GivuT5nJMemktHTGcgQ/mCv8lQcmLGHX/f03B9fUoqeN4CS?=
 =?us-ascii?Q?vsw7bAV8Xjw8jpQ0RCIQyVg6zXc1Qrwluv9SZyXQ4AsGjUUHiqhN9gHThT08?=
 =?us-ascii?Q?TYLBL3hK13agi3CXqVu8v4Ga2B8cXCJ3ZXVdoRcK8mKUSwZfUGSySoiFzgJ5?=
 =?us-ascii?Q?NSVaTObRwV6r9s9OFJA04Yh2BYT5P2JRUbkwW+SGuuNWxrGsMgJxUWlABv7U?=
 =?us-ascii?Q?6kskN7JlsdZWsLyLtrgcMO3aCF9V9oc9rCgAFhbwr8JRU4tHlKUhZiVYf2i9?=
 =?us-ascii?Q?N2ynGTCc5d5cc0un8sSVSdqRO0HoIldMO4RFgJ2P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e96cc2-f820-4f20-29da-08ddc617b2b7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 16:25:24.3034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZRz+3R0HOHztHBueGiILy7QRwInXluKrp62dUHKcb6UHzZlAx5wwl5eJ/jWevSlHuh+2SNzrPLMK+XkX1uCwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7580
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

On Fri, Jul 18, 2025 at 06:11:49PM +0800, Shengjiu Wang wrote:

Subject needn't said binding again.

dt-bindings: display: imx: add HDMI PAI for i.MX8MP

> Add binding for the i.MX8MP HDMI parallel Audio interface block.

Need empty line between two paragraph

> As this port is linked to imx8mp-hdmi-tx, add port@2 in
> fsl,imx8mp-hdmi-tx.yaml document.

In fsl,imx8mp-hdmi-tx.yaml, add port@2 that linked to imx8mp-hdmi-tx (
look like pai_to_hdmi_tx?)

>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 13 ++++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 61 +++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> index 05442d437755..cf810b277557 100644
> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> @@ -49,9 +49,14 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          description: HDMI output port
>
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Parallel audio input port
> +
>      required:
>        - port@0
>        - port@1
> +      - port@2

Are you sure it is required?  It may cause may dtb check warning.

>
>  required:
>    - compatible
> @@ -98,5 +103,13 @@ examples:
>                      remote-endpoint = <&hdmi0_con>;
>                  };
>              };
> +
> +            port@2 {
> +                reg = <2>;
> +
> +                endpoint {
> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> +                };
> +            };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> new file mode 100644
> index 000000000000..d2d723935032
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description:
> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that acts as the
> +  bridge between the Audio Subsystem to the HDMI TX Controller.

remove "a digital module that acts as the"

Frank

> +
> +properties:
> +  compatible:
> +    const: fsl,imx8mp-hdmi-pai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Output to the HDMI TX controller.
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-domains
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/imx8mp-power.h>
> +
> +    hdmi@32fc4800 {
> +        compatible = "fsl,imx8mp-hdmi-pai";
> +        reg = <0x32fc4800 0x800>;
> +        interrupt-parent = <&irqsteer_hdmi>;
> +        interrupts = <14>;
> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> +
> +        port {
> +
> +            pai_to_hdmi_tx: endpoint {
> +                remote-endpoint = <&hdmi_tx_from_pai>;
> +            };
> +        };
> +    };
> --
> 2.34.1
>
