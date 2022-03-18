Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5804DE23F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 21:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B5310E00B;
	Fri, 18 Mar 2022 20:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B1310E00B;
 Fri, 18 Mar 2022 20:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6047T+gVxc2pv1mT5wMD4dL0AnTbxGsizb8Yzz6OIhYYoZOiYBvv6YMD0S0Wd4oVSzLbvOKzd6eNejk3Ztt8JMw9lFOZBcS4CpJ2bVizIVwRADSs+q+WQm0jmb6S5IgKxSPleOcO/a3RIopi3k58ObjaHUK03aqVMr9FifSIFyhlDAosBizQroDnUaCFf4dA3sRKDyO+/jxdWzEHUaa92kBCoaenGR8tB6adt/B6YwqFhfYN/oEO41vAc1NQfhBwr/ZnIjnbAyWBa4H8umTtLIgQNTD+OB6+VQ/c65knMt/sGgdWaICQ0MlWM61XIgHn/W957MSFWDAPV5HIRZ/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGVE7TxzbfqVfRop24YxeBs6x/TwXqIIob8JiAVpncE=;
 b=gZrm95VC3pzs7ylVQvcF/TFKW6wBlQOTRSKKvd+CiNNpBUOrc6/6BebSS7MmTZKgb/zbZKD3Uz26FiQnsbX17EHCFdY7GoSO2lGYfBZGY5LF/Komc4Axw5x95SWb3OCLd9TZk7Q6WRcD4skCA72sFZ0aUXRbw3yEuCFZNstIQH0+s+HZPnXfIAmIC9QHgCP2zeWOpIEihSxH7UfjcO2o+CcNpSuO9M9Z6aGH1IhJlEQ9eB134gPhP+jKXJ1sI7hpudqUzkvOe1tTcBuIydJiXTbQ/lXPkaqw+ncJtnxL2wrvJHoWX+7FQRTjP9JkvqIpRMmGNwO9W0V+USBob9UTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGVE7TxzbfqVfRop24YxeBs6x/TwXqIIob8JiAVpncE=;
 b=Z099yZEe2R9kTmoUw/mOeJvHNMAgIcroZLFek1zKcUFVbpJ0UiGkxIC5lhQfJv1Yx0QUYt63gW6daW+uldVgJC1/qSqGlSlRgtc0dx179/N7aE3fWTh8hAgSdSD57PU807YeMwesZYDayFLrtSBuO+Ia48H6kUoCc4Wx246rPP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM4PR12MB5963.namprd12.prod.outlook.com (2603:10b6:8:6a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14; Fri, 18 Mar 2022 20:14:50 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%6]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 20:14:50 +0000
Message-ID: <284c0e65-6204-7747-b294-1f9fa23b1f91@amd.com>
Date: Fri, 18 Mar 2022 16:14:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
 <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
 <CAF6AEGsyFAOPmHqT7YX1wsukP4-gYAstCukr89r9w28V0YSCUw@mail.gmail.com>
 <3a475e5a-1090-e2f4-779c-6915fc8524b1@amd.com>
 <CAF6AEGtPrSdj=7AP1_puR+OgmL-qro0mWZDNngtaVPxpaCM76A@mail.gmail.com>
 <1c847474-8ee1-cc7e-3d4d-261a4e92fb2d@amd.com>
 <CAF6AEGuw45gi4f+mVs7cVyjCHY9O4N1O8OfuGHv-wAkzP3UpMA@mail.gmail.com>
 <dd7d3f20-8288-3a7c-a368-a08282746ff1@amd.com>
 <CAF6AEGvp+f4=EjQ9tWwcEafBEOAy6nCd8bOTqLXopiFhjx_Y_w@mail.gmail.com>
 <0e572944-66a0-f5a7-4517-3c437e668584@amd.com>
 <CAF6AEGvun2UrGvXbGSBnhagWQFpm1Qt4T=TscQSkw3ikZm2r5g@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CAF6AEGvun2UrGvXbGSBnhagWQFpm1Qt4T=TscQSkw3ikZm2r5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::9) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 132a3e3e-51dd-4232-ae60-08da091bf497
