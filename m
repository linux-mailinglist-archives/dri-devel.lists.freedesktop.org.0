Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4F48A7B8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 07:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3B811B931;
	Tue, 11 Jan 2022 06:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2107.outbound.protection.outlook.com [40.107.102.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B09113D6C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 06:31:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3ojYFkiwyuHocqBrghAZDRTwiez/nCZmeR3BTS0IJHdapLqMTabljSDbbvuT8rYcFD2fMy3FCPUROlOr4o8TtmYZUoWnN4EmU8xPUU97F5mg/IBr+nFGw287joA3rD1vMihwH5hPXgjS9p0rCYWvaEmBSPqFo6rvoFFbS4rSpdx8WN8+K9ZR20ljy2VMRGcFg/pCvGG4/pWpjJKzTc2Ou6QhKZtYWAnRyfg3AoGDorwtBF2fYWZmAz181HljgLUdUbfpbJC8k+Rj5Wtz6xM1LOCsl5JLMuqi/0qy380ADngZwPWCb6CPPey3m5b8RJsNFnbkXFx1B5Po8LyyiBP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGGcieNHnNwifheg1tkeE19bKcA6z6kIBhe4UpIaQfo=;
 b=GJNjbkxkAI6URggMva7C27lyhtdRiZVUMwF5+6y8SVWSxNUj5TsJBhwWRCY6S+v+BIaTdVH9y9gbZ9d5ATw6bp6CHPvP5hjBw9GYNR5m674FV5UcH4Vy+Hrj1rFOYXvuKoJ5+5FThkaw0YCHVA5jetVK2oDRvMbs0GAVME/r+EMMbpX5kcjnOA6We6NK9EsxtLbcNTQc5m9fjdabh8b6HG8RQUhn/7LiUgNv2pKY5hoFvWfE1NDATxUL88QlrEPjEZ2xZXHu9Up+CuXspdXq2lG1qdpKEkbwmIryd1dY7ZPelDE3vjxVQtVUzgiZCAeo1iMD8kTQ00GrzvGr0YhLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGGcieNHnNwifheg1tkeE19bKcA6z6kIBhe4UpIaQfo=;
 b=4b86yjsCO7esiJRsJIhtKSJBImKk2vxo7B/EXjkGJRaje1pz7vaEy178zbrcf+YUToj5L8rdoVE1UCJa6SL3pl/DUQKLrBunfW7FbHvd5XQYznM13EfHxp2A1IAOIgLibRVJMDNTdNZ+jZxDQSNiN6gq12g4EanDsgQuhOGsmO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SJ0PR04MB7518.namprd04.prod.outlook.com (2603:10b6:a03:323::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 06:31:24 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108%3]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 06:31:23 +0000
Date: Tue, 11 Jan 2022 14:31:14 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v2 1/1] drm/bridge: anx7625: send DPCD command to downstream
Message-ID: <e197f28ce96295beaca567a5d96a3306258acc7e.1641882111.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: HK2PR0401CA0023.apcprd04.prod.outlook.com
 (2603:1096:202:2::33) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6acdd6c-02e9-430e-82f7-08d9d4cbfc97
