Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B12B9B4209
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3EA10E1C5;
	Tue, 29 Oct 2024 06:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="PnoFxg2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813E110E59C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:04:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhK0IJ9OI7vPapp3jA489gbPapMtE8w5rshFx+I43SE+BCMMAy2WaCL8UiVSKKSN8LmYoFUE+9ETVBIZEfukUtUG/UAZZbggxzqzyd13/2xVEMm1/PV28Rrpbhw6iYId1JDbC+y0oafAh6NnaU/cx76BOGq9piiwScknBQd1Q2BXBCxiYRNxuEzzw25whL3HDsEMC6x+8iZr8rqo+uWKGKnAmtpvNF8Uhv0NoRteJlH8WUlwso91n4Ud7T6DqnB6+5vnIdLwJsqVoguX58ufmONcjRo6SQEYOnHHif8dWNsVRYSRnhywtHHmFqD1CcLD0P82geHLkn2j7mSIjOoofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aeeW6NHe54nhg2/w/iQVlBCIIGyTYbohzM4hNV6HgQ=;
 b=jjhaTHlcIxP3RKkh53hHw1thM0u0InZPxhANRAJIXzBQ+27EyS0/3rrdWyPX6YtfyAexp+/txhBBthwZn+UU/1BfqmAGDNZfoHn15Mxw5UxFcJD+6dJKhJfF6OHKegBgnE9GLXTzIoc7kQRhWvSKfjcpxA9KrHHbcBQ+J+nc1s8sP0/QE8eL3mweZxn2uApbyUVUwfygWiEIjzXnbO02XTtre6Rhvnz9FND6CZuDczqBI+K3AdC1BF1XDgNl+w1PWdItfVFuTqHTZwtFGtBJWn3N+KCYK05MDawdIS4kmDEKYLCo3PJ8t5y5J+d5AEevGP/z8A64bHtSFXRBWOFb/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2aeeW6NHe54nhg2/w/iQVlBCIIGyTYbohzM4hNV6HgQ=;
 b=PnoFxg2eQOqESzFTrvfOqYxwx+J1w/3IT/xN+gtsa/vyXtn9G3M/GifzTtMb3/yd3Fi2cOPRV9LvyAqT2gg9OTMzg0VhRBtroE907Vu6mBoiF0VW62mD5/ws65+GnQYMhZYzwUTgpXyqEQglk/e8BN2Df1zVZ6/u9X+RLA2fO24j+rjnUuJNhpGxVVsA8+2M0g7RA+RSn0BAsO+4Lc6ksKv+FeDIwCOddp/I55Xfos0IMzyGbywDSK4fTVgfPo7Tg80AkMQZ1NwZ5QVtm5jNtU/tt+Qp0bhRPIBoGktRIFoD9GL8YU5Kt0MEfO5V8ja8jrbOUgptcu2IoXDlaU5inA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 06:04:28 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 06:04:28 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v18 1/8] drm: bridge: Cadence: Create MHDP helper driver
Date: Tue, 29 Oct 2024 14:02:09 +0800
Message-Id: <9fe153c4f0b8616782fba1f7c8c2223c4f0c1d78.1730172244.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730172244.git.Sandor.yu@nxp.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f0db688-1876-4d50-7c39-08dcf7df8c2b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C9kiuDn5PgzfkSwcKN10UUI2tWfD03wtxb2OUAmTpokGkp0ymJeM9O4k8F0T?=
 =?us-ascii?Q?3SDSQybXbO/SeV7Dg/EWE/Vl+C+JaF7cG4bp0sbm7/706nSXi06/t7QV/Ds8?=
 =?us-ascii?Q?MaqqedTskq6JkVtA7Y5sMBCkAL1urUjPA0FoB+ThJ0wLrV5xnLIEduMvCfhR?=
 =?us-ascii?Q?zDPWqhatESaeLhdBEZeEG9aQz1Hj56TCRQQb2LownczStKWMZHUpj7vMzSSE?=
 =?us-ascii?Q?VQNspj0nePvRdU/jvJB+5fdYkRipEc2ngbo/WCXBPMIimiDVZ7D5/ZHDo3lK?=
 =?us-ascii?Q?VDDEsI2/RGMoYuX4ySwUK84QSkhPpgjA9/MxttsKtJk2W6pUtZWBEgZmaTsN?=
 =?us-ascii?Q?3C269kdl2ylILZSGQIyVzW0evUd2SiHyXfUlLwIzTSvLFnX8VHyi+pHQiVr3?=
 =?us-ascii?Q?ylcQntC1FFOV3V6PaByToKNECvsPTok0Ywiw++W9T3mji53i0E3eYboK31D2?=
 =?us-ascii?Q?MoM7VWLwF0n4BXNiyupKVJrBNohFbsuF3vuQNq589d7A6oxPNwBml7pXD+40?=
 =?us-ascii?Q?Hv2YGxeRaxfAlI/ASM5mkPuBVMIbvd7o7XDfVJSVX/rBkMOHnApWt4kmfeO7?=
 =?us-ascii?Q?apT1xFtAcm68T07nIUsv5kpH6ujXYbZ5roP9MnIYgOAaoqgAQ2HAdKeO+td5?=
 =?us-ascii?Q?1AYfYH2uxxWAdt5+EQVszu9btb007u0c3fjwr2QJOMO8rij3hMDWy3l83L7Q?=
 =?us-ascii?Q?ch6pJEQKp59lVLGwdC2Fz0wPxDo5OsPiHgdpMpPdaX0/QkdkmUE8K2cXjsKF?=
 =?us-ascii?Q?PJuwVV4h/IrMCdUlddDgo0dp/lzPfXjMFOCDGlIZ2PdGdVcnFAGz00mjJNVc?=
 =?us-ascii?Q?s0blGhcWkIq9NyXBdzCFR0vC9oeDaguvoQltbS/HxgLO5iATvQLrj3GmVGfv?=
 =?us-ascii?Q?vHhxy/M5M0BIID8J0DzTZmMC4ahbVPl+MG3n0MzAtclP5v3vxZN2y+950rkx?=
 =?us-ascii?Q?yy/1Ku9O/S75PU0/RN/zVwD2s/YNvabkZXxkGRhR26/zBR/FtNhqpQRdhyoY?=
 =?us-ascii?Q?Psm5LsxgxKQQZ4UPf8BolSx2czQXmyNUNm0ZSnvopwGVhbTnnRGW4h+GcS2g?=
 =?us-ascii?Q?89LJJ0sivlmZE2ii/GRDh85QxUqHQaaF+N41WmtK/NPu10pGj+lj6nWD9sB8?=
 =?us-ascii?Q?1q7KvvfFmt/rYZ5d//nfEtxT96BGGd/887FprRQo4QYWZXQcwCjhk9YGipzu?=
 =?us-ascii?Q?IlaGuYxA80MkW0lMcjodYSNGBni48dt5yuwulWnk+yzMcR+N2PKN5d9bgM/o?=
 =?us-ascii?Q?ArvZ5y8ZOLciZ/W7cWyh0N3+gm3ytJgPRH3DkcC9TQTE+J6fRAm4GCxNav7Q?=
 =?us-ascii?Q?cU6r4BC7bg4t7Tg9qzMnhhUHuiiAZGhXQrYUTWRX5P4dN9tBaIQCM4xfa5b6?=
 =?us-ascii?Q?70DNejnuJLCGoVt1p5crPk6gs7C2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aZncSuBE/nFo6u+MZOhZ61Q06ZFRWF7dtqKUkqHM3SrYmgbYAXdxCe68+m0W?=
 =?us-ascii?Q?GPEWmW3lyHvFHqZZmXqyBEGjxWO7nn+54SVbXV1rlETgvgIw9N1Qmh/8rW11?=
 =?us-ascii?Q?GH4y53i552fGXxpqbd6M6RWHr4qF+F9I3dmOy7R5o0AJ7gIFU/Bfh6dQ4NWo?=
 =?us-ascii?Q?TvPveJwokbkcfq2eFqCowBOtYOgHo32U0R7Xr9XFx2HE6U3SZa7O5mTx5ZGr?=
 =?us-ascii?Q?KSfzLJY5mXyM/XVnJwCB087ElDjvqno9pfJD2wotVYhI0aiYe1MKvlznWNoi?=
 =?us-ascii?Q?VSjgr2+LKX7A1JILr3OraOqEE4DsY0Axhu20fP2SS5KJL/aVoF2Fn+S5vIDf?=
 =?us-ascii?Q?uGAcGDeuffZMm1gS1qtr+ybsIqTdEw2BfR1dKrct5Wxt4PGExRIESREsiQSo?=
 =?us-ascii?Q?n8rl8MWwmSazvXGj7+p/mzlqMhgPJ4IG1N0iUh83hFdlRHoDQA0mKQaR2ovJ?=
 =?us-ascii?Q?HWQW3sx6zdpoUp7bhrvNKL7LbjwXzZ34IMh8zI7yATW5davTDcMwHbfW+4Qg?=
 =?us-ascii?Q?KPDczvwZNm0uD2s3jOjKmee0pS1HUBjfOxh/IdtoTSlniklXRCWPDWh/3Gsg?=
 =?us-ascii?Q?hvW6maY/et1GJnxcD9zmk52vXsITe6bPW1xU8Hy8rsr5gxfGFA353aCre18O?=
 =?us-ascii?Q?+h0k0yVNUsvV/N8RCdW0Vt8OzkNjHizOorI/tWNW/bRHhyi8DH3LLp0JOUKo?=
 =?us-ascii?Q?gYLKV3fcTdhC88CFMFLrwFC/4XjR92+Mx9X/kY7SUiDpaEslBbLTB59ePjw7?=
 =?us-ascii?Q?HfZBVnwZF72/ZTdK+FSl2VTMRQ4AYecV+tzUDQeoNAUe7IVZJLHIwOVzvoFP?=
 =?us-ascii?Q?UaEeREuMt+TPr0LJWdh4OlDJF0Hdpnv0rm3xIhShogiMDjyu8bBGZ19+98aH?=
 =?us-ascii?Q?KMzrNEPlf3edbVA5ZZkXIVN6VORB0cARDX400qRW200SYasgb/NcebblF6qm?=
 =?us-ascii?Q?tfYrQ7dO4lqhbO3SCqZSX2S5rPWcBudwBZqNvgi47MRd2Hbwu+l9XLB5fqWq?=
 =?us-ascii?Q?GqiaskJuXGjmPypvWkzVmLdVJnHBTvDjOLHdBo+N82e/S2KUDGInsOCVK4Wd?=
 =?us-ascii?Q?n82P+J3oYG6Tis1HY6W5vWdMeeifAwOMFBQfaMgstk8Obh24EaVHrdxu576U?=
 =?us-ascii?Q?FTPonMygZD50aiwOGXrm75L2oPZh8M+GERbnLUIBgO7bCaZt2RpNoNd++gNi?=
 =?us-ascii?Q?KmVesP0A6ePGRi2T4piDSzhNT9uqc5ci3BuI9fEjKbTEzV9fIKnY5GaXhIzu?=
 =?us-ascii?Q?QW0tvGYo9VSV+J9aOyRsQBOHs6em2mi1sEYoRZlUzEaQ1yJVKbuxvAS8CAoo?=
 =?us-ascii?Q?0PovIUfOkvYfORABC4+B/sm/fdqoEv2/CD9pJ/+0okp0TayC6hHsmUdyiINY?=
 =?us-ascii?Q?oeD3ms3+6wi6wDIIa8AVgSpQTJdPR50hyC1lS86PlChG8okuG2mECK/P4Wya?=
 =?us-ascii?Q?XbOiKdTVf2FuKKobv09QpfQlBriojF6Mg0C5MMk13LMYaU7B2kJrvmZkF41g?=
 =?us-ascii?Q?pumYtU243o8b2DtnUNkaPIAisOipmV5DgaGo5s0x5D0z31RUie7pQGKQj17M?=
 =?us-ascii?Q?yy7hDYC4P4Ehve2ZXcECUFxNg4QLSsENua2kNtJ7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0db688-1876-4d50-7c39-08dcf7df8c2b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:04:28.5829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QynO6HGnemdaOBD0QUgn9KWf9sUYEqqUrLc0rODTpfPjQwhv8+GOxMM75p0UmRoRP3Z/9LdhvIVUn40K7tnlXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172
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

