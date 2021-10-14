Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D842DF60
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 18:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29366E1BC;
	Thu, 14 Oct 2021 16:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C0E6E18E;
 Thu, 14 Oct 2021 16:44:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="227680921"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="227680921"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 09:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; d="scan'208";a="487508667"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2021 09:43:42 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 14 Oct 2021 09:43:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 14 Oct 2021 09:43:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 14 Oct 2021 09:43:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcYcF215HD7jOFRrz8j1+xjF9AzHuOIxXH0ZTftgt9uajx2+uaCcrUWSBeScxGmzHLa1z9AY7/6S5MstAWaH1wRGlH3yBZq4RwXDN/iW5n46zI8ZBN8K6nf2Uo6+4vwth9JO+/1NAyeqYFR6LqmxmNwdVGzD+amRNzKP/jOMjZMy1tCd5zuTFOfVCME7qdeuMBTivQwI4JLnIFw0q0cpmVp+9CFEReSFiwojvplbKmqF3/EtKxp04Fu3QGR/ipdb1faMo3r7GeUGOutMYsAc3pXNvI5lkS6yvWCuZSgs63yDW5rgMfDyaFyfvvS0Fh/thqim5AwXPts7aw5LNddZjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DR7+EqLhCb+D3ftgnkCLq8taoviXpIT+QkNR+1415PY=;
 b=NPPZa/1uPVrdN6udVEvIIlSZp88YKBbNq81yvvvFL/sTjSHBttB3apYn6lCADeGzgnySP+PL6viKxZD1JP9jMBmlKSeV0LUMbnaUILMHysAVH5qxAORfKA3AJXFZoOn/zhFCixOfP9dOVPjS++96fsXIlG9Ags1ayFo2hU020sUf0Gyv8Vh0tgkatbrcXTOQM+CR15XuzSm+QsYDIjrdcbcsLI5omQnu53mOmB6Pq1XyWa1XCa5yEmNT84nwQ5nIccdkz7Bi5+4JG52wjG36WfINdPjB0qziAvBWaB6XPkCFP6dHcx8j0Iwb0NWfEGPhdODT4TZLixcMUBEXEci2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DR7+EqLhCb+D3ftgnkCLq8taoviXpIT+QkNR+1415PY=;
 b=QKxwRc4wfRJUiiCFcEGYoxFXbT7JGm0Hwo3lRu0Vv5jMQ8AIabDhMS1rAkLpKnBNwr66TKl92sXWdUJ5dEoz4Ixq/7P+trjtyzhiYFw6gAvfsNcbnWi2O95hN7/eJY8h7bBfQvxEWt3xsaqi1Zb4RBulCNVTaOq2JzcKLK86zug=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5641.namprd11.prod.outlook.com (2603:10b6:510:d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 14 Oct
 2021 16:43:39 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 16:43:39 +0000
Subject: Re: [PATCH 16/25] drm/i915/guc: Connect UAPI to GuC multi-lrc
 interface
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-17-matthew.brost@intel.com>
 <83bd3cc3-e1c9-3d6b-f089-38edecf05ca8@intel.com>
 <20211014153259.GA9677@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <cc456737-aa1f-6219-a4ae-085ab85a1b2c@intel.com>
Date: Thu, 14 Oct 2021 09:43:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211014153259.GA9677@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: CO1PR15CA0097.namprd15.prod.outlook.com
 (2603:10b6:101:21::17) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 CO1PR15CA0097.namprd15.prod.outlook.com (2603:10b6:101:21::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 16:43:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ee662a2-d801-448d-0ca1-08d98f31c648
X-MS-TrafficTypeDiagnostic: PH0PR11MB5641:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB564115A3EFEAC1BB49AB6CC8BDB89@PH0PR11MB5641.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fd2Abc3fc1toobwwsCSXiwkWOECtHKMhblTHngZx9u+dNfSTjbHwUbP4/op9Ael/ztumVj3EUABvZIhs2x/AlSLOQnp3R9IjmM9UJe5+f2aKtoK86fOPogu+QmMAd9/lxMNDL06/eDbt1mLi05VUA81hHevWD6x6eRvvBr7XvqUaQewcQ7U7xtcYGeyXyFh+WVWSM9vcwS4ZS7JSQrKFuzJAXM1lKcSTaU7MjnDQYrQ56L4P7K0khmBf4kq0wjla2Jk3d+buDyIsCSlQKbX7P7/0bLy5PYiOg4NGUaqOwKF2QFqblVlUVMg2tO3BPgPjkIXawlWlm3GtLyej9Xvlf6/CNtsJfPvE50FKeVTSosHEAFK3mG6eJh2NT9QvxefX49YiLxRlL65L/fkzgPHHoeRRn9dK6uSAGUf7PbWISxSU3iUcE+OR2Y6EbW9W0z2TJ7siVWOOweU2aS08eQiUZyE8GrKdyQyvEDZ03YPHOqSeoIqtOudYaPgvF8psb8MfRwGchWmFVaJ/U0OksniDea7YYAni2DC6tn9LbEVarARzoqFhK4eOGFm+1fQM2CMWdOI64cXyH2pl/d0iuCsQqQpOcmlxtYcQ9xbl7y6jh303sBjPtLs31DMJRMOK5VOukkOo2gkjeT+RS85KDFOndFhYaa5ma3UvzAwCuwwAiFhCNyAk/QePFlP/FcUXVhK39cLsIhg826t365hZrUBCrHO2euxjxM6CiFPUDKPcYSmhZdIB2FzMcbTIXbi6DdB0MhqVPrgZjldMg8cFPAO2OP7NFmZA813B87VxE0p6FBG8G6xdeb59LHuyQRvvLp1GXGNX7vz+7b954Mnh3O+mZDYdOH3cFF8J4jfOgryM760=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(186003)(36756003)(4326008)(26005)(38100700002)(5660300002)(16576012)(6636002)(6486002)(508600001)(31686004)(37006003)(31696002)(66946007)(6862004)(2906002)(82960400001)(2616005)(8676002)(966005)(53546011)(66556008)(956004)(83380400001)(8936002)(316002)(450100002)(30864003)(86362001)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFBUaThiTVhCZDRiMHNnWmExUnRQZ0R0aFMxTjdIeE1pbnVScGF5SEJRR1p2?=
 =?utf-8?B?cDhmd2JOQVJFekUvTGVVbVZLWVY4SVkxMnpNUEZUMEN3TFNkRE1IWXRZQTND?=
 =?utf-8?B?WGJoejVkQVM4djZqS2RZbURCZ3dKMkVjOUNCb0J2Y0hwVGlpWUU1bTFtaGJR?=
 =?utf-8?B?VFFPYWZtTGpTKzZlcXdaaWtzZ1BBY1FZdzlJQTNpd3g0RUd2SWtyL0kxNHF0?=
 =?utf-8?B?MjlGbnFYRE9LTFpNN256U1lyR1kxMDRKQUNQSGxrdTljc3RQMEFmZ1I3QzJC?=
 =?utf-8?B?YjRnMkd5Vm0vSEZMeWlPbFBXNXlld0FuaTEyZWppYjd6YnVrQk8rT01qVURW?=
 =?utf-8?B?ZTVoa3FiMWRMalgxQWt3RTV1T1NHYmNsZWRYNjk2YytEeVgyU1dDeGlxZlEy?=
 =?utf-8?B?YzVLUW11YndBYTQ0Wk9qTVZ3LzZycTJIOVhFK3JOVjZIbFZPekZ6SFdMSHc1?=
 =?utf-8?B?MlFSOTg4OVNPbW5oM0Z2MjNBTHJlTGNpelp4VzQzQ1QvSm9BYmJTcjlBYUlS?=
 =?utf-8?B?eFc3Q3dISE5WM0F3Z0dEaHhSNFZaOVF0bW9ybVhvQ0xvMDgvUERlb1BwbnBx?=
 =?utf-8?B?MzVuNDRyWEFjZGhBRGJWMzNmZk9UZzc5QzBpQTlPamFnQUJydVlWdTBnbXNK?=
 =?utf-8?B?MHk4UVJXTnRnTVlBV0lYdDBRbTdvQ3pPcTBJUTRoRUc5THdKelhobjZNSU94?=
 =?utf-8?B?MDNybUx1Ylk3N2YzU25KRmFuTmI1Y1htNW9uOHNPa2N1TmFZUWFxR25hWFZS?=
 =?utf-8?B?UGh3OXF4MmxiMU1wZ2pzRVFmY29yUHZZV0NVWDVSNWlBN3JUWVRpVi9PR0Vo?=
 =?utf-8?B?RGdxaFdGSHd6MCt2WW14aDZZTHZNZ0dFVm4zMFhVWUhoNzZWQkRrendicUNj?=
 =?utf-8?B?QmQ5UnlrWk9UTGZ3RS9MNlpmM0w1WmRtS0hnUWQwM1djYWlTcmpCYVdzd3pR?=
 =?utf-8?B?VjBYdmpSa0FzTGkyVmFtSG9sOGZEcnloWVBBblk1VjBTYmhabW9qQ21XY0d0?=
 =?utf-8?B?UzErVTlkdGNTbU9VVit5eVJETlBIRjdndzhOZE1GVVIvZTN3aDhnakJvRUFw?=
 =?utf-8?B?RmxaNWxjY0RzVDh2QW5yblNqN2J1WnlaMERXUzZwa25LUnZCWWxLME5GR0ZO?=
 =?utf-8?B?MUpqVzNJbklLMHJiSzcxejFSU245cEpOcUt2VjVxYmN6MXBFdWN3SUQ3OW5q?=
 =?utf-8?B?M01xOHdLVmMrcVB6ajdLY2trOGJ2VDdIYXA1bnBZbnBwa3I3cW81eFNsZmhn?=
 =?utf-8?B?NE1DbEs2L2syS1IyRm1zS2RscEtJeGEyYkViMExmNEg2U0I5aklmaTZ2NWRN?=
 =?utf-8?B?Um9RSm4yZlZKbklFT01iVVFzcmZ3RGVtYW1SeWt0YzN0ZVpYYkVsQnRmZ2Ix?=
 =?utf-8?B?RmhsbmMrSTdPWHc5RFkwZTZhSlRkd3F2QXFBQ2dGRHV1SGYvQnBjM1pXZzU5?=
 =?utf-8?B?bFU2SjM4bG8yWXh3S1hKbWlZblgrZXJOTXp5M1lPcjVXRmJVMUdISWZCV29H?=
 =?utf-8?B?a2d5UUd5eks5R2t2SlZHMi9ZRGpOZmM4QjgwMEJ1TnNnZ2JnTGNsVjA3eTg5?=
 =?utf-8?B?azdPY3dkV3I0K1VQV3BrS0hZSnh4b0tQa1VZNFFuVkhQZlNvWlEzanJSN1Zz?=
 =?utf-8?B?TTFYZm1IeXN4MW56RmhQZC9oODdQYU1vcWlnTFBZTEdzQVY4ZVZSdG1mY3Aw?=
 =?utf-8?B?c3Vvam4wcnBWdlNqTTlNYk9OYUp4NkFhYXhxNmxTeVB0VjloWThaV1BoZHZp?=
 =?utf-8?Q?j9fh9skQohoGuDpPhtsQkvawd9V16k3nQ66GU0x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee662a2-d801-448d-0ca1-08d98f31c648
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 16:43:39.4138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HmGk2w/ThgzVBczSvVL86+pD8wxoe9KmhMsX+eq2Px55E4Np/DVXaVq7UuM3P5i1JDOeN/z8c59wHkAhuGg3YGRDR9Kv5TqnhQ96TZ9REs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5641
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

On 10/14/2021 08:32, Matthew Brost wrote:
> On Wed, Oct 13, 2021 at 06:02:42PM -0700, John Harrison wrote:
>> On 10/13/2021 13:42, Matthew Brost wrote:
>>> Introduce 'set parallel submit' extension to connect UAPI to GuC
>>> multi-lrc interface. Kernel doc in new uAPI should explain it all.
>>>
>>> IGT: https://patchwork.freedesktop.org/patch/447008/?series=93071&rev=1
>>> media UMD: https://github.com/intel/media-driver/pull/1252
>>>
>>> v2:
>>>    (Daniel Vetter)
>>>     - Add IGT link and placeholder for media UMD link
>>> v3:
>>>    (Kernel test robot)
>>>     - Fix warning in unpin engines call
>>>    (John Harrison)
>>>     - Reword a bunch of the kernel doc
>>> v4:
>>>    (John Harrison)
>>>     - Add comment why perma-pin is done after setting gem context
>>>     - Update some comments / docs for proto contexts
>>>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c   | 228 +++++++++++++++++-
>>>    .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
>>>    drivers/gpu/drm/i915/gt/intel_context_types.h |   9 +-
>>>    drivers/gpu/drm/i915/gt/intel_engine.h        |  12 +-
>>>    drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   6 +-
>>>    .../drm/i915/gt/intel_execlists_submission.c  |   6 +-
>>>    drivers/gpu/drm/i915/gt/selftest_execlists.c  |  12 +-
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 114 ++++++++-
>>>    include/uapi/drm/i915_drm.h                   | 131 ++++++++++
>>>    9 files changed, 503 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> index d225d3dd0b40..6f23aff6e642 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> @@ -556,9 +556,150 @@ set_proto_ctx_engines_bond(struct i915_user_extension __user *base, void *data)
>>>    	return 0;
>>>    }
>>> +static int
>>> +set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>>> +				      void *data)
>>> +{
>>> +	struct i915_context_engines_parallel_submit __user *ext =
>>> +		container_of_user(base, typeof(*ext), base);
>>> +	const struct set_proto_ctx_engines *set = data;
>>> +	struct drm_i915_private *i915 = set->i915;
>>> +	u64 flags;
>>> +	int err = 0, n, i, j;
>>> +	u16 slot, width, num_siblings;
>>> +	struct intel_engine_cs **siblings = NULL;
>>> +	intel_engine_mask_t prev_mask;
>>> +
>>> +	/* Disabling for now */
>>> +	return -ENODEV;
>>> +
>>> +	/* FIXME: This is NIY for execlists */
>>> +	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
>>> +		return -ENODEV;
>>> +
>>> +	if (get_user(slot, &ext->engine_index))
>>> +		return -EFAULT;
>>> +
>>> +	if (get_user(width, &ext->width))
>>> +		return -EFAULT;
>>> +
>>> +	if (get_user(num_siblings, &ext->num_siblings))
>>> +		return -EFAULT;
>>> +
>>> +	if (slot >= set->num_engines) {
>>> +		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
>>> +			slot, set->num_engines);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (set->engines[slot].type != I915_GEM_ENGINE_TYPE_INVALID) {
>>> +		drm_dbg(&i915->drm,
>>> +			"Invalid placement[%d], already occupied\n", slot);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (get_user(flags, &ext->flags))
>>> +		return -EFAULT;
>>> +
>>> +	if (flags) {
>>> +		drm_dbg(&i915->drm, "Unknown flags 0x%02llx", flags);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	for (n = 0; n < ARRAY_SIZE(ext->mbz64); n++) {
>>> +		err = check_user_mbz(&ext->mbz64[n]);
>>> +		if (err)
>>> +			return err;
>>> +	}
>>> +
>>> +	if (width < 2) {
>>> +		drm_dbg(&i915->drm, "Width (%d) < 2\n", width);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (num_siblings < 1) {
>>> +		drm_dbg(&i915->drm, "Number siblings (%d) < 1\n",
>>> +			num_siblings);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	siblings = kmalloc_array(num_siblings * width,
>>> +				 sizeof(*siblings),
>>> +				 GFP_KERNEL);
>>> +	if (!siblings)
>>> +		return -ENOMEM;
>>> +
>>> +	/* Create contexts / engines */
>>> +	for (i = 0; i < width; ++i) {
>>> +		intel_engine_mask_t current_mask = 0;
>>> +		struct i915_engine_class_instance prev_engine;
>>> +
>>> +		for (j = 0; j < num_siblings; ++j) {
>>> +			struct i915_engine_class_instance ci;
>>> +
>>> +			n = i * num_siblings + j;
>>> +			if (copy_from_user(&ci, &ext->engines[n], sizeof(ci))) {
>>> +				err = -EFAULT;
>>> +				goto out_err;
>>> +			}
>>> +
>>> +			siblings[n] =
>>> +				intel_engine_lookup_user(i915, ci.engine_class,
>>> +							 ci.engine_instance);
>>> +			if (!siblings[n]) {
>>> +				drm_dbg(&i915->drm,
>>> +					"Invalid sibling[%d]: { class:%d, inst:%d }\n",
>>> +					n, ci.engine_class, ci.engine_instance);
>>> +				err = -EINVAL;
>>> +				goto out_err;
>>> +			}
>>> +
>>> +			if (n) {
>>> +				if (prev_engine.engine_class !=
>>> +				    ci.engine_class) {
>>> +					drm_dbg(&i915->drm,
>>> +						"Mismatched class %d, %d\n",
>>> +						prev_engine.engine_class,
>>> +						ci.engine_class);
>>> +					err = -EINVAL;
>>> +					goto out_err;
>>> +				}
>>> +			}
>>> +
>>> +			prev_engine = ci;
>>> +			current_mask |= siblings[n]->logical_mask;
>>> +		}
>>> +
>>> +		if (i > 0) {
>>> +			if (current_mask != prev_mask << 1) {
>>> +				drm_dbg(&i915->drm,
>>> +					"Non contiguous logical mask 0x%x, 0x%x\n",
>>> +					prev_mask, current_mask);
>>> +				err = -EINVAL;
>>> +				goto out_err;
>>> +			}
>>> +		}
>>> +		prev_mask = current_mask;
>>> +	}
>>> +
>>> +	set->engines[slot].type = I915_GEM_ENGINE_TYPE_PARALLEL;
>>> +	set->engines[slot].num_siblings = num_siblings;
>>> +	set->engines[slot].width = width;
>>> +	set->engines[slot].siblings = siblings;
>>> +
>>> +	return 0;
>>> +
>>> +out_err:
>>> +	kfree(siblings);
>>> +
>>> +	return err;
>>> +}
>>> +
>>>    static const i915_user_extension_fn set_proto_ctx_engines_extensions[] = {
>>>    	[I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE] = set_proto_ctx_engines_balance,
>>>    	[I915_CONTEXT_ENGINES_EXT_BOND] = set_proto_ctx_engines_bond,
>>> +	[I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT] =
>>> +		set_proto_ctx_engines_parallel_submit,
>>>    };
>>>    static int set_proto_ctx_engines(struct drm_i915_file_private *fpriv,
>>> @@ -818,6 +959,25 @@ static int intel_context_set_gem(struct intel_context *ce,
>>>    	return ret;
>>>    }
>>> +static void __unpin_engines(struct i915_gem_engines *e, unsigned int count)
>>> +{
>>> +	while (count--) {
>>> +		struct intel_context *ce = e->engines[count], *child;
>>> +
>>> +		if (!ce || !test_bit(CONTEXT_PERMA_PIN, &ce->flags))
>>> +			continue;
>>> +
>>> +		for_each_child(ce, child)
>>> +			intel_context_unpin(child);
>>> +		intel_context_unpin(ce);
>>> +	}
>>> +}
>>> +
>>> +static void unpin_engines(struct i915_gem_engines *e)
>>> +{
>>> +	__unpin_engines(e, e->num_engines);
>>> +}
>>> +
>>>    static void __free_engines(struct i915_gem_engines *e, unsigned int count)
>>>    {
>>>    	while (count--) {
>>> @@ -933,6 +1093,40 @@ static struct i915_gem_engines *default_engines(struct i915_gem_context *ctx,
>>>    	return err;
>>>    }
>>> +static int perma_pin_contexts(struct intel_context *ce)
>>> +{
>>> +	struct intel_context *child;
>>> +	int i = 0, j = 0, ret;
>>> +
>>> +	GEM_BUG_ON(!intel_context_is_parent(ce));
>>> +
>>> +	ret = intel_context_pin(ce);
>>> +	if (unlikely(ret))
>>> +		return ret;
>>> +
>>> +	for_each_child(ce, child) {
>>> +		ret = intel_context_pin(child);
>>> +		if (unlikely(ret))
>>> +			goto unwind;
>>> +		++i;
>>> +	}
>>> +
>>> +	set_bit(CONTEXT_PERMA_PIN, &ce->flags);
>>> +
>>> +	return 0;
>>> +
>>> +unwind:
>>> +	intel_context_unpin(ce);
>>> +	for_each_child(ce, child) {
>>> +		if (j++ < i)
>>> +			intel_context_unpin(child);
>>> +		else
>>> +			break;
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>    static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>    					     unsigned int num_engines,
>>>    					     struct i915_gem_proto_engine *pe)
>>> @@ -946,7 +1140,7 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>    	e->num_engines = num_engines;
>>>    	for (n = 0; n < num_engines; n++) {
>>> -		struct intel_context *ce;
>>> +		struct intel_context *ce, *child;
>>>    		int ret;
>>>    		switch (pe[n].type) {
>>> @@ -956,7 +1150,13 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>    		case I915_GEM_ENGINE_TYPE_BALANCED:
>>>    			ce = intel_engine_create_virtual(pe[n].siblings,
>>> -							 pe[n].num_siblings);
>>> +							 pe[n].num_siblings, 0);
>>> +			break;
>>> +
>>> +		case I915_GEM_ENGINE_TYPE_PARALLEL:
>>> +			ce = intel_engine_create_parallel(pe[n].siblings,
>>> +							  pe[n].num_siblings,
>>> +							  pe[n].width);
>>>    			break;
>>>    		case I915_GEM_ENGINE_TYPE_INVALID:
>>> @@ -977,6 +1177,29 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>    			err = ERR_PTR(ret);
>>>    			goto free_engines;
>>>    		}
>>> +		for_each_child(ce, child) {
>>> +			ret = intel_context_set_gem(child, ctx, pe->sseu);
>>> +			if (ret) {
>>> +				err = ERR_PTR(ret);
>>> +				goto free_engines;
>>> +			}
>>> +		}
>>> +
>>> +		/*
>>> +		 * XXX: Must be done after calling intel_context_set_gem as that
>>> +		 * function changes the ring size while the ring is allocated
>>> +		 * when the context is pinned. Mismatch the ring size will cause
>> while... when... is ambiguous - changes the ring size at the point when the
>> context is pinned even though the ring is already allocated? Or changes the
>> ring size even though the ring is already allocated and the context is
>> already pinned? Something else?
>>
> The default size is 4k, intel_context_set_gem changes the size the 16k.
> If the pin is done before intel_context_set_gem the ring is allocated at
> 4k, then intel_context_set_gem changes the size to 16k == mismatch and
> hangs.
>   
Right. But, what does 'changes the ring size while the ring is allocated 
when the context is pinned' mean? That sentence needs to be split up / 
re-worded because it is not possible to parse unambiguously.

John.

>> Mismatch the ring -> A mismatch of the ring
>>
> Yep.
>
> Matt
>
>> John.
>>
>>
>>> +		 * the context to hang. Presumably with a bit of reordering we
>>> +		 * could move the perma-pin step to the backend function
>>> +		 * intel_engine_create_parallel.
>>> +		 */
>>> +		if (pe[n].type == I915_GEM_ENGINE_TYPE_PARALLEL) {
>>> +			ret = perma_pin_contexts(ce);
>>> +			if (ret) {
>>> +				err = ERR_PTR(ret);
>>> +				goto free_engines;
>>> +			}
>>> +		}
>>>    	}
>>>    	return e;
>>> @@ -1219,6 +1442,7 @@ static void context_close(struct i915_gem_context *ctx)
>>>    	/* Flush any concurrent set_engines() */
>>>    	mutex_lock(&ctx->engines_mutex);
>>> +	unpin_engines(__context_engines_static(ctx));
>>>    	engines_idle_release(ctx, rcu_replace_pointer(ctx->engines, NULL, 1));
>>>    	i915_gem_context_set_closed(ctx);
>>>    	mutex_unlock(&ctx->engines_mutex);
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>> index a627b09c4680..282cdb8a5c5a 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>> @@ -78,13 +78,16 @@ enum i915_gem_engine_type {
>>>    	/** @I915_GEM_ENGINE_TYPE_BALANCED: A load-balanced engine set */
>>>    	I915_GEM_ENGINE_TYPE_BALANCED,
>>> +
>>> +	/** @I915_GEM_ENGINE_TYPE_PARALLEL: A parallel engine set */
>>> +	I915_GEM_ENGINE_TYPE_PARALLEL,
>>>    };
>>>    /**
>>>     * struct i915_gem_proto_engine - prototype engine
>>>     *
>>>     * This struct describes an engine that a context may contain.  Engines
>>> - * have three types:
>>> + * have four types:
>>>     *
>>>     *  - I915_GEM_ENGINE_TYPE_INVALID: Invalid engines can be created but they
>>>     *    show up as a NULL in i915_gem_engines::engines[i] and any attempt to
>>> @@ -97,6 +100,10 @@ enum i915_gem_engine_type {
>>>     *
>>>     *  - I915_GEM_ENGINE_TYPE_BALANCED: A load-balanced engine set, described
>>>     *    i915_gem_proto_engine::num_siblings and i915_gem_proto_engine::siblings.
>>> + *
>>> + *  - I915_GEM_ENGINE_TYPE_PARALLEL: A parallel submission engine set, described
>>> + *    i915_gem_proto_engine::width, i915_gem_proto_engine::num_siblings, and
>>> + *    i915_gem_proto_engine::siblings.
>>>     */
>>>    struct i915_gem_proto_engine {
>>>    	/** @type: Type of this engine */
>>> @@ -105,10 +112,13 @@ struct i915_gem_proto_engine {
>>>    	/** @engine: Engine, for physical */
>>>    	struct intel_engine_cs *engine;
>>> -	/** @num_siblings: Number of balanced siblings */
>>> +	/** @num_siblings: Number of balanced or parallel siblings */
>>>    	unsigned int num_siblings;
>>> -	/** @siblings: Balanced siblings */
>>> +	/** @width: Width of each sibling */
>>> +	unsigned int width;
>>> +
>>> +	/** @siblings: Balanced siblings or num_siblings * width for parallel */
>>>    	struct intel_engine_cs **siblings;
>>>    	/** @sseu: Client-set SSEU parameters */
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> index 8309d1141d0a..1d880303a7e4 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
>>> @@ -55,9 +55,13 @@ struct intel_context_ops {
>>>    	void (*reset)(struct intel_context *ce);
>>>    	void (*destroy)(struct kref *kref);
>>> -	/* virtual engine/context interface */
>>> +	/* virtual/parallel engine/context interface */
>>>    	struct intel_context *(*create_virtual)(struct intel_engine_cs **engine,
>>> -						unsigned int count);
>>> +						unsigned int count,
>>> +						unsigned long flags);
>>> +	struct intel_context *(*create_parallel)(struct intel_engine_cs **engines,
>>> +						 unsigned int num_siblings,
>>> +						 unsigned int width);
>>>    	struct intel_engine_cs *(*get_sibling)(struct intel_engine_cs *engine,
>>>    					       unsigned int sibling);
>>>    };
>>> @@ -113,6 +117,7 @@ struct intel_context {
>>>    #define CONTEXT_NOPREEMPT		8
>>>    #define CONTEXT_LRCA_DIRTY		9
>>>    #define CONTEXT_GUC_INIT		10
>>> +#define CONTEXT_PERMA_PIN		11
>>>    	struct {
>>>    		u64 timeout_us;
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
>>> index d5ac49c0691e..08559ace0ada 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
>>> @@ -282,9 +282,19 @@ intel_engine_has_preempt_reset(const struct intel_engine_cs *engine)
>>>    	return intel_engine_has_preemption(engine);
>>>    }
>>> +#define FORCE_VIRTUAL	BIT(0)
>>>    struct intel_context *
>>>    intel_engine_create_virtual(struct intel_engine_cs **siblings,
>>> -			    unsigned int count);
>>> +			    unsigned int count, unsigned long flags);
>>> +
>>> +static inline struct intel_context *
>>> +intel_engine_create_parallel(struct intel_engine_cs **engines,
>>> +			     unsigned int num_engines,
>>> +			     unsigned int width)
>>> +{
>>> +	GEM_BUG_ON(!engines[0]->cops->create_parallel);
>>> +	return engines[0]->cops->create_parallel(engines, num_engines, width);
>>> +}
>>>    static inline bool
>>>    intel_virtual_engine_has_heartbeat(const struct intel_engine_cs *engine)
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> index 2eb798ad068b..ff6753ccb129 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>>> @@ -1953,16 +1953,16 @@ ktime_t intel_engine_get_busy_time(struct intel_engine_cs *engine, ktime_t *now)
>>>    struct intel_context *
>>>    intel_engine_create_virtual(struct intel_engine_cs **siblings,
>>> -			    unsigned int count)
>>> +			    unsigned int count, unsigned long flags)
>>>    {
>>>    	if (count == 0)
>>>    		return ERR_PTR(-EINVAL);
>>> -	if (count == 1)
>>> +	if (count == 1 && !(flags & FORCE_VIRTUAL))
>>>    		return intel_context_create(siblings[0]);
>>>    	GEM_BUG_ON(!siblings[0]->cops->create_virtual);
>>> -	return siblings[0]->cops->create_virtual(siblings, count);
>>> +	return siblings[0]->cops->create_virtual(siblings, count, flags);
>>>    }
>>>    struct i915_request *
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> index 43a74b216efb..bedb80057046 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> @@ -201,7 +201,8 @@ static struct virtual_engine *to_virtual_engine(struct intel_engine_cs *engine)
>>>    }
>>>    static struct intel_context *
>>> -execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>>> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>> +			 unsigned long flags);
>>>    static struct i915_request *
>>>    __active_request(const struct intel_timeline * const tl,
>>> @@ -3784,7 +3785,8 @@ static void virtual_submit_request(struct i915_request *rq)
>>>    }
>>>    static struct intel_context *
>>> -execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>>> +execlists_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>> +			 unsigned long flags)
>>>    {
>>>    	struct virtual_engine *ve;
>>>    	unsigned int n;
>>> diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
>>> index 25a8c4f62b0d..b367ecfa42de 100644
>>> --- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
>>> +++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
>>> @@ -3733,7 +3733,7 @@ static int nop_virtual_engine(struct intel_gt *gt,
>>>    	GEM_BUG_ON(!nctx || nctx > ARRAY_SIZE(ve));
>>>    	for (n = 0; n < nctx; n++) {
>>> -		ve[n] = intel_engine_create_virtual(siblings, nsibling);
>>> +		ve[n] = intel_engine_create_virtual(siblings, nsibling, 0);
>>>    		if (IS_ERR(ve[n])) {
>>>    			err = PTR_ERR(ve[n]);
>>>    			nctx = n;
>>> @@ -3929,7 +3929,7 @@ static int mask_virtual_engine(struct intel_gt *gt,
>>>    	 * restrict it to our desired engine within the virtual engine.
>>>    	 */
>>> -	ve = intel_engine_create_virtual(siblings, nsibling);
>>> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>>>    	if (IS_ERR(ve)) {
>>>    		err = PTR_ERR(ve);
>>>    		goto out_close;
>>> @@ -4060,7 +4060,7 @@ static int slicein_virtual_engine(struct intel_gt *gt,
>>>    		i915_request_add(rq);
>>>    	}
>>> -	ce = intel_engine_create_virtual(siblings, nsibling);
>>> +	ce = intel_engine_create_virtual(siblings, nsibling, 0);
>>>    	if (IS_ERR(ce)) {
>>>    		err = PTR_ERR(ce);
>>>    		goto out;
>>> @@ -4112,7 +4112,7 @@ static int sliceout_virtual_engine(struct intel_gt *gt,
>>>    	/* XXX We do not handle oversubscription and fairness with normal rq */
>>>    	for (n = 0; n < nsibling; n++) {
>>> -		ce = intel_engine_create_virtual(siblings, nsibling);
>>> +		ce = intel_engine_create_virtual(siblings, nsibling, 0);
>>>    		if (IS_ERR(ce)) {
>>>    			err = PTR_ERR(ce);
>>>    			goto out;
>>> @@ -4214,7 +4214,7 @@ static int preserved_virtual_engine(struct intel_gt *gt,
>>>    	if (err)
>>>    		goto out_scratch;
>>> -	ve = intel_engine_create_virtual(siblings, nsibling);
>>> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>>>    	if (IS_ERR(ve)) {
>>>    		err = PTR_ERR(ve);
>>>    		goto out_scratch;
>>> @@ -4354,7 +4354,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
>>>    	if (igt_spinner_init(&spin, gt))
>>>    		return -ENOMEM;
>>> -	ve = intel_engine_create_virtual(siblings, nsibling);
>>> +	ve = intel_engine_create_virtual(siblings, nsibling, 0);
>>>    	if (IS_ERR(ve)) {
>>>    		err = PTR_ERR(ve);
>>>    		goto out_spin;
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 013f36ef98cc..ecb938bb99fb 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -124,7 +124,13 @@ struct guc_virtual_engine {
>>>    };
>>>    static struct intel_context *
>>> -guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count);
>>> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>> +		   unsigned long flags);
>>> +
>>> +static struct intel_context *
>>> +guc_create_parallel(struct intel_engine_cs **engines,
>>> +		    unsigned int num_siblings,
>>> +		    unsigned int width);
>>>    #define GUC_REQUEST_SIZE 64 /* bytes */
>>> @@ -2615,6 +2621,7 @@ static const struct intel_context_ops guc_context_ops = {
>>>    	.destroy = guc_context_destroy,
>>>    	.create_virtual = guc_create_virtual,
>>> +	.create_parallel = guc_create_parallel,
>>>    };
>>>    static void submit_work_cb(struct irq_work *wrk)
>>> @@ -2864,8 +2871,6 @@ static const struct intel_context_ops virtual_guc_context_ops = {
>>>    	.get_sibling = guc_virtual_get_sibling,
>>>    };
>>> -/* Future patches will use this function */
>>> -__maybe_unused
>>>    static int guc_parent_context_pin(struct intel_context *ce, void *vaddr)
>>>    {
>>>    	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
>>> @@ -2882,8 +2887,6 @@ static int guc_parent_context_pin(struct intel_context *ce, void *vaddr)
>>>    	return __guc_context_pin(ce, engine, vaddr);
>>>    }
>>> -/* Future patches will use this function */
>>> -__maybe_unused
>>>    static int guc_child_context_pin(struct intel_context *ce, void *vaddr)
>>>    {
>>>    	struct intel_engine_cs *engine = guc_virtual_get_sibling(ce->engine, 0);
>>> @@ -2895,8 +2898,6 @@ static int guc_child_context_pin(struct intel_context *ce, void *vaddr)
>>>    	return __guc_context_pin(ce, engine, vaddr);
>>>    }
>>> -/* Future patches will use this function */
>>> -__maybe_unused
>>>    static void guc_parent_context_unpin(struct intel_context *ce)
>>>    {
>>>    	struct intel_guc *guc = ce_to_guc(ce);
>>> @@ -2912,8 +2913,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
>>>    	lrc_unpin(ce);
>>>    }
>>> -/* Future patches will use this function */
>>> -__maybe_unused
>>>    static void guc_child_context_unpin(struct intel_context *ce)
>>>    {
>>>    	GEM_BUG_ON(context_enabled(ce));
>>> @@ -2924,8 +2923,6 @@ static void guc_child_context_unpin(struct intel_context *ce)
>>>    	lrc_unpin(ce);
>>>    }
>>> -/* Future patches will use this function */
>>> -__maybe_unused
>>>    static void guc_child_context_post_unpin(struct intel_context *ce)
>>>    {
>>>    	GEM_BUG_ON(!intel_context_is_child(ce));
>>> @@ -2936,6 +2933,98 @@ static void guc_child_context_post_unpin(struct intel_context *ce)
>>>    	intel_context_unpin(ce->parallel.parent);
>>>    }
>>> +static void guc_child_context_destroy(struct kref *kref)
>>> +{
>>> +	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
>>> +
>>> +	__guc_context_destroy(ce);
>>> +}
>>> +
>>> +static const struct intel_context_ops virtual_parent_context_ops = {
>>> +	.alloc = guc_virtual_context_alloc,
>>> +
>>> +	.pre_pin = guc_context_pre_pin,
>>> +	.pin = guc_parent_context_pin,
>>> +	.unpin = guc_parent_context_unpin,
>>> +	.post_unpin = guc_context_post_unpin,
>>> +
>>> +	.ban = guc_context_ban,
>>> +
>>> +	.cancel_request = guc_context_cancel_request,
>>> +
>>> +	.enter = guc_virtual_context_enter,
>>> +	.exit = guc_virtual_context_exit,
>>> +
>>> +	.sched_disable = guc_context_sched_disable,
>>> +
>>> +	.destroy = guc_context_destroy,
>>> +
>>> +	.get_sibling = guc_virtual_get_sibling,
>>> +};
>>> +
>>> +static const struct intel_context_ops virtual_child_context_ops = {
>>> +	.alloc = guc_virtual_context_alloc,
>>> +
>>> +	.pre_pin = guc_context_pre_pin,
>>> +	.pin = guc_child_context_pin,
>>> +	.unpin = guc_child_context_unpin,
>>> +	.post_unpin = guc_child_context_post_unpin,
>>> +
>>> +	.cancel_request = guc_context_cancel_request,
>>> +
>>> +	.enter = guc_virtual_context_enter,
>>> +	.exit = guc_virtual_context_exit,
>>> +
>>> +	.destroy = guc_child_context_destroy,
>>> +
>>> +	.get_sibling = guc_virtual_get_sibling,
>>> +};
>>> +
>>> +static struct intel_context *
>>> +guc_create_parallel(struct intel_engine_cs **engines,
>>> +		    unsigned int num_siblings,
>>> +		    unsigned int width)
>>> +{
>>> +	struct intel_engine_cs **siblings = NULL;
>>> +	struct intel_context *parent = NULL, *ce, *err;
>>> +	int i, j;
>>> +
>>> +	siblings = kmalloc_array(num_siblings,
>>> +				 sizeof(*siblings),
>>> +				 GFP_KERNEL);
>>> +	if (!siblings)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	for (i = 0; i < width; ++i) {
>>> +		for (j = 0; j < num_siblings; ++j)
>>> +			siblings[j] = engines[i * num_siblings + j];
>>> +
>>> +		ce = intel_engine_create_virtual(siblings, num_siblings,
>>> +						 FORCE_VIRTUAL);
>>> +		if (!ce) {
>>> +			err = ERR_PTR(-ENOMEM);
>>> +			goto unwind;
>>> +		}
>>> +
>>> +		if (i == 0) {
>>> +			parent = ce;
>>> +			parent->ops = &virtual_parent_context_ops;
>>> +		} else {
>>> +			ce->ops = &virtual_child_context_ops;
>>> +			intel_context_bind_parent_child(parent, ce);
>>> +		}
>>> +	}
>>> +
>>> +	kfree(siblings);
>>> +	return parent;
>>> +
>>> +unwind:
>>> +	if (parent)
>>> +		intel_context_put(parent);
>>> +	kfree(siblings);
>>> +	return err;
>>> +}
>>> +
>>>    static bool
>>>    guc_irq_enable_breadcrumbs(struct intel_breadcrumbs *b)
>>>    {
>>> @@ -3762,7 +3851,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>>>    }
>>>    static struct intel_context *
>>> -guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count)
>>> +guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
>>> +		   unsigned long flags)
>>>    {
>>>    	struct guc_virtual_engine *ve;
>>>    	struct intel_guc *guc;
>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>> index 0179f92e0916..c2a63e1584cb 100644
>>> --- a/include/uapi/drm/i915_drm.h
>>> +++ b/include/uapi/drm/i915_drm.h
>>> @@ -1824,6 +1824,7 @@ struct drm_i915_gem_context_param {
>>>     * Extensions:
>>>     *   i915_context_engines_load_balance (I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE)
>>>     *   i915_context_engines_bond (I915_CONTEXT_ENGINES_EXT_BOND)
>>> + *   i915_context_engines_parallel_submit (I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT)
>>>     */
>>>    #define I915_CONTEXT_PARAM_ENGINES	0xa
>>> @@ -2098,6 +2099,135 @@ struct i915_context_engines_bond {
>>>    	struct i915_engine_class_instance engines[N__]; \
>>>    } __attribute__((packed)) name__
>>> +/**
>>> + * struct i915_context_engines_parallel_submit - Configure engine for
>>> + * parallel submission.
>>> + *
>>> + * Setup a slot in the context engine map to allow multiple BBs to be submitted
>>> + * in a single execbuf IOCTL. Those BBs will then be scheduled to run on the GPU
>>> + * in parallel. Multiple hardware contexts are created internally in the i915 to
>>> + * run these BBs. Once a slot is configured for N BBs only N BBs can be
>>> + * submitted in each execbuf IOCTL and this is implicit behavior e.g. The user
>>> + * doesn't tell the execbuf IOCTL there are N BBs, the execbuf IOCTL knows how
>>> + * many BBs there are based on the slot's configuration. The N BBs are the last
>>> + * N buffer objects or first N if I915_EXEC_BATCH_FIRST is set.
>>> + *
>>> + * The default placement behavior is to create implicit bonds between each
>>> + * context if each context maps to more than 1 physical engine (e.g. context is
>>> + * a virtual engine). Also we only allow contexts of same engine class and these
>>> + * contexts must be in logically contiguous order. Examples of the placement
>>> + * behavior are described below. Lastly, the default is to not allow BBs to be
>>> + * preempted mid-batch. Rather insert coordinated preemption points on all
>>> + * hardware contexts between each set of BBs. Flags could be added in the future
>>> + * to change both of these default behaviors.
>>> + *
>>> + * Returns -EINVAL if hardware context placement configuration is invalid or if
>>> + * the placement configuration isn't supported on the platform / submission
>>> + * interface.
>>> + * Returns -ENODEV if extension isn't supported on the platform / submission
>>> + * interface.
>>> + *
>>> + * .. code-block:: none
>>> + *
>>> + *	Examples syntax:
>>> + *	CS[X] = generic engine of same class, logical instance X
>>> + *	INVALID = I915_ENGINE_CLASS_INVALID, I915_ENGINE_CLASS_INVALID_NONE
>>> + *
>>> + *	Example 1 pseudo code:
>>> + *	set_engines(INVALID)
>>> + *	set_parallel(engine_index=0, width=2, num_siblings=1,
>>> + *		     engines=CS[0],CS[1])
>>> + *
>>> + *	Results in the following valid placement:
>>> + *	CS[0], CS[1]
>>> + *
>>> + *	Example 2 pseudo code:
>>> + *	set_engines(INVALID)
>>> + *	set_parallel(engine_index=0, width=2, num_siblings=2,
>>> + *		     engines=CS[0],CS[2],CS[1],CS[3])
>>> + *
>>> + *	Results in the following valid placements:
>>> + *	CS[0], CS[1]
>>> + *	CS[2], CS[3]
>>> + *
>>> + *	This can be thought of as two virtual engines, each containing two
>>> + *	engines thereby making a 2D array. However, there are bonds tying the
>>> + *	entries together and placing restrictions on how they can be scheduled.
>>> + *	Specifically, the scheduler can choose only vertical columns from the 2D
>>> + *	array. That is, CS[0] is bonded to CS[1] and CS[2] to CS[3]. So if the
>>> + *	scheduler wants to submit to CS[0], it must also choose CS[1] and vice
>>> + *	versa. Same for CS[2] requires also using CS[3].
>>> + *	VE[0] = CS[0], CS[2]
>>> + *	VE[1] = CS[1], CS[3]
>>> + *
>>> + *	Example 3 pseudo code:
>>> + *	set_engines(INVALID)
>>> + *	set_parallel(engine_index=0, width=2, num_siblings=2,
>>> + *		     engines=CS[0],CS[1],CS[1],CS[3])
>>> + *
>>> + *	Results in the following valid and invalid placements:
>>> + *	CS[0], CS[1]
>>> + *	CS[1], CS[3] - Not logically contiguous, return -EINVAL
>>> + */
>>> +struct i915_context_engines_parallel_submit {
>>> +	/**
>>> +	 * @base: base user extension.
>>> +	 */
>>> +	struct i915_user_extension base;
>>> +
>>> +	/**
>>> +	 * @engine_index: slot for parallel engine
>>> +	 */
>>> +	__u16 engine_index;
>>> +
>>> +	/**
>>> +	 * @width: number of contexts per parallel engine or in other words the
>>> +	 * number of batches in each submission
>>> +	 */
>>> +	__u16 width;
>>> +
>>> +	/**
>>> +	 * @num_siblings: number of siblings per context or in other words the
>>> +	 * number of possible placements for each submission
>>> +	 */
>>> +	__u16 num_siblings;
>>> +
>>> +	/**
>>> +	 * @mbz16: reserved for future use; must be zero
>>> +	 */
>>> +	__u16 mbz16;
>>> +
>>> +	/**
>>> +	 * @flags: all undefined flags must be zero, currently not defined flags
>>> +	 */
>>> +	__u64 flags;
>>> +
>>> +	/**
>>> +	 * @mbz64: reserved for future use; must be zero
>>> +	 */
>>> +	__u64 mbz64[3];
>>> +
>>> +	/**
>>> +	 * @engines: 2-d array of engine instances to configure parallel engine
>>> +	 *
>>> +	 * length = width (i) * num_siblings (j)
>>> +	 * index = j + i * num_siblings
>>> +	 */
>>> +	struct i915_engine_class_instance engines[0];
>>> +
>>> +} __packed;
>>> +
>>> +#define I915_DEFINE_CONTEXT_ENGINES_PARALLEL_SUBMIT(name__, N__) struct { \
>>> +	struct i915_user_extension base; \
>>> +	__u16 engine_index; \
>>> +	__u16 width; \
>>> +	__u16 num_siblings; \
>>> +	__u16 mbz16; \
>>> +	__u64 flags; \
>>> +	__u64 mbz64[3]; \
>>> +	struct i915_engine_class_instance engines[N__]; \
>>> +} __attribute__((packed)) name__
>>> +
>>>    /**
>>>     * DOC: Context Engine Map uAPI
>>>     *
>>> @@ -2157,6 +2287,7 @@ struct i915_context_param_engines {
>>>    	__u64 extensions; /* linked chain of extension blocks, 0 terminates */
>>>    #define I915_CONTEXT_ENGINES_EXT_LOAD_BALANCE 0 /* see i915_context_engines_load_balance */
>>>    #define I915_CONTEXT_ENGINES_EXT_BOND 1 /* see i915_context_engines_bond */
>>> +#define I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT 2 /* see i915_context_engines_parallel_submit */
>>>    	struct i915_engine_class_instance engines[0];
>>>    } __attribute__((packed));

