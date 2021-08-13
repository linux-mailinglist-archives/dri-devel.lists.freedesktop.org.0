Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A22CE3EB69A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 16:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0FB6E819;
	Fri, 13 Aug 2021 14:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F436E7FA;
 Fri, 13 Aug 2021 14:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgXNVwXFhN2EYRVTFcjBCw6WX042P75DYpEgdClyj8OgJEdqqlaUOu9vC+2S6iV2KOBiNsEdyPDuEQ7uf38eKUDOP1hYIoqSY29sEewqyM1+3d2iNfh0wxGP7XZwQL74HlmFR/LqhqRz8brlU9PdeMSsQy3jrWAWfjtkJ2Rxkf369ZtgAjpNpBeTRQCVUoV6ps18s/r/kyReUu6J2yKBxonVYRi51Z54JkmeYYmTgzUr1kX/Bo/Fzao1Vf2/gj5li1ITEICmT4VzcBIG/76ARGxbQb1e7xgdIJHF24SAAEzeqtBs856ll5yqB0DSpEgz8Z9M/GED+y46cfHRJ8hOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUpKNjxnCuQScdbgP2cgb+81e3vJkUQrmddXsNi/kUI=;
 b=SX2L0zHN+xerwMGeDbV6FZvqR4YSG3hDOjn0SKhsK5kMb+O6n6MCv2Bw/g5nuOKaqUhG062AVEXzBtJaeD1HZ6aTmDcGFBBj/g/FxQD6Vt2j4YaP0l1rnWVsPzeutwinq2+byoWrsAjEuAhpfKTyF9q+Rc1Y2tCb/+c+qa7lXfdSi27g3kZe01Gj0t/jrl2ZOx8/TFu1M8wdFKIvnRekOnwqllrCVlXremwyRinkMI/x+wjCLvQjYdv0L8wHmKKjHUi3fMMMm0qoFAZ1DLa06qCqcrVyQRPtSv2xekQV60gLv3y4byzwCjX3kBLAArnKVDL0La4RX6eChflPr69xdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUpKNjxnCuQScdbgP2cgb+81e3vJkUQrmddXsNi/kUI=;
 b=28pPhFIjgcIJc9eyIRpMgbk1ru36J40bRUniAHDcch77V7+x/rAroSe43fRPO/vic3bWE7/z1ZzXvGntRpU44DN+XdcuS/KqE3QD3h0Q/z1gSGLpkc7z9pwzpXxpoXXZA8oPV7G7ZGxG3l1mjuiAJBt3sK07XOg8J6bGPtXegyQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 by BL1PR12MB5078.namprd12.prod.outlook.com (2603:10b6:208:313::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 14:14:15 +0000
Received: from BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6]) by BL1PR12MB5349.namprd12.prod.outlook.com
 ([fe80::152:9dd3:45a4:eeb6%4]) with mapi id 15.20.4415.018; Fri, 13 Aug 2021
 14:14:15 +0000
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
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <9ec17598-0b51-014c-c633-2e4e74c863e9@amd.com>
Date: Fri, 13 Aug 2021 19:44:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ff3c9ad3-ba7a-ef7b-d82e-27fa76c33979@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PR0101CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::12) To BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.157.114] (165.204.158.249) by
 PN1PR0101CA0002.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Fri, 13 Aug 2021 14:14:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5bb4770-e208-4557-551c-08d95e64a143
