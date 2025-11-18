Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0F2C67C42
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 07:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7464610E414;
	Tue, 18 Nov 2025 06:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJyckBfV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B45F10E0EC;
 Tue, 18 Nov 2025 06:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763448339; x=1794984339;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s+J9Nre3ZYBEjBJIcAkWX9O+Bmfh09tRhL28qUlx+qw=;
 b=kJyckBfVsPtlzwVQVEoFBcZ8Kavm5KNev5cdo7/xZzNhz03+vYZzq0y2
 2StxuqvlcddVeY0ycBJbXynKLYcNXk4wF5ASnls9lAOa+xToFEbgotZY7
 LGVALxXdWHkgIsHVJQxGNb+XwecBubQUYlUGTFD2XKhEVVREKDoqfUoYZ
 fiYx9AYKpcfF9Uit0fJ6rstLje0lFEJvkk0qjdD1DpAPlQ6DwcVJShukM
 n5TfcWb+rVShTQvI5HBuYxko0rcDQ1zvUFVGwt/LuIPSHUZA8h2N0Y6K/
 nUua0bAUiJyXOn1lFfJqWcoQIr39STYOIYnMHuEJ26Te/UNhNfrIYaXe5 w==;
X-CSE-ConnectionGUID: x3Dh8VWCT5Kab4rRhS94bw==
X-CSE-MsgGUID: xUzjyH0OQz68AeC14VUPnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="82852174"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="82852174"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:45:38 -0800
X-CSE-ConnectionGUID: LyIYgELLQ5mSKVmoGKKR2w==
X-CSE-MsgGUID: 39c2/5DoQzSiiCKQL3zIRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="189965618"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 22:45:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:45:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 22:45:37 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 22:45:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XJGoabREVxn/QuqQnk6XpE5degNf1t9H5rSkrupKpfs0MshhooZVbTq9GNQXwLfzBPKjQQmL+VfZBkSlKDsF3Lz4L7ktG31GG/lj8sEUrdvbFw78MIrnF4eVUc5vLYbScWf07WGfhPWXuafHY+34UFmYzOCo37rJhmMzASsLfdrUy6xBPT+DcwsyqdUSuhsvLLZFb6Nj/Y0iQI67LI3zM9zTW/5FAyGw5HCh1YpkRCfdQ+L4P1MTLC4ENChtTEeyv3J7AoCqiLC3qRIobr1nSXcC59Th78dDvkWUh1Db1VPbA2cHDsmUJjzxKx5HfZ3u+jCjxc+lwmBIb3l6xIzGAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzH0GLY88O9UyQNktpym/x4uMICRvXOlTtwoGSbX4Sg=;
 b=kptVvsACDpb2QtgNg7WZ3zdzzmE6Ba6rAZfwUUD5haEaPwjy3WNPs/C7uX/TPHk2dDEg0yhaF6plKTEiDL05hPm/sEj/6+Q80abgP7PaVNiESuGhN3z3+YN/rsRGmhF4jA0HLEk4vN/LdtPON2hLA1Q4ViEtGR+hJCtm/CmKOoFNeoLPtPHQLQIMZkg+s2ffsNCDrr2lwM+BMURd9oAzfQ3QJfkNswH59G0AWpmCfNXo6zmuplsdv1cFtjLSD0gaH7AwRl1JLqQ1+cnXY8PuFpKncgRuRgcOCZHOajUAxESd/3Z/2w1p/BC+04HKyfwV4V7eHp/fhkCKCcYKeNJw0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 18 Nov
 2025 06:45:34 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 06:45:34 +0000
Date: Mon, 17 Nov 2025 22:45:31 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 6/7] drm/xe: Remove special casing for LR queues in
 submission
