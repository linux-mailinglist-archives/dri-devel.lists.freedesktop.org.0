Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D0E679049
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 06:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A8810E5F2;
	Tue, 24 Jan 2023 05:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2062.outbound.protection.outlook.com [40.107.6.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E8110E5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 05:47:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oj9R+/IMgFsQkMokuOT5VWFxM2HmGiXDZP/hRb4AjEUzBh2nIMzj35szg7aYI3z1HsWrsTHjJCfbeuvktf7H/sH8UZvnWSCwTCpJ9/pxVyjzjrbMkKYijd3BFfuftOj81r2dIfKgq5yboN7Z0TZ0QWzOhhfy8w7JVzDAqtC8K1Wr+R6JjzNphDGQ2rJgUcpYagQNlXsiMAsz5TZeDTe5ugSLmuZRXsO/d64J+sG5Hi6RGRKzjSVNFU8TYw3emGotZBJZVhAxY+R78J8HdVQhqGNPsKBAHVEHdDT0ZsQ2HwY/aZct/FBbHYGuZ8aTpmJXwpEUHznS+VdbfOKta61pyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4qMVJMpLkSgyH995ws7aK1P48Io+P7fDQjJHTGRi6Q=;
 b=CDdywWMr+3adI3RsbO4w64RwF/fa9FHs2I1ObGgYcvT67cLGiKmFq2XcRafTFMGgI9zgbY1x8FW+Ru/J+Q/38bCyYUTZmyFUaASzYn/UAIC2EJZd3m6FyHzqCn8wLUAw3Y6DEW3t7Qvcn337yn0t/AlCayeE8iiVBA7gMQkcPihCFA2qZPGKKOHMgFYteeg06RzeM1DJTi8TowCUVJF7IQ3U8ku0ew4OQ0iGJj+Q5nI2/Z8nA9jGTZMGYC3Skm8pkb7UTq5DArYtyEFCXYeH+ApNw1EKM8kstidoCWGzCncBLKIhw4PmEAbNo7bLsAwZPfaHYR1fWSXewFgSECQDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4qMVJMpLkSgyH995ws7aK1P48Io+P7fDQjJHTGRi6Q=;
 b=m7TrbJ/WEfPajxPzISYIGUv8gq2d8ZPewhMnanCDTFIKnYgLqCRj50lcS5Z+b76wIOIhXzQIDOCc1CpdOJ0XjXL9Ctt/+KSKMCv+76jmkPlxnFByD4sBD+W1zNwcGZVRubM4zKdftdf816MK6YxeVnNxMWXh83b3XkNb9zffNPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by VE1PR08MB5678.eurprd08.prod.outlook.com (2603:10a6:800:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 05:47:19 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 05:47:19 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/6] drm/rockchip: rgb: embed drm_encoder into
 rockchip_encoder
Date: Tue, 24 Jan 2023 06:47:02 +0100
Message-Id: <20230124054706.3921383-3-michael.riesch@wolfvision.net>
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
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|VE1PR08MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: 249d5dcc-f139-4d4e-9e49-08dafdce751b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o5DGNMhGTMxoKtDV9IaqJv+MXGbosHjP8VMEZqkCb1UG2APAYwCWauKwQtsd/8izKnQTdOYfI35dgjw0R1/uYCAKbalXM5nqB1ZfKQinBpovGu+5NBiezhtaMVf4KhyqpD72mI2WncKF2FfX2iwBZk0OSKMyM0RSQZh4/kNjYL/BxxfTX8GjI3cfBUPCuGPBU1bEIUoGrT6zffgUWwCuFS1UjvD312lqn1FMox/r2eA0ReqPP4L6ITm682FzB6AVpJZFm6E1i9+fcYxhLRGy9SC8OlE4LiHYLbdu35HOJRlCMW7ezeUpZ/TQWhrz4K6vXbFqk4P6+9S4x8IVIIQdP58SPAjWnBgOAWs/YQxDsiwcs0BD+yaAolvpSf6kaXGsByiKUh0mws19JTNapJ9m/XxRvM4UHXB4rfVAiu5wBKdUQuvKo4T9z4akYriZjFwNVOf+X1zvLcYK65dH3zso3gl6YgL3sQrAhrM0oyye2H5HvSfgXMX+btclUtM4gT1+QYfgdE3c/uDbwWcDOHo2FTvnYYcmA87fQ8OUmekAnGbwwuvww+rqxv/tJXrHFdgXDWHBSe+6iezJdLqiwx2B8MivtMRps6xiACeheBhTMENsnCWcJMnspVb5jGSUE11uG48S+mo5BqbBrB8dZo69wA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(1076003)(66946007)(4326008)(8676002)(66476007)(6486002)(66556008)(52116002)(2616005)(6512007)(107886003)(6666004)(44832011)(186003)(5660300002)(8936002)(7416002)(41300700001)(83380400001)(2906002)(6506007)(38100700002)(54906003)(316002)(86362001)(478600001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RUACdaCjjtIgFtCuZi2LYLtWHSEiCMRH0DLytJA/AudecYtw3guGIzWiDnTy?=
 =?us-ascii?Q?bMJ0pSSJOWv1g4Wwd7keoYeVYRvYbgW/kJA1VnfddN3dCxY9uObtWcOe1YHa?=
 =?us-ascii?Q?tr8iiGBAf8Cx7WcWX58Hl5iTA8LekxZxC+RbtCnT4P5oO8GWI/5OsqaVf7E6?=
 =?us-ascii?Q?90ZA4Xb5duYFLPSDlkvh+X1WIP55CCcc9Ib0N0WKyaIEmhEt+/Fr96ecA3F6?=
 =?us-ascii?Q?+BGV6DNy6QBzipAej77L1BgdPgrLBx8RYD8TpJp3K8IW9BU2baEwzX3G3izj?=
 =?us-ascii?Q?UvxWziVmZ163Z3oh/ktq4Omt6TYsjwt+EG8Qby4VEbKjIMBKhdrENGSZ/N8D?=
 =?us-ascii?Q?Pr57jejPeEBO/P1ppPnGo6bYBWFYvfyd3vBkLNwA9ddS30qCAOqR3fryPLw8?=
 =?us-ascii?Q?5AoYm09Ny8J+ZUE/fza+T9qcAaUs3V+lJgnmAo2O5iVlWcP5Df978s7SExbZ?=
 =?us-ascii?Q?Y4kp8JLsv7t16VQRpJaCQ0MGlB1AMbA950u18cfZLXpoWVnBd29O3aCDpXi0?=
 =?us-ascii?Q?3pNZVQFhByUwUpIWiMgw/nZ0X9J+GL80Yqi8CHyRbRwk8zkrSLGk76gzVJQA?=
 =?us-ascii?Q?G4OjUURKj6M0hsSc2Adem2H9T2LhKnGlzanHjy7TbQGDLaNI8p3HBzpwx7bK?=
 =?us-ascii?Q?JdfEPnEVRD8Xlot1T5WuAvmWWcaZHo27QmPuq0DsAQNm9efvsu3U963D1jlJ?=
 =?us-ascii?Q?KwC7yb4Xtpl0PkpIQDjDaaB26BD5KwyOSRQfWF7Wm4234bpHnWjJANEv2I0r?=
 =?us-ascii?Q?ackp/mGwMVYZ39kmagJrwmPPoNk/DY4fttDwbgw9aXcfdys5LECN7Hl7Qiow?=
 =?us-ascii?Q?iZht2WM65zPXz2tuxN8mOyxY/Dqu72DZRCno9epasYRHhOmkDD1XSHa2NXNS?=
 =?us-ascii?Q?eCpHu+wzj570YBQU5kluUVmkg4AOnZIumYDwps72AS4fNqfE9r0JObekiVA4?=
 =?us-ascii?Q?FflgPwdpcXibOP3vIHkOLH2j94kA0piC38x3Q2g2dOoZdl8kyWma5ta/M9KD?=
 =?us-ascii?Q?cjJOcyR/a9tEl/m7Ih3B7gH32o4Bj8rOlq9nFZ1JBU8QVv2lhGLU7mW1QSZS?=
 =?us-ascii?Q?KuoWH42alcRBBsm3bw8tz1wAiyyWmTreaVeRTaMRCP6vlW4faBt6rEavN/bb?=
 =?us-ascii?Q?Qp2v+L4xiRoc3/qTfyhIq+M+TeBrpIWT/nBOgo7dCmqsLB6PjxYwoiZg3K/2?=
 =?us-ascii?Q?NN7BYhYppsaW/CrCxk40fhGfP40EGVydSA5ujeBUa8X5wtQCj8b7CiPj9ohe?=
 =?us-ascii?Q?+CciGq5TN70pcOpufC1LuqHSyGUxWlRayNZCmuJTTZYGumyls1YNEfVF17H7?=
 =?us-ascii?Q?YuPMxnnzLAfIc5+CIlXof/qtB5Evhuql9O7xWY5fzk5ct1tYvHX8xgmZpvci?=
 =?us-ascii?Q?odk7HeZnCZYAjqo70G0mm+M0hn1r5l3imqqPpEF+6U1g/KRAb6Z4OzQtWatU?=
 =?us-ascii?Q?fJSqEC64AGs64EM5/7wVtO+i2wZw2uzmJO7NlW4hB+5JgLJZkNy+KzjGaPka?=
 =?us-ascii?Q?nrEwWLK6RGISLAWkfWCpzYnM1dEFSe9RP9i0xOysk5ES87aVPJQoHdqI+8dO?=
 =?us-ascii?Q?yLAm69KSgDk+Kdxx+XYirYuWhDIIWm/ecYc/WSUn6DlggUz6u334vKe3H6UM?=
 =?us-ascii?Q?4kopUXoMObQ58QxosULU6rLge7p/uHndq5X00xCWqEUMFrbl46UMplXKNEBi?=
 =?us-ascii?Q?0+pELvSA3dwnBtBpeaq98CPiiZI=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 249d5dcc-f139-4d4e-9e49-08dafdce751b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:47:19.7118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BNdxMBa44CZ/QBLpgEcb/Ll5GDy4ObLg36pvsPnJa2wNsuIeic0bYMHrreSRjcaLn12hznx/StH62S25OB8nsB7rDLPdftj/Mo6rQinuX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5678
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

Commit 540b8f271e53 ("drm/rockchip: Embed drm_encoder into
rockchip_decoder") provides the means to pass the endpoint ID to the
VOP2 driver, which sets the interface MUX accordingly. However, this
step has not yet been carried out for the RGB output block. Embed the
drm_encoder structure into the rockchip_encoder structure and set the
endpoint ID correctly.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
v3:
 - no changes
v2:
 - use endpoint id from device tree instead of hardcoded value

 drivers/gpu/drm/rockchip/rockchip_rgb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 75eb7cca3d82..5971df4302f2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -22,13 +22,11 @@
 #include "rockchip_drm_vop.h"
 #include "rockchip_rgb.h"
 
-#define encoder_to_rgb(c) container_of(c, struct rockchip_rgb, encoder)
-
 struct rockchip_rgb {
 	struct device *dev;
 	struct drm_device *drm_dev;
 	struct drm_bridge *bridge;
-	struct drm_encoder encoder;
+	struct rockchip_encoder encoder;
 	struct drm_connector connector;
 	int output_mode;
 };
@@ -125,7 +123,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 		return ERR_PTR(ret);
 	}
 
-	encoder = &rgb->encoder;
+	encoder = &rgb->encoder.encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_NONE);
@@ -161,6 +159,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 		goto err_free_encoder;
 	}
 
+	rgb->encoder.crtc_endpoint_id = endpoint_id;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
 		DRM_DEV_ERROR(drm_dev->dev,
@@ -182,6 +182,6 @@ void rockchip_rgb_fini(struct rockchip_rgb *rgb)
 {
 	drm_panel_bridge_remove(rgb->bridge);
 	drm_connector_cleanup(&rgb->connector);
-	drm_encoder_cleanup(&rgb->encoder);
+	drm_encoder_cleanup(&rgb->encoder.encoder);
 }
 EXPORT_SYMBOL_GPL(rockchip_rgb_fini);
-- 
2.30.2

