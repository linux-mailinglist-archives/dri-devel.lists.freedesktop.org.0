Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFF062DC5C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 14:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4663910E5F4;
	Thu, 17 Nov 2022 13:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4372510E128;
 Thu, 17 Nov 2022 13:11:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLLbiDsoCV34au/baSpiaJ1ORCuWl1D+Z9DPlk8Wu8ow5ro7iF23tANx4Y3U3Fvnyw9+VVOskMKyYOVfJlqOJYQGQZlG8ihp9/Fai8nl3X30Mg1JNrW2DEuvJjKlwjp1z8N+l8GuBQd45baTk0vihNXNEjcHJ/upI2HLIH1vPAtRaV8JBLvbn/uF/KpKz1DTEefgy5olu0UWpdWZ1jdoki0wfyobFaTNKvsJ36+8TlkLo5rRbwLbRuGaxJKaIM6Mp43GjMv2TDxtoBt8Z3PBuDVdsS9P7XAzXaKkzcpL576E6WA+IYZPJfjKb9caDo6KtYCIHcNcFLtBRYPHpWU+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nty7rOV9AV3fel4nUGdSsR3AiEQ1JWljvTvw9pD9t+k=;
 b=WdafDy6kVKD9WEB42JLY/FZ62lZ/hGO0zkV+0AUQn2nN+KFgiCGIxQiaitgOSBs9R3N8vKpRgbxLqUn4BXzbwQPq+Ix6npweA3yvODe5RyWRqJ5z0zNvbHVCAH/KUhJVC4VAJFi/sUkkrc1Zwf+pc/v76AFXTPExj51KL0cGWB7xdJf6utESmgVHRHxQroJ8eCBbLh+3cPmEYy3FVY7jdzGD5KY/lzA0L2F33wHswPrGjw+9wvNEKh2Mdphp6XrLEA3vTxMtIIf/Ut1KgEpbH5pTpDsQqAidYzZwKqbYY4e7IsZ4efW9a1fO9eIrzATno3yDeIVWKm8NBi5kAdPuRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nty7rOV9AV3fel4nUGdSsR3AiEQ1JWljvTvw9pD9t+k=;
 b=UU/KDwS7r99BjvGAP7KbQ93eIkMnFDPn81uRjoTTVFcGMpjW7qCQHsCe/tu1NtX3jXYpo/IW8HSPpAJi/OJ5VO7OsvEDe2J1UX0rOUo8GRwKLVokP1zQSBV4KxgvJasaib9aBrsA2ZMU+gZds0tJS788xwrN9vMzCaPmi1v+xh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 13:11:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Thu, 17 Nov 2022
 13:11:04 +0000