Message-ID: <aRwWC46dgXKjRGVW@nvishwa1-desk>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251016204826.284077-7-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfe7443-c5d5-4e4a-9be5-08de266e133f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fD60V9WstorT467BFgDwlVSWbBCR0fo1zqPJl/5RybA9Ye53JO1WC9fehOaA?=
 =?us-ascii?Q?131Oshe8b7waQr3++43ckFNHAkOWP9C5b9oblWPe37XGD/WYJXhBAPjb14hS?=
 =?us-ascii?Q?JBCnyIqZVNVVPsH8VkLWa7g4221LuFczzNlZW7pIvcc7VYrOCvA5VRz0OyFe?=
 =?us-ascii?Q?jtOa+eKWbzyivVyYoV9dXURmQACQ49EjLl9AmqZjOYsgcuCPilWz+qi76v7J?=
 =?us-ascii?Q?rKvvuhsqdq+CNfPUrGafxRcDbKSQdnOe8DPrFki3dtUzcrv9TrEUYlGh4htt?=
 =?us-ascii?Q?0ec2YqnNONft09zV2P0vDg+l+PjBSK34v+5uCmQpXLT8mS9VYf8g4Lhl1gn/?=
 =?us-ascii?Q?nzH0F9oVkqbj8Jzv4WbYzb/sJnIFI0A2tisc04bL8+93KaUB0uz6vWNYos1q?=
 =?us-ascii?Q?Wjij5932X6760LhUnsjw9z3VuZjD3EmP0rXYAJs+GhRIOncOFCRt/Upy3UCR?=
 =?us-ascii?Q?1nYrdXIx7+aN1Ppk5PsJFJmhuNuhN7Xc2GMA6ofF8Og/8K38AmxoSIBCunWO?=
 =?us-ascii?Q?IJsJd0KiGFvSGL4A1o3+upbu6RHAw/0zynViT5BVOc0RNTrk57XS9jzMlEF/?=
 =?us-ascii?Q?QySsUCFHMbRthu65oP7wKkgJSlNhn37/QV77yUDQ6LK4yj21/0eLCqlSM4I+?=
 =?us-ascii?Q?uRUjU02Cm5WPBQ0vshZ/kXpqBQnlt5IfjeNsAkbyoSMmZ6RZj1TeF7j4ceMk?=
 =?us-ascii?Q?UyQIHLkuaROvGnFhPi5ft5+2WlkpXT97w/Ykd/xM7Yej4hmFwPcgTOjNphek?=
 =?us-ascii?Q?MNx4CzJOufP5OJ0RIaT0y0bSYxYZv9KbP/A3S71fCbBkxvPBojr1U1G3xV3O?=
 =?us-ascii?Q?c4IdA3P8RR6IvilNXsDeVsXw4cJVcwbmU3jPwe4KmX3Y0+s1Ab0UEdcjWU6D?=
 =?us-ascii?Q?e2GxoOcZGEFNutA59Y80ydj5ggNOJ/ugqFNWWkv1i4/KubIyZ3HHk0snHwlE?=
 =?us-ascii?Q?AjXcrFxxSVHx3XowKQ38dkxZ3YAJFi5rqcc/HFHZ+dINzT17ArdUPyciG2s1?=
 =?us-ascii?Q?RSeAu1thnsrr+P3uitRewgd9uXaCLknAHBzmyadNJGQTaFCPfcbXR1yUuxLz?=
 =?us-ascii?Q?/H/UyWK2aMQinXYVtfkvn9ICtSsTa4563DrmjItxB4EbXxJFrggMT4aO03iV?=
 =?us-ascii?Q?WIza6K0qEc4hsX+tDT5uyQBuNV1QK26R8gTUwBTI9lX7kXv9Cy9gTayqdw6O?=
 =?us-ascii?Q?sy1r0vLK7P12lO19UC/WkotqBuc2+ilL/9lpwZQhnLcyXAQLq5XAv4hZtL0+?=
 =?us-ascii?Q?de1aJNEuD83faqgc3U4AZLhpWYuOEvfQ89eA2HrZMKjpeI78syiLJhcfZow1?=
 =?us-ascii?Q?7O3D8Npgzir2H0Udt7VMIptFtEWCEaZkcS9U+Xk1wzjM9Za4Zn5B4Jm3l1RH?=
 =?us-ascii?Q?0PnolSjJ+e7lwdOLU298rG4esluw5KAeTRnDTcjdWQTG1AgYzO0NOi4GJVAz?=
 =?us-ascii?Q?WI6cdf0luvPvnvyBQDy9qYi0As5uHHV/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ryl7R2+5jSwoBlWP7RylTlmEqAgyOth2EBsx1TSUWP7rxQQDm53aNTmPH/aj?=
 =?us-ascii?Q?pFZSdtIig11N2U1wSfU7QZLPSt5J15/XA6kkJwi07hBab/WRJhzUM04z3RBh?=
 =?us-ascii?Q?aGAatuICezJMMVUHAlrif2ruJjx9/dUf1KEUTzvJ+iGCbfR9hK0O9XsGpdqr?=
 =?us-ascii?Q?67hCNM+8SqJuKEg8h5n1ECg+QgKN/ZF1Wr2+G+ugXmzwY1BM9AB9PqBsML/P?=
 =?us-ascii?Q?5C4WdDuWgws50H40uZh0AxPgnWye+voNqkRPqVnrSLU4Mp8aGjuO2iMIhiIX?=
 =?us-ascii?Q?5Xf8qfSkVfp5DBole3bkxXrGMYEHUzTsdKQmEuT8UPm/xjdAxLe+iYF3FNRk?=
 =?us-ascii?Q?Q6p9K4MVOC95sb/q2Hpn3TrQN117iFXEEtTNg5FNNK49IEn5TlyUehdZX8o9?=
 =?us-ascii?Q?1WIb7rzCjPpIzorCmZfw9N6guSCWVaVhMSyLkJYBRSzNbDfKI6pX8rLmmeeJ?=
 =?us-ascii?Q?prtWHBbOifNJSx9Gv4Zm1hk4pkJ0gJ+hMILFWZoYVTommYaV3fLTK9H++mtW?=
 =?us-ascii?Q?hdUfs7in13KwLdYqJM0tgMY75cvLRGAd8krajZnaXOWKlVhjj+YBYHeYUATJ?=
 =?us-ascii?Q?qor8wN3SKHCkayw8lNloFGQtAwVddODb84FhhETcKVoXYFncwvBZYnrrEVw0?=
 =?us-ascii?Q?ip6d33cW4HW34f7RmG8rKMD5PyIxUBsUM26kL8moBtWoCqzv8zm4DFXVfZCV?=
 =?us-ascii?Q?W0/b8JjYCWmjt1rd85YOJSG7pw7vW5r7sTEWKjOxQxb8Jfw83hCnQkdi4Ne+?=
 =?us-ascii?Q?xqvYz3oFgSL7w7U6dKNL57jF8O0gSh8Wm1AS53FVl6BcNzpjAeU2ENk8Od4N?=
 =?us-ascii?Q?46v9lnmwU8S2oFgBaF2WnjgmItXR4FOrctWNavwdXOpncVS770pru00QZVnw?=
 =?us-ascii?Q?Wld70M75ATz1cvJL7zwjvWYX2CfwMVc6zoEpr6BISsREsJyrnQMvJr9A9Acb?=
 =?us-ascii?Q?MmwEaU4gNGvqDB5UpUIFeHREZVPf7kxkVqEEX8st8/lKOJOrQsk3zifreoGZ?=
 =?us-ascii?Q?5u4FbWhkCpDZdMWcvt3BS3QKU0tNrfchPROM5bOB9CjjL+3wBbCSy0ZN/bTR?=
 =?us-ascii?Q?BY0yjVHFIoy7lYi/6fsBmbM1Rk21SGPCq3HOFvLj03lEs/K/vw/QljIy1CuB?=
 =?us-ascii?Q?/f75ZuYhJH2cFOsPtBFQunfCyiuksfgNL4jVDtGQ/hIsOJW+sNn1ePuD4f2X?=
 =?us-ascii?Q?W0vtZAMnM6rN9O7vwXWENqEaULNW6hqAkqZWJomYTe+QukWNOaij7JqI9zUY?=
 =?us-ascii?Q?XrLQFmzCHCaplMrY9eAJ3EzbGizxLx1OEZN1KKP6Fa4nRWXOGt7fVlC8qc3O?=
 =?us-ascii?Q?btxHZxHXKO4KfcMZyH2bPBjM0eeEc/j4CkfhpjyxWb1wRahWC2yW6RqaibT5?=
 =?us-ascii?Q?BGa9UjUK+6TMuk+d38GdcNXIHiyFWOSOh7wfm549ZjVh7L412jVhKTZzQUdV?=
 =?us-ascii?Q?AKp5WX6lia6WOOToWntLMvAFum6D3DY9Qp+AHAOXYj0PsVqbxsHvfwwem8vT?=
 =?us-ascii?Q?Mllc2CodeCMsiyO/rk9xn3i4j2hpTBtgWh8KSWarPTGA/wjhoCdxPK6l2ttt?=
 =?us-ascii?Q?GtNerhmp6Rk1gO5tYpA8lelzgs+wFLu7l2ryt7r8JhXligQCV7zTotTCbDAu?=
 =?us-ascii?Q?CNPO1xK2kfHH1nqwJ4BES/c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfe7443-c5d5-4e4a-9be5-08de266e133f
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 06:45:34.6337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FvfDm6Fr3rvRBWpz5Mbhnd6jAtTNolU9lNqg1t5uLz/DG+dHYzfAbZgvCVuHSLqwOaUUj8eFiZbX8rd73kDt4uvld9o5adFeELHmjIQMBa8Vpr1bzdvVGo8U9+7Jkiw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
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

