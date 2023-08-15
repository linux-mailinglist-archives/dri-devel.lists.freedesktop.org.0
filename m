Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CABBC77C801
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 08:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BA910E0A4;
	Tue, 15 Aug 2023 06:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298DB10E0A4;
 Tue, 15 Aug 2023 06:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwcazQ1dXqtTV01hm1DRv65tbfpV2gi+tSKIZNSJxFWdQkL4m0aF8lbuAdoju6VDNP7CmJ15nyyRtr1m251dmCQbzNnuQfGYMj6AOXUIGqZxWIhy8XiOy+i+Y6U1fdV6j1a6cCKYED5iz5h6eupUzDPukC8YDnYL47IeraAl+AwGNqLJ44Z60yl4e1H8fAczpynqFIs3behy7cs2zgLZ+QtseT65zDyd8gGyEkvmY64jX8FmtwHu0qVIRQ9uMSatgLlLD1/VqqBxgmJTlYHM1fj9h95xd9f4/hqd4/i2whFDZ7CAa1xNJw4TMeTyxlL9Y/0fdnOer1xAStOBl99lyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGA+oGm9p7+qhYVF5XfntkVxQkVYkX5mm3gTbpcg+x8=;
 b=E+4Y+nz3YWDEk0c+6ISDrve000C4ZoRYwv33PEdOhXhMwBxuOn5J6jlMi449Li9gASXYdF46nUVB+tmywGZPXxdCYbEtQnhYYt+C5oP45f+epxm3GpkR1FQKg4ztG/g8ixc4k5/5U1vpt++iElvdBGso7q/QMiFP3as/YQjq0VEA0kD3PB7sz0vd9BfOcRB6nFq+ydZhzkgLwcHHhE41h2WGbeBnMroYOe2RDQg8lGoEihrRXpKt2PbCnddUFskqaAmrM5FHhHwY+PLcr2Gte21x+7oKsHzt1fyampk3tJ8Fd0c8fbVXsb7WN1YmWgAEMBk9Ky7d490HRczt84O5yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGA+oGm9p7+qhYVF5XfntkVxQkVYkX5mm3gTbpcg+x8=;
 b=ybVCI6Wvb9CrPn0lWDoBcE0gJTFQBCf/gAS9YVu6H7WSK7tSf2Wjjh8MQZRL7m2MMoi1V02RRChVRAjhRWhQMnqsBqm//GFRcKm8E5El04UWCenWApAgdGdn9Jcd7/MiQLY+eJ8qZ7DLDy/68aeqpx+CGmFRgEDYXPmqt/ncDRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY5PR12MB6647.namprd12.prod.outlook.com (2603:10b6:930:40::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 06:44:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 06:44:48 +0000
