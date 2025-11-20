Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D576C759BD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 18:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0DC10E792;
	Thu, 20 Nov 2025 17:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2TQhsBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE59F10E792;
 Thu, 20 Nov 2025 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763659256; x=1795195256;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VGLtG7HKh8CKEdU5iUu57JNhWoZ2rh8CWZQ3gPIcq1c=;
 b=e2TQhsBGZE4LISmyc98Cn2JGOKM932O/n/Ig6bJZsU5+FHv/wgxFeCLB
 eeSLhUB9pFN1njdD/yM3yxQEeCN3Lxfb9K/iKthyU9HiSSnw649Z7Bf64
 8INvVCbiZSoEUWJDPxcsQTAW7mb3sVX9FXWcDG+ir2jH5bkgizDJjPE2V
 pGXymNfx3zUsH+3xcQoNKB5gcUODOCGX7uuX0gckOhz2Wwra1o0DfVrqe
 +g8YgmynfIAhmIfCQe3CAeIeYxGH//SqXzoEWPJLSmFkCGCNOqZ1CCTje
 rhupdUf5sUiXtluHtCuk2v4bZF0fR0A6aACgzSFqh3lQWwNi/DFfFqNYU g==;
X-CSE-ConnectionGUID: 0J9LiUuFQqOe8HcdUuyd7g==
X-CSE-MsgGUID: lwSMgW/MSBGQvXurxox2Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65827675"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65827675"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:20:55 -0800
X-CSE-ConnectionGUID: 7WPx4yVgTTyAVPV/LPMobQ==
X-CSE-MsgGUID: viGg9YmkRwySx+1rNh9OnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="196392234"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:20:55 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:20:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 09:20:54 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:20:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFhw0AdaT54ZXcpYkK2Zhz5TbDVHzkrlihuMemMYTDhkZE6vIe0orRsrvDEWDfuuTcx8cgTm8ALqVHbinpt5nDaOnmXOvf8aZX4RNF1hGge23krELLI025Eqe9sUFyS4zPtxVXh7RLsYRqKCjStB5c52PbER8X/ASr3gQYzMV9iExt4ld3ZUKZ9zQtHUeIRBYSIafM+ZnmhoPlSKqJmhvCrzspi/HUQT5I+KvBLU0RQ8aQ0eu17hqmF6kPjCYzchIQkiZGGl3RAJ/ZIvKM5gRgwNayPcHTxBF3fv55LttTMJeTJK/i7VrcS9RwmALbzNIB2NZl5aRK0faS8HVX6xaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fc0Qx8isbi0vLFTJwQbZCArMF9B4jU/OzZrppWsErO0=;
 b=ogM/BFe+7j2ivDe236TjH78a4iq5j1hxMXqvyZMgVl+0PQqPu+vvvka8XM8VZF2trttPzOySVYZASXeza60onpzjj5I46wbUHyk43K/YMlHrliJzyp3260KpLFEuOJqJ5a/IUH2IXvxFLhGJKLLBa3+CF/d8JvFkqUMh9mbKniBoRmbq/r8L8fMa0qEKBe9quteLzwth/zEfN1t2hmOy1zuvSNgKJ96J2rYAgkBd9reDLKfYoWg8Bu4lLQ5FE9geevj+GheCIbPtlexQoMkh4AhcyZ34KvGjXdqdPoB11LNYlQFgGcybSiT0fCcGbqDq45EtenbjzN+KJ/vgLg5Jcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 17:20:52 +0000
Received: from PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302]) by PH7PR11MB6425.namprd11.prod.outlook.com
 ([fe80::4c6a:e73b:a344:f302%5]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 17:20:52 +0000
Date: Thu, 20 Nov 2025 09:20:49 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <umesh.nerlige.ramappa@intel.com>, <christian.koenig@amd.com>,
 <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 1/8] drm/sched: Add several job helpers to avoid
 drivers touching scheduler state
Message-ID: <aR9N8R864k7QZOLA@nvishwa1-desk>
References: <20251119224106.3733883-1-matthew.brost@intel.com>
 <20251119224106.3733883-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251119224106.3733883-2-matthew.brost@intel.com>
