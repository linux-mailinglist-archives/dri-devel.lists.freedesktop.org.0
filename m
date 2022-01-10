Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BC748A326
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 23:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1E610E217;
	Mon, 10 Jan 2022 22:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7CC10E217;
 Mon, 10 Jan 2022 22:48:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgFzH272DQa8Va+bjem/71jmiaNYtV8dLWN2jEbJpib+Enjz4qWfNwRcQp7FciBpkweJF7QvsMkldhrKUJEldyURFUiLwWI98xxKBt43l4zUHg48n8zLtcb1VcGfqc5J6q2KC3IojNsAt1HpWmFzWbtZf1g+NrEna4VbMTZytGYFjgCu5SmowHqQE9yAj+f3Cp4cNTPYJT4oD2DVDABKa9nEfvjE/VhBRyVazcI8jfPiIe17fFaP5PWSaglSC+53h7AR0Kh+MFJdCp+3TouS/h9aToPM2jmqKXiR1bjRAps4CyXlUn84ZnI8PRj1OM+nMgOrAKtIjBRlky10QMI4Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uDjQl4ToENT91UseTpgvXiBsm15XlUe3FN1GfDAQpw=;
 b=e000yiQ6IkxVduSk3GmpGLGdz1OFPiAub1VIPcJdYRGl+Btm28Ocwdyqt33MHKGHSrBOr2Z6wp1r+1ohS4X7PCopzzzEUiZ3m8Fjctdjs0JqFcErnW37zkSQQqLpRqWqiag/IThk9bO8wP6qbxS/XRcV3ipAuGekQbXGnHsPS5CcOSeRU0Ojl0/9f2ewbbzQ20CFgtcqJVyCJkS2w+bo8dithDtnqm7Qax/sMDyXKLZ6lnFY9yOv0mZUnLwjRaKY0FEi9Vf/Kx8156DntG0mbDPMzP9w3jqmByYmuhtMxL9LG6hIMFKCc27rbcy7OzR2LI5HC+1505smPNnRPk5hxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uDjQl4ToENT91UseTpgvXiBsm15XlUe3FN1GfDAQpw=;
 b=s3Ux0dpjyZ02LeQwxQ982a7KpFtTGUOb3WVZPLk5vZF1twggqvxpiaY8bRp0XAPG1sX/ZvJu/Phr2NCWv3Gwei2Nu4RgJgIGylqaxPIoDcNr944//jgywVYGxokMXsdxRWMrpNYRyrkSjEqUCiYfktlzHH5t1irUhmqMFu9L8GE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5306.namprd12.prod.outlook.com (2603:10b6:408:103::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 22:47:58 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:47:58 +0000