On Thu, Oct 16, 2025 at 01:48:25PM -0700, Matthew Brost wrote:
>Now that LR jobs are tracked by the DRM scheduler, there's no longer a
>need to special-case LR queues. This change removes all LR
>queue-specific handling, including dedicated TDR logic, reference
>counting schemes, and other related mechanisms.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
> drivers/gpu/drm/xe/xe_guc_submit.c           | 129 +------------------
> 2 files changed, 7 insertions(+), 124 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>index a3b034e4b205..fd0915ed8eb1 100644
>--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
>@@ -33,8 +33,6 @@ struct xe_guc_exec_queue {
> 	 */
> #define MAX_STATIC_MSG_TYPE	3
> 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>-	/** @lr_tdr: long running TDR worker */
>-	struct work_struct lr_tdr;
> 	/** @destroy_async: do final destroy async from this worker */
> 	struct work_struct destroy_async;
> 	/** @resume_time: time of last resume */
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index ab0f1a2d4871..bb1f2929441c 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -674,14 +674,6 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> 		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
> 	}
>
>-	/*
>-	 * We must keep a reference for LR engines if engine is registered with
>-	 * the GuC as jobs signal immediately and can't destroy an engine if the
>-	 * GuC has a reference to it.
>-	 */
>-	if (xe_exec_queue_is_lr(q))
>-		xe_exec_queue_get(q);
>-
> 	set_exec_queue_registered(q);
> 	trace_xe_exec_queue_register(q);
> 	if (xe_exec_queue_is_parallel(q))
>@@ -854,7 +846,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> 	struct xe_exec_queue *q = job->q;
> 	struct xe_guc *guc = exec_queue_to_guc(q);
>-	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
>+	bool killed_or_banned_or_wedged =
> 		exec_queue_killed_or_banned_or_wedged(q);
>
> 	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>@@ -871,15 +863,6 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> 		job->skip_emit = false;
> 	}
>
>-	/*
>-	 * We don't care about job-fence ordering in LR VMs because these fences
>-	 * are never exported; they are used solely to keep jobs on the pending
>-	 * list. Once a queue enters an error state, there's no need to track
>-	 * them.
>-	 */
>-	if (killed_or_banned_or_wedged && lr)
>-		xe_sched_job_set_error(job, -ECANCELED);
>-

