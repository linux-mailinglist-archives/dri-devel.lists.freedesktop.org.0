Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5822A57E712
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 21:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A56992A80;
	Fri, 22 Jul 2022 19:09:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B6A92A5C;
 Fri, 22 Jul 2022 19:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658516983; x=1690052983;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JhMdwXyAkRJo5VQmF76KNnNmjM/H8SazTGIviVGpACs=;
 b=VkNjitfdpRyBAFytKAiUG2l/+ZRzf5HNBY3UmfguJdKCPup4gbBSj+V9
 6S9yuIYLC0ZGU45Q0WybwWTJDr9+NFsIvStoqPL6Nse2ahpahplKvrK8/
 XPrIE7LwtJTdgzL9NNqHtjYc2FD1sehbn4SgjRxmW8VYt3HvTabvtZQQD
 ZjSpll0dTZbzHhj3JPMUSMV6vNFDuZJR5kqmfKk2tfXCY4ONBoI90xcmm
 xSpok/fGtqvenOM+FcIR0kv3gfo2yrn83Zo+hZJ6n3Qg4O3mm9SpBpSPn
 MhKbA9n/tIsXs7ERnf6IlbxY7GHeoDWxun4oH3sskxzbhJG8wmlDSxVPz Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10416"; a="349087988"
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; d="scan'208";a="349087988"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 12:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,186,1654585200"; d="scan'208";a="741157142"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 22 Jul 2022 12:09:42 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 22 Jul 2022 12:09:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 22 Jul 2022 12:09:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 22 Jul 2022 12:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYo9CXJZuWQWjwGPF4rZ7hrk4sa1NBk/7+GBoAmCEaNbTNQBEz0ucw/Hq/uc5+1y+/hTaa76hRJn4J5Bxjld51CPp7fDqz7+P6d+1W34t1B5IYWVrdQODwZC6Ny3oGEJR2Khrk8pbc6UaVrMj5txWcK8gMkgYWmV3BChYVEdr8g3GIrXAiRA1W1VTnTQCP4YRILjjYifIZt9x2Eu1HyU+wRuHeUAB/dH1nEBSuHeMR4ZhkSmzNu2ZWngDma78h304242M5zJvAh7Je+bxk38Mod7nkKuR461bHksoPNRS5jZnuTiWBfdHTKyz/7vIOXi9Ib7ujwmZqJ8QjKBLWpNIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRduP+3Uf3PR+uZswpVOYma1Pbk4cmKVzgKj81Wj5EQ=;
 b=BRJTdRzxOuxdK0VXMeE53I/CV0YRC7iFdZatIFSdNCjccfjENev0VpU2P4STy/Yeo6Pl2BuJcG2xJOK1jtXJ+joBsHtUzHD/1UHEJhvahc66t/FM1xrKa3sjMI8XcDr3XKYrM9zPi0h8RHR1/Uc91sY0l8CdqrbwKJu9GlwEphGyi9QkHl0OpAX4oZw+yhNfyQg5Ewkd71VPY9rrPTCDA0TQC77Dw9zU6Z72HKu6OUluNSkb5w+VsPriBtl60wzM2KDqWE0JQ6kKWAzosui3F4+TxzA12GTNDuHqLLHl8cwMYp3p/fCrZ127qmaK49GZ/oCBqqqyUR8kjlw/E7/w5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN6PR11MB4099.namprd11.prod.outlook.com (2603:10b6:405:82::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 19:09:40 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::516d:4bc0:8e7b:9a12%6]) with mapi id 15.20.5438.023; Fri, 22 Jul 2022
 19:09:40 +0000
Message-ID: <1934cccf-a596-d6dc-4417-63109b92303f@intel.com>
Date: Fri, 22 Jul 2022 12:09:38 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH 01/12] drm/i915: Remove bogus GEM_BUG_ON in
 unpark
Content-Language: en-GB
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>, Matthew Brost <matthew.brost@intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
 <20220712233136.1044951-2-John.C.Harrison@Intel.com>
 <d1cfac14-4c01-ce53-586f-01f8998bbab4@linux.intel.com>
 <c86064c9-cbcc-cdc5-0654-0493c8d3d444@intel.com>
 <0337c3d4-811e-1f5a-fe26-f0e8068497b8@linux.intel.com>
 <ce12b1df-8845-64d6-4fcd-e2e650c3bf34@intel.com>
 <e566ff59-68ce-c712-1619-da64c917c70a@linux.intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <e566ff59-68ce-c712-1619-da64c917c70a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0044.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::21) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50f40c4a-6386-4a52-4a43-08da6c15ba1a