Message-ID: <4f5766ab-d31f-d0c8-6b1e-0c7e0fbabfed@amd.com>
Date: Thu, 17 Nov 2022 14:11:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 12/13] drm/scheduler: rework entity flush, kill and fini
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-13-christian.koenig@amd.com>
 <1b1fae07-a5c3-e982-94a2-c35ab26f0e91@collabora.com>
 <da420e53-cafd-b46f-90df-ed54e6de09a3@amd.com>
 <9722032c-f1b3-37ff-91d2-6ed965300047@collabora.com>
 <ef732036-895b-0f5c-d06b-d7e4a739541a@gmail.com>
 <74d74689-9c8e-1691-a232-c18271974f37@collabora.com>
 <126a8c1e-69ec-5068-1aad-30f5e7c3ef21@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <126a8c1e-69ec-5068-1aad-30f5e7c3ef21@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4340:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f7e78d-1b1b-4f0f-1ebb-08dac89d2eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KleXUeTT2qWqzIgXvZajsCSX+S6ZnjCAu5cM+SoF8gp1dqKq7aBQpbyv0DKFOusNKuXBTJfuDyNRSv1mr/dusLqlMMQHaBrhBGX4/WfOi/eYV65eYECrNv1c4XxNkkO69HK3kVG+yS/eYYcMaY2WIAP70JaqFAEzUBIj3+gL/7apwwpp8bcybU9dscLO3H9nqiPmuxIC3bXpHfKg0bWe6HREOgfldIEjtl/hfQPfQttNaCqVLNWlYfONzkndUlywYiaqWAwWdELjRKfxMOAgeGp0W1tZxp3Y8WHQC+tDO6pJ+2fuNRyskiMQ68sckVn/JAca25tcmxCmfR+plvA5uOATf+jvx48UwekH7emGPXYTeK2g0S9SUl8evuClyfYpDMjFFUiC4MeQoU5qcWABrzWA6aJpCbKu6/NNNirunlvP14g/fGnDs5dAJ9jidIpoDDDfdkvJzo8MgUt9T3sPgvfbiOUet8eWobRxrnmLnYOSlf5+1IeoOvSdjI1XUfA84NCxSeHCT+54Tnh/uBwLsAJSzx1fPvB5Z6Cy/zU+EBtR2VcjD02PctJPBqn9trK4ZMwlIzSid/aGEbCK9b0KHQha3GDOKScyi/rYaJOUbeV4mCGctSIfTwxs8HLKylam7oNf93hyDaC+oaqzdNzajfpv960HKtAIBRVEENn39PDiyhoYSZIvw03do+/rR2wTTDBZA7rBQRCs4raqLF8AP8Bfv+RC1umEuzWNkND/ncY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199015)(86362001)(31696002)(36756003)(41300700001)(2616005)(66946007)(66476007)(66556008)(8676002)(66574015)(186003)(8936002)(5660300002)(6666004)(478600001)(6486002)(316002)(6512007)(26005)(6506007)(53546011)(110136005)(38100700002)(83380400001)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZ3ZldwVUZjVk1kQXh4ajdXSGJFYkJ3YzUyK3ZCTEt3NlN3clVTWmlhTzUr?=
 =?utf-8?B?RFF0QVcrbTZuMGxiZ0tBaGdFdms0SE9TOE41YW9JOFJ3QW5xMGtOcG4rTHpR?=
 =?utf-8?B?aWdCbDUzUmFuNzM4MmJLT2xac1JLVFc1cFdIR1pWMXRRUE9CZFJlc3VjVzQ0?=
 =?utf-8?B?WTcxQzZCY29ReDdGejZBVk1iU1hXKzB6WHJtT3FOdUdEdmdiZkdjelhxNUEz?=
 =?utf-8?B?QUgvYno1ZjcyM2V6SVpuYlB6M2xVOVhmWmUyalgyenl2M1pNd2FveHgyWFdT?=
 =?utf-8?B?QzhtLzJ4NTI0UXBNVkJ3VTBKTnk0MGxSWDdldWhwYndNU1VlZFJkSHZmU2Vr?=
 =?utf-8?B?WVl2OGxrb2VFcnRwRm9JT2Z6eHE0T2xGa2dVcVFwbFowdkl1N0RkWVZqZ3N4?=
 =?utf-8?B?T1JOWG4wRWdUMlIzdVR2bEY1eEFvbFdsSEJaWHVFb0ZFQTFFNXh4QlZ4c1VV?=
 =?utf-8?B?SFBieFBMbXh5RjN2aHJJZ2JKa1NwZUc5aHU4cU9SdG1Sc3JsWTlUd1FxbWpJ?=
 =?utf-8?B?UFpIazZBSGY3eHlBenpuSmtEYmU5RFQ3WmM1MWZ2a0hLTjc4dlNTYVNqaEtl?=
 =?utf-8?B?TkhtL0JTZ3JRek5KYXNZQ2VUOTZkV2tjOUhCK0pGd0M1WVA4d3pXQ3d5WGNy?=
 =?utf-8?B?UWt3OGgvM2RsRmdjUG5MUncrTTA0ZURrRXJBOFY5UGsxNWQwUVE2U2lvdi9V?=
 =?utf-8?B?VHdNZ1Z5MU80RUw0UG1iZWlleUtVVDBFd2lkNytWdmtuSTIxUTQvNWNYYjg4?=
 =?utf-8?B?MEIrSmpSQkQ5Q1lFLyszYW5ObGFvc3Q4dXlGZWlNZUlWdEF5QVRobnZ2czVl?=
 =?utf-8?B?K09LK1A2Y0E3VGpKK2Vrd0ZXSnE1OXl4LzNjK3VHTGxQdGdTemVtQnNoOXA5?=
 =?utf-8?B?QytYVXU1UkdMQ2tmR3BES3J5VHk1WVVnRjkrZXdYYnl6WmFxbkhJREtOYk1I?=
 =?utf-8?B?cmZxWEhZMDFQVVdORWVoTzRGNVhCeGNScWpKRTdzVFBqbEJrUVhoVnNrajRl?=
 =?utf-8?B?UWVCOXFIRzRDQTd3aWN0a3RrUHFmS0piWUVuYmJQejF1QXp4UGw4Z3YyV2NU?=
 =?utf-8?B?OE1aY2pLZmRFZVFmRlI5aFFCZmtXN0MvYnN5NGhqdFpIVzlNazZNN2dyUk9r?=
 =?utf-8?B?S0hKR1g1eTBjSzV6NGJ1OGhsTFZwM3lMVWhVWlNjWU9HUVhoTkNjMEhaSDhv?=
 =?utf-8?B?U2svanBMT3pVNjlJNDRHaUFwTXVpL3J0VVdiaGowblhJUm83ek55Nk1FeC9s?=
 =?utf-8?B?alhkWTkxVllsK2YxWElGRkh4TzUzK3VxTXFETC84WUZtMjJYbU5oZi9wSjFI?=
 =?utf-8?B?VytYTTQ0K2Q3dG13S0o4NXVuSThyZC9CM1FWeW1tcUxYMDcwREhERFRRaWJp?=
 =?utf-8?B?Q1ZrbExGSm9yQUkxczNTMUFveFBTQXJGQ29FMFVxVjhzY08wR3N0d3F4L2Jp?=
 =?utf-8?B?cytBV2RDMWNwOFBaQ0pUd2dRdjAxR1R4MUpBQ0FVQkpoNEF1bHNiNS9meTZF?=
 =?utf-8?B?MVMvV3FjbERSV2MzcU1abVlMbm9JYm5iSEI3aWNDVmU1c005aWxrSkhjUHpK?=
 =?utf-8?B?aXVOSHJzWnRGVS9TNFR6VTR2TEVIYVpTd3ZyTmtCcGN6ZDNwYlRZVzluZlJv?=
 =?utf-8?B?a1NoNFBoSlpVOFhISXlhZ1lGV1pTWE1JNmZvTUtXbitBaHZXU1VObjhKTFl0?=
 =?utf-8?B?eXF1UmZqaWVBd3g4TmZCcy9Sb0o3cGtVbGw1ODFEWFErekpIU1B0RDVmRUVH?=
 =?utf-8?B?UVhLaGdWM1NDS3BrVXliK2hpWjNCbkNFU29DVU9YNVF0bkc5RGpTRFpxdSty?=
 =?utf-8?B?STVaVzlocnNUNmVKNkZIM0xCOW8rVW55dy9CNGRCRDBJNEF1bWpuSXl1bkNJ?=
 =?utf-8?B?dFZzQnF2ejAvemRJOG85V0lpakp3ZjI2SHBqRDh3NC9kVTRlWXhNbkdkZ0NO?=
 =?utf-8?B?SHlBQjJWekM2NGhmTytscUlOcmROT3pVUk1hZUI0Z09uT2lpYlViczAvSk14?=
 =?utf-8?B?WlFTYXkxRkV3ZHIxNk5ha3ZmNVJsZU1Rb1RHMzNMWXROWHlnWnRPYjZDR1JC?=
 =?utf-8?B?NW1NMVlVQlRYSW1PbHVLelIyTjNHbE4rKzRYcG9BYjlPZlRFcTROK3ZNV1BO?=
 =?utf-8?Q?97ayBOZeGPOaaHz7YAoLZeFMD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f7e78d-1b1b-4f0f-1ebb-08dac89d2eb8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 13:11:04.8241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d0CsSC0vI4/+PSbxE3g8sYv8kK598wT+xP/poqTOB646Iigme56Auv0CmM/ezwOz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4340
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

