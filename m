Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C6399AF02
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 01:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6B510EB38;
	Fri, 11 Oct 2024 23:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/WsFgES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A94F10EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 23:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728687798; x=1760223798;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Sxkqeqs8P3wqKWRE7CVWx4H0psN1kWetKuACRa8gLgI=;
 b=i/WsFgESSgRO5mderpNYQULQZ1c9Xn3NQIZM/ZvTGnzqjSS3F9R3kLY/
 /NJ94arX6qIlikIVFBJGVZOfleO0BwC15vP3gFxkcTsv8dLANVdpek7V9
 PsgEWrsejxKk0olm5XpKBLJBCO80TYcAlxRCvjPdrPEjz6dDCvVOWGNtD
 GVk97y2AlMrfE0oBp/VgPSsvmsEY0SMZYs9XBvR4qtPMzkynQZ3afkXft
 iPsUq8eBRtemQTT5GVPc/fx50tTCzdz2wgc0A3layV1LoKGp+BT4lno+x
 +smw6kS2VMJFnlAN13mKfNraA5VYnWHCIRRYQMhfyKKBSFzytIN4J1mgW w==;
X-CSE-ConnectionGUID: 747NQ/3DSW2u7Y6d5XMRWg==
X-CSE-MsgGUID: cHt24lz+QZq01iGoy1LKdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53520423"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="53520423"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 16:03:17 -0700
X-CSE-ConnectionGUID: QL6ARQCdThGp0nbMJFLhIw==
X-CSE-MsgGUID: sGgwzr5uRG2LLCGZqGgvgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="107760489"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 16:03:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 16:03:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 16:03:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 16:03:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 16:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLaJP+0/03SmEkzem/qSLro4O57so8wCDvzEAlx9Qe+j95rVlxFuF4FEsYXM2oB/Nzjl2Com0CQj/HMA3IagLQ8j2Oid1WZttNe++0gjgiquNUu135jUIk699jka1P+uRL647AYW4AERPQCyhIWDunp66mIFrofZB59daTTKmAiPrIW8lFBP9P1ArHVmbKyDO6p6DaMOGdU696F9IutiLCUNd9u10zA6RA06NEZD0NbbsofH/C6spKbxYMDakcVIOkTpQenneOsFe6zkVIy78KFIzyZorz+wx5EwfZ7yP/zZbWOTk/ouAz7aG4mM71ewmjAnZkwm9MKh+suKksZl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXy9oCVfbVHpuDj05bCxcFmJUBR4OTHN+qgE8+6Rxuo=;
 b=L0KMNe7Tcw0+utxQ5vtbHxiRTBASYZ7jATC3h8eua11q03zLLxQWheE2L6XpqIYoUevcoACquoXfHud1HhfzpPgBb9OFJKKBOejEX94YO/c4Gapimxuc3FhTZ+9yWHuwHv+ur4n1RGwMRlismXSl67ObRUXuCygyza+kvg2TTR4kWMwPBwhSZCOHGqSwmCcW6T63ezsp6k4x8VD0YDw0r5EAsUf7hlwchyg6YrTUH4rCV0Ub93KfA6agMt/1xawU4uGMEYb2fNDrxaW5SXEvYXsqJdfeQLjNXMriPtb0+dJkl8Me5UYs35JhFeChS0grIWxIZy8xNFSdlxQ+8ZIwLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7248.namprd11.prod.outlook.com (2603:10b6:208:42c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 23:03:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 23:03:11 +0000
Date: Fri, 11 Oct 2024 18:03:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, "Arnaldo
 Carvalho de Melo" <acme@kernel.org>, Ian Rogers <irogers@google.com>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 0/5] perf: Fix pmu for drivers with bind/unbind
Message-ID: <upndskqxwe5qwfho4ta4v42mdsfggi4r6vpdjjc3welk6g7dzf@emnor45tvhqf>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <Zwmk3iqTdTkStfqx@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zwmk3iqTdTkStfqx@orsosgc001>
X-ClientProxiedBy: MW4PR04CA0308.namprd04.prod.outlook.com
 (2603:10b6:303:82::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: c9bb70c0-ad5f-4343-19ae-08dcea48e0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sxZ3M4xl+vdL4sajCGkHRXe3fTWhzGIlPSTgmuyn0QppHIzVN2V4mVbe6IN0?=
 =?us-ascii?Q?S7YauxWyZTblSCl8CGA5/erPP8bvcHnYJ6A+yUjFnnyUbZj9x2EXutgnG6LB?=
 =?us-ascii?Q?9OVyDDei0Md8Ne71+kJ0QUYvhI7QlCmYx3ctCP02pb0EeocMA4nEhxayqTyW?=
 =?us-ascii?Q?yZjwaNZlJEEogUsvIjwCVLsPykleIE4L2DwEqF9nEliAA6gXZ09CPYvP6EYM?=
 =?us-ascii?Q?JWkTlEAHAbEkfqW8F7wuA2UZZRS/SjU5rBKNVrwnl5aTSHK21n38E91zpX2p?=
 =?us-ascii?Q?et9h0ynqWu8gwJXsBquSa233wLU6ye2GSdlU+QYyXEY2cItwKyJSr8B7cjLG?=
 =?us-ascii?Q?A17E8UzwqI+z+ZkEPEtn0LeH8HgiE5QUmxKvtfKGmD73Wo4/lZXtV3Tr2I9F?=
 =?us-ascii?Q?UINL5l6jELzC30ElOpEpc8ps6sAzDnHlTYLs6GD5AWpXf68jLFP7JlggDXfO?=
 =?us-ascii?Q?fA4IJRnIHv/49Eq7avSOn/fA5JLaIiY5Yjrvv0tPI9CwOWkzCFdztXSTACQR?=
 =?us-ascii?Q?5HzAb0Vqf4rv6iH3HVGDIJqZKkYnXdRihOv8Zw2x+l+qUeM1UMwKudQQAq6o?=
 =?us-ascii?Q?mGLP7DFYW8PXwm7F2Jk/naL2EhA6STNE0+Zq8u5XK5/AVNanCsTf2HXlXhMS?=
 =?us-ascii?Q?34rdsQ7Ytqv8DLWpvuyPEpUymzss584Z7xDA6ESLIKJ7S/A0WK7s4LHXg/PI?=
 =?us-ascii?Q?2lEFL3RvFIxGjYXXJOTuKivG6b+npt0ip35ENgzK/0YobHV5ug4PR2ubEHk7?=
 =?us-ascii?Q?n+f4GLX69gB9mbhh/TPl1hp0DkbEZCMg7WzuMSnbXvxjkqDFbiTfkOieVITE?=
 =?us-ascii?Q?enY33O1qSAMu8KIyWaQ31QT7KKrnfJqEl5ApQ2T7B6/q3nR3Q3CEH2wgfhHv?=
 =?us-ascii?Q?egNne4hzaTXXW49+F1qpZ9jM9kA92E3oCK87enlvXY1g2HyilBjBc+u6RjO7?=
 =?us-ascii?Q?t3Vgv40atFwalJCiqzx6C16EfVpkS2nWbAYgGyvTngDs0/1JMobhNKO8Mxjx?=
 =?us-ascii?Q?HzMSgXTlolIRfPt/NX7LV272XIRmfkEMQt7uBIa3snQut29xhUDZFShPLAV+?=
 =?us-ascii?Q?LdUdzLYRgeZLDbF3aXB283Y84RQf43zurmTj4oEODfTzf3kFTKG/v6IxHKU4?=
 =?us-ascii?Q?s66+AlrpiWVaQgbtYICJ31v1qZI8MNmUEBNeJ3Hpd0GLRIM7vjQDF21AKIan?=
 =?us-ascii?Q?QKZUzG0T467/YZJ3lcFI7S8CBKPRzN+jnDnZPdJRjqw7qMTwuAXA043kmdtg?=
 =?us-ascii?Q?Tg+SeLBkfjT1Nujfx0v5YTP79vYDoqbjBKJwRip218/tPgMPJ5eCdxXCTJlj?=
 =?us-ascii?Q?kJI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ddhhmnwSjvqKo8EMxxFaiVydfw+4lom5+wD6r36VsK2GFOmG+UTT2Hkj4JU8?=
 =?us-ascii?Q?EZ9mzBWX1Lbh7fKDcXIGUfWc139FPbazUiNAfemAnq/94gZn9S8Ra/BzJp6C?=
 =?us-ascii?Q?Nj7fdbo6CQPl0UoDyUOhyPFfY9pQHyJCeaFh9i4PZiCnsQL1JtpHuW6z4N4e?=
 =?us-ascii?Q?EjPlvOsx7G5H9m1z0ccLtH7T6fMGcKK3PgqO5w95pgnuvtu5gOjr6e+nbGgB?=
 =?us-ascii?Q?08yuMOLYneoOl0Bc1XQhPGnXvIAZsMPxXoKyUNwkM8KztnUMQ1NQE4UqLPoE?=
 =?us-ascii?Q?c3nPGVayfVvSm99wrF4j2YO25cbtsfTY3vxjYdY6aiVB00JQcVgL/9um8qM4?=
 =?us-ascii?Q?RiX7KXSPgG0RTUvSdCJ2o2Z6n50BpcEtKuqtOBb2A6DH0OL3oB4c35RAloKc?=
 =?us-ascii?Q?vltGD0L8HyMjFsJZpBbZtIQsEOFTEF7KwdqwHEeNdbRNWjjXKWwkYrNYTxEw?=
 =?us-ascii?Q?6fl/1vhkqtBNw810KMqP6ynp9hII3LupnUVVCxzgD7NaSGqlhCrEsRe6EXXb?=
 =?us-ascii?Q?XlKQ5h2OU0ODv4fZBjwkdh6Wq+sd3RLSG40XoPvOSD5ckvPj23iizyhU/xzv?=
 =?us-ascii?Q?nLr/o5omfjNXNx3tuxOpfxJxh3vZKw7acM3XtgrfOrgqGn5EnMA7wnxitbGr?=
 =?us-ascii?Q?U1y/wLfxbLvl/iUYXCcXX28b8zltzMSRhw7a4Tvs0hT6h+lYAJbbdB/lSIWW?=
 =?us-ascii?Q?b7RA2MMpLBzmidcpIClR7Oz2AND2BaMctKC3hkhRqmzfQOnhEVunC7IToHQQ?=
 =?us-ascii?Q?yJkn6BdaKimRDHYy/zpBV9+u+13VlRJA0QNjCyI00zWEoaASNukHOAfGkHlS?=
 =?us-ascii?Q?McIws3rPV5kHOy7H118u134WOnT5MMvfawLYZTQ4iXx/sRZZwNrWWvTTLKKc?=
 =?us-ascii?Q?ucyN5RNTznVp/JauATo8N22JPf+rll7ehHmTSrB7z+tqwj2KSSuGoZGbqtO+?=
 =?us-ascii?Q?38t1F/pR50y4BA222OfhUgDZ7RibXea9X4xZQXRFDEC5db5D8KmkGV6CuGqD?=
 =?us-ascii?Q?mXpsHeAL/joqBgj0iq/PYY2DxudHk7qrDsTkch2E7Pv8XSt3YeMSoWD8Eqad?=
 =?us-ascii?Q?olnu/h7TYGVwPWWGRSAbwEnTz56eUuwDNkH3MWKcVOARpvAXKQSzIQ40Wu4e?=
 =?us-ascii?Q?vWhpeLHBhnX1Tb07rxFpxkJPQhUsP7N/hZUk1Y+TCjxBGit/tQRU/D+S6Ot9?=
 =?us-ascii?Q?TAtMsDRFTnRWKebYcjiChoiifBvYzRy/+0axqUUNCAq4DL7rkpX2iuH4TDTh?=
 =?us-ascii?Q?DBxtVwzfR/hQsjqP4SQUbxkK6+jpCE8Mc+xPcPiQcIDrJEk/I0cs7eIxDpo4?=
 =?us-ascii?Q?6e51/qkK8ugfFOX/mP6Dd68UCflZ+783MGEuWmEBcZsx8wzyEpPJoQ9j4bOw?=
 =?us-ascii?Q?VUbnSbwWTKvCK1csZQEnzkhTXl6JgmIBrgB2n1E6eipmQVn063vvVVMnFUp2?=
 =?us-ascii?Q?/a3UD2bKo+YEjxhJufnyp0MS+CNdM3Vi/coagkwmY72VKYoTFbrdFaPRPY4s?=
 =?us-ascii?Q?LKQ3aMrPl2iQBvGZUOWLN7lA9ZNd1VcEftrKDO8gJ0x0TBl/PWnCB4H6z7fy?=
 =?us-ascii?Q?c8O1pQh/k08AAyKRtnvhFGC4JAVjg4bA56quxpCO+7+rpwxfl6cGyBv9u0Lt?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bb70c0-ad5f-4343-19ae-08dcea48e0d1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 23:03:11.1630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWP865w8roXn4BYirCOj23xUN4ByZ86MDOPUfz8jMLVIkToRGBRrQP6eTmuTq8oNaOJxCxLhTGKiOsb3Risn2PUrOfNg3conJejcmIqi89w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7248
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

On Fri, Oct 11, 2024 at 03:21:18PM -0700, Umesh Nerlige Ramappa wrote:
>On Tue, Oct 08, 2024 at 01:34:56PM -0500, Lucas De Marchi wrote:
>>v2 of my attempt at fixing how i915 interacts with perf events.
>>
>>v1 - https://lore.kernel.org/all/20240722210648.80892-1-lucas.demarchi@intel.com/
>>
>>From other people:
>>1) https://lore.kernel.org/lkml/20240115170120.662220-1-tvrtko.ursulin@linux.intel.com/
>>2) https://lore.kernel.org/all/20240213180302.47266-1-umesh.nerlige.ramappa@intel.com/
>>
>>WARNING: patches 1, 4 and 5 are NOT intended to be applied as is. More
>>on this below.
>>
>>This series basically builds on the idea of the first patch of my
>>previous series, but extends it in a way that
>>
>>	a) the other patches are not needed  (at least, not as is) and
>>	b) driver can rebind just fine - no issues with the new call to
>>	   perf_pmu_register()
>
>I have 2 broad questions:
>
>(1) I am curious how (b) works. You seem to have a notion of instances 
>of devices and then are you using the instance number to create the 
>name used for the sysfs entry? Did I get that right?