X-MS-TrafficTypeDiagnostic: BN6PR11MB4099:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rSM46MhqGXpd0rkmUPoT5oZGs2fBAZ2KPnrlvhGo3SCY+lwQ+H1JaEexQ/2g0OsBFTUhhu2seVvXVf9Rl8XJDkivAAmz2pMVmUha4Vs2PMPbWCgfd+Um20YjtYbnYQ/BPbSNYEp5lU7gCva5RooISqe1I/pZxw0EgK0D9Pw84zOTNH2aSyvcZEmML626y/C1Z8oI1mJBWB7J1qD+xpvpJgghQ6UqLRE+xOspNm8th+26O9HE4AJ/Kaccopb0Rzal4Q1j87zzS5CJ4kyZgCAFOoTyQxLkYQ5wi64zMiYz4xQIOxU+zYy54PnuFEnI7OEgZ3/x/Q68L9mQDNfbBM2ficgiwq47tf/2jmgZrmdP+WWen4V1y9vCYFSKXrGpNexKcPzlmIqQcHD3e/wGEb4XysKewDluOJ1m4kl3JoaYPtRjDF9tftuB7qnwZlf5C+uVXtjVW8L15PqbwVR6uuzECPLIZ0AbJafwj6+BZIuaojujpyoZ95H+pvHdIz000yrj1t5FTnicGJg7EY8gyTcjZfdImM+m2fFeZRjTgbYm8mo3wbhMzyKHbmoFWz1npA6ZFAjXutlVFImLCZdETxyJirxQf/ACb/tvWB7wk5gcRmwH4yFySUq8HfMTyYcddaenj6XFffkxeNqhbMm7Sa+SOKei6QnYZjbdudiGUETikcCheMkCsSFLUHFla2rEhaZmdcp4ZCcqQQ8PZtG9dXzCD4ebgJ39Q1mMYOB7ygKF5XklwoiPnDe/hGx5mHo2t1t4aVu/Wi+Ktw27pWS/o2IJak/TOfil55+UvCsKZKUmqpz53ggGpvGnY1pTJoXDqrUpVeIGpFO66B4WdZX+2MFcPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(396003)(376002)(346002)(136003)(478600001)(38100700002)(83380400001)(86362001)(8676002)(66476007)(82960400001)(66556008)(31696002)(4326008)(316002)(6636002)(8936002)(66946007)(6512007)(5660300002)(6506007)(53546011)(26005)(2906002)(31686004)(186003)(2616005)(110136005)(41300700001)(6486002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmg2RklNZ1krR0E4eWpWZWFla1hhSmpta2FPQVAybk1Rem9xT0cwYjNTa1lh?=
 =?utf-8?B?OFRCNVd4ZDlUNzVtN09iUFlBUzk1R2taWHluOHM4V0tHL1Y5bXY2N09KL2Vz?=
 =?utf-8?B?ZHhUdEpJaGUvQmc1T09XUHZ6ZXFYYWRKL1l3SGhwWEx2aXdjZmtMVnNXZDRX?=
 =?utf-8?B?UWRhWU4yNEFLcUlPZW9VK1M0Zi9OZEVod09lMVhCY20xMmdyVlhaQmhhNHVS?=
 =?utf-8?B?VkhqcFlLNzFubUFqNWlUZTlzZHpNQjJ5R0t0bFo4bzB5Ym5hWG5BUVZEeEZR?=
 =?utf-8?B?V0orY2IxRTd6TFpqUTRCQXViQkN2M0tjcUdEcnhFamwrNlZMM2EraUlySDlO?=
 =?utf-8?B?dlhYZ0ptK3A0TWZ4OEdPYmlFOGVLcTA1c1UzZjhybGUwaUdwUTR2RUUraStY?=
 =?utf-8?B?ZWxEcFlGb2xTV2FGRTFYN2ZXZG5XTUROZUswa0lWQXZqT3pJZDdWalhHb0tL?=
 =?utf-8?B?MW0vS1UrNUZZdzhjSXB1MW9zN3I3dk4xanJjVE1DRzMxYlQzZFJFVm1QdWVZ?=
 =?utf-8?B?Rmg1bUNsMFc1eHczNHRoeXhaZGZXZGRkNjRLUjdCRVMxOEw5MWR4M2NBb3Jo?=
 =?utf-8?B?alB0OGRLcWRmR3JNcWFYSzRUWTdvM0ZVQ2tyVEdHVUttdVZDdDZIQ1BUSno5?=
 =?utf-8?B?N3Exd1MyY3pTUjA5UnA0RVQ2YlJxNE11T2lVWjQ0ekM4ektEME5xM05uRW51?=
 =?utf-8?B?MDN0bndFWFc1OVc0aks4TEFYaDdFUVpPSi8yWFIwU0dFOW9kK2VCRU42b0hS?=
 =?utf-8?B?empuZHJ4VG91a0dONzRxZUJUNDN1OURJSzgyQ2JvdVNBZm54ZC92MGF6Vyta?=
 =?utf-8?B?T3ZCdzI5bitsOWhXWlR5Z1ozVnZGaDB1WHl3QWhKVWx6WmhtVUV1bExuQ3Fj?=
 =?utf-8?B?Mi9tUzVoOGYrdVBNK3lLWW03NFA0RmVrL0puUHNmTHRGZitqZkg0WDRVZktF?=
 =?utf-8?B?QU5WTTh5WG94cXVlUk9UTHpQTm5TMlhsMmVzSkh4c0lLdjduWm12UVRvVXBy?=
 =?utf-8?B?TEF1elBmMEY3anZ6ekNrQU1WSnVXRTZSa1NMc2hrZmFpZjFSZEhoWjRzazFU?=
 =?utf-8?B?WWFuRFhPSEZCZC9GU2FlNVhidWVsZy9qVWxZNnM3b05ScUk2dlBlUjA5S0dF?=
 =?utf-8?B?RnpwRm5wc3RyVGNRbHBnbjlJQWNJbzNNdU5rZFFCYlA0a3JJSGliYWF1QWNm?=
 =?utf-8?B?N3FubVh2ZW5uNWI3ZG9FMC9wMnppWER4ZlM1RWtlcEE2S1RDMG50ZE04eGJp?=
 =?utf-8?B?SFArWXg1ZG81elZ3TmthOVZ1bzQwUHU1bFAvNUhaOG8xblN4Rlp3bFFVbHBO?=
 =?utf-8?B?aUJLSW5xK1lueml4RGhRY2VkNTlyZU9QTkJuWFAvNmdNcGh1NzdwWUt1RDh5?=
 =?utf-8?B?L012SnZSakxEM2NMYmVsWTlGZ3kxbEpPR0txQzRwTWNZbmVjZzIrOGViUThy?=
 =?utf-8?B?Q2NaTmhxcnAyMHlyMTYrVElxMG1SdDdpT2orZE03M3JuT3ZHNW10YWJHaUg2?=
 =?utf-8?B?Q0JGcVZrRU9Ncml5SjB5YWRXM2l1bmErOTEvOXV0N2ZrVGdrcHlJMjNJSVpU?=
 =?utf-8?B?ZEE2VXY1NTlxSHR4Y0hISzZCelpBZU5OZk90OTdldGhiZzUzZEk3bStnRTYv?=
 =?utf-8?B?SDVnWXZDYUFoNWh4MEpHc09NZW81UXNjMmcrNzRwc2R1Nzg5SUlnby9uMEFY?=
 =?utf-8?B?NU00Q3lMR0orQ1RZTW5sTjVVWnk4MnlhbXNsVytWT2VoMXErYkhMdXQ1S3c3?=
 =?utf-8?B?SXRxZGQ4VXlvWXZ5Y2IxZ0QvcHU5SXVnYlN6NUduQjlkMFlrd040QkJmYUNZ?=
 =?utf-8?B?a3B4NXUzazlkMVB4NWxoaUFIYy9SRUhqWXBzSm5kNTNNU2pwUGhyTXVXMi9t?=
 =?utf-8?B?WWUxOXlRRXdaV1lzUEhsa2dWSU9rdzc3c3lHRTlNLzFjNUVLVll2S2lKZ2Vs?=
 =?utf-8?B?YTNSSndKQmxXMGlkaVBFd2RtMjB3dzlhRXNJQm5sc3Z1aDhyeWxENVplR1RP?=
 =?utf-8?B?TW9oOVhmeGpWdEZKRndhRHQ0djJUVDNHc3FNL252QmJxdVpmaUkzTUF1Qm1j?=
 =?utf-8?B?S01YdHFKamljYW5aa0daTWZrRU5KTFNGTXdNVFVFSGF3UW5xaE1NVE1LQ0la?=
 =?utf-8?B?SnVkYkJQaHA1cVJlYk9xdXNvUGxxYkRRUWRDS2dYbUV2UHpyVXdpZFc5MUM5?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f40c4a-6386-4a52-4a43-08da6c15ba1a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 19:09:39.9682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MQWmZmPJaZsB8B++dCV7mAL+Mktw0WggTxwKA4XcEDbsuWuZmJugnRGUsIUYRS+gs0TRPZuh2gkfQ32Qgoaoxh7Q3qAAaWsvz7oNMp2wmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4099
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

On 7/21/2022 02:24, Tvrtko Ursulin wrote:
> On 21/07/2022 01:54, John Harrison wrote:
>> On 7/19/2022 02:42, Tvrtko Ursulin wrote:
>>> On 19/07/2022 01:05, John Harrison wrote:
>>>> On 7/18/2022 05:15, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 13/07/2022 00:31, John.C.Harrison@Intel.com wrote:
>>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>>
>>>>>> Remove bogus GEM_BUG_ON which compared kernel context timeline 
>>>>>> seqno to
>>>>>> seqno in memory on engine PM unpark. If a GT reset occurred these 
>>>>>> values
>>>>>> might not match as a kernel context could be skipped. This bug was
>>>>>> hidden by always switching to a kernel context on park (execlists
>>>>>> requirement).
>>>>>
>>>>> Reset of the kernel context? Under which circumstances does that 
>>>>> happen?
>>>> As per description, the issue is with full GT reset.
>>>>
>>>>>
>>>>> It is unclear if the claim is this to be a general problem or the 
>>>>> assert is only invalid with the GuC. Lack of a CI reported issue 
>>>>> suggests it is not a generic problem?
>>>> Currently it is not an issue because we always switch to the kernel 
>>>> context because that's how execlists works and the entire driver is 
>>>> fundamentally based on execlist operation. When we stop using the 
>>>> kernel context as a (non-functional) barrier when using GuC 
>>>> submission, then you would see an issue without this fix.
>
> Let me pick this point to try again - I am simply asking for a clear 
> description of steps which lead to the problem, instead of, what I 
> find are, generic and hard to penetrate statements of invalid 
> assumptions etc.
>
> I picked this spot because of this: "When we stop using the kernel 
> context as a (non-functional) barrier when using GuC submission, then 
> you would see an issue without this fix."
>
> I point to 363324292710 ("drm/i915/guc: Don't call 
> switch_to_kernel_context with GuC submission"). Hence it is not when 
> but it already happened. Which in my mind then does not compute - I 
> can't grok the explanation which appears to fall over on the first claim.
>
> Or perhaps the bug on is already firing today on every GuC enabled 
> machine in the CI? In which case there is a Fixes: link to be added?
>
> I have asked about, if we have 363324292710, and if this patch is 
> removing the seqno bug on, why it is not removing something more in 
> __engine_unpark, gated on "is guc"? Like ss there a point to 
> sanitizing the context which wasn't lost, because it wasn't used to 
> park the engine with?
>
> Or if the problem can't be hit with execlists (in case reset claim 
> from the commit message misleading), why shouldn't the bug on be 
> changed to contain the !guc condition instead of being remove?
>
> I am simply asking for a clear explanation of the conditions and steps 
> which lead to the bug on incorrectly firing. It doesn't have to be 
> long text or anything like that, just clear so we can close this and 
> move on.
>
> Regards,
>
> Tvrtko
@Matthew Brost, it's your patch, do you recall the details of when it 
was going bang? I vaguely recall something about it being hit in local 
testing pre-merge rather than by CI post-merge.

John.

>
>>>
>>> Issue is with GuC, GuC and full reset, or with full reset regardless 
>>> of the backend?
>> The issue is with code making invalid assumptions. The assumption is 
>> currently not failing because the execlist backend requires the use 
>> of a barrier context for a bunch of operations. The GuC backend does 
>> not require this. In fact, the barrier context does not function as a 
>> barrier when the scheduler is external to i915. Hence the desire to 
>> remove the use of the barrier context from generic i915 operation and 
>> make it only used when in execlist mode. At that point, the invalid 
>> assumption will no longer work and the BUG will fire.
>>
>>>
>>> If issue is only with GuC patch should have drm/i915/guc prefix as 
>>> minimum. But if it actually only becomes a problem when GuC backend 
>>> stops parking with the kernel context when I think the whole unpark 
>>> code should be refactored in a cleaner way than just removing the 
>>> one assert. Otherwise what is the point of leaving everything else 
>>> in there?
>>>
>>> Or if the issue is backend agnostic, *if* full reset happens to hit 
>>> during parking, then it is different. Wouldn't that be a race with 
>>> parking and reset which probably shouldn't happen to start with.
>>>
>> The issue is neither with GuC nor with resets, GT or otherwise. The 
>> issue is with generic i915 code making assumptions about backend 
>> implementations that are only correct for the execlist implementation.
>>
>> John.
>>
>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>> John.
>>>>
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 2 --
>>>>>>   1 file changed, 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c 
>>>>>> b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>>>> index b0a4a2dbe3ee9..fb3e1599d04ec 100644
>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>>>>>> @@ -68,8 +68,6 @@ static int __engine_unpark(struct intel_wakeref 
>>>>>> *wf)
>>>>>>                ce->timeline->seqno,
>>>>>> READ_ONCE(*ce->timeline->hwsp_seqno),
>>>>>>                ce->ring->emit);
>>>>>> -        GEM_BUG_ON(ce->timeline->seqno !=
>>>>>> - READ_ONCE(*ce->timeline->hwsp_seqno));
>>>>>>       }
>>>>>>         if (engine->unpark)
>>>>
>>

