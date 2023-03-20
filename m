Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6AE6C256B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 00:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFF710E33F;
	Mon, 20 Mar 2023 23:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAEB10E00F;
 Mon, 20 Mar 2023 23:06:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNpjKcOa5OpMVKLoSL1eRd4xBfN+xx94WScFClLjG8sAsy1XX/07C/UzsBcnGkrblVtOqfhujxL4zBtPeo5/zUsnb2nHIK60f7Y2eK2d8PRQ2NQ/Un0Eb6AaUoXGIUP0nNevW4fpRErKiIqlxxUjAcZOH+UCrALkr69pXXLoDK6flg2+dlG7K3ocAKHZETiasInfDz1G0/jngnMR5uZuf66/t/qdKftltFnx9Y+oBuMe638RTNqz/b9f2xvI1nYLruQQdpFzIHfBMwjceCqk70/sBfKWmY83FQ9Jh5joED8+EhIj5peKUXgG8WpwqbYG1B9kHF8PsXroxCk0hfDh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1dxpxnHaYktiVB14nVmxh2WAHtCwBv43Zl8Xn5Pf7c=;
 b=HNhw1bLCDKvhxqVj0clY93Ca3eQO5raYin48oz0OeGuVVOd2d34tA9WJhJDMjF6FQivrV5RkHj+9Y189rnd4UZ2r7TqBeHxBqHkNYPWSv/U5h82d6eT3dDslE5KK7a4kq4+5yEhjYe+G+xSKl0+cMjyFaQ4+/0Bf6tWmvfzqB1POJV9ZXejgfzJe9p9it2ZQrlAxlkPQmYAB3BrrsZExPEujkPs/BUM0AgBhKqZ07/i3DFRa2yHzV6mkERE4byCJMcS2XYrPowj9f/T3s2/8ibn88O57jcX/wrr3WKLiyPJf+SZxKG1CRfkw1E0eDB9/9MxEkpssEk1fxw0+hNK0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1dxpxnHaYktiVB14nVmxh2WAHtCwBv43Zl8Xn5Pf7c=;
 b=nD6pBuLRnz8EJFYlz0um06d1PSF0oXHh7kLJeTeesYmsQw40S1C2o+MbeXb8Abbgkz1LKjSK0EjYmLHMenLG0M0YfOWvAZaaF9N1xOIdlA11h6ymm+hk17KJwLgH1wRs8Zgs8M1SLGH5UvOLSeSXDzkR1C0GGWAvyMvAtN1YH1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BL1PR12MB5923.namprd12.prod.outlook.com (2603:10b6:208:39a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 23:06:19 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 23:06:18 +0000
Message-ID: <e8d863eb-1c86-dac9-de0b-bf63e6b49c38@amd.com>
Date: Mon, 20 Mar 2023 19:06:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 16/32] drm/amdkfd: add per process hw trap enable and
 disable functions
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-17-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230125195401.4183544-17-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0227.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::9) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BL1PR12MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: a557ad1f-349c-4c7b-77b0-08db2997b620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ovekJ6QvYdFqiqF6QWuDujQ6SuhRnvlOLcgvuH8MNeuWVGwNUglhky+pLfn/iWw8aQZYj0I1fqFZuW1zvOiivF1umXMkdP6QfBdzuUO7cDzpm+GZ66+qqSY6uCvTaRaDa+8ca/622s/Kg3yEovtOj1dAuaDvadkFMIGZSFXAi4mCU7XdLLelcL1NytNdm4Nrsz5rKn3sJTlu0Ehul3Q4NuF1h8AUNxyS50amC/I1WplPc4sM48De8oqyZ+Bgkp0pkKj0e/Pk+rv5BcrTNWx2bhBgB+LMVHTFUfJ+JQqzB+mrPOzaYYG1tGksWSy0kHr0rdzH0V2I2oRfX4wbpANk+iDrRCmqhTvvU3S2dIkUOLFy5GOGoYo9D1dzVI0ghp/bUe6pPWB4OeIrzCCdTRufKS0bYIo/vXQxhW87yxiH6OUMo4TTScvRW8U0AUsyGtRkMIqG+OQfqq6cydko77uwmpTxbv1dceCuVCvloX6z1p4BGer/WQKekrsXdfPjmSUBzXr2Z8S7K4zmQv0mA0vZn8Pky56tiA7SmeRFD5j6ZiOSDWI8xO+1tCpLwpvRkTbXfNKWAHhKROWBCeLVvnmg6OEmvAvUdN7wfoAicyM+qF+yvuJ2I7onDpeLIpUiWmfYp9Ek7ltOYYvE4YPXekXvaTXHzJn4rvPQITxl/H5SoePdnky2+YqdtPjDlGPCw5MJgrHRtBYPStimI+xufh7m07yvBAc1qCWwPwFFVZk0Yws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199018)(8936002)(44832011)(30864003)(5660300002)(41300700001)(36756003)(31696002)(86362001)(38100700002)(2906002)(6506007)(6486002)(83380400001)(36916002)(2616005)(478600001)(6512007)(186003)(53546011)(31686004)(450100002)(26005)(316002)(66556008)(66946007)(66476007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2dkZGtManpwbnI1cWdBSmUxZE9jd3d1M2xmd1BTMngxUy9pUWN3TzdiSkFz?=
 =?utf-8?B?SDl4VWljQTR6ZldTV3ZXc0UwWjZPQmNRc3JvdDI0NHIxMmdtQ3FUcGZDVUNz?=
 =?utf-8?B?SFZobERwL2pLZ3ppQVBHTHEzdFlRa2FUeW0xWk5ROHNXM1ZqOUlaWWdLcWt4?=
 =?utf-8?B?cnlYZ3k0ekdWQlp4eWJaMmRYWWdML05uQzU0M3p2TEVBQjdIN09TdzhSOUNo?=
 =?utf-8?B?SFYzQVhFZUxOa1k4Nm5xVTNCVHdPRmJSVEltREJDb1dCeHBrUXgvSTJ5bFJa?=
 =?utf-8?B?ZGhrOFc1dUZqcmF3b3NNWGtEdlk0VkNOUllRQW5kVXBCV2piYStZRDVWdmJP?=
 =?utf-8?B?SjBra2dtemlBWlZoejFRQVZlbUZkMDNZcngzRkNYL0I2ZFBjWTduY0FaZ0xj?=
 =?utf-8?B?SjVkazRnVHo2MGpwSnBMV1JIa2xTRkkwMnpiRWNLdXVqSW5Iak85K2xUbU9k?=
 =?utf-8?B?ekRIbnlhWmZhc2RtN0JVV0k1OVAxZk1wNDVndlUrMXJMYzMycHMrdk96VEpk?=
 =?utf-8?B?YXpqWVhGN1piRm9CejFBZDFRbllGb3BUR3lTTVZ5bWlPM295QmNPQTlLQnll?=
 =?utf-8?B?QzdGTzE4Y2ZUc0tlTHpoZ3BGQkNuVnJvdENHa0Ixb2VQVm1WRVVURHFlSDNC?=
 =?utf-8?B?b2tUQldJN21IdUluTS8vMURKdzdnQXlQZ3prdG9Jalkza3h2WTVBaHdiNWVr?=
 =?utf-8?B?ZkpUVmF3TlBFV1FBY2VvSWF6RU93VmkrNnJpbS9MTDhCY3F2Z2Q5blRJYjl3?=
 =?utf-8?B?MlByZGtQcW1xRElLNjYwQm0zZnZBb3JaaGI1SEN1Rks2SXNDR0phRlhkQUV0?=
 =?utf-8?B?b3BGZGFBM2ptK1VTN2pRQk96Tk9TT1hCaVdCcHdwOEh4bitSVi9EdXBxSWc1?=
 =?utf-8?B?alVaVjdWS3VFTXdBclFrOWtnNDc5RmRpckF6UlBITWRpejdjYmVMaTJvcnU5?=
 =?utf-8?B?WjM5RXNnTGQ4ajMzdnVmSHVuZXpjVjZHZjR4WFhzVXBDenprQitEOU5UbVA1?=
 =?utf-8?B?OGdDZkVyNTdQYVVacVd2L2FpcC9jN2ZLMWorK1RKeE9mWkJ2RXRuYlRteGRx?=
 =?utf-8?B?S3p1Wjdyd1B6NXV2TUNmcTNmZFVZcHlUS1FsbWJIa2hJMWtLdk9HSHNlSWhh?=
 =?utf-8?B?RmhvSGxoK2VIQjdLSE1Ua0Mramh6bTF0aFI2alZadWtWM2Q2V25pN3N0RHlD?=
 =?utf-8?B?S0c1WXVYTmNvOGNZRTZrVnZGS0hxK1NEQVc3R09oTjdBOTZiWVk5TVZ4SUlG?=
 =?utf-8?B?N3NMcEV5RVJSTytHbnFvcS9SWHZDdVVhMVJnRDZPRnNteDJzUkNld1BWWVQ1?=
 =?utf-8?B?SWJhYmpWREZPVmY2bSs2ajE3cW80b0IzYk1KRk94Zk1lbjl1Yi96Q1BKY3Jk?=
 =?utf-8?B?bkdPNndoZEdUU1FxSG5md3lkbTlON1luc2RsQ3poYTFZRGd0Njd0SVFYZnFJ?=
 =?utf-8?B?OXNSamZpZStrRUVhV21EZTgrLy8yTk1CaGVwNS9oN2o4SjU0Nmd2SG0xUW0y?=
 =?utf-8?B?bk0zUzlCWkZ3WFprVUNiZEpROERYREZTNlh0NHdTa0VHcTFlaWQvZzQ2SzlF?=
 =?utf-8?B?dTNCOUt5TUhJNTZDRkR5Y0pBeXBCOFZLVjhJNHovRTNFQ2hZODN2TFd3M0ZL?=
 =?utf-8?B?ald6d3l3TUtIZEFOcGREOXA5UU1oVndHN2RoSkhZUkhNQlNkWlRldEtyYjNi?=
 =?utf-8?B?bU4yZHczWDdtbFM4WXpYeEt5bk9UNzFTdDBzZENLeVFDaHprenlwQWdxRVdV?=
 =?utf-8?B?eG5ma3VsNkF3RmJsYXlNaWU3K1ROTDIwWWVaN1F5Z012OEtQc1YvR3VzUGxp?=
 =?utf-8?B?UDZYMXlhS1BwbmdiTFR6bndJNEdEcm1LblROMENWY1d5ZkJpZmIyN3pJRE5y?=
 =?utf-8?B?YjNLRnh6dldVblpZQTVCWUFRdlNDbXpxemRBZEFjak8yczFsRHBoOTI1MnRt?=
 =?utf-8?B?K1dObm5lNXViMk8zUWFVL3BHUEt3SDFLR0N2b3JZVlZuR2FKajdEMkhOTnUy?=
 =?utf-8?B?L3IwbzBaYVFYQVNSSEk0OWZNN1VZSUNxemdsTUNOOGN0bE9rWXQ1a01tYmVD?=
 =?utf-8?B?dmt5bTBWNi9WZFJ3S0hjRWhZR25IY0ZhWDJENlErU3htR1FTaE1vQkRqUHha?=
 =?utf-8?Q?WIOLiAlgSF+GBNtH5e3alHHWd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a557ad1f-349c-4c7b-77b0-08db2997b620
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 23:06:17.7004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /etMDb3Ea2lXS2DpGRNOloSa7QUmjQbO8rn7nrO/iP966IE6gKDAfR1X5lGTfJFDhVFRbv2Gx724vsXCwmE4lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5923
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


On 2023-01-25 14:53, Jonathan Kim wrote:
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
> v2: add gfx11 support. fix fw checks. remove asic family name comments.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   5 +
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 148 +++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  29 ++++
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c |   1 +
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   9 ++
>   5 files changed, 190 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index f5f639de28f0..628178126d3b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1453,6 +1453,11 @@ static int kfd_ioctl_alloc_queue_gws(struct file *filep,
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
> index 6e99a0160275..659dfc7411fe 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -21,6 +21,7 @@
>    */
>   
>   #include "kfd_debug.h"
> +#include "kfd_device_queue_manager.h"
>   #include <linux/file.h>
>   
>   void debug_event_write_work_handler(struct work_struct *work)
> @@ -101,11 +102,68 @@ static int kfd_dbg_set_mes_debug_mode(struct kfd_process_device *pdd)
>   						pdd->watch_points, flags);
>   }
>   
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
> +	int i, count = 0;
> +
> +	for (i = 0; i < target->n_pdds; i++) {
> +		struct kfd_process_device *pdd = target->pdds[i];
> +
> +		/* If this is an unwind, and we have unwound the required
> +		 * enable calls on the pdd list, we need to stop now
> +		 * otherwise we may mess up another debugger session.
> +		 */
> +		if (unwind && count == unwind_count)
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
> +		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
> +			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);

