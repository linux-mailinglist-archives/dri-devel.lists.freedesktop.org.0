Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBAF3BE34B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 08:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02BD6E81E;
	Wed,  7 Jul 2021 06:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2055.outbound.protection.outlook.com [40.107.102.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5586E81E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 06:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCt37hQwiV8BWr7SGU0Egqv1fNS2Ch+OxW6gsT4XmtWKehktgGcB0QszUYozpSe16aYPgfwpnDap4Jfrt8T7OZZZ+AoL3+hdSq/rtZqOwWeOZxWxRo9+Kyhx81k1oQE2/shkQZF6R83Sfdat4p1l9UwhD0BG+1Zw55VvqbFAOZRcnF1zu13P+HJAn0RVx6sWHxmnRIX+Li8sDdYYCdV1DW+mViYHA5v6VsUaGCeJJ5X+TH2piai4uVT+PAuETEoID0aMKekirDLP2/+ODOEWDU33tDhI2VhyBywt4vM5aJStl78X97kb1mMWAiQNR+jFE5A5c2g7mBGKh6gsAbeApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6ZSaWkyCnJ5gDmAiUfdR41onBYL1DWrhbrQzfCp25c=;
 b=KJB+y+O9E8Gt5f9ZPLDoYuns3plqmkU2ByjWCITRCRVocC7/FJhG0w8lKltO60PZdJH8K4WlhGt3nWlYtJo29qOs9tgB0EVgP1Am94EFdLZEKEMlOQwG4IM6t8AAC4ToKelaGLUS14cl/Uoi0U4+xbhMvqtbbIXPulHSjfKSel0UcQPO5cOj47CpRHx2gn876gB3UY+GNlVZuPlsFLy+ZtHP33HTxHhuklXOXimilLAcHXoiDCBQ/HpsGJ1xhgFPE9hmrKnXZzHING1trIuXUnO9syhmwwHnpeGYsBxEpdfyUwEmoLFovWGNiQppG9kXZDrhUekX6ZvVcUxaJKnoUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6ZSaWkyCnJ5gDmAiUfdR41onBYL1DWrhbrQzfCp25c=;
 b=q8V6uL+oZ6QINcJHxIpuAnBWEZbXEeuocoWUwGHbjuNbusDsTCSL691h+yqtllnqhqHoiQoZYLeIkat0jwJ6Jr5D2Ba0DNoBJZnZrLCKBwPKg5bxTl9/YU5n2l9XKfKN9BrCE4RAbbj20zU4sP3CpayfpHN5Drq+Z4JQ5hnBaSc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.24; Wed, 7 Jul
 2021 06:52:17 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 06:52:17 +0000
Subject: Re: [PATCH v9 1/5] drm: Add a sharable drm page-pool implementation
To: John Stultz <john.stultz@linaro.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <ab35ed32-ead4-3dc4-550d-55f288810220@amd.com>
 <CALAqxLXWDKp3BZJdO3nVd9vSVV6B+bWnTy+oP6bzBB6H3Yf4eA@mail.gmail.com>
 <6a472a24-a40f-1160-70dd-5cb9e9ae85f1@amd.com>
 <CALAqxLXrCto31uie37Y4HjaD=2XyqkeR=HH5A6Z+drQtyYBKFg@mail.gmail.com>
 <CAKMK7uH+X8dvrD1=rpmozGvC5R88BOFL--_m9ezbgQjaSjGQ_w@mail.gmail.com>
 <CALAqxLVJw=0sEWxdsZ7j2QvHFDUtym3HSpkgqGdQJVayssMNeA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f54cb539-c364-7d14-2c7c-b2b0477c125e@amd.com>
Date: Wed, 7 Jul 2021 08:52:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CALAqxLVJw=0sEWxdsZ7j2QvHFDUtym3HSpkgqGdQJVayssMNeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0191.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7671:3328:2129:96b5]
 (2a02:908:1252:fb60:7671:3328:2129:96b5) by
 AM0PR02CA0191.eurprd02.prod.outlook.com (2603:10a6:20b:28e::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Wed, 7 Jul 2021 06:52:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ebf15c4-43e9-49f1-7a57-08d94113c282
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2356192D103E33F3885EF12E831A9@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TyMhozeRKopT/MMfffjhkbEnPM5I/91F2vyevzYycN0VoR8vXh4ceNVbo5q+tuKw0WrJP3M1Isw8K/zqGFqr9wZlCl1HiSi2znXRNwgzg6qxJwn+6UtW3ca5UzP/BnZln7qNmpHrczAPwhOk25Ev510/6hbptaZttU2/3CB4RJgd4mPBj3uzID/8KwN+CEN+c6N/P+4iCcDnzTB09qn27lebx9Og1gVS73dSqkKE+Hl7/6wU3hPWhDDWtDm5hd/Kug49jRdY1GX1njruh1b5ZmOnOh9dBABsZHWd5cyf8Omsw09+3VNGA0Iwpo9jPebVMMzr7rCVhcuRr8UEuNJCE1HzZN2q1tqsbgQ8zMLV38NMpoOSVrLYjccvre6QvbPhCGio9yJ/+OX3/E1ua+NKqAoSNc9a6jTWKgtRJhpzhuOnsV0UWE0+7wv4qr8giJX8E0l48GUgs+tBRh7lFbrzfJdXW7xr/TkiW9xZ9E6LvFIgRC8uT0iL44lli1t9oExhHEIxWRJVSkjEPGwPudlbs2p1ylRRdGZW7oNWuKk2+HQhd1B632cO4HLxJ0UYI3aeieET8/D7IhbEREUew5WzVk3PU5Jq/6huYSd5eEmp9xtKieiMVKSVxV6b6gK527iyF/vZRywjq2hqAzXf2B6UyxPVbu2J6f/Z24iNlPDfcyk5CqkVlwpZMjzcZhpSABI/faMpL6cTdBBuM/2VwiD8qkAwbFBjFxgGhg34G7nOzaM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(31696002)(2906002)(31686004)(7416002)(86362001)(66476007)(53546011)(66556008)(66946007)(6666004)(5660300002)(66574015)(54906003)(2616005)(83380400001)(6486002)(38100700002)(110136005)(8936002)(186003)(8676002)(4326008)(36756003)(316002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anVrU09CbjR5U3BRV2VsVDJoSEZZaWd4YTVvOHhhZ0hVcTNPMUEwWHR1NjFT?=
 =?utf-8?B?MC8zZm5kdVVHS3ZBcWpVNkJJdkxCS2NzZlFaN0hEWDhkZGdRK2FQQlZBRUFw?=
 =?utf-8?B?am9BcjZ4OHI0c0ZheGVwekdBT3ZLbFJ0Ymd2R2RPQ3d2K3k2aVRNZXI0THo1?=
 =?utf-8?B?T2w5QnR2UkJnOTJybERmWTFwcDd0dDhMajRtZyswRnVKT29hQnpyQi8rV0Rk?=
 =?utf-8?B?eUpFVnIvOFZVUGtwMlBPNUwzdGx6ZTNmTS92TkFiemJVVGl4ZjZ1QUx3SVZ3?=
 =?utf-8?B?MnB6WXpNK3NKZUV1Nzc3R3RHWmhpM2JMQ1lSekgyR285QUs1SGlsd2NIZDJ4?=
 =?utf-8?B?L0Y4enFxNHI1OGtaVzYyWWpFYVZLVDQ1aWRqVk5KOWxheVAwM0NEdDMwVVMv?=
 =?utf-8?B?UXZoUUd4TlM3Q2J2THhMaDRId0xZUjZwMXZVTjhab29XWkJEeUh3b0xqY0g0?=
 =?utf-8?B?T0FJTmYvV0VUdmd5N0gzUGVNOFBvYWlUM2tpMElYM3hZdllrNWhtWUYwOVRI?=
 =?utf-8?B?WGptREVZWjRDMnA1YnpYWllZU1hIWHdKSTA3NGMrVTNueUdPbmlPME9aV3RI?=
 =?utf-8?B?MG8rdU9mUHREcEZ3SDI0RldseTlQQ2ptZkxuMEhSYmp0NmR2RUJCMDBpL2lT?=
 =?utf-8?B?eE5MS0VBZnY0a3RhMFI4bHZKTy9PRmZNcWErUGZNdkFabXNnTUlScENsK0hi?=
 =?utf-8?B?MFFFbzJzV0tQSFF2c1BzYWpVYjFZdDM3bW5OVzNvd05EZEovU0R2WDVob2hq?=
 =?utf-8?B?RU9qemZIc1FGM0ZwTUhCYnZXSSswRTREZ21hcktRaFAvRGpzV2dKbEk0OGVu?=
 =?utf-8?B?SytvMTV1elVCSUZjb3JCRHhCUDFJaklGcUxhMkczU3A3S3pNT1k2RGpheDFp?=
 =?utf-8?B?czlmZ2VBL1YyUGllN1BjcE9lT2ZCb2ZsNGJyaG5tRHMvN3pJZVNPc1pkVFBO?=
 =?utf-8?B?cmdNSW9jblAwMkhHRWdyZDJGbk9raU9LbUNTb0xtYkkxV0VmWSsrVzZqU2g0?=
 =?utf-8?B?a293bjJpcVpGdHZmbDFnc2VNRzRtMG40Z0MyaGhHdWhDSTJOclBBZmJWQ0Rh?=
 =?utf-8?B?dEdjdWF6TXVDcVNIQlV4VjhwbzFtS3ZHY1VnU3h6L3oyUDd3Yi9XVndyUFpH?=
 =?utf-8?B?NlkrU2wxRk0yQWcrcTdvTFZidEZNcXZNV0NSamlkMjJsQmw3K2g3M1F2L1VX?=
 =?utf-8?B?a1ZTeURwUUdQMDBFN0laL2R5cDl6NE8xTElPMDJpM3BNMldSbm1YblhmbDg3?=
 =?utf-8?B?WDl5ZmRFanovc3Yyb01YV2RybjNSbmJDQWdjTWY2aTM0M3hhVXZkYXQ0VXdK?=
 =?utf-8?B?RVErUVVZU2ZSWjFoM1kvVmhHbGVPZER2L0dtanlqZ3dmRWtQd3ZuTWJVc1JE?=
 =?utf-8?B?MFZNUVlSY1NzSEZpL2JsU0t5ZzR4YU1sbTRZU2hUNE5vck15UFFBaWFZM1Ey?=
 =?utf-8?B?VWh1S1dTVCtxemRlRXI2K05VdlNSV1ZCcmJndG9tKzJaRGhVVDV2bm5jdThV?=
 =?utf-8?B?Z0R3cW03WmRtdUJYMU04c2wrTGY2S0xJKzdmVFlEYVYrekl5OEtvVjBrMUZB?=
 =?utf-8?B?REFFUlh0OWNxYzRRVzNlTW0zdnhuSWJSdjZ6NGNFT1JtK1VNMml6R2FzUWNu?=
 =?utf-8?B?bXFtSVhVT2FtSzVaclluVkh4KzBhRFM4RG80bUY0Zm9OVWdDWXBWWDcwaTRM?=
 =?utf-8?B?Y1NkRGhDeC9ockRNSmErRGFrbHZWNFdXajU2S2pKUTJRMGZ4amRWTmVaNEJy?=
 =?utf-8?B?T0NDS0RhcS9NZ1U4YW54dGlhRDYrdnlVQ1RkZEdiUTBWK2svbk9JT211a3FE?=
 =?utf-8?B?VnB4WEtiWWE1elVGSHp3N3ZEZklZblV6Zmk2RDhCangvcWpOa2xtRjVBR01w?=
 =?utf-8?Q?+wLbtd8aD+erD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebf15c4-43e9-49f1-7a57-08d94113c282
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 06:52:17.5399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJWVcTfeXyFqGkexXYzucfHXpAKV6GWjDyxP/s61akpPRzo1rZG6wlDtb1E11FXo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
Cc: Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@kernel.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.07.21 um 23:19 schrieb John Stultz:
> On Tue, Jul 6, 2021 at 2:15 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Tue, Jul 6, 2021 at 11:04 PM John Stultz <john.stultz@linaro.org> wrote:
>>> On Wed, Jun 30, 2021 at 11:52 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 01.07.21 um 00:24 schrieb John Stultz:
>>>>> On Wed, Jun 30, 2021 at 2:10 AM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 30.06.21 um 03:34 schrieb John Stultz:
>>>>>>> +static unsigned long page_pool_size; /* max size of the pool */
>>>>>>> +
>>>>>>> +MODULE_PARM_DESC(page_pool_size, "Number of pages in the drm page pool");
>>>>>>> +module_param(page_pool_size, ulong, 0644);
>>>>>>> +
>>>>>>> +static atomic_long_t nr_managed_pages;
>>>>>>> +
>>>>>>> +static struct mutex shrinker_lock;
>>>>>>> +static struct list_head shrinker_list;
>>>>>>> +static struct shrinker mm_shrinker;
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_page_pool_set_max - Sets maximum size of all pools
>>>>>>> + *
>>>>>>> + * Sets the maximum number of pages allows in all pools.
>>>>>>> + * This can only be set once, and the first caller wins.
>>>>>>> + */
>>>>>>> +void drm_page_pool_set_max(unsigned long max)
>>>>>>> +{
>>>>>>> +     if (!page_pool_size)
>>>>>>> +             page_pool_size = max;
>>>>>>> +}
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_page_pool_get_max - Maximum size of all pools
>>>>>>> + *
>>>>>>> + * Return the maximum number of pages allows in all pools
>>>>>>> + */
>>>>>>> +unsigned long drm_page_pool_get_max(void)
>>>>>>> +{
>>>>>>> +     return page_pool_size;
>>>>>>> +}
>>>>>> Well in general I don't think it is a good idea to have getters/setters
>>>>>> for one line functionality, similar applies to locking/unlocking the
>>>>>> mutex below.
>>>>>>
>>>>>> Then in this specific case what those functions do is to aid
>>>>>> initializing the general pool manager and that in turn should absolutely
>>>>>> not be exposed.
>>>>>>
>>>>>> The TTM pool manager exposes this as function because initializing the
>>>>>> pool manager is done in one part of the module and calculating the
>>>>>> default value for the pages in another one. But that is not something I
>>>>>> would like to see here.
>>>>> So, I guess I'm not quite clear on what you'd like to see...
>>>>>
>>>>> Part of what I'm balancing here is the TTM subsystem normally sets a
>>>>> global max size, whereas the old ION pool didn't have caps (instead
>>>>> just relying on the shrinker when needed).
>>>>> So I'm trying to come up with a solution that can serve both uses. So
>>>>> I've got this drm_page_pool_set_max() function to optionally set the
>>>>> maximum value, which is called in the TTM initialization path or set
>>>>> the boot argument. But for systems that use the dmabuf system heap,
>>>>> but don't use TTM, no global limit is enforced.
>>>> Yeah, exactly that's what I'm trying to prevent.
>>>>
>>>> See if we have the same functionality used by different use cases we
>>>> should not have different behavior depending on what drivers are loaded.
>>>>
>>>> Is it a problem if we restrict the ION pool to 50% of system memory as
>>>> well? If yes than I would rather drop the limit from TTM and only rely
>>>> on the shrinker there as well.
>>> Would having the default value as a config option (still overridable
>>> via boot argument) be an acceptable solution?
>> We're also trying to get ttm over to the shrinker model, and a first
>> cut of that even landed, but didn't really work out yet. So maybe just
>> aiming for the shrinker? I do agree this should be consistent across
>> the board, otherwise we're just sharing code but not actually sharing
>> functionality, which is a recipe for disaster because one side will
>> end up breaking the other side's use-case.
> Fair enough, maybe it would be best to remove the default limit, but
> leave the logic so it can still be set via the boot argument?

Yeah, that would work for me and the shrinker implementation should 
already be good enough.

Regards,
Christian.

>
> thanks
> -john

