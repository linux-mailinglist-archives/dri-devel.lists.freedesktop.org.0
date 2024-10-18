Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E739A4700
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 21:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F5D10E228;
	Fri, 18 Oct 2024 19:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ok54+v9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCB410E228
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 19:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729279901; x=1760815901;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x4A51VJzyv8k6/GklERtJUwi4z4XYuVohinWbiHRuUk=;
 b=Ok54+v9ifNbblVbn2G64+oJhqHdYm/P5BxnTC4279459nhSybxyzsK6k
 9l6Tgb3w42fj7EzosrWF6kqCjGLcGQwsTip3tRt5W/22x8ofLuTJDuLdC
 3E1ykQrkDOUu+Ii7NcZxLwL9zDenFZWinJa1LC8WFlKunTpRk6PqEtpH0
 VeG/8HYoYvFGCslyWrDiznWcqYhjDMHPAGcykJ3XFyWIDiGzbqJg7+t66
 u3OGu8fLfbajX19wJaQD08c+ckqL+a4j6QI7i2xnfdb2vHBlAVNSrPZCJ
 TYpAzPnr6fia2D3Y4bBpFNtXYQZsLRchetGEH1M3mowVBnofYbIjXDoen Q==;
X-CSE-ConnectionGUID: J2Mg0ThiRZKNdFiMh9WYtA==
X-CSE-MsgGUID: 4qGKj18kQu2y9CaM7jFO5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28705859"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28705859"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 12:31:40 -0700
X-CSE-ConnectionGUID: 9U/TC2+WT4i2ZtyFK3Ppgg==
X-CSE-MsgGUID: DF91YQFdTAGxHxzc55GVSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="78611632"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 12:31:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 12:31:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 12:31:31 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 12:31:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 12:30:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHY6wH7rcYqaG5nXfbZSwYVK8bs0h+mEtbhn/xyTIXyhaQXzVtX4FXLnzNzj0MKutDUoVQw/PH80Bjred4oCEhOVNiPxRfz2hL/ppG20TqM8g0yZTjWIZ5grX/OQQ+94N0igNDS/PFjFe8kw6kjB1GSYVOVLuJCTU/lk6gEIEHkxVZNJoyDxBH9xlDPGyEh7iIhEpdKafqDOmDF8tna4nzRC6KQ/m038lr/0exaSxmuWZak+v3/qIZ4Sow7Vg3GB9wyWdyyNGvm/EQZke7VGz4IVXKLJZvNqrhl9CNhAHM4ioEE4RgkLemjLqAhUS8UpzGQ1eIfIOv0V1TPRgzDSbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVmhsZybpJ/frUnHfBvTBru3s9MrKpzOl11owurrawk=;
 b=ylQjv7HiBfTs/LYdqeInTgJrdufpDCQBZ4D7hD68448ITZ4AXYNHSvpWGjn+/XzoTFvSmZkmUdMo+76F1ebNRcYI96Ur5ompVa3C2ff5X3ZSZ2uPRryCtjYz8KXn5EE/AeQfYKUNKPaKsHjRKCXS52j24xsIUZMyk4SfNx6yyARAJ+iSZwICUPR8BZe+l6qQEn7dlr539ns6QwZIjyM6eoo5SNOJ286eU/2WLbmeeFqbARTb/i1zYh/kL0gFRk3xJXThmzaqndeN5ZRdWzvP1oWBszVWzgshKv9VQ2T3hyPOFCBioarg3hlYviBvx58h28IA7b9/j1h4woyqGYL/oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5003.namprd11.prod.outlook.com (2603:10b6:806:11e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Fri, 18 Oct
 2024 19:30:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:30:52 +0000
Date: Fri, 18 Oct 2024 14:30:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Ingo
 Molnar" <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Ian Rogers
 <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 1/5] perf: Add dummy pmu module
