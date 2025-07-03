Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70AAAF8379
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E96810E90D;
	Thu,  3 Jul 2025 22:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HFv6x9ho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3591E10E908;
 Thu,  3 Jul 2025 22:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=citT/6ZG17CE7/okQaO9uhxV5uAjqw9RabKcMxzJsxXh2CJyNap8kZqW87GAu5rE9ATIehQtS/LS7aBja1Exg4lwKqYfxkXJuVYisgi0F2CefL17k8xEWz8+f1p+3lQbUIOaCVD/fj51M5jvYUNUxMcMLAFIcUbrWbL9v8SvJbqGcSuIZtl5VHGkduSs+qFzvjyL9Jd4PsWoVeoGYuSYjIao5y4qHVxJpx1U3Hl/d+RdVuxrGVGRov7PoxvhIaP6huTUxiIAk8G/AngnP4c7WiVmM9F0eRd6FtfiKAliSbnocgDradN2aTE8i/HlyxMmd1mtv7QAqAO7qUB4xm2lKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0DiCEZIAYH3RvjLAw9QJg1bLoIO6Ed7joLuLQaSfwM=;
 b=qv0nB5OUK8gKXnUUpFh0funMPYgzFqHD4nVGc5q08vx9RV7oJ6fJH3TH7QQwew83iJM5iAaOdhloZINulu7ibfoqZGY5LWVfWiMOmlsRCIKpIlj+rwA0JXP6EOV7RZcHB0RmedSKO1TvGYDH/awfQ9mWUArFvgqPvPGiY+WqiNQxmxh2CIkcA9C8wMCAhTzZm1EHIXbstI7WCDpG1jlJ4j8deJSk2SBPZfkqKqLiJvGDunYV9ZBWBBDhfl2hpB5zc+vIOW04tz7H3aSY9VAy39hSPj+ejKVYx3k1Sm/J7ZckTnMuS0Zf2+KxcxjIQO6LsZ+68M8Wygqo+X7tszQPYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0DiCEZIAYH3RvjLAw9QJg1bLoIO6Ed7joLuLQaSfwM=;
 b=HFv6x9honVBDq8ZciwFOGnCHF75/NAp5Bv0RfmzhU5xb04Xym1jWxiYApkoTY6nE9rDw3DJclvV+MwudEgjYdng6792IfWCcvgYq7nS1+KVbdmvAvIjN9Q4w+EE2HY8/Up0O3/dx1CRhFp0YRRg8iviL3N1UkYZsVW1H3hiHAhgEY+m2M5uyhTG/0SaokwyiZJUxWXjIjc9udECc+vsuimDQO2PFXqwzf9/RJl99q8RsEydzwu7Z5Xw5k3+S4EgIjUqRepodiQOzouLZf/nb7FW6IAmofoTgyXoabRVBMWPonalTd3EO1U7m9WiTumdD62ny60xz+p1p055QHLTyog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 22:34:46 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 22:34:46 +0000
