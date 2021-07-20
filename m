Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07B83D027E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE586E3DB;
	Tue, 20 Jul 2021 20:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959016E3DB;
 Tue, 20 Jul 2021 20:05:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="296881030"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="296881030"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 13:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="432288478"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 20 Jul 2021 13:05:19 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 20 Jul 2021 13:05:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Tue, 20 Jul 2021 13:05:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 20 Jul 2021 13:05:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkId2KkzPWZeFmNNu17xuU1A5ndxpZe0xa++7W+wqBpP2ekZl5pHYU0FGQ4IQ2qCDZ4ZtmxDWkjkV0b20RRhJM5jLBXO3Pejj6oep3GGZgoK7ldEwT42XAbV4GWvEjE41xrKTAXN3+vvhgScyNPKCmrbgDy+oD1sZ0liUBbNBvRSAbjEomDs9PXMR6qg0lvc7rOIhX/kJwod6iSjP5Ab5orNGPsSAZgvxOKxrhdWDH1gdMMtxw53uh4Srrf5sukkAWSjN9oylOF28VAesSmjKB323g65qXtU/PnKbIFF3GqrT4qRYSbN2TpmywdX2fyBlkzveBstWCUW9FvERDMi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju0r/se2IcQpUtGeBZx0Kd5V1VuXCOzrc6ahgbnqiy0=;
 b=cKqrLR9jf+pAooAG/EhsjRnRSG/9v3KB4N1T/GXysJEIHjqoyP1UIpAMQzKmooYm32AVaqIiMvP2szz340mEVlVFm1uRXEo1YMG8hc0Zp46t0TfIGMJMhfQk3ysmCfEs1QsrCHuSgG95jSlIrOroS7W7PPk+BdV6s2k+LlP+bePRc82r0dYeu4KuWHUHe+qi1gVnF5yzf1KbNw6rgFEp4zUnla/I+Hlc9HmhwMii4bS7oCN+Hp8/6A9JtRRRI5m1dYCjKsr0Ldq5XHPMgc27S0F4+qm4Rh0cqAi9n849DEth2Dto9Dxo+cooIUrknPY+AYI3M1cp/MrwbloWNAsxWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ju0r/se2IcQpUtGeBZx0Kd5V1VuXCOzrc6ahgbnqiy0=;
 b=j/2xVC0Ppz4JVXMXMVW18ffcqrGKNvns7oBnM/Hie1Z/af7vlEuPG4XIOLIEt1BkGla2MUwOunoT4u9WZSU/o3V+hc/iYbxWZxSvrQOMo2m9m6yKNleS5oo6W3GPjczvlN1qzUZEYEKjbhMlZDxzKMkpE/u/iRF0QnfEuftlT+U=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5595.namprd11.prod.outlook.com (2603:10b6:510:e5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Tue, 20 Jul
 2021 20:05:18 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%8]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 20:05:18 +0000
Subject: Re: [PATCH 25/51] drm/i915: Move active request tracking to a vfunc
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210716201724.54804-1-matthew.brost@intel.com>
 <20210716201724.54804-26-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <5f9f2578-5711-4c88-e7ae-77c843fdf483@intel.com>