X-MS-TrafficTypeDiagnostic: DM4PR12MB5963:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB5963E6EA3A94EF25D2C6990BEA139@DM4PR12MB5963.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cMSxesdyikIEQoLeftDz0NBGRj1V/9Ph2aF2sMdkSvAh/kyijozO9vFmToZjJvqiFJkOg5HufBeKS+zK+W+2dW5eyZU4mPyYBLBn76jfaP3bju0OG/H6nlJNBfoGJ0Yaw46e/LvGxR0e3IcUPlBaryPyZ9HmyoAtiHCN9Wu38H6NMDfzO0xZGdTyAgbKXl5HerqHHqs8jYFMI0NjsRzfRGuyCvjV30ItEtkes14CNiBdwpY1bvTxEU/cBw+37kGN/yqSvGkAxhZWfgjqGTMQd+h0uX6sswVSkJwGBGNdrqwRsE6nT5ORpVQsM7wfOgC5PVcXRjA2OaCk0WJdZwpigTnBlZCV0QQlijBiomaAt/B/SniaX7ZIrbz7nY/ww9m35c1xN9H7ci3jBidjSsPjpV2NRnirMgoAKv6epeOuz+Q89AC1t11+qC8kWVR21lFIMp/AwqzRJ1fTrn3rx8pqWk6BbXt04DVuxybME3cBSJ3x4r4dmto8YQuM6gZqWc/bmpSvuYwjqU+hD5HC2FKixXsUaD3cAX0TIZXoLY/IOzp0Rab8QoIoULdbW6l6NsFek7fdIq4uJ0mFHotwHFgAkAI1E6SDyxZCizjhrh7R6syz7aDYfjW2kikuozg9TPIR3LdivirIaC+8txx5ENXPBc1OUGfN9G/BOLxT0Y+hc4jbSkjqAkkQJxcpmpv1meBrQl7x8CMULaG1NsyHJIAQlP20wl+YecB0cDF5Mc21q9ZYdOd4hbrFqqxf2CJwhZVJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6666004)(86362001)(6506007)(53546011)(66574015)(83380400001)(186003)(44832011)(31696002)(15650500001)(7416002)(36756003)(5660300002)(8936002)(2616005)(2906002)(38100700002)(6486002)(6916009)(31686004)(966005)(45080400002)(508600001)(66946007)(66556008)(66476007)(4326008)(316002)(54906003)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dko3d0w4TFYzNUF6SXVpR3ZZNUxGV0p5OHl5OXRCcWNaa1FIQWlIcW5nbys2?=
 =?utf-8?B?NHY0VEx4M2dpQXVFelU5SVZkNjhrbGNxY2pJZ0s5M29GZHQyK1pMempXc0lJ?=
 =?utf-8?B?R1ZpK3BmdnBvM2xFVVVJNkdhMlEvUW9Jazd5aUNMcTFlb0VoN2JYK21SVDlI?=
 =?utf-8?B?UDRRSDdMQmpNZmUzNFBKZzNkZTlCN2NISk5vbWNubkV5c3NvV3FwNk9ueDBZ?=
 =?utf-8?B?RjQwYUJXYU9nd1ZsWTN1d3JKWVFFNHdtOE9UeFBDamRvUkJkcDNXZ24wNGov?=
 =?utf-8?B?NEZ3ZEJDKy8zcWYveUliMHdBMGs4TUM5a1IxS2puY3BXdmFoSVZEWVVCOFlO?=
 =?utf-8?B?RkxzMkpiVkY0RjVGUmxpZEFzeWhkTWZOSFVoNnFUTXNRb0o1V29nSTVoRFd4?=
 =?utf-8?B?ZkFjNnArVTJrMEVHY2xwY0pwNGlxUEtHRnhINFJEM2o1UTVnQmY5ODQ4N2xu?=
 =?utf-8?B?Yi9zRStHd3pwRWlBMEtNOUE2SE8ybWtUZ3dUYm5GVlZYdDVoUFZlakQzOEdB?=
 =?utf-8?B?QWkzMS9NNEs4TWFYcG1jcW0yY2U0SVFIMnVhSTVDOFltUDlVRk5kZ0w5dVEx?=
 =?utf-8?B?S2ZUaWtBQXNtSFpjTWJEVm9IdVVpeEk4d3FxbjYwVFFWeFA0a3VvQjZaL0FY?=
 =?utf-8?B?V1dNRHZKdy9ScXhMZ2paanNpZE1vb0JReE1NSnp4QUxpc3dGLzdEL0NaaHBq?=
 =?utf-8?B?L1FQTVA4WFpvVldYbHRyZkloMUtheWRFeEZ4b2Y0T1VzaDNQQ21NZHhhc1ox?=
 =?utf-8?B?TW15VjE5RzNka3JxKzhmZzdnZHQ2WElnQzJsM1RFT1Y1QnBoOGRuR0s5YWFD?=
 =?utf-8?B?QVhvaGdhcHpsdVNwRlRjVE4xblc0WlpVTm5GbFJtazJYQzBOaEh4OS93Zys5?=
 =?utf-8?B?dHdnVWNIazZ2ZUdkWVJjNlhxcGFJaXhrT1FiR2RzdzExZzdMRG1wTTBMVWRL?=
 =?utf-8?B?eWEwRkc5cU5DSThWbGxHKzRTNGdNU1ZsYWd3TnJ3MitkRmFaMGdHSTBMb00v?=
 =?utf-8?B?LytxMnpJakVFNzdGaXZkbDU5a0JueEZQalBhMjNETmtUYzFMckdYdWdQeXEw?=
 =?utf-8?B?ODBpUnRsT3FxbFlqM1ovL1JHcDgwTm4xeWtscTNLd2l0NzgzSjRlT3V2TEE0?=
 =?utf-8?B?NXlyUldnSlRNaHJYODNRWXU4QmFzT3RxVEMyK1BkK0FsWWd1Sjlha2pQWTBW?=
 =?utf-8?B?SWxDc1hxVlZjZ2svTkF6cVBvUWJRYjEyQTVkR0ZpR2N5MC9rUEF0SmtnNHNl?=
 =?utf-8?B?VTl4MnhTTU1NaWNoQ2g0QllEVlcxb2Q4a0tiTlJ2eTZoU283RWNXOUJTQUs5?=
 =?utf-8?B?dEI4TmhsNjQyVDZJYXJady9jRjBFR1NXWWxNNi9EZXBNWlAycmhpZU9HVXZF?=
 =?utf-8?B?OS8wRXRlb011UGRuaWpXR2NYd00vemRITG91dWpiNWEzRVVmdEd3K0pET0xV?=
 =?utf-8?B?bSs0aEJFeXI2azRHOW14SkhuM0NrdGEvem1rT3lXMTNKL2pFYVdlbDcvdExz?=
 =?utf-8?B?ZVhydG1pcVhVaWVSSThHWDMrdjQ0clh1TzJLNyt6QzE0SUtEVzJYdERrdWsv?=
 =?utf-8?B?VWIwdEVibjVLSnpuci85bzVPWld4RWtyN1dQRURHZ0h6K0xjMlJYeHpLcUlt?=
 =?utf-8?B?Y3ZRV1hzNVg4RmZKUXc0NXNLUkZRdS8wUU9lUEt2UTlnZ1V5ajlGRjc3WUtR?=
 =?utf-8?B?LzlkVnZYTFpBUzVyOUlndFcxZTY1aURPMVRmTDhDTEN5bVp6RGJ3KzhwWllW?=
 =?utf-8?B?Z1NiNmVIVHlLMENreGY0Vk5nd2lFODNUQ3FHeG9oT0g0c3BQVGowaWVOMUFB?=
 =?utf-8?B?U2gxeXFSenA0QmhxL3NKQ3diTTBwTEtwQklmdVoyWjgvRkpzVGhrQnh5N0J3?=
 =?utf-8?B?OEl4dmRKNVV1SzhNOWtYdEkzNllnVWtKZDhzb1YvTzNkcTAyS0NZZDltZ1Fk?=
 =?utf-8?B?dkptS0llaVp5NG5mckJxMlNOMWhaMzI3dGFDWDB2dGRGZ0VYeUt1QWE3OFZE?=
 =?utf-8?B?SjV0ek93bGZ4alFWbjlHS0lUTTdMS0VuYjcxVjZRK3psZkJhWUhhM2owN0s0?=
 =?utf-8?Q?G6iAHM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132a3e3e-51dd-4232-ae60-08da091bf497
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 20:14:50.2132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENIrQjGhsKVwVdnPYJsC+gvjfTN9qkXfAar6kFi1sTMO31TlqNXv83NopxOPinKGbDKR4+RHScjnDztWYsqfjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5963
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "Alexander.Deucher@amd.com" <Alexander.Deucher@amd.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-18 13:22, Rob Clark wrote:
> On Fri, Mar 18, 2022 at 9:27 AM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>> On 2022-03-18 12:20, Rob Clark wrote:
>>> On Fri, Mar 18, 2022 at 9:04 AM Andrey Grodzovsky
>>> <andrey.grodzovsky@amd.com> wrote:
>>>> On 2022-03-17 16:35, Rob Clark wrote:
>>>>> On Thu, Mar 17, 2022 at 12:50 PM Andrey Grodzovsky
>>>>> <andrey.grodzovsky@amd.com> wrote:
>>>>>> On 2022-03-17 14:25, Rob Clark wrote:
>>>>>>> On Thu, Mar 17, 2022 at 11:10 AM Andrey Grodzovsky
>>>>>>> <andrey.grodzovsky@amd.com> wrote:
>>>>>>>> On 2022-03-17 13:35, Rob Clark wrote:
>>>>>>>>> On Thu, Mar 17, 2022 at 9:45 AM Christian König
>>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>>> Am 17.03.22 um 17:18 schrieb Rob Clark:
>>>>>>>>>>> On Thu, Mar 17, 2022 at 9:04 AM Christian König
>>>>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>>>>> Am 17.03.22 um 16:10 schrieb Rob Clark:
>>>>>>>>>>>>> [SNIP]
>>>>>>>>>>>>> userspace frozen != kthread frozen .. that is what this patch is
>>>>>>>>>>>>> trying to address, so we aren't racing between shutting down the hw
>>>>>>>>>>>>> and the scheduler shoveling more jobs at us.
>>>>>>>>>>>> Well exactly that's the problem. The scheduler is supposed to shoveling
>>>>>>>>>>>> more jobs at us until it is empty.
>>>>>>>>>>>>
>>>>>>>>>>>> Thinking more about it we will then keep some dma_fence instance
>>>>>>>>>>>> unsignaled and that is and extremely bad idea since it can lead to
>>>>>>>>>>>> deadlocks during suspend.
>>>>>>>>>>> Hmm, perhaps that is true if you need to migrate things out of vram?
>>>>>>>>>>> It is at least not a problem when vram is not involved.
>>>>>>>>>> No, it's much wider than that.
>>>>>>>>>>
>>>>>>>>>> See what can happen is that the memory management shrinkers want to wait
>>>>>>>>>> for a dma_fence during suspend.
>>>>>>>>> we don't wait on fences in shrinker, only purging or evicting things
>>>>>>>>> that are already ready.  Actually, waiting on fences in shrinker path
>>>>>>>>> sounds like a pretty bad idea.
>>>>>>>>>
>>>>>>>>>> And if you stop the scheduler they will just wait forever.
>>>>>>>>>>
>>>>>>>>>> What you need to do instead is to drain the scheduler, e.g. call
>>>>>>>>>> drm_sched_entity_flush() with a proper timeout for each entity you have
>>>>>>>>>> created.
>>>>>>>>> yeah, it would work to drain the scheduler.. I guess that might be the
>>>>>>>>> more portable approach as far as generic solution for suspend.
>>>>>>>>>
>>>>>>>>> BR,
>>>>>>>>> -R
>>>>>>>> I am not sure how this drains the scheduler ? Suppose we done the
>>>>>>>> waiting in drm_sched_entity_flush,
>>>>>>>> what prevents someone to push right away another job into the same
>>>>>>>> entity's queue  right after that ?
>>>>>>>> Shouldn't we first disable further pushing of jobs into entity before we
>>>>>>>> wait for  sched->job_scheduled ?
>>>>>>>>
>>>>>>> In the system suspend path, userspace processes will have already been
>>>>>>> frozen, so there should be no way to push more jobs to the scheduler,
>>>>>>> unless they are pushed from the kernel itself.
>>>>>>> amdgpu_device_suspend
>>>>>> It was my suspicion but I wasn't sure about it.
>>>>>>
>>>>>>
>>>>>>> We don't do that in
>>>>>>> drm/msm, but maybe you need to to move things btwn vram and system
>>>>>>> memory?
>>>>>> Exactly, that was my main concern - if we use this method we have to use
>>>>>> it in a point in
>>>>>> suspend sequence when all the in kernel job submissions activity already
>>>>>> suspended
>>>>>>
>>>>>>> But even in that case, if the # of jobs you push is bounded I
>>>>>>> guess that is ok?
>>>>>> Submissions to scheduler entities are using unbounded queue, the bounded
>>>>>> part is when
>>>>>> you extract next job from entity to submit to HW ring and it rejects if
>>>>>> submission limit reached (drm_sched_ready)
>>>>>>
>>>>>> In general - It looks to me at least that what we what we want her is
>>>>>> more of a drain operation then flush (i.e.
>>>>>> we first want to disable any further job submission to entity's queue
>>>>>> and then flush all in flight ones). As example
>>>>>> for this i was looking at  flush_workqueue vs. drain_workqueue
>>>>> Would it be possible for amdgpu to, in the system suspend task,
>>>>>
>>>>> 1) first queue up all the jobs needed to migrate bos out of vram, and
>>>>> whatever other housekeeping jobs are needed
>>>>> 2) then drain gpu scheduler's queues
>>>>> 3) and then finally wait for jobs executing on GPU to complete
>>>> We already do most of it in amdgpu_device_suspend,
>>>> amdgpu_device_ip_suspend_phase1
>>>> followed by amdgpu_device_evict_resources followed by
>>>> amdgpu_fence_driver_hw_fini is
>>>> exactly steps 1 + 3. What we are missing is step 2). For this step I
>>>> suggest adding a function
>>>> called drm_sched_entity_drain which basically sets entity->stopped =
>>>> true and then calls drm_sched_entity_flush.
>>>> This will both reject any new insertions into entity's job queue and
>>>> will flush all pending job submissions to HW from that entity.
>>>> One point is we need to make make drm_sched_entity_push_job return value
>>>> so the caller knows about job enqueue
>>>> rejection.
>>> Hmm, seems like job enqueue that is rejected because we are in the
>>> process of suspending should be more of a WARN_ON() sort of thing?
>>> Not sure if there is something sensible to do for the caller at that
>>> point?
>>
>> What about the job's fence the caller is waiting on ? If we rejected
>> job submission the caller must know about it to not get stuck waiting
>> on that fence.
>>
> Hmm, perhaps I'm not being imaginative enough, but this sort of
> scenario seems like it should only arise from a bug in the driver's
> suspend path, Ie. not doing all the job submission before shutting
> down the scheduler.  I don't think anything good is going to result
> either way, which is why I was thinking you'd want a WARN_ON() to help
> debug/fix that case.


