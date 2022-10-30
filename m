Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D67612BD0
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 18:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA8D10E10E;
	Sun, 30 Oct 2022 17:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D50A10E10C
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 17:19:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EPDi6P0yNNq5tEcaiJnZ6bHPOdoMR2d1qj4hSIWROPb2SX5pFsyFbZI9T57PTYkwlNF0/sDblfIG8k3Gw/7QUfXAa3nXkNVM7MBU5Fxc5xeN5vODefEd5zkTE4Vs9kS6hlpukIYZhVafXbJvPUESBIhNiR6ksARnzTlbwL/w5PqQM2Nf59v7XmvW5Hr2V6HkHmRvwwpMQ1TcOsOnkvHNPIr5LRuKB7ClLEhkBjdBQA18DPOfIG07ICDA8jmoRNMi+b/wpvyM9GukpvBol6Nungdm0Aof6TBgM0in6O23oUztjbOFHFdm9LQrLqgKSEI+7YTJoMxQizjXevWz7k8RFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ra/82IXfTj/xJPXlX8W3UboVngRt8xJLGHsw4zY0qQ4=;
 b=fLo440TGGfOrifDEf/hPOp+8ZztF1KRaDGEzmc0tqzuPo/bmOSkf71RjnvHgEzxFGdpy3oui+ajsOTiBUfcoUAV7ACS3Y17okTy7YwBxQvdHmeU043dIAi5qi5PrhgiWZoQVryApXS0VYrY+xBroOwEBwlncV4rjB+/brFrBjdnUjgIPDPbXkUHYnZpXJqFBLd08g7VfOctnfawtRcfcU81J0Ax8G5nukWrVfr5+LlA5KMzqJwJojRnMiSl3+XuUy4+fC4ZZIx8HAqCDHS7h+AmqWFqsOdw8vn2bkxkqXHMb8I8To1ChURqDh0VBNOhSVaPf2TEsttTxuIjTxQdOxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ra/82IXfTj/xJPXlX8W3UboVngRt8xJLGHsw4zY0qQ4=;
 b=V8g0IfOUDFz2NNyXN7mTLwS9yFdd0qHT6REuJ7EfYmJAfbDOExPGfZ2YvVW2vyf1dgZjYhXqnklUA/YkUA5AEr+sxMp9tPEfiINDE3CSOPvxUkZw4AuA7mJ4+Le5+d9copQGSonQSi9eCroJ035Wp8TJrjDAzBTZF/wiA5xgq0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by CH0PR03MB6113.namprd03.prod.outlook.com (2603:10b6:610:b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sun, 30 Oct
 2022 17:19:28 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%6]) with mapi id 15.20.5769.019; Sun, 30 Oct 2022
 17:19:27 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Date: Mon, 31 Oct 2022 01:18:06 +0800
