Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9999F4461
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 07:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209BB10E431;
	Tue, 17 Dec 2024 06:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="aC0iGw5T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2071.outbound.protection.outlook.com [40.107.104.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B9310E431
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:53:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnxwtfI41Geq63NRrgIbvXj1mJRLDcqCpi1i8sSuwGzheCOlcvE0DENNw2wPNBvsS7rU4xRkjJMt0rOSKoD6OFZNbhWIEXLv1vdv6bOFn4bSSjY2TuM+X9HOWbnVbNQ5/fowK8AKtHnppzchThxtF4HfIvZypxLJDZVbLpQ82Fgdj7I+dqXTNTVte+s9oTog3dYsstAObxaax6QKzoCt5U5nezLM3odA29L8z0z2eiovBl43dk0ChGnd8K78fY33c7+CW0EhsPZD40PipE1n6qv/gF+hVeJvrrggskk80lr9nGtE7wVep3nK53lZNcyMWlKj5oMlbMletH/AA0jDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bU66cBFQovtZ//uxCve4x5UtRRqc2ateYx5B8wkCAiY=;
 b=xoUJNMUOOcXm9QE2YZuBlp92ZBYRB524Hqh0jxw+tnmU+CSu3qa0cv5/V4m6GgZcpsaCWy3RK5fyHS2gj6Eo7Kach8U20igKOzQ+YVOaO8jHHTqddNUmwD6+B7N/8RpK05FrVUG2k/mKWbNdGo6Oix0BHbrfLBb12pZSJzudTrQXD3DCpxtIF68HlUn74A0dxt6nOfYZ3BsWHDxEGcZ7kF8q93b36vsssyhdLw6VwGouYhEA8Rq8glj/3LyqjKf82sPopbE+JhfrchZfnRAWYtArOsu8BAdW/OVq1PI5+ohx6qqYIYkp2yH+KZDe1wDNst6PBAb5DbjDo4gjn9Qiow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU66cBFQovtZ//uxCve4x5UtRRqc2ateYx5B8wkCAiY=;
 b=aC0iGw5TkOaTCmMFl8B4/WQiuZyKOqVZU129oBQ2JgvRUtUd9upFIaMwN4dYiE1RoiAEQLYHGl9h0TM2IlpL4Oovi5Hw/wvyrfDKU0/yAFN7DQFilSDF1jDRqeH6Pt9ABfyy5bNcyj/gFlYrFx3K5ElYmJjCR83WkKI1t3p3ED4r3oltWdxVA20D238kUxeFoIIyrM2jIF+B4HBeEhbm8BikYM1XV4egrrZaCsQIyKao5VteiDibtvAMfANqiRtQA00U6rtZDRBvumOAkuGnBmrk5Y5m/Z7NSeCet2bDXGCrghOvshcvJxmsF7x/IWP5o8RcguFxZOI4lGPZKanFvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB9196.eurprd04.prod.outlook.com (2603:10a6:10:2fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 17 Dec
 2024 06:53:21 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 06:53:21 +0000
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
Subject: [PATCH v20 1/9] soc: cadence: Create helper functions for Cadence MHDP
Date: Tue, 17 Dec 2024 14:51:43 +0800
Message-Id: <7fd5d54e2594aadd66598888ddf512f3d6d30e5d.1734340233.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734340233.git.Sandor.yu@nxp.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU2PR04MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 027e64b0-357c-405a-f8ed-08dd1e677eb2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z1U1luOWnjVJk57oAOD16r6oPv6DZs5xt0/jyrubFIjGYcxn6vWOmofdG4s3?=
 =?us-ascii?Q?V2TMtxYDKJ2sDE+2Jd2bCLdOZp/NLcSooolF6Px65sod7La3JkuJNOzCZWYY?=
 =?us-ascii?Q?g+u6Nzc5E3LyN0syvNlQA52xSEHOvjN+Dj+40o19JF6M9NyhTGFjSsKg2N1h?=
 =?us-ascii?Q?XXAwUW+ViJ8GhK4/DL2ldswF+ubd2+dZ+Sbpwh2H0fv9a2r1Fp/POifYzTkB?=
 =?us-ascii?Q?IP/5b5LRAeNHYyZbtDHM9dot/4SJzhCKPqFR7zqDfb96SPbclj0hVP6g9MhL?=
 =?us-ascii?Q?kD9W9cxr3eqzORpqNJLikYQ9cFfhnihj5JJlckECn5D+kPDcV+qnBvd9eFJQ?=
 =?us-ascii?Q?OsjaN4tEG4wmENYExBrZhAe521VRMjtAKLhVZ9C8frV5a8VI5qbkI4fjfFZE?=
 =?us-ascii?Q?NxkcFWF1aGnmIFknWBMVdLbsDJtNiiCTirC8jyE/2xSgZKplDoNgpEz4T0m4?=
 =?us-ascii?Q?Z4ucHTeQpU5L8vumVgRpreoAXKcWWje2LipTiUMyHo2ZQafbloU413pzsohu?=
 =?us-ascii?Q?/EqFD90GzSajych49hU1KR2WGoRoauCKYP67aTsh2pmk0eVn2zDY0xBp08MQ?=
 =?us-ascii?Q?Fs/vLi3iQYPCcVVFUjQ5DfRCdZdJ0aAUg2Dvwv2mtpLMD2sHjYJoSrh2Ouol?=
 =?us-ascii?Q?5Gai6DHYXLrnNk/BB3oDMrI0zG0ym9Ug5yiJjrBBVoo9VsHm6iWud6jUWknU?=
 =?us-ascii?Q?Szqpy1n/82SOnAW5df8eGsf6uxHD/gJH6/HtQOTK+YWOIVc8cAGUphq4iFUu?=
 =?us-ascii?Q?65BidL+WKB7/buaKtfNEVgWzrXA1Oym/Ld56x0vS+FZ0aFhvGrFIxol/cuLL?=
 =?us-ascii?Q?SgOT/4HExlNCqaEN9WnS3AsQirtdGcaqE3K84kqM1cL9I444qCW+NH79nEBr?=
 =?us-ascii?Q?KVj3JYitWwgILDb9CEjhq6bGePkdwC/HCmPKOm3nKpNLJ4B5NkVqhCcx8B1h?=
 =?us-ascii?Q?1ypN71enGsA02D0gBZvkp88ZjVnSO4azEBMTFktsI1QBBHtGppxUSqF1hQoV?=
 =?us-ascii?Q?iYIDLQlyx/N9oD7YTcLmjuovtjvQycmLH56wb2s7PnzdYqTK92dG+2JfEVaU?=
 =?us-ascii?Q?KbD2daYtnc8yZW2RJOjVg2T9HK6oHANreio1+UVeMTRVcwRKLLCIz5nyV33P?=
 =?us-ascii?Q?59LQ0ZDPaZx3Fdy7AgrMbSrVbPLOYOk8LpWM8BzTmFuDB3qYDUwGBe2Xf73p?=
 =?us-ascii?Q?KfxKVtu6/L7s3V5bF9wbqm4f0L3/r43uAnJU+l7HzBSGK924KLtfalTyceJA?=
 =?us-ascii?Q?S8mKToY5vRSFtSZ8VnMS9rRj8UZ277H4p9CI99iG3ZtyLhbh+deWDkvgTGUM?=
 =?us-ascii?Q?JPulDLxCetWUkoM/jVGKuH4W2bM2+j4Uh1OotI+Jo3haUP12Dx5SvJI9GbRz?=
 =?us-ascii?Q?NevqdPzM8nAvsx49YOWRTS1QCZyPeN8BdUjShlnOmZcngH/VmJc8+UDfD5Tp?=
 =?us-ascii?Q?mn/X4/nUzdf2vIR+vJ1tZWbjayZOU/hI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eH4FP9A1OpfmCp5CsAzEmRkTcISZIKkIeS90Uu1uNBnBWNi4QJuzr+5TBsGI?=
 =?us-ascii?Q?OjuRSsrRuitPNCVCsM6O8N7Ypl8aoRZq4f5rcM7anx1fkaTyiMFWURITCt0G?=
 =?us-ascii?Q?qkzLcWsbqSFavTTdeQ2teiUIk6frxBtTxySTVgSF82AAyr/Qo1c5GDcquZiq?=
 =?us-ascii?Q?laJVTNOBCwOHtH2j0ilsawwvi1/uEK/wsERYUyyHBnqEplIaCOqROMfMAfRj?=
 =?us-ascii?Q?4C9S4npEHLPZXQ1ynBqX4ao2+kHBCB9J2KegJyF6e1OQr/UeRG2Sv6VJF8Po?=
 =?us-ascii?Q?pV6mAq1RAec05Ma+O87OHoa8d2B1pSESx3XgZcp7NTLB5rlWSIzM4e00Nvc5?=
 =?us-ascii?Q?TTI57Mmz4OKp4qyI3Tw61GJDLBiMebq7siUeClYo8cdfWtOPuJHU5IXdX8fv?=
 =?us-ascii?Q?eG0GGE0HWsuFmBDANwg+hM24RWyjuhSIy7sUqf5yasa9tqyPpMSMjqcvda4K?=
 =?us-ascii?Q?uE9wdaoUNHM5ubix/v2KqATjiybJ73lH3hmSA0Rwf51rePIKVkh/ViNlnoTh?=
 =?us-ascii?Q?lGtpOscKRl60sXcBBEvMv1P7CRYrp6vyngEtAKAs+3uruTjJmc/499iy9ovw?=
 =?us-ascii?Q?iIAhZufJROcwuT4W5qzVDsR8SBZIkBDnJNSxQXsnzj4QStWMQpLt6bG9lDk5?=
 =?us-ascii?Q?b94gVkdZIgGR2zeAY01DkQuzARyVv7tR1G1EWbo81hxG/w19kZy+s8/T9/7Z?=
 =?us-ascii?Q?L/XEKB2cFWpeSVQhms13xrk2tEJfB5/8pqJoYWL2zhRa6GvtMJNdYp3ynF25?=
 =?us-ascii?Q?kRYg3e48Qrt1C6vynk/7v+6VTyr1JWQaDUWJ0TPIXnKsCQryWW1E20v5BaWv?=
 =?us-ascii?Q?IxIsNbNWEiyPvQzOYjSeaB8m8tz7RwR1dp4rdJunKX0bSC8ES8jNfMBw6TKQ?=
 =?us-ascii?Q?KWxkHpzn9QT8DrhCih3w5aw+5wjHajP/c6kLZBvNj2i37+8wgQXOuP1LHJta?=
 =?us-ascii?Q?jVQoYiZGOv6s3hvFLa78QmGVAdqDPpjwpk9BEZjY4XJWqzYWEjOJW1JsdqUA?=
 =?us-ascii?Q?BDRDebAkABqJZKKQYrXUKC1bNx4r7TZPWIAWB4l7HOmB7ZJvUS9gJRgjPsDB?=
 =?us-ascii?Q?LqZjv5ySMC/hyQTAT4eR5wZbtA/0f+viTFfesR6zBzpO6kzLhX8z4YEab5Oy?=
 =?us-ascii?Q?Ll34Uhj0eV3jJ3Ivc2i3gPnXlxKGv0drlK4UtQpGuPoP2EzKCNhtrJJpREIF?=
 =?us-ascii?Q?tpcrvim31VUuILXrz5fS5cwQV71hwB3c7mCnoXrqln125zK+F2B1XobrbF5t?=
 =?us-ascii?Q?dszsT0+hsXTB3BD3zqjN68zx+5M9gmuE4egO7wlnUNSkes0nEGLlD+2nBxd6?=
 =?us-ascii?Q?nYQgkNVTWD7TicjHq23CdMkNugnvaeKkKxidf50OkoRR2aZF4Q540ShWx4o+?=
 =?us-ascii?Q?bL8Omthm4izsZIqz/MI6E7BM8tBYovv4H72a3cPR3s4u+WHAzMbkLNUv5efk?=
 =?us-ascii?Q?CwbbJCRGt5YzFVlQsLjc4QUa4Hp5Jb9LCcjqwjrDnAxQdlJ8dalcdV48zINt?=
 =?us-ascii?Q?O4FG0mirWHs+ThhLVHJreVpRvJ41P7Gab1RgLqYVXKtqCMgZMcHTyJptyDZS?=
 =?us-ascii?Q?ikUyrmA+qONYGB6+ak37fStkB/e1/Mjj9vgrwHwN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 027e64b0-357c-405a-f8ed-08dd1e677eb2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 06:53:21.6451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKHpTK+wo74BcXWKjByQB73MYUEchstaB/QTAZX1lPTgrSOG1Pf47Lw+uOvda9ZdbA4Zl65beO4KFKH7AokcyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9196
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

Cadence MHDP IP includes a firmware. Driver and firmware communicate
through a mailbox. The basic mailbox access functions in this patch
are derived from the DRM bridge MHDP8546 driver.
New mailbox access functions have been created based on different mailbox
return values and security types, making them reusable across different
MHDP driver versions and SOCs.

These helper fucntions will be reused in both the DRM bridge driver MDHP8501
and the i.MX8MQ HDPTX PHY driver.

Six mailbox access helper functions are introduced.
Three for non-secure mailbox access:
 - cdns_mhdp_mailbox_send()
 - cdns_mhdp_mailbox_send_recv()
 - cdns_mhdp_mailbox_send_recv_multi()
The other three for secure mailbox access:
 - cdns_mhdp_secure_mailbox_send()
 - cdns_mhdp_secure_mailbox_send_recv()
 - cdns_mhdp_secure_mailbox_send_recv_multi()

All MHDP commands that need to be passed through the mailbox
should be rewritten using these new helper functions.

The register read/write and DP DPCD read/write command functions
are also included in this new helper driver.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
v19->v20:
- new patch in v20.
  The patch split from Patch #1 in v19 and move to a new folder drivers/soc/cadence

 drivers/soc/Kconfig                    |   1 +
 drivers/soc/Makefile                   |   1 +
 drivers/soc/cadence/Kconfig            |   9 +
 drivers/soc/cadence/Makefile           |   3 +
 drivers/soc/cadence/cdns-mhdp-helper.c | 565 +++++++++++++++++++++++++
 include/soc/cadence/cdns-mhdp-helper.h | 129 ++++++
 6 files changed, 708 insertions(+)
 create mode 100644 drivers/soc/cadence/Kconfig
 create mode 100644 drivers/soc/cadence/Makefile
 create mode 100644 drivers/soc/cadence/cdns-mhdp-helper.c
 create mode 100644 include/soc/cadence/cdns-mhdp-helper.h

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 6a8daeb8c4b96..f6c18114b2d68 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -6,6 +6,7 @@ source "drivers/soc/apple/Kconfig"
 source "drivers/soc/aspeed/Kconfig"
 source "drivers/soc/atmel/Kconfig"
 source "drivers/soc/bcm/Kconfig"
+source "drivers/soc/cadence/Kconfig"
 source "drivers/soc/canaan/Kconfig"
 source "drivers/soc/cirrus/Kconfig"
 source "drivers/soc/fsl/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 2037a8695cb28..a5fa4f4d15321 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -7,6 +7,7 @@ obj-y				+= apple/
 obj-y				+= aspeed/
 obj-$(CONFIG_ARCH_AT91)		+= atmel/
 obj-y				+= bcm/
+obj-y				+= cadence/
 obj-$(CONFIG_ARCH_CANAAN)	+= canaan/
 obj-$(CONFIG_EP93XX_SOC)        += cirrus/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
diff --git a/drivers/soc/cadence/Kconfig b/drivers/soc/cadence/Kconfig
new file mode 100644
index 0000000000000..b668790660fa5
--- /dev/null
+++ b/drivers/soc/cadence/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config CDNS_MHDP_HELPER
+	tristate "Cadence MHDP Helper driver"
+	help
+	  Enable Cadence MHDP helpers for mailbox, HDMI and DP.
+	  This driver provides a foundational layer of mailbox communication for
+	  various Cadence MHDP IP implementations, such as HDMI and DisplayPort.
+
diff --git a/drivers/soc/cadence/Makefile b/drivers/soc/cadence/Makefile
new file mode 100644
index 0000000000000..a1f42e1936ca5
--- /dev/null
+++ b/drivers/soc/cadence/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CDNS_MHDP_HELPER) += cdns-mhdp-helper.o
diff --git a/drivers/soc/cadence/cdns-mhdp-helper.c b/drivers/soc/cadence/cdns-mhdp-helper.c
new file mode 100644
index 0000000000000..f74b4cae134a2
--- /dev/null
+++ b/drivers/soc/cadence/cdns-mhdp-helper.c
@@ -0,0 +1,565 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, 2024 NXP Semiconductor, Inc.
+ *
+ */
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+#include <soc/cadence/cdns-mhdp-helper.h>
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
+	/*
+	 * If the message in mailbox is not what we want, we need to
+	 * clear the mailbox by reading its contents.
+	 * Response data length for HDCP TX HDCP_TRAN_IS_REC_ID_VALID depend on case.
+	 */
+	if (opcode != header[0] ||
+	    module_id != header[1] ||
+	   (opcode != HDCP_TRAN_IS_REC_ID_VALID && req_size != mbox_size)) {
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
+/**
+ * cdns_mhdp_mailbox_send - Sends a message via the MHDP mailbox.
+ *
+ * This function sends a message via the MHDP mailbox.
+ *
+ * @base: Pointer to the CDNS MHDP base structure.
+ * @module_id: ID of the module to send the message to.
+ * @opcode: Operation code of the message.
+ * @size: Size of the message data.
+ * @message: Pointer to the message data.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
+			   u8 opcode, u16 size, u8 *message)
+{
+	guard(mutex)(&mhdp_mailbox_mutex);
+
+	return mhdp_mailbox_send(base->regs, module_id, opcode, size, message);
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send);
+
+/**
+ * cdns_mhdp_mailbox_send_recv - Sends a message and receives a response.
+ *
+ * This function sends a message via the mailbox and then receives a response.
+ *
+ * @base: Pointer to the CDNS MHDP base structure.
+ * @module_id: ID of the module to send the message to.
+ * @opcode: Operation code of the message.
+ * @msg_size: Size of the message data.
+ * @msg: Pointer to the message data.
+ * @resp_size: Size of the response buffer.
+ * @resp: Pointer to the response buffer.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int cdns_mhdp_mailbox_send_recv(struct cdns_mhdp_base *base,
+				u8 module_id, u8 opcode,
+				u16 msg_size, u8 *msg,
+				u16 resp_size, u8 *resp)
+{
+	int ret;
+
+	guard(mutex)(&mhdp_mailbox_mutex);
+
+	ret = mhdp_mailbox_send(base->regs, module_id,
+				opcode, msg_size, msg);
+	if (ret) {
+		dev_err(base->dev, "ModuleID=%d, CMD=%d send failed: %d\n",
+			module_id, opcode, ret);
+		return ret;
+	}
+
+	ret = mhdp_mailbox_recv_header(base->regs, module_id,
+				       opcode, resp_size);
+	if (ret) {
+		dev_err(base->dev, "ModuleID=%d, CMD=%d recv header failed: %d\n",
+			module_id, opcode, ret);
+		return ret;
+	}
+
+	ret = mhdp_mailbox_recv_data(base->regs, resp, resp_size);
+	if (ret)
+		dev_err(base->dev, "ModuleID=%d, CMD=%d recv data failed: %d\n",
+			module_id, opcode, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send_recv);
+
+/**
+ * cdns_mhdp_mailbox_send_recv_multi - Sends a message and receives multiple responses.
+ *
+ * This function sends a message to a specified module via the MHDP mailbox and
+ * then receives multiple responses from the module.
+ *
+ * @param base: Pointer to the CDNS MHDP base structure.
+ * @param module_id: ID of the module to send the message to.
+ * @param opcode: Operation code of the message.
+ * @param msg_size: Size of the message data.
+ * @param msg: Pointer to the message data.
+ * @param opcode_resp: Operation code of the response.
+ * @param resp1_size: Size of the first response buffer.
+ * @param resp1: Pointer to the first response buffer.
+ * @param resp2_size: Size of the second response buffer.
+ * @param resp2: Pointer to the second response buffer.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int cdns_mhdp_mailbox_send_recv_multi(struct cdns_mhdp_base *base,
+				      u8 module_id, u8 opcode,
+				      u16 msg_size, u8 *msg,
+				      u8 opcode_resp,
+				      u16 resp1_size, u8 *resp1,
+				      u16 resp2_size, u8 *resp2)
+{
+	int ret;
+
+	guard(mutex)(&mhdp_mailbox_mutex);
+
+	ret = mhdp_mailbox_send(base->regs, module_id,
+				opcode, msg_size, msg);
+	if (ret) {
+		dev_err(base->dev, "ModuleID=%d, CMD=%d send failed: %d\n",
+			module_id, opcode, ret);
+		return ret;
+	}
+
+	ret = mhdp_mailbox_recv_header(base->regs, module_id, opcode_resp,
+				       resp1_size + resp2_size);
+	if (ret) {
+		dev_err(base->dev, "ModuleID=%d, Resp_CMD=%d recv header failed: %d\n",
+			module_id, opcode_resp, ret);
+		return ret;
+	}
+
+	ret = mhdp_mailbox_recv_data(base->regs, resp1, resp1_size);
+	if (ret) {
+		dev_err(base->dev, "ModuleID=%d, Resp_CMD=%d recv data1 failed: %d\n",
+			module_id, opcode_resp, ret);
+		return ret;
+	}
+
+	ret = mhdp_mailbox_recv_data(base->regs, resp2, resp2_size);
+	if (ret)
+		dev_err(base->dev, "ModuleID=%d, Resp_CMD=%d recv data1 failed: %d\n",
+			module_id, opcode_resp, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send_recv_multi);
+
+/**
+ * cdns_mhdp_secure_mailbox_send - Sends a secure message via the mailbox.
+ *
+ * This function sends a secure message to a specified module via the MHDP mailbox.
+ *
+ * @param base: Pointer to the CDNS MHDP base structure.
+ * @param module_id: ID of the module to send the message to.
+ * @param opcode: Operation code of the message.
+ * @param size: Size of the message data.
+ * @param message: Pointer to the message data.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int cdns_mhdp_secure_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
+				  u8 opcode, u16 size, u8 *message)
+{
+	guard(mutex)(&mhdp_mailbox_mutex);
+
+	return mhdp_mailbox_send(base->sapb_regs, module_id, opcode, size, message);
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_secure_mailbox_send);
+
+/**
+ * cdns_mhdp_secure_mailbox_send_recv - Sends a secure message and receives a response.
+ *
+ * This function sends a secure message to a specified module via the mailbox and
+ * then receives a response from the module.
+ *
+ * @param base: Pointer to the CDNS MHDP base structure.
+ * @param module_id: ID of the module to send the message to.
+ * @param opcode: Operation code of the message.
+ * @param msg_size: Size of the message data.
+ * @param msg: Pointer to the message data.
+ * @param resp_size: Size of the response buffer.
+ * @param resp: Pointer to the response buffer.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int cdns_mhdp_secure_mailbox_send_recv(struct cdns_mhdp_base *base,
+				       u8 module_id, u8 opcode,
+				       u16 msg_size, u8 *msg,
+				       u16 resp_size, u8 *resp)
+{
+	int ret;
+
+	guard(mutex)(&mhdp_mailbox_mutex);
+
+	ret = mhdp_mailbox_send(base->sapb_regs, module_id,
+				opcode, msg_size, msg);
+	if (ret) {
+		dev_err(base->dev, "ModuleID=%d, CMD=%d send failed: %d\n",
+			module_id, opcode, ret);
+		return ret;
+	}
+
+	ret = mhdp_mailbox_recv_header(base->sapb_regs, module_id,
+				       opcode, resp_size);
+	if (ret) {
+		dev_err(base->dev, "ModuleID=%d, CMD=%d recv header failed: %d\n",
+			module_id, opcode, ret);
+		return ret;
+	}
+
+	ret = mhdp_mailbox_recv_data(base->sapb_regs, resp, resp_size);
+	if (ret)
+		dev_err(base->dev, "ModuleID=%d, CMD=%d recv data failed: %d\n",
+			module_id, opcode, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_secure_mailbox_send_recv);
+
+/**
+ * cdns_mhdp_secure_mailbox_send_recv_multi - Sends a secure message and receives multiple responses.
+ *
+ * This function sends a secure message to a specified module and receives multiple responses.
+ *
+ * @param base: Pointer to the CDNS MHDP base structure.
+ * @param module_id: ID of the module to send the message to.
+ * @param opcode: Operation code of the message.
+ * @param msg_size: Size of the message data.
+ * @param msg: Pointer to the message data.
+ * @param opcode_resp: Operation code of the response.
+ * @param resp1_size: Size of the first response buffer.
+ * @param resp1: Pointer to the first response buffer.
+ * @param resp2_size: Size of the second response buffer.
+ * @param resp2: Pointer to the second response buffer.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
+int cdns_mhdp_secure_mailbox_send_recv_multi(struct cdns_mhdp_base *base,
+					     u8 module_id, u8 opcode,
+					     u16 msg_size, u8 *msg,
+					     u8 opcode_resp,
+					     u16 resp1_size, u8 *resp1,
+					     u16 resp2_size, u8 *resp2)
+{
+	int ret;
+
+	guard(mutex)(&mhdp_mailbox_mutex);
+
+	ret = mhdp_mailbox_send(base->sapb_regs, module_id,
+				opcode, msg_size, msg);
+	if (ret) {
+		dev_err(base->dev, "ModuleID=%d, CMD=%d send failed: %d\n",
+			module_id, opcode, ret);
+		return ret;
+	}
+
+	ret = mhdp_mailbox_recv_header(base->sapb_regs, module_id,
+				       opcode_resp,
+				       resp1_size + resp2_size);
+	if (ret) {
+		dev_err(base->dev, "ModuleID=%d, Resp_CMD=%d recv header failed: %d\n",
+			module_id, opcode_resp, ret);
+		return ret;
+	}
+
+	ret = mhdp_mailbox_recv_data(base->sapb_regs, resp1, resp1_size);
+	if (ret) {
+		dev_err(base->dev, "ModuleID=%d, Resp_CMD=%d recv data1 failed: %d\n",
+			module_id, opcode_resp, ret);
+		return ret;
+	}
+
+	/*
+	 * Response data length for HDCP TX HDCP_TRAN_IS_REC_ID_VALID depend on
+	 * the number of HDCP receivers in resp1[0].
+	 * 1 for regular case, more can be in repeater.
+	 */
+	if (module_id == MB_MODULE_ID_HDCP_TX &&
+	    opcode == HDCP_TRAN_IS_REC_ID_VALID)
+		ret = mhdp_mailbox_recv_data(base->sapb_regs, resp2, 5 * resp1[0]);
+	else
+		ret = mhdp_mailbox_recv_data(base->sapb_regs, resp2, resp2_size);
+	if (ret)
+		dev_err(base->dev, "ModuleID=%d, Resp_CMD=%d recv data2 failed: %d\n",
+			module_id, opcode_resp, ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_secure_mailbox_send_recv_multi);
+
+/**
+ * cdns_mhdp_reg_read - Reads a general register value.
+ *
+ * This function reads the value from a general register
+ * using the mailbox.
+ *
+ * @param base: Pointer to the CDNS MHDP base structure.
+ * @param addr: Address of the register to read.
+ * @param value: Pointer to store the read value.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
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
+/**
+ * cdns_mhdp_reg_write - Writes a value to a general register.
+ *
+ * This function writes a value to a general register using the mailbox.
+ *
+ * @param base: Pointer to the CDNS MHDP base structure.
+ * @param addr: Address of the register to write to.
+ * @param val: Value to write to the register.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
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
+/**
+ * cdns_mhdp_dp_reg_write_bit - Writes a bit field to a DP register.
+ *
+ * This function writes a specific bit field within a DP register
+ * using the MHDP mailbox.
+ *
+ * @param base: Pointer to the CDNS MHDP base structure.
+ * @param addr: Address of the DP register.
+ * @param start_bit: Starting bit position within the register.
+ * @param bits_no: Number of bits to write.
+ * @param val: Value to write to the bit field.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
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
+/**
+ * cdns_mhdp_dpcd_read - Reads data from a DPCD register.
+ *
+ * This function reads data from a specified DPCD register
+ * using the MHDP mailbox.
+ *
+ * @param base: Pointer to the CDNS MHDP base structure.
+ * @param addr: Address of the DPCD register to read.
+ * @param data: Buffer to store the read data.
+ * @param len: Length of the data to read.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
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
+/**
+ * cdns_mhdp_dpcd_write - Writes data to a DPCD register.
+ *
+ * This function writes data to a specified DPCD register
+ * using the MHDP mailbox.
+ *
+ * @param base: Pointer to the CDNS MHDP base structure.
+ * @param addr: Address of the DPCD register to write to.
+ * @param value: Value to write to the register.
+ *
+ * Returns: 0 on success, negative error code on failure.
+ */
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
diff --git a/include/soc/cadence/cdns-mhdp-helper.h b/include/soc/cadence/cdns-mhdp-helper.h
new file mode 100644
index 0000000000000..25b9737de615f
--- /dev/null
+++ b/include/soc/cadence/cdns-mhdp-helper.h
@@ -0,0 +1,129 @@
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
+int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
+			       u8 start_bit, u8 bits_no, u32 val);
+int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
+			u32 addr, u8 *data, u16 len);
+int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8 value);
+#endif /* __CDNS_MHDP_HELPER_H__ */
-- 
2.34.1