Yes, I just wanted the code to not allow such bugs to go through 
unnoticed. I guess
WARN_ON should give laud enough warning anyway

Andrey


>>>> What about runtime suspend ? I guess same issue with scheduler racing
>>>> against HW susppend is relevant there ?
>>> Runtime suspend should be ok, as long as the driver holds a runpm
>>> reference whenever the hw needs to be awake.  The problem with system
>>> suspend (at least if you are using pm_runtime_force_suspend() or doing
>>> something equivalent) is that it bypasses the runpm reference.
>>> (Which, IMO, seems like a bad design..)
>>
>> I am not totally clear  yet - can you expand a bit why one case is ok
>> but the other
>> problematic ?
>>
> Sure, normally pm_runtime_get/put increment a reference count, as long
> as there have been more get's than puts, the device won't runtime
> suspend.  So, for ex, msm's run_job fxn does a pm_runtime_get_sync().
> And retire_submit() which runs after job completes on GPU does a
> pm_runtime_put_autosuspend().
>
> System suspend, OTOH, bypasses this reference counting.  Which is why
> extra care is needed.
>
> BR,
> -R
>
>
>> Andrey
>>
>>
>>>> Also, could you point to a particular buggy scenario where the race
>>>> between SW shceduler and suspend is causing a problem ?
>>> I wrote a piglit test[1] to try to trigger this scenario.. it isn't
>>> really that easy to hit
>>>
>>> BR,
>>> -R
>>>
>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fpiglit%2F-%2Fmerge_requests%2F643&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C35f0d7d9282044651c9708da0903d4f4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637832209324217553%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=dwjPEVAYgCI%2BtEyzBirfAQkJjZax2NdiLQfNeFfImtU%3D&amp;reserved=0
>>>
>>>> Andrey
>>>>
>>>>
>>>>> BR,
>>>>> -R
>>>>>
>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>> BR,
>>>>>>> -R