humn... no. We just unregister the driver from pmu, so the name becomes
free for when the driver rebinds with the same event name.

>
>If so, should the application discover what the name is each time it 
>is run? In the failure case that I am seeing, I am running an 
>application that does not work when I rename the sysfs entry to 
>something else.
>
>(2) Similar to Patch 1 of your v1 series where you modified _free_event:
>
>static void _free_event(struct perf_event *event)
>{
>	struct module *module;
>...
>	module = event->pmu->module;
>...
>	if (event->destroy)
>		event->destroy(event);
>...
>	module_put(module);
>...
>}
>
>With the above code, the kref to i915->pmu can be taken from the below 
>points in i915 code (just to point out the sequence):
>
>i915_pmu_register()
>{
>	perf_pmu_register()
>	drm_dev_get()
>	kref_init()
>}
>
>i915_pmu_unregister()
>{
>	kref_put(&ref, pmu_cleanup)
>}
>
>i915_pmu_event_init()
>{
>	kref_get()
>}
>
>i915_pmu_event_destroy()
>{
>	kref_put(&ref, pmu_cleanup)
>}
>
>void pmu_cleanup(struct kref *ref)
>{
>	i915_pmu_unregister_cpuhp_state(pmu);
>	perf_pmu_unregister(&pmu->base);
>	pmu->base.event_init = NULL;
>	kfree(pmu->base.attr_groups);
>	if (!is_igp(i915))
>		kfree(pmu->name);
>	free_event_attributes(pmu);
>	drm_dev_put(&i915->drm);
>}
>
>Would this work? Do you see any gaps that may need the ref counting 
>code you added in perf?


well... I just posted the fixes for i915 on top of these patches :)
You may want to look at https://lore.kernel.org/intel-gfx/20241011225430.1219345-1-lucas.demarchi@intel.com/
It works for me on my machine with a DG2.

Lucas De Marchi
