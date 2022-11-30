Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB86B63D1B4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396BF10E43C;
	Wed, 30 Nov 2022 09:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03BA10E438
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bu4t/AfmT1Ef3Q2eWyd5Jrp+EyPFQNIU9tRPc2RNvYoj+cjkGzBsp9FY8kaBi9A8V+59vluEPeIC+OBSDkdHXL/9NZEyqBlnCPsSOCeg8Nb0bdCAGEDVMJy0K1XvDv0+G5qvWkC1OqJQ7raoi1VF53hjeWSF+oPLMo/QTPk15ojrQhDPkE3wd/IBn/Eh6KuhoURhbadsflQveISpXXJ27QlIcB5nEpY9LcqfBH0OyUAzodycWw1nNFjL64a5XG4Uyua05a3Vgr+CUDEVw2h02+w7tr66+e1uIOXBqSnGDoo1pJww7yTa18TKsYX6e+qAFCI6C6YoUqte9JZx+Q9aFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDe+Khwrk0Mx0SyEH631hwKJYvjz0f0UJCYJIIXhaUE=;
 b=YMEo+hOAwUC8375RFZC9dFGM8Rw880erWueAp5ew3bRYhy26glkXM/1x/T8EA2a2RESnRSyYAjLHc/XPmxGLJAjQSR+roQ80ptb8Q4VjWWMbk+nIPxgu76JiuT5QA9TvNH+ArbfMosbgonLVSrf/YhruGxu9UHc1wls72vE0Sg/S65LYiN6S/FWWEdXccqxcm8WInqhM+R61RqyoViHGIBPQ7f7Bq+GL5xOvX3aKlOUNv1TyRrrsVEmadG73Fj4Z+YlMc6ytwQfZFyTUGw3uFOKKcW0qBbRzXjfhS1LjpfJ9WkGaJEx3vM86O5KGTfjsntTGR7xk+xGkWlmuViLC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDe+Khwrk0Mx0SyEH631hwKJYvjz0f0UJCYJIIXhaUE=;
 b=PhYMlYg69obJDzcyUGwmaz/XcvsCCB0n+uHD2dnn+I0+yPDqVdjfqZQDzAsd3qhStZ3KsBLh3sLx2WuUHyXPviPXPtjIh3ztBsxCZzSEZdCO8FCdfYUp/dTFq3AaPnc0hzoPWC6Zj3yyhxjK4URh1DYihlFptjjWqb0fzgF2lw0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by SJ0PR03MB5422.namprd03.prod.outlook.com (2603:10b6:a03:27b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:22:32 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 09:22:31 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/2] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Date: Wed, 30 Nov 2022 17:21:48 +0800
