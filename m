Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E76A673C4C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201DA10E970;
	Thu, 19 Jan 2023 14:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062.outbound.protection.outlook.com [40.107.241.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2472310E96C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:39:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sya83KXQivjVB9BB/bQduH18notfoHUu62eXMS+XPOwsZyS7z5mDJyygNn2dERphOgDCKWPOvW51mGwyTtpz4ZaCgUeXqU66ol49zAnXOZqBzY/ziHooEpVvyzLnq8G93ZJPkSj5QiJN00YhD1uRBkt4hg6fJjRdv4c0nwZ2UccPPvDeX+zdmEhyVx/tdKITYtofGYUXQDh7nW1SxAVUDFkcbOQNbLqNSki1Z8DZUzNhR9KzhJ+6qxQHDG6p1H3PwBUWNIzqjYS+0bB+7VArFDpnsRw4SjQfBGCc5sGsxhvsdGiPw8CPym0EYtd3XDlBO+SGkJyTTQ4E2WVBodW3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2F3uF8cnXUZ/k+w9WKWhvCjJSIzUe3ncb1orqRKHaw=;
 b=iK2vDJkBS/bUcv23hJ4D49g8coOrCp+YizSsByURLpDJOdLzImZC1H6wXMEK11m1BFhUmQ2JLBrXGB5dGsPq7oPH734osIODZ3s9LMf00nSlJPyyqh7HC8jcXB0VvTCnel8vNV0jpYYehPUys3IbSVNdV/eDH3F7rnl7x9rONcela4w4vNEgLbVKyhb/PSkdnjGWAAWaJaFNOjqT9jC4U6fKaAU+5KTT+LZZU0WVbAmql/qvD1fPstajudu3yogOUAlx0+ScZiZF+G1Rv4FnUL3d8nNrFdo7k69fc4NQW1KGf/fMwLcy2AB6zSS2MSQYRGg1rUrYY83p6+mHHFVfRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2F3uF8cnXUZ/k+w9WKWhvCjJSIzUe3ncb1orqRKHaw=;
 b=SoQLvlSykVHt4lK8zHp8aLK5nPADdgFzovqYnW11OZoiyaOwEuyGvfUxaEWs1ttmPJjFiyTmsz3U0BkbgsPjZU4DLxzTr8+LEjZ7KN/PVrYSEAiQo/NGYdaFzns8Ai8RsGwrSeH4qaPUj5ZYAW98EfM+4IBEXmz4c/h5F0BQQ9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 14:39:32 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 14:39:32 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/rockchip: vop2: add support for the rgb output
 block
Date: Thu, 19 Jan 2023 15:39:10 +0100
Message-Id: <20230119143911.3793654-6-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
References: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0152.eurprd07.prod.outlook.com
 (2603:10a6:802:16::39) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB9PR08MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a760ca2-9af5-4b15-c985-08dafa2afa2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymJoOAT0If3YOtyos/ftcWA9CV5ptidQcWxX6oSRiUI672bG3d01MQjlodfeTWnQCmHMG0Zpp0Tulx9SflZ0a7uM4Vkrz6xJnfnNL6zy87IeXgPQdGdRFa0nHHBpe1H0tgF50zT+ToslxuPhb5ZWisH+O/eXJqWZbkIbBPfhz+dwhTFPp8wzUM2SApxwpk1rL/6XkLaBnVD5ua9nGGG6OhNdB7wTtfCsk+OjPHpnYW+qNMrWiFv80D/+JTr2CEPj4DmRYv+zhlYjtuXXoUgYOWmEIzYTvAIx5QBU30bhuvUIQcsEd0aJIxjfUmUXk58hTN6k/O4OZFYkE1+anVzt8TyeY1Y8hV+0o14nwuNG//OXPC9fDEkUiVwM0gWkbYu6aA9vCMxH5fKzAzJbQScFTXP1sxGRw60h1WkGEeRx1YG6lQP0g5IA8oAF63d5mJATkaZNlYavWym53HVZ6jSrBGbtqT06XMJZx8i9w9Fyko6Khcn/mfaqfG7VVi4QOrIrV57EFMssEpYiu+zIdJDIIRBt0hJewhJ7A77+M4evUS/TXhPpt5nHVfVKFDnqd+CYMikKlJdtNENaPhwnjgFVCrZz4lolKoTxzKz/6lj645AirEn7BhjnhmjfQbrf8JkAv5BR39fxs7FqC1TzHTHsKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199015)(2616005)(52116002)(36756003)(478600001)(6512007)(8936002)(186003)(6486002)(5660300002)(83380400001)(41300700001)(7416002)(38100700002)(44832011)(316002)(1076003)(66556008)(66946007)(66476007)(86362001)(8676002)(107886003)(2906002)(4326008)(54906003)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GoUxlm49HtaVXAY5j6tlkwI/1hp/4p/K5FQDNk05SivFVy2YAEl78IDNu/rB?=
 =?us-ascii?Q?IcNtEIz69az93rajJqwZxmxrW2d3EJS33aSFTOIjxhDWlYUpqkV5eQ0nMWhv?=
 =?us-ascii?Q?lqy+1F9WxGfsA7RDkfNOQC9sN0cE79MjrAN5hVI9MvibT34aOZVqaApAB2/B?=
 =?us-ascii?Q?5KqC2QOxnTNXzhh54ckg6W9AoTG+o0FO5EHBtN35SnctGKXo7A2n8WABsQyw?=
 =?us-ascii?Q?iwKAf7tasBdxJIvQKRZffKbNy+UlEPJQZPdd4cTh1K63+XEESwg8iP7Zsh4E?=
 =?us-ascii?Q?oyz3Y/RqjRDsdjJA2imJN6ZAKiKJKpKHDCoRKI5Iuq7GjN2J2Exd6k84DHO7?=
 =?us-ascii?Q?Q4X6NZtduze1LZiFZXnDti/f5hVOHDXt+3b8i8mY5ipt4A0QPYM8PxWrZscB?=
 =?us-ascii?Q?FmJ4B4l06teePkIAuuhtRWEd2jdSEot+zIRVPUgAQSGQIifdGRy4iGKNHtb/?=
 =?us-ascii?Q?dPBwB+M3lcesDMEDXmLElSL6lHInCS7kaAA86TU9abTsij6jzqN1O12vWoFo?=
 =?us-ascii?Q?VABdDmIg4wFPwrWFrIqra0j4fKclWx8Ik1c298AFvA/uelL3wl9drV2yxZZI?=
 =?us-ascii?Q?IrP5BADO6RRIb/B8VoRncN5H0gue2+tIyVe52CvOsdTYQq0+B/HAq0pVWYUE?=
 =?us-ascii?Q?bJpnCthZF0KcTj6qKi1GMn3ffLO4tg3Zddf/b7MsymD11ma4PzpPHgBMm+1R?=
 =?us-ascii?Q?dtz20OAur2/KESmn0Cq3Fm3VDyqQqwVI5o1hHc7MB19L30e1kvecew/hj0d7?=
 =?us-ascii?Q?KsgkvEm4cG6QJ38x7RvERAyi801YLAwEWZiIZt/8d+5wIT9XdwAuDSixxGDc?=
 =?us-ascii?Q?DotUR1POKt8VNloszeBooxQy8GDgke7I5/l5NyVBkbJd7/K38GGy/ERdBOOR?=
 =?us-ascii?Q?pETbf9rHgwAbiludX4rwPE1sxSgMpa9icvzTeyIAZtvtV4QmA/w3GzbOVzYJ?=
 =?us-ascii?Q?L5IokXAzyZXrmlLUwo6eRFvchmFRQ1wel56aYPHH1XpTPfXyCr34ZLWyQWVF?=
 =?us-ascii?Q?TKLg+WLhEe66J2yeY6xvDKYoz2PpWwiQ8L8bA5KqfGnOqmFK0HAUNdSeP4yq?=
 =?us-ascii?Q?OGO2FdWBOfMeM2eFn1gCnt5DxSf5xBBZEHZBHry1DLLdN55j/HUiSk+WFnDW?=
 =?us-ascii?Q?ZYm8aGBb9qJvVXUegnaKuU25c/v5DHXOXiRfL0b3iWCy8pfGYk3w/k5BqOd5?=
 =?us-ascii?Q?br7s+F3nnQrhA04ELGu2EtAxeVLMA0X6JSnU2ChywIRcVXVd0WlzdT8ka3fT?=
 =?us-ascii?Q?4TNMH2x0Jgh/tzWQ43tLqRx9Kc1Jn4JEINqg3wQWpTDiKCm/6hOdXaLaDFp9?=
 =?us-ascii?Q?9qkB5KzRy5D4KxzK12GvPDtCLFpcy0G+gosP6jd9GTru0hkSJYT7JE3LsJ1L?=
 =?us-ascii?Q?Z7Ot6L5CleGOvAUG3Jj/FFr1p1Zo8mNmI15x8zs2ce5yqx4aJYJiu1MFKl3/?=
 =?us-ascii?Q?PolpI6vbrr6XfawZfNkxEIxhCNT5CEJBEHDygIawmFU2zzkpeAUjn6HbAzSt?=
 =?us-ascii?Q?dEakWjlVhRv2h8NGTcThIacuv+zx81JqFebyRgaWqDaL9UJWJfo2jo7ONquG?=
 =?us-ascii?Q?25VPQ46aCEgsbP7OF4Rj17jvXXYSa64xqITEZ08QODRz5igZny5HZzevVBiJ?=
 =?us-ascii?Q?dGSnIpbRNmikUVZskKpe8hEeEnkT1i8KTcrupntv5YO89GS/xcvoVxVz7FVG?=
 =?us-ascii?Q?ocQtTnkmR/6fiOePIkbKhe72C6U=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a760ca2-9af5-4b15-c985-08dafa2afa2d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 14:39:32.0158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G11G/7V5RklqhxwaG0Bixy7epljYqDrP1qaRaetJZzrgY0B4yUIXwtJW8KtBe5vdA+TsNnl5CeGPRAD6SxQlYhe8qQ6rmtRH7Xyai34GFRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556
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
attached to the video port 2 of the VOP2. Add support for this output
block.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
v2:
 - move away from wrong assumption that the RGB block is always
   connected to video port 2 -> check devicetree to find RGB block

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 44 ++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 06fcdfa7b885..f30037d161ae 100644
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
+	if (ret > 0) {
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

