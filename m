Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8635CAF837C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EC210E913;
	Thu,  3 Jul 2025 22:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g1/pzttx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B9510E90F;
 Thu,  3 Jul 2025 22:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UA+h/dtZzgfFOso6/NQo8CCExh5lDrIE+/0yRTz9A26M1pII1cKYKGRCZVbGMjGlN/J9XdGnyDWCyj2ac4CAd7W2Zmcpc3FlnmK9lBemtSGgr2DnUJgFtLWOjwkwUzrcTMAeYSsmH7oLFhHnbfaZkzUe3XZooofWepuEx5ber3vH3ltvvNaCSogPWSB3PzeP1Vsa0HErpXnxL9/4mX0SOIIFzhilvoLbkJWyPqqCXmSyap0OmZJ0XVVuSNwUtpqTQXSaQcIW4N62aDrIbmGSfrsktqTMl80awk5Y1OYcLnvEHP53m5z+7Fubs3BGZpsPoH8GDwh8EOI0E92629slkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r06+YJyeU0gG5TunywdwAE2gaUIMtlRzu/HMWv/h8+I=;
 b=P+x9Xd48TXJfTru4UXkGEgaemGjt0pWF3KnpHX6F5/jVeh+cHOqVvNHWvvwWVc9tBhhpRJHBMccOThexiBJ8jNQrPXkfRh9nBTP4zKrynI4ryqbGdLAY096R12vkIm0W+ygca9G37x9948xD77SDbmQidLP7Gsj7KgW86xbWzdLYbvJfbhvJ0K5dLYfSgHqNeU7YhyYZY9i9mFIdNL62+ILD54XG9dbPTOCyzT/g8jY4yUYe4fGs0RpTMwHAS4LvxUcVhLwJUGszb4NrlSrZQZHUj2qaMfwVoe2CqmKyz9uW4dfaj2FxDeMM6zAMKJWHmRIF1aI/EL+nBcl3dWNfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r06+YJyeU0gG5TunywdwAE2gaUIMtlRzu/HMWv/h8+I=;
 b=g1/pzttx2mhTs8EXDA76ql3Fl/5YgB/6PiaYQcXYzUqdxb8syze+Bm9BxIC4+EDsyPwZuqeqnhELPPu56dAUDgk9ZJF1Gm8OkJEahAgqYVbpChmQBBSBwll11yZ/8k7+zkTtlPp7os3cYNaLNgRM4BiL1fs5f/bMz2jrt0wn+sDWyYU+ZIN3b/j7p1g774n1WYfiTgY+mWszoIXoJrYpf41dN1m7mzY+w5PtG4noJbqY0Q0TLaHV2QI5iF5K/PE1mmRH3U8oTZm7I8Y5BgKDfTu04Zyp82x2bK3rWnhAtwYED2KEg+7CmTx+jqI+6QNlWuQ9PsuSXrctbRlSjQ8YHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 22:34:50 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 22:34:50 +0000
