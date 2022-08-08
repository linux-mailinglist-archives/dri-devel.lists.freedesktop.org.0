Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A74758CC2F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 18:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A965D10F5CD;
	Mon,  8 Aug 2022 16:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5D910EC7F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 16:28:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbC00M3T8+E4RiyzSLl6WeAJZVLADEa8kK5Uy+hZ3KMIIbJwYGFJQ05AVLGEFkxl6oLhd7fiV7jJM18SeAS6DjEV85ezjWXzxbNtTQP68+bEBklQJdEWPXvIf2JH54kIHTGm2QbBr5EmYqFkYGlYeCy12GcAE93ysslQeY2RVcIgCZNY5ebKCP+UyN/gIlwxmbItowxnDu57aCyWbW1OhVDWZVEociAAEsKTy1I9KuPCwMOAiKyXPi4u1XmRqEO0AvGo8bH0ueoVztcNcA/ukxWC7t5TohYGO+glVcFKJdKTnDpJHGE38FHN54dND0ntk3Kfz0Uvuj96Be6wS7ka3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NLlNYzcOWnRZfC3MTQkb6Nd4TC1RC3rZ25YCxbh3gY=;
 b=ZcuWKw3rU+EXGCk5dbmlfo2XVuu1e3vW06QwE0V5LyEeCAla4wZ+Iq8/CqGF/4AL7ERVGTaKAB84FvLoHPVkLYoPEzFPmtg5XRoPV6TMb/gQFRrTVnzas+/WunOpCtUGR0cIXdeJin2cwWG+eBqdD8LpIisNeKPlaRIYI/zVfpx8LORbeWAmkDnRjb1ew87UV+zg6PB7KngXotepsBW0uVDv9xKPr2qEJ7638fnLaM8JC8moTKz9yKmJHsJHY97Eeul6jCYlWTHDtUVymuHSACR1D0R49ZOb4SF4eFy15+I/p851EDCdB4ZL/VWfm08B/w2or1q+0vgTCb2YDVqLhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NLlNYzcOWnRZfC3MTQkb6Nd4TC1RC3rZ25YCxbh3gY=;
 b=aQ74Qv7iPe/S0wCipgAam0R5OaDofDBDIbonsTAqYqqbFlkRLqbeo7wM++2sAmwMEsOSkXETRLoxjDkUv1BYlptBamauq1riFQqxlNBh1RMHAOxu1/PzqMNqUBpXq7PM9NGbA2JBBtkLF7ZfNOmnYLj8sm9o0HZRntWx6UrKVrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BY5PR03MB5153.namprd03.prod.outlook.com (2603:10b6:a03:22c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Mon, 8 Aug
 2022 16:28:36 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::c832:eea0:1883:a19c%3]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 16:28:36 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
