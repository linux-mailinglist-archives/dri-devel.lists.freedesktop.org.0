Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8024DCD3B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 19:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D191910E463;
	Thu, 17 Mar 2022 18:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CBF10E0ED;
 Thu, 17 Mar 2022 18:10:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYVvvKCfcUA9UJgLBo6IUWjwY5Fif3E/Q+d4bqB6TxsvRnIwEiWXZqEtfo3xiMHMfB4oYoKrWA1yiP5vDbPuwgT6gKw6fLwOo0UAItWt0uJkDrNeufblJeARVS93wqmONsv/e9VEnXLy5WKw/E9z+TZVDcwCjZSltL4OJud7jyu/S6iL0XxRJkTFADCaNyuSc4WcDj/NKtF8GZDpS6/UYlUhH7sRH69hzBlfKjmo60eSnOFctrGKECav9t5Dh2TDkqyChrTL75ji5JFTwfj4tLkIR8/6PmrK034qLzRhdL9cN+9s3Q9Ie45mbBfFkpV1UhcDc3hVEavuRL18NlbP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUZnYOsoAYlFR6kl+DIrmDSDloBHCLicnBDqLC4k5Jg=;
 b=QE1xFjpWmatC1Hwat9rDQMAV87CQkdL1JSM2A6TKv5Dhev26+DWstfRw4RFCFZK7upIqUeoienKvZHbUtYSyt0HULjyMCm6gQGCaN3enU2CeCUniZFyeUjIA40TMSrL93BBDiCeH+7O31NPYGMsn+fu3YaI5E5zEp/iG2sUZD2LAk8/DvjvTdyDbp1Z68sdAodLvvPPGN9qf0dkSoJFj1C3HiOzAKIejFso6wmSB5tGyHCpvtju6nJdAHH/lrYTCjlFvUkn0cgud49ScYfn2h2jdEXAyk56uiuWjacMK1RctAkwSCDiMa89O5ztAU1ntak39oVJBHedPGM+JO7e6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUZnYOsoAYlFR6kl+DIrmDSDloBHCLicnBDqLC4k5Jg=;
 b=mmZ0S+b7UI2IZ37VbWYEB2L8JI9mqDTV5JOkEqqC6OTRVllbT5DaQQPeH8szF/zANCxZ+iT1CtUHaYJtt3e1Ukgdji0KGAZETXxNWupULwniMR90/0oZ1ixAV9Zzn6VBxKP0hUxxzfCK4/Vf5ATKZEmeA5Yi95K/SJYr7QWNF20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by CO6PR12MB5475.namprd12.prod.outlook.com (2603:10b6:5:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 18:10:33 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::90bd:5b12:918d:5703%6]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 18:10:32 +0000
Message-ID: <3a475e5a-1090-e2f4-779c-6915fc8524b1@amd.com>
Date: Thu, 17 Mar 2022 14:10:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] drm/msm/gpu: Park scheduler threads for system suspend
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-3-robdclark@gmail.com>
 <YjMGac4Hnjmg1wE8@phenom.ffwll.local>
 <3945551d-47d2-1974-f637-1dbc61e14702@amd.com>
 <CAF6AEGv36V8bLoDn5O1SW3iTUtzd3O1XeuT5gJxyLMxd1E-o3Q@mail.gmail.com>
 <865abcff-9f52-dca4-df38-b11189c739ff@amd.com>
 <CAF6AEGuoBeYoMTR6-KM9xGZ05XSSnSJWMDciawczi7qtiLN9Vw@mail.gmail.com>
 <915537e2-ac5b-ab0e-3697-2b16a9ec8f91@amd.com>
 <CAF6AEGsyFAOPmHqT7YX1wsukP4-gYAstCukr89r9w28V0YSCUw@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <CAF6AEGsyFAOPmHqT7YX1wsukP4-gYAstCukr89r9w28V0YSCUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::34) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7716cd27-8ab4-42ad-eaf6-08da08416ceb
