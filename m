Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27B952CD0E
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 09:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A64511AD2B;
	Thu, 19 May 2022 07:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2122.outbound.protection.outlook.com [40.107.255.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBB811AD2B;
 Thu, 19 May 2022 07:30:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPUtfQOV9RQTVWPeHB5nanQvB64slsky2YN/vKJ2rGMu4u6c1/6gSPCWtT+j6PEYuUxFyebVa+fgSmROpDnpNzutaziPp/pdsuhiFb4ZV5LCat6dijTcqQWz16rR4Ol4A3GWMyhVDK16QinfnsQR92F852zVgBMZ0YszPfT130cZ6GE1tZjq0dFwHaQx7TBPrJipCrZCMQbgwuFTTRKb1FQGn91Ecc3s0m5ib/fKHfNAKnc6UP7tkqdc7YKjIKOwnuXvS8SO/RcBKIbKXTE1K7D1v3pGTbqssJ0Qm2/Bbubk+pQ7ffEKN41mABT52D/4CfURDXPXzgZpJqkYjUxplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sl+I8v5QlreK0AGjaNO17hlonm7AnFquv/cgLm/EBsY=;
 b=c7dwp4JzUutKUkqw6rXSL3md7QT3Ua3EzlDZRw8nO9luyBLsgnMG2K9RTKn0FQ1YJ7zhx4V6Nozk4Gk9cUEmQHLmsoOHnAJAGepGKoEvg0dD+5dzU11c61q0+hbgz9x+CKov615rHNuUfz6tYEvdFGraDP2x06rm5jRqg5ABmWhiDSeEqbHKRBkh2LUmc5Skz9PGQno/7FtDqmtSnSMhRExUg5nWZRKxncS0UZ06E6nlnI/WCWJZJ2RjeZC0z5aM372/UISI80RuU3qI4tPXz0T4bRE+9v7/yzKSHcozedP9CRjJAPtVa+qC3WHI3M0NGJ83FBOojGFn/Ys2ZxIBNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sl+I8v5QlreK0AGjaNO17hlonm7AnFquv/cgLm/EBsY=;
 b=mmjwWwXnS9sit0BCFAXkdL9cm3EGmJVSXOs9c+5w+C8QS1QO64s6CUCHcq7xhffKnVdxKJstZpYlre2xSaZOcpelnw/6XWYN27/LhA5Eb9mMdINi45DEF/9ZrDoxhVoFysftTHPmNB7JJs1F0W0/c45J7LYo72ytWiyDIv1OCkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by TY2PR06MB2461.apcprd06.prod.outlook.com (2603:1096:404:47::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Thu, 19 May
 2022 07:30:31 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 07:30:31 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Joerg Roedel <jroedel@suse.de>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/nouveau/tegra: remove needless NULL check
Date: Thu, 19 May 2022 15:29:48 +0800
Message-Id: <20220519072950.128268-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0152.apcprd02.prod.outlook.com
 (2603:1096:201:1f::12) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1213b76-86c2-4cbe-66e1-08da3969745e
X-MS-TrafficTypeDiagnostic: TY2PR06MB2461:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB2461F413C95F2775C44A7A25C7D09@TY2PR06MB2461.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gOazBdalRkh8zThZL4IrpIAlEGXZtcVLxkO9eVP0+s+MGFA14V7fdYt6nlLkuhdqkkxcBhJT/HudM12ITP2G47h44CPr51oWDCY5HrBIQ0HyXJRUrvIB0jEMsocWgnV0eAdY0p+tlhmIvIl9eTyD4Vwq/b10+Hmi5smcTqh1V3q8Eh0YcPCnfi7U29uRNxpruXGzXjS/u3YdidfJGPoYijIGE5BsvUDy8A0Cw57eXoYsYX0c/RgEjM0DDiykUSMwB5ob2gB628U00XK1cGr8gFSE4NcEdrgg5a4tWl8YDIqgRG8wphjQDp2N2r9R9O+juRwCjd/CK0+5ghrm6yJTLdrpw8qSpk/quyHIUwEPvNCsGojU6FpZEGxxit+LOGy5V6RGnsrzAuE4Cz/K/AG1oLfUWIVeLLjoUKxzrlQM21BNwb5inz32h+CWtEGmDcx3Cr9IVj996QNN0/32fbBIprvMQAS/EJ0sCX9l8VQen7Sr0K/4J9yap8UaoRnKdkKr9izYqnJaj1bRvBKIQ2GzIBEbpUNeROcj5e79mIpTWvnW6BA+PJEbmZq/j2pUqGTEL7O/3wSro7MqjG20bVLh/YBC0chfEpAna5TlqW9zxkoStiURNG9647Lq2U42c2uZvZd36I14xxYNtuEYJNOV+KfvjQLLL+tMMjqnQLBJ6PgFdZ0OBsWE/FzWLExzSMEsW0qcbrWhPwBI9nJJW4JILMwOp7Wgp1wpHPBbz8EZSwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(921005)(4326008)(110136005)(66476007)(66556008)(66946007)(36756003)(8676002)(316002)(38100700002)(38350700002)(1076003)(2616005)(5660300002)(26005)(52116002)(6506007)(6666004)(186003)(83380400001)(508600001)(8936002)(86362001)(2906002)(6486002)(7416002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BISQY2b5CDpyisQcLtXAaOXeRJD1ao9EbIwH+DAoca4oMK4b2nxrHioo2M7Y?=
 =?us-ascii?Q?03U4i3PlNg8DYVul8p95pbanpqcyTl1IEFlyxQc+8y6qshKsKFEzJG/HR9/7?=
 =?us-ascii?Q?ZG5Vp+TlMaBDyk8EXgAQVJnROLDPbkPQcn7ZajbpOv08Qk+LcgmBrbUpVVB0?=
 =?us-ascii?Q?CSeds0yZIfr7uoaAVzbabkDvXYjOmU1zR4jjNUW1riRnkt3j2docvyfhxAjw?=
 =?us-ascii?Q?jL31lbkgbQFV9YKVxDnnM+u+pRBzF6rbf3K05Aox9l4tbqdbHdMLBneys3ef?=
 =?us-ascii?Q?3GxwEygMNTTwdreXkwuHMjZvMAQWWW1oXetErosRl3Y9oveckYYJHnDAi8es?=
 =?us-ascii?Q?/4K4lbcABnr/HXSB75Av1eRY7uss63W0R/zE6ujOOGOo5++U4Q7sDJnp0moN?=
 =?us-ascii?Q?Wxr9aokBkkBsVWSLF5EJpLj1FiSjl24Acx+ViRKnYm8dWt8wSn+TOblnqMUX?=
 =?us-ascii?Q?5tuJKbomxLb5w2F8d9qylvZmqFY/CEZr7ru8wcOk5/dpOJQvsHjCgAT69IhA?=
 =?us-ascii?Q?1BavxKRaL99HmTW/1xyofx6XUYpJ9Vy+pls8kFamW7ko80nxe6m4m+hYKmUm?=
 =?us-ascii?Q?/8i/kTIHzB9pOXBO8MmYJQdOJqFepVUGi7l/sMBUqGdL0Px/MHJ9vM1Wqtjx?=
 =?us-ascii?Q?YmRMl+cOrWyCKhdi7siF7QD0v6OXCrSvGFpnG0ipWYD85LO6Nx+oFtNkr0jM?=
 =?us-ascii?Q?4hwM8i13TGpAKhaxaYLP+y2wcHUJbvx+UeTnyWwPj3aKDs4lu45LFOE+c3hI?=
 =?us-ascii?Q?rjaeloyQpTEBKKAoCjMmbc6tdXAnB/A6JZQgDzSwOzbBWpfmGGDFC9H48DGH?=
 =?us-ascii?Q?ssp0KOPkdLEXlvClHL3uVx+oTPDC5fQkKaftZkNSO+5QpQ9UXBeK7mVLZkzk?=
 =?us-ascii?Q?C385porN1d29qq23R2QEWDcemAMwNhiNF2vIN44y1oepvsWZUifj8bG+fhEs?=
 =?us-ascii?Q?b9/Mccgb2xORjJrB0TMqlKglGNqPdKWqGtAPYKKOmvC9080trTInaJO3rOex?=
 =?us-ascii?Q?B9HOCZjDe4/fZ4CEhGlye/YO5NeZMh8yV10AQjin4iPdBeHgcwRfmsNLaaND?=
 =?us-ascii?Q?KbEz40Vetdk9OpnY2yZGgbZl61m7AdYp3fqhWFvcsr0yZyq7FX9AkiT6t4vF?=
 =?us-ascii?Q?A/5xWQ5AjMTYhM8kntF1x+9lnUoYvSdc9wOsNEq3IlbPPJO1q/mSXuIz+zBB?=
 =?us-ascii?Q?OvFY4gYO3t8LjL9ReAS785BJK5oWIv2IqIaAOjubjy0KuxaTDAGcD9k0xT5S?=
 =?us-ascii?Q?jubHAS0pLjUwufNhl7CIHOqs5mjRJFx+SMj58BUgXMvu7Rt0CaiKBx7thgX2?=
 =?us-ascii?Q?hUQC2iqvDsnxeU4Zfl1AV5Lju1wKaTfx1EM0sUigs9YT3ldPKpX6gdLkhmAc?=
 =?us-ascii?Q?HqE8qLZe9BRgCg7Ld4lcBh4DcZlFO2CsRHpS5uVNAVboOh3RRjH3xv5hmbBa?=
 =?us-ascii?Q?65hkUSpg4txxYDA+vZ/yuckl4+sGm7HkyhO4pF8HNb5KkYjEJLS3FhYQC/Q9?=
 =?us-ascii?Q?kB2C7S2utG5e0yWNM9U5xKwzAkoXyaNeqOBEF8IUQz2NUzUc8XYjTUS9Ycd1?=
 =?us-ascii?Q?pYCZMOIx3cU8apu2WwZKDLHb/tymP1Rvji3WMufqIFtxCJd7T5MJqy2lGC9q?=
 =?us-ascii?Q?e70PEwpBvatGCLAaTfDx9oQAi3TyYXVe8EVKs0NUuOk7aemcIxqwyghM9ve6?=
 =?us-ascii?Q?k4990OkqkNWI78MKXkctv+ZcLLDwMYnsgtc3UffPQpdXdciycGX9IxgvL7zu?=
 =?us-ascii?Q?mmq1OBfatw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1213b76-86c2-4cbe-66e1-08da3969745e
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 07:30:31.5852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jgDKccIbgGdcrG8wx0Ad4a2XfwX4XE8v/wxufX02oCLKzhwKq0pfl2NdL9zlEUUzGqXrHrF/yvcqyOAu9vOsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2461
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
Cc: zhengkui_guo@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There has already been NULL check in clk_prepare_enable() and
clk_disable_unprepare(), so remove needless NULL check before
calling them.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 2ed528c065fa..ac9e122586bc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -41,11 +41,9 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
 	ret = clk_prepare_enable(tdev->clk);
 	if (ret)
 		goto err_clk;
-	if (tdev->clk_ref) {
-		ret = clk_prepare_enable(tdev->clk_ref);
-		if (ret)
-			goto err_clk_ref;
-	}
+	ret = clk_prepare_enable(tdev->clk_ref);
+	if (ret)
+		goto err_clk_ref;
 	ret = clk_prepare_enable(tdev->clk_pwr);
 	if (ret)
 		goto err_clk_pwr;
@@ -70,8 +68,7 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
 err_clamp:
 	clk_disable_unprepare(tdev->clk_pwr);
 err_clk_pwr:
-	if (tdev->clk_ref)
-		clk_disable_unprepare(tdev->clk_ref);
+	clk_disable_unprepare(tdev->clk_ref);
 err_clk_ref:
 	clk_disable_unprepare(tdev->clk);
 err_clk:
@@ -87,8 +84,7 @@ nvkm_device_tegra_power_down(struct nvkm_device_tegra *tdev)
 	int ret;
 
 	clk_disable_unprepare(tdev->clk_pwr);
-	if (tdev->clk_ref)
-		clk_disable_unprepare(tdev->clk_ref);
+	clk_disable_unprepare(tdev->clk_ref);
 	clk_disable_unprepare(tdev->clk);
 	udelay(10);
 
-- 
2.20.1

