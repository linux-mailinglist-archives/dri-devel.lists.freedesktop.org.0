Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EFFC5FD47
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 02:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B4D10EB70;
	Sat, 15 Nov 2025 01:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jCtMupPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF4710E0CD;
 Sat, 15 Nov 2025 01:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763169954; x=1794705954;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iPExCk3IoyHhYPVE40ddcBvRNJQ3dzOYx5Nkt2dYcN8=;
 b=jCtMupPOP/CrJDBz2KCc8CKv9uSBTpQNlD5ew21ukted9e6+TtUwhPxn
 5iPwEXpE48mnxDDe9S0EHnq9DkZtzcCX4pRNIaZdjJ8Rtv5uQNfB71/pW
 PDTza2FyGPQz/70gz/maagHQKdrlr57RvU9YnfVCei2KvfnynEX8gt5Po
 8ToUoxIOJzDjkBBtIEarAiVI+w2GdoMFKrVqCbTBvKn2VdxiAK/FvHQoC
 FVE/j8L0oAZNVHMO0maUEjKEhuWfS19/nItiigcBuN9+ZuP/g1PfNVgOm
 UP9todf1TGwODiMCNtUmVI3tGtWRgz0JltsSPO+K+ieE1m83LkzOv95NX w==;
X-CSE-ConnectionGUID: nWECr12HTheFm4DQbx0hHQ==
X-CSE-MsgGUID: VuyxIx3rRS6AGtXe/JinXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="52838224"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="52838224"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 17:25:53 -0800
X-CSE-ConnectionGUID: aURj6TDRSuGtYSLO1Tp36w==
X-CSE-MsgGUID: qnAljBisQU2tIH8L0jrOfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; d="scan'208";a="189938871"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 17:25:54 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 17:25:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 17:25:53 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 17:25:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uR6SWNYKwiZLSGR0wKDR15vgxvWPE33RpjM+AKAdJ3ZLl5zHI4YsbANOe/klsxuCE2wOurOoXJcYgkKxVQoE2vHWxTl/W1MWkAUc0loTMJH41As0x0cOiowGRGrL15VyQV5Dt0QvbnPrEtfHBJZJ8MbaEKYTkQuYW9F6VTChZN91igd1jdXlsQAsXMbEN8F3Zcm8Q3P0j9nJzYaZfXKCc2S29HdaQgOQKmMIi97q26oSc970gv4xdihWeHqqRS9Om/FlCMLC2C9X1SoXLvAnqOBkwh8MKj/RKiBcSAzxBzOqGiVnsK6kZQ63MJ0JckqaSqrN62ohMXsxSVdhWMCj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S63QONS3+kex+rnYUOJIXLMMRKxHG/qJHc3Lt5/XfSY=;
 b=WaiMKRu09XID95fnhsgCWRrKOmA7h3SD9KFnu00TjU5db2sHxnKLLyiPoYKr5madTuOPyCxQNeu1d7zspvrE2KrQjh8lRs584iCUTgxf3LHi2QhG3rir9OLqR+Gjp5Bt1yvBTJivkewrnd60igXcxOsXqNqzTTpZyXYioCCXT+lM895WF1OF/uiY1qC7mUV4j9kqB3hqOfvl/TVbEBrADq7/xKTVtliAirmj67dgUI7J5wpsRxV0NZz+jD4AOnle4HWxuEdOoTVtDn6OmyMe3lxT/fXEI9XaO1dT7TQJF8maCpnmJosylbL5Igl57/ewQ5OPIIFDBDxayPAG5GBkIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by LV8PR11MB8461.namprd11.prod.outlook.com (2603:10b6:408:1e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 01:25:50 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 01:25:50 +0000
Date: Fri, 14 Nov 2025 17:25:47 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 1/7] drm/sched: Add pending job list iterator
Message-ID: <aRfWm7zRm3UodJKX@nvishwa1-desk>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251016204826.284077-2-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::12) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|LV8PR11MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a53a97e-778b-4c1e-1279-08de23e5e97f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B6Jhntv8zhZiJw8WPnDcCM9hA6nQABr8+sd6QgBI13+1PG7oTPA0FzpoK4BP?=
 =?us-ascii?Q?0SBdFLEhiaqJHO0EllCUKK4kGxbikCY3MdtOtaKRLJ4zwbU2axRq5XpXGmDo?=
 =?us-ascii?Q?Xdico/wzg6D+4KIoVNW0qhDo+QDLBCpJJydUq4F3Idx263jkq3A8QTtKpUvw?=
 =?us-ascii?Q?mUZvFf61p8B2K9+usmVSfIP30fpn8FERD/YyQP9f1mydXoxe3bsfH6UOQsnO?=
 =?us-ascii?Q?GFtlYjPS/xlQZODEaavSnRF43GtCFA1wualqxaMg8jUAzXNqUXVX2LPHGaOC?=
 =?us-ascii?Q?i6ul+J28czyXFrFxVsaKlZDFzEgfZGl4Ef6d00eO2gmXsYc6NmPk3xKQLEGj?=
 =?us-ascii?Q?xq4OJtLugWTs1AjW+ji0R8HnI6q1o+3NW85DwM1YXdRRl9Qy5rC8KcrcvDdM?=
 =?us-ascii?Q?t/fbrBfSAfj9sgEs6ot24xBUxh9ij+hpaZY1obFFUP0t2kv4ohhoi+pBv5Lu?=
 =?us-ascii?Q?u1v2w2cRpeNq9jIsQqWrxUKOcfVlRP82UeDqlT+PQytVMwEGbvcJgQoChQVD?=
 =?us-ascii?Q?ujXS2Wcy5LZTRz2lQfPjoEGvBQrS2MYHRXcT8U6zaF5r+gZaAlIPqCK4x4ej?=
 =?us-ascii?Q?iSseMkVFJ4/Ht+3NRzdVhcIiDcUfhB7mWMXUj9Dhzr+7G/kXeuA/Rvn6DRV8?=
 =?us-ascii?Q?o+mRSn5y70TPkNRTbsS7+XfQe3PDAMs3LkDwaKakgdwXGMlyMoGOG0BZATAC?=
 =?us-ascii?Q?I26qL3QuAurT4PxifnAlqptpg1fDCAzHYEo92WDWBu/q0XI03Ads1syp4Bm/?=
 =?us-ascii?Q?ypi7CRIaYXl4vD23nJEasJvCqk/DpcLsxJGRWLeL+IGe/R9fd+iBRfIyGVIz?=
 =?us-ascii?Q?cTunNBWTeWeINTifj4zeuKgaqycxGo281AZbfiDMatzyjV8MwrK+Ke4/ViZR?=
 =?us-ascii?Q?1XP4+nXUoUSQl/kb7dA2c0x8J3MefD+2AaZR+TZnYUxqNGJzgUQz+DgOh416?=
 =?us-ascii?Q?1O+Xz9f67th8puGcWHwyHuZ9AOs/Wr8QZTQa6p2Un8tpe0wQHdRRFlC2osb1?=
 =?us-ascii?Q?6Y9nUOh8/dWThmQ6VIadw8cBN+upetRFwl7Uyu4TdZVTnTdf6eOIPr1SqllK?=
 =?us-ascii?Q?gEUdnNUOeBvrJveaud8+p66UYU561rdRkMGsFuwEa6PaNXaS/nFdzp6n4PAp?=
 =?us-ascii?Q?zHPBK31clZmhT+3uZU2nALp9wMmvShjJmU1HbLpcR0jVu9mOO/V0rlOS151o?=
 =?us-ascii?Q?iedoLPd4GRGxH5d0QWhzKwWMcYPfHQSfguOBplKjzshl31L/4yaRYWVUS610?=
 =?us-ascii?Q?Ojjx2Esh3qcLWOj7S4i9+j8Vs5FEQtpi2NknwDbngZqKxtm4iK0Z574vCWPx?=
 =?us-ascii?Q?F0msD6vEvLzi9F1zUpWwK1gLFS6L/46Ol9KG0evg6VfzlcUr46GS9qyjwQKt?=
 =?us-ascii?Q?+FveFc/sDHvMu3beQxknv2nsK7k0KOrB+Wd1hm+dusUjgLbL6iNQ2iJnrGuR?=
 =?us-ascii?Q?Qv4RzEBchduPGRiYmoN1newwoZ54puR2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FK1L4XohjT1o5IygxVbvielDuZzy8O85YYDBB0/YCXbTawRuuvnYldMzw63j?=
 =?us-ascii?Q?3HC6gxO3B4J+5XP+oMHFZ3KtpzEWR3N6c/MBpgIcfVV0Xxk2UqbDzS7FfTsi?=
 =?us-ascii?Q?oPcLXel0SHVIC+CKrNYEgUhI/Y0Ve8nsTgp0NnG44BH5X9oemIwk7Qa7Ztqn?=
 =?us-ascii?Q?TApQHAdif4qN5pNoQ9sHFptleQpc2FiQDU7dJXCLdN7e8u8AIm/YBoP9GSBh?=
 =?us-ascii?Q?vm5h8Q2geVSfd0ThznF72ZfS0BPOHMSk8Ob6Mit9VcvmUCnT6FB79LG175zT?=
 =?us-ascii?Q?7uVeWkRB8iuomaUd09K1IOaWM01rqic3VkMXsW9kiv/sBtmzB5ZsUAC7dWih?=
 =?us-ascii?Q?P5CXS9s6CD5VztzGMcIpQ6l5g1SvCOKVnZ2iyalhtiBgj7V5GN6KLdFDun+Y?=
 =?us-ascii?Q?xSo/06MFEMHwGKbBh16By0+17mV0aPhBMMZcHB189QufPYHEtnf98G5RNgfV?=
 =?us-ascii?Q?gmquh3BmrFR3uHEdwrLZ/zH527knhpeWR1WvDGCae0Fi90LapQPpBqibUvu/?=
 =?us-ascii?Q?WKQcoTZsx+Xro1mloYdzHHRgbQJ1iKJoCZAfeAvzvBC1g8KUJDlIlaBmZU4O?=
 =?us-ascii?Q?vTuk5EbVRE1qL/pQfngN4pH6r2h8bnyR332tXfBL8TIuxV4pvdu8+NlELaL+?=
 =?us-ascii?Q?/N3ko060WGVYz5BV1uGsVqOlG0rxS2mH4anGTydZfoNtdpDd7DhDyBtzC4GX?=
 =?us-ascii?Q?oOmUHkztznq1gQ8A9Nkqyj3ao65DPN6/E6vOSFQhSf672Vp+eYfCP2qaVcu6?=
 =?us-ascii?Q?kl2HkK1I63Z/Wg/X9K1j6ZBVv+j4aWBrE/euiyFcVnzfzYsdoXetvhO1iFcO?=
 =?us-ascii?Q?z82mLDEu8P3EVG+27zswcg1e+t0aMR1NPATEo7ygjE/33FHSxgXo5rq9Ryr1?=
 =?us-ascii?Q?cSxzkxEoJwwzYf+89S+MmtWLKxBHVSLTyvZ2vjOZfy+fX/ZOGgiJPhLWpjiw?=
 =?us-ascii?Q?XO4vTMBriYeyDZHLsTHrw2fAdQjHosSN1O9EzdFfeNqxjiiRuiFwL6pCA/gS?=
 =?us-ascii?Q?M+vi8bddfRLmzijndQMHa/GdYrtb6kI8ydBhcjXITlDYQGx0nwQbK/z4pw2B?=
 =?us-ascii?Q?dDkq+dGbj6YEa8u2RWToNk23dX2HUkgYyPG4njXOobAZj70Cd5H1PJJyN72d?=
 =?us-ascii?Q?mrLxGqoPZeKIisLONCOAwKWQPA9HbHlOuih6taHbZ22Ek546VimR5nrErB/G?=
 =?us-ascii?Q?VqgHkTk32g2Nl4MPvEAh46sqDtDn6Ff1QH8VUEzw4KAPLcMz1xxV9Vlvjq3D?=
 =?us-ascii?Q?wtDAC4pOHDDZN5vnH5wnxugBLF5npqXOMuhosh9OGm0vqZ4pW7ESAoLkCyTF?=
 =?us-ascii?Q?CWmriWnRPKO+U3H4e4fJcr9HFDDIWOMF+fomJDQmpu257yWRFzyYvUUlRoUH?=
 =?us-ascii?Q?qk3MnJBLtMIEJf6zMLY/IhHUwGGpNNRHPXEH4hfi0YGUxL8XkWGWneasfBLF?=
 =?us-ascii?Q?xqR6iu0kPoAnZLeuNCXfe58zy9nfXDI2RWCqHjpH8E6IHpF3qfTa5TmCW58b?=
 =?us-ascii?Q?fXlWrBCNYQh8Sp/4MjwXEii/uZUi1T4CyvqqtcrHoez5kRQzC5H5bE1914dJ?=
 =?us-ascii?Q?1G/vbpWSQVDE92vy7rqF/ayuLPBTK9t2bDHD6L3pmcZ+brmRdQwxB8zHfhAH?=
 =?us-ascii?Q?rNAVlCrXpDm13dbBuahfn88=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a53a97e-778b-4c1e-1279-08de23e5e97f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 01:25:50.7321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBGoynnDVCB8UL3Jq8FZztX+xRp6WBlvawhAFw8K2p3mQbRFB5Sgp4ADscnN9RbA2a4cImiLkVvtpHt+jwrJ93pQBdBn2bOQU7aPCJ8RYn0KzKVBBixOZD10uAKcj5zx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8461
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

