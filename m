Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B01679047
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 06:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E4A10E5F3;
	Tue, 24 Jan 2023 05:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2062.outbound.protection.outlook.com [40.107.6.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E725A10E5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 05:47:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4Wodc8odM6+YtvbfO5w/jXx94+BfapnVJLoMqwD493abneEKgw0UZOQyoRdi+19pVpvVxKnZyUtJd62h4C4f9L7TP9zsILz2ImwdvQIKbv33lN4cQft/S8tbUr7zxlDo5iFt9XSjysfr+wlKyCDUCqA6Us8FwQqwgufbkXQainoM7/OJo/9/Kit9ufqaarLrD5ffLZ6v1C28JUJrkKz51kEE6VoCPVSaUsY13Ah26Lr41qBBF4/Vti8CyXAE6VQeKvQNxAv7+JiEf5p5/MmaRCbsqI9GOvTZYTh67QQY7oCpHXtjnKKTm903nRz5g8XpwN9priMs1Co3fwRUxhcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGIuKWsYCciICpr9vBMDMPjsBMY2adEd1zx1srWGQmE=;
 b=FFQ3xeWw3Dt16DuWD4vRLuFyPuvyj6koRMRXzPKK8EhP9jv+xoxEu8FmX/2K47iIryUiDbOi9J83GoR+9JgY7ZgTVVrNbni93sgVA6/kW5UnhMJtMH72T+1B1Qu+7Yf9EUeXW/thYUDcjaNLZjET2PjgUEcZfiLNpu4yS2uSMvpAiSj8ESSva0ne0TFy3qy5gCCn6TxaOw4YoPJnsKunkUeY2/Z0ToI+O7v097jVzWC3W8EoV6G934wrQ90zMPVCSN7cGsvOB+LFSX4lvuyqMQw5UWLfYObeCtjEYnusnmxjerzOGOl9y1vcS/14LPp6aoaFkHRHCXCTLAw7n7MENQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGIuKWsYCciICpr9vBMDMPjsBMY2adEd1zx1srWGQmE=;
 b=fJpLusx7Tz3nJyovUNSaAz1UEA6qSVyX+dzJoZAZJBOY3VDE4hmr6Sie3Ozei+TbJC80Ya7MdnLP5AAstbL4vMx6F9whPP7buaPUYQRPpBsA4VcrI0y4IcXuxp52LgOhmAguExXc5jO/ZBKtNZ1/8wQh3sFzu72x2I0TfZ/wZQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by VE1PR08MB5678.eurprd08.prod.outlook.com (2603:10a6:800:1a0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 05:47:18 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 05:47:18 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/6] drm/rockchip: vop2: initialize possible_crtcs properly
Date: Tue, 24 Jan 2023 06:47:01 +0100
Message-Id: <20230124054706.3921383-2-michael.riesch@wolfvision.net>
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
X-MS-Office365-Filtering-Correlation-Id: ece9baeb-56dc-4430-aeb9-08dafdce7445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9624BrPEwu8tZkM26kX0a66E2eCWUFhOTQUeKWDLkOQmP5LNu/uvCGdRtb2UaK1GwxnrRFAjU1J3pdwBn20InfdevCnRDYLXO3iaGPUesgW5Eq9pnCt0HJiGLmvFRmAl45bp4LUVcuslc/BO4TXQJP3DKsgveQdqe3rVVTYyAduKW2WyyiqxS2cKiD0m5YvAvlawFqNTmO6UbIeQlETzNfd6tZwV7XvcrGsnyzDpkeTPG2t7v7nK6yIrzhMWCH+k1+Y4o738Q3LWCG80VEc1OA/2Kyz6QYwLgThNqNDIQ34w7nbFSoTknelTN/zNItfXclj8I7da5qDTTAjYceMDng8EP85iaKRAz7nizY11Us1d4OoekwKHMS47maOohW/zGpp2zTu2UWw4BjXV9oM969wV01J72Ox7ObYTaOBeG/Dni7hWX6LHYxfAfx/eAu8eMgW/JABqTasUMdDoHd47uUNArQwQiMftCUdgNNP/LTEB+75pqS2uCnMVcoBh6hlQzYdFlQl5GVuBRJQHAVJ+MJjN9T5/LdwLKo3ZWJZuPLXfc/UDI7gQnrKzWCG7BG59q5SANtUYKpQt3aH3HIP2hRKGDEG9G/YIj6Vnw9/eB4pa9reTvnyFj/1vNj0g4eQQSiEw6Ed0pc4DUUV8z68wyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39840400004)(396003)(376002)(136003)(346002)(451199015)(1076003)(66946007)(4326008)(8676002)(66476007)(6486002)(66556008)(52116002)(2616005)(6512007)(6666004)(44832011)(186003)(5660300002)(8936002)(7416002)(41300700001)(83380400001)(2906002)(6506007)(38100700002)(54906003)(316002)(86362001)(478600001)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?acjmyvzDTN3cYJ3RgLbKGteX4jki4nQkRf4YyawX1ZjZ1JVM/QouPVorv3rE?=
 =?us-ascii?Q?de2Nl92HNAQOquJg+7E3VgUaV90af4aPMt2r55geSvNce3/H7Pn4VMr/eP9v?=
 =?us-ascii?Q?AVsNjRukeN0JkBgVllf3HpE5OkPdeHLY98SxOLmF/lnPVhPBmwmaf+WPNTPy?=
 =?us-ascii?Q?DbFI3LahAEichaMfVLRYadSn5VxfqWO/t0XHIXdllcEfQOseZaHh+4TFIEHS?=
 =?us-ascii?Q?WZhZMjt8wzwZvCYaVVmqCxkp53v8SWY+2KPowBQKR/UtNpSGYJfuQFqNnEC+?=
 =?us-ascii?Q?GdH6bBa80A4tSdvCfrNqJ22VU1DcnxcifaNmh6K0W94qYolPkGQsFgkLZIBb?=
 =?us-ascii?Q?1pMb4JKk4b8cW9PrzXEndrGoULA1VeZN9ZkFtR6RYqfqWmCTkKL8ArmJSbxB?=
 =?us-ascii?Q?N0r0NEzZMSqusrY1NjY6lcbzNpTH1OiQvXMT5RY8pWPu5lJKNuqGtwL1lOZA?=
 =?us-ascii?Q?IyUHqykNUyPKqBvfpJC8Iwu1gXm7g+f26jFfSqIa2zCgvxvi4V3gbyoCKLd0?=
 =?us-ascii?Q?ZA8JSGfiJNqV9uog7KFm+ZJF9CqZ5VI2pCy/lfB9rDO9ixb0sM9wIaLGbwFc?=
 =?us-ascii?Q?LpZ2EolXjgq0uM66FDRhfi6jWjpuS0GQFQmhaOdW1a9eCiHc6ZtX0ZX1JkWo?=
 =?us-ascii?Q?GY9R6Xlj+dUPvGXBQuK2rDQEL3APjyvNYKJbigApMoQNPpvFXdEkDXESGgOG?=
 =?us-ascii?Q?6heCepwfO51UvFwrBwtXIVLDDQ8AMiwqJplsV0kcdxR3clCD4YvkoT41Tk1O?=
 =?us-ascii?Q?Yvq19yEjTIVy5s6/u+mbbDYHKFD1ThAdK7KwliYS+7kEAWtb1EhWexKSyBwF?=
 =?us-ascii?Q?bkJKDsYKgFY3pq+koYmtLYAV5IvIH5vuJ0RmlWvs65C/f231HQA8+dNNV2Hk?=
 =?us-ascii?Q?uQM0O61gnS6KF/HuWI7HlNWm09OGIdbvNMo2sx1FF478BoYC6yhfL2UaIy6H?=
 =?us-ascii?Q?f70U9MP3jsZ7kh9b3FMkQLofP35pQJPWviwTtOjicqcpLwWz/MksO5IbLQ4g?=
 =?us-ascii?Q?BJVO5c97DdGfE85mOPvagCHiJc0ozrZY1rYUHXNiKIWajSPOIakZQPO5ycr2?=
 =?us-ascii?Q?WDfknznxh30fhd9/glaQ7fzXAO2IIgSaDwBsmejfuuyDJEG86fzE4zqtSiWh?=
 =?us-ascii?Q?ziiAov91lgKrtkOilDsT7WGc2cdjio/uKfFcebFePGPHEu/dtIVXMpAdS7Sj?=
 =?us-ascii?Q?rd0OBH5GFLUUOpt7KCf3oTZ5KrqrieBYpaVEJkr50VbyOlytR0Zp7nkBhhji?=
 =?us-ascii?Q?AFafaAFETxyzS+pprFYKxcV+gsvN1xZVxVLX0GshQJuILRKHM7ZfayZ3QkPC?=
 =?us-ascii?Q?6Y5h4W/KlsAJbPNiym35/lx9WYWTp49T8dKNxqZwCdbhBvAK4teGMhRW75tq?=
 =?us-ascii?Q?hp0XgtE0j2WbC+akHEcE4LarvnaDyAG/QHga90jSmzTfmul1pca03hBTGC7b?=
 =?us-ascii?Q?gh1XhauFM93aw8+OWvPuAF1U7Y1svsgALiZaAIeqKkMJJknpsTd97pmq/478?=
 =?us-ascii?Q?K6bL1H6N9b3KuoKRqWlOllw5fcj6Fzmn/3RK1aO7GNOO1WvjnNxkyzyPPHP5?=
 =?us-ascii?Q?ilvzWVeWN7ELJ1v5ll27KutLX0qYZg59i6aPMKzAEkENH4Di/tSkEgUyF/jt?=
 =?us-ascii?Q?ZOMpmn1au4Y+pTTFM2Hqicn6nR4v3NYdCaNaL7kRFP6B6kA5TJ0NX7qA65gs?=
 =?us-ascii?Q?mChp7kWpGGFTh3MiYldh4sSjaZg=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ece9baeb-56dc-4430-aeb9-08dafdce7445
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 05:47:18.3879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxsKFkoADZBILnwX0zHPUt9Wn9VE9tr83pbkSTrKEn0YEHdODlQnMFtbi0lYUqtfpKLtsiAFfOEcF+jbAF9fWj8rtVk5rR8II+ZIOF3G+XI=
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
Cc: Dan Carpenter <error27@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable possible_crtcs is only initialized for primary and
overlay planes. Since the VOP2 driver only supports these plane
types at the moment, the current code is safe. However, in order
to provide a future-proof solution, fix the initialization of
the variable.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
v3:
 - no changes
v2:
 - new patch

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 8cecf81a5ae0..374ef821b453 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2322,10 +2322,11 @@ static int vop2_create_crtc(struct vop2 *vop2)
 				/* change the unused primary window to overlay window */
 				win->type = DRM_PLANE_TYPE_OVERLAY;
 			}
-		}
-
-		if (win->type == DRM_PLANE_TYPE_OVERLAY)
+		} else if (win->type == DRM_PLANE_TYPE_OVERLAY) {
 			possible_crtcs = (1 << nvps) - 1;
+		} else {
+			possible_crtcs = 0;
+		}
 
 		ret = vop2_plane_init(vop2, win, possible_crtcs);
 		if (ret) {
-- 
2.30.2

