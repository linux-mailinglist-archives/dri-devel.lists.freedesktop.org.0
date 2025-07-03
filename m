Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5E6AF8378
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B44110E908;
	Thu,  3 Jul 2025 22:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jhLS89Ai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD1610E1E5;
 Thu,  3 Jul 2025 22:34:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2ft2hXI9RXdR5zyfyszrpJNANoVUCAjZ1mYXmCQU3iWTiTk416Pdk5MjguvPqpXhIvAsuS0qlWtRMvj+zXvdnDptRODNzdjpVw4um/0lBzDG3O6heH+XLK3QO4A/N52AenIeUpqaR/CmmbiUESaNyYMPZRDKbRDryqLftKycdjOJY9afWl8XMOQMNrV/MtvcMr40J6kR2kKqDtxkELX9qBvEkAThhZJv3DksGjdcYGc90XBDuZxcYybw5a0DWpJxcA6BWGOSiMIsb78O8vTZ33L8fK16d76IqVpB3IL6rNrnXNNKy7un78FWpTPMekvhbGLLh7I2ImoKNcr4fAbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DcUNZCrv8WJARhMATVxILElbc6gOj7ISvUd24SJtdvY=;
 b=gGs5rKTRYi0/GQY3/vGbIBSzz9WACa6SDdySLNy6fqHXQ3PN5tkUtOB6MikuGJpWi4fJ+EBr/ztRDD9dIeLJrHlEXS7w9RC3BunIiNRUKtIe/lwjQJsj26uP0mqwj1Dh5g82cjZ98lYCmpEU5n0outUB/QlulzXTeTHqRcMb68hdFWV93Z3tvATVLeE4K6UrtG4A1jZsXMYc/7/928bspnqjC4la4HYzjDKy8Qm2mh82/9gkvh0Ez2Dh/Pl+70EpfTqePH3nC3jwpvAkSjX+6YIzjBotGJhWicbr3n3Bio4gKDu5eKomPr4W3d1x+2zv/78PM71Rxv8rjDVZ0zDFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DcUNZCrv8WJARhMATVxILElbc6gOj7ISvUd24SJtdvY=;
 b=jhLS89AiQlW/b9lzOtdApL6m6nqaH1Dn4ds7hQfpRq7qdkUVWe7J0o/ZTlz636uhMDJXdf983V1c/DjH4PYAn2gqcI5V7mgrTt8i1qIda2GpX13DYvVDbDG1InejLex4r8xl/gZZfZaNe2e0N1gho1cSGW5tRU0y3bHlByzPXEaZnX3Y9YVNXZjyZP66GqQ2kZuIJcgQUaWNdOjQuXrcQravGowK0EiJKp/KEmkuDXjsyphkatPi6JS+bqgnsHSKyE5FJVycyrs5LESzsUqNRw52L2rOhbmywKZA/c4Ylg4FIWMK4XfjCsgiKPF87M3rpQVxHLZriDzbLc8WdiFm+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 22:34:44 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 22:34:44 +0000
