Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A172A4D9E2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955D210E307;
	Tue,  4 Mar 2025 10:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="NzdZ8sgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE8210E307
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 10:14:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPc85qp1hjtgMv0tV5TmT3IuvbwQ8lPof63uXPTTomj4/caoQ+Lae/d2A1eKLL1/IjrJ3aHh401qM1Yk/vCe2ezUvy2n/T2gc3HuVXb0yPPUfg88yIWYF3enykPFO7jdOviJ+Lt6AvtMn5rpYFDnH47nbD8SQqzrxSdLIQk8NEY4iMa/Ls3p5lJQkl4xI/nq3mfdfhIaQm+jRb3PTBoCWXE78m9ZtKLUY8cJ5Va1Y+Po1wi+hwqXgNUeMbkhvmH4Tu3AYxCTufy5omnVAqRFtXxQRdMk/R65ucNr1BsgR72cGN79BOEbvFguA5rmxgK9gJwvyTso7CbLSFQr12ttGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mEqVegqBwecHq3XItJli0hDNjen0YCEKX5tAyX4n0Y=;
 b=va+3Jsiunuf/5bf/xwkhQQl5pG53kHs9OJ3nE3sErvKU49/Ggn+Oe1ZU40MQ3InhN2/HMetnPUc0+pfHV+CZbM/ZCWLc+cziQGVc3LgnLGt7QkbcJklMIARdkFiP+nkRcol12pMLHFlORVTJefsULF2ENPD0tmZuqQNRyrzfVIbeC7jlqI30tSQH6KUtESmLyhabU+OYaUina2Yq5IrQwFlr9OA1dlunGCMjFOqf55H2l4U5YglXUUsPnLaERFmwOPnfqueMtDK/BQYPp6GlbTAi5FOfvjIWjKZHQb5gQ8im4Bjbk2TzBthFTM1pct78YthWxkAyZ6MlKCs/EIr+eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mEqVegqBwecHq3XItJli0hDNjen0YCEKX5tAyX4n0Y=;
 b=NzdZ8sgoh9JmM/LEWeSxqI0wjz6TzhL9T3/aEGVC4lBkhvaFDthO/5TjxHH0blPu+vBWffBR51AKiQazn47/tlPKa4seVnRU1PBLjNu+GG//TxMBNZ015d2+WO0GQ724CrSe8Ri/h8JJ+qnyaIykdA6DO1/lRsDfazgEJGIwHeuPSXNyuEUAaIkewX8gN1sIzzSNRHt5E78HoHexQSrBlLophoOiiUVvQAgK7WSboKzCQIQTj6zo6oACfzmkIKPdPvCYpx2HjjfQcf7zn7F/vfDDJ4RD4Gr7c42rVdaw1ZFqHfdVfpaDiy3FWpDMtXuWk2Agi26HGo5J4u8eFcW/OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9868.eurprd04.prod.outlook.com (2603:10a6:10:4c3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 10:14:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:14:33 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH 0/5] drm/bridge: simple-bridge: Add DPI color encoder support
