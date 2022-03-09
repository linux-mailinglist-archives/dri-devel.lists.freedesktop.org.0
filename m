Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AAB4D3BC4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 22:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6BD10E478;
	Wed,  9 Mar 2022 21:11:07 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC0210E473;
 Wed,  9 Mar 2022 21:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646860266; x=1678396266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dUqohb4MoM6+TUe2cpv1YS8JHD5l4KXrIB9JdeYZJYs=;
 b=evl8Hi91niW2zxS/OAwO6zjq5B0JbYksKWcHVBTrAFoVAcRH7V/Cs5HU
 pl2jF9MBkoWkYd+vF/sAgw4tBXQ3MgNamhbPfU6E+d9d78RdzcHutQdQK
 xL6yP74s0FkOVKpRi+Bg1Z15g9j+w4aFw6QabTqr+U5X6rJmTI8Y+A+br
 HmbRhLhDu2E5qgfq+aRsyXyzexYJTJkvUxlbw8g/ap0tVS3ifKPwjZcat
 DVuXi0m4J6Rqx9UpwjjKdXb+XeLyVhhcXEXb9jA9QIRdfJTBxMoWGueWf
 KpaUc2l1odhNv9MxMukiqlF6TbiOTJEgGnsSMiY5aSEISfFiKQs4vcTqM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="253923818"
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="253923818"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 13:10:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,168,1643702400"; d="scan'208";a="712099406"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 09 Mar 2022 13:10:56 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 13:10:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 9 Mar 2022 13:10:56 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 9 Mar 2022 13:10:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyGjkbxkdWloE16PMDEB6knWuwnLnxMe05BtITvZN0n2RBKf6qol+wsIHiTqMDNAH3xkNFkb33fuv2MDy4CLdeEhX3kZ0R8HmqQ0BKpJAuFgftVQr2LSaacJqFiAJY0e6BwvpmGErA3509MW90KKjYWSNnaEE96fwTLo1d31vWEeiAnEOnCI2TAUdHynAh3xtQfJgF45Y0TSYIuNgROGOBkAfd/4/XV/epvtD/LHlbhD+mjg4vuzah35ffzZ31t3+fWloXOcMd445KzqamuLkie1tXqL0Er6/tFs2dDO07uirYc8WkbWnqBxvoSrRcsIlZkjMDDPqq3EsDv2y1HTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMQVmm2s8JZ6RYYr0RA5h1EhCK8dB9f176RxwE+6JiE=;
 b=UwXG2ahxZ8OH9lUKMij11QB+BskRwQot2v43wzMCTkvZWdJnOipISfsZuBVXwpLDU8bmKNDnd/Nzr7l0sHA03f+zJb51FTqFSf98bGpr/p5uVsi+siOYoJJdtE5+6fZ/6w1NX79cRl9EC14E+Z39hQpndrHlsfO6XSU+PplVarnqf+Ebmn/R3pYOBBEdTNxd7JQF0BVkCamaN7sJgx0BUW7A98014R2elYEUMzhKQ1FxqSEtESR5Bsb7fEbsCfGBJEisPSI/HSysVRfAd3LpUCFCpDI4/xF0Ev+HLYGFVEWOswMWeryal57LkOuF3yBBrskngp4AKq/XRgItcwaozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Wed, 9 Mar
 2022 21:10:54 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::dd36:1843:a629:4ad7%4]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 21:10:54 +0000
Message-ID: <565b4a87-8bd2-ff1e-84e4-95b15238845a@intel.com>
Date: Wed, 9 Mar 2022 13:10:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [Intel-gfx] [PATCH v3 1/4] drm/i915/guc: Limit scheduling
 properties to avoid overflow
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220303223737.708659-1-John.C.Harrison@Intel.com>
 <20220303223737.708659-2-John.C.Harrison@Intel.com>
 <897489fb-e0d4-78bc-11d0-d7ec9c20ae07@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <897489fb-e0d4-78bc-11d0-d7ec9c20ae07@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P222CA0019.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::24) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc68ab99-e1f3-404d-60bd-08da02114c40
