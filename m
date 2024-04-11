Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADAC8A14AB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 14:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912B810EAFB;
	Thu, 11 Apr 2024 12:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUzR6oi/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E252A10EAFB
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 12:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712838679; x=1744374679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2sfUg1m0mu/F8PKeJPv+4H+PBiWBvckkre/hI0D+DYU=;
 b=RUzR6oi/7SpHQG15+ciKFzkTp8V8wcs1n9lSJW4BOTHUnHfVUUkMQIMo
 Ve1r9b+O5AWy8UYEOn6+5uRhh+ul6b9zlUTvjwDiE4avlX8Ujb/pNfIcq
 jO2JSsV9cA5GmKsZNZWkfOSUTiAWUGfUkSXKJfthkc6mYdHQH4FRsrnV0
 MPEqTk39Twe4MnCT5z3UHf8kaKGjWG2M6gQ2YoVbaPUu6L9qKg4qmygYS
 igZXb5HUdMdCxQvlGo6XlTwzp2X0l30KzlnnQ4IFdqhHIQFVqM9aqYTQG
 tCgIGbi/GNGYH/nIppKnBo8FDH7ribmKB1rp0vmuIrMC1s2U+3U1NS1g1 A==;
X-CSE-ConnectionGUID: upSjQu7yTXOMBZ/DOvQkFQ==
X-CSE-MsgGUID: QJnQXJNBTba4DChwwGfFrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19394726"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="19394726"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:31:04 -0700
X-CSE-ConnectionGUID: 7ZOikmZCTFSYFgweHUxomg==
X-CSE-MsgGUID: 6vFSO3GoTc6CtQesBkm+Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20848436"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 05:31:03 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 05:31:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 05:31:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 05:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6Uz3ulXLobEdioIzkgELbuMqjTkA5aLTZOvMaMvwaitIwMGTFdSesSUJLbNzq7hi/mv6gHwFemR3VJx+llmPPZsbT1E7QfKXUNJbphzRHbLCCn2R8d0raRsGLo2Q9YCzxwwMlv9JopDK48tlxhekKQSFFJdMRgcaL7LYvRuCf6uAdKCgCmWkjw1jzvyHsaSBpy8rd3F3p7zsZSVoEURthsegZXfL8KxF1hyZ65ls24NO+NvPIJtiQEzc7RtgsD8p3RTi2Cb16+A3ZJ7Lw91eAh2SS4kfFOwpz6SJjM7Vn5hlHHs0UaHGGpGPtPZEVBgHp1ic2a5LnFgvwjQr+/3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgmdQsx/wn10VdfIFRPvkvhaJCwxkmGAjLSuIDQvuRI=;
 b=k054n+Ds92G96xGP83ha9vGhyUuMN+5XPGw7PcHBm1Cgz4LagIYa98zdq0HcDE2Nj0BsMaljslvrSQzL1iDT+JyVrFESD9PUq54NGPVzb22ntxRth2VbVTi1IjMOik+X30CyngWUXXy3CBzdF2kxtfSvanelUmx+3R/Xmu6Nx8MWKhor1nuvDnDR6jjBySN45YOrvJWp1PDgoUjdq80u2lkyeLCb0p3f7q8+Wc1qUymYQdt17i7dsnZPxB2r6xtDUtp6Nw/uEJ+wxMRdUdmeOSyc4yEGW/6BGX6V+0gmOFihO84y+GW5JswqKnJXtbj8YUicD3Bc880aVlEM2p504w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 11 Apr
 2024 12:31:00 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%5]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 12:31:00 +0000
