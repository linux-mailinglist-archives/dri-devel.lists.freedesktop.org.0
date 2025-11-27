Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4936CC8FC44
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 18:50:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B7110E841;
	Thu, 27 Nov 2025 17:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nx2dWzvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73B210E772;
 Thu, 27 Nov 2025 17:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764265854; x=1795801854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ufXUTzk5vxuybp4PtqK1ueXKCyYqJIkQik6YTW86VH8=;
 b=Nx2dWzvJfUd7qDUXMLVeNrGl5gekus2cbU3uoIj6NiN0Nfg+jnpddr/O
 t6MB/hmEN8vLGmw7X598S5W/gNlxCX2GvABwzkB8i9aiYQX8cftMG+r25
 y9tiZaNTePEi5xVwbdPbAdEQctRmkGhDlEeI1L8kLpe2EX3iq6BSQ5EOv
 8ldQ5KwTBnZKqzs+aIwIoE4+oiAdqQmqT/1lsrYSd2LwFQ+tBD/KfndHJ
 IukX0oYZIj2KNBxIiMA+j9WlA/OOmogRB/yCsmU9er6MusevRuM2O3ds2
 D4Hetrg66uezo3BKdQLoN6kYie4L2ITHTRU2URdNpIYfho2l+f/KqZbKn w==;
X-CSE-ConnectionGUID: f18qHkk3TkS+WXjDaEKYBg==
X-CSE-MsgGUID: 7HLVTlAuR6GTG4RpuJNa7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77002935"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="77002935"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:50:54 -0800
X-CSE-ConnectionGUID: 4m5DQLMAQ5KJS9Q/07vgHg==
X-CSE-MsgGUID: ry9LntTXRMOyqF5P5ctwlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="197453496"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:50:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 09:50:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 09:50:52 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 09:50:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxXXK5eltzLqWG4cUZNIlgVPUzZnTlbDUB69igTimocVkWaoN5EAYUGjsoeFvThS/O6lT+t/ZV9muyA857Mb201dmtKILDyyOmA3xKwV6Hq5JgcnXaeU8x4sKZB68gq0cDiPgP+1jEipyLe/O9YJB8FihjGtJfk/EisXSoWYxwGjoRQNMSyQ1GAiZ9tTgw82ULS5vyncW50/0gDlIFupAHJNCIJRPZ+ObZKheinSJUwHjNvacMeEXQ4wG3jBfa9dQ6euoKj2N1xLiIOdb81iatl8wC1Rvo1HWhdOa7gVVakd5ThKOIWInCX2aToSq5dq8CThpzYoN1kPHLOejr06og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkQy9RN/cvs0uO6v8i1WgPrIahkWWSV5uSMJNhAfJbs=;
 b=qNfRlMBPxN0c1gs5wQdM0rPcUzypED9NSaog7lKQvR6F7s+Vixs78PdSA5sCS3lgV0Qf0UjZK445zHF4T6hIJXFB3MInloiRv7wT/02Au8wBjnpecPoXq0BeTTuVoRQ8hYeoYKgvZ/y8qou2h7XisaZ/btJ2ATZFhDzan5d54utdRNKpk+Gksss0/J4wc9rM/OPZEhAZDb/VXFbxR3awhDIG5ZppPk31iba5ePfcJvagHMQ+zKfPyScYcQEvAL8sHfMDUh3rV8nbmeXdY5o0CA9s1lScQRaVdbcjn7jAHbgR/JpmCxIWonZw0vLnVEnnzrAqWBACov2L63NBK9kdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 17:50:51 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 17:50:51 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/50] drm/dp: Add drm_dp_dsc_sink_slice_count_mask()