Message-ID: <55f69184-1aa2-55d6-4a10-1560d75c7324@amd.com>
Date: Tue, 15 Aug 2023 08:44:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND v3 1/5] drm/amdgpu: Create a module param to disable soft
 recovery
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230810192330.198326-1-andrealmeid@igalia.com>
 <20230810192330.198326-2-andrealmeid@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230810192330.198326-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CY5PR12MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 415422cf-71a2-4e73-219e-08db9d5b1e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JurLMKg6NWRHL2+aCkPLxsW1zZ+//r9CiLHLaFWQmhJum6q75b5rNyRfb9RPG+PfvBM9D+I5V80QxdSulzdYI7w6mp4smtee12Sk6zhbFGowAB2ois0wpUBqsOluvzIkeMIB4txV1tfN283K2hrbRu40oMdjqP9VwsREgfXb+6YCjO439RGimY/u5OamwJQVeGEQgwN0sC6lwUXlHBCxkR1VSo8aaP8A0L65tbiAz8Tb46oFlLOZEPsrbFph9rDzEztC1aaNe722ztJ4wGRJLAkkvQ0AwVE4bfVXY7rE/+rRpvB1OA7hKTaHQNY3zhtA4ePhM8JOYGYalJGBYj6hTNJ3oDSVNWTmi+GLC/lhpZFqUtP98e0ds6XoTlIADDRUfFhZoUXIJ2PFGdHXFL3xBRSSZ1RmZfTV5mMKNhbS+uo5YRKlFUT+adI6q0gtqSa/v+439zFRz8ZPa9YVkfLOTI0OwbeJlQvXjFCcXo4weNqLWoClX5GQFu1Cw8jXb48iuMRQodNRX8MXhM1doJLuYPCsM2tThQ0J/jg8LXtjHoA0a2T65wqqpiKh9YYW3dlY5FVuPgaZSzEfK02yvXvp75hwG3WFKSsjJGeRpgYDNa6bYhKs8WvnOXzs9ou5IaEqOJgkJtJOjEQjWwB8tpScAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199021)(186006)(1800799006)(31686004)(6666004)(478600001)(6486002)(6506007)(83380400001)(36756003)(31696002)(86362001)(6512007)(66946007)(2906002)(2616005)(38100700002)(41300700001)(4326008)(66556008)(8676002)(54906003)(66476007)(5660300002)(8936002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVg2dnF0WXZuOFcyNENwSWttRmZsTHZZdTI3UmZFdFU4MWJVOEZmOGovdWZJ?=
 =?utf-8?B?VW0rQUZVZXZpNDhRTGlzUEVOaDBtaXZoNHlhamFCUFNHODZPVFU3SFRGWDU1?=
 =?utf-8?B?dTdXYnEyUVFOcmhNQ0FIczUwVDRoOXNRUDlvRmUrMVdqb0pSbkVjZ1g0R25w?=
 =?utf-8?B?dkpGL2xHSHNkekNoc3dvL1ZjL3FLYU5FVWdlVUwyalZLTVQzRkwzcDRaNS9x?=
 =?utf-8?B?d2FlM0d1Y0Z3eGQxWFRNNGFTYTRKSERtUnNQSnlvVjBxaU16dk9HTzZpZnRq?=
 =?utf-8?B?YTFDR005K2NsS2R3TzV6Y2dQREFiVWV6Znk2NWhBdkVna0NjcEkrc1g5bXp1?=
 =?utf-8?B?WThHSWw1TEd2K1AzRVRMeVJ5bW1FNzZMNDMwVDloS3kwbmJ0MmViQzR0RU5F?=
 =?utf-8?B?MDJONmd1MWFoQUx0RkxtNVgzNUZXOGpWclVReGZYSE90QlNCRXBXdjkrajFL?=
 =?utf-8?B?RTh5VUloSGdiV2YvVTRhOGJpVk91amM2THNTUHVQdzd0S1BXTkVUcUV5WUZw?=
 =?utf-8?B?SXlhbXVzbFBXamY2MDVNY1lBUkMyY0NKelZGbjB0VVg3cCt6WnFQdkpxN0ZJ?=
 =?utf-8?B?Ry9UeC9HWFQ4c0pJZlBJaGNmVklPNVZPcDFEdlRTbWhkT2tvYVI5ckJ1eFFt?=
 =?utf-8?B?QzFKdkpHUmw5NkcybXFlOUNvWlVPc29ndm9xQks5aktIMU5XUVM3b1NhYlA4?=
 =?utf-8?B?Y0prV1AxWFhYbXBkRzFPOUdiMFpaY2Zoc3NhWkxkTVdEejIvRnBiOFFGN1RB?=
 =?utf-8?B?N0IzeGkycUhCMlJkQW42cnFXdjZJVjJrSExERGZOWjhXWjgzL3lnTk5NazV3?=
 =?utf-8?B?Q0ZkKzNzYXRReFRTMXhDa2NHK3VVV0NTM29QeU12Sk5ndm9WdkRaZk4vbndX?=
 =?utf-8?B?WVhqMFlnN3dxUlA0cExCaCtWUEJhTFlxNEJVSSt0K1dBa21EMVd4K0dMRjRu?=
 =?utf-8?B?eEtvN1I1Ui92WUFhL2JjTUNPSUp1bDFBcTIvY0FNc05aQkoxUGFEOCtQRHpO?=
 =?utf-8?B?ckVtajRJdmtkYUtTL0J2MEJQVmxuQ29LNWRlOWcwdVRBeEZONFBjaXR4U3BF?=
 =?utf-8?B?alBkeXRwdkNXaG9Ja0xnR0E5RzNEcmVaS3VDMHFpanZhYWlRMHU3UXhVVmh0?=
 =?utf-8?B?NDNGRmhNb3VUMHNzVFRtRkhCMi90ajhqU1FMa2Z4SytYTDdIQmF5VTVJcy9V?=
 =?utf-8?B?NWZnVHVJbXNTVjN2cGtadkJZbnFpNlc4Vk5mMUw2OTM1elJxVGhLNjdxMklD?=
 =?utf-8?B?czNPanUvcG5heDFSMGhWbHhTWWhQWDhPQzA4Tmpralpwc0lxZFNIUzdMVTdC?=
 =?utf-8?B?ZExZRThzM0xaZE8wQ25PNFlMajNPeTJYbnhsalpnaDE5T2grdWREZVV4bWR6?=
 =?utf-8?B?R2tkdkErblNMQ1ZvcmpaQS9BUEp6TmNjVkYxZXUxSldmb1JUeldtcEJoMFRk?=
 =?utf-8?B?TnFQRXp2anR0cW1EYUFjaGZaRExua2k1ZE4zanFvbUZMcFkyNXBOR3NxaTVh?=
 =?utf-8?B?cWs2RlVVdUp5bDBFUG9oQVNjQmcxc3I0YndnQ3liTStLZ3ZyYy9obFhaWm10?=
 =?utf-8?B?QXozOXMrU0loTGpPNXNqaUU5aG9XYzNwakx0SnN2cEJpSUErdENjOStqNjUv?=
 =?utf-8?B?c1hYQXZtWWJTbU8xMmMzOXRKQUdUN0lUSk5nNnV5czlWaVJFMFBJYi93T3ZF?=
 =?utf-8?B?UnVEd0c0Q1JpZ204akpHa2I4UHc5RzhWckpGS0hLVTM0MG1Ca01UOVFSbSs5?=
 =?utf-8?B?NE9xLzgxTzE1WmlKTmt4ckd6UmZYNWQ2TDNKVXZRRTJLZWNHZ2FoZTdWclBr?=
 =?utf-8?B?bFlVR3dLaWR4UjA4YUZidzlFSnB2d093Zk1IQ09pRWVXdy9VbW0wRFd1bncw?=
 =?utf-8?B?MUxuVzB5WERCN05mcEV6UzRJbGJjVXR0MVZGd0Y5ZjhXYXQycVI1bmhpbTQ3?=
 =?utf-8?B?R1ptMytOK3QyTWxIUVZxZEs3Qnp1djBzWGdVRzB1YUZpM2ZHZEZjeWlieGlL?=
 =?utf-8?B?Z2EzM0lpUnUxVmJibG8zUHgySm1Ydm9lU2g1OHZoblF5Wnhnbjg1YXZWbDRB?=
 =?utf-8?B?ODRSMUExZGFCZHJYeTZKNFRhaVArUVhKbWZYRzdFQ1BtN2VCakF5QS9rNStr?=
 =?utf-8?B?d2NjU1NkVllsb29COUVIVTBmY1JsclpUbE45SUQ4dlRUSXc5QmUxU0djQURK?=
 =?utf-8?Q?3OsD1b6PGCUwgXqBiEeJ0o3OAZXceGkCXEjUTO0tm8lt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415422cf-71a2-4e73-219e-08db9d5b1e47
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 06:44:48.1947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F16mFlEr41+Y5y9CsToPdYCL9S0IyCH76/Wm6gNmWVHRwYq1EIuDQHvdj2vOw6nI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.08.23 um 21:23 schrieb André Almeida:
> Create a module parameter to disable soft recoveries on amdgpu, making
> every recovery go through the device reset path. This option makes
> easier to force device resets for testing and debugging purposes.

