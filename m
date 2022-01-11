Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F62048AA1F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2179D11B3D8;
	Tue, 11 Jan 2022 09:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2129.outbound.protection.outlook.com [40.107.94.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C19A11B3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtxXJ0ueb3iavIIBCD0N2qk14r0gbmEV1aXzmWrJ9kvrQus2j3id5m9LsYYbZBGsYrncALVi5bSlxitvTNNRI+OBrSE+P7KPeB2IreNq5vO9FI5PkZu/frYhOwdx1INlmMN+KEYl3ihYzE2Gmdnp1gnaFpKY1g9VV48xsiS/N230g1WvLxAqQUSFisBP5vXmPVhyL8sqDdolMqZcOFiFR3i1X1m2x27p6571n9oVgV6gy1FAc0UyvZc+XCs8+F6gRXSlYjBYeaTYNqasGArejqq0pNIYRGi5RHLjGJ7zGARx5JY7n32+diJMhF8iMoKx086U4phWuo8yVg6r50rutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcMS0B8eKW/mQO1Q4cBTJ11DpPBhClngCeI6odJ+Amk=;
 b=h+XRFaSxXBdJ9qVkq32LYXEgT+4C1NB7iB3vvfXmJaKkblPtUfI3FJcsMQLBT1nvFkuj8Aw6zkFONNKmi7Lv2Mta0rhVvWqtIfhglIlB4Pc4un/qruAmx8wIzY9sKeIS6+iVgOwot3T611Dz9faCmiF+5oCdw9xvL02+8LWqhYrg3cTL1KqBnakFC8ffjvMz2SEnQQC79jyd9NJZ6kENe46/0gCCzCbxYiooLO6nQYODJAFKioBHTbhSZNka/Q5B/tkcH2xDNB/2JB7EN59Eg1hf+HjES7JQypBH6Bt3SQf29xYcC5T0EERFbPLXeh3Tmi76IcpoAKUejWE353+ilw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcMS0B8eKW/mQO1Q4cBTJ11DpPBhClngCeI6odJ+Amk=;
 b=hOFTy84bZqWKLsZYi748DKXzaXw4T3sKuRq77mbgqrzbrYfTspfTRCimmHPPlQouOqGmHg0ShZGZJkAKuWndd26Fu9+c9104Q8VpKNU39EjzC3gU0Uu4swiP9XO6Dtez1XhFC/CJoMeOZ3U60QLGZyYOoj7RyyHuXfgvUuFlk4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB5077.namprd04.prod.outlook.com (2603:10b6:a03:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 11 Jan
 2022 09:06:46 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::c25:c736:478a:b108%3]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 09:06:46 +0000
Date: Tue, 11 Jan 2022 17:06:40 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v3 1/1] drm/bridge: anx7625: send DPCD command to downstream
Message-ID: <1f36f8bf0a48fb2bba17bacec23700e58c1d407d.1641891874.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: HK2PR02CA0159.apcprd02.prod.outlook.com
 (2603:1096:201:1f::19) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5641bf6b-ffab-4a84-12db-08d9d4e1b18b