X-ClientProxiedBy: BY5PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::40) To PH7PR11MB6425.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6425:EE_|MW3PR11MB4762:EE_
X-MS-Office365-Filtering-Correlation-Id: c34d40ec-e3e4-4ebe-7062-08de28592772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QlG7c2KftwbQzr6ZFTVS4misRglTymUhjOP4TNKek3XF6AxeEQ0ydZDy0aQM?=
 =?us-ascii?Q?T2Xyfzp+6/WFgAfMvdgyo11Pu5KvgT3YJWCn+9nJlULHYRX22K67LjmZP5RI?=
 =?us-ascii?Q?U28WNsbVS+W6Nsy2YVogco8rTIVM1q++DC1GCxbYk1Wp7kCO5blmFN64xDUX?=
 =?us-ascii?Q?1JNKb7wwgV9g0i6glNqjwGndpM6QYMMMA5fYiQWiiD1MuWUstK8B3A6dz4cy?=
 =?us-ascii?Q?wN4EPeCQsSm7jEz3+dUG8ISOkywfYbE4zN09Cpn3ycVkVlqU8y/cyxTbfQ/a?=
 =?us-ascii?Q?hFBaosnab87kaCJMd/6f+1ntpSHiyPANmO/ZMAZYkj2c+nZ6xTn7arOAZV0B?=
 =?us-ascii?Q?CN3EG/3ka+PuDY60IRWD1ikJNyD+pz4na7pgv4/bzqn3r9EHbgzzp3WImsPt?=
 =?us-ascii?Q?tt1tDmmrelN+J2xFGvlVZK0p/0Qdia5IH11e1q8CqKl8kXo5tNfRVCbbbI2S?=
 =?us-ascii?Q?ydM5Q4sV8AFFjDr65TWjIl0qA8+JFrornhpmAE2OP39ZcgyU0GYuEmd/Eu/a?=
 =?us-ascii?Q?2ioeNI4G3tLuFQrpPW6RM9y/VnKrF6yrBlSpHkg62GQ2z7QiY7dRLnJ1LpWg?=
 =?us-ascii?Q?5dW81I08R7MCHva4JMz0OOPgz3CARiLFWH6LijTDfoYu56sb3GeBVrzhDh1w?=
 =?us-ascii?Q?v8aUPyEGfPf6ymsROooVHV7H6f/AYzTc3u5VANwL70M3iAaCOUW/Tp9o2+ud?=
 =?us-ascii?Q?R2OSrebYCMQ/yL5rwge5dYfWr5Ma5ZuZtwYKqC5eI8E1LLH3z3+mnno6mSfx?=
 =?us-ascii?Q?EJ9CRBF0Prqq77MlwpEKb5y22QNoALB6FR/tEXQy5rGSPY9H1yneoh8ndBVl?=
 =?us-ascii?Q?UbSICMQ6eoUzZCMGckEjzU+MCU+lVvPEaQiA1t6AJvg4Rh/JCzw6+sNKzNsE?=
 =?us-ascii?Q?5JJLpXi6/HLQyER/2kQujyW9AhmnOTnNXBGJGfe92BasfmvVl8oNFf1G/Up2?=
 =?us-ascii?Q?5Jw33zjjtOlEBvNmYUyhPAtxuB6yzm0WO02NEJiM9ANAmig8lKsUKk1Bc4/o?=
 =?us-ascii?Q?wwcdjJdUgPwmEZKxq8aM4QNpT9qb6h87Jsm+capvPpLZfMcwk1Yo9Wc+ySJf?=
 =?us-ascii?Q?HsRzQQOENWJnS/DEiYXrTXhWzueHiWMLJjSazSsvIcitRR3glJhDg5W8ivVC?=
 =?us-ascii?Q?j23zDMwrYknc6Vh6WNHq3ItErdsnn/J/0fW2jDpAbkdgpcWKjzFFlrz7OoWC?=
 =?us-ascii?Q?vyA7AG7wpv/TtTFHwhQS9nTAw3Zi5MUmtYR0IAGDp0Vw2i7iGu8AFeDiNmmo?=
 =?us-ascii?Q?K+GS3DmZJz8f+O0NHGSIIO99uNRPdPmYWVEpRC7uxlEt/K3cwU7qYnBceey8?=
 =?us-ascii?Q?k2kzqGVjFjPc029kK9Cu5Q6CVGnwfCSm4vx2fPgT1em5TLC1dkzDit/yzQZU?=
 =?us-ascii?Q?YiTvAlOJL1mGSjqFcjJ80yJw9HaA02m0sTCB2onfr3GQwRhm5kLp3lod/DfO?=
 =?us-ascii?Q?eixJvIxS7ezoG2HiH3yy6QH1GjkDk94p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6425.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ehAAcDIZ2ROuW5iS6f8O2uzQ4MxDuRaA9nOlaPtaiCyr9kIK46w1Uu5qZXUV?=
 =?us-ascii?Q?LKHLV/QmqyExsQPw0w68JVPCNEdLB2BJSVDxcxkuUbMIlzvIOniR2kunZytL?=
 =?us-ascii?Q?mwcCteBAGGoL3avXuYV5xrskLx7ytp9cdrLQSZ3dJHskIDIZDKQmqpnN2U6G?=
 =?us-ascii?Q?ntgUmZeBMbd7P+upvxereutPSWSHmkL5pDIBGIVfjEJjc5MT85U6b0UT2Lel?=
 =?us-ascii?Q?yxgEp7uu/pnGmGzWgBhWigo3khbm06qwZHKwWMRPguB+FW1j9iv9ZpE3D5c6?=
 =?us-ascii?Q?uwbpx9O/C70g5YCcgfOanl4/k7d3DdHi/X0hwkHCYZW4r0QVdg2up2UzX90i?=
 =?us-ascii?Q?Av/3xzsidW3rLqWGXe1txOqWGxInH1Y93kLEagKueplhEzf/52mXzz8lsALA?=
 =?us-ascii?Q?3kimjPMOs8F8Kca8rhojofKcpdvbpc11N153wiRp/kwGeJkd77vSZwNvLT8d?=
 =?us-ascii?Q?bQYBeBM+1dvW2HdcnXGZpfWSzQn8D6szjE0nHgKjDGuDmobLjoKiJSRYSxX6?=
 =?us-ascii?Q?PCJoBCg2c2xiLy7+qWMeJbJfA5FIDImnRoni5yY0b0lzSzvBbFB2uHni7wMG?=
 =?us-ascii?Q?PH3eEs/PJUauV629j18Hoik55qBNOh/x7af0cZc2/KFAc1HcW0j99LxlbBtn?=
 =?us-ascii?Q?jazeZdPQGRzL8a40tmwGUwtgJs3b5yiIYqf84NtVoStliM7XNFBEKJ27rLMm?=
 =?us-ascii?Q?jYln12q+4W5JZLu0h5MiZQJvTX+PifRTfpypvlwwKNmmuq/pouv5CYXFBqTM?=
 =?us-ascii?Q?kXOz+e4uZy/OVJ2E9Wg3S6RUDNlHAUG805NI2deuiXScIITl8EFi20q1o796?=
 =?us-ascii?Q?GAt7QX4lKyDXukhELAs2n/ZamPB8xnPotzkNkOon+0d8XooK5WC9F+8v11G5?=
 =?us-ascii?Q?BoRQnbFqf3BhPDOG0b9MnHlqP5bNogiaeXPLr8TFiPNU9oO1DxtblH+KvcrK?=
 =?us-ascii?Q?mF0twfC8/nae7N9yv1gv0jncaxNBE7A6MK2pCNbMIkwgdaKvGWwdJjdG69H9?=
 =?us-ascii?Q?8YELQSDk3lW+0eFDIZUmxaKYSAgvSbOWgPwRVemOh++pASpdOyVUA8l5JJHg?=
 =?us-ascii?Q?80cCXQgTJLSgyP2u01qHm/p/2D1d+UVhRimnVyPFQmIqny4j2lV5JnQavhW2?=
 =?us-ascii?Q?ZfLrzt//DSfV+aNZ5xkvFBJd0ByI41a+XKSWHkAgW9uUdMl9sj4M9jOHb5Tn?=
 =?us-ascii?Q?pCaK1kKcvUbjTG3T8Ok9hC3810P4Xu9s7jWF5Z35zGcd7wVgUsSqeUAp3y3u?=
 =?us-ascii?Q?W1v5uexfa/PRk9AntWe/FTssEFxIa4aWtD5eKsJC4uapGt73Dzx4fHsDDZk3?=
 =?us-ascii?Q?YjmfXdIPGur18EhomtJEjIDPCeMNrPADEVuLO4YUMaaXRtVBK4cs/uhytkOQ?=
 =?us-ascii?Q?hVr5DRTTmfqZaVTX+8iXkyMulUZ5C9RhZUwz9DWc1ibroW3wTzhbkhtnNzfB?=
 =?us-ascii?Q?w8b2jZvHRwDfiyM1E6Z4RemZfC63XoQlUSOt+pXNPQ6gf5pEAziI8xIdas5D?=
 =?us-ascii?Q?SV4md6yc3Z1ScEEGpZxXQvszOo5nNkKFS5F2NlnXp0a/egkGfgRY8gHtGGwK?=
 =?us-ascii?Q?9aU0nB4W7/OcAAmwZcwCG+9iCKYA33hRzSOyHR7O9Rveo4I8ouRbDT/3Js0v?=
 =?us-ascii?Q?SJZBL5HAQ6otvG4ThKAb208=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c34d40ec-e3e4-4ebe-7062-08de28592772
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6425.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:20:51.6404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQuJ6LRz/jak3KneoemGBHBdUt+h5eZCYyJ7PBBRn5TFC22+a3p6aOZos5hUyCkyXgET3stHhJXcv6KhoJCKWSBy6cfeKUCdSMoKt3jEkVcfwxivqFbknX5dsxWgt95z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
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

