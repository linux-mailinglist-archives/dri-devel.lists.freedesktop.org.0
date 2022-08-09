Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419FE58D751
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 12:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702C5917F3;
	Tue,  9 Aug 2022 10:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A2E10E470
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 10:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkeS6K4ABw5bVvJOjQdY/e6NZ8Zz29j/WePWsQcoHeyejwwd7eJE97YUl1slbJ/DNLIwn+yjcdjzNE8AmqzDHj/e+Cavf7xbAdVahO7jNxIJbM09SFtD1Vl6Jhbd0v0wXzMLlxkkhvideKiA9Of8RSg2mpal+4OhluixmHD8bD9B4tnDjSkRnUYC4OoWzuJm78nsR+D+vChlBc5BU3AM9kx9ChVGtcnkZfpv6Sg4t1Ttfey93wfcfCgm0qupQ2LljNQlYEmRF+zqizeQWUPszrztFlLsRNVYmjWEK6yi70Ltju20zaUu4E6RwArOTgbOVyStNX+rFVou7hymjA5qbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxLXMPQWE8kLSqjf5iOYUP4V9auCo1i61LXar95+Jkc=;
 b=Kbb4B7En3cEgVoJ0iJTBgAkPX7z8fqtj/XMYTEskwol0bOYnlYGzg34SRjNzNQQ2NhNpkDnldQGkcohUQercDJC8N2eI3yufJzWZrfOHqI7MpBwfzcCD+CtM5bnd4wrr0ZE2dj1fNxe3VkXnhoTJLUVHkORSGKxQSsmnAvbB5MIw1U/g8MAasgjfCnxwzL3w63wMlJfoWiC5wW8R9oCvcrqWIUhe4S+vqee1PYCuTXfXq+66lHKjUt8KU/OvmyMWhZplA7GjbxoD0ixjcbR0cPwhuSHGONwdW5WIcyQ1cfnNedq9IjD1vzQCLHUIPEY3IZ/0GFBHlAenkztCnjcCrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxLXMPQWE8kLSqjf5iOYUP4V9auCo1i61LXar95+Jkc=;
 b=vjlLZeU0R5QVHL4y3q+56ADeuorDFZyXG0Ac2lK8wtTCk3RxBpUCtNUCVsG5FfAe4loSwCFJ7afy51gwu8fkFK8G6vYyXcrk6of5oyio8XX9Ig4+/PHc9bIb9SI6wdHL4F4r3fuQL54uqLMTemWu1SjMLoNCfP5dLVZchqSHK2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW2PR12MB2475.namprd12.prod.outlook.com (2603:10b6:907:3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Tue, 9 Aug
 2022 10:18:47 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 10:18:46 +0000
Message-ID: <cb478ae3-a6c6-ea90-a47c-13d52b606942@amd.com>
Date: Tue, 9 Aug 2022 12:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] Re: [PATCH v2] drm/gem: Fix GEM handle release
 errors
Content-Language: en-US
To: Chen Jeffy <jeffy.chen@rock-chips.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20220803083237.3701-1-jeffy.chen@rock-chips.com>
 <c7cb225b-7f21-8d9a-773b-efc655e6332c@amd.com>
 <7cd16264-fa84-7b50-f3ed-64f7f22dcef2@rock-chips.com>
 <64bf4e4b-4e22-0ff0-5f92-76f603c04ec0@amd.com>
 <cd806954-e94e-aec8-2b0c-4047da9a92ec@rock-chips.com>
 <0e284f57-e03c-f128-f6e7-52a58edbcd54@amd.com>
 <71e47fe6-440b-e9ea-cd66-8362c41428ca@amd.com>
 <6b3e82f9-6902-fd5c-c67d-e2c42c995133@rock-chips.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <6b3e82f9-6902-fd5c-c67d-e2c42c995133@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6efba7e0-9cce-45eb-aa93-08da79f08b6a
