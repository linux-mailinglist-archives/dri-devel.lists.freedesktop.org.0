Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3BC7F6DA0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A74B10E7A3;
	Fri, 24 Nov 2023 08:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C118010E773;
 Fri, 24 Nov 2023 08:04:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYCYdTdesu0/KYIRh9bMQlbV+p3BTyL6gMpldNP6Bub40IOwSdU+OwFRu5G11SpOMtsG4pWhRf8ZIwP8VtU7IF58rIc7EqeYrO0DasftMNxOPoT7vuBO0ba6M8O6vVYS3qIv2Jt96DV8tHxzChDgFHUwYJxsdLgNDRr8apTq4BfFiIpVJakiiD2RsEgulvcX8E0F3amDitTJBVfQyTwGF7YxIzs1/mxL3P3poKW9NeH1A4Fc59rL4yGttVSgGzVKv4r7pKSZdseqVAVFes3PGRuAY2ZLEwB+pFkmO0qgksOobAjaJn4xeZbh3aWPbtx3A7KGiE7SsS3juXH4RJzGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cEoUGZR7ksRG94/c2r7mUHMEH3lVeftQP80CAEOPLjo=;
 b=dATpAHrgnHa5/ABJyXybEmMO4vUY9vlzN/gO56WR4BOug1RG2IreOJSPjj2ugN/PsMe+aex6u/QMn7BjJgFJfqrP4CnqDgUxsvPSRPFuS1RLnqdacTMHSTgVPUHt98UOPnN1VoHJZJTLcmnRMrzAKPQKlcZOX6TdiCLAdM4fyTmUjNduF/pYWtKfC7MC7q2rXunWxGM3DOcF6SGX9H5Vg38uzWXTsmQJwKgYR/zVSjob5XuMqp0ZdONYNN6Agi/N7UIsIgCukqiGSbarXLlGUXoLJ8MvV85+tH69Me75sgFhUSbxhVbrX1C66Z1MHUrzvAplbkruvUMA4wBNlHakFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cEoUGZR7ksRG94/c2r7mUHMEH3lVeftQP80CAEOPLjo=;
 b=Fy9Eymhqbtb/DV6YLKxM7cuyL1d4eFGu65dDmQvoXZ0vT+FRQcnsv6sGijU2BeX9AeJlTWuskNt2ewXufvqy3ZoSXjSj1gdgiDrz2l75QQ/ecZudv1kFLSFqGDef/0gQFqZgDNfYdU9H2AV0e7p2VCQhpNgyhQ+nlTLFXrs/kps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4552.namprd12.prod.outlook.com (2603:10b6:208:24f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 08:04:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 08:04:08 +0000
Message-ID: <9a56f3e7-3c4a-4c41-ac9c-768fc75bcec0@amd.com>
Date: Fri, 24 Nov 2023 09:04:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/sched: Reverse run-queue priority enumeration
Content-Language: en-US
To: Luben Tuikov <ltuikov89@gmail.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20231124052752.6915-4-ltuikov89@gmail.com>
 <20231124052752.6915-6-ltuikov89@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231124052752.6915-6-ltuikov89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0347.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b0290c-cc3c-4efb-a3ff-08dbecc3ef24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FFc+9UWlMT2uyBKf9E77QafvDPuuCLaBO0qB/JiCb/aeRy8OZK5yPNr3N/zEtFLIiv4oI/nvmKrlsElXcPKlHlp15tKCIpfVabZHhUDWZyrmx0h8ZJiTislOgaXXzD2AE/HJbH/WjPR075eWdGm7RdWO2oNaSRb7YkbInOeXP8S1zS++L9uKHDjWOwlT7TX0MI1SUWoMG46zlS2DldWn/2ay3e4QK8uDTeDDXcZZOmPTaf6xRtWYp6N32tpU05ZHd2w/vAgFJbRhOk2rdIbbqRZ88ZXVot81QJQXrp/799CwxRimglVtzNi99aHUaBoPQE2bf5dJJ2WrL9zwHtjYzQXahF0DC6r/ma2uNV2oXelYBJ0euzgpXL4XO3n5GJvQ/nNkNwJr3UOg7uIQs1OOBDu4hboRWSwUvRoK4cnIFnrFsTfbS019C+G2mDT4OHhLWCbYJaiQ0TdqD1lQiYkcF1f8ht+ZsC4RYpiYpejoGvcmWxGOixF1qU1w6m32Ngu8Px+Vty9uUx5SVI1tklatdquu3FErPfdUnUTmQ7BZXdJAty18WBBtuZfZAtqlpC58gYmeYuMg0PxjPGotBK0I2J+IF2bXerukgawtFTBu12Vr25rCcQ8D/WzEecwz44dI0mSrRBXPHCKxdoTWjPteGjrgE7XOjBQwcWzgZWGrz/1gMYUe5HbkOBMfSPl6aqy/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(376002)(39860400002)(366004)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(66574015)(6506007)(26005)(31696002)(41300700001)(6512007)(2616005)(38100700002)(31686004)(36756003)(6486002)(478600001)(6666004)(110136005)(316002)(66946007)(66556008)(66476007)(54906003)(2906002)(8936002)(8676002)(4326008)(5660300002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHZ1Z2NGaGE3R3hYMjRzVDNhbGxkQndYa2gvOUlLNlg2Yjd2aU0yckdJZUcy?=
 =?utf-8?B?TFJFVDJZS0lMdlhRRzJ4VVBMU2diRWxtQVpJa3BNVnZDZnBwZE5kdjBFNURF?=
 =?utf-8?B?VEltdERJY2YrcHRiYlZaZ0xObnVZTCs3VmdyTjNEMkpGUERGTGhJbmgvbGEv?=
 =?utf-8?B?MnFabnZldk8xbDVLQlYyWlRiZ3BmSG4xZTlzY3lSRHh0KzdQTjJqSEZkbWpw?=
 =?utf-8?B?SVJIVUNnQlFyc3JDcVJ0RERjeW9oak54UmNjL3lYT1UrcFlobkQyeGp5aG1M?=
 =?utf-8?B?NzIza1M5NFNaSnhLdnZzWjVSYVBDTjZBRG5sbHdqTmFXWXZRR25CSnFKRm80?=
 =?utf-8?B?UUY1QjNPUkZ5YmFucDhuSy9tZ0lvOWpkOUNhQXVtKzNBN3U2bkVhNkI3MEp2?=
 =?utf-8?B?akw3L0owblNtREhwQXZMWi9aaWRSQ05vYkVhZjhwWXdaS2h6VEJ4WndBTlJa?=
 =?utf-8?B?TTRNSFNuSkF5V04wSURiWC92U2ZrZmhjNjdqdkdlVHRZTXBGVy9LSTBUMzBT?=
 =?utf-8?B?SkdFV0xSMTdUTGxFaXJ5Q2dob1dRZGVLVTh1dXFEMVlVbmltMGkvN25lQXhP?=
 =?utf-8?B?RXUxN2ZFdjJhbkdoNkRsUUZyaG9sZklIUy9CdVlxOHVEL1hsRmpUSC9aU3hZ?=
 =?utf-8?B?SWtaMm81YlNPektkQXVHVTQ1WFYvd0RIb2gzR1ViSFlpZ3dLOXMydGRkSkJJ?=
 =?utf-8?B?S0N6azBjd1pOS1hJMGdVeUJ1dy9GZ3dQZDByRjM5MnZINENnVTlZakRoYzFM?=
 =?utf-8?B?dWVONFlIbUVNQWlzQ3gyS2VQSTdBVGhWZmFmNHpLM0N1elpVSWlJVFd4aFor?=
 =?utf-8?B?WjRodjZIODgrVDdEUnlMMS96bTJreGlCOWdVWHZMelRDeU8vajJyTWN1dGs2?=
 =?utf-8?B?dUhLcUdKelFXa083cmtRSW8xNHA4LzVxL0Q3cUlXK2xPd2krMjBGanhML2Ft?=
 =?utf-8?B?OTJPMWFKWXhnRXVKcUNKWEtqZFVHbkYrSFlPdmhmYWljaTVCT0h6WnRTNEpC?=
 =?utf-8?B?ZklGZndCcTdITWZQSzNrQUN3a1Nwenc5VDNjZzQzWWxIZUx4dnA5UlpyRnZ0?=
 =?utf-8?B?MDhFOXFiaTlrR2hFYU9UUFVxcTFWYnR0UjJmckRVN0h4WEpPajhaNncvUDNZ?=
 =?utf-8?B?RGpOajhWMGxOVFFWZlhCRjZKcENPbUxsZmJsZmV3ZnRMWFBnWDJiaVZNbzdP?=
 =?utf-8?B?R1Q3ckZMazFlUFZCUDJ0OTRtNWlTbEU4YUh0MlFqR2Q3eGxMM1NxeEU1NDVJ?=
 =?utf-8?B?WVNIQ1JEU1R2SWxwYysxWU9oVEF3V2Zuang1Z3BaclMzVS9KQ2tOUDBiSHRi?=
 =?utf-8?B?UmV0VVJoeTVlY3J5SHhiNEhYZlN1V1ZTRENFN29qbFloSnc1SWsrbC9ibkxH?=
 =?utf-8?B?ZmU0eURiWHIyYnN4VGV1RW1ZWTFNdjdnbVAxSFd1SExNa0hWVEo3T01UdDh5?=
 =?utf-8?B?VEZ3T2MyUlZxc0ZFY3VvVVc4MEtkbUNhSzFUU2ttRHJSZVBnaDh3d016SkFZ?=
 =?utf-8?B?Z3pUYVNaelhDTGpRREp0VnhWNWNHanhHUVQ3YzNSOFh3alIzN3JzYTIvclZB?=
 =?utf-8?B?Rmd6NGxLcllxSDdTM1BWMFMrbzRxbHVrcnBzRE1VSVRRajQ4OFo2OEJDVlZz?=
 =?utf-8?B?d2twVTlEQTJrb0VZWDZpREdYQWd5UXVDS2p4c1ZUd1BFeFFiNDl3NWExWVVM?=
 =?utf-8?B?TUVZRXpROEViNVJ2M0lJN01DVnZMdnFUOFpGMWRLVytBT0x1QWQ1Sm5NN1J5?=
 =?utf-8?B?Sm1BMEV3aG9uV21qZTdOMlliVTUzd1lIYXNDNUJNUGEwSExkWW5SVzJvSmI5?=
 =?utf-8?B?TkR1ekdHLzA4RlN2dytTcUtDdTF2YktQWkVpVFVGaFdyb1gwT1EvVjZOQ25F?=
 =?utf-8?B?SklwSytVcUlFTUtXbHdnNERyMy94SjBKSUtKOFJiZlVkUE9qYjFqNkFVOTZI?=
 =?utf-8?B?d2xaUDdtZ2E2MTMvenZwbnc5WFd2RzdVbkdFY3RvTm1iQiticEVXT3R2ak5r?=
 =?utf-8?B?WjZMYXBXNHFISEtJTlZsZzRPQWczTVBWRm9ZVVB4bTQ2R1J4UzhucC9WYWdH?=
 =?utf-8?B?V0xZeVhqdDErOCtjdkNtdGZXdnpaZDlTYmV2eGVOcEF5U2hJTm5ubytleUxI?=
 =?utf-8?Q?WEKlzWeef8HjvXZBp7z4IzB32?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b0290c-cc3c-4efb-a3ff-08dbecc3ef24
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 08:04:07.9994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjhyxPOOCGVQg1xdvGjaJgAy/l9oimd/s5DqHuQXxkmkbaTqbTrpEcJhBOzr8Hlb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4552
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alex Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.11.23 um 06:27 schrieb Luben Tuikov:
> Reverse run-queue priority enumeration such that the higest priority is now 0,
> and for each consecutive integer the prioirty diminishes.
>
> Run-queues correspond to priorities. To an external observer a scheduler
> created with a single run-queue, and another created with
> DRM_SCHED_PRIORITY_COUNT number of run-queues, should always schedule
> sched->sched_rq[0] with the same "priority", as that index run-queue exists in
> both schedulers, i.e. a scheduler with one run-queue or many. This patch makes
> it so.
>
> In other words, the "priority" of sched->sched_rq[n], n >= 0, is the same for
> any scheduler created with any allowable number of run-queues (priorities), 0
> to DRM_SCHED_PRIORITY_COUNT.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
>   drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
>   drivers/gpu/drm/scheduler/sched_entity.c |  7 ++++---
>   drivers/gpu/drm/scheduler/sched_main.c   | 15 +++++++--------
>   include/drm/gpu_scheduler.h              |  6 +++---
>   5 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 1a25931607c514..71a5cf37b472d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
>   	int i;
>   
>   	/* Signal all jobs not yet scheduled */
> -	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
> +	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>   		struct drm_sched_rq *rq = sched->sched_rq[i];
>   		spin_lock(&rq->lock);
>   		list_for_each_entry(s_entity, &rq->entities, list) {
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index eb0c97433e5f8a..2bfcb222e35338 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
>    * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
>    * cases, so we don't use it (no need for kernel generated jobs).
>    */
> -#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_LOW - DRM_SCHED_PRIORITY_HIGH)
>   
>   /**
>    * struct msm_file_private - per-drm_file context
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index cb7445be3cbb4e..6e2b02e45e3a32 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -81,14 +81,15 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   		 */
>   		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>   	} else if (num_sched_list) {
> -		/* The "priority" of an entity cannot exceed the number
> -		 * of run-queues of a scheduler.
> +		/* The "priority" of an entity cannot exceed the number of
> +		 * run-queues of a scheduler. Choose the lowest priority
> +		 * available.
>   		 */
>   		if (entity->priority >= sched_list[0]->num_rqs) {
>   			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
>   				entity->priority, sched_list[0]->num_rqs);
>   			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
> -						 (s32) DRM_SCHED_PRIORITY_LOW);
> +						 (s32) DRM_SCHED_PRIORITY_KERNEL);

That seems to be a no-op. You basically say max_T(.., num_rqs - 1, 0), 
this will always be num_rqs - 1

Apart from that looks good to me.

Christian.

>   		}
>   		entity->rq = sched_list[0]->sched_rq[entity->priority];
>   	}
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index b6d7bc49ff6ef4..682aebe96db781 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1051,8 +1051,9 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   	struct drm_sched_entity *entity;
>   	int i;
>   
> -	/* Kernel run queue has higher priority than normal run queue*/
> -	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
> +	/* Start with the highest priority.
> +	 */
> +	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>   		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
>   			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
>   			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
> @@ -1291,7 +1292,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	if (!sched->sched_rq)
>   		goto Out_free;
>   	sched->num_rqs = num_rqs;
> -	for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
> +	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>   		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>   		if (!sched->sched_rq[i])
>   			goto Out_unroll;
> @@ -1312,7 +1313,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	sched->ready = true;
>   	return 0;
>   Out_unroll:
> -	for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
> +	for (--i ; i >= DRM_SCHED_PRIORITY_KERNEL; i--)
>   		kfree(sched->sched_rq[i]);
>   Out_free:
>   	kfree(sched->sched_rq);
> @@ -1338,7 +1339,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   
>   	drm_sched_wqueue_stop(sched);
>   
> -	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
> +	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>   		struct drm_sched_rq *rq = sched->sched_rq[i];
>   
>   		spin_lock(&rq->lock);
> @@ -1390,9 +1391,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>   	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
>   		atomic_inc(&bad->karma);
>   
> -		for (i = DRM_SCHED_PRIORITY_LOW;
> -		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
> -		     i++) {
> +		for (i = DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
>   			struct drm_sched_rq *rq = sched->sched_rq[i];
>   
>   			spin_lock(&rq->lock);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d8e2d84d9223e3..5acc64954a8830 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -63,10 +63,10 @@ struct drm_file;
>    * to an array, and as such should start at 0.
>    */
>   enum drm_sched_priority {
> -	DRM_SCHED_PRIORITY_LOW,
> -	DRM_SCHED_PRIORITY_NORMAL,
> -	DRM_SCHED_PRIORITY_HIGH,
>   	DRM_SCHED_PRIORITY_KERNEL,
> +	DRM_SCHED_PRIORITY_HIGH,
> +	DRM_SCHED_PRIORITY_NORMAL,
> +	DRM_SCHED_PRIORITY_LOW,
>   
>   	DRM_SCHED_PRIORITY_COUNT
>   };