Date: Thu, 27 Nov 2025 19:49:35 +0200
Message-ID: <20251127175023.1522538-3-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 449c1776-d133-4148-c7f5-08de2ddd8103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NIDYWWpJ/NccvEmIvwj7nUsY+GohnD7KnzubMNwgU3mWjjHOcko5V8BpnT7g?=
 =?us-ascii?Q?QA7iEOXx+lwXyZOMt0DDVTyvWilM0aSEFBZnY1MwVrkCU7RIieFaTRnxqHAa?=
 =?us-ascii?Q?w9S8pTWInMHMEM4AN62lVaEx66S9F4l9WG+VvWrV5fwIGlTulGKZ9AiXmsxm?=
 =?us-ascii?Q?Ls5g1MIQMWZK5NHyJRFhiOrxHtMTuIe60vwIle00Diy+9SeHZTJo8qQIdKz7?=
 =?us-ascii?Q?J+NkBHnNtrWEto4Lt5PX4ont6K/RWZnZhEEWPD40O+NojhBWTOd3sbURcbxE?=
 =?us-ascii?Q?NQeFUbqCCfFKnFL/IwrYcngcZmb0Xm4InBoPvjwFjZvZ1nTV6M9D5X8Ovp+e?=
 =?us-ascii?Q?E4YRCMUJGfT8ZBstrDzqB5vN25slhvuhw9ElQ5I1NJTLgMRzvTjSftMBFxWh?=
 =?us-ascii?Q?AoYa+7ryGN1J+FORCNRJMRVzw8nfRchCe+5ul3xPr1nWKH6MidJkqO6UyIFK?=
 =?us-ascii?Q?goeomgDLK2n2jEmRVH6v0V+4wDqyFJBrVWn8Hfty61zy33vctI7pmXrWU6Uc?=
 =?us-ascii?Q?56QAkEZXIGi5jKd0HpEH68ZPXdok8UZZPyKgkIJNmNrZ4oUVoF2nuv6y3fzL?=
 =?us-ascii?Q?yJg/ZX8KnSmV7FW5Iwh50qF5mdoZEepohQwttN/5qx2STRLrxJKmrDjiSYF/?=
 =?us-ascii?Q?UAYFZmsfN4MLTWbS1W3zsEyiMWtHTMrBzNmxc3ABz+pN1di1VZTLIibHmuDe?=
 =?us-ascii?Q?lp3cwbQ3ZTLjGrE27uWHhAN6F0K+n1A+SbG1ktss0qjtYfyyBhEEvAb7lLMY?=
 =?us-ascii?Q?1kuiF0T+NSU+O02HiXdC9Y2koxPhBlaFl88vHV0SZz/D5561x5RbCeyLQMPN?=
 =?us-ascii?Q?HIbP7e/Ny3WizyzV9ifTXDCAuPm/NBqUtowAxAlgw6mdFxYjCp1rTTg3N4qE?=
 =?us-ascii?Q?LY+IY18K/1JW/F1HJyMHV6CBvmFfAOsEsrt6HDKQID0K0VVEFD1lmP4penie?=
 =?us-ascii?Q?ScnA6CmHUPM/kL5OGwtsLUwFakhDu8W8Bby/ehTAGGQFMOV497sgh3imbLzH?=
 =?us-ascii?Q?uY7mwSAKcl5qxm4dEzU3/VpkbkQf3h3KvTKorWFKVe3CyM7+/F5PCR/pgiy6?=
 =?us-ascii?Q?Jqx3ExZrj6eIBbC/sViEXlYOAMPcbdnrNv++NtaFPmaWHKLVpSM+ylkQln1Q?=
 =?us-ascii?Q?Y671RefC/DZe6qacnz0pckYCuy+CIU+JL9C/3UbCHp2R7+rmiq2xYdQ35BAj?=
 =?us-ascii?Q?18ibcx5O0XJIwvwmY5OjQkLxJiRmwtwS5ATxhmXpbBRCdC7OhadroUaOhCpG?=
 =?us-ascii?Q?lizp32MddxljHhEVYEh61DHdMmiqSyjT8+g/++iIr0Q2bpZFGXgaXbqLl+3p?=
 =?us-ascii?Q?fuqjdK3SNQfhwYg5JcNNOKN1RII/osXgb1Cd48qdNZ6mbIPEFlEEqUg/aSg4?=
 =?us-ascii?Q?CHYjtuFni/4GcS1j5fTO28Jscr8+0ZcV0Et1Y/c5cDOU5iTbVaXEs3UmrRhd?=
 =?us-ascii?Q?IrARmyZCYxXP5katWNkRSmXa9LoenVv8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WfF6ghU3IfEtjR5I8m5oqBGbqNiXhQ0VSwBIhBoD1gUCGTV3oYoFr6aZlOsP?=
 =?us-ascii?Q?skrh7KXaFqTrHj7s9HR1muXvw1Nc+T6LcjDxXimioXyZRUVxzhpe5pufMYag?=
 =?us-ascii?Q?V4S5XhgW/UtYbcnUOSDCaBCl62iaPIxHGLCY2U+5W6adO+465i7/vMPTAEbR?=
 =?us-ascii?Q?n3bCf7vsZFVk7G7zwD1u4QsNd4YlXuXitMKNFRnLGHUkjdCapLvb9RoeN3v3?=
 =?us-ascii?Q?grniGy6C/oX8oeJD/wfAec0fUGtKlW2EdTDfDRgRrjHauJGZK4LcuZfPRKys?=
 =?us-ascii?Q?DRI2nEhO2KzTE4ZtReKylUnpsG5FRcyw9vPd+k3aVLrSQdz7gVeqvW4uOELi?=
 =?us-ascii?Q?FzQQVVLNHM6/KdEFdk1tkS5uYw6wPYqsdBoLBVehoS980JsKHMKTZG0kI2Nc?=
 =?us-ascii?Q?YH/J450MN5efV+A+e5GRsytT5K4NouWPOx4fNTJN9sy/hW+JDJRCVlJT7Cfb?=
 =?us-ascii?Q?TMbR1k27r5qnfIfILylkHU3l4si4R2Z+b3EjPl/6xrgCX43a4XL9SHXccyMe?=
 =?us-ascii?Q?K1BteTBmeVh2Tk3DOX4czFlmpr6dYYEREg6z+3AhLvdMyiSPVlr7wGVTxtgv?=
 =?us-ascii?Q?QQ9q/jAw61PChf3BnA6kWhlvH5ojerDlG1euvnW0LoaZ2a0edQGBUk9984fV?=
 =?us-ascii?Q?HBJr0gXp38zcMsd/TFcLd66uEWPWB6/CvexLye8jC9FzrFYEGBYinjBjBeQi?=
 =?us-ascii?Q?sPFiXmEJrjCNbgtMGkhZ5TK8kjSbmXwZkW6QtYuGm6fCtZymroPVUaiUnw5w?=
 =?us-ascii?Q?tPrGMxA+jEBnq1JQM09fqpDJV7HwmkfkFOd0khA0Hf/BJNPyg+pHgnF9paBB?=
 =?us-ascii?Q?3/tgzaxEmQd3FU6XES5qESIN3b41+vZ6lwSaSu/R9gGtYsjDDuDm3yJCglw3?=
 =?us-ascii?Q?M2eRyx08mwECFowHXdznYEhUeaYi7ldmjxOMRGUoRzcqWzDL1hQlhl8n9h13?=
 =?us-ascii?Q?pGcXpRp92YUzdGn7ESijfuBApmoao3xp/937b1sPQ5SdCMvGeivDNALQ2Azn?=
 =?us-ascii?Q?EE3g3ZPiwg25gnuVRFv/vNaaf9fF8CQ06EPByqDdPJIA+CfKwQ29WN/vicuS?=
 =?us-ascii?Q?/OghdjeYYjqzp2bvZMx87jscqfpnt36z4Kn5PYW6y8eAjrgm82xp1JZDNz8G?=
 =?us-ascii?Q?s7gZgglsOjUxlkuM/RbS05UIC7OGQCMPijsFYjhsm9leqkxCZIxHZeRct2G8?=
 =?us-ascii?Q?zveg8ePaB89HwG/9XIVzh+snX0YU9/1b/oaDBfRBdW3mY42WmAC4iaTKAvfD?=
 =?us-ascii?Q?F+fF20SY/MAY6s1PQ4zW69px9CSZyo5B35YeIXvo2L+bbLhiIvbwTKPVjLmT?=
 =?us-ascii?Q?g6pi2L7CDwTdi+XEcIfQy4irpztyv364i5vdFIp+gZIXwh2nY9OHSFIwEgPF?=
 =?us-ascii?Q?YsoxCY2+g5Agzc+Oyh3TlDn/sG35XgkRoxJEJOGQI3Zv2xAntHrRb1bQ/noH?=
 =?us-ascii?Q?NpFhuSK31pbTqn2w8IyPgVDJkbM7brYhRQrUcrHa9rYL/gZt9gEJry0hSi+y?=
 =?us-ascii?Q?TM+1jczhF4+LKZermmo4ZhHIIcOkkl6LpRTaq0i50VggkIdt8N4SCRXKLKWE?=
 =?us-ascii?Q?aPZ3+XFXN5zN4xJ9go1SqM71eUkzu3romVLY5xTG8nWvfEJs6OLyLZjNmAv3?=
 =?us-ascii?Q?CxPeh1aQpuNjx0Gm7iy6mw8JdpNRlfHNOdRRnQS2JDwB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 449c1776-d133-4148-c7f5-08de2ddd8103
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 17:50:51.0216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ogE4jqOQNJEFPBiP3NpR4ExCBOLudwNhvS5TtGknTsaIbY7NKvWlsVi24zkHEjUVn+DMZhV6BBWi2NlA7BpiQ==
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
a particular slice count before using that slice count. Add the helper
functions required for this.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 82 +++++++++++++++++--------
 include/drm/display/drm_dp_helper.h     |  3 +
 2 files changed, 61 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 19564c1afba6c..a697cc227e289 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2705,56 +2705,90 @@ u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
 EXPORT_SYMBOL(drm_dp_dsc_sink_bpp_incr);
 
 /**
- * drm_dp_dsc_sink_max_slice_count() - Get the max slice count
- * supported by the DSC sink.
- * @dsc_dpcd: DSC capabilities from DPCD
- * @is_edp: true if its eDP, false for DP
+ * drm_dp_dsc_slice_count_to_mask() - Convert a slice count to a slice count mask
+ * @slice_count: slice count
  *
- * Read the slice capabilities DPCD register from DSC sink to get
- * the maximum slice count supported. This is used to populate
- * the DSC parameters in the &struct drm_dsc_config by the driver.
- * Driver creates an infoframe using these parameters to populate
- * &struct drm_dsc_pps_infoframe. These are sent to the sink using DSC
- * infoframe using the helper function drm_dsc_pps_infoframe_pack()
+ * Convert @slice_count to a slice count mask.
+ *
+ * Returns the slice count mask.
+ */
+u32 drm_dp_dsc_slice_count_to_mask(int slice_count)
+{
+	return BIT(slice_count - 1);
+}
+EXPORT_SYMBOL(drm_dp_dsc_slice_count_to_mask);
+
+/**
+ * drm_dp_dsc_sink_slice_count_mask() - Get the mask of valid DSC sink slice counts
+ * @dsc_dpcd: the sink's DSC DPCD capabilities
+ * @is_edp: %true for an eDP sink
+ *
+ * Get the mask of supported slice counts from the sink's DSC DPCD register.
  *
  * Returns:
- * Maximum slice count supported by DSC sink or 0 its invalid
+ * Mask of slice counts supported by the DSC sink:
+ * - > 0: bit#0,1,3,5..,23 set if the sink supports 1,2,4,6..,24 slices
+ * - 0:   if the sink doesn't support any slices
  */