Date: Tue,  4 Mar 2025 18:15:25 +0800
Message-Id: <20250304101530.969920-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0188.apcprd04.prod.outlook.com
 (2603:1096:4:14::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9868:EE_
X-MS-Office365-Filtering-Correlation-Id: c44bb89c-5ceb-40a8-185a-08dd5b055bab
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m42708yq5wj9O9QRMQNBLmcnqwZOKqrv/hkrHeRqXZ0TZlrdJ+BJ8q0NY+jM?=
 =?us-ascii?Q?PopsYtGjG1CgQi51NHOzlus0A2488APRUQGTGshmLNq28L8A1vxin4f1HBd3?=
 =?us-ascii?Q?dlpSz9CtUFKOciZ+RXY844UYvjsvJncThv0Olt0w6Ezh8A5Wlga+okmIkHif?=
 =?us-ascii?Q?7OwUhQfOwCW/OzP8wkieWQ/lxxdEmMGVGgiWolg7njKNG09z2XVKQcQKRdgW?=
 =?us-ascii?Q?+kkUiABXOv9OAJ8Zx0FNqgtVcwc6oZBzv6xQztOkfNed4mXA2FBcqaoNm/oJ?=
 =?us-ascii?Q?L4ZeaQRKSMktsmeSZxWlZpc4PPVCanFrEtu+95Rq3d3QBHm/+18GpCCXgrLl?=
 =?us-ascii?Q?00bEPUPnMSOX7Uhi3yRbpSqE9ZPxLAWAxkOpHmI1k+xjhEWwVXYOuWqORoLV?=
 =?us-ascii?Q?AzcSxn0Msx+AFsT4apK0cREIMazunapisNnomfl+gt16irq+GWRaXjfElLIg?=
 =?us-ascii?Q?etVD6l1xnL2NZZptejXlyTlqEetPvyJKAK8MGkh2j+vOpxcd/PmpoxUwDUaD?=
 =?us-ascii?Q?aB2oi8UijiNBpmc8VKeya62nlFBEuNc4oqiX/r2Ppl7WhTERYVS3ZEkpFfGJ?=
 =?us-ascii?Q?v5xmG/wrB+fwk2ySr97xQOp3mwk/oKOYimFQnrG6UXaXkd1qhrxj98leljAY?=
 =?us-ascii?Q?w6KIBNhcy5h0It4aZRfnNGoNXq3CI/YBxbk7bSZaMX26HGjqZPPo+08eYV6f?=
 =?us-ascii?Q?z2I0XxeXtRmrYTiXAeFCm+dgcC2YKoTon9AayqoZsKg7MsmngP1Vn7u/tOkM?=
 =?us-ascii?Q?POcoJjyagR1l3zoCGm+azvVe530t+/BJh8kG8kWI0YHXhQmoocPo9DvakYBU?=
 =?us-ascii?Q?s3ZqhkHU1jMRHzXybYN57hDG+TlQsiNcnxQpjR31frJOckUoZplTOcOy66GJ?=
 =?us-ascii?Q?ddBxom6ZFRIatJMObzRmns+P0ugcu3w+XayyXXruGGLJJn1CtU5BP79kWqnW?=
 =?us-ascii?Q?VPv0MtTFBonvnKGNBem7+iFI1P2pVHEsW0GzCUeQ7D23ymGEsQWON7MNNmBd?=
 =?us-ascii?Q?cA+e1tj99YVvkzem5/P+KlqqB4/lYJr2iId0GbGpPYBBL7+x3GXYblVS/42o?=
 =?us-ascii?Q?OsBD0tGo5gVH3UbcaRMuN7j9+JmhEd6ZYQ6sGtO6/I1l8LbjKtUu2zlhacuu?=
 =?us-ascii?Q?WWN5voHsH/vG1mPKRSkzF206N9M1z9StE91MHgcw/beYmu49TLzUC+HbUI78?=
 =?us-ascii?Q?FSTKTJy7DKRKdZM+HREq4p2nV4VR+Dk92oQeRqbGLVhChevCWaTLTj1kmUfP?=
 =?us-ascii?Q?VCNGt9Oc3itYemoMxD277MA8M3avPcZTSBOh52ccXZgWTPzWEgwT1Vx110Gp?=
 =?us-ascii?Q?8BTHoh4FD7QQ45Z2TKzGysUzHjqBJ11bO2xdOkE8BTVzXUV2FGaGkOBOnxs+?=
 =?us-ascii?Q?9iqJYid0Tc1pGcY1TBeF/ZPtDNwfes7sAB+3XN+Bf+G5BpJR/g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(1800799024)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0AGeZWPmMz0o3zA4tgSuqATZIHDbs2oWXz4IMZKFR3i+yXy9ZX8Y+lzAq4a6?=
 =?us-ascii?Q?KCfXEwifOOoYp4RrSSMAEAZB51xRWBudQHUQ9Sd1fAItd1MN4ImNqO7bqp43?=
 =?us-ascii?Q?BIt/H0sK/8OOXIcgh4czevJaOyIagBqdXMiV6ytlNyM1qUGCG60LEidZnl4I?=
 =?us-ascii?Q?nXiV/uNwSrYcEkTJN1TUpc6a5KQgpOnvs+e2Nc/VJgPKd2Zfw+SKpvPXTztm?=
 =?us-ascii?Q?9+vBc5cLe2OHPaM+uA+xAxXMORnXnfbYJx+c2hAG6DaGQW+mkqZ0BodR/vqv?=
 =?us-ascii?Q?XQrBwhEDUtOcjF/nHzwDhwOVgt0T4EJWrm3x2IlE48yad+UwlknNYIK4GCgk?=
 =?us-ascii?Q?kq1WHYB49vax2zYntpYViPKxLJvn8CQCMhbqeGdomTWlTg1BRGYdVG8nPLO1?=
 =?us-ascii?Q?8gbOJ9fCLt934TjuZ4nSl70pRQ2l5UPo5orDS64tOZN3ctLT0sc6EGLjyfkZ?=
 =?us-ascii?Q?thPgzv9EEYvyQAin/nR/VsAyVIyts44M1daRIFomrjbauEhY96dxeQm9SMOB?=
 =?us-ascii?Q?wdyps09u3kclL+1z31rnTpbdaEJnPkNMOVjK0cJcYMa3f9EvLafKxZcfb2je?=
 =?us-ascii?Q?ysNEmY+mlakMikxG5Wkb0xNGq6mg4nEo4UKayGZwFw+bamlzbx1dF2z6DfEz?=
 =?us-ascii?Q?hOK2htvVBBXhweasU5VHx81VSlc3S9bmSQjq2LtX0MQzd1ymbAn6ZdJag3eP?=
 =?us-ascii?Q?UJ3DEervZK3SFYN2vNao0eCZ0sCK2bsE7G1TVEo6CU0WRJBOf0lYuB8AbwZF?=
 =?us-ascii?Q?zL+woRXOpSMkCs6YMsqnu1bwtJs/7/wCAWGL7qEPZHJAZx86SJruLMe5qihA?=
 =?us-ascii?Q?X+/LIbQniCoBgNuekGCezlm33BRhc9xjM0SORfQMdJ4NMcIVtVxJpg/QBcbO?=
 =?us-ascii?Q?QOozPnFSlzN9HMjN851CBDlirLf8fyUTL/59agKXLSM6KTey9S64DFEXtr+5?=
 =?us-ascii?Q?l75Omr5Vjv8tUjaztDY3Fjh2b/ab4QQrhiF4/6T108SMWb2IRVpXPHgSyJbw?=
 =?us-ascii?Q?xRwV32aLUgtvEuFmkM2tYyZ/QTAmJbO/4a+jSvAQNdvF9u9mc1DmBrkgEg3o?=
 =?us-ascii?Q?RKvVJmZyDKihPHVtvQhRdfTFSUilS+0M0OaKrXc0OX8uO3s/i2Nyk4fNsfWy?=
 =?us-ascii?Q?1P0CBdBPEdfi59eHqPNm9V8JrHFZOolKtO8coWitrR++u4LLJ12rJbegKrf/?=
 =?us-ascii?Q?B4rNg/9akeWKifUxFlJtdOKM/Df69u/yqsVA7U8XiYfu48I4/f/D6oeg67Od?=
 =?us-ascii?Q?zsZebuoR888gsfkBSOdK4fQlJYKmLWu20/2LebZ8jGyIZ1nUnCdcL/eVrr7m?=
 =?us-ascii?Q?bUCBitZwo1ZYKNr0R4BhsML0btqCy0Hoeoy/oK05M4t45SuuBQSyi8+Ojepw?=
 =?us-ascii?Q?7yzfzJhEQ+aEUnOAOVqNhars0/JrEPTQd9eS3vp2p/bpelL7uIHC8SBg0HGk?=
 =?us-ascii?Q?WNjQ0UWconwZrJ5G1TRUj1o5i3/PvCVu/eFsJvP7MhAJ2htxU0HKGzTm5xhs?=
 =?us-ascii?Q?TGvHQA8RpSakK4lvPeQ3NdEZjLm/p6WcYycGPDdwEFxF5oomrvbOc7alMl8v?=
 =?us-ascii?Q?0DfkMNZQtiFesbs7a14/8J7vg7oJyMf/2VXzduc5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44bb89c-5ceb-40a8-185a-08dd5b055bab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:14:33.0731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HbAX7Kdzz7RknYRN189fACoDoE2SsNX+gSZuibZmOuOciMFzJE0dMdz9EWG3CJfDxWSYP8sXEXiZVHC8OzblQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9868
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

This patch series aims to add DPI color encoder support as a simple DRM
bridge.  A DPI color encoder simply converts input DPI color coding to
output DPI color coding, like Adafruit Kippah DPI hat[1] which converts
input 18-bit pixel data to 24-bit pixel data(with 2 low padding bits in
every color component though).  A real use case is that NXP i.MX93 11x11
EVK[2] and i.MX93 9x9 QSB[3] boards may connect a 24-bit DPI panel through
the Adafruit Kippah DPI hat.  The display pipeline is

i.MX93 LCDIF display controller(RGB888) ->
i.MX93 parallel display format configuration(RGB666) ->
on-board Raspiberry Pi compatible interface(RPi)(RGB666) ->
Adafruit Kippah DPI hat(RGB888 with 2 low padding bits in color components) ->
24-bit "ontat,kd50g21-40nt-a1" DPI panel

[1] https://learn.adafruit.com/adafruit-dpi-display-kippah-ttl-tft/downloads
[2] https://www.nxp.com/design/design-center/development-boards-and-designs/i.MX93EVK
[3] https://www.nxp.com/design/design-center/development-boards-and-designs/IMX93QSB

Liu Ying (5):
  dt-bindings: display: Document DPI color codings
  drm/of: Add drm_of_dpi_get_color_coding()
  dt-bindings: display: simple-bridge: Document DPI color encoder
  drm/bridge: simple-bridge: Add DPI color encoder support
  drm/bridge: simple-bridge: Add next panel support

 .../display/bridge/simple-bridge.yaml         |  89 +++++++++++-
 .../bindings/display/dpi-color-coding.yaml    |  90 ++++++++++++
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/simple-bridge.c        | 132 ++++++++++++++++--
 drivers/gpu/drm/drm_of.c                      |  43 ++++++
 include/drm/drm_of.h                          |   7 +
 6 files changed, 348 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/dpi-color-coding.yaml

-- 
2.34.1

