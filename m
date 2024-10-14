Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0944799D653
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 20:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7169E10E49B;
	Mon, 14 Oct 2024 18:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OBeli16A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AF410E49B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 18:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728930046; x=1760466046;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4d7rwWkL+3TVyFkwGiQXAu54z81r9wFYfCEoJE6tkcE=;
 b=OBeli16A383uBX9JPDrfuc4IzRXDS3X65bO+T7V+YMcGnnKditlj7uCG
 kg2lNih12cygbUGWGLjuJe+PPC5duzx5k7z/kUw5hy6S2GbCVGcHCkeD3
 5mR8JxYYmLmzUhFCTqwToYpOYR6yc7yzTqFssrq4ZLQczeozXEsa332vL
 oaYp8EXIU083cQKXqPO6bcfRRuEuRD3HnUrSs1FGv/JR/YYJUl5nEdYTh
 99xlnEGBu56JJ5/td2hImrxrNku+jGHMfmAP8yp7FZMeOmk+Z9H9tVmAB
 jwPFDqvdothNGrArZ5wKp/dlCG6OX9IcQDVeKTxmT3J0fAo+hISDRAFsl w==;
X-CSE-ConnectionGUID: Xo3Zd7dWSAyjqtERazomVQ==
X-CSE-MsgGUID: qaXws5rHSCWcKMM4nSe2YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27745082"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="27745082"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 11:20:43 -0700
X-CSE-ConnectionGUID: r2m4xRLNTpG8lac8FeX21A==
X-CSE-MsgGUID: V9TRz0/GTF+Nd3sRTl/Vlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="81628982"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 11:20:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 11:20:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 11:20:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 11:20:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 11:20:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOmUCHDugWcD+NczNj16JeJHc7PNQlDA4ehnhJE5DeACxz+cw+g8+BwwoS3hHRMh/PXGbv8qqorPNU+XY/IjgocOC3Lz8HP9BfKCqPxu0j33Phsa9sYnusHynFRLIt96UkkczqM6OeP/CT94Cpc0fn8IThQrTHa4brlEv0+uXuo1r0jXqmi+BUNPD44gdNCHmWzpkmZYa6kTX1FSiBnnGXQLM/3Uwbl8yrcHA6yrZkr/a7AHrk7TSQ+0pMe/n+hNfIKNEyI7Vf57A+wypSSb56+H0AuiTMnCGTAhOdNy1RFGnYV4Yf+JzY6AdrTsWohLmkY0KkHkVFT60oXZ6dzP3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvfi5gwqbGOSO5wnB15qeOkToWOsIPMA57ERbjGW5Dg=;
 b=Zco5jxARCxvH9Yy7raTHSMfctMu7gzf72JINEnPiB9yyh7+IXtHc57J/YnmP8nsQzLcbJ8ATrw/EprzxFecynS0YbmGdv15FfkJyvIcz4HhAKAsUTIK4Y51zDTMv7zX2Zk7kaai7f4huocIiZPJk+IafwDmVVN18DbV3hensw8e5cGeU9jM0lj+MVKdnZeQ3iwct0t+o4vi/7lY7M9LDd557Zi+9ti4O0TpOqMH5rqrSTZkWZ2UQN2gX75qkNMrfkAo4p5FX6DIhassfoT9iMHe0VxJUSrZgg1FlrfKdQ/t6FZZYYBpmMWaZGGdk/J1J9OTIer8qwdSHY2itcH1XZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 18:20:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 18:20:39 +0000
Date: Mon, 14 Oct 2024 13:20:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Ian Rogers
 <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 3/5] perf: Add pmu get/put
