Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A57483DB028
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 02:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBC96EE9E;
	Fri, 30 Jul 2021 00:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389746EE9E;
 Fri, 30 Jul 2021 00:13:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="200174975"
X-IronPort-AV: E=Sophos;i="5.84,280,1620716400"; d="scan'208";a="200174975"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 17:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,280,1620716400"; d="scan'208";a="518640880"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2021 17:13:15 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 29 Jul 2021 17:13:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Thu, 29 Jul 2021 17:13:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 29 Jul 2021 17:13:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFxjXM1Et6F1XcXXgwq5SqT1o8hTB60OgGxIYVUkcVx4QGlIt3EvjI4xT6eMiSeAU6ml3lsocATo3qX9Q6cnXszB4JsJSZihdATURjbB9pSLeWEWgBvME+6v20bdSE5wI83gLtYAezsjMhI6POeWWI8WwVh31HqhkoPL0aXiMI6OsQfTd7eLhUHGx/sNWaDjUAM0eLjbYkucxEdDsgFh3Xe6jI9pj5RWRotpLLk9tmXC5KRDfRLmlgDbmGcUMMqsnxiUhmlxXHhIWParFHTUs5a0EbRA4cCPGYyvPmN8BVZNFuNJDO4Rk7dMnKkWNazTr/hDruK0/3tn4HZFDKa7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzkkHNe6KuH5B/iHSxGM4OSM5LaO3w1lVqGw3b7Oplo=;
 b=TlYNC4Gmfp4D/QiXZPDo3Iw8fUMtx0WPtJ8ab10H2L7RUcWWigp/NeLv/Zut0HWauBVjXYPOuJWG8zYGHLDBJumqUUK+lt2FZ777RPSaf1oYvV67kRJT/Y5FT4Bj7LPv2Y+MtMb/VXGAApL9u2276XoV/fnH51deQnFKzBj+jzrRhMc7RXqgKBy+bh0PRydWblCi0TilMxb9o4K1kyk3BNzWs+2k9K/peVGxj13uYeeOA7mfov0q3Z4uEzHUarJ/r9pIfamoL6ue2zK79cs71BO/MTOR7BOUxx6Mbd9D2P7PT+OcKl7jNsCbENt06SnKf94I7sU+Ej3IsbF0fzIRnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzkkHNe6KuH5B/iHSxGM4OSM5LaO3w1lVqGw3b7Oplo=;
 b=FMpaLEZXdNcrNdYbLFHv3tPKoXSkkCBbkUk7ZwYcVRpJTVc+Y1giCYQiZeWbMGIODsxiKFz/WMYsDKuiZcs3rrPVZrGapXtdeL7xZSCsAASuG+JLbhAFvTBqP1b5/2n5stdSBG1XqGBCQACrEvHdQKsiKir0bTq8qLoUzAvJhNE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5660.namprd11.prod.outlook.com (2603:10b6:510:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 30 Jul
 2021 00:13:12 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::c5a8:5a64:9118:95c4%9]) with mapi id 15.20.4373.021; Fri, 30 Jul 2021
 00:13:12 +0000
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915: Check if engine has heartbeat
 when closing a context
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210729003400.151864-1-matthew.brost@intel.com>
 <20210729003400.151864-2-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <eea0bdb7-681b-0acb-0b9c-041fb38a7119@intel.com>