Why this piece of code here is being removed?

> 	return job->fence;
> }
>
>@@ -923,8 +906,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> 		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> 		xe_sched_submission_start(sched);
> 		xe_gt_reset_async(q->gt);
>-		if (!xe_exec_queue_is_lr(q))
>-			xe_sched_tdr_queue_imm(sched);
>+		xe_sched_tdr_queue_imm(sched);
> 		return;
> 	}
>
>@@ -950,10 +932,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> 	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> 	wake_up_all(&xe->ufence_wq);
>
>-	if (xe_exec_queue_is_lr(q))
>-		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
>-	else
>-		xe_sched_tdr_queue_imm(&q->guc->sched);
>+	xe_sched_tdr_queue_imm(&q->guc->sched);
> }
>
> /**
>@@ -1009,78 +988,6 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
> 	return true;
> }
>
>-static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>-{
>-	struct xe_guc_exec_queue *ge =
>-		container_of(w, struct xe_guc_exec_queue, lr_tdr);
>-	struct xe_exec_queue *q = ge->q;
>-	struct xe_guc *guc = exec_queue_to_guc(q);
>-	struct xe_gpu_scheduler *sched = &ge->sched;
>-	struct drm_sched_job *job;
>-	bool wedged = false;
>-
>-	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
>-
>-	if (vf_recovery(guc))
>-		return;
>-
>-	trace_xe_exec_queue_lr_cleanup(q);

Remove the trace event as well in xe_trace.h?

Niranjana

>-
>-	if (!exec_queue_killed(q))
>-		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>-
>-	/* Kill the run_job / process_msg entry points */
>-	xe_sched_submission_stop(sched);
>-
>-	/*
>-	 * Engine state now mostly stable, disable scheduling / deregister if
>-	 * needed. This cleanup routine might be called multiple times, where
>-	 * the actual async engine deregister drops the final engine ref.
>-	 * Calling disable_scheduling_deregister will mark the engine as
>-	 * destroyed and fire off the CT requests to disable scheduling /
>-	 * deregister, which we only want to do once. We also don't want to mark
>-	 * the engine as pending_disable again as this may race with the
>-	 * xe_guc_deregister_done_handler() which treats it as an unexpected
>-	 * state.
>-	 */
>-	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
>-		struct xe_guc *guc = exec_queue_to_guc(q);
>-		int ret;
>-
>-		set_exec_queue_banned(q);
>-		disable_scheduling_deregister(guc, q);
>-
>-		/*
>-		 * Must wait for scheduling to be disabled before signalling
>-		 * any fences, if GT broken the GT reset code should signal us.
>-		 */
>-		ret = wait_event_timeout(guc->ct.wq,
>-					 !exec_queue_pending_disable(q) ||
>-					 xe_guc_read_stopped(guc) ||
>-					 vf_recovery(guc), HZ * 5);
>-		if (vf_recovery(guc))
>-			return;
>-
>-		if (!ret) {
>-			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
>-				   q->guc->id);
>-			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
>-				       q->guc->id);
>-			xe_sched_submission_start(sched);
>-			xe_gt_reset_async(q->gt);
>-			return;
>-		}
>-	}
>-
>-	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
>-		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>-
>-	drm_sched_for_each_pending_job(job, &sched->base, NULL)
>-		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
>-
>-	xe_sched_submission_start(sched);
>-}
>-
> #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
>
> static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>@@ -1150,8 +1057,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
> 		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> 		set_exec_queue_banned(q);
> 		xe_gt_reset_async(q->gt);
>-		if (!xe_exec_queue_is_lr(q))
>-			xe_sched_tdr_queue_imm(&q->guc->sched);
>+		xe_sched_tdr_queue_imm(&q->guc->sched);
> 	}
> }
>
>@@ -1189,8 +1095,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> 	pid_t pid = -1;
> 	bool wedged = false, skip_timeout_check;
>
>-	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
>-
> 	/*
> 	 * TDR has fired before free job worker. Common if exec queue
> 	 * immediately closed after last fence signaled. Add back to pending
>@@ -1395,8 +1299,6 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
> 	xe_pm_runtime_get(guc_to_xe(guc));
> 	trace_xe_exec_queue_destroy(q);
>
>-	if (xe_exec_queue_is_lr(q))
>-		cancel_work_sync(&ge->lr_tdr);
> 	/* Confirm no work left behind accessing device structures */
> 	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
>
>@@ -1629,9 +1531,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
> 	if (err)
> 		goto err_sched;
>
>-	if (xe_exec_queue_is_lr(q))
>-		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
>-
> 	mutex_lock(&guc->submission_state.lock);
>
> 	err = alloc_guc_id(guc, q);
>@@ -1885,9 +1784,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>
> 	/* Clean up lost G2H + reset engine state */
> 	if (exec_queue_registered(q)) {
>-		if (xe_exec_queue_is_lr(q))
>-			xe_exec_queue_put(q);
>-		else if (exec_queue_destroyed(q))
>+		if (exec_queue_destroyed(q))
> 			__guc_exec_queue_destroy(guc, q);
> 	}
> 	if (q->guc->suspend_pending) {
>@@ -1917,9 +1814,6 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> 				trace_xe_sched_job_ban(job);
> 				ban = true;
> 			}
>-		} else if (xe_exec_queue_is_lr(q) &&
>-			   !xe_lrc_ring_is_idle(q->lrc[0])) {
>-			ban = true;
> 		}
>
> 		if (ban) {
>@@ -2002,8 +1896,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
> 	if (pending_enable && !pending_resume &&
> 	    !exec_queue_pending_tdr_exit(q)) {
> 		clear_exec_queue_registered(q);
>-		if (xe_exec_queue_is_lr(q))
>-			xe_exec_queue_put(q);
> 		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
> 			  q->guc->id);
> 	}
>@@ -2060,10 +1952,7 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>
> 	/* Stop scheduling + flush any DRM scheduler operations */
> 	xe_sched_submission_stop(sched);
>-	if (xe_exec_queue_is_lr(q))
>-		cancel_work_sync(&q->guc->lr_tdr);
>-	else
>-		cancel_delayed_work_sync(&sched->base.work_tdr);
>+	cancel_delayed_work_sync(&sched->base.work_tdr);
>
> 	guc_exec_queue_revert_pending_state_change(guc, q);
>
>@@ -2435,11 +2324,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
> 	trace_xe_exec_queue_deregister_done(q);
>
> 	clear_exec_queue_registered(q);
>-
>-	if (xe_exec_queue_is_lr(q))
>-		xe_exec_queue_put(q);
>-	else
>-		__guc_exec_queue_destroy(guc, q);
>+	__guc_exec_queue_destroy(guc, q);
> }
>
> int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>-- 
>2.34.1
>
