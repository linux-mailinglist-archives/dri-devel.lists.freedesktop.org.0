Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE2425C97
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 21:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407E16E57A;
	Thu,  7 Oct 2021 19:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECD176E57A;
 Thu,  7 Oct 2021 19:50:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="207155018"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="207155018"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 12:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="545855635"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 07 Oct 2021 12:50:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 7 Oct 2021 12:50:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 7 Oct 2021 12:50:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 7 Oct 2021 12:50:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aubarqcsgzqMhCd4C9KxsJdtCfbsb03iz/UJju+kKbzrC7g0pBj3g9LYKbIQ9N6LtU1D3xU71RkQcD1WfqT4u9+K6KkcklbW89gfnWEkHoRz/7Gh97oLwEDfEXAWowVQ/14fqWo00rVIu4ZNj9KldtbZbqQJuVrG7UiI5CQZEknE9oln7l85fYRdoO4wuV5f3Zr54H1fJ2qZhV1ZBHJZ3iGGxPc9qUYQKefkLgHwqNK4TNb5RQ44CgFXsjSddkdSrjC/dUoD81XT/x3nUNSkm/DTEo2KwwAjparfYLcmLeJ4YHf5s5yFj+lVYlaIUd65ufX+h0zwNAl+S90wy/xKpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07+wGAHW1P2XU3jR3BmY7iYjdADIS1LoenVbSIMasvs=;
 b=hK7celYMuF159ZUUH5DbK7u2A29FZthEZrMn60jcCH46GxTcma8raIxxS/V+eha4bib5cZhzdv6H+wDpaP6mu4BCGS5K4nfbfGnKG8Df6hSXSh1USmFtOXt3B7UZzyEx7kbMQ9k+mG5dJdx9gddJuNvNWzHo34b0z3TiwX6KuP+syGbTYFwG+nYBhNPnUz0U2Hnc7oaqfINM8EZeM/kPFgHgZYkahn5vmT+kaMpF+eIWS8Fomr8u5xHk+B7wENr3b1YUoYPpnpikuYQXRMBqv8Dib2Kk+56FfzxqJK2jpMMC3Ft6acxP1p3k/wDKvwBNNe6+rFfJGbkWPOXJK7hO2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07+wGAHW1P2XU3jR3BmY7iYjdADIS1LoenVbSIMasvs=;
 b=KlJP74agWqs48GEipg6HSR/eN7Ys5R7PwDoOGs+Er8p/5mODoja2Oed+9PCR3VvyjDsPrDjvxSiS6PlNDlwXq06bTuzpCsEVb5K+X3/kNnRxZNXDFb2nN2GVx3IsC/y7pchHf4EriPMFKcfy8VqvwOA9VQOuQtbQZGkuosUA8l0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5643.namprd11.prod.outlook.com (2603:10b6:510:d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 19:50:31 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 19:50:31 +0000
Subject: Re: [PATCH 08/26] drm/i915/guc: Add multi-lrc context registration
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniele.ceraolospurio@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
 <20211004220637.14746-9-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <f03536a0-2ffe-ed40-041e-0f277960a60d@intel.com>
Date: Thu, 7 Oct 2021 12:50:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211004220637.14746-9-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: BYAPR05CA0093.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::34) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 BYAPR05CA0093.namprd05.prod.outlook.com (2603:10b6:a03:e0::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Thu, 7 Oct 2021 19:50:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6529b87-36ce-4978-72f4-08d989cbb817
X-MS-TrafficTypeDiagnostic: PH0PR11MB5643:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56434DD2C13DD72A8FF975A3BDB19@PH0PR11MB5643.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DrUv931ma6o6NBp+kRTan8/hIDkG02nnvvvVUyrW69sRHdIZS5CpKucB4TuhJF3gaSXcvh5HKWMVPmOqb3deoQ9BtUaRhyXA6lSnhtYQZBKoSX9YF2oHAQf+2N3asjamJVSpg+1p+rkJ1VSLSwWeRbn1P7eiBvPBvfAElPoTBbJIV40uVMcg1xykDn+FSAgiZ9D+HfjTXed2dhiIgOvde5kFdUvggD7KwVz+OJR3RjClsWIWNuTNTp5Ek1NRRVcVw7lrQ3UcgZXMxcWyifgGE5nbHeGV//yrNU7BwTMcD9RgQp9NOQRt+oWYz8V2uWxWkEIm/HCzfnKLQ9lG7CnQPfabecUIWpPc1/fDSvDYZf3plECtcw3P4h/tWDISjWUjc3pUu+TBezvclg9O5eZLy/v7WYotjbY3u/QiEsHMFQ9rRXANNbXRslOCtFWsTC2frRcOxSobKjc8aCSRJp5/b9bhkr5/c/YbvHZzAINdTI5Q0uUeef0y2oMICoKRFQM9qM7cb3c/T44JQPnWIkohOPxvmVwSizkQqo/32QcsmIcMujL+0XOAAe1t7X1zg9CCbn895L2siMWMLQ/A8j+tO4fwXN2e5fv0WaCyxae3q3vQnQ/jKrsaoMAGOvbvtHn2pcw8EbqVHQewM1A8yh7+BY/nopFlr60zmvGErN3Q91QrAvn3RbRCFICwql+Pel6eWZeAtstBIBJk6GdC1rlB02ztqxicrNLFHIytohGScGWq4e0F2zufPHsbmASL7taJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(26005)(107886003)(4326008)(66946007)(31686004)(8936002)(450100002)(6486002)(5660300002)(38100700002)(956004)(2616005)(66556008)(66476007)(316002)(36756003)(31696002)(2906002)(86362001)(186003)(508600001)(16576012)(53546011)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBjNDlKL3VjN3JtY201RGRiblBoNmdXeTA1MFVyZEJjSG1iZ1pKZFBPdzdq?=
 =?utf-8?B?V2FocytmTHdwWndtM21VcUFzU09xRFc4RTF1YzV5VVBwbHFrV3RvRzkyZHJy?=
 =?utf-8?B?M2JId25IWmR5ZkFTNktkYVJkc2lRZVZwTk91V2ttT0hBRUZOQnl3RGVqT3dS?=
 =?utf-8?B?dFd1K1BsdVdTVHppa0t3QUtvdGdYVVFNMlVqUkJKVllVTnM4d05Rd2gyb2x6?=
 =?utf-8?B?UWVOTW5vNUIyNlJwL09yM2FvVHBQYTcyYWExM0R6QTMzV2ZyVGtTWmI2aFBF?=
 =?utf-8?B?V1N1bmc5Y0djd1BQQzhQTi9yTSs5VkhrblFDRjJYUnQrTE5FUXF6SXNqb0RF?=
 =?utf-8?B?ZXArR0l4OC8ybW14U2tWSnlHajVyUkxwY0xIbmtmc294N25oZWJNODFleHlu?=
 =?utf-8?B?SDI3cFhtbjZjc2VmdVJRbmJpOGJGWVZqZkp3Ti91Q0hEMUpGWDFWTm1RcXZH?=
 =?utf-8?B?WFFRYndWN2pSTHJpVTZOS0dRYXJESjdsUWtjNTljN2dFOUozdEVKNzN1WHNn?=
 =?utf-8?B?YzVueEc1QnZUZVdvSFgvd3FRR3d5ckJON0s2TnlOQi9zTmNOQ0dQdDFIL3ZP?=
 =?utf-8?B?VHRmR0hMakVsNERaTjJjSTEwdkRYME5Mbm1GR243MStxUFFLd2xQdWdkK1pU?=
 =?utf-8?B?Rmk4eUdyZ1VCRkI5a0d2bzA0c0Nkd0JoQi9UOUZqOVg0dXcvR1FnOXZSRjZx?=
 =?utf-8?B?YzJkczZKcDdPK3dxMi8wRHg3T3k5Ri9KUEFRT1RZaUxScGF0bnZZYnNnWG4r?=
 =?utf-8?B?NFdVTWJxRlJUaEo2MzBDSUY5eUVwQmRIb05Kd29SNWdNUEM3eDUxekRhVUs3?=
 =?utf-8?B?bmdIN09nc0lpNFI0UUV5M2pHb1NuaUpKNSs5eGd3ejlLYmF3WVV2emJoSlJy?=
 =?utf-8?B?U05seFViTC8xM2tHdGtSdEJDQ0ptRWQ2THQ4eVNHQTBxenAwcjEzTUZ6c0Zx?=
 =?utf-8?B?R1plY2RMeXd6SVE4YmFvSzJMRFlsZ3JYc3l6cjNPaFBROURlRVA3UkxYZ3hL?=
 =?utf-8?B?Vm5vMm9lOUFESS9tMVJHVW91amtYRzh4ZTNrMHlFbHo3b3JVenUwNFJ3UzBi?=
 =?utf-8?B?WDl4SXRhamUxVWU0Z281QmxEOURVczBkMHg1LzhVVDB1bHd4dVR1N2E1RFp0?=
 =?utf-8?B?UXlrQnB6TCt1OTRkWlE0dTd5OW8reEpCQTlmbHpmQ045RzJGZkprSVB6cDdM?=
 =?utf-8?B?cktKNWh4dWkvNi9Uc0piK0MwZFJudnNMWEY5cXUxaEhZQ0M4aVlPTSt3UGps?=
 =?utf-8?B?QVZKalM5RmF2andjNDdGdExkY2szNWpmWHBaSjJ2eVZxRTRBYmxTdXloUXJq?=
 =?utf-8?B?ZnEzWkY2bGNWVk0vSFdjSzQyNXVIeVBZYkdvalA5MHB6NkxoYW1UMVVxelZ1?=
 =?utf-8?B?eFUwdFBsbEJFcUxjR3lKRkVGbWs4ZWdPcVlHOEw4eXBKRXdZdlRKZE9ZYlJz?=
 =?utf-8?B?ZWhybEJlMllIeGNnKzFNV2F5RHZwK0RGS3N5czVFS2tKckJROEc4US9QMXRz?=
 =?utf-8?B?Vk1rRHFyVnNNZFQ1aTQ5MDRhbkE3SGhRK3ZsS0RyK3ZSYXRnUWRkRVRyZk41?=
 =?utf-8?B?NjVaazdqby9qdm4yQjJBbGVuQS81MWlOR2pDQmNuRldPSElRZ2x2aGJJMy9t?=
 =?utf-8?B?SXM1dDN5T1IxRkVPMzVhVnBkRk1kdFBxV0FLb0pNWjNnZndSNmUyRVVBOWJm?=
 =?utf-8?B?MmVPYTY2WE1SUTBQR0JOdzhVamxOZ0x0QkxhVFlJQTZWc043cFFJcFNwcXVF?=
 =?utf-8?Q?F7gmWFyYeeXK1JNyen+hKdKdp59mu/GY/idESvh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6529b87-36ce-4978-72f4-08d989cbb817
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 19:50:31.2702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mc+/86gwM7xrmMLucyq9dW7CHRGJ+TFPTN+/qlfsdDqACTmLsKXIFXv200iXuIzqEIGxcz/CZkoHRLnLw1MpWYM0Yf4ULRx8o7B+q+nkCME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5643
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
> Add multi-lrc context registration H2G. In addition a workqueue and
> process descriptor are setup during multi-lrc context registration as
> these data structures are needed for multi-lrc submission.
>
> v2:
>   (John Harrison)
>    - Move GuC specific fields into sub-struct
>    - Clean up WQ defines
>    - Add comment explaining math to derive WQ / PD address
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  12 ++
>   drivers/gpu/drm/i915/gt/intel_lrc.c           |   5 +
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 -
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 114 +++++++++++++++++-
>   5 files changed, 131 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 76dfca57cb45..48decb5ee954 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -239,6 +239,18 @@ struct intel_context {
>   		struct intel_context *parent;
>   		/** @number_children: number of children if parent */
>   		u8 number_children;
> +		/** @guc: GuC specific members for parallel submission */
> +		struct {
> +			/** @wqi_head: head pointer in work queue */
> +			u16 wqi_head;
> +			/** @wqi_tail: tail pointer in work queue */
> +			u16 wqi_tail;
> +			/**
> +			 * @parent_page: page in context state (ce->state) used
> +			 * by parent for work queue, process descriptor
> +			 */
> +			u8 parent_page;
> +		} guc;
>   	} parallel;
>   
>   #ifdef CONFIG_DRM_I915_SELFTEST
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 3ef9eaf8c50e..57339d5c1fc8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -942,6 +942,11 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>   		context_size += PAGE_SIZE;
>   	}
>   
> +	if (intel_context_is_parent(ce) && intel_engine_uses_guc(engine)) {
> +		ce->parallel.guc.parent_page = context_size / PAGE_SIZE;
> +		context_size += PAGE_SIZE;
> +	}
> +
>   	obj = i915_gem_object_create_lmem(engine->i915, context_size,
>   					  I915_BO_ALLOC_PM_VOLATILE);
>   	if (IS_ERR(obj))
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> index 8ff582222aff..ba10bd374cee 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> @@ -142,6 +142,7 @@ enum intel_guc_action {
>   	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
>   	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
>   	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
> +	INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
>   	INTEL_GUC_ACTION_RESET_CLIENT = 0x5507,
>   	INTEL_GUC_ACTION_LIMIT
>   };
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index fa4be13c8854..0eeb2a9feeed 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -52,8 +52,6 @@
>   
>   #define GUC_DOORBELL_INVALID		256
>   
> -#define GUC_WQ_SIZE			(PAGE_SIZE * 2)
> -
>   /* Work queue item header definitions */
>   #define WQ_STATUS_ACTIVE		1
>   #define WQ_STATUS_SUSPENDED		2
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 451d9ae861a6..ab6d7fc1b0b1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -344,6 +344,45 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>   	return rb_entry(rb, struct i915_priolist, node);
>   }
>   
> +/*
> + * When using multi-lrc submission an extra page in the context state is
> + * reserved for the process descriptor and work queue.
> + *
> + * The layout of this page is below:
> + * 0						guc_process_desc
> + * ...						unused
> + * PAGE_SIZE / 2				work queue start
> + * ...						work queue
> + * PAGE_SIZE - 1				work queue end
> + */
> +#define WQ_SIZE			(PAGE_SIZE / 2)
> +#define WQ_OFFSET		(PAGE_SIZE - WQ_SIZE)
I thought you were going with '#define PARENT_SCRATCH SIZE PAGE_SIZE' 
and then using that everywhere else? Unless there is a fundamental 
reason why the above must be exactly a page in size then I think the 
size should be defined once and re-used rather than assumed in multiple 
places (including in the description comment).

