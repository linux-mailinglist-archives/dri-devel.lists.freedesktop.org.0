Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBBA85ACBD
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 21:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3428810E127;
	Mon, 19 Feb 2024 20:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTLePPfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954C210E0FA;
 Mon, 19 Feb 2024 20:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708372986; x=1739908986;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9yCBWrvfCqjKPI3J9gaPIfNCv2QbxY8lAnm6svBOTJA=;
 b=WTLePPfHHzvEvKAc2dNHzDd4ldS7WZBNJdaBJuTdIeF6kuBhRbLDs0hd
 6UrEYimgQTi+hUXetcsTofaa/bz1OqfomL45zcwSVPn9STtj0th88idoJ
 gNm35lKo+J94JfX0LGnh5Ygq23ClQzouxXApKckQjodlvvAa2UByfG1Ag
 xYrAapbeDd/ocg/q9RXcuuvf2ay6A92H1sbe+5eAzKmp33xEDIHpg10QH
 E65sFAsJRykcDnYMthb7Omfj2x6kD90SmgwMutYS/Tc+GVnMe6CiAROwd
 rh4WaeOPNP/1gQxELQrkiLdh0tcxOc+lfKNy78aj8Lk4R9xI01HsWlvPk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2330404"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2330404"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 12:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="27745528"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 12:03:05 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 12:03:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 12:03:04 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 12:03:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKmYmzzxUs/r+jZ9YoEmVeNewugMdQStTagEr+gEOat2h3Gv0eq9NpV/5JD3+HUJ7zDkK/bOWmI2s5nlGklxoQv5CMS5+9eRhX0mrHWkdC/WT2Ts5hBqZ0u3/9uEpRiBMwgatiLlC+bBL8KSh29BveTV5tIVCBQguVqShEBmtOkegTjLB+gqBmCS80T1ZyHWVQ7tsIN6gTOIXw0nI+CSkR3C2lELgkjbn2Hj51it+D2wOiX89Vdgwi2W63krHKOjI7O5wkJHYuUL9X8unlWp/K3JccUyG+4LfDwqC0qX0Xmtx8cCITVWSx+GxwUvp447wuwCyvhruz2kGzZ2f5EgBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3CsuNvd/vVMuTtHiXp5Fqc/mTUP4HdQY3V2pvhGrj0=;
 b=C6zyReXmkpEGOj7FKJEbeKvOok9rEBNxjCAyhGtIs6QNS+0aMY3cujJWuCvdXnaHYXk2PbpUuZLOqzdcC7EFoOEsVraDqLChB/aedrQBvRfH5vCZ0ZV//XsPBp3iO50o36s4bzvxU9KTUfasxh3sF40Y8O+k/pyJ2oVWFseYL+Kruog4S3Mwun5qtOhV2tJ/xHaMJgulgvH2zpe6DSK8jH7rTaCMJ8n2hJJR1408eXbhCaGnDeS2hFHrnU6OJpU/V9z6k5pMnB3UeRNfMg8jD5zHDS/gRgxc/Q9rZzvEBlSakCWGXsrsL7958T405wzZlx/IHfBwAMI/b+MfR7gilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 20:03:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 20:03:00 +0000
Date: Mon, 19 Feb 2024 15:02:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
CC: <Intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Jani Nikula <jani.nikula@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, Maxime Ripard <mripard@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Fix possible null pointer dereference after
 drm_dbg_printer conversion
