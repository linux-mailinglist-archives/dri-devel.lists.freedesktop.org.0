Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD89614771
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 11:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864D510E352;
	Tue,  1 Nov 2022 10:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6239010E352
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 10:05:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ai+qLJ418bBfK92tlE8ed3FlPxg/bT0RsBZi0/9EmAT25WUdRmBr2YqQ4BUNdbq9Wxq9ccWUYW38eAzCoxIAuKHLf2P0hx11fi1WBy0gGOCQnQJ4Ecmma+drjiKLB/tzj1zFZ2tr/fNOC6bq3mHpwZy5HHkTBV9EiF6/prGUpB1TZ5kOlx3dZrtVnmNDuwMeEKjj3EvQQdbvpLJDHiqX/0JXrkBrHSFSjgXmRQOB4ygUnaEEnnp3FcxROaYtoJX9CRTWMNoyenfQS4ugnNReM2xpX1oQm3QIBgUoPoZ08ETMt6rMIXI6RP186vOEmdSIchjvPazqXSuGxIxxg0ANJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9nxb7J9kIIeH/n/FLXw3QUOA6jjKpMU+gpq28t8f7c=;
 b=RX4/m/EPHcDFfBzsD+/hDpMrs85s2tukbpQxgtOtzNdCd4NH3IxNksO89iQDrQysNduBbC57azv5Y/RHmA73/r7MmLYcF/FKp3qK2U5hu7WUnRQbx5le3wmNbGFsjGN/vN5NBlCR9a7nhHXRLfmnDg3hfhzmGo4ya7zRTtQmV1dWUdfjMHNx5jWY5pLnNGZxlf2k+DP56OGNZHd7dMHAutNSQKDWIVpob4mcKB0XUuqOAng8WjrmgDUrm75RzuaQOtAxT2RLty/GG/qPBE2F9dUTBJrQt7s5dROSyBraG0m8Pbr2Z5DLnaqaZ1fHGt+3nCvY1xWzZV8tELIHOSEaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9nxb7J9kIIeH/n/FLXw3QUOA6jjKpMU+gpq28t8f7c=;
 b=AqLjKQPDBAuLQjnMp101c/KvcD/0JgA9GbwaBj3oCzvK9lltmbmc2GVsqpXjIldBoV5iN1F4NF+s5X7/aqiCluzWlSjlpLcDy7EhdxpgS6TxoMtUA44iGewrql5luBEEev6SW24v9nOTuwm8GIf61KMA2a1C1hh/3cgEVFG6t7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by MW4PR03MB6362.namprd03.prod.outlook.com (2603:10b6:303:11d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 10:05:44 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%7]) with mapi id 15.20.5769.021; Tue, 1 Nov 2022
 10:05:44 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Date: Tue,  1 Nov 2022 18:04:45 +0800