X-MS-TrafficTypeDiagnostic: CO6PR12MB5475:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB547518F84B27C208D742BD0CEA129@CO6PR12MB5475.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DcZWPkCFFQAdOI4i2ERHpey6pKXWv25uUUi5pZbHRfvedfrwTZCu47rOPktbCeLxgyCPhp4ZwLhJtq8RviYe+OzXfuJUy5vE+vbKC/Mxkla5tKOjpcclGYYlxplGnR6Au9HtuttQIxPl/JPMLb0ZqSoyN3X7oMK300RyFxBgeTM8agbT2UdDc6Kn/VT3mpG7nW4ezT8xYATTmun5Y7cOmcCAoBKPryOJz0eTitP1a2jfvwewykGPsIR/O3AQpje/OviZW1LhMRPWZv7LwHu7c9b3gkFZhuOjpsqfE35ZFNDu2yEtnwG/kd1JinaqX8gjlPlZKZCG58Hu99SEceLirF0PY7rlZqOHluGNjRHOV9hg/Vbin+MgEeVfYtTNkYQcnNADN15U5Jxdrl7XHj4USi73WixTacRWwjQH6u4sTBxv5LhGD//oVFfosyKsPC+05a5oDpxPzyFvkwpWHzcQj0WwqW96NfaH6B132u9vlg9il7bpSctIV2Ep792WD3vDenmehEIFl55gJbw4Iho8haVnxqFIZ8ItjDVSZb2NPIhFDEFKxoXjXslt7Yf4Dvkw4PCsR7d66mEbWtcqPN4CZb1eVknhcg9iXhuzVt10YakfFgcoJJBi0ysVClO6AJpZIofb8/FW4KCbAFjo9/LcGuwtreQZOTcZfISZuyHTEz0kNdT0jTndTB61YulY6Xt26ixXLTIIM9nA08VELo84eDTjIXANjVpc/oWmqETk30zoNmOG3ADMWCx7PBQxSS9F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(15650500001)(2616005)(54906003)(110136005)(6666004)(31686004)(6636002)(316002)(6506007)(31696002)(2906002)(53546011)(6512007)(38100700002)(6486002)(83380400001)(4326008)(186003)(44832011)(5660300002)(66946007)(66574015)(66476007)(66556008)(86362001)(508600001)(7416002)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNQK3E5SzQ2VTc3a1pYdVZxYVpBODkvQ2M1amVkSXM2ajE5eWZ1T3dCSDZR?=
 =?utf-8?B?b0RHS3ZGa3ozVWsyTStsS1pzN0J4a1ppVWlneFhlNU1DdU9XL3l2OWpEc3NO?=
 =?utf-8?B?a09MTDdJYzZ1d0IxV0dkZHZST1VCdllmVm42anBRTmdpd3RxaWZRYVlMcHhK?=
 =?utf-8?B?VERmQzBBUThVZXV4SmJNM01CQ2UvMENlUjdkTS9HdCtwV1cvUGRvMFVkUVZY?=
 =?utf-8?B?VTZSTmcyMVZoTENRUDVlWDlpTVR5VmVndExUVDBvMnhaOVVublg4MXdaS0V1?=
 =?utf-8?B?NGN4VC9YQnFpRGFkVUpRNGdYcThkNHpqZ0RuLzZDRzlzNUlFTjd2R21taFFD?=
 =?utf-8?B?UFJXK3FVcTcwMlZsSnAzSVk1V0Fqcmg4TUx5ekxSbXVYaUFjcDJ1Mjkwdmpl?=
 =?utf-8?B?Z3MrWHd2TnJ5SlJFQTNpN3NQMEZqOHBFeDluN1FFb0RDVytrNktFbFJMYjJ3?=
 =?utf-8?B?MnNaTVltS2M1eFpPcGdBL05zbnByeEJDNm8yQzArTHp6Q0IycTkwYjkyUGVm?=
 =?utf-8?B?c1JZZS9qQTQyWG5SQ05FSXQ2ZWEvMDdzOUZEby9mT3NxV3Y4MVZYbEtGclB3?=
 =?utf-8?B?RnloVk9sUzhaMDVxcE9OVnlzeXFzb0JSOHZQTWhlbDFIcVR1N0g2bmMyQllT?=
 =?utf-8?B?RzI0cU16eXRnZ0RJdDRIWHo1dDd1eFhpNk1JU3dqSU01V2NqK1kwdEJuQU1W?=
 =?utf-8?B?U2gyTm9oVHUzbWw4ZmNTVDJtS1pxTDRCeWtFTzhoNkhUdUluSU1iMzMwcjZ4?=
 =?utf-8?B?ekpyN3ZVTmxCSDRGRW5ZamFLZEgrMk9VemxlakIrWStpdWcra3V0ZG1DTVpP?=
 =?utf-8?B?Yjd4TCt5ZjlsRXk1STJTSTZyUkZ5a1RSN0M4cmJmRjZlTmpvdy9zOHg0OENa?=
 =?utf-8?B?bkdjRVhaTlpBSUJ1ZHpsUVgySUpMdUVjbkFFT3ZEd3FyK1YwTlN5VW04RENn?=
 =?utf-8?B?ZmVvMU8xbkFnbjlOSHRMTmZHcHBjaHJ2MjNZL091Z2taT3U1d3dYWitPVHhP?=
 =?utf-8?B?ZmZCTXBiT3RLa240Mkp6emJKcjRxM0g0b2ZqWEZOYlM0NElseEswYWJFWXln?=
 =?utf-8?B?QUxrTWhsYURNTFVXTkFaVTVQNTFQam5WcXpBTnh2Mmw1ckV5UzRycUhUelJm?=
 =?utf-8?B?NmtpMis5eFUrYU9jRXlVdURwWTZrUUtxTVJVdGliWjdxTU9abVgvS2dTSnUy?=
 =?utf-8?B?SEVQd1dPekplNVhMMFo2TEQ5cDIzU2RYNU1CUWsxTXY5ZkM3RXJ4Vm10K0ln?=
 =?utf-8?B?OFJ1VW0xTTgxdGwraDBjMFNBRThOYVM5N0p3Tlp3Vjk0MTh1NHpmcXlUMUZL?=
 =?utf-8?B?VGcwT2cra3VPMUhVYUpKZ29NYWVIM0w1TE1ZNlRFN0Q3c1FUZis2K1ZvMmJ0?=
 =?utf-8?B?eERFTU4yV3lPYkd4QmhFTzVqUnMwNU1JYW1SVGVFNitXSlBqbko5Nk1ObU9X?=
 =?utf-8?B?UW9pTFJtMVNRRCt3S3BDR0tUemUxTHUxR09zeHBJS3lwTkdrak9pcFMxRVRu?=
 =?utf-8?B?YzdwYkk3QURHei9PN2FuQ25obUNoVnhGaHRXUEliaEp4Z0pkZGhqK2dneHVK?=
 =?utf-8?B?WXA3WUJBU3Ayb3pXbzdWNVdyR09DYmttejlSTzdxY1RnQmM2VEhkUW51L3hB?=
 =?utf-8?B?R0craDNOV1JVa0xtTzhqbXNGQUtUL2J6NitFRXlpaG5pKyt1ZTU5SUtXNVpl?=
 =?utf-8?B?dGFMSG5rcDBvQ0d0a3RkdW5rNXVad3hVSHVseldJWVZpdndLNGwzMVo1YjRE?=
 =?utf-8?B?amwzTzc3N24zd0ZkQlVOZjhCNkxtb0FJMXZlOEpobGZ1V2tYbFUyWlJDNTdh?=
 =?utf-8?B?VWZNTE1ka3pCdlhkRkg1RkZ3SnlJTVYzSDFIbjNSdnF3bTBqSThxNjRud0tR?=
 =?utf-8?B?dzJaYkxweHNDN0tucDRTZXpadm8zY3gxdXNBUm1zb3FWMjhHMTRhSmFFMTJS?=
 =?utf-8?B?SDgyblhwbzdDTDIwaHVPbXJiOFgybDJ5ZG0xOXJwUy80d3B0ZFZxQW83aVVN?=
 =?utf-8?B?d3A3UHdtK2dsNmhyWDJJNld5NUEyZDVPb0kvOTRkNW9xZUgzSys3WHlhSVEz?=
 =?utf-8?Q?LjVyyA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7716cd27-8ab4-42ad-eaf6-08da08416ceb
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 18:10:32.1518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1AKCK7v0U7XAwsEuHy8HF0IolW7emRGGdAbLbNX1ShIFED/6OWFPK6qFzQUBkAnMpQEp6LjOgCf0gLD5uKINw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5475
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-03-17 13:35, Rob Clark wrote:
> On Thu, Mar 17, 2022 at 9:45 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 17.03.22 um 17:18 schrieb Rob Clark:
>>> On Thu, Mar 17, 2022 at 9:04 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 17.03.22 um 16:10 schrieb Rob Clark:
>>>>> [SNIP]
>>>>> userspace frozen != kthread frozen .. that is what this patch is
>>>>> trying to address, so we aren't racing between shutting down the hw
>>>>> and the scheduler shoveling more jobs at us.
>>>> Well exactly that's the problem. The scheduler is supposed to shoveling
>>>> more jobs at us until it is empty.
>>>>
>>>> Thinking more about it we will then keep some dma_fence instance
>>>> unsignaled and that is and extremely bad idea since it can lead to
>>>> deadlocks during suspend.
>>> Hmm, perhaps that is true if you need to migrate things out of vram?
>>> It is at least not a problem when vram is not involved.
>> No, it's much wider than that.
>>
>> See what can happen is that the memory management shrinkers want to wait
>> for a dma_fence during suspend.
> we don't wait on fences in shrinker, only purging or evicting things
> that are already ready.  Actually, waiting on fences in shrinker path
> sounds like a pretty bad idea.
>
>> And if you stop the scheduler they will just wait forever.
>>
>> What you need to do instead is to drain the scheduler, e.g. call
>> drm_sched_entity_flush() with a proper timeout for each entity you have
>> created.
> yeah, it would work to drain the scheduler.. I guess that might be the
> more portable approach as far as generic solution for suspend.
>
> BR,
> -R


I am not sure how this drains the scheduler ? Suppose we done the 
waiting in drm_sched_entity_flush,
what prevents someone to push right away another job into the same 
entity's queue  right after that ?
Shouldn't we first disable further pushing of jobs into entity before we 
wait for  sched->job_scheduled ?

Andrey


>
>> Regards,
>> Christian.
>>
>>>> So this patch here is an absolute clear NAK from my side. If amdgpu is
>>>> doing something similar that is a severe bug and needs to be addressed
>>>> somehow.
>>> I think amdgpu's use of kthread_park is not related to suspend, but
>>> didn't look too closely.
>>>
>>> And perhaps the solution for this problem is more complex in the case
>>> of amdgpu, I'm not super familiar with the constraints there.  But I
>>> think it is a fine solution for integrated GPUs.
>>>
>>> BR,
>>> -R
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> BR,
>>>>> -R
>>>>>
