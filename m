Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E2EBD5ED3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2E710E50B;
	Mon, 13 Oct 2025 19:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="B6347rYk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C735310E50B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 19:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hkl/X1Nr34Rr/QypHC0zZLJnMva4b4rlmFgssbfWLQKxZxjHVJhtZHBuBqWEk5V/6Vm+mhmOpcIlZoXsiBnjcUvdSBgoWL8R1EnWPah0ASHxBahWF2JhV5fQNQ4cLTTnKthm3MJ/IOIjOZdKCRMQmj92Kq09lIae+ZBIbDpfeJfGBwxCqBLB6GXx4CCvy9hBkM8KqWw4QseYZ2a4Jdiyw5IL8dpbrH2lLY3fp7c/yL2mpa24Rwh7W/9CgXslgLvZ7C4uE15hJr//iBY/7buyMAPGny/3L0T0U7va/K1JDnER0WpcoRSmvpz0/o9ywk9pMbNgnoa87VLHMDqbRwhCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMWDj/bNsK9lgXq8ftIobPZLOcUBzqDRp9XyJSD2r9I=;
 b=vAS0m+CR+hupEloQgbclKGnwvbhfgAJ5M0LfVX6l5zPk7oTKL9U1ICVAQjENtB/pnoaannEQK5Cncwurm5OoSoS86Ze1vnC3J8DrgTYPN+YiyI0MTi5/fMVAjSMRBlMk9P02A8Falgx+k9W3iQx6gx16w5XoBvjvI9M8dQIpH8jtsLXlGfcfGv0vwZQNq0aAGgSwlE6awdNxu+r1jg0U8+zkglBrPo7vJBHqp9KTVMh0BUwqz/uCmLsqint0XKVrWgCHKemOqwEhYCRYpgpHIAi4Lxvs9mGostBHdUlezkI+F1v9/5ELo+h1sHkekN2qz86S2VR40Ts23Q+K8+PyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMWDj/bNsK9lgXq8ftIobPZLOcUBzqDRp9XyJSD2r9I=;
 b=B6347rYkScYFpChJ9jT3QjtCyzBsJ08X8xAWN8JcWfte40PXqRHyjKPmA6ujgp0fs/zfEvQoUdOU2yckGH9+CBi1EnOpk18xk8IFUKCupsFmHh9slMucmM2y/soh2EfGAiWjzGKbTCUCdhK0BscPrmWstOyn7+g1xbFQn8qhjzYxbH6HFOdQzetZIEm6av5Eger9LGLYnJxigf0GjZw/mkmhxRT5CO2B9ejxlajZYx5B4ktjGCyc7rYGCuYwAQxI7fIET+IvUoNn+00XCx9qKTXx73Q1lfJig928C+6ol/6CfX6/FrjyPDQr0GeyR9ND7iACAtGAzlfhWp+3PJZhbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8708.eurprd04.prod.outlook.com (2603:10a6:20b:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:20:39 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:20:39 +0000
Date: Mon, 13 Oct 2025 15:20:29 -0400
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
Subject: Re: [PATCH 32/39] dt-bindings: display: bridge: Document i.MX95 LVDS
 display bridge binding
Message-ID: <aO1Q/RIoMPEpxpih@lizhi-Precision-Tower-5810>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-33-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011170213.128907-33-marek.vasut@mailbox.org>
X-ClientProxiedBy: BY5PR16CA0005.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::18) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 6339ce20-5b9a-4a28-5ff0-08de0a8d97fe
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I+TJsiyPZo+C+bTVo+lWRt33Kj8hI6vtdyPuojL8890s9j6JvlrCMbzPsxrv?=
 =?us-ascii?Q?E+cqbcWmLCghWqD9KZYqy/UKdLu53ytBso8Bt4ObFwEpD8z2psuiAbA/x97v?=
 =?us-ascii?Q?069m0xTmY44gYMEMYwdpVJKqBS/b4oQKjNbwgILkVLRa8bFp8Jkqg1/ifg5u?=
 =?us-ascii?Q?U2U3W0of9I7FhNdHJ3wZf7LWTgKD+0mi1r+da67cy6YTJkIeWPAx6K1/zNdQ?=
 =?us-ascii?Q?Ny3Fp6LAs95g/af3asBXEMg6hF+uoWK9gXEBO3N5TnOgTjTgj9Zi1C2kdtfu?=
 =?us-ascii?Q?H0C6F9aHdyThUaK0aL6Ps5ened/gf8MundnAlxrkIBe1Vit6pSTROS/fXgII?=
 =?us-ascii?Q?FTFYjsdjrQJapYoqEK1UG7fK4sohZDf17fXirapyACmnbwZDs4Gn0Nvn02jG?=
 =?us-ascii?Q?zKrD3N+RR5FE6spzU9FkQwflk4QgUpsD8DIOvcPwpvU35byCoCd3jcVwCNon?=
 =?us-ascii?Q?1tVGRVw1eKHTJr2P3zOuIXZiuJezRvfP1GORNUIEv8NteqT8RoG/mYTNhrK1?=
 =?us-ascii?Q?I2PV2tOO9+ECZq9zo41fG+JDCkozZEqb58ds7cba4PYNCkWviDpU4rwrq393?=
 =?us-ascii?Q?qvG8MWs0dtbbabS9I58KOd/SGquHQowG0sSGJSB8KB7XNDuehpp/kAjlvKjd?=
 =?us-ascii?Q?ZGhz0cq9/xw+hBVRX+3Sm9NgEEBNIumUNu0B/Qve6U7qA1wiV3idisBmZ5H+?=
 =?us-ascii?Q?Vyfs+tcLtXjb1Zue38CqB3f6L/oiDBOh9gUF1/t1N6u7FfgxqiKo5AONQnUe?=
 =?us-ascii?Q?2Lk2zHhm3RuHe99Y1bI04ia+nbEfqIONWdz9CzeYjOdMi3Rkj9EYyCnMJTGN?=
 =?us-ascii?Q?tk3VByYa8fg/gs9hVvuii/QRJ3N+U6AOkeDfajIzg+jkqPX5pONlEQ6P5VhI?=
 =?us-ascii?Q?4/gsDZ0Qg/DSLmjcGtsnYR39rtbC2YWKylLuvDC/LKH1hf1rWaii8jZfx53T?=
 =?us-ascii?Q?KnyRwSUapxCZyACY/3L5TrQTpmKhtZKRKz0+l+gA6ipRSDvZbtI3nePN6dqn?=
 =?us-ascii?Q?24HGNf5Z/PY8LxUGXuWRhkXbTx0apHL3oRQc79S1cjX7KdY8taKoIra13HRK?=
 =?us-ascii?Q?R4tPsbAFW5eFTHypr4pDCcP08vEZJ5o7Dlemk4AteAM0DlqU52UHZS7pKILA?=
 =?us-ascii?Q?gTlJ5FHT9qJ8EMPWGTYJ+6pRG497nGaCvltKZcnTbbof8Mnb/dTcyz6R/KM3?=
 =?us-ascii?Q?tVP5r7xVs2ek6ZbBgyB7S752A8dK2ZgmPM0Oa2Cy8Txy6ju3AHdOwI/qyRZC?=
 =?us-ascii?Q?DzwWKKSgxGlC9ov+cCsZ4KZefROLHfTyBAlLMAy0uAkTDSnbx1XAyvXRgSzB?=
 =?us-ascii?Q?/Jv68ijCj88WSVDqd8vo8jaghQZKGtwRcaYNU37gYCTr2T1ZNy89m1kjG3gl?=
 =?us-ascii?Q?2vnt8fZqygweyV+5y39adPa/eblue6LDw4K85YN0CB/2Jk84NkEz9blEIlid?=
 =?us-ascii?Q?hVSktcEYwgyPRaLNFhYLC1ir1DLgvPGi1z0UuqObpdTbyTpEA7XL9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xeF9/frUm5a5/WwVHqHCyvUVC112UJ4IVqemHq0ovNyTLur4LpogyyK5balO?=
 =?us-ascii?Q?svTPkqNpENHWBpnxaE5hrELbeGzSv2TevwsoPkPoc4VVFCWQ0Mb103Wpk6hh?=
 =?us-ascii?Q?BMaeyQrckgp9n3f7KoaPrX68LqO5IvJh9HrFlNyPZiXC12+k6ku2l8XoZGng?=
 =?us-ascii?Q?ovkKlz9ovksq2lOfO3Sn7KeNuRgblHpWgQd7nnVw7yWklebhzawbu7e7yI28?=
 =?us-ascii?Q?oxthEtwuO1P6Y1dP4yfbtGE3qEGp5xCTa6hududsAnb0eQpVcZRa5M1KSOCk?=
 =?us-ascii?Q?G24cG0Od7s7TxH7/Y8E+M9Au5LHeFOxg+9wJCr3MtikqXG2c8+LbWDHJE1qs?=
 =?us-ascii?Q?HftT7VI8OEe9z6woI9uMSNH5anUHSx6rPftSlwB/Rr7/Ay+O8z+6HVvxroOs?=
 =?us-ascii?Q?24MmPxJbejNG9JOIwPp2DSHGro504pOFqWoHDEy/0hlqCF11eDxA+59oRK2W?=
 =?us-ascii?Q?A3/Ki01AzAn2MSTPWH3zEGvlSGPGL2oGb/0dW16onUuv6IHfkoiDXbmX+g5w?=
 =?us-ascii?Q?jnWr3tbbFeoajx5hY/+yF5FiNIXnrqzvcack2F+EPaz0hPplueft6oMFDv+p?=
 =?us-ascii?Q?e42zMh0YbEnfKxJ7foyYmCSSmwyDSR9XB23qN1GXtATVUqnmn/Sdk8onnxi5?=
 =?us-ascii?Q?Bmg4fdS7Tjm3PvJchOVj8BnSZX8KK8TjC+2qedeoecRm1mWkyMNPepACSuwa?=
 =?us-ascii?Q?yIREmUIEDSIf0xMbYRhdtiFY+ensPx1h0HtIxWuNSdFUq5oW/7c3hK3UT19E?=
 =?us-ascii?Q?V538GkOQoSyikr1uYuX5EsqbS/UBE3GDYZeila0fNSf2N3oXLftvuFkiGfO8?=
 =?us-ascii?Q?ZmFXDQnvww1Cga8aa59iKhCqt8eGs8oj4QPFjRJhbqMYIz7X4dF6WKaRC5YW?=
 =?us-ascii?Q?llmTRzKk6Ab0EcUllGDvc7SCpYEWEuwBED5tgmwtYKQlrUkqF56I0iHHBBOt?=
 =?us-ascii?Q?0XoA6bnZs5y4MeA56j8BFYZbN4k9NzfAh2XOGU5o3Uj4hAGHi2Dk+Vl3wrYs?=
 =?us-ascii?Q?JyUVY1PVChxWGYC6feXT6Q6S0bpyIJ99e7el/dgxzX916i5qYzTHQ1tgsLE+?=
 =?us-ascii?Q?toiXqNvppSs4ogwjj+KSNUw7AhmMZjz3PneKN7Kb0D2nDSrteaFIbpkjAzrd?=
 =?us-ascii?Q?t92UT/MTG/sP4B/RLyySfAbxnQic1ALxRrEF76FSqqis2whnNhhl4ImKbCzz?=
 =?us-ascii?Q?xxTjF3yQOPbnKBthhFz++S18Fwvsgp/j5xr9rxTa3VXAFxzIsFnxeae3Ye+3?=
 =?us-ascii?Q?YQZvInpMbi5P5/8mUF43Qem/whotB5Oh4Y97AMJnWz14AfS2SviPD9yavHKH?=
 =?us-ascii?Q?MSjVUegBDC6ehYZrfRP815yVspfj8Wz/t3RSNes96hVaPNlNKyYeNWuj1Bs2?=
 =?us-ascii?Q?uZ7TB2PdISefS5mGDHNu/CAXndanRLmBVC5ykIUELIbab0ElzYt3JbQ5YAZ+?=
 =?us-ascii?Q?/Gsm9494kQpgKYqL/KmMddIrvAniKec9OqCk60tgQ9z8gqxfPc98n8IEUpNB?=
 =?us-ascii?Q?LHRAw7+N7Dq+KI4lIysR3wZH5DvZA8roA8Aup35LIuwNOggGWvI2/rn4ei0t?=
 =?us-ascii?Q?olY9Zgnxsm+IjVRf4V4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6339ce20-5b9a-4a28-5ff0-08de0a8d97fe
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:20:39.2582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDgB0sXvN0Sb0q12XY04QYDA3ZKGanavOdXHYa9pQLvWtl1ATcO01T6At22oIEbzJaCQiDdg0CpPJyNTAEA+Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8708
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