X-MS-TrafficTypeDiagnostic: MW2PR12MB2475:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVhQVal8D/Bw74uQ21Codp21j8U6aZoep7lvQ9nSsj49c47dBo0fYbAxQZrp8XVljry23mxt0iS4dENmyAT8/j7/Z2VVg/i0uZzo8Dz5n4vICRZ2QiCbcwcjTZyHAapEEqYC0gpljnSRSF8goOaTj2lJ951dJ3YqOICwUJ1jyB1YLkk7Jn3/60IyQgO6tOucqeyVnbufA8P3pwQdIdFuyvA6MISHedUOJIZBqcxtkPSPd1Txnv8dpnEUeFAXrJw/hWUprLDGdI1lUMF6/ysmVFpgA+IB6DRuRSXr8avXXEpQydA1tGyy6EP5mMP1ole8grOqPuxWTpeYT99XLXhtJcIkxEeT9Aw/MtJeQGyKfFvOXglBiaVVgp6uDHZpSOmhXrJAJxmAjvOhSpMKFVYYVi8wLY3cn5wOvcIXLHL+6JOt94HFI5L3/frByj+tE4eJBeg2uKxPQEsV09aEe42ryv+8tjEDSuAEP4Asxg8bXRmBoVfKoNYwWbkwsqSdMiTKxkXnrkeYiPZ1Z6/h06DE5KowX5lNCnuOoG/pCPukV0MnCJNC1VC4PCZk5QEvGPrm3GtmUDEPDr8dD2ywJJLdaVnqZ6dkUzmC7g7MjWnaBAFuXEaKo4/cysmMwnOoerFATibdmqa3IWTXtIZTNLxqe6FGNXxab2hR5aEDScwOXnJ6UCuuXcptibk5GPiJOcnrvRaxc3nWQkoXKWJvq/hQjHBO2uC43aENgwGaNt+7Q2H/pAN31mtdkLSUCMEWqmq3KeJuo9IAiKdivKzqwi1RpOJx82r7rSUf/3dsZsAX+7mZd9S6HRd7Sh+4rkp+SgbAc33pSkok5sPk898waqRxIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(316002)(66556008)(66476007)(8676002)(5660300002)(4326008)(66946007)(110136005)(86362001)(31696002)(36756003)(8936002)(7416002)(54906003)(2906002)(83380400001)(186003)(31686004)(38100700002)(6666004)(6506007)(6512007)(478600001)(41300700001)(26005)(6486002)(2616005)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZWVG5VaTlXVi9IYXlGZllLR2VhdnVXelN1WlNxREdEMFBzalBIdDk3ckdS?=
 =?utf-8?B?eDY2TlhrMmJMeHlXMjY3OStjQi8vUm9TSCtKazdUZmd2Q1dRVHhhU2paRnIv?=
 =?utf-8?B?UmRqa2FuQmRsazVKWHJXZGlkdWljelJSWFJ1T3hkdVpvZFNMaW0xSGh6RlNC?=
 =?utf-8?B?QUg1a01rbXpwVG8zOWJOTHAwZDNsenByeUVtM2MyemZlZE12dFJkQW5oTFps?=
 =?utf-8?B?WVlMYmxrTFEzR1o4WVdmQkFENXpVRlE2K1ZESmN6YlBEVjQra3ZVSldaSXJ1?=
 =?utf-8?B?VWk4UzV5eTRZRjlaMTFlRk9uUm81VUpxdW1abFFRaDlSSEwvS3pRQ0ZkY0VF?=
 =?utf-8?B?d3pkdHNacFNLRG1CNUY4cDV3VUlSZVNjNmNNSSt5MytIM0RyWkpQcSt1MzAv?=
 =?utf-8?B?cEhxeDRaT0prQjhnZTFzak9zUFFkQXNiSGdyRTNLU3NiVk9lLzNjZ1VTK0I4?=
 =?utf-8?B?b256OEZNK3RRc0Q1WVd1TXZlT3VDTmtNRDhiVjNWeU81cmJTMWp3dU5id3VK?=
 =?utf-8?B?L2RRb0d5eENoRE9lS0F1S3JDNzNXbmoyaVcrcFlHTzNmYVVBUmJGS2tmQ0xM?=
 =?utf-8?B?cVI3WmRrKzBQa3EvTWxEdG5ySHJ5aU1Ed1JUTWhXVjM1UkxIdWNBYi8yZUNk?=
 =?utf-8?B?eUg4TTRHcjBLaEpHUjN4VUtTNXcrMDQzaTVtRXhGQ2xUdnhQR2pkR1dVWjg3?=
 =?utf-8?B?WU1MaHFITFNKY2V3bmYwZlBDdUpQUFNydjV3VzhYWGtmT0NQM09aZG5ueFFS?=
 =?utf-8?B?aVNBM05VNVBrekZVdjFpdDc2eWErNDhlZ0U4TGs1NGNadVVOeVRvSnlJOS8v?=
 =?utf-8?B?TnVwRWxNZDVZYXdYMFBHQTVFcExBMVlWdlExekRINVFUMjVlSnQwVFE3OGs4?=
 =?utf-8?B?aU03Wk1hNUtwRGhBTis3WHNWMVdsZ3V4bUlacys1M3NSNlZzMFBnSWFGVHpV?=
 =?utf-8?B?MkJZdnpLMGorQXFpaE1OTDFxNVA5SVZlMGRGT212QzMxYTZ0UytoM3ZjZ3Mv?=
 =?utf-8?B?dGtreFZyTi8vMzNzNmVsZHZZMWlDMmo0RkxCZzJjdHlodGZzMHAvVktMV2dp?=
 =?utf-8?B?TFNVWVZkVklOM1JTdGIzZUZpc2xFNXhhVXd2WkpSYTE3UmpHaWtpVFRHQ3lX?=
 =?utf-8?B?RlZKb1lZU2IrZHNTd1p1WHRYbnFSU1QyaTFDV3dSeHN4NllWNWlyOGs1UWZm?=
 =?utf-8?B?aGZzYWFNQXh1NFJmWnFDa3JwMlpVM0s2K3FTZHVPTVkwY2IxUTUxSlBjYVhB?=
 =?utf-8?B?d1R4SEs4OTkxQXFHYXJGWGsxYWxHRnh2NXFNZWJxck9CU2swU2JKVXRQYWFH?=
 =?utf-8?B?UXU1MUZyL0dFakFkSUZieE5wU090ajlEODcrYytCc2s4eHdVMktCZnJJcUd3?=
 =?utf-8?B?VVl5czd6VitJTS9aQk5DVjBlekZEYy90NU8wcnAwdTVkZ3N5aUx2SitvTXU2?=
 =?utf-8?B?djluSnJ3T3hRRXNFNHlFQkZPckcrR0pyc1ZPUU1nRHozcHpaUEVhNVFOTTdt?=
 =?utf-8?B?SHErTjN6TnB1aCswNi9KM1Z5V2ZKVko5MmUzTWZXVkdSSFRwMyswaWx5U3ZC?=
 =?utf-8?B?Ni8yYlFTVjhJMHdNenMzSjYxU1J1eUFkRGJvQmVUU3RuM29CdzdDWk1tOUoz?=
 =?utf-8?B?UkVXOU5FV1hwS2tCRWEzYlJrMzB4d1FHaTdERyt0M3hJY0hVTGtXYmM5aVB5?=
 =?utf-8?B?dTdiTlJ1cHB3ME52S0kxSDloN1hPWlJ4Vlp4TWs4UU4rbWRsbVptMVF1R2dF?=
 =?utf-8?B?bUh4QnJtSGlIWS9Lc0ZHZU9VK0JlMDRySEsvSTJiWVNXMWRuMWFNL0RlYW9Z?=
 =?utf-8?B?cW9XcjJUc0dOeFp5eU5JT2ZrcHllNGhNYSt1d2ZldWFHRzRJdVZnMW1PRU9L?=
 =?utf-8?B?MnYxb2pNZzU5N2ZtRUNKM3ZtaVdnY2RtYkxjaFFxSm1MOWhlZnZFMFdXdjVI?=
 =?utf-8?B?MUoxRldLTWVhNjBnY3o4MjVuc1d5WS9PK1hWYzljRm0vSDVPSllYei9RZmpY?=
 =?utf-8?B?YjBHdUEvOGQwUko0RUFLbnczbGxzV1hHZkZXMWZ3WEJ4VGs2Y1MvSnFOZUJv?=
 =?utf-8?B?U3hvVTZzTU00dk10SFdkeW1xTjZyeW1hVmQxTG5FZVloQU5ZdzFiSklJZ2JL?=
 =?utf-8?Q?BFzuXa9sTgoFUZdy/2H0odq6s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efba7e0-9cce-45eb-aa93-08da79f08b6a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:18:46.6200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jScm+R6AAWQivzrH959nysrEjQK682yl6SI1z/di0UBnrMSt550RO0kTMtciswg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2475
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jianqun Xu <jay.xu@rock-chips.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jeffy,

