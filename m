Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE228D25B0
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 22:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7018910F6BF;
	Tue, 28 May 2024 20:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNZf4Vzv";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D5710F55D;
 Tue, 28 May 2024 20:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716927679; x=1748463679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=880SHQuG+LrwY+9ROxSs/kbJTweosl1+C7k9+J+jXV4=;
 b=QNZf4VzvsyHLDqghvG2m5KWo/2dNhJQJhFrEwGUEsV3zGJ4AA/YqjLib
 626DnovPnKCThN2gYQ26zqwx7TMM79amMPkwoFU2JKccnIMnlLcYOuTM9
 rSq6sIyE+AqznZfhLZYJZwbI4lWwzo9uwGdVltr3dG7qT3lddCgk0jUvG
 hPMfbbfkuuhaThd2Y5Q/fytikugBBkN3AR5e0T+ABNMVq9jzOVhqet1Qp
 bj88ro/gUC9qEz0mO4Iwi2PH73gIoRKFdCOeIGCljSdpAGd7vspNuRF9a
 7sI5QLzhTPyeNST8ftT3kVolUPWA5WhCDKSTX51fNrWfeKu67HNJtfPp4 Q==;
X-CSE-ConnectionGUID: CYGRW3hvTZmxqUe4vQOkoA==
X-CSE-MsgGUID: jKHMhUFCRrWZTncm7+ZfTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11736698"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="11736698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 13:21:18 -0700
X-CSE-ConnectionGUID: EwQxT/M4RamY1JdBsSZJWg==
X-CSE-MsgGUID: 1OI618lYSDyQvdRPpuKW4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35133319"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 13:21:18 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 13:21:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 13:21:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 13:21:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 13:21:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MseKMT0nzDk/ckkzlWef9XAZsVz+U88o7jhiGc+rgq2jWoIyTVI+8etF2Pac1oQuKDJcB6sfAI/ZoezzTOmso1tze5F+FgDSsoH0b6yJ1iwD9VJIJ4PSXsnM6o0XP2C6PHZQX11V3XF/AeOPqeYzKr1sQKhtz2FwjhDm5rzC/QJ4Azppp7mLXD1WOd4vug9qfe0ITFbRhQrZqN6JWlc2VIUbDVey1gBVxhk9tV8jHaJex8igTit7CICjGriKjn2SomB0YdTKOciD0Lbe2ykxB/99/GEf7OmtUOwTWwIfuRycY+t35Ol6kIAwWmRDSJ8jeh9AlUMVbNdSAn6DPsx1Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAOtoayLWTvXsotvwjdtuAzxQ3+UpwXSJwi4wzqQSyY=;
 b=OmPEDb4Gt0dpkuRNW5cQGnPfoU9pl8HltFNKkBMwMONQ5EcFTS1Eu3edFaWJTyd+EtD++Ls3I1Zk0vc660w6HIEB5VNRLjF8WEgHK1+sYf4wC75brTXZOSJe8JnYX14Lld/SWanxQZm5vLiiWj3UOdYmCFkn8pzLI5yjr3ppcr/BiJyw+EWML1MGLej/X4G8l0bNUnI32UUrYLmUMeaFONWO7p/oWP4kSeNu3vTTEo6VsB7zDVJkDLrP61GoNA0DyYyzNw6nsQqGIWIetdV7gItHPikJ9kICZeqFW63jnjYJofscqNY10pvp/4Knih4LYhtIBSceoaRfSAQcUrhGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 20:21:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 20:21:12 +0000