-u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
-				   bool is_edp)
+u32 drm_dp_dsc_sink_slice_count_mask(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+				     bool is_edp)
 {
 	u8 slice_cap1 = dsc_dpcd[DP_DSC_SLICE_CAP_1 - DP_DSC_SUPPORT];
+	u32 mask = 0;
 
 	if (!is_edp) {
 		/* For DP, use values from DSC_SLICE_CAP_1 and DSC_SLICE_CAP2 */
 		u8 slice_cap2 = dsc_dpcd[DP_DSC_SLICE_CAP_2 - DP_DSC_SUPPORT];
 
 		if (slice_cap2 & DP_DSC_24_PER_DP_DSC_SINK)
-			return 24;
+			mask |= drm_dp_dsc_slice_count_to_mask(24);
 		if (slice_cap2 & DP_DSC_20_PER_DP_DSC_SINK)
-			return 20;
+			mask |= drm_dp_dsc_slice_count_to_mask(20);
 		if (slice_cap2 & DP_DSC_16_PER_DP_DSC_SINK)
-			return 16;
+			mask |= drm_dp_dsc_slice_count_to_mask(16);
 	}
 
 	/* DP, eDP v1.5+ */
 	if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
-		return 12;
+		mask |= drm_dp_dsc_slice_count_to_mask(12);
 	if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
-		return 10;
+		mask |= drm_dp_dsc_slice_count_to_mask(10);
 	if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
-		return 8;
+		mask |= drm_dp_dsc_slice_count_to_mask(8);
 	if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
-		return 6;
+		mask |= drm_dp_dsc_slice_count_to_mask(6);
 	/* DP, eDP v1.4+ */
 	if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
-		return 4;
+		mask |= drm_dp_dsc_slice_count_to_mask(4);
 	if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
-		return 2;
+		mask |= drm_dp_dsc_slice_count_to_mask(2);
 	if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
-		return 1;
+		mask |= drm_dp_dsc_slice_count_to_mask(1);
 
-	return 0;
+	return mask;
+}
+EXPORT_SYMBOL(drm_dp_dsc_sink_slice_count_mask);
+
+/**
+ * drm_dp_dsc_sink_max_slice_count() - Get the max slice count
+ * supported by the DSC sink.
+ * @dsc_dpcd: DSC capabilities from DPCD
+ * @is_edp: true if its eDP, false for DP
+ *
+ * Read the slice capabilities DPCD register from DSC sink to get
+ * the maximum slice count supported. This is used to populate
+ * the DSC parameters in the &struct drm_dsc_config by the driver.
+ * Driver creates an infoframe using these parameters to populate
+ * &struct drm_dsc_pps_infoframe. These are sent to the sink using DSC
+ * infoframe using the helper function drm_dsc_pps_infoframe_pack()
+ *
+ * Returns:
+ * Maximum slice count supported by DSC sink or 0 its invalid
+ */
+u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+				   bool is_edp)
+{
+	return fls(drm_dp_dsc_sink_slice_count_mask(dsc_dpcd, is_edp));
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_count);
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index df2f24b950e4c..85e868238e287 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -206,6 +206,9 @@ drm_dp_is_branch(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
 
 /* DP/eDP DSC support */
 u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
+u32 drm_dp_dsc_slice_count_to_mask(int slice_count);
+u32 drm_dp_dsc_sink_slice_count_mask(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
+				     bool is_edp);
 u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 				   bool is_edp);
 u8 drm_dp_dsc_sink_line_buf_depth(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE]);
-- 
2.49.1

