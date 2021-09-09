Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB397405FB3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 00:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E498489247;
	Thu,  9 Sep 2021 22:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8DD89247;
 Thu,  9 Sep 2021 22:46:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="200458096"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="200458096"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 15:46:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="694371532"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 09 Sep 2021 15:46:49 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 15:46:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 15:46:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 15:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDjGLDdUgr24e59RKqMQe9nwtP0NxrOFe2NLk0wDNnrk5ZK94j9LeSoF+eMVDZ8CL/bJqAu7jVz0trWazRk0UIi0LmnDw17D9vClmy7/8Sr04Z9Maq8HbWohCQGEG5/26whcWLBkX3kJHEcjU4/EYdaApGS8LkEMcXU27jkBxDn/8l1ehQMbf3RNqsVXc5G23kTslbb3VDRXRb0gxIgvWbpni1IO52GvmRvVmwMtnKGm4CG+qazwwLI6UM8Rs/fqu6gN908sxaySdjgTcwj/fB+fAhF/4iFpG7KJu1jGiF/Ka5OkZiwB+VcxoIXSpja7O/QPk7091hQN2HoXefDcgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=GcnU+4UnROX7LBIcfQT+Ca27b04l11bB7JU5lkJ4FZw=;
 b=kHmJbDLo38njyUEoXKBH0RF0ziySja5Q6LFZO0sx33ylFHrO4yNwKRhrqGWvEcJvejZjVcvyH8ICP8NCCsw/y9iKLMfxgVfU1oIdmSGMDtjgRMYFbkwhEc1gDgRW/BR0EbpWsKEfCNmqy9W4GHlZNbd2BAwPDK0JJSvlPzcXITAZlskGGIeMYj7kto1ymdIf0jd0vsBkW+ufPolIxQCNZVAi/rJYTImfCWKtV1pNq7Du+oqedNRDg5OHzYRqq8RBHalQLVoawl5aoiqaAgdOZRAC8JwGRo0JTqMuz32m66COTLSTRdNSMnGCmkMjRHoqJbnJk/I+MO/kmnpk8mscgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcnU+4UnROX7LBIcfQT+Ca27b04l11bB7JU5lkJ4FZw=;
 b=foUUsD0TtQlIHfTQ7V5cRd2Iqrpl1LvWsv4E5EKyvLHcvsRK0xIK/nsBCuBz59Eo6MV9lfGvsksVq5oG6KH/t0dbjpp2niwZAmmSynPgXDl//lpqRE9Ig92jTBK/VpmAbgAUPmOVd+lqnbnGnRviesXud9pCr4x3ywK22ij/a9k=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5657.namprd11.prod.outlook.com (2603:10b6:510:ee::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Thu, 9 Sep
 2021 22:46:47 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4478.027; Thu, 9 Sep 2021
 22:46:47 +0000
