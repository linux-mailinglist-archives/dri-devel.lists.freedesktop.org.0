Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808CA40A092
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 00:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65ADE89F6D;
	Mon, 13 Sep 2021 22:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BABB89F6D;
 Mon, 13 Sep 2021 22:38:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285504753"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; 
 d="scan'208,217";a="285504753"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 15:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; 
 d="scan'208,217";a="507576669"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 13 Sep 2021 15:38:50 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 13 Sep 2021 15:38:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 13 Sep 2021 15:38:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 13 Sep 2021 15:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7wDMFeTVTI81isqFNZKEaF5LiYajvQEOiEgLgby6EYzrEVj2BLr9JwCse2oNg/xvnl3uiU2sLKzjxOsY9b8VjPCbxQWmZOIPbgDMgPzdyc0HpR2OggUOMwhdgF+CYtt8ht3A1tKF3GELlIOLkj8bT/cFyt0E92IvtalaZn/QtPjIxiv3f7/+9vzr4NXLPiYp3l64Tjqu4cLyBvuquNrSkAk3d9NsuS2F8fJB2Z1YyW31/tT8tZQYOJJlpXvLdUoZJO/mE9wF3Yev7m1Z1JoykWWfJvoKJeSAh7tpw0AXgtk61Fq3vC/CnT5hYBcppE52ShCEK+Gr7pDkN7DFpCoYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=iZG6OoYYWZNcSh5sN0PClRDvmPfuG+Z6MbaYQM8SQrw=;
 b=bqsHAbHDaA4Aqdda2KxCDI1+/1NxeuhQv1zerSmPXNadZMAdmZGjthixDItmipJI8O60Z/ipQnGgtM9Qf0j1WrX1Ily93q72jei8QSuR0rJTV2ItWJsmwYWsZ5yft3b5xZv1eHvKbzuVd2Ll4tw/oJXgeM7FUUqQq2HHjP9nfAvVqhuF2LrdkgYpAazG8CJw91zAu2jezF+RdfYY+LylXEF4VU4KyLsZ1h791sFjnHbxTi8Ta957RxXN54eaEOLmKcHysl+4YItxZ4Aus2vjLhJNbztLrDNzhzpUSxC3X+0Sg2Q1bTcUFurVo975x4IcO+GNPjB51t9Ld06VwuRjMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZG6OoYYWZNcSh5sN0PClRDvmPfuG+Z6MbaYQM8SQrw=;
 b=ii4CSZqEz/y9EZBkaRA3aCb4/8ekbcw2Q1x4u0NdCSCEheTjBhbsuPeeRiNFRyltFutijejOAyJ/kodEKTK912KJWSlZabvfFLYxujedVyJ56hSSlxtXE48wixQtsTj89u3cspo8QH7tySp51rgehnoYV3qMh5NViZtTi/PBJZ0=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5628.namprd11.prod.outlook.com (2603:10b6:510:d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 22:38:47 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 22:38:47 +0000
Subject: Re: [Intel-gfx] [PATCH 07/27] drm/i915/guc: Don't call
 switch_to_kernel_context with GuC submission
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-8-matthew.brost@intel.com>
 <7b0f2535-a0f7-e423-d929-63f31febee14@intel.com>
 <20210913165430.GA8862@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <5c023168-b32e-e6db-5b04-149a2aee1a10@intel.com>
Date: Mon, 13 Sep 2021 15:38:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210913165430.GA8862@jons-linux-dev-box>
Content-Type: multipart/alternative;
 boundary="------------E30DC6B09D728B7155B1DE49"
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:303:b8::19) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 MW4PR03CA0194.namprd03.prod.outlook.com (2603:10b6:303:b8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.16 via Frontend Transport; Mon, 13 Sep 2021 22:38:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88eb60a2-9432-4b7b-9bf6-08d977073fe5
X-MS-TrafficTypeDiagnostic: PH0PR11MB5628:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5628910BFD465147BA33481BBDD99@PH0PR11MB5628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lXNn+boOMESQD77R4mqBhZ8aW+Uo+ZpJIUMze9tmjtU95mG2vENlZGQ05cfobmOhLMKi3bVUDSKlIQ7GYX8NBzUWEupo3P69JEby7eA/xZNL9SXZJZeskwBHqMcnS4L/6Em8KloC4VDXOForl2bUk+0ueZrZiEnOH7t5Fuws/h9H1p4Cwbbz1Bgp4VpyuhOlKDuMEhNU0MiCevpWRL4uPyRjbVKa10rBNMOW5IWRd0T/LkfrsSCCulhEsIW1yKdF4b3zHhBYVoPJTdFZtdihrsILFhtVEaYX2cxV7GKmBhk53Oo6mKYP2uNkoKBF72Ih+vCTienwLyaiGDoR+Bw1YIrxDHcrrv1W9CgT0LjCl2fb8H34M0S6x/rbL8zq88DNIKiem55eySARNnRgW9MaPgY8m7CusMnKVHq5NV94J65+J/aR46UtgIgPPkEYzdhRiCgwnb/q3PV3zew1fP1WAGGw8dvdrZ0l+qVwTt/HE1dYo+I+Pxfnod860+ROgk2D7Dlo5FKNDHpeyfDH3XObYp+5dkDXe7gpeCSrYr9Y4IDS/nLG40FQIZzFhwHNWnr9BgX5LybIKFhhPSN8KLJ2QvnJj9dd5s4+TSjwRNrUH3pun7yglhCVP9Zhl33tjgDOK05UPVp41KXlb+rlWG8/tO44ivMLeV+j7ImYie7MPxqlZ38BB+1JlPfGxJ+tBpZeCMSH5OpytuzDHMbL2aaeR45vJomZiTsX7U4+qHGXuekCf7wRYSL4zsxe0RQjQ72K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(16576012)(6636002)(26005)(6862004)(53546011)(186003)(478600001)(66556008)(4326008)(956004)(2906002)(8936002)(66946007)(107886003)(316002)(66476007)(6486002)(8676002)(31696002)(31686004)(36756003)(33964004)(37006003)(38100700002)(2616005)(86362001)(5660300002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2tqZ1N1bzN4bmhyc3dUQ3E0bmlQZ3p6ekJqZ2s2VnVvelhaZ0hWTm9JTHpv?=
 =?utf-8?B?WEFoZ0gxdzBwSCt5bm8zWUFUZ2d4emxSeGJGbXZYNGVLbk4xUEpJQWM5U0xn?=
 =?utf-8?B?M2k2eDdyajBrWDI1ei95WUpxSUZrTlYxb0FHME51clNKOC9PYkFDa1VkVFFO?=
 =?utf-8?B?NDBkemRDUHhKVDJtR0NWb0oySHV0NVZiZ2MrTHBTTDdQSldMTnh0b21jRnY0?=
 =?utf-8?B?VVdQbjlmdXQvMmJEOEVsZHgweFB3ck9zbGxxa0dweS9CcmcrWDE2OS93cDA4?=
 =?utf-8?B?RmJXalZBRHhGVDYrd3JHMDBQYkNsOWwwZldGYm5FcmYrMzRUbzBXNC81aUxs?=
 =?utf-8?B?ck1TSUVISXRibSsySWdIbnlBMjd0OU9rSThHUnJFbEUwdHdOQk05bHdFUHY0?=
 =?utf-8?B?MS9OY0hob2tkVWhIL2UzWC9EOHVJZ0ZPcjN1Rmt0MjE4dU5pYkFid20wcW1O?=
 =?utf-8?B?RlpKYk5jczFSUHYyZHRjYzhxelVBcjZmbGtGQlZBL0x5eEpIREphOHA3Z2dI?=
 =?utf-8?B?WGtxZjgzdkduZ2FzNDZMSEYyeWwvb21ma2M1alIyczNYSmNsNTgzdXh5Z0xv?=
 =?utf-8?B?dkpzeGthWDFDc0E2YmhFaVREZUxlTHVvQmpWTUs4a2ttWitFNklTWC9kSUJI?=
 =?utf-8?B?UmFDUmRPdUdhYkJlWHdUeDArdlNWc3cvcnViWGhFV1RjaTNybWs0UUJtUjU0?=
 =?utf-8?B?andPVGlKZ05sa0FDS2V6L0FYUERZUzJkRkpVMXArSEkyN0kxUUVMVFN2SThh?=
 =?utf-8?B?bjM5OWFXcXhjMlQ4R3hyK2d0aTJUNHUyeHZNWmFOQXVNVUp2RWFmUk5nMVRa?=
 =?utf-8?B?cHNWT0dhbkw5UEo1czhHMkl6QWRVU2hvNmZFWWpvRW5XeFE4eTlHSENjb0lC?=
 =?utf-8?B?N0cySk9GM3dvNTJrTkM4aGdpNVpObDVtelI3Skx6MDNubm5aSkVEdDYrbHlp?=
 =?utf-8?B?WUpDdjdBTHcyYTM5TVpNUVVEaDRjbnJOQ1FyOTQrendjOGhMVnl0cURjb1k0?=
 =?utf-8?B?dGxSYkg0dEYwdUlPQzJUR1kyNWU2NDVhR0lyUFliSnM1MDRtU2tUbkZTRTNq?=
 =?utf-8?B?T3B6TE00SjBkSlZoVzNnenpwUFgzUHlzUDMwVVBrYklGK3A1Qi95RzB1WFhN?=
 =?utf-8?B?WFozK3Y1ZXdITmxnaUhCeHkxSzVQY1VVQ21QeEROUTBGamFWeGVybExsODZx?=
 =?utf-8?B?VlF1YmpFdFg1NmN6dURzKzQzL0lFSkk0Yzhvcmo5TGI4TElvbFNvdXVvL3Uz?=
 =?utf-8?B?dEhLS01mMU1zNDNsMmxyOFFtaWF4MXlKK0lNcU9iTWNzSjRBSkd2ZVdFQXo4?=
 =?utf-8?B?b1R1K0krVmdtam9xbURQUXlqc1R0d0hFbFltcXd4QmdxcTJ6dStiNWc4aUJS?=
 =?utf-8?B?TGd2Z3pLaENPeWxZbHdWWDh6OWlXcDUzK3dEOC91QVhKUHljeitIeC85RERk?=
 =?utf-8?B?cTlvenJIeFdtdi84aVM2VFNHU3dNU0dQV1puZCtFUllZTEUxQ3pvTTJEV1NU?=
 =?utf-8?B?d0U0NUlOZVlJdGlNMjh6TURDemlKY0p1cmI3dnQ2QXdxVDFGdTRITGcvWWxw?=
 =?utf-8?B?MGZuaHh1SXlzUVUvWGg3eW9XdlpxTXZPck8rTVZsUVF5NFJWeC91MGpLWWlu?=
 =?utf-8?B?WStDMlY3OW1VVlNGb2VkVmprS3d2aFhiL3FSNUpnNjd4dFY5ZEJGaVhybVFC?=
 =?utf-8?B?dGl6b1ZQTFJJdmRCcFEwaDhIUGdadGJHaUtpYnNXd0JJeDRpSWVXMllVR0x4?=
 =?utf-8?Q?BbhxCOHwMFhZuU9o7fOsEOAHRgHKWhGLUtvgpuZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88eb60a2-9432-4b7b-9bf6-08d977073fe5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 22:38:47.1468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1nJ7OwNyNJjt2gjDElopL89ZxqB+vujmsq5og+dd1HoBil6jrOZ2J+hBvp4OFYCxMcUf2xJpvjaJ8rVl5iaiwvMxo0683BFudMLxFb8m0I=
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

--------------E30DC6B09D728B7155B1DE49
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/2021 09:54, Matthew Brost wrote:
> On Thu, Sep 09, 2021 at 03:51:27PM -0700, John Harrison wrote:
>> On 8/20/2021 15:44, Matthew Brost wrote:
>>> Calling switch_to_kernel_context isn't needed if the engine PM reference
>>> is taken while all contexts are pinned. By not calling
>>> switch_to_kernel_context we save on issuing a request to the engine.
>> I thought the intention of the switch_to_kernel was to ensure that the GPU
>> is not touching any user context and is basically idle. That is not a valid
>> assumption with an external scheduler such as GuC. So why is the description
>> above only mentioning PM references? What is the connection between the PM
>> ref and the switch_to_kernel?
>>
>> Also, the comment in the code does not mention anything about PM references,
>> it just says 'not necessary with GuC' but no explanation at all.
>>
> Yea, this need to be explained better. How about this?
>
> Calling switch_to_kernel_context isn't needed if the engine PM reference
> is take while all user contexts have scheduling enabled. Once scheduling
> is disabled on all user contexts the GuC is guaranteed to not touch any
> user context state which is effectively the same pointing to a kernel
> context.
>
> Matt
I'm still not seeing how the PM reference is involved?

Also, IMHO the focus is wrong in the above text. The fundamental 
requirement is the ensure the hardware is idle. Execlist achieves this 
by switching to a safe context. GuC achieves it by disabling scheduling. 
Indeed, switching to a 'safe' context really has no effect with GuC 
submission. So 'effectively the same as pointing to a kernel context' is 
an incorrect description. I would go with something like:

    "This is execlist specific behaviour intended to ensure the GPU is
    idle by switching to a known 'safe' context. With GuC submission,
    the same idle guarantee is achieved by other means (disabling
    scheduling). Further, switching to a 'safe' context has no effect
    with GuC submission as the scheduler can just switch back again.
    FIXME: Move this backend scheduler specific behaviour into the
    scheduler backend."


John.


>
>>> v2:
>>>    (Daniel Vetter)
>>>     - Add FIXME comment about pushing switch_to_kernel_context to backend
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_engine_pm.c | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>> index 1f07ac4e0672..11fee66daf60 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>> @@ -162,6 +162,15 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
>>>    	unsigned long flags;
>>>    	bool result = true;
>>> +	/*
>>> +	 * No need to switch_to_kernel_context if GuC submission
>>> +	 *
>>> +	 * FIXME: This execlists specific backend behavior in generic code, this
>> "This execlists" -> "This is execlist"
>>
>> "this should be" -> "it should be"
>>
>> John.
>>
>>> +	 * should be pushed to the backend.
>>> +	 */
>>> +	if (intel_engine_uses_guc(engine))
>>> +		return true;
>>> +
>>>    	/* GPU is pointing to the void, as good as in the kernel context. */
>>>    	if (intel_gt_is_wedged(engine->gt))
>>>    		return true;


--------------E30DC6B09D728B7155B1DE49
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 9/13/2021 09:54, Matthew Brost wrote:<br>
    <blockquote type="cite" cite="mid:20210913165430.GA8862@jons-linux-dev-box">
      <pre class="moz-quote-pre" wrap="">On Thu, Sep 09, 2021 at 03:51:27PM -0700, John Harrison wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 8/20/2021 15:44, Matthew Brost wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Calling switch_to_kernel_context isn't needed if the engine PM reference
is taken while all contexts are pinned. By not calling
switch_to_kernel_context we save on issuing a request to the engine.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I thought the intention of the switch_to_kernel was to ensure that the GPU
is not touching any user context and is basically idle. That is not a valid
assumption with an external scheduler such as GuC. So why is the description
above only mentioning PM references? What is the connection between the PM
ref and the switch_to_kernel?

Also, the comment in the code does not mention anything about PM references,
it just says 'not necessary with GuC' but no explanation at all.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yea, this need to be explained better. How about this?

Calling switch_to_kernel_context isn't needed if the engine PM reference
is take while all user contexts have scheduling enabled. Once scheduling
is disabled on all user contexts the GuC is guaranteed to not touch any
user context state which is effectively the same pointing to a kernel
context.

Matt</pre>
    </blockquote>
    I'm still not seeing how the PM reference is involved?<br>
    <br>
    Also, IMHO the focus is wrong in the above text. The fundamental
    requirement is the ensure the hardware is idle. Execlist achieves
    this by switching to a safe context. GuC achieves it by disabling
    scheduling. Indeed, switching to a 'safe' context really has no
    effect with GuC submission. So 'effectively the same as pointing to
    a kernel context' is an incorrect description. I would go with
    something like:<br>
    <blockquote>&quot;This is execlist specific behaviour intended to ensure
      the GPU is idle by switching to a known 'safe' context. With GuC
      submission, the same idle guarantee is achieved by other means
      (disabling scheduling). Further, switching to a 'safe' context has
      no effect with GuC submission as the scheduler can just switch
      back again.<br>
      FIXME: Move this backend scheduler specific behaviour into the
      scheduler backend.&quot;<br>
    </blockquote>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20210913165430.GA8862@jons-linux-dev-box">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">v2:
  (Daniel Vetter)
   - Add FIXME comment about pushing switch_to_kernel_context to backend

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Reviewed-by: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel.vetter@ffwll.ch">&lt;daniel.vetter@ffwll.ch&gt;</a>
---
  drivers/gpu/drm/i915/gt/intel_engine_pm.c | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index 1f07ac4e0672..11fee66daf60 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -162,6 +162,15 @@ static bool switch_to_kernel_context(struct intel_engine_cs *engine)
  	unsigned long flags;
  	bool result = true;
+	/*
+	 * No need to switch_to_kernel_context if GuC submission
+	 *
+	 * FIXME: This execlists specific backend behavior in generic code, this
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">&quot;This execlists&quot; -&gt; &quot;This is execlist&quot;

&quot;this should be&quot; -&gt; &quot;it should be&quot;

John.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+	 * should be pushed to the backend.
+	 */
+	if (intel_engine_uses_guc(engine))
+		return true;
+
  	/* GPU is pointing to the void, as good as in the kernel context. */
  	if (intel_gt_is_wedged(engine-&gt;gt))
  		return true;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------E30DC6B09D728B7155B1DE49--
