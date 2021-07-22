Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C47143D2D07
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5B36EA7B;
	Thu, 22 Jul 2021 19:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A646EA7B;
 Thu, 22 Jul 2021 19:57:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="297298785"
X-IronPort-AV: E=Sophos;i="5.84,261,1620716400"; d="scan'208";a="297298785"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 12:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,261,1620716400"; d="scan'208";a="512764822"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2021 12:57:01 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 22 Jul 2021 12:57:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 22 Jul 2021 12:57:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 22 Jul 2021 12:57:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMYLOLZNffb8d/juUpqxdPf0ckJ5Smqgp5Sg/jXjatyivIfPA+OEVvF4JfmqNeoPTMqtcGr5bzvVQokmq8qjav76JnMXcAVhSinl3VdBt0cgvrNP90Ko7DWvbm4GHpbb+OJ2IICOxJQx0EdPwOmPUcHgDrjXy9mcvdVQBAZkhm95aj337AoxOZWq9xQU7YUIUgYtarjYI345U0/MkewTs/iDotey0iQ3+b9RcviXclLWEKK+JIPboGuKJAaRlLPzt1j6l2addalITOZzU3C3WXDDSPs426MFRVe4hhXnn23k4wtD+UAslmxYoLdjWR9RtGCV3WlHwoZFjJljqchfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ8PuKF9gzex1nLlAKoXWUZOB3eLemYEZB4+C3mPfKE=;
 b=OeCKJQriBEKprlf3YBZrsM8htMxkdzNnt13dDr/Nu/M/cEhqRnjq1O4jhrIUSocW509N/6zvePOF0hcUQc126U2ORR/3cYxmzQy8ip7WEE34P0OSU13A+dmuLW6D9TY2vzFRgUAnDhzwH6V0b0FxqgGDz/tXadbgoq00WIOvmosDwjhRX371EZU+H2goINzJIhr68GM1vf7HRN25eLykmpzBPk0iUFGp8C9cxMVi00GVCboNzQ2NIhSuZxWOi5nVKn2y5XHkfuFns+2iDbQaKVKaihkg5biizmzFGBhLHx+KwqimhzhIS0aouXkz8Lm/5SSZmWeyak9NBbq47gaEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ8PuKF9gzex1nLlAKoXWUZOB3eLemYEZB4+C3mPfKE=;
 b=neESVzNV9YISsOHrsIhPA8IaExKLlI1KgYWBxEyS8bXVjQ0JfC5nnwdwPNP7MbTFakeXClbrWegzIfhwYROnlXcPyg6LBUy+7fwnqePLl5XSnSf07ApOSUZhE75GRA8W6XU+bDmk6z9Ui0WbejXb+VISDi6OG/bUdZ9jUK6w7gU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.25; Thu, 22 Jul 2021 19:56:59 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4352.026; Thu, 22 Jul 2021
 19:56:59 +0000
