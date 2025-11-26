Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36572C8A275
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE5510E533;
	Wed, 26 Nov 2025 14:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Qv1xG2iG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE08110E533
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCmoRYmJyyuIhGo5cFAvHIkwjWhdJ5yrEUDnaMtDPXHHNBdkew5mEkqoOODJ3S0rYOxHpx+VNSnJ52NzMpEW0CZTTIzwYOM+Is3yKzpi6oikQgNkJRd+93fWAyFaiN5yMAuP7pPhWkoOwbs0m++aKAnwd0D19lstCCRXu1Ldt3D2j5Nb7lXHnZ94nWumqRr/XTnQLq/k1H/LtH9B2wIVHM24veQG4fe5KVq4NPsUkuTWCmLSNEbPaF/a8X/wIvA4cu53G6PazoqseKXW6mzsq136PG8wGQ8cvS0Ytqc+dE4he0cFSwdi0h1IWXXUiyCgMom1uV1PQXMtPOr0rXDHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHc0f/cYPFRoHwi5avsRmTVGUb/PF86lI361FW7x9IQ=;
 b=PDyHpPtg+U9VcEdneDvFiDmxnJz4skkQTXqNBMwkQNAju6KlXeIAdVMdgChgW/6SRW8MK22uEBg3UGHyWBtV9/sm2MEE073BpEWzbLt1PtnzeeO2XDRulHoiA/fLer0n4Zl9EaLvMWTBrIpbGAvo2xcfIotB6aqK2WbmGClBgmRfCKS3LP3lie+wzXBYRANxc1LbTkLrrdPkeSqSIxfKFYVUXZQlGvjCc4VOM9LlvjuwSRsnOhgkes+6/0ndvyuFxzqPR57QuQCKl/6I3Pv0C0mUKuClCh9xvSHcKSCBdKqrQxrDVJqlel4FLw60DCa0NOjIMDDu/RWmv1G2j3IQmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHc0f/cYPFRoHwi5avsRmTVGUb/PF86lI361FW7x9IQ=;
 b=Qv1xG2iGy4L97W4MAepaDCQJIDc1YfUBG27nsYDOvBj7taKgbLF207eZRMJOOMLETqXo5P0zzojthLxyvy8BarOoUPf6QSENpu0hjdQD4W8fV4OqH7a+eK+J/eq9xn4yumJbqDFCMi1j9xq1SunM1VgvvoisqEKrJ4j+r0j2qaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:08:18 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:08:18 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 00/22] Add support for DU and DSI on the Renesas RZ/G3E SoC
