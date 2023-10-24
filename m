Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A847D4515
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 03:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1D910E2CE;
	Tue, 24 Oct 2023 01:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F06910E2CA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 01:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTAHYrfYnNzN6MaoGjkEkGVkAz4TBelONiYtKPVvjt3ljUfmc3WTpbrgPS6iR0wsUqYSPqmmc8BSgDicxHBNSMTq6ertgk7XkKcFWBEMKWfLCshqM7eaBzsT6xbJnIPSvPHCXqvjOKaj4Z66Wbt/Dc10k8D3paHwHyvlbxAAnJcPIIRkuR5+db5ZyFf2m2imu/WZH9B54fzU1QS7OuLT5MFbtSLSRR+QjOxuJztfOG41vJyXNdQWv9iJfYSPg1q83jBdk+xFEtQlo4ixX5quBNO1rwLh8zlMqM5MP7dV8AsLAxQEYyrXtcrs1S3c7MYA2OyrLjVXjZBzW3R5c7kxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJ0549CrKC97o/ssxhoG3Rb/kcC8D+tMWqjtMp6stT4=;
 b=ONNPNQhuVNKtZzuw7zAjaxb12DEkz6zn4hxbW8Nz4eAQLr95lmms5zfi4HgNKSylBJtaLZrj9uy1qY8zMoJuD8k78/6K3dWFSNeYeMYe9NCjRzP2F54p6b04J1PRZTaj7ubnzkd3oP/ZYsuyafV2rcOMJ1hrIcK6yHvwY6MZodXrMRoUcN1Nk7PW0BUj4LkjWr7xA+9x6roRHeAZCBX/iCaZjI1H8U0umbbS3qjMbMb4gVjbA/+jiMWMIRVukp1iaONHufXhu5k3Bkr7vj3XK2pWQTAbihpWSPzXXmh6+LEBWDyQOvPjG4A/F1xMFBcS6dL6RrjYharAt0SJZLU4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJ0549CrKC97o/ssxhoG3Rb/kcC8D+tMWqjtMp6stT4=;
 b=rW2dBuJSS2Ec1+77DaPJkOU2bG4Z8p/KWJU7zcTbCVsDw2gU0E7EPMmuY5NSgffzFdzcWktzeR5eU4q+WYA9QP+WkkzZ6M3dVT4NR7cQPqSi9XXERUK9yr8+upz+wncWkYwYh3ZoFc452/07c9S4OuWAAeCbRDidAqfqFTnG6Co=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH0PR12MB5313.namprd12.prod.outlook.com (2603:10b6:610:d4::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.33; Tue, 24 Oct 2023 01:43:07 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%6]) with mapi id 15.20.6907.025; Tue, 24 Oct 2023
 01:43:07 +0000
Message-ID: <41b6f897-d058-4177-ad80-fccb88e99883@amd.com>
Date: Mon, 23 Oct 2023 21:43:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.3
Subject: Re: [PATCH drm-misc-next v2] drm/sched: implement dynamic job-flow
 control
