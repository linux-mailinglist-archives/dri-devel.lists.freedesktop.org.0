Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC33485351
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 14:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EA310E61D;
	Wed,  5 Jan 2022 13:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2077.outbound.protection.outlook.com [40.107.100.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AAC10E612;
 Wed,  5 Jan 2022 13:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRg4GQ+ecinBLC8Fcq0i7HKP6bg+uW6Ai//0EZEVZXNfURNCAKQRr5qKsEp+9dZttConNVFLPgHVYbHueKNyM1dFgqxGu7h2IyU6Ry03wf7WrAZtYudTLBLjodgmYOAsPFs4mWG1jF4MLM/47/b94L4wwpH3fTPH21L1GmpnqOlzOjXhMHL6iI8cz+obC8tTS4TN6DzUDp2/vBLEcKxg13jXwy4ZwFTXdQr49I5qnOAbqX5ICK+tTv7xEOL0W+hUbJ3F+k9/nOiuhVlrARHxrlJwJg98x9xyfEjmC7L0De3JBneKc3xUVJZVfhFZs1u0nm+hrhiUhKUsf1V+IBVnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ByqvtFM0fQPTPYVV6KjdElO1/y6vCey7cwREeoFYKA=;
 b=frOTM3uRF7TrcODIguK2chpLUXsCRLm5wjg2y9hSzMChOHDLrNlTvZVwwjRiRN9q3I6yBH4y9T3hDAI7NwmlUZ0BIeEHvfNFBjdrhsxgYuYJOInmP+90IaVHqgPv6x0fzCrPlmsSZ8A41ubHJhDdCOsddqyZu4VXip7B4sMv0WE2xijYI/KPGXsWucZJd6VdLEn3ejG2Qd0ChRFasVFJcYbApW9R0eLyPcduRjSzvoS3+Gez86LdRpKW21FToLjDUHxJhDMQahfbkfNmCzt7JOQtP8RsvnpbqWk/MR5QJIflS52DkTuKAl8jOaS3AciPfgk3XuKDE6G5IRydP55SuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ByqvtFM0fQPTPYVV6KjdElO1/y6vCey7cwREeoFYKA=;
 b=5lsrCQkpa8oLsAAcK7UkvzP271291J8e3NAOSN1yE0OY7vv6BVDVOTq6GHsqnxF+FTzS3DWtpEsKap/2M+sp8s02UfHeoeUNCMuTbn07td9/221xkWEFH7bxcdQGL6MMj7sXVzlHIutcEatNS/T6I0/EN7U8c6HvO/21r4FBe+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (2603:10b6:4:5b::9)
 by DM5PR12MB2519.namprd12.prod.outlook.com (2603:10b6:4:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 13:15:33 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::7597:2d5e:826e:7ded]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::7597:2d5e:826e:7ded%11]) with mapi id 15.20.4844.017; Wed, 5 Jan 2022
 13:15:33 +0000
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
 <55065993-0e8d-30a5-b08f-733e5ba360b1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6be71531-40f1-fcad-f54c-03f6e14064f9@amd.com>