Subject: Re: [Intel-gfx] [PATCH 06/27] drm/i915/guc: Take engine PM when a
 context is pinned with GuC submission
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-7-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <a741a93f-7a23-6188-1455-beff457d6189@intel.com>
Date: Thu, 9 Sep 2021 15:46:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR17CA0071.namprd17.prod.outlook.com
 (2603:10b6:300:93::33) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MWHPR17CA0071.namprd17.prod.outlook.com (2603:10b6:300:93::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 22:46:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 479bb905-13f5-4dac-30bd-08d973e3b462
X-MS-TrafficTypeDiagnostic: PH0PR11MB5657:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5657A45BE4387C4A41BA13BEBDD59@PH0PR11MB5657.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gDcT5VMMNiZdLTqp+dxfB5mi3P6c/Sm9FSuyVG9rpQIWAOl1kXifbH/xgjI1k2cDx7I4W5gsibCHzVvjmImJRo8MvWBnHr9QI3mG4gFEly8I7gWy5E2PNdFidcI59AT02HOwNfmlkTcuGi0RFXjm2iGP0TKSUb2TkE5bE/MCL56860q2C5Fkx36k+MDcto0LBHgxz5rZ1DaSW66RnirQLVN2bfuZ+om9IzsaUz58RAqa1fmw3G/avIJok5XAoibcmC3dtsZEmFIQkvRL5Gca1lOO8NLY46fy1+XiEHqC0NwDjwv0kMrJOzGXlnWXWQb3UDYwUHXRu5gvtp3XKkFlmA2/DTKLZGdbmk052mxjJqtDltRvH7JR5t++nm5/aDdP44/FzOorqFJmgQeWgPZrLOvWycROxCEfQyNLI3kiwxCGbf2N6b/4mDrWeZHCVwr1WMHzuezjJw59AYyz6bH3udp8NzVEDAurqkFvaO9bbhd34/jFZ+fyWe/Ug+sJNbltxNUsmJhv2gadFerXE/dt7ud18RVra+gNTVdxmOo+e9Mc2DseAE2kYSaIxSsMZO/G9FwT9BRIaOwhND8320tlrOFgXF5m/LZ4oi45GDmMoj8GU6ukvs2GQ3KGQkr0CWCneDCqqbrkKLRcBOFwtdO/m79lC9YIduRHTdc9FwXS96osl80YRmiSwLAZWi2gw2kAhdGGvwpHvuOrTBpgICXIwgINX06POg5kTo5YNaI7w8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(36756003)(86362001)(6486002)(16576012)(316002)(53546011)(4326008)(6666004)(66556008)(31696002)(66946007)(26005)(186003)(66476007)(83380400001)(8676002)(31686004)(8936002)(38100700002)(956004)(5660300002)(2616005)(2906002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXcwTGRlL3RrME5RMXdFY3FPVmsvNHF5cm1HSUJuSHpzOS9yOTFWOURRNzdL?=
 =?utf-8?B?YS9HMnJmb2c4cmhvUkRmeW44ZGxsMW02VG81OC81R3dNSmlqOEVMWEh3bmF5?=
 =?utf-8?B?RjRxYUFJeXZISVl4aUFKSzY0OVk4b3RyaXpncEpqWWVtMURHQVJDaEpQU2ta?=
 =?utf-8?B?b0RTNHdYRlZhVlBtZlZaNEFYeHV2L3JYY2txc3U5ZTdmcnhlVklEaGZmMVZT?=
 =?utf-8?B?THZTSWhqN0RQRWp4b3BsVi9CY3VIZVN5MUxUVXl0ZENYcm82OTRsNXh1QnpX?=
 =?utf-8?B?RmIzQjhWaHpyRGY3UkxSaUc4aVpnU2V3OVVsTEpiV0JWTlhzeUtxMzNZN01T?=
 =?utf-8?B?M2Fjd0t6L2FBNEY5dFhNZkNhdTI2R3lJZFJwMWhwN2NUaEZ5WXhhSjg1R2pT?=
 =?utf-8?B?RWpoSWNHWDYvS3c2SkxJU1VFMWI4dGRZSzdHSWFuZGlIajBTZ2FKTDRzRDdS?=
 =?utf-8?B?U0ZvZFhLQkszaDd4SktwZ0NaRWFLK1hQV09wWHllQWpEUDJhaWpIMi9BUEtX?=
 =?utf-8?B?VDRzRVFRZCsxSmZMZ0RKUjVJZmZJVUFmTHIzcGRuSkk2WmcxSlZGL3pKNlk1?=
 =?utf-8?B?ZDMyUWE3SkRIeVB4RWFaQlBuUk00SGo3SkdiVGo4TGJCV2gzRlU5RlpPK21S?=
 =?utf-8?B?VjRlcWV6UTdiVWQxT0ptOUd1Ryt2YWJXQmZXc3Zud2JGYWlMcDdvK1dPa3ZN?=
 =?utf-8?B?anJhOTdYYkwwdGlDTzlPcUlCTXNNbGN2TFo3dUdYTVV0Y3VZSkRlTGx4bkZG?=
 =?utf-8?B?ZERnck1heDFOUTRyTkVEUzZQZC8xYWJRVEczL0tsTTdybnlXUVRhaE85dmha?=
 =?utf-8?B?Qm1XRjV5bzdZZDdHWGNGcVlWQVVTdndlY2QwcWNEMWhYYTFLY2JXKy91Uk9D?=
 =?utf-8?B?c295bVk4RTFxeGVKejBIYVNLVmdZR3lsU3AwYWh6a0N6a0ljWVczTDBpbnY3?=
 =?utf-8?B?bG1ieGtvQ25IU01RUWlkZkx0dGtoMnUwbWJHb3A4U1Q3YzRXTFJ1TFFtLzlr?=
 =?utf-8?B?cjNDRDIvclp1bHNFdXlYWmdEWTVqZE5oYWQyN3JmcEdSSTZBc2Jjdks3a1gx?=
 =?utf-8?B?dS9ibVM2SlRXb2I4eDd0RktOQncyanFvdlRLdzd1YUlEaXFZTlhQOHh5L2Fh?=
 =?utf-8?B?K0pDWnFNU2REWWtNK1l4TTNWMkM5T1ZlZXB5c2tRV2t6WEd4MllmWk9GSENX?=
 =?utf-8?B?UXV5UkpBYk40VzZtU3JGNjBlZVdLVERUNzN1LzMvTUVWNHF0ZnlrajNXTlc1?=
 =?utf-8?B?cjJwaTJ5MHl4NEZRa1ZlYXpVN0dGbGxqbGJUWGNwWVZJWUVqSVlkUXZkWmxp?=
 =?utf-8?B?cTZ4a0QwWnNNd2FtRnp6Y0VvSVo3akE4QTJaYnZpUGEvREV2WGk3MHoydnRJ?=
 =?utf-8?B?K2xJbUltbkVFMUNlSGlqeTJsQVBCb2NQWFRoVzQya1MwazJVdGZQN2ZGTi92?=
 =?utf-8?B?cXp0ZGczZ3FBZHhuTUEybGtLdHNlTjh1VEt6bVQrU1crb0YrL1JJakVDTGlh?=
 =?utf-8?B?WEtPZm4vQldCaEpGL291b05PTlA1OS9QcGhIN3ExN3pid0RSd3F1bXlTOGZK?=
 =?utf-8?B?NEJIbWNNYlZKL1dNSmwwWi9IZHl0VjkraEdyZ0xoZHBJbmk3YVhtU2lUc1ox?=
 =?utf-8?B?SDVmaHIzdmRiOU9OUm11UnY1aU4wdEZaVmVsaGpCSWVUWlBlRFUwRloySEwv?=
 =?utf-8?B?KzhnUVQ5ek4vS0c1SlRkZkQvUFhqZkVBZVRiN3J4WTVWdUxERjVYWGlhcHpu?=
 =?utf-8?Q?TsnuPHtih6EO+YKxQiVzX3rRTt3jPeQmG3RHVqm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 479bb905-13f5-4dac-30bd-08d973e3b462
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 22:46:47.3129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vemzO2K9YUUI+i42Hx4n4Ba00I63OnaQdzfLefOe4yRlN719TawuiqeEoCEaBBurQsU+Hf4TSKjfph81whTHb/33+gcJ97JoPPCUlj0jfEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5657
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
> circuiting while a scheduling of user context could be enabled.
As with earlier PM patch, needs more explanation of what the problem is 
and why it is only now a problem.


>
> v2:
>   (Daniel Vetter)
>    - Add might_lock annotations to pin / unpin function
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |  3 ++
>   drivers/gpu/drm/i915/gt/intel_engine_pm.h     | 15 ++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 10 ++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 36 +++++++++++++++++--
>   drivers/gpu/drm/i915/intel_wakeref.h          | 12 +++++++
>   5 files changed, 73 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index c8595da64ad8..508cfe5770c0 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -240,6 +240,8 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
>   	if (err)
>   		goto err_post_unpin;
>   
> +	intel_engine_pm_might_get(ce->engine);
> +
>   	if (unlikely(intel_context_is_closed(ce))) {
>   		err = -ENOENT;
>   		goto err_unlock;
> @@ -313,6 +315,7 @@ void __intel_context_do_unpin(struct intel_context *ce, int sub)
>   		return;
>   
>   	CE_TRACE(ce, "unpin\n");
> +	intel_engine_pm_might_put(ce->engine);
>   	ce->ops->unpin(ce);
>   	ce->ops->post_unpin(ce);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> index 17a5028ea177..3fe2ae1bcc26 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> @@ -9,6 +9,7 @@
>   #include "i915_request.h"
>   #include "intel_engine_types.h"
>   #include "intel_wakeref.h"
> +#include "intel_gt_pm.h"
>   
>   static inline bool
>   intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
> @@ -31,6 +32,13 @@ static inline bool intel_engine_pm_get_if_awake(struct intel_engine_cs *engine)
>   	return intel_wakeref_get_if_active(&engine->wakeref);
>   }
>   
> +static inline void intel_engine_pm_might_get(struct intel_engine_cs *engine)
> +{
> +	if (!intel_engine_is_virtual(engine))
> +		intel_wakeref_might_get(&engine->wakeref);
Why doesn't this need to iterate through the physical engines of the 
virtual engine?

John.

> +	intel_gt_pm_might_get(engine->gt);
> +}
> +
>   static inline void intel_engine_pm_put(struct intel_engine_cs *engine)
>   {
>   	intel_wakeref_put(&engine->wakeref);
> @@ -52,6 +60,13 @@ static inline void intel_engine_pm_flush(struct intel_engine_cs *engine)
>   	intel_wakeref_unlock_wait(&engine->wakeref);
>   }
>   
> +static inline void intel_engine_pm_might_put(struct intel_engine_cs *engine)
> +{
> +	if (!intel_engine_is_virtual(engine))
> +		intel_wakeref_might_put(&engine->wakeref);
> +	intel_gt_pm_might_put(engine->gt);
> +}
> +
>   static inline struct i915_request *
>   intel_engine_create_kernel_request(struct intel_engine_cs *engine)
>   {
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index a17bf0d4592b..3c173033ce23 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -31,6 +31,11 @@ static inline bool intel_gt_pm_get_if_awake(struct intel_gt *gt)
>   	return intel_wakeref_get_if_active(&gt->wakeref);
>   }
>   
> +static inline void intel_gt_pm_might_get(struct intel_gt *gt)
> +{
> +	intel_wakeref_might_get(&gt->wakeref);
> +}
> +
>   static inline void intel_gt_pm_put(struct intel_gt *gt)
>   {
>   	intel_wakeref_put(&gt->wakeref);
> @@ -41,6 +46,11 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
>   	intel_wakeref_put_async(&gt->wakeref);
>   }
>   
> +static inline void intel_gt_pm_might_put(struct intel_gt *gt)
> +{
> +	intel_wakeref_might_put(&gt->wakeref);
> +}
> +
>   #define with_intel_gt_pm(gt, tmp) \
>   	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
>   	     intel_gt_pm_put(gt), tmp = 0)
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index dbf919801de2..e0eed70f9b92 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1550,7 +1550,12 @@ static int guc_context_pre_pin(struct intel_context *ce,
>   
>   static int guc_context_pin(struct intel_context *ce, void *vaddr)
>   {
> -	return __guc_context_pin(ce, ce->engine, vaddr);
> +	int ret = __guc_context_pin(ce, ce->engine, vaddr);
> +
> +	if (likely(!ret && !intel_context_is_barrier(ce)))
> +		intel_engine_pm_get(ce->engine);
> +
> +	return ret;
>   }
>   
>   static void guc_context_unpin(struct intel_context *ce)
> @@ -1559,6 +1564,9 @@ static void guc_context_unpin(struct intel_context *ce)
>   
>   	unpin_guc_id(guc, ce);
>   	lrc_unpin(ce);
> +
> +	if (likely(!intel_context_is_barrier(ce)))
> +		intel_engine_pm_put_async(ce->engine);
>   }
>   
>   static void guc_context_post_unpin(struct intel_context *ce)
> @@ -2328,8 +2336,30 @@ static int guc_virtual_context_pre_pin(struct intel_context *ce,
>   static int guc_virtual_context_pin(struct intel_context *ce, void *vaddr)
>   {
>   	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
> +	int ret = __guc_context_pin(ce, engine, vaddr);
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +
> +	if (likely(!ret))
> +		for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +			intel_engine_pm_get(engine);
>   
> -	return __guc_context_pin(ce, engine, vaddr);
> +	return ret;
> +}
> +
> +static void guc_virtual_context_unpin(struct intel_context *ce)
> +{
> +	intel_engine_mask_t tmp, mask = ce->engine->mask;
> +	struct intel_engine_cs *engine;
> +	struct intel_guc *guc = ce_to_guc(ce);
> +
> +	GEM_BUG_ON(context_enabled(ce));
> +	GEM_BUG_ON(intel_context_is_barrier(ce));
> +
> +	unpin_guc_id(guc, ce);
> +	lrc_unpin(ce);
> +
> +	for_each_engine_masked(engine, ce->engine->gt, mask, tmp)
> +		intel_engine_pm_put_async(engine);
>   }
>   
>   static void guc_virtual_context_enter(struct intel_context *ce)
> @@ -2366,7 +2396,7 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   
>   	.pre_pin = guc_virtual_context_pre_pin,
>   	.pin = guc_virtual_context_pin,
> -	.unpin = guc_context_unpin,
> +	.unpin = guc_virtual_context_unpin,
>   	.post_unpin = guc_context_post_unpin,
>   
>   	.ban = guc_context_ban,
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
> index ef7e6a698e8a..dd530ae028e0 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.h
> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> @@ -124,6 +124,12 @@ enum {
>   	__INTEL_WAKEREF_PUT_LAST_BIT__
>   };
>   
> +static inline void
> +intel_wakeref_might_get(struct intel_wakeref *wf)
> +{
> +	might_lock(&wf->mutex);
> +}
> +
>   /**
>    * intel_wakeref_put_flags: Release the wakeref
>    * @wf: the wakeref
> @@ -171,6 +177,12 @@ intel_wakeref_put_delay(struct intel_wakeref *wf, unsigned long delay)
>   			    FIELD_PREP(INTEL_WAKEREF_PUT_DELAY, delay));
>   }
>   
> +static inline void
> +intel_wakeref_might_put(struct intel_wakeref *wf)
> +{
> +	might_lock(&wf->mutex);
> +}
> +
>   /**
>    * intel_wakeref_lock: Lock the wakeref (mutex)
>    * @wf: the wakeref