Mailbox access functions in MHDP8546 will be share to other MHDP driver
and Cadence HDP-TX HDMI/DP PHY drivers.

Create a new MHDP helper driver and move all mailbox access functions into.
According the mailbox access sequence and type of security.
Six mailbox access API functions are introduced.
Three APIs for non-secure mailbox access:
 - cdns_mhdp_mailbox_send()
 - cdns_mhdp_mailbox_send_recv()
 - cdns_mhdp_mailbox_send_recv_multi()
The other three APIs for secure mailbox access:
 - cdns_mhdp_secure_mailbox_send()
 - cdns_mhdp_secure_mailbox_send_recv()
 - cdns_mhdp_secure_mailbox_send_recv_multi()

All MHDP commands that need to be passed through the mailbox
have been rewritten using those new API functions.

The register read/write and DP DPCD read/write command functions
are also included in this new helper driver.

Function cdns_mhdp_reg_write() is renamed to cdns_mhdp_dp_reg_write(),
because it use the DPTX command ID DPTX_WRITE_REGISTER.
New cdns_mhdp_reg_write() is added with the general command ID
GENERAL_REGISTER_WRITE.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
v17->v18:
- Create three ordinary mailbox access APIs
    cdns_mhdp_mailbox_send
    cdns_mhdp_mailbox_send_recv
    cdns_mhdp_mailbox_send_recv_multi
- Create three secure mailbox access APIs
    cdns_mhdp_secure_mailbox_send
    cdns_mhdp_secure_mailbox_send_recv
    cdns_mhdp_secure_mailbox_send_recv_multi
- MHDP8546 DP and HDCP commands that need access mailbox are rewrited
  with above 6 API functions.

v16->v17:
- Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex

v12->v16:
 *No change.

 drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
 .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 414 +++++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 487 +++---------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  47 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 236 +--------
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  18 +-
 include/drm/bridge/cdns-mhdp-helper.h         | 130 +++++
 8 files changed, 658 insertions(+), 679 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
 create mode 100644 include/drm/bridge/cdns-mhdp-helper.h

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index cced81633ddcd..e0973339e9e33 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -21,6 +21,9 @@ config DRM_CDNS_DSI_J721E
 	  the routing of the DSS DPI signal to the Cadence DSI.
 endif
 
+config CDNS_MHDP_HELPER
+	tristate
+
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
 	select DRM_DISPLAY_DP_HELPER
@@ -28,6 +31,7 @@ config DRM_CDNS_MHDP8546
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
+	select CDNS_MHDP_HELPER
 	depends on OF
 	help
 	  Support Cadence DPI to DP bridge. This is an internal
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index c95fd5b81d137..087dc074820d7 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 cdns-dsi-y := cdns-dsi-core.o
 cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
+obj-$(CONFIG_CDNS_MHDP_HELPER) += cdns-mhdp-helper.o
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
 cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
