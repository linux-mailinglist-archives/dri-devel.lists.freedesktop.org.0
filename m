Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F247C60DD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C2010E298;
	Wed, 11 Oct 2023 23:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C153910E275;
 Wed, 11 Oct 2023 23:10:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBtsBXAosqiWJ6779DSfp9+WjS8JStVqFTFQwC7G7Ib/TUm8FiziPd+VJatESePldpbdSKsSlWdAoKw0T729nwmnLPrcxp9hjjCgd3R2dq2gsO2SZxUxtr5UsUr03HL7xEfMwkGGhVDFENJj3rcA8hwND+7zgaWJTFJKmVRewiWYNZcfyJetElTRiOCfUNJu4/lEovF0d07rdAqi3AEBge4CY3oZVnWiVRqyv6uUZ4vvrGjBFGGQZof7soBAjEkDXtfTpTUhAn3aNYHYOPSUfPwkWE+odEDeadqvfMqZ2bPvdqFdCVMc7lwNiXGtRDaKLFbT6kZJ4XZF4rH6ON4q3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gf0f2qE6WVRHubwztvAD7pqstMX1ahVqOB9H1GBgmUw=;
 b=m8e/FOlhD8o41TdUwjP8EV9hGr3/M+I6M5InLIYRoMFBEFsIlJDbhh0WyoEIPfdWsXaLXPzDkS7BUh7tALlE8viPVy+xVQc+GmddsuKH22sgF7TN8/IxTf920NRm5dpfkZxhBXrVSWlURFMTHDIV4r5GI2vN6IuY4N7AwTXlH9Z+SFSbBOPmIznBxut4dVlslXaapMS9Yn7RuAg67SQfFHHgEaH+an021RcOP5zB0m2OwgUY15blvkStwVBkYRSDHQGPUyDOrv70apFBae2up3aQfd6MBARUdZLKNtibZ8ZUg+mA+ZKtWyZajgBp5+UvpNPsHBbYIIbpz9+64tOB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gf0f2qE6WVRHubwztvAD7pqstMX1ahVqOB9H1GBgmUw=;
 b=iIjBl0qa7kFrPG1ElM7deBkLkiftclM50ZoXsj/mT0BdHwThThu2TqZXYvuIKgZghlAzBg5GJ6BB5jelzCBoS8FfiLbVXRCq33dkSiw8KHrOFwJxcbXR/ezLYEqGPxGiknVJ0og9SHvwCBZV/VVxVuk0vLFmFTXp7yKyG7A5v/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SN7PR12MB8771.namprd12.prod.outlook.com (2603:10b6:806:32a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 23:10:44 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.043; Wed, 11 Oct 2023
 23:10:44 +0000
Message-ID: <fbb4370c-e185-49b9-ad20-2f66d9fe1d61@amd.com>
Date: Wed, 11 Oct 2023 19:10:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v4 02/10] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-3-matthew.brost@intel.com>
 <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
 <ZR4upS/Mkh0lkzJ0@DUT025-TGLU.fm.intel.com>
 <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>
 <1e911601-f126-4e55-35e7-1a5e395b5fd2@linux.intel.com>
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <1e911601-f126-4e55-35e7-1a5e395b5fd2@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::32) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SN7PR12MB8771:EE_
X-MS-Office365-Filtering-Correlation-Id: c5360f71-85ea-4e9d-5258-08dbcaaf4bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRNnlv14t+78XCAMT6rm1krX85QRMf/thVpg5qgYktYJswuMvVlNJuCxyMck7MZk4HO9ROX2g+73RnAcnim8szxl4+rAwyIB+e9lSQ4laDT+ggrm++SZjmNCZ+Sagcm2pY3DzMxHKWFpXY20N3TfP/Bm0elpIQ0Waz9wqBfkCQas0tG4azLwD4Krv9pt/3fx/87U1M1VpCB35H5uJ5nCEzfvmfbCG79KwH+RPPJ4rOAn+n1aTQmLUh4JkArInZC5ZvDU/paFfPTpHSRKQYRll8zz5UKU4TOvSTgA57qptj2AtnwipYg8T3bJ5B+IEdw5fbijUQruXhK/hZn6Eqmz9DEtxST2FZIRN6bVMVzkKKx0RXofzTnY9Cr6s76hexV6j1v8GrDmTrtDbaCZH7XSAliQZHJR/qGVA76PlEoLLFa4b6o75xreALzMEYofG704LyOeM5nMt53fhI9WmS2Gjp0guJgUBhvHRlHQOOSGvbduBCDL8TY8+/DXiGUcReHmc2MVAr6+uVZw1kadN/4xtb6Rf+L9ppM/3BYlsQ0uIPrTT1HFDvm9hlVbKrKHWqX2KiVqP2881bRn+ttCLiJJCKXZyDByQQu2wq1w8ehNM8sKiS7RBuzvVsaJfdQ/y1ChFuLc8ZwKbjbl6nSP1tCMuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39860400002)(136003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66556008)(66946007)(66476007)(316002)(31686004)(4326008)(8936002)(8676002)(41300700001)(36756003)(110136005)(38100700002)(5660300002)(44832011)(7416002)(6512007)(2906002)(6486002)(2616005)(26005)(478600001)(6666004)(53546011)(86362001)(31696002)(83380400001)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUF4L3hXZTlaTU8yWG1xVkpsUkpSOW5ud2Rib0o4Uk5WZTNpc1VPOHBEUExx?=
 =?utf-8?B?a0RUNm1XZDVtb1Rob2VOOHlOU2lJUDlEN0NkaEpWcTJORWFnbTFGc3NOYmZW?=
 =?utf-8?B?NDAyVEFvZFczVlU3aWRKSVZtRWtqT3dEbXR4WHpsN1pOT3R6a2tlb2R1MFBo?=
 =?utf-8?B?NDdyRVNXd09IendqQzBlWTlmZExXODJXYjlFRjhNSkRiWkxzaVArU0xvU2hX?=
 =?utf-8?B?STdnYmNOUXpXU3BmODBWUFdwMTVvODg2TjAvdnVsTGN0eEpqd0lYWlhCVXM2?=
 =?utf-8?B?aWlvakt3ZXUrYURsanRoS1lVeVBWMnQ0TllxR1FDTFdnaW5RYU1IN3pRdSs2?=
 =?utf-8?B?SXJuMWlGbXpoQWF1NDJzK0dUeWU4ZUZRWlA3aHk3OGtlUkJFMys1dGhpQ1Vn?=
 =?utf-8?B?Ly9PSVRZcGcvaGFqaVNvUFNSaGxsYzNEWDUycmxXdlhDcnczZmVLcU9YNlhh?=
 =?utf-8?B?ejZkeVVBa01BNTZzdnZJZG41N1JzOFl5N01maUpEZVJjNi90YnVFTDgvZnpY?=
 =?utf-8?B?OWNzSnE0VXduQTYrNzQxbjBHSmg4ZXBlL1ZjeXJCYmFNbXRRVW4waFVNazRh?=
 =?utf-8?B?MEpnSExIOGRFbFJCZXlrMTJVUUZlTEhmTnBJeG00cVo1QU5VNmJ6WVJVUnkx?=
 =?utf-8?B?azBmNUZSb1MyWTRnWUxEYlduV3NENjlIZW9QOFU5UGFVRjBhc2RJWnlFRCt4?=
 =?utf-8?B?ekRsTEdwN2R4QW8zNXdaenpBQUlNa00yQ2RVY0x1SXE5amRZQTU2Ulp1Zlc5?=
 =?utf-8?B?VDVOMGVNTmZTUlEvczB0RXd5SE9keUdMMEFwc3kxWTAvdG02bEtjbWV2Mm9r?=
 =?utf-8?B?QmlIRnFVeS96cFVHOFMwNldDbytoTWxQNDY3YUt3Rko4VUM3UWJJZWlrOEMr?=
 =?utf-8?B?ajdnaEMxNEJPY3piZ0JGV0JucTJwUW5HaEc2V1d6SXFnd0hJZXpOendiYjRs?=
 =?utf-8?B?SW1ySjAzdHhaTjNHVTNYNHUrSXZkd1NTeWJDb3VYci9KaUJBQWw2ZVc4TmNZ?=
 =?utf-8?B?WmozMlFlaEtNWjU2ZDdOeGZXU2dQVGZodENBTExsaFBFcU5CUGp6Tmt2YUI0?=
 =?utf-8?B?aTVXblVNazlHY0llVmptU0RJNVFIclR6Z2RWSkplWEM3ZzFKUkVmcGhQY0Jw?=
 =?utf-8?B?OUx1bXBCcXZUQXM3Zkt2YjNrajJpbVkrcGdsTFprd29ldjdiU2R0bjBoWnBD?=
 =?utf-8?B?MGhxRmY5bzA1TzRMWnJDcTJ3ejE4NHhOTGQ4b2VMV0c3Y0hLdVZUZnZacG4y?=
 =?utf-8?B?bnFxRlBYSi9CNW1jaS95RFhFTzZtRWZyN1ZhclRTaHBZY1BGY3FQVmlBK1Fr?=
 =?utf-8?B?WGx4cWMwS2RoQXV4Z0pxcVhQUzUxM1VKV2VuMTcrNnFhQlpIamJSY3NsT1dr?=
 =?utf-8?B?ZlM2V2ZubDNzNjlNamNFeWIxZi80c0pHUE5zdTBxUXltZkFFbmNiQWF5VjVC?=
 =?utf-8?B?eHl3ZC9oOEE4RVhaMWNoSlBtQk95RExZVUcyN0llV3pTZ3B4RU4zRWdJbnc4?=
 =?utf-8?B?ckxad0tkODhBdVV6bG52c05mYXBZUUcxYWt0YmJnVC9ERWpCQVJESTZjYkhj?=
 =?utf-8?B?bGZPMDJWclRoNWJZUjE3M2M5aEVOTGhHQmluTGROckxwSkNvL01lM08yMEZp?=
 =?utf-8?B?c0ticGJqTFpSVU81WTZQS3ltR0pqSDJzWE5Ca2t3K3FJeHRjZnQ1cGQ4M1Jh?=
 =?utf-8?B?OVJlVVFVaHJucjdjaXc4ckZpMEV3RFduR2kxMzBmMjN2SW95OTg5UjJGYlMw?=
 =?utf-8?B?MzlGdURIbDhiRkNGWS9yTUtlR1lpODVndUdzZ2hFRm5qeWRRNWJmbHhrd0Vw?=
 =?utf-8?B?eStodkxFdGI1Q1NQTllYMWhIS0h6OUNhWVh4L203UXZ1R0hLd2VtMHdDcGJo?=
 =?utf-8?B?ZU8rcXV3RmM1SHZwUWRzTXB4TkFuNFE3b0hBbzUyQTcxT1hqcGswOFltRWdT?=
 =?utf-8?B?NTZNK1BEZUxRWTRtWTNYaUlpa0VFbHh3RFViRHN2clAwWk1HcmNMc01WNi93?=
 =?utf-8?B?a0VWRk5pWS9SS01leTlLdDJXSWNYMFNocUZpSGhoM1VzdEt3SjdnR0RkRnlw?=
 =?utf-8?B?Y0VZMlh1NDZrdVJRVkdSN3NaQnpxc1BrV0RLbTYrVnY0bkdXUHdhcHVLMzht?=
 =?utf-8?Q?TG0Q9VpDRmL+hy+D4yuUxvpmT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5360f71-85ea-4e9d-5258-08dbcaaf4bc5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 23:10:44.4054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7NufPp5qMxHqZ3l8Ivxnvq5iDBYBIrM3L8XzBYEeqwaSxB8jUgOUk/cQ9kveVZi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8771
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 mcanal@igalia.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-06 03:59, Tvrtko Ursulin wrote:
> 
> On 05/10/2023 05:13, Luben Tuikov wrote:
>> On 2023-10-04 23:33, Matthew Brost wrote:
>>> On Tue, Sep 26, 2023 at 11:32:10PM -0400, Luben Tuikov wrote:
>>>> Hi,
>>>>
>>>> On 2023-09-19 01:01, Matthew Brost wrote:
>>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
>>>>> seems a bit odd but let us explain the reasoning below.
>>>>>
>>>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>>>> guaranteed to be the same completion even if targeting the same hardware
>>>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>>>> which allowed to reorder, timeslice, and preempt submissions. If a using
>>>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
>>>>> apart as the TDR expects submission order == completion order. Using a
>>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>>>
>>>>> 2. In XE submissions are done via programming a ring buffer (circular
>>>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
>>>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
>>>>> control on the ring for free.
>>>>>
>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>> kthread for submission / job cleanup. This doesn't scale if a large
>>>>> number of drm_gpu_scheduler are used. To work around the scaling issue,
>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>
>>>>> v2:
>>>>>    - (Rob Clark) Fix msm build
>>>>>    - Pass in run work queue
>>>>> v3:
>>>>>    - (Boris) don't have loop in worker
>>>>> v4:
>>>>>    - (Tvrtko) break out submit ready, stop, start helpers into own patch
>>>>> v5:
>>>>>    - (Boris) default to ordered work queue
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>>>>>   drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
>>>>>   drivers/gpu/drm/lima/lima_sched.c          |   2 +-
>>>>>   drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
>>>>>   drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
>>>>>   drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
>>>>>   drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
>>>>>   drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
>>>>>   include/drm/gpu_scheduler.h                |  14 ++-
>>>>>   9 files changed, 79 insertions(+), 75 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> index e366f61c3aed..16f3cfe1574a 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>>>   			break;
>>>>>   		}
>>>>>   
>>>>> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>>>> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
>>>>>   				   ring->num_hw_submission, 0,
>>>>>   				   timeout, adev->reset_domain->wq,
>>>>>   				   ring->sched_score, ring->name,
>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>> index 345fec6cb1a4..618a804ddc34 100644
>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>> @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>>>>   {
>>>>>   	int ret;
>>>>>   
>>>>> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>>>>> +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>>>>>   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>>>>>   			     msecs_to_jiffies(500), NULL, NULL,
>>>>>   			     dev_name(gpu->dev), gpu->dev);
>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>>> index ffd91a5ee299..8d858aed0e56 100644
>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>>> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>>>>>   
>>>>>   	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>>>>>   
>>>>> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
>>>>> +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>>>>>   			      lima_job_hang_limit,
>>>>>   			      msecs_to_jiffies(timeout), NULL,
>>>>>   			      NULL, name, pipe->ldev->dev);
>>>>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>> index 40c0bc35a44c..b8865e61b40f 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>> @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>>>>   	 /* currently managing hangcheck ourselves: */
>>>>>   	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>>>>>   
>>>>> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>>>>> +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>>>>>   			num_hw_submissions, 0, sched_timeout,
>>>>>   			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>>>>
>>>> checkpatch.pl complains here about unmatched open parens.
>>>>
>>>
>>> Will fix and run checkpatch before posting next rev.
>>>
>>>>>   	if (ret) {
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>> index 88217185e0f3..d458c2227d4f 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>> @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>>>>>   	if (!drm->sched_wq)
>>>>>   		return -ENOMEM;
>>>>>   
>>>>> -	return drm_sched_init(sched, &nouveau_sched_ops,
>>>>> +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>>>>>   			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>>>>>   			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>>>>>   }
>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>> index 033f5e684707..326ca1ddf1d7 100644
>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>> @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>>>>>   		js->queue[j].fence_context = dma_fence_context_alloc(1);
>>>>>   
>>>>>   		ret = drm_sched_init(&js->queue[j].sched,
>>>>> -				     &panfrost_sched_ops,
>>>>> +				     &panfrost_sched_ops, NULL,
>>>>>   				     nentries, 0,
>>>>>   				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>>>   				     pfdev->reset.wq,
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index e4fa62abca41..ee6281942e36 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -48,7 +48,6 @@
>>>>>    * through the jobs entity pointer.
>>>>>    */
>>>>>   
>>>>> -#include <linux/kthread.h>
>>>>>   #include <linux/wait.h>
>>>>>   #include <linux/sched.h>
>>>>>   #include <linux/completion.h>
>>>>> @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>>>   	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
>>>>>   }
>>>>>   
>>>>> +/**
>>>>> + * drm_sched_submit_queue - scheduler queue submission
>>>>
>>>> There is no verb in the description, and is not clear what
>>>> this function does unless one reads the code. Given that this
>>>> is DOC, this should be clearer here. Something like "queue
>>>> scheduler work to be executed" or something to that effect.
>>>>
>>>
>>> Will fix.
>>>   
>>>> Coming back to this from reading the patch below, it was somewhat
>>>> unclear what "drm_sched_submit_queue()" does, since when reading
>>>> below, "submit" was being read by my mind as an adjective, as opposed
>>>> to a verb. Perhaps something like:
>>>>
>>>> drm_sched_queue_submit(), or
>>>> drm_sched_queue_exec(), or
>>>> drm_sched_queue_push(), or something to that effect. You pick. :-)
>>>>
>>>
>>> I prefer the name as is. In this patch we have:
>>>
>>> drm_sched_submit_queue()
>>> drm_sched_submit_start)
>>> drm_sched_submit_stop()
>>> drm_sched_submit_ready()
>>>
>>> I like all these functions start with 'drm_sched_submit' which allows
>>> for easy searching for the functions that touch the DRM scheduler
>>> submission state.
>>>
>>> With a little better doc are you fine with the names as is.
>>
>> Notice the following scheme in the naming,
>>
>> drm_sched_submit_queue()
>> drm_sched_submit_start)
>> drm_sched_submit_stop()
>> drm_sched_submit_ready()
>> \---+---/ \--+-/ \-+-/
>>      |        |     +---> a verb
>>      |        +---------> should be a noun (something in the component)
>>      +------------------> the kernel/software component
>>
>> And although "queue" can technically be used as a verb too, I'd rather it be "enqueue",
>> like this:
>>
>> drm_sched_submit_enqueue()
>>
>> And using "submit" as the noun of the component is a bit cringy,
>> since "submit" is really a verb, and it's cringy to make it a "state"
>> or an "object" we operate on in the DRM Scheduler. "Submission" is
>> a noun, but "submission enqueue/start/stop/ready" doesn't sound
>> very well thought out. "Submission" really is what the work-queue
>> does.
>>
>> I'd rather it be a real object, like for instance,
>>
>> drm_sched_wqueue_enqueue()
>> drm_sched_wqueue_start)
>> drm_sched_wqueue_stop()
>> drm_sched_wqueue_ready()
>>
>> Which tells me that the component is the DRM Scheduler, the object is a/the work-queue,
>> and the last word as the verb, is the action we're performing on the object, i.e. the work-queue.
>> Plus, all these functions actually do operate on work-queues, directly or indirectly,
>> are new, so it's a win-win naming scheme.
>>
>> I think that that would be most likeable.
> 
> FWIW I was suggesting not to encode the fact submit queue is implemented 

No. Overengineering.

> with a workqueue in the API name. IMO it would be nicer and less 
> maintenance churn should something channge if the external components 
> can be isolated from that detail.
> 
> drm_sched_submit_queue_$verb? If not viewed as too verbose...

No.

That sounds like an unnecessary overengineering: "what if". No.

-- 
Regards,
Luben

