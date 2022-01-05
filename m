Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EFD4853B6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 14:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343310EF30;
	Wed,  5 Jan 2022 13:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9C810EF2F;
 Wed,  5 Jan 2022 13:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OAfq0FhAPTO4LVuFXD/w+4Js+eQwrvPvvxKGwhwdkPBo8/hJSrIbim27iMxE8/frKsxmWZAoXjfC1Lss2YCz5+q5fgAPZWR7Zad1RBrnO3pJO0pknqT+dQKt6/59rwJZeNwwHufEJHOBrqE0Rii3bTBaX4dPgXxKWGVbJvMhFMmtiBoyqFOZhemMQjS0MRiMK6AFGUKPjRTTQfd8jJHuYdZMKIh+ls8okgKm3pmn9UknsK9lz4xx8YpDJOqynIbpkvLoEWbn63w34MoMTOcJ9lLWxoyIUbHEWOB5c8cp+qJKGceZScW1NTfY2JvG4ASXvEqKAdsCWuQCokTb6TwvBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foEXH20zA9qonaX4nxGw7RFH3l4qgDlr1BvNPHIZcRc=;
 b=I7KTTH89U71yWkPlbJBRdN4oSxf1JMuyndGhMjrQXBWRVd712KKj9W7zRFI6aaRdOqG1Q1MqvRL1hww5eIoLMfi808XDMcwHdjKQTFkNq8afRcUG85JOTYWJpdcIb/JxKHNjrOxeUJOPskoXkTluGnH+mH/fHMZFMY8aV/h8kxxpNru/6QJ0W5JogHcrFRNVbWfs+pNCm+GFszj9v8IPks9SbjYTR/YdvLtkswAMps/6dtNWREGuAOf22KP2v3b2onlmZoz0gdv7znzFwa+QRGLCeIsziUjb0ZmBzWhgUcUWoY70cjAwdNEq9+qJy0U89G6nMLo6wcAgZdlCJbV5/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foEXH20zA9qonaX4nxGw7RFH3l4qgDlr1BvNPHIZcRc=;
 b=ldQ0GOHx1s0MrVIKfB92jvynTdkMEFPZsmi5f+rAF2FHEqI/Jji9nSpaBp08/MqgWdtTRk8cusKaqPyU1chOeCUEbLGnY8gM28v7hSLaHIn9Y8ctGMFAmbbjRj4XmmhOkKyZ348+LCzzoobUlYxtCQAqSbTrWfKAm2ddTrwSf24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (2603:10b6:4:5b::9)
 by DM5PR12MB1595.namprd12.prod.outlook.com (2603:10b6:4:3::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14; Wed, 5 Jan 2022 13:41:17 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::7597:2d5e:826e:7ded]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::7597:2d5e:826e:7ded%11]) with mapi id 15.20.4844.017; Wed, 5 Jan 2022
 13:41:17 +0000
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
 <55065993-0e8d-30a5-b08f-733e5ba360b1@amd.com>
 <6be71531-40f1-fcad-f54c-03f6e14064f9@amd.com>
 <6f64e1d2-eec5-04da-2497-9ee2e7dfcf12@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <43141c5f-6bbc-597e-d8d3-d9eb3069f66b@amd.com>
