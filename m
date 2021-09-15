Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5812F40CD1F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 21:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ED46E9FA;
	Wed, 15 Sep 2021 19:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D456E9FA;
 Wed, 15 Sep 2021 19:21:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="307958224"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="307958224"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 12:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="471057532"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 15 Sep 2021 12:21:42 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 12:21:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 12:21:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 15 Sep 2021 12:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gujdxPXEuxWRSIjQnvzkEfz3iSynIs8TaT7KP99tKDN4LNMbJIdkOO4glqt1cY9lYUj3NgrFREpUo9aIRMV3UdhDSVH7Lt7CKhi1ZxvmOfl+3IyEnbzjk+Kv+dIMzzFx4I6MsCE8uLHFbOnflxgtTY41D9G/K4wUVdN/pGY31Qq+e2yvY8GxMchSAUTgomSUaD9rd9bTwtltuI8HBXZvFXcikhojkfqSJqxqctcqaQRTbHIKq7e+OFK4o7M7+1lB7AzZE5ewFb2ESDgyD99/g98QUpVnmGOeX/PT42onfMOxg8xluf8qooKbVbcWnOla8pXlDi8kKIOoh/AZfrg3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=TphBbbIJ9ld2if9dmSd9+A4XCxbc1mGtQV4AlW2FOUc=;
 b=GjFx5KZdfIFWDOK8+ldrTMrti5iaRCvYbReNF8G8Iw2KcG2fI1XJ4/s/O1/m2AQTYvDl4W0vhWIbiIUOciCoQmkSC3RyVM+CmflslvXZuymXI0NW+ag7kGkZtx/Dmyy0YRuSbW9odKcDWkNK5FjeWjFonmQMs6tMr2PS4NHg5lgEkF0CV8n8o2NLe8bl7NMG/iMm3OsGh8MWN7o+jDczll+Nu4EE+4dl9dXPSe+Wy8TGD7UpbDs7RV1mZRy3OkwleTrwWhRRVQPFpGXZuBKGGrAni1WJ6jvQAAgz4e+v8iQv8geGmdGXYUPgjKe8/lPWoPum1A7wKMNtU3CWi1RTYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TphBbbIJ9ld2if9dmSd9+A4XCxbc1mGtQV4AlW2FOUc=;
 b=b+fUeF/4r5MllKppcjQ3ZDbgjwwRomAvyFvDKGX0QUA5ED5OhvX62i+m2u75sEpLRcaBLenNnW+h691s+pBLPMt6CAFkY1ZvJTMB5AeNPKK+dqxF8yPmqrkRCCMyScaqSV7Z8gr3N2u9TTGg85UlQP1GYGV3454fPT9o69v1UIU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 15 Sep
 2021 19:21:39 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 19:21:39 +0000
