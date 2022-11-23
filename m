Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF45F635576
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8F910E52C;
	Wed, 23 Nov 2022 09:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643F610E52C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:20:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/7MSF+96YqP3yqWbDbZY/l4j8tQu8Zegy7g853avB0Ji+fnEOV3h6WySqAV2aU9Q0XJp8+Y2gU1c153AUGG4Us7IUHA5suRIHheyzSzfzZOZ2qo/LgmOi8Z2SQ7Vnzpnsacphu/stOWjOBBJzh2oa9ejb4wZ2Kf5Nw3b7Q2Dra7paeAvait33QUndDvKLjQL0MstUsluGqgxllUfTAV12pU2CNIO8isOg+fnn2xom5jQrI5nrZ1/YIDkfRRQXAX+/mwvVw4R+fIjm7AHNUrYaS1oQaKsbGuLyP58y/4b59RgF6cD9brOIWI2zpM5cIWs8AKI+KceacVTiDYsr5QaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9nxb7J9kIIeH/n/FLXw3QUOA6jjKpMU+gpq28t8f7c=;
 b=bqf3nasCKvhwDJ6AHLlT9/QoSBhuSLuow3iM1vUBV7Bo9xJOKG8fjTnt2nlJa9M9/GrtUgn/HIIt50mtuKIQr3icS/PNLEYZPM581WFt6bvo1WDd7DP4fQS39FHKFSRc1c+iK3zJkKJMT0UrOiilqK14cAPtAE0jfggplfDF96ESat+1HCXSxMjEeCFOGAAH3viYcoAub5SvSFNCoQMNym2j22/yNUIbSw4S1Lbkf9h9HKDE1R6zyUl2Xej0XFzWHLFzgze/ohKd3M+RWp90kV5nMbN55KpbZlUobwOUXd1P3KfPTueoBaVMYns7yNH3WA+UNUuEx8Iw2+cUxgrU6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9nxb7J9kIIeH/n/FLXw3QUOA6jjKpMU+gpq28t8f7c=;
 b=U/ZiurlUqIfgnjSNfoDlCnIpzIrXdAcAw9XpVmcwuXnDQmmXXnlp28R/16B7G1hftdEcQlEq3oXWMz1qH0NG0WeXXK3GRH46YfxtVaMXHCSWHavIHtneBGGnlFx4ml5rdW8DK0BgBgAbu5oT7P1CUE7Heyzr+9ntSeUBLv7iHIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by CO1PR03MB5682.namprd03.prod.outlook.com (2603:10b6:303:94::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 09:20:34 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%6]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 09:20:34 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Date: Wed, 23 Nov 2022 17:19:57 +0800