Message-Id: <20221030171807.55837-2-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030171807.55837-1-randy.li@synaptics.com>
References: <20221030171807.55837-1-randy.li@synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|CH0PR03MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 040d62d7-e54d-468e-0462-08daba9ae617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ML+bfyd/8K01Fcr+clqaIOr/T8qSwF5+Zf35KFnFD5cbnzrj9ZqOcF34wtBDS+muBddbo7NBd0/WEdurO21E3fLEbvy7vACvwhjT5At/ZcloFrN6V4TBqTNCvmJ+CFPP1EpxF60Ko1/7hbO6jTPExkWXc2H3VwqQo2aLZY+v/h6l1xF+6hE98bt1ejH1FmGnWJVW2+I+7ISrLBP6KOo/ABTvYTe6QEomJ6+K67DTRUYhXG6RjSdM525DFlUZDrMhABt4GVNxoHKfnDEk9MF6sV6AjyxjznMw80xhxS+C7yLAabKyWq9xG67SJpFEW+mPV+JWNvCXuPGS9k9msKyde4C1vVMfAdb40V/mZ27SdWhIyreA6yAvWvovZ48mUoIuhJa46xI65bLL+5vX2DlhFnWJMMM/MPQMdkCk/GmlVDMFo8AlgHWXhB0QbZf1MGNEOlM2D0IbZjhR1iDI57sUv++7xTxQUmz1CrQ3Ab+CkbGgiy7r2TCazQd995K/BhCCNSe6pa+AEnPQ8Q3WrQZWp1uTDVQqSta/iM++cR85ufFwHEgv9HA4UL5A9NUFEXegVRTTOv9WBbXVYqQ6rncpY+OxGSbKwxpiwnK3n2G56Z/YeCXMxsETDCbkqwaErXmR3s52D77n2EVxMck12G50Z0d1B5OCLYPug14A7r1sYHQV9GyLm2tIGR879H9FPA1hdAKr8S1mBWJJQWcTdyzOBIA1Srrl37hJNM6R7Ge6XqfhjxrqPXlLMyD+BBL6dOm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199015)(38350700002)(38100700002)(36756003)(8676002)(83380400001)(66946007)(66556008)(4326008)(66476007)(316002)(2906002)(41300700001)(86362001)(2616005)(6916009)(5660300002)(7416002)(8936002)(186003)(1076003)(6486002)(478600001)(6512007)(26005)(52116002)(6506007)(107886003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dkRI0YFZUH9Y5p9eZE/BSENwwxCPDC5G/i9aDQHG9uhLZOAhHZ1Vmb+GUwT0?=
 =?us-ascii?Q?MCPZIMcHQltPD5MZ9btsic/8xfXBEOp6+sdSrEEOfd2KAr1Pnow7dV2Y+XkC?=
 =?us-ascii?Q?1WU9p1lGrsPLluVzYabj8sZeRn9vUoykj/tpLicdHqgk8x2d+qXqF+YMVt6V?=
 =?us-ascii?Q?yKRvbkk/7nK9Y85SdghHJ2+iNR2ynJBds7lvSNBqcY915srAEqBzFsElIxqK?=
 =?us-ascii?Q?K0UtZsxNmLglLUr1dL8kLfFvxxhG2yHTYS0fZd+AjqaOqjkb5PQJT2kdnVdS?=
 =?us-ascii?Q?d7pzE4gPkdzoSuaTMTo898oMEwRcFVRmshMw6WBEd+JSOA2R84V3AZSRS3gf?=
 =?us-ascii?Q?oDVFOu9xGPxjaMXvIH5QfqLWr5iWRq7L/crjT6tXKegMuFdyRUTezX3YNAwD?=
 =?us-ascii?Q?UNgZUor+w5p4W4tR+UOQFMFG6vROjf2qMT58akSPaScMBbcIC4Qa0/03OFr/?=
 =?us-ascii?Q?sNZCnuiRYqVng/UuRrOCGvlzNUmOmyYzxMuhFZEVlIITXox5LNWvqpjZwPnk?=
 =?us-ascii?Q?IF1tDoOaUVgYpXEZ5HXQd+qRrxEMZ8I9hrS75OVHb2rzF48hTXinJHv/De72?=
 =?us-ascii?Q?S9Di45W60pK6cn3CzH8/0EGikM9QFs8jz0kk7WHVHHjS6xs0bRXkJHG6Xnw5?=
 =?us-ascii?Q?6hDdOSDBA1dEYMrIkb+f2qq7RxfusduQ+qVIurkzmIebLIaWpL9ML0duN8yi?=
 =?us-ascii?Q?ubKSLE78zA9nPWIbYZ2HySpbHtOxheB+O5VQubimXgK+HFI8vh9iZ7LWE2M+?=
 =?us-ascii?Q?MeOp6ehPnxt4fDHdIIYosuUob/pj2qxVxh1SIbv5QRcBqcYSXfdfv4mMeK4z?=
 =?us-ascii?Q?ZGQQjkkCOHYZnIROIHKxXiVDrVzHCeGfuxy0O/et5wz2gxHzglJQxyBHQVNF?=
 =?us-ascii?Q?zzB5f325MrrBW27OT9fJkktGmBb4m9+ZJpBmtymZBwrzCBtFV90dpR9AcLpJ?=
 =?us-ascii?Q?b/62e2zJYRlM9Wysx26P2cSwVDtQeDCQDuI2b3fjU2+rYN9blDPnV/wXubp5?=
 =?us-ascii?Q?YTQI+idFoDzOm6W1hEnLZ8pfRYx9LdrsjUg6n87j5OS3uWx/OHM/wodbsOdw?=
 =?us-ascii?Q?w3R9bsb5uSAooAlDtFtM0Tao6Ns/RG+5wNUuK+Ox+qMRbIPFrfWPiC4B+iPT?=
 =?us-ascii?Q?ceg2qAK/d8/nwdDkBuXStVGdIrYd5+fNvYvakkwJ+8/QktX6PUQnVSCMgvGa?=
 =?us-ascii?Q?LVRRj28wNGeUR2lcG/WKlSog25yKT3uwOB11A62FuPkIscrkueRBu+05q8Vb?=
 =?us-ascii?Q?r9fll+bFoszZk16VqCH3zBwgfeRzusA4Efztgc1yDYZc+vvXo7zt4Us388Rw?=
 =?us-ascii?Q?BMGPzxwGnY3ltMg3JDPguFu4+joyzFrgq2b3aMHGmXadlKzAIQbGb6r6NAPs?=
 =?us-ascii?Q?22zy52cVkS0ROravOs/VTV7fXy7zXRthyDyR1I9+oczMBiL64VPRGy7CDW5T?=
 =?us-ascii?Q?z8n2TdT5YPK+AXxunCQjfNUKvUclYqYqMd0gsjmioMKu3sQEF5ayhYcBRD1A?=
 =?us-ascii?Q?yUSK2Fv3/vTAp6xIkBEhc+vujOXriVH9ilQ8WzIBG3HHDnn4nAl+guE9lReB?=
 =?us-ascii?Q?iblUljVELHEA6hUcIKzYA22qIJaJ5hGvApsxto49?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 040d62d7-e54d-468e-0462-08daba9ae617
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2022 17:19:27.8406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsNvxx0fyN5HxqTVW5agweuB+T9nDJnCV4X0GuOqbF9P85v7fRgQ6nP0D2KwAvvyqNGgym4L3GtVsrr571MdOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6113
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
Cc: linux-arm-kernel@lists.infradead.org, nicolas@ndufresne.ca,
 tfiga@chromium.org, laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
 "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>, helen.koike@collabora.com,
 ezequiel@vanguardiasur.com.ar, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, linux-media@vger.kernel.org
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
index bc056f2d537d..4b587a4694f7 100644
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
+	fourcc_mod_code(SYNAPTICS, (((f) & 0xff) | \
+				 (((m) & 0xff) << 8) | \
+				 (((p) & 0xf) << 16) | \
+				 (((g) & 0x1) << 16) | \
+				 (((h) & 0xf) << 24) | \
+				 (((v) & 0xf) << 28) | \
+				 (((c) & 0x1) << 36)))
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