X-MS-TrafficTypeDiagnostic: BYAPR04MB5077:EE_
X-Microsoft-Antispam-PRVS: <BYAPR04MB5077762D3BF009706CA71AEAC7519@BYAPR04MB5077.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b0FEmEaRHbZX1ApeyNjCzqCwpDHRVWkCJhZZHyJs/+qsfQDuXG3IRSwe4sCNkNVPQ0PoP72QGiYJWIkAZEt//nCA6Q594lNB9ouc758+LdYChvNfgPtzQdSMhU6cRDvoVbuCvfmznKAYXm+5Tss3DlVPnpYCotEETibrj04Kf16BaoUWJ5z2wXGl/xMaLcnPP1jk01JJ2PyVYfTLoe7amJ6vlUSM/YOAFJu0cz+Wsz7Uxc2rvkjNG1iYTJJOsajqV0MKRFLHowX/ehggw0vj/pln1wC/8BuLNE/qPZ2fDaR7P93x8T3jLQBm6TFklIksr7wwpS8784BFERGum50TzQLa9iLhmNyVS3KXaqVDWDy0aQZ1DhmI04logcP4/1abAbDbarvo7LnEfQ+VWrl7vL4eeZqqiH3csZ1BgfXi6cQaPm9mQc64AeezJrz/ugYsc2dMZiNJSJ8e5xapMDt72LdsGo4vDsUobKW0jp7FU4zniVfO2jP9Q9cgGVUbJklejdeE9+Z6pfeF1Hl4RigFOqW+UrACLefQAGh0/2jA7hGxoDwUwyR940fUf5flRKy4oV5i9qGHm5/jftTsxw60IuSQW73mC0jx8xjLRu82N/p3jsP2S/G7S9mDfPyKEPNW8d2sTVi7U8b/5CZIddchFuYCg9uTRqUIuCcOT9d6q/EtaRwz5klZzIhXVkirryjOkM36qXzwHYal5YZJ/zPMbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(2906002)(36756003)(6512007)(38100700002)(38350700002)(86362001)(6666004)(66946007)(8676002)(83380400001)(6506007)(66476007)(55236004)(26005)(52116002)(186003)(5660300002)(66556008)(6486002)(8936002)(508600001)(110136005)(7416002)(54906003)(4326008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?toG/hnpWILtQdH0gkOqTTN58db7geN1FfoXi1IuVJirjOWyCfoASr1jVjwLL?=
 =?us-ascii?Q?ojHu5Ghlje1moSfap3nyt1xgvjRwBN6FWp0ItgTGRQTSEr3STzlTWD0RyVsR?=
 =?us-ascii?Q?Tmvf1Z2J3X/WyaeXOLJM8yRFDTqkaJ1KyrC6ILxVudqbHxbzPMfHdHTFt7tp?=
 =?us-ascii?Q?Ho7V7qbKJRrlZ7T4D/j2t76nge7ms8CFCuLnYxCsimiyqf5PwszcYL2rs7jl?=
 =?us-ascii?Q?3EAU0cRBqz1kiJZ5GTlhMi9teHfyvskJNUGdjCkk0ZnQg9hdSzg7+TjIEOcm?=
 =?us-ascii?Q?hfsWdX2vw08JnAq7iHNty8xbZGIKviBg0N0gY3sJxL8VJuUwpWjUl5XP9qMM?=
 =?us-ascii?Q?F0Ar/pU3fese+upJGKpDZrGA0ue5phKOmTiADgfhO9U4K4/MtlQEL9vYsT1c?=
 =?us-ascii?Q?gi7kykjG9TKkSJJIKXZYnQ//y+PQKd+QWgWu2QsI9TUDSPN4/wyfJoixnq2F?=
 =?us-ascii?Q?TEGLydVqQlSqA6nnDvZ9LkW3G0eS/YPS2u9TanOpcvMPprWCpQlC9quRYU4d?=
 =?us-ascii?Q?HMX/MsLivfHCW8wmAK9e6qh6emcK+m0M02yfSk3RgB5cODnIceDTbAlE8t06?=
 =?us-ascii?Q?iX0Ji8OvayaloyHYjqMHTNmbqsKszzXi7bwe4trSPOqcwxFgUJp8XBxfvnEl?=
 =?us-ascii?Q?0O2wcsNgdm4nXzF4hxmZ79zrNEv906OertMFcWKWGdPyxrw+tSBYjK8RSP40?=
 =?us-ascii?Q?+avXwc/U+Cy60XCwINyTPJSnxNBcmuOTHVnO9P4r+wJbqpxb9l5nq19pHoNm?=
 =?us-ascii?Q?htqTSzSUbAgAAa9XNRlHMSy6JNDTfsCQhdagMhxqyNRBdl+TA597lZZSNGPK?=
 =?us-ascii?Q?BTu1Im7WCNhsvTvLZooJNj4OXSiA9SPNmdXbv3yxaP+33gJiWrBwkkxo7F0D?=
 =?us-ascii?Q?sR64t6T2heDeilEtbbX1eUAwkmLXvBR0hA8pjan4n80SV0X6TQCP3AqxkNjS?=
 =?us-ascii?Q?QJlLs333wD8D6cUkxyre1kx52LK8NP76PbkPIjeFD6A6SZg6HcDiziRa20pb?=
 =?us-ascii?Q?+8hg5twpb+CMx+Yn9MeXqvsRAvOv4+fZ81BUlh4jDsj+mAkY7cs0FhORGvBY?=
 =?us-ascii?Q?ixpYD5sHXiGK87QTF2S6wsF3jovKPULQAxTPeqPXv89Egx0XiDEjYgsmQ78t?=
 =?us-ascii?Q?h1iW2jRT9cr5Bo+7iujl+MIe5fvUMKmh4zsXqzi5OxvwN/pl6CCocL1hOe8W?=
 =?us-ascii?Q?urrgPjgcCSiBGAtZfb5m+ZHzUZllS0zr266vuI01lrO6A2uRPCuEQ2HxP5bd?=
 =?us-ascii?Q?Sm5vhihHNeTaJfjuMy2at0y+FBnmxB+LbnTgXRzbbAg4fOELVz1LAi29XtIp?=
 =?us-ascii?Q?XjIF+XQ47P8LCynLEI39P7YmsiGwxoOfTkBzEcsT54uMVN1m1NLr4fNb6jrC?=
 =?us-ascii?Q?FQ/VE/Cxk7k9LGBtUDysvARu21IDur+SfcAMsRCdiwVsDrm44hAhv31ZkX4G?=
 =?us-ascii?Q?i/LgeWe8TKiLc1t6HSUgHRx/+bjHj04bZBd9FsCBqm9U+8YI5isnA3gFzx52?=
 =?us-ascii?Q?9/WlQ0CT2uotKGgeAhmj9EOfy3TKWGPLDekUS8yzxT7KanVG5MneUN2cS2WA?=
 =?us-ascii?Q?nlkJPzrwy5Zx73t9wt/6iLZp3r8vCMpZMjQJTKZjBITwjR7+t0ATd7GoKZc+?=
 =?us-ascii?Q?xbZxkMsUxShhTKzN2yocZHw=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5641bf6b-ffab-4a84-12db-08d9d4e1b18b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 09:06:46.4015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wd2Zw3KsUVa3BhzXGRNpKwBG6EjabGTsZnSymVW19Eedy9MzdM3AiWbzUXBqmhRXBTyGv9TIbOfwHx5MT/5YhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5077
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
 drivers/gpu/drm/bridge/analogix/anx7625.c | 42 +++++++++++++++++++----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 33383f83255d..0b858c78abe8 100644
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
+		dev_err(dev, "write i2c block failed id=%x\n:%x",
+			client->addr, reg_addr);
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
@@ -255,14 +274,17 @@ static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
 		return -EIO;
 	}
 