Subject: Re: [Intel-gfx] [PATCH 12/27] drm/i915/guc: Add multi-lrc context
 registration
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-13-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <64a5c154-1a00-820e-2b30-d95af73937d7@intel.com>
Date: Wed, 15 Sep 2021 12:21:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-13-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:303:85::18) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR04CA0163.namprd04.prod.outlook.com (2603:10b6:303:85::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 19:21:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 675dfa17-cf06-4a34-4ec1-08d9787e0add
X-MS-TrafficTypeDiagnostic: PH0PR11MB5628:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5628D6FE661BD70DD6A5D16FBDDB9@PH0PR11MB5628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8lK9BUCgRW4NDZiJvynMeRVVCgOjbJ7o4IyByiwuWvb1yay9Sk6xKpoD9O6kvM3qsdcsiBJh1+BCoFFJRiB4a3wW9Mt0rN1alytfno52k+OGITMbFU2BjlW65wANIVzWGDV3eLbZcMP84OBsohmblfbyqX2m7s/g2s2tzNNefG8Xhdx/7R1sZD0eiGLfoHfRU2kuucWPdCSRNQoy+MP2yuEQv7GUx5JUQEl2hyVepdFKiwx8NL2d3DHLWaxQGENsbNfSfmJ8hu9pI3e3TN7Vp9fEJX7CvPIyziThRgkQr53gnsSkDqLzJrN0Titu+3Azeg3BHPyDf9eDjcBH3fitwLmT41k5Lnp8FHAGVvNQxttnOPCigMDn9rybXgKxOUUYBUa7KHFVnfU3JlCvY+O8yAKqNldKTvUC5VHAlR/T9BPajQEBGL7yK4qUuSnsAMS/ivF+gu+TmXt1apOi9aWgWRoy+kPf82HjQRZXsiN7+6o4PZUedPO9BonA8Zfzl6nLvT9rB5nV5+P+IzRVemsiSBDJzSG77b5hmPAKqbDBzyVyNG53TLcNIk80TZ0EzVdjxuPumglIAZYdqA+bRJZRQzJkE+uQ5GVpqyEV/+xlMWKmZcoVXZd7Ycfv7hUURbG2i3lGFkO4A5uul29PL2NTH0uaKhhcbYZe/jq0DYCtvjvb+NU9XuO2C/Paee1i9n+Jq0+Ij8n3UqeF88bmCukPCyOJQbMqtX21N7AzsWWNEX8ELXuyTChOPKcHXYZV6Dy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(83380400001)(8936002)(5660300002)(478600001)(38100700002)(107886003)(66556008)(53546011)(66946007)(86362001)(8676002)(66476007)(36756003)(6666004)(2906002)(956004)(4326008)(186003)(2616005)(31686004)(6486002)(31696002)(316002)(16576012)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3FzNnp2ZGpKbll3bXRXaW1SSjZnM2dMY2RSQ3VCMTdtOHU5ajlNZjhXOUVC?=
 =?utf-8?B?S0VBM0d1c3BQa3BwSmMvQTJ3LzZINForRnlwSjZRQUh6Y0JWMk1OSUJHdXhq?=
 =?utf-8?B?U3pBYUR1byt1eVF6blVSM0d5elJJZVlJK1dVeVRBbnpUdG9LMVpxZXBGeFFI?=
 =?utf-8?B?RnVFOTZJOURSTTlNTUFRZm5tL1ljL2NiNkhtWUFWaVJESElJYXhIT2kyV0xW?=
 =?utf-8?B?SUNwb3RkcEFxaDYwbjlmR3ZNNzZ6TjhUdnlUR2lGZWVJejY4N2VndURHTXRr?=
 =?utf-8?B?RlgzTzNGOG1nb2loQUVYejNGWjliOHFlb2FCVGJ3eVRkSS90YmRZS2Q4eGJM?=
 =?utf-8?B?TFEvRzJjZWh5cFo5bUhyQ2ZjTkpycnBrSStXQndHQ1VNTUF2alFlenkzNU9a?=
 =?utf-8?B?ZDJ4SzlQckRhNGVNWTZmczYzZ3d0bW1XeTF1YVh4K3pTd1dUclU4ODJ1YlpG?=
 =?utf-8?B?ak5Ma1R4elFDYk5ZdENiM1VIa2dheVcxZklZa2pZRGRneTkycGJxbnNMRFVs?=
 =?utf-8?B?TllVT295a2tSTUxXVVZWK3hxWEY2Y3VCTVFoME9LS1YxbHBWQTZCOGd6d1BN?=
 =?utf-8?B?azVLTUN4UUxhRXlSelhoaEJhL0VYYy9XaWlyeXNsZ043UTdlekloMUxlaTdx?=
 =?utf-8?B?c25sY2toTnpKVWo5b3R5Q2NsNFB3NkdQV1BydU55Z0dsZmxneGJYSEw2dldq?=
 =?utf-8?B?THhtQ0VtN0RZUW42NTI5YnRteGJzRGhMMHl2WFlHNFVoZElmY0tGOFhuTjB1?=
 =?utf-8?B?a0FKVGJJeFd6SU1QWFhxRjNjL1RCdzNiSDZvNldCUGJaQ0VJSHRNOXlIbUsv?=
 =?utf-8?B?ZEZvQ21qM05qUE9QM0tnMFEzbk5BUE53NDNtSTg0MUZsWWh4TTcxeE9WL3VD?=
 =?utf-8?B?TStmYkcybnNRemVHKzE1MElMYUkxSU83N1JuNDlzVUNzT0dTZllqWThIOVYx?=
 =?utf-8?B?cDNBMVorZ3QydWlLSU5SOE9PSXpBOWk0cmthT0hCeGp1U2xXRC8xME5HVk40?=
 =?utf-8?B?ZnVQamU5OTJqVzFEQWhKRmpzbmFXaWpMeGRXZEFWdzh3MFFGdWhEY2lCQm5O?=
 =?utf-8?B?a3Y4UStQL0h2eHZMa1d4ZllUY2kvN0NnRHNlRmNNd0hlNVBPSk9rS3IrM2NV?=
 =?utf-8?B?clpiUGJXNkRiYkNtOWhVWXBmUGRWZUJLVVg1VlJCNHNvRktaUjhoUnc3b2Ro?=
 =?utf-8?B?OURuTVhzd2NjRHNWV2ViTGp5T0RyMTJOMDAxTTM2aEYwbHRnOEpobEM0NXlQ?=
 =?utf-8?B?cmh6VWhWUHl0cXEvcDZETE1QMlVHcUx3UVBzRHRnYUxBS1IwNFJLbG5nanlk?=
 =?utf-8?B?dWJ0Qnk4TnU2QnRTRVVxRUNGMEdQdGovR0VqLzlWRlB3THIyVzh2WlJPN1Ix?=
 =?utf-8?B?WEJ2b0t2OUFQQ1lqRkM5REFDUjBCQjF0R01jcGdMR1RYNzlLNm1xUnhGV3VY?=
 =?utf-8?B?K05ZOGk5ajI5K2laY2llbzRwVHJpbi9rS2V1bStrWFZwTHNrK3RvNHJQbHFk?=
 =?utf-8?B?SkNkdDZESitZSDljQkEyOWNWWjE1L0lSS1VkUkJnVUU2UkF0bDFLUUJPQXFm?=
 =?utf-8?B?Tit6K1NhZ0xJTFh1ZXJqdHhwOFlZYXhNa281bjY4c29VSmZENTcxVXZOUzJx?=
 =?utf-8?B?eVJQUTdwQ21jMERBT2prSi85MHVkaGYyRCtJSVBUdTQ0WklsKzhCT2w0Nk9a?=
 =?utf-8?B?em8wUkhzUmNvN2ltdVpxV0RwcldGY1lNV21ieFAzTVE0Um1tT3k3SUVIVEhp?=
 =?utf-8?Q?DqvNLVVm3xeVr3dloFzjMEntXm59L2u6eJd/Sir?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 675dfa17-cf06-4a34-4ec1-08d9787e0add
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 19:21:39.6120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JQ/PWSgqhOhHok5hls9x0BtH6vIgzDiBV+LZJaXTk24kl9v+gF7pPFJa65l0d7cOjdbmve4bekv3EHqhCn61Is2F0ubFISB1NermNuKFfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5628
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
> Add multi-lrc context registration H2G. In addition a workqueue and
> process descriptor are setup during multi-lrc context registration as
> these data structures are needed for multi-lrc submission.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  12 ++
>   drivers/gpu/drm/i915/gt/intel_lrc.c           |   5 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 +-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 109 +++++++++++++++++-
>   4 files changed, 126 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 0fafc178cf2c..6f567ebeb039 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -232,8 +232,20 @@ struct intel_context {
>   		/** @parent: pointer to parent if child */
>   		struct intel_context *parent;
>   
> +
> +		/** @guc_wqi_head: head pointer in work queue */
> +		u16 guc_wqi_head;
> +		/** @guc_wqi_tail: tail pointer in work queue */
> +		u16 guc_wqi_tail;
> +
These should be in the 'guc_state' sub-struct? Would be good to keep all 
GuC specific content in one self-contained struct. Especially given the 
other child/parent fields are no going to be guc_ prefixed any more.


>   		/** @guc_number_children: number of children if parent */
>   		u8 guc_number_children;
> +
> +		/**
> +		 * @parent_page: page in context used by parent for work queue,
Maybe 'page in context record'? Otherwise, exactly what 'context' is 
meant here? It isn't the 'struct intel_context'. The contetx record is 
saved as 'ce->state' / 'ce->lrc_reg_state', yes? Is it possible to link 
to either of those field? Probably not given that they don't appear to 
have any kerneldoc description :(. Maybe add that in too :).

> +		 * work queue descriptor
Later on, it is described as 'process descriptor and work queue'. It 
would be good to be consistent.

> +		 */
> +		u8 parent_page;
>   	};
>   
>   #ifdef CONFIG_DRM_I915_SELFTEST
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index bb4af4977920..0ddbad4e062a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -861,6 +861,11 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>   		context_size += PAGE_SIZE;
>   	}
>   
> +	if (intel_context_is_parent(ce)) {
> +		ce->parent_page = context_size / PAGE_SIZE;
> +		context_size += PAGE_SIZE;
> +	}
> +
>   	obj = i915_gem_object_create_lmem(engine->i915, context_size, 0);
>   	if (IS_ERR(obj))
>   		obj = i915_gem_object_create_shmem(engine->i915, context_size);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> index fa4be13c8854..0e600a3b8f1e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> @@ -52,7 +52,7 @@
>   
>   #define GUC_DOORBELL_INVALID		256
>   
> -#define GUC_WQ_SIZE			(PAGE_SIZE * 2)
> +#define GUC_WQ_SIZE			(PAGE_SIZE / 2)
Is this size actually dictated by the GuC API? Or is it just a driver 
level decision? If the latter, shouldn't this be below instead?

