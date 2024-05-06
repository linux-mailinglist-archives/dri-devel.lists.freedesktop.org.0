Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FCE8BD82B
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 01:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE17210E951;
	Mon,  6 May 2024 23:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iixhCilV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516CC10E951
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 23:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715037912; x=1746573912;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8UTKGZNvLt+Np84E3WlehSFcI0wv+JNt1oeyKJG6QEI=;
 b=iixhCilVdsVFeEoHRGL/ZamnmRKVWf0dGq/ZjbKaZDkvAI+FP8VlfAyR
 JtzwRgI2Ayax/swzLnmykQTDs1DrwPh4lJihk1Rsylc0lfwkI+frW1Euw
 I1xuyNlrO/YpM0mN/8DSCW7uRv9E6uUugEn87gjiTGsmwAposhS/fYbSK
 CQPXYEoPtzKuiAEo7Q/rDr4al9UrR6Zi0gReNNgqvcrahJ1FBJzGccnCv
 2zhQJ0e6/OiLncqC9SLNCUTJ+mq37LI+bCYS0+ht2tyoA3DdjvMJCa1Ts
 yrrLQ9XdEPnu1gJpgMiBwV2CnTPs87xDGIXns+i9vfsU01XjL3Nx83/dZ g==;
X-CSE-ConnectionGUID: no/8cY5ASZ6AqZ67NIn27w==
X-CSE-MsgGUID: CjvEARrNTCec0dFPyXFaPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10738181"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10738181"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 16:25:05 -0700
X-CSE-ConnectionGUID: 8v2vh6yUToO4ClonYivKnw==
X-CSE-MsgGUID: 8FlAjCMaRAu56ZkeJS5/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="65778248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 16:23:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 16:23:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 16:23:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 16:23:34 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 16:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpSlh5IQAOd+prvovHXQyBfGDq4758JO72dlH+/wLNVA2jyHLvKj28cngRAwu7f+hIMH7niXaLAeT3pgKfNmW3Xmy0eaTEwdo4fBwgLFPCCIlYLOUMUmkWK7u6bn7M4Rmf1gBpQVt1nJZ/3nWew3JCLB6dTf+cPKFoGvYjIGkdIChKQhf2Td+Pei3ucDWlx2VyLKEnlTkQ9BbAoNWEo+T84fYkxLHQHIm0lQepCgvbK4nyLEfwJ7HwdhzvFbyglvaqm0dDuBh3NU1OSMmpQIsFgBcTg2Yh+5U/ECyV1j13UZ7mFohY2VRJyDgCneQKY0w8bv3EdJ54FjFJYhOnnSiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEZuFoS/pOVNjuBNC8jIrFfWDx41LM7M4Ze9hkQ7NTc=;
 b=nqbYRtG2oRlpsEp+jVX6LxthvcDkVgGKz2Gnd9go8qzO6BXuj+qtHp4nYFh59phXiX8USPD1TMGDkgMKfkUJRnquKtL6Jqixzc7QC+7kCzFuQjDis2EPBzyclNYqaNtSGGpZqD4n3oROF9QWL4EVSttWxdFRuXx0I7+kuhWqz3nIRgXkshTEZEiO9WqX1/GRZRJrqkhpXOUVLa2nWvapPkXNWD4RhB2bgIYtDzrdTTxUsSVRtyAnjVMOUCsKuyynUjL+X+s/eszFzooot9fJi9fMHdA0giabDLsjwSj+rXC23z3jFcLwMSGYXo6gqus83MxwydO8IJKJCd1LpTk+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4828.namprd11.prod.outlook.com (2603:10b6:806:110::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Mon, 6 May
 2024 23:23:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 23:23:27 +0000
Date: Mon, 6 May 2024 23:23:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: drm scheduler and wq flavours
Message-ID: <ZjlmZHBMfK9fld9c@DUT025-TGLU.fm.intel.com>
References: <7236d76a-8e6d-4a8e-9e4e-e2644c5df2d7@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7236d76a-8e6d-4a8e-9e4e-e2644c5df2d7@igalia.com>
X-ClientProxiedBy: SJ0PR13CA0198.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4828:EE_
X-MS-Office365-Filtering-Correlation-Id: 17da420a-e140-4004-5f28-08dc6e2388bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c+N/QLjrTl9VqOl5xo9V8z7ANyVWSQrl7cR0LtDwq9LrBhmuh4o2e2RzLpcg?=
 =?us-ascii?Q?hWCdRYG8yJNCg3FSfsAWfuRoCyYPskENQSzJAA8bbMPtuaB2paQ3Mi0BX1Sl?=
 =?us-ascii?Q?jDJuw2OWZA2CpgNqNV1SLGAc54DkhsAYolU8H1e8txBkvJOGLih0SKtnkdXl?=
 =?us-ascii?Q?wTnLEK6nJIc/mkPp9FGIg4cyCquvcgZTqdCI1KwiN+RjutJ1gDwRfDf9/k6g?=
 =?us-ascii?Q?MfkM4vY8xR1wmp1VypMKodxQ5jZg0+iTS2YmV+ocu/P3W1pHpg4lRoWCoOn7?=
 =?us-ascii?Q?XGCSknW8i9QNuMkGvRqB5Bl8kssdz/ybIRAuXae3zSYzznrHvv9SgfcUXD9y?=
 =?us-ascii?Q?x+L9vM9gfMeVZxsMCm9/hD55zYJy6EEXBddQmWdaHjGHdHN+j9od++86y5wb?=
 =?us-ascii?Q?qMCN1BvPAewQB4yF9EIxin2QWBbPZqcxDO+wusYUEGQRYqqf91QbF9uLVvw1?=
 =?us-ascii?Q?Ofa7hsGo7bnh3WDKIdy5qSzcW5QH0lyHnd/YuZGycvVJnDmKkPJorJvTfOhb?=
 =?us-ascii?Q?DYlMlATL/mru1nS5+j0/t7JPcGkltuxzWiK6fcMDVCOKh3mQeeG1nrhyMrOd?=
 =?us-ascii?Q?h40Fxq+6NRngfBM894ZWsDDnOFBPC+SyMOQK6/S0MXX2SQJlJXLr79X690ML?=
 =?us-ascii?Q?pC+/IGEduXohjPLBNRlIq18iDmfXPXZzE9fDdDHeOIJFkK/4buLLcsZBQKbM?=
 =?us-ascii?Q?3aq9IBt/WSAAwBkd90+FvIAyyPmpuzTHjT9YQnoOMzGIbHj67TQ9770I4opA?=
 =?us-ascii?Q?lyx0sItIej5SbypCdKfcNjozM09zZECTyzx9cx9enFttcdYZnANZmaoHGPHs?=
 =?us-ascii?Q?mlcZK/GnlzQM7a1fjNCYH97AUdFaAJCyg8Fv8QUaApPm7MO9rASIXVkgIPDk?=
 =?us-ascii?Q?xApBzX4tltxMD3piJ9FhKmyGtww1jQd6NY67cm17qrO1AhKVNIU9b+aJH1Bz?=
 =?us-ascii?Q?d/6G+2tcexpt8h7o6/zlxwEG68Bp7FugaIIB7xHIB+SxAaQ5zLzzPtZQgvQX?=
 =?us-ascii?Q?j6hKbMwLojnNAmQnCsCepdUv2PfaD3XFf8Zy+1wq22puk7zQdwmzze9WP46s?=
 =?us-ascii?Q?UX3XcUbFJDXKmfTORYpLOQ/K7LWKYdwEX4TCqNKW0Ack8dCy48vPml8KetmT?=
 =?us-ascii?Q?1BEihI1dHnz+QlKDHq+DM4khcXLbES6LfOIiiWRmugAhjwg6xilxFDHAQGSb?=
 =?us-ascii?Q?Upin3e1MwFY4aE7CmXHWTN9CQXCrTlKCLwLee98U21h8d0arQuiGRl0eRcfg?=
 =?us-ascii?Q?/3Oy2WjG8Dn3vXwvqaBMopmZoG+qKyi0rrZtcnqEhw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ao2ELmjEDmZLMH8FBGrBq1+qqwcCpnb8Qfumo08KHVSsmIXvT7GkCX/Y5cIB?=
 =?us-ascii?Q?vumBDGEY8TFRtZ8hfILFXpLo9ELZhq7DN5BzJGyNjmR58rJkWqTu31vibIhR?=
 =?us-ascii?Q?mQjL5KYcsdJrjteq532XyqqjFOWipibZhfNsO+84pIjBB+fvQ7NjD5Q42/av?=
 =?us-ascii?Q?r9tQ6Tz5SEaljL+lHMTK+FyYP9dtNSs4Neob23dXX7AEb5heKWPOfUj7SJtO?=
 =?us-ascii?Q?k/80lxiIzfAZyfJ+Kic0BFPWE/ysSuwmVYOEscR71QZO5vUccffEysSppWEj?=
 =?us-ascii?Q?QVuw0l8Wdq6URo0aIFhAxmzloqk/hBaiRqzMoSWhCRLSJ9OlhEYTwFq5RBh9?=
 =?us-ascii?Q?n8oqqmrpQyZ2MX9/8jiiRhI8BN2ac3+KBVVq87nj8C7e++hVr5xvPplIrvEw?=
 =?us-ascii?Q?eHyrbxtSB0xv+aeHZJLvTaMLKgTwjFc5wD2O3UuPai4avGq89P0BskZ9TqQI?=
 =?us-ascii?Q?85Z5I3G9sZE5wfnkYvWlhoNh63K79/aGYHooPDMTjTWbm81qYVCAOvv45KZl?=
 =?us-ascii?Q?P3QXOA6NgfprdKi/rCyzUcyaSXVnZ6S8ViyimNdvA9Tgw5eZCxF00/qQRxBs?=
 =?us-ascii?Q?bnoMFhe+Fr26b//0WxilpGFZe0hIyO2dKhdS+JGC9sO3qrGuKI+Wzm9po/Tx?=
 =?us-ascii?Q?duOMBgRKTyHHvuWoxKjfUKFIjceNz48R8PzceZe+7OfcY/x7DESjqkXGw7qE?=
 =?us-ascii?Q?2DFqI8PmUCRk2QguFOVMiupeSQPfAR7uvLenTcEVfweFlZ01jPEnf6u8JyYb?=
 =?us-ascii?Q?qeCe4jjAMI7c/bqA7J0XWrTeftg5oukSgWzPUWWfjwGC1otolnyVAkga41MQ?=
 =?us-ascii?Q?CcFCY5Amkb9qcTMz/JDXpaWpwFC3oZHvipf/kDKrx4f0pjUfJLw1Ltqm9Fsm?=
 =?us-ascii?Q?rUZ+inbHVQzqkb69DELBcU4D026wIBOA9OAYgJ3OjdGngVfq7eqH0Vf7F1Kz?=
 =?us-ascii?Q?tunhZxK9nJqx9bDo++aXVtcrHWgKTd5R/HJ/IBqYSSRVOFVIk7G23awwUXcm?=
 =?us-ascii?Q?u9/Z6fUpF3bLJsog6ySsDXBw6NHkemgaJA4DIWDolkDj559EZDuaLMtVN9Um?=
 =?us-ascii?Q?osb8OsPEyOUQxANzfQthur+OIsGm1DHFz6F58of/PqlQ0Y8dMChEOvwpt7Ot?=
 =?us-ascii?Q?7BI/DXwxxREsjz9kTj9klrhv0MLBqQvyZBkUlYElHJw4MHb/U49Np5EM7bLh?=
 =?us-ascii?Q?z44arVLcd3kz1qBtPPqT/qCRGSCutJYm2K1ZLLYK4JqcfXalQOZJ16K7ZHwp?=
 =?us-ascii?Q?WjySU0J/B6zyAjyEvFMF12ssBVzq1T7bQfCYtqm9alUqik/BjK4lFTQ6bEBm?=
 =?us-ascii?Q?ktffMw32ERnBkr39o+S9mNO/S1sefSrgl3CnJz5jRO815s71qBb+/nJap5qC?=
 =?us-ascii?Q?dBUpps9x5fyDJW6aTE3iYN10rIyesqrQFpJfeqbvFn8ZCtDPI4HOvtLC2AZY?=
 =?us-ascii?Q?+/LSfT0qd6555NKBB2D4PAZ8NTlsd3VYRyvzM72a8JQpW8B7lrk2coKIrTif?=
 =?us-ascii?Q?YVTlswOEmDTMa0f/BDP3aRtuAJOHANNoqnGwbBbAmDlqvevEEV4origH4MIS?=
 =?us-ascii?Q?cFLHLiLX1ySKD5W0fbI9hUzmh2aj4nWorLbSBBVtkThTm+gjZc/w8d87rSMu?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17da420a-e140-4004-5f28-08dc6e2388bf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 23:23:27.8251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17SIj81qilacDMO1L2UduzvY9k0O+DwdPg+6Jh6gVoeE+r16G90JveWiZwT4+dMeAFEXFWQ89iB/jUAfIHo3cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
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

On Thu, May 02, 2024 at 03:33:50PM +0100, Tvrtko Ursulin wrote:
> 
> Hi all,
> 
> Continuing after the brief IRC discussion yesterday regarding work queues
> being prone to deadlocks or not, I had a browse around the code base and
> ended up a bit confused.
> 
> When drm_sched_init documents and allocates an *ordered* wq, if no custom
> one was provided, could someone remind me was the ordered property
> fundamental for something to work correctly? Like run_job vs free_job
> ordering?
> 

Before the work queue (kthread design), run_job & free_job were ordered.
It was decided to not break this existing behavior.

> I ask because it appears different drivers to different things and at the
> moment it looks we have all possible combos or ordered/unordered, bound and
> unbound, shared or not shared with the timeout wq, or even unbound for the
> timeout wq.
> 
> The drivers worth looking at in this respect are probably nouveau, panthor,
> pvr and xe.
> 
> Nouveau also talks about a depency betwen run_job and free_job and goes to
> create two unordered wqs.
> 
> Then xe looks a bit funky with the workaround/hack for lockep where it
> creates 512 work queues and hands them over to user queues in round-robin
> fashion. (Instead of default 1:1.) Which I suspect is a problem which should
> be applicable for any 1:1 driver given a thorough enough test suite.
> 

I think lockdep ran out of chains or something when executing some wild
IGT with 1:1. Yes, any driver with a wild enough test would likely hit
this lockdep splat too. Using a pool probably is not bad idea either.

> So anyway.. ordered vs unordered - drm sched dictated or at driver's choice?
>

Default ordered, driver can override with unordered.

Matt
 
> Regards,
> 
> Tvrtko
