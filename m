Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A46867904E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 06:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9227710E606;
	Tue, 24 Jan 2023 05:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF2A10E5F6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 05:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF5A2FxbgO9cnr0aWgDoCGuTHxtsfsvqygr8l5h3G7gpov1Rah4YN3hioOJFqJTh4KWLIiaG5AhNDMd8TCFGTSGAOoRc8ZGzfcuXkJYHm3Jt/06ySdq0wbJ7RABJaNa7UZxBzGvcAAT0Rda2JLyd51upawam39Fgvj2QVSTDY1/nWIv9D/V67qT+KJIDZ6xT0LZMGkTMgwXGZ2vE44QoSgSoI3pm7NgCIqLwelahhbt7OGS82NDKO/RRozSmuAKJ1cFi+lrMrhsi5ItBDt6wSLr+KkqSuiD2eraJBvQ9bcBX/M6+vvMJI8CuMICXZZxzdkibHKX44a75n6q07VcgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmMn2MrzNdLf4gxHZQEmHIe0WNK9Hf6gYQ+Ss8LUPbc=;
 b=cZ1eWNdlqH4BGtSJJw9OjL1rrvIxqefUxSEJVUbdWdgSuEuitvO2YidYYzHY2DwPqWv/7oEnUKA+SHI6kkg6g1skRuDD4YGFE9K9gLVK54bh6LNGcwcX+KrRBWhWnKrOO812/GR1bF01GEgq0XDfh3cDTFYGxLH48YSnJOvMzbNHy6jH7tOkAA3vzAg7E8AJZ/R8UcueD59IAazINO6fS7/oJimM72yOXdLfcKO6VD91Qv1C+Gj6ypFGfM0BuN0e/tR1kRaSkmDMi5bxK1z9RVk4vGqAsqFr6ZL91+EpqRmsQ07B3TgIvorFNHW65H2l56JmnEtg7P0xg9zdhYwYYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmMn2MrzNdLf4gxHZQEmHIe0WNK9Hf6gYQ+Ss8LUPbc=;
 b=jAHsna9XPaUUn0HYkZv/srifYofBnYc1AIt0Rq7ULM2dDXQTiuilHOx9Jdf9r9yqCtQVshNiwgfLykFVOYq9HXNrg1UzBXjfeSBReime+M00pm0ply/h+ZxKlxEzmIq8Gbon2AxW5eaIBOQVk4AB75fpu+xnvabrpya65gxTzTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by VI1PR08MB10032.eurprd08.prod.outlook.com (2603:10a6:800:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Tue, 24 Jan
 2023 05:47:23 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 05:47:23 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/6] drm/rockchip: vop2: add support for the rgb output
 block
