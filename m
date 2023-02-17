Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B125F69B1B0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 18:19:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7861D10E1DC;
	Fri, 17 Feb 2023 17:19:05 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A50910E1D8;
 Fri, 17 Feb 2023 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676654344; x=1708190344;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P4dXt0NwZc9mFGGsGR1OuigjpaPNxic9jcCOQbG774U=;
 b=B0kS9URGIkNNQdaGsM2nLREvY7Cm6yXWV41b59+RT2gRSk0EgBVmBY0I
 u+xbceXTV5MU1GenSVJ0tbgAQG4oNV2zS8LLyDvB242bBq/EhBHnjGawB
 1C5srkvUDiG2P6qByJ9GRy1emtAbdkYsUDhFADwnYvBUwvLP+WbuD04uS
 yipQeSoH98EbNotTwsU1v8QGusWiy8HDM5ZsV8gIq5jqT7VQeENdlvlbg
 I/tdwvpWif5b/K57lclofZ7FQPzY/BnH8WzPpH+AcvV6w+S2LO819XUhb
 ymThIbuktAxvNQFwXTzd14GmjXifG9elPS82ID2OvJSahzIsHNRhijOkL Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="311667694"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="311667694"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 09:19:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="779853028"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="779853028"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2023 09:19:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 09:19:02 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 09:19:02 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 09:19:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O45L3LrkzM+R7gdiiU3RNZn9jN5v8N0T2AkKLcpI3rm3tgObFa+Uj9bCmMqY8rv7Ud1IzW6XMLkFnmYeaf0XyI5zrp5xhoIhCAb6t64JLGdCVgbeW1a+aoXQS+pOtVCCawjgZyhKsV6HreUPWGr1Eku7K70DCwTNEg3SM/9f5KYmfEAWfH1Du8aO108iEyJrJFP3PYFwPg65oDSzYL0TUIbOBBAjAn2BIH0XGuWA/pf+W/E7dTroiOnVT/ixdgug7IFe/n8lOvg8lkoZdSEiVgPq/JmPptvfNIjaSHAM4IZpFD+TuAF6TSIYW2azELML0bzV/0y1WSs6jrjDJwIcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByjPpnOuM4N96J+EyDLJmCP7/ruISiGA6M2lzK4AULo=;
 b=ie80ZCqFchKSIiwON7mc93qaYOfX4lN5G3XyxlS63+IWbyFRjLGUJA98URx6glRLNCFSh+gvcwbMhI/XAaBqsh2KcKMkjRl4ZKkt16YCVvEBlltQ03YTDy0ECk3FmNXhldS9MYsto8JnSnQxtlNFOhSswGKxO/gOUrYCTlYHW6Z8NQuP9OCP596PcMlDnk4XZZGS/gShJBr51WqS4GvEKGu+7IbRGhb24Bjw8l6m/4fs3woywSE8PrW7yZUcFOFOyWMrTTELBMapbXquupvYvazrUl6rrzSy6YaOddD8kQONPm3sgpWnzgY++AU7WRpZknJ89bR5O2AZ8m4qJBEkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB7772.namprd11.prod.outlook.com (2603:10b6:610:120::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Fri, 17 Feb
 2023 17:19:01 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::5399:6c34:d8f5:9fab%6]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 17:19:01 +0000