On Sat, Oct 11, 2025 at 06:51:47PM +0200, Marek Vasut wrote:
> Document i.MX95 LVDS display bridge (LDB) bindings.
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
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
>  .../display/bridge/fsl,imx95-lvds.yaml        | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml
> new file mode 100644
> index 0000000000000..8ada9c82a10d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx95-lvds.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/fsl,imx95-lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX95 LVDS Display Bridge
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut@mailbox.org>
> +
> +description: |

use ">" instead | here.

> +  The Freescale i.MX95 LVDS Display Bridge(LDB) has two channels.
> +
> +  The i.MX8qm/qxp LDB is controlled by Control and Status Registers(CSR) module.
> +  The CSR module, as a system controller, contains the LDB's configuration
> +  registers.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-lvds
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: ldb_di0
> +      - const: ldb_di1
> +      - const: ldb_ch0
> +      - const: ldb_ch1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^channel@[0-1]$":
> +    type: object
> +    description: Represents a channel of LDB.
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      reg:
> +        description: The channel index.
> +        enum: [ 0, 1 ]
> +
> +      phys:
> +        description: A phandle to the phy module representing the LVDS PHY.
> +        maxItems: 1
> +
> +      phy-names:
> +        const: lvds_phy
> +
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Input port of the channel.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output port of the channel.

most likely port@<n> should be under ports.

> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - reg
> +      - phys
> +      - phy-names
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - channel@0
> +  - channel@1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>

Add empty line here

> +    ldb {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "fsl,imx95-ldb";
> +        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> +                 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> +        clock-names = "pixel", "bypass";
> +        power-domains = <&pd IMX_SC_R_LVDS_0>;
> +
> +        channel@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +            phys = <&mipi_lvds_0_phy>;
> +            phy-names = "lvds_phy";
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {

needn't label here.

Frank
> +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> +                };
> +            };
> +        };
> +
> +        channel@1 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <1>;
> +            phys = <&mipi_lvds_0_phy>;
> +            phy-names = "lvds_phy";
> +
> +            port@0 {
> +                reg = <0>;
> +
> +                mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> +                    remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
> +                };
> +            };
> +        };
> +    };
> --
> 2.51.0
>