new file mode 100644
index 0000000000000..f39228a78c7cb
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
@@ -0,0 +1,414 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, 2024 NXP Semiconductor, Inc.
+ *
+ */
+#include <drm/bridge/cdns-mhdp-helper.h>
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+
+/* Protects mailbox communications with the firmware */
+static DEFINE_MUTEX(mhdp_mailbox_mutex);
+
+/* Mailbox helper functions */
+static int mhdp_mailbox_read(void __iomem *regs)
+{
+	int ret, empty;
+
+	WARN_ON(!mutex_is_locked(&mhdp_mailbox_mutex));
+
+	ret = readx_poll_timeout(readl, regs + CDNS_MAILBOX_EMPTY,
+				 empty, !empty, MAILBOX_RETRY_US,
+				 MAILBOX_TIMEOUT_US);
+	if (ret < 0)
+		return ret;
+
+	return readl(regs + CDNS_MAILBOX_RX_DATA) & 0xff;
+}
+
+static int mhdp_mailbox_write(void __iomem *regs, u8 val)
+{
+	int ret, full;
+
+	WARN_ON(!mutex_is_locked(&mhdp_mailbox_mutex));
+
+	ret = readx_poll_timeout(readl, regs + CDNS_MAILBOX_FULL,
+				 full, !full, MAILBOX_RETRY_US,
+				 MAILBOX_TIMEOUT_US);
+	if (ret < 0)
+		return ret;
+
+	writel(val, regs + CDNS_MAILBOX_TX_DATA);
+
+	return 0;
+}
+
+static int mhdp_mailbox_recv_header(void __iomem *regs,
+				    u8 module_id, u8 opcode,
+				    u16 req_size)
+{
+	u32 mbox_size, i;
+	u8 header[4];
+	int ret;
+
+	/* read the header of the message */
+	for (i = 0; i < sizeof(header); i++) {
+		ret = mhdp_mailbox_read(regs);
+		if (ret < 0)
+			return ret;
+
+		header[i] = ret;
+	}
+
+	mbox_size = get_unaligned_be16(header + 2);
+
+	if (opcode != header[0] || module_id != header[1] ||
+	   (opcode != HDCP_TRAN_IS_REC_ID_VALID && req_size != mbox_size)) {
+		/*
+		 * If the message in mailbox is not what we want, we need to
+		 * clear the mailbox by reading its contents.
+		 */
+		for (i = 0; i < mbox_size; i++)
+			if (mhdp_mailbox_read(regs) < 0)
+				break;
+
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mhdp_mailbox_recv_data(void __iomem *regs,
+				  u8 *buff, u16 buff_size)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < buff_size; i++) {
+		ret = mhdp_mailbox_read(regs);
+		if (ret < 0)
+			return ret;
+
+		buff[i] = ret;
+	}
+
+	return 0;
+}
+
+static int mhdp_mailbox_send(void __iomem *regs, u8 module_id,
+			     u8 opcode, u16 size, u8 *message)
+{
+	u8 header[4];
+	int ret, i;
+
+	header[0] = opcode;
+	header[1] = module_id;
+	put_unaligned_be16(size, header + 2);
+
+	for (i = 0; i < sizeof(header); i++) {
+		ret = mhdp_mailbox_write(regs, header[i]);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < size; i++) {
+		ret = mhdp_mailbox_write(regs, message[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
+			   u8 opcode, u16 size, u8 *message)
+{
+	int ret;
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = mhdp_mailbox_send(base->regs, module_id, opcode, size, message);
+
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send);
+
+int cdns_mhdp_mailbox_send_recv(struct cdns_mhdp_base *base,
+				u8 module_id, u8 opcode,
+				u16 msg_size, u8 *msg,
+				u16 resp_size, u8 *resp)
+{
+	int ret;
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = mhdp_mailbox_send(base->regs, module_id,
+				opcode, msg_size, msg);
+	if (ret)
+		goto out;
+
+	ret = mhdp_mailbox_recv_header(base->regs, module_id,
+				       opcode, resp_size);
+	if (ret)
+		goto out;
+
+	ret = mhdp_mailbox_recv_data(base->regs, resp, resp_size);
+out:
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	if (ret)
+		dev_err(base->dev, "ModuleID=%d, CMD=%d failed: %d\n",
+			module_id, opcode, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send_recv);
+
+int cdns_mhdp_mailbox_send_recv_multi(struct cdns_mhdp_base *base,
+				      u8 module_id, u8 opcode,
+				      u16 msg_size, u8 *msg,
+				      u8 opcode_resp,
+				      u16 resp1_size, u8 *resp1,
+				      u16 resp2_size, u8 *resp2)
+{
+	int ret;
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = mhdp_mailbox_send(base->regs, module_id,
+				opcode, msg_size, msg);
+	if (ret)
+		goto out;
+
+	ret = mhdp_mailbox_recv_header(base->regs, module_id, opcode_resp,
+				       resp1_size + resp2_size);
+	if (ret)
+		goto out;
+
+	ret = mhdp_mailbox_recv_data(base->regs, resp1, resp1_size);
+	if (ret)
+		goto out;
+
+	ret = mhdp_mailbox_recv_data(base->regs, resp2, resp2_size);
+out:
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	if (ret)
+		dev_err(base->dev, "ModuleID=%d, MSG_CMD=%d Resp_CMD=%d failed: %d\n",
+			module_id, opcode, opcode_resp, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send_recv_multi);
+
+/*
+ * Secure mailbox access functions:
+ * These functions handle secure mailbox communication, which differs
+ * from non-secure mailbox access. They use the secure address.
+ */
+int cdns_mhdp_secure_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
+				  u8 opcode, u16 size, u8 *message)
+{
+	int ret;
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = mhdp_mailbox_send(base->sapb_regs, module_id, opcode, size, message);
+
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_secure_mailbox_send);
+
+int cdns_mhdp_secure_mailbox_send_recv(struct cdns_mhdp_base *base,
+				       u8 module_id, u8 opcode,
+				       u16 msg_size, u8 *msg,
+				       u16 resp_size, u8 *resp)
+{
+	int ret;
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = mhdp_mailbox_send(base->sapb_regs, module_id,
+				opcode, msg_size, msg);
+	if (ret)
+		goto out;
+
+	ret = mhdp_mailbox_recv_header(base->sapb_regs, module_id,
+				       opcode, resp_size);
+	if (ret)
+		goto out;
+
+	ret = mhdp_mailbox_recv_data(base->sapb_regs, resp, resp_size);
+out:
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	if (ret)
+		dev_err(base->dev, "ModuleID=%d, CMD=%d failed: %d\n",
+			module_id, opcode, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_secure_mailbox_send_recv);
+
+int cdns_mhdp_secure_mailbox_send_recv_multi(struct cdns_mhdp_base *base,
+					     u8 module_id, u8 opcode,
+					     u16 msg_size, u8 *msg,
+					     u8 opcode_resp,
+					     u16 resp1_size, u8 *resp1,
+					     u16 resp2_size, u8 *resp2)
+{
+	int ret;
+
+	mutex_lock(&mhdp_mailbox_mutex);
+
+	ret = mhdp_mailbox_send(base->sapb_regs, module_id,
+				opcode, msg_size, msg);
+	if (ret)
+		goto out;
+
+	ret = mhdp_mailbox_recv_header(base->sapb_regs, module_id,
+				       opcode_resp,
+				       resp1_size + resp2_size);
+	if (ret)
+		goto out;
+
+	ret = mhdp_mailbox_recv_data(base->sapb_regs, resp1, resp1_size);
+	if (ret)
+		goto out;
+
+	if (module_id == MB_MODULE_ID_HDCP_TX &&
+	    opcode == HDCP_TRAN_IS_REC_ID_VALID)
+		ret = mhdp_mailbox_recv_data(base->sapb_regs, resp2, 5 * resp1[0]);
+	else
+		ret = mhdp_mailbox_recv_data(base->sapb_regs, resp2, resp2_size);
+out:
+	mutex_unlock(&mhdp_mailbox_mutex);
+
+	if (ret)
+		dev_err(base->dev, "ModuleID=%d, CMD=%d failed: %d\n",
+			module_id, opcode, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_secure_mailbox_send_recv_multi);
+
+/* General read/write helper functions */
+int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32 *value)
+{
+	u8 msg[4], resp[8];
+	int ret;
+
+	put_unaligned_be32(addr, msg);
+
+	ret = cdns_mhdp_mailbox_send_recv(base, MB_MODULE_ID_GENERAL,
+					  GENERAL_REGISTER_READ,
+					  sizeof(msg), msg, sizeof(resp), resp);
+	if (ret)
+		goto out;
+
+	/* Returned address value should be the same as requested */
+	if (memcmp(msg, resp, sizeof(msg))) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	*value = get_unaligned_be32(resp + 4);
+out:
+	if (ret) {
+		dev_err(base->dev, "Failed to read register\n");
+		*value = 0;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_reg_read);
+
+int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val)
+{
+	u8 msg[8];
+
+	put_unaligned_be32(addr, msg);
+	put_unaligned_be32(val, msg + 4);
+
+	return cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
+				     GENERAL_REGISTER_WRITE,
+				     sizeof(msg), msg);
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_reg_write);
+
+/* DPTX helper functions */
+int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr, u32 val)
+{
+	u8 msg[6];
+
+	put_unaligned_be16(addr, msg);
+	put_unaligned_be32(val, msg + 2);
+
+	return cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
+				      DPTX_WRITE_REGISTER, sizeof(msg), msg);
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write);
+
+int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
+			       u8 start_bit, u8 bits_no, u32 val)
+{
+	u8 field[8];
+
+	put_unaligned_be16(addr, field);
+	field[2] = start_bit;
+	field[3] = bits_no;
+	put_unaligned_be32(val, field + 4);
+
+	return cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
+				      DPTX_WRITE_FIELD, sizeof(field), field);
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write_bit);
+
+int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
+			u32 addr, u8 *data, u16 len)
+{
+	u8 msg[5], reg[5];
+
+	put_unaligned_be16(len, msg);
+	put_unaligned_be24(addr, msg + 2);
+
+	return cdns_mhdp_mailbox_send_recv_multi(base,
+						 MB_MODULE_ID_DP_TX,
+						 DPTX_READ_DPCD,
+						 sizeof(msg), msg,
+						 DPTX_READ_DPCD,
+						 sizeof(reg), reg,
+						 len, data);
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_read);
+
+int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8 value)
+{
+	u8 msg[6], reg[5];
+	int ret;
+
+	put_unaligned_be16(1, msg);
+	put_unaligned_be24(addr, msg + 2);
+	msg[5] = value;
+
+	ret = cdns_mhdp_mailbox_send_recv(base, MB_MODULE_ID_DP_TX,
+					  DPTX_WRITE_DPCD,
+					  sizeof(msg), msg, sizeof(reg), reg);
+	if (ret) {
+		dev_err(base->dev, "dpcd write failed: %d\n", ret);
+		return ret;
+	}
+
+	if (addr != get_unaligned_be24(reg + 2)) {
+		dev_err(base->dev, "Invalid response: expected address 0x%06x, got 0x%06x\n",
+			addr, get_unaligned_be24(reg + 2));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_write);
+
+MODULE_DESCRIPTION("Cadence MHDP Helper driver");
+MODULE_AUTHOR("Sandor Yu <Sandor.yu@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 41f72d458487f..291631c87d895 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -73,302 +73,18 @@ static void cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)
 	       mhdp->regs + CDNS_APB_INT_MASK);
 }
 
