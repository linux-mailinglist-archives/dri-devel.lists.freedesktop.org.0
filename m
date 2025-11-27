Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31430C8FC47
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 18:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3A110E84F;
	Thu, 27 Nov 2025 17:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="COSaSHU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3550E10E84B;
 Thu, 27 Nov 2025 17:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764265855; x=1795801855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lMo4b9VLd1Xv5tdE9sBfIYv4Aorpx+KJ4xd8jtloGLE=;
 b=COSaSHU1MD9n1WZcGhGfCv7la1mh/8mWML+2/n/RfHA5D5PaKY9/N0pf
 iiBFlAwDZ33lCsMPFoR+kfDd4lGizz0dAqn9aoI5YPhofKIyoMiK9nWoz
 6dE7uXO6D9p4fdX+ugsd88olx/hlNBW/uM/EzP4YBQ+c/IQsavaxFQd9C
 FIRQ4X68uKWuyi7pZw8FUsP4LmV7yyjaLmRoJflk/v9MTfJKtep9L2PQx
 1O7x1Gn7FB7YYrgsOSKr8yCkfJKYfu9ueOB6Ll2KjtCVUZ3FVt8HmodCq
 PIMSUyOyOQenCZ8Hq4uXE5sjqMUGsPp8JMvBizVKwfVFzdLEbHCDI8Tb3 g==;
X-CSE-ConnectionGUID: MoOwZ0XcRuuurgc9KN0VqA==
X-CSE-MsgGUID: Y1w6/wxOR7inipcuAVIKeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77002936"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="77002936"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:50:55 -0800
X-CSE-ConnectionGUID: E9BQRmuZSjeC4edf6IG33Q==
X-CSE-MsgGUID: 8kOMRNnfTEKoIuq3eFSkrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="197453507"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:50:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 09:50:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 09:50:54 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.20) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 09:50:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yzw7QcmhVz/3WP/U4s8dGwHOck8qevA6Es+Xc9D0VW++p4QJNFKF9S4fUhz3R7GdQGNDBoHi6GJqyM65NSrqFkjkdGWdPJSfTn08E8Quk767iRarYA3NKRtqKKqw1ESRRkYUKndZjKxcIzsSqlSGibMzPlMYoxQ6ZJqOS6dR6n24KS8txpqQ4Rypll8PVouNZN8PgIHt+CF6cQTPRMsj2X3yGriR6s/EjsNVVrU5yE9d9uqiQV41kHufBVrHX+3aDDur30HcENH0jXr8CM/V3vx4WlVTismXB1AQASEN8N8h81ozd9Hy6MxapdivkfLE8rzYou6VK20uejm7kdOVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDr/44rttBbLYE/CoYJdzB4KHAEEZgjk4c+B+Pvo6yQ=;
 b=SA0AMVSaUTBqnIJW/uWz577caPHcFdN+DqiYuSV4NgVwwo38IHc+lALVus2cOBE3HrMdSj9bmfbObW3X4T5IzqaY6Akc1K5ZztMOZkS4ZVgfBpp8xBv8G83GlvH0i5fjf2wAzm1xcF7mn4UjcNy1MdUPSCrAd1+L5MNpQPgOXYgSjd8KgGbQVAHqhU38TGyaFuNq3TGNM+SGKgMuADDQ0lUtnFlM8CiFo7K72f99Me4VmAEEs+qIZM7xt5eko3RBAF5qvgDJkdfWwycUJiXRNYji+6Ba8gtKh3PWiLlg1Z9JXeuE3U/ZzLMfI3O0ZdN6eakQQvqqW1O2/7vNGKuX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 17:50:52 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 17:50:52 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/50] drm/i915/dp: Fix DSC sink's slice count capability check