From: James Jones <jajones@nvidia.com>
To: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 James Jones <jajones@nvidia.com>
Subject: [RFC  1/4] drm: macros defining fields of NVIDIA modifiers
Date: Thu,  3 Jul 2025 15:36:55 -0700
Message-ID: <20250703223658.1457-2-jajones@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703223658.1457-1-jajones@nvidia.com>
References: <20250703223658.1457-1-jajones@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH2PEPF00003855.namprd17.prod.outlook.com
 (2603:10b6:518:1::75) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 521d8a72-2c1f-4b6f-088f-08ddba81cecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ft6JirqK+zsYArw5+8cKsIRLMlMmTjPbLiODe7HfeVNt/OSmJ9yKWF/x9OHN?=
 =?us-ascii?Q?JlO4M7yVxUT3fNEFQRG6sWbGq5mk7WSIpzGDHEQhxikY07+zBQdpxeHn4kf4?=
 =?us-ascii?Q?do4WkFL8K998baw24BcuZbensF3xvTdGKLNGpfBPzd0jOsSYBqC47MYCEIJB?=
 =?us-ascii?Q?TR71IX3dgIWQXvOFhmqJpEmJOkj/S2maMvw5bv2YygQm9IvQXTD7v/rEXvrp?=
 =?us-ascii?Q?I4IjKA5outlPSDP+Ob5QBz6Wp31ndidbWCJi8oyvKPG8HfsVcbvc17PsyWnc?=
 =?us-ascii?Q?RTjsIIgYBnagarXw/f4qK1bsBkrZilbfW0Xua287fKNrEL5aDaWdZrkfnBfd?=
 =?us-ascii?Q?Ngd9GHybSnC1wHI6Ludw+IXzK6Opuu7UbG1lbmSoQzv5RhMoNWGIoGiS+Skc?=
 =?us-ascii?Q?0fpsjy4a5Jg7xsgsBwfOt5DJUbLr6yHl0yiquhvXlVNFqBSrg/j7ldWs6MPp?=
 =?us-ascii?Q?L/yJgqcRGWohzNDql8UrHP3CAZoXMxwpVQsaA3Dot/kz94gyy5BB7Q/qtd1x?=
 =?us-ascii?Q?p7KUjB6h1OwqpBHuXO8ooG1aNfRaloEHr2/kGGiFrgP3QIZic6cmE1+nR9k8?=
 =?us-ascii?Q?nRUmX5QqHf4wXdFoRjzVB7Cm/ExIwfEQT6fCER+oU0B5Lm4Za01yz1onZTAy?=
 =?us-ascii?Q?l1lWdIGoF5WIXFzF9aQ/C3I2ZjaO4uZuAIzhLFEn+bUHpkpecXGx/Bb43Rs1?=
 =?us-ascii?Q?Fo+IjqlZv+3G58OBRX6cxL3pcZehx1jVDtkIrH9NM7ImnLdfq3yiOH0+RkOq?=
 =?us-ascii?Q?v2qhKjKR8YmYdI7llmTushgFL7psBtnjVjHoKXLaF2QOMwwNz6pbgR63AnTE?=
 =?us-ascii?Q?eviLd3xIgvZF+leI74SweGFOg2iSk6M+EcqMjru0nBDDREkMXuuWxjyMYuEC?=
 =?us-ascii?Q?OeVQkIGrMBTUSB2rlOJYdY0u2e3m0Ky8swYUKx8CWkU+89Eryw/V14nBEBx1?=
 =?us-ascii?Q?w4dRZvDXzmjyHn2NvHA1ViPTT+uWnoCoq8Jtsj3jHPY+db84j8GpclUOUsqF?=
 =?us-ascii?Q?qW+KvZDqf4ugA3Xl2UnZSm6sJMMarCIbihWS8q/i69PlPE9dWMvTOwY48QCm?=
 =?us-ascii?Q?uvE1AF9qjRhdTXXoFeR1PFepGdPRrsv/Tr6OeqWDSY6fXk+XD3i41vXlEEsD?=
 =?us-ascii?Q?1CxvSepTmY3taQ40WfUGBbWxVNySFHwhUDK/yaUkEfRKHEXGjnnjPRnx7n2i?=
 =?us-ascii?Q?twfVHq7qGcScig/1ooK6rEXYlGXujg8TXbkDvOxX8LXeOBYvV54eyDW+37ip?=
 =?us-ascii?Q?gvDnzct52ckTi7ganUvQKWogLgzG62vPAvFfZaFaz3j9C/TunRG/Hdo/Ij4Z?=
 =?us-ascii?Q?KDbqlrKgM21W2Wn/HtmGkV+fsJKvG6daqX9KN2+AyXGkN18mud+wjYLQJy9j?=
 =?us-ascii?Q?b3bcK1AC/YbD5MdPpb6S8iuVIl+RTG9qOXumQm//mEEWmwoFY9E4vXfwANTM?=
 =?us-ascii?Q?1bO4QGdYdXA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L7ZT8Tj27N/mFGHibOkWXSTpJCnFIyrXLzQ4YnOLuMnAxExTllmS2q1sPJ3T?=
 =?us-ascii?Q?5GbiYuKqX0GuJ/nn1pilUZ6EOoMm/wvs8RzvgAeVvTKItYy2ltLFPoyoffuD?=
 =?us-ascii?Q?1BYVAcd3aS5Ui5iGa9hwk8SMiDQ5RCmWg3+QWEYsX/7gVC7WThRT3fDBLqI8?=
 =?us-ascii?Q?7iZHHcgNi3K64Ef8Ew+MSfI31ppSUuClOWmk5yQdZX8Us5lcKU+QTOKOYKrx?=
 =?us-ascii?Q?53b5dP2CF0yupQa/830ZJTKXWyIoDQHg+vGXmgrOlO64rKFR1WTT6/VADVWS?=
 =?us-ascii?Q?yYo/W7h1oxdQOXeqp/dcASIOd2/kMETx5p0LfiUotACih1tYP0uZRjXPOJVF?=
 =?us-ascii?Q?+zAjehVUTlcGLpipeOjPxAG5WwsXE7kW1ES81B2q25WebbKrbIByVTm3Tr/t?=
 =?us-ascii?Q?Gkb98UzRH8uQlBb96T9k9Uz6Pxyy7TadMMoQ2Z+ni7QCQBcxiW/5Wtoqm7yg?=
 =?us-ascii?Q?zaVmiWvjvBcLrzh1nrSHt9BIhdhjIUrR7FyQd1+sJsIZOsfnl4Sk5L8T2hZ2?=
 =?us-ascii?Q?WPzHAvgSKtyXngxr4XBKDZmeFCgIFy6CxjbmRxAbkqkSHpnpJlMjlj9y+NSu?=
 =?us-ascii?Q?MbwQRkuJWDfKP/khzoBYoKL49cIkY2EJYTw89iVOhQdST9yo/rA/5yzVxAYR?=
 =?us-ascii?Q?LsSoZm/q5+hWqQ3YAH7xLjU5wDn0EebSFjf8EWLTa9OHJt7bBmRcSK5MoLJo?=
 =?us-ascii?Q?Fdj3nq3pcsHjVllrRaVSpbJUZhhphJbfodt1hpuDnz26t+kdkUwNUnZXyLWk?=
 =?us-ascii?Q?E+rOUF+XPQAZCY1JmovcaUXMjJT0l3p4mc7zIstktK7rPQtwiP+XLZimgFWQ?=
 =?us-ascii?Q?NTuL1zy4BWklcf/+RKhfWNnWGl2dXl1l2PFnS/FTr9xm7/V8KIEn7LgMnZwb?=
 =?us-ascii?Q?0XyOpn60Bb/vhGqeglmpM0FcEm+3tLjBYhjaC/S4LVWlvZ2PpTBCQNiZ9W3L?=
 =?us-ascii?Q?lJtCYjzzwxczSIXNkNBiB8MW4B1wsSvavvavuOytt5VNjpNgJxzBLWhli+Ru?=
 =?us-ascii?Q?+x/uTty0xklv0jNy87Xkg9tmOHfEfzdi0doLLKTExcYy3nwuxmpt+8aJbMK5?=
 =?us-ascii?Q?o8haGYoAw/QLuKIddVtS5O7RTkqnYvzryFd2NLSEYggNH+cK5MvwGpK9uQSE?=
 =?us-ascii?Q?9KhNUYYQs47ouTKxFZrW9ldLzpgshtSs7gZi2fkV8sQncY6p9AtnWRFchZ+N?=
 =?us-ascii?Q?T6MEMhL3CKRC1CZWtVu2P9Z4CYfmCM2oIp4ycLvAzsj1Fws68yWNpHsP6s2H?=
 =?us-ascii?Q?zTLYD+hyD8Q9zEUQmCBZgkC1swBPNBpdbbtxRlGLZEcOprXRbYCVY91ymhb1?=
 =?us-ascii?Q?mRVc/m80NMfuvWUWdpVrJQdfnWdy0bPa94XYokY8SdCM3iNVpruLFVt5DEsN?=
 =?us-ascii?Q?KVIGIyUgTEktkj4MXo8GYvvyPFaZLiTToRKY9R0rNrUKuSNYOQ0V2+4wtP3g?=
 =?us-ascii?Q?6rPjwmQOY1CYMXvHDn3K3NuFE/vxcRd7sinOJHTCrLZ5fUMS4L9cq9VEAGxu?=
 =?us-ascii?Q?7wBw3oqMzWfKDTlK6zNvXvxkkoMtx78Qg+08q5NAIHBvbaAU8RJxRX9J1Y/X?=
 =?us-ascii?Q?Etut0JBQyTDe02OHyFRxcwK9XDoP4xH3VN3bJqp3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521d8a72-2c1f-4b6f-088f-08ddba81cecd
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:34:44.0686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLKgRpwTMkA76F6x3Ou8E/i10ZK8i33UkMFN2NqIfqWPkJ5kyf8HTsgNFFRyrFgG5uMLHFkTi1ogSqx8BK/toA==
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

