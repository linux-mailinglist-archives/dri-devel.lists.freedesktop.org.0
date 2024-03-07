Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830387450F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 01:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22542113600;
	Thu,  7 Mar 2024 00:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESlKfRmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EC710EDD3;
 Thu,  7 Mar 2024 00:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770501; x=1741306501;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LlgIU8nWgVp/eLWIHnOLWNcEVO2gwBplyWHx9yKgLSo=;
 b=ESlKfRmIzfIheVRDs6fWa6G8FgNzuyK1948GnlQfNUfd2UUpvDEIdLzg
 r9WzGbJEMAug9IAWha0OanpAhGrJFF5oe/W7UB8hos3+7bXfLbpmrE26/
 r8kQ9lkvH+Nr3hRXxY6ubuXWN59QA+ChH2deeAZ0TH25/obu2TLKFC2Lg
 wLe76LhZfSRahxUou6IXcXfTfqHgHh1MkDOvkNkyx5mzlh246OS2go55Y
 PSpnJCIBhWwcDiKcoek4mosHnb5INKYB9aRwVA1I35zuKs9o0xPiIgTkt
 8DrQ9bPKzD4Qk81zTJi2UA8CVbsGX0ajtSGtab91H6+vimAHcUXctJh3u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8240782"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8240782"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:15:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9814314"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:15:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:14:59 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:14:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:14:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2FmM1QeEXnmY9mAu0eadodmFf3RMRCgTypUuLZco5G/gJ0sFf+wZm0ItUBZfH5ssYL/t1+aamEgrKwyT4KSqv4IXSuLxdRRnpbzXVfbGF50vTs3VA1wnjJMD/vVKrdkTn1g8d/Jzal96SECF/lPF8zqkPtXR4sirbsfGPgwGxGdHBSQ7pPfU44dgqqIRZluLzdbas/jnJ/+f2rKXXJ1rLc4al9dWdfdMUem9oVegsH1IEmkkO96y2P2eRIUiMy65VC6o0cAYaOIet6OMVzR7K3NXjerPMZY7pRKvI91IBDRBxSQNvnMEWUXz+EFRkyBbO+/DmEdwc25c4Hh5Y+j4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0TQlX+3XttVSrShoJXh5iAue/gMhdijm6dwCVQkgao=;
 b=mKPQ13obxo3HZMbAtUdZpAiLng5AokAr+LdGs9Eg9TkAFAY/nBtUC67E409YCcVefXn6ntXiFF8tb9k2E7FcPqkkcHN4hCvneyohEs6wDXGH1mN3au3Lm7GY3Y6DYh5hjZCEktwPThuALJj9Zc+byaqZBPHc0b1I4B1IwACrhZ2K8jlpVfyvF3X8ZFq9ZnNuvUIzRZL2WxIwwXRxhQShVpGDIz5gr/LumnlF9cu0qRQPQH2fSylCDC8eYK8jc7SLkR0UAvQs0X/wBBHLSTP9zFFAntnMVFDg1nK9ihOcUBSqodDI5pL0KriM1uxFlY43Q7ZrmxOEbMfsA2Ge9NaIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Thu, 7 Mar
 2024 00:14:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:14:57 +0000
Date: Wed, 6 Mar 2024 16:14:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>, 
 <stable@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v4 3/3] drm/i915/gt: Enable only one CCS for compute
 workload