Message-Id: <20221123091957.75967-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|CO1PR03MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: 614fc8ce-3403-4f5f-8e02-08dacd33f858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uHLhaFLCZGgmIKGmrAnLN8fqtFGcO755GSriGlXJPlY3XLSbBaOEWk/EWX9Qy2o5B8LCWhgcgBNIcxlPwV9jfVZtwOa1B8Rpnc0wJ+MQJoN0ItZ8HWi9uEpJhuCGAJZPlBOFs1bjOX4f6EaRHsaUjgv4ZcxZtnx9W2EEBqNbXj9jng+dfcHf0lhMPZhkIJF8R2dSRHeLS4aL45Lx00K9tS+N1v5R+X0yqhdRgrZy1WRkt6Vhzj1NVPHs7vYCF+cPO2luW2mYNfGPxShJPuLswBq8AzFq+c3F5t35g8x52ORJ/lzYsQrc1UaFf3IXXgPO5FyknwHeuBPtp0Puohk7fI4JlS/YisJua2oZ1XzxLygZhjNY0DWmhACdnHx5jCo4oeqmUbV2cVclBC/La2nViBHHlBkE+yMi8S3w6SXnUsab3KzPuNDDaYD0550xjkbWz2cvl1zUrUjVaxZQ698hSYMml7FvsuSZomd+89pq54VBwBuWQwC0LJIK3z0J3RyDZzdMFMJjI+7fZD/1VB0ipQLHx896lP7bAb5HoDjPVa5ecDjdASTmQutdYhnEUfPp5siO8cZn33USsX5hwc5PaP/k50xIgK552Q/YdZfwlq/P2pw+iXmWtkyVZMyjnYRAOxB4BTP7i5UodeAPt3egj59CBrJ0f5+zW58b0WzwsZBq8zw6vu7uC/7A2fmBMQ9EAQPlgyYaPPIzDv8hLPd9ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199015)(36756003)(2906002)(5660300002)(316002)(8936002)(66476007)(86362001)(186003)(2616005)(66556008)(6916009)(7416002)(83380400001)(4326008)(478600001)(26005)(6512007)(66946007)(1076003)(6486002)(8676002)(107886003)(6666004)(38350700002)(38100700002)(52116002)(6506007)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n83cspczHNFfpPWJ5MUqfoc7TN7P408GwPlIUfWgk+rdStSe6bAGD13iBJTr?=
 =?us-ascii?Q?hMoPXHj1gVxafncv5gbRPVS/Y7AJH50DfplTAZiUqlN1ZqVSfzBCZDT5Z7ZF?=
 =?us-ascii?Q?Qgkvcf2l14q4b3C/33rQefv+QkZTuCQAKMJA2Q2qh+GB/zyKHp9BMegv2nmQ?=
 =?us-ascii?Q?7fTh6rHYdisbanAti7EfendrjT1b2x7SdS8fuXkk7nIZWCRec+8VR2s0pZig?=
 =?us-ascii?Q?1ROiQ9cqplYvVIxxUbSOe0C0dGIwEzl7qLvChjNKjtUdLN+zjnm49vmsaChZ?=
 =?us-ascii?Q?ubLch5tv6VtnydUqADRD/pnOF6x/W/7Rn/bVRrczVBKQoH+15WtLpSfn4c0o?=
 =?us-ascii?Q?0kRrJcESO4Du/ZR/upz/CuMvftsrLUurVcV0M3PblY9XSfwSu6aA8ivaaGhD?=
 =?us-ascii?Q?LaM6TtTsEZwGG7gJ+0Uz9DJS6xIRn9C3E81q43/ioPTZmcDp1n7wy7cF+EmP?=
 =?us-ascii?Q?cb4FWY+fadtIXjHVXEOgT0X4Jghmb/3nPfLAV8lQhQw+CN1scYElCAR6N8/M?=
 =?us-ascii?Q?Jbc1SXw0zvqCed1NX2Orh+acS1lrcQXxigC67vYxU88od6i9bMsTRIReubO6?=
 =?us-ascii?Q?hTsE+lli3Z2rrGhHI3DcDHSGs+Xnz5PsNRc6t+yLS3otpUkdRuRT3jO8LMUi?=
 =?us-ascii?Q?b60WwWVo3adocELl106ta2s+4Ou2ZA4IcJrqlAO+hzrwxOSwHSI01DZGWajS?=
 =?us-ascii?Q?eWAFPYX38K6BE7ZMs5W8h3EclqxHToS2/hetg7m4YG8UdgQOuqsx2dG840Ca?=
 =?us-ascii?Q?0f51o9SI1HEZiNcUwlt77th8kQ2sjhe9RP8UYmINPuopCRtxcb+r8y9CpKMm?=
 =?us-ascii?Q?zT443tAyafINyAHUy64mCdUI13zPMiL6w0ShCcoMya+KEuA1rfKwIakbKpS2?=
 =?us-ascii?Q?mTHHW2bzmwUdKPVk5Q8Ibcj1+cqf6SRVoxKibYUJCBT+K6rBv02R5Q7J7Jz8?=
 =?us-ascii?Q?CT0CxS6GbS5Y07ptvDzrMROtICBAWqI0Wq14Wg+LMMq1FFsiFIgtTb2GvkaG?=
 =?us-ascii?Q?Ugy2sYwBWupYWuN8IYDhdCpJ8acCHS3T871QQBNkYJSuVdh7J+zkJC2UCWhc?=
 =?us-ascii?Q?6LaBVqVDPYlUbNOMfDdLmejAlv2kzULLxu8EmHcGvI3ElwELcHGcZaJHVs2w?=
 =?us-ascii?Q?G/bsk52mRZbWEwgrPqdeojgzLVh/8GTMhqgbyVOF0wst0DEcjmck4ghtYkCc?=
 =?us-ascii?Q?eZIRpqYb0CZoaYDK90DInll/oEWQi3I9xQaUSODrv1IbX4JGHvnyey4LdCoS?=
 =?us-ascii?Q?msVoK2G0a5M4++bS5s5k88s03HPWDheiB51feSJf0AuGcrnn+24RT40NUXXb?=
 =?us-ascii?Q?xpLXtFc0x1luhnt97+hEnKUrg8Qlq/UFAYO5zRHjR8KoGn1kuPuevA9Dm4Bo?=
 =?us-ascii?Q?6N70zT8wwT44LDYTYZL6KXz/9DOya45s59zMJoL5p5XLJ5hMIIo7+NYOzwlA?=
 =?us-ascii?Q?gfBgSIO3N3RarJp3qZ71BLi6M29bIhgCuebLS2vztC6YvNvcp4cu/SZXj7i9?=
 =?us-ascii?Q?AP48+fHahMZY4bPYJQ2tofbf2W/v6NJ0A6+aEXfFaeVtxXbLHJDWGvgLBnWh?=
 =?us-ascii?Q?bdKTadUXYviHWOjGixUOAUXtNd7MD0YKtwjdVQ/j?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 614fc8ce-3403-4f5f-8e02-08dacd33f858
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 09:20:34.3672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUAVmx351ZAIgStjztlRHUwi9bUBgWPLKlOVz8ng/T/8xZnnI+Jyum/fD3NhiSan1zNAWwiTKK10f+tx4H/CVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5682
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
Cc: mchehab@kernel.org, airlied@linux.ie, tzimmermann@suse.de,
 ayaka@soulik.info, linux-kernel@vger.kernel.org, nicolas@ndufresne.ca,
 "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>, helen.koike@collabora.com,
 sakari.ailus@linux.intel.com, ezequiel@vanguardiasur.com.ar,
 jszhang@kernel.org, ribalda@chromium.org, sebastian.hesselbarth@gmail.com,
 tfiga@chromium.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Memory Traffic Reduction(MTR) is a module in Synaptics