Message-Id: <20221130092149.102788-2-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221130092149.102788-1-randy.li@synaptics.com>
References: <20221130092149.102788-1-randy.li@synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|SJ0PR03MB5422:EE_
X-MS-Office365-Filtering-Correlation-Id: 394b1775-15f4-4219-2e59-08dad2b4686c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CXpzwpamuqMgI0SWw9LIsTvqc0jTC9Q/ECWDpC12FXg+nW5rf3XhIEZMTsTrv97qrP3d3y9O0Rlt0oQtxIvPPDvZqFtc+Dlcx01UZzgzwxlpaNVVstYPhWaTEHQf4wkI9UAmUNrxFYy009r/udoPijdA7MgSkRh/vesJtHLb+iYyD98qHl6qcMsULr30UyrWc1OxrwA4gFb4UHRv7wQ14/GkIOYPe0PC2VlakVGcmgHEdZJBYWeWrXLmQZhRtDvWiqQjMm0Wq3bhp2few9Pv4ZCw9OM7gUfi8RgP2wULw9qRnxytc3GZYn2xottEmWOACV44aQwqB03XJufvgNj4zi+ZRQCEczNfPZkR0wnBJTceswxAsOFYUZiamzSMWPXF1DvxuYUR3cXdtLm39Ezk7r9LYnSlVUCZ8nPyatPOh+Y4eHWZgrZO56n4wg7T4MQ9NplNc15fBXkdkgM1Czk9H34Dksjb7CZKUB0Z2kl4R4ud1vEvvCZF2kfD4Zo2uCy3IPUyuc3AbQHo38DZVFo+SWcbUudOJSOp5MZI5D/SJmjKh/JddxVr9su9E1da91q+lCKTOSUc9NKlvXLqm50QoEW1Dz5r+lruov48qWDRUZce1veWSTyxLVMBdTO2ceiGgG5tzyobEDX5xRvJckwQSvwRz2pAn6rHr7emVZ1HGmbxL5fI/Xh04+ZM7HofyKgA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199015)(8936002)(52116002)(6506007)(4326008)(8676002)(66556008)(36756003)(66476007)(2616005)(41300700001)(2906002)(6916009)(66946007)(186003)(478600001)(1076003)(26005)(316002)(6512007)(86362001)(6486002)(5660300002)(7416002)(38350700002)(38100700002)(6666004)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vRX7TxGufvaPMrXFyO2ItvfJpBL4oCjLBrVhGh3U3Jhm1udLcjLMtiUXAyVg?=
 =?us-ascii?Q?sRVtg4BMEk3BM703nPS+n5AzlTCPakGRrVD+OwMJ7Hzy0C/DjG0pRo3z/mUQ?=
 =?us-ascii?Q?GRcddBs+q12SQpWNac+ZEigkpltjlyhyGdxjsPTJyYMeF+GN5VUY0pbqRPGD?=
 =?us-ascii?Q?3Z1+pCJqXIa0xd0R5q282MJ15zUXFpY6WsqWHHmNg7qBee36Bn0GeubdjqLO?=
 =?us-ascii?Q?w3ueNhtqcVuYBc1QYlwDk3YuLmytodZNPV5HXQx/wVis2Rzviy5xlD6K0UKF?=
 =?us-ascii?Q?bLi1WOkXV/sMtKW1xzCBVoc6wNvuCVXgcyf9l8NcU5U6JIplzf7ieAmup0u6?=
 =?us-ascii?Q?LoEUl/vh1YNFBkgQtwgXNLxgkKip7beB/Y3VqsxN19TS9oXqPJFoEZ/8oHHa?=
 =?us-ascii?Q?IgMo68Ol9uMHgNcQ8TC5M3ivt2YrHG55pdSlmjb/nJA3hI3amKLDUumIOpkp?=
 =?us-ascii?Q?Qiam4+RGwqMG720Y9OvRe3G1XILLIuFj5wY44xvPdA1Qeon8mfCF4HYtw8il?=
 =?us-ascii?Q?AyqprzzoejhcD9azgHcsTadeP/uwWQSMfhKE4skE2bzu2taMhafwMLAx2f4Y?=
 =?us-ascii?Q?ouMwCoTLbBqIpUIzK518fClrTeeiONqg/OBerOlNTnUD5kx10Z5AtUTUz6gJ?=
 =?us-ascii?Q?9/ryjk4drCrRhfqGlSVkU/7XET8IT3TKVaEWhd3kSXMvKyyAhnb8cYSHhfwH?=
 =?us-ascii?Q?r/2Z1FlIgrulcC0iBzRJlNkZEPyl2YdEOdY0EVtaB97UArmJy6O44qBCU27D?=
 =?us-ascii?Q?qjaRwmN8GHLKt9L5M8yI+NqKvnsOVlSirfKdtpCCXhFuOz2wciGBGa55PqM5?=
 =?us-ascii?Q?e8g5vsn0NjuM2SY6+JooHryPythm00Cia1D6/TzImJBI3kFg6ztcpnbI7T/5?=
 =?us-ascii?Q?9xMWZ5muvPD/u8HTDAX0Z30XWxgwZvr/wihX8E89mWHmdgZtqWzyJwGJWlyj?=
 =?us-ascii?Q?yIMBdBE4+YcCpiiKBtFnHr8uvGFRaGqccjgYbImFLY3vjW/3Ouij59Uxb8CZ?=
 =?us-ascii?Q?irCOK1/R/SoD8rFu54+gKoy49l0z7VU3b7VaKhKK93skbuenN/RM2ZtVHlu1?=
 =?us-ascii?Q?ler2RF+bjox8O2UzYipkAO9MFLmcjAzo8pWdyq7v78ZBq+fOnKyceGSmzoKS?=
 =?us-ascii?Q?Opt7cL3SxWQnTC8i8SZb4M5AYsUbR496q5K/BcjhXVsKfhWH4Exe94NpkXBd?=
 =?us-ascii?Q?zlCc5wgPmwyi3CmF1j6ok+KJbij9Vy10E15z2sj0oQ1HxxuVGK4zSNIBkOwX?=
 =?us-ascii?Q?2KkmNU0t0uQzJ1IoPob18fAE4bdCtY8pcnvSCKWrlRK6GB6wbZg/XwBp/WaS?=
 =?us-ascii?Q?4BUVYRF/gVNzfYoLLiZIHBdkdS2wlP0pS4J5XtBMj/ZkB5xjOntTrgkgvfQB?=
 =?us-ascii?Q?+69EGLKAF/wsIzxo2MzvdxJ0md3Q6ogBqfoHXeYpw4nf5xfZ24qPSd1XVtE6?=
 =?us-ascii?Q?qVkWtmfEQSclYJn8xxNIrn7EwE2SOZos+q7efvZGyZE7P49nyTRvDyAvPVFq?=
 =?us-ascii?Q?qxERdSPRjUsS6Wn1j9vox7e2OX5Fqq04z4xipBu68pOEjd04dorJyc1+enmF?=
 =?us-ascii?Q?uQB0N3mvmEtF4H55fa5aJD1aY24j7crUxxx87Xzc?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394b1775-15f4-4219-2e59-08dad2b4686c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:22:31.7193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ug4CMYPpChM8FSTGvr0C4bOvMT4Q89cV9V6jH+w0bhDSiS5/4YjM/8prc8eiOmrH5n0Q0cSpuXkc3bxzCuhM2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5422
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
Cc: nicolas@ndufresne.ca, sakari.ailus@linux.intel.com, airlied@linux.ie,
 ayaka@soulik.info, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>, helen.koike@collabora.com,
 linux-media@vger.kernel.org, ezequiel@vanguardiasur.com.ar,
 tzimmermann@suse.de, ribalda@chromium.org, sebastian.hesselbarth@gmail.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Those modifiers only record the parameters would effort pixel