On Thu, Oct 16, 2025 at 01:48:20PM -0700, Matthew Brost wrote:
>Stop open coding pending job list in drivers. Add pending job list
>iterator which safely walks DRM scheduler list asserting DRM scheduler
>is stopped.
>
>v2:
> - Fix checkpatch (CI)
>v3:
> - Drop locked version (Christian)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> include/drm/gpu_scheduler.h | 52 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 52 insertions(+)
>
>diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>index fb88301b3c45..7f31eba3bd61 100644
>--- a/include/drm/gpu_scheduler.h
>+++ b/include/drm/gpu_scheduler.h
>@@ -698,4 +698,56 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> 				   struct drm_gpu_scheduler **sched_list,
> 				   unsigned int num_sched_list);
>
>+/* Inlines */
>+
>+/**
>+ * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
>+ * @sched: DRM scheduler associated with pending job iterator
>+ */
>+struct drm_sched_pending_job_iter {
>+	struct drm_gpu_scheduler *sched;
>+};
>+
>+/* Drivers should never call this directly */
>+static inline struct drm_sched_pending_job_iter
>+__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched)
>+{
>+	struct drm_sched_pending_job_iter iter = {
>+		.sched = sched,
>+	};
>+
>+	WARN_ON(!READ_ONCE(sched->pause_submit));
>+	return iter;
>+}
>+
>+/* Drivers should never call this directly */
>+static inline void
>+__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
>+{
>+	WARN_ON(!READ_ONCE(iter.sched->pause_submit));
>+}