>   
>   /* Work queue item header definitions */
>   #define WQ_STATUS_ACTIVE		1
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 14b24298cdd7..dbcb9ab28a9a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -340,6 +340,39 @@ static struct i915_priolist *to_priolist(struct rb_node *rb)
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
> +#define WQ_OFFSET	(PAGE_SIZE / 2)
Can this not be derived from GUC_WQ_SIZE given that the two are 
fundamentally linked? E.g. '#define WQ_OFFSET (PAGE_SIZE - 
GUC_WQ_SIZE)'? And maybe have a '#define WQ_TOTAL_SIZE PAGE_SIZE' and 
use that in all of WQ_OFFSET, GUC_WQ_SIZE and the allocation itself in 
intel_lrc.c?

Also, the process descriptor is actually an array of descriptors sized 
by the number of children? Or am I misunderstanding the code below? In 
so, shouldn't there be a 'COMPILE_BUG_ON((MAX_ENGINE_INSTANCE * 
sizeof(descriptor)) < (WQ_DESC_SIZE)' where WQ_DESC_SIZE is 
WQ_TOTAL_SIZE - WQ_SIZE?

> +static u32 __get_process_desc_offset(struct intel_context *ce)
> +{
> +	GEM_BUG_ON(!ce->parent_page);
> +
> +	return ce->parent_page * PAGE_SIZE;
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
> +	return (struct guc_process_desc *)
> +		(ce->lrc_reg_state +
> +		 ((__get_process_desc_offset(ce) -
> +		   LRC_STATE_OFFSET) / sizeof(u32)));
Where did the LRC_STATE_OFFSET come from? Is that built in to the 
lrg_reg_state pointer itself? That needs to be documented somewhere.

> +}
> +
>   static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
>   {
>   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> @@ -1342,6 +1375,30 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
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
> +	GEM_BUG_ON(ce->guc_number_children > MAX_ENGINE_INSTANCE);
> +
> +	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
> +	action[len++] = guc_id;
> +	action[len++] = ce->guc_number_children + 1;
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
> @@ -1364,9 +1421,15 @@ static int register_context(struct intel_context *ce, bool loop)
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
> @@ -1396,6 +1459,7 @@ static int deregister_context(struct intel_context *ce, u32 guc_id, bool loop)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_deregister(ce);
>   
>   	return __guc_action_deregister_context(guc, guc_id, loop);
> @@ -1423,6 +1487,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	struct guc_lrc_desc *desc;
>   	bool context_registered;
>   	intel_wakeref_t wakeref;
> +	struct intel_context *child;
>   	int ret = 0;
>   
>   	GEM_BUG_ON(!engine->mask);
> @@ -1448,6 +1513,42 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   	guc_context_policy_init(engine, desc);
>   
> +	/*
> +	 * Context is a parent, we need to register a process descriptor
> +	 * describing a work queue and register all child contexts.
Technically, this should say 'If the context is a parent'. Or just move 
it to be inside the if block.

> +	 */
> +	if (intel_context_is_parent(ce)) {
> +		struct guc_process_desc *pdesc;
> +
> +		ce->guc_wqi_tail = 0;
> +		ce->guc_wqi_head = 0;
> +
> +		desc->process_desc = i915_ggtt_offset(ce->state) +
> +			__get_process_desc_offset(ce);
> +		desc->wq_addr = i915_ggtt_offset(ce->state) +
> +			__get_wq_offset(ce);
> +		desc->wq_size = GUC_WQ_SIZE;
> +
> +		pdesc = __get_process_desc(ce);
> +		memset(pdesc, 0, sizeof(*(pdesc)));
> +		pdesc->stage_id = ce->guc_id.id;
> +		pdesc->wq_base_addr = desc->wq_addr;
> +		pdesc->wq_size_bytes = desc->wq_size;
> +		pdesc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
Should this not be inherited from the ce? And same below. Or are we not 
using this priority in that way?

John.

> +		pdesc->wq_status = WQ_STATUS_ACTIVE;
> +
> +		for_each_child(ce, child) {
> +			desc = __get_lrc_desc(guc, child->guc_id.id);
> +
> +			desc->engine_class =
> +				engine_class_to_guc_class(engine->class);
> +			desc->hw_context_desc = child->lrc.lrca;
> +			desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
> +			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> +			guc_context_policy_init(engine, desc);
> +		}
> +	}
> +
>   	/*
>   	 * The context_lookup xarray is used to determine if the hardware
>   	 * context is currently registered. There are two cases in which it
> @@ -2858,6 +2959,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
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