Date: Thu, 27 Nov 2025 19:49:36 +0200
Message-ID: <20251127175023.1522538-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251127175023.1522538-1-imre.deak@intel.com>
References: <20251127175023.1522538-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::20) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA4PR11MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa52de2-7acd-42b9-19de-08de2ddd81dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ncCwVa5AU89IcK63IoHgujiYfnvpp2hqPSBOhtCE/QCaPjbk32zE61b8LyZ7?=
 =?us-ascii?Q?qHGP9ZuEdiuoPmJXq4Co/q9lM+5mBTUw0VSV9ieAwHIHITu7eEdBLmCkGSeL?=
 =?us-ascii?Q?Q6iTU1X8h/aaahEIo06BkhY/o61MausbUWD3xO4uAkb6x1PD3jccXGE0Oand?=
 =?us-ascii?Q?tpX3LjPODm/8vZijvYtfKua7kIOjQyS5E6Q6PT+co9vabL6sWidGxjmlZttn?=
 =?us-ascii?Q?zI4Qz+zPt1SzaSxiycYEi+xKEGOEIm5+boQjVE6j7Y7Ttd+JCA2/NfSrQh9o?=
 =?us-ascii?Q?6cefH6y8VhwAOmcFgYI1ehkMouH1AydCer0W7ErzRTEXwX/Qv+MXWiVeK+XI?=
 =?us-ascii?Q?3fYD2C53DS2QG8UBhTV5hGY02SFDW2zI7gINqyE2tKz94R/ZosCmLjVLEHbo?=
 =?us-ascii?Q?t1DRl39BFARP9htIh15zvNUQAy77oGOQOmfElqTra2A/TCV21SO7Ul2qHSrO?=
 =?us-ascii?Q?MngReohlXZ7EJK4eVTh2s1c+NpAfD5NFgfGRjftbXM2Wm8CgbLHqTo2LJp4z?=
 =?us-ascii?Q?ShGRkOTG8DEu9q7fl5YNycfZsmSA/8IdVryfSOFsbyjVUcBoGs3vqHD0Cc5u?=
 =?us-ascii?Q?yng0h3w1vg/2QJIgbqVX/oyMVvXyzqxtAy2zDfDuDz7FEtnKqVzA6xq6U8+X?=
 =?us-ascii?Q?nZ/t/+tKSCJMUtK+K+Ok1p6TojzNWfSz+KefBSEjyEe6nDPdNAyYf78a/YgE?=
 =?us-ascii?Q?nUz7xVJY6xhNyKTp/IOxij/NbC3nqTB1YI8VjdV5bPRb7lChhnJFbfCi+9Qo?=
 =?us-ascii?Q?rz3bxOOHuqIwuj/RhlHfPQuuVq5lJ6h2UoSDcpRJzYhVkLJCF6NOCLGU3Kcy?=
 =?us-ascii?Q?8M23RnHNQuQ9LcOCIkAizfwG5+wE6Nw9/zxgybT7GSShFDBLrAyKSblmXT85?=
 =?us-ascii?Q?gd+I27d4SkEX9HGbdwZsp1kIN5Vnui3+PmJ+zwan5K1f6c+MPzrOBi82+G4O?=
 =?us-ascii?Q?P1hCCsLEEelQ3PMatg1BAbOy9Gog7+U0vIvk+CqFWIlOq9qB7hSBxOU66SVl?=
 =?us-ascii?Q?iSw8NnaZL9F0hhvkqfTwAJeo8pz5Z/2g8iaN5jZv7gxDQa+BUNS9/MydNMH/?=
 =?us-ascii?Q?LllD3wy3iBVuhSEq71x9bzff+1ee/JbP2CMUWbkrNka+QOUJ6AdI/4IOXt7X?=
 =?us-ascii?Q?MY2v8capiB9Q6zWDGPjYuNIzzbJh2PMZ7al2iLP49pQJON/oI+blr3g9vYI8?=
 =?us-ascii?Q?fTY1MyeZH/m/kI8Z3KUDEwtmOI+QRbUZt0JJoZNvyZBvFcxvy+KUinxPeSco?=
 =?us-ascii?Q?2Cd98yAFOTcarRrhj9UqUBsMafuDI1hOJdt/tCp5ExG3WeEdZtJ8r/jov4FD?=
 =?us-ascii?Q?QKEc1j/OqgL/IPU13BqZD/1teOH0CFpOXJ1s43FkQv1Qp0EWnZxotiB464/7?=
 =?us-ascii?Q?za/q0LdRPb34ABISbwTNfKJk5Y3ecNNjCzEDxvro3b1rO6ROd4/4lw4duls5?=
 =?us-ascii?Q?J/nVfsDtsnZe994exKV+EFwYrXA5XV2s?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8VShlqBeA9czVPJRwWnQP4MptBmtAbLgXz8dmFtENeKX63mBiA5qkVboIYZN?=
 =?us-ascii?Q?D4cFv2Z9V+gj52XehVQU7U+8e26UyO7lOGmZPQUr+l62dPm6IWy82kMpfVBP?=
 =?us-ascii?Q?YE27sNVVGpums7wk7WgIF4FU5y3oCPX9rqfSijYp5zBH6LfRS3OwbyLlO6k7?=
 =?us-ascii?Q?iDOxYsxstmgzsNVX64gh0CFEP9TItE2ggVk0+s8qnZdVEULCCFuuRtU3xg5m?=
 =?us-ascii?Q?Dx3jKDL23aXfE5xsj/2NhvQswoQivY/PvMO/T+ybcsg9XNK3mQCvuXuR2ITz?=
 =?us-ascii?Q?nlyA2yOY/RreWVFo1/+YLv63B+qBqRQ8NnIIGrmU/AUBI9OlcAoaY8uBuO+z?=
 =?us-ascii?Q?43eGZcIh4Ne+VB38wo/vOR5F3GgUfh/KxUTsr6FD2R6+Hxc4UX4SlGD5VMh/?=
 =?us-ascii?Q?r0asjnkKk/Ofshn8RJGonhFQdKLQRT0xvtlVyx7n/DEdxg7pEJakHV4Teiu5?=
 =?us-ascii?Q?p5jusDXQrwRlbwSDU1yV6EJ8ecnUM01ZNMzN9WP7i6v5buijCdhbWsGKVQqi?=
 =?us-ascii?Q?rnELRDr3C1nSjUNTddVKZ+zq6OtrtFr0kgBjA9u+N4XhDl+LRu11YtJOihKu?=
 =?us-ascii?Q?dMG0VGpQHBUCxNVupPTaYYvpOWKqz2DRW4qc9xXU6ulhTXPnqn3KI56Abryi?=
 =?us-ascii?Q?iXcuJ8kt7iEU8l5SrtyoxbPu4tUSDHfyFxiA5PH7SqeuLQ57x9JxW46KoJ4j?=
 =?us-ascii?Q?34oITJ8qKXPODBNiqtWTmTEYpFNhE7lmfNKgbt3f60GYr9T1cmpeU+Ivo95z?=
 =?us-ascii?Q?8XGxlUNkyanLgwwEanmW1J+14qPzm691T72rBaOgokfOEUpzcMPmV4JyWvwt?=
 =?us-ascii?Q?OTvTxCaVNyshikkQE+gQln2ga4IB7ygWP+Vgd8NzG088pMv6BtwicJaxoQLY?=
 =?us-ascii?Q?9pbuopMVSM05azAq6cq51D6Nlxs1y6EG0NAAKzsSdrEzuEZwvOpY+Y7IBDxY?=
 =?us-ascii?Q?Sa5nzazFRHsNbjVU9Xdv2xlCrKxxzYFFYMLx8EmaGfNBqDcKrZ9fDvZuGm8c?=
 =?us-ascii?Q?TBs5fGsqpk1qLhDoJuunVY+NNeCkCF+WoHqU+Zy+mK5ZoguLmTx0xkS7gRxK?=
 =?us-ascii?Q?MmLLroyt6Jsxz9t1EtdVPTKkGoVDlIyQlNR6/RCSmEbAA7920hXJfuND+5ak?=
 =?us-ascii?Q?hOZG4domR5eSJa4BcbGhNOHVX1jX+UIAcbKSw8OB5zygmotlpo6Fpr/MD0cl?=
 =?us-ascii?Q?kG75AezxCxN7xfyKTlXEOy+MbZqpADnV8ZaIe7cgU0pQrWWAD0t/yaC8ksrq?=
 =?us-ascii?Q?Rbo9LU0ws16XUMmu0/bBrQejzT7f/FmivcxSdEF9bDFzVkQtFgTrhClB6oHy?=
 =?us-ascii?Q?LbfZLYoOoC3gYG6UWpdIyCIeUvH3J6HxKaii+anYVtfZ6D9dDga6PGEYjxhy?=
 =?us-ascii?Q?k7qGQqPt5SZThPe53Jm515i0JVG+KrZwCKlF6duCDUMRwPt19+9tILLsBoDF?=
 =?us-ascii?Q?fr2RXecH7LyAp7QK8R580xR/cuFcfT8rz9Md7TUGXS4E0wojgylPoig8pj1P?=
 =?us-ascii?Q?B/Xz+BYNL4SVmiH4b3fyfuFFd+4PVWFYBGXmrIV46XaDZwrGpfg5AUbs9VX+?=
 =?us-ascii?Q?ALZaVO7u7tYr2/B5KoogSJ3pDZ1Lf3uO+vsMDnB3FngC/Xojn2QFWzb1K65u?=
 =?us-ascii?Q?oGd+GOWeSjftQAtP9WzeNlTn0yiae8FVsxjEiTFfe4UJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa52de2-7acd-42b9-19de-08de2ddd81dd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 17:50:52.4199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWcY5FBUUVaIQBDCJxops6duX1G4ypmdYLQqJshXrnQQL79D0iYIDpZU+tSVZ/VAdcjNjwLiAip/eQIWNUbFCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9035
