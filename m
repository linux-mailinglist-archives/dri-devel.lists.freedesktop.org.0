Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483BF21A51A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 18:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA736EAB3;
	Thu,  9 Jul 2020 16:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60080.outbound.protection.outlook.com [40.107.6.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8DA36E434
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 16:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7B5bpEUvBCzkQ1ecZIeuiV9PfmzjvbvPWikkEglLghkH1kv6mqGUVnsym86twcSBT0qRnZkxnfyN6BIkPtseM9JxCQmY/U7LWQv+CBSzX01fL/7yRWPlY70aICXFaNr6Wxov3bAdpgAOwA+PskQVIY5P3xGfy7iRg8/TEdu1GO38QrBKZQ2sNQEMBL/m1bBLfgt2zBRsfV2kRnPgtYhSJUtj6WwWgX0EGXceEmva8TJuzlUh6pcuRBRTMOZAXuBev5WC/Gz0MDXMS1HNvnUutzMPsv9Ad2Yl/oo2nSiTaFGScRKh5W8v0S8nsGdn2FHiyXMiDVU1GnRbh+lPUApJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jF8FIdAmwEfYOpEugak7h/pvf4lhtiSIVui6NzJMoXg=;
 b=nodKKy3RdESTt7/thAv8NYDRf+9kINxAXh0VSaKv7OBSAvx/4cPlxdMKBjnNn3VHfzJYU7Od6tJD8q7zBevWaJeAzgyIQ4mGqIebmFyxBPGuEOKCZUTpUuvjJDU8VqFYgNk6LBNaOyAT7U7qZiYuYDwsOHrdsWclK47x8mhvYE0wC8RMZgNMF2Y5oQjAyBJMOrKkS68lYjA4+phqGVyQlnyKeBFefmT6hpnRGygD3fyvBQGlRZAxiswqj/5pY0ntQGuQHtFN7vg8bPdZ7zBz4EsphHHVE6GXQhwhwMXQq7VcK4FPfTh32qorAHlv50sXXsBORlqHBjrfD4AK4AT/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jF8FIdAmwEfYOpEugak7h/pvf4lhtiSIVui6NzJMoXg=;
 b=bj8/7NJMS/kNHiH0utzgzD/bVaTWqvWMac2brjXj8nVqdLpH1PPZoXxxdP5Bu/jCOg6yQMglwHdcdLFBGDPD2DKmCnYJ6mUt/pHVxvwLNGvtzKi1XwRYpg6nrQhZz401k6AEZPhEqnjDswvqzqYa4q418OKr9WIgXJDckerm+/A=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6239.eurprd04.prod.outlook.com
 (2603:10a6:803:fd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 16:47:50 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3153.029; Thu, 9 Jul 2020
 16:47:50 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 1/5] drm/imx: compile imx directory by default
Date: Thu,  9 Jul 2020 19:47:29 +0300
Message-Id: <20200709164736.18291-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
References: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18)
 To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 16:47:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad8ac060-6590-431c-2e7f-08d82427d0e0
X-MS-TrafficTypeDiagnostic: VI1PR04MB6239:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB62394152A2813807E15A7060BE640@VI1PR04MB6239.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EUsw/5tc/l1WE8u7YKJG8xk7PdWTiIPyq33/D5v3ROaTcf7ghisb273PHBP2v0A/9uCosMy83QlQNr/ljBbcp4EE4/vsCla4KBtvbr+knKAQLZhY+jIawzNmxXEpK7N+egmIHNSDjExdNsdk9zLf/4xSfYzQDWdQMFv216my/c8vefPxYwzTkFKZz0pNsLfV2lUIhwMMdGPrHXmVUYQlbjLYWJ7/UBXd9BRI8J2QDUGs5tCM4bbR1UZg6wWtvytDQOg6mziE/46FQYJK+100J6naFBTnb+g5GkWjy12FPTSqNzn3W5Vee8SuIE2YKZe0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(8936002)(66556008)(66476007)(186003)(16526019)(6666004)(52116002)(4744005)(1076003)(86362001)(6486002)(6506007)(66946007)(4326008)(5660300002)(2616005)(26005)(956004)(7416002)(2906002)(83380400001)(110136005)(478600001)(316002)(44832011)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: CrPxaBf3isJS2BWEIQ+PE8ESTeZC5i+/r9q4/QJM+6DffAYbV75ihTnIOZbLOLwI3VEMoGxmoogXThIkJa53Li0IFGGQAfTTX16Z6v8d84sX+KfioiOIbN2srQlSQiz+y76smqGB1GqIAjs/M65bI884k2JGDIasfQ/KPoz1Qj9G8Cq5lMYADpD207be2otc+PZN1IlW6A6s671bnHYO8KKw3DawO/sZ4z2xe2G3psZG1S/HNuAI2UeKnQ8vn1fqxu+JMIJEhk2IpoxRcaOZnJECx7qeN2Gy7Rsl4BT1kqErNrKin0Z3bWqVbfTALQ/ykamgMcpd0TlerpnYC4lnqockVxtOt6t3t+vhZl2ZeYlCgRP1xWUcFIk30+0oK4iq9XIuhjIv8ZRpzIjPWYMo35HYwvTJgy05kbzGCC/NwU6t8Kg+5+mwxdigskyzo6eYoq+w4j+YhfqBJMJB8z7f5HFDCvKpgWLBirSrQv09DyI=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8ac060-6590-431c-2e7f-08d82427d0e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 16:47:50.1681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+vaH9z0cbZn8SPxH0Dp9g4blfiNoh79eXRwBuknuqE+2D7jSLnoz7cpQ97T28nRuCp2yZYHjmk5vD38QJZc1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6239
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
Cc: agx@sigxcpu.org, lukas@mntmn.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com,
 laurentiu.palcu@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Currently the drm/imx/ directory is compiled only if DRM_IMX is set. Adding a
new IMX related IP in the same directory would need DRM_IMX to be set, which would
bring in also IPUv3 core driver...

The current patch would allow adding new IPs in the imx/ directory without needing
to set DRM_IMX.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
---
 drivers/gpu/drm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c0e5a7e5953..c4d12e756c63 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -100,7 +100,7 @@ obj-$(CONFIG_DRM_MSM) += msm/
 obj-$(CONFIG_DRM_TEGRA) += tegra/
 obj-$(CONFIG_DRM_STM) += stm/
 obj-$(CONFIG_DRM_STI) += sti/
-obj-$(CONFIG_DRM_IMX) += imx/
+obj-y 			+= imx/
 obj-$(CONFIG_DRM_INGENIC) += ingenic/
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
 obj-$(CONFIG_DRM_MESON)	+= meson/
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
