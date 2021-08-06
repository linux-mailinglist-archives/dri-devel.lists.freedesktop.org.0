Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEB83E28DC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 12:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8240A6E869;
	Fri,  6 Aug 2021 10:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2106.outbound.protection.outlook.com [40.107.212.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3DC6E869
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 10:44:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSTHSLTe4VJwTQVT2ADP0YblAEGmTnU2wadmXuH5YxvIkszdXWLGH/nnHHfve+1iPT4NxiEtv+Q5EX9PUazXvHcTFPrX+GBsMQArtWzm8fyKl/aDmgvxOO061zmqEYHn2Ld8cAKPC6jqolf1sIxUHjh9aFFs8KeWqWqcGY8P6E6WlJDlj87JHn10NG+jk7ITU9WKkjBS+h7uuqbH2iOKr8sMFeP70icOBdyAXoS+ILFRRXOm5FhBjXQSTpYxFTTjW8psaPzmVkVJpAS6oKEAjn3Z9c1+dutVOGKwJGeuuY2OG9kKr+LdwAKR/TLHqGVtpaz3fkiv5jYrc+Op2Z7oDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WheNvOQb7m5Nb2xbnVsY1/4nzMe7gWxmw7EIWbYnNb0=;
 b=mZfWO46ns920ceWEUhpiDhLXL8d7SmXHZElvdgbnJq+vd3esf5XN74WKYfGBK5PRbUBQph4pBfXLZpMsDA4lS35vIhbOpCKe4TUSn7qbAO85wb0AuZzfjmEod4mLsa/MDCxPiYDbFC/29Arcojz2r+zspKTeH5cMYLonnDqJ7rrCZJf/5eakQKlxllxqIMPncAs+AcSv8E9TsuLcQGZRwbV/5u5FFRpjVtVDtfalxd0ZYIRO0uO40WfjK/2FIWZxpmTLw9+UBdHET7RbgaBBOldN03dLTc0KBjlQlSI43Fshk3YGOqPyX5W3GERkq4rb+N71UINEbsLVQVPskel3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WheNvOQb7m5Nb2xbnVsY1/4nzMe7gWxmw7EIWbYnNb0=;
 b=2kDruD6PD4TBqhlQYQrec553vOwYuSE0IUy7yEgtA8cyl70242m4nxdDUU3yRe3H6i1xgaiUnrrynFvxlKFajqhM+kx4L2jrZgwQkJv0kzcnXseqcA5bdIrdh21d9s9kCXPPZHCpGm1ys0arbhF1E/FsxraUInYjiVSoCm/aOwY=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4584.namprd04.prod.outlook.com (2603:10b6:a03:16::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 10:44:34 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 10:44:34 +0000
From: Xin Ji <xji@analogixsemi.com>
To: robert.foss@linaro.org,
	drinkcat@google.com,
	a.hajda@samsung.com
Cc: narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, dan.carpenter@oracle.com, airlied@linux.ie,
 daniel@ffwll.ch, boris.brezillon@collabora.com, sam@ravnborg.org,
 hsinyi@chromium.org, duwe@lst.de, anarsoul@gmail.com,
 m.szyprowski@samsung.com, bliang@analogixsemi.com, qwen@analogixsemi.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devel@driverdev.osuosl.org, Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2] drm/bridge: anx7625: Tune K value for IVO panel
Date: Fri,  6 Aug 2021 18:44:07 +0800
Message-Id: <20210806104407.2208538-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:203:d0::22) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR04CA0012.apcprd04.prod.outlook.com (2603:1096:203:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 10:44:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4289bf28-1872-4e4e-d695-08d958c72da3
X-MS-TrafficTypeDiagnostic: BYAPR04MB4584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4584FDD7945F263A9294F0FCC7F39@BYAPR04MB4584.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6zww95OaxL5Xwgt4mc/VF2oFWLNxYJqIz5c39W9vfpEh636LJW0AH0KeuKEwI93eHkICZfq8uGAy7XM5PavNQL8zdvZPq0eIBfl42+RxdjEwFiEPTqne8YOn/cVGx/JPa6gqpK30038/Xiq9CEve5ERLe/4n4/q0IC/9lJvenGLnJHp7sqjPFLtCNGo/gZOe/juuLfUBI3fIAnmIGZpaCLL4OX2SvLOpCjSoGC4+YSfjI8j+8Xva5g/Um+8QOMig+SrLS+2z/EEdpPPEYLEGNoglUfd/BmSmUSbqf2W6cjNvK29srq8QAPDJsDBLEbBrkRPsufba+e0/PEkVcpsGy2XTeFRqFQEOjTd6rdqaBzp57i4MaXbzUzgutCOBqP7wIde7tZiLJmcIfniQRCl6uP/P31AcmMHwY68Un0LBJrVVfy2N0pyAYh28hfs7pmSvqjR0Lftpg6cfDpfZ/qOjo2gHFZX8RP3mzvgV7m/5hrs0khzswojfQH+eg4WeNyB2cK2jLiTyW6qc69DhygIwK2Ksc2P9oNAaOO3SjOLSJtwaQLNVv2ilySZUBr8X5ebP8uVQl9Z2Dm0XL+oa6gatG4vKK6Drg5LrpdDKiu6nIrcNW9JDE+CJM2HaQ1X3CMbZjO89isJnCLkkAFPjCO9lXeT79ABgxRT4owQ7pHOQxNgY45jcZ3F8lcHOLdLDI8ZXfV/xt+qYHREw6bnIl4HsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39840400004)(366004)(396003)(346002)(136003)(8936002)(6486002)(956004)(26005)(5660300002)(2616005)(66556008)(316002)(8676002)(66476007)(38100700002)(38350700002)(1076003)(186003)(86362001)(66946007)(107886003)(7416002)(6666004)(55236004)(6496006)(36756003)(4326008)(478600001)(52116002)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mgfCQbizHrEp9NPfW9thSSBcJRVrWG5dzeOX0mf8uAMppfVXORHcTkzfLpVh?=
 =?us-ascii?Q?bOzn/noWwmvJHSnyTaeKKEgU30MAKhOzT1PQ8kg94hC4FHbpO8AG40RJw20O?=
 =?us-ascii?Q?xLHzYeTSj6816SWWiMzmjlU3+JU/+r2LuKM0hy75WixN7PoFioHUb1ziLDVn?=
 =?us-ascii?Q?RIvZ0OE79DVWsxTLQGCZBowKqalV13yoDAH3yL2uPkozEzFqrI6MqhUeCdUr?=
 =?us-ascii?Q?p25HfrDfh35FX7+keAIS9DAnH+rCtcsZgnBg29/m8q1oQI+yCeUoUF2yFTlH?=
 =?us-ascii?Q?bkIRtfsgAlg4qIiDZ3G2ZSJ1c25KqOv/RtEqGQG8k+nQ+N/MP62n9cCYbTgS?=
 =?us-ascii?Q?vFmEGmgqWvMI9O20nLxQx77lNYGa6b16FuF0ioeuRhQ29TsSg02gdfUkyUGq?=
 =?us-ascii?Q?Sn2EAFXMdnNBjdrAtM9uuUABvs9doXgJbj3dislXZJ5IiPo7VEeDG/7cw2O9?=
 =?us-ascii?Q?klTKgv3P943fcJXPytjKz/9NdU4Mpw45hPJf2B2kvBZmqIxsMP5DsxSoJo9G?=
 =?us-ascii?Q?h3oLZ5padTrWpOpgCFbTKVrnjMokA/pSQcWnHw1NX/+9LzNj8bRauWyiQsZ8?=
 =?us-ascii?Q?n+bPd4ec/cS8Jsr4v6/jT2qkw9xwmf7C4rp1Stlp2gmimc2m1pJN9v3s4j1f?=
 =?us-ascii?Q?BnaAIJ3PkjscHSYwh/guj+/r8OZ8SyFBahd5YzVBjEtTiHLVK8Q70G4vL7WN?=
 =?us-ascii?Q?1hvZhKkIK+8OfT4/9P+V75Ks8DvmrU1sAA/iGfUpkbd8PynGQT3PirrjReiJ?=
 =?us-ascii?Q?q4WgzU/EEcr2thz5nIRVTHyLFjbqQBASm/YS/ag9QdMYBcY6+ea4u6SXvYFT?=
 =?us-ascii?Q?ZedWVY3cZrPY0SYCIumYpbX8swrV09q76XtIfUG4C56t7gdBd0myfNxUaHAy?=
 =?us-ascii?Q?tSZgc5OPInJIkap0wOHQF4iGRqYRPr9jF06TQu7Xp7jLVGqc3G1eXLWTcaGP?=
 =?us-ascii?Q?RkfpprVWqAwqxNwXpYE6T79JhnjZ+FSRh4NSEJV/RHcM3JopnyTCSQqlvrYO?=
 =?us-ascii?Q?EvtVuhENCt+9Y84DA8hNmaIsz0RnxHXfMEHHlUg6PoiFfzgEU381FFMMXmQc?=
 =?us-ascii?Q?3NhYAaICyTzFt6bHS+nA1Sy456zXdrW7PVqw6pkeXLlLPTQeTuwx0svAODNK?=
 =?us-ascii?Q?iCzSdrFMhzNdI6AcRc14eSWuZzaNfykIocww2PcFamOUlWBGCHCzmyaYZqLm?=
 =?us-ascii?Q?6kMnMd++PR3dlTFMPv4KHOuK8GOOfNg08/GE97/Rc/eVH3YlSzQ1+RKhe19X?=
 =?us-ascii?Q?4hIswpnaY3KWjkI5wJLiNNxwOSbOuwML5jwp59ZK5ef54vezn5c6dRrispEA?=
 =?us-ascii?Q?uGfTOY4Zl7SObi3n0jJ96N3k?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4289bf28-1872-4e4e-d695-08d958c72da3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 10:44:33.9692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mR9pnNfKgs5Nl5DtOD5raDTAtlBv6fNfTbF7rWE5kocgGCmWHnbnWT2CcGX2Z5wrQhOnXCVRHxBH9tAXcgxhNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4584
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

