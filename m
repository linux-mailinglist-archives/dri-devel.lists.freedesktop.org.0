Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E293D2DA3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C79A6EAA6;
	Thu, 22 Jul 2021 20:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351006EAA4;
 Thu, 22 Jul 2021 20:26:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="209840840"
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="209840840"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 13:26:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,262,1620716400"; d="scan'208";a="659237628"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 22 Jul 2021 13:26:35 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 22 Jul 2021 13:26:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 22 Jul 2021 13:26:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 22 Jul 2021 13:26:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hV6SFj2dPkrg6ad2i0ZlMYE/8tt3uRafMtaXZi3sIg+Hqi9ZlDp0MqrJltjQ04TDPQZCdg8MLFsm/07gwznjlU57Iyg2SkzXHlCx0PhJcrAyAfiSXhipTuB4VpILF4TouGdmYsW2mK0Isdz4C+C2+6faK3vuqIRQ1IGaQZx8Wt6WKemtvvo09PcW+hbpcmEb76sgOUW1bhLBBCPIaM50Y6b9Qe1QM/NSvGo5pspoGdZxgpA3i0JoB+g00PsG+ubLCtgDHQw7qxXcOSxUThvc1HKR/iVLatJO63dVNVk6JePF9/m6WHWPnKdcqK2kxVgvqsI4EqPm2OUdRQ7QkgKOLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOPmVLdmQl/oag5/3fux5rtsvzjcPSjTgq+xEu/DwII=;
 b=oBndEBu8fybi80mBb1FlsZ8wXuV8nGFKQSa1xN16hLoSBLl27y6lv8r8Sr39wJ9is+fyzO+cC21kKjm40BvT7oOpnnVYVp3xfpbjMYmUWZg1UgSWFg0CLGWKcClB5QQTC9a+D9malc9qPnm+mZ/hqpSAUo/fGBjXlpFbe1OJ5R5R0yfC+cnMSAtjkPgdsRRLRNKLoa/azPTLnyAzik60atKmzyYK6sZuD6IqG1SRnvXNBbc4xR9RWEAM1rTWEvpBY6kzYUKzYNK2sj1V0EuLld6/XUz24+iz2FtyuLS+HAj3LL+WVa+NbHdAUoBdZ2YTKAgXExz/wEYCo+KePIlGJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOPmVLdmQl/oag5/3fux5rtsvzjcPSjTgq+xEu/DwII=;
 b=RCHYysnOKjXskSZp+dYjd5NFZwnaWfT4bZwByxNKTE1Y4PgWoce/HlKrF3N3CZo7ySggst6JLGzCZB9ZIB56nhI7fdVjFXgdFFYU99dblZvbd8DRstg1YGzMqH6CTmftVsznOOzwyj1VyA9ARjlzUpVTlOiyFF+EVLWJg/7U3hM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB4644.namprd11.prod.outlook.com (2603:10b6:5:28f::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.26; Thu, 22 Jul 2021 20:26:32 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::4017:e7ce:ef66:48d7%9]) with mapi id 15.20.4352.026; Thu, 22 Jul 2021
 20:26:32 +0000
