Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C959ABDA1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 07:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C814D10E731;
	Wed, 23 Oct 2024 05:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/ZJ4Ifk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4851010E731
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 05:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729660084; x=1761196084;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FcMvtK7r0k2VG1SB8E/KxkNcGAJ3kGsiqggQ7yWB1ts=;
 b=S/ZJ4IfkKjiX4pnZescOvjq/Nsz4vxEdILZtmL1qrxWuztBIjWj7xide
 5+PARUb/5P/my5hGcpJYv8xjODmbwSXbxhRalIFQrBmnGmFL6P3iARma/
 TW7xg4R6UNN+pCyqYgkIwOVZQvdbh0hRuBwW2vpOtLfuaWRiiDR7cP3cQ
 GkH5Ea2eE7sU6ZOMpTW1vCfpUCTL2Z5MMS0i981IRm9Qxn7m5E4QAhohg
 qQdekmVxTfTuQ3BnjC5gvMmLkAXWS7Evk+fboJh4AX4M76bp4VYYS7Gu4
 ts38tsZwzX4YtlP4D1Q9AvQVCYcrHbNKv7/zVlAM3UgMTjk7eQhHhgYB6 A==;
X-CSE-ConnectionGUID: aI9vwBGjSTi3p7MIBUYF1Q==
X-CSE-MsgGUID: 3/s/EL34RrSHYCCqKV15vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="28689856"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="28689856"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 22:08:04 -0700
X-CSE-ConnectionGUID: uFcpeIyqQ06JQ+yYuxkHUQ==
X-CSE-MsgGUID: fi14fL7FSvimx0+BBvTXMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="80494793"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 22:08:04 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 22:08:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 22:08:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 22:08:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4sugEOOSZseCiuKHQlO4T4ZqszjKxyw7X5w8/ZJgZGFNMfQNFuQhCGq1zISJBHW+1ckdl5WPtyN3JXKMHfRL9AzwvZD89ga/z8sOvWwmg+kLm1eIy38quylp4IpEg7FqTsh4Wr5AQDl/1mIlJj9mz026lo8uVBipi9nGIfqm2TONRDHJHfJ8aVHhdtcYRdmM8Z65BEwAXWqSw2zB+QdnokiIce15hRhWNQ7c/y3sUYBbniIC7vDeuaYoi8Du1olhoCzxgj1fe3SLT+m3kXsciR3TNeyR0UisNN60Su8u1Ba784PWCqcEyXPyqKHyp+6BQTWG/xGCIj6LZ4Ih/YPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIx7Z5CwWoond9NZJE0eejtSuaCZxKVjmNHAeYHCi/A=;
 b=ikHeD6f619ccSUOHRP3wt1bhBu+AzmrfQL+Pr/BDDLJ/0zrJUrOH8KDfcmDEM/9jQnQijwX9TSyV6Amn6Jk38VzAV/VhAswiAFeWsHolCCOWjheqmYReIf5AEc3gdrslAJNSjZB+kXhWSBqHW87JPukyNHaZhUK8BSwXNE6lBi3Mq1MObzz1wyZqBxBEdP8k5gy7ihRuqkeXvDTxDEN6xA7sxnZngILF90ZyisK6SrjGGcxvbEoZzE9Z7hBG15UwrRD4MfRxB1U7lmjZHhUcqiFpcrnrdPQ/Sr3YB7y7SartjmFBLgWkoHmwEJy4dd4H1SlHUb8ImgJp/JRFsdsnAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8570.namprd11.prod.outlook.com (2603:10b6:510:2ff::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 05:07:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 05:07:59 +0000
Date: Wed, 23 Oct 2024 00:07:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>, Ian Rogers
 <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 3/5] perf: Add pmu get/put