IVO panel require less input video clock variation than video clock
variation in DP CTS spec.

This patch decreases the K value of ANX7625 which will shrink eDP Tx
video clock variation to meet IVO panel's requirement.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 24 ++++++++++++++++++++---
 drivers/gpu/drm/bridge/analogix/anx7625.h |  4 +++-
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a3d82377066b..9b9e3984dd38 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -384,6 +384,25 @@ static int anx7625_odfc_config(struct anx7625_data *ctx,
 	return ret;
 }
 
+/*
+ * The MIPI source video data exist large variation (e.g. 59Hz ~ 61Hz),
+ * anx7625 defined K ratio for matching MIPI input video clock and
+ * DP output video clock. Increase K value can match bigger video data
+ * variation. IVO panel has small variation than DP CTS spec, need
+ * decrease the K value.
+ */
+static int anx7625_set_k_value(struct anx7625_data *ctx)
+{
+	struct edid *edid = (struct edid *)ctx->slimport_edid_p.edid_raw_data;
+
+	if (edid->mfg_id[0] == IVO_MID0 && edid->mfg_id[1] == IVO_MID1)
+		return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+					 MIPI_DIGITAL_ADJ_1, 0x3B);
+
+	return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 MIPI_DIGITAL_ADJ_1, 0x3D);
+}
+
 static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
@@ -470,9 +489,8 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 			MIPI_PLL_N_NUM_15_8, (n >> 8) & 0xff);
 	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client, MIPI_PLL_N_NUM_7_0,
 			(n & 0xff));
-	/* Diff */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
-			MIPI_DIGITAL_ADJ_1, 0x3D);
+
+	anx7625_set_k_value(ctx);
 
 	ret |= anx7625_odfc_config(ctx, post_divider - 1);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 034c3840028f..6dcf64c703f9 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -210,7 +210,9 @@
 #define  MIPI_VIDEO_STABLE_CNT           0x0A
 
 #define  MIPI_LANE_CTRL_10               0x0F
-#define  MIPI_DIGITAL_ADJ_1   0x1B
+#define  MIPI_DIGITAL_ADJ_1     0x1B
+#define  IVO_MID0               0x26
+#define  IVO_MID1               0xCF
 
 #define  MIPI_PLL_M_NUM_23_16   0x1E
 #define  MIPI_PLL_M_NUM_15_8    0x1F
-- 
2.25.1