Message-ID: <20240307001454.GG718896@mdroper-desk1.amr.corp.intel.com>
References: <20240306012247.246003-1-andi.shyti@linux.intel.com>
 <20240306012247.246003-4-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240306012247.246003-4-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0020.prod.exchangelabs.com (2603:10b6:a02:80::33)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: b3425190-c90f-4efb-cd2a-08dc3e3b9ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nZeM025fHmzo+g3K2ULsW+l3q6EbxA+jR7DdzF/tTDdI2ESnVI/TEaWzaO8S4szBi4lSNrFAsdTD3D7TGzxRmdG7fgVPbGrBSzmnsKLn9O98VZM5W4NCOYIJvAug9hfqHOcUbnBv6350WKzqXW6/E+dXWX+V0EW1ZOiLTuDKejOgiu4X82Vn7G45J6N1KpBt8xOGny+dzzZet3DyugC2XMrpJtOOmnfHWePPAn2d7hWMfrtWSshzNRAoUs8xfkuP0sdOmz+cH+IKxtJx7y8euJ4PdVwP/e8CulkV/2FS0sSfJJcasWqJx+0/KHLovxdl2GzTaNYG2STa7mv0Z9MijwsgDjYvbh46S1Yngmzi4doDdpRSJps0rBOP01ExpanqEbO+zR6HgsplspryBfIyTWtk5pzqCk6LzObqdA4TtMXzwj+w3xm9RTTWkrpaDS2Im0ftdP5rZpOHomTMlqwlROJAOtIWdjDKUbV699g2RVh2r2KfNVIAhhPKYLnH7kaVtgNKiyCjRwl+l7qT2YzJh5FaS8qvYpCca00EdrmOdBHWlEu8Lc9bizMcdyxDXJ+jheJHfs+ViJNcB3M6h6QA9N7qKZ7fu8XMUGvcVbGCk4DBjSsLG4FGzmeu9d5+tVA5gRE5t5xrs0txHqAzoDpUsl8kWCWLpsGUTCenh4mj070=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rRT6dlbAOOt7ks9hdM9E5nN9iyxRijmn9Coge3TXduil12mAWRKVpYKdc8h2?=
 =?us-ascii?Q?H+NyX+V1PbE/gCcRn11ZRS5rWsZHsnfyjW81uBzbqwtg8MHHvo0I1A9i3ZmO?=
 =?us-ascii?Q?84x1uZguQ2LqfaS5rWYv7jKXamzw4wnirnUr8gKzHDnO0OGo+ya8YZoL0pFd?=
 =?us-ascii?Q?L3SdyI+py62NBdHLL5HRcLbb4As6Pe7m8MIeAtX2eK55oRWAoEGtCit/n8/G?=
 =?us-ascii?Q?0E0v5ZXnpNuOVnV4VCWqsFARtOaTdwzG89FMZ2JyA7kJYY8VvJaWXZesf9OY?=
 =?us-ascii?Q?og2aUZKBgRp6kbRyxlBx43OzuadOUmxpxn9k6fMltnMBX3mWs+DjBiGVozo8?=
 =?us-ascii?Q?ugYWiPxuCDhScWDcDZmZP7jlDx0xNaEdkDc54pjxQGEqOHNy9kNc9y2phHhw?=
 =?us-ascii?Q?13jWmIrkzhMKsXoitm2gP0T16TpFuvHE39Hp6EhOSr6Jj+cDxHezHvdf8Sbz?=
 =?us-ascii?Q?UOjHx3xG57DfGFUUDq7WAZQtdaxevx6Trb6OaEaj88JeQVBSq7AVys2cGHFC?=
 =?us-ascii?Q?1ZB4biMJMkpCRPT9YcDAj698WgDq8OueoAnVxNGnbKYjFd8myhqv28YTU0od?=
 =?us-ascii?Q?i+S7SLENlFrYpRlBjqbggAjX1/H/eE/uoFOsau/GWYsIBIuTJdxMh81MdX+G?=
 =?us-ascii?Q?Qx2ucpsG8mSHZyN5+CoLAQ9ih9/orLvOYR18BjB5IF5k9rBrUNm2Y+/hjADe?=
 =?us-ascii?Q?jDYQvdo7uX45vILieVnKmlNO5Wr4wcRnzpBCS9+GiC0F3lfJfXMTEU9UzHAM?=
 =?us-ascii?Q?+CR/qHDCO+uhXao4mHgoNQMWD68xHVQ7FHew3Aanw8dKMLEYej7V1zr3iFsP?=
 =?us-ascii?Q?fu+G2mHBtBxrQ3CWr3Dwk+zReHlfDal17a8B1s2O56YDW5ZpSSgCkeFvzhuy?=
 =?us-ascii?Q?TM2DI68eeS81lz6KCfNrPSTnTA9J5I/Q0aNTOvnWUU94vwl2y62GfyERrRBU?=
 =?us-ascii?Q?shecHfRyi7Ken/MKkxH6vAYSX8nVvN9hPA8jabZrC18ONIR1oN3LzOUWham4?=
 =?us-ascii?Q?K4QmUYxjOkqi4fmPh/n7Z1w2nV3X5gPy9zwovCpCKQRfbN9cEUEao06D9ce2?=
 =?us-ascii?Q?lqdjJREMUGzY0y+E8InSTxqghGb6RL/BZf0dA+9vPgxRlBCNeuC+sRlwg2ja?=
 =?us-ascii?Q?Ox/KqMIuDqNlJy5pGXutGwiw9WiBCSClhg6sSCUqv0xyPm+M2/LF8OB+Ntr3?=
 =?us-ascii?Q?nghPvLy/IB8w9FFXymdxZPikfMxPVUN3TLCurcsuRp0/05mtRZotJs14rFIT?=
 =?us-ascii?Q?sfZeMU+mF7uyg88U65SbVHDReHr0JGlovsGGClDky9QbpnF3UbP9II3tmUDJ?=
 =?us-ascii?Q?+9zSnolIk3A+0IEz5L9HahVzhgGsBPLZSxDrT0iw2XeQgrUsBkazzQ7XfpKv?=
 =?us-ascii?Q?LddXqI8MbIl7MOzohb7F+qcxEfUoGwpjurxk55N6PXBiadkRlOEWt1s/oYie?=
 =?us-ascii?Q?LxiXhayf2xLd050kKxU7eh/6tTEUQPbBqeEm36cLAYS6kJkFkWYfKpJkA79E?=
 =?us-ascii?Q?IDQ1FCHqJn4Lc52YAIsBJxdfa7iavjA04StDY5nH7dRg4VXNJ+js9PVKXQ3h?=
 =?us-ascii?Q?EivWKuwXdZ1sKV9SQCVZDgv9Vup7Bf1CinLhV17E0VloHpmhJs6q2GNihNBN?=
 =?us-ascii?Q?9A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3425190-c90f-4efb-cd2a-08dc3e3b9ee1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:14:57.0510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYPv9R9r/pnPiLliWbBf8CpZA5WxAK1HlBQZuAtEBhjeanoKxKHcbGkYnaiV6HRhsDlHETPQJmdaCr+8UpWnz5OlpkbiwDnSAOIkSHbXia4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
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

