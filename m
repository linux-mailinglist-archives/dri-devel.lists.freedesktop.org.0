Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A210716DAF
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525D910E41C;
	Tue, 30 May 2023 19:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624C310E41C;
 Tue, 30 May 2023 19:36:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpJpzbpUycEvo6JWV4i1b139LSKHzyPkDSXD7WRM8zxjya7OLJ9JYi7oBp2gCmNID7rPhGJtlIofFp/Q+X68W5huOfYPIU+IvCbMZMajTdY0umjOIXHqDVnW7gau1ZB4SYeEOIAqDyG8fWN97/Iu4mWuKROSq6MPKsE3aWwnUN4yddmxKgWBHpewbwciBh9JyWzGt6v4ZnwT4/Fg/OpxW+YebdJF1fByG1EtVP4vcs+gUlQAu+cfdq8TKOrDXIAWsxhPWcb1dUm8tXApDUI4HZEhncJfQq6osDY2VUrj9UIElGlveoP6oz4eo5Iwt6i1CIDBIAEOluQSxBUN05oZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npIikCJLUvocUby9xK2DZtlOGPy1txuKk5s9MuDA8N8=;
 b=XcamDZRrQWl0WN1GXdYvSjBziGK3ZiyhewjFiNb/y8Y/7tfY0f8B9IvzdJisOxWIEwY2h0NHadmm3t0b65ZGHfaq0I2h2TVB8gTLqgxFA1Jle8IayjfAAOppDnXqHb0eXdU4LPIolCa+70jq752q9foX9lu22IRCCpw/1tj9EkoVLLsOfL3Cjl9/xdtFAOw026ZJpOJtF6X8AHBcTwcvtjlaOX2Q+S7LiA0PctXHQsxfRppni0C26bOvDDrlq+Px2wRrChzV/e58Ua3zAv1z9PRiuLDp9Q1X8SkmNAa4s6rqdeMI1eMUXpfWuIIGEeUxPIZwyFQNS0VIjVDH22qM2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npIikCJLUvocUby9xK2DZtlOGPy1txuKk5s9MuDA8N8=;
 b=p8ICt6b7aNGCzfLQ5QTMP0N8dX/Ep7AafrtoTja92ROIql9qUQJxgZOSJDJVOZYXGxmxeNg8adoBY17UfjSM/5jfA6vEvgCglryQO2HawIPBhQfgyKFvEZicraD9wciyjVBYMOj9rQNmxdUJ/oq+NIMY1qfsNvvnstBz4x90Cmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW6PR12MB8900.namprd12.prod.outlook.com (2603:10b6:303:244::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 19:36:51 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 19:36:51 +0000
Message-ID: <2105ee65-003b-73db-9f7b-f13059e2236e@amd.com>
Date: Tue, 30 May 2023 15:36:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 13/33] drm/amdkfd: prepare map process for single process
 debug devices
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-13-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-13-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::16) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW6PR12MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f61e730-0dd5-4476-2bd7-08db61453763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RwcQT6cSf4akQHcYnEOz++zgQzmCEqTQXNaXftngM4fXOljT1SN21QTxNkxoXq9pknCjt0W/VSJAVkV2CQldijKdGkUJlyDdvGG2ECCK/qpUo6PF4unSV07UiBtUk96hkJvypNFePh9B6BvVDcRzc2KjCVmCMw5cs8T7PDoR8yvHInUqw8Wo4jsA1Nd7EdzwsPxeWEsZmUCADRJlM6PPGpan8R9qSWksOOmq/WkLjMo63nraD0cj2QHW/727tqdnkz7aG5aNag7oYwwQBCOH2KOMuAGuDdxkAPF5veZI2LYyYfr6wvsEoqWcfREPiXF5LEjyarL9MDxLDroAybUacvPHMGSdjjGKKjfqh+oa27O/Nxd/D7fmhQcXI1H2spgz62EEZUwysyLJsN3Rex1JqkRcjh/js18uWDikNQjBlqy4bRV/8ppUFhEiMrgiWk/SxgExlwo20oiyLaE4ue/6nnKX5bLlGQbG0saAJDYnAoBjZA68UYs0r93QpZXOeb0J2CbSfIauGbSue6LIV+zuhv2T2hzpXvEycqtDftQ/2kZV3ilwFmKNUVgvw5MVL1TncNh50omoah7zxVz49/mdDyAGjhY/+X9P4qrT44bliRqinbzoFkQTXBLnKmJC/AubFq2P0xfMwa7ZnB0BBQB3sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(6486002)(41300700001)(44832011)(86362001)(31696002)(478600001)(66556008)(316002)(450100002)(4326008)(66476007)(36756003)(66946007)(5660300002)(186003)(2906002)(6506007)(31686004)(6512007)(26005)(83380400001)(8676002)(8936002)(2616005)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmxIWlY1U3hQOVY1ay9rRHRDbzJva0ZoTjNhY0l4TVR4YzdhN1p4bzB2WHlo?=
 =?utf-8?B?SUpzaE92YXNrRUFBN1BXM0pCTVZIOCszYk0xckFPdXJ5RGFUTkwyMmtWSjBn?=
 =?utf-8?B?QTQzSkN0SjlIUnQvNVBPZk43eEV3VTJUUEpGdTRsNm1hTDRuN2xac2dYTm5n?=
 =?utf-8?B?dmR1c1JQcEpITk5KclJISHVacjhLTWZkY2ZEM2VSb3ZsVkxRWWF0WVE0YThz?=
 =?utf-8?B?dENuREl1THRMM2xTQ203b3NnaVJobi9QdWVoRkNwTllwV3JYWkxJWk9GcUcw?=
 =?utf-8?B?aVNrT2VuWm9JQndKYi9ScW02RUlqYTZXaGZrTUV0T0RJRmRjN0dEcXFVWUtS?=
 =?utf-8?B?ZHVpN3FRbHhLQ1ZkM2I2RHdhUVNFd0VBU1o5R0ZXZ0o4TUJEdUpud2xVNWJX?=
 =?utf-8?B?bHNOMjZHY0RaYWFwdXRiME80bVVKZFBGS2YyL0QyMTNiNTZ3SU1BWjhsandr?=
 =?utf-8?B?QjRrR0plVnBBTFkrNFRGQjVPZU5ld3BFSkQxa2lPNjE2VEZNVUd3TzdxQVVq?=
 =?utf-8?B?dTJMaVhLRERzODk1TlRyV3lZak9tK3ptcGc3cXVUTXNDQWhwNkNaSXA2MWZz?=
 =?utf-8?B?eVlNQXlvRWVFSXJRbkFtVkVacU12MWhUZ1h5c0RVWjAwTDJVTlk5QzlpVzIx?=
 =?utf-8?B?ajN1N3lFMGtLbWJmejA0TC95R2t6d0VtSmtpNWlINkhJVFE4RHRlclVIaUxF?=
 =?utf-8?B?RHJ6Ynpra29nQ3huWXFwcm5sZ2o0WS9GTnIzVnVyOG9CUVZhRExPcDV2RDZw?=
 =?utf-8?B?ZWVKT2dZWjVHYm5BUHVEZGhCVWdtMHJkYTczQVJDazVFd0FVQXdYeWxjV1Iz?=
 =?utf-8?B?dVA5RDgwQ1ZLRWNMRU1hYXZIUE41dmZOb1FWMng4SDVLTDVmU2xwMHdRYmpE?=
 =?utf-8?B?NHQvYUYzK3FNMUFKUW9TVEJ5WnJ0cmZiMmw0L3NPc1plT3l4VGxwNDU3Yk5k?=
 =?utf-8?B?Szcwei90K2xxZUpsVFkxYnVBc0d2Ykdmc2E0aC9WaHJib1VXdW8va2YzbDNI?=
 =?utf-8?B?VmZhZTkwZWJoek5UVUI4ZjV2VUdCVGY5Sm9ObHhjVHh6aFd1S28xeEswY0dQ?=
 =?utf-8?B?b2RoKzArck40K1Z5TnpyRnh2U2xmcmNuNS82WFBlQnowZ1ZvS05oV1c3S1Bn?=
 =?utf-8?B?dVoxUzY2ckFoVjdMUDgxa01QOHAzQzRrY29WVVVzRlNhYTduS1NKNzJqMEYx?=
 =?utf-8?B?NS92bHhlTGlnTHdWcDEyR0tEN1RJVmRFNTVaR0NlMGRJaXJIcHJPQjZXaE5Q?=
 =?utf-8?B?YWVDSENFT1hNaHFaUjhndmlMTmw5VXpwQVJQTUlFQ29ETDhnMHZ5ZUM1M3Fh?=
 =?utf-8?B?SUpDckVLMG0veWUyR0lkWTdUTVA2U0FPczNLSnZiWnJidXNqRVQ3ZzFVbTQv?=
 =?utf-8?B?RlNwSzRkSG11K0xNdk83TzhmV1d1OFNzbW16Vm5ud1o3TG1tR0RsZ2ZjT1Bw?=
 =?utf-8?B?NG5HV1BhS1RxR1FwdmdxUzJsSkNHSVYzaEh0S0prM2pVb2d0Mjk4eXBFQWgz?=
 =?utf-8?B?dzJ5REUxUkFIV242bGlqeUQxdHMzY2NxR3M3K0V4M0grMHNmYWF6aHhneXJk?=
 =?utf-8?B?TkFHYVJmeFZUNGJrR21CWUxVNDRGdktvMC8xa1FMOXVGSnBXWDF1QzBkSk4r?=
 =?utf-8?B?RGpNM2dOMlVpRWFUZmxYenJVODBrMDE1T2JQaFNXWWZ5QldRVWdFSTB2enk2?=
 =?utf-8?B?VFFwL2pzZG5JOTJqeXVEenZRL1REZ0xnUDB6VTZXa2F4Z3I1Z1d1NVJTdDFu?=
 =?utf-8?B?M2xXSExFOWREUHQ3WGp0TllHcXZvYnh6TnJ4b2hVU1pldVRkR0Q3YUFwbXNB?=
 =?utf-8?B?NUk1bUdUdjg2c2NsMm8xbXBDV1dOT0VNbkdteHM4alA4THZseTFQenRRS3ZP?=
 =?utf-8?B?b1dSc2dqMmN5UC9zenhzcmlpRGQxSGloekJvWDJxc2kvTUdBc1NRQzBNSjh3?=
 =?utf-8?B?THlUcEZkTHlQVDV6aE5nYUlPUmNmN2FvRjBvdzdKbjdHODdXc1lINUp6OVpJ?=
 =?utf-8?B?NkVERzlVUnpaME52RmUyZWZKTHNFYlBZUE82dWhOcWpZZTk0OStJV1FzRW9j?=
 =?utf-8?B?TVZPYW5HZk9OZ2xERjFFa3NjOCt3R2gxRW94Um56RDY4WUJYbWFRUkhaL3RW?=
 =?utf-8?Q?7U+PqOBCgpi5nhn4Bh4bXlYQG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f61e730-0dd5-4476-2bd7-08db61453763
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 19:36:51.4595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUeXnSdsLkPJDwCuUV2tOLGdmWbFW4fqyIVnhBYk1OyEkRIyGDI8luwNDA0+uloOCNYsDTXyvTjVat1JUDrUcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8900
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> Older HW only supports debugging on a single process because the
> SPI debug mode setting registers are device global.
>
> The HWS has supplied a single pinned VMID (0xf) for MAP_PROCESS
> for debug purposes. To pin the VMID, the KFD will remove the VMID from
> the HWS dynamic VMID allocation via SET_RESOUCES so that a debugged
> process will never migrate away from its pinned VMID.
>
> The KFD is responsible for reserving and releasing this pinned VMID
> accordingly whenever the debugger attaches and detaches respectively.
>
> v2: spot fix ups using new kfd_node references
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 93 +++++++++++++++++++
>   .../drm/amd/amdkfd/kfd_device_queue_manager.h |  5 +
>   .../drm/amd/amdkfd/kfd_packet_manager_v9.c    |  9 ++
>   .../gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h   |  5 +-
>   4 files changed, 111 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index d1f44feb7084..c8519adc89ac 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -1524,6 +1524,7 @@ static int initialize_cpsch(struct device_queue_manager *dqm)
>   	dqm->gws_queue_count = 0;
>   	dqm->active_runlist = false;
>   	INIT_WORK(&dqm->hw_exception_work, kfd_process_hw_exception);
> +	dqm->trap_debug_vmid = 0;
>   
>   	init_sdma_bitmaps(dqm);
>   
> @@ -2500,6 +2501,98 @@ static void kfd_process_hw_exception(struct work_struct *work)
>   	amdgpu_amdkfd_gpu_reset(dqm->dev->adev);
>   }
>   
> +int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
> +				struct qcm_process_device *qpd)
> +{
> +	int r;
> +	int updated_vmid_mask;
> +
> +	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> +		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
> +		return -EINVAL;
> +	}
> +
> +	dqm_lock(dqm);
> +
> +	if (dqm->trap_debug_vmid != 0) {
> +		pr_err("Trap debug id already reserved\n");
> +		r = -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	r = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
> +			USE_DEFAULT_GRACE_PERIOD, false);
> +	if (r)
> +		goto out_unlock;
> +
> +	updated_vmid_mask = dqm->dev->kfd->shared_resources.compute_vmid_bitmap;
> +	updated_vmid_mask &= ~(1 << dqm->dev->vm_info.last_vmid_kfd);
> +
> +	dqm->dev->kfd->shared_resources.compute_vmid_bitmap = updated_vmid_mask;
> +	dqm->trap_debug_vmid = dqm->dev->vm_info.last_vmid_kfd;
> +	r = set_sched_resources(dqm);
> +	if (r)
> +		goto out_unlock;
> +
> +	r = map_queues_cpsch(dqm);
> +	if (r)
> +		goto out_unlock;
> +
> +	pr_debug("Reserved VMID for trap debug: %i\n", dqm->trap_debug_vmid);
> +
> +out_unlock:
> +	dqm_unlock(dqm);
> +	return r;
> +}
> +
> +/*
> + * Releases vmid for the trap debugger
> + */
> +int release_debug_trap_vmid(struct device_queue_manager *dqm,
> +			struct qcm_process_device *qpd)
> +{
> +	int r;
> +	int updated_vmid_mask;
> +	uint32_t trap_debug_vmid;
> +
> +	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> +		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
> +		return -EINVAL;
> +	}
> +
> +	dqm_lock(dqm);
> +	trap_debug_vmid = dqm->trap_debug_vmid;
> +	if (dqm->trap_debug_vmid == 0) {
> +		pr_err("Trap debug id is not reserved\n");
> +		r = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	r = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0,
> +			USE_DEFAULT_GRACE_PERIOD, false);
> +	if (r)
> +		goto out_unlock;
> +
> +	updated_vmid_mask = dqm->dev->kfd->shared_resources.compute_vmid_bitmap;
> +	updated_vmid_mask |= (1 << dqm->dev->vm_info.last_vmid_kfd);
> +
> +	dqm->dev->kfd->shared_resources.compute_vmid_bitmap = updated_vmid_mask;
> +	dqm->trap_debug_vmid = 0;
> +	r = set_sched_resources(dqm);
> +	if (r)
> +		goto out_unlock;
> +
> +	r = map_queues_cpsch(dqm);
> +	if (r)
> +		goto out_unlock;
> +
> +	pr_debug("Released VMID for trap debug: %i\n", trap_debug_vmid);
> +
> +out_unlock:
> +	dqm_unlock(dqm);
> +	return r;
> +}
> +
>   #if defined(CONFIG_DEBUG_FS)
>   
>   static void seq_reg_dump(struct seq_file *m,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> index d4dd3b4acbf0..bf7aa3f84182 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> @@ -250,6 +250,7 @@ struct device_queue_manager {
>   	struct kfd_mem_obj	*fence_mem;
>   	bool			active_runlist;
>   	int			sched_policy;
> +	uint32_t		trap_debug_vmid;
>   
>   	/* hw exception  */
>   	bool			is_hws_hang;
> @@ -285,6 +286,10 @@ unsigned int get_queues_per_pipe(struct device_queue_manager *dqm);
>   unsigned int get_pipes_per_mec(struct device_queue_manager *dqm);
>   unsigned int get_num_sdma_queues(struct device_queue_manager *dqm);
>   unsigned int get_num_xgmi_sdma_queues(struct device_queue_manager *dqm);
> +int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
> +			struct qcm_process_device *qpd);
> +int release_debug_trap_vmid(struct device_queue_manager *dqm,
> +			struct qcm_process_device *qpd);
>   
>   static inline unsigned int get_sh_mem_bases_32(struct kfd_process_device *pdd)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> index 1fda6dcf84b1..0fe73dbd28af 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> @@ -34,6 +34,9 @@ static int pm_map_process_v9(struct packet_manager *pm,
>   {
>   	struct pm4_mes_map_process *packet;
>   	uint64_t vm_page_table_base_addr = qpd->page_table_base;
> +	struct kfd_node *kfd = pm->dqm->dev;
> +	struct kfd_process_device *pdd =
> +			container_of(qpd, struct kfd_process_device, qpd);
>   
>   	packet = (struct pm4_mes_map_process *)buffer;
>   	memset(buffer, 0, sizeof(struct pm4_mes_map_process));
> @@ -49,6 +52,12 @@ static int pm_map_process_v9(struct packet_manager *pm,
>   	packet->bitfields14.sdma_enable = 1;
>   	packet->bitfields14.num_queues = (qpd->is_debug) ? 0 : qpd->queue_count;
>   
> +	if (kfd->dqm->trap_debug_vmid && pdd->process->debug_trap_enabled &&
> +			pdd->process->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED) {
> +		packet->bitfields2.debug_vmid = kfd->dqm->trap_debug_vmid;
> +		packet->bitfields2.new_debug = 1;
> +	}
> +
>   	packet->sh_mem_config = qpd->sh_mem_config;
>   	packet->sh_mem_bases = qpd->sh_mem_bases;
>   	if (qpd->tba_addr) {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> index 206f1960857f..8b6b2bd5c148 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h
> @@ -146,7 +146,10 @@ struct pm4_mes_map_process {
>   	union {
>   		struct {
>   			uint32_t pasid:16;
> -			uint32_t reserved1:8;
> +			uint32_t reserved1:2;
> +			uint32_t debug_vmid:4;
> +			uint32_t new_debug:1;
> +			uint32_t reserved2:1;
>   			uint32_t diq_enable:1;
>   			uint32_t process_quantum:7;
>   		} bitfields2;