Subject: Re: [Patch v4 04/24] drm/amdkfd: CRIU Implement KFD process_info ioctl
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-5-rajneesh.bhardwaj@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <c5e17128-6080-608b-51b5-3d97f228b39f@amd.com>
Date: Mon, 10 Jan 2022 17:47:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211223003711.13064-5-rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BLAPR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:208:329::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68e90e8a-d3ba-437f-a2bb-08d9d48b3f5b
X-MS-TrafficTypeDiagnostic: BN9PR12MB5306:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5306E20FF9E4981B642A501C92509@BN9PR12MB5306.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kfK0KoNK8AKmgZAVREzrgqNP089uo5aYV9OtWbVI6x4VihONQX6LzNAjFY6rycHnr3yXjwGzfFD8EPRKDMAuzjPy3jiK6jlUSjOb/DVj5BWZR4yHemgYH4qLgOhvSkM6a61pLIzdZqc4QNdwKPySz3M0wh1wdauVOvkO1Vz+5YmnJSF+Zq6K2CTnfLitU8kSK+IYiAMyPHN4sBelosd9QgCj4obiLdhtqLmN2RTR41akEcfdTbIK8pKcAzouQsl0LGF8mro3MYnHSJFlxucm0LHO+CAvq43U04laSKN8PtCGNE6/EvEmoIlMEw/SVcnRGC3oXTjRMUttxAFkN40F8OKQP/rhN44fTgWgJrmqwHLkuJRKWDAFwcHl8yXufA4foNhRfaL9xTiiJodGp4x02nJsVoaraoEpkgLhRr69OHWXtQcAUGHV8fAv4xeiKZ2mh2Nm5/OVyvVvyBxRBEg3ZwvMXgenlIxT5nKZRBjVWNVEvbrBjxLHpZHbSQmfWZnJq6KoTrnpeZZFFIOtVX7Na5lQVVm7SIelK9F3LPOVzXu6CrCopXvUlzw7QDdKAa7L1cCVJN1thmJJn5VuVm64bl4y0Ubkwaj8E321VJIFvDP+jhTF5TDWD6xT8Ohx0aL8TbNwK7iSULjrcCVe/VY46NzEiPZKzLhhRYJy9Nagq+8O3njEsi1jjbb67RRnCwe337SDtwqB8zfv0GDjIENJxBJIuTzyVchXjlC0xHtXM5jDrb24VggtWymzSJTBZuqq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36916002)(6486002)(6512007)(83380400001)(8676002)(8936002)(2906002)(38100700002)(2616005)(5660300002)(31686004)(36756003)(4326008)(316002)(53546011)(6506007)(86362001)(31696002)(44832011)(26005)(186003)(66946007)(66476007)(66556008)(508600001)(4001150100001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2VWcS8xNWRwWC9pa3VVRUpkdmdsaSt4U2R4eFErdmhCYXJmN0toTnc1WDB5?=
 =?utf-8?B?N0lFaVp6VkxnOE1uTm1pNG82czBjQk52azNsQzAzMUhHRmxGcFR1anEwUUxR?=
 =?utf-8?B?RFNHZFdZNnR6OGxvUjIzQUNVVXNlWGdrcUE4TDV6LzQ4VFVmU2poWlhMYks3?=
 =?utf-8?B?aks3SGo0UmxSSmZIWjBHaFhybDFuMXpOMGFWNys2WWtGaGhnUmpORTZudmx5?=
 =?utf-8?B?RW4yWHFwbXBJQjVFS2ErNFduV3NEN0hxenJicUk2di9sM0x2WXBidW83WlYx?=
 =?utf-8?B?c05ZUUZscVVTZHBFY1V6QUp0ejViYTRIQ2RkQlRHWFBQbjR2bnEvbTBGWG9l?=
 =?utf-8?B?M2RnelJwbCtmQkxBT3F0K0hCZVJ3Q2hPMllkd1M5b00yYVZ5MFZPcHp6cHRC?=
 =?utf-8?B?WExCR0VrNm5tbDFDQ2FHVFk2Q2FUZVloK2J4RkR6N1V5T3JCb0RNcU5yR2o4?=
 =?utf-8?B?bFJpMXdtTzEzNTI4cmFpM3UwQ3ZVUDJwTG5iZHR5UVhrbVNld0lWczVVWTdk?=
 =?utf-8?B?V3dRdDZsckR3QUZwdndHUExDN05OaUplSDhVU3NHYmNsL2N0a28wNzg4T3Uv?=
 =?utf-8?B?UDUxWHhXNUVVWWpXaFZSMUtQUkxuNndBVkZHRlZZVElnMEtyOUlPK2tuVlFo?=
 =?utf-8?B?WFl2TUpuZkcvcXQyeE9yclVycldoMk01aVNFbnJjS3lLa00zVUpXRzJRNG9j?=
 =?utf-8?B?U3I3UUZXYmJEa1Y2RGpKamJlN1F1VVRLa0JjWStNckRDL3VQV1F2L0xWcTBw?=
 =?utf-8?B?bU5VZm1NVWRiWDdBaTFISmUzYTVnRERkRTRoa1padTNicVMrUVo5dDdJTHpH?=
 =?utf-8?B?UjVEUnVpcExqdzV3ZUducjZack80ZDAwWjB5WDlZVUJ0QlFreGZEbFR6ZHdY?=
 =?utf-8?B?MU1paGQwV1FDeUttNGRadUxPdFRrWSsvQnNzTFBJL0F0aFRoQ2F2L1YxODdG?=
 =?utf-8?B?UXoyRExQeHVSVWxjUDJCUmhHaThwdjBTZHVjOEthZWRGZk5XeXZSYWIwUFU5?=
 =?utf-8?B?WUZRR2tpOWUzdStFZzI1RSs2Z0FQem1WdEpTZ1FHR0dPUHdWRnNuRnYyZGs0?=
 =?utf-8?B?T3BQeU5lSk9wZXNIMjFicEFFSGtKOWVobTNkU1A5Qy93Z2wvakJuYzcwaXd2?=
 =?utf-8?B?M0dUR2s4MkxIeU5aZHh3NkdSQWRBQWk3R1ZuajZySVovdlFNZHlNdWFaR0JR?=
 =?utf-8?B?WjJya0JDdVJHcVgwNENFUzRoaWxicitjSzdWM09IVTkwaC9Ga1l1YXgrUW1p?=
 =?utf-8?B?MVRLSExLeFpOcUplUmJzalByVVExaUVzRlhjWWRKbzQwVmxZZ0RrU0hjeDY3?=
 =?utf-8?B?SjN0VHF6Z3BGWThTY3hMZEpZdjB6UjZYd1laY21jTG1qTnRPRlA5UHdnOHZp?=
 =?utf-8?B?ZXd4ZmlpamJCb3ovYURJb3ltYUpUWnU1VE16bXJ1VnRadlpWOC80NmpYQW1a?=
 =?utf-8?B?RVg5WCsyamxhV3BQRS9TeWIrQlF4Z3dvNzRQQVRmV3YydUVkUHEvTnhRZm43?=
 =?utf-8?B?SS9YMFB1ckF2WkhDU1hZU1plbm5CQ3FYRy9pbmx0eGl0bjFVRXJwRnlkNW8y?=
 =?utf-8?B?SzdEdjRvUVlEQ0R6bUxUb2x3S2xmMUowSU53Y0pLQytseHc2UlpLcHhWOGVR?=
 =?utf-8?B?Ykd3OVBSRDUxK0k5U0NrVlJtYXdKM3Z4R01Oc2dQSmRDVHhuYXZNdVF6Y1E4?=
 =?utf-8?B?WFBRQ29CYXJzR0U2ZXRhUG1WL3RMMUd1VEg0QlExOU5VajI0dkhjemhkd2xp?=
 =?utf-8?B?SGFsUmFvRHNBWWVmaXFNZThJanBNeXFtZ0c4cEpDcVdmckdvblF5ei9CTk04?=
 =?utf-8?B?WlIzK0IyVjl3VERqelRYVFRRTUlyV3lkTTBmTmVOUXdGVlpTMjR5eENOZVhP?=
 =?utf-8?B?L0wvQ0ZlUU5zQkw0bWtITDlldXR0aXp5VjdsTjM2OWpjcCtpZlpLRFRjWmRQ?=
 =?utf-8?B?Vjg3ZFFLVjcrWDRYMXZBNnVKQjJUYUhzcUpmYzRaQ2ppZDZCckc0YThPV0M2?=
 =?utf-8?B?cS92K2lNTy9FQ20zeU5GZFl1ZzVLRThYWDZGTzV5dSsybFVqOUVVdkRjeTdU?=
 =?utf-8?B?SENobUhnbSsvZFR6Y2piL0Y5QjB3NlFiaFI4RDZkNHcxT3M4NGxFZVVjbTNl?=
 =?utf-8?B?OEViOXN2Z1NGcmpSRk4yMENiNHlZejBjVUNGRTlnQ0dGTXlUWXhGcHdabUdl?=
 =?utf-8?Q?LeuiuNVJDUUcPHDr203pIrU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e90e8a-d3ba-437f-a2bb-08d9d48b3f5b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:47:58.1116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWRQlGrzZjs806gwQc4Afr1pr47OhNWbjK5j7FOOotUfLnbooQBDqZYZLJKgVL5hAic5MP4JNCzZNFpiICD13Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5306
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
Cc: alexander.deucher@amd.com, airlied@redhat.com,
 David Yat Sin <david.yatsin@amd.com>, christian.koenig@amd.com,
 daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-22 7:36 p.m., Rajneesh Bhardwaj wrote:
> This IOCTL is expected to be called as a precursor to the actual
> Checkpoint operation. This does the basic discovery into the target
> process seized by CRIU and relays the information to the userspace that
> utilizes it to start the Checkpoint operation via another dedicated
> IOCTL.
>
> The process_info IOCTL determines the number of GPUs, buffer objects
> that are associated with the target process, its process id in
> caller's namespace since /proc/pid/mem interface maybe used to drain
> the contents of the discovered buffer objects in userspace and getpid
> returns the pid of CRIU dumper process. Also the pid of a process
> inside a container might be different than its global pid so return
> the ns pid.
>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 55 +++++++++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  2 +
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 14 ++++++
>   3 files changed, 70 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 1b863bd84c96..53d7a20e3c06 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1857,6 +1857,41 @@ static int kfd_ioctl_svm(struct file *filep, struct kfd_process *p, void *data)
>   }
>   #endif
>   
> +uint64_t get_process_num_bos(struct kfd_process *p)
> +{
> +	uint64_t num_of_bos = 0, i;
> +
> +	/* Run over all PDDs of the process */
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];
> +		void *mem;
> +		int id;
> +
> +		idr_for_each_entry(&pdd->alloc_idr, mem, id) {
> +			struct kgd_mem *kgd_mem = (struct kgd_mem *)mem;
> +
> +			if ((uint64_t)kgd_mem->va > pdd->gpuvm_base)
> +				num_of_bos++;
> +		}
> +	}
> +	return num_of_bos;
> +}
> +
> +static void criu_get_process_object_info(struct kfd_process *p,
> +					 uint32_t *num_bos,
> +					 uint64_t *objs_priv_size)
> +{
> +	uint64_t priv_size;
> +
> +	*num_bos = get_process_num_bos(p);
> +
> +	if (objs_priv_size) {
> +		priv_size = sizeof(struct kfd_criu_process_priv_data);
> +		priv_size += *num_bos * sizeof(struct kfd_criu_bo_priv_data);
> +		*objs_priv_size = priv_size;
> +	}
> +}
> +
>   static int criu_checkpoint(struct file *filep,
>   			   struct kfd_process *p,
>   			   struct kfd_ioctl_criu_args *args)
> @@ -1889,7 +1924,25 @@ static int criu_process_info(struct file *filep,
>   				struct kfd_process *p,
>   				struct kfd_ioctl_criu_args *args)
>   {
> -	return 0;
> +	int ret = 0;
> +
> +	mutex_lock(&p->mutex);
> +
> +	if (!kfd_has_process_device_data(p)) {
> +		pr_err("No pdd for given process\n");
> +		ret = -ENODEV;
> +		goto err_unlock;
> +	}
> +
> +	args->pid = task_pid_nr_ns(p->lead_thread,
> +					task_active_pid_ns(p->lead_thread));
> +
> +	criu_get_process_object_info(p, &args->num_bos, &args->priv_data_size);
> +
> +	dev_dbg(kfd_device, "Num of bos:%u\n", args->num_bos);
> +err_unlock:
> +	mutex_unlock(&p->mutex);
> +	return ret;
>   }
>   
>   static int kfd_ioctl_criu(struct file *filep, struct kfd_process *p, void *data)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index e68f692362bb..4d9bc7af03af 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -950,6 +950,8 @@ void *kfd_process_device_translate_handle(struct kfd_process_device *p,
>   void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
>   					int handle);
>   
> +bool kfd_has_process_device_data(struct kfd_process *p);
> +
>   /* PASIDs */
>   int kfd_pasid_init(void);
>   void kfd_pasid_exit(void);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index d4c8a6948a9f..f77d556ca0fc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1456,6 +1456,20 @@ static int init_doorbell_bitmap(struct qcm_process_device *qpd,
>   	return 0;
>   }
>   
> +bool kfd_has_process_device_data(struct kfd_process *p)
> +{
> +	int i;
> +
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];

I think checking p->n_pdds is sufficient. All the pdds with i < n_pdds 
should be non-NULL.

Regards,
   Felix


> +
> +		if (pdd)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
>   							struct kfd_process *p)
>   {
