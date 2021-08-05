Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4763E0F35
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 09:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2200F89F5B;
	Thu,  5 Aug 2021 07:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2100.outbound.protection.outlook.com [40.107.223.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A9789F5B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 07:31:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5sJk9jPiVuQOaGob0zoq8MDMB1Q47pPryix3w/M/0yahGYUeMMdruIN55es9OtquMQS6c5JKO9OMzCishVB3fgBxzWyA9YyHp//0aPQ28UIy5Rh5p0Gno/hSe6FPnwOnrV8As65RMjA7NE2e6RLbI+joJ5Na/LHNHbVF26DfKmphK8E2MgH1FQh5hf3mdIRwCEmy0wgf/Nw2e2FBDfObWNk2sQhdS/fGqMHICz/anEI/rVX0iTd+oePNhxEw+2cjv9cgMNoA5gWrPF/eJC1yh9q85kHu2tUgud0RZAQdncbE3FK4gWUFe3mdlCSv6Yhhxdnxr2g115MTRTPVeyY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMQ4TlG+25R5+4EQWi8L9T/iqMNYMfhqXsZ67HAs+Jg=;
 b=DHJ1C0a6RZppKLus3avEnaw3WsNx2ADdPGIhfW3pKXGyqTXzPJ9Gh6r9F0vJayxiTUL9VhAVfOXViVmXz+UbVLXQdn5iKcLJeyKSwD/J0cfT9Ld9C7VnwAV6r64SfJGPBvKU40EXG6gOYT472YAUU+3dJ/MbtxJ9KgQxjcF403jiTPwzhc4xnkUR6riILBe/jMw7KrMCv3CsZw6caebY9Ig6GVY099ObzVPvHsLxCZvPG94uebXrv0V5Cum+WQ2oChOBVtfHUYWkzn/qAe8zdBo8I+MowRydxZMLNaJ9EgrHmeQzBgylJ7RajDCVzO3euujVQPfpvKc2oIQkqW37aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMQ4TlG+25R5+4EQWi8L9T/iqMNYMfhqXsZ67HAs+Jg=;
 b=gvWja0SJkIVyK7EimesdA56Ne451bvgT/hwwbBv68dq9pZoN5KmJoqwWSJdF4VbUfyjN/0k+aRWkhNORgIbs1S62sOMGc2cU1QzrTK0Qj9+SRWz205/2nednnCivD5kNtlFpCZwcEOg6ze7SZZalaZnELJ6smWombLmQIT5/tlk=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5127.namprd04.prod.outlook.com (2603:10b6:a03:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Thu, 5 Aug
 2021 07:31:02 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 07:31:02 +0000
Date: Thu, 5 Aug 2021 15:30:55 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Dan Carpenter <dan.carpenter@oracle.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Torsten Duwe <duwe@lst.de>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bernie Liang <bliang@analogixsemi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devel@driverdev.osuosl.org, Qilin Wen <qwen@analogixsemi.com>
Subject: [PATCH v1 1/1] drm/bridge: anx7625: Tune K value for IVO panel
Message-ID: <a565cb1662d2f8300905a369c575e19176fd8e4c.1628148418.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: HKAPR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:203:d0::26) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR04CA0016.apcprd04.prod.outlook.com (2603:1096:203:d0::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.17 via Frontend Transport; Thu, 5 Aug 2021 07:31:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0804c42d-1809-4ef0-e8b3-08d957e2fa31
X-MS-TrafficTypeDiagnostic: BYAPR04MB5127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB51271527E04B2D3A2BBE6D30C7F29@BYAPR04MB5127.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aDkRXsQml63vPOj2NVfip1MFNJ1+0QVAI3m1J9xp1QmpaYAodohFsSXfJMiytSPEH0GZZJl9RIB+eUNWqu1AbB7DKvLWnhx5vbrYcddg2uV+2WDZbTXGixpNZsTBOWhFNl4lznehfE2PMQdqNyh6i5UlfHx029SJvUVdofLaYB3B8p3j6YBqjm+0lA1a3WPYzSfWiywfTTni1HU8PwWHkFe8y3lIpyAHxKJG8lT1D9dew+kd3+CWc9W4if/QrKqm43z8gFfewJgyrd6BAwCiul4kMOBzaII/Mfa3rngiRiRNttN7gU2wASQVrkCrvE9k/JEZI2YcltUgiUb2Q2b43H+PJyYQGU4n5hgI5XiY05Im2zKFL9896Rd3IzFzBPsbqpOsXSEuI1A1o/hKsSBCaHFMzxB7P/tQOEz/PEqPtR/1QxlqzMoH5XB2e+fJM/kLFK0u4SQB5zBCr32gmagfwZy00ciSYihW1VixjrPafIQv/vt3n0kjh7DiPL/7n0UFRh/bkGKYIXuGWy6/gxuGJexrbue5MNq40kAAL8BZDezNjbbwxsWwx2YOHOfhYTAaWHb0MzYQ93N5VYlFr3xXf+ABrbgY2taI49lwsNdz2awTTeH8kbLfCLPWYi3cGas9O+xq4kfIUpdDM7S1QJQweUOVnC04Jt+J+hRM9bIuXtaR3veaF8BKLHlRWBcyshawYQA2oX+Xd6n+CUuh6jxINw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(186003)(6486002)(956004)(2616005)(4326008)(26005)(86362001)(6496006)(38100700002)(83380400001)(38350700002)(316002)(107886003)(6666004)(2906002)(8936002)(66946007)(5660300002)(36756003)(7416002)(54906003)(66556008)(55236004)(66476007)(52116002)(8676002)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WEj3gKzS4rINqr0F1zLvE3RxNmO2k/aO3N15J4kqOR32ilKEJ9GhMsxyEkY+?=
 =?us-ascii?Q?cpxDtWHqtNX2oRacsXXCyd6MoRKM9FprEi4xJAsvrnD7VoZpHstx3prJPXQ+?=
 =?us-ascii?Q?WmuiLx6GJDnJ7z4av0qvSfz8UY1ag7fl8RkCgZ3xe+VoN7aV5sg8uLjif9dM?=
 =?us-ascii?Q?wdBmKWSH5e2JAm8n6paX1Kyh+NTQbQEuMPvGS9qJxnpP3hgjCNr3dqYeVfag?=
 =?us-ascii?Q?ny3k0j53xvMog3W4nVJTcEOf9s2nKa0wrfvpGomDtrBauf8/moP8Qn2zmU20?=
 =?us-ascii?Q?FDGB5P+9nctHy9hcXTlM2Rht8xA2UBi5jdN8ICZYtCXi3lIIxweCqpjoHe7I?=
 =?us-ascii?Q?6jwbVZsEsSYxxfEB/fcIXUf53Gyz4pQduFiFWdl1El3C43e39DGE2jYvVjZV?=
 =?us-ascii?Q?+s6CLL0ci2V+e4dsHIQE8IUPwzF0q6Uu/xXvEaS7uNdGc17rl04utTQwPIrp?=
 =?us-ascii?Q?TXoCoomz0Sq+vF8euE1cESONOsflFz6OTA6k7cCr0UWHCZLMj/ycsQLKYRXw?=
 =?us-ascii?Q?d5J5Ym8dq2ksmM0g6eZTYLn5GifQgnVpYkM1WZ50dMcKx55jHLBk4ukYNbpd?=
 =?us-ascii?Q?g0mMh5JJPNEKQflwZpLDvUoilRnW9X24yAYDvRjy0vsrUmexwr1l1n6sSZrO?=
 =?us-ascii?Q?h++KZ70DGsTGvYDUZ7LCVairIiaHL9z3dkHr7MSPWgnzFf3+obGJNiv9Hl+M?=
 =?us-ascii?Q?2NPKE5SKmTiGaSrfTtYYxZ8kxpDFMFuubnaYUADNrRvLQNhd3l1Slld5gZ4b?=
 =?us-ascii?Q?596YVJxmzoXTl48+NevVtXJkwcjzGDlJmgxyjvRhBMn87i7qTul6wRq7ZApF?=
 =?us-ascii?Q?91EroV+wgYOPH09H7PIe4619Jtj8aMTuomKi8y1vSdMczNGcu8F8rv0Vs4FY?=
 =?us-ascii?Q?HX4GjVE6yJR2ew3/rKjMFeX8stDLQ3L0/RVshyuL61tCccJ35edPG9reM+Zk?=
 =?us-ascii?Q?fxH7UQ97O8mzPvGuob/TnO8SGmmFd4FZyPSdM8kPJPFIn+t1tNTWjhj5Qjdk?=
 =?us-ascii?Q?uXiCCqHu3ZkaTiZFO85T382vUVIec8YKgmQ/9ImAEZc0vfFfkpQKXLeprARO?=
 =?us-ascii?Q?ASNh0rfVHBdm1MMahN4cFOEpvdaUzDNGsXpuI4jwoTzNm8x5ki5uC/z7f+ju?=
 =?us-ascii?Q?TOxfSibysjjX5531CQjdnAcAEy//ytdhSph6r9cIf6dIMwfVFN1q/UtYGxSt?=
 =?us-ascii?Q?dwY9vqNPl8I5ZxETwE4MdHGOfR4jrrwk1uj1HMd9FMh1oTOXq3X9vGo3XIIp?=
 =?us-ascii?Q?lpWAAx98XNv6MzkzqPDG7Kj9tFn+essHCt+u4rQKj0pCFOL2PUj/+04ThN87?=
 =?us-ascii?Q?d1VcnFuY325sgaPehXcWk3RT?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0804c42d-1809-4ef0-e8b3-08d957e2fa31
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 07:31:02.3168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbG099esD/91SV3wdZH1CrrPJGzfjc/UYb7FZSy1DXcqgrbqeG7vv0fm0DlANbS0ArBAmX7XSt8kShlSY1Y+Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5127
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

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 17 ++++++++++++++---
 drivers/gpu/drm/bridge/analogix/anx7625.h |  4 +++-
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a3d82377066b..ceed1c7f3f28 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -384,6 +384,18 @@ static int anx7625_odfc_config(struct anx7625_data *ctx,
 	return ret;
 }
 
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
@@ -470,9 +482,8 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 			MIPI_PLL_N_NUM_15_8, (n >> 8) & 0xff);
 	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client, MIPI_PLL_N_NUM_7_0,
 			(n & 0xff));
-	/* Diff */
-	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
-			MIPI_DIGITAL_ADJ_1, 0x3D);
+	/* Diff and K value */
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

