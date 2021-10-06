Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96266423A0B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 10:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFBD6E5A1;
	Wed,  6 Oct 2021 08:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2BD6E5A1;
 Wed,  6 Oct 2021 08:52:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQLdaXJWQ42C7HYrPJWy3iRsKAk8suw0JlA3WuOkujNVJHUMC9M8UGF77EtPzwuOskg5orVyF2Xi/xn/xTpq2+WrpGzCSW7Z4qNxVv2gCFpexk4MvYlJwILk2M7FDPjdFJlK/I/KmmQQRxDaDZoFLe5JZyY2ma1dtXaf7l6rcv75nqv3V+FzJv357ndINYXMYZ08ti3nFOgkRcWaZ0WyaHjVbI1sFIDKvgAPXbVvivLD9r2FhP1l7mJlAa10CMZIdBznUv/iTVr8OdBj8R2AG7AiNhfyX8mD9JAVXxA1/k1EX34FyoZ0oliv3ctDfhvR/QAStEyNrggS3ro0DMQr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lxqa/OSh1pEP/NuTg+3n457K59s59HdS4YeF23kJFQQ=;
 b=WYFY9px/tVe9EkDHNFQUB76qxV7m2JMzoxiIBMUt50NMU+Nzn6idYqmWQqWSkTisjP8ETB3AIa2YmiBjSYR1PdN+DueUiAu2agj/mzfawbAoRhPvOTtpYtLqe8LJpHwBuXj437mS7ga2KqRM0/VT5wNvaS2HmwimISJt66ht4ZLuZKWlStB6LCmc9x755npQAyYWuvlIBLA3Krf7y7fK5+wldq4gY+eJY6tbF96qEMuy80U4wjDmDBhDsEEQqFKi6X6qPeLhcngWWOTAvSUILVj6xXECrBx8h3z/m9g9LZVCRw53wNcEYF4VNSy2a2vX2XGY11LdGb4g2RQnoRIzrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lxqa/OSh1pEP/NuTg+3n457K59s59HdS4YeF23kJFQQ=;
 b=0z98hU0wyZEhRjPL9ljEL8BbsncFnYb6yfapDCeV+gk8VqLbAKwxyxCJRSGPmAbEhFCI8HPWIZYtEmNrm16YcxRicXKXkj4kdQtdrspR1nhmt82cQ6vfyg/3MexgEjWVdjvK6pUUFPRA6EK9byc3DtEcpoLK6oY4CodQCnoIsms=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5463.namprd12.prod.outlook.com (2603:10b6:8:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 08:52:41 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%7]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 08:52:41 +0000
Subject: Re: [PATCH 1/1] drm/amdgpu: ignore -EPERM error from debugfs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: shashank.sharma@amd.com
References: <20211005131115.25595-1-nirmoy.das@amd.com>
 <ab673b77-e8b7-94a4-76f6-588ad9e472f7@amd.com>
 <182c1454-102e-cf2f-80eb-09baa57f8e82@amd.com>
 <45342056-8e15-bdb0-0237-d11476bcc8fa@amd.com>
 <af8ba141-1581-4b96-4ef4-bc82111e213d@amd.com>
 <36880798-83c8-5566-dfe8-a18b9c4783f6@amd.com>
 <84a62bf8-65e3-0b3b-91ef-bef5f4060601@amd.com>
 <43403acf-d6f6-ed4e-2954-f9cdc7ea88b0@amd.com>
 <a9053dbf-a8f6-2e00-73fe-5e1e6cd0bfdb@amd.com>
 <5b66b08a-44ef-eaac-9af0-a7114d7162ba@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <1a7186c5-df9d-a2dc-95f0-f9f5f034b8fa@amd.com>
