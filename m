Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FDAC761EF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 20:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203AF10E7D1;
	Thu, 20 Nov 2025 19:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WX3x9HxQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B6C10E2B4;
 Thu, 20 Nov 2025 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763668100; x=1795204100;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dvyKf5SGWGbvyRU049FI+PHU3rSyJGS/2kUVMnRPsE0=;
 b=WX3x9HxQgVRoEz4NmTqsl0C7Fuvi2cDV+nJBVQnuVbK7xABrNNPHLZaV
 xVd05puzxL/XMhEJayloo1FocASnlEwrmR8idFlZTMuAzCGCJYquVWLvk
 RSoaM9twOGSq2gB3S8kt/S7ohdwk37Z5O7lAOzmubYv9lTLwgRrZs2x9M
 KLlIK+gyAyazBz3SzLIIE7MJ4xmujuRJvqMyjWKBc4TxTh6y7hN+t5UFW
 KW+viJ5hz2Dk1poFaSHRB2BXbSS6o1lvtqLvfWMVL9DnNohE5D78YbvMb
 GTGeQtHM97wYS61oB7IJuh6BCR4pZYcKU5llPJYhqsmr2p07vr1OaPdYo g==;
X-CSE-ConnectionGUID: 4uCRnOAxS7aMvCA/dVTgGA==
X-CSE-MsgGUID: Y+2P4CPQTjCXiTvAKuXEhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="64944198"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="64944198"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:48:20 -0800
X-CSE-ConnectionGUID: kUpd1pLCTo+cP9nPYCdm0Q==
X-CSE-MsgGUID: PV2sdYxwSGe/UW6NJgtlhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191712890"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 11:48:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 11:48:19 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 11:48:19 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 11:48:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0L+RX9sIZ7yMBpZAro0T8Iu1EAUGu1Kq0ZPkQOu5JfgA/B4STOTluDPEzA1rNeN3LMtrxSw4lcw3d5EvAcS3uefJLgTwe9AUbQXzAzP9I/2sMy8gsZitEpoqSryLKJkvaaWsIQe8IyGE8LmjoTNXs3fZcuVqUD/jaGw7J55lSh/bV1SEgJKyZXB3Ekr8QaYDI1X/arYYePDqAKJk7IycLWm9m8pv3slxkAKxIKQ7EzSSqWc8JyqO7EA5BLKYkC2r6b5ckK50q1mQ+DyZ8EeW6Hr7fYx0Nm0Y1vHaiAKnV1RFDYHgLuMLzVYRrz+yCasRzGIpqLj/HTJrwELq6+FLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQVK6ZSaTmghtWZQdHgIzdfyPdDi4njbDCMJedKtvc0=;
 b=NG7IccRJTMrmutQCDlKuwD6IK5xioEFztTgdJI74OYIb0LojTz9hWTXmpzakuoKdSPf2EFal1tPokycRfhmTO9RY+p3c4IpiqIf6xFxuEth2SlM26KhW5bVZnVCuA5N1/DL4fYCMJ5WReh24667qzQvQebHnQGXvW+JFQfUzkInqRDvmhCso1bJ5tfwKEdb9rCtWWY6w5/qsZg3u0kYO775XHfRaPV4o91mQvYN+6JhWOWiJlED44Ed6BAguPNfvVN8JLEwa69bPEUjs9zD299L2JDMQLd2pvEKjVkGahaYScqyox6+WyPlqmlfuqEsRgG4Ok7o7hrYIKrXY0KXULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 19:48:17 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 19:48:16 +0000
Date: Thu, 20 Nov 2025 11:48:13 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 5/8] drm/xe: Only toggle scheduling in TDR if GuC is
 running
