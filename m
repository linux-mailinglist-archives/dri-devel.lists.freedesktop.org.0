Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308DDB41F07
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D3010E7E1;
	Wed,  3 Sep 2025 12:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PvtlcE0W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E66C10E7E1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 12:33:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nERTIOHHS0td5jAB2eIqeIvwCyHyW2vcVPK4UVqkg+lrvhhI71sGEGrxzRQPQ5V7lL7RVRAXxHlX3BOS7qcyTDSULpylG9wNGsq1eLfjYxsxwaE/TSxdRm6+Iye3QAXMazrEBVoo7n8JOgrwaMA8sFTmMp3KONWJX7FmpWVK/Kl4QYuFkE6O4wnBiyH7ZMPVOK8FvoY2BYQOW3GGTX93lz9P4OrQxCPTBB8gyOuaiAws1fxrUEkpFXaJZxm2FI6TkKfXv4pBxWcb9W+6VptY8HsYJkuYtUw5njN6eaIH8/hqzcu6DRbnxkkotZ+zxQftRRg6XcyJrXcVzGRfEMRVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vLisVZKMNGECD/Us3PCCAbp8EJsveaTM/+goexzqEM=;
 b=kFXBlJzJ+xprXLmZ5kFwZ36DmLBS0lE+KtuB+pt09XUHYeH32PlqEmRCTlptFrqHV8svPykl37tjfrsciv8ee3bXxWKaFrKD0RZavFOF48AwSncf4BD5vAQUskBv5D0DZ+cgqkSIyKKptsnJ5eraE9M3mDL97Rdp8Sfo5YsxGiKIGQ1SRdwe/3AFX7HwYNZkw1f6SKOn4zkmOnuku0dnLFQU2txNioQIvvCeq9eJ7U5PhJI4mXPRMwJ3VaddQth7+5keg7etEM+k3DvfIi8SRWvGmnWCWTxsHjKnxwYAOnwAIrg4Kbu4ER6eU4oLmBKYZ62OzSHfQJLdJHmCdDPPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vLisVZKMNGECD/Us3PCCAbp8EJsveaTM/+goexzqEM=;
 b=PvtlcE0WqWPkDKVxW+jbeM+SySDoVTPa/mNDib3MP6aFszNNsDFyNYfA3cZ1LznOSg2QVxN0rUJ0iAXr4Mge/TtxElRLnVwAcJQPlyCv8kc4gRxVPmx37AkvQTD7BfF04Orl+FBIKFn72qjK1ussOuJt5govXIWNYtRsIJCkK6baRZTJ+VMMmdpDdCsup/ku2JIytT8EB2qspYlWlhc1M4ZH3/5fDL+CyEEIRAt/zRJqP2DQyI+sekCVG+D00e+icA69YpwyejksO3EpTN7UvPJZCaFisvwoFPAtTE5WG+/yVpPiBjjW20ko6QNM8aJNlfBU9OCj+tSxXWqimP/Ftw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by PAWPR04MB10029.eurprd04.prod.outlook.com (2603:10a6:102:380::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 12:33:51 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 12:33:51 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Marek Vasut <marex@denx.de>
Cc: Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/9] Add support for i.MX94 DCIF
Date: Wed,  3 Sep 2025 15:33:18 +0300
Message-Id: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P193CA0017.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::22) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|PAWPR04MB10029:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3428fa-b22a-4b86-3ce0-08ddeae62321
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xjVZaHhKzIdHLjGQA1tYN63SoTkwcOUPQ47CzsLPgyetDxgeoGAaeLWiRWdS?=
 =?us-ascii?Q?lNZWf1TMRt6DcU7Z0N7mZR0r4/0eeaFaTMD1vqWkqjtjB/Bo5QUMpMjQ/mXv?=
 =?us-ascii?Q?z/Y1uqmE5l74rQSPyP+TV/f1NkRUzuyzRPT350A4FrBb/75Bpccmzf5vnuhb?=
 =?us-ascii?Q?at+LjHEL9W/YtZ6QpQYwMJACnDQcgv529Ox5OVDO8cvhcUY1aIWaPCDonGfC?=
 =?us-ascii?Q?5R0T+olecBTBr7LnM83jgxZfhS85hIvtZH7do25bBCDL4+v9Bji/xAhRYNsX?=
 =?us-ascii?Q?fV07OI6bjrAYfqTK0jXrjRrZ1bCf1clCsHNkA4IB98Wcd8loQNeoUzCKDXcc?=
 =?us-ascii?Q?n4YlgT/K0/maK/sh/T+jFhWDcQO2icYIsGZE58Czdbqv93FaWd5BxAR8en2t?=
 =?us-ascii?Q?5lY4rI5by6LCUFtmJ+OX9VAw3Oz6dp83gHh2+4V+Dba5KebHX+hp2zlRr61I?=
 =?us-ascii?Q?goK+OXmfjhDuyrHTXpOuGq5Vjs99pMU+ywGu+zRS3zSWOGvreTLHlXrb6+y9?=
 =?us-ascii?Q?+bAOU1GDM12IcwY/NxGHUwxENm4v05EyRe3dljC7dbzasJPc/tRI42i1jyQn?=
 =?us-ascii?Q?XbM1zQCAvcBhZGY8tsVkuIikG0cxIzknrtikujoAsGLZR5i3r3CI2voZxxrS?=
 =?us-ascii?Q?/os3Z74TWuQWJbOPwiOHF5XBAgfKnHqwJ5lq9zliukZOtlhx3iS3XemgAJCG?=
 =?us-ascii?Q?dfccNLRA9no67xD2j8l+/wsCpEssURHD7gXF2uSY/WdB9XNj2tOdf5hE378C?=
 =?us-ascii?Q?IsOgjF0Lf6KYXDMWAefgkwquA+vZ60zD6NBIngKXCD9YFTnN5m3JdgiauhXA?=
 =?us-ascii?Q?1FZEZKqn+cRgIxFi+6aVHFjX4AqIIG06mKY8Ua/WzFEOG67z8eZJNFo0bwV8?=
 =?us-ascii?Q?WIIh398XvgMnaKnq5caYVRJ/VeOixKaLq8yVI9s5Gs+nFoGZP+ylYRvs5Hm3?=
 =?us-ascii?Q?1akY/vA0vt94oAlZvfanZCxGHkSfbfhJCuRlJc2IwNFYcuCHsqHtm7rzC+wa?=
 =?us-ascii?Q?xpPqpYJmWnChplYVYjto4Bl9+LNqTPUMyV/wHpfFTGkYr3F/fD+baCOWZVOa?=
 =?us-ascii?Q?QFr1KJrMhBVHe8QLG7Pqo3NfbvctmYL871xdvWxQh64SKfeHFY9CoXoIQsBU?=
 =?us-ascii?Q?XU9ga9VyO4nKihNPVgvaYNEyHpr2tpvvgYaJoRsVEa2tdMUoERkASUE8sBGb?=
 =?us-ascii?Q?C6vcX9sScucPs0lbBpFjUztYzYZEK1ltoav+tpozfzrxPjANNZiw0rydhVB2?=
 =?us-ascii?Q?x2EFf9Zx6q5OB5G0mluZWcUxD+z/e+fhut2tgDuFdnZPuvAHMipIrZsQw1zk?=
 =?us-ascii?Q?BbTkWrO8Bwzqos8rl41r+7j0FOCP8Jh4Jx/B9hVdVuU26TYeawAimawC8rqh?=
 =?us-ascii?Q?O3aiVkgZIcsai5wsNIV5mtpaRfeuj7qBugrScK1hxw1XIMNx7U0/mcxCwaHI?=
 =?us-ascii?Q?cX8P6+o/Ixg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cLam/ra4a/MnumyVOvPGO5QBwCKcAcqtPb42ExE40tD0VF5TAaF96w1XKk1l?=
 =?us-ascii?Q?WLK/hP8tnRZJpbJNB6/td7ja9SbIiO1sbxnmS7l0n/r3FN2ev88EkXozDnBe?=
 =?us-ascii?Q?ElnpNoobR2XTkPMgE3GIFByb041aObx8U4d6XyLpx3c+Q4vQtLy/uB9ME3BQ?=
 =?us-ascii?Q?4yCjJLhyBlVBu4gj7jdDPtQQaScCsywG2Qsma3rmPtOEYAkMa5rCEHTGW/b1?=
 =?us-ascii?Q?ZJ3hMldasf1b2bphu/JmS1CLvOc49r7r54PEqrfHqPuCT/1xpMny+zu4UXRU?=
 =?us-ascii?Q?5B64xfu+CmjWlhg757bXOZi2u8XamPTuCn5DL4uDsRAbmbKgYUEC58zo/VRS?=
 =?us-ascii?Q?PV5HlbNw/FD9t6jeS6nvFWW/bxjPJBpkqokcQKGPe2EKkKenJ4dD9P5WxH8K?=
 =?us-ascii?Q?vpNcaVCcall1+ZjY8OQijmHGwHtA+VpfqCKX0BCjrTmaMn2XhdTPc83+WMMj?=
 =?us-ascii?Q?6Zj9uRzLNotgfNfACyacIgI3MqEIFpa95iz+O+kY4PmUCRx5nSXLGX3pORIH?=
 =?us-ascii?Q?neCw0UVnZjbX7WbzkxE0cpFuJ9bu32+084Dk86IzSenOXyZYVsjm9I9frsBx?=
 =?us-ascii?Q?qyGQS0tOaEttUummBj9XjIa9xlyIChEDxla6kd5w75hSwgh+ozKtit+BSNu+?=
 =?us-ascii?Q?5Pk+CAX10bFDN4lgX4Hlbr5Rcp8V+ncqzOsBzR/lcpcvsmT9vNqeCZzQpxYb?=
 =?us-ascii?Q?2njNYDGGO13YlLViWBU7mlI7lW1Cxq8OjZt5/GuiGlq3+05tanLIYyJh16nD?=
 =?us-ascii?Q?+9v6wMiSrQ91Cm2gUbQFe5MSABbYYcC0tjpapBFIjTffEgKeuN9zEVVpUUxD?=
 =?us-ascii?Q?W4MlGLz5LJINh07bfqBByb6weBX/DeNXBDfCHm6ezaffovlK+SdMUHq8X7eF?=
 =?us-ascii?Q?qAkILQ7DvWnkJJuAm9KW4f+HVaY0y+Ajw6JGW4C64oEj9r+MWWFxRc8Iaay8?=
 =?us-ascii?Q?PrIZk+WYAMcpJcuS40gYzAs7fXD55Zush5unifhIVTuZykYcqCt8KNbuRSIw?=
 =?us-ascii?Q?+m8z4CKoEMW5sH8mXk21HREp/LtFIm+0XfmZcJ0UVI2M7bWVRgQ3jnNSjx+g?=
 =?us-ascii?Q?6LGuH3+9G2I+Q1vkq3otvY/IYt98LPYXIDe9isxkQrW7ME8WxlsxgVLqlrdF?=
 =?us-ascii?Q?5HqOIVNce9j1ebKjiEeaBy6QGUFGncja+NVD8k4beqK9h9iMns+c1/3XH9cm?=
 =?us-ascii?Q?Fep+VOLda0i+ZiqXyULYzFK35Dv3J7M0ReRRh0IpkJQj3AxFhzKbJcoifvwB?=
 =?us-ascii?Q?7vCcofaoTdV1kuAvenprSSxAYHh4D6ZXMnUO9PVMin6qWkZ0YDoZBRPD6Nbu?=
 =?us-ascii?Q?4vNK9EYBDvOwAfOdujE36P3P+Pe0YfM/Bdrx1kJGU51G+yVMoUSJAgMTcIdc?=
 =?us-ascii?Q?+YSTuxXqynvvQguziT30hoF81x5R3n+f5SibuNBWA969xBAZKYrcOEd/nXp1?=
 =?us-ascii?Q?TLtCWYfvz85H9A/HT2xt/KhDVsMH+OXzxLg45C1PF1kP46RsAWkjTnvNTV6Q?=
 =?us-ascii?Q?bqJDelouV1U1hGnaqfFEOxpX2LKUpFoU9IwkAMPq+QnAUlsF6C6A+M2yCG9A?=
 =?us-ascii?Q?9xfMKcWQec9cf73EWVc5hd+Hk9azUovXJgpBwHIL3saTLSuwBmq3ycnMqswO?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3428fa-b22a-4b86-3ce0-08ddeae62321
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:33:51.5870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KTfO6ccQmpcwscaIFW0gJmAfzuos53axMx1N1ZNvxKxokoMkjxrSEex9L6ZVaiIRVBk8oGYGYzYDYxLWqjvHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10029
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

