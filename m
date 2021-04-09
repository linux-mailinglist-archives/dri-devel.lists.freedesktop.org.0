Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D713594B5
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 07:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAA76E218;
	Fri,  9 Apr 2021 05:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2130.outbound.protection.outlook.com [40.107.94.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0873F6E218
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 05:35:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mbJLBIr8vwfQgf0sSZGm4WNBe5lbEIztLZ7LmIRFoSk7JujyKxQd8kU5zliJx9AYaPf9/vMYZKp/xNjyQdVaelP7jRDdn/ASkYQsp9cSEBHUpoyZ6WvQQ6uWj89SzU3eXzCKxoE60DItHX/pIRFnRBA6qOXCxmKZRzq04Dg1REEz91hwjKnI6ZX9AwlCmxGKf47FuTV7v9zfZFDb2TH83JcWQZOLcsqDse5k9Ngwm2C6uaveTbnCRBJOym1EbQWcbuwsjqA5QXVIjy6nWWmPvLUwshA8+yJf8w+f/Lib0cP0hXoORhbXtamxmc9iB7U2RVpc8fJjhG6PY20TsQtTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d196IQimGvo54x1HxYSeRfx060vkZGWuf+GZc0JnAQ8=;
 b=nziG3bYUQpT+jiNfrWAif/kzN6UkARtCjegaxuftMIUQqP6sNT1+2/m9vmW4K+E1K7P2tzIXvUnqR51EUuL5S1m9KhKm0TvQSgNwGZdieKSvTzAn/b9Wfdt57QGtDh1gVoQMFP23S/3gROgW32aTBVH3bfgttvtWvDT/1VBHHUqA0laCixfWmXf7+8pW9w80y9nrQHIkTd9WJSQ5mAQYr5IF1fOUDdbaS1uN5BoHoFXSMCEqTkr78lqW12kKXRPPto7gW1bXNhNXWsMU9zkjLeg0NPZ8gJNwEgmSKDcd+g5M0Tr8UQBSQ98EC6TN7tA2FOWgTipnP3b9aYxYoBaylw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d196IQimGvo54x1HxYSeRfx060vkZGWuf+GZc0JnAQ8=;
 b=hWtTdgSnwiqXZVm2RrQKyXp/ruNLVX2Sns7eVmiAmLf7aQzsjP/7in5hNhQb0TRVPtaruuhk5zPbv+JwzJFD81UKvxer2QaJeIonH9p5eNBULxZAyZBVMuwoyVk0bNFOFhcNMAl1GDKzBjiTLng2vsO6JPtJf0QVnCEGfXfampM=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3928.namprd04.prod.outlook.com (2603:10b6:a02:aa::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 9 Apr
 2021 05:35:41 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::8d56:f2c5:7beb:2bf3]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::8d56:f2c5:7beb:2bf3%7]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 05:35:41 +0000