X-MS-TrafficTypeDiagnostic: SJ0PR04MB7518:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR04MB75188AEEBE0AA54CEED45110C7519@SJ0PR04MB7518.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LZ9Dmq7A0cKjMFBP3DzpwXLU+MYlPlNpCOZayL12JhRmbAqA7WchFW3C8n/LxItASmV0YjMv/FZrqZDAPwh4doN+Ctk2k4GfbCQORnfBZtJha7sA7YpfwenA5XBloCaET8SYEagX3n4KutUNRYVCiswL6KvfHJ9Lbcg/N93cmypuhI4rWUCU3EKyGTbo7o/LYJUXzjYoNoOHkM2ecf9OIVyI7U+P+MQoRS04zkHWWxCRaDeatL3VKSedY6+EN5Zv3r/37wgl+nIlg55S9V5lKoUnWG/51zdw2AcWbKUo8qIUyzS7VYQxR7RqhGXipS4P5hmNaaNCZLRVh8W6Vntq27GaUH3kFd0w0mcqN0AdyFdTBK1W9GPIrKdrK7rlDGCj0xX+lY8Moab8FtT37ERxP3Vxrym9WRwhR4SJaYPxlC7Ru0EgZjemJRhecCA4wY+iMT36Q0YBUjuw7bwdnDGCb2UE4veO4LX8Qasthwe3uMsmdm+I7gpVa1KOsTC+wBR0aXIq6AFQvAH6JGAicesIrdWDCIUqTB/u2fblyhRdiY21oywb5G1ObQPLgP404etVjhX1XwQ3PY1tkFHBUPaOH+ig71ILZfNkp1VmprFP8fuIWzfWMDFUKC2rI4RCV5SbomtJO7cOH8SkIjIcNHTsChr0o2IN8AEIzorNm55WpSoi34D3Xy9abhXOx75pkvUE4odR7yQBcx+dTYCsY5MOxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(66946007)(8936002)(52116002)(5660300002)(6486002)(6666004)(66556008)(316002)(6506007)(26005)(2906002)(186003)(38100700002)(38350700002)(55236004)(36756003)(6512007)(54906003)(110136005)(7416002)(508600001)(4326008)(2616005)(83380400001)(86362001)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DIt8z9W//6hp43+VRyGOYmg0pA19CPaaqBCsoj2r/DmNMfZ+pcI+qc0zAyvv?=
 =?us-ascii?Q?FVwusiLJPdSLjTskrHLPxHSC16sKORRasp4FNSCyDKj3h/ZlhrrefViBdut8?=
 =?us-ascii?Q?TE1zX2apSWt5RyNMEN3l2nnLH1G5nP8Jm+GTZPcckEy/k3JhOfi59m7i4Q0y?=
 =?us-ascii?Q?ZuTJB+yw0XkUA58K/iNtNSMknPTm1JXDDcjDrdaUCTELCfmLNculQS3LCtrM?=
 =?us-ascii?Q?1VSny2+mpV+I5bMxvo55KrGh82QaFObp4BLPuRI3jAaCTpXQDAepcfK3huOg?=
 =?us-ascii?Q?/o70KPfAxPqyJShLGSU5jI5JkFWs6H+N/uIuWW+v5Tsmsxl9nEfLmDa0nIzt?=
 =?us-ascii?Q?dW0/zNqk8xw7yE9VxMAX9dpwBf84yjeJp6TTlDoNMXF79tCqn0S8rsz1SyI0?=
 =?us-ascii?Q?86PrdVq/PfpoTZuS//PoF2EjumKE3Izug5CkD856Zd9QZRaB5zlIq+nMQJjv?=
 =?us-ascii?Q?EyA2x/vBDiagk8CqyAWZo0nssct8J4RMNC4l6LU+zR0zYGJzGgtZq4M1ONCl?=
 =?us-ascii?Q?WviM0COGXoRJCeLadJqUn+EXISpob2V8QFDqjqbdwD4TRMKfcfId2Cryi+7I?=
 =?us-ascii?Q?9bXyXvLzXxwGfU/SGxTSvZzvbZm7FdXku7SLlbJ3xztp/im5YHT7SqxML7sg?=
 =?us-ascii?Q?m2uExiFxA1xJssXbZ0fWvXYo2jPZd5HXHJ4hb6CcJnu8CEeVOMO+H8bsOMtX?=
 =?us-ascii?Q?Rt6hiMYKi9iuptNLKkffL9n72PXcqIn5ejDKtkyj0tWBux0olfVxbFWKyxNs?=
 =?us-ascii?Q?+NM2eWWN5PT5mpEyAILxyYTdGz2wOzkU3z9Z7HFRWbkL3L/PyE7qyTpfkxQZ?=
 =?us-ascii?Q?Khp5fQ45LNGbll1Qf6gS/EwnkZzZsfmoSVm5s4WyIiKk64BbVUG95DK8uApG?=
 =?us-ascii?Q?quHWYNNV8FTPcs/gCFlj/EqlFskzD7gvk14XX5WluxZXFUnT267l2OgQqs7s?=
 =?us-ascii?Q?dwxKxaX7gL4XdCOrCglE5ZuK2yKu+MERTg3nANh+QRk4Hhl+8Xs5YQrK7fY3?=
 =?us-ascii?Q?X9BfOtMOR+eIcWsZ/54GyFDnq4OswQxTfECa8TAJ9QQaBFU/KCRonGjFB6W+?=
 =?us-ascii?Q?4BLndfs/b2qqThiahc6boK+iUAjuM0HzHW6QeqZkeRH4UDIxWausXKA/mdFh?=
 =?us-ascii?Q?IiFRwisRmh13xZ2rtdED1JYRT9az/wKoaNTUO0y4uKhSD1wKJwUtTD+VirkX?=
 =?us-ascii?Q?/ymXXBeGRM38AiqPUJ36XCSn/n35MX5HS0oJaM64MosUCidLYL1djVI0x2tZ?=
 =?us-ascii?Q?WM673tNHDyTNa7CIU2UY4H1v5F3UTwFhya+2dTFnx6LJQeau4rUkiCneUXcR?=
 =?us-ascii?Q?WH2XUwGeOPW7Gck8IP+K3WMw7t5CEJzWmOj9U6HsbxpZXZ6OuSYtWMVitBGf?=
 =?us-ascii?Q?YeffEYoYYjPtQCtmPvUYEsfr8VS5ULXqRGJFSyzUN1gc0dGA1Q+GDZRJ5Fg6?=
 =?us-ascii?Q?Z1TXahrXgpgaf+YmmpqeJ+RTsSwZ+hhTyg0aIGxStG1azpyl/5q3SPx2FaPu?=
 =?us-ascii?Q?m2ak+1pcSsCe5ZogYZNTz9feTle0GivipRAZVduyio2fJsHXtQ264ZnROp9w?=
 =?us-ascii?Q?WIuKVHxPnobvaSqN553w5IfFaYS6i5+SKWXG6z+TEQ7WoBb4gzkeJbNHX+jP?=
 =?us-ascii?Q?p9LJ6mqk36hQA4TGi2qbNJw=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6acdd6c-02e9-430e-82f7-08d9d4cbfc97
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 06:31:23.5882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrrRUz+RfRUL0yDNQ1yg5KojzUq6K5IuWnP0L9I+5tthzKebxa4jIXFM+CG3h/q7iRf18RhzzRs1XvZWLAQp2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7518
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
Cc: devel@driverdev.osuosl.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Send DPCD command to downstream before anx7625 power down,
let downstream monitor enter into standby mode.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 40 ++++++++++++++++++++---
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 33383f83255d..fd2217ae455e 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -129,6 +129,23 @@ static int anx7625_reg_write(struct anx7625_data *ctx,
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
@@ -214,8 +231,8 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 	return 0;
 }
 
