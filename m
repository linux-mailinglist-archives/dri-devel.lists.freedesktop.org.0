Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A3426FBF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 19:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C846E0F5;
	Fri,  8 Oct 2021 17:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D616E0F5;
 Fri,  8 Oct 2021 17:51:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="312755445"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="312755445"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 10:49:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="546289066"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2021 10:49:50 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 8 Oct 2021 10:49:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 8 Oct 2021 10:49:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 8 Oct 2021 10:49:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcwqG+8bsX24pFABwTYPF3wFm1BKVJgrHcPbdFYNO3Jjud744mBTOSNrKI4JXfZCzm1/n80zi72L9PfQ75GDbYYdjQ0Ffz7WlHRm2dOgZCmf+5F7HL3ffk5Xwr1tnb5xCWYyTZCcNFAPRPLlPPVCcmLzTnSJ5S5Y3Mn8KmJv78m/VluBYJmIIOwWe2WhC7fKxXUp+n9kv9RGZnQbHGPyK+uiACFB//P7I006xgrSgnMh47yBl0malLDKtSbIMSDkngPPosAV5kAqeyLxz8wFMkJmjbEHoBVVFxtd9jRJfyvfvbHdNSA2JsrLEIssTWq7eK2EgPfCcX3saf1e15U/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4c8+yeAtTl5Jm6mYZqwCbXc9pX06/pQSE81OB1DXcU=;
 b=RrgO8FQF04LKquqKkI6vfF/6LUkUxIEhDgaM0BV2iozZkrTTTxnxye1HkfmDcXDbitQ5dTRReu97ozjMBD5BL+udtHkeDix8K/rSbawk1w911+2PZ8eg+yRvCDCWF1rQGQLjBT1FUYTcxUaG8qqnVbchTIQRnCQjHPS8f4FsLcHeyrqKhUbq1YnxEt2fuokbKqiteSNA1MJ2gdZe3yndvT6If9iNq6Tx8QYPhW382XWXXuzm0c6zTu59g40M99O0N3Fj4KSR+E0Q2eXpPkJYASU2VS2AMNAAqJeKuIZEPQI748PHU6oanXDUyzaCzlwaJlWk2tdTxx/XjuH7Kc3ouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4c8+yeAtTl5Jm6mYZqwCbXc9pX06/pQSE81OB1DXcU=;
 b=Lu7qLz0nBVTy5/mbVKfdzcxlu5bc7m1I1ZWpZ+2ykmq6dMx02EhTbF/KIxzdERJtE3vhAQ6nHCE9hJ+PCSyoXjgvEVqDu7bBWEsqcE9HAYKnxCPfc71Kf3c0JUoxlwaflrpIGUtHsPFONqNWolGHTVg9jnvey0KhYB2iF94JBUU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 17:49:48 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 17:49:48 +0000