-static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
-{
-	int ret, empty;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_EMPTY,
-				 empty, !empty, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	return readl(mhdp->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
-}
-
-static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
-{
-	int ret, full;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
-				 full, !full, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
-					 u8 module_id, u8 opcode,
-					 u16 req_size)
-{
-	u32 mbox_size, i;
-	u8 header[4];
-	int ret;
-
-	/* read the header of the message */
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		header[i] = ret;
-	}
-
-	mbox_size = get_unaligned_be16(header + 2);
-
-	if (opcode != header[0] || module_id != header[1] ||
-	    req_size != mbox_size) {
-		/*
-		 * If the message in mailbox is not what we want, we need to
-		 * clear the mailbox by reading its contents.
-		 */
-		for (i = 0; i < mbox_size; i++)
-			if (cdns_mhdp_mailbox_read(mhdp) < 0)
-				break;
-
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
-				       u8 *buff, u16 buff_size)
-{
-	u32 i;
-	int ret;
-
-	for (i = 0; i < buff_size; i++) {
-		ret = cdns_mhdp_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		buff[i] = ret;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8 module_id,
-				  u8 opcode, u16 size, u8 *message)
-{
-	u8 header[4];
-	int ret, i;
-
-	header[0] = opcode;
-	header[1] = module_id;
-	put_unaligned_be16(size, header + 2);
-
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, header[i]);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < size; i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, message[i]);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static
-int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr, u32 *value)
-{
-	u8 msg[4], resp[8];
-	int ret;
-
-	put_unaligned_be32(addr, msg);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
-				     GENERAL_REGISTER_READ,
-				     sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,
-					    GENERAL_REGISTER_READ,
-					    sizeof(resp));
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));
-	if (ret)
-		goto out;
-
-	/* Returned address value should be the same as requested */
-	if (memcmp(msg, resp, sizeof(msg))) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	*value = get_unaligned_be32(resp + 4);
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to read register\n");
-		*value = 0;
-	}
-
-	return ret;
-}
-
-static
-int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u16 addr, u32 val)
-{
-	u8 msg[6];
-	int ret;
-
-	put_unaligned_be16(addr, msg);
-	put_unaligned_be32(val, msg + 2);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_REGISTER, sizeof(msg), msg);
-
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
-static
-int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
-			    u8 start_bit, u8 bits_no, u32 val)
-{
-	u8 field[8];
-	int ret;
-
-	put_unaligned_be16(addr, field);
-	field[2] = start_bit;
-	field[3] = bits_no;
-	put_unaligned_be32(val, field + 4);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_FIELD, sizeof(field), field);
-
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
-static
-int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
-			u32 addr, u8 *data, u16 len)
-{
-	u8 msg[5], reg[5];
-	int ret;
-
-	put_unaligned_be16(len, msg);
-	put_unaligned_be24(addr, msg + 2);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_READ_DPCD, sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_READ_DPCD,
-					    sizeof(reg) + len);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, data, len);
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
-static
-int cdns_mhdp_dpcd_write(struct cdns_mhdp_device *mhdp, u32 addr, u8 value)
-{
-	u8 msg[6], reg[5];
-	int ret;
-
-	put_unaligned_be16(1, msg);
-	put_unaligned_be24(addr, msg + 2);
-	msg[5] = value;
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_DPCD, sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_WRITE_DPCD, sizeof(reg));
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
-	if (ret)
-		goto out;
-
-	if (addr != get_unaligned_be24(reg + 2))
-		ret = -EINVAL;
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	if (ret)
-		dev_err(mhdp->dev, "dpcd write failed: %d\n", ret);
-	return ret;
-}
-
 static
 int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enable)
 {
-	u8 msg[5];
-	int ret, i;
-
-	msg[0] = GENERAL_MAIN_CONTROL;
-	msg[1] = MB_MODULE_ID_GENERAL;
-	msg[2] = 0;
-	msg[3] = 1;
-	msg[4] = enable ? FW_ACTIVE : FW_STANDBY;
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	for (i = 0; i < sizeof(msg); i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, msg[i]);
-		if (ret)
-			goto out;
-	}
-
-	/* read the firmware state */
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, msg, sizeof(msg));
-	if (ret)
-		goto out;
-
-	ret = 0;
+	u8 status;
+	int ret;
 
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
+	status = enable ? FW_ACTIVE : FW_STANDBY;
 
+	ret = cdns_mhdp_mailbox_send_recv(&mhdp->base, MB_MODULE_ID_GENERAL,
+					  GENERAL_MAIN_CONTROL,
+					  sizeof(status), &status,
+					  sizeof(status), &status);
 	if (ret < 0)
 		dev_err(mhdp->dev, "set firmware active failed\n");
 	return ret;
@@ -380,34 +96,18 @@ int cdns_mhdp_get_hpd_status(struct cdns_mhdp_device *mhdp)
 	u8 status;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_HPD_STATE, 0, NULL);
-	if (ret)
-		goto err_get_hpd;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_HPD_STATE,
-					    sizeof(status));
-	if (ret)
-		goto err_get_hpd;
+	ret = cdns_mhdp_mailbox_send_recv(&mhdp->base, MB_MODULE_ID_DP_TX,
+					  DPTX_HPD_STATE,
+					  0, NULL,
+					  sizeof(status), &status);
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, &status, sizeof(status));
 	if (ret)
-		goto err_get_hpd;
-
-	mutex_unlock(&mhdp->mbox_mutex);
+		return ret;
 
 	dev_dbg(mhdp->dev, "%s: HPD %splugged\n", __func__,
 		status ? "" : "un");
 
 	return status;
-
-err_get_hpd:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
 }
 
 static
@@ -418,28 +118,17 @@ int cdns_mhdp_get_edid_block(void *data, u8 *edid,
 	u8 msg[2], reg[2], i;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
-
 	for (i = 0; i < 4; i++) {
 		msg[0] = block / 2;
 		msg[1] = block % 2;
 
-		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-					     DPTX_GET_EDID, sizeof(msg), msg);
-		if (ret)
-			continue;
-
-		ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-						    DPTX_GET_EDID,
-						    sizeof(reg) + length);
-		if (ret)
-			continue;
-
-		ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
-		if (ret)
-			continue;
-
-		ret = cdns_mhdp_mailbox_recv_data(mhdp, edid, length);
+		ret = cdns_mhdp_mailbox_send_recv_multi(&mhdp->base,
+							MB_MODULE_ID_DP_TX,
+							DPTX_GET_EDID,
+							sizeof(msg), msg,
+							DPTX_GET_EDID,
+							sizeof(reg), reg,
+							length, edid);
 		if (ret)
 			continue;
 