Message-ID: <f885cb95-ee7b-4744-bd01-96757b2c360f@intel.com>
Date: Thu, 11 Apr 2024 14:30:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/9] drm/ttm/tests: Add tests with mock resource
 managers
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Amaranath
 Somalapuram" <Amaranath.Somalapuram@amd.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <bb45017745c8aba53e7b36aad47e66c4843771e3.1711117249.git.karolina.stolarek@intel.com>
 <a8febe3b-7786-4e31-856b-da9e3d0a8c68@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <a8febe3b-7786-4e31-856b-da9e3d0a8c68@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0219.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::16) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|BN9PR11MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: b57b2ee2-4323-4bef-8c61-08dc5a233e7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TxcUmBJyMAhmHe1c4kw8Oy+3bkG0L76JsrrMnLsJrjRPIpCS31HSN4zwRoot6tFXcfZvDR/O8ZW8JX2PKHFz7ldcgxz7KeAKwmlfU4Jk4KQUAXg8F5AEtkP/T7AbWNhYJLMypOpasdMF1ulFFcUHvHJPy7YGmbj0O+HUEy0O7QQKiXnC1kdxB+G2J2ulLQVWYqtvLT9h4vNTrQlP5IBplonFHlUkmockg3jD0iJ+N4BmZTcOVXxiQ5yc+pKtKsuEWBNvtMHEv2PDpkTQLHnNM5Ce8n1y8kj3Q2RqJTrhSRiwy82yiAhCrPmphhaxDvgZZGpAXIQM4DzFu5ZaaSayxYIfc+JyJKI/bWUBkFy67l5Eh8RAN6NV3VCcGJz3Z7bicxJp4AsNP8TqAzqNb9G4EUCMcjN/0LB5mMiweJzwlnyBkN/P6gaoVW5BTOlI67VcIx0T7b1s8uNqocmZbbOnK0fw8jeQ/2/8ZhX5HvcS/BP91D4lSEvsr4YBBVHRerpFgEBp2obMp9EfM/Q8lQhNO31iDQ0xGTcEvKTzd+DTXkSIYldCDAs2dCbms82yxRXSezoD4PJDvyjKQziY3DZX/0qmBUCQ48fvuh7+GTX6NLe3OcBe2tALmi5X+AbtRJ4m5b29aFmaxx/2Da/OYOMNFb0maDipvLYDiSsTrTjLQLw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVdSQzRFd3pLeWYzQ1lxd1l0eGdPS2M4ai94WnQ3bUoremVJNTR5UWNsZW4y?=
 =?utf-8?B?MUtMMnJTNEx4L2pCTFVwOGpKK0NBb2JGMnBhN3hJN2xDTHIvK2VISUhLTk51?=
 =?utf-8?B?T2doZ0cvaXJka2JkVUtNRDBxZE4xa3BacFFCRSt2VHpIR09OaHZkSWtPQmlT?=
 =?utf-8?B?RnVORWwvZXpmNGdpYmgzQmptWklBTzdyYVdLL2hjdFIvam81REMwTStsdFZ3?=
 =?utf-8?B?bGNGRzl6WXRpTUVUQ1ZKN0RCZGtBZ0JxY1d0REgyT09OR3NvR2xHZEVlL0E3?=
 =?utf-8?B?dmxzMDQxUExDZm1XRkFsa0FsUWdzOHpMM2YxRXAxWjNzNEdLZXQ2K01ENitu?=
 =?utf-8?B?SkpUTU5FNi9JcTE5aDlMV3E3bWNmOCttWW9qRzNsTHVFdTRPWUxFb01nbEgr?=
 =?utf-8?B?RENoTTI5VEExVGdKdUhkSEFGaWRteDNzWEVrLzFyT0E2bWR3Y2llUE9xS29T?=
 =?utf-8?B?Q0pscHBUbVNaelZIajJQRkhYckVybzJRN0RsYTNxYWNhNzdGclFzbnRQSThS?=
 =?utf-8?B?aDltK0dmcFlZd3hWdk5WRFpIK3lhTERTQkdwdGU2NW42bXZKL3QyTWJIS3Bu?=
 =?utf-8?B?U2JZeFc2eUt1MFllNk83eHJmZGNaN3l5NGVJazJlSXpEK2RZTUxKV211VWdM?=
 =?utf-8?B?T0pJc0xLZzQ2SFN3bjdDcHN0MFdJeDhWV0JMK0ZKbjI0QXJSSFBLK0twV0d6?=
 =?utf-8?B?enV2SU1XWVZBUGR4UmZtVncrSUdjTEQxdDd4VXdUQ2hkR2RqOFA0KzJmSThl?=
 =?utf-8?B?QjZOOFU5c0pYUTVvTTg1MkQ0SW4rTXREMTN5WXRlTGRCcjJMTVVSVCtrcmJZ?=
 =?utf-8?B?azRnMmtqODQzT0x0em5mMDhQYlNERVJhTHNtdCtiTkh0UFl4SFdWeFBTcCt4?=
 =?utf-8?B?N3FuOWphMnJHU2pDNGlLVFFhNStTNExybitKN2VEUWFHR09UWk9rTzZma2tx?=
 =?utf-8?B?S0RVNkhyUGMvdWRUemIxaU9LSnVrT25KYVJCaWs2MzF0VWN2OEF3ckFRcXc2?=
 =?utf-8?B?cVhKemdPM3M5c2U0RkVUbS93eTFDRzhTb0pZRGdLZzNTeG5GU1JwS2J1MGdK?=
 =?utf-8?B?VEZuWmtrQTBrTVFqRURqS2RtZFlsbTE3Q3ZCczg1TExodFg3MitHNkc4M25x?=
 =?utf-8?B?TTYyeE5oaW93TEQxVzYyZU9TLzVGT24xTDZKck9QQWdmWnBiZ3hsVjFzU0JZ?=
 =?utf-8?B?ZUhyclpvUHFhQmNldGErTHZJZytscFRpeDh5OTV1TDV0YnJGQ0JWWG1JMUNC?=
 =?utf-8?B?TkczWWFrazNiUTVlK0JDSW4waFlzaG0zTmVVQXAzdGVCejQ5b0hhSm8yc3lD?=
 =?utf-8?B?SEpZdGprQzhGSlJySnlpR0FWQmkyc0xHdnlrQU53SjF5bkFJUW1NS2Q1MktU?=
 =?utf-8?B?YUloWERmZTd2ZmpaaHptRDUyQXFDZ05KSjFsV2ZkSHdmMHB6SjNMeHNYNkN6?=
 =?utf-8?B?ZUg2L3MxOGw2d1ZiM2RUeThDSHh0Z0JYclF2Z2haeXU2MEYwZ3Z0RTlZa1o4?=
 =?utf-8?B?UGljblZVYVovT3hQTys1U2dBN0tEUW8xQ3MvV1puSGEvY1VYbTRBcTBLaE81?=
 =?utf-8?B?YVQzWFdxUng1L2dDVUFIM0hJdHFtekFlNERMMmpSclJCMkZGeVJTQVNlcUpn?=
 =?utf-8?B?a1lSVkNvZ2tjUEJJSlF2WDk3VllqbzF6UkVFbnU0UEdIQ09pSGFxUjNEaExl?=
 =?utf-8?B?YytaNHdOMkQvSVVYL2FBT1ZmT0RJdm9GK0FVZXppRHhXdVJhTkQ5bzhCb3VW?=
 =?utf-8?B?UWdBdEpYOU8yVUgzT2FKR0xTY1JwZUFZcnFsZUMxckl2OVBSVm9SMjUrcm11?=
 =?utf-8?B?ZXZHaGw5R2ZnR2htQlg1TDQra2lsbERiMmFjVXJiZmJkU0kzOFFkNjdEeW8r?=
 =?utf-8?B?bVlzN3JsMi9pQjUxdnpibm1UWFd1K1JROWhZWG1qZEgzalFaWnp3Q0w2ME5Q?=
 =?utf-8?B?SS8vM1FyZHNnUGFrWmwzWFR4OVpPZzY0WWNJTHlSNStONi8wdm9DOEZQelRL?=
 =?utf-8?B?Z1V2ZmxFMzlBbjg0cmNSN08zaHpJeHRxSXRtdW9jRGN0RS84L3lDSXE4QVZa?=
 =?utf-8?B?bGl0QnFpdG9EMVVCeUs3YzNPemtwODlFSGU5L01Ld1pvT3lDTHcvZUFmT0E2?=
 =?utf-8?B?a1kxYm02Mng3cHdCSm9LR2g1YzdqdHhMY1hjT0lSMUVSZGVUV01tV1hBejhB?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b57b2ee2-4323-4bef-8c61-08dc5a233e7a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 12:31:00.0894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4OP/QpbFGty60zNfuxmDrJbjzFJgb8YcTHEcfpZKcHlBIDmPmm3awIQQPCwT1O1UQrZ/NXQ/g0RXWekm0HPxTfQyKRpWm7FWJjPZ4RPAb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5258
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