Message-ID: <aR9wfT5Fo1cXJOMp@nvishwa1-desk>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251119224106.3733883-6-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::7) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ec7bf4-4a3f-433d-5f54-08de286dbf45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9uR4/WVe4reQ+jk+EyLqWJemGm77fgEfRXn0YB7dmyGD0QxE1TX+2noss+D6?=
 =?us-ascii?Q?MOl6udBpjb5i9Cso2To84HjveN+Ukcgoj353ZELiCHlaw2LtNUqthckaWZ0T?=
 =?us-ascii?Q?6Ts2b04srTSQ8Q2cN+u7qARc3DNp7i+89Ms3Z8vlI39AZlCfSuQO2M2ZENM3?=
 =?us-ascii?Q?75PSbed8JaiPintVoW7pRvpB7o74QmWcL1Yfu9H4woe+cHT3oq6wVehOcveg?=
 =?us-ascii?Q?9KSIyoF8TgEsmfZaIz5Bo+nGttGGxkPEkIXkncoq3CvePDXtF1NGSm+mKMVO?=
 =?us-ascii?Q?uSodhbFtszfHwOSOIlXfqJGEuHunjug1VMSupTOYxMZFhwBtKLgBQwYJCzSz?=
 =?us-ascii?Q?PMF6TX2AtP9QcrAV5Q5798imnxxcCrVcyZFzFkjk9W+9E0xLt5fo9pUmO5dI?=
 =?us-ascii?Q?FlG7zTOEP+aUpJFnQsGUYLXrOMavmCfGhdQYa0DJjeWxj/SNB1DJk1KKl095?=
 =?us-ascii?Q?/pL7eyr9dlfMILiJWEvlcXYZCqHAQ/0QL3+OCV0adUo30g0sMvmza9CHuaEY?=
 =?us-ascii?Q?vGKH0UJ2TIccgjCHPUzNQGC31n6NCMnWCtFNQxkxsAJntmDO5/4tMlAA1x8E?=
 =?us-ascii?Q?Whbzcwx8GjXUhIVgEwKRUrvBFwjdfivNG5uKxeHhUv1ftasYi1uFLh/J5SF6?=
 =?us-ascii?Q?IVM5SRP0iYpKJRt0QK3C9duVyCmeEUp5dmXVDTku3ar4QWlFQ9GBD2FSGhWg?=
 =?us-ascii?Q?kYYIX9YxknVlGaZqbrR5CdcO9YRi7P4EW6TDmH328ozxdjlTmX5s5G0YuA1f?=
 =?us-ascii?Q?6G24iMWB9lY/u2tL3Ehb/Vvgjj35ii0cOTvf2cL3dqgIilIcXFeuieRJnZLF?=
 =?us-ascii?Q?e66d9ja5QxtFSgwCgVawtq8JO8k/btJMRXmEDIf6ABaJhCpyEB9F/PaVdNhE?=
 =?us-ascii?Q?Tida4x6cmhyBZYAHkpbpSuTmWcHgwdO3kjV/LAcUQeWII0kXW8QluoIYg9DU?=
 =?us-ascii?Q?Pq6NKPw00vLLnF1rP/l6bIgaSVkW7yf/dKehng9SW7jARp1oT+df/a/OPw1o?=
 =?us-ascii?Q?+oK3d4vgduCfdzaC09tPeIcKc/OF7/wvW790+cL1uV3uUPaK8Bxeb3VkHud5?=
 =?us-ascii?Q?5k9O2dAWs0tZobzIKxYxv5XDXHyr5cQxdrfhIgvFf2OJ1wJctjhutvYYd2aW?=
 =?us-ascii?Q?tjRIH9pPcR9Y2r+eZesBaBHYgfUkBXWOjz3zBSB3Q51mnfF420vrwNZ5OZwL?=
 =?us-ascii?Q?ifxgfgZ/bDW7qEOcZJs9KmnDw99pUDuA9k3J9mI45733TYuKxh7Vo8XF7vqw?=
 =?us-ascii?Q?HD0/c0z1FshuQ+2phniDKelOU6klVITXZsK9Uk0BRBaWOvo4OjqkRI6Qffet?=
 =?us-ascii?Q?ua5DOCwCwxZ0S9wWbWae9HMewHJRFPtlIPEJlAQp1jVG9SgUEDgqzUlcAOAM?=
 =?us-ascii?Q?CLwj0nlTIwQ81GgBd1xslLiHanqQVWTXLVhFelm7IbkFhey6wwXZ6cqTq2S7?=
 =?us-ascii?Q?ZbYrq0Orwc06bEPe7kbhxREKCtBvZEu7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/YRQuwdkedQPojBEWi8AxR3LNp1zbpMqFYfubfEKoyzyb3Df1/DfNq9fS42G?=
 =?us-ascii?Q?lMDn3pGYLuGwNtJ/JpAdHlU5AX5RPW/cf0qvztH5hVT2G4GTc/BkzVXCcl/+?=
 =?us-ascii?Q?g+TMsMoDGJwNwP0twv4cm5jpCh3HP4lVT5+BFqeNX5VLH2pfEFZ5yJI/a9cb?=
 =?us-ascii?Q?luhUckN+MTrp7N4PJnxcAakcD3XZrktlgJSD3JFgaOJed1cZBqldvuetuZY2?=
 =?us-ascii?Q?ydv53/GO80P74aJdM8tf3+X8V2P2KuA4QonHDGhsoa0/GG1bPtnqg9yghRgb?=
 =?us-ascii?Q?wOqw/Nsej1mPrs5mcYHozyfvGTB/B3Fq7aDM1/GENzYkdBf78jQ9DrClEC/A?=
 =?us-ascii?Q?+POf2u/KzJw4G3VjGBb1Eybs4S1gx91AmFDkSbFPj48fR6F8fTh5fKNtEi0e?=
 =?us-ascii?Q?HwaRDOsY67k2/00gQmaeqlO24Xf532YsZHoExv06Ae+14c5dp9NUb9H1czN7?=
 =?us-ascii?Q?GpXxgAi99CYJL2W/di0faa3CLYaMdVRpyBMBEyUiSoaPjeu3O4uYl32Ipepv?=
 =?us-ascii?Q?m/OZ+53AGQ0LTnItzelEbSY3Vg5/KMXRjIJh31jB2Io6TmQGpS3Dv8ZPBd/i?=
 =?us-ascii?Q?hQHcMddvy/Ybm4VSvHOivsaSOuZAgdeBV0qaRg95yk2cF3Hb7Dbl76BljpHX?=
 =?us-ascii?Q?1jeh3VHheQh3pA7wJGKwvXlapWV5bJIh3JXFo8HADx8TDuHeTQzN4ADxBBQa?=
 =?us-ascii?Q?uf/LDJQCDUqWrPJO+I1SHV7d7v9N54RuC65Z9hl3geB4R9CHUiWiSkG8GljG?=
 =?us-ascii?Q?tp9onx3KedGVpRD7s9a2fX9jLRHokWGtBcY/GKgk/Bc2YN/S1cSog0S0BqPO?=
 =?us-ascii?Q?6Knv6W/wpIgoPEDfS8d3HIpQ7sCV1qh9HTfNmsmWuA2JxdCRagHeZ5y8Y67X?=
 =?us-ascii?Q?WwH+AITX3Ez8+o4p9SKGkNUWAEi2TEIQLoWPu3dGQoCKLKrvlwb8T1lt65Qo?=
 =?us-ascii?Q?6nnA56jR2nZvM4sVX6bWcOsIe5UJK7g07VUzGjhGF4pe35q67K4flvEs+Wrd?=
 =?us-ascii?Q?BShnjThy0/EgREE1ntCcZ7I0/tFHtgu9rnZi8O8URJv/C/nY1sRyQjViAEvr?=
 =?us-ascii?Q?awXAEL+/aheXSeI//5JgHPDdC6c+D4toQtXxtMU+OXD6XtItVLWri0fbu05/?=
 =?us-ascii?Q?KMorEky3dJVY8MMi3oG26fMewRqRtyElDMyDT6ZnHCmGuAkJSTw45y+uoeAn?=
 =?us-ascii?Q?AKc+QqghF3gX/uaYy73OXg3Vp5P1dd+P1B7KgNdKFFua8pNTDq6RBLNgG/kA?=
 =?us-ascii?Q?8aTEOt+ZQHPCmYO2T09n2zXv5kx94PYZwST3uoFL3omQLkycSPd6Ng2RG0X+?=
 =?us-ascii?Q?vPLaiH7W4ZkleR+w1HZ33Dm75zUvc+sHEaMkVmNGCmdNDh7sMsa0UOjiE/T6?=
 =?us-ascii?Q?pdfTsOqz+FB5gl9iT7GMbmMhwBR3i2XOXqV82AWxwft7R0RhNpB6OSQkvOcC?=
 =?us-ascii?Q?U7ODAcLS4++PONibIoxyfJdnBsFVg2vlrSfbDNKeEf4a+l8v4hE1iYsFNS55?=
 =?us-ascii?Q?DgxznzdJhIcQvVhOPeOdJVt6eV+KYibUeGqkbiPU9V5NJ1L7KLQMasKpXFTH?=
 =?us-ascii?Q?8ZNxACmaa4xMQp+cqhscVOgIDCK5h6gYguhpZaEX4MVXty621pHIroKaL/Wx?=
 =?us-ascii?Q?s659+zAWFB9pelxl8Ev+L4c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ec7bf4-4a3f-433d-5f54-08de286dbf45
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 19:48:16.5883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3pWnXlFeqci0aglQzKNIAX6mBosLjYhE+idUviuKC/Ab69UXw9AuUCM0zacFgos90xwqmOVOs1shN3MHQ3TsNL4i7GVFJZdZ2HX6HGR0IU/n1P6dtMqyZqMeTE234R9k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
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