@@ -447,8 +136,6 @@ int cdns_mhdp_get_edid_block(void *data, u8 *edid,
 			break;
 	}
 
-	mutex_unlock(&mhdp->mbox_mutex);
-
 	if (ret)
 		dev_err(mhdp->dev, "get block[%d] edid failed: %d\n",
 			block, ret);
@@ -462,21 +149,9 @@ int cdns_mhdp_read_hpd_event(struct cdns_mhdp_device *mhdp)
 	u8 event = 0;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_READ_EVENT, 0, NULL);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_READ_EVENT, sizeof(event));
-	if (ret < 0)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, &event, sizeof(event));
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
+	ret = cdns_mhdp_mailbox_send_recv(&mhdp->base, MB_MODULE_ID_DP_TX,
+					  DPTX_READ_EVENT,
+					  0, NULL, sizeof(event), &event);
 
 	if (ret < 0)
 		return ret;
@@ -510,35 +185,23 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp, unsigned int nlanes,
 	put_unaligned_be16(udelay, payload + 1);
 	memcpy(payload + 3, lanes_data, nlanes);
 
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_ADJUST_LT,
-				     sizeof(payload), payload);
-	if (ret)
-		goto out;
-
 	/* Yes, read the DPCD read command response */
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_READ_DPCD,
-					    sizeof(hdr) + DP_LINK_STATUS_SIZE);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, hdr, sizeof(hdr));
+	ret = cdns_mhdp_mailbox_send_recv_multi(&mhdp->base,
+						MB_MODULE_ID_DP_TX,
+						DPTX_ADJUST_LT,
+						sizeof(payload), payload,
+						HDMI_TX_EDID,
+						sizeof(hdr), hdr,
+						DP_LINK_STATUS_SIZE,
+						link_status);
 	if (ret)
 		goto out;
 
 	addr = get_unaligned_be24(hdr + 2);
 	if (addr != DP_LANE0_1_STATUS)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, link_status,
-					  DP_LINK_STATUS_SIZE);
+		ret = -EINVAL;
 
 out:
-	mutex_unlock(&mhdp->mbox_mutex);
-
 	if (ret)
 		dev_err(mhdp->dev, "Failed to adjust Link Training.\n");
 
@@ -847,7 +510,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 		unsigned int i;
 
 		for (i = 0; i < msg->size; ++i) {
-			ret = cdns_mhdp_dpcd_write(mhdp,
+			ret = cdns_mhdp_dpcd_write(&mhdp->base,
 						   msg->address + i, buf[i]);
 			if (!ret)
 				continue;
@@ -859,7 +522,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 			return ret;
 		}
 	} else {
-		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
+		ret = cdns_mhdp_dpcd_read(&mhdp->base, msg->address,
 					  msg->buffer, msg->size);
 		if (ret) {
 			dev_err(mhdp->dev,
@@ -887,12 +550,12 @@ static int cdns_mhdp_link_training_init(struct cdns_mhdp_device *mhdp)
 	if (!mhdp->host.scrambler)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_ENHNCD,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_ENHNCD,
 			    mhdp->sink.enhanced & mhdp->host.enhanced);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_LANE_EN,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_LANE_EN,
 			    CDNS_DP_LANE_EN_LANES(mhdp->link.num_lanes));
 
 	cdns_mhdp_link_configure(&mhdp->aux, &mhdp->link);
@@ -913,7 +576,7 @@ static int cdns_mhdp_link_training_init(struct cdns_mhdp_device *mhdp)
 		return ret;
 	}
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG,
 			    CDNS_PHY_COMMON_CONFIG |
 			    CDNS_PHY_TRAINING_EN |
 			    CDNS_PHY_TRAINING_TYPE(1) |
@@ -1058,7 +721,7 @@ static bool cdns_mhdp_link_training_channel_eq(struct cdns_mhdp_device *mhdp,
 		CDNS_PHY_TRAINING_TYPE(eq_tps);
 	if (eq_tps != 4)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
 			   (eq_tps != 4) ? eq_tps | DP_LINK_SCRAMBLING_DISABLE :
@@ -1322,7 +985,7 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 			   mhdp->host.scrambler ? 0 :
 			   DP_LINK_SCRAMBLING_DISABLE);
 
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &reg32);
+	ret = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &reg32);
 	if (ret < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1333,13 +996,13 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 	reg32 |= CDNS_DP_NUM_LANES(mhdp->link.num_lanes);
 	reg32 |= CDNS_DP_WR_FAILING_EDGE_VSYNC;
 	reg32 |= CDNS_DP_FRAMER_EN;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, reg32);
 
 	/* Reset PHY config */
 	reg32 = CDNS_PHY_COMMON_CONFIG | CDNS_PHY_TRAINING_TYPE(1);
 	if (!mhdp->host.scrambler)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	return 0;
 err:
@@ -1347,7 +1010,7 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 	reg32 = CDNS_PHY_COMMON_CONFIG | CDNS_PHY_TRAINING_TYPE(1);
 	if (!mhdp->host.scrambler)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
 			   DP_TRAINING_PATTERN_DISABLE);
@@ -1461,7 +1124,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	mhdp->link.num_lanes = cdns_mhdp_max_num_lanes(mhdp);
 
 	/* Disable framer for link training */
-	err = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
+	err = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
 	if (err < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1470,7 +1133,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	}
 
 	resp &= ~CDNS_DP_FRAMER_EN;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
 
 	/* Spread AMP if required, enable 8b/10b coding */
 	amp[0] = cdns_mhdp_get_ssc_supported(mhdp) ? DP_SPREAD_AMP_0_5 : 0;
@@ -1834,7 +1497,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		bnd_hsync2vsync |= CDNS_IP_DET_INTERLACE_FORMAT;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_BND_HSYNC2VSYNC(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_BND_HSYNC2VSYNC(stream_id),
 			    bnd_hsync2vsync);
 
 	hsync2vsync_pol_ctrl = 0;
@@ -1842,10 +1505,10 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 		hsync2vsync_pol_ctrl |= CDNS_H2V_HSYNC_POL_ACTIVE_LOW;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		hsync2vsync_pol_ctrl |= CDNS_H2V_VSYNC_POL_ACTIVE_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
 			    hsync2vsync_pol_ctrl);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_PXL_REPR(stream_id), pxl_repr);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_PXL_REPR(stream_id), pxl_repr);
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		dp_framer_sp |= CDNS_DP_FRAMER_INTERLACE;
@@ -1853,19 +1516,19 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 		dp_framer_sp |= CDNS_DP_FRAMER_HSYNC_POL_LOW;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		dp_framer_sp |= CDNS_DP_FRAMER_VSYNC_POL_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_SP(stream_id), dp_framer_sp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_SP(stream_id), dp_framer_sp);
 
 	front_porch = mode->crtc_hsync_start - mode->crtc_hdisplay;
 	back_porch = mode->crtc_htotal - mode->crtc_hsync_end;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRONT_BACK_PORCH(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRONT_BACK_PORCH(stream_id),
 			    CDNS_DP_FRONT_PORCH(front_porch) |
 			    CDNS_DP_BACK_PORCH(back_porch));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_BYTE_COUNT(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_BYTE_COUNT(stream_id),
 			    mode->crtc_hdisplay * bpp / 8);
 
 	msa_h0 = mode->crtc_htotal - mode->crtc_hsync_start;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_HORIZONTAL_0(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_HORIZONTAL_0(stream_id),
 			    CDNS_DP_MSAH0_H_TOTAL(mode->crtc_htotal) |
 			    CDNS_DP_MSAH0_HSYNC_START(msa_h0));
 
@@ -1874,11 +1537,11 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 			   CDNS_DP_MSAH1_HDISP_WIDTH(mode->crtc_hdisplay);
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 		msa_horizontal_1 |= CDNS_DP_MSAH1_HSYNC_POL_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_HORIZONTAL_1(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_HORIZONTAL_1(stream_id),
 			    msa_horizontal_1);
 
 	msa_v0 = mode->crtc_vtotal - mode->crtc_vsync_start;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_VERTICAL_0(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_VERTICAL_0(stream_id),
 			    CDNS_DP_MSAV0_V_TOTAL(mode->crtc_vtotal) |
 			    CDNS_DP_MSAV0_VSYNC_START(msa_v0));
 
