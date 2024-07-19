Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC1937B90
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 19:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4435E10EC6D;
	Fri, 19 Jul 2024 17:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7dYzP9R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523E610E8E3;
 Fri, 19 Jul 2024 17:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721410007; x=1752946007;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e1RDyNweoJEObxHg8MICsXraPXdqpVJGkE+GDu37VqU=;
 b=O7dYzP9RMRrnZg3eg1oyeubwT6/g3h6u+SkjJNr492sWg8t/yrMwCOMl
 8ky6KRnbiZTcmxL95unHr2pAmnXvLab3wmPf9QoU7zECxXDSoR1seosXR
 9fETmL0TwODOtz1PfswdJs/GQ17x8nmh8d1hxwogvCfuw4NwXW7z7O5jc
 To5b25u315ECVFyR5tC05oUTyjNlGjBC0p4qIS+gpVEj0yfiuC4nhZulw
 JtHAPmT9E0yqwnL9T8RR8ulpDMCG989xpT0uVa3aNURckwpTOtJ3IjCo3
 UrYqbL9l0dY4dcjP5efyaJlC4zeEdmqrq9YrzAAopBTKFiWuyiwqnFjYz Q==;
X-CSE-ConnectionGUID: PBywEpeYTBaAMxSrmPLI+Q==
X-CSE-MsgGUID: hnfzujKJQsimrx83KTeOlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18993906"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18993906"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:26:47 -0700
X-CSE-ConnectionGUID: Q/TAD5j0R1yPOt11SdBfSg==
X-CSE-MsgGUID: axeQx+hQR9mci2pDpH79ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51803629"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 10:26:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 10:26:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 10:26:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 10:26:43 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 10:26:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zb8HY1q22kRlsOqlh7aWOebdXjXomY211YrJ0ZwPZdR0raxP8pqRpBIIacP3XImCmN3wiPSOz6MyznimP6XT3/v7FLP0EF3SSH5KIJB/Rh4LYxfsuDHVpySwfBwiAZ4vmQT/zhnKavOwgh/QpZBW8SMJpOMcO1binxzEaoDOl+vKKAv9mteOWr4keubUoXXX4zFXgYPOSr9mIzfdsBQrJ9z5Vj4VdBLfhyvYEXMpqYUZot159tJlS5LxXBb0CpZWmYvZvpvRcYeYKukWTwstxcHGnLWV3S598jG6RkzAa+D+q8J81YDWMv9kn195We/hXRU/jymN0Wj9ypEhiR6iRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oNFAGbaA3x0zdSba5SVfCcvDPVqsi8fJcFVtduvGM6w=;
 b=QWdio9Tkoa1T5/xGU6ZQEIgqHdut1wp1SDnfYASqLAGN7/r17hC0Ijk8bDBCnnUrY+VSIH0ARUOJ+0ORjmNBcJ0fELvitJUBd0NwjumcSOHInpuq1gKF2RsNBAyBVcAJQXb2RxVgWeoLqBjRMurRw0CrKcm2UWdNjBqe+uURE9KtKTTKGc8ltPeex4sZi2zVrwHyMspOvz6lr5ci6XqfEV6tRzDh4K/3x1/UKgsU4jqOxWjeSbJWanXUPtNKRvakJWMiVIdpNlDYl5zMCBGscVz/urymGxZspVymdHfbbLXB7Yam6jn6L79Twq1gLn3Ihi6TrRKM1JYkRiICJ4c9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5922.namprd11.prod.outlook.com (2603:10b6:806:239::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 17:26:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 17:26:23 +0000
Date: Fri, 19 Jul 2024 12:26:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>, "Umesh Nerlige
 Ramappa" <umesh.nerlige.ramappa@intel.com>, Jose Souza
 <jose.souza@intel.com>, <dri-devel@lists.freedesktop.org>, Thomas Hellstrom
 <thomas.hellstrom@intel.com>
Subject: Re: When sysfs is not available (say containers)
Message-ID: <ngf2rtw3xmerq7ghspiog75oy4kzl6pmp6lltvhzm265yld6fj@hbhx72bprba3>
References: <20240618014609.3233427-1-ashutosh.dixit@intel.com>
 <20240618014609.3233427-6-ashutosh.dixit@intel.com>
 <871q3p5nsz.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <871q3p5nsz.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SA1PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f3a08a-98e9-49fa-4751-08dca817e993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w/0L5zRqM/qnL4eXS4nulsAFh2BOpIL14652jAwKeiijRWvMX2F/wLVrv4R1?=
 =?us-ascii?Q?p5sv37IbGv63SEuO/R9hnhU5+D8iPQVPJ57/zbXU4M7IIXUJvN5CVt4ikNxd?=
 =?us-ascii?Q?f/8/8/i12Hh3FsnYfx3nx7k3WODdJYUNxjY6WPsU0T1mAoZuXydE7wh7usTK?=
 =?us-ascii?Q?wHqdyCCu8GsW7G8D+GdC9wUiGssBCYB0Ndg8IgckhQE8che8rSZatvuEqDGY?=
 =?us-ascii?Q?bQo0zs/yIj/rBLXlCWS4VXRUetKnGTigq80Cj1Xck3mxIvq6QH/w+gPQ+YJF?=
 =?us-ascii?Q?c8F8w49nreu/m50fRMhzmEur1Z72T73hrnZjVNAN/ftOVsxTiSrenzTmEsxx?=
 =?us-ascii?Q?35RgzaYpRpZIFRJRnkAXBB1i987yZUjvrb7CSqcpGf1BM9X1AeZyVcE33mfq?=
 =?us-ascii?Q?C7CDSyLYc6ZISMjRl+13DVWpls6CyIPJXtlDxJc+wdYsUdgiMXcONmhBnWpT?=
 =?us-ascii?Q?ecTUvSWCMZfSdXpsO+SY25TyroPxWMH9SOyvHAP91Pe/BlsbSmSWGfDeZ9fL?=
 =?us-ascii?Q?uX49tm9B/n+0I/lhWYJHbUnqkIWJlo/2W7CmEkmnxDo8KlgdjUUg+tot5IQr?=
 =?us-ascii?Q?GdIDm9HFJiOXBeIzBOsgeu0+akXwzZUDfmjeQvArFP+DeCS1xBSmMl3DMdgt?=
 =?us-ascii?Q?j96hRvyMjSq1m5/pOIzPIEsZbSgD0Fks2rrnt68+9KE0o3ZeFrF1nEyTxNQ7?=
 =?us-ascii?Q?rQOkzA8WPBOyCjDKfLm07Uffq7QS87brvVPbf1+1j9jDbV3gMYXofNdTTtAg?=
 =?us-ascii?Q?F4OoXuf91u6nivd20JNTh1MFD5aJC/aCq6/QLLu8RoJlLleKB24eNmNgSZdA?=
 =?us-ascii?Q?1nqsaIXeUlvQ3lTKoPRQAwSR7CZFiOCveF7xgyogiRnYrqGPk7WQIGJ17yAB?=
 =?us-ascii?Q?56XfdTMroPgV2GmrEHF+BPlRz/JyGlmxvWIbE+ZoaBD/Key81z1Ev2+54lCn?=
 =?us-ascii?Q?RMxZXYynRRShtrWohJCPJvX7eQsAA0FUxEPtp0XSXo+4L4mJe/bBTPrRJduh?=
 =?us-ascii?Q?Z3CBGveGOWmhgxjyzI80odSXz7C22OHk1XLqTyx3YMrTViRczGTcLkYp9c6W?=
 =?us-ascii?Q?adlUIqgGLblbF1Y926X8fZql0466q6dLrLHxVoVFPPcSHhTf6zSc1KQHZwBo?=
 =?us-ascii?Q?AgOz3BlvPpOynO6xC+ce4SUqGfG2NfAqGOp23hADYPONkfmBJfpnqrnF1+j/?=
 =?us-ascii?Q?ot2xexi88ZaMFot9t+vNRsXCaUqsnMKRJayhCvXTSrC3GObyFlH96oDPbvov?=
 =?us-ascii?Q?uAcRxYl0Hi9xOtvbup/kNRrWoBGTA1X3+OMhZUwOCQnTl0MRtPWxgS52QnNZ?=
 =?us-ascii?Q?9hY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y5bJ1nYfnHHFuVDBKLGZE3jy3kQlyw5C9PtWH+Re+O/f7+tlPYmQeSOqHpzL?=
 =?us-ascii?Q?rQCksTSIoBMncQwXQxiO+tSWBkaubfgZBV6pxnkH0yTUYJaX1+sPcSVAby6r?=
 =?us-ascii?Q?qTmfKARqekM/toWpNK2Lr3254vFfo6paybrERGLAxM+ooBv5wusLk09DHIpj?=
 =?us-ascii?Q?8jJD6fIBEktzt2y5eKThMJ1YNbLu1Uvo8mPMXFTBEbXBl1kyiOrY7feFlwxJ?=
 =?us-ascii?Q?g5rLE5cZvVDBFatLZ6BpT7KVjfQfrgeMXpFrbKECtEK60jOAlVR08nuduIsQ?=
 =?us-ascii?Q?T1qYgZo7Pu6lS8sDYt5dsewQ4mgLS3oElOz1TUT5C6bktjVNGzo4l6x30X1q?=
 =?us-ascii?Q?z2va03zQrTDGmKRfwzOqtM96mAP7s8nrNMiLbvGWZYyzsTb5/JxAhPDHHgaM?=
 =?us-ascii?Q?pSxofe+yfdI/AhC/bxUqojTo81h2F94krV8GwV7FZ8m1M+enwDwwORyulW0K?=
 =?us-ascii?Q?H+y8pDpcMhxKv0sf27l9cT9FPRPy+INsU2LM4PNo0F5FVzHXLo+Pu9U2qVXM?=
 =?us-ascii?Q?c+MGQarJ4FmGl5R1CVEkiF+iUGUb8ohOGU08yk6K+smx1DmKaLmI1X1oOxyS?=
 =?us-ascii?Q?Rf0UH6v10kheckJIgY0GY498MT9CwxVc0CYug4xbF0i9/+VeRzGjrgFnJdoL?=
 =?us-ascii?Q?tQvOFYmtNeBsjtT8w/gTrtpLtT9/QxD5LGQOAGCyIDSEaEaEVOzQtvF1ia5v?=
 =?us-ascii?Q?Vpd14hqya9QQya36aydVFvXDyBf+05R0tzH/qCBnsW7xpu+4AafgJ5JgEC04?=
 =?us-ascii?Q?hmcKPimTWKALXgWwkGIqKlgrKgrHYm0JHYI86oPCZv2D1dJK7afuKalC8+U1?=
 =?us-ascii?Q?5cAm4crBZe9/WyVDMNJCwSw1KtiAaxLmuHReCZUSt7n7GiR/2Urr7bbwqitt?=
 =?us-ascii?Q?pDie7y8IhsYPc4Imps6L+kEzhDiXNUOBlCuVAnz5HquC8kdGIHO1bpFl3CZB?=
 =?us-ascii?Q?oiUlZFNl+m+r7+hGsr+BvYYdxiHUFsRUZVCEblE//kfjSwfoiC/iVmeHUg6B?=
 =?us-ascii?Q?iD7XWajCDM+4YTAKl0Ib0YdKwJ+H/lfJjzatGWzYfp2nEiSGoltPu2/p8IXb?=
 =?us-ascii?Q?BYpc139iYZJdzI5hO8KioL95jWsivM2yTgfzVJn7jcfZ3769x1PgzqSw8aPq?=
 =?us-ascii?Q?QR3Kt/WLjj0bm5PBeuV4wB1XEJ5BSg0yrd3kcITzjPtgFJZaiblcBrkodqkW?=
 =?us-ascii?Q?GhUBcHd+6K+xQEC9uGXNS3TjJX4uBy820+aECA9VE7kkKnfGVBfI0me99tsx?=
 =?us-ascii?Q?4HgXYzsOulham9KTC1v5X94Klfc7RDjGy62auAMXdkYfXsd81/Y9lRuaY/EL?=
 =?us-ascii?Q?qwSo10jvyMF/J6sD6Pnkaz7r4D0UalxoapcuBFm6/slXgVY4jGQZTZFvPqWu?=
 =?us-ascii?Q?/bYoajKJcAl8TWfvAuGngPNoCFMdJZg9ZdXT2grfvjCs++BwlV24vBedq7BH?=
 =?us-ascii?Q?JmuUQ5dssx70L/S74Xg/gfekDMI+BBHkMR42Fjd0tJtxz0cTmlP4nFCtKEVG?=
 =?us-ascii?Q?83hZxR3OVjoiflFjYZUJeq7EyOssnl1mWJxuIYn2kVDBFA1JyLRUwLsQx1ew?=
 =?us-ascii?Q?wox3aCgxoDvAlvSzemmJdw4USPhd73TGwkxJ2sN+4pgsIKAD9UXjbTaKbyj+?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f3a08a-98e9-49fa-4751-08dca817e993
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 17:26:23.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoyoxNmnpwTWn/eJVbDnkR1vR7ajPnPEkA2tE+Xan3NUIbilbPxS3tZc2syN41Vhj47ULa7+SpoLLOSb/5tH6mCZBUmXiof4pzIJKS85cbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5922
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

On Fri, Jul 19, 2024 at 09:50:04AM GMT, Ashutosh Dixit wrote:
>On Mon, 17 Jun 2024 18:45:57 -0700, Ashutosh Dixit wrote:
>>
>
>Folks,
>
>The below is just an example from one of the earlier OA patches (already
>merged):
>
>> [PATCH 05/17] drm/xe/oa/uapi: Add/remove OA config perf ops
>>
>> +static ssize_t show_dynamic_id(struct kobject *kobj,
>> +			       struct kobj_attribute *attr,
>> +			       char *buf)
>> +{
>> +	struct xe_oa_config *oa_config =
>> +		container_of(attr, typeof(*oa_config), sysfs_metric_id);
>> +
>> +	return sysfs_emit(buf, "%d\n", oa_config->id);
>> +}
>> +
>> +static int create_dynamic_oa_sysfs_entry(struct xe_oa *oa,
>> +					 struct xe_oa_config *oa_config)
>> +{
>> +	sysfs_attr_init(&oa_config->sysfs_metric_id.attr);
>> +	oa_config->sysfs_metric_id.attr.name = "id";
>> +	oa_config->sysfs_metric_id.attr.mode = 0444;
>> +	oa_config->sysfs_metric_id.show = show_dynamic_id;
>> +	oa_config->sysfs_metric_id.store = NULL;
>> +
>> +	oa_config->attrs[0] = &oa_config->sysfs_metric_id.attr;
>> +	oa_config->attrs[1] = NULL;
>> +
>> +	oa_config->sysfs_metric.name = oa_config->uuid;
>> +	oa_config->sysfs_metric.attrs = oa_config->attrs;
>> +
>> +	return sysfs_create_group(oa->metrics_kobj, &oa_config->sysfs_metric);
>> +}
>
>So we often expose things in sysfs. The question is: are there general
>guidelines for what to do for environments (such as containers) where
>userspace cannot access sysfs? E.g. in such cases, do we expose the
>information exposed in sysfs via queries (i.e. an ioctl)? Or another way?
>What have we done in the past in drm and what should we do in these cases
>for Xe?

userspace should be written in a way to handle sysfs potentially not
being around and not crash in that case. Providing limited functionality
is fine and user can decide what to do in that case. Creating
duplicate and alternative API to handle this is not a good solution IMO.

For containers, it's common to mount sysfs read-only to give container
visibility on the host configuration... or parts of it in case you are
giving the container privilege over that part of the system.

Related, on another project I maintain (kmod) including systemd folks:
https://github.com/kmod-project/kmod/issues/10

 From https://systemd.io/CONTAINER_INTERFACE/:

	Make sure to pre-mount /proc/, /sys/, and /sys/fs/selinux/ before
	invoking systemd, and mount /sys/, /sys/fs/selinux/ and /proc/sys/
	read-only (the latter via e.g. a read-only bind mount on itself)

that page has more information on other parts of sysfs that people make
writable/readable for similar issues in other subsystems and is worth
reading.

Lucas De Marchi