Am 17.11.22 um 14:00 schrieb Dmitry Osipenko:
> On 11/17/22 15:59, Dmitry Osipenko wrote:
>> On 11/17/22 15:55, Christian König wrote:
>>> Am 17.11.22 um 13:47 schrieb Dmitry Osipenko:
>>>> On 11/17/22 12:53, Christian König wrote:
>>>>> Am 17.11.22 um 03:36 schrieb Dmitry Osipenko:
>>>>>> Hi,
>>>>>>
>>>>>> On 10/14/22 11:46, Christian König wrote:
>>>>>>> +/* Remove the entity from the scheduler and kill all pending jobs */
>>>>>>> +static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>>>>>> +{
>>>>>>> +    struct drm_sched_job *job;
>>>>>>> +    struct dma_fence *prev;
>>>>>>> +
>>>>>>> +    if (!entity->rq)
>>>>>>> +        return;
>>>>>>> +
>>>>>>> +    spin_lock(&entity->rq_lock);
>>>>>>> +    entity->stopped = true;
>>>>>>> +    drm_sched_rq_remove_entity(entity->rq, entity);
>>>>>>> +    spin_unlock(&entity->rq_lock);
>>>>>>> +
>>>>>>> +    /* Make sure this entity is not used by the scheduler at the
>>>>>>> moment */
>>>>>>> +    wait_for_completion(&entity->entity_idle);
>>>>>> I'm always hitting lockup here using Panfrost driver on terminating
>>>>>> Xorg. Revering this patch helps. Any ideas how to fix it?
>>>>>>
>>>>> Well is the entity idle or are there some unsubmitted jobs left?
>>>> Do you mean unsubmitted to h/w? IIUC, there are unsubmitted jobs left.
>>>>
>>>> I see that there are 5-6 incomplete (in-flight) jobs when
>>>> panfrost_job_close() is invoked.
>>>>
>>>> There are 1-2 jobs that are constantly scheduled and finished once in a
>>>> few seconds after the lockup happens.
>>> Well what drm_sched_entity_kill() is supposed to do is to prevent
>>> pushing queued up stuff to the hw when the process which queued it is
>>> killed. Is the process really killed or is that just some incorrect
>>> handling?
>> It's actually 5-6 incomplete jobs of Xorg that are hanging when Xorg
>> process is closed.
>>
>> The two re-scheduled jobs are from sddm, so it's only the Xorg context
>> that hangs.
>>
>>> In other words I see two possibilities here, either we have a bug in the
>>> scheduler or panfrost isn't using it correctly.
>>>
>>> Does panfrost calls drm_sched_entity_flush() before it calls
>>> drm_sched_entity_fini()? (I don't have the driver source at hand at the
>>> moment).
>> Panfrost doesn't use drm_sched_entity_flush(), nor drm_sched_entity_flush().
> *nor drm_sched_entity_fini()

Well that would mean that this is *really* buggy! How do you then end up 
in drm_sched_entity_kill()? From drm_sched_entity_destroy()?

drm_sched_entity_flush() should be called from the flush callback from 
the file_operations structure of panfrost. See amdgpu_flush() and 
amdgpu_ctx_mgr_entity_flush(). This makes sure that we wait for all 
entities of the process/file descriptor to be flushed out.

drm_sched_entity_fini() must be called before you free the memory the 
entity structure or otherwise we would run into an use after free.

Regards,
Christian.