layout or memory layout. Whether physical memory page mapping
is used is not a part of format.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 include/uapi/drm/drm_fourcc.h | 76 +++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index bc056f2d537d..e0905f573f43 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -407,6 +407,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
 
 /* add more to the end as needed */
 
@@ -1507,6 +1508,81 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_CLEAR(field) \
 	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
 
+/*
+ * Synaptics VideoSmart modifiers
+ *
+ * Tiles could be arranged in Groups of Tiles (GOTs), it is a small tile
+ * within a tile. GOT size and layout varies based on platform and
+ * performance concern.
+ *
+ * Besides, an 8 length 4 bytes arrary (32 bytes) would be need to store
+ * some compression parameters for a compression metadata plane.
+ *
+ * Further information can be found in
+ * Documentation/gpu/synaptics.rst
+ *
+ *       Macro
+ * Bits  Param Description
+ * ----  ----- -----------------------------------------------------------------
+ *
+ *  7:0  f     Scan direction description.
+ *
+ *               0 = Invalid
+ *               1 = V4, the scan would always start from vertical for 4 pixel
+ *                   then move back to the start pixel of the next horizontal
+ *                   direction.
+ *               2 = Reserved for future use.
+ *
+ * 15:8  m     The times of pattern repeat in the right angle direction from
+ *             the first scan direction.
+ *
+ * 19:16 p     The padding bits after the whole scan, could be zero.
+ *
+ * 20:20 g     GOT packing flag.
+ *
+ * 23:21 -     Reserved for future use.  Must be zero.
+ *
+ * 27:24 h     log2(horizontal) of pixels, in GOTs.
+ *
+ * 31:28 v     log2(vertical) of pixels, in GOTs.
+ *
+ * 35:32 -     Reserved for future use.  Must be zero.
+ *
+ * 36:36 c     Compression flag.
+ *
+ * 55:37 -     Reserved for future use.  Must be zero.
+ *
+ */
+
+#define DRM_FORMAT_MOD_SYNA_V4_TILED		fourcc_mod_code(SYNAPTICS, 1)
+
+#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
+	fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
+				 ((__u64)((m) & 0xff) << 8) | \
+				 ((__u64)((p) & 0xf) << 16) | \
+				 ((__u64)((g) & 0x1) << 20) | \
+				 ((__u64)((h) & 0xf) << 24) | \
+				 ((__u64)((v) & 0xf) << 28) | \
+				 ((__u64)((c) & 0x1) << 36)))
+
+#define DRM_FORMAT_MOD_SYNA_V4H1 \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
+
+#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
+
+#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
+
+#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
+
+#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
+
+#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.37.3