-	usleep_range(2000, 2100);
-
 	ret = wait_aux_op_finish(ctx);
 	if (ret) {
 		dev_err(dev, "aux IO error: wait aux op finish.\n");
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
@@ -845,7 +867,7 @@ static int anx7625_hdcp_enable(struct anx7625_data *ctx)
 	}
 
 	/* Read downstream capability */
-	anx7625_aux_dpcd_read(ctx, 0x68028, 1, &bcap);
+	anx7625_aux_dpcd_trans(ctx, DPCD_READ, 0x68028, 1, &bcap);
 	if (!(bcap & 0x01)) {
 		pr_warn("downstream not support HDCP 1.4, cap(%x).\n", bcap);
 		return 0;
@@ -918,6 +940,7 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
 	int ret;
+	u8 data;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "stop dp output\n");
 
@@ -929,6 +952,11 @@ static void anx7625_dp_stop(struct anx7625_data *ctx)
 	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client, 0x08, 0x7f);
 
 	ret |= anx7625_video_mute_control(ctx, 1);
+
+	dev_dbg(dev, "notify downstream enter into standby\n");
+	/* Downstream monitor enter into standby mode */
+	data = 2;
+	ret |= anx7625_aux_dpcd_trans(ctx, DPCD_WRITE, 0x000600, 1, &data);
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "IO error : mute video fail\n");
 
-- 
2.25.1

