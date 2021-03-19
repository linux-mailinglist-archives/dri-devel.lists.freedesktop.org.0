Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 786853415E0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 07:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D166E98A;
	Fri, 19 Mar 2021 06:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770139.outbound.protection.outlook.com [40.107.77.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440076E98A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 06:34:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEf1vZy7Ph1uCzeLjwKruAGq9VxQ7BkdsWDhQmcJMucPkm4vsaL5lsMGCBd0gGmVW19IMN7a7Ex1j089l8wddtdco4kUJx+jtmPy4NdLa1GlCDLXEdq/9rDkPrlHv4qaZkr0n7RwivaWBaEXJkSSVbjKoQbi6WKB2tX+z4Y50T8PZlyjJ6TEsF+km/rjdKWqYv+fBVZLOaDBXtrHHQp+EI25Ncy24uorTxIa/Dci/8cNgJP32eJtBifIY5BO9SgPkmVwSLtMBMMaKgphMqLRoJ5yOKNcMWiWLa0spsMMth8UxYee01yV3rMgGLvEzMXlCl2mc+D4O5mXHbyLCAFfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1smR79/aiqFbDD1hyCRpF/2/2ROkMUPZtiItnoZ9Zo=;
 b=NCtZEE/vhKsxa5W+6Cuh8Y7bPRaNZLruBWr2QUXdD9HpdmfcudFFa+CleQ8p3dv1DKEzF/UZvhFscSNdFUqqxvFoWXJtp3CSelfPtSkkjKDVb2k+U1fhVHYh2XuMtAHgKMSqoeGUNuV66K0enckin0FJ/yWhsN1NzvA8ZRpcZU5u2XEdIBQHAnyZmvXvXGhOxBJGfeKICXFjBS7IiiIVw9nYtELlVWoLfT8mqg24n8/GIjbcBOUh12b3ZsMBRS27839VYtOHwnx6PYCjYMKqnpaX3W04sg84PgotQp0SgHivfmVdl3BlbG/vmcRXLgcnZJe0pX8MjImOgcZCRSXapA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1smR79/aiqFbDD1hyCRpF/2/2ROkMUPZtiItnoZ9Zo=;
 b=Ets0lJBQRFlDRnvL1GpeIVt9luB8Z1y7Sqm3P3BuxP34680YsnZXAVJ9yXMkR4qgZdlUwpueB3Mhl6CqUwCA1YYHPb9ysCsvbqmOGVxHfQCVfJFOXYchcfd6BOAq4fb55HCwOd4hWOKbcup7hB0txDEg/Pqjqk57ne2NTIRGFPY=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4581.namprd04.prod.outlook.com (2603:10b6:a03:15::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 19 Mar
 2021 06:34:56 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 06:34:56 +0000
Date: Fri, 19 Mar 2021 14:34:50 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v6 4/5] drm/bridge: anx7625: add HDCP support
Message-ID: <189a637c87827f78c433a053e3c2129ebec73188.1616135353.git.xji@analogixsemi.com>
References: <cover.1616135353.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1616135353.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HKAPR04CA0002.apcprd04.prod.outlook.com
 (2603:1096:203:d0::12) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR04CA0002.apcprd04.prod.outlook.com (2603:1096:203:d0::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 06:34:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba911ab3-9177-47d2-4611-08d8eaa11c1a
X-MS-TrafficTypeDiagnostic: BYAPR04MB4581:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4581339098DC6D58B050FBE4C7689@BYAPR04MB4581.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4SB2tc5Zb/C5OO26ssdgs+07TMZfBEOxVVHZSr6d1/HGc0Q0tt3FetRoTS3Pyrux8rUTz9rOzU+hrMdtiwkgKlgmM7oPEPcCjUPo2X7sPvNLI6oOb53Gm63pQ0u8/1h60EswF0XMbMmy6pR0ceZRDWJwSoziIJJjKCtvs+VW6IhC+KbOjRKZRjP2yjFhkTUG5DnILADv7PF2E/mGah+uNW6OHUIudZuG1WXH9l/LdSI9e14JsP8022XAzYcp6p1MaFCQQGkexwfSXn5T2HMDJ28MKTqgj8KchlfpPX3wfioItst3Gcjzse95eA+a2odxxhAmqjtXNA/yBNNnGyjRdALoXEEqQh/VVwo+K90C5v8K1xEq89Cku504O+jN8QFiWIrmmRc25QF1q6HB/RpcPNQbf6LvbWrRcnnlVK8EhAp+kjLjc60cNodP5x7ZRiyy5S3F3RZh/oYwsjz04k8RLKCc4G/RE/xATlE+NP+rChg/Gx28U0HFVV/ZdEJBfbUeDAaKh2W9rjZE4fPBLOzcm4pn+6Gl5DTbbeSqyvYtpVOp6nSOxn8H7gE329G9KiBMrTVH07+q2bAGjqtszoKzprtfdm0sWs6LpO3mj7zsgbSa8e7tqnAKZ3ZruvdScoOFk8/c0eo+b8WFx8KT/h+bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(39840400004)(136003)(396003)(26005)(54906003)(7416002)(186003)(36756003)(2616005)(6486002)(86362001)(6496006)(956004)(38100700001)(16526019)(2906002)(52116002)(8676002)(5660300002)(4326008)(110136005)(66476007)(316002)(478600001)(55236004)(66946007)(6666004)(83380400001)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QYTiVfFdxA8q77HCZy7bAJjtjBLHQD0mfyqWz0xXbHJDFTDua5C63na6IjDA?=
 =?us-ascii?Q?/18dbWHM1A1QxyCzHuJCsLfB2ZadSHJItobiNX+KElCNw3XEI5CVPIhESlLi?=
 =?us-ascii?Q?Mz5w+JLT/ObqAhnGONSneanY0zNvSvvAnsS0q7/nKY9MUqwFxYo8kXoU/Jju?=
 =?us-ascii?Q?4qkQ8nYlJ8opB9CUvdUPcFMQwGdzNxNCW/+lobL1hH1nvieqHStnIEAxsWOS?=
 =?us-ascii?Q?/kbBDTWFHwvSefJUhowiyO0k7gu4Ojyetzq0LCuqNRrSji+LFuHrW8B7Lk3Z?=
 =?us-ascii?Q?9Z2+526lfJHLApu3/6t0oTqj4/Ywdqhwd69QlHC67LuX5g7MrtInY9QaYQ0f?=
 =?us-ascii?Q?OVu30br0v5uyqsHXOEsIxQDgEecspxawAZGbyCxVmuaJa4n+KR0hidCdoUKd?=
 =?us-ascii?Q?IMaS3yt9JBxZ/8Nar3jyf8tZh26unTmYMf8Xyr9SiXx5WV7YqQ44hP+gtIYf?=
 =?us-ascii?Q?XPxkegdgPsxU0vzazuKlk5pTD+cE5fdnBlQrfT+JEGzCOcrKQXoc9iN5nEFx?=
 =?us-ascii?Q?qXgQg2DYmMsQRtyCgu8mqfSNGkp4J70cjYvO8Zba+VJZmPaFXW++yayudRMZ?=
 =?us-ascii?Q?ynEHm8OAxRtYFJJOGAlle9IZoexm78a05LMdz3Lq4wpF+7CcRF2JKAVDnmUb?=
 =?us-ascii?Q?g4+lqa3KS/GCWtlDwUHD1pg8gJzBP/z/FJfGdKgwrT/H/6SPqNheA8UmvvGS?=
 =?us-ascii?Q?gE3IYBH27VlkC/EdMB9EOGpv7jMlU6hQozHkiIbrWiuvoNUSoa7VQ7zlohNf?=
 =?us-ascii?Q?wMQ2wKHVrTzO1BeX1xOUEb4BAeX84KRdpqJ9NznCxQXPKFnv3xhMYcwHV9e3?=
 =?us-ascii?Q?eAOwXou9yJ1YEmFTahIC+obMVxYU+z/DdGWqrSkA6HsCMoQsJHMupsu7Toou?=
 =?us-ascii?Q?nsJT8+7waWptfhHszvgllLtJsx5+ulu4e3KsFA2xQK420zBQTsD8SDDswZoY?=
 =?us-ascii?Q?JUrKfcWbPKot7QWJUYBZ/EUoQr6G8f34WQqhwf6Nb6r2P726aPwMeRJRiGBj?=
 =?us-ascii?Q?j3dsX317bPm2oXibGXkuCNfuexv4FWVbfTEYlThaO658KlL0nfJhlQfWowLy?=
 =?us-ascii?Q?RaswFGhQHuWxElUEy1KCwo//qBuqAoitHhHiX/jJOQyz+wHy+CT/NNz/ld3O?=
 =?us-ascii?Q?7ftTz+DyGfdEqthcFH18fVd9lMR6Mib+s41b5QxgcliELYeVmMmxu4EEOVs2?=
 =?us-ascii?Q?Lov2dzXfxBwCLk8gLdkgntb4YFpo1k+VVqKQtXLxDDCHJ2ov6N0AeMKkC4Gn?=
 =?us-ascii?Q?wI7dlB2Cig1yfBXn/x0tUe/2qNyC8SBRshXMn2KpiIKCXI8GmMwWAiSzXpOj?=
 =?us-ascii?Q?ZmB+HkEQYuuvHEwQ759ULs8M?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba911ab3-9177-47d2-4611-08d8eaa11c1a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 06:34:55.8428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gB10pd+nyzD/wcLQ0fa5/LKGNSURAhN/yhM82kDiMZw/dyISP1cDL66jz7GYL9wKcphhcqwg42ltNAb52NdDLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4581
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sheng Pan <span@analogixsemi.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add HDCP feature, enable HDCP function through chip internal key
and downstream's capability.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 147 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |  36 ++++++
 2 files changed, 183 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 8c514b46d361..b424a570effa 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -633,6 +633,150 @@ static int anx7625_dpi_config(struct anx7625_data *ctx)
 	return ret;
 }
 
+static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
+				 u8 addrh, u8 addrm, u8 addrl,
+				 u8 len, u8 *buf)
+{
+	struct device *dev = &ctx->client->dev;
+	int ret;
+	u8 cmd;
+
+	if (len > MAX_DPCD_BUFFER_SIZE) {
+		DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
+		return -E2BIG;
+	}
+
+	cmd = ((len - 1) << 4) | 0x09;
+
+	/* Set command and length */
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				AP_AUX_COMMAND, cmd);
+
+	/* Set aux access address */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 AP_AUX_ADDR_7_0, addrl);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 AP_AUX_ADDR_15_8, addrm);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 AP_AUX_ADDR_19_16, addrh);
+
+	/* Enable aux access */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
+
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
+		return -EIO;
+	}
+
+	usleep_range(2000, 2100);
+
+	ret = wait_aux_op_finish(ctx);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
+		return ret;
+	}
+
+	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
+				     AP_AUX_BUFF_START, len, buf);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "read dpcd register failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int anx7625_read_flash_status(struct anx7625_data *ctx)
+{
+	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, R_RAM_CTRL);
+}
+
+static int anx7625_hdcp_key_probe(struct anx7625_data *ctx)
+{
+	int ret, val;
+	struct device *dev = &ctx->client->dev;
+	u8 ident[32];
+
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				FLASH_ADDR_HIGH, 0x91);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 FLASH_ADDR_LOW, 0xA0);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "IO error : set key flash address.\n");
+		return ret;
+	}
+
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				FLASH_LEN_HIGH, (FLASH_BUF_LEN - 1) >> 8);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 FLASH_LEN_LOW, (FLASH_BUF_LEN - 1) & 0xFF);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "IO error : set key flash len.\n");
+		return ret;
+	}
+
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				R_FLASH_RW_CTRL, FLASH_READ);
+	ret |= readx_poll_timeout(anx7625_read_flash_status,
+				  ctx, val,
+				  ((val & FLASH_DONE) || (val < 0)),
+				  2000,
+				  2000 * 150);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "flash read access fail!\n");
+		return -EIO;
+	}
+
+	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
+				     FLASH_BUF_BASE_ADDR,
+				     FLASH_BUF_LEN, ident);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "read flash data fail!\n");
+		return -EIO;
+	}
+
+	if (ident[29] == 0xFF && ident[30] == 0xFF && ident[31] == 0xFF)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int anx7625_hdcp_setting(struct anx7625_data *ctx)
+{
+	u8 bcap;
+	int ret;
+	struct device *dev = &ctx->client->dev;
+
+	ret = anx7625_hdcp_key_probe(ctx);
+	if (ret) {
+		DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP by config\n");
+		return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
+					 0xee, 0x9f);
+	}
+
+	anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
+	if (!(bcap & 0x01)) {
+		DRM_DEV_DEBUG_DRIVER(dev, "bcap(0x%x) not support HDCP 1.4.\n",
+				     bcap);
+		return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
+					 0xee, 0x9f);
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
+
+	ret = anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
+
+	/* Try auth flag */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
+	/* Interrupt for DRM */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "fail to enable HDCP\n");
+
+	return ret;
+}
+
 static void anx7625_dp_start(struct anx7625_data *ctx)
 {
 	int ret;
@@ -643,6 +787,9 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 		return;
 	}
 
