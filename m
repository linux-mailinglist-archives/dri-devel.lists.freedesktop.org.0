Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC8A6C5919
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5089B10E40E;
	Wed, 22 Mar 2023 21:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3012110E40E;
 Wed, 22 Mar 2023 21:54:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQvubhX8+mVyvsDA9r6nNgIrTYq1cjJlewIhSiIcvpFgDPWTA231VtrvM/x13TAY6XtNgRVwW3uYtxm6AwYmtAhYLw5eYLfSDgSfAkTdJZAeNV/CiDG3YkjERdP3/SwuYJ2XgGIIyhGffslp4sekgWB4oPkpXNo5u09Fng2e2CQMIUcprluVhAz0VxQCQOX2YDTHVEpgjPWC8pdJa0yxMbod/TwFsdeeItKytONay8Wabrq1XgMoxkLEkmNmBL9KVmtn4mkDXG2t0cz4fPMdyOIR9v4StC6WZSN+Xe+B7SIGDlN2g1E/8iBtiSUdOT15P0qjJqEcL2q0MeW9L3gAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mduu87P6lwdgIrPWsnwOfQtw/gSG1lWSadp3taelAmk=;
 b=jVR0rH3YzVcy3ibN4qYpqIKj9iKjCqoiFYsloi5Shuknady3IMv52BiHbba7bLB3jY1iPTRntjAdszVnbpv1VNdmkjWvgzJDvrRHxz5ddR7Fiam1GCyVs3ZFSKFDRX3zp6wE/RTWYZc2XtXBOVSW2RH1iOqHV8fMp4ZoKXoaU3sXU2p3bbLqI9YIhP3MfH7dPrKw+7ssNTNtww+exGYeKYC8fnwviJN2t/iyeZ7OOSC45YkE7Ul8j/KWvs4efVQQRbrHIKJzbfEiCcDf5Mrs8nSM0sVm9vxH/U0v6YqF/xKcQGbvaU7Bgv/5FAs2bFMUepTL8FWrVydJnxP7VEqJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mduu87P6lwdgIrPWsnwOfQtw/gSG1lWSadp3taelAmk=;
 b=LokeYrplhI0eVqc3VexlW317q66pmbXGfjuDmuTkFrMMegFU8qN9v3+RJgypZmYXXxlZyKdiZTDePg0tfEI+1XRKEEVnDZVR0HDMMzCU65AfgvvwfD7i5rtXkDl4i2cWOY3Q6X0deWMO6OuuXyS6csoYDO/zPhRq9xV/uatHcUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 21:54:49 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 21:54:49 +0000
