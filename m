Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934503F90EF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 01:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF836E8C9;
	Thu, 26 Aug 2021 23:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2936E8C8;
 Thu, 26 Aug 2021 23:26:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="281580904"
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="281580904"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 16:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,354,1620716400"; d="scan'208";a="517093066"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2021 16:26:24 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 26 Aug 2021 16:26:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Thu, 26 Aug 2021 16:26:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 26 Aug 2021 16:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNfFJoYLb5Nhg59oIM903BPdk4i3lRIB3yEzuNjLM5K6ZJfoSfFZPhaD2hU5jxWyhnr41oHMLpl+UdqUk+uzCeCr/6pKYSPo4e0xHN9Et8/bs/8YJ+iYX6+cwB0xNqLG+ni2VX1lCvcTP7Dixvv3uzE5DDJMPkJHlVMvPkubqSv2ahhaK2IMzu44SGh9v/U3hmT3lW71vvQjYParaULvfnhM0t+v30C3HvR35dKgl+M02LxcFQlva+841q9C/3DHvlWVBo8rFUSvVCC5D6nmzVBiEkKM4Quog2KI/PKy1Zqt184ICqyzJSCGG//nxs2dWzh/i5PzVFQz9h3ZXzV0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQfj9t+Mtf9woQpyUvr08W1HMQ3x4MIYlltNyCGciMo=;
 b=SKE01CsWJw4B9V5W6UD/w1yCyVckpZzm8VYUNSfW4S7p2KANHY154A8QBl331OvA1HblBd7Pv5KZ4U5WhpWkBZ8ZCrXhlj2MCj+40TMaRfEXTl6AzLQIe56AEe2XjFDGYIrGOhpFtsIpjOOPv+0CijaXtIvr34xHq6U4J8jiH2IC9WA08nASggCyr4CsZYk695TuPCPJ0hymSKGQP7DnxeQzPmDELbpRk7zu8z77mIipawTdHQ3Y5/rUU5GkPNcjx7zzBQPccHD/Busa8xf8m0UrJ3b8CouMEfxMllEql7OlMuGJrVaM4T7x7CCFSgP9N5DcsLoQolpe8Bs4iznGHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQfj9t+Mtf9woQpyUvr08W1HMQ3x4MIYlltNyCGciMo=;
 b=AmXpfXM8/hGLSLCcb871h3QDIpUy3cGQlD+eQohixzGGADM7PKHp4ZdN5X3zY7D2Sq6ILO7Z410yxUN0B7GmvHwd8RelP+r5ixzxy8Zqg7XCPu0Z+NVI2dLBSp/TGq2yah3nFdO8qUbqm9lpPrlsLkBNMYqd/FQgQ7To6R2T4Mk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB2780.namprd11.prod.outlook.com (2603:10b6:5:c8::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17; Thu, 26 Aug 2021 23:26:22 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.020; Thu, 26 Aug 2021
 23:26:22 +0000
Subject: Re: [PATCH 23/27] drm/i915/guc: Move GuC priority fields in context
 under guc_active
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210826032327.18078-1-matthew.brost@intel.com>
 <20210826032327.18078-24-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <9d8e7b55-f7c4-350b-22e3-7447998e6e31@intel.com>
Date: Thu, 26 Aug 2021 16:26:20 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210826032327.18078-24-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SJ0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::18) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.79.152.56] (192.55.52.219) by
 SJ0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:33b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 23:26:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a11ef22-09fd-47c1-e779-08d968e8ea2c
