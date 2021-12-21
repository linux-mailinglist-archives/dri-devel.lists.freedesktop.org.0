Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C1C47C38B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 17:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF66B11ACE1;
	Tue, 21 Dec 2021 16:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB9611ACDD;
 Tue, 21 Dec 2021 16:10:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VigiBZXZPEfg1HJjNQydwm4d/UdqCIJaAepEovCXaD08/uB83rek4AjYCjzjyqkDcCwO9FOl65uuLsjda+r0BJoi78J5LSk2nqcpNIY2GZkFYBTUJhZ+EINM6OpCqaXsfq6C2USlQV/r4SWq+Nc/D4yTBCbr2mPMyratGr1a906Ht3zoFBwWDCgLH6VXATCn4cfcApIwcvRinY+/1HCQBWiKzg1Y/wLFFdOu6nfmA5Octyey2VZ7o/RuCHFoFxBSBEIaNmerLDrn2QnEjIpunbXjCp9ThWhm4Xj3Qs8HUrSNawx7SNSvU6vQwmuU91W2r65XffWnGelFQQaRgNbBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3odoirF7LYdas3LB31ZESykvgPDyeod1H30EoADRg88=;
 b=YtWswpM7QTjsCEDD1N77URlNnlEc97JTEtuL5Hrjzz4eaTwws8w2uXtdx1DuQKVjkqqw7QhXiGElqKOU9ty0Skt1Hg/VsxQXrp+SD6ul6rklMKoVhMnZ7Z6tvBgjKIo3H5E9x+EEy19AlP/g7+DdDFVbSVJXI4R15OacIN9cTO2QNtg6HM5z2dsqswN4cELZ85eLiBvmD1wdJWZVQoFmOatVck/NmJzeBTe6co+6XPC4C8Zhv/ndgOazKi4yP98EN8TcP7B1MQSUJVhA+CaOoMBpSlKrRazc+6ZW+ap1eQZuu9SikkW2T5xBszTXKFTbSGDts3IKoezP94N4VHiKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3odoirF7LYdas3LB31ZESykvgPDyeod1H30EoADRg88=;
 b=OYq8nA29lw5Xbi5h4VCXS7s5m8d0H1oiEcSztbX7u54yCFECHJZeV/Q416Ij2N9Y/DLCarvWNBl+z0omSsUQ0m5wH+GDzPAsxbSHD8777dR/Xn0cRPbPgsGsIHpX0C//fWWjUjjHpCQAF4Bke8OEtsWb530EOIgf4HG5p3Fg0RU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3004.namprd12.prod.outlook.com (2603:10b6:5:11b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 16:10:33 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 16:10:33 +0000
Subject: Re: [RFC 4/6] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-5-andrey.grodzovsky@amd.com>
 <c143e561-d149-6680-0b89-2cda78ea1d51@gmail.com>
 <bfecd7e4-6848-e2ee-4e80-f394403af08d@amd.com>
 <1ba3fd87-c36d-3949-a466-17eda53a1d94@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <c24f2a42-bee0-ff77-ff84-08ec7e61e6d3@amd.com>
