Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C9F7B9AA8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 06:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45D310E14D;
	Thu,  5 Oct 2023 04:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EB610E14D;
 Thu,  5 Oct 2023 04:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGpfa1b3k+gX9fN4hhH4s6LugDJDHiBmOAS2XKxd2mu5EAjksseTZl4/P1JT5+MD/OWZJi2pu+TzL0+0B7fB9qvWIZ1PTh3LRofUwNIvSaT6udcFx9EZAVfaGuT95QEzQroeVf4AWoPqhU7RPR9kbVRvzepV7ahcrYNYhmu2VozdzUKsAbo/HZ7fNQQjW3zPDZ2I/iLjMzaCm9g0H7dxGQbRlTR1CUvixxfmN5arbijwtieoWfV7fAxc5IckXFelzr/SZ5vUiirqOC+NmjF6/78rsFgyJdujvZnrb9YUPZgxH7pcx2dWiZltDhKpJcurDNNve5260t4Y18KOD49S6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU1kPzP2MyktP371vS+KH0WaEKxCdngOgOTSDUQuVj0=;
 b=RBz3MIYV5MZ7cZq9vIsbeDFi7g3n3MaVH/Y6+O0S4esdz/W156NOMksCb8A30wnDN522cSQB+cdwKYhXDxsRGDypteZFLrHgfH0kjGlVNsFGtZg9fMlmaDQv/ZceeVVyrvfRpdopTM0Dk7ppJP5wjMACGQFTKUS1N8hmjDH9dSFUIWgkmexyYy8GO/fJnJqrzbGx7BJQCvHl72cyBDjxTspk7EqN9YEv440PTG/w34VpZmHeX9gh1zq6/65TDySVKjEBdEnQvZYXrKNa0HeY9o++X98m811iPsumGcp310sx0YZfHXOZLTBT97MDWysL0VXwPPusQsObKM2Q2q646Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XU1kPzP2MyktP371vS+KH0WaEKxCdngOgOTSDUQuVj0=;
 b=qzBvJ+AVldBziG7Utgn07CIziUmeyk2SYwBJgyblPEvEbtXCdKc0ZCWQIHPOqRZtMuZnadgJuC7awPUfXyUudTs9kX15Qczfm7bC2ZVl5EVc8vmp70o+UPgcgQB34x9Y6WqxMT5S2eZhHwA40gRoW4PFZgP2W4mL1R/gEY4ZrcI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB7259.namprd12.prod.outlook.com (2603:10b6:510:207::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 04:13:06 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 5 Oct 2023
 04:13:06 +0000
Message-ID: <a39eb381-4f2b-439b-b223-c5148167b225@amd.com>
Date: Thu, 5 Oct 2023 00:13:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.1
Subject: Re: [PATCH v4 02/10] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-3-matthew.brost@intel.com>
 <bb9ab46d-326f-4ba9-b0a0-fcede8946a6b@amd.com>
 <ZR4upS/Mkh0lkzJ0@DUT025-TGLU.fm.intel.com>
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
In-Reply-To: <ZR4upS/Mkh0lkzJ0@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0131.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::34) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 273b5c9f-9d68-4819-e20d-08dbc5595ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BR4ewu8xhWB+PeJ5/oncVRReGY8b6s9UEFVsG9fkUSHsBaf6BO9F/+QcWyvgdi/Zr2NzKoSwfBk/NvTg243jbuduPm6EOx+J2DmfZK3tchmh3UnUdEK0tJrrGNu6owWeHWAzuT7bLSksHlWyTYzSI2S+ujwHoZbyp/k08KmusoOohOr2YQxYmo6jM4X0L9/qDruvVZdJp5B0u290HTSkk+91wOgCZgbz/zZcXKk4dmBQJwt+wwjFYt6vd+85Vr00X7MlIuizurst5XqgEAB83lk63IeWsP/k0yZdQ7BjjZRZ3U3R+dojaZR2XffYeWMgpd3j0tEPxBZz3NMbiFs9Ch5PCtLK9660c21WGFe9K9v3dWfMWdnMXBqYkBfg6KTdQ87MLE8+/laMdRC0RwvR/j0A08OA7Y8v3CI/LyQHOrs9VPYQk+B1FBjNbLTedJATEkVr67/2CI4f+Bws8klnSLxjvLi9AQY8ffJ07RIpQXPc9Jk20D+E1fOLCFglNdDAX6Xxu+sPAKqV7l+sMKJcY1bGXbeZdnnNZUkbyp1lJunydYYV//SqomB1MWrbZ3FVI1WRoFWovZLBLNNSJGCni8T8apdZAHhGFeuE2z+W7drXAT6jTm2NPSM082Qincqa+A2mDbIMZDQ7Pf4CLstziQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(230922051799003)(1800799009)(451199024)(186009)(31686004)(7416002)(44832011)(5660300002)(8676002)(2906002)(4326008)(8936002)(2616005)(66946007)(6916009)(66476007)(66556008)(26005)(6666004)(6506007)(36756003)(53546011)(6512007)(38100700002)(83380400001)(86362001)(31696002)(508600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WURLbzZSdndyU2lZTXg3UHdGTWFzOWZnWkZNSkVuVURrNkMvU2lPbFlheVZB?=
 =?utf-8?B?bUs2a3ZVMTVsRmF0VGVCakVHbCsrTThVRWM1NS9PaGJXblNaT08rdjJuMkVs?=
 =?utf-8?B?QmlhY25BRTkrUUIwdUZvZnowU3I3UG8rYitGeGxXZHhGZlIyYnlJTjhDMTk4?=
 =?utf-8?B?SXg0ckEzeXlBcEcvWTA1R0hjbkJzUU85QmtWZ0xYV1lqMng5SC9ZNFNrSjVF?=
 =?utf-8?B?YmY5SzN6RTBqMTdab2xQTzFKd092dENOWk5IMmhmNmRNOGpjTkgvVzBIYUhW?=
 =?utf-8?B?R01CQ3F4L0d3UmRiTHhiekpyb3dkK3lRNGRyTkdDZFpxcTVqOGJyREQ2cGpu?=
 =?utf-8?B?eTZVOXpYNEF5MnlMSlhyTTBram5EeER1WVU2MHZhdG1GRHJydnBpZE1sM2dG?=
 =?utf-8?B?VlVyek1iV2lUZ09BOWVJU3h5MFZQSnNWbFBLSm16VVVMSUtnNmFObkFnVklJ?=
 =?utf-8?B?Qlhmc1pPUCtRYzB4aDZaSGJXR1I2TU9zYWFuMnBPdHJoK04vQ0VLQ3FqTi91?=
 =?utf-8?B?R0Q0YXVFNDJlNmhlL3N5d1pwOE1lU3M4dFZEUngwWVZrejlPSUdWd2JscEMz?=
 =?utf-8?B?NHBzeE9uUU9pS1BtVEF4M3pJbm5rQUxwT3IwNFppS1VVUHFwS1hVcnEzKzAr?=
 =?utf-8?B?ZE5ubDk2a3VMdjg5ckNtNHYvM2RYKytFZzBmMWFhNVFOUlQxaTFHV2NTYTdu?=
 =?utf-8?B?UDhldTZsOHdyeVlJSG1iKzN4QXBoaXhEU0pOTG5GSEcwMUhnRTNDZjNpK1V6?=
 =?utf-8?B?Mi9OQ0pZMUxvR2g0RVpEaldyTFE1M3NSNHhaZDY3dW0yaUhKNTZRUEo3WHdm?=
 =?utf-8?B?d3FZN0NncU9HWC9iZmhxcCtaMEtZMU4yL1FlR1M4U1REcEptR29aM1k4QWNM?=
 =?utf-8?B?T1ROdVphem9QZVVzUVFrUjJZTFFVTzkyVXR3Z2ZreTZhY21RZHNBdGt5Smxt?=
 =?utf-8?B?dVZnWXVyaC9NZngyVTBiN1RXQlR0d3dUNnJhckFsSy9acDZ3Nmc3VnlGTm9M?=
 =?utf-8?B?R1JDbzlTVXFiYnQxaTU2T2YvZG1IeEQrTVZBRGpwWGRzdVNPSjBib2kyemx1?=
 =?utf-8?B?T0taK2RPdkZYOE5DNEliby9iRU1EWEFuKzRFQmtYaGNFYW5xV0Q2dVg2R0pW?=
 =?utf-8?B?MzQwcGl4cU83ZmlBSHNBUHRoU1J5R0trWEI4aHZzQk9CYk5kcnIyWGUzKzRo?=
 =?utf-8?B?c21zbmphNnAwQVBoZWN3RkxubVh2SHN3VmxqVjRnbzJwZUNqa2gxR0hBa1B0?=
 =?utf-8?B?Q3VzbFpMaXlodzhOVUt4NGVaL0cwTTUrbGFRbjVCaldhUWE1bytFaVJVNHBJ?=
 =?utf-8?B?TnhBMVVJMmt6cHFmN3kzdkNOL1ErTVZUc3B3VU1BOERoTDdidW1OTmM2bC9I?=
 =?utf-8?B?OCtocGY5b0liU3dqUStHdytVQ2VESkRQdXg1L2JYL2dFUWdnNVNoY2JUZVNR?=
 =?utf-8?B?SC9xZFJib2tKemNXWkQ3bGpncUFQanFHRWo2b2JkcDMyL3pvRkh6OGd2cGpu?=
 =?utf-8?B?RGtVdUpXaUkxV1ZocktKRXJqUERFa1VlTnI4ZStuWkVidEFGNHFUUEVIWS9k?=
 =?utf-8?B?Yjk2Sy8wQ0syZVZhbEs0YUVHZkdaZDBxRlFoRmE4QnRtN3I3WVJlVDFEK0hS?=
 =?utf-8?B?RTVPUjFvK2tYOFZBaktKajRJcVNjTmFDL3VVWUJnWUk5R1R1dHRwYmt2OUwv?=
 =?utf-8?B?S0gxS3kzNkNUVXVnUzJUS05qOUJjT0FxOXNSNWhEQkoyU1kwV3lXREIwTENv?=
 =?utf-8?B?ZzVQbmF5dE9FNUZkSFpIdDgxUVY2VFMvMEJSYVhLMk9DbVVtN3gyakZacENV?=
 =?utf-8?B?VS9TT2RRY294c2t3VCs4dUtTZ3poRzNmSjdFZFc1QmkvdTBTSWdHY2Q3VXFP?=
 =?utf-8?B?UFRNNnNpOUcyU2pRTld3K2tHR1NXL2pvWFNIUXRvWkl1TlVuTldpa3hTcU5B?=
 =?utf-8?B?K0xFQjgweFZXa3lCUzZuQWlOZ0NhbUk5TVdYbGlSaUZMWDdlb091WjI3cjNE?=
 =?utf-8?B?UzRYbmx4dTIwOFJrVXE2ZTZNa05qVXdZQkpwUXpvc0NwTkk4bys3QzZhOWpt?=
 =?utf-8?B?ZWFrcnU3TFRXdmZOYW9pWWlWalBnMVYvdkJ4SUpFN2V1VW1XZjVGZSt3Rnhx?=
 =?utf-8?Q?JCoin9y5qdqtXRpGKwn+x3G6n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273b5c9f-9d68-4819-e20d-08dbc5595ff6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 04:13:05.7380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +If9ZqhCNungdGLHYjdKBISvnYZ+DQJXzrtrMWoM2iVLn2uep6w71ozD8KJ3suax
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7259
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
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-04 23:33, Matthew Brost wrote:
> On Tue, Sep 26, 2023 at 11:32:10PM -0400, Luben Tuikov wrote:
>> Hi,
>>
>> On 2023-09-19 01:01, Matthew Brost wrote:
>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
>>> seems a bit odd but let us explain the reasoning below.
>>>
>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>> guaranteed to be the same completion even if targeting the same hardware
>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>> which allowed to reorder, timeslice, and preempt submissions. If a using
>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
>>> apart as the TDR expects submission order == completion order. Using a
>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>
>>> 2. In XE submissions are done via programming a ring buffer (circular
>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
>>> control on the ring for free.
>>>
>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>> kthread for submission / job cleanup. This doesn't scale if a large
>>> number of drm_gpu_scheduler are used. To work around the scaling issue,
>>> use a worker rather than kthread for submission / job cleanup.
>>>
>>> v2:
>>>   - (Rob Clark) Fix msm build
>>>   - Pass in run work queue
>>> v3:
>>>   - (Boris) don't have loop in worker
>>> v4:
>>>   - (Tvrtko) break out submit ready, stop, start helpers into own patch
>>> v5:
>>>   - (Boris) default to ordered work queue
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
>>>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
>>>  drivers/gpu/drm/lima/lima_sched.c          |   2 +-
>>>  drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
>>>  drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
>>>  drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
>>>  drivers/gpu/drm/scheduler/sched_main.c     | 118 ++++++++++-----------
>>>  drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
>>>  include/drm/gpu_scheduler.h                |  14 ++-
>>>  9 files changed, 79 insertions(+), 75 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index e366f61c3aed..16f3cfe1574a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2279,7 +2279,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>  			break;
>>>  		}
>>>  
>>> -		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>> +		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
>>>  				   ring->num_hw_submission, 0,
>>>  				   timeout, adev->reset_domain->wq,
>>>  				   ring->sched_score, ring->name,
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> index 345fec6cb1a4..618a804ddc34 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> @@ -134,7 +134,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>>  {
>>>  	int ret;
>>>  
>>> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>>> +	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>>>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>>>  			     msecs_to_jiffies(500), NULL, NULL,
>>>  			     dev_name(gpu->dev), gpu->dev);
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>> index ffd91a5ee299..8d858aed0e56 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>> @@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>>>  
>>>  	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>>>  
>>> -	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
>>> +	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>>>  			      lima_job_hang_limit,
>>>  			      msecs_to_jiffies(timeout), NULL,
>>>  			      NULL, name, pipe->ldev->dev);
>>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> index 40c0bc35a44c..b8865e61b40f 100644
>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>> @@ -94,7 +94,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>>  	 /* currently managing hangcheck ourselves: */
>>>  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>>>  
>>> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>>> +	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>>>  			num_hw_submissions, 0, sched_timeout,
>>>  			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
>>
>> checkpatch.pl complains here about unmatched open parens.
>>
> 
> Will fix and run checkpatch before posting next rev.
> 
>>>  	if (ret) {
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> index 88217185e0f3..d458c2227d4f 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> @@ -429,7 +429,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>>>  	if (!drm->sched_wq)
>>>  		return -ENOMEM;
>>>  
>>> -	return drm_sched_init(sched, &nouveau_sched_ops,
>>> +	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>>>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
>>>  			      NULL, NULL, "nouveau_sched", drm->dev->dev);
>>>  }
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> index 033f5e684707..326ca1ddf1d7 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> @@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>>>  		js->queue[j].fence_context = dma_fence_context_alloc(1);
>>>  
>>>  		ret = drm_sched_init(&js->queue[j].sched,
>>> -				     &panfrost_sched_ops,
>>> +				     &panfrost_sched_ops, NULL,
>>>  				     nentries, 0,
>>>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>  				     pfdev->reset.wq,
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index e4fa62abca41..ee6281942e36 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -48,7 +48,6 @@
>>>   * through the jobs entity pointer.
>>>   */
>>>  
>>> -#include <linux/kthread.h>
>>>  #include <linux/wait.h>
>>>  #include <linux/sched.h>
>>>  #include <linux/completion.h>
>>> @@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
>>>  	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
>>>  }
>>>  
>>> +/**
>>> + * drm_sched_submit_queue - scheduler queue submission
>>
>> There is no verb in the description, and is not clear what
>> this function does unless one reads the code. Given that this
>> is DOC, this should be clearer here. Something like "queue
>> scheduler work to be executed" or something to that effect.
>>
> 
> Will fix.
>  
>> Coming back to this from reading the patch below, it was somewhat
>> unclear what "drm_sched_submit_queue()" does, since when reading
>> below, "submit" was being read by my mind as an adjective, as opposed
>> to a verb. Perhaps something like:
>>
>> drm_sched_queue_submit(), or
>> drm_sched_queue_exec(), or
>> drm_sched_queue_push(), or something to that effect. You pick. :-)
>>
> 
> I prefer the name as is. In this patch we have:
> 
> drm_sched_submit_queue()
> drm_sched_submit_start)
> drm_sched_submit_stop()
> drm_sched_submit_ready()
> 
> I like all these functions start with 'drm_sched_submit' which allows
> for easy searching for the functions that touch the DRM scheduler
> submission state.
> 
> With a little better doc are you fine with the names as is.

Notice the following scheme in the naming,

drm_sched_submit_queue()
drm_sched_submit_start)
drm_sched_submit_stop()
drm_sched_submit_ready()
\---+---/ \--+-/ \-+-/ 
    |        |     +---> a verb
    |        +---------> should be a noun (something in the component)
    +------------------> the kernel/software component

And although "queue" can technically be used as a verb too, I'd rather it be "enqueue",
like this:

drm_sched_submit_enqueue()

And using "submit" as the noun of the component is a bit cringy,
since "submit" is really a verb, and it's cringy to make it a "state"
or an "object" we operate on in the DRM Scheduler. "Submission" is
a noun, but "submission enqueue/start/stop/ready" doesn't sound
very well thought out. "Submission" really is what the work-queue
does.

I'd rather it be a real object, like for instance,

drm_sched_wqueue_enqueue()
drm_sched_wqueue_start)
drm_sched_wqueue_stop()
drm_sched_wqueue_ready()

Which tells me that the component is the DRM Scheduler, the object is a/the work-queue,
and the last word as the verb, is the action we're performing on the object, i.e. the work-queue.
Plus, all these functions actually do operate on work-queues, directly or indirectly, 
are new, so it's a win-win naming scheme.

I think that that would be most likeable.
-- 
Regards,
Luben