Subject: Re: [PATCH 50/51] drm/i915/guc: Implement GuC priority management
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-51-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <c0bd8e5c-784c-18cc-d724-f676dd3546aa@intel.com>
Date: Thu, 22 Jul 2021 13:26:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-51-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::10) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:a03:33b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Thu, 22 Jul 2021 20:26:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e660a48-dbc3-4dc3-2e04-08d94d4efe78
X-MS-TrafficTypeDiagnostic: DM6PR11MB4644:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB464499284B80A58F23731D65F4E49@DM6PR11MB4644.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVUThGPURR/roHRJ4JckK4+kXXeyWGZxHFRCA41Z1Jb0BOXXxKsrLke/SmOhxfRIxUvaxSVLf2S9Xx4q6Dw0eSdD5WN5pzlnYM2CfUKF4F2/ghk/WeQII3m4x5saJ7jMbZL/qnqRyppnANxmR97l+Vtsg/Qpz5CK3UlmZ51Sr6jNWpt5rxk1j4s4o6p7qOvRNg4MXKcNNgKiwh7uS2JRTI2ZVLiEKuLvkTL64TtgjlqT8tOwuzLKKho32tADRBSM/awLRM8VlOhw8WaFupK7S+18vjHWogk9lS4mm1KCVb+ItG1zG4mRI4rhlsfZ9MCQrys8xQ0ZWKtfmFMBOcl3qMex0VeJDES1LW92JwbEzZsKhNwtviPI89TeEklnwoXdhj9YHphy+B9+KYsKGSxQhG2/vPFfHo430JdiuXZa9+87SN0q6iTVgultMZeIS3rNYmR5FKUtkc3mL/3S+z7wjQPN+muD+3SCMB79c2r8SGA01rEPHNocyPWw6DUOym0wlH4eSPfPG0z5TbO6Yc7sppQnYsJMGirzh14mVzOM+0gBYME1Wf9I9VafPIccrWj9f/NGJ26thDMocufeXa2iLIPwcCDCzyF6zjm3w0eu0H2IBntDxOw8Ka6zXxAGB5KFEJBsSMleUZJ/jnN7f9mpi1lUFsjLVFuJO6HE/t4MZizimYbX8APiFq9beX69O1PC7O9fWLBEbUf0MXlOkDfDWFeVNXu/gUK62mGui8d3Nro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(36756003)(66476007)(31686004)(30864003)(6486002)(8936002)(53546011)(26005)(66946007)(66556008)(83380400001)(4326008)(31696002)(186003)(2616005)(956004)(86362001)(5660300002)(107886003)(2906002)(8676002)(38100700002)(316002)(478600001)(450100002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWFQV2dIYWxiS3ZaRzk0akJ4akxPUFlONjlTWHpwVzBiWThNVHlaY2E3K0Q3?=
 =?utf-8?B?VFg2M25TcTB4YzN2cmZZUzZXRHBqY1cvRU9XUjJNYU1nQjNzRGxkUmFtcklG?=
 =?utf-8?B?RmZRWEU0VHg0Q1hsdzNvMGhUZGxKVjBWS0lsMCtjRlN4QXlPcFpER1VrdEpU?=
 =?utf-8?B?WTZubGZ6WUxqaURiUDZIRkg1bVlJbm9XNll4WkVudFJoTFNMSEhRTG1ybXA1?=
 =?utf-8?B?QWRlUGpUNGdQZzZWd2g0Z2kyT3Z5QmV4WEU1cGtqdnliVkZXSkVWY1M0Z3N5?=
 =?utf-8?B?R3Zpb3A5MFh0SzRla0hYSlYzMWNkc1dWVlI1SEdVQTc5Y2lMUnN0ZHQvSGJx?=
 =?utf-8?B?SERvK1NjUkpCUERvWkhVTWY2ZVVJd0c0RW1XdjNsTG1CS1lMR2RhVk4yR2JS?=
 =?utf-8?B?N1ZTcDhOendwdkZQYmV0TlFmcUwrd3RCODBOQmtmZkN5bkY5WXBSOVFOb2xY?=
 =?utf-8?B?Q0FOK3Rsa0lPN1NHZkVNWDJyN0F0d21DaVhkL050cUtjaXpMS0NHS2krUzhK?=
 =?utf-8?B?WElOQmhmdk1jbFM4QmhTbTk0WmRvVEVGMXpOYlpnekc0ZDlyZUR2SkNwamtP?=
 =?utf-8?B?enhZaXhkeWovWUFOYk5QRUhFcUQ1L0lSYk0rV0FZU2x0UWRTSUFyMEhYMjhQ?=
 =?utf-8?B?d1I3OHJTTFo1d3Q0ZG9BQis1RkpYeHREa0kzdENKLzd3b293cEVWM1NaWWhR?=
 =?utf-8?B?eWduV01Bb0ZMNy9uNEdoYnlBY1RMbUtRUkN5aHJQdmhCTUZ2UE80UVM1Sm90?=
 =?utf-8?B?MUxXRXhtR0RpZkNvZXhXUW5GL3dZMlNibDdlL3g4ZG4rRjVMQjM0SmRWZ0ZL?=
 =?utf-8?B?Vmp3SW1rSXVFQTEzaGY3VkU1OVU3azhJVkp6TEsrcjJmM0YyeTVoMHhtanJS?=
 =?utf-8?B?OHVTR21CcmF0bGp5UDZuRWlPZ21qWnpYcmF0VlpjenE1RVlCWWNpMVRjQWkx?=
 =?utf-8?B?b0ZYUDNwVHk2cytTK25VOCsvR1F6LzdrZVB4cUZCS1JWRWFFRnQrcTVJRlho?=
 =?utf-8?B?RUxOK2pGV1UzR3c0bmkwU1hjQmZjSUViZUp0K3pxZXArdVJoRUsyRUtVR3FX?=
 =?utf-8?B?M2NPQjNoSEQ2TVBqdWlBZ1E3L3ZkS2tLTjdaUldKSG41N2Y0akYyWXRxZ2g3?=
 =?utf-8?B?T3ZnS3J1UEVqYk1PSklTZHpJdDdvTGFtOWxsR2psbklJZXVTajlkWmJJS3J4?=
 =?utf-8?B?bFd3TjNzTCt5TlpDcS9Cb0lpV1c3bGMyODA5ODdHbHpsRXZrak9tZHdvL1Q2?=
 =?utf-8?B?NW1ueVdOc2FQTSsrZm1DWnJ3MTE5UXMwdUdnWFJJRjZBb0lzcUU5aUhBbXZD?=
 =?utf-8?B?dk5YcVo4NEIxWW1NV1NlSkdrT3dIWTYxZlkxRlFObk1QS29kUEFra3dJOEg5?=
 =?utf-8?B?U1ZodGg5MEY1VWk0TnFiR3Y3WjJSN1pXajRwRnc1L0hXTEtwQ0wvdzdjSU9U?=
 =?utf-8?B?SmtXQzAzNXVlQlJDS3A3WTVIVkZxYUZPdzJ6ZTdjejRkQmF1Z3V2VjdiRU95?=
 =?utf-8?B?MXgrc0JncFk5b3kySzgrbVVKUUkrNUlwenZuVlF5RVlrSnZiNHJkdkVqaFBZ?=
 =?utf-8?B?dW4wdEo1Vm5POStIdTlWT3NLaExyNWRRZnNTS3hLVEhoUVowSTBtbEpZVmZh?=
 =?utf-8?B?VVpTYnhwVDV5TFdmSWsvZTJBd3lZZVJ4bS9ob2JTeEZMWXVIcDlnRXdxUGtr?=
 =?utf-8?B?Y0MraW8zcVdLdGM5dklnTWFka0tqeDRNd0cvbmNJTkdhYjVHOVVpQk9YSlN1?=
 =?utf-8?Q?+zm8ZmM+hVLJfTgu+q9Y4Eogbby/uHeyEI5cMYp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e660a48-dbc3-4dc3-2e04-08d94d4efe78
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 20:26:32.4042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOCzlpq4M+wjc8Xfpv4Bw3z0lnY4WXe8wWcxuAlueYhieTRI2NOR1IVr/cAiOB8jzXsFTveBr2GgY4Cakx3/ER8Yiu+AONV/3VmYBqLQIBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4644
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
> Implement a simple static mapping algorithm of the i915 priority levels
> (int, -1k to 1k exposed to user) to the 4 GuC levels. Mapping is as
> follows:
>
> i915 level < 0          -> GuC low level     (3)
> i915 level == 0         -> GuC normal level  (2)
> i915 level < INT_MAX    -> GuC high level    (1)
> i915 level == INT_MAX   -> GuC highest level (0)
>
> We believe this mapping should cover the UMD use cases (3 distinct user
> levels + 1 kernel level).
>
> In addition to static mapping, a simple counter system is attached to
> each context tracking the number of requests inflight on the context at
> each level. This is needed as the GuC levels are per context while in
> the i915 levels are per request.

As a general note on this patch, IMO we could do a better job of 
integrating context-level priority with request-level prio. However, I'm 
aware that this code is going to be overhauled again for drm scheduler 
so I'm not going to comment in that direction and I'll review the result 
again once the drm scheduler patches are available.

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |   3 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +-
>   drivers/gpu/drm/i915/gt/intel_engine_user.c   |   4 +
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 207 +++++++++++++++++-
>   drivers/gpu/drm/i915/i915_request.c           |   5 +
>   drivers/gpu/drm/i915/i915_request.h           |   8 +
>   drivers/gpu/drm/i915/i915_scheduler.c         |   7 +
>   drivers/gpu/drm/i915/i915_scheduler_types.h   |  12 +
>   drivers/gpu/drm/i915/i915_trace.h             |  16 +-
>   include/uapi/drm/i915_drm.h                   |   9 +
>   10 files changed, 274 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> index 2007dc6f6b99..209cf265bf74 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -245,6 +245,9 @@ static void signal_irq_work(struct irq_work *work)
>   			llist_entry(signal, typeof(*rq), signal_node);
>   		struct list_head cb_list;
>   
> +		if (rq->engine->sched_engine->retire_inflight_request_prio)
> +			rq->engine->sched_engine->retire_inflight_request_prio(rq);
> +
>   		spin_lock(&rq->lock);
>   		list_replace(&rq->fence.cb_list, &cb_list);
>   		__dma_fence_signal__timestamp(&rq->fence, timestamp);
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 005a64f2afa7..fe555551c2d2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -18,8 +18,9 @@
>   #include "intel_engine_types.h"
>   #include "intel_sseu.h"
>   
> -#define CONTEXT_REDZONE POISON_INUSE
> +#include "uc/intel_guc_fwif.h"
>   
> +#define CONTEXT_REDZONE POISON_INUSE
>   DECLARE_EWMA(runtime, 3, 8);
>   
>   struct i915_gem_context;
> @@ -191,6 +192,12 @@ struct intel_context {
>   
>   	/* GuC context blocked fence */
>   	struct i915_sw_fence guc_blocked;
> +
> +	/*
> +	 * GuC priority management
> +	 */
> +	u8 guc_prio;
> +	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
>   };
>   
>   #endif /* __INTEL_CONTEXT_TYPES__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 84142127ebd8..8f8bea08e734 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -11,6 +11,7 @@
>   #include "intel_engine.h"
>   #include "intel_engine_user.h"
>   #include "intel_gt.h"
> +#include "uc/intel_guc_submission.h"
>   
>   struct intel_engine_cs *
>   intel_engine_lookup_user(struct drm_i915_private *i915, u8 class, u8 instance)
> @@ -115,6 +116,9 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
>   			disabled |= (I915_SCHEDULER_CAP_ENABLED |
>   				     I915_SCHEDULER_CAP_PRIORITY);
>   
> +		if (intel_uc_uses_guc_submission(&i915->gt.uc))
> +			enabled |= I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP;
> +
>   		for (i = 0; i < ARRAY_SIZE(map); i++) {
>   			if (engine->flags & BIT(map[i].engine))
>   				enabled |= BIT(map[i].sched);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 536fdbc406c6..263ad6a9e4a9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -81,7 +81,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>    */
>   #define SCHED_STATE_NO_LOCK_ENABLED			BIT(0)
>   #define SCHED_STATE_NO_LOCK_PENDING_ENABLE		BIT(1)
> -#define SCHED_STATE_NO_LOCK_BLOCKED_SHIFT		2
> +#define SCHED_STATE_NO_LOCK_REGISTERED			BIT(2)
> +#define SCHED_STATE_NO_LOCK_BLOCKED_SHIFT		3
>   #define SCHED_STATE_NO_LOCK_BLOCKED \
>   	BIT(SCHED_STATE_NO_LOCK_BLOCKED_SHIFT)
>   #define SCHED_STATE_NO_LOCK_BLOCKED_MASK \
> @@ -142,6 +143,24 @@ static inline void decr_context_blocked(struct intel_context *ce)
>   		   &ce->guc_sched_state_no_lock);
>   }
>   
> +static inline bool context_registered(struct intel_context *ce)
> +{
> +	return (atomic_read(&ce->guc_sched_state_no_lock) &
> +		SCHED_STATE_NO_LOCK_REGISTERED);
> +}
> +
> +static inline void set_context_registered(struct intel_context *ce)
> +{
> +	atomic_or(SCHED_STATE_NO_LOCK_REGISTERED,
> +		  &ce->guc_sched_state_no_lock);
> +}
> +
> +static inline void clr_context_registered(struct intel_context *ce)
> +{
> +	atomic_and((u32)~SCHED_STATE_NO_LOCK_REGISTERED,
> +		   &ce->guc_sched_state_no_lock);
> +}
> +
>   /*
>    * Below is a set of functions which control the GuC scheduling state which
>    * require a lock, aside from the special case where the functions are called
> @@ -1080,6 +1099,7 @@ static int steal_guc_id(struct intel_guc *guc)
>   
>   		list_del_init(&ce->guc_id_link);
>   		guc_id = ce->guc_id;
> +		clr_context_registered(ce);
>   		set_context_guc_id_invalid(ce);
>   		return guc_id;
>   	} else {
> @@ -1184,10 +1204,13 @@ static int register_context(struct intel_context *ce, bool loop)
>   	struct intel_guc *guc = ce_to_guc(ce);
>   	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool) +
>   		ce->guc_id * sizeof(struct guc_lrc_desc);
> +	int ret;
>   
>   	trace_intel_context_register(ce);
>   
> -	return __guc_action_register_context(guc, ce->guc_id, offset, loop);
> +	ret = __guc_action_register_context(guc, ce->guc_id, offset, loop);
> +	set_context_registered(ce);

Should this setting be conditional to ret == 0 ?

> +	return ret;
>   }
>   
>   static int __guc_action_deregister_context(struct intel_guc *guc,
> @@ -1243,6 +1266,8 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
>   	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>   }
>   
> +static inline u8 map_i915_prio_to_guc_prio(int prio);
> +
>   static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   {
>   	struct intel_runtime_pm *runtime_pm =
> @@ -1251,6 +1276,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	struct intel_guc *guc = &engine->gt->uc.guc;
>   	u32 desc_idx = ce->guc_id;
>   	struct guc_lrc_desc *desc;
> +	const struct i915_gem_context *ctx;
> +	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
>   	bool context_registered;
>   	intel_wakeref_t wakeref;
>   	int ret = 0;
> @@ -1266,6 +1293,12 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   
>   	context_registered = lrc_desc_registered(guc, desc_idx);
>   
> +	rcu_read_lock();
> +	ctx = rcu_dereference(ce->gem_context);
> +	if (ctx)
> +		prio = ctx->sched.priority;
> +	rcu_read_unlock();
> +
>   	reset_lrc_desc(guc, desc_idx);
>   	set_lrc_desc_registered(guc, desc_idx, ce);
>   
> @@ -1274,7 +1307,8 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	desc->engine_submit_mask = adjust_engine_mask(engine->class,
>   						      engine->mask);
>   	desc->hw_context_desc = ce->lrc.lrca;
> -	desc->priority = GUC_CLIENT_PRIORITY_KMD_NORMAL;
> +	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
> +	desc->priority = ce->guc_prio;
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   	guc_context_policy_init(engine, desc);
>   	init_sched_state(ce);
> @@ -1659,11 +1693,17 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id));
>   	GEM_BUG_ON(context_enabled(ce));
>   
> +	clr_context_registered(ce);
>   	deregister_context(ce, ce->guc_id, true);
>   }
>   
>   static void __guc_context_destroy(struct intel_context *ce)
>   {
> +	GEM_BUG_ON(ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
> +		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
> +		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
> +		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
> +
>   	lrc_fini(ce);
>   	intel_context_fini(ce);
>   
> @@ -1756,15 +1796,119 @@ static int guc_context_alloc(struct intel_context *ce)
>   	return lrc_alloc(ce, ce->engine);
>   }
>   
> +static void guc_context_set_prio(struct intel_guc *guc,
> +				 struct intel_context *ce,
> +				 u8 prio)
> +{
> +	u32 action[] = {
> +		INTEL_GUC_ACTION_SET_CONTEXT_PRIORITY,
> +		ce->guc_id,
> +		prio,
> +	};
> +
> +	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
> +		   prio > GUC_CLIENT_PRIORITY_NORMAL);
> +
> +	if (ce->guc_prio == prio || submission_disabled(guc) ||
> +	    !context_registered(ce))
> +		return;
> +
> +	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> +
> +	ce->guc_prio = prio;
> +	trace_intel_context_set_prio(ce);
> +}
> +
> +static inline u8 map_i915_prio_to_guc_prio(int prio)
> +{
> +	if (prio == I915_PRIORITY_NORMAL)
> +		return GUC_CLIENT_PRIORITY_KMD_NORMAL;
> +	else if (prio < I915_PRIORITY_NORMAL)
> +		return GUC_CLIENT_PRIORITY_NORMAL;
> +	else if (prio != I915_PRIORITY_BARRIER)

Shouldn't this be I915_PRIORITY_UNPREEMPTABLE?

> +		return GUC_CLIENT_PRIORITY_HIGH;
> +	else
> +		return GUC_CLIENT_PRIORITY_KMD_HIGH;
> +}
> +
> +static inline void add_context_inflight_prio(struct intel_context *ce,
> +					     u8 guc_prio)
> +{
> +	lockdep_assert_held(&ce->guc_active.lock);
> +	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
> +
> +	++ce->guc_prio_count[guc_prio];
> +
> +	/* Overflow protection */
> +	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
> +}
> +
> +static inline void sub_context_inflight_prio(struct intel_context *ce,
> +					     u8 guc_prio)
> +{
> +	lockdep_assert_held(&ce->guc_active.lock);
> +	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
> +
> +	/* Underflow protection */
> +	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
> +
> +	--ce->guc_prio_count[guc_prio];
> +}
> +
> +static inline void update_context_prio(struct intel_context *ce)
> +{
> +	struct intel_guc *guc = &ce->engine->gt->uc.guc;
> +	int i;
> +
> +	lockdep_assert_held(&ce->guc_active.lock);
> +
> +	for (i = 0; i < ARRAY_SIZE(ce->guc_prio_count); ++i) {

This amd other loops/checks rely on the prios going from highest to 
lowest starting from zero. Maybe add a build check somewhere?

BUILD_BUG_ON(GUC_PRIO_KMD_HIGH != 0);
BUILD_BUG_ON(GUC_PRIO_KMD_HIGH > GUC_PRIO_LOW);

> +		if (ce->guc_prio_count[i]) {
> +			guc_context_set_prio(guc, ce, i);
> +			break;
> +		}
> +	}
> +}
> +
> +static inline bool new_guc_prio_higher(u8 old_guc_prio, u8 new_guc_prio)
> +{
> +	/* Lower value is higher priority */
> +	return new_guc_prio < old_guc_prio;
> +}
> +
>   static void add_to_context(struct i915_request *rq)
>   {
>   	struct intel_context *ce = rq->context;
> +	u8 new_guc_prio = map_i915_prio_to_guc_prio(rq_prio(rq));
> +
> +	GEM_BUG_ON(rq->guc_prio == GUC_PRIO_FINI);
>   
>   	spin_lock(&ce->guc_active.lock);
>   	list_move_tail(&rq->sched.link, &ce->guc_active.requests);
> +
> +	if (rq->guc_prio == GUC_PRIO_INIT) {
> +		rq->guc_prio = new_guc_prio;
> +		add_context_inflight_prio(ce, rq->guc_prio);
> +	} else if (new_guc_prio_higher(rq->guc_prio, new_guc_prio)) {
> +		sub_context_inflight_prio(ce, rq->guc_prio);
> +		rq->guc_prio = new_guc_prio;
> +		add_context_inflight_prio(ce, rq->guc_prio);
> +	}
> +	update_context_prio(ce);
> +
>   	spin_unlock(&ce->guc_active.lock);
>   }
>   
> +static void guc_prio_fini(struct i915_request *rq, struct intel_context *ce)
> +{

assert_spin_lock_held(&ce->guc_active.lock) ?

> +	if (rq->guc_prio != GUC_PRIO_INIT &&
> +	    rq->guc_prio != GUC_PRIO_FINI) {
> +		sub_context_inflight_prio(ce, rq->guc_prio);
> +		update_context_prio(ce);
> +	}
> +	rq->guc_prio = GUC_PRIO_FINI;
> +}
> +
>   static void remove_from_context(struct i915_request *rq)
>   {
>   	struct intel_context *ce = rq->context;
> @@ -1777,6 +1921,8 @@ static void remove_from_context(struct i915_request *rq)
>   	/* Prevent further __await_execution() registering a cb, then flush */
>   	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
>   
> +	guc_prio_fini(rq, ce);
> +
>   	spin_unlock_irq(&ce->guc_active.lock);
>   
>   	atomic_dec(&ce->guc_id_ref);
> @@ -2058,6 +2204,39 @@ static void guc_init_breadcrumbs(struct intel_engine_cs *engine)
>   	}
>   }
>   
> +static void guc_bump_inflight_request_prio(struct i915_request *rq,
> +					   int prio)
> +{
> +	struct intel_context *ce = rq->context;
> +	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
> +
> +	/* Short circuit function */
> +	if (prio < I915_PRIORITY_NORMAL ||
> +	    (rq->guc_prio == GUC_PRIO_FINI) ||
> +	    (rq->guc_prio != GUC_PRIO_INIT &&
> +	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
> +		return;
> +
> +	spin_lock(&ce->guc_active.lock);
> +	if (rq->guc_prio != GUC_PRIO_FINI) {
> +		if (rq->guc_prio != GUC_PRIO_INIT)
> +			sub_context_inflight_prio(ce, rq->guc_prio);
> +		rq->guc_prio = new_guc_prio;
> +		add_context_inflight_prio(ce, rq->guc_prio);
> +		update_context_prio(ce);
> +	}
> +	spin_unlock(&ce->guc_active.lock);
> +}
> +
> +static void guc_retire_inflight_request_prio(struct i915_request *rq)
> +{
> +	struct intel_context *ce = rq->context;
> +
> +	spin_lock(&ce->guc_active.lock);
> +	guc_prio_fini(rq, ce);
> +	spin_unlock(&ce->guc_active.lock);
> +}
> +
>   static void sanitize_hwsp(struct intel_engine_cs *engine)
>   {
>   	struct intel_timeline *tl;
> @@ -2293,6 +2472,10 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
>   		guc->sched_engine->disabled = guc_sched_engine_disabled;
>   		guc->sched_engine->private_data = guc;
>   		guc->sched_engine->destroy = guc_sched_engine_destroy;
> +		guc->sched_engine->bump_inflight_request_prio =
> +			guc_bump_inflight_request_prio;
> +		guc->sched_engine->retire_inflight_request_prio =
> +			guc_retire_inflight_request_prio;
>   		tasklet_setup(&guc->sched_engine->tasklet,
>   			      guc_submission_tasklet);
>   	}
> @@ -2670,6 +2853,22 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>   	drm_printf(p, "\n");
>   }
>   
> +static inline void guc_log_context_priority(struct drm_printer *p,
> +					    struct intel_context *ce)
> +{
> +	int i;
> +
> +	drm_printf(p, "\t\tPriority: %d\n",
> +		   ce->guc_prio);
> +	drm_printf(p, "\t\tNumber Requests (lower index == higher priority)\n");
> +	for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
> +	     i < GUC_CLIENT_PRIORITY_NUM; ++i) {
> +		drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
> +			   i, ce->guc_prio_count[i]);
> +	}
> +	drm_printf(p, "\n");
> +}
> +
>   void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   					     struct drm_printer *p)
>   {
> @@ -2692,6 +2891,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>   		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
>   			   ce->guc_state.sched_state,
>   			   atomic_read(&ce->guc_sched_state_no_lock));
> +
> +		guc_log_context_priority(p, ce);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index f3552642b8a1..3fdfada99ba0 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -114,6 +114,9 @@ static void i915_fence_release(struct dma_fence *fence)
>   {
>   	struct i915_request *rq = to_request(fence);
>   
> +	GEM_BUG_ON(rq->guc_prio != GUC_PRIO_INIT &&
> +		   rq->guc_prio != GUC_PRIO_FINI);
> +
>   	/*
>   	 * The request is put onto a RCU freelist (i.e. the address
>   	 * is immediately reused), mark the fences as being freed now.
> @@ -922,6 +925,8 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
>   
>   	rq->rcustate = get_state_synchronize_rcu(); /* acts as smp_mb() */
>   
> +	rq->guc_prio = GUC_PRIO_INIT;
> +
>   	/* We bump the ref for the fence chain */
>   	i915_sw_fence_reinit(&i915_request_get(rq)->submit);
>   	i915_sw_fence_reinit(&i915_request_get(rq)->semaphore);
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index a3d4728ea06c..f0463d19c712 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -293,6 +293,14 @@ struct i915_request {
>   	 */
>   	struct list_head guc_fence_link;
>   
> +	/**
> +	 * Priority level while the request is inflight. Differs slightly than
> +	 * i915 scheduler priority.

I'd say it differs quite a bit. Maybe refer to the comment above 
I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP?

Daniele

> +	 */
> +#define	GUC_PRIO_INIT	0xff
> +#define	GUC_PRIO_FINI	0xfe
> +	u8 guc_prio;
> +
>   	I915_SELFTEST_DECLARE(struct {
>   		struct list_head link;
>   		unsigned long delay;
> diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
> index 8766a8643469..3fccae3672c1 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler.c
> +++ b/drivers/gpu/drm/i915/i915_scheduler.c
> @@ -241,6 +241,9 @@ static void __i915_schedule(struct i915_sched_node *node,
>   	/* Fifo and depth-first replacement ensure our deps execute before us */
>   	sched_engine = lock_sched_engine(node, sched_engine, &cache);
>   	list_for_each_entry_safe_reverse(dep, p, &dfs, dfs_link) {
> +		struct i915_request *from = container_of(dep->signaler,
> +							 struct i915_request,
> +							 sched);
>   		INIT_LIST_HEAD(&dep->dfs_link);
>   
>   		node = dep->signaler;
> @@ -254,6 +257,10 @@ static void __i915_schedule(struct i915_sched_node *node,
>   		GEM_BUG_ON(node_to_request(node)->engine->sched_engine !=
>   			   sched_engine);
>   
> +		/* Must be called before changing the nodes priority */
> +		if (sched_engine->bump_inflight_request_prio)
> +			sched_engine->bump_inflight_request_prio(from, prio);
> +
>   		WRITE_ONCE(node->attr.priority, prio);
>   
>   		/*
> diff --git a/drivers/gpu/drm/i915/i915_scheduler_types.h b/drivers/gpu/drm/i915/i915_scheduler_types.h
> index eaef233e9080..b0a1b58c7893 100644
> --- a/drivers/gpu/drm/i915/i915_scheduler_types.h
> +++ b/drivers/gpu/drm/i915/i915_scheduler_types.h
> @@ -179,6 +179,18 @@ struct i915_sched_engine {
>   	void	(*kick_backend)(const struct i915_request *rq,
>   				int prio);
>   
> +	/**
> +	 * @bump_inflight_request_prio: update priority of an inflight request
> +	 */
> +	void	(*bump_inflight_request_prio)(struct i915_request *rq,
> +					      int prio);
> +
> +	/**
> +	 * @retire_inflight_request_prio: indicate request is retired to
> +	 * priority tracking
> +	 */
> +	void	(*retire_inflight_request_prio)(struct i915_request *rq);
> +
>   	/**
>   	 * @schedule: adjust priority of request
>   	 *
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 937d3706af9b..9d2cd14ed882 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -914,6 +914,7 @@ DECLARE_EVENT_CLASS(intel_context,
>   			     __field(int, pin_count)
>   			     __field(u32, sched_state)
>   			     __field(u32, guc_sched_state_no_lock)
> +			     __field(u8, guc_prio)
>   			     ),
>   
>   	    TP_fast_assign(
> @@ -922,11 +923,17 @@ DECLARE_EVENT_CLASS(intel_context,
>   			   __entry->sched_state = ce->guc_state.sched_state;
>   			   __entry->guc_sched_state_no_lock =
>   			   atomic_read(&ce->guc_sched_state_no_lock);
> +			   __entry->guc_prio = ce->guc_prio;
>   			   ),
>   
> -	    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x",
> +	    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x,0x%x, guc_prio=%u",
>   		      __entry->guc_id, __entry->pin_count, __entry->sched_state,
> -		      __entry->guc_sched_state_no_lock)
> +		      __entry->guc_sched_state_no_lock, __entry->guc_prio)
> +);
> +
> +DEFINE_EVENT(intel_context, intel_context_set_prio,
> +	     TP_PROTO(struct intel_context *ce),
> +	     TP_ARGS(ce)
>   );
>   
>   DEFINE_EVENT(intel_context, intel_context_reset,
> @@ -1036,6 +1043,11 @@ trace_i915_request_out(struct i915_request *rq)
>   {
>   }
>   
> +static inline void
> +trace_intel_context_set_prio(struct intel_context *ce)
> +{
> +}
> +
>   static inline void
>   trace_intel_context_reset(struct intel_context *ce)
>   {
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index e54f9efaead0..cb0a5396e655 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -572,6 +572,15 @@ typedef struct drm_i915_irq_wait {
>   #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
>   #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
>   #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
> +/*
> + * Indicates the 2k user priority levels are statically mapped into 3 buckets as
> + * follows:
> + *
> + * -1k to -1	Low priority
> + * 0		Normal priority
> + * 1 to 1k	Highest priority
> + */
> +#define   I915_SCHEDULER_CAP_STATIC_PRIORITY_MAP	(1ul << 5)
>   
>   #define I915_PARAM_HUC_STATUS		 42
>   