On 10.04.2024 16:24, Matthew Auld wrote:
> On 22/03/2024 14:29, Karolina Stolarek wrote:
>> +static const struct ttm_bo_validate_test_case ttm_mem_type_cases[] = {
>> +    {
>> +        .description = "System manager",
>> +        .mem_type = TTM_PL_SYSTEM,
>> +    },
>> +    {
>> +        .description = "VRAM manager",
>> +        .mem_type = TTM_PL_SYSTEM,
> 
> This should be PL_VRAM ?

Facepalm
Yes, indeed it should be VRAM, well spotted.

(...)

>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> index c75de24de783..83a942919cc8 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
>> @@ -27,8 +27,43 @@ static int mock_move(struct ttm_buffer_object *bo, 
>> bool evict,
>>                struct ttm_resource *new_mem,
>>                struct ttm_place *hop)
>>   {
>> -    bo->resource = new_mem;
>> -    return 0;
>> +    struct ttm_resource *old_mem = bo->resource;
>> +    int ret;
>> +
>> +    if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM && !bo->ttm)) {
>> +        ttm_bo_move_null(bo, new_mem);
>> +        return 0;
>> +    }
>> +
>> +    /* Dummy multihop */
>> +    if (bo->resource->mem_type == TTM_PL_VRAM &&
>> +        new_mem->mem_type == TTM_PL_MULTIHOP) {
> 
> Do we need this dummy multi-hop type? Is not possible to just do this 
> for SYSTEM -> TT -> VRAM and/or VRAM -> TT -> SYSTEM, that's at least 
> the normal flow which requires the multi-hop sequence in the middle.

Hmm, back in the day it made sense to me to do it this way, but I agree,
using TT domain here would be a better solution. I'll try to rewrite it
and drop multihop type altogether.

Many thanks,
Karolina
