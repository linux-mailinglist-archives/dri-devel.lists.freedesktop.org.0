Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24DD69A294
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6393F10E3B0;
	Thu, 16 Feb 2023 23:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1944610E3AE;
 Thu, 16 Feb 2023 23:45:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8vPccbgq5OAIpnX4yO9YvHf1T6tit14jSX5SK3iH5yk0IIduPlCyOoNRIYKIiTDo0xq8unZC5JwzmlGGe1TKBqc0RII3rtd9sO3neMF2cB7vl24kjtIW+KLJKooqrpG8vRl13MuhoUkfTpt1CI2faXLSXRu6dnZb+UOIkv8n1TncXg98hGgi+WaEmPIY10NYhY8zVB7QF1B918fi6R6p8pxFtwAIbAhvBdgPBhzoIQdiSo9LTrLqslJYvprxlR56oGyTPTkKaIk4GHk7PtXkzAlHOLuLnecJAJipcOWXY7St2cgQvT0istuk1Duswp1+UOeQqb0mDXwJuymvz9cKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3HZX+wnr4jXjeJZ0+V2ACnJNOJxrPcyO2J2VMUryNY=;
 b=h/aAFVn8o86m2GkiPuPhEyLUTrgbgd2riL7OZKRlvMij4sXN0K7Kug9Re4TxlEfwfLdO/KNCNC8hQ6Cl7kZoDFTAhrlym9hEAQeCLA267FU7/Lu1JVg4druYFOtYbBI/Uj8SSwQhm2hevT90wXH+hAu62joklD3B3sn7lLEpCC5gv1Rx/0aJIvMaKSZAU7P9BLDvP+kVHFFCMoCXkz+VewrWHgJbt8Dn2/by8LefTIY53uOD6Krffd7q+OmbPU723hFRbtH+nQNSKoJDILwKI8bhFjWUkJHEV3nlCnIAYcVauSbUfbUiBU7rnXmeFkcusKVQoc1vOgDqGxVcv4FbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3HZX+wnr4jXjeJZ0+V2ACnJNOJxrPcyO2J2VMUryNY=;
 b=uHYnsaD4wo9aygdTyZBFX+skBH/hZ6gkUTQ+DTjMYtVSER2R7tPWTHr0SvWYjF4r9MgdTln1ghRJFswBQoiRFfRXAmIfSembdyDAcAsn1dOYbVuRtoQzyQ8cRZizOlfNSpTZG8WujUfFue92uIeeDHgd7JWGMkSoaVYFePv1wp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB7955.namprd12.prod.outlook.com (2603:10b6:806:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 23:45:11 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::e6ea:9231:6d39:93da%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 23:45:11 +0000
Message-ID: <79fb9204-8544-e681-a2cf-517252d381e8@amd.com>
Date: Thu, 16 Feb 2023 18:44:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH 03/32] drm/amdkfd: prepare per-process debug enable and
 disable
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-4-jonathan.kim@amd.com>
Content-Language: en-US
In-Reply-To: <20230125195401.4183544-4-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0200.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::29) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 605b6b70-20ac-4892-9f48-08db1077d7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1xCxIbGhB3nV0qkPTVDJYHnd2M9lSSnVgZOfx7UWHQC7YAydrPgOWPIufonTS4Y9LBr+PISlCkpaatLpIXE0hNwwbBEKxingtljFuIhBMMUtdGkL4snAOCPhjP5TBI5lRlsJSkn7RtGbvEk0UdmezYn9XqV1c5JWH7fylYikVZi9pALZ7jH+7MiRfwpJc//Go6/vaD8hiafyHvSJ7lNZHpz/LXxFGZVJg3e0A4VMS0VgXbz5PfOprZQNLVPdlZghjK08+pChSIhRHJCrN1ZDxOpkgaGQz3KAnB+W+ulEdX1VvhtvBJ9b2lvAe1vPZU9ciJzKB3WHhG7SP7/fYydj3QtdUwZZsQJeri2uG/b5eHx7e+pXE4MQ+CjNA1PXxzbOMBHxyp+E1StbbeLFuPDJ6jA7Egp6752IGAuvENvYgPLPZU5v857TDsUFZiEXfznczu4otVn4EX8KrSa863+Y6uNmL6Gt6s9RI+5Kxk1EyT70B+lwktLcRgomYlbf1EfiKMKd3DAzdw3hL7CXvGnPia/MW7oEHit9ODRrW2PFrRjS+b5OGViSKQFWs6hXkJupDn3I5S8YOhFoS1tVr4B1gLlo8DIP5aLLl/Ie001RJTFhXa13jgZppW1OQjELBzfueQNXlWcmT2xpCSadlqYd8HK85wymJScryhkF/Z1MF0z6WRg1Zz2UNSBbVfinGyVf8/+oa8FwMBi3pF+RFZkQwx4G0b6DFaNrfb14IyzboY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199018)(66899018)(31686004)(8936002)(2906002)(41300700001)(36756003)(30864003)(31696002)(5660300002)(44832011)(86362001)(83380400001)(38100700002)(8676002)(45080400002)(478600001)(6486002)(450100002)(26005)(6512007)(186003)(66946007)(66556008)(316002)(66476007)(53546011)(6506007)(2616005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWZpVHNjSUI5L1V4VDhvck9LUGxKbkg4MG01M3pZbU1oclFTR0pjaXg2TTlI?=
 =?utf-8?B?aTBpeUNGYzZpazczNkdJZ3NIMUdiQm9IVnZmWHU5ZGdIekNpQ1puWUVuTnJo?=
 =?utf-8?B?SEhia3dSQWhUc0gxYmtHcWpwL2ptNXEvRGV2RkRlQlJ3YXhqVlhTWDdCK3Rx?=
 =?utf-8?B?YXNzd2hxQUpGRTIwYlk4bGJQdFlUMmsrTjFYTzBlZVJYd0VHdzM4MTNpd3p4?=
 =?utf-8?B?dEhPZ05Qc0ZDcXVDOUgvTmZvZk1vQVFPQm5lNXR2dlk3K3J2VUg0WS9tTkV1?=
 =?utf-8?B?TlE0NmxYeWNJRjdlbFVqcHhyUGZpSXlSMExPblJhQmhqSStVV2JnSklDcVVD?=
 =?utf-8?B?SkxnSEsyOHl0YjQ4TXc5Z1NyaU9nUlVoTVUvVk10bjlMUmwwUTBTMnNiaFJs?=
 =?utf-8?B?TlVTblZkV0dZS05GWXBsWWk0eXB5M3R1dHA5U0lGc1EyR3lOYlRidWJRcTBx?=
 =?utf-8?B?WmFwMlR5cHdKMXUzVmdHT3ZacHhJQkIvTDdMSGtQZHRSNG9LQkZtZ3ptckRr?=
 =?utf-8?B?ZkdFbTZXT0xpNyszWlFKT2VCaFVkcWRBWTdFZXRRY1pHTFRuTktoS0dZMXRy?=
 =?utf-8?B?RThNNU5MRW1GcnVVL01hVmEzKzNkOHlxRkFZMTlsbTdWWDhWenlkdnZWZkY5?=
 =?utf-8?B?Z0p1dTFKNnVtV3FYUjhiZnl5RkJIUUQrMjNZY1ZhTytQU29MYVlIRTN0V0VU?=
 =?utf-8?B?UzlNNCtRaWJvVmJlbGNySUJiOWxlOTBuald1ZC9RWFVCaERDUUhjSVNNR1hn?=
 =?utf-8?B?bThuY3MxVmE2U0tFQTlqYVUvaHpVNmxLbkFHS3FOa3UrMmFXSzdCalhMWVJP?=
 =?utf-8?B?bmJWNWVrUUpOSXo3SEV4K2NaWVdtVkNmMFNSWkV1ZWlYejVJYnVIZi8wUWFX?=
 =?utf-8?B?Z0h2Zm55QVdBNmx6MVNCb1REV2xWSlVGK25hNzBNSkNEWVFnMEpJZkpHMU85?=
 =?utf-8?B?cjlaN21kQkpnT1BrOVZSbVpkZ1g2RjVxT0ZYczduOEFqN3NrY3JIVEpHZFdR?=
 =?utf-8?B?anNjQVg0U1BQTDBTY1FrV3JVb1h4U0cwbnJFTVY3dDVZblJKaXM2dnRmUE9p?=
 =?utf-8?B?d1pnV1ZQUVZBUjlWZFBQOVhnbGpEc28vYWlMa1BqZkV1SGdYU21LRlFZV0g4?=
 =?utf-8?B?MnJYallKbVZiNmJwUmlERHVheWZPNHRYUlhWS3Zud1hnYTE0WXlEZWNiMlcz?=
 =?utf-8?B?aURwWm42bFFYRjdnNHFuWWlhdEhFejkrKzFLOU5vYnV6V25icFR3NWU1SnlL?=
 =?utf-8?B?SlJPVytycm5HS1VrRWpuazNLUTNyelJ4SE4yYUFWclJ0QTdvVXZPOTRYSlpN?=
 =?utf-8?B?MWU2T0g4TEdaWi9JK1gwZkVLcldNSVhNM2xSY0R6a1hQM1BVMFhZOHVoVE9V?=
 =?utf-8?B?MXVKVjRRY3ZMZ1V0UjdnYXFvUTRZYTB6UjUxa3I3T3dLdkVtVkRnN2kzNjU4?=
 =?utf-8?B?MkpnbjBrV3Q4NExPRzlTd05GemFZTXdNWGxId25Vdi9WMkZDZ0Y4RG40ZmFm?=
 =?utf-8?B?eDlzN3pIdEd2WGZxczIySFJYbDZ1OGtvOVU5L3U1TG1Zenk5TzJVMVY0WGkx?=
 =?utf-8?B?ODZGbGJDNGdZNW11Qks1SGxQSUp3WkFlRE5hcUhrMUpBRXFYdkZYbVB0Y2cw?=
 =?utf-8?B?MXpqTkt5dWVnRG9rWWIySzR4a2FlMHpSZkZ6SkJtZnBMUDlTaUZ5eWQwcU56?=
 =?utf-8?B?eEhsZlY1OEUvMVFSbFpRZWpSQWhteFR6OGdSL044dm1JVjlkM25wL3ZLWUxy?=
 =?utf-8?B?cE5rdWdscURhamxqOWg2YzA0N000d2d3RHdlWVJna1JUZ3ZzcU1lSGhLSUhr?=
 =?utf-8?B?ZHdGeTVWUU0ybVYvV1loUHpocUowSndMeWsvTXJ1ZXVBOU95QTEyVE9HVnBn?=
 =?utf-8?B?TlYwNWRoREdod3l0aW5KTFBOZ2JRRWxDdzlIWjJzS0FMM0g2SERzSmY4cStF?=
 =?utf-8?B?OE5VL1VWSnZ4Q3oybU1hS2ozQldJMUgvZ2FlQ0dITnNtR2hhRXk5SktHeDM4?=
 =?utf-8?B?dW1aVVdtZzVTaEdxT0t6SFR2MlFUVEZOeXp0OU5maDgxYWVzS2duT3Z6blN2?=
 =?utf-8?B?L3lIbGttK0xYdHBWaEptRmJsY3FMWGlvU2svdERTZE82dGdnSUJRMHNNekx6?=
 =?utf-8?Q?ZJaiMNcYAS9+3q6rTR+Zitw+T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605b6b70-20ac-4892-9f48-08db1077d7bd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 23:45:11.1456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PldksG+RT01l5Q81wYgQFSA5CxYT4G30TZ9h3ACN9G1XdjvA/RfmS/Nx3Lj4q574+Rz36lBbJ/p0FFAfUftlPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7955
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
> The ROCm debugger will attach to a process to debug by PTRACE and will
> expect the KFD to prepare a process for the target PID, whether the
> target PID has opened the KFD device or not.
>
> This patch is to explicity handle this requirement.  Further HW mode
> setting and runtime coordination requirements will be handled in
> following patches.
>
> In the case where the target process has not opened the KFD device,
> a new KFD process must be created for the target PID.
> The debugger as well as the target process for this case will have not
> acquired any VMs so handle process restoration to correctly account for
> this.
>
> To coordinate with HSA runtime, the debugger must be aware of the target
> process' runtime enablement status and will copy the runtime status
> information into the debugged KFD process for later query.
>
> On enablement, the debugger will subscribe to a set of exceptions where
> each exception events will notify the debugger through a pollable FIFO
> file descriptor that the debugger provides to the KFD to manage.
> Some events will be synchronously raised while other are scheduled,
> which is why a debug_event_workarea worker is initialized.
>
> Finally on process termination of either the debugger or the target,
> debugging must be disabled if it has not been done so.
>
> v3: fix typo on debug trap disable and PTRACE ATTACH relax check.
> remove unnecessary queue eviction counter reset when there's nothing
> to evict.
> change err code to EALREADY if attaching to an already attached process.
> move debug disable to release worker to avoid race with disable from
> ioctl call.
>
> v2: relax debug trap disable and PTRACE ATTACH requirement.
>
> Signed-off-by: Jonathan Kim<jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/Makefile           |  3 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 88 ++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.c        | 94 +++++++++++++++++++
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        | 33 +++++++
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 22 ++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         | 34 ++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 63 +++++++++----
>   7 files changed, 308 insertions(+), 29 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_debug.c
>   create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_debug.h
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
> index e758c2a24cd0..747754428073 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Makefile
> +++ b/drivers/gpu/drm/amd/amdkfd/Makefile
> @@ -55,7 +55,8 @@ AMDKFD_FILES	:= $(AMDKFD_PATH)/kfd_module.o \
>   		$(AMDKFD_PATH)/kfd_int_process_v9.o \
>   		$(AMDKFD_PATH)/kfd_int_process_v11.o \
>   		$(AMDKFD_PATH)/kfd_smi_events.o \
> -		$(AMDKFD_PATH)/kfd_crat.o
> +		$(AMDKFD_PATH)/kfd_crat.o \
> +		$(AMDKFD_PATH)/kfd_debug.o
>   
>   ifneq ($(CONFIG_AMD_IOMMU_V2),)
>   AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index d3b019e64093..ee05c2e54ef6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -44,6 +44,7 @@
>   #include "amdgpu_amdkfd.h"
>   #include "kfd_smi_events.h"
>   #include "amdgpu_dma_buf.h"
> +#include "kfd_debug.h"
>   
>   static long kfd_ioctl(struct file *, unsigned int, unsigned long);
>   static int kfd_open(struct inode *, struct file *);
> @@ -142,10 +143,15 @@ static int kfd_open(struct inode *inode, struct file *filep)
>   		return -EPERM;
>   	}
>   
> -	process = kfd_create_process(filep);
> +	process = kfd_create_process(current);
>   	if (IS_ERR(process))
>   		return PTR_ERR(process);
>   
> +	if (kfd_process_init_cwsr_apu(process, filep)) {
> +		kfd_unref_process(process);
> +		return -EFAULT;
> +	}
> +
>   	if (kfd_is_locked()) {
>   		dev_dbg(kfd_device, "kfd is locked!\n"
>   				"process %d unreferenced", process->pasid);
> @@ -2653,6 +2659,9 @@ static int kfd_ioctl_runtime_enable(struct file *filep, struct kfd_process *p, v
>   static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, void *data)
>   {
>   	struct kfd_ioctl_dbg_trap_args *args = data;
> +	struct task_struct *thread = NULL;
> +	struct pid *pid = NULL;
> +	struct kfd_process *target = NULL;
>   	int r = 0;
>   
>   	if (sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> @@ -2660,9 +2669,71 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   		return -EINVAL;
>   	}
>   
> +	pid = find_get_pid(args->pid);
> +	if (!pid) {
> +		pr_debug("Cannot find pid info for %i\n", args->pid);
> +		r = -ESRCH;
> +		goto out;
> +	}
> +
> +	thread = get_pid_task(pid, PIDTYPE_PID);
> +
> +	if (args->op == KFD_IOC_DBG_TRAP_ENABLE) {
> +		bool create_process;
> +
> +		rcu_read_lock();
> +		create_process = thread && thread != current && ptrace_parent(thread) == current;
> +		rcu_read_unlock();
> +
> +		target = create_process ? kfd_create_process(thread) :
> +					kfd_lookup_process_by_pid(pid);
> +	} else {
> +		target = kfd_lookup_process_by_pid(pid);
> +	}
> +
> +	if (!target) {
> +		pr_debug("Cannot find process PID %i to debug\n", args->pid);
> +		r = -ESRCH;
> +		goto out;
> +	}
> +
> +	/* Check if target is still PTRACED. */
> +	rcu_read_lock();
> +	if (target != p && args->op != KFD_IOC_DBG_TRAP_DISABLE
> +				&& ptrace_parent(target->lead_thread) != current) {
> +		pr_err("PID %i is not PTRACED and cannot be debugged\n", args->pid);
> +		r = -EPERM;
> +	}
> +	rcu_read_unlock();
> +
> +	if (r)
> +		goto out;
> +
> +	mutex_lock(&target->mutex);
> +
> +	if (args->op != KFD_IOC_DBG_TRAP_ENABLE && !target->debug_trap_enabled) {
> +		pr_err("PID %i not debug enabled for op %i\n", args->pid, args->op);
> +		r = -EINVAL;
> +		goto unlock_out;
> +	}
> +
>   	switch (args->op) {
>   	case KFD_IOC_DBG_TRAP_ENABLE:
> +		if (target != p)
> +			target->debugger_process = p;
> +
> +		r = kfd_dbg_trap_enable(target,
> +					args->enable.dbg_fd,
> +					(void __user *)args->enable.rinfo_ptr,
> +					&args->enable.rinfo_size);
> +		if (!r)
> +			target->exception_enable_mask = args->enable.exception_mask;
> +
> +		pr_warn("Debug functions limited\n");
> +		break;
>   	case KFD_IOC_DBG_TRAP_DISABLE:
> +		r = kfd_dbg_trap_disable(target);
> +		break;
>   	case KFD_IOC_DBG_TRAP_SEND_RUNTIME_EVENT:
>   	case KFD_IOC_DBG_TRAP_SET_EXCEPTIONS_ENABLED:
>   	case KFD_IOC_DBG_TRAP_SET_WAVE_LAUNCH_OVERRIDE:
> @@ -2676,7 +2747,7 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   	case KFD_IOC_DBG_TRAP_QUERY_EXCEPTION_INFO:
>   	case KFD_IOC_DBG_TRAP_GET_QUEUE_SNAPSHOT:
>   	case KFD_IOC_DBG_TRAP_GET_DEVICE_SNAPSHOT:
> -		pr_warn("Debugging not supported yet\n");
> +		pr_warn("Debug op %i not supported yet\n", args->op);
>   		r = -EACCES;
>   		break;
>   	default:
> @@ -2684,6 +2755,19 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   		r = -EINVAL;
>   	}
>   
> +unlock_out:
> +	mutex_unlock(&target->mutex);
> +
> +out:
> +	if (thread)
> +		put_task_struct(thread);
> +
> +	if (pid)
> +		put_pid(pid);
> +
> +	if (target)
> +		kfd_unref_process(target);
> +
>   	return r;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.c b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> new file mode 100644
> index 000000000000..f6ea6db266b4
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.c
> @@ -0,0 +1,94 @@
> +/*
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "kfd_debug.h"
> +#include <linux/file.h>
> +
> +void debug_event_write_work_handler(struct work_struct *work)
> +{
> +	struct kfd_process *process;
> +
> +	static const char write_data = '.';
> +	loff_t pos = 0;
> +
> +	process = container_of(work,
> +			struct kfd_process,
> +			debug_event_workarea);
> +
> +	kernel_write(process->dbg_ev_file, &write_data, 1, &pos);
> +}
> +
> +int kfd_dbg_trap_disable(struct kfd_process *target)
> +{
> +	if (!target->debug_trap_enabled)
> +		return 0;
> +
> +	fput(target->dbg_ev_file);
> +	target->dbg_ev_file = NULL;
> +
> +	if (target->debugger_process) {
> +		atomic_dec(&target->debugger_process->debugged_process_count);
> +		target->debugger_process = NULL;
> +	}
> +
> +	target->debug_trap_enabled = false;
> +	kfd_unref_process(target);
> +
> +	return 0;
> +}
> +
> +int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
> +			void __user *runtime_info, uint32_t *runtime_size)
> +{
> +	struct file *f;
> +	uint32_t copy_size;
> +	int r = 0;
> +
> +	if (target->debug_trap_enabled)
> +		return -EALREADY;
> +
> +	copy_size = min((size_t)(*runtime_size), sizeof(target->runtime_info));
> +
> +	f = fget(fd);
> +	if (!f) {
> +		pr_err("Failed to get file for (%i)\n", fd);
> +		return -EBADF;
> +	}
> +
> +	target->dbg_ev_file = f;
> +
> +	/* We already hold the process reference but hold another one for the
> +	 * debug session.
> +	 */
> +	kref_get(&target->ref);
> +	target->debug_trap_enabled = true;
> +
> +	if (target->debugger_process)
> +		atomic_inc(&target->debugger_process->debugged_process_count);
> +
> +	if (copy_to_user(runtime_info, (void *)&target->runtime_info, copy_size))
> +		r = -EFAULT;
> +
> +	*runtime_size = sizeof(target->runtime_info);
> +
> +	return r;
> +}
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> new file mode 100644
> index 000000000000..b2217eb1399c
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -0,0 +1,33 @@
> +/*
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef KFD_DEBUG_EVENTS_H_INCLUDED
> +#define KFD_DEBUG_EVENTS_H_INCLUDED
> +
> +#include "kfd_priv.h"
> +
> +int kfd_dbg_trap_disable(struct kfd_process *target);
> +int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
> +			void __user *runtime_info,
> +			uint32_t *runtime_info_size);
> +void debug_event_write_work_handler(struct work_struct *work);
> +#endif
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index c06ada0844ba..a2ac98d06e71 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -979,6 +979,14 @@ static int evict_process_queues_cpsch(struct device_queue_manager *dqm,
>   		goto out;
>   
>   	pdd = qpd_to_pdd(qpd);
> +
> +	/* The debugger creates processes that temporarily have not acquired
> +	 * all VMs for all devices and has no VMs itself.
> +	 * Skip queue eviction on process eviction.
> +	 */
> +	if (!pdd->drm_priv)
> +		goto out;
> +
This should be before qpd->
>   	pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
>   			    pdd->process->pasid);
>   
> @@ -1100,13 +1108,10 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
>   {
>   	struct queue *q;
>   	struct kfd_process_device *pdd;
> -	uint64_t pd_base;
>   	uint64_t eviction_duration;
>   	int retval = 0;
>   
>   	pdd = qpd_to_pdd(qpd);
> -	/* Retrieve PD base */
> -	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->drm_priv);
>   
>   	dqm_lock(dqm);
>   	if (WARN_ON_ONCE(!qpd->evicted)) /* already restored, do nothing */
> @@ -1116,12 +1121,19 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
>   		goto out;
>   	}
>   
> +	/* The debugger creates processes that temporarily have not acquired
> +	 * all VMs for all devices and has no VMs itself.
> +	 * Skip queue restore on process restore.
> +	 */
> +	if (!pdd->drm_priv)
> +		goto out;
> +