Date: Wed, 6 Oct 2021 10:52:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <5b66b08a-44ef-eaac-9af0-a7114d7162ba@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM7PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::20) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
Received: from [IPv6:2003:c5:8f21:1d00:5c98:f8:60b6:e70a]
 (2003:c5:8f21:1d00:5c98:f8:60b6:e70a) by
 AM7PR03CA0010.eurprd03.prod.outlook.com (2603:10a6:20b:130::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 6 Oct 2021 08:52:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25fcc55a-db30-4eb4-c764-08d988a6a7cc
X-MS-TrafficTypeDiagnostic: DM8PR12MB5463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB5463A9CB8D6D82330F3EE6BA8BB09@DM8PR12MB5463.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QAw18Fb/sFPe0mrSchujk6HLSsUWI+n2fEh79oqLkMpxP6xvX62Y2pY1bCxuzzk07EJWvwxvdDL4DHyGGAeVMEhoWJhOfEZDt9KYuUHmx6uwi1u3HwzthOG6NUBhPqrtjO804uiUZsemy0YhNw48CSsDd2muCs1A4+CJjKUXeHD3Q3tB+WhqXXpoLHdlk0dYnkGr4kYcToVy3StcH0IR3WLoOwde8tXHYeKI0PtxKVcwDH35a97SCXbJ+koNtUZGpvdH7XbcA2pVJlAAhrnqPOV0Xr91j1bibq2KNKQG04kMDW+sfo91Ll8wQWPm3QdNJ5aPXvSr9kQJnhYr6xlNy5pPyzfBm5ikERtZM3YdSW1JhziEewX5EPm4unqva7OZb1+uv+wJbjd2OT+uyeftyVi+QiPikNZ3uOgnbYi8AAMl0EsDEw7rimN/623mSBAxSt43qdDsC7H2wSFLeIZpAcraUdFCQ5rNYivu9Ix4fsJqStV+AztYtjkDL6084uPyne1ND9MypOMeUqtWUVXGRe1xSrbpyr6kEWP6KIVIsg20SKlfvp4By87gzpizKIx8dZqPTuDPo4rA3+CsVPyXA5cLKWQxCeB7nqpI0obekmchVQfdGg0/frVacgC0tizNaM+lSpyqu+46yhNlLG66o+JNLtp0p3M+WZ8n1mF24CBB378BmzRDg7n0AfHEMrlPMIOr6QfJR7qebpga95tQd2Kq4iKJ7IpQRnx8WKMDjKg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(4326008)(53546011)(52116002)(38100700002)(8676002)(31686004)(86362001)(36756003)(110136005)(316002)(2616005)(2906002)(8936002)(66476007)(66946007)(31696002)(5660300002)(66574015)(6666004)(66556008)(83380400001)(6486002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmhXbkpCejRZalQ4SCtidnliTHgxOTN5UUlVN0tmblFlM0ZpWUVvQjFPckZp?=
 =?utf-8?B?bXJZTXVOUi9kMGhtNVhvRHlESmc1SjJWa0JRTHBoMVQ1bmpDdE9LdXI2L2E1?=
 =?utf-8?B?cUhQV1AvSXVBWTJHSkVmTDh5VjdHN1I2VEFRbjljVFhJeVdoUkNOVzlTR01P?=
 =?utf-8?B?U2U1QlU5ZTU1M1grMmJYVGZBN1VKWnpiZHdBQVRsRm1POC9INzR1bTJPMXg2?=
 =?utf-8?B?K3FhTnJvaUROQUtLV09sb3BRclBNbTBzV05iRE10UjhqbVd1QzF3N1JwR2Zu?=
 =?utf-8?B?K0dZeU9UMG9HY2ovY3o4K1FNMk51U2hiTFZIaFBBdnUrdkdUcDh0ZG5INTNT?=
 =?utf-8?B?UG9qZWVSSHJCcit4cWtUc1Uwaytra1pvNit6WU5WY3QxZFFGN29IWXdwdEky?=
 =?utf-8?B?NWE2T2lBTDNzbmh2VEhPaFZLSnRTZk5Fa3hyL1FzOGg4aHJ4N3lpNGUvZjVT?=
 =?utf-8?B?ZEtDY3VTb2VGRUdZamNQdjFuZFIwWENuUFI3OHJEU3Byam5lSU9OaFRzVjZl?=
 =?utf-8?B?NVUxWVR0MzdtUGpISDgwbmxtallwT0FZWWY1blBudFZTb1BWcEt1Z2lSczNL?=
 =?utf-8?B?YndQc0dNVGpMOHRoV2Yrei9IcWFIY2JwNlNwSjVQa2RXUGYvWWlUdHpoNjBP?=
 =?utf-8?B?RklQYmxUZHptUUFCMFBjQWVPeE9VdUhLeGNMNk5VNmVDdG54eUZSejJQL1Jh?=
 =?utf-8?B?ZDRKaERGQVNQVEo0bTM1dFFvaW05MmZ5b3RnKzNYVURPdTRGdW5VWlI1SzJp?=
 =?utf-8?B?Q3h5MEc5SXgycUFaUnZhbGVEUVJlTmxleE1sYXFaRjZBNURNMzVKR3ZxaEFi?=
 =?utf-8?B?YlpFdEpYNEIyWjUvcHUwSVloMENRT3dNUVpSOE8wRkV2Si9UbXpldGZXTkFk?=
 =?utf-8?B?SzhIL0d2aHM5dXZjaDBjQXMvUVR5Q0Y4U255Yjc1T0FJSjN4dE00Q0RnN2xu?=
 =?utf-8?B?QWlHZXNQMk9xZGdCL1FmZ1crUG5hYVVqUFNEMUZweG9CYkFOajcvbExIdmxi?=
 =?utf-8?B?ODNOeHF6cFN2Yy9ZUkpPTjlYSHZxQTN3SldpOXBRZ1cvOWRjMC92emVHaHll?=
 =?utf-8?B?U1JOSHJoUUxDTW1pVDFqWHZ5V3FzY3pwS1RPcmV3NVdtS2JzdlZRMDZQb0Jm?=
 =?utf-8?B?emtQMk1meG9MMzJaRkZHaldvWGdGRWp5S2RFUU91UCtDM1FvakYvTTluTE4v?=
 =?utf-8?B?ZkxjSzlIV1ROTjArZzN1VmRpM1ZsV2RyWmtLR05KRjFmNVBleG9jV0VaeW5X?=
 =?utf-8?B?K1diQnh3NkI2OHZHNHFoc0xhWVRBUzZ1azhQdlpjd3hEazBJbnJzcGEvRUVB?=
 =?utf-8?B?OUE3QTNCclUrUEFpeXFWSGNXcUpsOFBIY1dsVkovSFowcW1xQkFzS1hGVkpZ?=
 =?utf-8?B?ZHpOQ2hxb2l6MVlIYnorVld6QXp3bm05Y25xcjlBOFg4bjROZmVJS1Z2WnNH?=
 =?utf-8?B?czlOTElxOXN1NTB5M2Q5WHh0SlFYQkRPRkgza2ZmR0lnejQ0SXRzbWdwVHNZ?=
 =?utf-8?B?OG1TSjROQUxXM0c5L2wvcWV5Tlc0aHhPb1RpRjNhMFQ2Y0JXN2E5ZnJGQm8y?=
 =?utf-8?B?WWNGNEcxKzJOallaZzlVQXU0eEt1MWtnOXMvUzk0OVE0S1M1NDlaZWpob2hh?=
 =?utf-8?B?cHlyWVZXU1RQWnNHd2ZsbTFrWUNuMWpsVy9McDlNT0Fvak5CclRHUGg0YTZB?=
 =?utf-8?B?NkMrYmlaTlJQSUJ6VFY0YkdKRWJ1djVqSFo0SHFzdHNyNDg3WE5uV2F1OTMy?=
 =?utf-8?B?K0FkdFdoRTJiNDhvOU5Db3lkYitqcFl2UWtXc3BGTTBnTVJPUWZzWWRzMDls?=
 =?utf-8?B?MUszRjRKY05TdDRkN0lDQlZGa0Z5NkNPNGthMkY1elpXM3lCNTNuZW9EVkNr?=
 =?utf-8?Q?zphqQ48Fb59yH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25fcc55a-db30-4eb4-c764-08d988a6a7cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2021 08:52:41.3298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/2kPDAxOM1S83351CcIiM6KlfTOb7WVukCoHPRsXXSIHDJkmNO3vcweKxEt/7HPSwZc7FdKkNHiyPY8btxukA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5463
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


On 10/6/2021 8:59 AM, Christian König wrote:
> Am 06.10.21 um 08:55 schrieb Lazar, Lijo:
>>
>>
>> On 10/6/2021 12:05 PM, Christian König wrote:
>>> Am 06.10.21 um 08:32 schrieb Lazar, Lijo:
>>>>
>>>>
>>>> On 10/6/2021 11:49 AM, Christian König wrote:
>>>>> Am 06.10.21 um 06:51 schrieb Lazar, Lijo:
>>>>>>
>>>>>>
>>>>>> On 10/5/2021 10:15 PM, Christian König wrote:
>>>>>>> Am 05.10.21 um 15:49 schrieb Das, Nirmoy:
>>>>>>>>
>>>>>>>> On 10/5/2021 3:22 PM, Christian König wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Am 05.10.21 um 15:11 schrieb Nirmoy Das:
>>>>>>>>>> Debugfs core APIs will throw -EPERM when user disables debugfs
>>>>>>>>>> using CONFIG_DEBUG_FS_ALLOW_NONE or with kernel param. We 
>>>>>>>>>> shouldn't
>>>>>>>>>> see that as an error. Also validate drm root dentry before 
>>>>>>>>>> creating
>>>>>>>>>> amdgpu debugfs files.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>>>>>>>>>> ---
>>>>>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 10 ++++++++++
>>>>>>>>>>   1 file changed, 10 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c 
>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>>>>> index 6611b3c7c149..d786072e918b 100644
>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>>>>>>>>> @@ -1617,6 +1617,16 @@ int amdgpu_debugfs_init(struct 
>>>>>>>>>> amdgpu_device *adev)
>>>>>>>>>>       struct dentry *ent;
>>>>>>>>>>       int r, i;
>>>>>>>>>>   +    if (IS_ERR(root)) {
>>>>>>>>>> +        /* When debugfs is disabled we get -EPERM which is 
>>>>>>>>>> not an
>>>>>>>>>> +         * error as this is user controllable.
>>>>>>>>>> +         */
>>>>>>>>>
>>>>>>>>> Well setting primary->debugfs_root to an error code is 
>>>>>>>>> probably not a good idea to begin with.
>>>>>>>>>
>>>>>>>>> When debugfs is disabled that should most likely be NULL.
>>>>>>>>
>>>>>>>>
>>>>>>>> If we set primary->debugfs_root to  NULL then we need to add 
>>>>>>>> bunch of NULL checks everywhere before creating any debugfs files
>>>>>>>>
>>>>>>>> because debugfs_create_{file|dir}() with NULL root is still 
>>>>>>>> valid. I am assuming a hypothetical case when debugfs_root dir 
>>>>>>>> creation fails even with debugfs enabled
>>>>>>>>
>>>>>>>> but further calls are successful.  This wont be a problem if we 
>>>>>>>> propagate the error code.
>>>>>>>
>>>>>>> Yeah, but an error code in members is ugly like hell and 
>>>>>>> potentially causes crashes instead.
>>>>>>>
>>>>>>> I strongly suggest to fix this so that root is NULL when debugfs 
>>>>>>> isn't available and we add proper checks for that instead.
>>>>>>
>>>>>> This shouldn't be done. A NULL is a valid parent for debugfs API. 
>>>>>> An invalid parent is always checked like this
>>>>>>           if (IS_ERR(parent))
>>>>>>                 return parent;
>>>>>>
>>>>>> Instead of adding redundant work like NULL checks, let the API do 
>>>>>> its work and don't break the API contract. For ex: usage of 
>>>>>> sample client, you may look at the drm usage; it does the same.
>>>>>
>>>>> Yeah, but that is horrible API design and should be avoided.
>>>>>
>>>>> ERR_PTR(), PTR_ERR(), IS_ERR() and similar are supposed to be used 
>>>>> as alternative to signaling errors as return values from functions 
>>>>> and should *never* ever be used to signal errors in pointer members.
>>>>>
>>>>
>>>> One escape route may be - add another export from debugfs like 
>>>> debugfs_is_valid_node() which adheres to the current logic in 
>>>> debugfs API and use that in client code. Whenever debugfs changes 
>>>> to a different logic from IS_ERR, let that be changed.
>>>
>>> Well that would then rather be drm_is_debugfs_enabled(), because 
>>> that we separate debugfs handling into a drm core and individual 
>>> drivers is drm specific.
>>>
>>
>> Had one more look and looks like this will do the job. In other 
>> cases, API usage is allowed.
>>
>>     if (!debugfs_initialized())
>>         return;
>
> Yeah, that might work as well.
>
> Potentially a good idea to add that to both the core drm function and 
> the amdgpu function. and not attempt to create debugfs files in the 
> first place.


Sounds good, I will send patches to add this check.


Thanks,

Nirmoy


>
> Christian.
>
>>
>> Thanks,
>> Lijo
>>
>>> Christian.
>>>
>>>>
>>>> Thanks,
>>>> Lijo
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Lijo
>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>>
>>>>>>>> Nirmoy
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> +        if (PTR_ERR(root) == -EPERM)
>>>>>>>>>> +            return 0;
>>>>>>>>>> +
>>>>>>>>>> +        return PTR_ERR(ent);
>>>>>>>>>> +    }
>>>>>>>>>> +
>>>>>>>>>>       ent = debugfs_create_file("amdgpu_preempt_ib", 0600, 
>>>>>>>>>> root, adev,
>>>>>>>>>>                     &fops_ib_preempt);
>>>>>>>>>>       if (IS_ERR(ent)) {
>>>>>>>>>
>>>>>>>
>>>>>
>>>
>