Message-ID: <2aa9a1d5-d0a1-498d-4721-517b80fe4007@amd.com>
Date: Wed, 22 Mar 2023 17:54:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 31/32] drm/amdkfd: add debug device snapshot operation
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-32-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-32-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::21) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ2PR12MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: cc61d324-1563-48cf-d5f0-08db2b200f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ltYiDnp09QVukyNMw3JA2IbWOB1MR/kz7JY/H8F0AY45TJnvvQT2EqHH9wHYdc4ywxJycunIu5UKhdPvV3rrfZUdO8xh6UU69zfs4XcoUALRTCXkECz1Pm0/X96vjlRE9Cqy2QVL2oyCrbdScrl4u6XGWCMMcO18RwFL58ib8f0YydwaTVy0/e3NSygDcoWvZaQN+OrRJdL+6/wwEcF0C7XRk1AHP2fO6t+Xgdndob5JfvqKx5kFcwaRrafWoXfFKhP3j2mCdRwOyLIVJgzALfJYSaQoPJoMj68YLZygPDRZruHdRJxh9i5/uazy5kp5ulOGYDbawlETyKIZDlc8aHJq9UtKnDC7BtF2uhlhqsVI0FVYbWgVTELbHUwr4lyzWth+RK9O5aTdxuR2R2lgqVU/2O/qXLk/3Ir7jmT2r8TYJby7pQaunrFlYwD0arPoIW+2jqVwC9wRrPlNDINALAURuHLOOL6Zyk77kvc+mIpj/7LbIuGC8qpEN3DClWUlB9ijQ2UZTCD8K84oJymw6Pix+pOypNv2BWF3l00e+aIgOsa6j4Agpf61Pcoyfgr/JrGR+3Hfquzm9nV42eFx8t244jWvYS9zdR8E20Gq2dw/z1zwDpY6V3RTf6Mq+Vv/wWnAjSGRDrqGiKwWT2MbYiYmhzKF6ou9EWH22ktI2uDzW24fH00J9sS3NTQBMALU3tnQ3+a1oT9YvSmxXxd2ysAK13An0BXQn4bs65PXHls=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199018)(8676002)(31686004)(36756003)(66556008)(6512007)(66476007)(5660300002)(44832011)(2906002)(66946007)(8936002)(450100002)(86362001)(31696002)(38100700002)(6506007)(316002)(478600001)(83380400001)(6486002)(26005)(41300700001)(2616005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3ZXaHVIZDR6Njl1UDIxMFlzUk9YZmxDQmZoeGdVbWI2Q1pUSjR1VU9Qd2Fi?=
 =?utf-8?B?NjRlcmJLZ0d4WjVNYzJ2S1IvL1daalpRWlJnaEpkVC84VjVzK25nbXJaQXp6?=
 =?utf-8?B?SVlleDJTZ0dhTWQ5NzZ0VTFuSkIvSkg5UExIdXg3R2s5QU1CU2hoakpsOE11?=
 =?utf-8?B?RGgvM2VFci9ZN1I1ME1uanVFRGhxMWpyM001RzYvczlIb3l4S1FGR201SWk1?=
 =?utf-8?B?L1ZDWTB1YU8xTHM3NWZrTTVxTVQ2allzdjBYbzhUL1ZrSkhRL0V2bCttcDhK?=
 =?utf-8?B?bU1DVy83U2NGa1ZDWThzVVpoWGN6bDl5L2FtMFFCbGNQK1FFVVc3MFZ3dG9w?=
 =?utf-8?B?V0ZNaEhNTXdDQzQ5aWFTa0NCc1gxR2VkYytBbjJERGlhL3dkUGZoSHArY0Fo?=
 =?utf-8?B?UTZlZ3BnT3BaQit5c1RDQnlhOTk3WGF0b0pncndlSzkvM1hUbUQxTFowZk9r?=
 =?utf-8?B?ZkVrekd2UnFWZzZhdTI2Y1Q0NXlCcnhvd1Flc2FjNFp0YUp6Y1EvQThYSGtx?=
 =?utf-8?B?c0p6MEx2ekpONWJlL2JVd2Fzc0NvSlFka2FIVXR2T2F0MTNrTm54OUhkZXBO?=
 =?utf-8?B?bzArZ1lBL0ExKzA0YjVjU1NMNDFURzljSVNrUnh2cmUrL1MzODJLUmVwdXZv?=
 =?utf-8?B?cFBIYkgxOVpHUWFTZHljZDdCWGFqQVVYRGtKRmxzUDNBOGFQR2hQb2VFeUxX?=
 =?utf-8?B?TVNnbzVSY1E0aVBYMjg5TFovSW9tdmJDMjdSN2tDbG41d3FUT0hwcU5IT0Zl?=
 =?utf-8?B?NTJ0R05nVE5LWExERVRHYTJsTEtnallBSXg0K080cFJtZDY3VldJbTMySDBz?=
 =?utf-8?B?UGN0dVQ2WDMxYmtRc3dhdk9kVFZmeTBPVTBFSEFVMTljZ0U0WGp1RC9JQ2NB?=
 =?utf-8?B?WWVUZ09EY3BkSHBLR1AyZGFQWnpZcmt0cS9ZaVJBMjYzSGw0bG9VcVhDQkgy?=
 =?utf-8?B?MElMcUlxUFhtUVl3Nll3RnkyaTRDMDd2N3N2dE5tc2oxUGpwbjE5cU5oajZJ?=
 =?utf-8?B?MU5zaDF2TG9rb1Q1S2NxRkR2K2crU1BFUTJWRjhPU2ZIWmZLTVRjRW5HWURP?=
 =?utf-8?B?bzBGQmQzVktRS0xONVAvRWlubTZIVHNtMnUzcEx2MFNkWjg2MVc0eWNEY2p1?=
 =?utf-8?B?T08vamhsTnA5TmRPaDRNSnVNYkp3bVZNWEJreUVtZCt3NmtVQk8vNncvNE82?=
 =?utf-8?B?b29paFFtTDhOUXZNZ1FIWnhFK2VHRGZoUFd4ZHRnUTV5QzdrbE1iL1VvRWJu?=
 =?utf-8?B?RW13QlVzdnlXRU5ybEJCSWJmTXpibURaRXpCakIzLy92YjBRaEoyVC8vS053?=
 =?utf-8?B?cGo5SEhnc09ZOHZVUGkvaC9nVFZ2YlZDdnlyb1RITEpCWnJNd2hkMVlqdHcx?=
 =?utf-8?B?b3krM3NmMUMrQ05WY2ZyemgzOEZZdGpYZUtTVjVWQTdudndibS9MQmlyWTZi?=
 =?utf-8?B?MGd3N0Ewa0VGZXBjV1FVQzhPamMrWTlja1ZUbjhNNEpXQU43SFpvLzZGSXJz?=
 =?utf-8?B?dCtKdnJXQmpQSXNZZkJrUzVVZlJxNlRzaWRIekhsYVJObHpmdWRvVm1paEFk?=
 =?utf-8?B?c05XbU5QWnhyMmRGWUlocVo4eG1ocXB2L3Rmc1BXZTBxRzZSeGc0bXREMmR4?=
 =?utf-8?B?YjgwYTJWVGdMK3huS24vNUUzd1dqS3ArU05jU1dUT0U1ZFowK094Smd0QS84?=
 =?utf-8?B?UzNmaGNOUFJJUVhORUMvVzdyRzAwak81Q2V5L1hqUDNjS0picVRoL3pFS1da?=
 =?utf-8?B?TzZqd0VobEk2Y3hGUk5HbFdXSDVwQ0hjc1MvV3pXdSt6ZmVlWEJUTlRBRzRk?=
 =?utf-8?B?RVQ5RTFkdVp2OTFlMGNsajF1MForT2RPd3Rid3pBc3pWZ1liVFErSWJKUjlu?=
 =?utf-8?B?b1ZNeUFHM2pHdXhmeVpCVXAwaDBTU0ordGNSTDExMHU3aThMMHBjRXQ0NW9a?=
 =?utf-8?B?VGQrNXdReDlIYzZDQllyZGhZZ04xbFhIVXNtWURvdmppeHRzd3ZKT05VWW8y?=
 =?utf-8?B?WmR4VVExSjJCVjloWklDYW5PU3VqSVRFSTI0NXRZaFgyR1pWNU1RUGljL2tr?=
 =?utf-8?B?cjllSlNqMkYwd2RiZVdYVGozREszUkxuRDNxbXFJZmxHUkxFMFJVRmRGZlUv?=
 =?utf-8?Q?0WLvNa8OD2FAku3BZBNzsjPxl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc61d324-1563-48cf-d5f0-08db2b200f0f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 21:54:49.6419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BccdD8Shzll967C7Y6B9QZsT03kL864mnC22RXtUQ3dFh88fqGx5li5nj5rw4vnc/xqxGipHFYOKmopz2Hgtxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8136
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

Am 2023-01-25 um 14:54 schrieb Jonathan Kim:
> Similar to queue snapshot, return an array of device information using
> an entry_size check and return.
> Unlike queue snapshots, the debugger needs to pass to correct number of
> devices that exist.  If it fails to do so, the KFD will return the
> number of actual devices so that the debugger can make a subsequent
> successful call.
>
> v3: was reviewed but re-requesting review with new revision and
> subvendor information.
> memset 0 device info entry to clear padding.
>
> v2: change buf_size are to num_devices for more clarity.
> expand device entry new members on copy.
> fix minimum entry size calculation for queue and device snapshot.
> change device snapshot implementation to match queue snapshot
> implementation.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  7 ++-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 72 ++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  5 ++
>   3 files changed, 82 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 93b288233577..da74a6ef4d9b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2972,8 +2972,11 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   				&args->queue_snapshot.entry_size);
>   		break;
>   	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
> -		pr_warn("Debug op %i not supported yet\n", args->op);
> -		r = -EACCES;
> +		r = kfd_dbg_trap_device_snapshot(target,
> +				args->device_snapshot.exception_mask,
> +				(void __user *)args->device_snapshot.snapshot_buf_ptr,
> +				&args->device_snapshot.num_devices,
> +				&args->device_snapshot.entry_size);
>   		break;
>   	default:
>   		pr_err("Invalid option: %i\n", args->op);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index db316f0625f8..d1c4eb9652fd 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -22,6 +22,7 @@
>   
>   #include "kfd_debug.h"
>   #include "kfd_device_queue_manager.h"
> +#include "kfd_topology.h"
>   #include <linux/file.h>
>   #include <uapi/linux/kfd_ioctl.h>
>   
> @@ -998,6 +999,77 @@ int kfd_dbg_trap_query_exception_info(struct kfd_process *target,
>   	return r;
>   }
>   
> +int kfd_dbg_trap_device_snapshot(struct kfd_process *target,
> +		uint64_t exception_clear_mask,
> +		void __user *user_info,
> +		uint32_t *number_of_device_infos,
> +		uint32_t *entry_size)
> +{
> +	struct kfd_dbg_device_info_entry device_info;
> +	uint32_t tmp_entry_size = *entry_size, tmp_num_devices;
> +	int i, r = 0;
> +
> +	if (!(target && user_info && number_of_device_infos && entry_size))
> +		return -EINVAL;
> +
> +	tmp_num_devices = min_t(size_t, *number_of_device_infos, target->n_pdds);
> +	*number_of_device_infos = target->n_pdds;
> +	*entry_size = min_t(size_t, *entry_size, sizeof(device_info));
> +
> +	if (!tmp_num_devices)
> +		return 0;
> +
> +	memset(&device_info, 0, sizeof(device_info));
> +
> +	mutex_lock(&target->event_mutex);
> +
> +	/* Run over all pdd of the process */
> +	for (i = 0; i < tmp_num_devices; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +		struct kfd_topology_device *topo_dev = kfd_topology_device_by_id(pdd->dev->id);
> +
> +		device_info.gpu_id = pdd->dev->id;
> +		device_info.exception_status = pdd->exception_status;
> +		device_info.lds_base = pdd->lds_base;
> +		device_info.lds_limit = pdd->lds_limit;
> +		device_info.scratch_base = pdd->scratch_base;
> +		device_info.scratch_limit = pdd->scratch_limit;
> +		device_info.gpuvm_base = pdd->gpuvm_base;
> +		device_info.gpuvm_limit = pdd->gpuvm_limit;
> +		device_info.location_id = topo_dev->node_props.location_id;
> +		device_info.vendor_id = topo_dev->node_props.vendor_id;
> +		device_info.device_id = topo_dev->node_props.device_id;
> +		device_info.revision_id = pdd->dev->adev->pdev->revision;
> +		device_info.subsystem_vendor_id = pdd->dev->adev->pdev->subsystem_vendor;
> +		device_info.subsystem_device_id = pdd->dev->adev->pdev->subsystem_device;
> +		device_info.fw_version = pdd->dev->mec_fw_version;
> +		device_info.gfx_target_version =
> +			topo_dev->node_props.gfx_target_version;
> +		device_info.simd_count = topo_dev->node_props.simd_count;
> +		device_info.max_waves_per_simd =
> +			topo_dev->node_props.max_waves_per_simd;
> +		device_info.array_count = topo_dev->node_props.array_count;
> +		device_info.simd_arrays_per_engine =
> +			topo_dev->node_props.simd_arrays_per_engine;
> +		device_info.capability = topo_dev->node_props.capability;
> +		device_info.debug_prop = topo_dev->node_props.debug_prop;
> +
> +		if (exception_clear_mask)
> +			pdd->exception_status &= ~exception_clear_mask;
> +
> +		if (copy_to_user(user_info, &device_info, *entry_size)) {
> +			r = -EFAULT;
> +			break;
> +		}
> +
> +		user_info += tmp_entry_size;
> +	}
> +
> +	mutex_unlock(&target->event_mutex);
> +
> +	return r;
> +}
> +
>   void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
>   					uint64_t exception_set_mask)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index ee12de5f7adf..b31e453704fc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -81,6 +81,11 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
>   }
>   
>   void debug_event_write_work_handler(struct work_struct *work);
> +int kfd_dbg_trap_device_snapshot(struct kfd_process *target,
> +		uint64_t exception_clear_mask,
> +		void __user *user_info,
> +		uint32_t *number_of_device_infos,
> +		uint32_t *entry_size);
>   
>   void kfd_dbg_set_enabled_debug_exception_mask(struct kfd_process *target,
>   					uint64_t exception_set_mask);