I'm still torn apart on this. On the one hand it's certainly useful for 
developers on the other hand module parameters are not meant to be used 
by developers, they are meant to be used by end users.

Now we have to ask what's the use case to disable soft recovery by an 
end user? I don't see any.

Maybe we can overload the amdgpu_gpu_recovery module option with this. 
Or even better merge all the developer module parameter into a 
amdgpu_debug option. This way it should be pretty obvious that this 
isn't meant to be used by someone who doesn't know how to use it.

Regards,
Christian.

>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h      | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 9 +++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 6 +++++-
>   3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 2e3c7c15cb8e..9c6a332261ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -189,6 +189,7 @@ extern uint amdgpu_force_long_training;
>   extern int amdgpu_lbpw;
>   extern int amdgpu_compute_multipipe;
>   extern int amdgpu_gpu_recovery;
> +extern bool amdgpu_soft_recovery;
>   extern int amdgpu_emu_mode;
>   extern uint amdgpu_smu_memory_pool_size;
>   extern int amdgpu_smu_pptable_id;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 0fec81d6a7df..27e7fa36cc60 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -163,6 +163,7 @@ uint amdgpu_force_long_training;
>   int amdgpu_lbpw = -1;
>   int amdgpu_compute_multipipe = -1;
>   int amdgpu_gpu_recovery = -1; /* auto */
> +bool amdgpu_soft_recovery = true;
>   int amdgpu_emu_mode;
>   uint amdgpu_smu_memory_pool_size;
>   int amdgpu_smu_pptable_id = -1;
> @@ -538,6 +539,14 @@ module_param_named(compute_multipipe, amdgpu_compute_multipipe, int, 0444);
>   MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = enable, 0 = disable, -1 = auto)");
>   module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
>   
> +/**
> + * DOC: gpu_soft_recovery (bool)
> + * Set true to allow the driver to try soft recoveries if a job get stuck. Set
> + * to false to always force a GPU reset during recovery.
> + */
> +MODULE_PARM_DESC(gpu_soft_recovery, "Enable GPU soft recovery mechanism (default: true)");
> +module_param_named(gpu_soft_recovery, amdgpu_soft_recovery, bool, 0644);
> +
>   /**
>    * DOC: emu_mode (int)
>    * Set value 1 to enable emulation mode. This is only needed when running on an emulator. The default is 0 (disabled).
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index 80d6e132e409..40678d9fb17e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -434,8 +434,12 @@ bool amdgpu_ring_soft_recovery(struct amdgpu_ring *ring, unsigned int vmid,
>   			       struct dma_fence *fence)
>   {
>   	unsigned long flags;
> +	ktime_t deadline;
>   
> -	ktime_t deadline = ktime_add_us(ktime_get(), 10000);
> +	if (!amdgpu_soft_recovery)
> +		return false;
> +
> +	deadline = ktime_add_us(ktime_get(), 10000);
>   
>   	if (amdgpu_sriov_vf(ring->adev) || !ring->funcs->soft_recovery || !fence)
>   		return false;