Date: Tue, 24 Jan 2023 06:47:05 +0100
Message-Id: <20230124054706.3921383-6-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
References: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0189.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::6) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|VI1PR08MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a016dd7-b29f-4535-b0c3-08dafdce7771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uaSKcXXHhv6Ui+QwCAZHb3ye3KgB+ZU1fFtwCJe8EmTCi4sxIB3rJMpibQDYt1UBrqE/43JECAztV8ruCwO4fFaUKMcUi3SQNDGodUr6tveBzBYIhZ+En+cuyMg4BY2WDxeiKHezAp5OoRNjbHDhstrFOS1SdORv1m9BFs8O9isKfG2XIgnXBzDc7Pmjus0PuXidr7rbVsNcdwFwUHhUWq7Om4GN97DYituywN0N7YoUlpgOXrkn4nHsziBsaM0DpaOiIk0WS2uPqvT8IKIOpnUWe+5u2I2T4sdxzYuJpMMj06h2a4P6y3tKMbpwgN6Q4GMH7Nk2nE6lIJjIPsvnV97rqJfW+6Xu8nolhAiT2sNLW+buL/GNvY/+Pa/rpaYp/CBU39trXHA3x8uvuetYHPiN/Lq0BF/QQo+JomXFWQ+HZxvaKdKZ9ekYbdsbe9kg+B1ii3LF81QDKZ4ys6atYqt6ppVuKIfUReUCLUCQ/1NoeE8BMgPyM8Dy5pWEgSkXduVAZPSwyo68XbU92SxEyp4QPl6frKd33PycgGHLzyLSikGMM7Lp4MOp3IZyLhS96GUyG57DNPKsaWV8yp/GwCVL9QRIN02fg476z0ifaa4juVwVWcbA+1wwmfJC1mmKGJEtKn4JvEAkKYolhELLvw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39840400004)(396003)(346002)(366004)(136003)(376002)(451199015)(36756003)(66946007)(2616005)(66476007)(66556008)(316002)(54906003)(8676002)(4326008)(6666004)(5660300002)(7416002)(2906002)(44832011)(83380400001)(107886003)(52116002)(6486002)(186003)(1076003)(478600001)(41300700001)(6506007)(86362001)(38100700002)(6512007)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?puEmXFztMRFYwmJlRzumJzg5aq6HRDzELbT9goxm3J0EURxKjtyWn2rqv3Z/?=
 =?us-ascii?Q?yuwqgdiO2Hp+QwMPMbj730IhHALAI1V21FQFH31Jd+g1ssR5l3aliORgkFLu?=
 =?us-ascii?Q?Okt3oG9MCs/mjhEEASKBAGG8N8flJbx+XWV2MgmBJzv4a8TvWYt/CwnveLyC?=
 =?us-ascii?Q?+3MRqVhd/IdWnk64Dqcmf7DWarjztVMEHYJi/tGzUL0IFypobR3+Fo2ryqsB?=
 =?us-ascii?Q?cdAs2PcEYImd6p06ZMBiCakK7Cxi3abGHlpMbWhuzcWI+MJ3GZkSroqES9OC?=
 =?us-ascii?Q?JYbfFBsQGXT1guaoqiIXwoQylU+6vfZIWkJQ5KF5ApNxodLcIwzQCX8m1+IO?=
 =?us-ascii?Q?YsJ7UzyTB7wpLDwMJ7UjGAK/bUTPEg/eQJYg07gukoSkEb9Kikz+oozX66jx?=
 =?us-ascii?Q?/fJVBbXvw4SE71FFYW2kZgQZAt5KjrN0fHInGJ3LBVwwznv2KcHpANK7B6sw?=
 =?us-ascii?Q?xFvRff1LCwSCMnddW5l/VPHfBGmiciWjQCWEnfL+L7VjrxRpy++3noKhOCqu?=
 =?us-ascii?Q?uOwPRjCN9LsbBLBCdK3LlnVyEBjhfaXq24sP3TsOCL0LkedOFNT26QOD9+5B?=
 =?us-ascii?Q?020B7MwdYIm2OQYq4LxNWKqlrXQ2vhk/oYW/pXZY20DxGrY0P4MPCgJbcgBo?=
 =?us-ascii?Q?c2YEfFGYWTDaJrsFckxVmuS1FvYjN9JVhR6hFQTY4DuBJ+m0Jt8+9OCCIyr5?=
 =?us-ascii?Q?WjjP2zcAwM3uIYlZL66Y8JozzBYbwWNqkMlyr93BArWuRb18P9EoVa8joXw9?=
 =?us-ascii?Q?iIu6427X5mIDb2Tud5IsMyQsDa4PZuM77AiMwg/pEnAGKHUIOMMRv3sH/BaR?=
 =?us-ascii?Q?zQvsrdkrhZW7vDQ045cKOzqc7m8ze/pZUYVa+EC28Xi/SX52VvycMvE8t+6j?=
 =?us-ascii?Q?TxKIPoaxghLsILxvb7J1fm7ESNsmwdncO94Xo+yXsGcTurt0hnhhBx0V97ak?=
 =?us-ascii?Q?QNeEnevOWwGH/jcHADrwm/tRMJ8MX4T49rUPHIFFQhsL902lkf3jCFoxZgqi?=
 =?us-ascii?Q?9+2rJzFlYLN1voD6DVTOxheCGim4Bi3TzD/HEKATk63ZaEG/asl4jX20pNdt?=
 =?us-ascii?Q?pS7bQLVu1mTBmj3vtHV3nAqv/Ue8/fGmOE51RFxD1D/VbYwo+SYws9C1soCs?=
 =?us-ascii?Q?Z3L59uSpNYzJvEdp6b9NDBV3Y3IANC8TCXfHiPMIgP9CCBc+xQ8M/o+XpIhg?=
 =?us-ascii?Q?7SBwm5zwcXsupuLGWUiT3cx1WInvuUbIOVqinF8lDmG4NUvUqweK7Tdzzp6T?=
 =?us-ascii?Q?dCrYfZwl1V6CpUTVhaNdML3WKytllF+HpD2Z7tmW0gFS3sjWgxXRS/fHVfu1?=
 =?us-ascii?Q?H19U1VfCU6sEF0wMbsgmW2ipoRZcypbF9kz/fScwocQ5TTq/Jn0lPEYQA8Fb?=
 =?us-ascii?Q?hqufJkll07Z+bY2UywdIQpg4KWkYBEDjCNo/JFnHqvTrl3bp2/GDmyla14E+?=
 =?us-ascii?Q?IyOxFuZ7AwXfTZ3/2Fznt028i8HT2eeAaH/KVrbcVEybna7VPMcZsYnUy+s3?=
 =?us-ascii?Q?wqZJfSqsJdQ7LKVNoisP4v+Z5hbgTm96twEl0RAvK5s+ea6C8bObPzw0ch5M?=
 =?us-ascii?Q?TmjpdlsdwhqLKNsK3QrNzzgEz6mwSh0X3GBepxm0EX10aV/M/5vCSjxbhu3x?=
 =?us-ascii?Q?eHahdurAqV2g6C3QXfOxgHUmUTWYxi4WWY9jdedv6UdTAKYzRsg0Wurnq/TA?=
 =?us-ascii?Q?fSX+2e1/1Z3GYw/IB1QXr/SAmAI=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a016dd7-b29f-4535-b0c3-08dafdce7771
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:47:23.6157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rtwT7sze6TRGqBFKYjVzQMCjrodU3HpZBY3XZwfaq0Cw57U5S9uccmB1sAsti89TuUGSkrNc6B/MvNSq7QNc/c0XbGD0bpdjEVPypKAgNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10032
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Rockchip VOP2 features an internal RGB output block, which can be
attached any video port of the VOP2. Add support for this output block.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
v3:
 - fix commit messages (still assumed video port 2)
 - fix condition to make 0 a valid video port