Date: Tue, 28 May 2024 13:21:10 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/guc: Enable w/a 14019882105 for DG2 and MTL
Message-ID: <20240528202110.GE4990@mdroper-desk1.amr.corp.intel.com>
References: <20240525014121.4157254-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240525014121.4157254-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BY3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:254::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 4077e448-5ca2-4b19-5372-08dc7f53b7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gbgB6pyE+44R3WV7iw0yiEmIlzNJ/cEKLlqIXaUJIcvav0BskjRLLaav3Urs?=
 =?us-ascii?Q?oaWiqh2aGQu3apLM62jA7Euvo7FYMkJFfvf4C9NYHht1rR/oie7SQmzg7nHc?=
 =?us-ascii?Q?rW6Qht+5Uh5JW/SafFFuBowB37ohrn7SJDj83JXj4JGPf1wkX9MR7e1ddnJ/?=
 =?us-ascii?Q?+ZeMBFQYYqWZ9KmEEgmEMIvnXVrcc8zMLbRjfkSU+DxbsHFBWVtITyV2yk/D?=
 =?us-ascii?Q?u/FlMvH/fHjqyk3G2cxj8a6VTerOcBXac04LMQ44W6IhpdDh1uyJs6xRRUK0?=
 =?us-ascii?Q?VS2EkcoyVwm/xgJwe+cJqApVlmNlnFLja2Z3jMQ/bJ3FiAhZ22H4LpCNtw28?=
 =?us-ascii?Q?A/ieRMa5Wd++WFO1RaUA+QibcJBbg8cmA3NpnYiUv5lCe5JeCzL6UzVxmhmm?=
 =?us-ascii?Q?fHs915gfi1GKFkUld2fJBmt+RADtnfkzEIQ2JmFpaiEqbd54VjfAHtv/KVn+?=
 =?us-ascii?Q?kavPl3mAsjQKJRxAiWS41VCzRC7voOgmDOTohVTExkM4DLIPS09CmE9xFx7X?=
 =?us-ascii?Q?UeeRGQjD1Pi+yETdijdf8oVbuf1otb0fwWfaFT6y4iwvBoKhjTULA7uf4FLH?=
 =?us-ascii?Q?VEDCq8SLIXOtlodty6Hp1DmyrupjFeZjA+J3YngKBHU0OUOCNIxjkYD6UmLR?=
 =?us-ascii?Q?NQ+RbteOYhMaoFalrCAGaJgzvJx9pkaT4HF8Hvic1qE/pOVeH3h6e80Xzber?=
 =?us-ascii?Q?WLLLUQ8H9tGNz+gKoxj2+SWostLRcFCUs1focaGgq4zXGTe9TmaMfObhB15r?=
 =?us-ascii?Q?ODw0CZ5AJkE1CdBJYefM4ji2BFaciRCHqkN4EabQ3BTqix/0WTN75C5HnY8z?=
 =?us-ascii?Q?9Z7vIaLdypse+7WEjaF3dDi4wtYKXL7F6dq5YlIKC2oBEQwNwqO9UaLv/qWX?=
 =?us-ascii?Q?KgJ5ayMvqu33MdmjL2I7e7qDWTdRmLc2SspL5SUB7qaof4S7SCoCFj3zk/yn?=
 =?us-ascii?Q?7SKlOVyz0tZUVwW98p7FztYeA1m3E/4TnTP3gUDlDcey3SvQFy5QnC9v7rE9?=
 =?us-ascii?Q?RuPED1oKMR/YZ6Qw9MGf5ONwckh/2hivItuA2LxIDyLrm3krgBpt1oZqD7MZ?=
 =?us-ascii?Q?CFMhPbtp6kvXk5WpGavIzNkr6IRrbCA70osFulAWd0KuyxErEjGXR2EgK+pb?=
 =?us-ascii?Q?xlMjDIJuLvKVaCcl027j+ne9maEsxBCalWdrtgttOEGOkLl8r/bgbthlHa3l?=
 =?us-ascii?Q?EwY/3HPeFyDesoBXzj1bhJYpvvLCiNXh/b7RhEDEWbSO6n6fsiw0Cc11xyhz?=
 =?us-ascii?Q?wfRM3qmXviVtTfaTkLxgwe7qEenL8vGU7JxEVzJwKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PHHj02xIkL/Jj/6k0UEoXatll4uONx2Jyx7fLauKqth9uZGO6EXd+TP5gQH8?=
 =?us-ascii?Q?e9rWrzvppXDxs6Z6G8TWYkxBBxR4w7Xa3P+yXienQ1BWySPVRh4fWYYQ0swp?=
 =?us-ascii?Q?onvElNdWl3RsP/pkXndUbnkW4jboc7G37ea5OquwQ2k/8ppyUcMverFGvRL1?=
 =?us-ascii?Q?0M7nXU0mhqlvQLb/li9JX2u6WK+VtkdMWUJQI1yYSGNpZEY6X1N5ZggYk/7J?=
 =?us-ascii?Q?D8PbLW7xv5sxTQka/Z8jV4tQiYD1YAH1pO9xzkgtZL577fYw+7uGzA+Y0zr+?=
 =?us-ascii?Q?H7xhKxmVpzlle3VQHAgvaLr6NCAyiIq1gIcQQXNN5dfhuL4/erN0fLF80VqH?=
 =?us-ascii?Q?8w2KAyoJHiLzy06XwOMgRM3td4jjl9UZKG7NODvoYJnOHTpZfl1CiVGsDAfn?=
 =?us-ascii?Q?8PbTv5/lucoSz6UzWUBwMhUq3yAdrzG5i8qxdniftHtdVhpn5WR67m5rhetm?=
 =?us-ascii?Q?bOJ7IZWbYQJ1HcVT+ZKC85nla4AGlYRcT6dPHHo2XTDCN27bJLfndkfqMoEv?=
 =?us-ascii?Q?9UwJctOCv6aR5SwrPf5IO0+iWTDna68ZcoAIzvFOsIsOdxJVM6obbdpIZyvC?=
 =?us-ascii?Q?suj+IvPbpzvkjoedzZBoJZ8H82MeWEsImzsOhYfq2950r1gsLQV9wSTvvgGP?=
 =?us-ascii?Q?KSJy1FgdI1jBgW9eUcRn6eEsmsaeA17iv6xOT9O3LaWCvgfHSYZIHMjxYhOX?=
 =?us-ascii?Q?/s5N6oC8jU0MgEX7ez/5XpSOwhAPsaHu6Biaz5COnZ5bfC1c4n+23fbGqB53?=
 =?us-ascii?Q?pR/eCxPfdERnVIjYKpvnbk10uoZxZp610qUK2wBAx7aLg0Ge8L0UHxbKMOMK?=
 =?us-ascii?Q?tdHfMeYKMx17+2NIpYoY1X1bBVdAgA0Cmli4hXTrRk/fCRIqxAVXCGPBgomn?=
 =?us-ascii?Q?iaAf+t6eHtuRjCVKRA8QLd941lNdxFXNL5O0ayMu+d6eVX+rRCLttXmnnV6U?=
 =?us-ascii?Q?c9LxZuB+YG0ufKqMkkoDeUgZilx6R7UECC57/gdfdHDSdtDXl2/e2zVeL4JF?=
 =?us-ascii?Q?w7vAeYpnKBQU49tq9mzwMdqtIZ0UXRZc7qCmTkoeyPo76a246FpOUhFprnTW?=
 =?us-ascii?Q?CJPFwteRTKcWqKRBv0fN7zxXlZn5V6mxr1cOJkub4Eb7AfVsXoFLwJ8pn35X?=
 =?us-ascii?Q?6f6NI9+JxfTg5W1MBkzcsFuLdjBQcH+Be1zGxkgFpHQl7X1geYPvt7RImyq/?=
 =?us-ascii?Q?MWuz50vvV0yiAY7xDabbwBXsyafik2bBBZkiZfvjMKImYDT1MA0G78UfWLkj?=
 =?us-ascii?Q?ShGpJYY0eHtf2pEImhwAe2KGPQwmMfmEQLKzc4Lwc1T997Mx6vJXy+W9L6wa?=
 =?us-ascii?Q?nUXfJTrj8soOZHG5cr/L/3H2jQ8Nf33nAgA3hqURQYwDq63arNsUFk7tRgqd?=
 =?us-ascii?Q?y2Zu8CEqSxNqkOSyXyb0TD0NV6JrRGheGwBxU9ZNyT69QXqysksOc93bwzvg?=
 =?us-ascii?Q?6gn2bcEPsO0b66jc1X+RB5PafMyGB/tGzbcVy77DgmHnfB90yJXLcr6qjTgy?=
 =?us-ascii?Q?Ord9juaNNK1fTWN3d0ZyidZxFvvHGXN0WmOZ4bQZQCym8G+4uC+5DRcorG8w?=
 =?us-ascii?Q?awpO6cNlbkVlq9CqJAAW6fZ2KCK38EuadeuJqtBOVk2criguPeXTR4WvT4LG?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4077e448-5ca2-4b19-5372-08dc7f53b7bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 20:21:12.3198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPT2kXnKyFUXn27ewR6rpOZXFmbjQ62ujcypDZNe5HEEET/2+i5M2wrI1iB2KAdvh+u7UgpiwsAMk3cjfYd4mLQ6Zw4ULumZgE8c6mPd7kI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5819
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