Subject: Re: [PATCH 16/26] drm/i915: Fix bug in user proto-context creation
 that leaked contexts
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-17-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <6dc697e0-1a94-27ea-d287-a2af9072681c@intel.com>
Date: Fri, 8 Oct 2021 10:49:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-17-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:300:16::19) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR13CA0009.namprd13.prod.outlook.com (2603:10b6:300:16::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.5 via Frontend Transport; Fri, 8 Oct 2021 17:49:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db349401-50a1-40cf-e6f2-08d98a84058a
X-MS-TrafficTypeDiagnostic: PH0PR11MB5595:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5595BB762C062DFEA0851AD8BDB29@PH0PR11MB5595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5m8fU9l7P5JdH9NL5nGISiC7MTR5Q9QKPc5UWEFmrBUiCa5aWcnW6v+vrJ5x5P/sqsr2TAUORp5LCmu2ggXjtrwiOvhxwyX/yXZwURAZ1CVHmSfrXs33xJIlHcig+BimxMfzpy9tuD9bm9kiHVsRuI4l16R1FtdIOHZnqjvnRJO0kHayIiCQR+vBfkEULHtk8cfm3bVUkAjQgkxX6vf2Zs69oynRAtBfZwgWsVYybhriQxhlXtCdJKNNsqRdTWthkB5g2ibpnNOGoj8fRhWgLuA3bJmPQIpKfj2JSkaY+hSwMAXCKF0azyTW1B9ZhqU/w+z7rN8PcsbhgVYEyD5nA4RJL+CtoGhWrbQ9lZ5Qjc2wNXGELKloRikRM2uTThxRqNoUobGXm70GbKL4zrUzKazQfZRGfLq1wLEaik4oQmSLK41BHebwyTOEj7Rog9xzVV5mL4VedBm6eKIauUPShppJNs1lLhtV17zOzWDnDYeWHY2rCDaxz5TgyXLM8KlscDBRFG1i2mlykwaXl7+tbOxJR3nlWefBxXEoa5fJzOvKIAwbTrmo9c300J4i0QNJZQHyQv+jc4CaEUnNRiPiEdbTbAnGZS/QOx2E+IlIg6GJs4F1Ix8wtzdiuZcw7DqRQar4s3728lkt3Tes/hOMgbWsn0Xh4gTfa0JomGjrmkBBFGGcr2GeUMSFQNepfW42ph2J1VtWLdNQqY/lrBURbKrzXzS4eOmCvgh7wRVimd8iqSFNZ/L7SNEWy5FtoxP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(16576012)(316002)(31686004)(2616005)(86362001)(83380400001)(956004)(66476007)(66556008)(66946007)(450100002)(8936002)(31696002)(36756003)(2906002)(107886003)(53546011)(26005)(5660300002)(38100700002)(186003)(8676002)(508600001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2VrY3pkY21PVE40em1GUTJjaVp2OC94OHUvbUhSZVVZYThIYS9CVWNYTEQv?=
 =?utf-8?B?UW4zcnl2L3RoRjlzQ25KWUVaalZFakhuNDNHZ1NTSEQzYzUvbXhWWGpLTHJl?=
 =?utf-8?B?NU4vMEhXTnVHbHJ2d0ZsRXZJUVNaNVZZeW5YYjRNN1Z0emNvaHhzOGU1c1hD?=
 =?utf-8?B?bUNkSTcwT1pnbk1zMnlNVENta2JBYjdrb2RoODFlbFE3UGs4a2xtbndiZWRH?=
 =?utf-8?B?S09rRERKUkliT3VJQ0Jrb1ZlR1BmUTR1N0x3RkkvOU1kVUU4WUlobFQwbXZW?=
 =?utf-8?B?R3dOeERGaUpJanF6aGZnS3pGbHFpeS92UmY0TURLMjJ4R1o4VXRrMW54Z2tD?=
 =?utf-8?B?a3BrZFFIL3dxcEdiTUtSRXdKT0RnUmZaU283aTBDdmFNSjM0VXJHeDkzLys3?=
 =?utf-8?B?NU1wM2wzZjNLeGFUOE9hMStQV203emt0bnF0aVNuUW1jaUczN25jdTlwaWtX?=
 =?utf-8?B?Qkhic0dHTXl6RHV3ZHJveUEvN1ZjQTVSdno1SXV5ekJrMXFOMzVVU1RJY3hl?=
 =?utf-8?B?NlprYnByVk41Wi9mZHI1dXltTW5LVU5QTDdjK0JjcldlZHFtWFlnQ2FOeXU4?=
 =?utf-8?B?MUtUK1N0SFkrVS9ZaFdhYmprd3VCazFkTVBmNldqRW52empyYUtuNGpQTmsr?=
 =?utf-8?B?cnBHUk1ZZ0NpQk10cjREc093dkNkOVRQbDEwekd4SlZoUzFXM0FPK2lTUmsz?=
 =?utf-8?B?ME5naWQ3TVEwSHpGVnNJNDVFcnk2dTFKck9aek5zdTVBcFZOcDBaT1JxU05t?=
 =?utf-8?B?TXJRZC9PUHlaeDc5S2lpUHVlVVN3RWwvTUpVNjBZblAxNnozMFpEWkV4K0FO?=
 =?utf-8?B?UzJISVhPOStKN1hUTXc4Ky8xeWFPTkRQR21mL1RPQlF5ZGZlNHA0eklzV1lC?=
 =?utf-8?B?OEJFbnNPQTJndmVyWTBSbFh6SGpqSUFIcVlFaGdmZG45alhsdEZablRuemp3?=
 =?utf-8?B?SkJCU3dYeXhaRkM2VE1rdDdhN3RwTzMxMHl1L3NKQ0xKVVhzOUtTeXo4QkU4?=
 =?utf-8?B?YkQ0amVxYStya283VGxWd3NDeEhkYVowNEV0VzVkRG1HM0RDUG5wNVc0ZW5F?=
 =?utf-8?B?VUV3c1JkQjhNeFRJYzBVb1hpV3hNTVdFTmpqSmZDT0RaNGZLSUE3Mm52T0NI?=
 =?utf-8?B?WVJmL2htbmZ4cTJtaUpOME4remkzeEpVemR5VGw0VzNsd1dLTUJzRUtVQ0M2?=
 =?utf-8?B?K21ESExlMUJIZlFJaXh0YUhFL0RvK1dqOFlGWmJxYVBpMWUwNkVVcHJBWVFn?=
 =?utf-8?B?TUpORkF0NHpXaDN3ZFhKY0ZuRnBZYUxSYzZyZExyT1UvWmdXOEM3L3FNZ1Jk?=
 =?utf-8?B?dFA1WkhxMm1xd1dGNzI2Q1ROVHZSRnJ2dmdzQkp0aGZocUFmYjNpb3VtdDJB?=
 =?utf-8?B?bzYrRTYzdjhCZDZpWi9XRE5RdXM3ZWFzdlR4WEtnTmc2Mko0VHE5alhlNEdK?=
 =?utf-8?B?Wi9pT25YUG15VU1wSHZ0ZGxLVlF1cFRGTG1ndTBtajk5SXp5V3ZHV0N1SEpK?=
 =?utf-8?B?aitMWlluanJRTFN6bTdTN1dzRTAxSFZVc2lXWDV5cHFDWk53ZDhpL0krMWZn?=
 =?utf-8?B?VVBTMnE1YS9PblNuMWs0NjRYL1VSc1p5eUdNTmdyVmV1aUQ4Wms2V29YZ0k5?=
 =?utf-8?B?L3R6V05sWENzYTBKMFIwVGQvY00yT051SHV1Wmk5VENvZG9PcGNNUWkrL1Jj?=
 =?utf-8?B?M3N5Wm1pVm5BaFZjbW4zRWU0c2F3S1Zlb3ZxWUxBb2x3cEtGY01CQWZyRzlh?=
 =?utf-8?Q?HOKTjaoRsNOGzqOZm05BpdOERBk05FUxNCSGua1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db349401-50a1-40cf-e6f2-08d98a84058a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 17:49:48.4275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7Q3PAXV6mQoBGYFxIIiQT3SKC8fIT8Y5eHntxIRHhHiL6bhmyZ/MzJvPzzER6An56IebGzlO7eccwmu0JLlYRHWhRRNYdM+MdZMSO3Wa/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5595
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

On 10/4/2021 15:06, Matthew Brost wrote:
> Set number of engines before attempting to create contexts so the
> function free_engines can clean up properly. Also check return of
> alloc_engines for NULL.
>
> v2:
>   (Tvrtko)
>    - Send as stand alone patch
>   (John Harrison)
>    - Check for alloc_engines returning NULL
> v3:
>   (Checkpatch / Tvrtko)
>    - Remove braces around single line if statement
>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Fixes: d4433c7600f7 ("drm/i915/gem: Use the proto-context to handle create parameters (v5)")
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 8208fd5b72c3..8c7ea6e56262 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -898,6 +898,10 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   	unsigned int n;
>   
>   	e = alloc_engines(num_engines);
> +	if (!e)
> +		return ERR_PTR(-ENOMEM);
> +	e->num_engines = num_engines;
> +
>   	for (n = 0; n < num_engines; n++) {
>   		struct intel_context *ce;
>   		int ret;
> @@ -931,7 +935,6 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   			goto free_engines;
>   		}
>   	}
> -	e->num_engines = num_engines;
>   
>   	return e;
>   