Date: Wed, 26 Nov 2025 15:07:12 +0100
Message-ID: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c8cf8d-5a54-4a58-40b3-08de2cf53fc6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U1+ihpzil/NXn/sDq2EPL3vAkGRnU0D92QVE2UUm4AFnmRvebhjEcCgy5wHk?=
 =?us-ascii?Q?FOjqnxWcWvS9Ak0H76WL6X/L91VvwqINSTpCm75aOku5qmI860Fu8RSZOarr?=
 =?us-ascii?Q?Ac38gaHDkyKuy89a9hBOFzi++frROAOggVOmCZtUI6XfEYhv7f2bY5if0ICh?=
 =?us-ascii?Q?Pg0CJiLk4gpTxkkYZfMggDf2SpoVQLC9zlZNzNg9sygKFVmtnDxwXuf5T41Z?=
 =?us-ascii?Q?VldaevPn52nwBKxXZ+KscPo9tupMLg/6mGnf2C+EmjQWho5iJ1URbcS53ls6?=
 =?us-ascii?Q?lQqO/Xau88RSp7O+yfPsxkFyUcX6gijfrczeLEz3r7H+RdwvXVFeWX+NgjwN?=
 =?us-ascii?Q?RWh9vDb3jT+qAyepeJio5IjP/etxeaf7Deu9QrflQ+YDwwLVCjtfIn38pt5E?=
 =?us-ascii?Q?wW0SQKifSIjKxTzsF7wQA1Ojg/iFuiIhj80n57AOQ7gCXnSI7/d93PVI59e8?=
 =?us-ascii?Q?bCp+nwRhSXUX9ErjHNGU9ae76uXBT06F24dqa0n8xDKOR/9McYHEJ6oFDFxk?=
 =?us-ascii?Q?Aw0ypeBsLDDi2zN4jhv22V7Hdown3l9vVNKGoMbG8+cYJx2EHB9Uxj4/7MUJ?=
 =?us-ascii?Q?Avb+5w+uBerx52esrCS2sLClAoSJ5D0ZOlIiWg16ft6I0ZxLTx34nedUKf4b?=
 =?us-ascii?Q?bGV39L2+AyjMPXAdNvEnDgkUqrrPe/BWggriwWMJY6Jxx89IpYqFslbHiXCp?=
 =?us-ascii?Q?axt/msFFTbHbqBzAfpxjblAO/1+0S9Xlbs9SLdHLxGRpF1YAIoHd6W43HhR+?=
 =?us-ascii?Q?LoxDc1R2BOp9dAfM+xh6la2IwUO4bfNMVAemKSGEx/csGUg764YjBgOB/mm6?=
 =?us-ascii?Q?lTVF+xCWhrSJXr1pFXhkmpmLAsCfmxs6ZQbfH2+N925rWX7TIc+uJf+4PrjZ?=
 =?us-ascii?Q?hHF4n0JJSAg4CoM3QUahiA+rcqvnVO2+N98QWAq7m5uSgMeSaUhknuh2c7UL?=
 =?us-ascii?Q?rfJkn61xWxfyWvHCUl+SRCzVr7TY7n0ghETJZia67wvnJOHSYimnR2TyWGZi?=
 =?us-ascii?Q?xYS1bmWMqjlUKpXIpvAYBmclT+jESbvh+aKgzBtpaWvzgxQeC4ECjYJWdhmV?=
 =?us-ascii?Q?aQDpjvcWrsAmZDiGe6L1z4AtoXI2jiGBOUYt/3GS9Q89rGLwy12pAGazzuJt?=
 =?us-ascii?Q?3v2bf4H1GHjF3iGj83vajTUC5A53fYv6d+syNOMnhNY/jvVIL06kAXOBZxzd?=
 =?us-ascii?Q?9gkKAQGplDpiO9SUKCuuFJqPu+ZxdQEGeSw4Dqn6tu0pbS+O8M8I77YG9pb/?=
 =?us-ascii?Q?d2cjIugx4ucKPkxIZMN3tH3oNFKzXIMbhryK24m8ZXexdXGCi+90Ri3CF8q+?=
 =?us-ascii?Q?uQKvSNa3rZSLj4iWIPmkFuz2drrmERwqXT9Nbqn0E79lZpMFSwn9ZFGOJktm?=
 =?us-ascii?Q?uwdieIzwBN6f5U5ZLkucl7R4xqELJ4xODrNToqyCTjn2IGW+bCsn8jXolf1N?=
 =?us-ascii?Q?P2nIBf+wfEtvrxcDwGCHfiXVFkBHvSPOHoRuSK6E/aN5pMhmJdhlglVGldWS?=
 =?us-ascii?Q?TiusUtPp26/xXRpgQ+D6AuCxHXDRNQxmHT4d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kg8RWHX7j5GGLKhPKskTrD+kTGf/vT3q1Z9C4bv0BJIrAtvcMzKfFnDz7HnA?=
 =?us-ascii?Q?qzObVy+DdNr3oq8EOOzyEJpnfA1eFSs76HCVyQbf3aPBTNnyYlOXVOlkECnh?=
 =?us-ascii?Q?s8pTFhedi6c/GCQZODX7mW8n+V47HGMRTrljL4XjBgS0kCxqFfXSYYTZ0wO2?=
 =?us-ascii?Q?9M099yuvZ/F+Ap8tJ06gzemHqWceRH0f8BbL/9gYevv6YIS9rucPr+DyOwpM?=
 =?us-ascii?Q?dayuV8bPrZBsnuS92xzg8BneOGV0NzBPDEQ+rv2GSLMA/z4p10cILhrfrlKX?=
 =?us-ascii?Q?/6TBqwgAoZMditwi+ZFUmhqm3a3JYYNwian+MbAemlOxH5v+TigISURH9rAD?=
 =?us-ascii?Q?zWCvtBYNAsvSMxXLkSsdxXJ71oKhrS9BVc688Cb4MpXO99UdHIj9ZtaJ4zuA?=
 =?us-ascii?Q?4EMbGLhx96JyRKkNcvVJvZ4VFySbWNg7FJdzOXc2GRnn4rd/oGTt0Tq1+M9D?=
 =?us-ascii?Q?VbAQsO7gBY2v55yS5AB0ynew0U42vx8YjVwlvFgBsSklbQHA4b56skjcHLjq?=
 =?us-ascii?Q?IIRYNdhk9II5nwgxmjGv2Sck7+2hxSMFKWsq/9kNduUbGghPgzw/6d+CUrGv?=
 =?us-ascii?Q?FYFKx9bQ5X8b+ok4n1AS9Yi3lhN3ZdpbwEqNNcMHdT9TrbmkcD6oqj6XrTkW?=
 =?us-ascii?Q?kyYYIGKx+QjY+lCVRNKo0Hcy/VEvB78TqC9A8k83VzFbKR54HQnm2Le/OeS5?=
 =?us-ascii?Q?nmuMO/47hQH0TMUCos/UnDr0RXgJDJ7hlCDM4TagRQQxXD68Hob1YIc06K4K?=
 =?us-ascii?Q?Zq6i3ROs1+nek7g+aLweCRhoLeUZhGZ9ejy4Orhxiayxv1IXKSuXS50Nj6nT?=
 =?us-ascii?Q?7/0d7uofGS6Yq1U26jKYnwtJXIPufSoNFiK56sQ1VnDhFuGTO2G1obUpW5qn?=
 =?us-ascii?Q?ayuZ58GOP2+aTOo3fsjfcRhR5WtEpMGVmRDUcx2eiivBvwTNX/gcWOBa9dCE?=
 =?us-ascii?Q?M67ap9bc1tGijZQ+s1bTG3wDbd0sQ7Vitk4pKGbQRcrQD7xB/P5a9o8xYIUF?=
 =?us-ascii?Q?ucpuxEOwYPSsEu0P3vi0O8TbX3hYlatVVR2V00Uvwoo1vw54zsVLwdbuH9Qv?=
 =?us-ascii?Q?O33qhhkjT78RyXV5nxIccLIfgBZD04e7rVlcpo3KkmJ9r8II512YSApbGEab?=
 =?us-ascii?Q?WKSKPv4FzZ9WH9ukofpOWMoZtifb2euQoDp5ZcIzDzDTtPLbfIYKXEWlPE/r?=
 =?us-ascii?Q?JJiwjFoXzF4M+6sWZawOxep8qPZK+tXz1nzCz3ON4PQ1/fP/NVWbNO0g1O01?=
 =?us-ascii?Q?kaM5Avra/Xuk6KACzeai1j7KfaG4x5w0boOJlrWnnUlhPuRxs8aCB1j8NUPM?=
 =?us-ascii?Q?pO8Wun4xKLUZA/2/khjzKeaNpz1TYc9dGi9xoN2Kfzk7xhZDEDleRAyfvIBc?=
 =?us-ascii?Q?ZJ1LIO0G32kS40IKP+38JD/FD50lPaxV3xsLhRl+TmmnP2JkEQh/KiYer1u8?=
 =?us-ascii?Q?u37nZ1Y42kKIYwjA8MDw+4dg9LZAA7IONX0BuvXwAGnjoDyLA+Wnon6GzR9L?=
 =?us-ascii?Q?8Zolfl9g2w43YQE0Uv+feZfF5ITUxgRaqKUlWoyOTFG50tEBa9oWFeK9CHXl?=
 =?us-ascii?Q?e0spus0SxmeH8ye0hDD+rQkVYnkQ7CZXIOVmn68vunjR/3Dn7Z1BVI+T0dTT?=
 =?us-ascii?Q?3ubsAXkw+Zr+hUS26CTIuzo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c8cf8d-5a54-4a58-40b3-08de2cf53fc6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:08:18.5299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J8W+/QSTvEZT1BZxMEKIfejo6eeN0QeN4Pa25wY9TSha10pznTO5PE0kPa1zS3x5RsrXQpZkJ7abgoJ8qCK0Y/MzxBR3zQGitv0k/Xfk+AxPdU8iePuXQxAtuFkzGSJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
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

