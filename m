Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9F04552CC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 03:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38896E18F;
	Thu, 18 Nov 2021 02:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300098.outbound.protection.outlook.com [40.107.130.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A9D6E18F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 02:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n22kVP3dBoB/lbe8W0MKOHoPymPYJZG/kUarA4gN2d7lF3+Gz2BsOUZcsJUrDA3vU53jxxf91/pB5h3TKnGcYxfj5kzdgAVzJLDrE00gAvrajMEH62iWXNmKUMcMr7w7wuVBAbQfx2qJ40PuARCIWGkB7BqskN6GlWCF24qFjoItOjBQS0fMBFKg7AcKDxvFu7olXRNhDojkKjmvX64Bch3Ws7U+Crr2nFkZmgttKOsmUqIHsk/KZuqoDFmilk9HH17e7Q5htIDmr4hMhaC+OD7eWw5Ats/wET0lJLp+Wd8F5fwLYAIltcvrLmQDTk4c7DYoLBorUl6/HBRGXXh+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01L7f2XMsNdxTtD+8vGyTqZFb2tq5x2GZF0zGWD81+4=;
 b=Ygvr6zsQvcnhvw4F9Wv8cgWfVhqyZiiCgQhQsUQZplOXMrQHV+2EL77pi1z4j63nI0UFTQHJ3/LEN28j1lRoWgVFPIQa8CPxZ03Zvjs2/+dSm9kihVYW5ZC4JZLdk4SflOXwnk7HVqeolQ5Q8VkQUZ1kIZG1TI2muS683UaOwksFOClKTXe8Cs3XfUlra7hNC3QWcbZjJxHjVTXRhxYKQ0tlP/YAMV+JBPF8KVLCnmudsnKVEXR7G3/bp7DvfmTRqshlMqjfUFvU3csis+4KZ3fdKu2MDq+2P+7q3YBH2pVo7AuFRrgH+n6QRU0q5pd9MiTrn08Pgk/9jkMUTJuBBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01L7f2XMsNdxTtD+8vGyTqZFb2tq5x2GZF0zGWD81+4=;
 b=I7AXlRjtglckcRsa5/7xDtSbFyslaMcR15ScW8wbIQwOSSofXC6+urr7IZ+VgwTJiBXSmo4ArjNyY82AwVFurT4rRqt4EpSb8UKHsbbWgtSQweaph1XvB408/V6UmA8f12gBCq5FoCYSuapFxoQtzIAoaD2j1jUfwUqFpur+AYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by PS2PR06MB2902.apcprd06.prod.outlook.com (2603:1096:300:46::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Thu, 18 Nov
 2021 02:37:36 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::395a:f2d7:d67f:b385%4]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 02:37:36 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/kmb: fix potential memleak in error branch
Date: Wed, 17 Nov 2021 18:37:23 -0800
Message-Id: <20211118023723.85553-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0163.apcprd02.prod.outlook.com
 (2603:1096:201:1f::23) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
Received: from ubuntu.localdomain (203.90.234.87) by
 HK2PR02CA0163.apcprd02.prod.outlook.com (2603:1096:201:1f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Thu, 18 Nov 2021 02:37:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb1e99fb-dd8e-4137-f5c5-08d9aa3c60f7
X-MS-TrafficTypeDiagnostic: PS2PR06MB2902:
X-Microsoft-Antispam-PRVS: <PS2PR06MB2902D24E1D0660469415BA7DDF9B9@PS2PR06MB2902.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:451;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FOd60m88VxF3xSZ9EKUr2i0XrlK7ouYQQMAiCYdk42CyfaaHfubLuqZxPeE5CDmKMe5IpghhZWhUm3GB5/bntykWNbGo60R8ogWklSv6v5ZOTNLfk0bqNWDnfHSMEpbSEN9S16/AvByHuEcGm7EAnQ8uPjAQNxDh9WliyXPQ/J+GBMYtMXG7LibPEvJyNWVO3YEMYIhrYCwTxXb5PtuKiZ28w/b8tRT43rQ2sY/wj0uQ5YAZPSVVwnEoZwsGOFEPZkRWdSZz/PIqwpZNioSyUD76xc4PYZYff6hRRgkOIlOdZhu2koKCKZPi12qF1ZFWgBz3GXcbYIjh37fjj8CZoPVc/RI9VM3smBoiuZ2vlGJnsuiFhwBtmJmdH+9XqXYJG+FQ2O/9S9dcYXAXJtnsz/PjTT2omVwC6qMkPoqhfrPlYlZwpLpKgJ2b1pU7Qvk8gd3cWdE6EonlTbVjIcrhkr9ACgmcRyhc8pPdk9d3fOR9MKPn5tIMMkBdenAVxbnEHdcBcMU8zshNA8dlIvLPv6AYKsdjE7qHUvCbrA2B2lPc2PNPLBx2MP4yT6Bp30CFqfk6qebQVCgcrhTRoKIJNz0hZ077YOvaa7FmjWzo/kP5xVd6Kuoh4eObl4C/s7soVHx5/D52Dx9yZVP3nSeYEzqBh1RwQeIZ40CgrHpNY3xZ1Ce5cKGaRlBJCrwPDDRep81L2dj9nu9LTdsxFSmbKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(316002)(186003)(8936002)(6512007)(6506007)(66946007)(66476007)(66556008)(86362001)(26005)(8676002)(508600001)(107886003)(38350700002)(38100700002)(956004)(5660300002)(2616005)(1076003)(4326008)(110136005)(6486002)(52116002)(36756003)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J7aq23QM/AiinhAfFLdwhsaPA6OMM7XiXXqsZxufq209aK+T7uGFhRtbdJIP?=
 =?us-ascii?Q?hwGwGdD7WAV0RswffhpoYOdiCy2+WwV8u9cyUxUNkA4RmjfLep99CN2hrZyz?=
 =?us-ascii?Q?bStq/QPbRmLd12qk61hYWGfqHdGYFS0g3/I0lG8EL+lNzSKbalCzqMDM3aRT?=
 =?us-ascii?Q?EZ0K27BTIiNFK3M6bgdAfvAbJqW3Cf1vQZ3GzBHacIXyXsXVCCO5KqJmzTMO?=
 =?us-ascii?Q?URFmsV9T710XkVnDHeUyTp03YyS04QyrNX7GonI4UG06vxhBQQjzNkC5tct2?=
 =?us-ascii?Q?kuUDneAGObvdVI7Y9F6rxPHLFEm1tehsr5+amZDfaUx0ge/c/bZo0ByNTcEx?=
 =?us-ascii?Q?+YLTNOoCqb73DSjxMxFFyhUT/MBAD4beac1mZFNqwy/nUyGpfM4zGXO2LRSM?=
 =?us-ascii?Q?I5BOTAUWjtV2utg1Ktl1kbJi29x+hGN4LENesADuTFnqa9lVUgES+bqir6e4?=
 =?us-ascii?Q?WH/7hFpEfo1Ks2bR8Z4ugs44fdGUbNDXlDn9cXB0b4w+nkqUSkN//qFyovQp?=
 =?us-ascii?Q?mNQpT9xDMClCsUgm9+Yw0Yevn9UnpA+uIIImQBFsSxzBDt0ApYm2uOxt/nHR?=
 =?us-ascii?Q?kC7j9Eo+s0nvJFD9mUOEp8drrzmQpR7aaD7MrQXkLycakpEJ06nZnt4tP0pe?=
 =?us-ascii?Q?5gpXRMaPzgyK8g7zD/5N3njlAKlhk+DsryuvFNnLmtdi9cwPu7I1Jtvk4sQL?=
 =?us-ascii?Q?kGG33/QGfYhkG5G8o/9uGjs/xLaejOw1FeFhJoHrSS3CoawrgXkfggvWrx/S?=
 =?us-ascii?Q?AVzCxvWIiw3+wEI70i0+LROBBOAikkgiODNQ1SACEL2rAkUKRpO2T2DwrLPt?=
 =?us-ascii?Q?NA38wrOzfZ2auD/ZdcvkBKhAf2t3wciGI4s9tJ6cNjDHB7mElIFEouEe2H43?=
 =?us-ascii?Q?c1bTrfqRiqFjMxg3a4Etiv4ZoMdX1H1P478odpFC/mCVjUO2yaO07h7gLVtx?=
 =?us-ascii?Q?tiygvcZ4UgZPZMnffronUqwn2A6ZFRyPbyfEjcXkkJuTI9ET/RAv4UUppHY1?=
 =?us-ascii?Q?TzE9pLh92v11VYeB+j9OO6sm0mkw9GCVezsYtApoJ3sFxgvqs5IaqlbarxMw?=
 =?us-ascii?Q?guhloQS2TI7aw2xHPBhTlIt7lzJmhR2pTwsCVxJzjRg+ErK4NQWb27yI5ySX?=
 =?us-ascii?Q?eq4jsVOfR95DLnKb06zOgPT7/hDj3RDVdj7twWo3ClyRwoewewOlK9AkKDe8?=
 =?us-ascii?Q?ALLibht4W7AU0kUfa9B5KfgQrsuJDbjYYBMt0WyX3qlftAwH5pkCMRW3n928?=
 =?us-ascii?Q?69fUirItMA4Oc6mhbAGFCosCdfOHEEgEVgR0GLoqdBapHntUp3ylUxP9MlGW?=
 =?us-ascii?Q?guIe6s1IDnkqC6VsMgluZYIFq6aScaUkZ1a1/4HBVe7kdbP/FDVeXISq1I+6?=
 =?us-ascii?Q?3pvEQmint/8x65+FVLZfzQTAApukIMHRNUrs21Sb1gWsivbBma2nCY73YN8l?=
 =?us-ascii?Q?9F7hgkxR4P1NTWtbyg7Yk2Zzd7Z2hJEAwArF8l2fhZ7rteW0FcpupIRUHeqs?=
 =?us-ascii?Q?KODcNkmyU9uQqwjKPwpIHk3EniEtUv8NWFaVX7eMXgFdJrX3H2BPxApIfTsr?=
 =?us-ascii?Q?JJn6mfLH+kev0Uwvb9ScmdY8qg9ZGUc730+6aFHt9JUJIu69ID3WRafq2vn9?=
 =?us-ascii?Q?tg83aYO5/D+CYHa0IRntlcA=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1e99fb-dd8e-4137-f5c5-08d9aa3c60f7
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 02:37:35.9960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lbkOziH8LBEJ7zTOzzq3ud68Ji5o70E5Er9GWko725mITULHzyEWLzhATsU2ooI+KRdH54BW3W4Gz+oFFgZZOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB2902
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch try to fix coccicheck warning:
./drivers/gpu/drm/kmb/kmb_drv.c:519:2-8: ERROR: missing put_device; call of_find_device_by_node on line 506, but without a corresponding object release within this function.
./drivers/gpu/drm/kmb/kmb_drv.c:522:2-8: ERROR: missing put_device; call of_find_device_by_node on line 506, but without a corresponding object release within this function.
./drivers/gpu/drm/kmb/kmb_drv.c:529:2-8: ERROR: missing put_device; call of_find_device_by_node on line 506, but without a corresponding object release within this function.
./drivers/gpu/drm/kmb/kmb_drv.c:579:1-7: ERROR: missing put_device; call of_find_device_by_node on line 506, but without a corresponding object release within this function.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 961ac6fb5fcf..4a7178288ecf 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -514,8 +514,10 @@ static int kmb_probe(struct platform_device *pdev)
 	ret = kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));
 
 	if (ret == -EPROBE_DEFER) {
+		of_dev_put(dsi_pdev);
 		return -EPROBE_DEFER;
 	} else if (ret) {
+		of_dev_put(dsi_pdev);
 		DRM_ERROR("probe failed to initialize DSI host bridge\n");
 		return ret;
 	}
@@ -523,8 +525,10 @@ static int kmb_probe(struct platform_device *pdev)
 	/* Create DRM device */
 	kmb = devm_drm_dev_alloc(dev, &kmb_driver,
 				 struct kmb_drm_private, drm);
-	if (IS_ERR(kmb))
+	if (IS_ERR(kmb)) {
+		of_dev_put(dsi_pdev);
 		return PTR_ERR(kmb);
+	}
 
 	dev_set_drvdata(dev, &kmb->drm);
 
@@ -572,6 +576,8 @@ static int kmb_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, NULL);
 	kmb_dsi_host_unregister(kmb->kmb_dsi);
 
+	of_dev_put(dsi_pdev);
+
 	return ret;
 }
 
-- 
2.33.1