Message-ID: <a202bf77-a5a4-b7cd-44a6-6ddfb3625e66@intel.com>
Date: Fri, 17 Feb 2023 09:18:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.2
Subject: Re: [PATCH v3 0/2] Don't use stolen memory or BAR mappings for ring
 buffers
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230216011101.1909009-1-John.C.Harrison@Intel.com>
 <03de3c68458fd5c44e9fe1d4bba4687ea49c4788.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <03de3c68458fd5c44e9fe1d4bba4687ea49c4788.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW2PR16CA0034.namprd16.prod.outlook.com (2603:10b6:907::47)
 To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: 64515972-2cba-404a-79b0-08db110b0f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qds4mTNrqBBKSUvYjg4q+r7RpgDKg/61KdzsviHWviBAoKNUbnQ9A7XAw5c1gTIUkbrIYdcxJi+cEjth90vRnFETD9X7HgoQGXrJEXBYkoKapkmEnbKHC3PAsJcbMM/oobCwLWSMS+QPbyKLqAUzlBPW29OMdiBCaofjZ6A6HYDnvncYrx0t6ccnIKp6jlxbBmsfBx87KrtkveiOg/OPRuW/duQ9HsOQsYY+eambWe2kH7X6sqNpvv+dL24Cw5ClutCT3J/JXdUeOOrm9qpH+xvdkUAi86HZ5QBGjdF304f3hQLegGjIOGTPwqxGOFAju1Ca/r+vOi8/iGWV6nVXcKiKIw19vqt4G4tQI1hor04NyG/UaZrHigEwRzHcNH+ySjOBV4UxT5tDi4k+D9M/a/O55ZQtm3L7jqeUOoa3KwrUAhBUClubl0bZ9EF8C4yQK0G4kBt8xD7SpC1orVP2exhIzkUzXRvlK6X+8BFmqoyRyKh30vmGlX3mz+HJ9UZ4wvFeF5xzgvqKyvTO5KI3SLbnTmnmjS50+z70HRk0ksAvCDOwQ47gJ2OrXr5fOxiin+zZjwMzG08pb+44vvE0Q9lhTxQAzFuyW9YK5w8a94vj8fuT67Yq+7T3p45bSZrgHOqYGBzyBYaOk8ovGGibPvHKQsmpj4LIXjKPREx/oVFzF+rw7qvWlwzugtu812bYMUdrLXUaKtNx7rV5BpnqUVwmflIeMaObKRFfoZsfXhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(366004)(396003)(376002)(39860400002)(451199018)(6506007)(186003)(26005)(53546011)(6512007)(2616005)(66556008)(450100002)(66946007)(4326008)(41300700001)(66476007)(82960400001)(86362001)(8676002)(31696002)(6486002)(8936002)(5660300002)(38100700002)(66574015)(478600001)(2906002)(316002)(36756003)(110136005)(31686004)(83380400001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnZjbGtYeXcrSHowZDVEbnNBT0pMU1doVzhRc0xWSUJWUHlvUlVaRTFkWVFH?=
 =?utf-8?B?dlI5RXB5R2hsVkxPekFVWWs2STFUUktuckY0MFZUbzRMbEhacXZ0S2Y0aUNS?=
 =?utf-8?B?dmlhaHk5dmMydkZzYnI1aXErOXNHZ0FidXhyOEJQaU9vSGdUd2JnYVpPY0RH?=
 =?utf-8?B?M1p1ZlZjUllpdUsrU3B5bkJoZDVmQ1FnUEgxYjhLNFVNby9TeCswOXBjN0tE?=
 =?utf-8?B?UEROMkc1YTdPSSt1eGxxcWk0Zkh4bzJRY2xzYXZQYlZtclNIeWlzVGJQNTh0?=
 =?utf-8?B?MXMzdGdORjlabTBUa1FHWGdsa3BicSt2VUtUMEpnZWl1RzAyOVYwZG15aFZj?=
 =?utf-8?B?b2E1ZGl0dnBWK1dnNFpQUGJYUGdoc1hZNlNDWVp2ajk0VDY5VU4yd3hJUlpS?=
 =?utf-8?B?SlhSRjN6SzduM2JjZEhlWm5qN29PVWpkN0VXTnBSSll0R0ZQTE0zUXhqblFn?=
 =?utf-8?B?QzUrdlliNW9pLzlZUk50bU1Idks2bitCRzFJTkE1SUNnakZYbXpXQ1lTb1Bp?=
 =?utf-8?B?ZUdYYlNXT1hjOCtQMXBlbUdpS0hYV0VGR3VQU3lCVjRtNkZRMXRiZVZvNHBB?=
 =?utf-8?B?US80MVh4dXFZREo1WGRIMFpudGlCcnllWWxQNitIMy95M0daMURRaFBtUXFH?=
 =?utf-8?B?MXR1Um1tUURXa3VXem9KRlhnTno3WDUyTm1HOHhyMGVnQ3dlQmUxRzRwMmJR?=
 =?utf-8?B?VjhCaXl5eEdHa3BTWUU3VkxwMGVQVTJCd1FwVU1oL3U5cTBvQjZ3dnpUWTZG?=
 =?utf-8?B?eFpTS0Vrb2xUNmx1V2FWN3JtQUZ6SGFmdG1OSSsxd1A2amtYb0Mxem5YVnNh?=
 =?utf-8?B?MmVuN3diZHcyeW1vNGh5dzRSZHNUQTlrbS9jaU51dUdCMXlqRHRpUXBvSnlz?=
 =?utf-8?B?VHExbFVZUDM2NEhBUXdGZ0tHNVlSNlA2eVoveERjRGF4V2NQbGJkMDJ4MVBB?=
 =?utf-8?B?Mlo3MGxjbEhjS21weFpjeUNzTkJUcW0wQk1nZ3V6dHR4RlBBZldZUzRTcmYr?=
 =?utf-8?B?Mm9VZFhneG44TGwwSlUzbWtOSzR5ZkxFclZjUFQydG44bTYxeTdTMmFvSDVa?=
 =?utf-8?B?NWpoVXoxMHJKWjU4QzI5b3FSK2hKLy91NWcwVlllQldOS251dGxsNC9tRzFC?=
 =?utf-8?B?SGRTZHBJU1hKQkkrYzczdFBPMHBaU1JXNWhFaXRtcDZBTjdvNFo5VndITFJM?=
 =?utf-8?B?WEw4aEp0Vll0cDhONFNHVmQyK0MxZTBCMllhdTlWcmNUMHRZZiswQjJSbHNj?=
 =?utf-8?B?V1RvVUJPbTJtQWZ2dDVGbTlLeVpBY3JxMUhQSkFWOXRUMmJNTmtuOHAwaTJB?=
 =?utf-8?B?SzIvUHFFbmxES3lpSkRVK0pFR1JmOFg4MkFLUDlmYXJIMTlpUitFZk96QUdS?=
 =?utf-8?B?ZGhPS2tPUFkyWWRxblNLbDhhQ0JXZVBXZXlKNldVTTNQV0thbTN6cWc1N3lw?=
 =?utf-8?B?NlovZzA3SlBFbXFSU3JLeGc2a0VWQWRQVTRTMFZ6WHVJQXAxdDhxVVhrUzhh?=
 =?utf-8?B?VEltZ0pVbFdvR1IyeHF4eHAwZ3NIWG9NR00xRkNlWU5ZTUlEWGpncTBTdTB3?=
 =?utf-8?B?TUpiVjd2ZFVvOER0S1dGM2hla1dIUVBUd1h4RWRrQS9OQ0lubUtQUXVLMmxh?=
 =?utf-8?B?d3BVOTVVK29TVGp1NUMyUXlmb0VYUnZYMmlaMXpmWVhQYzFmQVZlK2VzaGIv?=
 =?utf-8?B?L0gwQzhIbHRLU0lmZXZGSEU0Wkdmay9WbHFQdnhSUEpJaVRMMDMwYVdtRmQy?=
 =?utf-8?B?NHh6Ni81cWtMOWpMeHRVU1NHdmswUW1JT2liVEorb3FkeEV5WDF5TlNXUUNO?=
 =?utf-8?B?S0NDSHo2RzJDcDNUZ01jYW9aQXR3MWZwbjhLSTRZT0hpOHQ1Um5RaC9GOWF3?=
 =?utf-8?B?NEQvcW9WZHdGaWgzQTlUMVNpTTVWRHYzMEFWYjMvVmxROE5iT0g4SXdZVTNz?=
 =?utf-8?B?Z2ZJcitkc25MdS9SNkRXMlN5eUlaOTduOXVPdDhhQjdNT1dzTU5JY2pCVU80?=
 =?utf-8?B?dTF2WDRKUFlsZkxwZVlPQmhFektJY1E1TzhJMUVkSS9Yd1NWdEpXSGF2SkNv?=
 =?utf-8?B?L20vR0ZueDUvWVBjSlB4eXRsTWdzSUI0eHJYV1hUdmtNTTlPSHRob0ViUWlQ?=
 =?utf-8?B?T2NJTUxuM2NlTUE3SnpBQUpVc0Q2clUrWkhzaDJBTG44WWJ6YTdGamo0Tjkz?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64515972-2cba-404a-79b0-08db110b0f9f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 17:19:00.9510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n9KOHzUPrrp5w2yivEO9uK8VJfkR/hJl/L6piJRzJ+DtQlT8Q+2xgKnFiKAroAMbcDRqiXLDkehJZcsRN3Bmg1Y7UkUxYsVh8q2Xk274CAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7772
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
Cc: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/17/2023 00:39, Hogander, Jouni wrote:
> On Wed, 2023-02-15 at 17:10 -0800, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Instruction from hardware arch is that stolen memory and BAR mappings
>> are unsafe for use as ring buffers. There can be issues with cache
>> aliasing due to the CPU access going to memory via the BAR. So, don't
>> do it.
> Tested these patches for GPU Hang I was debugging. Seem to fix that one
> as well:
>
> Tested-by: Jouni Högander <jouni.hogander@intel.com>
Sweet! Out of interest, which platform was that? And how reproducible 
was it? It would be interesting to know if an IGT was actually regularly 
showing the issue and we had just been ignoring it!

John.

>
>> v2: Dont use BAR mappings either.
>> Make conditional on LLC so as not to change platforms that don't need
>> to change (Daniele).
>> Add 'Fixes' tags (Tvrtko).
>> v3: Fix dumb typo.
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>>
>> John Harrison (2):
>>    drm/i915: Don't use stolen memory for ring buffers with LLC
>>    drm/i915: Don't use BAR mappings for ring buffers with LLC
>>
>>   drivers/gpu/drm/i915/gt/intel_ring.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>