On Wed, Nov 19, 2025 at 02:41:03PM -0800, Matthew Brost wrote:
>If the firmware is not running during TDR (e.g., when the driver is
>unloading), there's no need to toggle scheduling in the GuC. In such
>cases, skip this step.
>
>v4:
> - Bail on wait UC not running (Niranjana)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 3ee35d4873bc..648c9ea06749 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -1277,7 +1277,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		if (exec_queue_reset(q))
> 			err = -EIO;
>
>-		if (!exec_queue_destroyed(q)) {
>+		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
> 			/*
> 			 * Wait for any pending G2H to flush out before
> 			 * modifying state
>@@ -1312,6 +1312,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 		 */
> 		smp_rmb();
> 		ret = wait_event_timeout(guc->ct.wq,
>+					 !xe_uc_fw_is_running(&guc->fw) ||
> 					 !exec_queue_pending_disable(q) ||
> 					 xe_guc_read_stopped(guc) ||
> 					 vf_recovery(guc), HZ * 5);

What if the wait exits because of '!xe_uc_fw_is_running(&guc->fw)'?
It is not clear where the control goes in that case based on all the
'if' checks that follows this wait. Should there be a specific check
for '!!xe_uc_fw_is_running(&guc->fw)' following the wait here?

Niranjana

>-- 
>2.34.1
>