Message-ID: <lunkl4llip7aafnyctwztggum37wsiznktb7z3ly73batmt6bu@m75kow4b4u6y>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-4-lucas.demarchi@intel.com>
 <20241014173246.GI16066@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241014173246.GI16066@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf87a4e-71f4-4333-1e7b-08dcec7ce806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k60LdsZRNyO248hZFBs4excC9p0C4/1IYMZQF8yOH1ylI+l/pgVCpxa25mTK?=
 =?us-ascii?Q?ZT1gRVfoFOoNUekc37nFZ6CS4pF0c12VVvV7y7rmeSddTPCGpk06Zf1z2xUx?=
 =?us-ascii?Q?Rh2g7S5NqrUyTudbimj+NdSKhO/wXOGOuk/qVtzk1E8u2y+YJpe5b2cpef5L?=
 =?us-ascii?Q?ayr3Dy9lYLADzesQI3CAGYrEi4O9mxeCU6tJdvd055+MjMUPtRZSgAII6Zan?=
 =?us-ascii?Q?XKBGyRYarJqgYwQsxaVDs5VuxnWR//PV16JzxSLhdrzNiZFtzHXwAvXlNUtv?=
 =?us-ascii?Q?8U4SvhknbYnvv5fetcDK7nHxwtU8UQP1vgKH8BYZ7laurapM/JRrvms0kF09?=
 =?us-ascii?Q?MqWJPkGnN/+At5130PMx9ici1p7w1n3p6yXghYNlESc038ipmC7M2taoRv0M?=
 =?us-ascii?Q?KX6z+pqlDjJduC2iFm95bvlIKPOaMfVoWH2cNJ8u3dXRcC2+phzlW+sFRABa?=
 =?us-ascii?Q?LbkJ1LcxQji9JF0zlmuRIN9kxjuK1fQtFRQB4qf7GthCZ6/EI9OIJZFoP8xo?=
 =?us-ascii?Q?am1x8870fc4dexbS3Bsthj3SUnivfAibdAEn1qfu1QPr8dRIT3xu7HO6qanN?=
 =?us-ascii?Q?bh9k7qIURbvDcjHo+uXwPgBkINeQEfTWtKdA/o8DWSMI7Z9U7cGg5sfgar2G?=
 =?us-ascii?Q?DVQCOoIkIhMuvhEBqIoDLAwUsSSuPpDoYCYsjSljH2p32oSOxzH81W9Jw+nM?=
 =?us-ascii?Q?pD7JnniNosFU+b/3HFXzCi5mZacX+66iRC3d7BQ8nReW3+OaUQE0ri7z41zU?=
 =?us-ascii?Q?tzuX5RiZh3ZDIaiUIB7XUCmludP7QSVPI1F++zmPnaDbpcsDv7MFQcOE23ic?=
 =?us-ascii?Q?GYIOXtmDnNosj3AWhU4z+heXsXsp+BiC6cC22c46WHybWdwVDjAsOlLjdlU6?=
 =?us-ascii?Q?kBtE4Rl+FJAnoFCgOyE45pDlvahfYiF5PYzFHj7qN1bTuzudkJoj9l5PKUzt?=
 =?us-ascii?Q?IOtbEBtVMqAcN0S8ANYDWUJnz7e7zRyKy7uhAitttJ9Kxsc4eESMYs/nQeW4?=
 =?us-ascii?Q?FZKup38aEReElH4D5ajIpDinwo36VLW1hRIFpAdS5mA2EuaaFjbqPHkCQlQv?=
 =?us-ascii?Q?tXRkdb/GMtNhyo2i5StBiF5WChyGVnugIZlFPLoemRWp1sOcttsv3fC1pTlv?=
 =?us-ascii?Q?pv3BnmEUxfujpOttv19BYmNA+NVEjzuhOMlN20w0hmn3Jbxv1PrebgpH/CjW?=
 =?us-ascii?Q?q7m0cOZDTCqPndsJokEHwNsTHHgcVQf2c+U4y5TFAyFHT+lQWZepZz7JLzIj?=
 =?us-ascii?Q?tWn/bNkUXQjr5DAJKoP/u89IaR4RUU86Kkfq6AK5Rw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PRQ48REhniRk3BsFdZqRD54UndcI/Y17ri+1R3siwAy6GRHkuomx2w5FVnH7?=
 =?us-ascii?Q?zfUTFh2Mja4T+RCG/7SUkd/3k3Y/tz0AzAs9ApAMyZLbaj2Q6478S0YCFsn1?=
 =?us-ascii?Q?6zlITQpJmuhHbC7nj3xSMdQS5Bg69IGXdX+wxs/dmL4Vt+aBnoaYHQoojKTi?=
 =?us-ascii?Q?Xwze+98KECLFZKoCGR7aFMv2gEvsa/E9GdpgMyJPLOs2+U5Y+KbZAqi54Da4?=
 =?us-ascii?Q?1jMR3wekfKhT1M5wanvaUgVSUWVKtaTtlU9zg25Mm32CpzbS0/W6OCsiTdNS?=
 =?us-ascii?Q?ydrtO5Z9cK0FZgXwyMYBZN/UZ8kAPJguyHsidtYJekLfbOPetxXirpKVXT4H?=
 =?us-ascii?Q?gpCfV9wPjjfUlFNi48TZB8Mql9d1wgJW4GcKWIWpm4itHMjpllx/wrqjFRiT?=
 =?us-ascii?Q?CFLUEt1RvVCgG14l33ZPrESfiQVGDG8uVe+Kh6jScQjrNvDNYy7u0Y0PRTQr?=
 =?us-ascii?Q?RyU5dDI00NURO9RY6J6a00vuLha2uuFqyxbmzc4y4+LcGfRqPoVg8qnG3Wqg?=
 =?us-ascii?Q?cS0dsPoN31UpwCtWOKirQxI/RtLp7te6n3i2vRgYDnVaJp/Mbvs1UbA2DPsL?=
 =?us-ascii?Q?ewbJgNKc6kBzdx+yuabEiJQo8L0xGCDnVndXs+XqXoY93j8yIYmBSDd5yN3e?=
 =?us-ascii?Q?3T+g+hWKtNJ4ND4SQUzVDV53UJRdHA3LLubH/jTab+dzk4j3uoxmSCjn1Cpe?=
 =?us-ascii?Q?DVaUgIMABqBTTrl6TfASqalCkQPcJ8v6L8I4SnKN2AOSEZgGxZ5WgBBW7bcZ?=
 =?us-ascii?Q?ut9LdHsqQZIh2j7ADctUvGJlqI7TjQbUC7fVoVledqFTaU7g7ESM3ANZYSK3?=
 =?us-ascii?Q?Mn78DPVXIU1feDNDLsPwJMwQMXh1XluJtaqVfgNf/sbd8wpFidXhs0SNO86b?=
 =?us-ascii?Q?DciRL549FT1UMmbyfcCv0fIQjG0l1juzF+qjv3srR1KJr3WszMIA+oA1ILa/?=
 =?us-ascii?Q?tN9CYd5MKSBp7tYQGZpTrE5IVEw1atcjpCzhgfkbzbPawxOtyjQigkPIr8FB?=
 =?us-ascii?Q?7ayvXEYw6hp2mlxYTNGCRGbJ/msKq3Q8h0U7zPp7SY+wwqZwUu+4p9DQIUv7?=
 =?us-ascii?Q?5JUIPzl82VvHFaN0LBnY5uPRoHaLzrZcqfcDLLsNzozk8GAnU594g1CoSKNs?=
 =?us-ascii?Q?Bq60sPhvEPpbmxmtAS9nA7nsxa0g523Xhz0doz9L3CgKN4E28SFXF9GKKFj7?=
 =?us-ascii?Q?xXU/SSbsYOfwFeOD6dYZlL6NYnVBq6Oi8xk+AuTybToKGPMH7sAnJYveZY1A?=
 =?us-ascii?Q?UkITGz8QXZIqTrca8Eie3Vk7yJPIwLR+WM6ACOhkGU+PxsaOv465t+YTwMf/?=
 =?us-ascii?Q?ENFhCGjCzQpZBFxzyD5Io3FihA9ZMrXLY2YUoQXLCTZ55afzYJSIJbP2xftb?=
 =?us-ascii?Q?Nvyhxuk62Aqjnuw6QlJ0wwgmw2buRT4tQUYaprySnyU6eTs9lCj1sz5rbG7i?=
 =?us-ascii?Q?SCtEg67ysZzivaQf46fYI6pBFQ+G85aH/oSyYEMm5wYjkZAszXxXoqp7IEWK?=
 =?us-ascii?Q?nlEOPfoYsY+GAocl61w0ppLtOUq8zi3n4ohgL5Ada22kqdFNaNC0dK4k8crh?=
 =?us-ascii?Q?Z4wcviaale9Eriff8XdqmWqLzfDcMmJlgyfmBh/3JFenvzbswgsnPHpcf49d?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf87a4e-71f4-4333-1e7b-08dcec7ce806
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 18:20:39.4620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9B9OqSPm5huA3h68ZbDKx94xZ2F3ATN7977P/WFBGSF1XKLk4SYD0VJzqlb8xR4P+dZwDJdxnrYODbeK8q1/cIJIvjD7yYCVEQ6IadhHg8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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

