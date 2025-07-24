Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422E8B10193
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90C910E1D5;
	Thu, 24 Jul 2025 07:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZAMwCCuw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013042.outbound.protection.outlook.com
 [52.101.83.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E583610E1D5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:23:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCpKH2scZWNq2i2SHjh6xhkulpbUpBEr5hDOdzY9oGX1E+AST8L667r7hOYlFp9/b/QnT3dpLQvkHJ1utf+Q/4hiOqAR6l7Utdn6ZHaTxixYHsGKsc0LG430i/K1Eb9bADZQWfzApetdbcCb/2iaIWxxddecBxkBSWqwqEL+aw0g2eoaWF1aeH9Dgl27FqNBkZGoEMT4C1wQJgsYVwOzD7iQujxjPLLLQsmRMqIdgyWmOtsKU9mknU+hQDFteoq/Lq4cxD5x6si6z9xFLukOIaZ62bE+B1LxSxyBj5gUwC1gc2483zvSvkHnBgpYk5QNvp1+j0IDdiGN4pljknitoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ72EvpxGzdp4D5Sv6vGl+tuxgWhmoW72k4kINvJmp0=;
 b=GcOL0C2FRR1YsGp/GebMjSmNEcvBSqwH2XxF6EWTUVeyPVtIgHvbIZZ4WkmBQDK3PesECHdR02awCVfEwlt/N3UqVBJWzgsZGlDZHiNI2K9dJBN78FdeeEyDYDeARyCp8sV15+m6zV+VLVZAodJTDDpYA68Xgw5rqK86ZPvkCx2eyUrepingQe0tG6C9SBVoj4CpKGYq3Q3o7zTX/7KNeh6lx2XDMrXxRR5kHFHTjrAmtlWw2zmrGRRGt2FrDorAF6g7op2gwa198XWa2RvBs7e7Bw7RpATwJUj8pQv+dD2/HWK/mpfEtqYbTwLcPiLcGgehqXilCuvvY6vaG5Ru6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ72EvpxGzdp4D5Sv6vGl+tuxgWhmoW72k4kINvJmp0=;
 b=ZAMwCCuwGDS/wluFECirZ/MZ7di7LHEdMj5lowUDVu/tw0miDo/MHMUrPpOsN2UvVEsDd3ueDS+33c3bMsGDOl4H66wzfMmaugiMRFt2Yb+EJIG+Vn5FQ16tITdd+ukjj3cYZtOeGJPj6UqvM2Tcu8fn0eOXv2GKLYK0Uo/e9FULEANEjdBW5nfcHhMdw0HueAEyhBlCSkhg/WHLDNKsamR/U1JgtdEaAcA5xHU+A2jDl2mIQm+X+cBVViMo4bMevbfM0rJBEKYKO+Bo3YaqOs0//df95v1rOtYdbPmLArQT0lLhKohZFMfNYUN8tmKfcSZftARbSFaKMDAzCbgOUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM0PR04MB6915.eurprd04.prod.outlook.com (2603:10a6:208:187::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 07:23:34 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%5]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 07:23:34 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 2/6] ALSA: Add definitions for the bits in IEC958 subframe
Date: Thu, 24 Jul 2025 15:22:44 +0800
Message-Id: <20250724072248.1517569-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
References: <20250724072248.1517569-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM0PR04MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ced5dca-785a-420c-ddfc-08ddca82ff91
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NyetvO8nXPyAtfLkfbLb1th+xnMbJTuvRWzZ8ed8FORnIG5a6XUeWnTrRNki?=
 =?us-ascii?Q?wyGbwmBHzSfjfxcpcMTBmIt31mhmOAcmjUeIkuaEb3CytXp7CZIpfJ24YI2T?=
 =?us-ascii?Q?H2Ki+Nn8P5gjT8vHorJCH4/SbBRuEwU52rWVrURoWSk9eaysVSesjE+toyTx?=
 =?us-ascii?Q?6wFoUBlfyoTTinN/qBbxPPAt474kI6ojS7JAXd40BC5IiyiBP4VcbayvWGXS?=
 =?us-ascii?Q?bxG0Lqy9J/Oo1eNCQtq7t5Wz0SGhtBLMIGojQXjJCVB4S/zE96e8gshElVQ1?=
 =?us-ascii?Q?wPKsomRnDIrMYNTKKlISHbAc5BggppwByhtSHjNITIN8RT5aipI0RTpG2pcH?=
 =?us-ascii?Q?zGnrH513xg0ab1rHBZvk28RPH1hrrK+Nb1Fqlq6BKqxS7cdi72u3iziXsdOg?=
 =?us-ascii?Q?akAoLAWL+FNZB8ncDn49tO4T3GluqEhv+3Ne/CWmftRKI+FnN+E8KGD3vrtW?=
 =?us-ascii?Q?EmUiS9TO2q21tFtVwBMjv0a5r1Rm9hwJijmXqnki0yCcSDdBmE7Wy7aAQyHg?=
 =?us-ascii?Q?hZWs2ghtUYfua9dbuq5O8zjPyJkuteSIo4khG5Kw4fSHlKQbvTtN7bWX1CrT?=
 =?us-ascii?Q?jTqdnY2fYHyT3sIy99f3txZcx2r609iXi6So61H6wgwu6u1a3nmRU0moQPws?=
 =?us-ascii?Q?61CxHD3SOsvjPZ1e5Xs9bEeNt2s5k1555uxiunViJ2tdcwOPfKL9mX8AZtJy?=
 =?us-ascii?Q?OW/Bi3EWuytWsEiZBMLhs3bOBx3FH4WT6Pl6epVh1onasyLGqrpTmjJL6YTH?=
 =?us-ascii?Q?ne7QxwyH1cxiXZZxyzR2cCGeAzQpUkEwWugXfmWkcc6L9bI6tvneRrqSARRU?=
 =?us-ascii?Q?88H4RDKlaDgSy4hSq4ZNjrg+z5alGuOXGaaHOP2aaNjpgVhfGqgRfk9OKrvU?=
 =?us-ascii?Q?yo9r5UIZozd9uzdEPBwjFMnPfGpeC0LylgdXb2+dQl94bnwvJJ3Vo1JlKJ1y?=
 =?us-ascii?Q?SUPXccoO3q7cwbTl+E4zeZMHjKTIm8/eHH/SqPVlFi280o/03n+oc9N/iEc8?=
 =?us-ascii?Q?AN7RjLMH+hYjt3yyuwAGVVDR/l6E3UUotCk6wWjs011329RPF/IfIN6R5rVJ?=
 =?us-ascii?Q?mMMqCoR/x6H4Z3I2Wv5QvJwF75kpyjoJm/VN2Dfv691KgtRCrNHh5my5gf6l?=
 =?us-ascii?Q?jLueqoVk1z56qle5pkOfGKqnGu/PjrEIqKuOpq5aIOCi/kCH3QN11SUUyQVz?=
 =?us-ascii?Q?3vy9JMikUXlZd7pDnhOC9fLnQH9MRpYZfHhOFgnu7UhaiSdkMfna4bE8klXJ?=
 =?us-ascii?Q?S1Jr1gZ0z4u1qKJxpacY5XGUC/ZC338h20fDIOL5eTyJ91XGSlNz+BqQT+Q5?=
 =?us-ascii?Q?xCKREnFvHFj1ku3dPFg5XmU9w1O4UiM1x7YN2wUVe4Eotfog65hZBz6s7RT9?=
 =?us-ascii?Q?JR2XYeQlS9qcN1rEeEKKd9IBIAWwmZPmJVHmJfF21i5VFCuOGdIlCYrBwrmN?=
 =?us-ascii?Q?e/ZdtLWgW2FWVCSc9uYDE8s3mqOQj6AijVk0yQS5a+a2xIL7jKiZ7D3tJpec?=
 =?us-ascii?Q?9OWfR8U59lGFPGQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB7044.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YHysZFak1LzbrYMPOQ2CMs99LnUc7R4aw2CkSVeKQwvPrvnA1MiVyqQRjP8k?=
 =?us-ascii?Q?zTGPdlap7bN7tx9yTkt+4/0re4tLDy33GopJXDhhuK05+5C9YWrcEMv+zJ3w?=
 =?us-ascii?Q?cB/9IwvqqXkGUcyhd5nYej52y6HQ8YxV47bpq1OAAtlgqns55icZ0kuH1fbA?=
 =?us-ascii?Q?35UFfB6cUjF0FiPuX/HPjMP+y0ulImjVotfZxJoQoVoeMp+DSnhtRAxjkXiO?=
 =?us-ascii?Q?qfOKWNOaTNqy+Gmr4Dh9OjzVd5/vuu+f87nvw7xWgmQBj2jPWaYgY6JjTGFL?=
 =?us-ascii?Q?mV+w3Lmufu021RybNHKTgNOQvDZJvLshAbu2PkhAly1Gjz5lUUSf60KZSNTb?=
 =?us-ascii?Q?0DKlWqeJlU+pn9tWrajgm0sdWEF7Ua1Nkyz5TxhCo8GQN2MIvxjuxydwJZgY?=
 =?us-ascii?Q?Zu3lBHpjMeehHcXAEYo76EORDYO1nwJTLmjAkyBzQci2rE4lf3r5RRS1DpeQ?=
 =?us-ascii?Q?nrPdiRHjIQsQLw2CDNqKjR6KMmUDFQQAU1q5WOT+HlOnpuxdNO89+gR7VtNi?=
 =?us-ascii?Q?UA2iJNOPZq+H8ji7o2a7g1h65UqjVfEN/0GOvSggwETxtYvLYp5a6wxYX+LI?=
 =?us-ascii?Q?leiGR3SN+X7HuEaABLK0p18QvTAszFihWBACTzGgOaAh1uDYtJ/0i95nJE0l?=
 =?us-ascii?Q?GkwbDruLZunDKN4fwPJXtPNgm0Ib120DpXDAO3rkgPbbwNPzgcvJtHgCoaC9?=
 =?us-ascii?Q?IPIMTFExcvyLlJjMNT3MHfF/CfJl2zRfgV2PL8d0KuewbkcYixB3PxK8lRbR?=
 =?us-ascii?Q?TTYXrAn9a7SyNQsrvo3t35yG0tYq39eAWveVKP9eJ0DtE3Vz/k/sU0qI5uRG?=
 =?us-ascii?Q?NUC07pT42PNupmRryf8uBM8HubV0xSdY3Ytq6VdaW6BoRom4zkzGC2RfHzyT?=
 =?us-ascii?Q?vxkPpenOCXVsg6ClCqFwdlf6Zum/f9PuANCo7TKx9aeJo5F7JAVWMT5/kC40?=
 =?us-ascii?Q?ieIIdyy+yJuW+qUnUAzuB3hUadS1+j56WKYJm0XPSW+4BOXroJ9OuiqMihSS?=
 =?us-ascii?Q?aBE+K0PCz/aDWLuWAmjER+PbnqE3jM5xDDcom7cthX53Y/ZbwVAeUrSa+J9S?=
 =?us-ascii?Q?GocyZC8gO42AkWfFmlzSQTUcR7pVMN2WITvbCYJ+2Y2bryjcF7HVqvipQG2Q?=
 =?us-ascii?Q?Ugb5BC51s/+a8eAQBeWiQ6gBfZKMf5M2WefiOCKVNREvFK+Bcaeg+aAiIUjG?=
 =?us-ascii?Q?ePsGKaaj2FynBWxMWtLn96vZCdzXhn3fHzJ7UK1JUryZ1fGzAHj5xMW6QLrX?=
 =?us-ascii?Q?V51BCwhBpS6ZtoT/iNItskZBxl/87beTG5x1ajQNr0QgFKwSdfD1K5D5Mlxu?=
 =?us-ascii?Q?4vgMCu6a0YKYzqHZ20QdmEYZ6tQVWFhHFiHgOV5qi1fk2bx4ycBFBuznkM1+?=
 =?us-ascii?Q?HBq5aiZzhlYOLSIx1kOPeo8tbKkfatCB0oEDjhFsUSOi1EtLyuYy1VOvpXj3?=
 =?us-ascii?Q?i0EQ8uTLKGYhyDg88Qz71B9UNCYEPfQUyr5g3Kc1JX4SJG4spcBr0w1Wg5a+?=
 =?us-ascii?Q?sh+efgMXLKbH13R6XMyzwe/qlU1Lj+ZocWuDnhDLZxMYA3teOJ3Ddpyw0Mfg?=
 =?us-ascii?Q?R56fSHJJ3Yw0bNLvwpOhZSj1x2yDioLUkZLXuds4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ced5dca-785a-420c-ddfc-08ddca82ff91
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 07:23:34.1976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3JZLpcGoydtuDhWvfAY7lg1rBdSnoOYEaH77JwclURrtEMkSpU99SS5ut3Z7Z0kDJtSY2L3ta8MhjdP6+olhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6915
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

The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
in HDMI and DisplayPort to describe the audio stream, but hardware device
may need to reorder the IEC958 bits for internal transmission, so need
these standard bits definitions for IEC958 subframe format.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/sound/asoundef.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
index 09b2c3dffb30..7efd61568636 100644
--- a/include/sound/asoundef.h
+++ b/include/sound/asoundef.h
@@ -12,6 +12,15 @@
  *        Digital audio interface					    *
  *                                                                          *
  ****************************************************************************/
+/* IEC958 subframe format */
+#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xf)
+#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xf<<4)
+#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffff<<4)
+#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffff<<8)
+#define IEC958_SUBFRAME_VALIDITY	(0x1<<28)
+#define IEC958_SUBFRAME_USER_DATA	(0x1<<29)
+#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1<<30)
+#define IEC958_SUBFRAME_PARITY		(0x1<<31)
 
 /* AES/IEC958 channel status bits */
 #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
-- 
2.34.1