v2:
 - move away from wrong assumption that the RGB block is always
   connected to video port 2 -> check devicetree to find RGB block

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 06fcdfa7b885..f38ffd0ccd9f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -39,6 +39,7 @@
 #include "rockchip_drm_gem.h"
 #include "rockchip_drm_fb.h"
 #include "rockchip_drm_vop2.h"
+#include "rockchip_rgb.h"
 
 /*
  * VOP2 architecture
@@ -212,6 +213,9 @@ struct vop2 {
 	struct clk *hclk;
 	struct clk *aclk;
 
+	/* optional internal rgb encoder */
+	struct rockchip_rgb *rgb;
+
 	/* must be put at the end of the struct */
 	struct vop2_win win[];
 };
@@ -2393,6 +2397,25 @@ static void vop2_destroy_crtcs(struct vop2 *vop2)
 	}
 }
 
+static int vop2_find_rgb_encoder(struct vop2 *vop2)
+{
+	struct device_node *node = vop2->dev->of_node;
+	struct device_node *endpoint;
+	int i;
+
+	for (i = 0; i < vop2->data->nr_vps; i++) {
+		endpoint = of_graph_get_endpoint_by_regs(node, i,
+							 ROCKCHIP_VOP2_EP_RGB0);
+		if (!endpoint)
+			continue;
+
+		of_node_put(endpoint);
+		return i;
+	}
+
+	return -ENOENT;
+}
+
 static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 0, 0),
 	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 1, 5),
@@ -2698,11 +2721,29 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
+	ret = vop2_find_rgb_encoder(vop2);
+	if (ret >= 0) {
+		vop2->rgb = rockchip_rgb_init(dev, &vop2->vps[ret].crtc,
+					      vop2->drm, ret);
+		if (IS_ERR(vop2->rgb)) {
+			if (PTR_ERR(vop2->rgb) == -EPROBE_DEFER) {
+				ret = PTR_ERR(vop2->rgb);
+				goto err_crtcs;
+			}
+			vop2->rgb = NULL;
+		}
+	}
+
 	rockchip_drm_dma_init_device(vop2->drm, vop2->dev);
 
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
+
+err_crtcs:
+	vop2_destroy_crtcs(vop2);
+
+	return ret;
 }
 
 static void vop2_unbind(struct device *dev, struct device *master, void *data)
@@ -2711,6 +2752,9 @@ static void vop2_unbind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_disable(dev);
 
+	if (vop2->rgb)
+		rockchip_rgb_fini(vop2->rgb);
+
 	vop2_destroy_crtcs(vop2);
 }
 
-- 
2.30.2

