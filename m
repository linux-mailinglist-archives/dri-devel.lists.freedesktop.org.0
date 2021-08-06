Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BCB3E282A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 12:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48316E1E6;
	Fri,  6 Aug 2021 10:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2122.outbound.protection.outlook.com [40.107.100.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4121A6E1E6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 10:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lER0LmMSGPYAYL72QefmubvJJNP2e55iULiFU+JrbehEpf7huaiO/xdh8cdrjtfC8Iu0n4djqlZKi2/xV+UsYLQvfc1Zw2jqaj6kcLrL0aDRdZlaXOjrjojXRvg9SEg24Y/OHHwWQcnZoUOcYFFhOasEG4vtrKbIL71OvCuFFmgNt/2Ml0cIIgUKrbZgJ7C7vTDMUs2ruptxkceCRkpSpoWzzEnTeaXZJMxaSlfqO5fGcU9DlteNijxtHrrYdOXX0X/h6g1lY4kMWXZeX0L1hDcrz8TFel4QxBLkCY7I1eNGHu21ySfqKDJGc6656v9A6hGmX5abiQqAS8J+Ei+/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WheNvOQb7m5Nb2xbnVsY1/4nzMe7gWxmw7EIWbYnNb0=;
 b=A3Gst13/mip3MvvBpthpyVSDGtgnrrZXbA/tMOBqRAqlc7USwfCgICtta5xM8XLwANi271j8c7b5KuZXTOZu1EW6pkjlUAqXw4dyB+Bu7zdDEZBnRPofeVonjXNvbcRSfHLawAFco9PsVcqadogZqz7OtM14OEtpFP2l237n1EYufSUOLjzhg5kOe2BjEciGIUfMAFdeVskh9h7nN4X5BHyHG/VS7UrAUAr8lJaQw50dKo5JnlSGcohVr7Gt3QCYLbXE3aAHPAMNYtEbV7l16PiY+fzepS1L8v08ovMrnWymqkYctV3hp0ENl9ftnSU+hbbM5PgMO2JnJaXBIVQCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WheNvOQb7m5Nb2xbnVsY1/4nzMe7gWxmw7EIWbYnNb0=;
 b=tOsvzUhvUYgog5Atar3ttHdFbq5vYpsQN9MBOUuO/HyeXprtB/A6DJG7zpXvP+odyY78Ql6Br9qY4wTFbDelUIGCvzqDQdflUVh6tsyuzCj/tQEIQw+zq6T+ujrvzwHPwoPMAPcdPcasF/4gcl8UyKg8LUN9UAHjfhOXw0TJbcE=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5974.namprd04.prod.outlook.com (2603:10b6:a03:ef::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Fri, 6 Aug
 2021 10:09:25 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 10:09:25 +0000
Date: Fri, 6 Aug 2021 18:09:18 +0800
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
 Qilin Wen <qwen@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH v2] drm/bridge: anx7625: Tune K value for IVO panel
Message-ID: <a02c0a414bd3d0f67bf7d77c10415196743f1c0d.1628244450.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: HK2PR02CA0184.apcprd02.prod.outlook.com
 (2603:1096:201:21::20) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0184.apcprd02.prod.outlook.com (2603:1096:201:21::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 10:09:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ba8188-daa6-4b92-5ec6-08d958c24483
X-MS-TrafficTypeDiagnostic: BYAPR04MB5974:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB59747E2864CF52948A7D5AACC7F39@BYAPR04MB5974.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CNXH3r7cpBnIzndo7TB2ORKqDRhMAjd4XRRn2A/D3tdssdjiYDdeS2e+pptECDYIxR8nW/iiU1DIyYbslyGfpI+R9kyWt32jl4HgcROwsIYrZNTrdLK8FyD9WVSFpT3m8EaPNiiVG3hsPcorXn+WiDLJD/KoMziOe8U9rNeXmyklADAVGR46ha77ox92f+rn3R0rxi7Z0MPOjVMzyCaJK59aZxVVS4wxR5aLdmmU8jKDV9atEp89swW5f/APSECQQPQF0hJBXr9Dn2jIsiDbhsq4KHAiW+6JePBuRuzSUxavgt8/53tsjLmoDxrKVzKJl1nBkLZgmxAPbX/nV8G3u9nhMIlySbcvDcxWhgzmIiowoAY0s7mbF+EL2qon8YWUayHbwdRQnA8XPBgiyCwSSBReenFzo0/YvEnIsks7irr6IxdIMqdG4noYLhf/TlGnUWA2LjfHQLij8pGuyDquW6zFjhSIYe4AsXakdjVmzOD4iQFDxFkoSRmPPLBkoW84hMC8lTsh1f+V+FG5QSEw0hbJbPMCo7la9S09lJ0yYYDFH1Eq6pJLfrY5WkALECvJ2RTDI1JRaNega7e7S/ZKxPCbbXLco7wNSQIDoO6VqmJccjxhTq5eIdMgM8Nlx2gRGb5N7+TTZRctxPIVxZ91Dhkunvd58aBa6Oa4RorwPVQ9Fu/kv7QL1eZNSrh1iYQALtLr8xyjQ4d8u5PZ4uAFCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(39840400004)(396003)(136003)(5660300002)(7416002)(6666004)(4326008)(478600001)(6486002)(66476007)(66946007)(66556008)(52116002)(110136005)(2906002)(36756003)(54906003)(8676002)(38350700002)(2616005)(26005)(86362001)(6496006)(83380400001)(316002)(8936002)(38100700002)(55236004)(186003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pnjweh9Q3/W06oqIAY4G1kl/bi1IGSxDlRyOUDYlugiWZL7MBKUFFy3jvFEl?=
 =?us-ascii?Q?GQr7oYzx4Toube6nUH9+Af6ZCTZynni3XZBXsrR8xj3TQPacEFeg7ZRdu21y?=
 =?us-ascii?Q?Be79hlNM9t1Ef5Q8/PdlfWFnYXOUNvbGkflBBD4BwDQ0DmDS7K3mc3edtQCs?=
 =?us-ascii?Q?k6nRvfxnWy/Yp75ABhXWv+JlXZ1zF5Ba+kwNCwiOgQZnfUEPS1ZZj9FkRIKC?=
 =?us-ascii?Q?76l71K54b+Ynp3ayQCKxwBiIFZSwDg1l2m7P+pJYMIIZGHBPdB5TT/sj7dTC?=
 =?us-ascii?Q?ukiE5P7A8J2c82uoAAVQpxdc+lO9ZOPcmX4UD/UOMxI4eUILxirukhEORqjF?=
 =?us-ascii?Q?cOn+SlzlSmgmI83rwxidSve6Q9MiX744pb+Kyr91wl5x3IcfqtLxR2NLC6tp?=
 =?us-ascii?Q?A7+oimaNJcs2bNxD2q5TKC1rqSajUhp4lz4BpT+Lva/CyuoliEbS91SqP++K?=
 =?us-ascii?Q?zfB9J7iY+x8+lXSSNZ0u2uD295fkrVykLxratoTNjQLjjHg69RkaaNknJmWl?=
 =?us-ascii?Q?TKLofO7ZRdSXa5E0ygapiOAcZKFP8rNt+K7oPDixEV7iXZRh1f4tIO27w295?=
 =?us-ascii?Q?56GLDjxriE6At3pkU1Ou81kQxS6i0FhPr9qSqdKZ69BArKU/6t1AgtjI3uWu?=
 =?us-ascii?Q?VJto0W1bU/tolHc5irPbhrw1utGDptKdUIkXh3iFVszxFKV71brC2NAtjh8h?=
 =?us-ascii?Q?kpoZATNwimyZL0C76o9k9xL0KinGEPaz1z7sjQiThvyBd8gh6a673/k8c2GN?=
 =?us-ascii?Q?C48kqvSRFdUmcUHbo57RC58qob6XQwBdUTRiW3AC83SpnSOuVKbpS0HXfShL?=
 =?us-ascii?Q?qmiL53oQly+20Mq4/yIWndCexHTu38ksaD6LC0vBDYXSjV3zwZtNX4bNTY0f?=
 =?us-ascii?Q?cZasmaLgv1ttLNyPBEiemgkCmRWfuazlNcyR3pKLY+956zc9AQNwK8ANbUEI?=
 =?us-ascii?Q?5sev3OsD/2Uz5wBh/HkWA+digUcYORYR+7i/0oG202N0uP/oAxN9saAjYee5?=
 =?us-ascii?Q?zokLwf9YIwujfosqN1z7GB6Paa4iHXsebf7lAtTnupmmDpDHj9GAbJjDwz62?=
 =?us-ascii?Q?4iKSSy1ySFGQSwwbQsFer/4xHnioXgVQ7bxTDr6v2z8mzIsIqEDT4I704MCA?=
 =?us-ascii?Q?SfQdB8HDNX20ARfTisMUyoAmDQZtieJsTPMsbSTsYyPQqHpjuixbP+0Z+8U1?=
 =?us-ascii?Q?ALCzTaWBkvDmiZmmD9AFyTgsngwcBKJ9q4HYRPMgV2gh/qVpA2kNyuKBsh97?=
 =?us-ascii?Q?oJDNHxWs9goKLRsHE+t7tKsAoEqKZ3tfZkDAoqnWQkTMGlFvoWYjr5A3W+Z3?=
 =?us-ascii?Q?T2Ljrr+/0bYU6rkr+r/louQf?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ba8188-daa6-4b92-5ec6-08d958c24483
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 10:09:24.8644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iy9+yriqZ7dM2dz6UFM/m0UAmgrdWhJJnFv9+MnSG+H1h31U50hJ055Y2MB32XWlUW/TQmg9KTF20/VJxJHA/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5974
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