Date: Wed, 5 Jan 2022 14:15:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <55065993-0e8d-30a5-b08f-733e5ba360b1@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0134.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::19) To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81cbfbc9-9035-4127-e88a-08d9d04d7424
X-MS-TrafficTypeDiagnostic: DM5PR12MB2519:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB251914228F9E3FC5AF97977C834B9@DM5PR12MB2519.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Swa7lp6Er33u4MlkAFXZth4FHVWbzn/2xhK1UzO8XULEAWLgETjOk9ewhusfTgfVVJnPqKT7e8voP8up39ZFdmyb+2YF6b55skuLOirWsYLp62vWLXUyvN28KPG8cbZipfbPSlwQbMKawur6KFk+1pTvgGe6J4Bm3/ouSHeKDPFjXnI/O5R/384rICncORerXbLnNcwlulAi+lMv6Gl2BUFhBsFusDkWtg7gxA4fYhhoyI9esN1Vbw4DZ+5wF3u/RIsh86rU5f+iozTUE8YeShRaFq0S4wTEPj2xQ2UoZKHh1rG0RvW69fdd62qDSbgbEACYghjrFAqHbxYAJ7jXddQiEQUuAOJqMbrZV4cUX3KMIvr+BATvvzFgugGD3lJNEdP8DcE5aWX9U2qH+AWrMQFxqUPst9gPyRuBhlCA5JdP/l9Uu95woJoVfH6QqpnZelLbTnt6vA1xvUU002+9LvwQk/hCi2EvhaPwHzdDY7E7Ylduu+yNq7jv7oKf0AqgSfGBifLtjoiwA8YKKzzRCtofOSha0RhVrbcWZBDLMtvuL6cy3zWIfeZXoWp1n/c3cVPH4/SW6sNiCqPJ8ix97ZJfj8X6QaA4vNqqBKdLWt1hQhzsbBEnyklZT2Tkz0pd+uKS7cXIr52NrRqNHxHyBaaoMNxEGTUPb0lpr4h2vPjfp8xSkYOwFzHAHFxt18CEO0aBhPrIaL7aesreVtJJwPboBWNq34a2MPQIUuU632/e8OmxOBSV1kH+bDvqougj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0187.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(508600001)(4326008)(110136005)(186003)(31686004)(86362001)(83380400001)(6666004)(8676002)(66574015)(53546011)(6486002)(6506007)(31696002)(2906002)(8936002)(66946007)(66556008)(66476007)(36756003)(5660300002)(2616005)(38100700002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTlqL0MvQXdJU21FaG9zZnYrZXd6enpQK1BtbGRrTnFTLzRPdlg3MzBsSkF1?=
 =?utf-8?B?bVRKWTFqNEhYNDFxbXJ4cHR0UVBrdnFjQ0Z6S0pFVmtkZnJOaUhZYmcxL0VH?=
 =?utf-8?B?OVhJYUx0SlhUZ0JnblFybE1wdXZSa1E3THFjYTdNL3g1SEhsd216TnJ5aGlX?=
 =?utf-8?B?WjliOTJnYm53VXVHM0FZNTVmK2lCMEZKVUdGSCtrOENpYUJUcTZZdmpHM0JM?=
 =?utf-8?B?ZGRNbEUrdWJUKyt6VkFXakQzMFhmeFBsUFFCQTNrOHZEczZKRVNYZXVnTGFP?=
 =?utf-8?B?VVh2K1AxU0UvRlR6TVcyUlM4a014UU9SZ1NUKytrZmpUNEFRQlZXTkI5NW5j?=
 =?utf-8?B?V0xWYXZnMTZKVi9Dblkrb1JlU0Q3NG5EQXdQQ1JyRXFkczFQenhQS2ZHV2s3?=
 =?utf-8?B?VjE1VEN2U1g3VkI0NU9TbTJiTTlEdEc3bXpHZXJSdmFnbVF4Z1FXTGpubXl4?=
 =?utf-8?B?N2xTK2QxVTB0dmpESlhJdTN1MTNkWmlzOVYycWRLeEtuNVVxYkVDU25sSkhR?=
 =?utf-8?B?V29STXV4ZXZxUTRwcjk0QUdNY0VxMmltcmdYKzczb3BLdEUyMzAvTlpkbVlJ?=
 =?utf-8?B?U2VoQUxaUTBadUhHeDRQVXkraWFyN0Z5cmp5R3pYcDZQT2h6ZWxFaksxWlgy?=
 =?utf-8?B?endycHNzTmE1RzVKYm1qVjV0NHpoM0V2WTNTb1FMcWtlajJwY3VzdkllN1lx?=
 =?utf-8?B?OGFRR3E0MUs0T3BsWjFCeTNrUEdySUVuaHB6RU9ueUZFSmpmQUtzY0p2cmNs?=
 =?utf-8?B?d29XUzRRQnJwRXNLcFlSeGZya3dnK3c3a2pBbnlkN0lJekVhL01DVVpHcDdO?=
 =?utf-8?B?V2VHeS9hSjVJM21BbitCZXZWS0t5bGtCR0ZzS2FEMmlaSmgyU21JSERobWgv?=
 =?utf-8?B?YnRTK09ray9rbmVWWFZtWXZOaGNzQXAwNnBteTNKdjZxMjE2b2Zha3lvQnVX?=
 =?utf-8?B?TFh3RStLWnhzOS9RcmpqK3ByYjRWMTlwMnlCbVlpRmJhY2p0YUROOTZ3Q3FB?=
 =?utf-8?B?WEZOMlVKYVgvQU5tR2wwVktMdmVFNFpNVThHank2STYyYWN4VlR0V0QrQVJq?=
 =?utf-8?B?Mm5GdWVrM0Y4MGJHWUpxcGNrWjZzWS8welI0dnkyZkJlWmtpMGU0NXhmUXJG?=
 =?utf-8?B?WWwyV1FYb3ZFcnpLTmRmT0tZeGsrcnQxN0l5RkVKWUhYUVllTllLN21rVmRR?=
 =?utf-8?B?cm52WFJBZkFFMjR5L281MEFXallBakl2SGZ6TW51TjZ4V2RKaWpYTTlDWTln?=
 =?utf-8?B?OFNGVThRSkdPbStTQnJCSnRvVnZzQnlQd0JNM2NkRGI5eWdML3ZHSktMVVFB?=
 =?utf-8?B?S0JjT1U3ZjJaWmZoaXNWbGlMZ3huNlFZSVlmNUxheVV4Y1FsdjJzRTVFQ2E4?=
 =?utf-8?B?M2VzS2pYU0pYTDhSM1NFYmxxOU1XSlE5V21UUVEvZ2s5UndxV3JSZnkwVmQ3?=
 =?utf-8?B?TmtXMGJEMlFXd0YwS0ZMR3h6UGxCY3liRXQwajY3NXNXVlhrS0kyQWtPZ01Z?=
 =?utf-8?B?UEtaUi9zQWtmT253RzBNNW9IR1hUU3ExVXVSb1g0Rkx3V1lSTFMxRWFhU0J1?=
 =?utf-8?B?ZWhnVFhKN1ZvTUFwamJEWHNHeVRhUzBCNDRDc09QdkFCSW9LOUpLODMvVUxa?=
 =?utf-8?B?cHB6U04wSnFYR0RuQzg1Ym40NXZEaU5ITXAzYzZBMFVOek05L1YrdGNmd0ta?=
 =?utf-8?B?Y25EekFYdlZpbXZNaXVDckUrQnVFaGFOWkNSMTAvOWFhVDdualErcEY4bnVL?=
 =?utf-8?B?RWpPNE5Lbnk5anBHOUdxemhYM0kwbTIxK25vZ2FldC95UFJOUWM0M0JnbUJO?=
 =?utf-8?B?SGVpR2krY0lzNGFPNS9OeityOFpRTGJzMStmUHA4bm8yanUrQzBkVnNaYlMw?=
 =?utf-8?B?V3psb3JmOCtYdGlTa1F4T1pMRFVJeDlETFhQSXpIKzBFNUNFWCtIOTVWekVI?=
 =?utf-8?B?c1o2NDVlbmZMQ0ExVnYxQmVZR2dLWVRLb0VQRFk2VEVwcnl1eXduemhKdkFo?=
 =?utf-8?B?Q2t4Mi95dWRmTEJlY1c5YUFPVEdJRWdNUENQMWY5Y2djRWNZWlFXYm9oeXl2?=
 =?utf-8?B?cHQvdXdrZ3IzYlhZSkVkTFA0eU9ZeEN0NWpHdWxmVWVGSWtqUUp3K2RXTDZs?=
 =?utf-8?B?ZmFEQWlCZjFubDFyaGVPSkVRMk41eDFvS2lvTWxpcVkzNVpCWjJnUEdHM21N?=
 =?utf-8?Q?Hk0FYB6gyaZHsEp/BSaN7ks=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81cbfbc9-9035-4127-e88a-08d9d04d7424
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0187.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:15:33.1302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNzAIvNTxZxkfeo1ckioybOozF6zQiwokDAUpChK3cDvYBN8GjpLoHlKCa2/LpWz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2519
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.01.22 um 14:11 schrieb Lazar, Lijo:
> On 1/5/2022 6:01 PM, Christian König wrote:
>> Am 05.01.22 um 10:54 schrieb Lazar, Lijo:
>>> On 12/23/2021 3:35 AM, Andrey Grodzovsky wrote:
>>>> Use reset domain wq also for non TDR gpu recovery trigers
>>>> such as sysfs and RAS. We must serialize all possible
>>>> GPU recoveries to gurantee no concurrency there.
>>>> For TDR call the original recovery function directly since
>>>> it's already executed from within the wq. For others just
>>>> use a wrapper to qeueue work and wait on it to finish.
>>>>
>>>> v2: Rename to amdgpu_recover_work_struct
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 
>>>> +++++++++++++++++++++-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>>>>   3 files changed, 35 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> index b5ff76aae7e0..8e96b9a14452 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> @@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct 
>>>> amdgpu_device *adev);
>>>>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>>>>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>                     struct amdgpu_job* job);
>>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>>> +                  struct amdgpu_job *job);
>>>>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>>>>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>>>>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 7c063fd37389..258ec3c0b2af 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>>    * Returns 0 for success or an error on failure.
>>>>    */
>>>>   -int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>>>                     struct amdgpu_job *job)
>>>>   {
>>>>       struct list_head device_list, *device_list_handle = NULL;
>>>> @@ -5237,6 +5237,37 @@ int amdgpu_device_gpu_recover(struct 
>>>> amdgpu_device *adev,
>>>>       return r;
>>>>   }
>>>>   +struct amdgpu_recover_work_struct {
>>>> +    struct work_struct base;
>>>> +    struct amdgpu_device *adev;
>>>> +    struct amdgpu_job *job;
>>>> +    int ret;
>>>> +};
>>>> +
>>>> +static void amdgpu_device_queue_gpu_recover_work(struct 
>>>> work_struct *work)
>>>> +{
>>>> +    struct amdgpu_recover_work_struct *recover_work = 
>>>> container_of(work, struct amdgpu_recover_work_struct, base);
>>>> +
>>>> +    recover_work->ret = 
>>>> amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
>>>> +}
>>>> +/*
>>>> + * Serialize gpu recover into reset domain single threaded wq
>>>> + */
>>>> +int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>> +                    struct amdgpu_job *job)
>>>> +{
>>>> +    struct amdgpu_recover_work_struct work = {.adev = adev, .job = 
>>>> job};
>>>> +
>>>> +    INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>>>> +
>>>> +    if (!queue_work(adev->reset_domain.wq, &work.base))
>>>> +        return -EAGAIN;
>>>> +
>>>
>>> The decision to schedule a reset is made at this point. Subsequent 
>>> accesses to hardware may not be reliable. So should the flag 
>>> in_reset be set here itself rather than waiting for the work to 
>>> start execution?
>>
>> No, when we race and lose the VM is completely lost and probably 
>> restarted by the hypervisor.
>>
>> And when we race and win we properly set the flag before signaling 
>> the hypervisor that it can continue with the reset.
>>
>
> I was talking about baremetal case. When this was synchronous, 
> in_reset flag is set as one of the first things and amdgpu_in_reset is 
> checked to prevent further hardware accesses. This design only changes 
> the recover part and doesn't change the hardware perspective. 

> Potential accesses from other processes need to be blocked as soon as 
> we determine a reset is required.

That's an incorrect assumption.

Accessing the hardware is perfectly ok as long as the reset hasn't 
started yet. In other words even when the hardware is locked up you can 
still happily read/write registers or access the VRAM BAR.

Only when the hardware is currently performing a reset, then we can't 
touch it or there might be unfortunate consequences (usually complete 
system lockup).

Regards,
Christian.

> Are we expecting the work to be immediately executed and set the flags?
>
> Thanks,
> Lijo
>
>>> Also, what about having the reset_active or in_reset flag in the 
>>> reset_domain itself?
>>
>> Of hand that sounds like a good idea.
>>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>> Lijo
>>>
>>>> +    flush_work(&work.base);
>>>> +
>>>> +    return work.ret;
>>>> +}
>>>> +
>>>>   /**
>>>>    * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
>>>>    *
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> index bfc47bea23db..38c9fd7b7ad4 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>> @@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat 
>>>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>>             ti.process_name, ti.tgid, ti.task_name, ti.pid);
>>>>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
>>>> -        amdgpu_device_gpu_recover(ring->adev, job);
>>>> +        amdgpu_device_gpu_recover_imp(ring->adev, job);
>>>>       } else {
>>>>           drm_sched_suspend_timeout(&ring->sched);
>>>>           if (amdgpu_sriov_vf(adev))
>>>>
>>