On Wed, Mar 06, 2024 at 02:22:47AM +0100, Andi Shyti wrote:
> Enable only one CCS engine by default with all the compute sices
> allocated to it.
> 
> While generating the list of UABI engines to be exposed to the
> user, exclude any additional CCS engines beyond the first
> instance.
> 
> This change can be tested with igt i915_query.
> 
> Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
> Requires: 97aba5e46038 ("drm/i915/gt: Refactor uabi engine class/instance list creation")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>  drivers/gpu/drm/i915/gt/intel_engine_user.c | 11 ++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt.c          | 23 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  5 +++++
>  3 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 11cc06c0c785..9ef1c4ce252d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -208,6 +208,7 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>  	struct list_head *it, *next;
>  	struct rb_node **p, *prev;
>  	LIST_HEAD(engines);
> +	u16 uabi_ccs = 0;
>  
>  	sort_engines(i915, &engines);
>  
> @@ -244,6 +245,16 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
>  		if (uabi_class > I915_LAST_UABI_ENGINE_CLASS)
>  			continue;
>  
> +		/*
> +		 * The load is balanced among all the available compute
> +		 * slices. Expose only the first instance of the compute
> +		 * engine.
> +		 */
> +		if (IS_DG2(i915) &&
> +		    uabi_class == I915_ENGINE_CLASS_COMPUTE &&
> +		    uabi_ccs++)
> +			continue;
> +
>  		GEM_BUG_ON(uabi_class >=
>  			   ARRAY_SIZE(i915->engine_uabi_class_count));
>  		i915->engine_uabi_class_count[uabi_class]++;
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index a425db5ed3a2..0aac97439552 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -168,6 +168,26 @@ static void init_unused_rings(struct intel_gt *gt)
>  	}
>  }
>  
> +static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
> +{
> +	u32 mode;
> +	int cslice;
> +
> +	if (!IS_DG2(gt->i915))
> +		return;
> +
> +	/* Set '0' as a default CCS id to all the cslices */
> +	mode = 0;
> +
> +	for (cslice = 0; cslice < hweight32(CCS_MASK(gt)); cslice++)
> +		/* Write 0x7 if no CCS context dispatches to this cslice */
> +		if (!(CCS_MASK(gt) & BIT(cslice)))
> +			mode |= XEHP_CCS_MODE_CSLICE(cslice,
> +						     XEHP_CCS_MODE_CSLICE_MASK);
> +
> +	intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);

