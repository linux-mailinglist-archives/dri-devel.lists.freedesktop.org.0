Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22391405F93
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 00:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E716E931;
	Thu,  9 Sep 2021 22:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF516E931;
 Thu,  9 Sep 2021 22:29:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="306496954"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="306496954"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 15:28:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="504667787"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2021 15:28:57 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 15:28:56 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 15:28:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 15:28:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/QE31QbYlAakK/ki9kAfz4YEY8cTQLer/UVioy/ROENwHETIbvpEOZA6Aq/qhLswS/ZesKPHOKUn7ztB3sEOhtg7IUfYKXHO0Fu/ts/VFmvwvDZ72VGy2UaQSVybJ/Os+ztmMLBjrJHAWtX7CnT4UqT853roSEN3t1QXPM7BYXmWDiCu2IkwA8f3C7gtHvnHYGKFLiNno68rIre6TO+ufET29RISOdjNa62VLSwdZJEd4Jtj20rhdlxpANDq7ULMZGXVdYalk1e327fFC1jk2gsSp9XOBEOvl/wtBTJqlawx8uzIBiuY7UJTA0SlBv4cx+NpQGVJuM2izrDtRFAdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7UqXJbi0K0/JeWhVD8jpBJcYI8eq6Y9UTXjUkE9KWhY=;
 b=eB2RxqCeNGYUOlkLEMy5ywaQZf32iUu0D8QQ8S0tSYN2gF1ThWq6aF4zRAQxf3CZCrj+pD8nd2yWjmLAggShkqZW84HzeamJ62n12UlwG3amFQdKOKfU5oXHnlwC67dY7tO+ydsb+Ids0tMlcgWb8BCb4tvfIKTPnzPorMPP2yUI4j+o8li29TsPeKD1jTBCOWwbSspF8G4tWo2aIrYj7+g/sGlAujYYKseUCviFCa0gk9kOOaYN/yuNH2nKLjembMbTU8Am18Vl0yfzP40ZEJA/sEDY3MBjJo2ZAx445lYsEF0g4cVRIMwJlatKwpbazkMH9nOm80kCqnxhl7oolQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UqXJbi0K0/JeWhVD8jpBJcYI8eq6Y9UTXjUkE9KWhY=;
 b=LhOErrcFd7bWtpB31BpNZcZWAA4iNpKD3Vs0B4XKcBQgXi4GwndVSTBPLz0UFV/5dsb5KRSaLAdGN15JulphE0onuqWynPpvMZ6TcW8Zo8YwbN50K5yKfLug8QpJSH7YYvWWHUGzDopNLADC8EoZcyQ7GDlH4nmCwHbXOJantJ4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5644.namprd11.prod.outlook.com (2603:10b6:510:ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 9 Sep
 2021 22:28:55 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4478.027; Thu, 9 Sep 2021
 22:28:55 +0000
Subject: Re: [Intel-gfx] [PATCH 04/27] drm/i915/guc: Take GT PM ref when
 deregistering context
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-5-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <40240108-8559-cf5d-6cab-6f6b00fb410e@intel.com>
Date: Thu, 9 Sep 2021 15:28:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:303:b8::15) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR03CA0190.namprd03.prod.outlook.com (2603:10b6:303:b8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Thu, 9 Sep 2021 22:28:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 895bd3b7-eb4f-4136-d926-08d973e1353e
X-MS-TrafficTypeDiagnostic: PH0PR11MB5644:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56447DF746298D391889F482BDD59@PH0PR11MB5644.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aVz6+U1OR6buUShfEJ3xi31O5fuf0+xETcN6vJdX1OtL7MY5+3GmDaJsv3oFSO7srMjLjS87lUxKDpF0PoKf0XB7nDGBtidalCacUhteb38b/xtEcwTxm74mUCw75EXv3YyR20iDFNwKF1t4FREQb9S/XcdNXKgVw2+oVNTaIiynQq2VUwtqzcjooWh9zr8fEKxZ1Vcwwsg2xnv5GpYrLiA4jDkeTgUFUag80mXAc+b2FTA2coBT7bL1u3CgIDOjT6r16JpjHI2QDrNs3N2d8weGhJHvlWLX8qi2rCWOPtFS5sClFe9d83Wm0i2cMJ1mdRjxQQcRQHRRHZ80z4YF0My8oL0kfb4VsbxKgvzttEuJ2q1LPNj7PkVn7p48w4bWpb5eYA6ZePalmqL65U0uP34byqXWxMoGwvwqdsINuqMfSvyrn0I4H/6vkwbCJVgbiqeH4XZsscdsXClxn+pzGFgudCBRCoPd7AppguQXnBnCNwU6LDAXxH9flc1EUUY/Kbz0L1EikQZp+nZXFSl3mqnsVZk6cbILCAlFw4UTHOMLyHA4bxQbgF7gdK1KnvX60kqR0uo59yp+y6BzElW9SO9hAvII3L5Ppj3LsWZN/poDGai9RArvCLFqKGTjLeivEgnkot3vbPzd0W1K91JQQrLfnbSioSgTaXwxP2tTYVHzVRi2qQ1mmCmnfmCsd6rTKAgJ2Naw6+pL8M5Ud5adIzdh2ntrjKBhqSRXhK2UV7dgpk6ENk8X2YJeFT3lQMxMDGEG/TJ1w/mGNPpMlOG/SA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(83380400001)(316002)(956004)(31696002)(5660300002)(86362001)(8936002)(66556008)(66476007)(2616005)(4326008)(16576012)(53546011)(8676002)(66946007)(31686004)(107886003)(36756003)(186003)(26005)(30864003)(6486002)(2906002)(38100700002)(6666004)(478600001)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmRpNVlGZzZiRUV6bmVTbkI0QXBuN1VEU2Y1cTJyVEx6RjVES3NVMUh5OWcz?=
 =?utf-8?B?LzFqaHBJU2tER200T3FqYWVGL1NoblViUmxUdFpCRzR5OWczblZGNEoreUVX?=
 =?utf-8?B?ZHp3eEE5blpIbS9qaEFpL09rTm9ZblNHNFA2dE56NDBkTEc0VlpWU0FDaVdi?=
 =?utf-8?B?aVpDNDQ1ek5OaFdEblJEQkQ4L1NTWGk5Ymp5dWxSdlRINWRTVHVpd3B2dWRu?=
 =?utf-8?B?MUQvZVRrZEhqS012ZkhmU0QyMmZnOHhtM0ZMK2ZSdGZUVVZrajZmV1JUL3dQ?=
 =?utf-8?B?a1J2TFlnK3FPTXR3a051MkpzUFVJV0hrWWFWY29TMFJqUDdUWE9KOUZ3cEM0?=
 =?utf-8?B?dVlwWU9STCsvaVk0blZsSXpqaXh4VU92cFgzcU9MRjJnT1RlM2xHblg2aE1H?=
 =?utf-8?B?QlZZVi84emwxcFZYclgvejRQb1lybnJCSStySG4xRG9KeERPYk5pY2ZGZitx?=
 =?utf-8?B?UGxjS0J0QjdxTEpjSktPU1dhREp5UUh3M0crTmhmYm01UEsxcU82dTFDQlRR?=
 =?utf-8?B?a01PRFIydEErR3pBK3k3dlhacExXK0VNckdvbGFDcm5UWnVmR1FJK0dOWENx?=
 =?utf-8?B?bFdYNjIvUE5wbzRtR3E1djdFZW9vYW5hOHQvYXA0RjVqcGVPcmN0NmVDa0wy?=
 =?utf-8?B?Zkc4TDZvL3R1WTV5RjQ4UTlxU1pYWFB5bTRsb2E0S1BRQ0ZQcE13M0s3bHh3?=
 =?utf-8?B?M3Z3M1ZtR0JNcnlLOEh3d05sbURJOGovNnRoMWFUTlBabGJqbDZLdzM1a1FX?=
 =?utf-8?B?ZlZlbFkyaU15SHJGc1NlUWZKUUJ3L2RKWnFENGVoV09YeTV4eENQaGF5RVJE?=
 =?utf-8?B?WEdZckdpMFMrWkd5SWdwemRMUnFRZndQOE9VZHlUbm42bTN0aXNzT3l0RzlV?=
 =?utf-8?B?VU9OZDI1dC9GQmlQcE5zMDJBOEFBSUhkS0FDdVB6UFJnVjIzUFRXUktnUFVR?=
 =?utf-8?B?RHlrSW5lZHdMOG1yTHNSMnlERnBpSFpUQ2hXMnNHK1NnOWVEakxBekwzQ1dN?=
 =?utf-8?B?a0VkS2k4cG9NKzVHbURuWHYxOGMxQ1I1bExSOHlQSU5YcmFUV2JPeEZRWHFx?=
 =?utf-8?B?eVU4K3pjOHBZdFdqaVFRd1R4TzhKR25USHBLc2c5NjQxdXpHRSs0WXJXZTVD?=
 =?utf-8?B?K1ZXWFpwNkVBQ0pBckhVd1NzVjdFMFBwK2hIU24vekxWVng0OGxEbmlZRXpt?=
 =?utf-8?B?alc3TEYwVUNZLzJ2RWtBYlRXUVBxMC9BQmw3TVNOU241TVdVbXFqR3dHb0ta?=
 =?utf-8?B?eGRObXRLQWptcVFjanU4aXRWZWx6S1VXczNsNVNsWVdMZTJqYVNtbHRiSXR5?=
 =?utf-8?B?THdyMnNzUWxnWXNOWVBadjJRaTNNNjRwUDRzaVVSRFZKMUtOb21rbDMrbGFi?=
 =?utf-8?B?T21kaElMTWJFRkZuUWJkVWRaWGpyZ0ZmVDR6bnQ1aWNFRXlUQUQ1Vlp0SElZ?=
 =?utf-8?B?WE1PaElMRms1cVVSRXM0V1VnemV1dG56UGkyRGN4RCtndzY1c3hUOUw5cWRO?=
 =?utf-8?B?VEdxQlNDNWtseUdXeVQrdGQ3UHZKM2V0MDJIajA2NkFkaTBoMXdReFhxUzQr?=
 =?utf-8?B?L1c0anBpL2JiYXJKVzQ3aTg2TnBvVVdWR3Y4c2lDQkR3cDJRaW52UDd6RUNX?=
 =?utf-8?B?MFprZGNRVkFGNEMybEFGTlVVaTRuRzU0a3BYYWh2R005dytocldjWFpnRFNQ?=
 =?utf-8?B?N0kvK3dCQ0ZMaWJYekhoVTIybjNweVk5dTc5RVVIVFpQRFVQZWNEaGtzcUpn?=
 =?utf-8?Q?9cZI1NWfnxWRetgcAOl483gKIqgdeO0HLQIe/xc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 895bd3b7-eb4f-4136-d926-08d973e1353e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 22:28:55.0003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ag4lZXkYDiOAt6xO6yduWiOzOOg8/HifLR34bd5Q1KaDgmdOLTeS8RgWEzChequlFvKHRC1SjAVEU5SvIlY7c1vqW+E5Ej0VphlX17BIEZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5644
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
> Taking a PM reference to prevent intel_gt_wait_for_idle from short
> circuiting while a deregister context H2G is in flight.
>
> FIXME: Move locking / structure changes into different patch
This split needs to be done. It would also be helpful to have a more 
detailed explanation of what is going on and why the change is 
necessary. Is this a generic problem and the code currently in the tree 
is broken? Or is it something specific to parallel submission and isn't 
actually a problem until later in the series?

John.

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  13 +-
>   drivers/gpu/drm/i915/gt/intel_engine_pm.h     |   5 +
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h         |  13 ++
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  46 ++--
>   .../gpu/drm/i915/gt/uc/intel_guc_debugfs.c    |  13 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 212 +++++++++++-------
>   8 files changed, 199 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index adfe49b53b1b..c8595da64ad8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -399,6 +399,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	ce->guc_id.id = GUC_INVALID_LRC_ID;
>   	INIT_LIST_HEAD(&ce->guc_id.link);
>   
> +	INIT_LIST_HEAD(&ce->destroyed_link);
> +
>   	/*
>   	 * Initialize fence to be complete as this is expected to be complete
>   	 * unless there is a pending schedule disable outstanding.
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 80bbdc7810f6..fd338a30617e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -190,22 +190,29 @@ struct intel_context {
>   		/**
>   		 * @id: unique handle which is used to communicate information
>   		 * with the GuC about this context, protected by
> -		 * guc->contexts_lock
> +		 * guc->submission_state.lock
>   		 */
>   		u16 id;
>   		/**
>   		 * @ref: the number of references to the guc_id, when
>   		 * transitioning in and out of zero protected by
> -		 * guc->contexts_lock
> +		 * guc->submission_state.lock
>   		 */
>   		atomic_t ref;
>   		/**
>   		 * @link: in guc->guc_id_list when the guc_id has no refs but is
> -		 * still valid, protected by guc->contexts_lock
> +		 * still valid, protected by guc->submission_state.lock
>   		 */
>   		struct list_head link;
>   	} guc_id;
>   
> +	/**
> +	 * @destroyed_link: link in guc->submission_state.destroyed_contexts, in
> +	 * list when context is pending to be destroyed (deregistered with the
> +	 * GuC), protected by guc->submission_state.lock
> +	 */
> +	struct list_head destroyed_link;
> +
>   #ifdef CONFIG_DRM_I915_SELFTEST
>   	/**
>   	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> index 70ea46d6cfb0..17a5028ea177 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> @@ -16,6 +16,11 @@ intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
>   	return intel_wakeref_is_active(&engine->wakeref);
>   }
>   
> +static inline void __intel_engine_pm_get(struct intel_engine_cs *engine)
> +{
> +	__intel_wakeref_get(&engine->wakeref);
> +}
> +
>   static inline void intel_engine_pm_get(struct intel_engine_cs *engine)
>   {
>   	intel_wakeref_get(&engine->wakeref);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index d0588d8aaa44..a17bf0d4592b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -41,6 +41,19 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
>   	intel_wakeref_put_async(&gt->wakeref);
>   }
>   
> +#define with_intel_gt_pm(gt, tmp) \
> +	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
> +	     intel_gt_pm_put(gt), tmp = 0)
> +#define with_intel_gt_pm_async(gt, tmp) \
> +	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
> +	     intel_gt_pm_put_async(gt), tmp = 0)
> +#define with_intel_gt_pm_if_awake(gt, tmp) \
> +	for (tmp = intel_gt_pm_get_if_awake(gt); tmp; \
> +	     intel_gt_pm_put(gt), tmp = 0)
> +#define with_intel_gt_pm_if_awake_async(gt, tmp) \
> +	for (tmp = intel_gt_pm_get_if_awake(gt); tmp; \
> +	     intel_gt_pm_put_async(gt), tmp = 0)
> +
>   static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
>   {
>   	return intel_wakeref_wait_for_idle(&gt->wakeref);
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
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 6fd2719d1b75..7358883f1540 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -53,21 +53,37 @@ struct intel_guc {
>   		void (*disable)(struct intel_guc *guc);
>   	} interrupts;
>   
> -	/**
> -	 * @contexts_lock: protects guc_ids, guc_id_list, ce->guc_id.id, and
> -	 * ce->guc_id.ref when transitioning in and out of zero
> -	 */
> -	spinlock_t contexts_lock;
> -	/** @guc_ids: used to allocate new guc_ids */
> -	struct ida guc_ids;
> -	/** @num_guc_ids: number of guc_ids that can be used */
> -	u32 num_guc_ids;
> -	/** @max_guc_ids: max number of guc_ids that can be used */
> -	u32 max_guc_ids;
> -	/**
> -	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
> -	 */
> -	struct list_head guc_id_list;
> +	struct {
> +		/**
> +		 * @lock: protects everything in submission_state, ce->guc_id,
> +		 * and ce->destroyed_link
> +		 */
> +		spinlock_t lock;
> +		/**
> +		 * @guc_ids: used to allocate new guc_ids
> +		 */
> +		struct ida guc_ids;
> +		/** @num_guc_ids: number of guc_ids that can be used */
> +		u32 num_guc_ids;
> +		/** @max_guc_ids: max number of guc_ids that can be used */
> +		u32 max_guc_ids;
> +		/**
> +		 * @guc_id_list: list of intel_context with valid guc_ids but no
> +		 * refs
> +		 */
> +		struct list_head guc_id_list;
> +		/**
> +		 * @destroyed_contexts: list of contexts waiting to be destroyed
> +		 * (deregistered with the GuC)
> +		 */
> +		struct list_head destroyed_contexts;
> +		/**
> +		 * @destroyed_worker: worker to deregister contexts, need as we
> +		 * need to take a GT PM reference and can't from destroy
> +		 * function as it might be in an atomic context (no sleeping)
> +		 */
> +		struct work_struct destroyed_worker;
> +	} submission_state;
>   
>   	bool submission_supported;
>   	bool submission_selected;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> index b88d343ee432..27655460ee84 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_debugfs.c
> @@ -78,7 +78,7 @@ static int guc_num_id_get(void *data, u64 *val)
>   	if (!intel_guc_submission_is_used(guc))
>   		return -ENODEV;
>   
> -	*val = guc->num_guc_ids;
> +	*val = guc->submission_state.num_guc_ids;
>   
>   	return 0;
>   }
> @@ -86,16 +86,21 @@ static int guc_num_id_get(void *data, u64 *val)
>   static int guc_num_id_set(void *data, u64 val)
>   {
>   	struct intel_guc *guc = data;
> +	unsigned long flags;
>   
>   	if (!intel_guc_submission_is_used(guc))
>   		return -ENODEV;
>   
> -	if (val > guc->max_guc_ids)
> -		val = guc->max_guc_ids;
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +
> +	if (val > guc->submission_state.max_guc_ids)
> +		val = guc->submission_state.max_guc_ids;
>   	else if (val < 256)
>   		val = 256;
>   
> -	guc->num_guc_ids = val;
> +	guc->submission_state.num_guc_ids = val;
> +
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 68742b612692..f835e06e5f9f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -86,9 +86,9 @@
>    * submitting at a time. Currently only 1 sched_engine used for all of GuC
>    * submission but that could change in the future.
>    *
> - * guc->contexts_lock
> - * Protects guc_id allocation. Global lock i.e. Only 1 context that uses GuC
> - * submission can hold this at a time.
> + * guc->submission_state.lock
> + * Global lock for GuC submission state. Protects guc_ids and destroyed contexts
> + * list.
>    *
>    * ce->guc_state.lock
>    * Protects everything under ce->guc_state. Ensures that a context is in the
> @@ -100,7 +100,7 @@
>    *
>    * Lock ordering rules:
>    * sched_engine->lock -> ce->guc_state.lock
> - * guc->contexts_lock -> ce->guc_state.lock
> + * guc->submission_state.lock -> ce->guc_state.lock
>    *
>    * Reset races:
>    * When a GPU full reset is triggered it is assumed that some G2H responses to
> @@ -344,7 +344,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>   {
>   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
>   
> -	GEM_BUG_ON(index >= guc->max_guc_ids);
> +	GEM_BUG_ON(index >= guc->submission_state.max_guc_ids);
>   
>   	return &base[index];
>   }
> @@ -353,7 +353,7 @@ static struct intel_context *__get_context(struct intel_guc *guc, u32 id)
>   {
>   	struct intel_context *ce = xa_load(&guc->context_lookup, id);
>   
> -	GEM_BUG_ON(id >= guc->max_guc_ids);
> +	GEM_BUG_ON(id >= guc->submission_state.max_guc_ids);
>   
>   	return ce;
>   }
> @@ -363,7 +363,8 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
>   	u32 size;
>   	int ret;
>   
> -	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) * guc->max_guc_ids);
> +	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
> +			  guc->submission_state.max_guc_ids);
>   	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
>   					     (void **)&guc->lrc_desc_pool_vaddr);
>   	if (ret)
> @@ -711,6 +712,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   			if (deregister)
>   				guc_signal_context_fence(ce);
>   			if (destroyed) {
> +				intel_gt_pm_put_async(guc_to_gt(guc));
>   				release_guc_id(guc, ce);
>   				__guc_context_destroy(ce);
>   			}
> @@ -789,6 +791,8 @@ static void guc_flush_submissions(struct intel_guc *guc)
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> +static void guc_flush_destroyed_contexts(struct intel_guc *guc);
> +
>   void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   {
>   	if (unlikely(!guc_submission_initialized(guc))) {
> @@ -805,6 +809,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
>   
>   	flush_work(&guc->ct.requests.worker);
> +	guc_flush_destroyed_contexts(guc);
>   
>   	scrub_guc_desc_for_outstanding_g2h(guc);
>   }
> @@ -1102,6 +1107,8 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
>   	intel_gt_unpark_heartbeats(guc_to_gt(guc));
>   }
>   
> +static void destroyed_worker_func(struct work_struct *w);
> +
>   /*
>    * Set up the memory resources to be shared with the GuC (via the GGTT)
>    * at firmware loading time.
> @@ -1124,9 +1131,11 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   
>   	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
>   
> -	spin_lock_init(&guc->contexts_lock);
> -	INIT_LIST_HEAD(&guc->guc_id_list);
> -	ida_init(&guc->guc_ids);
> +	spin_lock_init(&guc->submission_state.lock);
> +	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
> +	ida_init(&guc->submission_state.guc_ids);
> +	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> +	INIT_WORK(&guc->submission_state.destroyed_worker, destroyed_worker_func);
>   
>   	return 0;
>   }
> @@ -1137,6 +1146,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   		return;
>   
>   	guc_lrc_desc_pool_destroy(guc);
> +	guc_flush_destroyed_contexts(guc);
>   	i915_sched_engine_put(guc->sched_engine);
>   }
>   
> @@ -1191,15 +1201,16 @@ static void guc_submit_request(struct i915_request *rq)
>   
>   static int new_guc_id(struct intel_guc *guc)
>   {
> -	return ida_simple_get(&guc->guc_ids, 0,
> -			      guc->num_guc_ids, GFP_KERNEL |
> +	return ida_simple_get(&guc->submission_state.guc_ids, 0,
> +			      guc->submission_state.num_guc_ids, GFP_KERNEL |
>   			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>   }
>   
>   static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
>   	if (!context_guc_id_invalid(ce)) {
> -		ida_simple_remove(&guc->guc_ids, ce->guc_id.id);
> +		ida_simple_remove(&guc->submission_state.guc_ids,
> +				  ce->guc_id.id);
>   		reset_lrc_desc(guc, ce->guc_id.id);
>   		set_context_guc_id_invalid(ce);
>   	}
> @@ -1211,9 +1222,9 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   	__release_guc_id(guc, ce);
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
>   static int steal_guc_id(struct intel_guc *guc)
> @@ -1221,10 +1232,10 @@ static int steal_guc_id(struct intel_guc *guc)
>   	struct intel_context *ce;
>   	int guc_id;
>   
> -	lockdep_assert_held(&guc->contexts_lock);
> +	lockdep_assert_held(&guc->submission_state.lock);
>   
> -	if (!list_empty(&guc->guc_id_list)) {
> -		ce = list_first_entry(&guc->guc_id_list,
> +	if (!list_empty(&guc->submission_state.guc_id_list)) {
> +		ce = list_first_entry(&guc->submission_state.guc_id_list,
>   				      struct intel_context,
>   				      guc_id.link);
>   
> @@ -1249,7 +1260,7 @@ static int assign_guc_id(struct intel_guc *guc, u16 *out)
>   {
>   	int ret;
>   
> -	lockdep_assert_held(&guc->contexts_lock);
> +	lockdep_assert_held(&guc->submission_state.lock);
>   
>   	ret = new_guc_id(guc);
>   	if (unlikely(ret < 0)) {
> @@ -1271,7 +1282,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>   
>   try_again:
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   
>   	might_lock(&ce->guc_state.lock);
>   
> @@ -1286,7 +1297,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	atomic_inc(&ce->guc_id.ref);
>   
>   out_unlock:
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   
>   	/*
>   	 * -EAGAIN indicates no guc_id are available, let's retire any
> @@ -1322,11 +1333,12 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	if (unlikely(context_guc_id_invalid(ce)))
>   		return;
>   
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   	if (!context_guc_id_invalid(ce) && list_empty(&ce->guc_id.link) &&
>   	    !atomic_read(&ce->guc_id.ref))
> -		list_add_tail(&ce->guc_id.link, &guc->guc_id_list);
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +		list_add_tail(&ce->guc_id.link,
> +			      &guc->submission_state.guc_id_list);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
>   static int __guc_action_register_context(struct intel_guc *guc,
> @@ -1841,11 +1853,30 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   static void guc_lrc_desc_unpin(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	unsigned long flags;
> +	bool disabled;
>   
> +	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
>   	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
>   	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
>   	GEM_BUG_ON(context_enabled(ce));
>   
> +	/* Seal race with Reset */
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	disabled = submission_disabled(guc);
> +	if (likely(!disabled)) {
> +		__intel_gt_pm_get(gt);
> +		set_context_destroyed(ce);
> +		clr_context_registered(ce);
> +	}
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	if (unlikely(disabled)) {
> +		release_guc_id(guc, ce);
> +		__guc_context_destroy(ce);
> +		return;
> +	}
> +
>   	deregister_context(ce, ce->guc_id.id, true);
>   }
>   
> @@ -1873,78 +1904,88 @@ static void __guc_context_destroy(struct intel_context *ce)
>   	}
>   }
>   
> +static void guc_flush_destroyed_contexts(struct intel_guc *guc)
> +{
> +	struct intel_context *ce, *cn;
> +	unsigned long flags;
> +
> +	GEM_BUG_ON(!submission_disabled(guc) &&
> +		   guc_submission_initialized(guc));
> +
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	list_for_each_entry_safe(ce, cn,
> +				 &guc->submission_state.destroyed_contexts,
> +				 destroyed_link) {
> +		list_del_init(&ce->destroyed_link);
> +		__release_guc_id(guc, ce);
> +		__guc_context_destroy(ce);
> +	}
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +}
> +
> +static void deregister_destroyed_contexts(struct intel_guc *guc)
> +{
> +	struct intel_context *ce, *cn;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	list_for_each_entry_safe(ce, cn,
> +				 &guc->submission_state.destroyed_contexts,
> +				 destroyed_link) {
> +		list_del_init(&ce->destroyed_link);
> +		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +		guc_lrc_desc_unpin(ce);
> +		spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	}
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +}
> +
> +static void destroyed_worker_func(struct work_struct *w)
> +{
> +	struct intel_guc *guc = container_of(w, struct intel_guc,
> +					     submission_state.destroyed_worker);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	int tmp;
> +
> +	with_intel_gt_pm(gt, tmp)
> +		deregister_destroyed_contexts(guc);
> +}
> +
>   static void guc_context_destroy(struct kref *kref)
>   {
>   	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> -	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
>   	struct intel_guc *guc = ce_to_guc(ce);
> -	intel_wakeref_t wakeref;
>   	unsigned long flags;
> -	bool disabled;
> +	bool destroy;
>   
>   	/*
>   	 * If the guc_id is invalid this context has been stolen and we can free
>   	 * it immediately. Also can be freed immediately if the context is not
>   	 * registered with the GuC or the GuC is in the middle of a reset.
>   	 */
> -	if (context_guc_id_invalid(ce)) {
> -		__guc_context_destroy(ce);
> -		return;
> -	} else if (submission_disabled(guc) ||
> -		   !lrc_desc_registered(guc, ce->guc_id.id)) {
> -		release_guc_id(guc, ce);
> -		__guc_context_destroy(ce);
> -		return;
> -	}
> -
> -	/*
> -	 * We have to acquire the context spinlock and check guc_id again, if it
> -	 * is valid it hasn't been stolen and needs to be deregistered. We
> -	 * delete this context from the list of unpinned guc_id available to
> -	 * steal to seal a race with guc_lrc_desc_pin(). When the G2H CTB
> -	 * returns indicating this context has been deregistered the guc_id is
> -	 * returned to the pool of available guc_id.
> -	 */
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> -	if (context_guc_id_invalid(ce)) {
> -		spin_unlock_irqrestore(&guc->contexts_lock, flags);
> -		__guc_context_destroy(ce);
> -		return;
> -	}
> -
> -	if (!list_empty(&ce->guc_id.link))
> -		list_del_init(&ce->guc_id.link);
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> -
> -	/* Seal race with Reset */
> -	spin_lock_irqsave(&ce->guc_state.lock, flags);
> -	disabled = submission_disabled(guc);
> -	if (likely(!disabled)) {
> -		set_context_destroyed(ce);
> -		clr_context_registered(ce);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	destroy = submission_disabled(guc) || context_guc_id_invalid(ce) ||
> +		!lrc_desc_registered(guc, ce->guc_id.id);
> +	if (likely(!destroy)) {
> +		if (!list_empty(&ce->guc_id.link))
> +			list_del_init(&ce->guc_id.link);
> +		list_add_tail(&ce->destroyed_link,
> +			      &guc->submission_state.destroyed_contexts);
> +	} else {
> +		__release_guc_id(guc, ce);
>   	}
> -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> -	if (unlikely(disabled)) {
> -		release_guc_id(guc, ce);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +	if (unlikely(destroy)) {
>   		__guc_context_destroy(ce);
>   		return;
>   	}
>   
>   	/*
> -	 * We defer GuC context deregistration until the context is destroyed
> -	 * in order to save on CTBs. With this optimization ideally we only need
> -	 * 1 CTB to register the context during the first pin and 1 CTB to
> -	 * deregister the context when the context is destroyed. Without this
> -	 * optimization, a CTB would be needed every pin & unpin.
> -	 *
> -	 * XXX: Need to acqiure the runtime wakeref as this can be triggered
> -	 * from context_free_worker when runtime wakeref is not held.
> -	 * guc_lrc_desc_unpin requires the runtime as a GuC register is written
> -	 * in H2G CTB to deregister the context. A future patch may defer this
> -	 * H2G CTB if the runtime wakeref is zero.
> +	 * We use a worker to issue the H2G to deregister the context as we can
> +	 * take the GT PM for the first time which isn't allowed from an atomic
> +	 * context.
>   	 */
> -	with_intel_runtime_pm(runtime_pm, wakeref)
> -		guc_lrc_desc_unpin(ce);
> +	queue_work(system_unbound_wq, &guc->submission_state.destroyed_worker);
>   }
>   
>   static int guc_context_alloc(struct intel_context *ce)
> @@ -2703,8 +2744,8 @@ static bool __guc_submission_selected(struct intel_guc *guc)
>   
>   void intel_guc_submission_init_early(struct intel_guc *guc)
>   {
> -	guc->max_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
> -	guc->num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
> +	guc->submission_state.max_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
> +	guc->submission_state.num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
>   	guc->submission_supported = __guc_submission_supported(guc);
>   	guc->submission_selected = __guc_submission_selected(guc);
>   }
> @@ -2714,10 +2755,10 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
>   {
>   	struct intel_context *ce;
>   
> -	if (unlikely(desc_idx >= guc->max_guc_ids)) {
> +	if (unlikely(desc_idx >= guc->submission_state.max_guc_ids)) {
>   		drm_err(&guc_to_gt(guc)->i915->drm,
>   			"Invalid desc_idx %u, max %u",
> -			desc_idx, guc->max_guc_ids);
> +			desc_idx, guc->submission_state.max_guc_ids);
>   		return NULL;
>   	}
>   
> @@ -2771,6 +2812,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   		intel_context_put(ce);
>   	} else if (context_destroyed(ce)) {
>   		/* Context has been destroyed */
> +		intel_gt_pm_put_async(guc_to_gt(guc));
>   		release_guc_id(guc, ce);
>   		__guc_context_destroy(ce);
>   	}
> @@ -3065,8 +3107,10 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>   
>   	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
>   		   atomic_read(&guc->outstanding_submission_g2h));
> -	drm_printf(p, "GuC Number GuC IDs: %u\n", guc->num_guc_ids);
> -	drm_printf(p, "GuC Max GuC IDs: %u\n", guc->max_guc_ids);
> +	drm_printf(p, "GuC Number GuC IDs: %u\n",
> +		   guc->submission_state.num_guc_ids);
> +	drm_printf(p, "GuC Max GuC IDs: %u\n",
> +		   guc->submission_state.max_guc_ids);
>   	drm_printf(p, "GuC tasklet count: %u\n\n",
>   		   atomic_read(&sched_engine->tasklet.count));
>   