Date: Tue, 21 Dec 2021 11:10:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1ba3fd87-c36d-3949-a466-17eda53a1d94@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT2PR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::9) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1986aa45-8bbd-4069-e168-08d9c49c6a7a
X-MS-TrafficTypeDiagnostic: DM6PR12MB3004:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB300405E8F82AA2F74E7BA394EA7C9@DM6PR12MB3004.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXZnSxaVFmNWzc8UVGy3PO/KNdr8dd1Ixzm93fsRFM5ScSA7ZQgKCsKe8spUNAvc2Q45kWO9eJ6VMmZaeE8vONGEUn5qEZ97iU9jPZq43UolBfLIGRIF5F5+WghK2ny/UqduVRXncIV/uIkNV9qouN4IDTvQLbKXmW/vkFLXTqi5KbIJXLDyzXPjZWHV2xEoRGwcxeyRLNMgzLIDNlI+9p+dAmVWSmdb5K69EHz1r/4q3JH64sggAP9hA8e+8nbCjoZodWghKM40DeQQFrapvJO1XTANKYdKbxh0wQdaTXOwPFy0basYk61qLNT51xjMs0odTb8s22v/qTbJXZN41ew3WVE2meTy37fFrhJYsSxor5zzNjkBXPsKJ90qx4lUD3DXoFRqJQJZk7FU2D3lpfEIjnup/oB4x/c02h8csNPwivahrtMbfC53+nUokPBUtHYlnNahL3qnO8SAK/dv7Y/LhikvQWf8vPROP8GRkFdoSL5v/dLFm56fsA8SEbDbRYuwQEaGaJqB+2Ftix93UCUb0NhRpmbhxYAXo7i10dBPQaUP4+yLLS9NP39bFWxFvPS7udGIFy+3Jl5dPlJY7wGOa/qEEjMEXdy+wSUweK5VLaQ8OFc4K9Ii57v9l5gxvRBx0E6VmsWtwC6g1a/ViAzy9sWFS1u1pkbQO4IXtYuZyOW0BBFOGcVjzF0IWVdhFSWo1yeoYTLTvW8WhNYsO5M1G2QqJTTCnzc7UzU6kPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(4326008)(66574015)(38100700002)(66556008)(53546011)(66476007)(6486002)(6506007)(8676002)(110136005)(6512007)(316002)(66946007)(8936002)(36756003)(4001150100001)(83380400001)(2906002)(31686004)(5660300002)(86362001)(508600001)(44832011)(2616005)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmhURk9aaFBVNldWejFUY1hYNEFrRzZGanZWV0pOMFpMcVhoRFovOGZxbXZp?=
 =?utf-8?B?MTBOY3dCY08rZTlkSjVKSUUrU25vbVhid1dYV0Nvd0FWc0VZMUpKbnZhYzc5?=
 =?utf-8?B?QTZQdEo5VUllYXlBK3QvbTRCT3J2K1dodDExWU9OOXFRY1VocTZoTG1ubjJi?=
 =?utf-8?B?WlNPSFBKSHlkQ0NiTjBhaHgwVTI4THFianpjbW94WG5JLzlZbjZKaWVvVWIw?=
 =?utf-8?B?ZmhDbjcxU1JvdFM1WEI3WTlhcFN6SmxWMFdIU0ROWmg5OGNkZDRxMU9jdlFa?=
 =?utf-8?B?SDg4dFNSUFgwNU9XaDM1cUEwQVNzdFptb2Y5Y01jUWxRcnNlWDZVZmMxeU5t?=
 =?utf-8?B?cm9ZWTVsRi9yczQvRjZyNnVvVG1CWnpVMzZHYjJuR2ViM21pQzk3VHc5UVVG?=
 =?utf-8?B?UEl1ZVdkVWJXVzRXMFdLS0lNZlE2MjV2ejA1S3hQZzlNaCs1NWlzOWxzWWti?=
 =?utf-8?B?NW84cWI2OXRramdJNnozcHlpMXVFMXpMMFFYODRCR1hOaG4yeGw2c2crOS9F?=
 =?utf-8?B?VWNxOVZJMDhSSHpOTm55eVJVOE1ZQ0tIbFBNcm9nU3dOYkdSMmJhcUx0eGhl?=
 =?utf-8?B?MytxWTJLUzZER082THBwRS9zTzVWcUR0ZGo4MU96Ymk2bW51YytyeGlyOWNJ?=
 =?utf-8?B?bng5aUtIeitySkdCbGNENHpzdzRDN1RRZE1mK3NHRVBUdVcrb0s3WWdGTnZS?=
 =?utf-8?B?RGJwTHJvM25NaE5OSmNkQ2JhcCtrTUhDTzVrRFRvNklqUS9EbmZzbTVpOWVr?=
 =?utf-8?B?VjlCOEZNY0JkcVF6dzNJOTlwRkIwUjdVdWpSaGhOd0s1NXJKS2pVam41UXps?=
 =?utf-8?B?cno4OHFKZDBOc2NEY3BrWDZxQVdxM01mWFVYTThuTVlwZFYwMlp2Y3FuUVY2?=
 =?utf-8?B?VWV5NkJGMTF3V0FnVUF2dkR1b2tmWXdVSG83MHd3M1BtQ3hKdVFIUktaRkZn?=
 =?utf-8?B?MHFEbmVGKzhlQVhEcGRodGp2M3JBTitkTm1ZbXZqa2tZbnNOS1QvbGhxcHlI?=
 =?utf-8?B?TTlpenpJM2xNbUhEeUxReGJXcy83aDNiWkd4SlpmY2VVRHF2ZGJXa0g5TGhP?=
 =?utf-8?B?SVZTVVpxMG9JUkx0eXRLOHZXeUQ0MWZScFNET3dDSEZKa3NjV0RBeFZNVDQ2?=
 =?utf-8?B?eCs1aUNsWkpMdHg1eXJxd1FucW9GaUFkbnZaTUR1cXVRT2F4T2NlRG9seUFZ?=
 =?utf-8?B?R2VJK1IyNHlJeHNhRnRLdzVxSDR3YTJwaFdwcS91dHpuS0hPUjQ5WjlEWHRj?=
 =?utf-8?B?QVZENVFzU0t4TVFjdzBQV3ROTW9CV012dkNLWWZ4L1FhbWRuRWdtc242YUJk?=
 =?utf-8?B?Q0VXY0xEaGZKVDJYbzlNdEFRbzI0RjI5SzRiWWdMVERhdFhTc1M3RmQzWW1h?=
 =?utf-8?B?WEQyeU9oWkNYZW15WnN1MVhYS0lZRDg5M2tZY3JmeEJxT1ZzNmVVKzZTSy9u?=
 =?utf-8?B?U3dPVXdGTG00bnVyV29WbG02S0pWVENMNG04TlM4QkgrdmVKN3RxWnFhUmtB?=
 =?utf-8?B?VmVGTzY0VU5MNkc5cTBKQlZWZC9KVGNHdGQrOWlWeXNsQ0hleTVoZlFFc3hq?=
 =?utf-8?B?NWY5WFJjRFFVYmM3eVAvU3YxYTZKVlJzazBlVDJIRXB5SnBwaXZyQzFraGp6?=
 =?utf-8?B?UkJLTGkrc0JhQmdhU09BaHZtdTFtRnV1TlB6YUZVOHdhd09icFFXZWdNSzB3?=
 =?utf-8?B?akRjUzVKL1BVYUw3SGdFS096dHhHSXVjN2FVMmRSUjBadDdDWG0zSjhINzhV?=
 =?utf-8?B?STVFTDJNVm0vb29qWFJ2bG9pdEhTS01oSkN1aGVzSGlLQXF2bGRiYzFqa1p4?=
 =?utf-8?B?eUdjMGhCWXZoRDlhZTlWMkkwZVR4QWlack84ek9relpGb0pPV3d0VEN6WG5M?=
 =?utf-8?B?dy91WEh0ZU1tVWVjQS9mdFdiL1c1d2dLdmtKcmpweG1WSy9mT28wQVAycHhM?=
 =?utf-8?B?ajI4UVpPMlhkYTdERUdYSENWam1iSUx3WnBzNnNLYnFrOWNqd01HMkdBdCtr?=
 =?utf-8?B?eGZIeTJqSFpOTngzMXppVStOa3VJVnptbjU0TDlMK1lZV3N4UUliRG5VUmgx?=
 =?utf-8?B?YXBMdVRQQjZHZy9pamZJSVJwVHFjM21UTUU5MjM0QlVkSHk2dmxScjNGL0th?=
 =?utf-8?B?S2oxSHpMMTdKcjZId2JUOFZaWllQeExmWDQrOHQ5Mk5tZmJJVGxLd3JVQ1dZ?=
 =?utf-8?B?d2MveEZveU0zMTBtdmNkZmt1ZnltNEp1eE53aFdSbG5CbVhRcHBaOWFnUDNL?=
 =?utf-8?Q?5AAEINQou02k2CWwrS/O9xYG0w6faUEeiDQnS9Paj0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1986aa45-8bbd-4069-e168-08d9c49c6a7a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 16:10:33.2047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jVmabRrOV0W0n+0vjvP7wZQ8f2Wlm9iWNIqFifeAQEGNA3MwXC4YdoWdsUE9nwvn+E6tX8JOmFzN9lnZ+7JaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3004
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


