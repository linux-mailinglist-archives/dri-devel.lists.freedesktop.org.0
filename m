Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D383F3780
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 02:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5616EB40;
	Sat, 21 Aug 2021 00:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599496EB3D;
 Sat, 21 Aug 2021 00:07:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10082"; a="277879492"
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="277879492"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2021 17:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,338,1620716400"; d="scan'208";a="533185279"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2021 17:07:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 20 Aug 2021 17:07:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 20 Aug 2021 17:07:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 20 Aug 2021 17:07:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVbXulY7MAvTB9S3X+yq/sQitXkBCn/JYiH5JoQ3jinZjcqmpBwVJijjAiBdHehrbvLGebH/Ln2dGw/DFMi4nsWKWUPvfA6VWm6ERiO0CEmLxxHqM8bVmuN6v9WA61t665+L6QszrSSwbvNSRCEA30+6aIthFdM7u0TL+Q8VYimu+XJIEEGugOQgNb4MnKsLomuMXUNiZZozWGTkM3hwPHERgI2SBU+MpKV1zS5ZvNFqbVnQD/7/8x8lZwO8J2zWZpqGHQoWvOUJ4cDE2IzGQy3HjLgVONmCPu8rHHX28DUmSMG9hqEyEJAKIRE6scVvJqRdPC08DiRpEjiPMgw2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fc+NlAI8tC2ycY8FYTfs1DEnJM2R8dyPb1zPpyGC0GQ=;
 b=SEgLwQmdrvZWpabhWZ1PjzoMVlcUduFEMr9B77rqVPGEu+Yn/Dm7JXKiv1Aq/oCM/wuAxxG5Ldxpp+Av/dJ2evA2tvBdBZ56dejuQkS/DAQ0j4jGs63iF+e9mDp7dKj/mBQnPeu404s/znYZMDFtUs+/vuM/z3iRitjDK1gOHGTdDxPSyNuhpvRUW6w8jNpbcKXlzWmAf1tJQ6p1LV1uz7b+Z2IFYRReIXIjqHpvZgxiCGi4EMKD1DD5kiqqYeDF/HrbrtK1lyMYWg0jMiO/X8WspRnL3vlLB+YZEWtLCsBZuiMV9fA8kHOFYaMF58U55xysQ+tna5JJb4ZcKNRQJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fc+NlAI8tC2ycY8FYTfs1DEnJM2R8dyPb1zPpyGC0GQ=;
 b=hwjZE1dDE4FznwvtXJD5t84F0Hj5l0izDMis2jEQhc0neTed36IBcNiO9+jhOX4jNYw33Ni1lwvNUDpdOxrW/N0ETLrOchfpjRamow8FsXVDooxoR0Jok5tw75ac34GjfOMt3sbfYAN/0BLpXy/DtOOyn+dVhQWBD7cbeAu4wak=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1948.namprd11.prod.outlook.com (2603:10b6:3:112::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Sat, 21 Aug 2021 00:07:30 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::b96b:79f6:c1fb:13ff%9]) with mapi id 15.20.4436.021; Sat, 21 Aug 2021
 00:07:30 +0000
