Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5744BA005
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 13:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC50D10EBA7;
	Thu, 17 Feb 2022 12:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBAC10EB59;
 Thu, 17 Feb 2022 12:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R155Mwu9aZdcf+55UJqme94HxyiR5NOD19F4lacdHqMZ/k+/lq3BrPIrsj7TlVbCVgt11M+C1dPfI1n1e1ECQN/wlf0DtnhiAANdAnWkeTvqYWXuSSC/F5SakmiZpdY8aiuKjO8H2o0fgSnXozCXj5dgvKkJKcujaKB9V3eIPxL0LCsqJxhcrqmq8jUQ1Y+FrRNwj4aBFFyP9kwPU+k78S55aazQg1cE27OYcJMqvljPJ0kkwnUrMfq4NGLdbrcrHhB9M8wtO8ARqGYDWwAt0Cw2RAK/AVc+wS6VWq/XouR4u16yj9kQa5M4Fs9/2OBrhWYYje7HsKaNS5QPnGHfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3zcdJPCJOstr98GMCTNjmDXCHX9DFbXjseFSjDGSj4=;
 b=ItWyLyV/IxZ0ai1um0ef9tM4ManGUxXP11BaKHHjxAvGBT1m3tbfGDkqw3Q/sPCoCZtRk2XPAdek1kuW6/kDArukDD60mRkQUZGhf88lTore9kl9ckjRwGw5oq6b3BNCTYLl+Ntg0gCOZQi5D1semiKdSIPTIeS5z4DldNqi6mJk6ZqnKZ3OMm4bBqysKpekJs6wgYcIKJ0QDvqYEE5Qf0McEmUdex50Av9Q9lS1zh/0sDbdSgd0JIQqDkBdTdhvhlTmNcopia7yaSRB0Ud7faqne6rxNOPWJFQMnVz5kBBN+tsVd1YlPqrUrk1eycMzu+SqUMxWMPQBb3S8YSScRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3zcdJPCJOstr98GMCTNjmDXCHX9DFbXjseFSjDGSj4=;
 b=kH0f5jyPmAqgYrNMubOn6li3FcOdTC8Q9nGhjOo9fNkhehlsHpWbIxhvcr1Ym/v/V+T2/IX3Rr2WFrC5UQpVvNm8hs89gMzPlCuOnluHso8p/2Py0sEc5NlqFbyQKUxvch5XiXt8KySAggpUyhNpu6g368uXeb765igldSV0LFQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1146.namprd12.prod.outlook.com (2603:10b6:3:73::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 12:22:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.4995.018; Thu, 17 Feb 2022
 12:22:29 +0000
Message-ID: <6711073b-8771-5750-33f7-b72333b411c6@amd.com>
Date: Thu, 17 Feb 2022 13:22:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdgpu: check vm bo eviction valuable at last
Content-Language: en-US
To: Qiang Yu <yuq825@gmail.com>
References: <20220217090440.4468-1-qiang.yu@amd.com>
 <5d3fdd2c-e74a-49f4-2b28-32c06483236f@amd.com>
 <CAKGbVbtLTBJPF5eTu4rABUTBa8eqjQvqjo1AEUrzgPgYgCREuA@mail.gmail.com>
 <dac70c05-e712-d2e3-2267-278380895f1e@amd.com>
 <CAKGbVbvtLbDiKrX80-dMnipdLkTE+FP=g_mx37e12fuMtA1Y4Q@mail.gmail.com>
 <ca27a9c6-f390-a938-dd66-ac23f3b44dc4@amd.com>
 <CAKGbVbv4UFCybS_OFj5UkDgevbrB5qe3pv+0nHv9WdefYhy6Ww@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAKGbVbv4UFCybS_OFj5UkDgevbrB5qe3pv+0nHv9WdefYhy6Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0308.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2be9605a-a226-44dc-dbce-08d9f2102a1e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1146:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB114686648A49D4A4485FC3E783369@DM5PR12MB1146.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eKi6BcOTnRzMQRi2jWxt7ffOpirWmtWdDmffcmNEuwMRneJT8YvVNI0bEy7L0STQ+gbBqRazwwe00NJ4+VEMpk92K8dFRKgky5Agj/gDEwb11H2ufbvnlizR6XXwlJSFtbXdFaGoRG5hOdF64V+FnCyOLlo2sJK7t3SW9h2WK9Q+/z43Zhb1LmIIgeLP+vx4ovtqQc5dFoTGS7ejDKxLRsTAGr8ECFXlJUzij20EFbnGST2DBxGo19s5udTNYsY3jj7d7RVNY4jqMNBoQUd1atAlpYigpmJrOFzfBmXfkfDDoup6hsPbReSms7JiB1owoLZdvpjQqpOdKjytBaHpnnXk463yf6S50mjxV80cwoJaaMXKJiIu178BM7d2fFZcJaXCW8IgOu9e7zyoyZ0OtgFEG3v9c3TU8HWYzd/dhZoEqbNvrVmCB39UR8WgsTcXHraMEblzM5wge2Z+WRxSiDOfLgWDfr7HEb0Cd/Q/uYlBqYSqJm2kR1YCUghipEQjqC3wbKao9YQ4vwqTqyiBMkNG/D7+CBWE1kxeGkykOu6ZbHOgVxEwtMa3AyGdwz8MXknhAhBJxK0uAsjjdl8+jgUTNlMVJxJ5rhoM9uSHLPsCQSl1BhpvFuof2dupQMy6B+43AsiI7eiaCN6vF8EyTbzDFbS1yJstPopwPg8WjJQFbRd2WZWVC6Cq+2bsRxIsNCGq8KcMSbZbpXsJZ5G8Aym42SraA80KTI61eV4kIDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66476007)(66574015)(66946007)(6916009)(83380400001)(66556008)(8676002)(4326008)(53546011)(6512007)(86362001)(31686004)(6506007)(38100700002)(6666004)(2906002)(5660300002)(31696002)(6486002)(186003)(2616005)(8936002)(508600001)(316002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXRUc0RvU3p2TUozYVpwS25OTTBEL3MyVnh3Z3ljWkJ1ZUFFRTNDK3cxRnMx?=
 =?utf-8?B?Q1ZTSlhHSTdVNTJ5cnVhaWFlNm5mNjFtTEJyTEZJMG5GaVorcUxpNEd4VW5L?=
 =?utf-8?B?RVYvelVwQmNSYnZNSmRHdGI1RWhXREtnMENhU2NkeEN6RHh2M00vNndrT0t6?=
 =?utf-8?B?UEhhaEk0T3ZPRnhsRGpGR2Y0UEVkVERiamhOU1hZWjNSRHNhdWtmS2w0T1Na?=
 =?utf-8?B?S3I3b1JsWm9TanhhL0NmcGFOOVk1S0VaVytDL3BjN1I4K2NucFE2VHhNbXg5?=
 =?utf-8?B?RHl5ajlUK2doRytzOUJTbVdqMEdnRHdsS1hzTnZVWVRTUVB3SGJDQldVQ2FC?=
 =?utf-8?B?K2lCekhSZWdSdmdrMkllSGVoWTRjbXVXMkxsKzE5YUo2dC8zYkZqWVJOOEEx?=
 =?utf-8?B?Q3lPY2llUkluWlpUcDR1WHV6Szd0aUNpZ21ZL0xHcnBOSkNEYlIzWUIzNVBF?=
 =?utf-8?B?K1FEVW9IN3RiVWdudHZxWkYvYUlEN2FlWFN5Y1RmNVZPdERoY25KOVZqN2NH?=
 =?utf-8?B?c1I4d3g2anFNRkV1K0Eyd3pnNkZ2VDAwTDJBYkthZUNpbEhkTUZqNUVzYkhs?=
 =?utf-8?B?Z21OM213N1hnMklsZ0wvcmwvMWpZcDg5WndBWVk1N0FpTTViSG96WmRQaUtr?=
 =?utf-8?B?dit5a3RmYXQ4ZTU5NUVZakZJaHZpcTlzd1BSZU53bjYrUklqSTVNaGh0VGVD?=
 =?utf-8?B?a0VQb2RmUVNtUWJGaE9mVVhHdFA3OWQrZ3dhSVdsaXBjSzdKM24rc3RDTk9G?=
 =?utf-8?B?Tjh1cUE5NGNOb2p6OGZ3TWtDektTeWduTG1lVjdWeXZQVXhhL0EwVmlydEs5?=
 =?utf-8?B?SUpKbWlDU0dQMGo0bGpqZ2JCdlFlb3RHa1loemhTWGlyQzFXNWswanRCK1Bp?=
 =?utf-8?B?S3czL2pYa28wdkU5U2xEc0RabUpmcUF2aWxaaHU1YkdFaGlQMFFzc1R3V205?=
 =?utf-8?B?UHNlY3o0ZkNWeHMrWGR6R0w2a3dmaGZYMTFObEtuV213THlPQm9sTEZVN2Zo?=
 =?utf-8?B?OXZBZUxRdWl1OXRUWjNWUEdPZlduTGZhQ3lvcWkwclVRanRTcEs1WFFNVGRW?=
 =?utf-8?B?bmplaTl3UklBaFJXZE1henZJcm04QVJQQWdzOGdXSVdXQnpiNEpIQlNBZ3h1?=
 =?utf-8?B?VHpUWjlXQ2J2ZGFrSFRYNUErYlJudVEvM3Y0T3lobmdxK1VPSFFBdnZLcnhv?=
 =?utf-8?B?bVB0V21UaWNtUWxWTFVrbzhJMUZ5WlNVWXZVSkVUOUtSU2hOc0ZpRzFhSVc2?=
 =?utf-8?B?aW44NFZCQUVhWk14UFQwZzFCTHFHZTVaNGllWm5IelRhVnR5aFgxdTZrRHRl?=
 =?utf-8?B?eHZkd1RoL1pRSWozR3hpaGZQUzNibGlJVlVtTzBMUytEVStMV1lmaFZoejF0?=
 =?utf-8?B?aXE2eUMzaUV6OFg5bG5ENzBrb1IwUC9tM1ZEV3dnNVRqT1lYN2hCOWdZRjIy?=
 =?utf-8?B?VVlmMmJkbW5PYjFIeFg4eWNhcGpJTklZcHdZb3lVZ3FQUzZXbW9xZ1JpQmUx?=
 =?utf-8?B?MDFXQTJBNUgyeTFzbk0wZVNUMXpTM0xxOWpaRFNvcXV4ZXNPbzA5eVVsYm5N?=
 =?utf-8?B?WEFiMXBjMUM4SnFWYWMwVG1IcEdHUnJKd2tBQlFCODMyc1U2dU9Pc2REV0JX?=
 =?utf-8?B?b1pKanFMSzZNQmtsczdSa3Y3L0RHYkF4dFRvemNVUzMrWTNXVXF4bUE1Wk5s?=
 =?utf-8?B?V0NLdUxPdFVONCticXZNZjRVMGx3N1hldjIwZEZhNTUzek12eFZNWUhsYXdV?=
 =?utf-8?B?NlVUeGtvWnp2U0lCRkl4MDRmd1Z6OXFmSjlXUnVwNG5IMVFhbVZib2VpTi92?=
 =?utf-8?B?eEdwZE51c1lHbStweWpLNjFwRUdhM2czMHJYd05lcCtxS0dia0hUVW45d2F5?=
 =?utf-8?B?d1V2Nm5aWit6elQ1Zjl5bUxDUkJlTWlWKzNyajJrL3Q1bVB4YVR3TjRQRmhZ?=
 =?utf-8?B?STlUM1Y4TDcwRWdJVlVRdHhsbUFCL3FjUkIxNm5icERqME9VRnowRkhlT3Rr?=
 =?utf-8?B?c2hrRzBwNUM2YzFkSUo1ckdlOHdSS01GckZMN3BXZ0I0ekJHL3k3dDh5Rmhx?=
 =?utf-8?B?VFVNVE81ZG0ya1FkMG92dWlQaWFocXNhcnVmaTBNSHJ5bE5VTmtrN2VYdExu?=
 =?utf-8?B?YWFYV0sxZDRRQUdaWkFaWnY3SE5mdjRjcXlub2ZoQ2NQODg5bjdlUmVVa2h1?=
 =?utf-8?Q?BuF8NH1ER+0mYxCHF0Nj5iU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be9605a-a226-44dc-dbce-08d9f2102a1e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 12:22:29.2824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pvzjqc+M37MD5gHfMmLj5meTcObIcvaD88fMFz9GJZZZEXj8J4wc2rbl6Whj9AkB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1146
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Qiang Yu <qiang.yu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.02.22 um 11:58 schrieb Qiang Yu:
> On Thu, Feb 17, 2022 at 6:39 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>>
>> Am 17.02.22 um 11:13 schrieb Qiang Yu:
>>> On Thu, Feb 17, 2022 at 5:46 PM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 17.02.22 um 10:40 schrieb Qiang Yu:
>>>>> On Thu, Feb 17, 2022 at 5:15 PM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 17.02.22 um 10:04 schrieb Qiang Yu:
>>>>>>> Workstation application ANSA/META get this error dmesg:
>>>>>>> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)
>>>>>>>
>>>>>>> This is caused by:
>>>>>>> 1. create a 256MB buffer in invisible VRAM
>>>>>>> 2. CPU map the buffer and access it causes vm_fault and try to move
>>>>>>>        it to visible VRAM
>>>>>>> 3. force visible VRAM space and traverse all VRAM bos to check if
>>>>>>>        evicting this bo is valuable
>>>>>>> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
>>>>>>>        will set amdgpu_vm->evicting, but latter due to not in visible
>>>>>>>        VRAM, won't really evict it so not add it to amdgpu_vm->evicted
>>>>>>> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
>>>>>>>        ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
>>>>>>>        but fail in amdgpu_vm_bo_update_mapping() (check
>>>>>>>        amdgpu_vm->evicting) and get this error log
>>>>>>>
>>>>>>> This error won't affect functionality as next CS will finish the
>>>>>>> waiting VM ops. But we'd better make the amdgpu_vm->evicting
>>>>>>> correctly reflact the vm status and clear the error log.
>>>>>> Well NAK, that is intentional behavior.
>>>>>>
>>>>>> The VM page tables where considered for eviction, so setting the flag is
>>>>>> correct even when the page tables later on are not actually evicted.
>>>>>>
>>>>> But this will unnecessarily stop latter user VM ops in ioctl before CS
>>>>> even when the VM bos are not evicted.
>>>>> Won't this have any negative effect when could do better?
>>>> No, this will have a positive effect. See the VM was already considered
>>>> for eviction because it is idle.
>>>>
>>>> Updating it immediately doesn't necessarily make sense, we should wait
>>>> with that until its next usage.
>>>>
>>>> Additional to that this patch doesn't really fix the problem, it just
>>>> mitigates it.
>>>>
>>>> Eviction can fail later on for a couple of reasons and we absolutely
>>>> need to check the flag instead of the list in amdgpu_vm_ready().
>>> The flag only for both flag and list? Looks like should be both as
>>> the list indicate some vm page table need to be updated and could
>>> delay the user update with the same logic as you described above.
>> I think checking the flag should be enough. The issue is that the list
>> was there initially, but to avoid race conditions we added the flag with
>> separate lock protection later on.
>>
> But list and flag does not align always, there are cases like
> list-empty/flag-set (this problem) and list-non-empty/flag-unset (non-vm bo
> eviction). If only check flag list-non-empty/flag-unset change behavior.