X-MS-TrafficTypeDiagnostic: BL1PR12MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5078CD426551E7B9D8970F6997FA9@BL1PR12MB5078.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lEUUFihW0LqH8Lo3TfWSAUvrpZmwt2XQTyhaN+9Vy8UsxiFDss7acKNxFkNTlBjsLpOaYVxdiiHYiHRRUdafVfsLn8UgbnoK4unYduK7jA3PfFoWfIXLnCz707ulnmW6Yh9BHpju+LvBAjsOQfwB9DvTphyWO9popioi26eohNNR+oKcgSoOKGJlg1/7MavHZ5XJz8tK5vddHsRNmPy7uhftO+Gyj7PJ1AUk7WYaxl8Wc6M5U/kfuE9Y1EDe7Wn0BIK0gvI1pltKfedOvm+0UworMrZs2WgPNOiD/FiSeq2HXPWANerhZu+f5/e6CTsoz4Q97HKfSpqTZkzzxyOLPQkIT/lg+OjxQdUTcxoQwFueGUt9PnwkvFdu/ZmVHo1ZoTK2ANhSGZwMs+ikLkb41RgyLSKaAUuHim/SE0oxXWLX2duFLM2aH0l65jizg18orAQ2ovJW7f6HQV5MYXRSnUs+8t4Irmoaq6ZsS5b0KeNrQd+cr5pOUxr1stFp130YR25KZx0c0VkLEWucYR3itoTTbjesrrJSnF9joa4Z3q5YKWvaQ5pQMqVivjyQDmEODSwvdnp31NFXbB4TsROyU2uTnYBBVweyPF7knkpk5sItSs0A5jtnpfc2ZOGX6qEAM4iFcyndUnSkmJHIlLDWcrmaLmyKRRvPjr8IsYXBCer3ZgAqsb6IimghVcyovt35rQNunHxPRCGWkMteVwe9IsMM4jfRSmfvbyE43ZSdzFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5349.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(186003)(16576012)(6636002)(8936002)(316002)(6486002)(54906003)(956004)(31696002)(2616005)(110136005)(86362001)(8676002)(478600001)(38100700002)(4326008)(53546011)(66946007)(66556008)(66476007)(83380400001)(26005)(36756003)(66574015)(2906002)(6666004)(31686004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHVjSzV5T0hFVkVSZmFOYStWaXhkeHRueTZMU2h2N3BLeUFtSFhrclpuYzNl?=
 =?utf-8?B?ZFdFUy9SeVhKWnNUakVaK2xJa2VCMnF1RGsyZVYzbnJoN0l5b1k1MXBKSzFM?=
 =?utf-8?B?K0xXakF1eEVPcDB0UkVwckJFVFJSUjBsdUo3VThveUVWMm1QN0VEQ1F4aXUw?=
 =?utf-8?B?d00vSnZqU0dtNldPWmk5cFdla2wyNlZOS0pFMktZdFFMRXR3RXA4eW5oWE9Q?=
 =?utf-8?B?NlFPenhxeEZOS0luMDVtYnNjWFI4aGtrUkZRdHU3bVZRZFpGVDJPVEFvZUtF?=
 =?utf-8?B?cGEwTEFnQ05ObCtBTnRFMDFIUzlSdVZIbUUyRGlhVERIUzVVSnhHMEJIUFhP?=
 =?utf-8?B?RzhJb2NDcTFaRnk3djFzSElqSVBKOFRCU0VJNmsvLzBLRW5yZ2xSSUVXMnZ5?=
 =?utf-8?B?N0JWQU9Mc3E0eDdRUkZmUWlEWk9uMzJCcFo2ajBIbWJ6RnhLaUx2V0JXWUp2?=
 =?utf-8?B?SGRkN2RvNG5weTNuM3VqMHlnQ0J1MnBUeVdVamFMd2VzcGdOb0c0QmZUOTFH?=
 =?utf-8?B?N1NBbktKN21pOVpIT1JCTDdHZnY5WXlVcitsRXhlS2ZrTVV3Y2Z1Z25mWTlD?=
 =?utf-8?B?aG42YWpHTHRHK1R1UEV6cy9nTmJZSFA0T2VsaXJOZjlNaUxKRHpaV1Y3UWZJ?=
 =?utf-8?B?N3FsdjBHT2JqUHk5c2tlWjIvK0t3WktGUXlUN2p3ZkxIajBqSk9aOTlvQ0Fi?=
 =?utf-8?B?KzVuVEkzREh4aCtEby9ZZ2VSMk9WRlhadldvSVFaMVdJMXhTcXJzdEdjRUFP?=
 =?utf-8?B?L3V0cTJ0RDVyaTNRY216aDR4M0FvSjZYdlBwRCtXYWZyOEVrdnhLdFVHdDFa?=
 =?utf-8?B?c25ZSmpYcVB2T2J4WEdzd1AyQ1U3SDAyK3VZUndqYXNBRUFjWVlrUUZVck1v?=
 =?utf-8?B?NTArT3BkdThHWTdSUlNNcFkvQ1BsSFZSNEg0RWpIRndmM0laM0I4NmFHd3k4?=
 =?utf-8?B?NmtNNVZpN2Z3RGtsTlhUZG5rK0JReXBVOWU1cnYvSGVSc045enJBd0t3ZXBY?=
 =?utf-8?B?SmM5dGV3MmVIWHpMWUFOd3ZTS1graHNNaTVyT1RBSFRWQmoxZHFUUGZ5RS9o?=
 =?utf-8?B?Zk5ZN3JhM1lVY0dYMUNFRVVVaERTbWlBcG1uM0F5NGVEUHZsZmhKdWM0RVg0?=
 =?utf-8?B?RjdwQnFZUVdwUWtxa2I4Rmk2UTdZd3BCL201Y2JPZlRtTFN0ZGNSYXJtSzdE?=
 =?utf-8?B?ZCtHRDNQb0YzYXNKWnhtNGg3YXRZcXdQMFV1UEgzdEZ5SFdmbFlmdlVUR0ov?=
 =?utf-8?B?YjVHYitrYURaYnlTZ0ZnV1hTTklNMUxCQmFLZUlBZzl3TEVnTndyWU5rQjF1?=
 =?utf-8?B?Ty9USTZJSGFyVnVMOTFIUzF2aTdlSGI3c01aSzFtM1h2MHFpR2RwSjBpV3dZ?=
 =?utf-8?B?b0ZrbVViN25JdmVPVitlN0JhNUZsUkhhSGNUeUVtTVlhcnU0aHVXbjJMZFlI?=
 =?utf-8?B?WE1DeE1lcTZtWlZiNWtMUXRoZ09vbklXMUdaSFc2dnJISWpjWk9oMXpBcUcy?=
 =?utf-8?B?L0M3QjhabEc1V2R1R0t5b1B0L1VGN2JsZml2THVFOVhKZDFxVGFjQXFkYzFq?=
 =?utf-8?B?S3FJbEN4U2FZVVVUQVVRbG1PWm1YQWFpRTdSL1JMamVIUUFiWlNKOFFPTmFZ?=
 =?utf-8?B?SXE3ZWlFVnk4Ump5VWwrVFFENDVDNW5HSkRrdnpjMDRhSkhRZlY4ZXRCUDND?=
 =?utf-8?B?OTlOWTBTN2dHWHgvQUxmSG0wQUd6TmE4a1FqZHVqeklDeEVQYWpTZ2w5bE0x?=
 =?utf-8?Q?SzQVxqYchjo/Ii4MILF5gdqOrR/5zSzQgtf+9uP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bb4770-e208-4557-551c-08d95e64a143
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5349.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 14:14:14.8943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17cXN9JmFLaBi6EkcykSDBw+nWANem+9tbPkDGglgm/g7K6syJHuw/+Q4ynjkmrs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5078
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



On 8/13/2021 7:04 PM, Michel Dänzer wrote:
> On 2021-08-13 1:50 p.m., Lazar, Lijo wrote:
>>
>>
>> On 8/13/2021 3:59 PM, Michel Dänzer wrote:
>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>
>>> schedule_delayed_work does not push back the work if it was already
>>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>>> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
>>> was disabled and re-enabled again during those 100 ms.
>>>
>>> This resulted in frame drops / stutter with the upcoming mutter 41
>>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>>> disabling it again (for getting the GPU clock counter).
>>>
>>> To fix this, call cancel_delayed_work_sync when GFXOFF transitions from
>>> enabled to disabled. This makes sure the delayed work will be scheduled
>>> as intended in the reverse case.
>>>
>>> In order to avoid a deadlock, amdgpu_device_delay_enable_gfx_off needs
>>> to use mutex_trylock instead of mutex_lock.
>>>
>>> v2:
>>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>>     mod_delayed_work.
>>>
>>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 ++++++++++-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 13 +++++++------
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h    |  3 +++
>>>    3 files changed, 20 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index f3fd5ec710b6..8b025f70706c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2777,7 +2777,16 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>>        struct amdgpu_device *adev =
>>>            container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
>>>    -    mutex_lock(&adev->gfx.gfx_off_mutex);
>>> +    /* mutex_lock could deadlock with cancel_delayed_work_sync in amdgpu_gfx_off_ctrl. */
>>> +    if (!mutex_trylock(&adev->gfx.gfx_off_mutex)) {
>>> +        /* If there's a bug which causes amdgpu_gfx_off_ctrl to be called with enable=true
>>> +         * when adev->gfx.gfx_off_req_count is already 0, we might race with that.
>>> +         * Re-schedule to make sure gfx off will be re-enabled in the HW eventually.
>>> +         */
>>> +        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
>>> +        return;
>>
>> This is not needed and is just creating another thread to contend for mutex.
> 
> Still not sure what you mean by that. What other thread?

Sorry, I meant it schedules another workitem and delays GFXOFF 
enablement further. For ex: if it was another function like 
gfx_off_status holding the lock at the time of check.

> 
>> The checks below take care of enabling gfxoff correctly. If it's already in gfx_off state, it doesn't do anything. So I don't see why this change is needed.
> 
> mutex_trylock is needed to prevent the deadlock discussed before and below.
> 
> schedule_delayed_work is needed due to this scenario hinted at by the comment:
> 
> 1. amdgpu_gfx_off_ctrl locks mutex, calls schedule_delayed_work
> 2. amdgpu_device_delay_enable_gfx_off runs, calls mutex_trylock, which fails
> 
> GFXOFF would never get re-enabled in HW in this case (until amdgpu_gfx_off_ctrl calls schedule_delayed_work again).
> 
> (cancel_delayed_work_sync guarantees there's no pending delayed work when it returns, even if amdgpu_device_delay_enable_gfx_off calls schedule_delayed_work)
> 

I think we need to explain based on the original code before. There is 
an asssumption here that the only other contention of this mutex is with 
the gfx_off_ctrl function. That is not true, so this is not the only 
case where mutex_trylock can fail. It could be because gfx_off_status is 
holding the lock.

As far as I understand if the work has already started running when 
schedule_delayed_work is called, it will insert another in the work 
queue after delay. Based on that understanding I didn't find a problem 
with the original code. Maybe, mutex_trylock is added to call _sync to 
make sure work is cancelled or not running but that breaks other 
assumptions.

>> The other problem is amdgpu_get_gfx_off_status() also uses the same mutex.
> 
> Not sure what for TBH. AFAICT there's only one implementation of this for Renoir, which just reads a register. (It's only called from debugfs)
> 

I'm not sure either :) But as long as there are other functions that 
contend for the same lock, it's not good to implement based on 
assumptions only about a particular scenario.

>> So it won't be knowing which thread it would be contending against and blindly creates more work items.
> 
> There is only ever at most one instance of the delayed work at any time. amdgpu_device_delay_enable_gfx_off doesn't care whether amdgpu_gfx_off_ctrl or amdgpu_get_gfx_off_status is holding the mutex, it just keeps re-scheduling itself 100 ms later until it succeeds.
> 

Yes, that is the problem, there could be cases where it could have gone 
to gfxoff right after gfx_off_status releases the lock, but it doesn't 
delaying it further. That would be the case if some other function is 
also introduced which takes this mutex.

> 
>>> @@ -569,9 +566,13 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
>>>            adev->gfx.gfx_off_req_count--;
>>>          if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>>> -        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
>>> -    } else if (!enable && adev->gfx.gfx_off_state) {
>>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
>>> +        schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
>>> +    } else if (!enable) {
>>> +        if (adev->gfx.gfx_off_req_count == 1 && !adev->gfx.gfx_off_state)
>>> +            cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
>>
>> This has the deadlock problem as discussed in the other thread.
> 
> It does not. If amdgpu_device_delay_enable_gfx_off runs while amdgpu_gfx_off_ctrl holds the mutex,
> mutex_trylock fails and the former bails.
> 

Ok, but now it creates a case of re-arming the work item from the work.

TBH I didn't understand the problem on having to use _sync itself and 
not cancel_delayed_work().

The edge case you mentioned for a cancel_delayed_work looks like a rare 
case

amdgpu_gfx_off_ctrl(disable) gets the lock
amdgpu_device_delay_enable_gfx_off - waits for the lock
amdgpu_gfx_off_ctrl(enable) gets the lock again  (this has to be 
matching call for the previous disable)

This scenario looks highly improbable as in general we expect some other 
work that needs to be done done between disable/enable.

Thanks,
Lijo