Subject: Re: [PATCH 43/51] drm/i915/guc: Support request cancellation
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-44-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <6710afa4-f589-0102-dd16-584908bad4b4@intel.com>
Date: Thu, 22 Jul 2021 12:56:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-44-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MW4PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:303:87::24) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MW4PR04CA0229.namprd04.prod.outlook.com (2603:10b6:303:87::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26 via Frontend Transport; Thu, 22 Jul 2021 19:56:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 784e0123-711f-49f0-78fa-08d94d4adda8
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB4564D51C20666D06D6A50A3CF4E49@DM6PR11MB4564.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h9zycEWQkiP68+g7yAciyre3fVjIt5WkaPinI1CPsCv5vnVWylnJqYdusNd18vYoy/OrX/0CHvsfDl43RKo7CQ9Ygf6n5K3Yprenua+gInwqC5d7LpiDi3trYCxJC6GQdi1y9MltDYyuv0g0sEh0hzGH2lKeR95pYIWcAvPxK84VdoluGmSED/0rG965bbMpvt5dRakxxc7dTKupp889bE69a9oLJZ05xH9TC509/8LG7Gm6FBQKs67e3p1R4vSL4b03GIo/qIn43m+RN1kneEyFI1wdtsTnp3hE1Km2Au8ZBPUdTL5OI+NRXcwZuegGWmyYomuwzJNsoVtfg46DGnfH2KP+aJO5uq7ZH3caRn7jrEH+2DTcewq7AiacwLpvwwuArntaa9rd7ogNDGMrtRYWQgA1ItAJBvi5AtLCkht8DIDURxu2Wuf7+PZ46EiMOpPvg3bGkZuhgXANgRoe2019ZVHKnD9iz7/Auu8kP5ygzeKiOlXihv8uCiCwlAABLiZ+xTY8TOzYTrSLyeSLxTkjk7VUMZgrDKuUtU2fwlhjZ0fmXGA2z1UP6aI5CBDOTnU5XGnoXsR3zu2armt1snbwXDfN/mL0WBYUP5SjKat9QV1g5HgHwTyQgcRqD0OXtVi3ov1vjTJpDeJ+idQxMcwLt1hZg8mGlJQsnITE9dvWMO/PO0FJVSSyduzyWsy9VD2Sl3VmZK+nC+QOBC2bhylV4ya6vKQEuZlbZxdW9xVONTzdNK2yiIJjT7aK6WGGigZEBNrieKPvgqsY0rPaSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(36756003)(8676002)(16576012)(186003)(956004)(2906002)(316002)(107886003)(38100700002)(8936002)(2616005)(30864003)(6486002)(26005)(31696002)(66946007)(508600001)(4326008)(66556008)(66476007)(450100002)(5660300002)(53546011)(86362001)(83380400001)(60764002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEJPS2RhdlZzcGpBYTcvVTZkOFgvSGg4aUg5Y1E2NjhwamFVNVlWdVlRZW5w?=
 =?utf-8?B?K2xPK2ZhRjhHc0FSNmlVR2NsS0EyNlo5OWs3ZWFySG5iWmlxZWU1c1c3dUdD?=
 =?utf-8?B?SlpHdkRGbml0VUJCTHJiWTRKbnp3TjFUL2o4Rk1LV1IrR25EdXM1R2cyZ2pr?=
 =?utf-8?B?dVlraFlubFllNk9Oc3lHRUl5S29QTHlNWlZrKytsUjFjMllXNGc4RUQ0bldz?=
 =?utf-8?B?eW5aRXp5czM5QUFPaWY1WHJkQm8rNGVkR0hIZW9GbmlWRmNOcWNPWEFzUFZB?=
 =?utf-8?B?eEJWbW1TMkhGeFlveXh2anVuUjZNWWV0bG9kckdjNkZQZ294bjQ5SjNCWkV1?=
 =?utf-8?B?NDBJWm5EK05ybkptQUVST0p0QmZpZUwySlJjSVUyTm16b0cxR0hsOVJ3bmFX?=
 =?utf-8?B?dHZmYmc3RDZSQkxwc3EvMW5oUG5yUjJJakVVSjVNa1Z3WlZWcjR1UUQwUUd2?=
 =?utf-8?B?WksvdU82SVhaU1NWN1lod1krdkx6bzNIOWhFWkdFQm5ld3QvcVdNdUxROTND?=
 =?utf-8?B?QlplQ2YyaGtwNDFiYTBVcGJ2aEpOYTVUUndGQ3dsblA1ZkdPWDJ5YVBwSTZ1?=
 =?utf-8?B?bFZCdmhqcFNGcFB2NjBtak5XbzdYK2lWV0FyRXhXdCtmejJIbDB4UjQrMG1T?=
 =?utf-8?B?N0o1cy8vc25uVWh0SWxVR2puUUpMOXNMZVZFdzVBa2RKUFYxQXdCNVhtUlZ0?=
 =?utf-8?B?WmR6RFRmWUdhYWY5eVh6cVp0a2RpQ1R4TXAvcDhBQkVlRm9hN29iUGVQWGFv?=
 =?utf-8?B?Z0QzYUo1dllDRzR3cllZa0VJd1ZTTjhRK2NSN2Z3L0hqclZpTW52MWpaYTRm?=
 =?utf-8?B?bkFYYStlOXArd2U5TklSSVJ6c3JnWEJ3Q0MyNk9lZVB4K0hmbHFLOHNkblJH?=
 =?utf-8?B?dk9OVzUyNFp3aG9LWXRJOHlrNzA2VVloVjBvZ29IYW9jcnJMVU1vVlFQY2t1?=
 =?utf-8?B?c1JoSUFvWWs2L1JzMUVIUFRGTWhaYlN2cFlMUTJPOGdFZW1RRW1ZczlWMEo4?=
 =?utf-8?B?SEVSbitsajBqNFp2M2p0OExVVkRNcHpLcnYrUFFpNnovRVVlb3RyU2xBQTZV?=
 =?utf-8?B?UDhsUTRXU1ZVdXlnTU1iNk14d083L2JYRU1BYTF3WUVhaFgxUkF6QXlTbnk2?=
 =?utf-8?B?ZmJOSG9OaFowUnhsVUxyTlJSV2g4R3FkeDl3TGg3SDM1R242NFVveWQzb09F?=
 =?utf-8?B?MDNDR2hqVWtYTk54UC9tY05IYUJteFUxcWQvc21ZV294RklSSUwrbTd5SnBh?=
 =?utf-8?B?d0p0dlpqdlpRU3NEd0dOak9rUzhvbklQc2l6Wjg4aGF5ZnBua2NBaEZlMVJs?=
 =?utf-8?B?RXBCbGczdFpYY04vTHN5UG9sNUNZSUY0dmxUNEw5U3Q1NWMvNUFVRERrRVYz?=
 =?utf-8?B?SzFESWY5RlRZbE1zM0Z5QmVhei9FdVdMemk5YUE3N21uSldiRS9uUmE2c3Ev?=
 =?utf-8?B?d1ZneGVxWXVmL0FPZTZPczE5Sm4wMUk4OHlSeFFscHduZGJpN2R6SlE1cGZP?=
 =?utf-8?B?OXBvZXJqaDZhUU43V01ZNTA1dXFWUGJ6UmIvNXR1UjZVcVprS2N4WmtTVjZt?=
 =?utf-8?B?Y0lWdzlHVno5ZWtIaXI1VUNER0VmUTRzWVhjMy9BT0Q1RkRVZExub3FEelVi?=
 =?utf-8?B?bWpBQmFKYW1iVDFWenVYQXB4OHpxS2E5eFF5ajI4c1M5TElITzVZV1dLMzA1?=
 =?utf-8?B?Y1lPTmlhei9LVFp2VkRmZU0weVUrT1VvajJaYkpTYVBrZmNEanh1MEw4QUlR?=
 =?utf-8?Q?8bgSTUU7/O2uRUOIKU2GZjMMym2DXO3Za5Xqah2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 784e0123-711f-49f0-78fa-08d94d4adda8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 19:56:59.3421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5I71wDPcu0IlOOtjZ9yHHY2qGZQpT0MqEMSAHmTljadIu4J1FsnTvRQML2Eh9Emnz95hfFUtUlsalYfHml5AHflS9VxXYK+KtZgUspUsCws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4564
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/16/2021 1:17 PM, Matthew Brost wrote:
> This adds GuC backend support for i915_request_cancel(), which in turn
> makes CONFIG_DRM_I915_REQUEST_TIMEOUT work.

This needs a bit of explanation on why we're using fences for this 
instead of other simpler options.

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |   9 +
>   drivers/gpu/drm/i915/gt/intel_context.h       |   7 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   7 +
>   .../drm/i915/gt/intel_execlists_submission.c  |  18 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 169 ++++++++++++++++++
>   drivers/gpu/drm/i915/i915_request.c           |  14 +-
>   6 files changed, 211 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index dd078a80c3a3..b1e3d00fb1f2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -366,6 +366,12 @@ static int __intel_context_active(struct i915_active *active)
>   	return 0;
>   }
>   
> +static int sw_fence_dummy_notify(struct i915_sw_fence *sf,
> +				 enum i915_sw_fence_notify state)
> +{
> +	return NOTIFY_DONE;
> +}
> +
>   void
>   intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   {
> @@ -399,6 +405,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	ce->guc_id = GUC_INVALID_LRC_ID;
>   	INIT_LIST_HEAD(&ce->guc_id_link);
>   
> +	i915_sw_fence_init(&ce->guc_blocked, sw_fence_dummy_notify);
> +	i915_sw_fence_commit(&ce->guc_blocked);

We need a comment somewhere to explain how we use this blocked fence, 
I.e. that fence starts signaled to indicate unblocked and we re-init it 
to unsignaled status when we need to mark something as blocked.

> +
>   	i915_active_init(&ce->active,
>   			 __intel_context_active, __intel_context_retire, 0);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index 814d9277096a..876bdb08303c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -70,6 +70,13 @@ intel_context_is_pinned(struct intel_context *ce)
>   	return atomic_read(&ce->pin_count);
>   }
>   
> +static inline void intel_context_cancel_request(struct intel_context *ce,
> +						struct i915_request *rq)
> +{
> +	GEM_BUG_ON(!ce->ops->cancel_request);
> +	return ce->ops->cancel_request(ce, rq);
> +}
> +
>   /**
>    * intel_context_unlock_pinned - Releases the earlier locking of 'pinned' status
>    * @ce - the context
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 57c19ee3e313..005a64f2afa7 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -13,6 +13,7 @@
>   #include <linux/types.h>
>   
>   #include "i915_active_types.h"
> +#include "i915_sw_fence.h"
>   #include "i915_utils.h"
>   #include "intel_engine_types.h"
>   #include "intel_sseu.h"
> @@ -42,6 +43,9 @@ struct intel_context_ops {
>   	void (*unpin)(struct intel_context *ce);
>   	void (*post_unpin)(struct intel_context *ce);
>   
> +	void (*cancel_request)(struct intel_context *ce,
> +			       struct i915_request *rq);

I don't see an implementation for this for the ringbuffer backend.

> +
>   	void (*enter)(struct intel_context *ce);
>   	void (*exit)(struct intel_context *ce);
>   
> @@ -184,6 +188,9 @@ struct intel_context {
>   	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
>   	 */
>   	struct list_head guc_id_link;
> +
> +	/* GuC context blocked fence */
> +	struct i915_sw_fence guc_blocked;
>   };
>   
>   #endif /* __INTEL_CONTEXT_TYPES__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index f9b5f54a5abe..8f6dc0fb49a6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -114,6 +114,7 @@
>   #include "gen8_engine_cs.h"
>   #include "intel_breadcrumbs.h"
>   #include "intel_context.h"
> +#include "intel_engine_heartbeat.h"
>   #include "intel_engine_pm.h"
>   #include "intel_engine_stats.h"
>   #include "intel_execlists_submission.h"
> @@ -2536,11 +2537,26 @@ static int execlists_context_alloc(struct intel_context *ce)
>   	return lrc_alloc(ce, ce->engine);
>   }
>   
> +static void execlists_context_cancel_request(struct intel_context *ce,
> +					     struct i915_request *rq)
> +{
> +	struct intel_engine_cs *engine = NULL;
> +
> +	i915_request_active_engine(rq, &engine);
> +
> +	if (engine && intel_engine_pulse(engine))
> +		intel_gt_handle_error(engine->gt, engine->mask, 0,
> +				      "request cancellation by %s",
> +				      current->comm);
> +}
> +
>   static const struct intel_context_ops execlists_context_ops = {
>   	.flags = COPS_HAS_INFLIGHT,
>   
>   	.alloc = execlists_context_alloc,
>   
> +	.cancel_request = execlists_context_cancel_request,
> +
>   	.pre_pin = execlists_context_pre_pin,
>   	.pin = execlists_context_pin,
>   	.unpin = lrc_unpin,
> @@ -3558,6 +3574,8 @@ static const struct intel_context_ops virtual_context_ops = {
>   
>   	.alloc = virtual_context_alloc,
>   
> +	.cancel_request = execlists_context_cancel_request,
> +
>   	.pre_pin = virtual_context_pre_pin,
>   	.pin = virtual_context_pin,
>   	.unpin = lrc_unpin,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 149990196e3a..1c30d04733ff 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -81,6 +81,11 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>    */
>   #define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
>   #define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
> +#define SCHED_STATE_NO_LOCK_BLOCKED_SHIFT		2
> +#define SCHED_STATE_NO_LOCK_BLOCKED \
> +	BIT(SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
> +#define SCHED_STATE_NO_LOCK_BLOCKED_MASK \
> +	(0xffff << SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
>   static inline bool context_enabled(struct intel_context *ce)
>   {
>   	return (atomic_read(&ce->guc_sched_state_no_lock) &
> @@ -116,6 +121,27 @@ static inline void clr_context_pending_enable(struct intel_context *ce)
>   		   &ce->guc_sched_state_no_lock);
>   }
>   
> +static inline u32 context_blocked(struct intel_context *ce)
> +{
> +	return (atomic_read(&ce->guc_sched_state_no_lock) &
> +		SCHED_STATE_NO_LOCK_BLOCKED_MASK) >>
> +		SCHED_STATE_NO_LOCK_BLOCKED_SHIFT;
> +}
> +
> +static inline void incr_context_blocked(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->engine->sched_engine->lock);

It's a bit weird requiring a lock for a variable that is purposely 
called no_lock, but I do get it is not the GuC lock. Can you explain 
which race you're trying to guard against?

> +	atomic_add(SCHED_STATE_NO_LOCK_BLOCKED,
> +		   &ce->guc_sched_state_no_lock);

Do we need an overflow check, or are we guaranteed that the count will 
stay within a certain range?

> +}
> +
> +static inline void decr_context_blocked(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->engine->sched_engine->lock);

GEM_BUG_ON(!context_blocked(ce)) ?

> +	atomic_sub(SCHED_STATE_NO_LOCK_BLOCKED,
> +		   &ce->guc_sched_state_no_lock);
> +}
> +
>   /*
>    * Below is a set of functions which control the GuC scheduling state which
>    * require a lock, aside from the special case where the functions are called
> @@ -403,6 +429,10 @@ static int guc_add_request(struct intel_guc *guc, struct i915_request *rq)
>   		if (unlikely(err))
>   			goto out;
>   	}
> +
> +	if (unlikely(context_blocked(ce)))
> +		goto out;

You're not setting any error state here for this aborted request. Will 
the request be automatically re-submitted on unblock? could use a 
comment if that's the case.

> +
>   	enabled = context_enabled(ce);
>   
>   	if (!enabled) {
> @@ -531,6 +561,7 @@ static void __guc_context_destroy(struct intel_context *ce);
>   static void release_guc_id(struct intel_guc *guc, struct intel_context *ce);
>   static void guc_signal_context_fence(struct intel_context *ce);
>   static void guc_cancel_context_requests(struct intel_context *ce);
> +static void guc_blocked_fence_complete(struct intel_context *ce);
>   
>   static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   {
> @@ -578,6 +609,10 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   			}
>   			intel_context_sched_disable_unpin(ce);
>   			atomic_dec(&guc->outstanding_submission_g2h);
> +			spin_lock_irqsave(&ce->guc_state.lock, flags);
> +			guc_blocked_fence_complete(ce);
> +			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
>   			intel_context_put(ce);
>   		}
>   	}
> @@ -1339,6 +1374,21 @@ static void guc_context_post_unpin(struct intel_context *ce)
>   	lrc_post_unpin(ce);
>   }
>   
> +static void __guc_context_sched_enable(struct intel_guc *guc,

Why void? this can fail

> +				       struct intel_context *ce)
> +{
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_SET,
> +		ce->guc_id,
> +		GUC_CONTEXT_ENABLE
> +	};
> +
> +	trace_intel_context_sched_enable(ce);
> +
> +	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> +				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
> +}
> +
>   static void __guc_context_sched_disable(struct intel_guc *guc,
>   					struct intel_context *ce,
>   					u16 guc_id)
> @@ -1357,17 +1407,131 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>   				      G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, true);
>   }
>   
> +static void guc_blocked_fence_complete(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +
> +	if (!i915_sw_fence_done(&ce->guc_blocked))
> +		i915_sw_fence_complete(&ce->guc_blocked);
> +}
> +
> +static void guc_blocked_fence_reinit(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	GEM_BUG_ON(!i915_sw_fence_done(&ce->guc_blocked));
> +	i915_sw_fence_fini(&ce->guc_blocked);
> +	i915_sw_fence_reinit(&ce->guc_blocked);
> +	i915_sw_fence_await(&ce->guc_blocked);
> +	i915_sw_fence_commit(&ce->guc_blocked);
> +}
> +
>   static u16 prep_context_pending_disable(struct intel_context *ce)
>   {
>   	lockdep_assert_held(&ce->guc_state.lock);
>   
>   	set_context_pending_disable(ce);
>   	clr_context_enabled(ce);
> +	guc_blocked_fence_reinit(ce);
>   	intel_context_get(ce);
>   
>   	return ce->guc_id;
>   }
>   
> +static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
> +	unsigned long flags;
> +	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;

engine->uncore->rpm

> +	intel_wakeref_t wakeref;
> +	u16 guc_id;
> +	bool enabled;
> +
> +	spin_lock_irqsave(&sched_engine->lock, flags);
> +	incr_context_blocked(ce);
> +	spin_unlock_irqrestore(&sched_engine->lock, flags);
> +
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	enabled = context_enabled(ce);
> +	if (unlikely(!enabled || submission_disabled(guc))) {
> +		if (enabled)
> +			clr_context_enabled(ce);
> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +		return &ce->guc_blocked;
> +	}
> +
> +	/*
> +	 * We add +2 here as the schedule disable complete CTB handler calls
> +	 * intel_context_sched_disable_unpin (-2 to pin_count).
> +	 */
> +	atomic_add(2, &ce->pin_count);
> +
> +	guc_id = prep_context_pending_disable(ce);
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +	with_intel_runtime_pm(runtime_pm, wakeref)
> +		__guc_context_sched_disable(guc, ce, guc_id);
> +
> +	return &ce->guc_blocked;
> +}
> +
> +static void guc_context_unblock(struct intel_context *ce)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +	struct i915_sched_engine *sched_engine = ce->engine->sched_engine;
> +	unsigned long flags;
> +	struct intel_runtime_pm *runtime_pm = &ce->engine->gt->i915->runtime_pm;

engine->uncore->rpm

> +	intel_wakeref_t wakeref;
> +
> +	GEM_BUG_ON(context_enabled(ce));
> +
> +	if (unlikely(context_blocked(ce) > 1)) {
> +		spin_lock_irqsave(&sched_engine->lock, flags);
> +		if (likely(context_blocked(ce) > 1))
> +			goto decrement;
> +		spin_unlock_irqrestore(&sched_engine->lock, flags);
> +	}
> +
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	if (unlikely(submission_disabled(guc) ||
> +		     !intel_context_is_pinned(ce) ||
> +		     context_pending_disable(ce) ||
> +		     context_blocked(ce) > 1)) {

you've already checked context_blocked > 1 twice above. If you can't 
trust the value to remain stable, maybe keep the spinlock locked for 
more of the flow?

> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +		goto out;
> +	}
> +
> +	set_context_pending_enable(ce);
> +	set_context_enabled(ce);

Shouldn't we set this to enabled only after the H2G has succeeded?

Daniele

> +	intel_context_get(ce);
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +
> +	with_intel_runtime_pm(runtime_pm, wakeref)
> +		__guc_context_sched_enable(guc, ce);
> +
> +out:
> +	spin_lock_irqsave(&sched_engine->lock, flags);
> +decrement:
> +	decr_context_blocked(ce);
> +	spin_unlock_irqrestore(&sched_engine->lock, flags);
> +}
> +
> +static void guc_context_cancel_request(struct intel_context *ce,
> +				       struct i915_request *rq)
> +{
> +	if (i915_sw_fence_signaled(&rq->submit)) {
> +		struct i915_sw_fence *fence = guc_context_block(ce);
> +
> +		i915_sw_fence_wait(fence);
> +		if (!i915_request_completed(rq)) {
> +			__i915_request_skip(rq);
> +			guc_reset_state(ce, intel_ring_wrap(ce->ring, rq->head),
> +					true);
> +		}
> +		guc_context_unblock(ce);
> +	}
> +}
> +
>   static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
>   						 u16 guc_id,
>   						 u32 preemption_timeout)
> @@ -1626,6 +1790,8 @@ static const struct intel_context_ops guc_context_ops = {
>   
>   	.ban = guc_context_ban,
>   
> +	.cancel_request = guc_context_cancel_request,
> +
>   	.enter = intel_context_enter_engine,
>   	.exit = intel_context_exit_engine,
>   
> @@ -1821,6 +1987,8 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   
>   	.ban = guc_context_ban,
>   
> +	.cancel_request = guc_context_cancel_request,
> +
>   	.enter = guc_virtual_context_enter,
>   	.exit = guc_virtual_context_exit,
>   
> @@ -2290,6 +2458,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
>   		clr_context_banned(ce);
>   		clr_context_pending_disable(ce);
>   		__guc_signal_context_fence(ce);
> +		guc_blocked_fence_complete(ce);
>   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>   
>   		if (banned) {
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index eb109f93ebcb..f3552642b8a1 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -708,18 +708,6 @@ void i915_request_unsubmit(struct i915_request *request)
>   	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
>   }
>   
> -static void __cancel_request(struct i915_request *rq)
> -{
> -	struct intel_engine_cs *engine = NULL;
> -
> -	i915_request_active_engine(rq, &engine);
> -
> -	if (engine && intel_engine_pulse(engine))
> -		intel_gt_handle_error(engine->gt, engine->mask, 0,
> -				      "request cancellation by %s",
> -				      current->comm);
> -}
> -
>   void i915_request_cancel(struct i915_request *rq, int error)
>   {
>   	if (!i915_request_set_error_once(rq, error))
> @@ -727,7 +715,7 @@ void i915_request_cancel(struct i915_request *rq, int error)
>   
>   	set_bit(I915_FENCE_FLAG_SENTINEL, &rq->fence.flags);
>   
> -	__cancel_request(rq);
> +	intel_context_cancel_request(rq->context, rq);
>   }
>   
>   static int __i915_sw_fence_call