+	/* HDCP config */
+	anx7625_hdcp_setting(ctx);
+
 	if (ctx->pdata.is_dpi)
 		ret = anx7625_dpi_config(ctx);
 	else
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index beee95da2155..c6f93e4df0ed 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -154,9 +154,45 @@
 
 #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
 
+#define FLASH_SRAM_SEL          0x00
+#define SRAM_ADDR_HIGH          0x01
+#define SRAM_ADDR_LOW           0x02
+#define SRAM_LEN_HIGH           0x03
+#define SRAM_LEN_LOW            0x04
 #define FLASH_LOAD_STA          0x05
 #define FLASH_LOAD_STA_CHK	BIT(7)
 
+#define R_RAM_CTRL              0x05
+/* bit positions */
+#define FLASH_DONE              BIT(7)
+#define BOOT_LOAD_DONE          BIT(6)
+#define CRC_OK                  BIT(5)
+#define LOAD_DONE               BIT(4)
+#define O_RW_DONE               BIT(3)
+#define FUSE_BUSY               BIT(2)
+#define DECRYPT_EN              BIT(1)
+#define LOAD_START              BIT(0)
+
+#define FLASH_ADDR_HIGH         0x0F
+#define FLASH_ADDR_LOW          0x10
+#define FLASH_LEN_HIGH          0x31
+#define FLASH_LEN_LOW           0x32
+
+#define R_FLASH_RW_CTRL         0x33
+/* bit positions */
+#define READ_DELAY_SELECT       BIT(7)
+#define GENERAL_INSTRUCTION_EN  BIT(6)
+#define FLASH_ERASE_EN          BIT(5)
+#define RDID_READ_EN            BIT(4)
+#define REMS_READ_EN            BIT(3)
+#define WRITE_STATUS_EN         BIT(2)
+#define FLASH_READ              BIT(1)
+#define FLASH_WRITE             BIT(0)
+
+#define FLASH_BUF_BASE_ADDR     0x60
+#define FLASH_BUF_LEN           0x20
+#define FLASH_KEY_OFFSET        0x8000
+
 #define  XTAL_FRQ_SEL    0x3F
 /* bit field positions */
 #define  XTAL_FRQ_SEL_POS    5
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
