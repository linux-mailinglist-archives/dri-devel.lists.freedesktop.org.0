Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E9A716E4E
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 22:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A8E10E034;
	Tue, 30 May 2023 20:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892EF10E034;
 Tue, 30 May 2023 20:05:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCSwopnOwtPkd0j2ZR6+R0iUJdSijlvD9+vS4nWmTnsoy8HtplJrbVa743br7XdprQO+dkligWxQ84shGSI1oXZbgXxDD5GAO4CAOkkbFba9Rfr37cDIUf5Ahn1sY/TOHSXIBw3UfJoORlLN4sL0lITpltTLoDLi/aJ/o8F1KRPPiZoEp7Uix8sUAO8mBwPc5e6QUfyvGB2z3dkfkLucrjI+KYid3pUJoKcDyNBSR16Jahb2spzgX7x8ztWyKYMq0s5O5JRpfwYGBmHzfSbYgJ2koVv0m523veDKLdGhhJfUdpQG31gc7rE9OoJ5iEd1XLItNcAPsGIJZ/9wtMV41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXkPbebBdgiowFa6IazFpZ+XEDlvf/267fyjrRC49ck=;
 b=arhefNypc7CShM+niCjeuEytchrxxRq47F6YA5vpFCC5j5w5o8pOhodMhSNoP6S2Z23DlOpXh8x9qiiHoF1l7q+QB6xGdLeC6ey1JwPO6ub0GsP8FQyCXcSGES3b2aK4RLT629ieTtX478pHLwMsFM0S8xdrBIBsf5YR9kMSVX+W6xIpFLkVNLiPlMy+8SPneNAoTRJwskTlJ3bQG4IsFipliGFxDjgohwefrmoPnVywC5zL6CDcXPf8TtIwqVQ118baJSnxDwTn/gQ3EJK8Aj1CaLX6wiAthXMhFEk/AMaTN6GcdFfSTSfbXD8sG/WIvu5yguD46KxbWbCKBaVHqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXkPbebBdgiowFa6IazFpZ+XEDlvf/267fyjrRC49ck=;
 b=xxlGZ67FgT1sEldCIIiMaaxzpnK5oMnC/sWYpBF96SBALXLz99YZjxs4/aeT9pgiMu9/SoP+TYO2+fcehUaxdBmMFeg7itWSJF6ml6THwDHGnPsDJa3erZmQINB2LNGUOohas3cX4QSbv34XgXc2GO1ee9knddD1LGumWxZNlQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW4PR12MB6952.namprd12.prod.outlook.com (2603:10b6:303:207::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Tue, 30 May
 2023 20:04:59 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 20:04:59 +0000
Message-ID: <502355b2-0132-a20a-13a3-3a4d3addaade@amd.com>
Date: Tue, 30 May 2023 16:04:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 16/33] drm/amdkfd: add per process hw trap enable and
 disable functions
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-16-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-16-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0033.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::46) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW4PR12MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed1e43f-1d6c-471a-6d69-08db61492566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c29VeCrluvPUjHnmPiUWZbCPrJxBVgZX90FUFb0jWqbZ4ayQKE0wjyWYVl1Trh1NAsz2O1aZesN1J/bEPs4y5bB2czgVqhkD4qVxqUOj3vz3FSqjWT/EenMZgQcdP9ir2mQCIza9VOn02D9yeXawt8+9tsIPgMCZMfbjETL9Ff13rjsanZ+/DFUkdOIi9x6Zr5cUzn8OS4wW5kG1BRiyUyhZkkruoMJtqQt9dBQPDPVytNQ91rJZZqNV4YmbapdvgEDPQjEr8VSn2UMzSRoMtH8Q0WAq5GpkaknEuH9ks5VmNWRbN+jQYrK5mYSLQuqBGxqhmbyobdaFD/mn6HWicEUFy2VhJoQD1gN3iCv53gQDzjEADM3jFwxFyiYHnFUOUyeDFtFi0qgbSKhWrS3JU2n/NUd9G2/8YgUeB/y3t+C1gtSmL02k+ASfuSlyxhzBZb/pnDN5HjBBuOQYyubD2eTgsw/mwEGNknVnXXHWiGAyPdCdUGOr6mFNbiyNegYh+oe9cH2pwLgkptVr6exZ6ZmvS7j5he07npJVJWlBDJ5dxpkskIO2B+gQHu8Y9mBbyrUaGGC/KZ6w3sbX+NAIEJBsaQE8MMDJxQGQjT8LmiVqDKpbHbSFovwropO/5ewQkmpczWE5IzrdzClqrvX+Rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(451199021)(478600001)(83380400001)(5660300002)(186003)(4326008)(30864003)(6486002)(86362001)(8936002)(8676002)(2906002)(41300700001)(31686004)(38100700002)(31696002)(6512007)(316002)(6666004)(6506007)(44832011)(26005)(66946007)(2616005)(450100002)(36756003)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmJodFlSRi9YY1JzUHZhMjVPZkNodjZrS1BVdVJ6QTZOUFM1UkVGLzl0dldj?=
 =?utf-8?B?K1NjMy9lZGMwL2tkaERuNEl6UG81eE9PTnFZRllYWmNocEVFOFNoRmV6KzF0?=
 =?utf-8?B?WXlBcmFVSStpSDZBYW5UOTVSREN3UXVhT1dpTU5Yd2hZMkxsZ2hOL2ZKcEEr?=
 =?utf-8?B?N0tmV2ZHRGtabjQ3K0h2WGgrWEtrWnhzZWJCS1RQSFd6NWZLTzNkTmphNFdN?=
 =?utf-8?B?cnJrTjlnT2p3RWtCRmxFMlJGVGwxVkZYV1JvaGY4dm5yQTlURzlHYXQzTk0y?=
 =?utf-8?B?alU5R0dVS2N0bjB6OXNzb01tYjFwYlA3NUlGdXQzWjN3TmZzaE5JQklrTkFI?=
 =?utf-8?B?WElSQUlDaVgxU0UwRU84eExjZ08zZWMvUWdzdjdSbUM1SklHbmh2QUdoUlY1?=
 =?utf-8?B?Z05yTHdIakxMeDhscXNhQjB1cDdsd1NYaklTNVg1Zjl0S1pmNlFmWVVDREZq?=
 =?utf-8?B?VURSR1NTRTZGdnkwSFk2ajJrQlBZNWUyK0RnWU5mM1JRR1ZXcE1qakozakx3?=
 =?utf-8?B?VDcya1Yrd01CTzd6NjAwektrMVdSSkxrNVFRbVFuL2NhZEVaamRvemF4QnVW?=
 =?utf-8?B?OFdqRzg3VGF4d01UdXBwbDFUeEZsaDFDZnRYU0FmSk5yQnIwSlFrUVhDRWZw?=
 =?utf-8?B?UmRWQk5kaXo4b2pvWjBnWlBVcVZVSitoM3R3YnFSQkVJdW5LWHZpcUJZMjRF?=
 =?utf-8?B?OFlQbitHY3owK1lEUnJjVnJJbGFweUNrVlB5djZ5MHhhak1HY3lPZ1dRTUlT?=
 =?utf-8?B?SkFtSlNMY05GTnNHZW4rUUZMTHJZVTVLc3NwRGxMZUhncGg1cXFrSGQyTytu?=
 =?utf-8?B?R3VVVVRGMUJ2UVBIK0FYVmt5bC95WmRBMGRtVHRhZVZhZ1ZIUWQ5VFArdDNY?=
 =?utf-8?B?VkwyUkIvZWZYcXRKbFI5QlJMcElhdUVQS1BGNWpQRmJzWmc2UzNCamZsNGVT?=
 =?utf-8?B?RGFQdFhhYmN1QmsxbmxOZ1FXUnNKazNDbzdiUUg2Ymc2N3VqaHNaUWw0T3FZ?=
 =?utf-8?B?WkNIUkJldi9QaHZqWjNpYjJRTFJ3NTVvdUFlNmsyMndUN3JOSjRqcEJNZENx?=
 =?utf-8?B?L21nQjd4YndTWjdBMUdVOERBTEpuV2gwRGtIZGl0U3NCd2hZMWp1YTQrQ3lj?=
 =?utf-8?B?Y1pYSHQyMnE5b1phaXpGTGNJT29rc0hZemJJai9ZWEVvSWlzMjFYaStaQXlT?=
 =?utf-8?B?M3YyLzlDUzBrZXNiMDdzUkQrMEVxcGVySWZIell5STY4QlRDdG5jc3hqYVFR?=
 =?utf-8?B?bkwrZ2YvR3VxSExnWHIwU3FVMnllWlFWaURzMkUzemlyUGltcjd5Q0EwM1p2?=
 =?utf-8?B?eFZRb3g0VkphaGZDUURQL0dGQ2kvODNMT2VpT3p6cVQ2YlFZOG16OU5PcnAw?=
 =?utf-8?B?ZER1OVQzWEpOck9jbjIwNWhKcTlJNG44djhPb1ExcVpnNjJnemFmVWo0cGxT?=
 =?utf-8?B?R0VUaDhvTktXMlFYODZNRUpGZzZ4TkM4RnEzNjNsNFQ5RzMrMnlvV2N2b0ZR?=
 =?utf-8?B?Z1d5Ti9YQ01ieXJ4WndpRnk1VmJXVThjbDhpVklNZU9CSHB5ZTI0V3d0NWN2?=
 =?utf-8?B?REMwV0duQ09HZmYvVFFqRXFVWDg3ZGQyM2RTY2JsbGlJQXNlUmJubDFNSTNH?=
 =?utf-8?B?bzhrQ0hrMTZ4TkdpTU1FNXlLYksrdVBLUUJCSkpyWXl4czEzZldkanhvYzhu?=
 =?utf-8?B?eDIzbCt5SjRUTm95Vm92czJOakh4MlREKzkvR0dKRG9xY1M0dE1VU0RXeWpi?=
 =?utf-8?B?UldzTXRVdnFuOHVpcmhxZDNZVVNTVW9Idkc2SkN2UlhTOTF1MTBzdnVKakpM?=
 =?utf-8?B?S3Bkbm5WM3M0RnMzK0VDRUk1V0VKcUtiT1ovRDVNVkY3YzEvaDc3ME1ITWRm?=
 =?utf-8?B?Y0F4dThVTUxPODVDNkVGNm9mcktBb1BoWk5kK1JiT2F6UXFUQ1VMRzM3RUpE?=
 =?utf-8?B?ZDZHSmpoVldwRVZ3S2hNWm5lYXRLUUduRUZtQi84b1JBVTllMUg0UEJSM0pk?=
 =?utf-8?B?cmRiai9LaEQvc3NiNFBVaU5vZkJPYlpFMUErcmtsRG1LbmZCSkQyajZyYWRG?=
 =?utf-8?B?aGxJNkpwOHFHenRyM2E2SlVnR2psckFyOTB3Zzk4aVZpUlFkU3R6VnIvc1ZD?=
 =?utf-8?Q?LOzBCyArr7J8kuYH6vce5SYq7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed1e43f-1d6c-471a-6d69-08db61492566
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 20:04:59.2352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEXcLEsFzZMuKZB0Io3c424MEnIkVSbfLC8vxYAXU0+M398BenF9TEj3/k9Av/5Yprt11ftwad6u7waBVA5gUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6952
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
> To enable HW debug mode per process, all devices must be debug enabled
> successfully.  If a failure occures, rewind the enablement of debug mode
> on the enabled devices.
>
> A power management scenario that needs to be considered is HW
> debug mode setting during GFXOFF.  During GFXOFF, these registers
> will be unreachable so we have to transiently disable GFXOFF when
> setting.  Also, some devices don't support the RLC save restore
> function for these debug registers so we have to disable GFXOFF
> completely during a debug session.
>
> Cooperative launch also has debugging restriction based on HW/FW bugs.
> If such bugs exists, the debugger cannot attach to a process that uses GWS
> resources nor can GWS resources be requested if a process is being
> debugged.
>
> Multi-process debug devices can only enable trap temporaries based
> on certain runtime scenerios, which will be explained when the
> runtime enable functions are implemented in a follow up patch.
>
> v2: spot fix with new kfd_node references
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   5 +
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 148 ++++++++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h   |  29 +++++
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c |  10 ++
>   4 files changed, 190 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 7082d5d0f0e9..9d0c247f80fe 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1488,6 +1488,11 @@ static int kfd_ioctl_alloc_queue_gws(struct file *filep,
>   		goto out_unlock;
>   	}
>   
> +	if (!kfd_dbg_has_gws_support(dev) && p->debug_trap_enabled) {
> +		retval = -EBUSY;
> +		goto out_unlock;
> +	}
> +
>   	retval = pqm_set_gws(&p->pqm, args->queue_id, args->num_gws ? dev->gws : NULL);
>   	mutex_unlock(&p->mutex);
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index 898cc1fe3d13..73b07b5f17f1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -21,13 +21,78 @@
>    */
>   
>   #include "kfd_debug.h"
> +#include "kfd_device_queue_manager.h"
>   #include <linux/file.h>
>   
> +static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
> +{
> +	uint32_t spi_dbg_cntl = pdd->spi_dbg_override | pdd->spi_dbg_launch_mode;
> +	uint32_t flags = pdd->process->dbg_flags;
> +
> +	if (!kfd_dbg_is_per_vmid_supported(pdd->dev))
> +		return 0;
> +
> +	return amdgpu_mes_set_shader_debugger(pdd->dev->adev, pdd->proc_ctx_gpu_addr, spi_dbg_cntl,
> +						pdd->watch_points, flags);
> +}
> +
> +/* kfd_dbg_trap_deactivate:
> + *	target: target process
> + *	unwind: If this is unwinding a failed kfd_dbg_trap_enable()
> + *	unwind_count:
> + *		If unwind == true, how far down the pdd list we need
> + *				to unwind
> + *		else: ignored
> + */
> +static void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind_count)
> +{
> +	int i;
> +
> +	for (i = 0; i < target->n_pdds; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +
> +		/* If this is an unwind, and we have unwound the required
> +		 * enable calls on the pdd list, we need to stop now
> +		 * otherwise we may mess up another debugger session.
> +		 */
> +		if (unwind && i == unwind_count)
> +			break;
> +
> +		/* GFX off is already disabled by debug activate if not RLC restore supported. */
> +		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
> +			amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
> +		pdd->spi_dbg_override =
> +				pdd->dev->kfd2kgd->disable_debug_trap(
> +				pdd->dev->adev,
> +				target->runtime_info.ttmp_setup,
> +				pdd->dev->vm_info.last_vmid_kfd);
> +		amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +
> +		if (!kfd_dbg_is_per_vmid_supported(pdd->dev) &&
> +				release_debug_trap_vmid(pdd->dev->dqm, &pdd->qpd))
> +			pr_err("Failed to release debug vmid on [%i]\n", pdd->dev->id);
> +
> +		if (!pdd->dev->kfd->shared_resources.enable_mes)
> +			debug_refresh_runlist(pdd->dev->dqm);
> +		else
> +			kfd_dbg_set_mes_debug_mode(pdd);
> +	}
> +}
> +
>   int kfd_dbg_trap_disable(struct kfd_process *target)
>   {
>   	if (!target->debug_trap_enabled)
>   		return 0;
>   
> +	/*
> +	 * Defer deactivation to runtime if runtime not enabled otherwise reset
> +	 * attached running target runtime state to enable for re-attach.
> +	 */
> +	if (target->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED)
> +		kfd_dbg_trap_deactivate(target, false, 0);
> +	else if (target->runtime_info.runtime_state != DEBUG_RUNTIME_STATE_DISABLED)
> +		target->runtime_info.runtime_state = DEBUG_RUNTIME_STATE_ENABLED;
> +
>   	fput(target->dbg_ev_file);
>   	target->dbg_ev_file = NULL;
>   
> @@ -42,16 +107,89 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
>   	return 0;
>   }
>   
> +static int kfd_dbg_trap_activate(struct kfd_process *target)
> +{
> +	int i, r = 0;
> +
> +	for (i = 0; i < target->n_pdds; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +
> +		if (!kfd_dbg_is_per_vmid_supported(pdd->dev)) {
> +			r = reserve_debug_trap_vmid(pdd->dev->dqm, &pdd->qpd);
> +
> +			if (r) {
> +				target->runtime_info.runtime_state = (r == -EBUSY) ?
> +							DEBUG_RUNTIME_STATE_ENABLED_BUSY :
> +							DEBUG_RUNTIME_STATE_ENABLED_ERROR;
> +
> +				goto unwind_err;
> +			}
> +		}
> +
> +		/* Disable GFX OFF to prevent garbage read/writes to debug registers.
> +		 * If RLC restore of debug registers is not supported and runtime enable
> +		 * hasn't done so already on ttmp setup request, restore the trap config registers.
> +		 *
> +		 * If RLC restore of debug registers is not supported, keep gfx off disabled for
> +		 * the debug session.
> +		 */
> +		amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
> +		if (!(kfd_dbg_is_rlc_restore_supported(pdd->dev) ||
> +						target->runtime_info.ttmp_setup))
> +			pdd->dev->kfd2kgd->enable_debug_trap(pdd->dev->adev, true,
> +								pdd->dev->vm_info.last_vmid_kfd);
> +
> +		pdd->spi_dbg_override = pdd->dev->kfd2kgd->enable_debug_trap(
> +					pdd->dev->adev,
> +					false,
> +					pdd->dev->vm_info.last_vmid_kfd);
> +
> +		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
> +			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +
> +		if (!pdd->dev->kfd->shared_resources.enable_mes)
> +			r = debug_refresh_runlist(pdd->dev->dqm);
> +		else
> +			r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +		if (r) {
> +			target->runtime_info.runtime_state =
> +					DEBUG_RUNTIME_STATE_ENABLED_ERROR;
> +			goto unwind_err;
> +		}
> +	}
> +
> +	return 0;
> +
> +unwind_err:
> +	/* Enabling debug failed, we need to disable on
> +	 * all GPUs so the enable is all or nothing.
> +	 */
> +	kfd_dbg_trap_deactivate(target, true, i);
> +	return r;
> +}
> +
>   int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   			void __user *runtime_info, uint32_t *runtime_size)
>   {
>   	struct file *f;
>   	uint32_t copy_size;
> -	int r = 0;
> +	int i, r = 0;
>   
>   	if (target->debug_trap_enabled)
>   		return -EALREADY;
>   
> +	/* Enable pre-checks */
> +	for (i = 0; i < target->n_pdds; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +
> +		if (!KFD_IS_SOC15(pdd->dev))
> +			return -ENODEV;
> +
> +		if (!kfd_dbg_has_gws_support(pdd->dev) && pdd->qpd.num_gws)
> +			return -EBUSY;
> +	}
> +
>   	copy_size = min((size_t)(*runtime_size), sizeof(target->runtime_info));
>   
>   	f = fget(fd);
> @@ -62,6 +200,10 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   
>   	target->dbg_ev_file = f;
>   
> +	/* defer activation to runtime if not runtime enabled */
> +	if (target->runtime_info.runtime_state == DEBUG_RUNTIME_STATE_ENABLED)
> +		kfd_dbg_trap_activate(target);
> +
>   	/* We already hold the process reference but hold another one for the
>   	 * debug session.
>   	 */
> @@ -71,8 +213,10 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   	if (target->debugger_process)
>   		atomic_inc(&target->debugger_process->debugged_process_count);
>   
> -	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size))
> +	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size)) {
> +		kfd_dbg_trap_deactivate(target, false, 0);
>   		r = -EFAULT;
> +	}
>   
>   	*runtime_size = sizeof(target->runtime_info);
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index db6d72e7930f..17481f824647 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -34,4 +34,33 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
>   	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);
>   }
>   
> +/*
> + * If GFX off is enabled, chips that do not support RLC restore for the debug
> + * registers will disable GFX off temporarily for the entire debug session.
> + * See disable_on_trap_action_entry and enable_on_trap_action_exit for details.
> + */
> +static inline bool kfd_dbg_is_rlc_restore_supported(struct kfd_node *dev)
> +{
> +	return !(KFD_GC_VERSION(dev) == IP_VERSION(10, 1, 10) ||
> +		 KFD_GC_VERSION(dev) == IP_VERSION(10, 1, 1));
> +}
> +
> +static inline bool kfd_dbg_has_gws_support(struct kfd_node *dev)
> +{
> +	if ((KFD_GC_VERSION(dev) == IP_VERSION(9, 0, 1)
> +			&& dev->kfd->mec2_fw_version < 0x81b6) ||
> +		(KFD_GC_VERSION(dev) >= IP_VERSION(9, 1, 0)
> +			&& KFD_GC_VERSION(dev) <= IP_VERSION(9, 2, 2)
> +			&& dev->kfd->mec2_fw_version < 0x1b6) ||
> +		(KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 0)
> +			&& dev->kfd->mec2_fw_version < 0x1b6) ||
> +		(KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 1)
> +			&& dev->kfd->mec2_fw_version < 0x30) ||
> +		(KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0) &&
> +			KFD_GC_VERSION(dev) < IP_VERSION(12, 0, 0)))
> +		return false;
> +
> +	/* Assume debugging and cooperative launch supported otherwise. */
> +	return true;
> +}
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 0281f79fcd7d..a3846bb87510 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1165,9 +1165,19 @@ static void kfd_process_free_notifier(struct mmu_notifier *mn)
>   
>   static void kfd_process_notifier_release_internal(struct kfd_process *p)
>   {
> +	int i;
> +
>   	cancel_delayed_work_sync(&p->eviction_work);
>   	cancel_delayed_work_sync(&p->restore_work);
>   
> +	for (i = 0; i < p->n_pdds; i++) {
> +		struct kfd_process_device *pdd = p->pdds[i];
> +
> +		/* re-enable GFX OFF since runtime enable with ttmp setup disabled it. */
> +		if (!kfd_dbg_is_rlc_restore_supported(pdd->dev) && p->runtime_info.ttmp_setup)
> +			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
> +	}
> +
>   	/* Indicate to other users that MM is no longer valid */
>   	p->mm = NULL;
>   	kfd_dbg_trap_disable(p);