Date: Thu, 29 Jul 2021 17:13:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <20210729003400.151864-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.221] (73.157.192.58) by
 SJ0PR05CA0173.namprd05.prod.outlook.com (2603:10b6:a03:339::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.9 via Frontend
 Transport; Fri, 30 Jul 2021 00:13:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17e45635-a182-4ae4-678e-08d952eed18d
X-MS-TrafficTypeDiagnostic: PH0PR11MB5660:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB566013666C7ECE993A698D2CBDEC9@PH0PR11MB5660.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uvS9wXleDAVOAbeBf4XICvivJXFE3lQ1/aqN/rxnD8/qtJdgeFxTlKG7lOHGLI/pySbWAAihvG4UxDWglMKh1KOvfqqQDShE1Uo4nY41N/CcuaHef9xQS1dQo7OL9Ee855AhOcahI0K03Lu8BJclQGLRENRaeSoLRlihSBZHqpTJhbB3iNZmWToKqhhFChIw2uEpJqSJ6Pe5ilJK6fPeUEfP7FP+b4thVVKxqCcnr2o9Nca3dhZdj3O/ZKWbLRYsTQfhrFBsC0abiVlnKMfCKBVnLiK8UYVp1uZ+Mz+1dxlSI0RCtL7Z7pSPuhUMKSEu2Kwibt3RY5Geqzg/te+FKS8u1RnPh2iOqZx5DIVABWHxj31qxlofKNL1jPGNN/r7bG4QC/eAikRuX964lFc2Ilo7x2o1w5Mjs7Of4Kzuo1MlAt7hz/fNUjHlP/AEhVii/olfW9KZuI6q3PmnoN/avTTO8W3odk3OYAHKFlyJMsXiJPklo+0vkX/W8P6dFAhnnM5i5Gu6z9cvGZ6fX9u/4x6u8ZOCV0pqmoPSMWcscPhnOJNLCnvmHGsSxuwyYJRCOscH1Qrk9iBJWNeDWCNaEVs3525LFmsWZRgP5kdIUuVD5zXJXA+KYeFx8hMp68suOAedSq9R01xpYd0uv0A+9PF3rv8j64RN+Eg2Go+1awm0805p7wZ0blTtstH3ZIK8hZqPRupt6fnuKXSn8U1fjUOS9uL1NNIRDnhltg5eDEqoeioeQ8ijXT9zWexgMcKz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(2616005)(6486002)(66946007)(86362001)(66476007)(5660300002)(8676002)(956004)(36756003)(450100002)(8936002)(66556008)(186003)(26005)(16576012)(478600001)(83380400001)(2906002)(31686004)(316002)(38100700002)(31696002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alg2WllTbzc1T1JvTDhjcmJGM1FZaDI3VG9uUDVmV1lTQ1VLU1FMNzZ6eE4x?=
 =?utf-8?B?a2pnalNRTlpibkg1ck5JU1hISGVpMC9IWUFESE9BT2FuT1NDem1PTFRTYTRr?=
 =?utf-8?B?RmliUXR4UkVnaUhPSU1rYmQwdmlTb3FaTk5CTmNobmYwQlowZi8wRHhzYVRr?=
 =?utf-8?B?VE4vLzR3Tjk3cGlwNEFWSjRpbm5sb0ttNEZSL3YzODVoUkZCMENkSk41NEJT?=
 =?utf-8?B?a1J6RHlDS00raTR6eVlCanBKK3kxMFZnMFQ4ME5DcVNzZ0x4aDRFM1BHM1Vq?=
 =?utf-8?B?Zk1mWm5UTU83blNFMEMyRnN3R2xuMzFSTWh6MXUxTElSZlJwSkJvMlpHM2lz?=
 =?utf-8?B?TlFXWi9kYnBBT0hndXlya3l2SERnK1RJNTZneVBzdmlGcUt5TXUzKytVVE1a?=
 =?utf-8?B?TlRENUtBdkwvLzV0bFlESDBqS0dwS0ZwajQ0L2pmb3BuRlFnUE5UdVRFKzI0?=
 =?utf-8?B?cTNYWXZud0RDVUlwWklJSUNjVTBEUXZsNTRMZ2hLSHRzOXlJeStCRWIxN25V?=
 =?utf-8?B?NmNSbDhya09BRHpmYXA5NUZJN3ZPanZBcFFlREljVXhXWGMveFBXS0pnZnFH?=
 =?utf-8?B?ejJROGowV09xRXE4NXYyUGdzcUF6VkR1ZUZxa1B1a0I5VG5PQmtIV1gyR2ly?=
 =?utf-8?B?VmdleDRneGxYMWZJWFZIbFA2VGYrNUM5dE5TMjJPWUxPaEQ3aEVmNjVLU1dh?=
 =?utf-8?B?N2hFQ21EeGhON05POWJ4RXg4M0dHenphdzdVclk2S3V6cUh1U2FNQ1AyM056?=
 =?utf-8?B?S3d5Yk9jMHdWTVlqdGZVam9BbzdOWDkrRGFNa2s5YlRtTHgwOTVRRVd6SlpX?=
 =?utf-8?B?QjNuaXMxQVBTRHFnQmR1elJONzErRld2S2dJei9Rb2tJZEtkcVNWSk5Fb2Ft?=
 =?utf-8?B?NHUyVWVYYWd4dWgwQzllRzJiT081MzlzMmJWcnd4T291c0Y3djZvU2dJbno3?=
 =?utf-8?B?ellvaDArM3NueFRkakF6Z1k5YXpUdDN0ejBKbzFVRG1BWjFSRVdlS2ZIZlBV?=
 =?utf-8?B?ZjY1Y29GS0x1ZktiZ05vZlZtWG95UkJoRjV2SHQ4ZFpXR0dSYTQvMFVKT0FZ?=
 =?utf-8?B?K1BCZ3R1QVJuRkZMTnpnRG8zYWg2RHRRMFlXQXBWYlRYdE5BMDMvYVRJcHMy?=
 =?utf-8?B?QldHYVkwK1FFU3dCSHZHY2d1NXQwSjcrSVJRRFA1YVVHOW51NXc2TGpuc0pJ?=
 =?utf-8?B?ZWw3UnRWQnJ3ZHJPQzdBdHBWc3ZMc293R0ZPS2IvR2g1ZjVMNXVZZElOTGwy?=
 =?utf-8?B?S3dQRVBsL0prRk1MQ1pKU3lURENKQ283bll1bnY2ekZEbllqVEVjS1cybWtq?=
 =?utf-8?B?UEFFZVJwV05qYis4azRNazVBbUk3SWtoTlFOblB1cEhqUGJxdFphWHJ3cXBm?=
 =?utf-8?B?ZU9EcGVCeWR3a1Z0SGhFVU40WlpqOG00YjdtSXhtSFdUU3hkZ1hCcDdQTHZN?=
 =?utf-8?B?UjE2NU9lWmcxY3IzcWVRRTFMK21IcGl3WVR6eUdiRmxzZWgvL1pudEN3WFdN?=
 =?utf-8?B?QS85QUxUbi8yUjhBeXhnRVplRzZiSGwxQStlYmVvQTVHL2VXakJxT1cxWlRL?=
 =?utf-8?B?c3V3M0p3RFAyZ0sycGMvNWlDVDF6TmFJSjE5bTdnMmRhbzNhVUZERVoxcnBu?=
 =?utf-8?B?ajNJNWlMRFFPSzU0Mk5uSVFtY2xaUGhqTFFKL3hEWEI4V2E2TjZFOUp6aWlK?=
 =?utf-8?B?Y2xtWG5HYXR1cWEzbFBpWklvQTF3eDhacmlGTHg2V3dmNmR2amxMdXBRbGJD?=
 =?utf-8?Q?fUYW48wMKTbwRg84KyYxAiPk0doq06Cw4d+r4Jq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17e45635-a182-4ae4-678e-08d952eed18d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 00:13:12.2687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfYJS8UMBwA/nr+fBlVtiMIm4+qXNigCcQeVHFXiDasT1DncGHYHot0sQCWXl0DZvC2C24U6pFluZ8VWkfIimLkaoXcP/R45rrwTsxPMmgQ=
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

On 7/28/2021 17:34, Matthew Brost wrote:
> If an engine associated with a context does not have a heartbeat, ban it
> immediately. This is needed for GuC submission as a idle pulse doesn't
> kick the context off the hardware where it then can check for a
> heartbeat and ban the context.
It's worse than this. If the engine in question is an individual 
physical engine then sending a pulse (with sufficiently high priority) 
will pre-empt the engine and kick the context off. However, the GuC 
scheduler does not have hacks in it to check the state of the heartbeat 
or whether a context is actually a zombie or not. Thus, the context will 
get resubmitted to the hardware after the pulse completes and 
effectively nothing will have happened.

I would assume that the DRM scheduler which we are meant to be switching 
to for execlist as well as GuC submission is also unlikely to have hacks 
for zombie contexts and tests for whether the i915 specific heartbeat 
has been disabled since the context became a zombie. So when that switch 
happens, this test will also fail in execlist mode as well as GuC mode.

The choices I see here are to simply remove persistence completely (it 
is a basically a bug that became UAPI because it wasn't caught soon 
enough!) or to implement it in a way that does not require hacks in the 
back end scheduler. Apparently, the DRM scheduler is expected to allow 
zombie contexts to persist until the DRM file handle is closed. So 
presumably we will have to go with option two.

That means flagging a context as being a zombie when it is closed but 
still active. The driver would then add it to a zombie list owned by the 
DRM client object. When that client object is closed, i915 would go 
through the list and genuinely kill all the contexts. No back end 
scheduler hacks required and no intimate knowledge of the i915 heartbeat 
mechanism required either.

John.


>
> This patch also updates intel_engine_has_heartbeat to be a vfunc as we
> now need to call this function on execlists virtual engines too.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  5 +++--
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  2 ++
>   drivers/gpu/drm/i915/gt/intel_engine.h        | 21 ++-----------------
>   .../drm/i915/gt/intel_execlists_submission.c  | 14 +++++++++++++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  6 +++++-
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 --
>   6 files changed, 26 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 9c3672bac0e2..b8e01c5ba9e5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1090,8 +1090,9 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>   	 */
>   	for_each_gem_engine(ce, engines, it) {
>   		struct intel_engine_cs *engine;
> +		bool local_ban = ban || !intel_engine_has_heartbeat(ce->engine);
>   
> -		if (ban && intel_context_ban(ce, NULL))
> +		if (local_ban && intel_context_ban(ce, NULL))
>   			continue;
>   
>   		/*
> @@ -1104,7 +1105,7 @@ static void kill_engines(struct i915_gem_engines *engines, bool ban)
>   		engine = active_engine(ce);
>   
>   		/* First attempt to gracefully cancel the context */
> -		if (engine && !__cancel_engine(engine) && ban)
> +		if (engine && !__cancel_engine(engine) && local_ban)
>   			/*
>   			 * If we are unable to send a preemptive pulse to bump
>   			 * the context from the GPU, we have to resort to a full
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index e54351a170e2..65f2eb2a78e4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -55,6 +55,8 @@ struct intel_context_ops {
>   	void (*reset)(struct intel_context *ce);
>   	void (*destroy)(struct kref *kref);
>   
> +	bool (*has_heartbeat)(const struct intel_engine_cs *engine);
> +
>   	/* virtual engine/context interface */
>   	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
>   						unsigned int count);
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index c2a5640ae055..1b11a808acc4 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -283,28 +283,11 @@ struct intel_context *
>   intel_engine_create_virtual(struct intel_engine_cs **siblings,
>   			    unsigned int count);
>   
> -static inline bool
> -intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
> -{
> -	/*
> -	 * For non-GuC submission we expect the back-end to look at the
> -	 * heartbeat status of the actual physical engine that the work
> -	 * has been (or is being) scheduled on, so we should only reach
> -	 * here with GuC submission enabled.
> -	 */
> -	GEM_BUG_ON(!intel_engine_uses_guc(engine));
> -
> -	return intel_guc_virtual_engine_has_heartbeat(engine);
> -}
> -
>   static inline bool
>   intel_engine_has_heartbeat(const struct intel_engine_cs *engine)
>   {
> -	if (!IS_ACTIVE(CONFIG_DRM_I915_HEARTBEAT_INTERVAL))
> -		return false;
> -
> -	if (intel_engine_is_virtual(engine))
> -		return intel_virtual_engine_has_heartbeat(engine);
> +	if (engine->cops->has_heartbeat)
> +		return engine->cops->has_heartbeat(engine);
>   	else
>   		return READ_ONCE(engine->props.heartbeat_interval_ms);
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index de5f9c86b9a4..18005b5546b6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -3619,6 +3619,18 @@ virtual_get_sibling(struct intel_engine_cs *engine, unsigned int sibling)
>   	return ve->siblings[sibling];
>   }
>   
> +static bool virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
> +{
> +	struct intel_engine_cs *engine;
> +	intel_engine_mask_t tmp, mask = ve->mask;
> +
> +	for_each_engine_masked(engine, ve->gt, mask, tmp)
> +		if (READ_ONCE(engine->props.heartbeat_interval_ms))
> +			return true;
> +
> +	return false;
> +}
> +
>   static const struct intel_context_ops virtual_context_ops = {
>   	.flags = COPS_HAS_INFLIGHT,
>   
> @@ -3634,6 +3646,8 @@ static const struct intel_context_ops virtual_context_ops = {
>   	.enter = virtual_context_enter,
>   	.exit = virtual_context_exit,
>   
> +	.has_heartbeat = virtual_engine_has_heartbeat,
> +
>   	.destroy = virtual_context_destroy,
>   
>   	.get_sibling = virtual_get_sibling,
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 89ff0e4b4bc7..ae70bff3605f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -2168,6 +2168,8 @@ static int guc_virtual_context_alloc(struct intel_context *ce)
>   	return lrc_alloc(ce, engine);
>   }
>   
> +static bool guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
> +
>   static const struct intel_context_ops virtual_guc_context_ops = {
>   	.alloc = guc_virtual_context_alloc,
>   
> @@ -2183,6 +2185,8 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>   	.enter = guc_virtual_context_enter,
>   	.exit = guc_virtual_context_exit,
>   
> +	.has_heartbeat = guc_virtual_engine_has_heartbeat,
> +
>   	.sched_disable = guc_context_sched_disable,
>   
>   	.destroy = guc_context_destroy,
> @@ -3029,7 +3033,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>   	return ERR_PTR(err);
>   }
>   
> -bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
> +static bool guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve)
>   {
>   	struct intel_engine_cs *engine;
>   	intel_engine_mask_t tmp, mask = ve->mask;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index c7ef44fa0c36..c2afc3b88fd8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -29,8 +29,6 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
>   				    struct i915_request *hung_rq,
>   				    struct drm_printer *m);
>   
> -bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
> -
>   int intel_guc_wait_for_pending_msg(struct intel_guc *guc,
>   				   atomic_t *wait_var,
>   				   bool interruptible,