Message-ID: <ZdOz78jQu-GvJuDJ@intel.com>
References: <20240219131423.1854991-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240219131423.1854991-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:74::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d06b2ba-fa9d-44c4-b527-08dc3185c5d9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jxqh8SycgzRjn08aHvTIMETpW43I/37W80gKbrCuxqvksvjzDSeXr1LAlpehB0lbf4b5po7UWbgCotYfwxNp39WsV1rb5LoYL8+aHG1bARlmVFc5flCxSJAtVIlO4+WFvoXrVC5JsWd9bseQwnT2ZO6g7x0mbbZsw8SQt5NFnrQb5boOB6/vBvwmHCAEnHXGz9rf4rwDwFFqwEqsnYCKQeNmh3E4Yu9K03dviiVxrbpYPomrCAx/7G8SKLvAs3MLFLDDWKhqawUFUofk1v03Ob5esauZhglRpEcnMVHuNs5jQ/AXaPDfJMp8KdgckhSk8scrs31VJlKU9FWYtcs7enYzvfPWxG4qKI860Btp3p5t0RVPA1UvRVRN0AcYJOAfAq659l+UqeaGrmz9Q187Mrt1ImEYlndpObh5UrXBuEcKZ46i7UZ0L61dYvtxS78QVccw9GF5WOEnvUiXUKudE+abYKFF7sGwHnD2l+TXK4/MAgNRRr5FYgEbml5ScJp5ZJWd4y8rjd+2e3O0DRO3BQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j1XsZb1dqQGZYnj5iBzMCjPR4vp7ol9vJ2Rur8dU8n8j3JGli+mnJE18GcYT?=
 =?us-ascii?Q?YR7AQfb2tXKwBoCt+fO7swWdPVPgYcmy7h3ay5ae0QWlKirzn9pVfwiKrfa8?=
 =?us-ascii?Q?DGQgBBSQYNBOX/xkXo5JKng05LDAIHbYdO+sjl5gQm9PTC0rkjqJBMZfkhGr?=
 =?us-ascii?Q?v+GMzZNpI9G5csX00smbVsPhzMxWARyPJRb/5LTck0LQY10oTFCPZmKpA3N4?=
 =?us-ascii?Q?+3mIUYLZZntv7P7IcwlVWtfhT1WdbBB/oXntLlZLyrb/iqAdUYLcTZT+SROG?=
 =?us-ascii?Q?UsJjgIUG5EwuynmwE3Ovx8MxnLTIivS2bZmd7I8PetaMO6ohkYZnfWCcXZcR?=
 =?us-ascii?Q?0SDFzFDY/Mb02t2R/HOgtfkCXSqnGE4LeToXzrybmhe7gbP9aT90daoWqAuo?=
 =?us-ascii?Q?kvFXJPrZSOMvNl7iFuMvCitdwx09X3cvPL6VyMyiu/VCCwBF25qOLTHBK2vA?=
 =?us-ascii?Q?eAYoKzrZdPa9e4XqwKf7cwwcFGxRXA8kwTg0oowXCT4r4elOTmiX4WVo4ySZ?=
 =?us-ascii?Q?yyHOiKRucFcQmCiYMVa8JZHcZUmZHAY9HeRjs09SpAUnLQ0n7g2LTfxdaeR5?=
 =?us-ascii?Q?4t/lhXTD+VSoaL7uCzUgQhV/fft/4g2Ay6eq2VYCpnjwCIy6ZqfIVTI0TxSK?=
 =?us-ascii?Q?EFNirlkBVpxV3UdVSmigG1rLHKlUT+fZ/K3pMsq65DvHOCN76rQXE4NdEd6z?=
 =?us-ascii?Q?JlUNJKg/xEUSM1izG5vQj4MVfD5aT+YC9ahD1FkCqgDWEcuIjN5705qhgVmX?=
 =?us-ascii?Q?rm3c63+j9BBjxEx0/D6bdh8QRzKXHLaa3mSqTNVtO2+0g9/GU0W64lcgr0Nt?=
 =?us-ascii?Q?xuenyFSZfHAzhA3fqWBVuL2xPiv9KU1Z/1pvV5JJ3xdmpkIoVNEv1sLN7E2a?=
 =?us-ascii?Q?X/nEYyNSdWZb+zvgPplMD95aAPJ0/tN6gPxPdwFi1gH0aa3IG/37N2l/FIJr?=
 =?us-ascii?Q?ErwMne1VwdJ2UNV/ADlLDEjotvezrqwFcWR4WL1BIhsCkTTM/574ufUhuI5P?=
 =?us-ascii?Q?/qyPmPhjbOs8vUMjEpwtqs1Gc4WKal/Pv0Y2UjejzgZMUyoWl6pwEaUWlbY0?=
 =?us-ascii?Q?l3wBUGUQOTUdw3iCGXC6KvDKZ8itEYobg18G92CoPiQReppO8hkUi827Z68y?=
 =?us-ascii?Q?x26GLNLDiLj0iJL2fp6gynScFpvBaRBqMUWUNUn1BXMkBXTodU2ac6akaKJp?=
 =?us-ascii?Q?TamWMv4iQjFseAudbGpxci7HsAAot50/hCGsP5C7EcCesBGQYq7GlDTkIAb9?=
 =?us-ascii?Q?TgApAdKyKWSDTTKaNzib01HOTT6UmTqkn639iYxxIK2ugl/wJpqpboejUBYS?=
 =?us-ascii?Q?5w/bgBn7rjr+uHJAT+GWDROMcHyqZ4OZz/zQJzKmtsEw5tGbkv8Rj78M6sOF?=
 =?us-ascii?Q?dH8t1wYb8iCku+kL1OUZ7u4XO4Ok3t0sAqO0NMKHmJVSRrouPLosNxM4qCUJ?=
 =?us-ascii?Q?I2DNYpi8VGDD1pAvbyhK98gkYe/NmCP7c+Kit6E7p33DEey3R6D5EUNUWNcw?=
 =?us-ascii?Q?krhRjfDl3NrLx6uxWwlflM0+g+bwCmoeq4H/qkQCj5UsY6aDCWTFTeq3X7Zf?=
 =?us-ascii?Q?tjpcnxIOWPURRXIQ89hgeqvOUyCVrpoahllo81gZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d06b2ba-fa9d-44c4-b527-08dc3185c5d9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 20:03:00.2034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMzBANqvK6iHRs7D9UczQYp8j1B/OdPEVZOppjv3mVUSZg6yVX8jlbHdpkgUxJu7YPXVySM4WrGI0ydfyUzNUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
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

On Mon, Feb 19, 2024 at 01:14:23PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Request can be NULL if no guilty request was identified so simply use
> engine->i915 instead.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: d50892a9554c ("drm/i915: switch from drm_debug_printer() to device specific drm_dbg_printer()")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Luca Coelho <luciano.coelho@intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index 5f8d86e25993..8d4bb95f8424 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -96,8 +96,8 @@ static void heartbeat_commit(struct i915_request *rq,
>  static void show_heartbeat(const struct i915_request *rq,
>  			   struct intel_engine_cs *engine)
>  {
> -	struct drm_printer p = drm_dbg_printer(&rq->i915->drm, DRM_UT_DRIVER,
> -					       "heartbeat");
> +	struct drm_printer p =
> +		drm_dbg_printer(&engine->i915->drm, DRM_UT_DRIVER, "heartbeat");
>  
>  	if (!rq) {
>  		intel_engine_dump(engine, &p,
> -- 
> 2.40.1
> 