From: James Jones <jajones@nvidia.com>
To: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 James Jones <jajones@nvidia.com>
Subject: [RFC  2/4] drm: add inline helper funcs for NVIDIA modifiers
Date: Thu,  3 Jul 2025 15:36:56 -0700
Message-ID: <20250703223658.1457-3-jajones@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703223658.1457-1-jajones@nvidia.com>
References: <20250703223658.1457-1-jajones@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0064.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::16) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b199a89-a7c7-477e-516b-08ddba81cfe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xjjrDk4PtAuP9xKqJ4u838nXICntQpZsN2a7ToBwUgSbnoF9eSVs6ZlUthhr?=
 =?us-ascii?Q?2xTGAGC/n+Bl0F0+AgQlkcT/RDO8DLgBg7Ey1VpCnmWZKWchQFHvWGXrW5g5?=
 =?us-ascii?Q?3Zj6R3tihyMh2W3/ZoQKSvo3JuZBtdepCs8KLK7lFgEn2cDPjEHTI/VIjekz?=
 =?us-ascii?Q?V/UERDDBrjN55cN9y6lxohY3PKQzRifSV3tclwH8EZfAPMIpbSQCfkQ260ww?=
 =?us-ascii?Q?P5ct+x8vBvPQruR18foYUqb01BegTLA4ssI6forF/9jueynKi6uLFa138Tvp?=
 =?us-ascii?Q?GLg21p8ITXEZprU661+Ypu7Pc6cjrEvwyZ8zUMLooWfMrEbqAMS91xE5dsNg?=
 =?us-ascii?Q?v5JDNw2jwt2VBi08Sht3xmiLpaKbIiWDqwaxlkq0obESU6aDTRs+AX3EY4sv?=
 =?us-ascii?Q?ijlJEqrtfj1kXuBxKzZB0LSBUjphwWTtXM5PlQcXBSeTyKn0etpmXtqwY9nj?=
 =?us-ascii?Q?+qYGj/XS/aPBXAeriLRuwmZNfE2JO99htiY40CPlNrwt0jI/sQBZETC+iAv3?=
 =?us-ascii?Q?xk7ZkmhGNUAH72I63Xt81U/MVyomCDFREmAjn7xUu5s+Xi+ko6x/IJ+KWu2M?=
 =?us-ascii?Q?q0Evn9fz39X7Q2rqzApVJdel0ZIhTdM57esukfZhYV2zb5SmSrq4dxJAjiVR?=
 =?us-ascii?Q?x15N71hh8emphpkV9gpnRnm9TOboFlLwh2K0cWBpaTtDqb2X2Dv4zkwq3ZmQ?=
 =?us-ascii?Q?QszsIjCAG1Gt6VPJaUlUz4eiYuqNT0etvES4Bnm7x3xnjS0gVusbTUZUUy0I?=
 =?us-ascii?Q?iGh60Fs9+Th4stlATotjFj/hGIWtKix0XJvoj/EZ6ZvVrgslOzTFMpCdqR2r?=
 =?us-ascii?Q?NAblLlGQOO0HsGHfi/ngjY8GyRLbciem8xHEKa76TQtlRndcav1fnGA8hAA7?=
 =?us-ascii?Q?MVmUuttUI+Maopt+w5mhRg7MVIS82oBEODR5wkJ9iLCjQmxdjjPzuX7iKGVQ?=
 =?us-ascii?Q?WDaAdksTR6Xb1uSsQxS1ayqxB/oJrHZ2dCU8iut6YtbfnrZr01ls0+2vqtFg?=
 =?us-ascii?Q?+addn5W0Ly2+N/xAAhk6LnNx7XW5FD8jRUhtz7w122O8qSttCf5nMn1iyzRF?=
 =?us-ascii?Q?znZaSYFOWmu/ff0GtpAsDYX+ddCk20vsDOHC+pwbSkJHBM1/T0nIrX6Kry8J?=
 =?us-ascii?Q?osy1TNMh8qt0hoVyuAqDxmqbsuylD9E/TTXvUxF5qM3MkpxbWgVR4Dphokj0?=
 =?us-ascii?Q?yelcvMZvopJbo1lBv3TAGQAKmSUByNuMCSK80A7USKtOkrbm/SUEPDtlj/Cg?=
 =?us-ascii?Q?d/n23DtYR0CYy0yRsY07uwzACnSgS9r7L94OC0NiR2+H/v57ZJiRNagFxYdA?=
 =?us-ascii?Q?P1wbOjMzTVbzfkzCQWCJjSUmk+vEsRB1b5oZk/4laSyqA0ffkItG+93tqClr?=
 =?us-ascii?Q?TIX2b0173d6xY5Hc32t3B6WkLMiwGcfI9ETFQiYXvVZUNyD1cLZELBXCBxDU?=
 =?us-ascii?Q?NKIPdV/Eb4w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GUOay9+yFAhzDzZDcjZooEPwV+mrlyPA2KlTm1m7jmyVJJoVjrR3ueXiiII2?=
 =?us-ascii?Q?ZVjhYJYmSbnwTdmsN0j8Mw/7OFEkj/JmTmRPL/Ggn3r9e8A3JaqNKM+A9yG4?=
 =?us-ascii?Q?pz1sV/ixaiz7CpO+ZmPVWOLaS01NaLj0PkIL2vkphH6RUVea6eVh0rKEgXwp?=
 =?us-ascii?Q?H6Jmt6y1+J8vNQw0rXpprFeuXikjn1lZYlAOGVQkBy3O8uTq8hCwVI13f48x?=
 =?us-ascii?Q?SM+18gUGHM9M5aq2lUWHMOjCHiFQSF29RXLMbOHA3mgTk1c52aDg/XgV11AX?=
 =?us-ascii?Q?bfT2DHCYoPR1BL1/L4qaNgAXJ16LPGI96gmQt6V6jQl6EZgOLHI8L5JoDFf2?=
 =?us-ascii?Q?SznkagaYKV9WKOLvoWJuxIUeZJizxRCbAttrdmNlFBxAhUSmJsD+iwFan1Mb?=
 =?us-ascii?Q?eEzSEAu4gmta37uSF4yyif7ExUHpW8e5KOtZOnK6xq4o4d4BFrvDqgy1Ysxj?=
 =?us-ascii?Q?m1WGHqKANCyjL26ZQxM/chPANu68QYY9Zko90GOcEuhGHGwwHxXttxhf0s+s?=
 =?us-ascii?Q?UkcUSrBfYQgJRfo9XOqUn0AKp3jYUE675hDltKtXxTnUNDH3RNnGQ23ZnO1+?=
 =?us-ascii?Q?t9LcwYJK79cxlV1V+HtbIZ0uyW7srpVcYpRuDV8iNEMOAgYoZS0/y1+8gHrh?=
 =?us-ascii?Q?eajSRhaT1m1zW2Z7lLyoN6UKa/eUJRiD+pW/jQJUevVjUbdvYjsZpn0lK7Gi?=
 =?us-ascii?Q?bs6CLrJPk+PKPRAkO3jqTPy9yTZ0+EouIOgP0DI6yOOz0VX3ZrLTkxdF3PGL?=
 =?us-ascii?Q?Rt7u/iq8lM3OgqmPLltLzWf5oCrDpqw/5Zfl6R2a4SZYUcw0F16Ru5sgesoC?=
 =?us-ascii?Q?jKavtHy8cc/xvuz+Yo7Xs/KhszcmG0FV4AQ5iU8S/PrIUi8jbXDcedU6Vtbv?=
 =?us-ascii?Q?5pjHsVtthSlDg2DEVI/BxFMHsYNHtFbAcBq8H1hEcJj3TSRWL/Df3YGUOciZ?=
 =?us-ascii?Q?9lIryajHcaUcCjHD477nOsKiAc1/rZo9j1novexszzgWQJ48FadQRbKSy4q9?=
 =?us-ascii?Q?270nxiNxWf4d/uWCWz/ajO/vEd+tj4Cyd6nvCSh2EBB389MukYIzGFEFpUqj?=
 =?us-ascii?Q?Tt2cN82eUgMp3bVV9l2ofa3SKeVD2VtcNcJzZz9MAcGVlenJdrJRBdHC9N/c?=
 =?us-ascii?Q?O41L4M97XN4rDrEoSytel+9+F+gvwUnFyHZDZs+IQtnBItBwk3qjWn2tUIyO?=
 =?us-ascii?Q?GKBIWs+wX7/vCoWH2nE9GdDDfsE8NfXEbkQO8ei09AZcjvseYPMmo3F1Wf+J?=
 =?us-ascii?Q?H1SAUGLx+3qSrgH+Kv4x01CAoTdoMpFwJxcwTjmKXw9EkoOiofmNmsMQyTLQ?=
 =?us-ascii?Q?g044ML27rhjnYlIDGBXUvo41pwIfWYpci/TdPJeCx/8Pg+/JELTfSQbkoTLx?=
 =?us-ascii?Q?UiNSDm8oLbsPDL/tpEyLCTXfFI183FNslkJc0SDyesDPqEHOHmlKstQg28iL?=
 =?us-ascii?Q?mWxD2tj8gMfAL/XK5rsetT+8IIe2btQaPtTImblPtYqE6zUuBOeH+Reoz6Ws?=
 =?us-ascii?Q?jHgLn4QDrbDQiXZPAekjiHq2Rs7wV+9JpXzHteF5N+xGjylGWZBhdDzhfXKL?=
 =?us-ascii?Q?vrhLAsQRa+0tYj4qs0bFtRgx3YIIvEGI1HepoIvN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b199a89-a7c7-477e-516b-08ddba81cfe6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:34:46.0110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEZqG0nXlu6Cqmfb5aLxqmBoz0C4pI22rlXCpdNgJ/CAqaOM234TnyNvUjoYr9xpimVnvAUloocUMGeVGmG/ug==
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

