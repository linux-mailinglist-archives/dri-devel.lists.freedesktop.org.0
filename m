Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FBE5B411B
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EA010EAD4;
	Fri,  9 Sep 2022 20:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BCC10EAD4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 20:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us49eShvlgzu621sN/KqbidUJm4h6406NJMk4nOojPTGdVLOOBLWPcgNPX9iwCS3+nLWbS9bYDWzFdSbw5smH0K8d0zfcNiEOwshhSqKieq3YAK7dUie1YRWaAyh4aEL6PUYzRxcJMg2/BRFgPlqkccNUuu5Imr1KziX3ELVhokGXYNf4AyATkD/y1WZ6wBTu4Zs/0j2oEORmgpHjo030kjM4T7pmTuYje2YGWU1fBsbs4Z5gYvV3vhimxPQo2q1Z1unhQezo48WJgVQB2N16GZCK0rqkDJwbEsndY8Af56WED1yc3zHd5j+ns3sDCiXRyB0L2iBx4XqMQIeTSU33g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWoeJTB/C0xJZb+9uA+x0z8JtWlaqbHNNeebdIYJdt8=;
 b=bCybTBhxutzvmwvOJB41fhM7FLhZeNVy38KqA2met2EqX3ShXkJSJtLqrrkMgLoqWKHjqXBdEeFTxzKfSZVomoREk5zZAMNg7pfnoaYbEV5Zy/57jYEoJGUIGXoW4FdeYbGYea1+b5y8DD4YPHyL0k1381sWJcrj7KFu/CrpcK9U2aAsiZp5Ot+FufzUcIMuiKsgDTlfs7VVAcvyhwFTjyXrETQOxx3ONUIeUT2LzEfzSXjQC/b9T5hHUcZKUkLfu/UFD1hM9azGXz4Nu/Cptfl3xrM5cemQVFZEu2PwXUTlkxvsgwbwf4d+Nl02zwRVORSm95+VJ2RcuJx2N+qiLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWoeJTB/C0xJZb+9uA+x0z8JtWlaqbHNNeebdIYJdt8=;
 b=46md3MxmaR43FfLS8GY4zVp00VsxgL4/zYNlzItWTEdBnXHqYiwOIzYsq6AVyuMXyYc2DwTCEoYKYXFfph+Qf4kamIGuIwRa8sH0nHvP+L6HvvbAPqKCxFPymZO9LVV8uBLNzbs2L6huZ4C4pjYqetOMWV0bnzvhoLPYnDBrIdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 20:55:42 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::80ca:c97:d395:1acf%6]) with mapi id 15.20.5612.016; Fri, 9 Sep 2022
 20:55:42 +0000
Message-ID: <f96d7b4b-2cbd-223a-3140-dbd5178fbe8d@amd.com>
Date: Fri, 9 Sep 2022 16:55:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 5/6] drm/sched: Use parent fence instead of finished
Content-Language: en-US
To: "Yadav, Arvind" <arvyadav@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian.Koenig@amd.com, shashank.sharma@amd.com,
 amaranath.somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
 daniel@ffwll.ch, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