VideoSmart platform could process lossless compression image
and cache the tile memory line.

Those modifiers only record the parameters would effort pixel
layout or memory layout. Whether physical memory page mapping
is used is not a part of format.

We would allocate the same size of memory for uncompressed
and compressed luma and chroma data, while the compressed buffer
would request two extra planes holding the metadata for
the decompression.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 include/uapi/drm/drm_fourcc.h | 75 +++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index bc056f2d537d..ca0b4ca70b36 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -407,6 +407,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
 
 /* add more to the end as needed */
 
@@ -1507,6 +1508,80 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_CLEAR(field) \
 	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
 
+/*
+ * Synaptics VideoSmart modifiers
+ *
+ * Tiles could be arranged in Groups of Tiles (GOTs), it is a small tile
+ * within a tile. GOT size and layout varies based on platform and
+ * performance concern. When the compression is applied, it is possible
+ * that we would have two tile type in the GOT, these parameters can't
+ * tell the secondary tile type.
+ *
+ * Besides, an 8 size 4 bytes arrary (32 bytes) would be need to store
+ * some compression parameters for a compression meta data plane.
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
+ * 27:24 h     log2(horizontal) of bytes, in GOTs.
+ *
+ * 31:28 v     log2(vertical) of bytes, in GOTs.
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
2.17.1