Message-Id: <20221101100448.66712-2-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101100448.66712-1-randy.li@synaptics.com>
References: <20221101100448.66712-1-randy.li@synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0027.namprd07.prod.outlook.com
 (2603:10b6:510:5::32) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|MW4PR03MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d139671-500c-450a-ec53-08dabbf0a3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jEj+7Y3Vj8+4t57P7erZ0emmcL10YaMQR81CEX6bjaXd/KUYrpD5QBU8H8VMgHOn2k2fwMk225EknA1BaNKxEBTDN48+mH/Vv3CIeV627kMz5g4eaQoehGYpeU00p/hVdqXZwl+jZiRKdnk0bLikZoht/0Fy6074Phz1JZOPvaQEjo3JaVkl8CbaA/jsm3Nv+XvnzqTkkexdCXUHxoovlvlMUy23X0Bxa2cfkvbaDsnWWpUEXzqRjh3Btfyxq0zBTDWaWBFAUFQwHtopaYutUAwSjWfiACZuIxZmd3YcSOmhnxj6POsSsKrsdDz6v6Apier1N4mjR2X+jcw9AKiir/yGE0ikO98CV6nZ620a6ORZ0ndZh4FZVAXvmofYpXabVjgPAS6Ew82RPSuNs+iy1i7OfBVNNcbLAB7LiSwKEcC2hlBvimpoWQ6UIPg4bCNTgW4JgCZoLAb6+fe1bC/IxjsY4iAIi9xZzwWj5wgDHH0LVp3dK8VOwJ9k+UWh50aejX3hdj0MAxJq9Fxn76JnaZH67Icx6kPb/38Zvb1WjH8VvRZmT5kY88RWvuwf6JzibGQYkwmKrKVnt0Q0j/NSk0bDZXtXr5hVqMZ/ij87aGNCgLiWPSFDMt38y2FqkhrJNilxOLH5w1UFjaetIRH7LFZv46947KdZPPTLRuxiicoaxun+0RHo00BvvAE+GSUC67g6uGGlkav6UZR/OBtOU3DRS7k4R3t0Gl6LRS6im5o7WH3jQxI0z8ry78cDmkekxgWeGhIihloBU31YtvN8HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199015)(36756003)(478600001)(86362001)(6486002)(6506007)(66946007)(316002)(6916009)(66476007)(66556008)(107886003)(4326008)(8676002)(52116002)(6512007)(83380400001)(8936002)(5660300002)(26005)(41300700001)(1076003)(2906002)(186003)(7416002)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZRA+wg+qNdfaCqGyrazCW4B+XW33eSqHkdnPDSoDWOyowMnvpY3JVw786DaX?=
 =?us-ascii?Q?3zeec5rxBo5gNvIFomgxhW+WLR4afqJeleCHMggiPZsh5VbUV47+XSvvJjxn?=
 =?us-ascii?Q?1gLHvGRGgWx0dc8Wqi2TNpteOsV9aoZhYBxKb47PqMD6NjMU9xLz6jkW95kJ?=
 =?us-ascii?Q?3PjThxL4a8aC82krQevTKRth1fpfVnRnEPR3E7qlOLG07V0p55tskf+6ahGx?=
 =?us-ascii?Q?sPbmwAOocyLEpkTpytBUFrbBuZkRPzwpsuQLG6nTujFRe7JOoUv4erVoycTz?=
 =?us-ascii?Q?S63Xz52CMALwrc7D/l6UTPBmaWFazex75SINLjPw458N2C16jLfc32xn8keM?=
 =?us-ascii?Q?UtYM+GLwQCDxShoWEwgid/rStMBJQ43voObT9/3xcMUSKQy7GWnaGZiEysvJ?=
 =?us-ascii?Q?/SEkupKOL93Qr0JBdFsxNQkRwYh8f7H9PNKeNnScChz+cCzkFz1L0ioz6o7v?=
 =?us-ascii?Q?XXkzcVenRkZINbrTalDZqcNpRmVxCBN+WjUXqx11NQFgOcDwmSdOk3zpuOH2?=
 =?us-ascii?Q?tnQMOobsZ1YKFtKCySi9wufysav7Q18di6MLls+y7AiHmH2qTQe3PR5j4/Qw?=
 =?us-ascii?Q?oB6GU0i7imeWhscGBgE7+6xywlEzoqrkRZkBDt0o9NfTcN5N1VBeefNgFmbP?=
 =?us-ascii?Q?zoPKqZUo2RNu1RojTnMh9pMnBN2cZg2rB429a7A1MFiIgBH0FnJshHwRIbEg?=
 =?us-ascii?Q?HOFTPcsz/2SeX0Q2hxKQwd6nWhFFmnJexxaZfOT4Lh6bJcaJYFWz/s23pGBW?=
 =?us-ascii?Q?7QQCjjL0NYXlpVMPgBUjD5D+lJyjpm3FchAOkKswSWAy314jqMsE7gaBCzpN?=
 =?us-ascii?Q?wAJ1l0JBiuirOHzkDxNh+GP8hLNu/OTdOO54C8xN+bi42dEQcciCsgmLGcLx?=
 =?us-ascii?Q?jJ+GJncl3b7hv8TfX//XWuBK9e4RWznNBg0p6pKjeT9B7sb3WZcsl9hEEa55?=
 =?us-ascii?Q?DPI+TzEpwtgF/3Afld4tJQ9V8K1Djyze9jbUq0JHJwl79iyPpIt1psKDPCg+?=
 =?us-ascii?Q?ZqTsSTV41oDKHRNz37fzNdcYHw9PgDl1+4IuYyiXw/Tilt4NSPgb+hmeO0Oz?=
 =?us-ascii?Q?qJgazxX20j3Fsvb9zC0ej0VSSTM5Et/CBvuqtHxsFLhsIbIave+Nx0gmfWRx?=
 =?us-ascii?Q?4qtZf/fKZcqtn/KV/oNYMR75bK+cNwEfJhOifyk0jtzNurz4jSlhtI51pW4g?=
 =?us-ascii?Q?dF/DUZHmjmqq/F7JRyKKqjemHrkCCjF/rgUcNSvBo0aYyVXU9G38wLFXIajT?=
 =?us-ascii?Q?W8+4ARKyaJr8wJ1H1RBNvtRV6eQU2NE0AL1f3F/PCPfUnUpwMmfR/JjYf0C+?=
 =?us-ascii?Q?WnFZv+T4VRVNXY6Pmc+JRFrB8TWR14uD49+CkprXK5S1tOtSIxc936O9B47P?=
 =?us-ascii?Q?j3cTVGJLHwtuE5LQIS3TW9ma3++FNnNSULb5u+OZ4NSeicZtqrQlvzPBjN/0?=
 =?us-ascii?Q?GW/ImC5ZBaICuQsVH8qkMidP7dymu3xnJgMg0tEPbFZ3pVr2PETOpu+1XOwN?=
 =?us-ascii?Q?fjS7LN1epFhLSwFKRxgIffH2xXywUxZO7+tQ5ro8EZq17oDC/I/oVPTV82Fr?=
 =?us-ascii?Q?Cgg1TF2qT5Y5ETQN2yYWLhm8JRlpXtref91uISbt?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d139671-500c-450a-ec53-08dabbf0a3ed
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 10:05:44.6762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yx6kkHrimI0GAGaJG9yd98bomMimIRV+blXBKrtx1eZR0rnm5j70CsnWopbiLZZIg1GtXpStCU+3l+W+lhXJsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6362
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
Cc: mchehab@kernel.org, sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org, nicolas@ndufresne.ca,
 "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>, helen.koike@collabora.com,
 sakari.ailus@linux.intel.com, ezequiel@vanguardiasur.com.ar,
 jszhang@kernel.org, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
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