Date: Fri, 9 Apr 2021 13:35:32 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/1] drm/bridge: anx7625: send DPCD command to downstream
Message-ID: <18ec1a440eb71e4f91c0932cd0fadddd2e9a4c0f.1617937551.git.xji@analogixsemi.com>
Content-Disposition: inline
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR02CA0201.apcprd02.prod.outlook.com
 (2603:1096:201:20::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0201.apcprd02.prod.outlook.com (2603:1096:201:20::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Fri, 9 Apr 2021 05:35:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df1cc92-17de-425f-ef25-08d8fb194fc8
X-MS-TrafficTypeDiagnostic: BYAPR04MB3928:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB3928EF88C9114F4E6596C451C7739@BYAPR04MB3928.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qpbGogYtteLYPWbdd0KCvTGsmkSejHWmjotXR3sXXwcgvMzbKB3Wa6j+oaqwW9SnZ65L6+aQFU7+2kz9SUjek7eVdvag139H30eXKQpDADtFIJsOIzKq3E6N6sFpIDc2KMnsoxq/8y82eqKPYtOAQUN1FatwoPLRhz76/hn4ow+j2fqhyXGgWkZttbaqEi8r/b3vu5+kDSr5YFrRmks9kfXUfhNYxZsSJo49u/kD+XP2OX1eNq/n6+qd5qts3xBSK2pQaej9u0SkbzyrP5PLWY0EisGa6P6n0GrqmshqWJ63qhJIV02KLsp67nNSmnZ9z72bWp1aWpNFfKIknYL/OhG+N8cBmfndMzlBLSHx1ByQTVfFCx6CE8BR85bNOU9/OxBKB8utt1Pei4dIC4b6lXncQRJLOVlFbzp7VK/c+DcVHvf5Jsb1kGkCIPZSKc8RSyIt5th6dD86wtNMNS5rXCw5eP/iuCbEnpwb7c1MRLD7hjgYE6mWAvvVL4YbSDj9qUWD1/hLQv1faQ7vWoUCPsCqbE9m8chhwawWoS46e0PYWIANwMjEDyybXzXsXxoVa2+vOzC0LnVoyxy6NYi6pwus0wpF8B879hUj9x6EXodb3SLjApF2/wqTUH53owO/32HoRW0xIYlbdZJ2wGBALsx6ntx51V/zf1tuhYwVkTXknsLjW9tEYbtj2cveGY/L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39840400004)(346002)(396003)(366004)(376002)(6486002)(478600001)(36756003)(2616005)(86362001)(38350700001)(83380400001)(956004)(54906003)(66556008)(66476007)(186003)(110136005)(16526019)(55236004)(8676002)(66946007)(38100700001)(52116002)(8936002)(6496006)(7416002)(5660300002)(4326008)(316002)(2906002)(26005)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xQiXC9gJV/NQSKkNBDwcz9O9Evd5ln8aSnBbw2LLBh5H4fm7SoPD1u+WBNvy?=
 =?us-ascii?Q?LDwtAemihbzYFPeoq1y6WgnIXI5Io+NgWUyYt0LYHzksVmxSqw/+SPXy7DZF?=
 =?us-ascii?Q?q0eUSz4NKSAaGLj2PjspfdAVO3lginaeZRf9WEKz9611fPahrqNDRvzl7Ug/?=
 =?us-ascii?Q?ACkCH66dXault3svtxg5RWz+DXgmc2R+uZRxbY1q93Z4rJIA3TBol26F8ZqB?=
 =?us-ascii?Q?YWIoBHPdyx8H5tPmYHvjmJzVRmq+AdM4BYyh77Iw0YtFDuNdZERnDruqJC1H?=
 =?us-ascii?Q?MtNHaMKVinVhbIhgvktOum3L8rsig3TMiNC2bago+fZo2mEdzB2rcfKrmpij?=
 =?us-ascii?Q?KoPGHBMy4QsW7697r/QqehuelNWi/2tjpIDnqwYtNTboo1rLmPahVNLcZDK1?=
 =?us-ascii?Q?WK4EwHh8uaFhpYBUF4IogFTFVwec2b02EYcPTRAn+QC9GmByAIyQwLhokiLI?=
 =?us-ascii?Q?fL+X0kRKNy1P1rO4jEOUtfgt/7iZqjzkQPllu21Ek1KEBlbCzE0/ytdeuijj?=
 =?us-ascii?Q?cWQfBSzO+XH4ZE2JwfsTqzwbn6sssNx6i7kPY7YvoHzIdMGdTHQlU18E++0K?=
 =?us-ascii?Q?e8y2AYY+h1d2bmwmJA2FWCEyJOm23gOfrDmAwU3iP/zwpLSNM9bMmdSo9Gak?=
 =?us-ascii?Q?BkNhPWArRuuljZX5UjBbohYxge3xWIKyZUUv/zOv7z8Cf1P2FTOq3D90S5WO?=
 =?us-ascii?Q?UfgFXqLJDo5C+Fs33KA2na/YNrIXCGWLLttJsfGY5+KUK3HGW0yjXeFZENa3?=
 =?us-ascii?Q?7A7N8eNN01XYF95ohARIu8QFpz/WB74BdzXK9ai4ilt5a8xB3g9Lt65PWq9C?=
 =?us-ascii?Q?DLtXmwlUMxiBiE2Dcg44bZGEuqlNr/DmL2AmFuK5cjU4L3w4T6OjI8nl5aD4?=
 =?us-ascii?Q?xKkyGHeQPOIpKKfV8B6c9LjTLrASXdlIhzConLSGpqEz/vRfYu2gefnwgPh6?=
 =?us-ascii?Q?9aPPKdljri9yLi3kLTZizJT2wo+smBPeTweLs14UdoQ//Rn882G0De5tHmf1?=
 =?us-ascii?Q?QIbkaxexNfNUAiJiT2KjgiBVw05Sn4FLMOfyOwNaSH6ckMUb79dyC1i2MhnL?=
 =?us-ascii?Q?cogwr79fWc1PF+C6T323pHyfpVJVo3csA5ZfmMn6HCu/QEjzEdLJBgFtdjw6?=
 =?us-ascii?Q?IWMo/dIADEAg17zT3LC6vNO1/LcqpRSVdVP9PgP9NjHJxQ7vyMUSxe7abWKc?=
 =?us-ascii?Q?yQtl/fQBiQ3Kb5/o9+0yP1ADQuZeFORLbWwEMhouVhp1wgjF2KnwC1mObxzj?=
 =?us-ascii?Q?e0P7fWfdXxeIo8C9YA7eX0TeQVTgGV2z9sM1TnM2Q6jub1cWgAVDDh1U9i1y?=
 =?us-ascii?Q?FBb5NtUtlhElukTRxF5oPTLX?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df1cc92-17de-425f-ef25-08d8fb194fc8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 05:35:40.6796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhaIDDgxSGxTR2hQ6JQ2uCaJ44l8L8H2V3mCJIVQUBOsyTS/2kdpXDY9l/WXYsYPUkyjdLbG7Qy169OoHtj/vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3928
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

Send DPCD command to downstream before anx7625 power down,
tell downstream into standby mode.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 65cc05982f82..53d2f0d0ee30 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -124,6 +124,23 @@ static int anx7625_reg_write(struct anx7625_data *ctx,
 	return ret;
 }
 
+static int anx7625_reg_block_write(struct anx7625_data *ctx,
+				   struct i2c_client *client,
+				   u8 reg_addr, u8 len, u8 *buf)
+{
+	int ret;
+	struct device *dev = &client->dev;
+
+	i2c_access_workaround(ctx, client);
+
+	ret = i2c_smbus_write_i2c_block_data(client, reg_addr, len, buf);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "write i2c block failed id=%x\n:%x",
+			      client->addr, reg_addr);
+
+	return ret;
+}
+
 static int anx7625_write_or(struct anx7625_data *ctx,
 			    struct i2c_client *client,
 			    u8 offset, u8 mask)