Subject: Re: [PATCH 13/27] drm/i915/guc: Take context ref when cancelling
 request
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-14-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <d25c1702-f529-8601-dd1c-ca0ac59d5f5b@intel.com>
Date: Fri, 20 Aug 2021 17:07:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210819061639.21051-14-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MWHPR1701CA0006.namprd17.prod.outlook.com
 (2603:10b6:301:14::16) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 MWHPR1701CA0006.namprd17.prod.outlook.com (2603:10b6:301:14::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Sat, 21 Aug 2021 00:07:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aa5e612-3ed6-4daa-c8c8-08d96437aadb
X-MS-TrafficTypeDiagnostic: DM5PR11MB1948:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB19489BB2DFE25371545E62A3F4C29@DM5PR11MB1948.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bp1s0W9udgm4pWdPr6eEQg8NitOjyh6iKpo+HxveKiyT1ISujpmZuoWYtfoXiayai0Sgc8n2Iu9yc9GnhReld+4nk/byznX6a9JzEA25DQzi6jBMZjNorwvpeDHNvvOHiFcBfmVoV5XJk62cLaVvnshmrRqrrBL95ni2C5Geyi6b08Eh1D2gOk7fGQf3IQsjG8YSByADTvmdV1h6FzY+KCTGuVBCE4YVBI9IQg97OhozZglHQJGQUIAoQwYNJvqkthAlMFtV5fTeTokhVmevyarBMfnwOkJhOSOt4PbS1w+Hxy//5cljcrTKxOIPyHP4VdwdlF+Zn+OuS1i/jFLS3VJCjfeMFwvSgdT1m/Hg+7nHgCftkpQCGvD8m9s2US6VpMsBMxlzWjhzEALqr/SVigE5AQYdm4f1svrOXzO9m6k3OSLMirk3DHWUlwp79YdAhtg9wtvvKxLcwooXrxPQFd37hdSGVpGouyI7hDLz4KDTN6cfO2YSNmbHIr1lc6nRawFNpMp5AEHs4NIMXr63jv/JKr5CJ6jD3A1ho3wDwO+AkSp3ltTHkEl7ODMv6snoN9L6Ryq3sIYlMabMf7ItnnAEHgqeRPxwgd082ztT0wH2ub21yJ9tdPGYiaaPe/XNue6huXSusWItFAYCQhLlBgVLBgH8GSSDsYN/eBGHcWQ37NKejpmYIPNFarcFE6ybVvKfHAWdqsBHftcNkdkdADZpw5NZ/iV4lkHnY44kDfUFUIaY8nOyECFda6IWg2B3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(8676002)(186003)(316002)(31686004)(4326008)(38100700002)(16576012)(6486002)(66946007)(83380400001)(36756003)(2906002)(31696002)(66476007)(26005)(66556008)(2616005)(53546011)(8936002)(956004)(86362001)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGltMUIvSlZvUEs2T2JieFM5bVVnYjNZVE5FUTlxeE1oQ2Q1RjFtNXhrNWpu?=
 =?utf-8?B?NGsyMmZqM2JZVkp0ZnlaWG5NdUJORmpCeGRYcUU4UGV3Rk45QTFKT3VZRHI3?=
 =?utf-8?B?VEw4Q0FJWkNuVUlOY3o1a1cvR0wwMW4wTHVOMmVpNXFjSE5qZFBjNm9OZjJ4?=
 =?utf-8?B?VnQzczMwbXFoU1BlNHlnRWY3WHN6UDhqR2t1RlpxMHF1RTMvTkhvNUtDK1gx?=
 =?utf-8?B?VWlxT0FLTThUclFvOUY0K0NoUXE5TE1RMkcwb25hMU5BSFNIVzhINUIrV2VX?=
 =?utf-8?B?bmdrMFVPTnVyMmdMK0NudHZFSFFGY09uMTRXQXV0WDNCRXd3NnA3YlVOY0Jn?=
 =?utf-8?B?TWl6UWRYYTQ3eGFhdjJ4THRXa2s4K09tUmYvSkRwaUZUemZIbzJuc3J2T2du?=
 =?utf-8?B?Y0ZwY1FmcEdERzhQR2g3ZEpNaWtPamVXdVYzQVlzdXd1TXpLWkNkS1ZrL28z?=
 =?utf-8?B?aXdDSDlkZHdNcEEyT1hicFpQQ1lhMVY3WUJ3MmZPa3NocHdUdVBZZE1WQ1l4?=
 =?utf-8?B?RlNtdGxOYVl3MWF0Q2RxTmFrZk41VzNHZE5KdmZhYTB3Zkd4RXQrUWlSaDh4?=
 =?utf-8?B?UU9kU2dZaUcxaFF1dG5tVEIrbWtOUWxER1o0Qmdhb1YvU3M0eHJuTW5wa29k?=
 =?utf-8?B?SGRLdENWRE5vYnVRamgvVldHbVEwbzlEOGFyNkorSGNiUCtVS2ttUDJSbVVt?=
 =?utf-8?B?RDVGUzBUN2ZPdzA4TkhlQVp4VHNIL20rUm8zQUJtYlgrUFM3dEpEVTk3R3pE?=
 =?utf-8?B?Wi96NThKSytMbjNjcktDRU0yUXhmZlhrTzU0aVZpTllJVmtibFZxT0NOTEVX?=
 =?utf-8?B?TFRDMnFGZmhPeFp0Z2pqb3dQUkFMSnlNNmpCeGVGWHFyY3FKbGJxc0owR0NK?=
 =?utf-8?B?L2dIMHpCZFNxYllsdmNmWVVudUsyVE1xNjNWT3VSM1l1OGFpTGkvdlBRWE5X?=
 =?utf-8?B?VmRiYVh4VjBKY2V6bzBFa2pYS0FIKytKR3hUbERIRXQzVExXbGZZN1VSSDNG?=
 =?utf-8?B?VzU2bTlWbDBvUzNXY3g1dGg4cjFOVmtDbVJ2cUdBcC9jUDcyd1FKVzVKVHZy?=
 =?utf-8?B?bStsSWhZUDNhR0NEUU1BekNxckxFTUx4R2t4WUZnc2REbUVPL09aOVNPYzhY?=
 =?utf-8?B?emQ4UHRwNjFuV0lzbEx4NHViRHZ1RTdrTmplcCtmcG5kUkg0TGlvQjdIMGhG?=
 =?utf-8?B?TE5aNldIUWNFYWhZMllUS0xpSDloMkRCdjhUSmNEbXJGTWM5WjA2OTI2UzV6?=
 =?utf-8?B?aHUyOWNvSWtPNWMxajc2K1JaZExRd0p3VHpicklJeDN0dkJTdWk0MEtKYVRH?=
 =?utf-8?B?K3ZWTUQvQm5PZUd4dDREaHY1NmNabzVpLy8rUnk1Z0JFSkw2L0REZWxVTDVM?=
 =?utf-8?B?UXo5a214YzU0NW1VUE5sQ2p3WmZVZlVxTUhVTlhvNG5RZDc1Sms0bFJ6MUpO?=
 =?utf-8?B?R3lka29yNmx1NG8vYzBLejZqNEF3TzdSaTBRS3EyR24xRzBEcUdDUHNRenNq?=
 =?utf-8?B?ZFdaRGVsVE9pTmlZVzZZbmZ2RVUzUFRsT3hEZm9ocWs0NndsN21sVWZTRm9t?=
 =?utf-8?B?UHdLU0dSb3pSQWVBdDVvc01oTVZ5TU5GT00xRVJzN0ptcEdPdXVYclVSa0Ey?=
 =?utf-8?B?MGoxY2hOd3k1YklFcld4T1RNZlFtWDN2aTRTYTBMTWlLY3IyYzJzb2xZNWcv?=
 =?utf-8?B?eThpaXNOUUh0OG5aNCtzSkVSNnhvUDJEMTdadGNxeWdOZVgrZkdtdVlYRHY5?=
 =?utf-8?Q?ebm6K84LWMeDlxEU4qumdbwaCcT+KmijbFu1s5r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa5e612-3ed6-4daa-c8c8-08d96437aadb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2021 00:07:30.5042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bG2Oovt15dcnzQyteMpoSOtdutzoIbyp2RI62JNpwxDRULxRlr0O3wVZ73pMoWenqrWk6VLLxAG4g/1ottSZmTLwnLiTdV0a/1cLb+zN4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1948
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



On 8/18/2021 11:16 PM, Matthew Brost wrote:
> A context can get destroyed after cancelling a request so take a
> reference to context when cancelling a request.

What's the exact race? AFAICS __i915_request_skip does not have a 
context_put().

Daniele

>
> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index e0e85e4ad512..85f96d325048 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1620,8 +1620,10 @@ static void guc_context_cancel_request(struct intel_context *ce,
>   				       struct i915_request *rq)
>   {
>   	if (i915_sw_fence_signaled(&rq->submit)) {
> -		struct i915_sw_fence *fence = guc_context_block(ce);
> +		struct i915_sw_fence *fence;
>   
> +		intel_context_get(ce);
> +		fence = guc_context_block(ce);
>   		i915_sw_fence_wait(fence);
>   		if (!i915_request_completed(rq)) {
>   			__i915_request_skip(rq);
> @@ -1636,6 +1638,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
>   		flush_work(&ce_to_guc(ce)->ct.requests.worker);
>   
>   		guc_context_unblock(ce);
> +		intel_context_put(ce);
>   	}
>   }
>   

