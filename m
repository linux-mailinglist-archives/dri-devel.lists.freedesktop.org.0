Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8962539F7C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB73410E286;
	Wed,  1 Jun 2022 08:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5B110E286
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:29:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwZJbmyEyTgf6X93K6/AWu/1sym6OU9r7KtoO4wkgIl68vyPdJGfzo0rbcwxlnx5By/Kmhc7tnrijYeDhqF/3TK40fhAnl5vN/W6MljeHxV++onhuytSyGrwu4vfyMNJdaamD3sTSSDIlpyZ4PHLHRZEgDJHADTD1NDNSwU+PUH1bLVE2Nhr5iLZZGmuf17qW4rPbEWYd/yfPt3sSHj9wKKz5S0yDK9uvuaA6yHvQt3tTbYnvu3hIdWJ2gjfEqgHvqkH7I6bl3W1kbds6K+pKPbhqp/5nZLsZEJKJkEjlBK6/cgVIbLRiDTNArzA6CVHWLaRownX/mMcdbRBFX2+jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TAiEN3QtRYuKzVvmjVHGR38LjwnKTkwDqqs0ckdYgs=;
 b=U+vXOOQj80rYmVeRm6Wz10alClT8we++qFjVgEyhb9NXA2oVV6+2ONUPgEKW0abNXtJIPjU0a0nXhI4zC9pRDns2JCyqSpwH0RVtkZZBuo97Nfx6ab0PgoFSmAl9uMhKsgVQyTitsimg8Z247LuMm06mzJmPa1cnoI1irSCpeYjkDqU00j/P+MPm88HBorixq/KwBlyiL5n3aKiHuW+VppAZXcDCVVdG5HbKSuatGRNOn8ArowoTDiixv2fZBhT2TD9n2kBrzdNPRK03PcQq3oSmLHDTqz1ibxxjSmDhwFytX/xrUurUcwwdnXh5BucyNlJBSK9FWDfZ8FwLsvrRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TAiEN3QtRYuKzVvmjVHGR38LjwnKTkwDqqs0ckdYgs=;
 b=RUNxyBlGZDpwT9EpLvZgOpx4Qf+pjnik3DS4Ad5NWQkEoJvfKKkuk6fZJzmB61JhH9VL5DtTiMU2aAxKiwqyjXF/ag+BcAsyePRJynrUFfSb//Sw0DAw/B9Q7nLo0Qd65sx/focjYnnwC2DwOtafjgv5+R6cyPPHTGDVf6PaAQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4642.namprd12.prod.outlook.com (2603:10b6:a03:1f6::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 08:29:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 08:29:28 +0000
Message-ID: <e9dad16d-8bfe-ceb3-32c6-1e28fe04ff1d@amd.com>
Date: Wed, 1 Jun 2022 10:29:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/5] drm/ttm: Refactor num_shared into usage.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <20220601004014.158247-2-bas@basnieuwenhuizen.nl>
 <a5078937-a4d1-eaeb-af1b-de0482c2c78e@amd.com>
 <CAP+8YyFUTmYJ0vozZhNRRujySVQOErO5rXp3yoV+Uvw+5xb8gQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyFUTmYJ0vozZhNRRujySVQOErO5rXp3yoV+Uvw+5xb8gQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0546.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c016dd6-bab0-46c4-9e97-08da43a8d80e