@@ -1887,7 +1550,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 			 CDNS_DP_MSAV1_VDISP_WIDTH(mode->crtc_vdisplay);
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		msa_vertical_1 |= CDNS_DP_MSAV1_VSYNC_POL_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_VERTICAL_1(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_VERTICAL_1(stream_id),
 			    msa_vertical_1);
 
 	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) &&
@@ -1899,14 +1562,14 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	if (pxlfmt == DRM_COLOR_FORMAT_YCBCR420)
 		misc1 = CDNS_DP_TEST_VSC_SDP;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_MISC(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_MISC(stream_id),
 			    misc0 | (misc1 << 8));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_HORIZONTAL(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_HORIZONTAL(stream_id),
 			    CDNS_DP_H_HSYNC_WIDTH(hsync) |
 			    CDNS_DP_H_H_TOTAL(mode->crtc_hdisplay));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_0(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_VERTICAL_0(stream_id),
 			    CDNS_DP_V0_VHEIGHT(mode->crtc_vdisplay) |
 			    CDNS_DP_V0_VSTART(msa_v0));
 
@@ -1915,13 +1578,13 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	    mode->crtc_vtotal % 2 == 0)
 		dp_vertical_1 |= CDNS_DP_V1_VTOTAL_EVEN;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_1(stream_id), dp_vertical_1);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_VERTICAL_1(stream_id), dp_vertical_1);
 
-	cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_VB_ID(stream_id), 2, 1,
-				(mode->flags & DRM_MODE_FLAG_INTERLACE) ?
-				CDNS_DP_VB_ID_INTERLACED : 0);
+	cdns_mhdp_dp_reg_write_bit(&mhdp->base, CDNS_DP_VB_ID(stream_id), 2, 1,
+				   (mode->flags & DRM_MODE_FLAG_INTERLACE) ?
+				   CDNS_DP_VB_ID_INTERLACED : 0);
 
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &framer);
+	ret = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &framer);
 	if (ret < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1930,7 +1593,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	}
 	framer |= CDNS_DP_FRAMER_EN;
 	framer &= ~CDNS_DP_NO_VIDEO_MODE;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
 }
 
 static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
@@ -1963,15 +1626,15 @@ static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
 
 	mhdp->stream_id = 0;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_TU,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_TU,
 			    CDNS_DP_FRAMER_TU_VS(vs) |
 			    CDNS_DP_FRAMER_TU_SIZE(tu_size) |
 			    CDNS_DP_FRAMER_TU_CNT_RST_EN);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_LINE_THRESH(0),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_LINE_THRESH(0),
 			    line_thresh & GENMASK(5, 0));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_STREAM_CONFIG_2(0),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_STREAM_CONFIG_2(0),
 			    CDNS_DP_SC2_TU_VS_DIFF((tu_size - vs > 3) ?
 						   0 : tu_size - vs));
 
@@ -2006,13 +1669,13 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 		mhdp->info->ops->enable(mhdp);
 
 	/* Enable VIF clock for stream 0 */
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
+	ret = cdns_mhdp_reg_read(&mhdp->base, CDNS_DPTX_CAR, &resp);
 	if (ret < 0) {
 		dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
 		goto out;
 	}
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_CAR,
 			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
@@ -2083,16 +1746,16 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 		cdns_mhdp_hdcp_disable(mhdp);
 
 	mhdp->bridge_enabled = false;
-	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
+	cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
 	resp &= ~CDNS_DP_FRAMER_EN;
 	resp |= CDNS_DP_NO_VIDEO_MODE;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
 
 	cdns_mhdp_link_down(mhdp);
 
 	/* Disable VIF clock for stream 0 */
-	cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
+	cdns_mhdp_reg_read(&mhdp->base, CDNS_DPTX_CAR, &resp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_CAR,
 			    resp & ~(CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN));
 
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
@@ -2471,7 +2134,6 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	mhdp->clk = clk;
 	mhdp->dev = dev;
-	mutex_init(&mhdp->mbox_mutex);
 	mutex_init(&mhdp->link_mutex);
 	spin_lock_init(&mhdp->start_lock);
 
@@ -2502,6 +2164,11 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mhdp);
 
+	/* init base struct for access mailbox  */
+	mhdp->base.dev = mhdp->dev;
+	mhdp->base.regs = mhdp->regs;
+	mhdp->base.sapb_regs = mhdp->sapb_regs;
+
 	mhdp->info = of_device_get_match_data(dev);
 
 	clk_prepare_enable(clk);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bad2fc0c73066..d209c7b3bbfab 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 
+#include <drm/bridge/cdns-mhdp-helper.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
@@ -27,10 +28,6 @@ struct phy;
 #define CDNS_APB_CTRL				0x00000
 #define CDNS_CPU_STALL				BIT(3)
 
-#define CDNS_MAILBOX_FULL			0x00008
-#define CDNS_MAILBOX_EMPTY			0x0000c
-#define CDNS_MAILBOX_TX_DATA			0x00010
-#define CDNS_MAILBOX_RX_DATA			0x00014
 #define CDNS_KEEP_ALIVE				0x00018
 #define CDNS_KEEP_ALIVE_MASK			GENMASK(7, 0)
 
@@ -198,45 +195,10 @@ struct phy;
 #define CDNS_DP_BYTE_COUNT(s)			(CDNS_DPTX_STREAM(s) + 0x7c)
 #define CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT	16
 
-/* mailbox */
-#define MAILBOX_RETRY_US			1000
-#define MAILBOX_TIMEOUT_US			2000000
-
-#define MB_OPCODE_ID				0
-#define MB_MODULE_ID				1
-#define MB_SIZE_MSB_ID				2
-#define MB_SIZE_LSB_ID				3
-#define MB_DATA_ID				4
-
-#define MB_MODULE_ID_DP_TX			0x01
-#define MB_MODULE_ID_HDCP_TX			0x07
-#define MB_MODULE_ID_HDCP_RX			0x08
-#define MB_MODULE_ID_HDCP_GENERAL		0x09
-#define MB_MODULE_ID_GENERAL			0x0a
-
-/* firmware and opcodes */
+/* firmware */
 #define FW_NAME					"cadence/mhdp8546.bin"
 #define CDNS_MHDP_IMEM				0x10000
 
-#define GENERAL_MAIN_CONTROL			0x01
-#define GENERAL_TEST_ECHO			0x02
-#define GENERAL_BUS_SETTINGS			0x03
-#define GENERAL_TEST_ACCESS			0x04
-#define GENERAL_REGISTER_READ			0x07
-
-#define DPTX_SET_POWER_MNG			0x00
-#define DPTX_GET_EDID				0x02
-#define DPTX_READ_DPCD				0x03
-#define DPTX_WRITE_DPCD				0x04
-#define DPTX_ENABLE_EVENT			0x05
-#define DPTX_WRITE_REGISTER			0x06
-#define DPTX_READ_REGISTER			0x07
-#define DPTX_WRITE_FIELD			0x08
-#define DPTX_READ_EVENT				0x0a
-#define DPTX_GET_LAST_AUX_STAUS			0x0e
-#define DPTX_HPD_STATE				0x11
-#define DPTX_ADJUST_LT				0x12
-
 #define FW_STANDBY				0
 #define FW_ACTIVE				1
 