This change adds macros defining the mask and
bit shift associated with each parameteric field
in these modifiers.

Signed-off-by: James Jones <jajones@nvidia.com>
---
 include/uapi/drm/drm_fourcc.h | 38 ++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 6483f76a2165..4240a4a146b6 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -902,6 +902,18 @@ extern "C" {
  */
 #define DRM_FORMAT_MOD_NVIDIA_TEGRA_TILED fourcc_mod_code(NVIDIA, 1)
 
+/* Fields in the parameteric NVIDIA block linear format modifiers */
+#define __fourcc_mod_nvidia_l2gpbh_mask 0xfULL
+#define __fourcc_mod_nvidia_l2gpbh_shift 0
+#define __fourcc_mod_nvidia_pkind_mask 0xffULL
+#define __fourcc_mod_nvidia_pkind_shift 12
+#define __fourcc_mod_nvidia_kgen_mask 0x3ULL
+#define __fourcc_mod_nvidia_kgen_shift 20
+#define __fourcc_mod_nvidia_slayout_mask 0x1ULL
+#define __fourcc_mod_nvidia_slayout_shift 22
+#define __fourcc_mod_nvidia_comp_mask 0x7ULL
+#define __fourcc_mod_nvidia_comp_shift 23
+
 /*
  * Generalized Block Linear layout, used by desktop GPUs starting with NV50/G80,
  * and Tegra GPUs starting with Tegra K1.
@@ -983,15 +995,21 @@ extern "C" {
  *               6 = Reserved for future use
  *               7 = Reserved for future use
  *
- * 55:25 -     Reserved for future use.  Must be zero.
+ * 55:26 -     Reserved for future use.  Must be zero.
  */
 #define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
-	fourcc_mod_code(NVIDIA, (0x10 | \
-				 ((h) & 0xf) | \
-				 (((k) & 0xff) << 12) | \
-				 (((g) & 0x3) << 20) | \
-				 (((s) & 0x1) << 22) | \
-				 (((c) & 0x7) << 23)))
+	fourcc_mod_code(NVIDIA, \
+			(0x10 | \
+			 (((h) & __fourcc_mod_nvidia_l2gpbh_mask) << \
+			  __fourcc_mod_nvidia_l2gpbh_shift) | \
+			 (((k) & __fourcc_mod_nvidia_pkind_mask) << \
+			  __fourcc_mod_nvidia_pkind_shift) | \
+			 (((g) & __fourcc_mod_nvidia_kgen_mask) << \
+			  __fourcc_mod_nvidia_kgen_shift) | \
+			 (((s) & __fourcc_mod_nvidia_slayout_mask) << \
+			  __fourcc_mod_nvidia_slayout_shift) | \
+			 (((c) & __fourcc_mod_nvidia_comp_mask) << \
+			  __fourcc_mod_nvidia_comp_shift)))
 
 /* To grandfather in prior block linear format modifiers to the above layout,
  * the page kind "0", which corresponds to "pitch/linear" and hence is unusable
@@ -1002,10 +1020,12 @@ extern "C" {
 static inline __u64
 drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 {
-	if (!(modifier & 0x10) || (modifier & (0xff << 12)))
+	if (!(modifier & 0x10) ||
+	    (modifier & (__fourcc_mod_nvidia_pkind_mask <<
+			 __fourcc_mod_nvidia_pkind_shift)))
 		return modifier;
 	else
-		return modifier | (0xfe << 12);
+		return modifier | (0xfeULL << __fourcc_mod_nvidia_pkind_shift);
 }
 
 /*
-- 
2.49.0