> +static u32 __get_process_desc_offset(struct intel_context *ce)
> +{
> +	GEM_BUG_ON(!ce->parallel.guc.parent_page);
> +
> +	return ce->parallel.guc.parent_page * PAGE_SIZE;
> +}
> +
> +static u32 __get_wq_offset(struct intel_context *ce)
> +{
> +	return __get_process_desc_offset(ce) + WQ_OFFSET;
> +}
> +
> +static struct guc_process_desc *
> +__get_process_desc(struct intel_context *ce)
> +{
> +	/*
> +	 * Need to subtract LRC_STATE_OFFSET here as the
> +	 * parallel.guc.parent_page is the offset into ce->state while
> +	 * ce->lrc_reg_reg is ce->state + LRC_STATE_OFFSET.
> +	 */
> +	return (struct guc_process_desc *)
> +		(ce->lrc_reg_state +
> +		 ((__get_process_desc_offset(ce) -
> +		   LRC_STATE_OFFSET) / sizeof(u32)));
> +}
> +
>   static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>   {
>   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> @@ -1365,6 +1404,30 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
> +static int __guc_action_register_multi_lrc(struct intel_guc *guc,
> +					   struct intel_context *ce,
> +					   u32 guc_id,
> +					   u32 offset,
> +					   bool loop)
> +{
> +	struct intel_context *child;
> +	u32 action[4 + MAX_ENGINE_INSTANCE];
> +	int len = 0;
> +
> +	GEM_BUG_ON(ce->parallel.number_children > MAX_ENGINE_INSTANCE);
> +
> +	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
> +	action[len++] = guc_id;
> +	action[len++] = ce->parallel.number_children + 1;
> +	action[len++] = offset;
> +	for_each_child(ce, child) {
> +		offset += sizeof(struct guc_lrc_desc);
> +		action[len++] = offset;
> +	}
> +
> +	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
> +}
> +
>   static int __guc_action_register_context(struct intel_guc *guc,
>   					 u32 guc_id,
>   					 u32 offset,
> @@ -1387,9 +1450,15 @@ static int register_context(struct intel_context *ce, bool loop)
>   		ce->guc_id.id * sizeof(struct guc_lrc_desc);
>   	int ret;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_register(ce);
>   
> -	ret = __guc_action_register_context(guc, ce->guc_id.id, offset, loop);
> +	if (intel_context_is_parent(ce))
> +		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
> +						      offset, loop);
> +	else
> +		ret = __guc_action_register_context(guc, ce->guc_id.id, offset,
> +						    loop);
>   	if (likely(!ret)) {
>   		unsigned long flags;
>   
> @@ -1418,6 +1487,7 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_deregister(ce);
>   
>   	return __guc_action_deregister_context(guc, guc_id);
> @@ -1445,6 +1515,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	struct guc_lrc_desc *desc;
>   	bool context_registered;
>   	intel_wakeref_t wakeref;
> +	struct intel_context *child;
>   	int ret = 0;
>   
>   	GEM_BUG_ON(!engine->mask);
> @@ -1470,6 +1541,41 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   	guc_context_policy_init(engine, desc);
>   
> +	/*
> +	 * Context is a parent, we need to register a process descriptor
> +	 * describing a work queue and register all child contexts.
> +	 */
This was now meant to say 'If the context is a parent...'?

John.

> +	if (intel_context_is_parent(ce)) {
> +		struct guc_process_desc *pdesc;
> +
> +		ce->parallel.guc.wqi_tail = 0;
> +		ce->parallel.guc.wqi_head = 0;
> +
> +		desc->process_desc = i915_ggtt_offset(ce->state) +
> +			__get_process_desc_offset(ce);
> +		desc->wq_addr = i915_ggtt_offset(ce->state) +
> +			__get_wq_offset(ce);
> +		desc->wq_size = WQ_SIZE;
> +
> +		pdesc = __get_process_desc(ce);
> +		memset(pdesc, 0, sizeof(*(pdesc)));
> +		pdesc->stage_id = ce->guc_id.id;
> +		pdesc->wq_base_addr = desc->wq_addr;
> +		pdesc->wq_size_bytes = desc->wq_size;
> +		pdesc->wq_status = WQ_STATUS_ACTIVE;
> +
> +		for_each_child(ce, child) {
> +			desc = __get_lrc_desc(guc, child->guc_id.id);
> +
> +			desc->engine_class =
> +				engine_class_to_guc_class(engine->class);
> +			desc->hw_context_desc = child->lrc.lrca;
> +			desc->priority = ce->guc_state.prio;
> +			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> +			guc_context_policy_init(engine, desc);
> +		}
> +	}
> +
>   	/*
>   	 * The context_lookup xarray is used to determine if the hardware
>   	 * context is currently registered. There are two cases in which it
> @@ -2804,6 +2910,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   		return NULL;
>   	}
>   
> +	if (unlikely(intel_context_is_child(ce))) {
> +		drm_err(&guc_to_gt(guc)->i915->drm,
> +			"Context is child, desc_idx %u", desc_idx);
> +		return NULL;
> +	}
> +
>   	return ce;
>   }
>   