Date: Wed, 5 Jan 2022 14:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6f64e1d2-eec5-04da-2497-9ee2e7dfcf12@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM5P194CA0016.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::26) To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 419e9379-ce5f-41b8-4269-08d9d0510c3b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1595:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB159503A0A58E526088E28B39834B9@DM5PR12MB1595.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NpNudMwTAxM74AGm6gtaR6xxxCLDPdj2avgDAo52FbgT8vln2moNyrjRFH5hW1uX8B6KlNGWZpMc4crEmGxgmqRI2bT8Yx+TtbYJwEn6KspK3Xs/odBMcqhaOfjV1lv/WDhQ6UF7dYs46EQQ6mpuJSPd8DOSrv+qGU7xcnstuq+PKsLru08GeHCHO52+3ylOmvccLf0XPIC7R6Dxm7d9qy5QP2Q7zKHjJmgqvvmk808XctdlBozQf8FrATcQktPQU7CKJdPq6mCfEISwbCbvpcfVwu8pBNxyywZekGgr1oSG9bT+4r2yiu0VheWw7fUD1y+J5KApFThA8UKyyOCAkvN+IR2ibU2sDE0b7DU3zZB3zmE131NP5BDm9YIh7MAlAgbwiVL7CtN7tHXNNK4woepsP8Xi/Qq/ddqxL+JsPCTOoD44jxfYSk9oEFhU4kj4NgCJnkocFhzExmbENFsFHjVwAv8E2nhr8zqOwBFIr7zAvWoePr8ph50i4jOlUkutL92v7/7I5biBbSXtYqXLCOzl37wTxBQNpicd1IMudpEQyqqwxIst7zDfJcFFYJrL3gJblmhjm23xQnCsOXl7eUiiB0rUeocfrz0RWECe2IlnblBD8Ii/NtGiZS5G4d6/++Nwr1Dc0O09sbiSGlJWL3gCouGQ0UnlOXiv3bJ594RIEPaao6OHVJifoR3Yxr94/8qtbz5ZfcspPfoBbkox5jcfg2EGoUo/Ee3a4xRDyMuInsgMtwO1+SkKcoKz4O5d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0187.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6486002)(8676002)(66574015)(5660300002)(508600001)(83380400001)(2616005)(110136005)(38100700002)(4326008)(6506007)(36756003)(66556008)(53546011)(66476007)(66946007)(86362001)(31686004)(31696002)(6666004)(186003)(316002)(2906002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDdBZjJNbnBrcmRtdHRVMHd4T2lWNGo1RU5YT0c3dldJdGJKeUN0amZJNXBK?=
 =?utf-8?B?NFU2dy8vQlpBSnFtcGhjUTFmWWRPTTA2YlFzbmMzaTNEWm43TDhPOWVMeXps?=
 =?utf-8?B?eEFYZ1U4K2JTYXkxM2podEtneTgyUG5pVjdhQXBabFJUOU4yYXp6UlNzNWtq?=
 =?utf-8?B?Ty9HMjJTeSt3T3ZEMWlGTnJkcXQxNEZISVBtNVJ1T21JRVkwUXg5LzIxTmdF?=
 =?utf-8?B?Q2FmejMwMlhZajFJMDVjT1JtazJ4RURER1J6WGxidm9abGtGbnFkbmFYTzZs?=
 =?utf-8?B?MnRHSjd0VnFvUncwcGJ5U3ZBVXJTSnhQRjlTdHRQMHQrK05NYzk0SzhpbHlj?=
 =?utf-8?B?VUx2OVlUTkw5U3VORDFIYTRMTGNTZU0wY043SXBQaEMzWGpON0RBMUVpaHFE?=
 =?utf-8?B?UzQyT243Rlk0RUp1R25uNkowVEFwUUllNlozUnVuS1N1R0pWYmxHMmxyNWo0?=
 =?utf-8?B?a3dtYW91cVk1bFhrZmRCOTlHUWdIVmFNV2xDdDJ6TklHWUZsbjYzRVhNdGlO?=
 =?utf-8?B?bXN2bVJsL1FycFlxTWUvb05EL3dpbElqRjZESnUveGkwMVpXeEo3STVNcmhw?=
 =?utf-8?B?aWdBTkxkaFZtNjMxYjlEcndJWnZHM3laUU5BMDdWYkpra0xMaFVvbDNhQ2VT?=
 =?utf-8?B?aDRISWxuMUhzbDVHU01hMmtreTZaWStjMXUyMllBbFV6NHViaWRZK1NSdll0?=
 =?utf-8?B?OU9CVzJmMms0MEVSeXJTU0VQbXowTTA0cHA5MUZHWWJrVHRTNHNPbVRyOU5l?=
 =?utf-8?B?TEpZbmtubHpNc0ZIaTFjNEVhTTZnZ04xZnpYbkhKUGFvQjRhRWZSTS9pYUx1?=
 =?utf-8?B?aUhFUi9oYWEwa2VDM1Vnejl5am56MnI5enRFWSs0amJaV0x1OGZYS0JUamZR?=
 =?utf-8?B?SWVNaHFzZ0U4UWRobG5mMG5mQU1ZZDFINVlnQVd2SzhkemwvS21nZlJmMThk?=
 =?utf-8?B?cTNuVmJIK1FtTG54bFpVYmNGZSs5b1o5MWIvMkUyQjZudE5hWkttY3dHNndn?=
 =?utf-8?B?L0Y3U1FJbGF6QnA3VTAxanNVcjhNVTd4U0JucnpabVBrYUNLc3pjejVYS3By?=
 =?utf-8?B?NGlvYXF1Ui9kRCttVVpjc1E3MStua3FaOG13alFKcjh5WklLV0xBbGdZS0hy?=
 =?utf-8?B?VVNpN2dZV3kwQVBWMFhRTU9SRUhhb2ZSNEJic3N3d2QxVnNlaUNUbGRpRmF0?=
 =?utf-8?B?M0Rocnh3YXZwdVU0SVFZek4wc2Y1ekVNY1lPMG92ekZJWWFDMXNBZFp4Y0V0?=
 =?utf-8?B?eGxBZ2hLb2YvaDFEL1BSaGc0ZUIrVTZZTlJjSnJ6RFA2QW42ZEpnV3RLTGI4?=
 =?utf-8?B?YytDVE1yQVdxRCtOYlpmTnE3UlBnRTcwbjhmOXNJZ3BIOG5tY2VkMHl3dHRO?=
 =?utf-8?B?bmluclY1bGdIaWVvU010NjZDdTNqRURPeXVTbitFYzdmL3hmcWhEWEVDNG1o?=
 =?utf-8?B?ZkgyT3hyUVN5OHJZMlc2V0V2MkJKbnhuNkV3T1lKaU8zODYwRC9Zd1ZwNFp3?=
 =?utf-8?B?ZENDLzNWUUNMNGp6bGVsemlQSzlBRVExUzR4Y09XczhSa2ErdmVGVlhZZUY5?=
 =?utf-8?B?T3FvNnYwUytaRTVRV1QrbnpsaFc3dEdtakJHckVjcUNXVG1GTFlSWjZSYzJ1?=
 =?utf-8?B?d2RlMGlUZVBxVkFlUjErNUN2Uk5uMFhoSVFMVlJCbmNGKzRwNnBtckdXY1Ew?=
 =?utf-8?B?ems1cnlTZDNVNTNQdEpFNGh0WXZiWmxmOUxOVDhuaWhsOUV5RzRZRkpTcUIw?=
 =?utf-8?B?V0lrQW4rVVo4UmNKc0cwUHBCOWI3VG9lQmxIRi94S2M2SVQ1dnhKQi9nR2NQ?=
 =?utf-8?B?d0NoNm40L3N6TS95QXRwTzBlVjNrTzJoa2dRQUxtRnQxcS81eC9lYmtQTzU4?=
 =?utf-8?B?bDhISkdiV04yT0haTDFpdXQyMkVQZ2V3REhiNkQxY245Y0tRR2xvSGdaTHpi?=
 =?utf-8?B?SDNNK2o0bHo4VDFDeVdraUJDbFNDelNjSjY0Sk5nUWZ6bTBkT3ZXWjlBSitt?=
 =?utf-8?B?akI5eC9qSGZBWlNEcWpHcndDemNpb0dZSHUrV0JzRDJpTnZlTTB4c0R2Y2Nh?=
 =?utf-8?B?QWxDMEFiK1cycTY5eFpKL2N6SWswOXJNUTNNbVpMT2JQeHVFSUR1RDE0cXJq?=
 =?utf-8?B?ZXV0R2IyaWtGTlY0K0REekh6aWtuakVIUEQ5b0FiSmIydEk2YjVrdFZPN2sr?=
 =?utf-8?Q?f8f0Q5lPQ2mSYrXIZvqsZYU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419e9379-ce5f-41b8-4269-08d9d0510c3b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0187.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 13:41:16.7024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8cQ4nQyknEZoS1g30vT3F3TsCsiAKaaSk5fX40+d91N3AvtVjhBHxIdPKYBEapsa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1595
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

Am 05.01.22 um 14:26 schrieb Lazar, Lijo:
> On 1/5/2022 6:45 PM, Christian König wrote:
>> Am 05.01.22 um 14:11 schrieb Lazar, Lijo:
>>> On 1/5/2022 6:01 PM, Christian König wrote:
>>>> Am 05.01.22 um 10:54 schrieb Lazar, Lijo:
>>>>> On 12/23/2021 3:35 AM, Andrey Grodzovsky wrote:
>>>>>> Use reset domain wq also for non TDR gpu recovery trigers
>>>>>> such as sysfs and RAS. We must serialize all possible
>>>>>> GPU recoveries to gurantee no concurrency there.
>>>>>> For TDR call the original recovery function directly since
>>>>>> it's already executed from within the wq. For others just
>>>>>> use a wrapper to qeueue work and wait on it to finish.
>>>>>>
>>>>>> v2: Rename to amdgpu_recover_work_struct
>>>>>>
>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 
>>>>>> +++++++++++++++++++++-
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>>>>>>   3 files changed, 35 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>> index b5ff76aae7e0..8e96b9a14452 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>> @@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct 
>>>>>> amdgpu_device *adev);
>>>>>>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>>>>>>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>>>                     struct amdgpu_job* job);
>>>>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>>>>> +                  struct amdgpu_job *job);
>>>>>>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>>>>>>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>>>>>>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> index 7c063fd37389..258ec3c0b2af 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>> @@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>>>>>>    * Returns 0 for success or an error on failure.
>>>>>>    */
>>>>>>   -int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>>>>>                     struct amdgpu_job *job)
>>>>>>   {
>>>>>>       struct list_head device_list, *device_list_handle = NULL;
>>>>>> @@ -5237,6 +5237,37 @@ int amdgpu_device_gpu_recover(struct 
>>>>>> amdgpu_device *adev,
>>>>>>       return r;
>>>>>>   }
>>>>>>   +struct amdgpu_recover_work_struct {
>>>>>> +    struct work_struct base;
>>>>>> +    struct amdgpu_device *adev;
>>>>>> +    struct amdgpu_job *job;
>>>>>> +    int ret;
>>>>>> +};
>>>>>> +
>>>>>> +static void amdgpu_device_queue_gpu_recover_work(struct 
>>>>>> work_struct *work)
>>>>>> +{
>>>>>> +    struct amdgpu_recover_work_struct *recover_work = 
>>>>>> container_of(work, struct amdgpu_recover_work_struct, base);
>>>>>> +
>>>>>> +    recover_work->ret = 
>>>>>> amdgpu_device_gpu_recover_imp(recover_work->adev, 
>>>>>> recover_work->job);
>>>>>> +}
>>>>>> +/*
>>>>>> + * Serialize gpu recover into reset domain single threaded wq
>>>>>> + */
>>>>>> +int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>>> +                    struct amdgpu_job *job)
>>>>>> +{
>>>>>> +    struct amdgpu_recover_work_struct work = {.adev = adev, .job 
>>>>>> = job};
>>>>>> +
>>>>>> +    INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>>>>>> +
>>>>>> +    if (!queue_work(adev->reset_domain.wq, &work.base))
>>>>>> +        return -EAGAIN;
>>>>>> +
>>>>>
>>>>> The decision to schedule a reset is made at this point. Subsequent 
>>>>> accesses to hardware may not be reliable. So should the flag 
>>>>> in_reset be set here itself rather than waiting for the work to 
>>>>> start execution?
>>>>
>>>> No, when we race and lose the VM is completely lost and probably 
>>>> restarted by the hypervisor.
>>>>
>>>> And when we race and win we properly set the flag before signaling 
>>>> the hypervisor that it can continue with the reset.
>>>>
>>>
>>> I was talking about baremetal case. When this was synchronous, 
>>> in_reset flag is set as one of the first things and amdgpu_in_reset 
>>> is checked to prevent further hardware accesses. This design only 
>>> changes the recover part and doesn't change the hardware perspective. 
>>
>>> Potential accesses from other processes need to be blocked as soon 
>>> as we determine a reset is required.
>>
>> That's an incorrect assumption.
>>
>> Accessing the hardware is perfectly ok as long as the reset hasn't 
>> started yet. In other words even when the hardware is locked up you 
>> can still happily read/write registers or access the VRAM BAR.
>>
>
> Not sure if that is 100% correct like a recovery triggered by RAS 
> error (depends on the access done).

Yeah, for RAS there should just be one error triggered as far as I know. 
Otherwise we have a problem because there can be any number of hardware 
accesses between RAS interrupt and setting the in_reset flag anyway.

There are some cases where we shouldn't access the hardware any more. 
E.g. we had cases of static discharge with external mining cases for 
example.

But in those case the hardware is so severely gone that the user should 
either replace it completely or at least power cycle the system.

Regards,
Christian.

>
> Thanks,
> Lijo
>
>> Only when the hardware is currently performing a reset, then we can't 
>> touch it or there might be unfortunate consequences (usually complete 
>> system lockup).
>>
>> Regards,
>> Christian.
>>
>>> Are we expecting the work to be immediately executed and set the flags?
>>>
>>> Thanks,
>>> Lijo
>>>
>>>>> Also, what about having the reset_active or in_reset flag in the 
>>>>> reset_domain itself?
>>>>
>>>> Of hand that sounds like a good idea.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Thanks,
>>>>> Lijo
>>>>>
>>>>>> +    flush_work(&work.base);
>>>>>> +
>>>>>> +    return work.ret;
>>>>>> +}
>>>>>> +
>>>>>>   /**
>>>>>>    * amdgpu_device_get_pcie_info - fence pcie info about the PCIE 
>>>>>> slot
>>>>>>    *
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>> index bfc47bea23db..38c9fd7b7ad4 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>> @@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat 
>>>>>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>>>>>             ti.process_name, ti.tgid, ti.task_name, ti.pid);
>>>>>>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
>>>>>> -        amdgpu_device_gpu_recover(ring->adev, job);
>>>>>> +        amdgpu_device_gpu_recover_imp(ring->adev, job);
>>>>>>       } else {
>>>>>> drm_sched_suspend_timeout(&ring->sched);
>>>>>>           if (amdgpu_sriov_vf(adev))
>>>>>>
>>>>
>>

