Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A576CB0B1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 23:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF7410E768;
	Mon, 27 Mar 2023 21:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A7B10E284;
 Mon, 27 Mar 2023 21:29:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZFkpPWoGl85rB9wLXeRlHGAOh2fR4uGeyBujbtraIe9ktXpQ2xVfInKlE2lpy/CcnfjltMjbf64JssC53rX0Pjv8l74RGb0tNZQTOr9mWMh3ciHMvCy2PoZiy8uwMhEgQ1GeUhWCPe7+siJAVkn3K7lLwx2nGv/d5+vbFZ1VD9umZxvzoZDySDE8W84XqPYYscuG394iX/BfV+94Kb8uC5ekfvwm2Bw90CQktvp8Duj4EfW3bSF5S10nsBy5gF8qslkXt1DqJzzAuT4EvYmxu+1XEyBbJUIBeEJJ739SJT+uvH+/VnpaFpvIlx9g8Ne8w19PvLVqbD0Hg77RGVvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNCewV9EVHNJUgivGRRN1HgxTcZQ+JnCIJW+HwOLQjc=;
 b=a7htLhTx0cNztLpN5DA9ccP7oRktdspT4IzdrhcQjdF2d8XVYCC1l+AzA/uRI+oOnVbyc2227rVhN+Xy0d0qVrfQiADxeRiHWaxaixUVsGrtrnnuT9pWFmCxxFMmTfqpA1EfFYTGZWxY8X5ktBaYhw1sOVJiC5+MPo6VRavs9eZM0NY0aCyNwGpZxe1d2rll6QsIJIotT52rM35D7TVAs/O8DPgv/okSkeTOotGsEEi9IIE5TuA6/+c0+YO7dcuQsfzn1OpQN/u8S9OOulBX4q53yFvuxhF+W3P2XvssFvhRvySjKYRdmOJFjGF/QjxyE6BKkzhdKTpRrd6954Zz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNCewV9EVHNJUgivGRRN1HgxTcZQ+JnCIJW+HwOLQjc=;
 b=GJzpYWsgtroZhs++VcvclfRkrvkaZENgEPhsLA0TzCvfj0byYDf8nSHFsura7BpNS+C+n4e0Nd7Ptn1FPEBoHIEZXOoXwZh3/ELjW01M410tiufWnxdRuRYfMkQc3dnpJ04SXAFRT/OotmVe33vBJkwAJ7DIasDLqwMiRSvsxEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MW3PR12MB4492.namprd12.prod.outlook.com (2603:10b6:303:57::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 21:29:11 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6222.031; Mon, 27 Mar 2023
 21:29:11 +0000
Message-ID: <d120eed8-5329-140f-c07c-879382008fdb@amd.com>
Date: Mon, 27 Mar 2023 17:29:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 21/34] drm/amdkfd: add debug trap enabled flag to tma
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230327184339.125016-1-jonathan.kim@amd.com>
 <20230327184339.125016-21-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20230327184339.125016-21-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::32)
 To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MW3PR12MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: 256113dd-332a-417a-08c7-08db2f0a4df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: otsw3dL+ISEtRnfAHlbW9wGleEEZCgYWXCM4SW+ocscOpof27+n0y4QDl2PpJG4owS/zwypJR6TmWugUYYjgl+aKuQ81RDI5v8X3xn9XKcoc3zCrP9Wl4EbwL1xs0kiaonhDovf6ao+yKWG5gjExiqK52XHaI7jF0cslttXFwEnF8lTOhtccxmYBeQ+tY7t9/uhMeTno2Q8uOzVPC2cg0e4R/kDpLwZ9cTJJNylBcsD+qq6uMsfWHaZXenes5cJhPGWRupSnJf+DiTw3P0IVdCdY8VfjiaCBJ29sZt3IPufvMNmAhX4kEHHqbtsuSPF78uKZbgGKdiSWFSYdWkMbTWh15lIVEBqyxZZXydo24gffEpnlUgP/g8E3kM0WxIGQQHhKgini2ctBFKpvfHQeVKkECWVA44aO6jQrpNn9cvXL3MgO5PllsfwdqiMU4QJ5P7MLjTvm+x5uYWvD0YoaXJ5XR57/DWIG3rgdHb3GlYZKSyzMT9BYcdXfwjgG11ofkfi3I344K2tfb19byIZvHa+tO/tVTxARcgYA7BKxoiGRlcCBQGPwTVARHhn8qWvtZH6odPsQgBpwm0zcqanqqk9YkayahRdT9fG+CxMXjV9/sFOCdWphDcrN16iDteywlaEZB8SHJyCxN0uRbIR2Ng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199021)(316002)(478600001)(36916002)(36756003)(2906002)(44832011)(450100002)(41300700001)(66476007)(66946007)(5660300002)(66556008)(8676002)(6486002)(8936002)(38100700002)(31696002)(31686004)(86362001)(186003)(53546011)(2616005)(6512007)(6506007)(26005)(6666004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUlJWnV0ZXFmQVFWQUVIZWVRTys0aGxXU1FSMWFXTitzc0t6L0ZCNXNHWWNZ?=
 =?utf-8?B?M1IzQ1NsRHlCc3hWdHNPbUUyWHNlQ0ZQOXlhQUlGblhDa05OUHVzRkQrZjRQ?=
 =?utf-8?B?Q2c4K0U3UFVBTWREb2NFRHVoL2E1Tk83eFhNa24xZjZlb2VTeHU4WS9jeHhR?=
 =?utf-8?B?Kzk2WVpWUit1OElZYThIdHVXMW44WlU2ekhTRDlBZzMyazZGYTJuMEtOVjUx?=
 =?utf-8?B?Nm1KaVNqS2V3cCtXT2ZjVUI0aE9IL1ErMnA4Lzd5NVBUenFlU2JQTjFsRENj?=
 =?utf-8?B?UVhPOHhmMXBsNVBZSHRVVlNsTE5YSGUvcEVsSjZleDFEd3dYZ3grZnFaaDlK?=
 =?utf-8?B?ckpCSjZ5NnMwSEY3TDBpVHNPRXdUZ0dEQjNuT1h0R1VHbnNtY0pWck5NSXpV?=
 =?utf-8?B?SjNvc0xkRFNQbmtqSFQydFcyMkp0dlpJZzBWTExSMGpWOSszTGI2bTdTcitk?=
 =?utf-8?B?SkN0RDRMMDBqTWVxK1gxT1BBMGFuaS9DRkZ1YVgxK3pySEV3NUxUdE9LZlp2?=
 =?utf-8?B?VllidFNMNTU1T25yZmlWajZzbzF4S2QyeDZiUWw1WkU1MHdEQ0JkdnlUMXB2?=
 =?utf-8?B?NGVGNEkwL2xJaHFWN1hJbXlKOGlKS3Q2Y3dxcTNxVTZMaEFTNEpjbGJSczBB?=
 =?utf-8?B?Uk9Eb1RtOVNUL0RRWTNHbUNWRDh4c3lid2kvUS9GR044NzdFR016aHlZaEZS?=
 =?utf-8?B?REpPdXgydGpDanh5NlhUSUpISndMVVgwMHl0Z01GaTVMN2ZIN25CUjRDN1gw?=
 =?utf-8?B?TjJ5VlJLTm9jVEpUK3hZWTlnRGdXVUk5N3JnSkttd2haZFdCcUNmdGJIdUFL?=
 =?utf-8?B?SWlZMGtESlhYd1ptSUUraHFoVnd0Q09HYWYzcVVRSWc5U3FtODUyYVV0dGhO?=
 =?utf-8?B?YmZlUm9JUWlmSFJFZjlNOFRuTVJ2RDdiTm02dVRPYmtlQ21UbU4xS2hxTlJI?=
 =?utf-8?B?QlBvSTg0bzNvVktYblV5cmFJQjVjT013U2tObDdtU0orcGl4MjJnQTVoUTJF?=
 =?utf-8?B?SU5ZN0NLSngvQlBjNkQ4ODJIaFNnV3h1Sk9oZ29pNmpoeVdzbXV5NDFnR3VU?=
 =?utf-8?B?aE9EYWVROEU2ZFJCS0FwL0ZrdGZSZE1WWkxQTDJrWUVIdEVnYk8wUHkvZysr?=
 =?utf-8?B?V1hJYTg2d01LRGRWcUtaMGd4blM5YkZjVjdHV05vRURWdmR1andIV1NnNDEr?=
 =?utf-8?B?Z0ZURW16dVZJVDRYZjlMOWlMT0tjUFgvMkVVZmExTTY1cnNXU2dhODAwNU5E?=
 =?utf-8?B?a2VVWm1WL1hjWjdhOXFpb3EzU1NIUXllMWxqZjJSRVN2YlB0Z09kb0lqVFZE?=
 =?utf-8?B?dGhHVEdJdkNaZTE2akh4djk1N2NzUjl3c0JUcUt0d0hkeEhlVHZFOUlWaUo5?=
 =?utf-8?B?Q2x3emxKZUw5ekhYSlBkQkd0Szl5VDJzSGRicEZFbTRFbnhiSlJLVXpQdkxJ?=
 =?utf-8?B?aitMWFpiSVB0Zmo3NWV6VGtXZitKaGhMRkEveDFDSCtiRk9vdXRqSWpWTzM5?=
 =?utf-8?B?NFV5YlgrL3EyUU1MWmsyb21XOW5zR2Y5OURIK0NKMGpyRmR1dUFkU3dGZyt4?=
 =?utf-8?B?SWhvOWZ2UzE3L3FUam1raThXUCtlSjVBNTZaTkU5MDN3dkpFa3F3TWdzODZY?=
 =?utf-8?B?cEhtL1VCUWNjMmtqWmozd2VQM3g5aUtkK1BNQVRLSENydG5weUVnT0c3TlU4?=
 =?utf-8?B?OFVHaFJoOFdJOUM3ZVVOanNnRVM2NlFyOEU1VkhzZ0NncTZvV04zRlg5bE41?=
 =?utf-8?B?WldTMlRSemRaSWdXTWFNUmFJTDFHSHBtTGRPU2lGZWduT0Q4cXp6TUFURlcr?=
 =?utf-8?B?UjQrV0hNcUdxM0RwT3A1QkR3Y1VWYzNwTmtnREJ1WklFWFh4MlpMelBZNFZw?=
 =?utf-8?B?bmpuNE94T1EzcWxYNFphNHR4dGU3SnB4aXBFSmZTS1FrQUt4WElkbjVhOWxR?=
 =?utf-8?B?Tk9hRGhjT3hCV0ZVSVN4R3FWY25tTXRsN1U0bmpNVnNxcTR4eHhuSE5lYXJx?=
 =?utf-8?B?Z1oxVElBbTQ2ZnQ1VHI1amdodEJCd3RITjF3SG1uSEE2SFN3MGxOZXVFTXNS?=
 =?utf-8?B?dHJodmNUTXlLaHROOFpMWWNVUjg5dEFJNnRvNSt4cUM0QlhQakVkOGFlQUVL?=
 =?utf-8?Q?biAw1/d7NjdocFgHXqCgsLxNZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256113dd-332a-417a-08c7-08db2f0a4df3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 21:29:10.9583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Xwj2Zyka1Y3UCmTWMuzBET+7liipXBSfcVHNf4NiuC9HA0PKFJCuB99TzmDmESfkegHn2Z1NOAAnZJnOJhmNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492
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

On 2023-03-27 14:43, Jonathan Kim wrote:
> From: Jay Cornwall <jay.cornwall@amd.com>
>
> Trap handler behavior will differ when a debugger is attached.
>
> Make the debug trap flag available in the trap handler TMA.
> Update it when the debug trap ioctl is invoked.
>
> v4: fix up comments to clarify flagging implementation.
>
> v3: Rebase for upstream
>
> v2:
> Add missing debug flag setup on APUs
>
> Signed-off-by: Jay Cornwall <jay.cornwall@amd.com>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c   | 11 +++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  2 ++
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 15 +++++++++++++++
>   3 files changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> index f498987dc21d..c779acb9a623 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -256,6 +256,8 @@ void kfd_dbg_trap_deactivate(struct kfd_process *target, bool unwind, int unwind
>   		if (unwind && i == unwind_count)
>   			break;
>   
> +		kfd_process_set_trap_debug_flag(&pdd->qpd, false);
> +
>   		/* GFX off is already disabled by debug activate if not RLC restore supported. */
>   		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
>   			amdgpu_gfx_off_ctrl(pdd->dev->adev, false);
> @@ -351,6 +353,15 @@ int kfd_dbg_trap_activate(struct kfd_process *target)
>   		if (kfd_dbg_is_rlc_restore_supported(pdd->dev))
>   			amdgpu_gfx_off_ctrl(pdd->dev->adev, true);
>   
> +		/**

Not sure if I missed this in a previous review or it crept back in. This 
is not a well-formed doc comment. So it should not start with two *s. 
With that fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> +		 * Setting the debug flag in the trap handler requires that the TMA has been
> +		 * allocated, which occurs during CWSR initialization.
> +		 * In the event that CWSR has not been initialized at this point, setting the
> +		 * flag will be called again during CWSR initialization if the target process
> +		 * is still debug enabled.
> +		 */
> +		kfd_process_set_trap_debug_flag(&pdd->qpd, true);
> +
>   		if (!pdd->dev->shared_resources.enable_mes)
>   			r = debug_refresh_runlist(pdd->dev->dqm);
>   		else
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index d092c81c9dc2..42a4502287f2 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -1105,6 +1105,8 @@ int kfd_init_apertures(struct kfd_process *process);
>   void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
>   				  uint64_t tba_addr,
>   				  uint64_t tma_addr);
> +void kfd_process_set_trap_debug_flag(struct qcm_process_device *qpd,
> +				     bool enabled);
>   
>   /* CWSR initialization */
>   int kfd_process_init_cwsr_apu(struct kfd_process *process, struct file *filep);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index c6a4d01bb1b5..d26aa339fa6b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1303,6 +1303,8 @@ int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
>   
>   		memcpy(qpd->cwsr_kaddr, dev->cwsr_isa, dev->cwsr_isa_size);
>   
> +		kfd_process_set_trap_debug_flag(qpd, p->debug_trap_enabled);
> +
>   		qpd->tma_addr = qpd->tba_addr + KFD_CWSR_TMA_OFFSET;
>   		pr_debug("set tba :0x%llx, tma:0x%llx, cwsr_kaddr:%p for pqm.\n",
>   			qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
> @@ -1339,6 +1341,9 @@ static int kfd_process_device_init_cwsr_dgpu(struct kfd_process_device *pdd)
>   
>   	memcpy(qpd->cwsr_kaddr, dev->cwsr_isa, dev->cwsr_isa_size);
>   
> +	kfd_process_set_trap_debug_flag(&pdd->qpd,
> +					pdd->process->debug_trap_enabled);
> +
>   	qpd->tma_addr = qpd->tba_addr + KFD_CWSR_TMA_OFFSET;
>   	pr_debug("set tba :0x%llx, tma:0x%llx, cwsr_kaddr:%p for pqm.\n",
>   		 qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
> @@ -1425,6 +1430,16 @@ bool kfd_process_xnack_mode(struct kfd_process *p, bool supported)
>   	return true;
>   }
>   
> +void kfd_process_set_trap_debug_flag(struct qcm_process_device *qpd,
> +				     bool enabled)
> +{
> +	if (qpd->cwsr_kaddr) {
> +		uint64_t *tma =
> +			(uint64_t *)(qpd->cwsr_kaddr + KFD_CWSR_TMA_OFFSET);
> +		tma[2] = enabled;
> +	}
> +}
> +
>   /*
>    * On return the kfd_process is fully operational and will be freed when the
>    * mm is released