I had a comment here that "qpd->evicted = 0;" was duplicated. It is 
still needed in this case. Otherwise the process will end up being 
created with all queues in an evicted state and no way to execute 
anything on the GPU.

You only need one instance of "qpd->evicted = 0;", but it needs to be in 
the right place (after the vm_not_acquired label you had in v1 of this 
patch).

Regards,
   Felix


>   	pr_debug_ratelimited("Restoring PASID 0x%x queues\n",
>   			    pdd->process->pasid);
>   
>   	/* Update PD Base in QPD */
> -	qpd->page_table_base = pd_base;
> -	pr_debug("Updated PD address to 0x%llx\n", pd_base);
> +	qpd->page_table_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd->drm_priv);
> +	pr_debug("Updated PD address to 0x%llx\n", qpd->page_table_base);
>   
>   	/* activate all active queues on the qpd */
>   	list_for_each_entry(q, &qpd->queues_list, list) {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index bfa30d12406b..62b75ba28425 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -886,19 +886,48 @@ struct kfd_process {
>   	 */
>   	unsigned long last_restore_timestamp;
>   
> +	/* Indicates device process is debug attached with reserved vmid. */
> +	bool debug_trap_enabled;
> +
> +	/* per-process-per device debug event fd file */
> +	struct file *dbg_ev_file;
> +
> +	/* If the process is a kfd debugger, we need to know so we can clean
> +	 * up at exit time.  If a process enables debugging on itself, it does
> +	 * its own clean-up, so we don't set the flag here.  We track this by
> +	 * counting the number of processes this process is debugging.
> +	 */
> +	atomic_t debugged_process_count;
> +
> +	/* If the process is a debugged, this is the debugger process */
> +	struct kfd_process *debugger_process;
> +
>   	/* Kobj for our procfs */
>   	struct kobject *kobj;
>   	struct kobject *kobj_queues;
>   	struct attribute attr_pasid;
>   
> +	/* Keep track cwsr init */
> +	bool has_cwsr;
> +
> +	/* Exception code enable mask and status */
> +	uint64_t exception_enable_mask;
> +
>   	/* shared virtual memory registered by this process */
>   	struct svm_range_list svms;
>   
>   	bool xnack_enabled;
>   
> +	/* Work area for debugger event writer worker. */
> +	struct work_struct debug_event_workarea;
> +
>   	atomic_t poison;
>   	/* Queues are in paused stated because we are in the process of doing a CRIU checkpoint */
>   	bool queues_paused;
> +
> +	/* Tracks runtime enable status */
> +	struct kfd_runtime_info runtime_info;
> +
>   };
>   
>   #define KFD_PROCESS_TABLE_SIZE 5 /* bits: 32 entries */
> @@ -928,7 +957,7 @@ bool kfd_dev_is_large_bar(struct kfd_dev *dev);
>   
>   int kfd_process_create_wq(void);
>   void kfd_process_destroy_wq(void);
> -struct kfd_process *kfd_create_process(struct file *filep);
> +struct kfd_process *kfd_create_process(struct task_struct *thread);
>   struct kfd_process *kfd_get_process(const struct task_struct *task);
>   struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid);
>   struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm);
> @@ -1055,6 +1084,9 @@ void kfd_process_set_trap_handler(struct qcm_process_device *qpd,
>   				  uint64_t tba_addr,
>   				  uint64_t tma_addr);
>   
> +/* CWSR initialization */
> +int kfd_process_init_cwsr_apu(struct kfd_process *process, struct file *filep);
> +
>   /* CRIU */
>   /*
>    * Need to increment KFD_CRIU_PRIV_VERSION each time a change is made to any of the CRIU private
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index 72df6286e240..e935158ab311 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -44,6 +44,7 @@ struct mm_struct;
>   #include "kfd_iommu.h"
>   #include "kfd_svm.h"
>   #include "kfd_smi_events.h"
> +#include "kfd_debug.h"
>   
>   /*
>    * List of struct kfd_process (field kfd_process).
> @@ -69,7 +70,6 @@ static struct kfd_process *find_process(const struct task_struct *thread,
>   					bool ref);
>   static void kfd_process_ref_release(struct kref *ref);
>   static struct kfd_process *create_process(const struct task_struct *thread);
> -static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep);
>   
>   static void evict_process_worker(struct work_struct *work);
>   static void restore_process_worker(struct work_struct *work);
> @@ -798,18 +798,19 @@ static void kfd_process_device_destroy_ib_mem(struct kfd_process_device *pdd)
>   	kfd_process_free_gpuvm(qpd->ib_mem, pdd, &qpd->ib_kaddr);
>   }
>   
> -struct kfd_process *kfd_create_process(struct file *filep)
> +struct kfd_process *kfd_create_process(struct task_struct *thread)
>   {
>   	struct kfd_process *process;
> -	struct task_struct *thread = current;
>   	int ret;
>   
> -	if (!thread->mm)
> +	if (!(thread->mm && mmget_not_zero(thread->mm)))
>   		return ERR_PTR(-EINVAL);
>   
>   	/* Only the pthreads threading model is supported. */
> -	if (thread->group_leader->mm != thread->mm)
> +	if (thread->group_leader->mm != thread->mm) {
> +		mmput(thread->mm);
>   		return ERR_PTR(-EINVAL);
> +	}
>   
>   	/*
>   	 * take kfd processes mutex before starting of process creation
> @@ -827,10 +828,6 @@ struct kfd_process *kfd_create_process(struct file *filep)
>   		if (IS_ERR(process))
>   			goto out;
>   
> -		ret = kfd_process_init_cwsr_apu(process, filep);
> -		if (ret)
> -			goto out_destroy;
> -
>   		if (!procfs.kobj)
>   			goto out;
>   
> @@ -864,16 +861,9 @@ struct kfd_process *kfd_create_process(struct file *filep)
>   	if (!IS_ERR(process))
>   		kref_get(&process->ref);
>   	mutex_unlock(&kfd_processes_mutex);
> +	mmput(thread->mm);
>   
>   	return process;
> -
> -out_destroy:
> -	hash_del_rcu(&process->kfd_processes);
> -	mutex_unlock(&kfd_processes_mutex);
> -	synchronize_srcu(&kfd_processes_srcu);
> -	/* kfd_process_free_notifier will trigger the cleanup */
> -	mmu_notifier_put(&process->mmu_notifier);
> -	return ERR_PTR(ret);
>   }
>   
>   struct kfd_process *kfd_get_process(const struct task_struct *thread)
> @@ -1115,6 +1105,26 @@ static void kfd_process_wq_release(struct work_struct *work)
>   	struct kfd_process *p = container_of(work, struct kfd_process,
>   					     release_work);
>   
> +	kfd_dbg_trap_disable(p);
> +
> +	if (atomic_read(&p->debugged_process_count) > 0) {
> +		struct kfd_process *target;
> +		unsigned int temp;
> +		int idx = srcu_read_lock(&kfd_processes_srcu);
> +
> +		hash_for_each_rcu(kfd_processes_table, temp, target, kfd_processes) {
> +			if (target->debugger_process && target->debugger_process == p) {
> +				mutex_lock(&target->mutex);
> +				kfd_dbg_trap_disable(target);
> +				mutex_unlock(&target->mutex);
> +				if (atomic_read(&p->debugged_process_count) == 0)
> +					break;
> +			}
> +		}
> +
> +		srcu_read_unlock(&kfd_processes_srcu, idx);
> +	}
> +
>   	kfd_process_dequeue_from_all_devices(p);
>   	pqm_uninit(&p->pqm);
>   
> @@ -1200,11 +1210,14 @@ static const struct mmu_notifier_ops kfd_process_mmu_notifier_ops = {
>   	.free_notifier = kfd_process_free_notifier,
>   };
>   
> -static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
> +int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
>   {
>   	unsigned long  offset;
>   	int i;
>   
> +	if (p->has_cwsr)
> +		return 0;
> +
>   	for (i = 0; i < p->n_pdds; i++) {
>   		struct kfd_dev *dev = p->pdds[i]->dev;
>   		struct qcm_process_device *qpd = &p->pdds[i]->qpd;
> @@ -1233,6 +1246,8 @@ static int kfd_process_init_cwsr_apu(struct kfd_process *p, struct file *filep)
>   			qpd->tba_addr, qpd->tma_addr, qpd->cwsr_kaddr);
>   	}
>   
> +	p->has_cwsr = true;
> +
>   	return 0;
>   }
>   
> @@ -1375,6 +1390,10 @@ static struct kfd_process *create_process(const struct task_struct *thread)
>   	if (err)
>   		goto err_event_init;
>   	process->is_32bit_user_mode = in_compat_syscall();
> +	process->debug_trap_enabled = false;
> +	process->debugger_process = NULL;
> +	process->exception_enable_mask = 0;
> +	atomic_set(&process->debugged_process_count, 0);
>   
>   	process->pasid = kfd_pasid_alloc();
>   	if (process->pasid == 0) {
> @@ -1422,6 +1441,8 @@ static struct kfd_process *create_process(const struct task_struct *thread)
>   	kfd_unref_process(process);
>   	get_task_struct(process->lead_thread);
>   
> +	INIT_WORK(&process->debug_event_workarea, debug_event_write_work_handler);
> +
>   	return process;
>   
>   err_register_notifier:
> @@ -1908,8 +1929,10 @@ static void restore_process_worker(struct work_struct *work)
>   	 */
>   
>   	p->last_restore_timestamp = get_jiffies_64();
> -	ret = amdgpu_amdkfd_gpuvm_restore_process_bos(p->kgd_process_info,
> -						     &p->ef);
> +	/* VMs may not have been acquired yet during debugging. */
> +	if (p->kgd_process_info)
> +		ret = amdgpu_amdkfd_gpuvm_restore_process_bos(p->kgd_process_info,
> +							     &p->ef);
>   	if (ret) {
>   		pr_debug("Failed to restore BOs of pasid 0x%x, retry after %d ms\n",
>   			 p->pasid, PROCESS_BACK_OFF_TIME_MS);
