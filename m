Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F002412893
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 23:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4F36E893;
	Mon, 20 Sep 2021 21:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451126E893;
 Mon, 20 Sep 2021 21:57:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="223275552"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="223275552"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 14:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; d="scan'208";a="556504265"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 20 Sep 2021 14:57:33 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 14:57:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 20 Sep 2021 14:57:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 20 Sep 2021 14:57:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGUg3koKq/uTkq5SiL6jowkYae7rEMXtaZZNDUEnCN0yC/k/QDc2RuqcD0lg270NYzECdLUNxM6sFd4VCpCpB3v89LvHsiRrBzKZ/pBLFMSE0IfUVI7Qb0oeOMi/QdISRuBIDdNsDQxVr1psEKvQIIrW7w269Ho2OxhQBkbYGBttwB2CXkojElM5OV4cS+Lx/x23J2ErwhiliopFTigy+FMEyk9KVNBJ2agByYJqZaCZbEPzVfX/Wa6FBf6GLcPr5NS7UxMKLs1DHXPAQZSq+cBZZz3Kp2SWtCx/HhDnLeQTvew3ZwwANK0Q654BfasMX7rfi4l405n2KRVJWniIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=pmUKJ1U/hGcjyTdIFC1p+BLVw1F+CzFVaV/kpPnvR5Y=;
 b=iHL8fTdVrE++WuNMb7i2LMuSbUZF9jIFhTHw3EhGMLJG50x636h8ar80Sg++AwDe/OVwvTnuyLQGsWrcNu9n9oCGjKztF2NHH4PKnztCYSNLim0uDl0kMgCDqEm9/CsLmJRbhb/KuJ0WGnid4BDIE+bjuI3bzpbGL4jV6cjJ7eBV74sJtPFEI4YhatuR3vMDh72k4sv7laF3K993v6tHupIywqDRU3WCpjuCUYUMKFO6rL6RXkD2VZxKi2ZNBso9NeEw7EaXkucFTdXgUuES0p1PviB9LIRVwuWavPL/5smD3SpDAhNPUSD9sccT8Pfl/MvT8j7LunFI6en6sKhE7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmUKJ1U/hGcjyTdIFC1p+BLVw1F+CzFVaV/kpPnvR5Y=;
 b=NgyMLJmCPqLhcDW8e5i34oSsmJx/ARBYVMS7OKPptO1A5r2xzY7B/FL2WucCgCyvlfesaWifDQEPZDb2zNKmwvvFlfiFEd1Kz/pOWF9tjhBlFY9m1HHAPUzeIqeC8PrsvdqH8rUnQqbCNhtGw4QDlw8k9XPDlpTYWnz9y8DNxDo=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 21:57:25 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 21:57:25 +0000
