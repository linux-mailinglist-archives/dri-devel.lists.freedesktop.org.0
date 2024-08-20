Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11767958F9F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 23:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9172410E49B;
	Tue, 20 Aug 2024 21:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAZDT/Sq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6091A10E498;
 Tue, 20 Aug 2024 21:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724188969; x=1755724969;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QirWQx/fJhOKdQniYqeNfq/H/gphpwg53gvBFn+HuZ4=;
 b=kAZDT/Sqe1huk9HqLheKuGzft2fsNAhCEe9+teKpvXEyLhQdbtw08Nay
 JxBc1kGG4FdkiArJoE5Wxh1L3OzxLkvbWReRLmlRQw1itsOJB/WQYjADQ
 KFkPZwcgA/RZJVThoz0AvvETTkKftcvZOTHWez93qe1+2zOlKljiHp+b7
 riF0u3VfSvtK25Ih4OC61QVs6HOEdOOLkbx3cBcAwwVB4Q0MkKrlqWq7S
 ZcD2n2994Pb58o6BnKfZF5XAlabU4wgLDsDqoXm4DTU/6hwI6W9xCKpny
 S3P0Vmf6pBJSMI7rr/2vxAMTW8ur6kyIvee7w8crL8zHYLFGVRjx8btdi g==;
X-CSE-ConnectionGUID: OvQ1R3bCRvmMrsTORx/eeQ==
X-CSE-MsgGUID: STLgja7CSVmdkz4YVcWj9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22382994"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22382994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 14:22:48 -0700
X-CSE-ConnectionGUID: Vo+MdicRTEGKjW6nqLPLKw==
X-CSE-MsgGUID: KTyBYgZLRgSiTNaeMZs/hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65217839"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 14:22:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 14:22:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 14:22:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 14:22:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1cZw/sHal+Czc2qQGBAdRVfWjyZL66kycTSFQHkxDwe0jhhwaOzkKpogAyAoq50Secs9jF2IQBSz05MSfv/kAhVzSf+upc1wqRPC5Wr8qt8vB5WUbCSJt7IxwTLn6ELpzDRJtI+j2W0LbwiQHTDyN+5ohXaEkX0YXXwnTTXKxtzMpulCebmU9lJ6if0jSYjnEcaF06a3RMCwX55qy7rP142cux8vxUUbqQI7dOAKP1v7CGmjwHXa8GCqTgyZGOyfhYlhqlRgu3qvYgqygD+V+rfO54X/NqR6AAaIo8ay45/WE9NVwRD8Bkb6E+Gvc5U415L4thS8cW25oEKCozjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6m2ID4aR87imzg3on7ennuaTkZUDT99ZLjwHUEmCX8=;
 b=gMTZE1XQDkPuxoJsQ4j14y/caYsGKwisZHjewfauwWs8GCgog9mfk+jpLrmQUfUy84E9GfINQxVe/V3HCXv6Fnl63caCXbBYUQ2NE8SmXTFx7IrZRl00dCO0hSNXLMP1PGQUjmfvXqPrrGqO7sOHs9tMiV1vzkTcFOTZ+ied39lyu3pBDRaXoEGnc9/yBZptfCJ+CG6Pex45jzRMhlXYEvT7oWGDgrwK6nJ5igTwLioXWpFl8WykBmDI/pJv9gL3rkCYDhzWSuauxq1rMc1KrLgoO1tad/u6WibW1DM3qALxwjXq48MUgBxHZ7Mnd6lOf4ME13lOnr94DO7FlZg5AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 21:22:44 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 21:22:44 +0000
Date: Tue, 20 Aug 2024 17:22:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gt: Continue creating engine sysfs files even
 after a failure
