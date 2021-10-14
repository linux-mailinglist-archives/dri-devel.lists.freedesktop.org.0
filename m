Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5642CF70
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 02:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE966EC00;
	Thu, 14 Oct 2021 00:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CADF6E2C7;
 Thu, 14 Oct 2021 00:10:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="226337877"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="226337877"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 17:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="717534662"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2021 17:10:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:10:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 17:10:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 17:10:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 17:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nr+CLg7nojYtASr8fEgttHYqLNBc6DF+FvyRgBZQMULOLgIbYzsUTOlMrkquYqQZO5/IPeD2Xepm2r881umzb7sQZ8kQrLIWcB4CyqxAIt7NnrD/SHhIuLKGjy1D/rgGNylOZY0O0EhNlKZzqZAZvKjc11GczHLJzWibgYkDVjCRCNSxNnQVVC6X5y56HZR0D30w1mWThbwLDIO+w7QBD9U2qr0R16AsWm8ChXQPCYwhw92Pfh8cip88oMqHlPZ3pZSEc2zfyu6DJVgHSSRCh/yk09v4Rp/4DaEmwWfUv811QlSAElChkNd5InljDCQ5lYvfpfGfc17OhAAkxWUjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn1Rkra2Udc03fdPyrpeELjjExFrFWgVhoJ1IUE1Vlw=;
 b=T1xCYt8lzm8bPzACfutMYVxuoCkJ0EixbJoHRMidg9gFPg4Xq0GAE7yBQPVrOVZEo3ZIPvFucSoE4ZqaFJazrMwvENdS/9AMffzHIoa5KJ7w0ly4RWhY7EIJYy7JIqBXER51EcpA8zJ5Gl48YlpqU4JkHQVBZVp/f1qR8uhyGJtiNpFkv8OvC7uSoSixDAC2G71S8QaKAzTT23ohZEfifiN9PnDmXKp+9E7t9KYlTuGOgyvYwTMZUdhCkoR9HS009ru8Rtl606aySkcVxQ6jAq9bmC6cKRXzY1BvU0qkfhlj00keH7m6rUdi56ZQYyGCOLOm15M43nxKkHSsZXiRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn1Rkra2Udc03fdPyrpeELjjExFrFWgVhoJ1IUE1Vlw=;
 b=EbbtIN0Rif1vsgIzJOUCf/+0Cp3Jw2EW87/U91kq5EmeYxaMZFjUthIR2Nt3FNP+GvBYgjzQqAholirsAYasaJHc7brPUknrOuv3nQJJZqWiiK7zB0c/Kn8jUypg6cqkJNc3zzbq+J4IJcwWBEFkUdfvbIg9BrkrC5MlTnmid0k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5660.namprd11.prod.outlook.com (2603:10b6:510:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 14 Oct
 2021 00:10:42 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 00:10:42 +0000
Subject: Re: [PATCH 08/25] drm/i915/guc: Add multi-lrc context registration
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-9-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <1804a9c1-fe2e-fc29-a28e-144a806fb190@intel.com>
Date: Wed, 13 Oct 2021 17:10:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013204231.19287-9-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR10CA0023.namprd10.prod.outlook.com (2603:10b6:301::33)
 To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR10CA0023.namprd10.prod.outlook.com (2603:10b6:301::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 00:10:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1b56e11-25ab-407f-8354-08d98ea70f61
X-MS-TrafficTypeDiagnostic: PH0PR11MB5660:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5660C16AA9609A99002A5292BDB89@PH0PR11MB5660.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YsPE4d4A/ntMUwWEbyXGTLIy7ExYQns9dWTucMSQfTC86ghr7DOiGFrE379Fr3AXSyLOFYzESBXfmd8ARtyJDXYPWeSLFrlEe9Hx42WT9dNGazhRoJK6CDUKE5NTcdOpNI7ffVT3PY4yoHub5/2OGba24qYfcrGiTblexVvBblyrHClmfIkIsfAGLrFCOsF1eTca6HbZ549qNeGUX0gBxwumuv2tA77ZKvTJkUxjY/5sWQUsFdRzYJfVCpCDYypEbrp/rxydnQUSOZHySmnOWV71AqzcdEDcsGy85QPMIDFs1GAQKiauBJ19k7DpmYzgkkTSp0PEV7JyBjnE1DXa/X1y9v46cBJ+ZV72MT6Sm6j5x96Yj4T4aGFWqUXhzQbWwDM8O+Iu+GoApAfffTYqMAyN2VNY3jx/gPmOJs1dJ5uj4gh5WFnUuQ3hzTC8VRKE9sGjKdr0qY6StA6FJpzIHGo+F6i4YwdazZ0Nb8xN4myhIRcCoC+IF2p/R63puwBs4RhxyHBAlKOTnRUy/6y7Wh2ntmFUvexXywuBqT3Mibkdlzsn+z/o4KKdRuUirDHJ0QOvK4TZxZARu3Dx2tYfsXVU2dXmrNXVi3z+C6o7nFoS5Jy0QicCMwsOjAuQm2Yr/5QVi3RakWbmzJw+pqt4wsKFXIEmodIxw7PevQPbXBAUbXh+Y937JIZGdHD6rtnWkqBLq3N8oU0IzciPWfJnbY5LAg0Xmbl3YX8YGFojCuRMuue59OIjo453lwS7LTlo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(450100002)(956004)(508600001)(26005)(36756003)(31696002)(6486002)(186003)(5660300002)(316002)(66556008)(66476007)(8936002)(16576012)(8676002)(53546011)(31686004)(38100700002)(66946007)(83380400001)(2906002)(82960400001)(86362001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d01XbFpGaWIvdWZtbHFMWkZqdzRpRmRXeGhLTG9mWVhobU5GTS8vTGZZK0k0?=
 =?utf-8?B?dnQ3ck1SK0cwRzN3WGV5NjF2WXkxRFVnUVNDSDZKY2hHeGFXVllxZ0RrMUt4?=
 =?utf-8?B?NlE1bkFQNUNsbzhCbnBTcWsrMXEwc0RYRkRWd1J6Nml6S1k2RysvNjhpWGFi?=
 =?utf-8?B?QTY4QXg0ZFF4TFhmd0lrWmpCcWdEUjBDTUt1ald4d3ZnQmxNK0poUldQMnBq?=
 =?utf-8?B?a1Y0akx3N0JnRXhQV2REK3E4MGYrRG13SjZqUzd1NVNMc3F3YUJjRXdSYkg2?=
 =?utf-8?B?aFk2ckduZVRTQjhWQTBSRHEwZzNUa1VYUlpMUjl2Q2RtRTNZZUlXK0tkTkRJ?=
 =?utf-8?B?ZExrcjArRUJOT0JTb2I3eDJTY01qZVdwZHhOcGQ0TXc5NkVPeFJzODFzUk94?=
 =?utf-8?B?eldkSFdsMHIvbDVSdnJtd3g0K3VsR3kxYm9vSEtOWmY4MWZwdy92VWRpTUFr?=
 =?utf-8?B?K1JoMHRaTlhQUTlTMmJvVGx6MzA1eTg2Ky9EbE9qVmFOQ1drSG5tRUFDRm5P?=
 =?utf-8?B?NVoreEhNMmNrUE5Qak15MzJoQkJja3BMZEs1RTlDVWpyZFRYSmx6YzNmSllz?=
 =?utf-8?B?dHduSVowbzlXdGliSWEvQ2gzWWcxajRiS1V1WXYvZXpsYU1tM1czdFU0NGx1?=
 =?utf-8?B?d1FMQ0dYNEtpNHNrUFhiL2NkRWd4SHFMSTRHOHhlTkFKZ2FhaEozcVdXanZX?=
 =?utf-8?B?YndodUVKY1ZMaXNXakl5WnZOQmJvNllGVG4ydzNIdlJTQWxobCtLazVkejRY?=
 =?utf-8?B?MHMvRXpLWkV3bHFtOVJSck9DMFh2NXJCTkdoNUtxS053bnVnWXFnZGVaT09V?=
 =?utf-8?B?bjI1VlZwa0ZxQ3VndmJtbkV4ZXZoYnBBOENjTXdUbjZkMGREeThlRWdLT2Vu?=
 =?utf-8?B?b0hCWTVXUjdKTE9DZEk1SGNrWnJNOG1Ub0w4eTFSRFMxT0h1U09VWlZnYld5?=
 =?utf-8?B?ZGdsZEdwUUovcWxqQXViMFNUVXc4RU4yM1cybkhSRVJWZFRoT2Z5YXUvaS9M?=
 =?utf-8?B?MzZ6ZWpUbnh1d21QbElNNHp5SERlZ0NGL20vRFJxb05GZUVBZXI1MmlrNDB4?=
 =?utf-8?B?b3BOcmNWY1MrSU9SREJZWko4RVZkWHBadXE4OUNsdzRnK0tZYm90d3BDUkhq?=
 =?utf-8?B?S20vUWR1Ym81YkJuR25SUnRueTVGd28rTzRuMlovNXZKRGJBcWlBUjl6STdU?=
 =?utf-8?B?SWdDRGo3VFFDL1RYRHNoNWVmdjRqWlhQTzBaVzNwNG9Ld25QOVdvYzN5NEVr?=
 =?utf-8?B?TVE0cnBwUEZ4L3p0d080TmJYU21DaEhaVDRRUzMxTkdBUk5CaGhiNldIWER3?=
 =?utf-8?B?ZEpNeUtUSHZDdmV1SWhvTVM4dC9wQk56NnpsMDZ1NXl4OTRBKzdLV1dLU2Zi?=
 =?utf-8?B?a0tUL0drYkpoekY1UEtOYzBWU085cnFWdnFmUUplQTFGd1BSMjl6amkvZE81?=
 =?utf-8?B?U044SUZHbEpkeUhkREVLK1BaQkJEZXhjUk85VU9jQ1Evb1AycVNSdklSQkwx?=
 =?utf-8?B?OHFiQzZ5SUhObDBIZUxUdnVxcnRTN3UxaUFSak9DaW1XcWN1VWc0bmNLRS9C?=
 =?utf-8?B?aVBDZFZ3SFlXRUJ2anNTYXRTQTFKTS9VNDVZTk9qZzI4YW5JazVIa3p6TnVB?=
 =?utf-8?B?UWhCSmplQUluZFRlY2pBa3lLU1BmR1BTVFc0andaazQxNCt0L0l5OE5IN29l?=
 =?utf-8?B?OWpraGtVZUhYcDZVdVJiZTl4OWJtczdOS2x4enVHTTY0WlI5VzVSWCtNRnNy?=
 =?utf-8?Q?Dl7u8TiATFwTaielghYVv1XizmjU7q1+G647N6j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b56e11-25ab-407f-8354-08d98ea70f61
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 00:10:42.0049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFyclcIEgLAVtCeilP+y/eCtt64KnBRP4tDk5aQyrqkofNaNowzDojN4jsUa7vSnQD8txlBw5NoRqg7KSFTMUZoXo4lrDWo+Vu2NcVkphUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5660
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
> Add multi-lrc context registration H2G. In addition a workqueue and
> process descriptor are setup during multi-lrc context registration as
> these data structures are needed for multi-lrc submission.
>
> v2:
>   (John Harrison)
>    - Move GuC specific fields into sub-struct
>    - Clean up WQ defines
>    - Add comment explaining math to derive WQ / PD address
> v3:
>   (John Harrison)
>    - Add PARENT_SCRATCH_SIZE define
>    - Update comment explaining multi-lrc register
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  12 ++
>   drivers/gpu/drm/i915/gt/intel_lrc.c           |   5 +
>   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |   2 -
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 116 +++++++++++++++++-
>   5 files changed, 133 insertions(+), 3 deletions(-)
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
This needs to be += PARENT_SCRATCH_SIZE.

John.

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
> index 84b8e64b148f..58a6f494be8f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -344,6 +344,47 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
>   	return rb_entry(rb, struct i915_priolist, node);
>   }
>   
> +/*
> + * When using multi-lrc submission a scratch memory area is reserved in the
> + * parent's context state for the process descriptor and work queue. Currently
> + * the scratch area is sized to a page.
> + *
> + * The layout of this scratch area is below:
> + * 0						guc_process_desc
> + * ...						unused
> + * PARENT_SCRATCH_SIZE / 2			work queue start
> + * ...						work queue
> + * PARENT_SCRATCH_SIZE - 1			work queue end
> + */
> +#define PARENT_SCRATCH_SIZE	PAGE_SIZE
> +#define WQ_SIZE			(PARENT_SCRATCH_SIZE / 2)
> +#define WQ_OFFSET		(PARENT_SCRATCH_SIZE - WQ_SIZE)
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
> @@ -1365,6 +1406,30 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
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
> @@ -1387,9 +1452,15 @@ static int register_context(struct intel_context *ce, bool loop)
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
> @@ -1418,6 +1489,7 @@ static int deregister_context(struct intel_context *ce, u32 guc_id)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_deregister(ce);
>   
>   	return __guc_action_deregister_context(guc, guc_id);
> @@ -1445,6 +1517,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	struct guc_lrc_desc *desc;
>   	bool context_registered;
>   	intel_wakeref_t wakeref;
> +	struct intel_context *child;
>   	int ret = 0;
>   
>   	GEM_BUG_ON(!engine->mask);
> @@ -1470,6 +1543,41 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   	guc_context_policy_init(engine, desc);
>   
> +	/*
> +	 * If context is a parent, we need to register a process descriptor
> +	 * describing a work queue and register all child contexts.
> +	 */
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
> @@ -2804,6 +2912,12 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
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