@@ -352,6 +314,8 @@ struct cdns_mhdp_hdcp {
 };
 
 struct cdns_mhdp_device {
+	struct cdns_mhdp_base base;
+
 	void __iomem *regs;
 	void __iomem *sapb_regs;
 	void __iomem *j721e_regs;
@@ -362,9 +326,6 @@ struct cdns_mhdp_device {
 
 	const struct cdns_mhdp_platform_info *info;
 
-	/* This is to protect mailbox communications with the firmware */
-	struct mutex mbox_mutex;
-
 	/*
 	 * "link_mutex" protects the access to all the link parameters
 	 * including the link training process. Link training will be
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index 31832ba4017f1..0d3979577a924 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -15,144 +15,20 @@
 
 #include "cdns-mhdp8546-hdcp.h"
 
-static int cdns_mhdp_secure_mailbox_read(struct cdns_mhdp_device *mhdp)
-{
-	int ret, empty;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->sapb_regs + CDNS_MAILBOX_EMPTY,
-				 empty, !empty, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	return readl(mhdp->sapb_regs + CDNS_MAILBOX_RX_DATA) & 0xff;
-}
-
-static int cdns_mhdp_secure_mailbox_write(struct cdns_mhdp_device *mhdp,
-					  u8 val)
-{
-	int ret, full;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->sapb_regs + CDNS_MAILBOX_FULL,
-				 full, !full, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	writel(val, mhdp->sapb_regs + CDNS_MAILBOX_TX_DATA);
-
-	return 0;
-}
-
-static int cdns_mhdp_secure_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
-						u8 module_id,
-						u8 opcode,
-						u16 req_size)
-{
-	u32 mbox_size, i;
-	u8 header[4];
-	int ret;
-
-	/* read the header of the message */
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_secure_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		header[i] = ret;
-	}
-
-	mbox_size = get_unaligned_be16(header + 2);
-
-	if (opcode != header[0] || module_id != header[1] ||
-	    (opcode != HDCP_TRAN_IS_REC_ID_VALID && req_size != mbox_size)) {
-		for (i = 0; i < mbox_size; i++)
-			if (cdns_mhdp_secure_mailbox_read(mhdp) < 0)
-				break;
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_secure_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
-					      u8 *buff, u16 buff_size)
-{
-	int ret;
-	u32 i;
-
-	for (i = 0; i < buff_size; i++) {
-		ret = cdns_mhdp_secure_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		buff[i] = ret;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_secure_mailbox_send(struct cdns_mhdp_device *mhdp,
-					 u8 module_id,
-					 u8 opcode,
-					 u16 size,
-					 u8 *message)
-{
-	u8 header[4];
-	int ret;
-	u32 i;
-
-	header[0] = opcode;
-	header[1] = module_id;
-	put_unaligned_be16(size, header + 2);
-
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_secure_mailbox_write(mhdp, header[i]);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < size; i++) {
-		ret = cdns_mhdp_secure_mailbox_write(mhdp, message[i]);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int cdns_mhdp_hdcp_get_status(struct cdns_mhdp_device *mhdp,
 				     u16 *hdcp_port_status)
 {
 	u8 hdcp_status[HDCP_STATUS_SIZE];
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP_TRAN_STATUS_CHANGE, 0, NULL);
-	if (ret)
-		goto err_get_hdcp_status;
-
-	ret = cdns_mhdp_secure_mailbox_recv_header(mhdp, MB_MODULE_ID_HDCP_TX,
-						   HDCP_TRAN_STATUS_CHANGE,
-						   sizeof(hdcp_status));
-	if (ret)
-		goto err_get_hdcp_status;
-
-	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, hdcp_status,
-						 sizeof(hdcp_status));
+	ret = cdns_mhdp_secure_mailbox_send_recv(&mhdp->base, MB_MODULE_ID_HDCP_TX,
+						 HDCP_TRAN_STATUS_CHANGE, 0, NULL,
+						 sizeof(hdcp_status), hdcp_status);
 	if (ret)
-		goto err_get_hdcp_status;
+		return ret;
 
 	*hdcp_port_status = ((u16)(hdcp_status[0] << 8) | hdcp_status[1]);
 
-err_get_hdcp_status:
-	mutex_unlock(&mhdp->mbox_mutex);
-
 	return ret;
 }
 
@@ -170,98 +46,52 @@ static u8 cdns_mhdp_hdcp_handle_status(struct cdns_mhdp_device *mhdp,
 static int cdns_mhdp_hdcp_rx_id_valid_response(struct cdns_mhdp_device *mhdp,
 					       u8 valid)
 {
-	int ret;
-
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
+	return cdns_mhdp_secure_mailbox_send(&mhdp->base, MB_MODULE_ID_HDCP_TX,
 					    HDCP_TRAN_RESPOND_RECEIVER_ID_VALID,
 					    1, &valid);
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
 }
 
 static int cdns_mhdp_hdcp_rx_id_valid(struct cdns_mhdp_device *mhdp,
 				      u8 *recv_num, u8 *hdcp_rx_id)
 {
 	u8 rec_id_hdr[2];
-	u8 status;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP_TRAN_IS_REC_ID_VALID, 0, NULL);
-	if (ret)
-		goto err_rx_id_valid;
-
-	ret = cdns_mhdp_secure_mailbox_recv_header(mhdp, MB_MODULE_ID_HDCP_TX,
-						   HDCP_TRAN_IS_REC_ID_VALID,
-						   sizeof(status));
+	ret = cdns_mhdp_secure_mailbox_send_recv_multi(&mhdp->base,
+						       MB_MODULE_ID_HDCP_TX,
+						       HDCP_TRAN_IS_REC_ID_VALID,
+						       0, NULL,
+						       HDCP_TRAN_IS_REC_ID_VALID,
+						       sizeof(rec_id_hdr), rec_id_hdr,
+						       0, hdcp_rx_id);
 	if (ret)
-		goto err_rx_id_valid;
-
-	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, rec_id_hdr, 2);
-	if (ret)
-		goto err_rx_id_valid;
+		return ret;
 
 	*recv_num = rec_id_hdr[0];
 
-	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, hdcp_rx_id, 5 * *recv_num);
-
-err_rx_id_valid:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
+	return 0;
 }
 
 static int cdns_mhdp_hdcp_km_stored_resp(struct cdns_mhdp_device *mhdp,
 					 u32 size, u8 *km)
 {
-	int ret;
-
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP2X_TX_RESPOND_KM, size, km);
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
+	return cdns_mhdp_secure_mailbox_send(&mhdp->base, MB_MODULE_ID_HDCP_TX,
+					     HDCP2X_TX_RESPOND_KM, size, km);
 }
 
 static int cdns_mhdp_hdcp_tx_is_km_stored(struct cdns_mhdp_device *mhdp,
 					  u8 *resp, u32 size)
 {
-	int ret;
-
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP2X_TX_IS_KM_STORED, 0, NULL);
-	if (ret)
-		goto err_is_km_stored;
-
-	ret = cdns_mhdp_secure_mailbox_recv_header(mhdp, MB_MODULE_ID_HDCP_TX,
-						   HDCP2X_TX_IS_KM_STORED,
-						   size);
-	if (ret)
-		goto err_is_km_stored;
-
-	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, resp, size);
-err_is_km_stored:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
+	return cdns_mhdp_secure_mailbox_send_recv(&mhdp->base, MB_MODULE_ID_HDCP_TX,
+						 HDCP2X_TX_IS_KM_STORED,
+						 0, NULL, size, resp);
 }
 
 static int cdns_mhdp_hdcp_tx_config(struct cdns_mhdp_device *mhdp,
 				    u8 hdcp_cfg)
 {
-	int ret;
-
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP_TRAN_CONFIGURATION, 1, &hdcp_cfg);
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
+	return cdns_mhdp_secure_mailbox_send(&mhdp->base, MB_MODULE_ID_HDCP_TX,
+					     HDCP_TRAN_CONFIGURATION, 1, &hdcp_cfg);
 }
 
 static int cdns_mhdp_hdcp_set_config(struct cdns_mhdp_device *mhdp,
@@ -502,30 +332,18 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
 
 int cdns_mhdp_hdcp_set_lc(struct cdns_mhdp_device *mhdp, u8 *val)
 {
-	int ret;
-
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_GENERAL,
-					    HDCP_GENERAL_SET_LC_128,
-					    16, val);
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
+	return cdns_mhdp_secure_mailbox_send(&mhdp->base, MB_MODULE_ID_HDCP_GENERAL,
+					     HDCP_GENERAL_SET_LC_128,
+					     16, val);
 }
 
 int
 cdns_mhdp_hdcp_set_public_key_param(struct cdns_mhdp_device *mhdp,
 				    struct cdns_hdcp_tx_public_key_param *val)
 {
-	int ret;
-
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP2X_TX_SET_PUBLIC_KEY_PARAMS,
-					    sizeof(*val), (u8 *)val);
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
+	return cdns_mhdp_secure_mailbox_send(&mhdp->base, MB_MODULE_ID_HDCP_TX,
+					     HDCP2X_TX_SET_PUBLIC_KEY_PARAMS,
+					     sizeof(*val), (u8 *)val);
 }
 
 int cdns_mhdp_hdcp_enable(struct cdns_mhdp_device *mhdp, u8 content_type)
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
index 334c0b8b0d4f5..fff4194c7dfd0 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
@@ -9,6 +9,7 @@
 #ifndef CDNS_MHDP8546_HDCP_H
 #define CDNS_MHDP8546_HDCP_H
 