Hi,

This patch-set adds support for the i.MX94 Display Control Interface.
It depends on Peng Fan's DTS patch [1] that was not yet merged. Also, it
needs the BLK CTL changes [2] that I spinned off from v2 in a different
patchset.

Also, included in the patch-set are a few extra patches that the DCIF
driver depends on for functioning properly:
 * 1/9 - 3/9 : add support for i.MX94 to fsl-ldb driver. It also
			   contains a patch (2/9) from Liu Ying that was already reviewed
			   and was part of another patch-set ([3]), but was never merged;

v4:
 * Addressed remaining DCIF driver comments from Frank;
 * Limit the 'ldb' child node only to CSRs compatible with 'nxp,imx94-lvds-csr'
   in the binding file. Since LVDS CSRs are a minority, I chose to 
   use the if:then: construct instead of if:not:then:;
 * Remove the '#address-cells' and '#size-cells' from the ldb node, in
   imx94.dtsi, as they're not needed;

v3:
 * Removed the BLK CTL patches and created a separate patch set [2] for them;
 * Collected r-b tags for 1/9, 2/9, 3/9 and 9/9;
 * Removed the DCIF QoS functionality until I find a better way to
   implement it through syscon. QoS functionality will be added in
   subsequent patches. Also, used devm_clk_bulk_get_all() and used
   dev_err_probe() as suggested;
 * Addressed Frank's and Krzysztof's comments on the DCIF bindings;
 * Addressed Frank's comments on dtsi and dts files;
 * Added a new binding patch, 6/9, for adding 'ldb' optional property to
   nxp,imx95-blk-ctl.yaml;