X-MS-TrafficTypeDiagnostic: BY5PR12MB4642:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB46422C7B03A2527FEB7B084283DF9@BY5PR12MB4642.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wHkLKFw5PIQ+aWy3nKhPnYU/JuD4v9gJNRxHSt+jtuR72MjEt72VvypfGUa/Ay9/A6+7D+gMb7Z6aLLgXx+twD01G7uw24A+X0LD4Izoe+Fu4BrPFpPDLgOpV0/20rYHPfVMDHqJUieqaD21/DHoKf/ckJnYmoZh7pvChKj9Gg130TWlxcNBqbiJcjoeCyW23tV+Nzc/hYa2knDALZi4TDH6txsEg5QeVqWUCXEumsdz8gfOPf078HRi20bZOQsj40G5wzeXAZbEcgZoy/CHp5TN7ZF6rQNJirkckLKrKnZmNq3ERfA5+9KK1Xvf9mTGQXPLKPtQ/rZ1yi0N9ec1Qbs8HOUHoyIO9JlMcy+t/+WkovIrAWH1CAOhL0dHhCi+NuRSSDJVFkatNRTSooKE19pRwk/F/o/JvO1rQ/P7vOjI1H2DyxRuMNmUQhcFjNswsi5V7d2W/HLZKQOYILPwvHZtehE4IGcKDgskhHAEJOrOF7MsGHZXPdGBi9mB1kkpUcRL9HNLZP+Rd7STV9NApIP17uc5y1ChjnaOAmImENp48X7WOBC/m2VRzZFBa4qkK+ZLp4qhCaO9Z0FQ2ZdaWWMQ97oZlhdxuYH2IMKpUp+ZxAZ6I67PfdcvhUvYkdaG8XwU/L2CDp0kIjMz6TYAPT2E24TogGh7Cvh8hjanTTk20XGWU8fYXuFbeQnlLfdA3d44RKqBct9mnflU2Ckxe5HaVDKCddRjPRU2igmIR/y88IrKFw41QF6L+JnkSUoZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6666004)(31686004)(316002)(83380400001)(2906002)(36756003)(6486002)(30864003)(53546011)(54906003)(6916009)(6506007)(86362001)(6512007)(2616005)(26005)(186003)(508600001)(66476007)(66556008)(4326008)(66574015)(8676002)(66946007)(31696002)(8936002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q21OdTlwQ3RZL3ZuMjhUemRGL3ZoeTdPRm5mU2twZmJKRGlWVCtlU0FuRWdC?=
 =?utf-8?B?d241MGtKRTJoSjdkWmJpWjR6WFNDS2dydUdVbWN1dVJFNFk4YWhycm8xMzk1?=
 =?utf-8?B?UXd5ZitWTnhmc3dVbWhCQThGVGxPZmtMT0I3U3ZybzkxbVB2bnBmLzVoK0ZF?=
 =?utf-8?B?ZlZOZVBKL2tkbVNZcHlKMXdUWkpmekF5M2JKUDBEeEpiU0NkOHgycXYxNkZK?=
 =?utf-8?B?QmZiUTlFaGpXZkp5UGtTYTBwem5zRVVxSlFRckJPSzNrdmdSRVdrdldVSHhZ?=
 =?utf-8?B?QklETURmYys0czZ4VGtvS2pKQ2ZhR1NGT2JMRnQ4eDRqOVVOSjgvNmF5OHdt?=
 =?utf-8?B?enJsQk9XQzNTUjRxaVNpL3lmN0VlN0JTVVFqNFErazRybG5wTWxkejdUNG5G?=
 =?utf-8?B?SG56MmQ0Z2MyMUtJZGMxclhBZEcrYjN1clI0RW92bFU0SW16eEFZc25lRkRq?=
 =?utf-8?B?VmdWdWJjY2s2S1gwYndSY1dmMDNuNVFVTGgwZXhxZ2paWXZHK21VTEs1MDVU?=
 =?utf-8?B?d09iSDlleWVMd3lVQzVYc1ExYUF5UVFmRHV1RGY5a25pZG10ODFWZnhqRlFi?=
 =?utf-8?B?ZlZqdjNoaGl0cm1LVWJ5ZjlJZ2cxRllNeTQ2WGJQNzY4aTRueGpEbWMrUzY0?=
 =?utf-8?B?bXJ1RGRGSkUxVU0wUWFZVll5NzNoYVBRSXkvT2UrZEZWcUpwdlJ1SUYxQlpm?=
 =?utf-8?B?dkZpQVhBMml5aUtmRGNoR29LOXk5eS8xVzNqRVVCQXdUaWwwWXh4Nnh6YXdo?=
 =?utf-8?B?YkZMaHAzVnN3YmRrcEJNa2Z1MzJhODN1VFdoUUduekFLdHR2S2RnT0NVazNN?=
 =?utf-8?B?MEZRbjg3NXlBbFZRNW5paFpSaWs5ODlWaDBYSXV2RFdlUTdOY3h4UXJ3Nkk2?=
 =?utf-8?B?VXdtb0wxNkpQaVcxcDFrS0hiT2ZpTGYrY1h4NWNkMThWSmJWQ1A1SmJ3K29P?=
 =?utf-8?B?ZnlGUDYwWE40YkdqUVlHSDNMZGltanB0cW5NNVdDK2NDV1dUSDJEUmI5Znp0?=
 =?utf-8?B?Z1YycFRJWTUwc0hUYjBMZTUxVytnSUNCMUVlRC8xK2lQQXZ6N3M4VHRucC9G?=
 =?utf-8?B?U0p1UTdtdWZUbStNbXRKODhTUjlPWTJZVWUxSGFjMXkxaFA5ZVdNMXhUVkQy?=
 =?utf-8?B?K0tLT0lad0RldXVZcFl4V3NIMmQ2S0taM2o2WlozRkVFdkFXR1hsVWJqSGZY?=
 =?utf-8?B?TFNJYXdMRUlJckpBT1ZOcGNoTEJlcTVIRzJENklERS9HYXkzMWdGck4vdXBu?=
 =?utf-8?B?YUdUb2MzeE5wRGNEMDZjclpaUlFLUDNCK0lGRlFvckhzTnY2OWZXSTZIdjdo?=
 =?utf-8?B?eE42VGo3amxsVCtnaksydjRPUG8xZlF3cWsveDMwQTZEL0tvTjVGUUpFelpk?=
 =?utf-8?B?bW90TnVrbW1hayt1ZGxpS0NkVFlka1ZPVklId2t6cGt0M2c3RWpxb3NjR3I0?=
 =?utf-8?B?bjZSQlBwOGRPSzBRaXY3ZWU3M1czaEVwOGptbWRWb2E0RTlEdkhLUjlqLzJ1?=
 =?utf-8?B?cGhqUGUrYTFBYmhCVDhkOHdDazNVZ3hVa1ZHajRnak9CTFJpdlUrRmh1ZnFo?=
 =?utf-8?B?OU8xUmdwZ0RHdWlRRzFjZnM4NTdzQU9tK1I5eVhGSmhpK2c4L2ZpS05HcDlQ?=
 =?utf-8?B?OVNyVk1WbjQ4SFFtNng1Uy9sSFB6MEtneUNUV1dHYUtZYVpiR0pIM0VIbzI1?=
 =?utf-8?B?ZEhhUjFONVFZU0s3SlBhck1zZXluS0Y2bWdGK0RHRm1XcVlFVU8rTnFEblJW?=
 =?utf-8?B?TDF4SjI1eGV0Wit2bUF4OXYzZmorRkt6TVQwOUZjWkQ3em5VcGJDTEcwWnBW?=
 =?utf-8?B?dG1TemViUis5UTFTdTFRdHIvTWZUSWh1cU00dXhPdTVWUWxrNXowMit4SHpk?=
 =?utf-8?B?R0tqdjZnazVxOVRhays0Z0dnYU40MDJmdTVLUkg4akNvdDM5V3FoOG9tb1NW?=
 =?utf-8?B?L1hwVGxBek54TWRJamJUNUFwc3phTjEwaVhQWlc3SVdPUDNSWFNZem1URVk1?=
 =?utf-8?B?bFdHcXdIMXNHeGZZYi8yckY0cmsweXZzUCt3WWxINERLOUErbHMvbmg0b3pt?=
 =?utf-8?B?RFhtbzBaSFcvcy9obk9BdE9laXJzK3kraVEyYlc3cVBiVGpreFVRSGpIVERw?=
 =?utf-8?B?MHRDVzE4VVRodUJRbzVvcVhFekcvQTZscWtMbHhnTzIxN213YldFbjAyRHo3?=
 =?utf-8?B?NngyZ2xDNDhhWGN3bWpVWnF5T2VNQUJMWkpHV1ZHTFhaZ0ZqV3lMeVhqc1dN?=
 =?utf-8?B?V3dPQXZMRTZWNTBSYWh4UmdrY29mZjlaa0FkTXg2T0Fobk41THZPZ3FHRDRp?=
 =?utf-8?B?OUYzRmZPRlQxdU9UUUJiNklOMkNlYWorcG5DL3VlMS9Lc012M0NFdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c016dd6-bab0-46c4-9e97-08da43a8d80e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:29:28.5843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GHKjDeBc4eEuc7G1SbJkkFG3NDpce+JI3/W6Yy77Cto44WrXoohrJUy10QcgmyH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4642
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.06.22 um 10:11 schrieb Bas Nieuwenhuizen:
> On Wed, Jun 1, 2022 at 10:02 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 01.06.22 um 02:40 schrieb Bas Nieuwenhuizen:
>>> So that the driver can set some BOOKKEEP for explicit sync. Maybe
>>> some of the existing places would already make sense for that, but
>>> I targeted this for no functional changes.
>> Well first of all NAK to that one since it will totally break cases
>> which need to reserve more than one fence slot.
> TTM already didn't do that? From ttm_execbuf_util.c :
>
>>> -             num_fences = min(entry->num_shared, 1u);
>>> +             num_fences = entry->usage <= DMA_RESV_USAGE_WRITE ? 0u : 1u;

That's doing a min(entry->num_shared, 1u). In other words even when the 
driver requested to reserve no fence we at least reserve at least one.

But if the driver requested to reserve more than one then we do reserve 
more than one. That's rather important because both radeon and amdgpu 
need that for their VM updates.

This patch here completely breaks that.

There is already an drm_exec patch set from me on the dri-devel mailing 
list which untangles all of this and deprecates the whole 
ttm_exec_buf_util handling.

Regards,
Christian.

>> Also as discussed with Daniel we don't want to use BOOKKEEP for implicit
>> sync. We should instead use READ for that.
> That is the plan and what we do later in the series, use BOOKKEEP for
> submissions that don't want to participate in implicit sync?
>
> This refactor sets everything to READ or WRITE based on the previous
> num_shared value, to make sure this patch by itself is not a
> functional change.
>
>> BOOKKEEP is for stuff userspace should never be aware of, e.g. like page
>> table updates and KFD eviction fences.
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 10 +++++-----
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            |  8 +++-----
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c           |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c           |  6 +++---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |  3 +--
>>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c              |  2 +-
>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>>>    drivers/gpu/drm/qxl/qxl_release.c                 |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_cs.c                |  5 +++--
>>>    drivers/gpu/drm/radeon/radeon_gem.c               |  2 +-
>>>    drivers/gpu/drm/radeon/radeon_vm.c                |  4 ++--
>>>    drivers/gpu/drm/ttm/ttm_execbuf_util.c            |  5 ++---
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_resource.c          | 10 +++++-----
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_validation.c        |  2 +-
>>>    include/drm/ttm/ttm_execbuf_util.h                |  3 ++-
>>>    16 files changed, 33 insertions(+), 35 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> index a4955ef76cfc..a790a089e829 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>> @@ -774,7 +774,7 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
>>>        struct amdgpu_bo *bo = mem->bo;
>>>
>>>        INIT_LIST_HEAD(&entry->head);
>>> -     entry->num_shared = 1;
>>> +     entry->usage = DMA_RESV_USAGE_READ;
>>>        entry->bo = &bo->tbo;
>>>        mutex_lock(&process_info->lock);
>>>        if (userptr)
>>> @@ -918,7 +918,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
>>>
>>>        ctx->kfd_bo.priority = 0;
>>>        ctx->kfd_bo.tv.bo = &bo->tbo;
>>> -     ctx->kfd_bo.tv.num_shared = 1;
>>> +     ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&ctx->kfd_bo.tv.head, &ctx->list);
>>>
>>>        amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
>>> @@ -981,7 +981,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
>>>
>>>        ctx->kfd_bo.priority = 0;
>>>        ctx->kfd_bo.tv.bo = &bo->tbo;
>>> -     ctx->kfd_bo.tv.num_shared = 1;
>>> +     ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&ctx->kfd_bo.tv.head, &ctx->list);
>>>
>>>        i = 0;
>>> @@ -2218,7 +2218,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>>>                            validate_list.head) {
>>>                list_add_tail(&mem->resv_list.head, &resv_list);
>>>                mem->resv_list.bo = mem->validate_list.bo;
>>> -             mem->resv_list.num_shared = mem->validate_list.num_shared;
>>> +             mem->resv_list.usage = mem->validate_list.usage;
>>>        }
>>>
>>>        /* Reserve all BOs and page tables for validation */
>>> @@ -2417,7 +2417,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
>>>
>>>                list_add_tail(&mem->resv_list.head, &ctx.list);
>>>                mem->resv_list.bo = mem->validate_list.bo;
>>> -             mem->resv_list.num_shared = mem->validate_list.num_shared;
>>> +             mem->resv_list.usage = mem->validate_list.usage;
>>>        }
>>>
>>>        ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index 60ca14afb879..2ae1c0d9d33a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -55,8 +55,7 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
>>>        bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
>>>        p->uf_entry.priority = 0;
>>>        p->uf_entry.tv.bo = &bo->tbo;
>>> -     /* One for TTM and two for the CS job */
>>> -     p->uf_entry.tv.num_shared = 3;
>>> +     p->uf_entry.tv.usage = DMA_RESV_USAGE_READ;
>>>
>>>        drm_gem_object_put(gobj);
>>>
>>> @@ -519,9 +518,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>                        return r;
>>>        }
>>>
>>> -     /* One for TTM and one for the CS job */
>>>        amdgpu_bo_list_for_each_entry(e, p->bo_list)
>>> -             e->tv.num_shared = 2;
>>> +             e->tv.usage = DMA_RESV_USAGE_READ;
>>>
>>>        amdgpu_bo_list_get_list(p->bo_list, &p->validated);
>>>
>>> @@ -1261,7 +1259,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>
>>>        /* Make sure all BOs are remembered as writers */
>>>        amdgpu_bo_list_for_each_entry(e, p->bo_list)
>>> -             e->tv.num_shared = 0;
>>> +             e->tv.usage = DMA_RESV_USAGE_WRITE;
>>>
>>>        ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>>>        mutex_unlock(&p->adev->notifier_lock);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> index c6d4d41c4393..71277257d94d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>> @@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>        INIT_LIST_HEAD(&list);
>>>        INIT_LIST_HEAD(&csa_tv.head);
>>>        csa_tv.bo = &bo->tbo;
>>> -     csa_tv.num_shared = 1;
>>> +     csa_tv.usage = DMA_RESV_USAGE_READ;
>>>
>>>        list_add(&csa_tv.head, &list);
>>>        amdgpu_vm_get_pd_bo(vm, &list, &pd);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 84a53758e18e..7483411229f4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -207,7 +207,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>>>        INIT_LIST_HEAD(&duplicates);
>>>
>>>        tv.bo = &bo->tbo;
>>> -     tv.num_shared = 2;
>>> +     tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&tv.head, &list);
>>>
>>>        amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
>>> @@ -731,9 +731,9 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>>>                abo = gem_to_amdgpu_bo(gobj);
>>>                tv.bo = &abo->tbo;
>>>                if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
>>> -                     tv.num_shared = 1;
>>> +                     tv.usage = DMA_RESV_USAGE_READ;
>>>                else
>>> -                     tv.num_shared = 0;
>>> +                     tv.usage = DMA_RESV_USAGE_WRITE;
>>>                list_add(&tv.head, &list);
>>>        } else {
>>>                gobj = NULL;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>>> index 5224d9a39737..f670d8473993 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>>> @@ -319,7 +319,7 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
>>>        INIT_LIST_HEAD(&list);
>>>
>>>        tv.bo = &rbo->tbo;
>>> -     tv.num_shared = 1;
>>> +     tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&tv.head, &list);
>>>
>>>        r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index 15184153e2b9..515be19ab279 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -633,8 +633,7 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
>>>    {
>>>        entry->priority = 0;
>>>        entry->tv.bo = &vm->root.bo->tbo;
>>> -     /* Two for VM updates, one for TTM and one for the CS job */
>>> -     entry->tv.num_shared = 4;
>>> +     entry->tv.usage = DMA_RESV_USAGE_READ;
>>>        entry->user_pages = NULL;
>>>        list_add(&entry->tv.head, validated);
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> index b3fc3e958227..af844b636778 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> @@ -1395,7 +1395,7 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
>>>                vm = drm_priv_to_vm(pdd->drm_priv);
>>>
>>>                ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
>>> -             ctx->tv[gpuidx].num_shared = 4;
>>> +             ctx->tv[gpuidx].usage = DMA_RESV_USAGE_READ;
>>>                list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
>>>        }
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 73423b805b54..851b7844b084 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -7601,7 +7601,7 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>>>        INIT_LIST_HEAD(&list);
>>>
>>>        tv.bo = &rbo->tbo;
>>> -     tv.num_shared = 1;
>>> +     tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&tv.head, &list);
>>>
>>>        r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
>>> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
>>> index 368d26da0d6a..689e35192070 100644
>>> --- a/drivers/gpu/drm/qxl/qxl_release.c
>>> +++ b/drivers/gpu/drm/qxl/qxl_release.c
>>> @@ -183,7 +183,7 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
>>>
>>>        qxl_bo_ref(bo);
>>>        entry->tv.bo = &bo->tbo;
>>> -     entry->tv.num_shared = 0;
>>> +     entry->tv.usage = DMA_RESV_USAGE_WRITE;
>>>        list_add_tail(&entry->tv.head, &release->bos);
>>>        return 0;
>>>    }
>>> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
>>> index 446f7bae54c4..30afe0c62dd9 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_cs.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
>>> @@ -183,7 +183,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
>>>                }
>>>
>>>                p->relocs[i].tv.bo = &p->relocs[i].robj->tbo;
>>> -             p->relocs[i].tv.num_shared = !r->write_domain;
>>> +             p->relocs[i].tv.usage =
>>> +                     r->write_domain ? DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ;
>>>
>>>                radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
>>>                                      priority);
>>> @@ -258,7 +259,7 @@ static int radeon_cs_sync_rings(struct radeon_cs_parser *p)
>>>
>>>                resv = reloc->robj->tbo.base.resv;
>>>                r = radeon_sync_resv(p->rdev, &p->ib.sync, resv,
>>> -                                  reloc->tv.num_shared);
>>> +                                  reloc->tv.usage != DMA_RESV_USAGE_WRITE);
>>>                if (r)
>>>                        return r;
>>>        }
>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
>>> index 8c01a7f0e027..eae47c709f5d 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>> @@ -635,7 +635,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
>>>        INIT_LIST_HEAD(&list);
>>>
>>>        tv.bo = &bo_va->bo->tbo;
>>> -     tv.num_shared = 1;
>>> +     tv.usage = DMA_RESV_USAGE_READ;
>>>        list_add(&tv.head, &list);
>>>
>>>        vm_bos = radeon_vm_get_bos(rdev, bo_va->vm, &list);
>>> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
>>> index 987cabbf1318..702627b48dae 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_vm.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
>>> @@ -143,7 +143,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
>>>        list[0].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
>>>        list[0].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
>>>        list[0].tv.bo = &vm->page_directory->tbo;
>>> -     list[0].tv.num_shared = 1;
>>> +     list[0].tv.usage = DMA_RESV_USAGE_READ;
>>>        list[0].tiling_flags = 0;
>>>        list_add(&list[0].tv.head, head);
>>>
>>> @@ -155,7 +155,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
>>>                list[idx].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
>>>                list[idx].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
>>>                list[idx].tv.bo = &list[idx].robj->tbo;
>>> -             list[idx].tv.num_shared = 1;
>>> +             list[idx].tv.usage = DMA_RESV_USAGE_READ;
>>>                list[idx].tiling_flags = 0;
>>>                list_add(&list[idx++].tv.head, head);
>>>        }
>>> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>>> index 0eb995d25df1..c39d8e5ac271 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
>>> @@ -101,7 +101,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
>>>                        continue;
>>>                }
>>>
>>> -             num_fences = min(entry->num_shared, 1u);
>>> +             num_fences = entry->usage <= DMA_RESV_USAGE_WRITE ? 0u : 1u;
>>>                if (!ret) {
>>>                        ret = dma_resv_reserve_fences(bo->base.resv,
>>>                                                      num_fences);
>>> @@ -154,8 +154,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
>>>        list_for_each_entry(entry, list, head) {
>>>                struct ttm_buffer_object *bo = entry->bo;
>>>
>>> -             dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
>>> -                                DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
>>> +             dma_resv_add_fence(bo->base.resv, fence, entry->usage);
>>>                ttm_bo_move_to_lru_tail_unlocked(bo);
>>>                dma_resv_unlock(bo->base.resv);
>>>        }
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>> index c6d02c98a19a..58dfff7d6c76 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
>>> @@ -130,7 +130,7 @@ static void vmw_resource_release(struct kref *kref)
>>>                        struct ttm_validate_buffer val_buf;
>>>
>>>                        val_buf.bo = bo;
>>> -                     val_buf.num_shared = 0;
>>> +                     val_buf.usage = DMA_RESV_USAGE_WRITE;
>>>                        res->func->unbind(res, false, &val_buf);
>>>                }
>>>                res->backup_dirty = false;
>>> @@ -552,7 +552,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>>>        INIT_LIST_HEAD(&val_list);
>>>        ttm_bo_get(&res->backup->base);
>>>        val_buf->bo = &res->backup->base;
>>> -     val_buf->num_shared = 0;
>>> +     val_buf->usage = DMA_RESV_USAGE_WRITE;
>>>        list_add_tail(&val_buf->head, &val_list);
>>>        ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
>>>        if (unlikely(ret != 0))
>>> @@ -657,7 +657,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
>>>        BUG_ON(!func->may_evict);
>>>
>>>        val_buf.bo = NULL;
>>> -     val_buf.num_shared = 0;
>>> +     val_buf.usage = DMA_RESV_USAGE_WRITE;
>>>        ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf);
>>>        if (unlikely(ret != 0))
>>>                return ret;
>>> @@ -708,7 +708,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
>>>                return 0;
>>>
>>>        val_buf.bo = NULL;
>>> -     val_buf.num_shared = 0;
>>> +     val_buf.usage = DMA_RESV_USAGE_WRITE;
>>>        if (res->backup)
>>>                val_buf.bo = &res->backup->base;
>>>        do {
>>> @@ -777,7 +777,7 @@ void vmw_resource_unbind_list(struct vmw_buffer_object *vbo)
>>>    {
>>>        struct ttm_validate_buffer val_buf = {
>>>                .bo = &vbo->base,
>>> -             .num_shared = 0
>>> +             .usage = DMA_RESV_USAGE_WRITE
>>>        };
>>>
>>>        dma_resv_assert_held(vbo->base.base.resv);
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>> index f46891012be3..0476ba498321 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
>>> @@ -288,7 +288,7 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
>>>                val_buf->bo = ttm_bo_get_unless_zero(&vbo->base);
>>>                if (!val_buf->bo)
>>>                        return -ESRCH;
>>> -             val_buf->num_shared = 0;
>>> +             val_buf->usage = DMA_RESV_USAGE_WRITE;
>>>                list_add_tail(&val_buf->head, &ctx->bo_list);
>>>                bo_node->as_mob = as_mob;
>>>                bo_node->cpu_blit = cpu_blit;
>>> diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
>>> index a99d7fdf2964..851961a06c27 100644
>>> --- a/include/drm/ttm/ttm_execbuf_util.h
>>> +++ b/include/drm/ttm/ttm_execbuf_util.h
>>> @@ -31,6 +31,7 @@
>>>    #ifndef _TTM_EXECBUF_UTIL_H_
>>>    #define _TTM_EXECBUF_UTIL_H_
>>>
>>> +#include <linux/dma-resv.h>
>>>    #include <linux/list.h>
>>>
>>>    #include "ttm_bo_api.h"
>>> @@ -46,7 +47,7 @@
>>>    struct ttm_validate_buffer {
>>>        struct list_head head;
>>>        struct ttm_buffer_object *bo;
>>> -     unsigned int num_shared;
>>> +     enum dma_resv_usage usage;
>>>    };
>>>
>>>    /**