Subject: Re: [Intel-gfx] [PATCH 16/27] drm/i915/guc: Insert submit fences
 between requests in parent-child relationship
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-17-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <09932f6a-17e6-f226-2cc1-fad60781ce43@intel.com>
Date: Mon, 20 Sep 2021 14:57:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210820224446.30620-17-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: CO2PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:104:1::24) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 CO2PR05CA0098.namprd05.prod.outlook.com (2603:10b6:104:1::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Mon, 20 Sep 2021 21:57:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56fc99e7-2c8b-4c9a-10ad-08d97c81a165
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56272DCEA89A395D1187312ABDA09@PH0PR11MB5627.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HvntWpSSTy2tG8Y/fvyP+K2fRvpGiLKXFnF4wzrXq4LVCJBUBK7TG4ebI2NgLFo1P21wWX/vhX+5eRkrUF+LiY7iS1vYJTWbtkBrhqAdXfxffE8SxV06AXREw6FL3W7sKLODHoxVwF+wbksZTT/MTou7XV0J4THb4L5YRAOIOQvittFe+nfLY+7fmymHoWL7mt3tj7/mRgQbRHZWjvcqbYdXZLfo4XLxC7clmWIHjJwwFZdFKTe+U/9E21LzcyiP73FHiWMsSQfYKdvuAUuzw8VksPfauxrb4gzBq5zGViansz47h8rzomfFaf4jAyn7ujVOv995u8/CA/gUtZnBiZgXgK+bsR1MOu4WQ5CO/mLDSGq0O9N2I1MIUI9/OhbJmpHMGzZ1XSTJ6yWSi0eep4UrdwhQsA0ZjgWMABQPkeHnyJV4/uN+JiLkNN/H+VvrcCGuNnqMBll35MvJkVraP7S/s37vUSf7BBxgKy1dvai4QQPleUuk4CQB1bsbNsIRmxZ1F5MWCNRMgJ9pFmiaKr5y8lH6UbfC+8PldseORTSu1HtoOhTSRrD8DXrvbli3+mZsObPHPkGZENIpijuDSELULBC6PqRSqjhmssWJ6TpVZ2ZjS/Ao3TG8+J94IMBvGkRrFKB3/LceuV5Rn7wu06jHbIfjnlt+rNojofAKANNMLcQjBNzk5c6hk8OWoiswj3NrhqjlOXdypqWTqWtVa9javmyUBV1SBAW/qIMl6LR3b6hobB3H94ZHRkalfc6D6QJFn9rWLiHdLRpXZk4MRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(8936002)(31696002)(478600001)(316002)(8676002)(4326008)(36756003)(107886003)(16576012)(86362001)(26005)(5660300002)(956004)(31686004)(2616005)(38100700002)(2906002)(66556008)(66476007)(6486002)(186003)(83380400001)(66946007)(53546011)(60764002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHN1dGxqcGhXa095WVI5YnIvZW9BNG5vdU9xOWtwUGRSajIvQnlESVRrL2hh?=
 =?utf-8?B?eUZweW43MnBVL09EZHhTY1Z1REN1Q1FwM0Z6SkxjVDlqNjNoUytFbGxXNW0x?=
 =?utf-8?B?UFhoOUo1ZDAvY2hCOWo2dStFSTIyZlQvakhxdWhLbTRDTjVic2xhWWlZSzB5?=
 =?utf-8?B?OUxSeW50Tzdud3dyMGw2QU1RQ2RyKzJPU1oyMTRRSlZYUE1HTEltb01sRGhX?=
 =?utf-8?B?T0ZYRGVlY0Y0ays3SnBKdlQvclV4Zmo0dXBlTGtta0wwOUU5cm1Pcjk2OUpK?=
 =?utf-8?B?TjZPZEt3Wi8yT25rTE1qN1JPMlAxMjY3ZCtub0dERUZJVmFxcGk0NkxCcnhM?=
 =?utf-8?B?OFZ0Zmhza1c1OGxYbmR3SUtjQjYyTHBFNFhmS0lBUHNwZmx2N3hmZy9sLzBW?=
 =?utf-8?B?a2I0VDRUM25KeHRxM3dzdzBkS0dLSEsvb2NQMXhlUFBhQThhV056YUFSZzRs?=
 =?utf-8?B?cWdYa0VKdlZZZUZIT0E0NjJCaStFTjlIYWhMZSs4NVd2VXNXSUE2dSs4QWNG?=
 =?utf-8?B?OEpMamwwTVpmeTFhQktUcUxSbjg0YW8yVTJXWnczYVU2VzNFWWQrTFB3QnEy?=
 =?utf-8?B?R016VEEwazJlMGUyWU5oWDFISlN0QnZNUGNJT1FacTJ5cGw5SGhiTzRMcmZx?=
 =?utf-8?B?NUVURVZobkNZWHgwNXhYci84WlFXWEliRDlZTkprNitsdmIvVmRoRWllN05q?=
 =?utf-8?B?R3prdEdYbmtxaEJiaWRZWDV0TGJJbGhjTFlTRzdqL0hpcFBLTDlCM04zVnR4?=
 =?utf-8?B?amFhNm1HUDFDS1VaMDFFcllUUHhaQ3VaYlRzR1BWRHZxZGhWVmZJM2Z1TU5S?=
 =?utf-8?B?VUFKa3l5RG1hYUg4NWJSM2RJQ3lYeXREdWpFMy9YSWRvRWY1SVdMeXBUVWJh?=
 =?utf-8?B?RG5tcXBVYldBSkFoSDd4VHpDc0tRRG9lOFFsY2liL1FNYVhGRDFJY1hnd0wr?=
 =?utf-8?B?eDRQUGl1S0dRamVqQVFTR2hCdktPTFhMVzZpSTQ3di9hQ3BPY1NzNWM1TXp1?=
 =?utf-8?B?TnpoSFZvdHRjVTRaSTlQdXdhTlltWXVoQ3ltRGIzamlQSFY3anU3U1dOVHYw?=
 =?utf-8?B?Y1lqcTQ3b1NYYUUzM0djZzFHRTdzc1E0UFk0cUpQOVN5N2w2US9CcVQ1Nkt0?=
 =?utf-8?B?MXVBbXlyWllrZVl6ZTFXWFBMajZFbytRS2FyMFRNbTVOWDRTSWJMeFp6NmFL?=
 =?utf-8?B?RjNCSFRiN3d5MWVtS3dBS3plZWlDRDJ1eHRJQ0JzVkVxTU1zQmJwZkhlSGt0?=
 =?utf-8?B?ZzBrRnZQckNaeHljZ3phd1JTZnY2K3ByNTBiVU91UHVUbVZoQm5uWnFKM1BP?=
 =?utf-8?B?MGZTbk9RbUdpQWd6Z0ZKMVpMckd6R0FLZ0JKVVdRZnJtVFVJRXZIQkcrQ29m?=
 =?utf-8?B?d05GaWZNTkJuVHprMG1aTTE5M1dueXZVRnhRemhXbnpwOCs0N0F2TWxYclFx?=
 =?utf-8?B?b3lQcFJBV3lyNzB6ZGNuRDVCbkh6cy9sSzBCN2Nxb0w2WlczMUlSZ2tXZTVW?=
 =?utf-8?B?ZGhobEcwa0tkcXlweFp4ckhSMXFOcjRhS3NMV2hrbkw0bWdMQ1ZjMmYzQnkx?=
 =?utf-8?B?NGRSd0QwN2FOYVQ1QXpwZXZTZ3JGUkMwRlFwNUNmYTB4UWFVZUdZcFlYSmtw?=
 =?utf-8?B?ZW9Ec1V2MHJia1lLRGFhUmpxcTBteVd5QnBwcWZydVhPT0JLVkNFdFRTUWlo?=
 =?utf-8?B?cU82SUJxbURRNnZhOVZNdUo3TE01QUtHNUcxRzFVd255R1NiQ2tCeFFTa0xX?=
 =?utf-8?Q?ADuy0Vt+utRXMSFT3zydxYmIHG5G/IeduMTzyGW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fc99e7-2c8b-4c9a-10ad-08d97c81a165
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 21:57:25.2331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDMlxEGuCN3UY0XLeAR8dmKAobh8vJVv7I2h9TG5hcW6Km91XKIKO7j+kmc5CofoWGPt8WOSt0291ehA/rkhaImgiaB9w29NR1hJVnv56q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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

On 8/20/2021 15:44, Matthew Brost wrote:
> The GuC must receive requests in the order submitted for contexts in a
> parent-child relationship to function correctly. To ensure this, insert
> a submit fence between the current request and last request submitted
> for requests / contexts in a parent child relationship. This is
> conceptually similar to a single timeline.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.h       |   5 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   7 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |   5 +-
>   drivers/gpu/drm/i915/i915_request.c           | 120 ++++++++++++++----
>   4 files changed, 109 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index c2985822ab74..9dcc1b14697b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -75,6 +75,11 @@ intel_context_to_parent(struct intel_context *ce)
>           }
>   }
>   
> +static inline bool intel_context_is_parallel(struct intel_context *ce)
> +{
> +	return intel_context_is_child(ce) || intel_context_is_parent(ce);
> +}
> +
>   void intel_context_bind_parent_child(struct intel_context *parent,
>   				     struct intel_context *child);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 6f567ebeb039..a63329520c35 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -246,6 +246,13 @@ struct intel_context {
>   		 * work queue descriptor
>   		 */
>   		u8 parent_page;
> +
> +		/**
> +		 * @last_rq: last request submitted on a parallel context, used
> +		 * to insert submit fences between request in the parallel
request -> requests

With that fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> +		 * context.
> +		 */
> +		struct i915_request *last_rq;
>   	};
>   
>   #ifdef CONFIG_DRM_I915_SELFTEST
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b107ad095248..f0b60fecf253 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -672,8 +672,7 @@ static int rq_prio(const struct i915_request *rq)
>   
>   static bool is_multi_lrc_rq(struct i915_request *rq)
>   {
> -	return intel_context_is_child(rq->context) ||
> -		intel_context_is_parent(rq->context);
> +	return intel_context_is_parallel(rq->context);
>   }
>   
>   static bool can_merge_rq(struct i915_request *rq,
> @@ -2843,6 +2842,8 @@ static void guc_parent_context_unpin(struct intel_context *ce)
>   	GEM_BUG_ON(!intel_context_is_parent(ce));
>   	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
>   
> +	if (ce->last_rq)
> +		i915_request_put(ce->last_rq);
>   	unpin_guc_id(guc, ce);
>   	lrc_unpin(ce);
>   }
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index ce446716d092..2e51c8999088 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -1546,36 +1546,62 @@ i915_request_await_object(struct i915_request *to,
>   	return ret;
>   }
>   
> +static inline bool is_parallel_rq(struct i915_request *rq)
> +{
> +	return intel_context_is_parallel(rq->context);
> +}
> +
> +static inline struct intel_context *request_to_parent(struct i915_request *rq)
> +{
> +	return intel_context_to_parent(rq->context);
> +}
> +
>   static struct i915_request *
> -__i915_request_add_to_timeline(struct i915_request *rq)
> +__i915_request_ensure_parallel_ordering(struct i915_request *rq,
> +					struct intel_timeline *timeline)
>   {
> -	struct intel_timeline *timeline = i915_request_timeline(rq);
>   	struct i915_request *prev;
>   
> -	/*
> -	 * Dependency tracking and request ordering along the timeline
> -	 * is special cased so that we can eliminate redundant ordering
> -	 * operations while building the request (we know that the timeline
> -	 * itself is ordered, and here we guarantee it).
> -	 *
> -	 * As we know we will need to emit tracking along the timeline,
> -	 * we embed the hooks into our request struct -- at the cost of
> -	 * having to have specialised no-allocation interfaces (which will
> -	 * be beneficial elsewhere).
> -	 *
> -	 * A second benefit to open-coding i915_request_await_request is
> -	 * that we can apply a slight variant of the rules specialised
> -	 * for timelines that jump between engines (such as virtual engines).
> -	 * If we consider the case of virtual engine, we must emit a dma-fence
> -	 * to prevent scheduling of the second request until the first is
> -	 * complete (to maximise our greedy late load balancing) and this
> -	 * precludes optimising to use semaphores serialisation of a single
> -	 * timeline across engines.
> -	 */
> +	GEM_BUG_ON(!is_parallel_rq(rq));
> +
> +	prev = request_to_parent(rq)->last_rq;
> +	if (prev) {
> +		if (!__i915_request_is_complete(prev)) {
> +			i915_sw_fence_await_sw_fence(&rq->submit,
> +						     &prev->submit,
> +						     &rq->submitq);
> +
> +			if (rq->engine->sched_engine->schedule)
> +				__i915_sched_node_add_dependency(&rq->sched,
> +								 &prev->sched,
> +								 &rq->dep,
> +								 0);
> +		}
> +		i915_request_put(prev);
> +	}
> +
> +	request_to_parent(rq)->last_rq = i915_request_get(rq);
> +
> +	return to_request(__i915_active_fence_set(&timeline->last_request,
> +						  &rq->fence));
> +}
> +
> +static struct i915_request *
> +__i915_request_ensure_ordering(struct i915_request *rq,
> +			       struct intel_timeline *timeline)
> +{
> +	struct i915_request *prev;
> +
> +	GEM_BUG_ON(is_parallel_rq(rq));
> +
>   	prev = to_request(__i915_active_fence_set(&timeline->last_request,
>   						  &rq->fence));
> +
>   	if (prev && !__i915_request_is_complete(prev)) {
>   		bool uses_guc = intel_engine_uses_guc(rq->engine);
> +		bool pow2 = is_power_of_2(READ_ONCE(prev->engine)->mask |
> +					  rq->engine->mask);
> +		bool same_context = prev->context == rq->context;
>   
>   		/*
>   		 * The requests are supposed to be kept in order. However,
> @@ -1583,13 +1609,11 @@ __i915_request_add_to_timeline(struct i915_request *rq)
>   		 * is used as a barrier for external modification to this
>   		 * context.
>   		 */
> -		GEM_BUG_ON(prev->context == rq->context &&
> +		GEM_BUG_ON(same_context &&
>   			   i915_seqno_passed(prev->fence.seqno,
>   					     rq->fence.seqno));
>   
> -		if ((!uses_guc &&
> -		     is_power_of_2(READ_ONCE(prev->engine)->mask | rq->engine->mask)) ||
> -		    (uses_guc && prev->context == rq->context))
> +		if ((same_context && uses_guc) || (!uses_guc && pow2))
>   			i915_sw_fence_await_sw_fence(&rq->submit,
>   						     &prev->submit,
>   						     &rq->submitq);
> @@ -1604,6 +1628,50 @@ __i915_request_add_to_timeline(struct i915_request *rq)
>   							 0);
>   	}
>   
> +	return prev;
> +}
> +
> +static struct i915_request *
> +__i915_request_add_to_timeline(struct i915_request *rq)
> +{
> +	struct intel_timeline *timeline = i915_request_timeline(rq);
> +	struct i915_request *prev;
> +
> +	/*
> +	 * Dependency tracking and request ordering along the timeline
> +	 * is special cased so that we can eliminate redundant ordering
> +	 * operations while building the request (we know that the timeline
> +	 * itself is ordered, and here we guarantee it).
> +	 *
> +	 * As we know we will need to emit tracking along the timeline,
> +	 * we embed the hooks into our request struct -- at the cost of
> +	 * having to have specialised no-allocation interfaces (which will
> +	 * be beneficial elsewhere).
> +	 *
> +	 * A second benefit to open-coding i915_request_await_request is
> +	 * that we can apply a slight variant of the rules specialised
> +	 * for timelines that jump between engines (such as virtual engines).
> +	 * If we consider the case of virtual engine, we must emit a dma-fence
> +	 * to prevent scheduling of the second request until the first is
> +	 * complete (to maximise our greedy late load balancing) and this
> +	 * precludes optimising to use semaphores serialisation of a single
> +	 * timeline across engines.
> +	 *
> +	 * We do not order parallel submission requests on the timeline as each
> +	 * parallel submission context has its own timeline and the ordering
> +	 * rules for parallel requests are that they must be submitted in the
> +	 * order received from the execbuf IOCTL. So rather than using the
> +	 * timeline we store a pointer to last request submitted in the
> +	 * relationship in the gem context and insert a submission fence
> +	 * between that request and request passed into this function or
> +	 * alternatively we use completion fence if gem context has a single
> +	 * timeline and this is the first submission of an execbuf IOCTL.
> +	 */
> +	if (likely(!is_parallel_rq(rq)))
> +		prev = __i915_request_ensure_ordering(rq, timeline);
> +	else
> +		prev = __i915_request_ensure_parallel_ordering(rq, timeline);
> +
>   	/*
>   	 * Make sure that no request gazumped us - if it was allocated after
>   	 * our i915_request_alloc() and called __i915_request_add() before

