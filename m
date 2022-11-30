Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4606663D77B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:04:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8377F10E469;
	Wed, 30 Nov 2022 14:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C018B10E452
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:02:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jS8jg+zLXxobDQWaHlmmT8rEh10h98sZlYGGXV1iwbRE3QmGyl/xXiexSx/xmXRG80NCHCajIjmqasi3mruhG4zNi7bJWYgegryGbzH1ZFZwK1Nl+IN16uwvG0aF5kXoTuYQpRWH4tJSjsz6T6igvADDUYQJ708HD8swNWkGExcXl4wKhM4z9Hp9oubyliboVlaBnkZValWxfCabcoWQzRDST+8SwrhiOzXSwywqKkhnG1pscuzByN9+4mqe7gvOKnr/sbkXztte68vsJ0z64CVtPyqi4GcJWiKcNzhuuxVLEnxlCOxXSYuwg4q6+53INihj6lUwimoqCu7u2QK9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvAX1QJVSflQgcZ/wCQoBsMk5roSxs2Q7ZiVEVqQIXQ=;
 b=M4NB5doR/CzcMVuMKJ7dtrS6gODcIcRJjeaLPQ7MAUYgsrfxs2phasUiKQk/JWqnrzbcHsqWkTzBoJO4N/UTIlFwPaR6fsbZtWaPtwZogficV3PNl1ja37vK4iJLbolG5Ss31PSlY2JkyolmzFRvWAENPy/t/7+Cdyy+cCsDPnUdUbuXk+djws9QYPZv/7ZZs/WXo0S2L+k01aw0Ic30RG8zZ/opOTt6ctpXcEJjDPN4kp9Av/MR87j1jSUKk2OdRVOdQEG4pcxmym+ZetD7mIhRcMFyUXlIuK4zDHWpf1HG+CU1kuAxzZm3P5KDnVYx2Ssn5HPf8FpcvUHz0X7NGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvAX1QJVSflQgcZ/wCQoBsMk5roSxs2Q7ZiVEVqQIXQ=;
 b=gfbv4OWmmzPxUbQzzSYP7ILSUXFIAqLl5Z16P+BJpJesscvvUgnFzgc+23K5iRUYnLdIkGbx5MCufDLVgw/3h4ishjCFjTP3Kh352NyG2lj28r09dejn2Zci0+lKtgASK+6PnPUEaRsXIIre11MWnfHZjEzg330kk0i7blDCaaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8695.eurprd08.prod.outlook.com (2603:10a6:20b:55e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 14:02:48 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637%2]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 14:02:48 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/rockchip: rgb: embed drm_encoder into rockchip_encoder
