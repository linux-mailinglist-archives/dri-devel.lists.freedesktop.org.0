Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA54341322
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 03:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1696E328;
	Fri, 19 Mar 2021 02:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2095.outbound.protection.outlook.com [40.107.220.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57F16E328
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:38:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCFmZAP5qlplevMT8LmJoKjOQeB1tvQwu5yDC4rZgKLm/dWqYjLhT0nN3qDxTgb2oqrTJtuYzJtEXKdcHJFTXG5Xve2CsEUUBZabAHk1g1f4oZngDaHdrVfc7U7rIGAM02ALo6OnGByVD+O4ZEW8woBNFB36DXKsvYamIVNtwu97CC/cJqEDHUtLIUucF/nEwQ9nP3uWXpRslH/qAm35ebsRSWO8BNCbpWCB7DxE+TlIx0GLFmrOvIFdC01RNpm8J0RW9QTu5Qpij1T2rXHnjKGhvZnmvZSVl3jmUyy6bNwX4KVMdSjt/GIzc5FwU7MMcwZHEG4+z/Cv4K3lyZXIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTi7Bv0JKccVwkU4K5J1nwxMNkvqvHSfxiLXc1thNwc=;
 b=BgqC3Zf7nG5Oxao9BA0ORatoff1k8+bxuRwbkD5cUkZkkRnvXB/+B86I5IiqN+uu6aVTqOkSJlVFjoJ2ZdhWr7vWL/jzFUqjqPhEG/RlZ0NHIk4awBulpU2M1aGdyK6FewwlBwhF1E/riaaHpFC5N8NfLjrPjCHu5BYJBOmNWG7ogXEZGLksopGvQkxFS/gppugRazfkqsHbKhIcTp+KlNknE0MOFHwMAJIM7mvfHm5HB8ZdDTl88Kcfqs+nic0r2bsHaDS0I4SRwIDdysB7LVF0J8en459Iypn+R+s/ArnRePmMHUp4NBlp55TAimu9dNqNHB7abpSjlYh79FB6eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTi7Bv0JKccVwkU4K5J1nwxMNkvqvHSfxiLXc1thNwc=;
 b=KuwOUAJE0v/sjJhdrWPeDuLSPeU/XF1zaEIDAv+6RlC1FtjaJBOU77e0rnXhxMOtT5hEv7eXkWP2OLPdls0pu/rQzKXTTmc+YrK5nakNi5BPOa6uYR9S7L4djTissafq6PfLBiFDrFy+CLWlLbFl2iFOPLyCID0io7b4y+ayXs8=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5382.namprd04.prod.outlook.com (2603:10b6:a03:c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 19 Mar
 2021 02:38:40 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 02:38:40 +0000
Date: Fri, 19 Mar 2021 10:38:33 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v5 4/5] drm/bridge: anx7625: add HDCP support
Message-ID: <3288c572e44b12da47dcd013b9a3073bae71ebf9.1616071250.git.xji@analogixsemi.com>
References: <cover.1616071250.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1616071250.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR04CA0060.apcprd04.prod.outlook.com
 (2603:1096:202:14::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR04CA0060.apcprd04.prod.outlook.com (2603:1096:202:14::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 02:38:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1614e2cb-7bd6-4adb-d1e8-08d8ea801ad5
X-MS-TrafficTypeDiagnostic: BYAPR04MB5382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB53823E5EA4CC58934A3F49BAC7689@BYAPR04MB5382.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LpeLD4qclCPDhDN9OLi8GmeP2dpn4f/VGlrmvxi7VzFm3L+NzBsiCR/wkiVroetRUjL/5fijbKmp8s6S5IQOIsztEIT3tCp3ftKxAqZDlZThEHKi+YOS4/SRYn8mX3ur8ggcrBKtTh5+7mXIVJntDS95zfKpR/YHH2cKJVqR/ssdz9UzTxrEOQH/fl/3/bOx6B0Coi5dtxUAQQlTAGJWyxmm5hLOsnzxDL6TiWy8bBxPsdn3rY/m6IeQRy6uqIK2h9Bg92zQ5JYIMBD0rATb6um20+b1laIA8tCaLCiQNLZhEKgJGloTBr3OjVaTs3aYzyi8qcsFZg4kYgKOjOGqTytB5wcQ8YTR34J03wOmy+yKvkt3Gm3mB0RNWr71jWa4Lovhn2x/tEUCOp5NQaCcepkezsgJ3YEz+yzjwLYGIN7mo/b6zrRxalpQs9O2plDzNkGEQBSmH51AuSgd9TFx8Mcty5sSsm96gAXd3qhMxKoHxMV0yhmqbl2LZoVMRmjhhmxr7/NFAZBE6MGdN/RDMecA8pbhEAzmR+fmqIs/tjd1B9JfTWaX0h2WMwe2VJQE2tgWWU6QfpY/5Wa+JG0/0xrmbiDubQLs5Z64pFRuGHqyP/+zfyMLzc2V17V+rrjhAHcSBQ7Aci50pc8vSeem6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(366004)(396003)(376002)(136003)(16526019)(316002)(956004)(2616005)(6486002)(7416002)(38100700001)(8936002)(26005)(86362001)(6496006)(2906002)(4326008)(8676002)(186003)(54906003)(110136005)(55236004)(66476007)(66946007)(6666004)(83380400001)(36756003)(66556008)(478600001)(52116002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Uw6gpylFtrvjZjSvmKMbCblESp0yAlzaXkmaGPfanSxqby9PSyZSMOMXlu5Y?=
 =?us-ascii?Q?JlN26Q4rdai02acKHkc7ueFYLqw+Li/i4FEY3HGHiv+5PJ7c3ADwD8K0S1GB?=
 =?us-ascii?Q?tPCkHNyHFDNaeTahNF2btgQZRad6r4b1Oet9ZtA7cmx9y7tTa1OYOD41/I06?=
 =?us-ascii?Q?Clyj7W6Zu22u4xAPCWvbxD4G9xJleLkw1LSvkmpplqWb61wj5WnzSBJUkcuC?=
 =?us-ascii?Q?Hln9elizJ5fBfpmJiQfnKLE8iusy4qPxjH0rFwacQSH0X4Zv6PL9JAOBC/Jg?=
 =?us-ascii?Q?ddWNmYQRTE3Y8aqY4eoYDESIKQ/eJOxuy10m1X+/izwaEiJzUgSuNfbJk+gt?=
 =?us-ascii?Q?ULoLoXHgviEKqvGNXMElCU9Q0Vdz7B9PVgd18kmBDSVrWH8D8m9M/Uqa1xd8?=
 =?us-ascii?Q?zJMBcqPLIxI0fDcBcfCtZ7wHf3UMszurDTM5wHqAxBm8ZTl9/Pquthc5o7Si?=
 =?us-ascii?Q?p7SJlO0mwZiMbLI0FC5a/lBYmPentTRjd/NedTXDJloIDhvJpa8X13XvzTLb?=
 =?us-ascii?Q?QLwsA92WYB3DJ9ds50nDigYE7Ia2tqcnolXzaReJsnl56c6DXulJSlAw/Okx?=
 =?us-ascii?Q?tZTVp5tcteF+ILxCc+FvVHDx7qSKile4RIwv6V+513/QNxoErmKy3vN3XWxf?=
 =?us-ascii?Q?iqhnObm2opv+WzIuTQIBkf/AjZUCSInnJ20/S2kdRavH3k6DIwYSiELGVEvk?=
 =?us-ascii?Q?34PCALrsWq14lqHWsp/4XgzomqLPH7/WV5kOG8SNNJ49/fCqZ1IwpI+bmZuu?=
 =?us-ascii?Q?Aa9HDSXSjKaIXG07nBkQ2cMdyhqLDeuOaptwLLCmGXTjd4jMmqaRu2o1kq4L?=
 =?us-ascii?Q?kAZziR3DkmFKMpwyjNDnXfrCUwle2ArsZeczZ4K0cfDOEy24UX/NgV6zYj9q?=
 =?us-ascii?Q?0gnPcPdhpW5fdtf8bnoJ/ie19k4kQ3x2oKSGip9pE0TQTZIjhoQWOaIzq4fj?=
 =?us-ascii?Q?q1I+k5WXRBMrcyHFdQclvcPmLH1h6Ev6mxI2VodUEvvPz3f/SwFKNCDM+Rvo?=
 =?us-ascii?Q?oVU0FIvOKLf06BcjX9AjaByis2jSN17vbA0of+jLxn6OnmOhlI2bCtlyvb02?=
 =?us-ascii?Q?/17V/CYaLwtxQ/ixzq5gFwDEhWhjwWX5HTltxnAuQ5sOqoFIaAa0FifTi5/5?=
 =?us-ascii?Q?TqlYf7WGtkCvCHxL4HVnCAvJhfrTUSwQpI+WnVWLDIBfwO1D4OYbIir0nc2R?=
 =?us-ascii?Q?S05tdpoHVWd9nI7vAQaYDUGbcnzDspjYvSdb5fL1/Z28W6OhIs2b+4e2Gu0d?=
 =?us-ascii?Q?Jcahz6Su9zWXNIYKcqW+tySziaHQK/4FWKmPLgXZTnprWIrxJTLvJKnIX7dO?=
 =?us-ascii?Q?r7pUXm6QqgDmjET/7anCEJu2?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1614e2cb-7bd6-4adb-d1e8-08d8ea801ad5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 02:38:40.2736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAlLlUJo1hfr12IZNsx030o2WtJDNuv+4PBkCQDffKX7vAb0XzpZ23lWvD8M89ZW6EUcvhI3np1hFJNDcV7jxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5382
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
 drivers/gpu/drm/bridge/analogix/anx7625.c | 147 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |  36 ++++++++
 2 files changed, 183 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 5c9b801..5e19170 100644
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
index beee95d..c6f93e4 100644
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