Yeah, but I think that the flag unset list-non-empty case would be 
correctly handled if we only test the flag.

In other words we can update the page tables as long as they are not 
partially or fully evicted and that's not the case when non-vm BOs are 
evicted.

Regards,
Christian.

>
> Regards,
> Qiang
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>> Qiang
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Regards,
>>>>> Qiang
>>>>>
>>>>>> What we should rather do is to fix amdgpu_vm_ready() to take a look at
>>>>>> the flag instead of the linked list.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 85 ++++++++++++++-----------
>>>>>>>      1 file changed, 47 insertions(+), 38 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>> index 5a32ee66d8c8..88a27911054f 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>>>>>> @@ -1306,45 +1306,11 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>>>>>>>          return flags;
>>>>>>>      }
>>>>>>>
>>>>>>> -/*
>>>>>>> - * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>>>>>> - * object.
>>>>>>> - *
>>>>>>> - * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>>>>>> - * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>>>>>> - * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>>>>>> - * used to clean out a memory space.
>>>>>>> - */
>>>>>>> -static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>> -                                         const struct ttm_place *place)
>>>>>>> +static bool amdgpu_ttm_mem_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>> +                                          const struct ttm_place *place)
>>>>>>>      {
>>>>>>>          unsigned long num_pages = bo->resource->num_pages;
>>>>>>>          struct amdgpu_res_cursor cursor;
>>>>>>> -     struct dma_resv_list *flist;
>>>>>>> -     struct dma_fence *f;
>>>>>>> -     int i;
>>>>>>> -
>>>>>>> -     /* Swapout? */
>>>>>>> -     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>>>> -             return true;
>>>>>>> -
>>>>>>> -     if (bo->type == ttm_bo_type_kernel &&
>>>>>>> -         !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
>>>>>>> -             return false;
>>>>>>> -
>>>>>>> -     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>>>>>> -      * If true, then return false as any KFD process needs all its BOs to
>>>>>>> -      * be resident to run successfully
>>>>>>> -      */
>>>>>>> -     flist = dma_resv_shared_list(bo->base.resv);
>>>>>>> -     if (flist) {
>>>>>>> -             for (i = 0; i < flist->shared_count; ++i) {
>>>>>>> -                     f = rcu_dereference_protected(flist->shared[i],
>>>>>>> -                             dma_resv_held(bo->base.resv));
>>>>>>> -                     if (amdkfd_fence_check_mm(f, current->mm))
>>>>>>> -                             return false;
>>>>>>> -             }
>>>>>>> -     }
>>>>>>>
>>>>>>>          switch (bo->resource->mem_type) {
>>>>>>>          case AMDGPU_PL_PREEMPT:
>>>>>>> @@ -1377,10 +1343,53 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>>                  return false;
>>>>>>>
>>>>>>>          default:
>>>>>>> -             break;
>>>>>>> +             return ttm_bo_eviction_valuable(bo, place);
>>>>>>>          }
>>>>>>> +}
>>>>>>>
>>>>>>> -     return ttm_bo_eviction_valuable(bo, place);
>>>>>>> +/*
>>>>>>> + * amdgpu_ttm_bo_eviction_valuable - Check to see if we can evict a buffer
>>>>>>> + * object.
>>>>>>> + *
>>>>>>> + * Return true if eviction is sensible. Called by ttm_mem_evict_first() on
>>>>>>> + * behalf of ttm_bo_mem_force_space() which tries to evict buffer objects until
>>>>>>> + * it can find space for a new object and by ttm_bo_force_list_clean() which is
>>>>>>> + * used to clean out a memory space.
>>>>>>> + */
>>>>>>> +static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>>>>>> +                                         const struct ttm_place *place)
>>>>>>> +{
>>>>>>> +     struct dma_resv_list *flist;
>>>>>>> +     struct dma_fence *f;
>>>>>>> +     int i;
>>>>>>> +
>>>>>>> +     /* Swapout? */
>>>>>>> +     if (bo->resource->mem_type == TTM_PL_SYSTEM)
>>>>>>> +             return true;
>>>>>>> +
>>>>>>> +     /* If bo is a KFD BO, check if the bo belongs to the current process.
>>>>>>> +      * If true, then return false as any KFD process needs all its BOs to
>>>>>>> +      * be resident to run successfully
>>>>>>> +      */
>>>>>>> +     flist = dma_resv_shared_list(bo->base.resv);
>>>>>>> +     if (flist) {
>>>>>>> +             for (i = 0; i < flist->shared_count; ++i) {
>>>>>>> +                     f = rcu_dereference_protected(flist->shared[i],
>>>>>>> +                             dma_resv_held(bo->base.resv));
>>>>>>> +                     if (amdkfd_fence_check_mm(f, current->mm))
>>>>>>> +                             return false;
>>>>>>> +             }
>>>>>>> +     }
>>>>>>> +
>>>>>>> +     /* Check by different mem type. */
>>>>>>> +     if (!amdgpu_ttm_mem_eviction_valuable(bo, place))
>>>>>>> +             return false;
>>>>>>> +
>>>>>>> +     /* VM bo should be checked at last because it will mark VM evicting. */
>>>>>>> +     if (bo->type == ttm_bo_type_kernel)
>>>>>>> +             return amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo));
>>>>>>> +
>>>>>>> +     return true;
>>>>>>>      }
>>>>>>>
>>>>>>>      static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t pos,