Message-ID: <aj62ufd6pjv74bhxsynyxvir3s5jdncsljczoucdjvibfkglp4@22nc72qnhpa2>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-4-lucas.demarchi@intel.com>
 <20241014173246.GI16066@noisy.programming.kicks-ass.net>
 <lunkl4llip7aafnyctwztggum37wsiznktb7z3ly73batmt6bu@m75kow4b4u6y>
 <20241014192519.GN16066@noisy.programming.kicks-ass.net>
 <20241016120302.GP33184@noisy.programming.kicks-ass.net>
 <qtivtftbdvarukcxdr4yfwstzvnh4z7eipukwxymi4e2x76y54@dxqn3y22u2pw>
 <20241022215210.GA31953@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241022215210.GA31953@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: MW2PR2101CA0035.namprd21.prod.outlook.com
 (2603:10b6:302:1::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd7ef0d-cd8b-4f46-93e8-08dcf320a998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5A67ZPYp1BLZVlbn2sUG9HcGq0cq2ABUhpIheaxaz8tZs9EGpfn4aBBHwPPW?=
 =?us-ascii?Q?iXKa5bZorZxyAmrgSgRuMRc+fRf9rrBy6RFkYRy159cX3wj8OD9KShwNyEqW?=
 =?us-ascii?Q?ReuAUZ/y6hOygzOTkbs05A8hmxcJaP4Fr91ALi4wtOTX3/3+WqnK1oQW0tra?=
 =?us-ascii?Q?ZJl9MCpy3pJBwCtO3TImtjOh3k2KUYT6jFal4Lyl3pGjHtAGPbIRkQYjZfLo?=
 =?us-ascii?Q?a2mht0WM4b+Xc4S8sS2z0Bz9JXQHKQJqE+rkF5GaGv1vh/QlJTW1hhuFpkzY?=
 =?us-ascii?Q?Yy7inzhL/fbfe/T6kDPlhE6+YK63CWwF5mLAiFLjUYHeNgxLVzsHnhIYN4HW?=
 =?us-ascii?Q?rvfO81netz/veNEp/QLA0h1vNNAt6QUrNxvhfscNKLDm+VjVopM2sUNVlJli?=
 =?us-ascii?Q?FIq7fHIX4gRH1MW2tlQMVyE6Gl1mTtw6XgfS323w/O8LusCybPa+/nEDh9Wf?=
 =?us-ascii?Q?FMxylNaCsm0uZiRoncgpf2Ufwq3nf9laQ0wnCAxW9jRwT6wJHpugzEQFfCM9?=
 =?us-ascii?Q?WPcDxR7JkGnLv1ifqzQlWmsb4V+F/vJQ/GY5L2cmtYtfKXG/LvYTwsB81ccI?=
 =?us-ascii?Q?9nTiZM02Gzh8jr8UcCaqcuQ3jVrwK59dc91LyLhIaQby3PofdnKpTxxBB5Ky?=
 =?us-ascii?Q?slSdbn+2mJg7drIBs2QkzhWNw4A07pOr0Nuq0BTT9WEreh0L5w/Z5+9sc95b?=
 =?us-ascii?Q?tONwppT2TMUkffI3WrhyQi0X/4omUxdS1F6U/Sd+v56bf/tGC6sRxR39xpKD?=
 =?us-ascii?Q?wmvWIQ3WiTOGzc4AGaDFB5BjjhiXqrGcQHYkrZfHetugHeueUbIP5MFkYbzd?=
 =?us-ascii?Q?VT0gmj0kuu3F4I6gkevYpyfbkA5+MJpKdIbcgOLvPnN+DWUJUo3k5VQO2JD7?=
 =?us-ascii?Q?+FSxyn6rlD+GJz27b5Btl2FpdjSWYhcUypv85FL1RavhOAaIKi7rZVQO0Qn/?=
 =?us-ascii?Q?nEkpZ2rJufo9xrImTuUmJLQX3piPxDFhm1GrKAJwFw6+1y1MvOUz3RhL0gVX?=
 =?us-ascii?Q?RbsHh15CFpQsX59ZZrgT2SC0VTkL62n99OvSjl9ruyV+6E/y5vUA9UN+vuBd?=
 =?us-ascii?Q?S7IqCr08BVOID1gQHHBvje2o6YUifHrWM1GybIWokVeYUTHfoUc8++tiP+3m?=
 =?us-ascii?Q?g8Um4H6JmMCuLrw1rKGbGXcGgdBb7BvkLstttpVL3MCeuObSV4kClgvZ6ybj?=
 =?us-ascii?Q?O43Vsq8KhxVZz6+FOUDJJzcoBQ85u0FO996akZyrn7QbSYc1ProO6f+EaI13?=
 =?us-ascii?Q?9ZL95EUhVKAP84WZG+gZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+mqyXlcrBoESUJl+9g5gbASqlEQtKULl+EWGv7FeGqVZcG6fLAZuJfAuJalr?=
 =?us-ascii?Q?DI4HL1BqNdkOS9FNog2DB/IB6vK+Icxsqqw8iSrbI0L9xIhhmieEkCggGwkM?=
 =?us-ascii?Q?+MM32v8z/RTD8/c1LQ6QfsnKcGuae0elwCL8Myc5OSqnqfdZNVQuvfpOzSjn?=
 =?us-ascii?Q?xN1P8gIleJVo2Lj9orhhteAr+88zWPgwxzqCUYGuIXewDg3T9UmxBqMxfYz4?=
 =?us-ascii?Q?upKU1PFXuHZcsCYc2MFEEXv9Gz9XjbrgFwdSB7yPuVViOjZAgbQ8ZhMXuBHk?=
 =?us-ascii?Q?zH8H5qpLbYzHoaTzPKDaqqXwNCJVWHAzWsdjgBDqVljqgiWUPrrN0ymr30uW?=
 =?us-ascii?Q?GwjUItKnengUXZemGQevJbHh19d6snV0g9PciYwZIqcq+xBYTqeadZGhuLmk?=
 =?us-ascii?Q?h8WfIe/Z9grmv32x6M/8vJxVXjOICwZInKpCDoHmJlXxqr73Yinaas4StMag?=
 =?us-ascii?Q?jpU3PPqTOkry/cfZoPTrJFb7wC9RshPy6yJ24/mSuARjvQZz9CUaQMQjguta?=
 =?us-ascii?Q?fMZFCzPwYOSCDz6zmWAEHXYBBAv+JUimqa3AXADHoSqCefVSwKxh0FCkBlgW?=
 =?us-ascii?Q?kLYD2zoQZs/S5/ZWFpfGbDSyWdJgTdET9gvF6pvVu4nr1ORxhGAo7b12zQlW?=
 =?us-ascii?Q?Bu4bcw9yzAtTyV5IyB3wo9CkMMLVUlm7s2isaqXyX353UyArm+IkPni75MIR?=
 =?us-ascii?Q?lwcMA2Z3vXkXtmvdt3FVYjzdDT6HGVd/BYj/cSPdz9HUeyvkE96CjK8a4wce?=
 =?us-ascii?Q?wcb6PKqERk7pEhHWpNp+cWh0DyCR/WLAtiyE+M6qkOyXLxZ1ocedJNMV5gm/?=
 =?us-ascii?Q?/R+Rd0IBsx9ERI/D5S1sEQGzsIQA+qzMJMbFn3Na+6G7IGJq3K8l3xb1bpyO?=
 =?us-ascii?Q?4CieiM96lmELBxjy/47POW4aFhwwdvC2W1cvgomUVMQ/T74YjKiAX/w/N1fS?=
 =?us-ascii?Q?wOQMP+UethDpDjq5Tmihz0wQ2OfSj905KZQUrMkrHaD/2xtvuAiLyuiuRMIi?=
 =?us-ascii?Q?AimOLwvBppN0PJZZJHp9EQLbhcSwa+cABh68QlfwNxl0H/ctn4M1/tx3e+T+?=
 =?us-ascii?Q?O8FLCO8pAHiEh8r9ijdCRK2ZvYgt9T+19cn1ZXvjeHNypJWtOnswx0rig5d5?=
 =?us-ascii?Q?pmDlqNjLKRvlf0U5ACuwJMXP91JlVYDmve4DmOA/9vIsHyzIkF0SoUck1z74?=
 =?us-ascii?Q?7P8ccqatGRmmpgjTKQf7PF/YpMEZ3wu/qSUBCd3TW9RNvSppuWeMoJNZUfVS?=
 =?us-ascii?Q?PcurXevFd900m5husBCEAYintnyp/+PSOok9+0KmyCPXa1WjOfXnbp/Mc6GR?=
 =?us-ascii?Q?s5GZwTvC+kuR6Db2aWmeIgqE65rYi+22s4FDRUvGOHJEEZAEK66BadBb4hJm?=
 =?us-ascii?Q?8ne5851GNgNpAl0oIKacAoWizpqFY55TteltcDqPnY6AryHD1MMyMq7I41ff?=
 =?us-ascii?Q?uh7tuqs6WaaBpOlqJR1ecnAzoqxMTJ9AyKRDdeA51Ag62CxInXBwsrLh+1ss?=
 =?us-ascii?Q?venwza1ngvBM4iWfDN3z03to/WHpf2wX1T2SfWfQjOfvJoAS88ls7dvno+xI?=
 =?us-ascii?Q?x17t3x06UKoHwOGSudPhbNU+lv3pU74rAVjyWKabiH7fBOtB/mL0MBu/sp0H?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd7ef0d-cd8b-4f46-93e8-08dcf320a998
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 05:07:59.1380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsbbvjHC/9s6W1B9DwPn5k/2sGjMhwJgImZPzyM1C7Az6BTTJUohg+3lR+mDpDDgFaTzBUugoKg+6tuN0T+f3jDRtePivllhuh6NQNRyC48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8570
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

On Tue, Oct 22, 2024 at 11:52:10PM +0200, Peter Zijlstra wrote:
>On Fri, Oct 18, 2024 at 02:46:31PM -0500, Lucas De Marchi wrote:
>
>> I will give this a try with i915 and/or xe.
>
>Less horrible version here:
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/pmu-unregister
>
>I've just pushed it out to the robots, but it builds, passes perf test
>and your dummy_pmu testcase (for me, on my one testbox and .config
>etc..)

It passed for me as well with both dummy_pmu and with i915. I have some
changes to igt (i915/xe testsuite) that should bring some more coverage.
I minimized the pending test changes I had and posted to trigger CI:

https://patchwork.freedesktop.org/series/140355/

thanks
Lucas De Marchi


>
>I'll let it sit with the robots for a few days and if they don't
>complain I'll post it.
>
>Thanks!