On 2021-12-21 2:59 a.m., Christian König wrote:
> Am 20.12.21 um 23:17 schrieb Andrey Grodzovsky:
>>
>> On 2021-12-20 2:20 a.m., Christian König wrote:
>>> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
>>>> Use reset domain wq also for non TDR gpu recovery trigers
>>>> such as sysfs and RAS. We must serialize all possible
>>>> GPU recoveries to gurantee no concurrency there.
>>>> For TDR call the original recovery function directly since
>>>> it's already executed from within the wq. For others just
>>>> use a wrapper to qeueue work and wait on it to finish.
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
>>>> index b595e6d699b5..55cd67b9ede2 100644
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
>>>> @@ -5236,6 +5236,37 @@ int amdgpu_device_gpu_recover(struct 
>>>> amdgpu_device *adev,
>>>>       return r;
>>>>   }
>>>>   +struct recover_work_struct {
>>>
>>> Please add an amdgpu_ prefix to the name.
>>>
>>>> +    struct work_struct base;
>>>> +    struct amdgpu_device *adev;
>>>> +    struct amdgpu_job *job;
>>>> +    int ret;
>>>> +};
>>>> +
>>>> +static void amdgpu_device_queue_gpu_recover_work(struct 
>>>> work_struct *work)
>>>> +{
>>>> +    struct recover_work_struct *recover_work = container_of(work, 
>>>> struct recover_work_struct, base);
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
>>>> +    struct recover_work_struct work = {.adev = adev, .job = job};
>>>> +
>>>> +    INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>>>> +
>>>> +    if (!queue_work(adev->reset_domain.wq, &work.base))
>>>> +        return -EAGAIN;
>>>> +
>>>> +    flush_work(&work.base);
>>>> +
>>>> +    return work.ret;
>>>> +}
>>>
>>> Maybe that should be part of the scheduler code? Not really sure, 
>>> just an idea.
>>
>>
>> Seems to me that since the reset domain is almost always above a 
>> single scheduler granularity then it wouldn't feet very well there.
>
> Yeah, but what if we introduce an drm_sched_recover_queue and 
> drm_sched_recover_work object?
>
> It's probably ok to go forward with that for now, but this handling 
> makes quite some sense to have independent of which driver is using 
> it. So as soon as we see a second similar implementation we should 
> move it into common code.
>
> Regards,
> Christian.


Agree, the only point i would stress is that we need an entity separate 
from from drm_gpu_scheduler, something like
drm_gpu_reset_domain which  should point to or be pointed by a set of 
schedulers that should go through
reset together.

Andrey


>>
>> Andrey
>>
>>
>>>
>>> Apart from that looks good to me,
>>> Christian.
>>>
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
>>>
>