From: James Jones <jajones@nvidia.com>
To: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 James Jones <jajones@nvidia.com>
Subject: [RFC  4/4] drm: define NVIDIA DRM format modifiers for GB20x
Date: Thu,  3 Jul 2025 15:36:58 -0700
Message-ID: <20250703223658.1457-5-jajones@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703223658.1457-1-jajones@nvidia.com>
References: <20250703223658.1457-1-jajones@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH2PEPF0000384C.namprd17.prod.outlook.com
 (2603:10b6:518:1::70) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 16711a1c-292c-4ad1-afad-08ddba81d210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ooh0HN1Xwy7wmyjOuZaXZzglk3m1eHsq3LrGMf8eEVvO+va+2ujvyU64k2eF?=
 =?us-ascii?Q?/iYJoihSwA7zRk8zWNqNkGEUhECJg2NvCfK5XXUHH8j8xkjP+yhxxAGLX9IX?=
 =?us-ascii?Q?UfzIHDZ5ieh+u6fpC6sIlnmj1RRBwBrmGhgiEmBLGKIS4MGdKqw3HhNHRkq/?=
 =?us-ascii?Q?c9D3wne2sH4itobCa7nCJ5S3F/dcoSbEB+sMK6CtzJdSRNBGXWvuzi7FMErx?=
 =?us-ascii?Q?K2Q6T/aGs0AHW8tFLpqnGiQyVKhX1tGALl2KNeBXLqnGdZAHPNEcCXYsX/cr?=
 =?us-ascii?Q?pFkHLKcydvNkSePFEneWxWCoQ3l7oYHp9bevg+CtshkaDFxH364KGmUukSzQ?=
 =?us-ascii?Q?gA0O01EHgrB4ywsqVyzUY7Kie7tkrvLYoonUT402/YjNJ/PNU6dsLEAxrAxR?=
 =?us-ascii?Q?S7lwc/RY/rhPlwnfOQt6Ug/hc+xmrfaZrzrJVRhYiCuJBvNI4U9w4IVxuLzR?=
 =?us-ascii?Q?uG5ncuifzqnDqxV3HT5zOHYvhqD26dKGkJgZd6zazOoDWRYWczm0ye5a2oBP?=
 =?us-ascii?Q?MAyyoMDyPWzsBXOuP2dbiuYkdy+6CaD+SUntp4PzujpSC5DBbcz8CijYOt/Y?=
 =?us-ascii?Q?vSOtkgg+XGzp/w71iShXW95MZVkYvufdbzz9nwlwOXit1DYYisbPWT53TpDb?=
 =?us-ascii?Q?bREUQD9oGCfC2yqBq4pO1gGs7dwYkj+oG2kSLM26Nbuzvm5sPzfPzpIo2ULF?=
 =?us-ascii?Q?cbXHtZX3UNrHia1oqnypkqlaEz4tbDzW1qW61FtCCP2hP1ZtJ4k89Bf4NNI7?=
 =?us-ascii?Q?7uI4e5G1LXMmL8DaLveciGWCujnlR7lkceAjTKVgJQ4TUaN8nkpJrHyp3xgB?=
 =?us-ascii?Q?82v5Lj/dwaCCe+GRwz87XczCKg5s+18BSeRJAnS9836xwsnrMMAJUff4GCZz?=
 =?us-ascii?Q?p6vLGzXSXdIN2/N00E2pxbRMEDv5efEcfukLDXPFK64NQXtJs7y5AwAYnays?=
 =?us-ascii?Q?Nsnr9TpNRvDwoRXYpSZN+xlPTSR2PRIanv8PKNoVEYJQ5VdY8kUXVzakmEPE?=
 =?us-ascii?Q?bSGP9tBk061ufcuzxWj+Jhf9Rz818x7xK/Esh+mlIXmU9lMgafqxI8wfg1H+?=
 =?us-ascii?Q?SJ7zYUWTjHP7XWRaNIaNQOeTFv0/WsALZz4sa3ffWVfalGxUU4HPBiPYwMfV?=
 =?us-ascii?Q?awubZnCdorllJIeGu/3URG8eeN9j8ydGXAAvmGJKvnuimlaFMrcX5oMA7iGr?=
 =?us-ascii?Q?s7h/aWcKBUH2XOdIXKgjoqqLkjLtv62bcy7mn1K8FTH4A/blOnoramZdMilk?=
 =?us-ascii?Q?aBNQMB/Le5aS2xtOQ/BnNRt8ESjYjmhQSfTw0z1AnPWdW+cN23jINBSh9cvj?=
 =?us-ascii?Q?GOtrjTR3Yfn1Is0j4s+7y9lwk1lkvbEJxL4DTIj0OZTtrHfKesLCIjwzfFJs?=
 =?us-ascii?Q?TdO49/7ebKNJAAwj1vwQEAyrpMYQPIN7r1qZSUPWsM22ad6meg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dSQST6Amyi2/H3pSZM9+8wvkRVQkud6onRjMs1Y0Ozv4Yo8lj1nrGfwbM28f?=
 =?us-ascii?Q?y3esZh+whkTeUdM7U0pqAzYAqV6N2mSY7il+6V29TpQEt2l5r9t+NtQFgTIH?=
 =?us-ascii?Q?kuF2dk+eWG7MJ/KZif9uCewX30GwdvSWGDIwDLqwAwlu9cWjD1yre6AFynRw?=
 =?us-ascii?Q?04jOjX2W9vnq84/4khRC2foAJ1G7wmBGI1Ciu7gDwNGir37uNfhLiTLUK3KT?=
 =?us-ascii?Q?gnPq2TmaOnImlH4McUYJM7rsmWgCL30xYVF/yOUEZaaxO/pKyeLpnKXVdk+v?=
 =?us-ascii?Q?d4sRjT8dr6TaKvYgXruhcKKcUV5WifQYcHWX9tzOjrECHq2IZk+O5jbMdeoD?=
 =?us-ascii?Q?6ZFD4On6LTAFoErOcqTn163dVc1wkShkCqlqDxlejCKLc/JwQ1AYCef8k3cw?=
 =?us-ascii?Q?3Il7KmWuo/qEOEid+L6RaZDHc/9JwFwjeOT6pJxeut8aelqcvCYallNUbkda?=
 =?us-ascii?Q?/hJt32WGPkcujRbDy0ROelJ7GVvdJ6dM7nriBLr+4RM8TuiH2Soj/bMzG+It?=
 =?us-ascii?Q?ehqMS4ejZJK73DKLKAor0Tzxb9Mjk3EhK41YzTueBcO8N3NwyCPyjvrWzHFs?=
 =?us-ascii?Q?irdK8f32O6etxaLgv1kUnuh0UrAAGiNYpgvOPApf0HZ3vUr9C7wUbHDno7t9?=
 =?us-ascii?Q?CkfHNYzNBOCuioavIPC9CLBpgr3lYzvVtCBS8X8gdKk+tzBRiiQbHvJaxvH+?=
 =?us-ascii?Q?g3/IJ0HFTrwFt3Q9MssPekSkttmE+OmUNPal8anTo9nEIj67jZ93ajZ3LZok?=
 =?us-ascii?Q?7Jpl1tvYjexzpKavJvUw333UIcgy7ha/GMlCinXHqvB6kVgBJXnHYI4hRIcj?=
 =?us-ascii?Q?n48bIIkShX/XnZku3us6D2RSZfOb9DvMJqYvQy86InDSm3g782wmJp+CDTtt?=
 =?us-ascii?Q?DC3U9UpHzK9jsSUKj1pnir/9nOJd1HkULaqYB8ewRRoVTMKP8kaUenLY6BXc?=
 =?us-ascii?Q?dB6dP44gJ1/KU3dIaRuQm7QfLTD19LkVdEEor/cH0CrjmvEBJ+c3im+//wC9?=
 =?us-ascii?Q?4ioELgg5JXUvvp9zWdKfE4hK8fYlL2EPxhTCbWvdAXDKiqFRLc4VC7//g7k5?=
 =?us-ascii?Q?l1g7lqy0sDtjJnC2w4NelHXDXaCw/3UqyLDLy6fDV3rkLK2NgjZFw60fPsXR?=
 =?us-ascii?Q?toBoREnGzeQ+GlabiCJYvslmi7qnTahcZJN3YxgUcO6g+gaCwVBNb01X1mOr?=
 =?us-ascii?Q?yDkZARnJlKvWtzGZA0JsIXgq+LanaebfTbIK29+ErrOF40igkNZZSo7TxIOh?=
 =?us-ascii?Q?RVsHcxm/eGLGUp2Zat5Z4Bevg475iz477U6yT/jj93fmAl/EppqpiOkDqmgJ?=
 =?us-ascii?Q?vfSUAh/flEf9Twlbl+sGvrBzfaGhEIldU9cL046X6LH0oyXceZqe2AjUpA7Z?=
 =?us-ascii?Q?z++Vb87DeiJA2Y+/2H96PHRIf3+wFpJQsq/UG2OtOQXOk4iVcZEbYBskrk2g?=
 =?us-ascii?Q?CbZ9KLMNIq7i9LOF6/7nQaSjc191CReJ7W69KeoC+7k6lC3wRvpkk87H7kmA?=
 =?us-ascii?Q?/Li88wPqsJbHH4CkYOmsQ5nDejlvNhoGZ7BPtSSZcS1TO0exLba5sclsjEZl?=
 =?us-ascii?Q?tq3X1/GqMhhm9dBbmWYD/qPkOF5hZkAyB7Q0SeJv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16711a1c-292c-4ad1-afad-08ddba81d210
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:34:49.5971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mC7WSTEwOyEh2qsNXHO1dknp7lUOaZpm3viC5gOwKewPYOGEFR5WQUh8BQkUgsY3j+DwroiqLhA92d94XAl9dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The layout of bits within the individual tiles
(referred to as sectors in the
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
changed for some formats starting in Blackwell 2
GPUs. To denote the difference, extend the sector
field in the parametric format modifier definition
used to generate modifier values for NVIDIA
hardware.

Without this change, it would be impossible to
differentiate the two layouts based on modifiers,
and as a result software could attempt to share
surfaces directly between pre-GB20x and GB20x
cards, resulting in corruption when the surface
was accessed on one of the GPUs after being
populated with content by the other.

Of note: This change causes the
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to
evaluate its "s" parameter twice, with the side
effects that entails. I surveyed all usage of the
modifier in the kernel and Mesa code, and that
does not appear to be problematic in any current
usage, but I thought it was worth calling out.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 include/uapi/drm/drm_fourcc.h | 46 +++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 052e5fdd1d3b..348b2f1c1cb7 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -909,8 +909,10 @@ extern "C" {
 #define __fourcc_mod_nvidia_pkind_shift 12
 #define __fourcc_mod_nvidia_kgen_mask 0x3ULL
 #define __fourcc_mod_nvidia_kgen_shift 20
-#define __fourcc_mod_nvidia_slayout_mask 0x1ULL
-#define __fourcc_mod_nvidia_slayout_shift 22
+#define __fourcc_mod_nvidia_slayout_low_mask 0x1ULL
+#define __fourcc_mod_nvidia_slayout_low_shift 22
+#define __fourcc_mod_nvidia_slayout_high_mask 0x2ULL
+#define __fourcc_mod_nvidia_slayout_high_shift 25
 #define __fourcc_mod_nvidia_comp_mask 0x7ULL
 #define __fourcc_mod_nvidia_comp_shift 23
 
@@ -973,14 +975,16 @@ extern "C" {
  *               2 = Gob Height 8, Turing+ Page Kind mapping
  *               3 = Reserved for future use.
  *
- * 22:22 s     Sector layout.  On Tegra GPUs prior to Xavier, there is a further
- *             bit remapping step that occurs at an even lower level than the
- *             page kind and block linear swizzles.  This causes the layout of
- *             surfaces mapped in those SOC's GPUs to be incompatible with the
- *             equivalent mapping on other GPUs in the same system.
+ * 22:22 s     Sector layout.  There is a further bit remapping step that occurs
+ * 26:26       at an even lower level than the page kind and block linear
+ *             swizzles.  This causes the bit arrangement of surfaces in memory
+ *             to differ subtly, and prevents direct sharing of surfaces between
+ *             GPUs with different layouts.
  *
- *               0 = Tegra K1 - Tegra Parker/TX2 Layout.
- *               1 = Desktop GPU and Tegra Xavier+ Layout
+ *               0 = Tegra K1 - Tegra Parker/TX2 Layout
+ *               1 = Pre-GB20x, Tegra Xavier-Orin, GB10 Layout
+ *               2 = GB20x(Blackwell 2)+ Layout for some pixel/texel sizes
+ *               3 = reserved for future use.
  *
  * 25:23 c     Lossless Framebuffer Compression type.
  *
@@ -995,7 +999,7 @@ extern "C" {
  *               6 = Reserved for future use
  *               7 = Reserved for future use
  *
- * 55:26 -     Reserved for future use.  Must be zero.
+ * 55:27 -     Reserved for future use.  Must be zero.
  */
 #define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
 	fourcc_mod_code(NVIDIA, \
@@ -1006,8 +1010,10 @@ extern "C" {
 			  __fourcc_mod_nvidia_pkind_shift) | \
 			 (((g) & __fourcc_mod_nvidia_kgen_mask) << \
 			  __fourcc_mod_nvidia_kgen_shift) | \
-			 (((s) & __fourcc_mod_nvidia_slayout_mask) << \
-			  __fourcc_mod_nvidia_slayout_shift) | \
+			 (((s) & __fourcc_mod_nvidia_slayout_low_mask) << \
+			  __fourcc_mod_nvidia_slayout_low_shift) | \
+			 (((s) & __fourcc_mod_nvidia_slayout_high_mask) << \
+			  __fourcc_mod_nvidia_slayout_high_shift) | \
 			 (((c) & __fourcc_mod_nvidia_comp_mask) << \
 			  __fourcc_mod_nvidia_comp_shift)))
 
@@ -1037,12 +1043,6 @@ __DRM_FOURCC_MKNVHELPER_FUNC(pkind)
  */
 __DRM_FOURCC_MKNVHELPER_FUNC(kgen)
 
-/*
- * Get the sector layout specified by mod:
- * static inline __u64 drm_fourcc_nvidia_format_mod_slayout(__u64 mod)
- */
-__DRM_FOURCC_MKNVHELPER_FUNC(slayout)
-
 /*
  * Get the lossless framebuffer compression specified by mod:
  * static inline __u64 drm_fourcc_nvidia_format_mod_kgen(__u64 mod)
@@ -1051,6 +1051,16 @@ __DRM_FOURCC_MKNVHELPER_FUNC(comp)
 
 #undef __DRM_FOURCC_MKNVHELPER_FUNC
 
+/* Get the sector layout specified by mod: */
+static inline __u64
+drm_fourcc_nvidia_format_mod_slayout(__u64 mod)
+{
+	return ((mod >> __fourcc_mod_nvidia_slayout_low_shift) &
+		__fourcc_mod_nvidia_slayout_low_mask) |
+		((mod >> __fourcc_mod_nvidia_slayout_high_shift) &
+		 __fourcc_mod_nvidia_slayout_high_mask);
+}
+
 /* To grandfather in prior block linear format modifiers to the above layout,
  * the page kind "0", which corresponds to "pitch/linear" and hence is unusable
  * with block-linear layouts, is remapped within drivers to the value 0xfe,
-- 
2.49.0

