Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D979274CA67
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A19110E0BD;
	Mon, 10 Jul 2023 03:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::71f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE34A10E0B6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHeuc31IdyZkHj0+1cMzAj0m7Daolm4xisMkFVk8qNiBpSGoiUzm/g6Mmajn6oD/02R7t7YcncuO07rxkxqiAwUVfaiRqdjVKdsVkZglp+WuaLR2+Ijvir+y2pjvLNJMKYxp3wjzxfMlIcWpl9Um1Shs3VCnMyxoHmaCjIvv00Ux/BISgxZIdKxfQKdhI0OW3F2UN/uqJjR5k0T8+06v2RZsb600Dcak28/6xKLteUtV9lKfRNOS9vfNh6M9idq4b5oyfpiUIgluE3cmZKM0zMI8GPAd2twgZWBnLx32HaruzmM7PZgc1lFkeA8w6lgYEl4+J/vUb/vgIzHN8/RiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+zqlnB9VISi9AH5ikBu8sH4SK22b45CMMph0c8wbYE=;
 b=MOK05WKn6jwPsOqFYJcAui5D1I20TlG8NTyye0PFNltDyvvAw+7B8Mws02kmjePTwPQSVsG0yAkQ8g08UG6ER2nVu3aPwE+g7XFn/eq5Pma/YkeIvpdRLQSVgbLvvwFn58WaAcUdRjIOfiYwwzIV1zuP2eG9pCdmNlJDtAzez6fynMAKygQDWn2RkhaKLTsXZSBfQXaludH9yY4AgQY9ZNR0tYeZqlURCzPhiHhD4upSxLHfs5h/caOHM1MRhqDWdU+eXOvWW3mz8sqDI221Z0gWVPZwJrx130zX5diN1U9rioOKakb6uHl9Fp/B2zZU6zE0qLUCi3GNOKHb/ZltSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+zqlnB9VISi9AH5ikBu8sH4SK22b45CMMph0c8wbYE=;
 b=VZkcqzYX/WMbdjbDoE9wWLYrWaWfSL/lD7LdSCUdRLBReX016Lu5ZSvJno0AMOAY9Qu58/kmdhL8ovZPRqcLPVCK0dehrYixpDDlb1FoBXsUgZUzxZsT8dcN52NtztvxUkx7iLc3lALDkOzwQ2k2IkYpCexCAV+S7kbq8JI/Uxg+wHLuh1CX9sx+utLk44bJi1i5E6AlO990xbkdHxNwR0qaNj3eNzBeRD5AGV+vXvHIsGt70beir4Q3Ou8JORlJhctTwL/Uu/+Sphs13XnSjbDcyqAdVs/WJtkAFlsENBYzzGBxFuoEJ6i/soxh3SJOhfod6JmHRKGuasC5ADkefw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 03:24:17 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:17 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 04/19] drm: kirin: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:40 +0800