References: <20220909170845.4946-1-Arvind.Yadav@amd.com>
 <20220909170845.4946-6-Arvind.Yadav@amd.com>
 <2937dc45-0b62-7c71-b846-942fa91cbb4e@amd.com>
 <b0b81d03-840d-bcf2-3593-5fc0079f1e6a@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <b0b81d03-840d-bcf2-3593-5fc0079f1e6a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::24) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB1947:EE_|MN2PR12MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c01920-3601-4058-f638-08da92a5a861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4QybcgUyZRljrrmoAnA9CrxVAE9upXGLKV/lO9ImAd5ZhWGFf/GA5ap7G+uH/B+nMuszVizQSqFrmpdECTBqDvEb1z1UK8SRXsEvwjnk1U1ueBa+I/4eN/yJ+NjSoqszw2bO0KB7wXgCKKiBCNk+C+t1FPENc7aUDAB2Cq4gv7zQeSRPkT9gArJMrgbM0SOjMBFu7m7GH4TzhGGxQ7/EmMMhGE+KYWwL5I7RMnKNBOQJUsYV5oV9PPHgz4OmWgfu2uOJvUsbo0VCLAicVsVJP1ogRhH0EVHsn1of29nx4ZrNVv/PxpmlHGt4vl5oQfbFT7bDO/MY2PNXUHGHDURprIqTGce8b3vbmI5bu2V01zHK4UpHejd/JQPdHNGmI9577MiruHJZxDjfvPOkinGPZyoHSrg9grnDQAkN+haZ7Z3gqtF0W6HaVR6Ax8GLf7Mn0oPKqaXN1LJiYhiBQ7jm+yIpPUn74lg2UK3Sx1p8cCwNeunFFs2OnHMsNLep0gyVuLfchDLILkTphFgXttGJekB8cKawFS+g6ovL2sfwOFS0z0jSEEF7RyhEhRkGDpQ2M4Qz0S1ovNwMcf8PnBOkfFEu33WQeJCmCOYIZhedlr3peVx1b7l64YqBQEDU4Pmktxrf8L3DA9jMnuYKwzTucPUsNtEo6zETIes3yCDC6+W4Yni8F2jVpJl51unS10qq2HdKLc6ku3UFUPmo+E8NOmKqiA1F1MD7izf2NLL/OO2LtWmBUOiL0TT5RPR/hHBeenmOrEeblPdZIhh1rAUIt94/8fJwxlfHS4Y2c69JlhwCqhjlC/rrOyXgGcBVR9bA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(2616005)(83380400001)(6512007)(8936002)(2906002)(44832011)(5660300002)(186003)(36756003)(31696002)(41300700001)(6666004)(53546011)(31686004)(86362001)(478600001)(6486002)(6506007)(921005)(8676002)(110136005)(66476007)(66556008)(66946007)(316002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW5FMkJFTktGOHJCMkFEVU1tTnF2NkZWbnlha1N4SE0yZXJjam9WeGZ2Z1Vv?=
 =?utf-8?B?bHBNRTUxQXVqMndQdHE3YlhVcUZaL1JoZTN2YnN4S0haZ3FORDZBK2hEaWsv?=
 =?utf-8?B?Y2lSSGp2ZWszd2VvNUt4OHJCY2RJaWs0ekN3ZE1JWmhic3hBSWQ1STVyWVJp?=
 =?utf-8?B?ajJnSkQzVFR1VmF3ZmxEUzQyeFc1OVZ1K0o5WG5ObURzSmpKTWxWT1JuQy8w?=
 =?utf-8?B?c0FIV2tnQ0Z0b1F3eXdSMy82NFVNaURqZ282ejZlSWFlVXIrZWFkOFR5YkIz?=
 =?utf-8?B?QmIvazF4Qk01VkFpcGhzN0RHZ2YwMnRKVzAydDBoOVNYZktzMjBNMkttSWJp?=
 =?utf-8?B?UFpWZm5WRDNLclZ6REt1RUpzRGZneWY3QzhJVWRVamRwenAyc2hTUWdhaStZ?=
 =?utf-8?B?d1U3dTlJdTZPblpvdTU2a3dKOUNwanM2NG91TXFtYXNMVEQwc3Y1dE9GZ0h5?=
 =?utf-8?B?V1VIUWgybUx5b2ZQZXZjZVhwMW9pdVdTNXZxaXdWTlF0ajcyVEx0ZXl4b3Yx?=
 =?utf-8?B?U1Z6ZG9nV1JqNlVxU2RveHVvT3pGMGxoYm5TMkhiZWYwRFZoQm9sM1RlL1lR?=
 =?utf-8?B?NDFoZnBVeE5YUEpUVjZFTktUcHRoNEU2OVh3WHMyRVM4MXoxbGRrUHR6N1Nz?=
 =?utf-8?B?cmVybW9qRW1BazJWbm9KTnZHZ3pRdXE1NkVGRXcwMzhHejI4N2s5ZVQzRXR0?=
 =?utf-8?B?SlBaUmdoTzFoVkhWRUF1N3pXM3dVa2U3L3dFcTR6dUVFVGxEK3JUbmRqQkxi?=
 =?utf-8?B?WjhWMGhwZHlFRmhCRUVYcU50dkg1OW5YTXoxenBPSDBOdDRXa3R6RThKSTRT?=
 =?utf-8?B?UVo5bnozYTFXQTMxRVZYRnMyb3pESnUwVVBBSk1DU2NVSjNsM2trMDVIeERu?=
 =?utf-8?B?S3FWZjNtOU1CTXdzWnZZMlN3eDRBM0FTdHYzNG43bGw2OXFGZEJxUTdyOWM0?=
 =?utf-8?B?NXcyZmpXT2dyZ3JnOURpZTBzRFNQbGhkNDIvY3oxY1BHNnUzdGtSem53OFZN?=
 =?utf-8?B?Q2V1VGI2aVczMGhrbzZlL3JnYnlrWkxSREd4U0xPNGUxMHd3R2VZbEMramg3?=
 =?utf-8?B?ZkU1VnVtVkpBelVuVi9VQTNQTGVzR2V3L2dDZHdLQlFLRi9veGhDWm15MXA5?=
 =?utf-8?B?Q2Q2Q21RTUxWazA2Z1Bzb1NibkJMdTNFNktHVTVTVHFrOFBucWF0SGJJU3ho?=
 =?utf-8?B?NnMzemV3cU1GOVdIOWRYNmZXSzVZS1pNaWFpUWhYdElUb0lLSW1xMlQ4OWZk?=
 =?utf-8?B?cVQyWlNZTmNmT0pEYU1Oc0RTRytEbWlzUXh5eVRKN3lxMThDMml3dGZEakRi?=
 =?utf-8?B?bXR2ejhxVFB4RW9mZ0JxRUVHSi9JczAxbXNQUzBGL1hHOE4xdmRFYVhWZjNY?=
 =?utf-8?B?MTJwQmtrTU1ncDVBSXlnVUJldXUyMDlkUmVVZnBQaDFMWkh2eHpGWGpvejZl?=
 =?utf-8?B?Zml2NHl3em5STHhpcFczYzIxc1RHWGlXMTNPM2hTOENzT1Rla0FPSTkwcGM2?=
 =?utf-8?B?MzVCYnZUOHhUczRJVjBOOEJJeDV4NXdBZE5BcUJQY1lIYU1xcjFTNDF4V094?=
 =?utf-8?B?RVUyUGY1RS9HSkVDZVFzTXIyWk9tbDhXVkc2Q2hnSkFURTNUU3RMYW9aWis3?=
 =?utf-8?B?WE1oUzZwM2JBMW00bldsd0pGcmxHV2NCOWRRUHFFZ21yK1padE5ScmhhVEtJ?=
 =?utf-8?B?b0VuUUxiZTkxREhmMlYxQ2UzbmpKandJWndLK296elBpb2g4QlR4djVRTTVI?=
 =?utf-8?B?d09JRzhhMkxkd28vVWgzR1lpK2MxbWNZZmh1RFcvRDZVNFlHelpYTjVpcTgv?=
 =?utf-8?B?OTBuN3gzSktOWnJnRTZWNStWNUl5ZTJJcGFZN1hsMUl3Z2E1MHVuRzErV2pF?=
 =?utf-8?B?RXJSaHN5RXo0TmZuUHRlSEtwOHBWZm1kSmFwdjBJbDhiOHR1MU4zRzRqdXdG?=
 =?utf-8?B?SDhwaG9saS9MMU5wQ3hJNE1tYnJXZTdBaW9aVi85K2YxR3h1eGNVc2diWG9Q?=
 =?utf-8?B?L3l0WEJ5RENmallVZmR1eG0wV0NranR3WEVOUWVnUWF6TFl4YXVTYWZ4ZXVS?=
 =?utf-8?B?MFFERlgwb1hwUWtQQjRBT0JzbmV5dnNCb3dOb05yUkh6OSt2d1JuZ2hEb1E0?=
 =?utf-8?B?Ui8rMzFORE5ia3pRTmtVa0xsWmduRHU0Zm5handxRUlNSmFEOThkYnVaS056?=
 =?utf-8?Q?vzxe96PKdPEBY7tPvPdDdMlUL+tpz7Ydb+BKqumWW6hd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c01920-3601-4058-f638-08da92a5a861
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 20:55:42.0160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DekevvJGmhl9eZe9bEEbcDQzZ5tqSpiHCSxYerh9WWxdpDCJEeTPszrx5PlbWUEYB2ObM4kvxkNnjsiXVN5yRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469
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

Got it.

Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Andrey

On 2022-09-09 16:30, Yadav, Arvind wrote:
>
> On 9/9/2022 11:02 PM, Andrey Grodzovsky wrote:
>> What exactly is the scenario which this patch fixes in more detail 
>> please  ?
>>
> GPU reset issue started after adding [PATCH 6/6].
>
> Root cause -> In drm_sched_get_cleanup_job(), We use the finished 
> fence status bit to check the job status dma_fence_is_signaled(). If a 
> job is signaled (DMA_FENCE_FLAG_SIGNALED_BIT is set), then we cancel 
> the reset worker thread.
>
> After applying [patch 6] now we are checking enable signaling in 
> dma_fence_is_signaled() by checking DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT 
> bit. but signaling is not enabled for the finished fence. As a result, 
> dma_fence_is_signaled() always returns false, and 
> drm_sched_get_cleanup_job() will not cancel the reset worker thread, 
> resulting in the GPU reset.
>
> To Fix the above issue  Christian suggested that we can use 
> parent(hardware) fence instead of finished fence because signaling 
> enabled by the calling of dma_fence_add_callback() for parent fence. 
> As a result, dma_fence_is_signaled() will return the correct fence 
> status and reset worker thread can be cancelled in 
> drm_sched_get_cleanup_job().
>
> ~arvind
>
>> Andrey
>>
>> On 2022-09-09 13:08, Arvind Yadav wrote:
>>> Using the parent fence instead of the finished fence
>>> to get the job status. This change is to avoid GPU
>>> scheduler timeout error which can cause GPU reset.
>>>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>> ---
>>>
>>> changes in v1,v2 - Enable signaling for finished fence in sche_main()
>>> is removed
>>>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index e0ab14e0fb6b..2ac28ad11432 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -829,7 +829,7 @@ drm_sched_get_cleanup_job(struct 
>>> drm_gpu_scheduler *sched)
>>>       job = list_first_entry_or_null(&sched->pending_list,
>>>                          struct drm_sched_job, list);
>>>   -    if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>> +    if (job && dma_fence_is_signaled(job->s_fence->parent)) {
>>>           /* remove job from pending_list */
>>>           list_del_init(&job->list);
>>>   @@ -841,7 +841,7 @@ drm_sched_get_cleanup_job(struct 
>>> drm_gpu_scheduler *sched)
>>>             if (next) {
>>>               next->s_fence->scheduled.timestamp =
>>> -                job->s_fence->finished.timestamp;
>>> +                job->s_fence->parent->timestamp;
>>>               /* start TO timer for next job */
>>>               drm_sched_start_timeout(sched);
>>>           }