+#include <drm/bridge/cdns-mhdp-helper.h>
 #include "cdns-mhdp8546-core.h"
 
 #define HDCP_MAX_RECEIVERS 32
@@ -32,23 +33,6 @@ enum {
 	HDCP_SET_SEED,
 };
 
-enum {
-	HDCP_TRAN_CONFIGURATION,
-	HDCP2X_TX_SET_PUBLIC_KEY_PARAMS,
-	HDCP2X_TX_SET_DEBUG_RANDOM_NUMBERS,
-	HDCP2X_TX_RESPOND_KM,
-	HDCP1_TX_SEND_KEYS,
-	HDCP1_TX_SEND_RANDOM_AN,
-	HDCP_TRAN_STATUS_CHANGE,
-	HDCP2X_TX_IS_KM_STORED,
-	HDCP2X_TX_STORE_KM,
-	HDCP_TRAN_IS_REC_ID_VALID,
-	HDCP_TRAN_RESPOND_RECEIVER_ID_VALID,
-	HDCP_TRAN_TEST_KEYS,
-	HDCP2X_TX_SET_KM_KEY_PARAMS,
-	HDCP_NUM_OF_SUPPORTED_MESSAGES
-};
-
 enum {
 	HDCP_CONTENT_TYPE_0,
 	HDCP_CONTENT_TYPE_1,
diff --git a/include/drm/bridge/cdns-mhdp-helper.h b/include/drm/bridge/cdns-mhdp-helper.h
new file mode 100644
index 0000000000000..45e28c733842a
--- /dev/null
+++ b/include/drm/bridge/cdns-mhdp-helper.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023-2024 NXP Semiconductor, Inc.
+ */
+#ifndef __CDNS_MHDP_HELPER_H__
+#define __CDNS_MHDP_HELPER_H__
+
+#include <linux/iopoll.h>
+#include <linux/unaligned.h>
+
+/* mailbox regs offset */
+#define CDNS_MAILBOX_FULL			0x00008
+#define CDNS_MAILBOX_EMPTY			0x0000c
+#define CDNS_MAILBOX_TX_DATA			0x00010
+#define CDNS_MAILBOX_RX_DATA			0x00014
+
+#define MAILBOX_RETRY_US			1000
+#define MAILBOX_TIMEOUT_US			2000000
+
+/* Module ID Code */
+#define MB_MODULE_ID_DP_TX			0x01
+#define MB_MODULE_ID_HDMI_TX			0x03
+#define MB_MODULE_ID_HDCP_TX			0x07
+#define MB_MODULE_ID_HDCP_RX			0x08
+#define MB_MODULE_ID_HDCP_GENERAL		0x09
+#define MB_MODULE_ID_GENERAL			0x0A
+
+/* General Commands */
+#define GENERAL_MAIN_CONTROL			0x01
+#define GENERAL_TEST_ECHO			0x02
+#define GENERAL_BUS_SETTINGS			0x03
+#define GENERAL_TEST_ACCESS			0x04
+#define GENERAL_REGISTER_WRITE			0x05
+#define GENERAL_WRITE_FIELD			0x06
+#define GENERAL_REGISTER_READ			0x07
+#define GENERAL_GET_HPD_STATE			0x11
+
+/* DPTX Commands */
+#define DPTX_SET_POWER_MNG			0x00
+#define DPTX_SET_HOST_CAPABILITIES		0x01
+#define DPTX_GET_EDID				0x02
+#define DPTX_READ_DPCD				0x03
+#define DPTX_WRITE_DPCD				0x04
+#define DPTX_ENABLE_EVENT			0x05
+#define DPTX_WRITE_REGISTER			0x06
+#define DPTX_READ_REGISTER			0x07
+#define DPTX_WRITE_FIELD			0x08
+#define DPTX_TRAINING_CONTROL			0x09
+#define DPTX_READ_EVENT				0x0a
+#define DPTX_READ_LINK_STAT			0x0b
+#define DPTX_SET_VIDEO				0x0c
+#define DPTX_SET_AUDIO				0x0d
+#define DPTX_GET_LAST_AUX_STAUS			0x0e
+#define DPTX_SET_LINK_BREAK_POINT		0x0f
+#define DPTX_FORCE_LANES			0x10
+#define DPTX_HPD_STATE				0x11
+#define DPTX_ADJUST_LT				0x12
+
+/* HDMI TX Commands */
+#define HDMI_TX_READ				0x00
+#define HDMI_TX_WRITE				0x01
+#define HDMI_TX_UPDATE_READ			0x02
+#define HDMI_TX_EDID				0x03
+#define HDMI_TX_EVENTS				0x04
+#define HDMI_TX_HPD_STATUS			0x05
+
+/* HDCP TX Commands */
+#define HDCP_TRAN_CONFIGURATION			0x00
+#define HDCP2X_TX_SET_PUBLIC_KEY_PARAMS		0x01
+#define HDCP2X_TX_SET_DEBUG_RANDOM_NUMBERS	0x02
+#define HDCP2X_TX_RESPOND_KM			0x03
+#define HDCP1_TX_SEND_KEYS			0x04
+#define HDCP1_TX_SEND_RANDOM_AN			0x05
+#define HDCP_TRAN_STATUS_CHANGE			0x06
+#define HDCP2X_TX_IS_KM_STORED			0x07
+#define HDCP2X_TX_STORE_KM			0x08
+#define HDCP_TRAN_IS_REC_ID_VALID		0x09
+#define HDCP_TRAN_RESPOND_RECEIVER_ID_VALID	0x09
+#define HDCP_TRAN_TEST_KEYS			0x0a
+#define HDCP2X_TX_SET_KM_KEY_PARAMS		0x0b
+#define HDCP_NUM_OF_SUPPORTED_MESSAGES		0x0c
+
+struct cdns_mhdp_base {
+	struct device *dev;
+	void __iomem *regs;
+	void __iomem *sapb_regs;
+};
+
+/* Mailbox helper functions */
+int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base,
+			   u8 module_id, u8 opcode,
+			   u16 size, u8 *message);
+int cdns_mhdp_mailbox_send_recv(struct cdns_mhdp_base *base,
+				u8 module_id, u8 opcode,
+				u16 msg_size, u8 *msg,
+				u16 resp_size, u8 *resp);
+int cdns_mhdp_mailbox_send_recv_multi(struct cdns_mhdp_base *base,
+				      u8 module_id, u8 opcode,
+				      u16 msg_size, u8 *msg,
+				      u8 opcode_resp,
+				      u16 resp1_size, u8 *resp1,
+				      u16 resp2_size, u8 *resp2);
+
+/* Secure mailbox helper functions */
+int cdns_mhdp_secure_mailbox_send(struct cdns_mhdp_base *base,
+				  u8 module_id, u8 opcode,
+				  u16 size, u8 *message);
+int cdns_mhdp_secure_mailbox_send_recv(struct cdns_mhdp_base *base,
+				       u8 module_id, u8 opcode,
+				       u16 msg_size, u8 *msg,
+				       u16 resp_size, u8 *resp);
+int cdns_mhdp_secure_mailbox_send_recv_multi(struct cdns_mhdp_base *base,
+					     u8 module_id, u8 opcode,
+					     u16 msg_size, u8 *msg,
+					     u8 opcode_resp,
+					     u16 resp1_size, u8 *resp1,
+					     u16 resp2_size, u8 *resp2);
+
+/* General commands helper functions */
+int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32 *value);
+int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val);
+
+/* DPTX commands helper functions */
+int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr, u32 val);
+int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
+			       u8 start_bit, u8 bits_no, u32 val);
+int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
+			u32 addr, u8 *data, u16 len);
+int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8 value);
+#endif /* __CDNS_MHDP_HELPER_H__ */
-- 
2.34.1