On Mon, Oct 14, 2024 at 07:32:46PM +0200, Peter Zijlstra wrote:
>On Tue, Oct 08, 2024 at 01:34:59PM -0500, Lucas De Marchi wrote:
>> If a pmu is unregistered while there's an active event, perf will still
>> access the pmu via event->pmu, even after the event is destroyed. This
>> makes it difficult for drivers like i915 that can be unbound from the
>> HW.
>>
>> 	BUG: KASAN: use-after-free in exclusive_event_destroy+0xd8/0xf0
>> 	Read of size 4 at addr ffff88816e2bb63c by task perf/7748
>>
>> i915 tries to cope with it by installing a event->destroy, but that is
>> not sufficient: if pmu is released by the driver, it will still crash
>> since event->pmu is still used.
>>
>> Moreover, even with that use-after-free fixed by adjusting the order in
>> _free_event() or delaying the free by the driver, kernel still oops when
>> closing the event fd related to a unregistered pmu: the percpu variables
>> allocated on perf_pmu_register() would already be released. One such
>> crash is:
>>
>> 	BUG: KASAN: user-memory-access in _raw_spin_lock_irqsave+0x88/0x100
>> 	Write of size 4 at addr 00000000ffffffff by task perf/727
>>
>> 	CPU: 0 UID: 0 PID: 727 Comm: perf Not tainted 6.12.0-rc1-DEMARCHI-dxnf+ #9
>> 	Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS unknown 2/2/2022
>> 	Call Trace:
>> 	 <TASK>
>> 	 dump_stack_lvl+0x5f/0x90
>> 	 print_report+0x4d3/0x50a
>> 	 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
>> 	 ? kasan_addr_to_slab+0xd/0xb0
>> 	 kasan_report+0xe2/0x170
>> 	 ? _raw_spin_lock_irqsave+0x88/0x100
>> 	 ? _raw_spin_lock_irqsave+0x88/0x100
>> 	 kasan_check_range+0x125/0x230
>> 	 __kasan_check_write+0x14/0x30
>> 	 _raw_spin_lock_irqsave+0x88/0x100
>> 	 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
>> 	 _atomic_dec_and_raw_lock_irqsave+0x89/0x110
>> 	 ? __kasan_check_write+0x14/0x30
>> 	 put_pmu_ctx+0x98/0x330
>>
>> The fix here is to provide a set of get/put hooks that drivers can
>> implement to piggy back the perf's pmu lifecycle to the driver's
>> instance lifecycle.  With this, perf_pmu_unregister() can be called by
>> the driver, which is then responsible for freeing the resources.
>
>I'm confused.. probably because I still don't have any clue about
>drivers and the above isn't really telling me much either.
>
>I don't see how you get rid of the try_module_get() we do per event;
>without that you can't unload the module.