-static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
-				 u32 address, u8 len, u8 *buf)
+static int anx7625_aux_dpcd_trans(struct anx7625_data *ctx, u8 op,
+				  u32 address, u8 len, u8 *buf)
 {
 	struct device *dev = &ctx->client->dev;
 	int ret;
@@ -231,8 +248,7 @@ static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
 	addrm = (address >> 8) & 0xFF;
 	addrh = (address >> 16) & 0xFF;
 
-	cmd = DPCD_CMD(len, DPCD_READ);
-	cmd = ((len - 1) << 4) | 0x09;
+	cmd = DPCD_CMD(len, op);
 
 	/* Set command and length */
 	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
@@ -246,6 +262,9 @@ static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
 	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
 				 AP_AUX_ADDR_19_16, addrh);
 
+	if (op == DPCD_WRITE)
+		ret |= anx7625_reg_block_write(ctx, ctx->i2c.rx_p0_client,
+					       AP_AUX_BUFF_START, len, buf);
 	/* Enable aux access */
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
 				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
@@ -263,6 +282,11 @@ static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
 		return ret;
 	}
 
+	/* Write done */
+	if (op == DPCD_WRITE)
+		return 0;
+
+	/* Read done, read out dpcd data */
 	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
 				     AP_AUX_BUFF_START, len, buf);
 	if (ret < 0) {
@@ -845,7 +869,7 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
 	}
 
 	/* Read downstream capability */
-	anx7625_aux_dpcd_read(ctx, 0x68028, 1, &bcap);
+	anx7625_aux_dpcd_trans(ctx, DPCD_READ, 0x68028, 1, &bcap);
 	if (!(bcap & 0x01)) {
 		pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
 		return 0;
@@ -918,6 +942,7 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
 	int ret;
+	u8 data;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "stop dp output\n");
 
@@ -929,6 +954,11 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client, 0x08, 0x7f);
 
 	ret |= anx7625_video_mute_control(ctx, 1);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "notify downstream enter into standby\n");
+	/* Downstream monitor enter into standby mode */
+	data = 2;
+	ret |= anx7625_aux_dpcd_trans(ctx, DPCD_WRITE, 0x000600, 1, &data);
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
 
-- 
2.25.1