X-MS-TrafficTypeDiagnostic: DM6PR11MB2780:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB278048134FF3F1D76D490554F4C79@DM6PR11MB2780.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yZjDH8O11IfKG44dFa8LyYJuj2CA2r4I63mFc/1O9EFTeHuUfxYkVSdHJIu5HbrTR1b61eGa4Wdpcpj4kODqYURTwEj5Wg42IoKk0XKNMc1pJ+S0QUI/rtB4C8qNR8yjQ0Pjg2qNI/L28bX0nxpdZ927+sBR3orVQsB7/9uzolqStNV8r4hK2oHQ3LUA4QyA13p/9O9KuDSgb7DgnnPUR4POjvBxpy/tqcPO+JQVrzKaUa98zTBgbs8hD9WQ7LFSx9uO21MVbYNVNVHy/AUE9ty6fkS0s6XmFZ69qMr6huYysATm4WKkG+E5BfgXQIxc6v9VRrh3xSOQgdFwglXAbnxC0/p+s6nbd+R+zNbOJ493lA8EomNiLfuU+mUWCyq/D5DH+epzBLATZ4EgyTJIznAN0ejOSB4Yey8Hz2oZnOiMc47eyBbpD57xrpk2P9H2FUnInKJiDp+fqwbEWF7vnH4kkQEeJ6YTNvx1VyUdlNve2QjF4XDBCDllLTbA0il7anpOH/3pOo3IYQe9fJMdUiQ2UzYiRRyR4FBsISzVsKdU8bZ9MoCxCIJ72g6t78EdBdoJcaMS8tXDyMCi7PBin2gs3EmcxqBVWI1cthI+LZcT0cA8WBqMIwc2X+1+9NR0MS6sKWVNUJ1nMmbPS1snU2VvWggrUXNq7NTvBLuk12d/whaYIjyQ/F7xGYCxPtuVDBrAn460Ct1CNTbDNadCJQks6zYrvA3a4vDP7ZLJ0CM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(8676002)(66946007)(316002)(86362001)(31696002)(8936002)(53546011)(186003)(16576012)(38100700002)(478600001)(36756003)(26005)(31686004)(66556008)(2616005)(5660300002)(6486002)(66476007)(2906002)(450100002)(956004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWNFbktxTStKYXpCZlpHWHFpNytUOGhHL1o1eGRoOCtwSmZCYzg4S3dVcDVB?=
 =?utf-8?B?Z0RmZ1VRRnRqQXJmeU1pQ2taRUxPcFNNLzREY0tRcFhlY0QrMDBrQWNPU3NX?=
 =?utf-8?B?enAxejk2bEQyanJndkJiem9rSzdQeEhFTFdLTW1tZWd2SFVpb1JFSFhETWpl?=
 =?utf-8?B?eXNsTllPeHpXUG1uRUFQQWVVdm5SQk0wOXEzMXBqN1FmMFFWZ1M2S1pwYndK?=
 =?utf-8?B?R09oS0RGUVErRlJwb0N5TllMZ3lFR05QWG0rMVZiMmVCcjdSNEg5ampzdXc2?=
 =?utf-8?B?cnZXUHV4V2F2QnZUVzFyTjJRZDRWendYK3M5cFUwU01ldkJ2SHo5MGJTK1Q3?=
 =?utf-8?B?eExIa2ZtWVQvc1pHWi90aFNjRER2L0dlMEFsUWxyQ2c5THR5MjRsK1dQa3dS?=
 =?utf-8?B?cFZGYkxPSFpEeXpkTmcyVE5RQnlRdlBNWDZaQW9KdWV1bXZUVnQxam5uMlNW?=
 =?utf-8?B?VDdlMUJUU0xTQm5jOW12T2YyY0RGb0N0ck5RRzI4ZTJIT0ZwUnVueTViWHA3?=
 =?utf-8?B?dFZ2N1NQdnNUZHM2TVNEN3NKS21GK21XcGcxQ2t2NC84N3ZhTCtTZU4waUZV?=
 =?utf-8?B?M3dFWGV6WFVOQ1ZVUWFPYlNwcHg4UXFqbVQ5bUdsOW1CZStnSGlNeWVnSVBy?=
 =?utf-8?B?U0cza0NZYmNkNURYZ0p6TmhYSCtRajM4YlVVQkFCQWttZXVqNW9iUjd2eEVq?=
 =?utf-8?B?dHYzb2kyWmVwSGJ6SmJ1bVJXQ1Q3VldKcHBTNXVPS3ZOMk45T1Q0c0krSzZz?=
 =?utf-8?B?bDd3bXdtaFJXaTIyMlZNOW15d051RUFqYWJHUThjZ2JLd3hlS2dEaFVFV3Np?=
 =?utf-8?B?ZTRKcGttNmc2d3FsRjdvei83TVgyWTlyUGttT2NUaGhoeUlmNmt6OEYzSUhn?=
 =?utf-8?B?d3J6Sm1FUkZUMG5KOVpncmhQUHdXQUMxOGNVUUFxVWx3NGdaTFU5eWNVaUVD?=
 =?utf-8?B?MlkxTFhJZ1YwSTl0Q3ZPTk9KYkV5SW1INWMyMk1rcXgrNW9sRlJBMTAxL1Uz?=
 =?utf-8?B?REluTW9nTStuemNLYncySHYvWWE2dDQxMTlnRVNGTGgzZHQzUXp1d0ZTeTM1?=
 =?utf-8?B?UWFYOGNieGlaeldiaXhPV0U5MlJhUHREQUIyNUFrdFFETm51TmhGWGZCdzhY?=
 =?utf-8?B?QWdBeFhEcjJidDNiZ0JTaENSV0tadzJKenpSV2FoN1R4aVp4NmxMdmFkQ1BL?=
 =?utf-8?B?SUQ2UGRvVEtXR1lHbklzeG5YUktPWlV0S25YNFVpU1dlZVlzUDZrUkxQWnpW?=
 =?utf-8?B?UnBZcTU5QTVCNVRKSVJibUFoVzZGZktBY0w1bzE1MnNVaGdsdHZ2bWc5eXZV?=
 =?utf-8?B?QjFCRUlKYmNPell3YjVuVGJFQlNHUG9VQWZ1Q1ExSlVUS01kN0pLM0lUZjdT?=
 =?utf-8?B?bDR6ZWdHYzQrd2JDOHBUUGc0c2lYaU0xQlZrVnI1aWlMQUxTUnQ2Ym1pTE9I?=
 =?utf-8?B?K1F3SksrQmhBNHQyeDVpN1grMk84bFQvWmpGR3lORm1jN0w1SFVZQmpBM1VQ?=
 =?utf-8?B?bzhLY3BVQjhEQ3I3WUFaaUpCN3l1d1lIQ0U1cEJNWHJLL0R1UW1kNnJQazFh?=
 =?utf-8?B?TCtSbzdIRnR4VWxWOXJBWEI0RjhwbmZmcjQ0R1ZSNyt3MW9vZE1mUk5PeUVS?=
 =?utf-8?B?UGgwd1p6Q0xiSjVoOE45bmNvT1NnU1VVbUJad040eXJZdFhJNEluUFpNQnJW?=
 =?utf-8?B?L3ZMZEpnRzVJbTJRbjFFNkQ0OEhoWkYwUUhnd1p5SWxwa3pENVBrTFprem1q?=
 =?utf-8?Q?/FPMb9Cwa2ceqbbfIE2S5wJskFku7w/ZOUzOHv5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a11ef22-09fd-47c1-e779-08d968e8ea2c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 23:26:22.1223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izDiDgqrhyY1CREIqllKxB/6Us4cwjIXVmi/N30SKPEE0npT+r9xr62pc+dGV34wup9xUl9BEQnEz3Py8qoiMp1VObnbx4BGj5uKKWl8n7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2780
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



On 8/25/2021 8:23 PM, Matthew Brost wrote:
> Move GuC management fields in context under guc_active struct as this is
> where the lock that protects theses fields lives. Also only set guc_prio
> field once during context init.
>
> v2:
>   (Daniele)
>    - set CONTEXT_SET_INIT
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h | 12 ++--
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 69 +++++++++++--------
>   drivers/gpu/drm/i915/i915_trace.h             |  2 +-
>   3 files changed, 46 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 3a5d98e908f4..b56960a781da 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -112,6 +112,7 @@ struct intel_context {
>   #define CONTEXT_FORCE_SINGLE_SUBMISSION	7
>   #define CONTEXT_NOPREEMPT		8
>   #define CONTEXT_LRCA_DIRTY		9
> +#define CONTEXT_GUC_INIT		10
>   
>   	struct {
>   		u64 timeout_us;
> @@ -178,6 +179,11 @@ struct intel_context {
>   		spinlock_t lock;
>   		/** requests: active requests on this context */
>   		struct list_head requests;
> +		/*
> +		 * GuC priority management
> +		 */
> +		u8 prio;
> +		u32 prio_count[GUC_CLIENT_PRIORITY_NUM];
>   	} guc_active;
>   
>   	/* GuC LRC descriptor ID */
> @@ -191,12 +197,6 @@ struct intel_context {
>   	 */
>   	struct list_head guc_id_link;
>   
> -	/*
> -	 * GuC priority management
> -	 */
> -	u8 guc_prio;
> -	u32 guc_prio_count[GUC_CLIENT_PRIORITY_NUM];
> -
>   #ifdef CONFIG_DRM_I915_SELFTEST
>   	/**
>   	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 14a512533c39..bc68c0122be4 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1367,8 +1367,6 @@ static void guc_context_policy_init(struct intel_engine_cs *engine,
>   	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
>   }
>   
> -static inline u8 map_i915_prio_to_guc_prio(int prio);
> -
>   static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   {
>   	struct intel_engine_cs *engine = ce->engine;
> @@ -1376,8 +1374,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	struct intel_guc *guc = &engine->gt->uc.guc;
>   	u32 desc_idx = ce->guc_id;
>   	struct guc_lrc_desc *desc;
> -	const struct i915_gem_context *ctx;
> -	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
>   	bool context_registered;
>   	intel_wakeref_t wakeref;
>   	int ret = 0;
> @@ -1394,12 +1390,6 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   
>   	context_registered = lrc_desc_registered(guc, desc_idx);
>   
> -	rcu_read_lock();
> -	ctx = rcu_dereference(ce->gem_context);
> -	if (ctx)
> -		prio = ctx->sched.priority;
> -	rcu_read_unlock();
> -
>   	reset_lrc_desc(guc, desc_idx);
>   	set_lrc_desc_registered(guc, desc_idx, ce);
>   
> @@ -1408,8 +1398,7 @@ static int guc_lrc_desc_pin(struct intel_context *ce, bool loop)
>   	desc->engine_submit_mask = adjust_engine_mask(engine->class,
>   						      engine->mask);
>   	desc->hw_context_desc = ce->lrc.lrca;
> -	ce->guc_prio = map_i915_prio_to_guc_prio(prio);
> -	desc->priority = ce->guc_prio;
> +	desc->priority = ce->guc_active.prio;
>   	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
>   	guc_context_policy_init(engine, desc);
>   
> @@ -1805,10 +1794,10 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   
>   static void __guc_context_destroy(struct intel_context *ce)
>   {
> -	GEM_BUG_ON(ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
> -		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
> -		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
> -		   ce->guc_prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
> +	GEM_BUG_ON(ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_HIGH] ||
> +		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_HIGH] ||
> +		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_KMD_NORMAL] ||
> +		   ce->guc_active.prio_count[GUC_CLIENT_PRIORITY_NORMAL]);
>   	GEM_BUG_ON(ce->guc_state.number_committed_requests);
>   
>   	lrc_fini(ce);
> @@ -1918,14 +1907,17 @@ static void guc_context_set_prio(struct intel_guc *guc,
>   
>   	GEM_BUG_ON(prio < GUC_CLIENT_PRIORITY_KMD_HIGH ||
>   		   prio > GUC_CLIENT_PRIORITY_NORMAL);
> +	lockdep_assert_held(&ce->guc_active.lock);
>   
> -	if (ce->guc_prio == prio || submission_disabled(guc) ||
> -	    !context_registered(ce))
> +	if (ce->guc_active.prio == prio || submission_disabled(guc) ||
> +	    !context_registered(ce)) {
> +		ce->guc_active.prio = prio;
>   		return;
> +	}
>   
>   	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
>   
> -	ce->guc_prio = prio;
> +	ce->guc_active.prio = prio;
>   	trace_intel_context_set_prio(ce);
>   }
>   
> @@ -1945,24 +1937,24 @@ static inline void add_context_inflight_prio(struct intel_context *ce,
>   					     u8 guc_prio)
>   {
>   	lockdep_assert_held(&ce->guc_active.lock);
> -	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
> +	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
>   
> -	++ce->guc_prio_count[guc_prio];
> +	++ce->guc_active.prio_count[guc_prio];
>   
>   	/* Overflow protection */
> -	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
> +	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
>   }
>   
>   static inline void sub_context_inflight_prio(struct intel_context *ce,
>   					     u8 guc_prio)
>   {
>   	lockdep_assert_held(&ce->guc_active.lock);
> -	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_prio_count));
> +	GEM_BUG_ON(guc_prio >= ARRAY_SIZE(ce->guc_active.prio_count));
>   
>   	/* Underflow protection */
> -	GEM_WARN_ON(!ce->guc_prio_count[guc_prio]);
> +	GEM_WARN_ON(!ce->guc_active.prio_count[guc_prio]);
>   
> -	--ce->guc_prio_count[guc_prio];
> +	--ce->guc_active.prio_count[guc_prio];
>   }
>   
>   static inline void update_context_prio(struct intel_context *ce)
> @@ -1975,8 +1967,8 @@ static inline void update_context_prio(struct intel_context *ce)
>   
>   	lockdep_assert_held(&ce->guc_active.lock);
>   
> -	for (i = 0; i < ARRAY_SIZE(ce->guc_prio_count); ++i) {
> -		if (ce->guc_prio_count[i]) {
> +	for (i = 0; i < ARRAY_SIZE(ce->guc_active.prio_count); ++i) {
> +		if (ce->guc_active.prio_count[i]) {
>   			guc_context_set_prio(guc, ce, i);
>   			break;
>   		}
> @@ -2118,6 +2110,21 @@ static bool context_needs_register(struct intel_context *ce, bool new_guc_id)
>   		!submission_disabled(ce_to_guc(ce));
>   }
>   
> +static void guc_context_init(struct intel_context *ce)
> +{
> +	const struct i915_gem_context *ctx;
> +	int prio = I915_CONTEXT_DEFAULT_PRIORITY;
> +
> +	rcu_read_lock();
> +	ctx = rcu_dereference(ce->gem_context);
> +	if (ctx)
> +		prio = ctx->sched.priority;
> +	rcu_read_unlock();
> +
> +	ce->guc_active.prio = map_i915_prio_to_guc_prio(prio);
> +	set_bit(CONTEXT_GUC_INIT, &ce->flags);
> +}
> +
>   static int guc_request_alloc(struct i915_request *rq)
>   {
>   	struct intel_context *ce = rq->context;
> @@ -2149,6 +2156,9 @@ static int guc_request_alloc(struct i915_request *rq)
>   
>   	rq->reserved_space -= GUC_REQUEST_SIZE;
>   
> +	if (unlikely(!test_bit(CONTEXT_GUC_INIT, &ce->flags)))
> +		guc_context_init(ce);
> +
>   	/*
>   	 * Call pin_guc_id here rather than in the pinning step as with
>   	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
> @@ -3025,13 +3035,12 @@ static inline void guc_log_context_priority(struct drm_printer *p,
>   {
>   	int i;
>   
> -	drm_printf(p, "\t\tPriority: %d\n",
> -		   ce->guc_prio);
> +	drm_printf(p, "\t\tPriority: %d\n", ce->guc_active.prio);
>   	drm_printf(p, "\t\tNumber Requests (lower index == higher priority)\n");
>   	for (i = GUC_CLIENT_PRIORITY_KMD_HIGH;
>   	     i < GUC_CLIENT_PRIORITY_NUM; ++i) {
>   		drm_printf(p, "\t\tNumber requests in priority band[%d]: %d\n",
> -			   i, ce->guc_prio_count[i]);
> +			   i, ce->guc_active.prio_count[i]);
>   	}
>   	drm_printf(p, "\n");
>   }
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 0a77eb2944b5..6f882e72ed11 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -910,7 +910,7 @@ DECLARE_EVENT_CLASS(intel_context,
>   			   __entry->guc_id = ce->guc_id;
>   			   __entry->pin_count = atomic_read(&ce->pin_count);
>   			   __entry->sched_state = ce->guc_state.sched_state;
> -			   __entry->guc_prio = ce->guc_prio;
> +			   __entry->guc_prio = ce->guc_active.prio;
>   			   ),
>   
>   		    TP_printk("guc_id=%d, pin_count=%d sched_state=0x%x, guc_prio=%u",