Shouldn't this reenable GFXOFF unconditionally? It should not stay 
disabled on devices without RLC restore support, because we're ending 
the debug session here.


> +
> +		if (!kfd_dbg_is_per_vmid_supported(pdd->dev) &&
> +				release_debug_trap_vmid(pdd->dev->dqm, &pdd->qpd))
> +			pr_err("Failed to release debug vmid on [%i]\n", pdd->dev->id);
> +
> +		if (!pdd->dev->shared_resources.enable_mes)
> +			debug_refresh_runlist(pdd->dev->dqm);
> +		else
> +			kfd_dbg_set_mes_debug_mode(pdd);
> +
> +		count++;

Isn't count the same as i? Why do we need a separate variable here?

Regards,
   Felix


> +	}
> +
> +	kfd_dbg_set_workaround(target, false);
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
> @@ -120,16 +178,96 @@ int kfd_dbg_trap_disable(struct kfd_process *target)
>   	return 0;
>   }
>   
> +static int kfd_dbg_trap_activate(struct kfd_process *target)
> +{
> +	int i, r = 0, unwind_count = 0;
> +
> +	r = kfd_dbg_set_workaround(target, true);
> +	if (r)
> +		return r;
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
> +		if (!pdd->dev->shared_resources.enable_mes)
> +			r = debug_refresh_runlist(pdd->dev->dqm);
> +		else
> +			r = kfd_dbg_set_mes_debug_mode(pdd);
> +
> +		if (r) {
> +			target->runtime_info.runtime_state =
> +					DEBUG_RUNTIME_STATE_ENABLED_ERROR;
> +			goto unwind_err;
> +		}
> +
> +		/* Increment unwind_count as the last step */
> +		unwind_count++;

Similar to above. I think unwind_count is redundant. It'll have the same 
value as "i" in the next loop iteration.


> +	}
> +
> +	return 0;
> +
> +unwind_err:
> +	/* Enabling debug failed, we need to disable on
> +	 * all GPUs so the enable is all or nothing.
> +	 */
> +	kfd_dbg_trap_deactivate(target, true, unwind_count);
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
> @@ -140,6 +278,10 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
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
> @@ -149,8 +291,10 @@ int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
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
> index 0c09f1729325..f199698d8d60 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -41,4 +41,33 @@ static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_dev *dev)
>   
>   void debug_event_write_work_handler(struct work_struct *work);
>   
> +/*
> + * If GFX off is enabled, chips that do not support RLC restore for the debug
> + * registers will disable GFX off temporarily for the entire debug session.
> + * See disable_on_trap_action_entry and enable_on_trap_action_exit for details.
> + */
> +static inline bool kfd_dbg_is_rlc_restore_supported(struct kfd_dev *dev)
> +{
> +	return !(KFD_GC_VERSION(dev) == IP_VERSION(10, 1, 10) ||
> +		 KFD_GC_VERSION(dev) == IP_VERSION(10, 1, 1));
> +}
> +
> +static inline bool kfd_dbg_has_gws_support(struct kfd_dev *dev)
> +{
> +	if ((KFD_GC_VERSION(dev) == IP_VERSION(9, 0, 1)
> +			&& dev->mec2_fw_version < 0x81b6) ||
> +		(KFD_GC_VERSION(dev) >= IP_VERSION(9, 1, 0)
> +			&& KFD_GC_VERSION(dev) <= IP_VERSION(9, 2, 2)
> +			&& dev->mec2_fw_version < 0x1b6) ||
> +		(KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 0)
> +			&& dev->mec2_fw_version < 0x1b6) ||
> +		(KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 1)
> +			&& dev->mec2_fw_version < 0x30) ||
> +		(KFD_GC_VERSION(dev) >= IP_VERSION(11, 0, 0) &&
> +			KFD_GC_VERSION(dev) < IP_VERSION(12, 0, 0)))
> +		return false;
> +
> +	/* Assume debugging and cooperative launch supported otherwise. */
> +	return true;
> +}
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index be1985b87ea7..3b747e51684e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -36,6 +36,7 @@
>   #include "kfd_kernel_queue.h"
>   #include "amdgpu_amdkfd.h"
>   #include "mes_api_def.h"
> +#include "kfd_debug.h"
>   
>   /* Size of the per-pipe EOP queue */
>   #define CIK_HPD_EOP_BYTES_LOG2 11
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 94c6545a58b4..0ef2d00af8b1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1181,6 +1181,7 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
>   					struct mm_struct *mm)
>   {
>   	struct kfd_process *p;
> +	int i;
>   
>   	/*
>   	 * The kfd_process structure can not be free because the
> @@ -1198,6 +1199,14 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
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
>   