This is still going to hook all available cslices up to hardware engine
ccs0.  But what you actually want is to hook them all up to what
userspace sees as CCS0 (i.e., the first CCS engine that wasn't fused
off).  Hardware's engine numbering and userspace's numbering aren't the
same.

Also, if you have a part that only has hardware ccs1/cslice1 for
example, you're not going to set cslices 2 & 3 to 0x7 properly.

So probably what you want is something like this (untested):

static void intel_gt_apply_ccs_mode(struct intel_gt *gt)
{
        u32 mode = 0;
        int first_ccs = __ffs(CCS_MASK(gt));

        /*
         * Re-assign every present cslice to the first available CCS
         * engine; mark unavailable cslices as unused.
         */
        for (int cslice = 0; cslice < 4; cslice++) {
                if (CCS_MASK(gt) & BIT(cslice))
                        mode |= XEHP_CCS_MODE_CSLICE(cslice, first_ccs);
                else
                        mode |= XEHP_CCS_MODE_CSLICE(cslice,
                                                     XEHP_CCS_MODE_CSLICE_MASK);
        }

        intel_uncore_write(gt->uncore, XEHP_CCS_MODE, mode);
}

> +}
> +
>  int intel_gt_init_hw(struct intel_gt *gt)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
> @@ -195,6 +215,9 @@ int intel_gt_init_hw(struct intel_gt *gt)
>  
>  	intel_gt_init_swizzling(gt);
>  
> +	/* Configure CCS mode */
> +	intel_gt_apply_ccs_mode(gt);

This is only setting this once during init.  The value gets lost on
every RCS/CCS reset, so we need to make sure it gets reapplied when
necessary.  That means you either need to add this to the GuC regset, or
you need to implement the programming as a "fake workaround" so that the
workaround framework will take care of the re-application for you.


Matt

> +
>  	/*
>  	 * At least 830 can leave some of the unused rings
>  	 * "active" (ie. head != tail) after resume which
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index cf709f6c05ae..8224dd99c7d7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1480,6 +1480,11 @@
>  #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
>  #define   XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE	REG_BIT(1)
>  
> +#define XEHP_CCS_MODE				_MMIO(0x14804)
> +#define   XEHP_CCS_MODE_CSLICE_MASK		REG_GENMASK(2, 0) /* CCS0-3 + rsvd */
> +#define   XEHP_CCS_MODE_CSLICE_WIDTH		ilog2(XEHP_CCS_MODE_CSLICE_MASK + 1)
> +#define   XEHP_CCS_MODE_CSLICE(cslice, ccs)	(ccs << (cslice * XEHP_CCS_MODE_CSLICE_WIDTH))
> +
>  #define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
>  #define   CHV_FGT_DISABLE_SS0			(1 << 10)
>  #define   CHV_FGT_DISABLE_SS1			(1 << 11)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