Message-ID: <ZsUJIFVKuIX_pbDw@intel.com>
References: <20240819113140.325235-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240819113140.325235-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: CY5PR15CA0093.namprd15.prod.outlook.com
 (2603:10b6:930:7::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CO1PR11MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: fff78e50-9579-4939-8a8b-08dcc15e3af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5kafL9PYwJTEG0g5JdoYRcxCkm/WKVYL6BKq6PJaqQlIYyR0Z5+pIxzGZ9SV?=
 =?us-ascii?Q?3EMri5gN8/LkObcmH09j+3AG6Jv4vvDzZXqRskcj+f1eggNWDZYhY3QIUgOt?=
 =?us-ascii?Q?d9yOVw3o74XttkzYK2BYdHStdizY6JCxBalH2/WBeFJVOR8NoaXRu89HS5S7?=
 =?us-ascii?Q?DF3/hJtDwER2VxuvTSi2T4OfVX1ksZp9KRZ53BKEaBz03wNOWPvrNlT6jEkX?=
 =?us-ascii?Q?/4GH07PnJDiWH1Li+vh2cH6+UNHLP4j6cHcPeEYMqVzzUgC5NbHTWRBcFazY?=
 =?us-ascii?Q?zwS+h2lboDFsUOQ7C9iswmJB1I/k2wZccZ55wvfn2ZSsVwoFtfEwChmA2wir?=
 =?us-ascii?Q?U6L4o80LVfJVLWMmrAnivBSDs4rvWyEH/RUo7epDfjPcNvbmoY5aMI9yP6H2?=
 =?us-ascii?Q?EtsM0Itc2J8aElW7T+YxSs5eWUqo9NWMmL9WPVoeyRb0zXjEBtVT8tfEuTiQ?=
 =?us-ascii?Q?dkFZl9CKx0VOOP0+jcUfWeaIHgqa3/5zFDtCq+Mgs7Hjm468EfoXB+g7PHI4?=
 =?us-ascii?Q?VR/Ycq74Dw1fSRt1d14I6qlR6zYvFOZioYDdxQLgfGaQpzM8A/4CORCrvW/a?=
 =?us-ascii?Q?xUW3GYExFujCyMR+62rKqMSk4P/gac/iIvPWasFk71c590cq/1PgPrTeBfkr?=
 =?us-ascii?Q?BV6GX8tO6jhhrbEYFi5TT7AQEcfPHeY9dGCn5QL6eLKlEdWjTiQQ/x+YpBme?=
 =?us-ascii?Q?Mj73Vk3atdhNIamOX1omn8oARXNlrbQynyfYtpYnHrbN5QqfHgbVwiAIlzly?=
 =?us-ascii?Q?OHl2P3KbnzTgF//Pc0FHz++6x2v/2s8AMiA08N4ErNshHq1Fcuz+ccvle3kd?=
 =?us-ascii?Q?BEBSIdaRf/f4Mhzpys4ZkTIcEpJNlWdV/uImu6tAiQQKNK5Rbrro5C4sYKIo?=
 =?us-ascii?Q?+3WFmYlmx20fpGHoINSkhjQ3FmhBhqDevfkrtY2G4Jnu2sq/ak3eR16BhuWk?=
 =?us-ascii?Q?dhsOp0AQ6tIODe6lm9hvTc8mshO0BFv8IJVjqjnabFGuFahBCxD/kLVBfWrX?=
 =?us-ascii?Q?Lfr53awhA9O0+xq4D16ffXfADoqc6BECp+ufQsF1PFk8a83tVbSJSofZeav+?=
 =?us-ascii?Q?PMXcjOiCEWNn1393n9RHsfgcrBiDO/Y8R1FRdWQxs+SggsTdLILYCJ1Trv1l?=
 =?us-ascii?Q?5hq0b3gJ4n1GJVbDl0ZVL0hCuXOrlytARVJOtWyGK5JsPbjW8bPEWvaoUeYw?=
 =?us-ascii?Q?eXpb4kc75IhNr/W4oQOy/r6k+JdrkNbA3EvbEOysWaht9T1+oni/UR/HEvqv?=
 =?us-ascii?Q?I8GSeJ7yC2zNODx09KCmAb7KRPdEBAA5D/kvivpDRVSJNMPVp+HvgmbOXqsI?=
 =?us-ascii?Q?58oLYjxKjLe+E3z6Pa4u64T9Ot9H0IubUoYzejvjdt1qvg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TaBaYEew+JjcLR+PQerevBB/poiT8qd3MKTiCHj4BvVLcgqOPcv19lx6NcnR?=
 =?us-ascii?Q?S/rzZD9nnxMCYKrcOupzDzTGSBV0rfcK7LVM1ymuwwHxP/zHT99D3OocUTgP?=
 =?us-ascii?Q?6XjtsXJRThQ6BOPNGNTP+8vacbIR/5FZnTPaeA0TCtJ4xYWBHfwJTCbd+cS0?=
 =?us-ascii?Q?QDHB59ChSjuGGA2s9ILlv15lrQ1nTLexz86qihZURMixxJiBNygc0yrmuyLP?=
 =?us-ascii?Q?n+t0uKxWow0T4I6hJmuKSLLVe2cf+K+bn8xgdvSKaEgi7udAmITpYjpraIT8?=
 =?us-ascii?Q?6rG+IVhqqzUeFzeD37xxuO1hvASTaakEc7lHf7LirJs+af/CPXn0AtixB/c3?=
 =?us-ascii?Q?Jg6QM9g09nb8G5KbezJ3REwzv+lk0ZivTH+PyY38VIq/GikjH7zS2sIZ9OcX?=
 =?us-ascii?Q?5+SM2hmz6L7RDxPEKfSq77las7lr6jZe0OevRcNvXuJdP8kM79zPjIMrQw3W?=
 =?us-ascii?Q?GnMdby/vzibiGn7xTqrrqDIsffNPrHuHb0J5WP0mK+A5jbNUOCcqQQTXtBwj?=
 =?us-ascii?Q?hPxHoT+uL2zGEIs27+3gFcNtJMCNUVo8r6fLb3qZNQDDiwvjtY0NB0sSojkN?=
 =?us-ascii?Q?Dhutcn3vgHa51joacNJ03yp4hNEKZUJJ+WmiGFsdUV5AaaEzrdhvQHXH63Se?=
 =?us-ascii?Q?YLYtCK1RwmIYWf3Geb/orXHW0uMHpje+DBLJRaxoN8+hGoI2TNFwHlgo5z+V?=
 =?us-ascii?Q?DktsPrFaxc/i2gDcMQWkTUmoLslSkqE15YdtVRMl5WZiKeT53lxsj8qxyGt5?=
 =?us-ascii?Q?Q1pe5fYq8vSbIjf16kz8dnFfRf0JSpM9UMLbpiewxRwiK24FmVWjhDMaKMKX?=
 =?us-ascii?Q?B5SzgxtuErTfroOtPl7jVcHjFDpn6R+8jytD4Ej1DYFVlVF6qnTYBx3HDxTc?=
 =?us-ascii?Q?Da86uqGlUbPdolqtwYEWauEWg3pqXxtVGTcNZs7tZ0UAvQuv5wdwNfsqNuPA?=
 =?us-ascii?Q?KuL6iRH8pd3ZHihm86/7KXIB+fBVlXAGAYbMnTT0yPmO0OniVHAAkRf50x9o?=
 =?us-ascii?Q?LbHPLeUNOjKHRZ4DnfzUIlKkvahZKdgMm4RA8+3U9GZHsouTT0IA72JPOUTk?=
 =?us-ascii?Q?HTPJBYkJXkdgYFSn7p47oGTqnERtHKNrJrECsPd+hyHdpeLup2sMC7VRRvQi?=
 =?us-ascii?Q?assPKBin7FZfXBVNwBNP+h+i11sISIbpWalVseGNyyhbhYeApqOjM7lG6UT9?=
 =?us-ascii?Q?MOhNzwdQwfKPOdWX1zPJmyKW8plAI8OeO0JLKMW6YbEPVp8ZWbEh39RlnJpO?=
 =?us-ascii?Q?zgoOCnecOYsLNt/QwZMao02Sp5lAjkEqN6gjN8M1Gk40bZ6Zs8eIfUuqh0i9?=
 =?us-ascii?Q?W3X+3hlDjigeDiVDmIIBNEzgOhwAMxiByra55rNJ7rxAYD7A879x0bwqIgCF?=
 =?us-ascii?Q?MwssSca5X7d0849VxTOVqqb7cGFZjjeoLc17OewslLa7FIga30mlzTZDup0s?=
 =?us-ascii?Q?YP7rayVLxuQw5+M47CrHdhKjyKYUECF5PsfDp55HBncqaZdn+twKbvkZbg0f?=
 =?us-ascii?Q?nhw093HHSS7eRI9qXou7PkWUWqi1n+o+HPB84OoMLWxF6A9XbIuFkCf3ameP?=
 =?us-ascii?Q?U9lbjMgVxUhCHWCZGtrRp0niTOC0WwzNLO7mrWLp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fff78e50-9579-4939-8a8b-08dcc15e3af7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 21:22:44.3254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sEgqmX70WMjXBbBiZBZPd5No427+fY7blQNeAf56cpqd6uoa3C4jcYtdiqXSAlE5NdlKgz4/x9EHg97T/mbtpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
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

On Mon, Aug 19, 2024 at 01:31:40PM +0200, Andi Shyti wrote:
> The i915 driver generates sysfs entries for each engine of the
> GPU in /sys/class/drm/cardX/engines/.
> 
> The process is straightforward: we loop over the UABI engines and
> for each one, we:
> 
>  - Create the object.
>  - Create basic files.
>  - If the engine supports timeslicing, create timeslice duration files.
>  - If the engine supports preemption, create preemption-related files.
>  - Create default value files.
> 
> Currently, if any of these steps fail, the process stops, and no
> further sysfs files are created.
> 
> However, it's not necessary to stop the process on failure.
> Instead, we can continue creating the remaining sysfs files for
> the other engines. Even if some files fail to be created, the
> list of engines can still be retrieved by querying i915.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
> Hi,
> 
> It might make sense to create an "inv-<engine_name>" if something
> goes wrong, so that the user is aware that the engine exists, but
> the sysfs file is not present.

well, if the sysfs dir/files creation is failing, then it will
probably be unreliable anyway right?

> 
> One further improvement would be to provide more information
> about thei failure reason the dev_warn() message.

So, perhaps this patch should already go there and remove
the dev_err and add individual dev_warn for each failing path?

Also it looks something is off with the goto paths...

That if (0) is also ugly... probably better to use a
kobject_put with continue on every failing point as well...

> 
> Andi
> 
>  drivers/gpu/drm/i915/gt/sysfs_engines.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> index 021f51d9b456..aab2759067d2 100644
> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
> @@ -530,9 +530,8 @@ void intel_engines_add_sysfs(struct drm_i915_private *i915)
>  err_object:
>  			kobject_put(kobj);
>  err_engine:
> -			dev_err(kdev, "Failed to add sysfs engine '%s'\n",
> -				engine->name);
> -			break;
> +			dev_warn(kdev, "Failed to add sysfs engine '%s'\n",
> +				 engine->name);
>  		}
>  	}
>  }
> -- 
> 2.45.2
> 