Message-ID: <iofg6cidwvbewldlwy7rz67jljs24unnszv6kdat6tvafkrl6f@4shqyxjid6ev>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-2-lucas.demarchi@intel.com>
 <20241016085102.GW17263@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241016085102.GW17263@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: MW4PR03CA0249.namprd03.prod.outlook.com
 (2603:10b6:303:b4::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5003:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e72db5-5acc-49f8-6a5d-08dcefab60af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E43Kx/atmL/0dkqGZL2fc/ZcNEkTdhu1PceAPVnFmsoeSe8VKYnr0Jf98wZq?=
 =?us-ascii?Q?MRPow5g5xMfTCiOZMkr+xGkOcUvnyDsfrIrbg/bKUdtxv60aZAcpMMGDu1pM?=
 =?us-ascii?Q?XV0dWLVTAq6VVAgStiaGsP7hSW+YdP2CZ8Xu3yKkze+PzKmciL4mIQi7/dmN?=
 =?us-ascii?Q?HZ3j1MARf96g4GlJgiHju/OxQHxGO9nnDs3ixq7tdt0xv5oAF0MQAWNerqCS?=
 =?us-ascii?Q?I/rbq0n82lmIniUx+nIytlgAcCfdyeIXYr5kANmluSx9ZU9Rda45GAFyx1Ab?=
 =?us-ascii?Q?uJTr4iD9RnfEBi27+H5yrNPrOOL5+w9V6+y5sNql/vMXX8ukv49ZFei/JGDr?=
 =?us-ascii?Q?8hZA9LKOK4xouvrF/qD0NPQqk5Js8Lsw0DXqsNiGeY3MOid4zSpIsJD2u+OF?=
 =?us-ascii?Q?RN3DC+7GYlXSlhjzgzPVKGqNaH32iferIxrWpfGw2Vm+EchumfIrze7m1QE3?=
 =?us-ascii?Q?D3LHSnzgUVAmv65I2mWjGDrpXWFu8HgtxlSiiMwaoQOoFDRBuk6TIfwUATwW?=
 =?us-ascii?Q?YQZu1bRrUtwKvjoo8u6oXlJCSk6PWddUM+FIO6F/EBw4yCM00wQeQbPmODWO?=
 =?us-ascii?Q?Kyb65NCsCXBTllSKuvAJX7KdlhEW9dRl113Ipjp06jRz84JCLHBR6dElSj4n?=
 =?us-ascii?Q?LAyTowNEAGu6YF/5ks+C2qES5d9hfqbQNJcU6HozfZtreKpjN2WvZh75dgss?=
 =?us-ascii?Q?6pd9YirsBLyJf/zY33IdEb4IeEZhZXlp+w/T09lztaAbqyNQeNzR+TxLtFwu?=
 =?us-ascii?Q?SP425/lG2+xClw3IHNzi164SWYnNkWRT8eJBRHNHzyf4vILEqWuPlPsXaqrq?=
 =?us-ascii?Q?V1DKCNZpDBxAehLWSoWM9pWR9xlD8m2VdbinjC767leN9kZ0ixg5RyxpRCmt?=
 =?us-ascii?Q?eofdkJaMC1KP5wssQPrlUw0y9c1Uqi8L70MH8/kN2pDZ+HNwUT8d0PRcOZzo?=
 =?us-ascii?Q?0QaeGpRyh/WU5/vN4/BfggG8FPNEWeB1IaXmu21tgnrNOgm4uXZE9vMe/PJa?=
 =?us-ascii?Q?SndU9n38bE5/8qVIMVZ3QJq3lrO9+fD/oJE9EGolcym2e5YFtzLnH8gh3xr8?=
 =?us-ascii?Q?s39q6wP9Q4XkcsKT5Tzeju5nDTMblA8R2Sc0uMrc6X/QsyAI8CCRv741rYMD?=
 =?us-ascii?Q?6CXixQS7wYpu6mEYkkDFo1nM8HgxLuorOMk1jdloFvwvBOyypaS+OTbkVYdI?=
 =?us-ascii?Q?Ag1YbyEkhIEigHvG5vpA+mN37s73+2CHsEXs0iCOQlD5heW3Lvkk+jl4aiwV?=
 =?us-ascii?Q?g80A73Uxdr2tBhrv0gtShnlzHLHg50DoJoRrDRcbWcjVWVW5pWbtle94dN4r?=
 =?us-ascii?Q?MjAYhniN1NJ/LQbWu1z2RYR4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KkQxnKDZlCqgvxVEkPL3jeebnLDxI0gCt1a7plxauMlUe9waiyNNtBjiKsxW?=
 =?us-ascii?Q?v1olB8XFN2CjelhO0spx5x9G0ukzxyga8oSRZuincz5fln3qa3sOtWrkE07U?=
 =?us-ascii?Q?YOBQia3vsPyWIsM+8nmNyElSZO98Q/UmiWsC/9aaJ++RQoy8mpjj4RsLQG1L?=
 =?us-ascii?Q?wRo2epkx+fcgn2BomfdVujg9AMo26gKhxF1PetdYEPSpjJYDgO8ecsR8nMN0?=
 =?us-ascii?Q?lIioJ64Q4fpy5J9pX6NTPUiXxF5LX3jHgu4rRRhGGOzEngx+h/5oi9OSjkBN?=
 =?us-ascii?Q?qHuHIoW9ygso7gZ1kQF4Pvh0y+Sy224k/76SD8CpppCKwP4dpX3/QBbO4z7w?=
 =?us-ascii?Q?X9FyGYRI24zQzhcImMcmuQJneq8E5fAxMEmZRY9M+SWjM63B8apoyr4DMsnr?=
 =?us-ascii?Q?0bw2KjmGO16Z/eyje789MY28yo6LbQ9bG2TlyRzlhRNpaX4FOCBnvwATHFJL?=
 =?us-ascii?Q?zKyxAxrRtZSRXjvRP3c6ytkt5zWyXbKBXaB775o1q8g8TWQaj5edF3vIDmrz?=
 =?us-ascii?Q?9eOuEgS/2JO2j3gd1dgrOYNgYqRwgcPgIa6NBPKjcScwkpJKspjqqLI56T25?=
 =?us-ascii?Q?Lb4NJjkV5RvqZJWBVNuIQogmJwvP+YYZkqZHTZMhJL1mp97/jPsAafX+ITGv?=
 =?us-ascii?Q?ipf7BAgZ7LiH+EpHJ2axdn7e8yJtiq4yL6cJOufSFF8EgnmECpVwXWkWojFM?=
 =?us-ascii?Q?qFz20ODnw2SMaqaEkF2CRiBVIfFu1CtNp96IBPv5XP6YLSYahtrsSubDU21N?=
 =?us-ascii?Q?SIksSeRKQteryZUUTDhw2iIg4i8sCfIFg9gMPz5G6nYOjvV3TF9V7BvrlxqV?=
 =?us-ascii?Q?QFI17OTm0t8r2ud8Eedx/MDVQa9nq03MTiGWXxMcst/UkOKM8YDVnBBrOtSA?=
 =?us-ascii?Q?9H2zErOmbnOcJMIpDWNskQ4jhiS1aMefkgnRDE/gpp9bLLtbNHqB2TyBUY7v?=
 =?us-ascii?Q?+MNyu+A0dSzofJZLPnXUPdfv0uEXR6B/ebG8tcPSR3kUDppMEiaJBE3rFOiV?=
 =?us-ascii?Q?m9lyQd997qWSqkJ3RRcNn4cwB23q3y9wxAtz/ZAJUzMnj0b3LRC0ANy1hB5T?=
 =?us-ascii?Q?bIkzvld0ITT0OGwSg1ZmrRJvCBvajdkQRWNdbhvS9hiPNUn9tSHhii1j0y45?=
 =?us-ascii?Q?f6D3OhhbLeAWU3br7LhQj7XKH+4R2Tg6BbEw0dI5ijerDIykCVPkwrBr82YB?=
 =?us-ascii?Q?jFmc2VRV/wa+2ARmd5DTslLYZYgsv2u+6sYq4JDQrg8MyYr0Q++DprcgXt50?=
 =?us-ascii?Q?Zqfdzi9vXoTEacXVmx0Z5kmiSardtVM5yqUnRhQmR1iYBa3k8YizunIpDGf8?=
 =?us-ascii?Q?Df7cBQnAi0YnCClX6KeH8E1uvw7gt8Po/nWmV9yeQMcdSchaYT6tAurYR53Q?=
 =?us-ascii?Q?jGfDFAlQv8INQq9IYhtWlXeeo8OFQxcQoFLZAvt3gmdmXEVA8LBQ4wYKPSdK?=
 =?us-ascii?Q?QFcIZsBLFYXe33xpsSHiY99h807vgQaBzdkUaqFgK1PamIrbhiy1ARzOV7KN?=
 =?us-ascii?Q?KDm4YM4uiFuGtiyCWkRD2j9yGwjkZELHskNQq6ZSTTirhClNqN/06WU5Ge/F?=
 =?us-ascii?Q?QBcuY76OJ+84G0dk0G07NilWrEG7Xadvdx78gfUMLxPNwQyaW5OeS0tmkAug?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e72db5-5acc-49f8-6a5d-08dcefab60af
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:30:52.2189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naqO9fUGh25ntNDJtcDVu21/kE+4fxcm88h7NQNpL/kKW1vclvLxKuZgeM2Jt6spEK/Hpmoyp9EMXuWdJUiiybAFkIOHPpef8FHZeSXUevs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5003
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

On Wed, Oct 16, 2024 at 10:51:02AM +0200, Peter Zijlstra wrote:
>On Tue, Oct 08, 2024 at 01:34:57PM -0500, Lucas De Marchi wrote:
>> +static int parse_device(const char __user *ubuf, size_t size, u32 *instance)
>> +{
>> +	char buf[16];
>> +	ssize_t len;
>> +
>> +	if (size > sizeof(buf) - 1)
>> +		return -E2BIG;
>> +
>> +	len = strncpy_from_user(buf, ubuf, sizeof(buf));
>> +	if (len < 0 || len >= sizeof(buf) - 1)
>> +		return -E2BIG;
>> +
>> +	if (kstrtou32(buf, 0, instance))
>> +		return -EINVAL;
>> +
>> +	return size;
>> +}
>
>I had to change this to:
>
>+static int parse_device(const char __user *ubuf, size_t size, u32 *instance)
>+{
>+       int ret = kstrtouint_from_user(ubuf, size, 0, instance);
>+       if (ret) {
>+               printk("suckage: %d\n", ret);
>+               return ret;
>+       }
>+       return size;
>+}
>
>because otherwise it didn't want to work for me; I kept getting garbage
>at the end and things failing. Specifically, it looked like the string
>presented by userspace was not '\0' terminated, ubuf was pointing to
>"1...garbage..." and size was 1.

oh... it's the sysfs (that PCI drivers use) that is guaranteed to be
nul-terminated. debugfs is not. And it probably worked for me because of
CONFIG_INIT_STACK_ALL_ZERO=y that comes from my distro.

and this version is also shorter and simpler.

thanks
Lucas De Marchi