Message-Id: <20230710032355.72914-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 587eaa09-7ae4-4a58-7308-08db80f52477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Z25cArspUJvwasUlIjK93obRKedyqNODHZ7TouTnUTiksbvERrzZTr0oASsVu4oovpG0KPwVX5cRo5leFgZZ527nOYcapGDpj6pEUWPmX4vKt9eOUM/cn4YtUC5ul/WhvTUd+wpRoaswYCLmc1EwcUMgqZc/rg/uXgJ+SDUmgJE/yWIhB88dYyY5Wtw7jfwokJkgGnXQok2BfWI9BU3+KBBhEj0sSh935Vf7Mn9MzQcJexYm0tLw5r6XLMf9XGBECk2DREPOsRMc4q8sPbRxWPxGGXGHj8w0tBR6fL76sElKISpT+LBl0cnstk+6VO/pZCzx1vcSQGuBPa4RQqxqwFOs5VIaMqb1R3YwjSM35GVz1AB4vI+JutJVI5FfBdIHhjnI/1bGZ1yH/gQQEpUO230TFbGdXYI78E1/vHuEKmZsFITKJgJlVG/j1Lrnc525DAIGZr/0/Achp2WqHKqPn0YpSXJfwcnqbaPaaLL8cwKDexdsMJjM5V5j9Vy0vTS95/ruL074mh5LgZt20v3U5HVqs2J3s7xgltwEAeafZ2CftclhlxwwFDW1XF9Ru/k5oP/pysvBlaeGwOZ+IZxYE+DyyYOMHIfzu63X8oBBDJVrFA12LxRDNkW3QZoM5Cc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(6506007)(1076003)(5660300002)(26005)(478600001)(6512007)(2906002)(110136005)(186003)(83380400001)(2616005)(7416002)(41300700001)(86362001)(316002)(38100700002)(8676002)(38350700002)(8936002)(52116002)(6666004)(36756003)(66946007)(66476007)(4326008)(6486002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EnGKCsB5md+YlB+ROyOrrLwG6pQtIFtHelx6f1AnmCwbRuFrMF5Nhh1d+dcw?=
 =?us-ascii?Q?yL662/gcrUWhVcXdf3Kj0bOmHMt8QmMezB44cRRSU62+liV2KdAat5eYynVs?=
 =?us-ascii?Q?3wlNWKAQlKpz0yF5a7IvtD9shRz7/vvuxyghC2d+bitrscwz36PHVnnyecu6?=
 =?us-ascii?Q?ZUkLZWVFRjt7Eyivw6a2f+0XSEEPp9wPZmVcFztVjpYevbntRMv4X+phW8LU?=
 =?us-ascii?Q?ZYe+SKWqv0sLLLUfxsimaeISiXUZN+fduVDdHCwxYLbJGDB70RgMT7n5HH+Q?=
 =?us-ascii?Q?a7sUM6Y3fdJdrVtR5YgsNSsD/8hVxHOeRiyAGtKcA4Pwq1pUvFA9l7HkpEkd?=
 =?us-ascii?Q?avIrGwrP3GqrU0NH7LlXC42aQtJevj1ohzHj68fp82bglNUJ1a75ea2bn4dc?=
 =?us-ascii?Q?G9r88GREFRYaPe+Ywa8KwcFGdMtZOSGCA1EqYSRhJJ7DtvgZDve9+YjjpRuX?=
 =?us-ascii?Q?EW2nc8RLElsraBwnG20Ri2OxCDEbxRLi6MMg5p7K5TbbW4foXxmOoNn356k0?=
 =?us-ascii?Q?aVagkrkeKfesDKXg0Vv9pQIMMwRpftaTZ5PjW3z/9314swYddcacsRAj05FL?=
 =?us-ascii?Q?nQen7uTqnax0pbp2sHYnFnjhotLwjk7QD/nhqdyuz6eMFzNC2RVvU/QmKbX/?=
 =?us-ascii?Q?4iQafYzrFaPh8BeW6Yd0sCiO6vqHdCHDlTCy1wvXaXMgUBXfP3RXcMTjooXp?=
 =?us-ascii?Q?vy2s0lCvZoDAn5yuG4m/tPUmsTWjir7ejlCNT2rQnnG5jl3i0Z3K+egYNppp?=
 =?us-ascii?Q?7YmPC3coecP4IhusBQIYg5ed2of3o2RO2joKOPgJ85XFJ1F5EaS4j3tmmKRS?=
 =?us-ascii?Q?ghQPoPkagkIPpGOj6NTzImutw7VJuUFnJ6D5W7zjqEAqLELAU2N7Ptv+DL7q?=
 =?us-ascii?Q?e9/cRGgD9/Qb0fH1MclfM1c/zLJ2Dj8muIrooG5wExT5K9wk5hZ6E4D4nniB?=
 =?us-ascii?Q?B2W92yjv7kXjyJPwnEftCmIjf2JJA+UMZFpTY0b6toVcSgTbQpOgME30tquY?=
 =?us-ascii?Q?rcz5vVsVZyIKs6GQUL3XUhqIFCGFBHMChrj24sUaBk0LKHrTyhXKIQZuhbSB?=
 =?us-ascii?Q?002eg6rscOWPlU+UuKLTsvWrjrw6nX+yklcCLR96VLoiUsOZJWF9cvyRpvjZ?=
 =?us-ascii?Q?6p7dKPAHADPRgSOz+FZ+3mWo+brjxGJP/It2yPDjTFgCHHOgtbRKzYpfPs7g?=
 =?us-ascii?Q?J3onJuE75MKcKjjrJ/QgLH2LA1StlUbw2tXIZQLZAhAgoMo5jkc590RrYhIY?=
 =?us-ascii?Q?f1SxbQlrokX3do/iv6F5W1D56nP0XGyeusf+Y7ylY+dymx4Lf04Q6QC7QyCB?=
 =?us-ascii?Q?NcFoWpQDm8A0UN2KVDZJzUUP914ydidL+gf6CXnGZDWyYeAZzYM4OZP7dqEv?=
 =?us-ascii?Q?spYcG5UE7dXH2fIQ392pyIA6Y0Uui5whudNU5vvDs9l9hAFQekjySVrGcV9J?=
 =?us-ascii?Q?nHtjIEol3Q/OSeVaTgWrfHQAeWmC04bXoSnolcQ49Pb6jSXLgun1FS2ke0b0?=
 =?us-ascii?Q?w3YOw4qqTxaF+XvSa5VUGmNDHwb5BCi7vs4nW31ZVfCWq4p3xh7NmrPUmJsM?=
 =?us-ascii?Q?WR5Ht6R/JBtU1RKAYzFw/DsbZzfoYPHkNukFLQPl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587eaa09-7ae4-4a58-7308-08db80f52477
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:17.2221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzz6wY631o5BMCVAOOpK+kRSwoNTbSSLYJA6IYGZgcDopP1Gl1Trr7Hbw4xZ6uLY3Vy2EpTUmjy8GlWq2YXhtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 871f79a6b17e..42ae68c70880 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -843,7 +843,6 @@ static struct drm_plane_funcs ade_plane_funcs = {
 static void *ade_hw_ctx_alloc(struct platform_device *pdev,
 			      struct drm_crtc *crtc)
 {
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	struct ade_hw_ctx *ctx = NULL;
@@ -855,8 +854,7 @@ static void *ade_hw_ctx_alloc(struct platform_device *pdev,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ctx->base = devm_ioremap_resource(dev, res);
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->base)) {
 		DRM_ERROR("failed to remap ade io base\n");
 		return ERR_PTR(-EIO);
-- 
2.39.0

