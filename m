Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CD542CF8B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 02:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CC46EC13;
	Thu, 14 Oct 2021 00:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52456EC0C;
 Thu, 14 Oct 2021 00:28:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="207684719"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="207684719"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 17:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="717538041"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2021 17:28:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:28:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 17:28:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 17:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8HTZVBgrXfLFpZsSCI+8ITjKC2c6kCdmazq6iPteOwww7BT6pWOtAY+rY7UC77tZ07/BInRmg3dyFctn2Sw9/BwiNg3Hp/4MOqseqpyTbakSJtxI2lFe7JiPG2q7G95fgkgFrQ8a/utwKh8Uc/AaUQpyomd2HlAVt2wllT994UwA1W3AwY8/LKdPfg88Zy2a+tvn3QUz3AG06tGHc2QyREmaKkrVNUFR91jHJbRUtYeDESvme5i4Hy6/JuwGuV2OdQ63RPJ26Z7MP6howyH0uTRZG8xqDT5eeFGNkz6o3s4G6y6UsxQWygK/tVS1Ai8NeguiuJXcdiSUGV6LrWhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzDnmwceL9qUS/Hl6G+vr5235KzmfEj5YhZV2Gk34kA=;
 b=FzfZwj2jCsa+CAvhPiKSuCK0h4glEOD7ADCtsLzwHMLJ17v7kfzLKtU4M3E6KZSry5ljBirwRLjdftnE8HM1WJKLfVyZIf6koPbocgUgrKrLdpxufjuQ27FIXlj549FrKW7GKUu2FhVr1sTtJA/v+pmOECFbLOwN8FnaMaQaoWZjNodbd/HAOGQgW6GHd+PQ8S6XkIzCFpnyT/r9etTUhzrVbaCBn8y+UpTUTuJJgcZUxrj8dPnTdif4VXPpsTCLPvQytDAmf73LYwodPJ5j+Ar3bulOdXJsF2foUqmS/RL8oNE7bcuFQpAV3fAfQGclO2YEVC+flJp2sYImiYoXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzDnmwceL9qUS/Hl6G+vr5235KzmfEj5YhZV2Gk34kA=;
 b=AnCJpgiFNatn23UkAy8cTujIv3kp8fm7nz8bZo7IQxLUPuIM2GQlsCAz7O+hQA32qcr2KKf07eSSGUlUlXPMfcWHXsdY+jD3KjSBr3snRTceMTTo6q1Z2fy115XfQgsDJYXyJpLKiqca5TN9hsrGD594HQO1n85090t/GYSGpuM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5596.namprd11.prod.outlook.com (2603:10b6:510:eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 14 Oct
 2021 00:28:08 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 00:28:08 +0000
Subject: Re: [PATCH 14/25] drm/i915/guc: Implement multi-lrc reset
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-15-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <67b6991c-a789-e2af-6fdb-5941d0e89e75@intel.com>
Date: Wed, 13 Oct 2021 17:28:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013204231.19287-15-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0350.namprd04.prod.outlook.com
 (2603:10b6:303:8a::25) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR04CA0350.namprd04.prod.outlook.com (2603:10b6:303:8a::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 00:28:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13550b62-c533-4ce1-47a8-08d98ea97ea3
X-MS-TrafficTypeDiagnostic: PH0PR11MB5596:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5596F2086CE280600A9F33FABDB89@PH0PR11MB5596.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gx8D9beoS4OKTHbTpeUQz0RJIk8kMI9CrnDI3inTR6dKh20JF9REZDeB2ZV9Dwil2uTf06jc2EyWNmcWSVheJqs0Mvm0PX3dnSjD5cJaFlkzP0gh9hcRnb4JTidVrCaqYiad6KSeZogFmBnOZJk5L4cWq7lfYsN0IJO9nG/psaupZaZ2Qs5HHtZm9zIs3C0B+8JhyxL7ayJQNkdGXWYEhBbRJjI4h67QqLWp135HZKdRmNmgp3go0zqDpYUyiMvnyDSXMPEaHjWDwVlvwJ+iG4uq/YOPfAbvzgwH2bwGhonPNkFrAUS0nTClXqck183FdRWtMYImMthP2S+IvzFdF0X9r97oQAhkyo77cmNk4DcG/Hv/5pCAuQiu5sTNG706jiZ+1uos5KnwILB5YsU/hLMOIG2d5dxAupBU1sFLZ+z/dRVBxfiv5Y5oenCZx6vjSK2cH6ZXh68b5jZ9uI7uKnWY1jWRD3vWzcJzcL20EjdiET25mNvxptnTDdmugkfX5qmrhyHvJIhH2tnw6DkL55GOzTnhs+ydFe8KgXDAiMuw2wJlnwbEa8KaY8jg7Uj5vWREitCdSg7WnONHW1dRpqRgozaNhLZ61OudumqGJrJXqv2GFfQDpk5klHD7Thup35l7+tQ4vt6sbCCf/3gy/Q1dMzFRitQ8VrFhCPJuTN2gG407rOWs4FSlYQ/jWEQGQH7A8m+0LEw6X8qUExBkzcnHuoxlgrqDM7hBjUsHgfvQVv8+6JiSi3JqTUtchRkp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(16576012)(316002)(38100700002)(508600001)(53546011)(31686004)(66946007)(66556008)(66476007)(83380400001)(82960400001)(6486002)(26005)(8936002)(8676002)(186003)(956004)(2616005)(86362001)(31696002)(450100002)(5660300002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mis4WXVWYUNCQWlDZlN1VG1zaDErTGRsOE5VTi9oRWhpWmUwMUQ1QlhKWFZV?=
 =?utf-8?B?bmZvVTYvYUZLcFQ0UG1nRThJK2Z0SXZIL2IvWDhjUVJzOTNhaGJENGdXdkVn?=
 =?utf-8?B?azlTYWRaY1pUUmI3anRaQWljWmVRaGpLajgvS21HK3FXdkl0UmwzNy8xQk5Y?=
 =?utf-8?B?TFFFV1ZtZlhKSGl2L2x3c0ltVXU1VjVOWjl2MCtyK2VTM0RrNzU2VGtKRDdX?=
 =?utf-8?B?OFAwMVc3UFpZbkdRSjN3bnlkQ2UyUTNxSWlqdVl3QmFiaEJhOEhQR2ZhZGRU?=
 =?utf-8?B?dzR5Uzd0WWNsRHZOVE50aWZBOVA4RUJzTm5pTGU0K2VoYXd5ZnhmcGwzNmpX?=
 =?utf-8?B?bndjbFJQQlR0WE82djlJaHpNVU1VTlVGdmkreDZMSFZ1VmlYMGZKcXhSYm9x?=
 =?utf-8?B?ZTNJcUlEY25CMjZ5eVZXRnVFYjVmNERJbjFuMkN1K0tOaHdDSHoyRmlOV1Z4?=
 =?utf-8?B?Smt3UDZzcW9VbUxic2I5YnJ5VkpVcGZ4eXRmNmVnL0xjMVd5UGszTjhqZGlW?=
 =?utf-8?B?Rm0yanBtTGRkeGhnczdoNVpvY0pPQjVpL2cvakZTS2trQ0VRdVFsU0ZhN1c5?=
 =?utf-8?B?Q3BEenhsQ0ZYc2xNN0s4akg4MlpoZzc3ZGt2L2pIeTlJZkVJQkpLTmZ3OFBN?=
 =?utf-8?B?VVpnRnFLSzFMNUFlZW5Pa01ZMVFHT1RDRStQYzh6cEFmdDhBeVVPR0JUd2p6?=
 =?utf-8?B?NmYzQXBXZCswSE9kdW52d3JmdWZTTWhkTjk2by8rcXdDY3pGZllENHZJSitV?=
 =?utf-8?B?K3cyY1JWK2hUY1hHOXFqQjZWcEMycmhyL2J4S3paelJLYzlWWlFySk9EYWtu?=
 =?utf-8?B?SE0xNWxhN2NBREpaRnVncjM1Y3lySEJXZlZLNk5Cb0RBV2NkUmorN3hrTnZT?=
 =?utf-8?B?b0dJc0RWdHRWVTFMeFdkdW1MS0g3aWxja3lQNUc4VWRPU280YnZyb212bWhv?=
 =?utf-8?B?eTM1b1ZWZU5ZQi8vc3kveVRZS0V3cDA0TVZCZXY0VExWUUpEZnBOalRhN1hi?=
 =?utf-8?B?SUJkRGdYMFFVRElmbUZYKzcxd3hseXE0SXN3dVcwOXE3ajF3eUxPZHFwT2p5?=
 =?utf-8?B?WGw1NVl5SCtKVEk4cnphcjdGZTlBK08vN1lZajRHbVNCUkRWdTl2a2tGVE5v?=
 =?utf-8?B?bHFFWUJ4TWlsSytkb1Blby9WdGprcUxhUE9nYVRuY1o1MlpvcVlUSUZXc3Nm?=
 =?utf-8?B?djVTL1RRTk54Q1hYeEJFYnNwZGttQnR5ditLSDNtTmpFS2xad3VvN041N3V0?=
 =?utf-8?B?NnBEbUdtMU81QmZJQXIybmlmVFU0cnZZUEcrNytHMjVGUG5QWUlkMnU4L2Ri?=
 =?utf-8?B?MitNZTZuY2lnU2NuZ3NrR012bVRoV3o1UFJiWmxpam4zSFdwcHp5QWZ0QWdV?=
 =?utf-8?B?Mko4NG15bGpqdkVOUnFBOGdMVFJXMUsvREQ4RklLR1dKUmpwNGpOeVFCZXF0?=
 =?utf-8?B?dUtmL09HV2Nma1o3ZG9GVlRURGI0bjBzSnFjSWFsd2ZQemRSc0phUll6ZTZE?=
 =?utf-8?B?MjNsQ2pxK01kUTVOQ3BjeHZSTXU5RXBGQzlXeDhmUTFkUWxFL2tKcHJVR0xj?=
 =?utf-8?B?Z0g5eGRMc3dQODdjUFVSbVA1aGszS1BFWDNyVGtZbTlsVXhJOFNhZVNSM0Vr?=
 =?utf-8?B?VldkOHkvdDZNSmJORGJpMnFDR3UxcHlHZXJ0YXE0MVR5dDRVVHhxcTI4WCtx?=
 =?utf-8?B?VmpEVk5kT245MWNkVnNsSXIvVmJVdzJGWmhKOHRwYVhxZ1N5VEdHa2cwZ3lp?=
 =?utf-8?Q?kiO+XLeUmoXFhVsXGadRWFN3+2Eaa+qro06l+3L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13550b62-c533-4ce1-47a8-08d98ea97ea3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 00:28:07.9442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zd1B8XXw9Q21O7X1shpTxTw8keLmYwuhAU1JEs988qmIBEThcJCC4cF8yrDdnIRBWvmQWKxumUjMl6A9S087gi4RhmslW0nlNwo8anxv13g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5596
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

On 10/13/2021 13:42, Matthew Brost wrote:
> Update context and full GPU reset to work with multi-lrc. The idea is
> parent context tracks all the active requests inflight for itself and
> its children. The parent context owns the reset replaying / canceling
> requests as needed.
>
> v2:
>   (John Harrison)
>    - Simply loop in find active request
>    - Add comments to find ative request / reset loop
> v3:
>   (John Harrison)
>    - s/its'/its/g
>    - Fix comment when searching for active request
>    - Reorder if state in __guc_reset_context
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       | 15 +++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 69 ++++++++++++++-----
>   2 files changed, 63 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 79f321c6c008..6aab60584ee5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -529,20 +529,29 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
>   
>   struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>   {
> +	struct intel_context *parent = intel_context_to_parent(ce);
>   	struct i915_request *rq, *active = NULL;
>   	unsigned long flags;
>   
>   	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
>   
> -	spin_lock_irqsave(&ce->guc_state.lock, flags);
> -	list_for_each_entry_reverse(rq, &ce->guc_state.requests,
> +	/*
> +	 * We search the parent list to find an active request on the submitted
> +	 * context. The parent list contains the requests for all the contexts
> +	 * in the relationship so we have to do a compare of each request's
> +	 * context.
> +	 */
> +	spin_lock_irqsave(&parent->guc_state.lock, flags);
> +	list_for_each_entry_reverse(rq, &parent->guc_state.requests,
>   				    sched.link) {
> +		if (rq->context != ce)
> +			continue;
>   		if (i915_request_completed(rq))
>   			break;
>   
>   		active = rq;
>   	}
> -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
>   
>   	return active;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index f690b7c2b295..bc052d206861 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -683,6 +683,11 @@ static inline int rq_prio(const struct i915_request *rq)
>   	return rq->sched.attr.priority;
>   }
>   
> +static inline bool is_multi_lrc(struct intel_context *ce)
> +{
> +	return intel_context_is_parallel(ce);
> +}
> +
>   static bool is_multi_lrc_rq(struct i915_request *rq)
>   {
>   	return intel_context_is_parallel(rq->context);
> @@ -1218,10 +1223,15 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   
>   static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   {
> +	bool local_stalled;
>   	struct i915_request *rq;
>   	unsigned long flags;
>   	u32 head;
> +	int i, number_children = ce->parallel.number_children;
>   	bool skip = false;
> +	struct intel_context *parent = ce;
> +
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   
>   	intel_context_get(ce);
>   
> @@ -1247,25 +1257,38 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   	if (unlikely(skip))
>   		goto out_put;
>   
> -	rq = intel_context_find_active_request(ce);
> -	if (!rq) {
> -		head = ce->ring->tail;
> -		stalled = false;
> -		goto out_replay;
> -	}
> +	/*
> +	 * For each context in the relationship find the hanging request
> +	 * resetting each context / request as needed
> +	 */
> +	for (i = 0; i < number_children + 1; ++i) {
> +		if (!intel_context_is_pinned(ce))
> +			goto next_context;
> +
> +		local_stalled = false;
> +		rq = intel_context_find_active_request(ce);
> +		if (!rq) {
> +			head = ce->ring->tail;
> +			goto out_replay;
> +		}
>   
> -	if (!i915_request_started(rq))
> -		stalled = false;
> +		if (i915_request_started(rq))
> +			local_stalled = true;
>   
> -	GEM_BUG_ON(i915_active_is_idle(&ce->active));
> -	head = intel_ring_wrap(ce->ring, rq->head);
> -	__i915_request_reset(rq, stalled);
> +		GEM_BUG_ON(i915_active_is_idle(&ce->active));
> +		head = intel_ring_wrap(ce->ring, rq->head);
>   
> +		__i915_request_reset(rq, local_stalled && stalled);
>   out_replay:
> -	guc_reset_state(ce, head, stalled);
> -	__unwind_incomplete_requests(ce);
> +		guc_reset_state(ce, head, local_stalled && stalled);
> +next_context:
> +		if (i != number_children)
> +			ce = list_next_entry(ce, parallel.child_link);
> +	}
> +
> +	__unwind_incomplete_requests(parent);
>   out_put:
> -	intel_context_put(ce);
> +	intel_context_put(parent);
>   }
>   
>   void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> @@ -1286,7 +1309,8 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
>   
>   		xa_unlock(&guc->context_lookup);
>   
> -		if (intel_context_is_pinned(ce))
> +		if (intel_context_is_pinned(ce) &&
> +		    !intel_context_is_child(ce))
>   			__guc_reset_context(ce, stalled);
>   
>   		intel_context_put(ce);
> @@ -1378,7 +1402,8 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
>   
>   		xa_unlock(&guc->context_lookup);
>   
> -		if (intel_context_is_pinned(ce))
> +		if (intel_context_is_pinned(ce) &&
> +		    !intel_context_is_child(ce))
>   			guc_cancel_context_requests(ce);
>   
>   		intel_context_put(ce);
> @@ -2071,6 +2096,8 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   	u16 guc_id;
>   	bool enabled;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
>   	incr_context_blocked(ce);
> @@ -2125,6 +2152,7 @@ static void guc_context_unblock(struct intel_context *ce)
>   	bool enable;
>   
>   	GEM_BUG_ON(context_enabled(ce));
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
> @@ -2151,11 +2179,14 @@ static void guc_context_unblock(struct intel_context *ce)
>   static void guc_context_cancel_request(struct intel_context *ce,
>   				       struct i915_request *rq)
>   {
> +	struct intel_context *block_context =
> +		request_to_scheduling_context(rq);
> +
>   	if (i915_sw_fence_signaled(&rq->submit)) {
>   		struct i915_sw_fence *fence;
>   
>   		intel_context_get(ce);
> -		fence = guc_context_block(ce);
> +		fence = guc_context_block(block_context);
>   		i915_sw_fence_wait(fence);
>   		if (!i915_request_completed(rq)) {
>   			__i915_request_skip(rq);
> @@ -2169,7 +2200,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
>   		 */
>   		flush_work(&ce_to_guc(ce)->ct.requests.worker);
>   
> -		guc_context_unblock(ce);
> +		guc_context_unblock(block_context);
>   		intel_context_put(ce);
>   	}
>   }
> @@ -2195,6 +2226,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
>   	intel_wakeref_t wakeref;
>   	unsigned long flags;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	guc_flush_submissions(guc);
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);