Code parsing the fields of the NVIDIA block-linear
format modifiers frequently needs to use magic
values defined within the
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro and
document in the comment above it. Such code is
error prone and hard to read. See for example,
nouveau_decode_mod() in the nouveau driver.

This change adds macros using the previously added
field definition macros to extract values from
individual fields in a valid NVIDIA block-linear
format modifier.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 include/uapi/drm/drm_fourcc.h | 44 ++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 4240a4a146b6..052e5fdd1d3b 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1011,6 +1011,46 @@ extern "C" {
 			 (((c) & __fourcc_mod_nvidia_comp_mask) << \
 			  __fourcc_mod_nvidia_comp_shift)))
 
+#define __DRM_FOURCC_MKNVHELPER_FUNC(f__) \
+	static inline __u64 \
+	drm_fourcc_nvidia_format_mod_##f__(__u64 mod) \
+{ \
+	return (mod >> __fourcc_mod_nvidia_##f__##_shift) & \
+		__fourcc_mod_nvidia_##f__##_mask; \
+}
+
+/*
+ * Get log2 of the block height in gobs specified by mod:
+ * static inline __u64 drm_fourcc_nvidia_format_mod_l2gpbh(__u64 mod)
+ */
+__DRM_FOURCC_MKNVHELPER_FUNC(l2gpbh)
+
+/*
+ * Get the page kind specified by mod:
+ * static inline __u64 drm_fourcc_nvidia_format_mod_pkind(__u64 mod)
+ */
+__DRM_FOURCC_MKNVHELPER_FUNC(pkind)
+
+/*
+ * Get the page kind generation specified by mod:
+ * static inline __u64 drm_fourcc_nvidia_format_mod_kgen(__u64 mod)
+ */
+__DRM_FOURCC_MKNVHELPER_FUNC(kgen)
+
+/*
+ * Get the sector layout specified by mod:
+ * static inline __u64 drm_fourcc_nvidia_format_mod_slayout(__u64 mod)
+ */
+__DRM_FOURCC_MKNVHELPER_FUNC(slayout)
+
+/*
+ * Get the lossless framebuffer compression specified by mod:
+ * static inline __u64 drm_fourcc_nvidia_format_mod_kgen(__u64 mod)
+ */
+__DRM_FOURCC_MKNVHELPER_FUNC(comp)
+
+#undef __DRM_FOURCC_MKNVHELPER_FUNC
+
 /* To grandfather in prior block linear format modifiers to the above layout,
  * the page kind "0", which corresponds to "pitch/linear" and hence is unusable
  * with block-linear layouts, is remapped within drivers to the value 0xfe,
@@ -1020,9 +1060,7 @@ extern "C" {
 static inline __u64
 drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 {
-	if (!(modifier & 0x10) ||
-	    (modifier & (__fourcc_mod_nvidia_pkind_mask <<
-			 __fourcc_mod_nvidia_pkind_shift)))
+	if (!(modifier & 0x10) || drm_fourcc_nvidia_format_mod_pkind(modifier))
 		return modifier;
 	else
 		return modifier | (0xfeULL << __fourcc_mod_nvidia_pkind_shift);
-- 
2.49.0