Am 09.08.22 um 12:02 schrieb Chen Jeffy:
> Hi Christian,
>
> On 8/9 星期二 17:08, Christian König wrote:
>> Hi Jeffy,
>>
>> Am 09.08.22 um 09:55 schrieb Christian König:
>>> [SNIP]
>>>>>
>>>>>>
>>>>>>
>>>>>> So we are allowing GEM object to have multiple handles, and GEM 
>>>>>> object could have at most one dma-buf, doesn't that means that 
>>>>>> dma-buf could map to multiple handles?
>>>>>
>>>>> No, at least not for the same GEM file private. That's the reason 
>>>>> why the rb is indexed by the dma_buf object and not the handle.
>>>>>
>>>>> In other words the rb is so that you have exactly one handle for 
>>>>> each dma_buf in each file private.
>>>>
>>>> I don't think so, because if user get multiple handles for the same 
>>>> GEM obj and use drm_gem_prime_handle_to_fd() for those handles
>>>
>>> Mhm, that works? This is illegal and should have been prevented 
>>> somehow.
>>
>> At least I see the problem now. I'm just not sure how to fix it.
>>
>> Your v2 patch indeed prevents leakage of the drm_prime_member for the 
>> additional handles, but those shouldn't have been added in the first 
>> place.
>>
>> The issue is that with this we make it unpredictable which handle is 
>> returned. E.g. if we have handle 2,5,7 it can be that because of 
>> re-balancing the tree sometimes 2 and sometimes 5 is returned.
>
> Maybe cache the latest returned handle in the obj(after 
> drm_gem_prime_fd_to_handle), and clear it when that handle been 
> deleted in drm_gem_handle_delete()?

That won't work. The handle is per fpriv, but the same object is used by 
multiple fpriv instances.

What we could maybe do is to prevent adding multiple lockup structures 
when there is already one, but that's not something I can easily judge.

Daniel seems to be either very busy or on vacation otherwise he would 
have chimed in by now.

Anyway, your patch seems to at least fix the of hand memory leak, so 
feel free to add my rb to the v2 and push it to drm-misc-fixes for now.

Thanks,
Christian.

>
>
> Something like:
> drm_gem_prime_fd_to_handle
>   handle = drm_prime_lookup_buf_handle(buf)
>   obj = obj_from_handle(handle)
>   if !obj->primary_handle
>     obj->primary_handle = handle
>   return obj->primary_handle
>
> Or maybe limit GEM obj with a single lifetime handle?
>
>>
>> That's not really a good idea and breaks a couple of assumptions as 
>> far as I know.
>>
>> Ideas?
>>
>> Thanks,
>> Christian.
>>
>