Date: Tue, 20 Jul 2021 13:05:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210716201724.54804-26-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: SJ0PR03CA0328.namprd03.prod.outlook.com
 (2603:10b6:a03:39d::33) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 SJ0PR03CA0328.namprd03.prod.outlook.com (2603:10b6:a03:39d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 20:05:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b57846b-54be-4dcd-324b-08d94bb9b20d
X-MS-TrafficTypeDiagnostic: PH0PR11MB5595:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55956DA8035A8BFA48966CC5BDE29@PH0PR11MB5595.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +e/ePR9bFLDCsspnTkUQ24bTVszQ1VY5HAZWzRGPhVDw3nr7K5IzpsCrYvFTijgSC5PBfeOhXQE+CVFWD3jD1832/C9r1YUFDghxqXYOnv8UCPYEUz7w4Y1DOMArcRFmbWPn6srDhugiCCLF2LkWFe/EgjDw3UeTgA20Q8E7ZKTlZ+pAcQGmt24/y4ofIc/LRWfx2Wk5sl7210x3za2Hw3nCo17aaDtUuisaYsrtX9Iods/4MpqcFHOyze9md28GqdfKB1+Jr3M97LbP1hlRIuH/2OcdZbgGdqihJb0rIHV21YYdD5ctWh/lzXBntBuKDCJnx9NH4nZQA1le5WOUMEZRBCn6NEF6pnnrWuGc4q0fE8rfs3m3MU0OKIExwiWEDv4JttbfjG8R6WKY8m+YVJuW6D07H+fUxAuDtR7r1Z/ysMvvPTaVUfawVIZqFuyWPsFdTyZagIcrbjXGo2Cs2S04etmM6ezQ92UAHj5H1Xp89DSVIHHzIyoVKrL+G8SZC3/bSyvU9Hj6u5POmKbJRYwFf7R9+2+n2Jm4/t/t5nDKl/9IPRrWsgXFNpn13m2wV2TeW8b4V9uF6m/mWvcRTP3SLFhkSVDXJ8qoLSrBMHSAws1yi1qwBnukbPBMZbwoH+r/cEOfO0qESqHuxQmNFLkGUr2AugU9Yuj9BCtaVIy2TYCCIYhu62H1cWQsu/nscf9a+U1nACp2Otm0h8gwpujawM+pJt89ibqCkkA403r7zR5tBnZEw+6C2wplY4Uz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(4326008)(450100002)(478600001)(31696002)(66946007)(36756003)(186003)(16576012)(66556008)(8936002)(8676002)(83380400001)(86362001)(66476007)(30864003)(107886003)(6486002)(26005)(5660300002)(2616005)(956004)(2906002)(38100700002)(316002)(31686004)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTlEQWZCN2xPU3JrcGFRVGlvc09KTVVJV2lxYVd6ckZvajM4ZVJqQUsrUXlG?=
 =?utf-8?B?T2JFc0Vvb2FrbXV6NEtMSm1wakE2a1FpbXJvbzNkeFhxRTEybE9lMzZ0Uit0?=
 =?utf-8?B?MlRZZEFmcWg2RGwxN0g4alpaVUQ5MENpY2VHRmlDZGpXMWxLbWxPQzJFQlk1?=
 =?utf-8?B?UE9Md3l6OUsvM1dDcWlRM3hVdGNVcmZlR2w1R0ZMRmphVnRhc3N5SFAvVHE1?=
 =?utf-8?B?K2tnVm41d3dqbFRrdVA3b0tpRkQvZWJqdlZmaVBGSE1tRVM0MUV2NDJRcjl3?=
 =?utf-8?B?MXcrUnpUcFdBS210NERiTUdmMWFLaElSNTdxWnVJditRUnR5dUxIZnF6ZjNi?=
 =?utf-8?B?YTVBQksxQlZKNVVKcFFxbEJQOGw5RTh6b09ObGZnQmN0VWNrVWhJMUExVi83?=
 =?utf-8?B?a0R1Vk9Lc1c4b3I0OE5UZVNwdTUrV3J5enNIVjBUSHoycGN2V05JMHBtUjJS?=
 =?utf-8?B?NU5nQURCTkJDaHBvVjNoOTFKa0tHeDVtZEN1RFlTL1hiWXIvclQ0NUF4VzJ2?=
 =?utf-8?B?dU1HZThoRkN6djBFUkZkc3NOS0xZemNzWmtlZjJXbzNRUUNSSzUxdWpmV3Yv?=
 =?utf-8?B?Ym9nTGtLcThqcTFBQS9sS1UyazVBeVhYblFKT3QzWm85cjZlcG5KSkxTV1dI?=
 =?utf-8?B?TlJIbXdXaXVXckNkK1l1UnliUTIrWTZId0NVMUdxa014WHA4N3V3V3RWS28z?=
 =?utf-8?B?UWdGQjRoOEc1bUNMUk1zc1lFVHBRQ0Y2QkM2d29JT2srSFhqVzRFMlNoUldv?=
 =?utf-8?B?aXQwalkxb3VrZkZxY1ZwcXl6ZGk0MzVBSzNmaHZHdmFBcDhDRHcrcXU0U1dY?=
 =?utf-8?B?SFNMNm5TWElYR3R4WjkxS3VOL3hmc2lja0FqL2lPWDc1OGF5MUY0M1RDZ2ZU?=
 =?utf-8?B?RmV3K2FwVVFMSVBPS0hzOXAzbmtYbEVpZDQwY3hGaDVvS1k2NW0vNTlrdWt6?=
 =?utf-8?B?eDVpdTJTQVJIZWhWeWkrRTNJNjRYSFBmNGhNdXVVNG05MHYzSzdwRHVzbEJM?=
 =?utf-8?B?WXNIb2czVkFlMTZwTHI4MHptbUp3NVZST2VuVGNoanhwNmZDcXF5YUNiazd5?=
 =?utf-8?B?dVJoWXJHSnFwTFlQbjlHUVNSUERXUTZETENVelJjSWFQbWV6ZEU2VVcxQUVZ?=
 =?utf-8?B?aU5jckp3QkZRMlFkdXB6QzNjMkN0dGdlV2lZYnZRUXZJSHhpRkV6RElnaXBw?=
 =?utf-8?B?cXk2b2ErRllmcThsYVM0K2QxejRHUGM4Ny9KWUI1NDROMVlkWVNIUVZkZXFp?=
 =?utf-8?B?MFpaV3dPOUlVZmtYdEFKQ3crUzdaY2c3b1JZajdGMzdZa1NRSm50Zk9kUDBn?=
 =?utf-8?B?TitxUlA1dG51UXdzejZiTEpxbTByUTJ1b3MvWFphTGZSV1ZDR0ZORzAvU0Nr?=
 =?utf-8?B?WGlRZVIzUGxVRElySjlGTlBCRTRZbjNPSi9XMm5pdGI2MjhEVVlDNTRMRk9m?=
 =?utf-8?B?b1R4R29hUEhkZ1pSK25mS3hsaEFiK3BvZ0l1bjk5VTZsd3huS0JodWN0T2k0?=
 =?utf-8?B?RVhlcC9RUXFYMjNmMzNTU3I2NHBZazBpeUk3RTJmdEVicnFUZWJSVEJUQVNx?=
 =?utf-8?B?N3pzYUNzNWxzM2tpOExweDNWTDFaWU9kNEp6akNzMnlyR2pMMlZSOGxib3Fr?=
 =?utf-8?B?VnB6S0l2bEpnSlNhZ3l0NlA4cnJkNlRVUDJycGR6VjJTVGI3TW0rNTVYc2F0?=
 =?utf-8?B?RDc2ZzVDUnRaVjVMRHhJNWZLMTVlcW1NUXRlM0hpemdZT1p1T3JGQTJ4cGp1?=
 =?utf-8?Q?2UHzcizYKFSR3NqFtFRjC0L6UFxTH757Tv3Q1et?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b57846b-54be-4dcd-324b-08d94bb9b20d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 20:05:17.8993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rK1DeAWwsgIW9d1jlnpBDalvXk51XfcInvaSef2B22NrmJ4ihGDZTAihhYKQYU5U6v1il+qOmInQOGzxptnlJb3blMO/xS+LdymZnBwHXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5595
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/2021 13:16, Matthew Brost wrote:
> Move active request tracking to a backend vfunc rather than assuming all
> backends want to do this in the maner. In the case execlists /
maner -> manner.
In the case *of* execlists

With those fixed...
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> ring submission the tracking is on the physical engine while with GuC
> submission it is on the context.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |  3 ++
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  7 ++++
>   drivers/gpu/drm/i915/gt/intel_engine_types.h  |  6 +++
>   .../drm/i915/gt/intel_execlists_submission.c  | 40 ++++++++++++++++++
>   .../gpu/drm/i915/gt/intel_ring_submission.c   | 22 ++++++++++
>   drivers/gpu/drm/i915/gt/mock_engine.c         | 30 ++++++++++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 33 +++++++++++++++
>   drivers/gpu/drm/i915/i915_request.c           | 41 ++-----------------
>   drivers/gpu/drm/i915/i915_request.h           |  2 +
>   9 files changed, 147 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 251ff7eea22d..bfb05d8697d1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -393,6 +393,9 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	spin_lock_init(&ce->guc_state.lock);
>   	INIT_LIST_HEAD(&ce->guc_state.fences);
>   
> +	spin_lock_init(&ce->guc_active.lock);
> +	INIT_LIST_HEAD(&ce->guc_active.requests);
> +
>   	ce->guc_id = GUC_INVALID_LRC_ID;
>   	INIT_LIST_HEAD(&ce->guc_id_link);
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 542c98418771..035108c10b2c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -162,6 +162,13 @@ struct intel_context {
>   		struct list_head fences;
>   	} guc_state;
>   
> +	struct {
> +		/** lock: protects everything in guc_active */
> +		spinlock_t lock;
> +		/** requests: active requests on this context */
> +		struct list_head requests;
> +	} guc_active;
> +
>   	/* GuC scheduling state flags that do not require a lock. */
>   	atomic_t guc_sched_state_no_lock;
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index 03a81e8d87f4..950fc73ed6af 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -420,6 +420,12 @@ struct intel_engine_cs {
>   
>   	void		(*release)(struct intel_engine_cs *engine);
>   
> +	/*
> +	 * Add / remove request from engine active tracking
> +	 */
> +	void		(*add_active_request)(struct i915_request *rq);
> +	void		(*remove_active_request)(struct i915_request *rq);
> +
>   	struct intel_engine_execlists execlists;
>   
>   	/*
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index abe48421fd7a..f9b5f54a5abe 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3106,6 +3106,42 @@ static void execlists_park(struct intel_engine_cs *engine)
>   	cancel_timer(&engine->execlists.preempt);
>   }
>   
> +static void add_to_engine(struct i915_request *rq)
> +{
> +	lockdep_assert_held(&rq->engine->sched_engine->lock);
> +	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
> +}
> +
> +static void remove_from_engine(struct i915_request *rq)
> +{
> +	struct intel_engine_cs *engine, *locked;
> +
> +	/*
> +	 * Virtual engines complicate acquiring the engine timeline lock,
> +	 * as their rq->engine pointer is not stable until under that
> +	 * engine lock. The simple ploy we use is to take the lock then
> +	 * check that the rq still belongs to the newly locked engine.
> +	 */
> +	locked = READ_ONCE(rq->engine);
> +	spin_lock_irq(&locked->sched_engine->lock);
> +	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
> +		spin_unlock(&locked->sched_engine->lock);
> +		spin_lock(&engine->sched_engine->lock);
> +		locked = engine;
> +	}
> +	list_del_init(&rq->sched.link);
> +
> +	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> +	clear_bit(I915_FENCE_FLAG_HOLD, &rq->fence.flags);
> +
> +	/* Prevent further __await_execution() registering a cb, then flush */
> +	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
> +
> +	spin_unlock_irq(&locked->sched_engine->lock);
> +
> +	i915_request_notify_execute_cb_imm(rq);
> +}
> +
>   static bool can_preempt(struct intel_engine_cs *engine)
>   {
>   	if (GRAPHICS_VER(engine->i915) > 8)
> @@ -3206,6 +3242,8 @@ logical_ring_default_vfuncs(struct intel_engine_cs *engine)
>   	engine->cops = &execlists_context_ops;
>   	engine->request_alloc = execlists_request_alloc;
>   	engine->bump_serial = execlist_bump_serial;
> +	engine->add_active_request = add_to_engine;
> +	engine->remove_active_request = remove_from_engine;
>   
>   	engine->reset.prepare = execlists_reset_prepare;
>   	engine->reset.rewind = execlists_reset_rewind;
> @@ -3797,6 +3835,8 @@ execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   			 "v%dx%d", ve->base.class, count);
>   		ve->base.context_size = sibling->context_size;
>   
> +		ve->base.add_active_request = sibling->add_active_request;
> +		ve->base.remove_active_request = sibling->remove_active_request;
>   		ve->base.emit_bb_start = sibling->emit_bb_start;
>   		ve->base.emit_flush = sibling->emit_flush;
>   		ve->base.emit_init_breadcrumb = sibling->emit_init_breadcrumb;
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index 61469c631057..3b1471c50d40 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -1052,6 +1052,25 @@ static void ring_bump_serial(struct intel_engine_cs *engine)
>   	engine->serial++;
>   }
>   
> +static void add_to_engine(struct i915_request *rq)
> +{
> +	lockdep_assert_held(&rq->engine->sched_engine->lock);
> +	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
> +}
> +
> +static void remove_from_engine(struct i915_request *rq)
> +{
> +	spin_lock_irq(&rq->engine->sched_engine->lock);
> +	list_del_init(&rq->sched.link);
> +
> +	/* Prevent further __await_execution() registering a cb, then flush */
> +	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
> +
> +	spin_unlock_irq(&rq->engine->sched_engine->lock);
> +
> +	i915_request_notify_execute_cb_imm(rq);
> +}
> +
>   static void setup_common(struct intel_engine_cs *engine)
>   {
>   	struct drm_i915_private *i915 = engine->i915;
> @@ -1069,6 +1088,9 @@ static void setup_common(struct intel_engine_cs *engine)
>   	engine->reset.cancel = reset_cancel;
>   	engine->reset.finish = reset_finish;
>   
> +	engine->add_active_request = add_to_engine;
> +	engine->remove_active_request = remove_from_engine;
> +
>   	engine->cops = &ring_context_ops;
>   	engine->request_alloc = ring_request_alloc;
>   	engine->bump_serial = ring_bump_serial;
> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
> index fc5a65ab1937..5f86ff79c98c 100644
> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
> @@ -235,6 +235,34 @@ static void mock_submit_request(struct i915_request *request)
>   	spin_unlock_irqrestore(&engine->hw_lock, flags);
>   }
>   
> +static void mock_add_to_engine(struct i915_request *rq)
> +{
> +	lockdep_assert_held(&rq->engine->sched_engine->lock);
> +	list_move_tail(&rq->sched.link, &rq->engine->sched_engine->requests);
> +}
> +
> +static void mock_remove_from_engine(struct i915_request *rq)
> +{
> +	struct intel_engine_cs *engine, *locked;
> +
> +	/*
> +	 * Virtual engines complicate acquiring the engine timeline lock,
> +	 * as their rq->engine pointer is not stable until under that
> +	 * engine lock. The simple ploy we use is to take the lock then
> +	 * check that the rq still belongs to the newly locked engine.
> +	 */
> +
> +	locked = READ_ONCE(rq->engine);
> +	spin_lock_irq(&locked->sched_engine->lock);
> +	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
> +		spin_unlock(&locked->sched_engine->lock);
> +		spin_lock(&engine->sched_engine->lock);
> +		locked = engine;
> +	}
> +	list_del_init(&rq->sched.link);
> +	spin_unlock_irq(&locked->sched_engine->lock);
> +}
> +
>   static void mock_reset_prepare(struct intel_engine_cs *engine)
>   {
>   }
> @@ -327,6 +355,8 @@ struct intel_engine_cs *mock_engine(struct drm_i915_private *i915,
>   	engine->base.emit_flush = mock_emit_flush;
>   	engine->base.emit_fini_breadcrumb = mock_emit_breadcrumb;
>   	engine->base.submit_request = mock_submit_request;
> +	engine->base.add_active_request = mock_add_to_engine;
> +	engine->base.remove_active_request = mock_remove_from_engine;
>   
>   	engine->base.reset.prepare = mock_reset_prepare;
>   	engine->base.reset.rewind = mock_reset_rewind;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 9f28899ff17f..f8a6077fa3f9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1147,6 +1147,33 @@ static int guc_context_alloc(struct intel_context *ce)
>   	return lrc_alloc(ce, ce->engine);
>   }
>   
> +static void add_to_context(struct i915_request *rq)
> +{
> +	struct intel_context *ce = rq->context;
> +
> +	spin_lock(&ce->guc_active.lock);
> +	list_move_tail(&rq->sched.link, &ce->guc_active.requests);
> +	spin_unlock(&ce->guc_active.lock);
> +}
> +
> +static void remove_from_context(struct i915_request *rq)
> +{
> +	struct intel_context *ce = rq->context;
> +
> +	spin_lock_irq(&ce->guc_active.lock);
> +
> +	list_del_init(&rq->sched.link);
> +	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> +
> +	/* Prevent further __await_execution() registering a cb, then flush */
> +	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
> +
> +	spin_unlock_irq(&ce->guc_active.lock);
> +
> +	atomic_dec(&ce->guc_id_ref);
> +	i915_request_notify_execute_cb_imm(rq);
> +}
> +
>   static const struct intel_context_ops guc_context_ops = {
>   	.alloc = guc_context_alloc,
>   
> @@ -1567,6 +1594,8 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
>   	engine->cops = &guc_context_ops;
>   	engine->request_alloc = guc_request_alloc;
>   	engine->bump_serial = guc_bump_serial;
> +	engine->add_active_request = add_to_context;
> +	engine->remove_active_request = remove_from_context;
>   
>   	engine->sched_engine->schedule = i915_schedule;
>   
> @@ -1931,6 +1960,10 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   				 "v%dx%d", ve->base.class, count);
>   			ve->base.context_size = sibling->context_size;
>   
> +			ve->base.add_active_request =
> +				sibling->add_active_request;
> +			ve->base.remove_active_request =
> +				sibling->remove_active_request;
>   			ve->base.emit_bb_start = sibling->emit_bb_start;
>   			ve->base.emit_flush = sibling->emit_flush;
>   			ve->base.emit_init_breadcrumb =
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index b3c792d55321..4eba848b20e3 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -182,7 +182,7 @@ static bool irq_work_imm(struct irq_work *wrk)
>   	return false;
>   }
>   
> -static void __notify_execute_cb_imm(struct i915_request *rq)
> +void i915_request_notify_execute_cb_imm(struct i915_request *rq)
>   {
>   	__notify_execute_cb(rq, irq_work_imm);
>   }
> @@ -256,37 +256,6 @@ i915_request_active_engine(struct i915_request *rq,
>   	return ret;
>   }
>   
> -
> -static void remove_from_engine(struct i915_request *rq)
> -{
> -	struct intel_engine_cs *engine, *locked;
> -
> -	/*
> -	 * Virtual engines complicate acquiring the engine timeline lock,
> -	 * as their rq->engine pointer is not stable until under that
> -	 * engine lock. The simple ploy we use is to take the lock then
> -	 * check that the rq still belongs to the newly locked engine.
> -	 */
> -	locked = READ_ONCE(rq->engine);
> -	spin_lock_irq(&locked->sched_engine->lock);
> -	while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
> -		spin_unlock(&locked->sched_engine->lock);
> -		spin_lock(&engine->sched_engine->lock);
> -		locked = engine;
> -	}
> -	list_del_init(&rq->sched.link);
> -
> -	clear_bit(I915_FENCE_FLAG_PQUEUE, &rq->fence.flags);
> -	clear_bit(I915_FENCE_FLAG_HOLD, &rq->fence.flags);
> -
> -	/* Prevent further __await_execution() registering a cb, then flush */
> -	set_bit(I915_FENCE_FLAG_ACTIVE, &rq->fence.flags);
> -
> -	spin_unlock_irq(&locked->sched_engine->lock);
> -
> -	__notify_execute_cb_imm(rq);
> -}
> -
>   static void __rq_init_watchdog(struct i915_request *rq)
>   {
>   	rq->watchdog.timer.function = NULL;
> @@ -383,9 +352,7 @@ bool i915_request_retire(struct i915_request *rq)
>   	 * after removing the breadcrumb and signaling it, so that we do not
>   	 * inadvertently attach the breadcrumb to a completed request.
>   	 */
> -	if (!list_empty(&rq->sched.link))
> -		remove_from_engine(rq);
> -	atomic_dec(&rq->context->guc_id_ref);
> +	rq->engine->remove_active_request(rq);
>   	GEM_BUG_ON(!llist_empty(&rq->execute_cb));
>   
>   	__list_del_entry(&rq->link); /* poison neither prev/next (RCU walks) */
> @@ -516,7 +483,7 @@ __await_execution(struct i915_request *rq,
>   	if (llist_add(&cb->work.node.llist, &signal->execute_cb)) {
>   		if (i915_request_is_active(signal) ||
>   		    __request_in_flight(signal))
> -			__notify_execute_cb_imm(signal);
> +			i915_request_notify_execute_cb_imm(signal);
>   	}
>   
>   	return 0;
> @@ -653,7 +620,7 @@ bool __i915_request_submit(struct i915_request *request)
>   	result = true;
>   
>   	GEM_BUG_ON(test_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags));
> -	list_move_tail(&request->sched.link, &engine->sched_engine->requests);
> +	engine->add_active_request(request);
>   active:
>   	clear_bit(I915_FENCE_FLAG_PQUEUE, &request->fence.flags);
>   	set_bit(I915_FENCE_FLAG_ACTIVE, &request->fence.flags);
> diff --git a/drivers/gpu/drm/i915/i915_request.h b/drivers/gpu/drm/i915/i915_request.h
> index 717e5b292046..128030f43bbf 100644
> --- a/drivers/gpu/drm/i915/i915_request.h
> +++ b/drivers/gpu/drm/i915/i915_request.h
> @@ -647,4 +647,6 @@ bool
>   i915_request_active_engine(struct i915_request *rq,
>   			   struct intel_engine_cs **active);
>   
> +void i915_request_notify_execute_cb_imm(struct i915_request *rq);
> +
>   #endif /* I915_REQUEST_H */