May be instead of these inline functions, we can add the code in a '({' block
in the below DEFINE_CLASS itself to avoid drivers from calling these inline
funcions? Though I agree these inline functions makes it cleaner to read.

>+
>+DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
>+	     __drm_sched_pending_job_iter_end(_T),
>+	     __drm_sched_pending_job_iter_begin(__sched),
>+	     struct drm_gpu_scheduler *__sched);
>+static inline void *
>+class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T)
>+{ return _T; }
>+#define class_drm_sched_pending_job_iter_is_conditional false
>+
>+/**
>+ * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
>+ * @__job: Current pending job being iterated over
>+ * @__sched: DRM scheduler to iterate over pending jobs
>+ * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
>+ *
>+ * Iterator for each pending job in scheduler, filtering on an entity, and
>+ * enforcing scheduler is fully stopped
>+ */
>+#define drm_sched_for_each_pending_job(__job, __sched, __entity)		\
>+	scoped_guard(drm_sched_pending_job_iter, (__sched))			\
>+		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
>+			for_each_if(!(__entity) || (__job)->entity == (__entity))
>+

I am comparing it with DEFINE_CLASS usage in ttm driver here.
It looks like the body of this macro (where we call list_for_each_entry()),
doesn't use the drm_sched_pending_job_iter at all. So, looks like the only
reason we are using a DEFINE_CLASS with scoped_guard here is for those
WARN_ON() messages at the beginning and end of loop iteration, which is not
fully fool proof. Right?
I wonder if we really need DEFINE_CLASS here for that, though I am not
against using it.

Niranjana

> #endif
>-- 
>2.34.1
>