Date: Wed, 30 Nov 2022 15:02:13 +0100
Message-Id: <20221130140217.3196414-2-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
References: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0182.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::15) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: a12d57df-ae31-4496-80f9-08dad2db9038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dTYQLkoGNWsuXYVKvjC4U3rXrXQNtEgheccXAFCD2Ahcz0uuEeHKLIqazaWRMVJPqg93OuOfyy9NpE3zoRtjX61dlWfvXInkZK9oezh5xo+iyLqzcZ93r32imP7C1VO2gt9Ov7Eco08GBjMQqJ3ml6i52JTzJduYjZjyMI1yl1oXsys7RRI4oKzuC6gCThqpQbSg84qnDiXV9eCVLnQBGBkQhy8x6F+kW5UNadFhSqKX2MO66DvJ+MeHFFIQoZsj9iqEV6g4xZQdZY9p/1MYk7EmqE4I/FmqSTmAom7qFepaJ1b+v9UtqP0NPg5cAVw05277x2fYdMt0u8wUHluvy2IN1+UjB7ch7WdlgLfhP7urTaPOWztqp1wMM/4J+qaninr/5mX+DYzU5gvBzxMqycHDrSmqimFejVxJ9F6SwJ0LWWD//vDWQWWt7bUKvwAfPwauW+RElNNMZzFcxxND3fM/gGarGZC2m7+2RgYnCLgFZxGY5+BNhG87UiiCMsKHnUSV7thaqO9vMvDrGEk1Z85zzJUSiawSStwT8+RmzpDGcouBvufQUDlkM3bFg3YdoT97DPQuRNCO1obxb1EmOoi60s8ChVzMTb+gynNeduk5dEuoMOxHQC163Tm40GSetMgUhBRIqPUxn7H2NlCHLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(451199015)(38100700002)(6486002)(54906003)(478600001)(316002)(8936002)(2906002)(41300700001)(83380400001)(1076003)(2616005)(86362001)(6512007)(107886003)(6666004)(36756003)(52116002)(6506007)(66556008)(7416002)(186003)(8676002)(66476007)(44832011)(5660300002)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?okgjNGzrFci6tTsfkdq+BxsFxoFFJ8pecUPjrWdr8DIDEyiulzd/cgLPxa3G?=
 =?us-ascii?Q?ws8s9mBwz8N6V8uazV/dXafoWgNIki5tFXa771nl5Bs+7rqiwp+kpQlTZvxH?=
 =?us-ascii?Q?I9JY4venNQlfC5caiv5Ev60WdkE3MYTcuVu3Lvop6f2ks349Uo8+Jg0NulC2?=
 =?us-ascii?Q?30TyZO4vwDOl/pySjCRH+ZAJ2dPOF38/rnnzxpGlnq34jKXhl05WdGgaqRpq?=
 =?us-ascii?Q?d9ZZtVyvpIKeJ3E8eaU7OezJVhrEDGTZcaAhvqyzbmcifu4L0l0Tg5Og1f/7?=
 =?us-ascii?Q?ml2o/KIz9asYVYdkB6yRL6A7gSHHtpD34efVTt5qZ3r4OAsYMo5XNDqgVAg0?=
 =?us-ascii?Q?HOUe4AVizEoH4y1F9su25qPIt4+uulpOgVWLlpGUiZ9FBZBrUBxoDwlKE1fo?=
 =?us-ascii?Q?AfOmu8MS6x+ZRawVp+tQdQZAyQRFZ6raKgKmwzC437e+Bh3bg7sz2cc+gi9H?=
 =?us-ascii?Q?e8PP6thEdC/xxnKpHFebZHhb9mYNcSGPtmV8vc3yKSpkonkUagAPajGcOUtX?=
 =?us-ascii?Q?qGsTexU8yMDcQRNccoJ3mlEMu+tV6H2GuAQdz0NSiykYDgh7O7YwwbDOeL9c?=
 =?us-ascii?Q?YWjvbkiQkM5EaY8l/glKFIrR1xJ0O3kEc7NH4Mme3yCnJ/w85wrRVH+8+Xdq?=
 =?us-ascii?Q?cUuuESoHmbQH0CGjUUZnfC990ZIrOKIMV+uCbjpux0cWmItIb7tOIgvJnhwg?=
 =?us-ascii?Q?Gc++u4HW5/CkeS9y9/ntgWY9JxzSjcGST1FcIe0hhvEosyb59jwKcvBauluJ?=
 =?us-ascii?Q?3MP4LHZnrxUrfkoppIrw5wb83TS+KaO86q4tyjXBfdnEKJ/ktotQdHe9XOh9?=
 =?us-ascii?Q?r6zfyR2hCY31rbiCpUwt8IbtuqrIHSYsU92hmuBtGruxOe6sI99TvXqP/d1i?=
 =?us-ascii?Q?iL6qR921rqON0czUprMbDT/AP/uhfCUPDHnpEyvDUX2aEfK1u61/8JcCULFh?=
 =?us-ascii?Q?EUvwlxFh/IU+IK/8uVvGz0YuFRwP5EpyxbGaiEnmhj5tNCovNi0g+UHPeUsm?=
 =?us-ascii?Q?jlCRJUCWQDYiDmIHM6HjdPOEbPNrw1tMnPVY5YdOZR85IYAyb3IC+OCXLROJ?=
 =?us-ascii?Q?oT75Gr6MZvpeuICrVdQAcg9fqoIBWOF7i6+7+fpEkLAcn5tcqAaRNTvMFCGc?=
 =?us-ascii?Q?02ZJx9FrJT/rq7ozdwIeX6Az5hCrSu2DwZ6MhOJ6x6WXxi5kMgP8b1MGXkQ3?=
 =?us-ascii?Q?o6dxLeh8KURQQsFg1/xFgtyKB0q9F0x8eYRKP/CbGm5LjActcRtjeLZVv/Qm?=
 =?us-ascii?Q?K6jwoToCa+KVNmQXKJrO6Rg/U4RA5LRBK9BJff0fBIfXC9TmQYATP+r/TWiW?=
 =?us-ascii?Q?/DJKtrIMkmlqa9FrZVFLBZ2awIiedoSiy0prI4YbxtrmQt6tifRKKJLrigyR?=
 =?us-ascii?Q?boCo7Q+rMy4mQM0sYpvNGOlcPSxFr9Yvoz1ajpbsCgurVgcyv1PMOAD4NMor?=
 =?us-ascii?Q?idF/KH/Wn5+mtM/RDaGe0hvf3Ibl20F4/Ns2wpQLR2l32DVNHnX6Pi0Hm7sh?=
 =?us-ascii?Q?W4KT43q0dtCQBtlYzcr4T5FMjCZKQxbQKLm1u5s+0bqI9yGqiOd36hLz+dWB?=
 =?us-ascii?Q?AkZLpUJcMUbptzY6jzJZVaAfWcVQpEm/ijFSxdt3Gm7sFsVkVRpUiWYI7nTU?=
 =?us-ascii?Q?fJgsrfscFr6fAmV3YWRPQp0k3VLqfPAtqvL5u5BzbFlkL5ShlnwqumP0aCHf?=
 =?us-ascii?Q?Xj5XAw=3D=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a12d57df-ae31-4496-80f9-08dad2db9038
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 14:02:48.6420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MBENIbxzS3BmUz1SNf0XzDzbFpZpQg/6v6i1LSfEkgZvL1aybliDfzLCtfrzildvsou0P+UvHvibU6tNKyVFsF14doZ42RGrMsrl/hY8Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8695
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
 drivers/gpu/drm/rockchip/rockchip_rgb.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 75eb7cca3d82..16201a5cf1e8 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -18,17 +18,17 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#include <dt-bindings/soc/rockchip,vop2.h>
+
 #include "rockchip_drm_drv.h"
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
@@ -125,7 +125,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 		return ERR_PTR(ret);
 	}
 
-	encoder = &rgb->encoder;
+	encoder = &rgb->encoder.encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_NONE);
@@ -161,6 +161,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 		goto err_free_encoder;
 	}
 
+	rgb->encoder.crtc_endpoint_id = ROCKCHIP_VOP2_EP_RGB0;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
 		DRM_DEV_ERROR(drm_dev->dev,
@@ -182,6 +184,6 @@ void rockchip_rgb_fini(struct rockchip_rgb *rgb)
 {
 	drm_panel_bridge_remove(rgb->bridge);
 	drm_connector_cleanup(&rgb->connector);
-	drm_encoder_cleanup(&rgb->encoder);
+	drm_encoder_cleanup(&rgb->encoder.encoder);
 }
 EXPORT_SYMBOL_GPL(rockchip_rgb_fini);
-- 
2.30.2