Content-Language: en-CA, en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20231009223554.11846-1-dakr@redhat.com>
 <b52c58e4-8ae6-4272-a67e-d811c6359127@amd.com> <ZTb1LagGfX7vm3+0@pollux>
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
In-Reply-To: <ZTb1LagGfX7vm3+0@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0324.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::28) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH0PR12MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: ccaa98fa-0036-4bb2-4abd-08dbd432923c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YhARe1YEk8JWByiqdTCjouiAJLWC24s1P10yuUjIZs+8zvDQ6v1igRComzk1Nz/5VZySEZwEI+XKDFXu2fvgtelCW9YS1eKvPpU/eqVXWdLi0w+i54jjH0jqy+t5au/Rox2bdTpOqI9mLgsVKSKxnJsgMDL3D2RWYe1xOgF4rHLuXSvzoHlfj3hACoarb0MCqbVzATUKn7DMA7UEGjzkwfEGK10nb35Y8RA1MlvgNDts+WpNUekqlJ4CuOQb7lLujiJmf+2w/zjvmd0ptzjyd/cGIKM3I3I9e2gz8f1MHRzthBW5FsK9qTkoXdgGmRELlLzvFxH3NU1Q9rQVSa/0H4v8cTFakwqlI+gRWbBFcDYTOv8Aj43bPmYOdyEAr2i5lrr4F3FGRZpvt3fExyvFHi6Ow+B46Vx2cpo7ohvc3XEnRGWxhJJuJuJIhb+xKC2ozQyEALbTOl0K8/FxLR8WvQJjecJpeiX7+vMvpE82Gg8tMLGuw4F6lsOR+A/Q/Y4tsw4lq0YKaqR+gU8KTVApTIyUaUVJsqfOYh7fuCFkeuJoPME70zC132sYVJKjQnUIukm2zWF6PSdbXo/YyZbSq1x03uyEaL36P/AY9TOlz9LTv4ZGYpZp2cAOAcNQcS5Erduo0uqPWiYbaP7F3h44CQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(26005)(38100700002)(83380400001)(2616005)(6666004)(478600001)(6512007)(53546011)(6506007)(31686004)(66946007)(66476007)(66556008)(6486002)(8676002)(8936002)(4326008)(5660300002)(31696002)(30864003)(41300700001)(316002)(44832011)(6916009)(2906002)(4001150100001)(86362001)(66899024)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzlLa3MraGgxcFhKZXlkYVBFbkVmRnY4ZVIwZk90L2loWEFUT3RmN2p1Uk12?=
 =?utf-8?B?c3lMajExM2FteWh4c3E1cFhUOURlVGpUOWNUSUJhcUZlWXYrZUI2T0orai9h?=
 =?utf-8?B?bXhnbHJHUHUwU3R5M05WaXJ3c0YxYnlYMXIrclBPakhUYitYOEx4UzZXaVZv?=
 =?utf-8?B?V1JzT2dqWG10T1VxaE1nUXdTVXYxN2ZKWUMrdmpDQzAyYXdDTVBNbG1LQWRF?=
 =?utf-8?B?YmpldDBxNCtaaCttQk8zVlVvMnljdHNnTGR1bjVVMUVQZ1JOUmtkRVNaM1JQ?=
 =?utf-8?B?L2llVllnSnlXcTk3YkpHYWdqVXloR3BNM2VyRjJTd3gzeUlKSCtWN3NSNHVy?=
 =?utf-8?B?OGxwcEJvVzFDTEFZa2JETlhyc0loNWtGVXREaGNkNnl0UTF2STNldkpySWhi?=
 =?utf-8?B?WWdvWXgycC9pYlhWc3FITlllYlFJcGt6dW1YVGdMWUREZER4N3J5L2hmMjNj?=
 =?utf-8?B?Z2g5T2hmSE0xdW5pRDBqeGxlVkh3SW41emNCNEJUOVNqTlBnei9hb1dwcFNt?=
 =?utf-8?B?NnYwVnJ5Qm0rKy84OHhreUMwRHFSQ3cvdFN1NW9KcEVoQlRFL0lVbVFFK0Qr?=
 =?utf-8?B?bkdxQS9MVHNURmRjS2tIMDFmOGZqNUJtektRdDRHN2NmNmxOeDFhZER0RmFl?=
 =?utf-8?B?S0hSemFSY0NkOTBLeUVvakdrSTJiZkRkOGhqTGdnZmt0QjZQWDc2ek5tUE9u?=
 =?utf-8?B?U3ZBZkNFeHFEMjNPenU2UTBibmMwa3ljbzdxM0lkcFFzcGlBZ1pZR3dxKzgx?=
 =?utf-8?B?b2JDMk0xbzJnVU56L2RtWTFnbmVic0JTUVV5bGdGWVlhdVpTL0lYRFMyM2tJ?=
 =?utf-8?B?aWZXWUlXdjBtdEdmOFJkRTNBRitXa29uSlZkamZrV2R4bkZNTG5OeE83RkFk?=
 =?utf-8?B?a2JjWVZPOGZCSGdMZFFlOUtDSUlRNUV0VnpJOGowdEVmOG9IZWwraVovT25s?=
 =?utf-8?B?R3ZXci9lSWhqZlhZVWRFS25rSTlmY3diTU9zd3BBNUhlTE9aUUd5R29uRkVP?=
 =?utf-8?B?aDVWSkRqTHpsWXd1TE5wUmxlek5QV1N0N2hzeGlxV1hRcHFFR2dSS2t4R2tM?=
 =?utf-8?B?dzl4U2RJaS9ybjkxbHhsZXNnbjdSeW93Y1R5aTRZVHozQm9FNnA5Y3FrM0xX?=
 =?utf-8?B?enMxSkZpZVZoS1piL3dSZ3M3cFN1TDRJUncvUlBkUU9UNVN2d2prc2NUejZx?=
 =?utf-8?B?TGNnMjA3LzB0OFk3WWtOWE9LU09OeEtPdkc5Zm1ReFBoRWl1L2k2TTdtYThq?=
 =?utf-8?B?UmpxbEM2MGNsaVQrTzl3WG9Wa3hsWWFOQkxOcnlTZG5wWDZFaVVUZ3JIYmgy?=
 =?utf-8?B?Vm44Z0tobHJyRnU4ejFacGZuMzNMVjZpM2NCZGZzb3ZSazVPMzcwK1h1QmE2?=
 =?utf-8?B?UEdqRVFCb1ArYWFDeHY3MmpkME5SRlFUQU9Fb016OXZiRXJGVUZzMUlIOEpi?=
 =?utf-8?B?azN4QzdHcUZJODRSc1Q5ejhtZ3BBak51VElkekw1S2hibWordkoyZWpKdnc3?=
 =?utf-8?B?MUt2SXZjekNiRHgyTXdtNGxMRzZVT21JbEM3aFFFdjRTeXgzQ2l4WW56aDFp?=
 =?utf-8?B?QVEvSEJVUDhabU5ES3J2YS9RSUpadDF4Z3QrZlltcGhaYXhUU3Jmck5ycW0x?=
 =?utf-8?B?blJ4cXcydHpJWVBYd3AxNHFxbzRYeUtDdXpsb29Bc3lYcmpMU1VoQlVqSnZo?=
 =?utf-8?B?VnpqbGV5OE80Q1VCMElSMStyd0xjK0Fqbml4bHhLL1c2VUkxRXcwMjYyM2Fv?=
 =?utf-8?B?RnlRemVqOVd2azlXUTJvTlU4a0gyRVFoa1gwUnUzcXMrUGhiTjhDYVIzZldj?=
 =?utf-8?B?ZW1BNGdIaGFyZlRTSS95R3htNzhIV3VuSkhXWFArM3NYVnRVdjJubGlheWdv?=
 =?utf-8?B?dEFkVGZNUEZRdTMrQVJWVE1VOE5YTG9qRjNJV004NTA0b2lra0VXZDFidUlB?=
 =?utf-8?B?MUs1YzlRQVhvVEJmNEdvMVpPUUpQVjZ3ZGxteFNNN3lpWldNaTBhSVAyK0FX?=
 =?utf-8?B?N0NjSk5IM3NNZW5OdHMyR2VSTXdER2xOUjNJeEVKcHFCQ00ycmltd3hoOFFz?=
 =?utf-8?B?bzE1QVZGRHdxa3RHemZpMzdxSUwvM1lhY2htQlFySlBmYVVwTG1hdVZtTUow?=
 =?utf-8?Q?rVWaqlMGUnYWTY+XDfIURNBxD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccaa98fa-0036-4bb2-4abd-08dbd432923c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 01:43:07.3153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+yK5qJgaTOyk4xuFm+9jyu0n/41IONgX58ujikO769t5I79wOkYOU8F80zmxsPj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5313
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
Cc: matthew.brost@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-23 18:35, Danilo Krummrich wrote:
> On Wed, Oct 11, 2023 at 09:52:36PM -0400, Luben Tuikov wrote:
>> Hi,
>>
>> Thanks for fixing the title and submitting a v2 of this patch. Comments inlined below.
>>
>> On 2023-10-09 18:35, Danilo Krummrich wrote:
>>> Currently, job flow control is implemented simply by limiting the number
>>> of jobs in flight. Therefore, a scheduler is initialized with a
>>> submission limit that corresponds to the number of jobs which can be
>>> sent to the hardware.
>>>
>>> This implies that for each job, drivers need to account for the maximum
>>> job size possible in order to not overflow the ring buffer.
>>>
>>> However, there are drivers, such as Nouveau, where the job size has a
>>> rather large range. For such drivers it can easily happen that job
>>> submissions not even filling the ring by 1% can block subsequent
>>> submissions, which, in the worst case, can lead to the ring run dry.
>>>
>>> In order to overcome this issue, allow for tracking the actual job size
>>> instead of the number of jobs. Therefore, add a field to track a job's
>>> submission credits, which represents the number of credits a job
>>> contributes to the scheduler's submission limit.
>>>
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>> Changes in V2:
>>> ==============
>>>   - fixed up influence on scheduling fairness due to consideration of a job's
>>>     size
>>>     - If we reach a ready entity in drm_sched_select_entity() but can't actually
>>>       queue a job from it due to size limitations, just give up and go to sleep
>>>       until woken up due to a pending job finishing, rather than continue to try
>>>       other entities.
>>>   - added a callback to dynamically update a job's credits (Boris)
>>>   - renamed 'units' to 'credits'
>>>   - fixed commit message and comments as requested by Luben
>>> ---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   2 +-
>>>  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
>>>  drivers/gpu/drm/lima/lima_sched.c             |   2 +-
>>>  drivers/gpu/drm/msm/msm_gem_submit.c          |   2 +-
>>>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   2 +-
>>>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>>>  .../gpu/drm/scheduler/gpu_scheduler_trace.h   |   2 +-
>>>  drivers/gpu/drm/scheduler/sched_entity.c      |   5 +-
>>>  drivers/gpu/drm/scheduler/sched_main.c        | 101 +++++++++++++-----
>>>  drivers/gpu/drm/v3d/v3d_gem.c                 |   2 +-
>>>  include/drm/gpu_scheduler.h                   |  33 ++++--
>>>  11 files changed, 115 insertions(+), 40 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index 78476bc75b4e..d54daaf64bf1 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -115,7 +115,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>  	if (!entity)
>>>  		return 0;
>>>  
>>> -	return drm_sched_job_init(&(*job)->base, entity, owner);
>>> +	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
>>>  }
>>>  
>>>  int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>> index 45403ea38906..74a446711207 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>>> @@ -538,7 +538,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
>>>  
>>>  	ret = drm_sched_job_init(&submit->sched_job,
>>>  				 &ctx->sched_entity[args->pipe],
>>> -				 submit->ctx);
>>> +				 1, submit->ctx);
>>>  	if (ret)
>>>  		goto err_submit_put;
>>>  
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>> index 50c2075228aa..5dc6678e1eb9 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>> @@ -123,7 +123,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>  	for (i = 0; i < num_bos; i++)
>>>  		drm_gem_object_get(&bos[i]->base.base);
>>>  
>>> -	err = drm_sched_job_init(&task->base, &context->base, vm);
>>> +	err = drm_sched_job_init(&task->base, &context->base, 1, vm);
>>>  	if (err) {
>>>  		kfree(task->bos);
>>>  		return err;
>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> index 3f1aa4de3b87..6d230c38e4f5 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> @@ -48,7 +48,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>>  		return ERR_PTR(ret);
>>>  	}
>>>  
>>> -	ret = drm_sched_job_init(&submit->base, queue->entity, queue);
>>> +	ret = drm_sched_job_init(&submit->base, queue->entity, 1, queue);
>>>  	if (ret) {
>>>  		kfree(submit->hw_fence);
>>>  		kfree(submit);
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> index f26a814a9920..e991426d86e4 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> @@ -89,7 +89,7 @@ nouveau_job_init(struct nouveau_job *job,
>>>  
>>>  	}
>>>  
>>> -	ret = drm_sched_job_init(&job->base, &entity->base, NULL);
>>> +	ret = drm_sched_job_init(&job->base, &entity->base, 1, NULL);
>>>  	if (ret)
>>>  		goto err_free_chains;
>>>  
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> index b834777b409b..54d1c19bea84 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> @@ -274,7 +274,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>>>  
>>>  	ret = drm_sched_job_init(&job->base,
>>>  				 &file_priv->sched_entity[slot],
>>> -				 NULL);
>>> +				 1, NULL);
>>>  	if (ret)
>>>  		goto out_put_job;
>>>  
>>> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>>> index 3143ecaaff86..2e4ffdecc5dc 100644
>>> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>>> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
>>> @@ -51,7 +51,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>>>  			   __assign_str(name, sched_job->sched->name);
>>>  			   __entry->job_count = spsc_queue_count(&entity->job_queue);
>>>  			   __entry->hw_job_count = atomic_read(
>>> -				   &sched_job->sched->hw_rq_count);
>>> +				   &sched_job->sched->submission_count);
>>>  			   ),
>>>  	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
>>>  		      __entry->entity, __entry->id,
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 437c50867c99..6395090d5784 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -401,7 +401,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>>>  		container_of(cb, struct drm_sched_entity, cb);
>>>  
>>>  	drm_sched_entity_clear_dep(f, cb);
>>> -	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
>>> +	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity),
>>> +				      entity);
>>>  }
>>>  
>>>  /**
>>> @@ -645,7 +646,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>  		if (fifo)
>>>  			drm_sched_rq_update_fifo(entity, submit_ts);
>>>  
>>> -		drm_sched_wakeup_if_can_queue(sched);
>>> +		drm_sched_wakeup_if_can_queue(sched, entity);
>>>  	}
>>>  }
>>>  EXPORT_SYMBOL(drm_sched_entity_push_job);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 88ef8be2d3c7..da86dd0782d6 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -93,6 +93,9 @@ int drm_sched_policy_default = DRM_SCHED_POLICY_FIFO;
>>>  MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>>>  module_param_named(sched_policy, drm_sched_policy_default, int, 0444);
>>>  
>>> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>> +				struct drm_sched_entity *entity);
>>> +
>>>  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>>>  							    const struct rb_node *b)
>>>  {
>>> @@ -212,13 +215,15 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>  /**
>>>   * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
>>>   *
>>> + * @sched: the gpu scheduler
>>>   * @rq: scheduler run queue to check.
>>>   * @dequeue: dequeue selected entity
>>>   *
>>>   * Try to find a ready entity, returns NULL if none found.
>>>   */
>>>  static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>> +drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>>> +			      struct drm_sched_rq *rq, bool dequeue)
>>>  {
>>>  	struct drm_sched_entity *entity;
>>>  
>>> @@ -228,6 +233,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>>  	if (entity) {
>>>  		list_for_each_entry_continue(entity, &rq->entities, list) {
>>>  			if (drm_sched_entity_is_ready(entity)) {
>>> +				/* If we can't queue yet, preserve the current
>>> +				 * entity in terms of fairness.
>>> +				 */
>>> +				if (!drm_sched_can_queue(sched, entity))
>>> +					goto out;
>>> +
>>>  				if (dequeue) {
>>>  					rq->current_entity = entity;
>>>  					reinit_completion(&entity->entity_idle);
>>> @@ -239,8 +250,13 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>>  	}
>>>  
>>>  	list_for_each_entry(entity, &rq->entities, list) {
>>> -
>>>  		if (drm_sched_entity_is_ready(entity)) {
>>> +			/* If we can't queue yet, preserve the current entity in
>>> +			 * terms of fairness.
>>> +			 */
>>> +			if (!drm_sched_can_queue(sched, entity))
>>> +				goto out;
>>> +
>>>  			if (dequeue) {
>>>  				rq->current_entity = entity;
>>>  				reinit_completion(&entity->entity_idle);
>>> @@ -253,21 +269,23 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
>>>  			break;
>>>  	}
>>>  
>>> +out:
>>>  	spin_unlock(&rq->lock);
>>> -
>>>  	return NULL;
>>>  }
>>>  
>>>  /**
>>>   * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
>>>   *
>>> + * @sched: the gpu scheduler
>>>   * @rq: scheduler run queue to check.
>>>   * @dequeue: dequeue selected entity
>>>   *
>>>   * Find oldest waiting ready entity, returns NULL if none found.
>>>   */
>>>  static struct drm_sched_entity *
>>> -drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>>> +drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>>> +				struct drm_sched_rq *rq, bool dequeue)
>>>  {
>>>  	struct rb_node *rb;
>>>  
>>> @@ -277,6 +295,15 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
>>>  
>>>  		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>>>  		if (drm_sched_entity_is_ready(entity)) {
>>> +			/* If we can't queue yet, don't pick another entity
>>> +			 * which's job might fit and wait until we got space for
>>> +			 * this one in terms of fairness.
>>> +			 */
>>> +			if (!drm_sched_can_queue(sched, entity)) {
>>> +				spin_unlock(&rq->lock);
>>> +				return NULL;
>>> +			}
>>> +
>>
>> I wonder if here it would've been cleaner to just do,
>>
>> 			if (!drm_sched_can_queue(sched, entity)) {
>> 				rb = NULL;
>> 				break;
>> 			}
>>
>> in order to follow the natural flow of the R-B tree search?
>> In other words, the loop invariant becomes false, we exit the loop,
>> unlock and return NULL.
>>
>> Yeah, let's do that.
>>
>>>  			if (dequeue) {
>>>  				rq->current_entity = entity;
>>>  				reinit_completion(&entity->entity_idle);
>>> @@ -302,13 +329,32 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>>>  /**
>>>   * drm_sched_can_queue -- Can we queue more to the hardware?
>>>   * @sched: scheduler instance
>>> + * @entity: the scheduler entity
>>>   *
>>> - * Return true if we can push more jobs to the hw, otherwise false.
>>> + * Return true if we can push at least one more job from @entity, false
>>> + * otherwise.
>>>   */
>>> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>>> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>> +				struct drm_sched_entity *entity)
>>>  {
>>> -	return atomic_read(&sched->hw_rq_count) <
>>> -		sched->hw_submission_limit;
>>> +	struct drm_sched_job *s_job;
>>> +
>>> +	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>> +	if (!s_job)
>>> +		return false;
>>> +
>>> +	if (sched->ops->update_job_credits) {
>>> +		u32 credits = sched->ops->update_job_credits(s_job);
>>> +
>>> +		if (credits)
>>> +			s_job->submission_credits = credits;
>>> +	}
>>> +
>>> +	WARN_ON(s_job->submission_credits > sched->submission_limit);
>>> +
>>> +	return (sched->submission_limit -
>>> +		atomic_read(&sched->submission_count)) >=
>>> +		s_job->submission_credits;
>>>  }
>>>  
>>>  /**
>>> @@ -325,12 +371,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>>  	struct drm_sched_entity *entity;
>>>  	int i;
>>>  
>>> -	if (!drm_sched_can_queue(sched))
>>> -		return NULL;
>>> -
>>>  	if (sched->single_entity) {
>>>  		if (!READ_ONCE(sched->single_entity->stopped) &&
>>> -		    drm_sched_entity_is_ready(sched->single_entity))
>>> +		    drm_sched_entity_is_ready(sched->single_entity) &&
>>> +		    drm_sched_can_queue(sched, sched->single_entity))
>>>  			return sched->single_entity;
>>
>> This mixing of the Xe patches and this patch is very, very annoying.
>> Here and in RR picking the entity mix-up with "dequeue" which is
>> now "peek"...
>>
>> I'd like to have applied this patch to drm-misc-next and inspect it further,
>> but cannot chase around which version of the Xe patches this patch applies
>> to, cleanly, so I'd really rather have had this patch on a clean drm-misc-next
>> tree.
> 
> I really would prefer to continue basing it on Matt's scheduler patches. Reason
> for that is that all drivers that require this patch need Matt's patches as
> well. The only thing we'd achieve is that people (including me) need to either
> rebase Matt's patches onto this one or the other way around themselfs. This
> would simply be wasted effort and in case this patch lands before Matt's series,
> he'd also need to wrap his head around this patch as well. Hence, let's keep it
> simple. If you agree, for the next version I will simply also push a branch with
> this patch at its HEAD such that it becomes easy checking the patch out.
> 
> Otherwise, the other comments look good, gonna address them in the next version.

Yes, whatever is easier for you, and I completely understand the logic here
of the patch going with Xe changes, but it's a small and important patch, and
ideally it should stand on its own (as it does), so having it on a clean drm-*
branch would be good too. :-)

But sometimes I run the patches on a live kernel, and I like to see them against
the current drm-*. If I really want to make sure a patch works, I apply it on top
of Linus' latest and run my system with that to really make sure all is good.

My plan is to have Matt's patches in before the holidays, but they'll change somewhat
as I'm trying to simplify, i.e. less code changes exhibit wider behaviour range,
and some patches will be dropped, as the dynamic sched_rq will simplify things.

What is blocking the dynamic sched_rq is a bug/abuse in amdgpu which I submitted
a patch for (so that the drm dynamic sched_rq can go in without breaking amdgpu),
but that patch went into the "look at the history maybe we were doing it correct
back then", instead of just fixing it in amdgpu to let the DRM patch in, and then
we can fix that up locally in amdgpu later.

Sure, you can have the patch be a HEAD commit, and I'd still try to apply it
to a drm-misc-next or drm-misc-fixes or even 6.6.0-rc7. :-)

Thanks!

Regards,
Luben

> 
> - Danilo
> 
>>
>>>  
>>>  		return NULL;
>>> @@ -339,9 +383,11 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
>>>  	/* Kernel run queue has higher priority than normal run queue*/
>>>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>  		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>>> -			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
>>> +			drm_sched_rq_select_entity_fifo(sched,
>>> +							&sched->sched_rq[i],
>>>  							dequeue) :
>>> -			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
>>> +			drm_sched_rq_select_entity_rr(sched,
>>> +						      &sched->sched_rq[i],
>>>  						      dequeue);
>>>  		if (entity)
>>>  			break;
>>> @@ -399,7 +445,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>>>  	struct drm_sched_fence *s_fence = s_job->s_fence;
>>>  	struct drm_gpu_scheduler *sched = s_fence->sched;
>>>  
>>> -	atomic_dec(&sched->hw_rq_count);
>>> +	atomic_sub(s_job->submission_credits, &sched->submission_count);
>>>  	atomic_dec(sched->score);
>>>  
>>>  	trace_drm_sched_process_job(s_fence);
>>> @@ -622,7 +668,8 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>  					      &s_job->cb)) {
>>>  			dma_fence_put(s_job->s_fence->parent);
>>>  			s_job->s_fence->parent = NULL;
>>> -			atomic_dec(&sched->hw_rq_count);
>>> +			atomic_sub(s_job->submission_credits,
>>> +				   &sched->submission_count);
>>>  		} else {
>>>  			/*
>>>  			 * remove job from pending_list.
>>> @@ -683,7 +730,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>>>  	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>>  		struct dma_fence *fence = s_job->s_fence->parent;
>>>  
>>> -		atomic_inc(&sched->hw_rq_count);
>>> +		atomic_add(s_job->submission_credits, &sched->submission_count);
>>>  
>>>  		if (!full_recovery)
>>>  			continue;
>>> @@ -764,6 +811,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>>   * drm_sched_job_init - init a scheduler job
>>>   * @job: scheduler job to init
>>>   * @entity: scheduler entity to use
>>> + * @submission_credits: the number of credits this job contributes to the
>>> + * schdulers submission limit
>>
>> Spelling: "schedulers"!
>>
>> Please run your patch through scripts/checkpatch.pl --strict and inspect what it says.
>>
>>>   * @owner: job owner for debugging
>>>   *
>>>   * Refer to drm_sched_entity_push_job() documentation
>>> @@ -781,6 +830,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>>   */
>>>  int drm_sched_job_init(struct drm_sched_job *job,
>>>  		       struct drm_sched_entity *entity,
>>> +		       u32 submission_credits,
>>>  		       void *owner)
>>>  {
>>>  	if (!entity->rq && !entity->single_sched)
>>> @@ -792,6 +842,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>  		return -ENOMEM;
>>>  
>>>  	INIT_LIST_HEAD(&job->list);
>>> +	job->submission_credits = submission_credits ? submission_credits : 1;
>>>  
>>>  	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
>>>  
>>> @@ -1004,12 +1055,14 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>>>  /**
>>>   * drm_sched_wakeup_if_can_queue - Wake up the scheduler
>>>   * @sched: scheduler instance
>>> + * @entity: the scheduler entity
>>>   *
>>>   * Wake up the scheduler if we can queue jobs.
>>>   */
>>> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
>>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
>>> +				   struct drm_sched_entity *entity)
>>>  {
>>> -	if (drm_sched_can_queue(sched))
>>> +	if (drm_sched_can_queue(sched, entity))
>>>  		drm_sched_run_job_queue(sched);
>>>  }
>>>  
>>> @@ -1147,7 +1200,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>  
>>>  	s_fence = sched_job->s_fence;
>>>  
>>> -	atomic_inc(&sched->hw_rq_count);
>>> +	atomic_add(sched_job->submission_credits, &sched->submission_count);
>>>  	drm_sched_job_begin(sched_job);
>>>  
>>>  	trace_drm_run_job(sched_job, entity);
>>> @@ -1183,7 +1236,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>   * @ops: backend operations for this scheduler
>>>   * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
>>>   *	       allocated and used
>>> - * @hw_submission: number of hw submissions that can be in flight
>>> + * @max_submission_credits: number of submission credits that can be in flight
>>
>> Let's not use "in flight". Perhaps it is better to say,
>>
>>  * @max_submission_credits: number of submission credits this scheduler can hold
>>  *                          from all jobs,
>>
>>>   * @hang_limit: number of times to allow a job to hang before dropping it
>>>   * @timeout: timeout value in jiffies for the scheduler
>>>   * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
>>> @@ -1198,7 +1251,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
>>>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>  		   const struct drm_sched_backend_ops *ops,
>>>  		   struct workqueue_struct *submit_wq,
>>> -		   unsigned hw_submission, unsigned hang_limit,
>>> +		   unsigned max_submission_credits, unsigned hang_limit,
>>>  		   long timeout, struct workqueue_struct *timeout_wq,
>>>  		   atomic_t *score, const char *name,
>>>  		   enum drm_sched_policy sched_policy,
>>> @@ -1211,7 +1264,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>  
>>>  	sched->ops = ops;
>>>  	sched->single_entity = NULL;
>>> -	sched->hw_submission_limit = hw_submission;
>>> +	sched->submission_limit = max_submission_credits;
>>>  	sched->name = name;
>>>  	if (!submit_wq) {
>>>  		sched->submit_wq = alloc_ordered_workqueue(name, 0);
>>> @@ -1238,7 +1291,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>  	init_waitqueue_head(&sched->job_scheduled);
>>>  	INIT_LIST_HEAD(&sched->pending_list);
>>>  	spin_lock_init(&sched->job_list_lock);
>>> -	atomic_set(&sched->hw_rq_count, 0);
>>> +	atomic_set(&sched->submission_count, 0);
>>>  	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>>>  	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>>  	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>> index 2e94ce788c71..8479e5302f7b 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>> @@ -417,7 +417,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>>>  	job->free = free;
>>>  
>>>  	ret = drm_sched_job_init(&job->base, &v3d_priv->sched_entity[queue],
>>> -				 v3d_priv);
>>> +				 1, v3d_priv);
>>>  	if (ret)
>>>  		goto fail;
>>>  
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 27f5778bbd6d..c4a53b259585 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -329,6 +329,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>>>   * @sched: the scheduler instance on which this job is scheduled.
>>>   * @s_fence: contains the fences for the scheduling of job.
>>>   * @finish_cb: the callback for the finished fence.
>>> + * @submission_credits: the number of submission credits this job contributes to
>>> + *                      the scheduler
>>>   * @work: Helper to reschdeule job kill to different context.
>>>   * @id: a unique id assigned to each job scheduled on the scheduler.
>>>   * @karma: increment on every hang caused by this job. If this exceeds the hang
>>> @@ -348,6 +350,8 @@ struct drm_sched_job {
>>>  	struct drm_gpu_scheduler	*sched;
>>>  	struct drm_sched_fence		*s_fence;
>>>  
>>> +	u32				submission_credits;
>>> +
>>>  	/*
>>>  	 * work is used only after finish_cb has been used and will not be
>>>  	 * accessed anymore.
>>> @@ -471,6 +475,21 @@ struct drm_sched_backend_ops {
>>>           * and it's time to clean it up.
>>>  	 */
>>>  	void (*free_job)(struct drm_sched_job *sched_job);
>>> +
>>> +	/**
>>> +	 * @update_job_credits: Called once the scheduler is considering this
>>> +	 * job for execution.
>>> +	 *
>>> +	 * Drivers may use this to update the job's submission credits, which is
>>> +	 * useful to e.g. deduct the number of native fences which have been
>>> +	 * signaled meanwhile.
>>> +	 *
>>> +	 * The callback must either return the new number of submission credits
>>> +	 * for the given job, or zero if no update is required.
>>> +	 *
>>> +	 * This callback is optional.
>>> +	 */
>>> +	u32 (*update_job_credits)(struct drm_sched_job *sched_job);
>>>  };
>>
>> That's good.
>>
>>>  
>>>  /**
>>> @@ -478,14 +497,14 @@ struct drm_sched_backend_ops {
>>>   *
>>>   * @ops: backend operations provided by the driver.
>>>   * @single_entity: Single entity for the scheduler
>>> - * @hw_submission_limit: the max size of the hardware queue.
>>> + * @submission_limit: the maximim number of submission credits
>>> + * @submission_count: the number of submission credits in flight
>>
>> Is this clear enough?
>>
>> I mean, what really is a "submission_limit"? What is it limiting really?
>> Number of what? "Submissions"? No. It's credits.
>>
>> ("Submission" seems to have become very popular, see
>>  Message-ID: <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>, maybe through Lore.)
>>
>> So if "submission_credit_limit" and "submission_credit_count"
>> seem too wordy, (and they kind of are), then perhaps use,
>>
>> 	@credit_limit: the credit limit of this scheduler
>> 	@credit_count: the current credit count of this scheduler
>>
>> Also note the slight comment update for those two quantities.
>>
>>>   * @timeout: the time after which a job is removed from the scheduler.
>>>   * @name: name of the ring for which this scheduler is being used.
>>>   * @sched_rq: priority wise array of run queues.
>>>   * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
>>>   *                 waits on this wait queue until all the scheduled jobs are
>>>   *                 finished.
>>> - * @hw_rq_count: the number of jobs currently in the hardware queue.
>>>   * @job_id_count: used to assign unique id to the each job.
>>>   * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>>>   * @timeout_wq: workqueue used to queue @work_tdr
>>> @@ -511,12 +530,12 @@ struct drm_sched_backend_ops {
>>>  struct drm_gpu_scheduler {
>>>  	const struct drm_sched_backend_ops	*ops;
>>>  	struct drm_sched_entity		*single_entity;
>>> -	uint32_t			hw_submission_limit;
>>> +	u32				submission_limit;
>>> +	atomic_t			submission_count;
>>
>> See above. Perhaps "credit_limit" and "credit_count".
>>
>>>  	long				timeout;
>>>  	const char			*name;
>>>  	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
>>>  	wait_queue_head_t		job_scheduled;
>>> -	atomic_t			hw_rq_count;
>>>  	atomic64_t			job_id_count;
>>>  	struct workqueue_struct		*submit_wq;
>>>  	struct workqueue_struct		*timeout_wq;
>>> @@ -539,7 +558,7 @@ struct drm_gpu_scheduler {
>>>  int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>  		   const struct drm_sched_backend_ops *ops,
>>>  		   struct workqueue_struct *submit_wq,
>>> -		   uint32_t hw_submission, unsigned hang_limit,
>>> +		   uint32_t max_submission_credits, unsigned hang_limit,
>>>  		   long timeout, struct workqueue_struct *timeout_wq,
>>>  		   atomic_t *score, const char *name,
>>>  		   enum drm_sched_policy sched_policy,
>>> @@ -548,6 +567,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>  int drm_sched_job_init(struct drm_sched_job *job,
>>>  		       struct drm_sched_entity *entity,
>>> +		       u32 submission_credits,
>>>  		       void *owner);
>>>  void drm_sched_job_arm(struct drm_sched_job *job);
>>>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>> @@ -570,7 +590,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>  
>>>  void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
>>>  void drm_sched_job_cleanup(struct drm_sched_job *job);
>>> -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
>>> +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched,
>>> +				   struct drm_sched_entity *entity);
>>>  bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
>>>  void drm_sched_submit_stop(struct drm_gpu_scheduler *sched);
>>>  void drm_sched_submit_start(struct drm_gpu_scheduler *sched);
>>
>> -- 
>> Regards,
>> Luben
>>
> 