v2:
 * reworked the BLK_CTL patch and split in 2 to make it easier for
   review;
 * split the dts and dtsi patch in 2 separate ones;
 * addressed Frank's comments in DCIF driver;
 * addressed Rob's comments for the bindings files;
 * addressed a couple of checkpatch issues;

Thanks,
Laurentiu

[1] https://lkml.org/lkml/2025/7/7/84
[2] https://www.spinics.net/lists/kernel/msg5791546.html
[3] https://lkml.org/lkml/2024/11/14/262

Laurentiu Palcu (7):
  dt-bindings: display: fsl,ldb: Add i.MX94 LDB
  drm/bridge: fsl-ldb: Add support for i.MX94
  dt-bindings: display: imx: Add bindings for i.MX94 DCIF
  dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb child node
  arm64: dts: imx943: Add display pipeline nodes
  arm64: dts: imx943-evk: Add display support using IT6263
  MAINTAINERS: Add entry for i.MX94 DCIF driver

Liu Ying (1):
  drm/bridge: fsl-ldb: Get the next non-panel bridge

Sandor Yu (1):
  drm/imx: Add support for i.MX94 DCIF

 .../bindings/clock/nxp,imx95-blk-ctl.yaml     |  24 +-
 .../bindings/display/bridge/fsl,ldb.yaml      |   2 +
 .../bindings/display/imx/nxp,imx94-dcif.yaml  |  82 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 121 +++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  53 +-
 drivers/gpu/drm/bridge/fsl-ldb.c              |  47 +-
 drivers/gpu/drm/imx/Kconfig                   |   1 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dcif/Kconfig              |  15 +
 drivers/gpu/drm/imx/dcif/Makefile             |   5 +
 drivers/gpu/drm/imx/dcif/dcif-crc.c           | 211 ++++++
 drivers/gpu/drm/imx/dcif/dcif-crc.h           |  52 ++
 drivers/gpu/drm/imx/dcif/dcif-crtc.c          | 695 ++++++++++++++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.c           | 226 ++++++
 drivers/gpu/drm/imx/dcif/dcif-drv.h           |  86 +++
 drivers/gpu/drm/imx/dcif/dcif-kms.c           | 100 +++
 drivers/gpu/drm/imx/dcif/dcif-plane.c         | 269 +++++++
 drivers/gpu/drm/imx/dcif/dcif-reg.h           | 267 +++++++
 19 files changed, 2243 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx94-dcif.yaml
 create mode 100644 drivers/gpu/drm/imx/dcif/Kconfig
 create mode 100644 drivers/gpu/drm/imx/dcif/Makefile
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crc.h
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-crtc.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-drv.h
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-kms.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-plane.c
 create mode 100644 drivers/gpu/drm/imx/dcif/dcif-reg.h

-- 
2.49.0

