Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4423E3EB765
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EC36E84D;
	Fri, 13 Aug 2021 15:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2049.outbound.protection.outlook.com [40.107.102.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0747D6E84C;
 Fri, 13 Aug 2021 15:07:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDweGzwULUCbbg4UiAJdiFoI8bE5YkU4JFMBN8MdSaAnGdyJddygbngHsKohOWgn98qYhl1rhEddfxzP4OQZ7VwNMa965zA0C/jMG6NgKGb4bp7gT0ag/Jedb/4qOFx4YDTjUXJU59bh2WceLnrT/LryhijmD/RFm0jn7P1dGmBZLgMwwsreb+2LC3HKdtlTLbFbaMhYxZfBQaq+/naQplWsUZ7W4210gJSN/ihjBNjkhIdLMKX8M+gEGcX7JxDjRMuay6w84o1w3Ez51q7H+hqJYiPS3yhlxckSA2UI0bRZ9b28YERnTMl6y0iKLhBDRQ71VO/PgO8F+4V6Kbp8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyiEIPqOfVjW4SukoC+oYrQVnLkZkuUGb+d1ZLTa/b8=;
 b=TTKI/ipjMln94dTk9/GKj7aOVGzUlca3c531zZKp937qCmnVxicxIi7ilxaqAtASc8pWS1Drrrnb+BF+NLUkBohMVT+9Hhm9mK8Jkf+aUB1HomFKvDMKP6ZE7Mn5aug8aSJTrg9pGkELZbUI1xTRZON4uTNxNrezu426AVmGpmf3XwgfI4/gtxafkFrUAnEuYEB8bEBi5Y3DunHLn6dVFb6ITHkWPUQVf4dwyRXf1W8+ixTfcXSC3Db28cM+EmgZf5RziTzAzrVj7AzHGU0bJ94s9Rcm0Na288fCilWcxD7tZeEdNYMuXqddeeq4PxrH/r8d/OdqitcUmxb8M9TRVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyiEIPqOfVjW4SukoC+oYrQVnLkZkuUGb+d1ZLTa/b8=;
 b=anrjlIRx9BZf5fPjGj8KptynQRjaCKsd/wCOZ69SFaztn5c5VTJ374hRlltX8MvJCdfnaOTf1FIZPuVecqUOZww3U6wLfTD8LSDrwfL/FB0QMKbeWfedXaH5XBpdo7pNbFfM5pNwprAibdRN7litJeWR4WM0FLmvpny5OYvVN+E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL1PR12MB5239.namprd12.prod.outlook.com (2603:10b6:208:315::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 13 Aug
 2021 15:07:41 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.018; Fri, 13 Aug 2021
 15:07:41 +0000
Subject: Re: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210811165211.6811-1-michel@daenzer.net>
 <20210813102920.3458-1-michel@daenzer.net>
 <f26f7350-79d6-e56f-bf69-fb1bf231208c@amd.com>
 <ff3c9ad3-ba7a-ef7b-d82e-27fa76c33979@daenzer.net>
 <9ec17598-0b51-014c-c633-2e4e74c863e9@amd.com>
 <31c9a190-8329-383e-bbea-3520add4d16a@daenzer.net>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <3ab84437-d4f6-c979-ef7f-d29dcf35eedb@amd.com>
Date: Fri, 13 Aug 2021 20:37:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <31c9a190-8329-383e-bbea-3520add4d16a@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR01CA0100.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::16)
 To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN1PR01CA0100.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Fri, 13 Aug 2021 15:07:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8138e8-b470-44b0-0e60-08d95e6c1890
X-MS-TrafficTypeDiagnostic: BL1PR12MB5239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52399018C7B2F419CAD03F2C97FA9@BL1PR12MB5239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9JhauCp7/QUIpWdIZxc7nKnzVSX/xadAzpNx6tmbKdOpPrf0xTAItOZ6v8UPOCVspWlys9TrGlrKtLASOmONPjvhl+mNQsCM7GTIM1shbQTDX+IT7jiV3YUY/ivE179+PLSgnTtKfJAkms6RzQl90idxixDZ2RP4RjbRgQ33XabW92QKx3UuyPIb7doHcln17hDHz04/11KNV+REK37uxEnnC66PMt2Gpov02mEfdrJFTFNqr1Cl2373rACe7786hAEf4DGYR/02dCRsEhOexVY/eRngTFcTYkQM554ft3O3GTnuywJ4fWziRmn5f5gRomMvUF+5VC4G4D6mdcJXvAgkFzEnyQYHNWupyJshOT9lo+4qhgoOz+HiefdHoou5c5oecjWSkD9dPT1KNvoDohIQF6K17NNenNYeM1dJZ5vHjuFKVuo2KYJQiSXB2pPQgnxdcbfCRK/jVPif3OSTPC20YZBWbNJ0ZbQJsb+96vQjwhHyCzeCeYoTcZZKHhU2hjbqdJEITYdR2RxD51vUi6Wihpxwd+vYNCU1ZVhtkuYZAA46bFxhVRFo7kKDEylOnBKvfeGzwFT93vLA2JoxjJ8EuGskHsRmtlDgjiCXhQzJXZ9WmEXXRivpoHd4Ozn+YKTvb4EaISGxQP88ghNAlwm+31vMRkP7ZUDgBSLJeJOH+/XUsI+CRstN6HQrTJBreTrB+1K4Pd2Nyc6gi/PJMxlyvlwWOlYW6wyza+oumE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(66556008)(54906003)(2906002)(8936002)(66476007)(66946007)(478600001)(110136005)(38100700002)(53546011)(5660300002)(186003)(6666004)(26005)(4326008)(36756003)(31696002)(8676002)(6486002)(16576012)(86362001)(66574015)(956004)(6636002)(83380400001)(2616005)(316002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEZMVWtVZzBKMXRlQUoyWUJONVlVZFhoUmN3UEMyNkFNdThLSmovSWZBODVG?=
 =?utf-8?B?UThPV3ZIdTU1NXpWdlZLZUxnUjRHYnZXeDVQQUFkeG00aThmczd1UStmS29n?=
 =?utf-8?B?cDBLRmNaczFxWmlzMmxrTmFjUzRuZ2p5c01rOE9LWktCVGZSVFl2Y2xyd05k?=
 =?utf-8?B?WG1QYTBNY1FMVEl6clpBWnZ1VHZJMG9VMzJWMjJEUTN4ckpCbmdwa3poTTZC?=
 =?utf-8?B?eVh2R0lTZFRmeWdmZlgwcnpqVldWNUkwaVA4Vy9IUEs5ODd3SXhMc2lyY3JK?=
 =?utf-8?B?THJmTS9rYlRIb1dudm9NZGdVSzk5ZTNIL0swa29pRWM3MVVmSWVRdk1nakpo?=
 =?utf-8?B?TkhTZ2UyVG56QzE5MVFJWmRuRVJLVlhCcHpnSVRFQ2dMM0Q2ajBSdlBVTk5n?=
 =?utf-8?B?aTBDMUJlbldGcHJ2czkzMERwUW41Z3YxOURHOW5SNmdVMVd5NjFSTmhma09R?=
 =?utf-8?B?T0ZqNjVWeURVQ0gyUlp0MTNNVyticVI1VWFmL1VabmE2Uk5VNklhK29kSktT?=
 =?utf-8?B?MzJiL2FNS3JFTTkxYndXczNZaFo3Mm9CSDdUUG5EcVNGNkJFOHp3UUZUeEdv?=
 =?utf-8?B?d3ZwMUhTMVZiU0J4NUlJcHk5VDVsM3pudmd4NTNWU3hyTzJXS2svYVJreGpP?=
 =?utf-8?B?eDBwVDZ1TW5tbFZ1YWJ3YjVpclRYbjNweGpSbWQvekgzL3QxRldLQXhtYm9H?=
 =?utf-8?B?cmxMdEFMOEFJcjVtTkszaWcxcXNjZUVxZXZ5a1lVcy94UDlPMjFEMnNNK3lQ?=
 =?utf-8?B?SHB4Nm9sL0V4SzloQy9CQzd2MEczZ1dxd3ZDTzRVV3BhSnNENktkS3lIQURN?=
 =?utf-8?B?QS80Q2pLWFZtOFlScngxZmk2YW5JcUJ6MFJTWUU0Z2x3RVovT3BvcEppejRn?=
 =?utf-8?B?M29MWDh2THBLY1pWL3RRZmQ4ZEtnVWZ4aGtHOFVKcFptL1ZySFk4ckxSQWJP?=
 =?utf-8?B?SDlyQjg1cEJQcHdLYmZRSUxOR0tzOHVMbXF1U0Nzam9jdzBGZHFha0tzNmpy?=
 =?utf-8?B?bWduektrS3E5Y21hTjBLTVVwYyt1MU9qRER5cXZDc3h2R1Ztdk9zbXRRVzI3?=
 =?utf-8?B?eEFWMktqZUZ2TTFuYXcvTjZMNVNUKzJJcTA0akIxNCtvWUs1RnAxL1ZtQXkx?=
 =?utf-8?B?ZEVTSkRUSUxXNU5relZ5bHcyNnJiZTdGTjM1L1gyUE9ZZ29ZMEdwWWtrUVh1?=
 =?utf-8?B?UVgxbGtNcVBqUU0vWUx4MTJXN1ZjMjJoOVR2WTdVa3Z6NVhPY1Y3UmhJZjlM?=
 =?utf-8?B?Z0t6RllBVWZFcTdEbUY0dnpGaVBNcjRPQlYwSTBhNXlNZSt2bFY1YUxDK3Rt?=
 =?utf-8?B?ZTA1MXFtc01lRlhsLzVjMGdkM3Y0NU9NdSt2TlFWL3ViWXZUc3RwNDVkN00x?=
 =?utf-8?B?THlxTkE1L1o4TEpvdkFTZEthd00zYzZ0eHhUeHRpdUUxYVk5bSsxekxvOHdB?=
 =?utf-8?B?V2RSVnE3SisxWU1mSzJpQ3BIRHp0QTVBWm5MYUFyMUlROHhSUi9YMTY5TzM5?=
 =?utf-8?B?eFlINlZZQmFMZXQ2VlFIcmZtckE4TW1Ha3EyckdtUHNWUGhqTDZMOW5PTm93?=
 =?utf-8?B?VzhlZngyS2RReFRRTVY5UjBtblZ0dWdNamZnMTJOQzlkQWZsSmxBalpRa2ZE?=
 =?utf-8?B?cy9wSll4NnhOT3krTktiVzZDOU9VTUprUGc4REFPSm1UYURUQ1lQendPOFo2?=
 =?utf-8?B?bVl2dG9MTnZiQVN6ZUNMejNaclMrQVYvNjQzTXkzNVNmRHFodExjVmRKMWV2?=
 =?utf-8?Q?BIcB1miefTTK3/XooTP9anOFKEt5uyow70t7CxP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8138e8-b470-44b0-0e60-08d95e6c1890
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 15:07:41.4583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyvHDRXQq60oh3OSCKi2ccTHI2wC1xmhfgAPUCJ/apuFZQupC6FvnySfAPxVsDt2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5239
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



On 8/13/2021 8:10 PM, Michel Dänzer wrote:
> On 2021-08-13 4:14 p.m., Lazar, Lijo wrote:
>> On 8/13/2021 7:04 PM, Michel Dänzer wrote:
>>> On 2021-08-13 1:50 p.m., Lazar, Lijo wrote:
>>>> On 8/13/2021 3:59 PM, Michel Dänzer wrote:
>>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>>
>>>>> schedule_delayed_work does not push back the work if it was already
>>>>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>>>>> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
>>>>> was disabled and re-enabled again during those 100 ms.
>>>>>
>>>>> This resulted in frame drops / stutter with the upcoming mutter 41
>>>>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>>>>> disabling it again (for getting the GPU clock counter).
>>>>>
>>>>> To fix this, call cancel_delayed_work_sync when GFXOFF transitions from
>>>>> enabled to disabled. This makes sure the delayed work will be scheduled
>>>>> as intended in the reverse case.
>>>>>
>>>>> In order to avoid a deadlock, amdgpu_device_delay_enable_gfx_off needs
>>>>> to use mutex_trylock instead of mutex_lock.
>>>>>
>>>>> v2:
>>>>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>>>>      mod_delayed_work.
>>>>>
>>>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 ++++++++++-
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 13 +++++++------
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h    |  3 +++
>>>>>     3 files changed, 20 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> index f3fd5ec710b6..8b025f70706c 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -2777,7 +2777,16 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>>>>         struct amdgpu_device *adev =
>>>>>             container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>>>>>     -    mutex_lock(&adev->gfx.gfx_off_mutex);
>>>>> +    /* mutex_lock could deadlock with cancel_delayed_work_sync in amdgpu_gfx_off_ctrl. */
>>>>> +    if (!mutex_trylock(&adev->gfx.gfx_off_mutex)) {
>>>>> +        /* If there's a bug which causes amdgpu_gfx_off_ctrl to be called with enable=true
>>>>> +         * when adev->gfx.gfx_off_req_count is already 0, we might race with that.
>>>>> +         * Re-schedule to make sure gfx off will be re-enabled in the HW eventually.
>>>>> +         */
>>>>> +        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
>>>>> +        return;
>>>>
>>>> This is not needed and is just creating another thread to contend for mutex.
>>>
>>> Still not sure what you mean by that. What other thread?
>>
>> Sorry, I meant it schedules another workitem and delays GFXOFF enablement further. For ex: if it was another function like gfx_off_status holding the lock at the time of check.
>>
>>>
>>>> The checks below take care of enabling gfxoff correctly. If it's already in gfx_off state, it doesn't do anything. So I don't see why this change is needed.
>>>
>>> mutex_trylock is needed to prevent the deadlock discussed before and below.
>>>
>>> schedule_delayed_work is needed due to this scenario hinted at by the comment:
>>>
>>> 1. amdgpu_gfx_off_ctrl locks mutex, calls schedule_delayed_work
>>> 2. amdgpu_device_delay_enable_gfx_off runs, calls mutex_trylock, which fails
>>>
>>> GFXOFF would never get re-enabled in HW in this case (until amdgpu_gfx_off_ctrl calls schedule_delayed_work again).
>>>
>>> (cancel_delayed_work_sync guarantees there's no pending delayed work when it returns, even if amdgpu_device_delay_enable_gfx_off calls schedule_delayed_work)
>>>
>>
>> I think we need to explain based on the original code before. There is an asssumption here that the only other contention of this mutex is with the gfx_off_ctrl function.
> 
> Not really.
> 
> 
>> As far as I understand if the work has already started running when schedule_delayed_work is called, it will insert another in the work queue after delay. Based on that understanding I didn't find a problem with the original code.
> 
> Original code as in without this patch or the mod_delayed_work patch? If so, the problem is not when the work has already started running. It's that when it hasn't started running yet, schedule_delayed_work doesn't change the timeout for the already scheduled work, so it ends up enabling GFXOFF earlier than intended (and thus at all in scenarios when it's not supposed to).
> 

I meant the original implementation of 
amdgpu_device_delay_enable_gfx_off().


If you indeed want to use _sync, there is a small problem with this 
implementation also which is roughly equivalent to the original problem 
you faced.

amdgpu_gfx_off_ctrl(disable) locks mutex
calls cancel_delayed_work_sync
amdgpu_device_delay_enable_gfx_off already started running
	mutex_trylock fails and schedules another one
amdgpu_gfx_off_ctrl(enable)
	schedules_delayed_work() - Delay is not extended, it's the same as when 
it's rearmed from work item.

Probably, overthinking about the solution. Looking back, mod_ version is 
simpler :). May be just delay it further everytime there is a call with 
enable instead of doing it only for req_cnt==0?

Thanks,
Lijo

> 
>> [...], there could be cases where it could have gone to gfxoff right after gfx_off_status releases the lock, but it doesn't delaying it further. That would be the case if some other function is also introduced which takes this mutex.
> 
> I really don't think we need to worry about amdgpu_get_gfx_off_status, since it's only called from debugfs (and should be very short). If something hits that debugfs file and it causes higher energy consumption, that's a "doctor, it hurts if I do this" kind of problem.
> 
> We can worry about future users of the mutex when they show up.
> 
> 
>>>>> @@ -569,9 +566,13 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>>>>>             adev->gfx.gfx_off_req_count--;
>>>>>           if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>>>> -        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>>>>> -    } else if (!enable && adev->gfx.gfx_off_state) {
>>>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
>>>>> +        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
>>>>> +    } else if (!enable) {
>>>>> +        if (adev->gfx.gfx_off_req_count == 1 && !adev->gfx.gfx_off_state)
>>>>> +            cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
>>>>
>>>> This has the deadlock problem as discussed in the other thread.
>>>
>>> It does not. If amdgpu_device_delay_enable_gfx_off runs while amdgpu_gfx_off_ctrl holds the mutex,
>>> mutex_trylock fails and the former bails.
>>
>> Ok, but now it creates a case of re-arming the work item from the work.
>>
>> TBH I didn't understand the problem on having to use _sync itself and not cancel_delayed_work().
>>
>> The edge case you mentioned for a cancel_delayed_work looks like a rare case
>>
>> amdgpu_gfx_off_ctrl(disable) gets the lock
>> amdgpu_device_delay_enable_gfx_off - waits for the lock
>> amdgpu_gfx_off_ctrl(enable) gets the lock again  (this has to be matching call for the previous disable)
>>
>> This scenario looks highly improbable as in general we expect some other work that needs to be done done between disable/enable.
> 
> At least for the case that started me on this journey (reading the GFX clock counter), that should be very short, just a couple of register reads.
> 
> I agree it's highly improbable, I'm trying to make it impossible. :)
> 
> 