I don't get rid of the try_module_get(). They serve diffeerent purposes.
Having a reference to the module prevents the _module_ going away (and
hence the function pointers we call into from perf). It doesn't prevent
the module unbinding from the HW.  A module may have N instances if it's
bound to N devices.

This can be done today to unbind the HW (integrated graphics) from the
i915 module:

	# echo 0000:00:02.0 > /sys/bus/pci/drivers/i915/unbind

The ref taken by these new get()/put() are related to preventing the
data going away - the driver can use that to take a ref on something
that will survive the unbind.

>
>And I don't see how you think it is safe to free a pmu while there are
>still events around.

so, we don't actually free it - the pmu is unregistered but the
`struct pmu` and (possibly) its container are still around after unregister.
When the get/put are used, the driver can keep the data around, which is
then free'd when the last reference is put.

>
>Nor do I really see what these new get/put methods do. I see you call
>->put() where we do module_put(), and ->get() near try_module_get(), but
>how is that helping?

Maybe the specific patches for i915 can help? Patch series:
https://lore.kernel.org/intel-gfx/20241011225430.1219345-1-lucas.demarchi@intel.com/

Important patches here are patches 2 and 3:

- Subject: [PATCH 2/8] drm/i915/pmu: Let resource survive unbind

   Allow the final kfree() to happen at a different time, not
   necessarily together with the call to perf_pmu_unregister().
   Here it uses drmm_add_action() to easily tie on the last drm ref going
   away.

- Subject: [PATCH 3/8] drm/i915/pmu: Fix crash due to use-after-free

   This implements the get()/put() so we get/put a reference to the drm
   dev.

These 2 patches for i915 are the equivalent of patch 4 in this series
for the dummy_pmu.

Lucas De Marchi