On Fri, May 24, 2024 at 06:41:20PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Enable another workaround that is implemented inside the GuC.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  1 +
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 32 ++++++++++++-------
>  2 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> index 525587cfe1af9..37ff539a6963d 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h
> @@ -106,6 +106,7 @@ enum {
>   */
>  enum {
>  	GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE				= 0x9001,
> +	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED		= 0x9002,
>  };
>  
>  #endif /* _ABI_GUC_KLVS_ABI_H */
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> index c606bb5e3b7b0..6c382785bc60b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
> @@ -815,23 +815,23 @@ guc_capture_prep_lists(struct intel_guc *guc)
>  	return PAGE_ALIGN(total_size);
>  }
>  
> -/* Wa_14019159160 */
> -static u32 guc_waklv_ra_mode(struct intel_guc *guc, u32 offset, u32 remain)
> +static void guc_waklv_enable_simple(struct intel_guc *guc,
> +				    u32 klv_id, u32 *offset, u32 *remain)
>  {
>  	u32 size;
>  	u32 klv_entry[] = {
>  		/* 16:16 key/length */
> -		FIELD_PREP(GUC_KLV_0_KEY, GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE) |
> +		FIELD_PREP(GUC_KLV_0_KEY, klv_id) |
>  		FIELD_PREP(GUC_KLV_0_LEN, 0),
>  		/* 0 dwords data */
>  	};
>  
>  	size = sizeof(klv_entry);
> -	GEM_BUG_ON(remain < size);
> +	GEM_BUG_ON(*remain < size);
>  
> -	iosys_map_memcpy_to(&guc->ads_map, offset, klv_entry, size);
> -
> -	return size;
> +	iosys_map_memcpy_to(&guc->ads_map, *offset, klv_entry, size);
> +	*offset += size;
> +	*remain -= size;
>  }
>  
>  static void guc_waklv_init(struct intel_guc *guc)
> @@ -850,11 +850,19 @@ static void guc_waklv_init(struct intel_guc *guc)
>  	remain = guc_ads_waklv_size(guc);
>  
>  	/* Wa_14019159160 */
> -	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
> -		size = guc_waklv_ra_mode(guc, offset, remain);
> -		offset += size;
> -		remain -= size;
> -	}
> +	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
> +		guc_waklv_enable_simple(guc,
> +					GUC_WORKAROUND_KLV_SERIALIZED_RA_MODE,
> +					&offset, &remain);
> +
> +	/* Wa_14019882105 */

Is this the right number?  When I look up Wa_14019882105 in the
workaround database, it only lists it as being relevant to A steppings
of G:20.04.  I don't see entries for 12.70/12.71.  Did it go by a
different lineage number on the older platforms?

Also, I notice the Wa_14019159160 we had just above this workaround is
missing handling for graphics version 12.74.


Matt

> +	if ((GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 21, 1)) &&
> +	    (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)) ||
> +	     IS_MEDIA_GT_IP_RANGE(gt, IP_VER(13, 0), IP_VER(13, 0)) ||
> +	     IS_DG2(gt->i915)))
> +		guc_waklv_enable_simple(guc,
> +					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> +					&offset, &remain);
>  
>  	size = guc_ads_waklv_size(guc) - remain;
>  	if (!size)
> -- 
> 2.43.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