@@ -195,6 +212,55 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 	return val;
 }
 
+static int anx7625_aux_dpcd_write(struct anx7625_data *ctx,
+				  u8 addrh, u8 addrm, u8 addrl,
+				  u8 len, u8 *buf)
+{
+	struct device *dev = &ctx->client->dev;
+	int ret;
+	u8 cmd;
+
+	if (len > MAX_DPCD_BUFFER_SIZE) {
+		DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
+		return -EINVAL;
+	}
+
+	cmd = ((len - 1) << 4) | 0x08;
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
+	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
+				 AP_AUX_ADDR_19_16, addrh);
+
+	/* Set write data */
+	ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p0_client,
+				       AP_AUX_BUFF_START, len, buf);
+	/* Enable aux access */
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
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
+	return 0;
+}
+
 static int anx7625_video_mute_control(struct anx7625_data *ctx,
 				      u8 status)
 {
@@ -617,6 +683,7 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
 	int ret;
+	u8 data;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "stop dp output\n");
 
@@ -628,8 +695,16 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client, 0x08, 0x7f);
 
 	ret |= anx7625_video_mute_control(ctx, 1);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "notify downstream enter into standby\n");
+
+	/* Downstream monitor enter into standby mode */
+	data = 2;
+	ret |= anx7625_aux_dpcd_write(ctx, 0x00, 0x06, 0x00, 1, &data);
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
+
+	return;
 }
 
 static int sp_tx_rst_aux(struct anx7625_data *ctx)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