On Wed, Nov 19, 2025 at 02:40:59PM -0800, Matthew Brost wrote:
>Add helpers to see if scheduler is stopped and a jobs signaled state.
>Expected to be used driver side on recovery and debug flows.
>
>v4:
> - Reorder patch to first in series (Niranjana)
> - Also check parent fence for signaling (Niranjana)
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/scheduler/sched_main.c |  4 ++--
> include/drm/gpu_scheduler.h            | 32 ++++++++++++++++++++++++++
> 2 files changed, 34 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>index 1d4f1b822e7b..cf40c18ab433 100644
>--- a/drivers/gpu/drm/scheduler/sched_main.c
>+++ b/drivers/gpu/drm/scheduler/sched_main.c
>@@ -344,7 +344,7 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>  */
> static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
> {
>-	if (!READ_ONCE(sched->pause_submit))
>+	if (!drm_sched_is_stopped(sched))
> 		queue_work(sched->submit_wq, &sched->work_run_job);
> }
>
>@@ -354,7 +354,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>  */
> static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
> {
>-	if (!READ_ONCE(sched->pause_submit))
>+	if (!drm_sched_is_stopped(sched))
> 		queue_work(sched->submit_wq, &sched->work_free_job);
> }
>
>diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>index fb88301b3c45..385bf34e76fe 100644
>--- a/include/drm/gpu_scheduler.h
>+++ b/include/drm/gpu_scheduler.h
>@@ -698,4 +698,36 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
> 				   struct drm_gpu_scheduler **sched_list,
> 				   unsigned int num_sched_list);
>
>+/* Inlines */
>+
>+/**
>+ * drm_sched_is_stopped() - DRM is stopped
>+ * @sched: DRM scheduler
>+ *
>+ * Return: True if sched is stopped, False otherwise
>+ */
>+static inline bool drm_sched_is_stopped(struct drm_gpu_scheduler *sched)
>+{
>+	return READ_ONCE(sched->pause_submit);
>+}
>+
>+/**
>+ * drm_sched_job_is_signaled() - DRM scheduler job is signaled
>+ * @job: DRM scheduler job
>+ *
>+ * Determine if DRM scheduler job is signaled. DRM scheduler should be stopped
>+ * to obtain a stable snapshot of state. Both parent fence (hardware fence) and
>+ * finished fence (software fence) are check to determine signaling state.
>+ *
>+ * Return: True if job is signaled, False otherwise
>+ */
>+static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
>+{
>+	struct drm_sched_fence *s_fence = job->s_fence;
>+
>+	WARN_ON(!drm_sched_is_stopped(job->sched));
>+	return (s_fence->parent && dma_fence_is_signaled(s_fence->parent)) ||
>+		dma_fence_is_signaled(&s_fence->finished);
>+}
>+
> #endif
>-- 
>2.34.1
>