Hi All,

This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
interface found on the Renesas RZ/G3E SoC.

RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
and Display Unit (DU).

LCDC0 is connected to LVDS (single or dual channel) and DSI.
LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).

This apply on top of [1].

Thanks & Regards,
Tommaso

[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1012044

Tommaso Merciai (22):
  clk: renesas: rzv2h: Add PLLDSI clk mux support
  clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
  clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
  clk: renesas: r9a09g047: Add support for DSI clocks and resets
  clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
  drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
  drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
  drm: renesas: rz-du: Add RZ/G3E support
  media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
  media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add fcpvd0 node
  arm64: dts: renesas: r9a09g047: Add vspd0 node
  arm64: dts: renesas: r9a09g047: Add fcpvd1 node
  arm64: dts: renesas: r9a09g047: Add vspd1 node
  arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1 and DSI support

 .../bindings/display/bridge/renesas,dsi.yaml  | 120 ++++++++++--
 .../bindings/display/renesas,rzg2l-du.yaml    |  42 +++++
 .../bindings/media/renesas,fcp.yaml           |   2 +
 .../bindings/media/renesas,vsp1.yaml          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 173 ++++++++++++++++++
 .../r9a09g047e57-smarc-du1-adv7535.dtsi       | 124 +++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |   1 +
 drivers/clk/renesas/r9a09g047-cpg.c           |  84 +++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 131 +++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               |  12 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  51 ++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  42 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  11 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 109 ++++++++++-
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   3 +
 include/linux/clk/renesas.h                   |  20 ++
 16 files changed, 898 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-du1-adv7535.dtsi

-- 
2.43.0