X-OriginatorOrg: intel.com
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

A DSC sink supporting DSC slice count N, not necessarily supports slice
counts less than N. Hence the driver should check the sink's support for
a particular slice count before using that slice count, fix
intel_dp_dsc_get_slice_count() accordingly.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0ec82fcbcf48e..6d232c15a0b5a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1013,6 +1013,8 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 				int num_joined_pipes)
 {
 	struct intel_display *display = to_intel_display(connector);
+	u32 sink_slice_count_mask =
+		drm_dp_dsc_sink_slice_count_mask(connector->dp.dsc_dpcd, false);
 	u8 min_slice_count, i;
 	int max_slice_width;
 	int tp_rgb_yuv444;
@@ -1084,9 +1086,9 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 		    (!HAS_DSC_3ENGINES(display) || num_joined_pipes != 4))
 			continue;
 
-		if (test_slice_count >
-		    drm_dp_dsc_sink_max_slice_count(connector->dp.dsc_dpcd, false))
-			break;
+		if (!(drm_dp_dsc_slice_count_to_mask(test_slice_count) &
+		      sink_slice_count_mask))
+			continue;
 
 		 /*
 		  * Bigjoiner needs small joiner to be enabled.
@@ -1103,8 +1105,14 @@ u8 intel_dp_dsc_get_slice_count(const struct intel_connector *connector,
 			return test_slice_count;
 	}
 
-	drm_dbg_kms(display->drm, "Unsupported Slice Count %d\n",
-		    min_slice_count);
+	/* Print slice count 1,2,4,..24 if bit#0,1,3,..23 is set in the mask. */
+	sink_slice_count_mask <<= 1;
+	drm_dbg_kms(display->drm,
+		    "[CONNECTOR:%d:%s] Unsupported slice count (min: %d, sink supported: %*pbl)\n",
+		    connector->base.base.id, connector->base.name,
+		    min_slice_count,
+		    (int)BITS_PER_TYPE(sink_slice_count_mask), &sink_slice_count_mask);
+
 	return 0;
 }
 
-- 
2.49.1