X-MS-TrafficTypeDiagnostic: CO1PR11MB5060:EE_
X-Microsoft-Antispam-PRVS: <CO1PR11MB5060ED80B3365140EF71E8DCBD0A9@CO1PR11MB5060.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jGp+lq6zTb31GKB44jfEGMKqyiZ367J08fD6pfCLGZkT4gis59Ryg2kZDAheumER8SHE1UgouEJLG2sInAx3tzmV+Jgkugf790ZdRwF1t8gID0RsHIYgzYo1D5MWw/LMV9pCi94S4YaiVSxCGubZ0iccbNQJJYXdKGAqou7YybACtVapxBBU4Xp0Y+kSoChjBXN2tk79igH+fHoc1uZ2t6hKEdkumyrIF1oG1eIOgV0InXEbVzCpjJKYH3WcUWYQVnGXL6i2exOYyYrnCKEEHYeKG4wBk8ZwZ1gOfC8yWBqNEzN1a9yA6gzzIPb2D+eijOBL3lN+69ZD++2YuT81RWVmJv/DOjhalZvK7iTewCgyI+NIt/piKriA39F1Xq6MuRmg0OA5H6iIpiaRl9BRYmoYzyjlVsFSN2fRjX3mDlSYciTYZRfeksscY27Q0kLX/c/g8AR2rcxZ/AYc/CNSgBuCDkUk7qVDYYCk//IVhOwLx6TF4rv6rCG+M+Q56gekE3Pk1SHO5GIq214JJASaMQj9nI6zRHxyhW0KO5zr/HrTA6GUvpvmqCJ56Yt0wFae89OMo+WqRczJ6IKwjh2ua9ZhR/p+R0WylJZ5NhaTAG2MnbDttnQ5oJCL0n8oV32piGWIFXH06scWmocCBZuI+9G4GLpqFaAc7v8tw5NQEWBtuTjH+0SUOqry3aCHFVkoYPJWTh0rTgwZdbRpnyTCXcxsAvJKPyrOnzCwG7s6C83QHktnXJNZJSEG8/oraDQw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(5660300002)(8936002)(66946007)(6506007)(186003)(6666004)(82960400001)(38100700002)(4326008)(66556008)(26005)(2906002)(2616005)(30864003)(86362001)(83380400001)(6512007)(31696002)(66476007)(508600001)(36756003)(316002)(31686004)(8676002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2Y1QUc5U3VLeHhNZitHNjhEWlU3SHF4M3FYVFFQcWJ5Y0hEcG45VWR0cXdu?=
 =?utf-8?B?M25lOG9ZUy9lYWRkcGRtYWEzOWF4dTBlRE93a25GMmZDakE5WDUwYzRyOHNt?=
 =?utf-8?B?cXo3OTRMd2tWWkh3UTZ1U0lPMXB2UEFLdmZHR0RVNENubVRxa2Iwbm1YNDc0?=
 =?utf-8?B?Z0RBOTgrTncyanVCeExmMG5QRjA0Mk9oQSt5V1FWR2tOYWs5OTlrTC9EMlVm?=
 =?utf-8?B?R3NWb3NoaFFwNzNFQ3h5d1BMNTV3U3dXamhjTmRNd1ptMFZLb2d5N1ZjNTFP?=
 =?utf-8?B?TEVJVC9ZTVRydFNHRjNiOGk0dnYzN3ptQ3hPVWhWbzM4eWZ4ZGEzOEpuSUho?=
 =?utf-8?B?VDdBY2x1RFZxUHM3WlBLb2NkS1RhU2hyakRQVTVyeUdvUTVxLzR1Y05mRjd3?=
 =?utf-8?B?TS9FcEN2VDJwKzdvTmR1ZXB6N3Y4bWEyblloZDJWdzFrNDBLK3hVSStxUTB2?=
 =?utf-8?B?dlVmc1QrZlUxbTI3aStOaXhaUFZpaUNOSzVHSVlvbDJ3TGl4UG9mQTN1SmFx?=
 =?utf-8?B?cXRIZXNTUWE1K00xWVg4dUpVTkJuM2hDbkp4Wk1Yc3lJWXFvSTdnamtDS1NI?=
 =?utf-8?B?VE1iaVBhQy93eVhhOTdaT3R2OUJERXFHK3RLSUNwZy9vMW15SEpGb3V6bGJ3?=
 =?utf-8?B?Z2RQVXZYdGdYNEVkUjNnWEJBeVZ0WnYvQTgzcDV2c2hHbkMyOXYzcisrdlFj?=
 =?utf-8?B?dzlMNEZqTjlVR3hLUGMxbGkvemUxd2QzMjNGZ3lwK1lXalNPTm4vbWthUk5o?=
 =?utf-8?B?cEdBMGhSVTBpTXExdTk0azNtdUpkR1V2VlhVRkVnanM3WWxibWlsTUdpZHVK?=
 =?utf-8?B?L1lBaXlqQ2tWRkxCc0JWN29JK3duOW1jRFJ5VU45R1ROYzBSZDZKSmlIbS8z?=
 =?utf-8?B?SlVrVmFsYXpXdXFzN1EvNmpiNE93NTdYeTdzZWJURGY3YVVmUDJNRkFzV1FN?=
 =?utf-8?B?U0g1MzUvWE1nbE1vaDVGbGdZYmdNN1p2TngrVUNRWnR3cXJQQ2VpTUluNFBh?=
 =?utf-8?B?SS9NNUJHS1R0STJLYUF6SEpoWkZzN1lGVkxKUm9LSENmQkVsc3pIcGNNZjdv?=
 =?utf-8?B?a2lZVWVnRVpDenR4Tnp4MGp3TFpEbXFzcmp5TnIvNHBqbDhWR0I2WDZqdm9S?=
 =?utf-8?B?aUtpdEJCcHFPT1Vqalp2V1VjZjlHWmRHaGtKRkJqY21sakFlL29WY3FuU25R?=
 =?utf-8?B?TWtuUlg5czZ1ZzlOLzRlMzR5MElLdTg0ZzNwd2xEdGVpSjB0cmQ2WHhRNG94?=
 =?utf-8?B?L1JWK0U5NDJOWFUxY2FzMkhoV0VPMmlTZTVhSkVRNHBjdTB5NlE3ZXpBeUNs?=
 =?utf-8?B?MGg3UHpIK0o5UEY5eHRVZjRYaWlXQlQxb3p3RGVTYUc4dm55ckZkeU5kM1JB?=
 =?utf-8?B?Mk5qNWRnclc0MUxvNEd6Wk5Za1dyQW5ya0s2RDJZQlkzZ1c1WjRQVFBaZGwz?=
 =?utf-8?B?QzlzSkFBbEIrVmJWdHRBYmxmQmwyQUxYazgrcnVHdklWbGZxTER2dEVLQ1hq?=
 =?utf-8?B?NjJyVnh2KzMxdTdmUlhBdWE4QzhnMUZsc3kyUWtBRVlRbnpkTmxwaEJrdDI3?=
 =?utf-8?B?SU9OSDRFbTE1R291VGE1M1IxdlZEQ3ZoMlJWNURzMUwrSFRQSXJsdVd2b3Vu?=
 =?utf-8?B?MC85dmJ1L0tpVGhGTERMRnhGZVFPWlFTWmVjcjh0cGdxbVpHMTRzK1o0d2Iv?=
 =?utf-8?B?T0ZJUGc5ZnJOZ0YwL0ptaFZBdVpvSDVaMzNwZU9qOHkyTWZjeEFqcnRXRGZO?=
 =?utf-8?B?YkF5VkNpVXUxcHFVa3YwaTBwajAwMmw1ZEdldXV6NUdqWFZmQzgvaXQrdEpo?=
 =?utf-8?B?dFg2RytFc1p4ME0wbnhMWnhpQS9QZEpSRmZYdERSeFJ1YklNdUdNRmMrdVA5?=
 =?utf-8?B?UXhlNWhBVVVMdFFPVnVDN21PSERVMmhranE5ZDY2TkFQSC9VcUw2UFN2QlZq?=
 =?utf-8?B?UkdWZC9LZDJvTUpTMnpFK0kxNFpxME5WajBYOVZ0YmM0dVo4KzN2ZURPQk1q?=
 =?utf-8?B?RlA3eUsvM3BRd1F3c01xbWhBV3ZITnM3dVZ6bGMzQ3VaYmdYRXh0U0I1Z3ZJ?=
 =?utf-8?B?cW1JQXZvcmQ5by9uYUZBUXZzeVpyUEhCMXo3QzB4NWd2VDIvMEwrRmwxYS9z?=
 =?utf-8?B?NlB3MlBrVDFROGRDZ0VPbFhWTTRiSVJzRVZMdWFEOTRwUXVWT0QyWUl6QSts?=
 =?utf-8?B?QVFIbStlbTNCcE9OTmQrUHk5WitRclcwVjduamc2eVZ4MU9MRTl0V0NBdTFv?=
 =?utf-8?Q?bIAl37DMvgdEu23+XVjbHQrKXCqfLd6xckC7CMpQNE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc68ab99-e1f3-404d-60bd-08da02114c40
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 21:10:54.5052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thAZdQT9Aw9vQ/mft18gkBu5AOSGJIOBcABtNfg3bw7KeaO3dDdwocpMR7QZQOgFiQhk51hxjqHVSpyYXfMcORpRzQBoyr6x1r9rwtlM1W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/2022 01:43, Tvrtko Ursulin wrote:
> On 03/03/2022 22:37, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> GuC converts the pre-emption timeout and timeslice quantum values into
>> clock ticks internally. That significantly reduces the point of 32bit
>> overflow. On current platforms, worst case scenario is approximately
>> 110 seconds. Rather than allowing the user to set higher values and
>> then get confused by early timeouts, add limits when setting these
>> values.
>>
>> v2: Add helper functins for clamping (review feedback from Tvrtko).
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> 
>> (v1)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c 
> b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b3a429a92c0d..8208164c25e7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2218,13 +2218,24 @@ static inline u32 
> get_children_join_value(struct intel_context *ce,
>  static void guc_context_policy_init(struct intel_engine_cs *engine,
>                                     struct guc_lrc_desc *desc)
>  {
> +       struct drm_device *drm = &engine->i915->drm;
> +
>         desc->policy_flags = 0;
>
>         if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
>                 desc->policy_flags |= 
> CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE;
>
>         /* NB: For both of these, zero means disabled. */
> +       if (overflows_type(engine->props.timeslice_duration_ms * 1000,
> +                          desc->execution_quantum))
> +               drm_warn_once(drm, "GuC interface cannot support %lums 
> timeslice!\n",
> + engine->props.timeslice_duration_ms);
>         desc->execution_quantum = engine->props.timeslice_duration_ms 
> * 1000;
> +
> +       if (overflows_type(engine->props.preempt_timeout_ms * 1000,
> +                          desc->preemption_timeout))
> +               drm_warn_once(drm, "GuC interface cannot support %lums 
> preemption timeout!\n",
> + engine->props.preempt_timeout_ms);
>         desc->preemption_timeout = engine->props.preempt_timeout_ms * 
> 1000;
>  }
As previously explained, this is wrong. If the check must be present 
then it should be a BUG_ON as it is indicative of an internal driver 
failure. There is already a top level helper function for ensuring all 
range checks are done and the value is valid. If that is broken then 
that is a bug and should have been caught in pre-merge testing or code 
review. It is not possible for a bad value to get beyond that helper 
function. That is the whole point of the helper. We do not double bag 
every other value check in the driver. Once you have passed input 
validation, the values are assumed to be correct. Otherwise we would 
have every other line of code be a value check! And if somehow a bad 
value did make it through, simply printing a once shot warning is 
pointless. You are still going to get undefined behaviour potentially 
leading to a totally broken system. E.g. your very big timeout has 
overflowed and become extremely small, thus no batch buffer can ever 
complete because they all get reset before they have even finished the 
context switch in. That is a fundamentally broken system.

John.


>
>
> With that:
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Regards,
>
> Tvrtko
>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine.h      |  6 ++
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c   | 69 +++++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/sysfs_engines.c     | 25 +++++---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h |  9 +++
>>   4 files changed, 99 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h 
>> b/drivers/gpu/drm/i915/gt/intel_engine.h
>> index 1c0ab05c3c40..d7044c4e526e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>> @@ -351,4 +351,10 @@ intel_engine_get_hung_context(struct 
>> intel_engine_cs *engine)
>>       return engine->hung_ce;
>>   }
>>   +u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs 
>> *engine, u64 value);
>> +u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs 
>> *engine, u64 value);
>> +u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, 
>> u64 value);
>> +u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 
>> value);
>> +u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs 
>> *engine, u64 value);
>> +
>>   #endif /* _INTEL_RINGBUFFER_H_ */
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c 
>> b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 7447411a5b26..22e70e4e007c 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -442,6 +442,26 @@ static int intel_engine_setup(struct intel_gt 
>> *gt, enum intel_engine_id id,
>>           engine->flags |= I915_ENGINE_HAS_EU_PRIORITY;
>>       }
>>   +    /* Cap properties according to any system limits */
>> +#define CLAMP_PROP(field) \
>> +    do { \
>> +        u64 clamp = intel_clamp_##field(engine, engine->props.field); \
>> +        if (clamp != engine->props.field) { \
>> +            drm_notice(&engine->i915->drm, \
>> +                   "Warning, clamping %s to %lld to prevent 
>> overflow\n", \
>> +                   #field, clamp); \
>> +            engine->props.field = clamp; \
>> +        } \
>> +    } while (0)
>> +
>> +    CLAMP_PROP(heartbeat_interval_ms);
>> +    CLAMP_PROP(max_busywait_duration_ns);
>> +    CLAMP_PROP(preempt_timeout_ms);
>> +    CLAMP_PROP(stop_timeout_ms);
>> +    CLAMP_PROP(timeslice_duration_ms);
>> +
>> +#undef CLAMP_PROP
>> +
>>       engine->defaults = engine->props; /* never to change again */
>>         engine->context_size = intel_engine_context_size(gt, 
>> engine->class);
>> @@ -464,6 +484,55 @@ static int intel_engine_setup(struct intel_gt 
>> *gt, enum intel_engine_id id,
>>       return 0;
>>   }
>>   +u64 intel_clamp_heartbeat_interval_ms(struct intel_engine_cs 
>> *engine, u64 value)
>> +{
>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>> +
>> +    return value;
>> +}
>> +
>> +u64 intel_clamp_max_busywait_duration_ns(struct intel_engine_cs 
>> *engine, u64 value)
>> +{
>> +    value = min(value, jiffies_to_nsecs(2));
>> +
>> +    return value;
>> +}
>> +
>> +u64 intel_clamp_preempt_timeout_ms(struct intel_engine_cs *engine, 
>> u64 value)
>> +{
>> +    /*
>> +     * NB: The GuC API only supports 32bit values. However, the 
>> limit is further
>> +     * reduced due to internal calculations which would otherwise 
>> overflow.
>> +     */
>> +    if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
>> +        value = min_t(u64, value, GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS);
>> +
>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>> +
>> +    return value;
>> +}
>> +
>> +u64 intel_clamp_stop_timeout_ms(struct intel_engine_cs *engine, u64 
>> value)
>> +{
>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>> +
>> +    return value;
>> +}
>> +
>> +u64 intel_clamp_timeslice_duration_ms(struct intel_engine_cs 
>> *engine, u64 value)
>> +{
>> +    /*
>> +     * NB: The GuC API only supports 32bit values. However, the 
>> limit is further
>> +     * reduced due to internal calculations which would otherwise 
>> overflow.
>> +     */
>> +    if (intel_guc_submission_is_wanted(&engine->gt->uc.guc))
>> +        value = min_t(u64, value, GUC_POLICY_MAX_EXEC_QUANTUM_MS);
>> +
>> +    value = min_t(u64, value, jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT));
>> +
>> +    return value;
>> +}
>> +
>>   static void __setup_engine_capabilities(struct intel_engine_cs 
>> *engine)
>>   {
>>       struct drm_i915_private *i915 = engine->i915;
>> diff --git a/drivers/gpu/drm/i915/gt/sysfs_engines.c 
>> b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> index 967031056202..f2d9858d827c 100644
>> --- a/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> +++ b/drivers/gpu/drm/i915/gt/sysfs_engines.c
>> @@ -144,7 +144,7 @@ max_spin_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>              const char *buf, size_t count)
>>   {
>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>> -    unsigned long long duration;
>> +    unsigned long long duration, clamped;
>>       int err;
>>         /*
>> @@ -168,7 +168,8 @@ max_spin_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>       if (err)
>>           return err;
>>   -    if (duration > jiffies_to_nsecs(2))
>> +    clamped = intel_clamp_max_busywait_duration_ns(engine, duration);
>> +    if (duration != clamped)
>>           return -EINVAL;
>>         WRITE_ONCE(engine->props.max_busywait_duration_ns, duration);
>> @@ -203,7 +204,7 @@ timeslice_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>           const char *buf, size_t count)
>>   {
>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>> -    unsigned long long duration;
>> +    unsigned long long duration, clamped;
>>       int err;
>>         /*
>> @@ -218,7 +219,8 @@ timeslice_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>       if (err)
>>           return err;
>>   -    if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>> +    clamped = intel_clamp_timeslice_duration_ms(engine, duration);
>> +    if (duration != clamped)
>>           return -EINVAL;
>>         WRITE_ONCE(engine->props.timeslice_duration_ms, duration);
>> @@ -256,7 +258,7 @@ stop_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>          const char *buf, size_t count)
>>   {
>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>> -    unsigned long long duration;
>> +    unsigned long long duration, clamped;
>>       int err;
>>         /*
>> @@ -272,7 +274,8 @@ stop_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>       if (err)
>>           return err;
>>   -    if (duration > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>> +    clamped = intel_clamp_stop_timeout_ms(engine, duration);
>> +    if (duration != clamped)
>>           return -EINVAL;
>>         WRITE_ONCE(engine->props.stop_timeout_ms, duration);
>> @@ -306,7 +309,7 @@ preempt_timeout_store(struct kobject *kobj, 
>> struct kobj_attribute *attr,
>>                 const char *buf, size_t count)
>>   {
>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>> -    unsigned long long timeout;
>> +    unsigned long long timeout, clamped;
>>       int err;
>>         /*
>> @@ -322,7 +325,8 @@ preempt_timeout_store(struct kobject *kobj, 
>> struct kobj_attribute *attr,
>>       if (err)
>>           return err;
>>   -    if (timeout > jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>> +    clamped = intel_clamp_preempt_timeout_ms(engine, timeout);
>> +    if (timeout != clamped)
>>           return -EINVAL;
>>         WRITE_ONCE(engine->props.preempt_timeout_ms, timeout);
>> @@ -362,7 +366,7 @@ heartbeat_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>           const char *buf, size_t count)
>>   {
>>       struct intel_engine_cs *engine = kobj_to_engine(kobj);
>> -    unsigned long long delay;
>> +    unsigned long long delay, clamped;
>>       int err;
>>         /*
>> @@ -379,7 +383,8 @@ heartbeat_store(struct kobject *kobj, struct 
>> kobj_attribute *attr,
>>       if (err)
>>           return err;
>>   -    if (delay >= jiffies_to_msecs(MAX_SCHEDULE_TIMEOUT))
>> +    clamped = intel_clamp_heartbeat_interval_ms(engine, delay);
>> +    if (delay != clamped)
>>           return -EINVAL;
>>         err = intel_engine_set_heartbeat(engine, delay);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> index 4b300b6cc0f9..a2d574f2fdd5 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
>> @@ -262,6 +262,15 @@ struct guc_lrc_desc {
>>     #define GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US 500000
>>   +/*
>> + * GuC converts the timeout to clock ticks internally. Different 
>> platforms have
>> + * different GuC clocks. Thus, the maximum value before overflow is 
>> platform
>> + * dependent. Current worst case scenario is about 110s. So, limit 
>> to 100s to be
>> + * safe.
>> + */
>> +#define GUC_POLICY_MAX_EXEC_QUANTUM_MS        (100 * 1000)
>> +#define GUC_POLICY_MAX_PREEMPT_TIMEOUT_MS    (100 * 1000)
>> +
>>   struct guc_policies {
>>       u32 submission_queue_depth[GUC_MAX_ENGINE_CLASSES];
>>       /* In micro seconds. How much time to allow before DPC 
>> processing is