Date: Tue,  9 Aug 2022 00:27:49 +0800
Message-Id: <20220808162750.828001-2-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808162750.828001-1-randy.li@synaptics.com>
References: <20220808162750.828001-1-randy.li@synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a0827cf-1a81-4329-446e-08da795b0ab4
X-MS-TrafficTypeDiagnostic: BY5PR03MB5153:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3X4pZcfruFwZwdkPpghaqXL4XNzPZ0M99AlpP92wkuu1Iv2Yy/PQzYTqHnJkjziApRNpKHpWK8rklUd0z8nYyGxjr+O9GTeWcR9s4OWHNhkn/a0ZuDB8FisjWpUMRqmhwtxDgwUYPBk0XdSW4aa6pjYmDJF6EOel4MHbJiXdxunua+EiLnvpR+oVKLhtepGxZh+MIpmgGbgpBUqRauo5R51vKB9y33RBGIU+eg2sk9QftNKobGo379xMNYY1Ij5elPQ0f/EDW2uyW9xX4q8VnKI3MhfyYJdhZIszskFv/OXKhkbV1Igp6KAHIiZTdS9F/uC9WPZEAarNpvTxUWph4xWtixMICzPSQiqYf/mKXHTPNOVoHyLtjgszAiDhqW2iKFflB0jisEYuLylTHqAKcb5q1o8Q43O44BMUelDWuizEUQ6GL+EQkhrqpwg2zzo1LjXqcU4CrG0dnv0jPC14I90hAOodi2rzJmpi5Svi3qgqitdwrf5ja9rQ1ux1OKtO1GQhYu8ZzwjlqJP6iy6tAvDwRZOeZuVGj+6Lo+eNa9CQzk9g2eRPDJsPCcslErUIAd8s0ulSg5iG5Yig28kQIzB0aFm4CPJ/5a7BCzGYpqFljy8BNWWN7cGkOyvjP8a5hjRTesPx0ag153s4doV6fsD5KdSObIBI10lhX/JMRvQqCClNfkZkxJSeFQeM83awr4TtvJGxGzzaBxeua230b1torWb3KdOonvJV0hpUSPwpNaNi5WHKvoGoibZ63eGLO/TUnEALap+ZGpljEdrxElEFudovSSRUJpCiTsV9SJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(346002)(39850400004)(396003)(66556008)(36756003)(86362001)(6916009)(66946007)(66476007)(8676002)(4326008)(5660300002)(6486002)(8936002)(478600001)(316002)(38100700002)(107886003)(38350700002)(6666004)(41300700001)(6506007)(52116002)(2906002)(7416002)(1076003)(26005)(2616005)(83380400001)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U2cqyR5ebcI3OgO1/pWRI9G0ZKasxinWYhCC4uMj8zPWGCcKmvU4qBRpXCLm?=
 =?us-ascii?Q?Sw6U1yIdmK99tI9IcYv+zJNd+hKoMLLgV3dQLpoC2/r3sQYAFLzODqd/3SMh?=
 =?us-ascii?Q?HPQXKYy/I8ffYysihS9E8jnsqnBf5Oy+7gBaT0xkKhFRK3DX4fV2q0R2Pk7Z?=
 =?us-ascii?Q?h1c7gW7lWIg3zPBlWVQ5LtzC5QrFWNv6ri5uNuw3Jwt6N7oYDwzulkPXb+CR?=
 =?us-ascii?Q?EdusXS+F0H+haXjliJFHFQp/pCh0EtfOyWSxgzxEzunyHcOFus9RKt7alQ8k?=
 =?us-ascii?Q?QpPBAbpfWWzEVxwdmoYupDUsoylSf9LdhltIYAvaBQ+J4JkyD4Xv9PRaEN6L?=
 =?us-ascii?Q?hhdGn8fmXs0TuMEHs/OxM7LMksRO1gxK5EaTvlrXIRqwWlZCRWxm2OrCrO4V?=
 =?us-ascii?Q?8bR1QhBlF9oB2Rtj0nvAnUxxS3EXAeEeBG1UC7QyAuVIJ6pN6HDq6AQkwsFI?=
 =?us-ascii?Q?UTuXQeTuPP9ktVEb3KtIkYbxEIs33JBovMd78vevbx6ZB2MCBSKPz6JwYWPU?=
 =?us-ascii?Q?ajueAq7OXPtVtuvGbqKtbSIZm7TUihvwSILyWhF3g7SwDjoyiNNPVLMjUKre?=
 =?us-ascii?Q?2EWZdNW62OgLirlM8Q4IRB2anZhy1jtlF8yX0wpduLBmRgDCiSmvmGGcwtDP?=
 =?us-ascii?Q?VYZF7R7n4dTC2xBPNlGGDe2iq3cgSVYkcwHi9hjhqY6mzNS24k+1bhpffYdQ?=
 =?us-ascii?Q?vcb98hsOrHfx7G8J4vH+kIzlIMZ4RefUKU+Fe4vINw+H5ZhkdSxgLx5ngcAx?=
 =?us-ascii?Q?ZUAfjoyK+jfojASh0qUA0OFmRzMHXhNoEkfocLOmzY2+r6HK/JqspICt7OE/?=
 =?us-ascii?Q?h61duKSzApXqgqkgf/aE3czETqdfmGdS0UIbDu8K/KS+ktrquk40uxy5bmXK?=
 =?us-ascii?Q?iVEonrTMogLzT/UyEIubEd7mqNNKEQGEI7drQAhUR3BJOo/rQ3CSiPnOc2ND?=
 =?us-ascii?Q?hHsawJLCyq4VkuMrY4b4k/4WlcmRlpkFTs3xWB5gTI2sU0kD+jtsXKe20t+6?=
 =?us-ascii?Q?doh3QNXe8pcFJE0iwRHNw8bVyXYlxG3ma2fEqXEoCj2+bpgzWRULoL8qEpSe?=
 =?us-ascii?Q?iS8ZAJQwgZ1KI52BEdYeIumdcgB6+FLwFBKHVdmiBlNvHDlsKwfWJbEZcZ8g?=
 =?us-ascii?Q?mkWy6N2VjqvZIOjx6VTtSOsYUWJ45N+u1YOlXmvk0EHJtxmf0ZJYOxyv6of7?=
 =?us-ascii?Q?Exu8W+PDKCVhvOviSy80IYrIWco/EP3cf47VG5RTX26FB/wmqxK3HVZCVUPT?=
 =?us-ascii?Q?q2uC710EEiWedN4c9hi6ZQOSoE+HuGCeEF6GKpJQfLc+BfG4hTRuf0PWf3xS?=
 =?us-ascii?Q?Osr3rLi7e36xCrkdCYyDXCzEs9XAuYyWeDxLw4AJEblI003Dno7A4B6ET6+h?=
 =?us-ascii?Q?SfuCH5UXBLenYR3Qh5NNs8cZnmuGLle4JiAyCUiqSuzpGFPxnR0rPAiOmZZw?=
 =?us-ascii?Q?s6tq8QBx/YNI82PYgg9mWFO2lO+ouTD22Ta9GJgXvj7sV0hvitGjBkbxvpoc?=
 =?us-ascii?Q?ah1iK7FZG1yuqKFKtX7S6d8LtVWnFucb/Fn87iE4JHuai+8/keFpqGUvjSDh?=
 =?us-ascii?Q?bDue/Vp69GesIgkB2G8qesZ7+EEGbvwbmyicy6iN?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0827cf-1a81-4329-446e-08da795b0ab4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 16:28:36.0223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX/O/oY+M0HCMv+gv6T9KL8+I1oLXh1m5exmJop+2fhBaA+lg/Lhgue1cbajrq9pmTN/hncZ73UdZq5D9Ik1Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5153
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
Cc: linux-arm-kernel@lists.infradead.org, tfiga@chromium.org,
 tzimmermann@suse.de, sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 sakari.ailus@linux.intel.com, "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>,
 laurent.pinchart@ideasonboard.com, ribalda@chromium.org,
 hverkuil-cisco@xs4all.nl, mchehab@kernel.org, jszhang@kernel.org,
 ezequiel@vanguardiasur.com.ar
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

The reason why we need to allocate the same size of memory for
the compressed frame:
1. The compression ratio is not fixed and differnt platforms could
use a different compression protocol. These protocols are complete
vendor proprietaries, the other device won't be able to use them.
It is not necessary to define the version of them here.

2. Video codec could discard the compression attribute when the
intra block copy applied to this frame. It would waste lots of
time on re-allocation.

I am wondering if it is better to add an addtional plane property to
describe whether the current framebuffer is compressed?
While the compression flag is still a part of format modifier,
because it would have two extra meta data planes in the compression
version.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 include/uapi/drm/drm_fourcc.h | 49 +++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 0206f812c569..b67884e8bc69 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -381,6 +381,7 @@ extern "C" {
 #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
 #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
 #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
+#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
 
 /* add more to the end as needed */
 
@@ -1452,6 +1453,54 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define AMD_FMT_MOD_CLEAR(field) \
 	(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
 
+/*
+ * Synaptics VideoSmart modifiers
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
+ * 35:20 -     Reserved for future use.  Must be zero.
+ *
+ * 36:36 c     Compression flag.
+ *
+ * 55:37 -     Reserved for future use.  Must be zero.
+ *
+ */
+
+#define DRM_FORMAT_MOD_SYNA_V4_TILED		fourcc_mod_code(SYNAPTICS, 1)
+
+#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, c) \
+	fourcc_mod_code(SYNAPTICS, (((f) & 0xff) | \
+				 (((m) & 0xff) << 8) | \
+				 (((p) & 0xf) << 16) | \
+				 (((c) & 0x1) << 36)))
+
+#define DRM_FORMAT_MOD_SYNA_V4H1 \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0)
+
+#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0)
+
+#define DRM_FORMAT_MOD_SYNA_V4H1_COMPRESSED \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1)
+
+#define DRM_FORMAT_MOD_SYNA_V4H3P8_COMPRESSED \
+	DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.17.1

