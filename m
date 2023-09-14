Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A5F79F97E
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 06:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EE110E4F1;
	Thu, 14 Sep 2023 04:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0E610E4F1;
 Thu, 14 Sep 2023 04:18:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxQbQxf+MoeGnu/xcMWB6Kw0PZERcQ8G6ebdXOpe9SKIMNQCKsDetHPLD29vSFyK8o7BqDuFIX9SVZI5e/v1oL3DUEq/94ntV1rUwTFq4dbkEfjUblEd7xz7oHSp9bLtBG0iaK9kXuytJJz29HCgYO+yPb6UTXiYbzOp7e+o+TkWZDwcHHilvCFbFjKMHBOAQdo7O2jgeEsTSlOmonp7dXJK4ZUj95ylI4MT9IPoVPnYDHRbzuJzhH7NxopkqVRs3ygoU/RSCzi1UQpsB3xlIeHgNHrXVbkwI7SklNu0KVdHDACbUrDOvGYhEtdXkAf5+yvnGkSXFjZfJEfy8fPRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDjGWZLItJOFjatrgMO3bSvBeqzWHJiNnx5TOH20Pqg=;
 b=jGwUq6yiOnkbZpDuskE6dWpOqxJFzxzHZPk/TITHbm8r+ByJ8IUpg6VLe6Sn7WLMP78ccR0imIdMcDnwezAIaygQShCzXjVk1WF7u6JmQk24sKOfFa0YZww9V44aYGWlqdXdvpk3Qd3AAAjHRJQfx4oscVP6rCxkaRgux7RlUtiVpDoY7HGtq/+mj+MZs8MbTWq+QwxArIDJPk9l1QsGcCQW/kD7rvwil0brBddm2l+kzdr2+bZH5VXfhSaDqbL2P2xHrpaXgaaAOCrRwAq0zslcmyDHspKhw5XY1KzYxOwoBAdU3NI9bIObhqLEf3X5WAgZ3vdEdnWqWEAPIC1Zlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDjGWZLItJOFjatrgMO3bSvBeqzWHJiNnx5TOH20Pqg=;
 b=x7X7Boip+1a69/qT90QEuTKXXAOK63Hoj5uR5te74SQpNuG4wLKV5s9YZhNhdU/ObtqObVQ8m9gi0jw7CQgKcmBzg33t3k63cKGN6DjefE8dMlum0vZpRhFDXhPBxPRx8QibwyOchL4DpJs8sZBAdXTY0cRQp/gFS6apCSzbZUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH3PR12MB7715.namprd12.prod.outlook.com (2603:10b6:610:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 04:18:15 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 04:18:15 +0000
Message-ID: <da5a4c90-5a8d-4248-bc8e-b0bd2a03aa5f@amd.com>
Date: Thu, 14 Sep 2023 00:18:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.2.2
Subject: Re: [PATCH v3 03/13] drm/sched: Move schedule policy to scheduler /
 entity
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230912021615.2086698-1-matthew.brost@intel.com>
 <20230912021615.2086698-4-matthew.brost@intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <20230912021615.2086698-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0346.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fc::16) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH3PR12MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: abf5167f-43d5-4e53-c65e-08dbb4d99dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fkyX5q7N1IIcNbZItAUIx0LnK/8+kiOUMHMCo6KaoZnH13n2qtc2wfwTvMxWba7v0w0vbe2lk0gpt4QMNLKJNFTUH0FV0BG2QXCpAnm4ZiXgGaRcY/NVkBR8M7OEDIn9ZCItykpM3TTir/BD7Z+l6d3aUtUNhewg3U5K9+SgJsmfehIHtvKrmFYHgvzwTA1nWq6Ni6xhEozvhcHScsJ4kUx1CxvhJK1wlT3WTUgLNqJbdVxv24p2azcX+djQ+uTFf8t3khZs7XyVdpgZsfN00wH5GQJllvVNlgjFy4S4IUoCLqqezHV9z6IO1Ezltj3ZJVkt6SZaKlPdf7B8UilLuJwtISOGMRXSphPhmP5mxpHDs/bOJBljj7T1f5yQHHG9Btij7DV7AYhW9R20DdApQlysYrOsMZGBe6qNXHQlGXnTBZ3YHC2tKVwBMIKYhKAS7DcevML3Eytpb+kPAhVEVKBSQRiCnsBeLZ6iI7aZVP8TsZXlq7ih1ndRBX43VIxrOR6Zb+2IZuCIl6LyONceq7ra9vebT0GCOCybH6Qg0fQOKFOiItrh5qNNzE6b88FIHrBf5fMmhdYYnBjmeYVAnsl8bpsuimDBuy9J95hCtJuuTvw5hC4TL/0zL15e32XK6/gBp+FHCqD9Stw8ZZIN7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199024)(1800799009)(186009)(31686004)(6666004)(6486002)(53546011)(478600001)(6506007)(38100700002)(7416002)(30864003)(41300700001)(83380400001)(26005)(6512007)(2616005)(4326008)(86362001)(36756003)(31696002)(66556008)(66946007)(316002)(66476007)(8676002)(44832011)(8936002)(5660300002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QktaRG1hWWZISHZPRjF1RzE2TURZTkd4dWJ6N1FXaU9Iekt5Z1hOeGhXUDAw?=
 =?utf-8?B?Ylk2bjdTQ3VONmxKUWMxbDJpOUVzNFNGNXFrZElFRm91dW1kTW50Q3VrZDlG?=
 =?utf-8?B?Yk85M3d1M205Vm1lTHV6enNTY0xreVNrZlgxem1yQjFnMi9XOUZBUUU2bmdn?=
 =?utf-8?B?bWJKZzJkNVQ4MGFiVDQ5MEFvT3pIdVBXd1RGdEozMHBUZlBmM3poQjJVQm04?=
 =?utf-8?B?Vk1zRlN2THhNUk0xZXRteUpTU1krVk52Tk9vN0ZNV056emk2cnNiRUQ1WS91?=
 =?utf-8?B?SktjMVBldXJoNCtINzEvSkZvdkdWUjJQWDZxeXdwR2pRUjFHNytnWWFUNnY5?=
 =?utf-8?B?YnJwMXRHTDVMMVdpdW5ZMnpXbTlzbVY0SHdVZWVrZ1BQSHA1cTkzaVM0ZE8w?=
 =?utf-8?B?ZnBrSHdteFl3UmtvbG5DeGV3ZXF6WG5tdlhzblE3UUJ5WElWbUJVbEptODBv?=
 =?utf-8?B?ejdGcnNLRzVCWUtZdkNCNWxLcFV5NTQyc3gyejV5andrU25pUlBUTGQ0SDJw?=
 =?utf-8?B?ZkgzWXpEREl5djBRR1NwVndIcnFkSmtRS3MzdldjckdhaU5vZ3AwR0R6NTEv?=
 =?utf-8?B?ckJQWWsrdkdwRFFVbjhzQXQzR0kzMUJuU2FGbjQ1SHJkU3ZuVFRYd1JQVWRJ?=
 =?utf-8?B?YkhwdlNySWFySHZVQmlqMjM5SlgxU1dyV2gvQUJ0NzhmNkM2VmFMOXptRmdy?=
 =?utf-8?B?ZS9EUjhHeEhFOHZlaE1OS1ErQXNROUpDTERHWVNreHNzMVFXcVJzY0tWaWNG?=
 =?utf-8?B?c1o0blp4ZjRMWnUreGtiSU4zMGZQRUNHQVlJUHpheEowamdPMXJLcXFxeldl?=
 =?utf-8?B?bURDY0xOMkNtSnUyVjByeEM3MlFjY3VZcDNyVTlXUFVGb1BtTFRaaFhSZzBE?=
 =?utf-8?B?b3FqbEsxVCtZSGdGUzVJT2VBenRLUzIzdlBOVmlJTE9GbUh3VDhZRERWMkZt?=
 =?utf-8?B?bHc4OXJ2d214b0JoQldnV09rb0tpU2ZEbGZSSmNsQnJoVm0xQlgraENtMHo4?=
 =?utf-8?B?cVVBbHNBbTV0clNuNURuZTJyV2pUZ0tTUkNmV0dac2pyakJaYUV0Mkp6ZmRM?=
 =?utf-8?B?WmlHdEttNFJXVktrMW1IQ2RDeDU3bVRvaGczQmJEZ2RMUEZLUytzU2Mzbmg5?=
 =?utf-8?B?Y3FZY0JLQm8zRzh4YngveW1xZXBJUVVqTkc5Q0FuVEJETDdPYWs3R3MrQUdI?=
 =?utf-8?B?UHQ4OXpWTXlpcDgzSWIrWXRSMVVxNlJEMGxzZ01UYktxaHE3UlJXdGMzdHpR?=
 =?utf-8?B?RkhEQjVIaGI3WXZYQ1NZa0FJWUdPKzNvcFlLand2d1RJNExLRnlQNEd0WVIy?=
 =?utf-8?B?NDlNMDloNWcyOEE5RUxyMUlIUlZYZGRPUC9qZ0VQYUt4c3h2TG9IeTVmdlZ6?=
 =?utf-8?B?OTY0aHRTemczTW1zdVpSL3lVVVZyNHFlcGx2bFB4WHJTZDBBQ29pMXcxUkhW?=
 =?utf-8?B?cFNyR2tWbmE1NkozdUN5c1AwaVVaQVdVczl5MFZTbFJhV0l4MUwwamNXblY4?=
 =?utf-8?B?ZldTRW1teG96bXkybE1JK2tTcmljUm1lVVFVMzJwcm5IT1BqSkpuS2RRWjU3?=
 =?utf-8?B?OVNLSUpxRnYyRXM4WmlVWnBDcTVHYmpSQ3VkaW9yM1JqTWptZkJSNTN4KzhI?=
 =?utf-8?B?M0FsQ2VJMG9Qak4zMVcwL2NvYXRlWjY1SGo0NnE4bmRxNnFYSitqY3JTYkFm?=
 =?utf-8?B?UGkzOVJMaDB3cXc0T3hmNG00NDlJaHFqMlcwWXUxaHYxMjFmVW1WSDJ5YkN0?=
 =?utf-8?B?TUYvcDRIZlVFYkV4MktHUFRXWm01SktSTUNVdGNCMnJKamlIVkpnbEFBSEM0?=
 =?utf-8?B?dVBrZHhHTzFpMDhnZmdaUS93MWFEem01S3hNNEVlQmpUUTNLZ2NBR2pUYTU0?=
 =?utf-8?B?MDVBOWNYNGxPVUI5U2w1SXc5UGVOd0VyZ3AwWlZZMDlDMFVZWk1qdEMyM0Zy?=
 =?utf-8?B?RTNubjR0Mk56SWEwYkc5TWo0MU1CaU5ocVIwc0QzL05JUXIwejR2WGx0UXhY?=
 =?utf-8?B?dU9EWVFVb2xCQU9PT0Y5OVg1akYvUzNZbXR6VTdPdUUwdmozT1RBZXJmTUhj?=
 =?utf-8?B?cktTUUtNOXY3UW1ZdzRIcWVreFFtTkUrc0FHVnVhMHU1Rm5lWkJtMENSRDZM?=
 =?utf-8?Q?NdlUe9hnBD3ViseeJjwDrgiQr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf5167f-43d5-4e53-c65e-08dbb4d99dae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 04:18:15.0959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzYcYmK0fkyuHNYILVjyhKEWTLYS+uxdTFA30IUhTIu+Ox7lLCKk5ibeekzsyh3g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7715
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, mcanal@igalia.com,
 Liviu.Dudau@arm.com, boris.brezillon@collabora.com, donald.robson@imgtec.com,
 lina@asahilina.net, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-11 22:16, Matthew Brost wrote:
> Rather than a global modparam for scheduling policy, move the scheduling
> policy to scheduler / entity so user can control each scheduler / entity
> policy.
> 
> v2:
>   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
>   - Only include policy in scheduler (Luben)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
>  drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
>  drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
>  drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
>  drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
>  drivers/gpu/drm/scheduler/sched_main.c     | 23 +++++++++++++++------
>  drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
>  include/drm/gpu_scheduler.h                | 20 ++++++++++++------
>  10 files changed, 72 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index c83a76bccc1d..ecb00991dd51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2309,6 +2309,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>  				   ring->num_hw_submission, 0,
>  				   timeout, adev->reset_domain->wq,
>  				   ring->sched_score, ring->name,
> +				   DRM_SCHED_POLICY_DEFAULT,
>  				   adev->dev);
>  		if (r) {
>  			DRM_ERROR("Failed to create scheduler on ring %s.\n",
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index 618a804ddc34..3646f995ca94 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -137,7 +137,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>  	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
>  			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
>  			     msecs_to_jiffies(500), NULL, NULL,
> -			     dev_name(gpu->dev), gpu->dev);
> +			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
> +			     gpu->dev);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 8d858aed0e56..465d4bf3882b 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>  	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
>  			      lima_job_hang_limit,
>  			      msecs_to_jiffies(timeout), NULL,
> -			      NULL, name, pipe->ldev->dev);
> +			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
> +			      pipe->ldev->dev);
>  }
>  
>  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index b8865e61b40f..f45e674a0aaf 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -96,7 +96,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  
>  	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
>  			num_hw_submissions, 0, sched_timeout,
> -			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
> +			NULL, NULL, to_msm_bo(ring->bo)->name,
> +			DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
>  	if (ret) {
>  		goto fail;
>  	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index d458c2227d4f..70e497e40c70 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -431,7 +431,8 @@ int nouveau_sched_init(struct nouveau_drm *drm)
>  
>  	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
>  			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
> -			      NULL, NULL, "nouveau_sched", drm->dev->dev);
> +			      NULL, NULL, "nouveau_sched",
> +			      DRM_SCHED_POLICY_DEFAULT, drm->dev->dev);
>  }
>  
>  void nouveau_sched_fini(struct nouveau_drm *drm)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 326ca1ddf1d7..ad36bf3a4699 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -835,7 +835,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  				     nentries, 0,
>  				     msecs_to_jiffies(JOB_TIMEOUT_MS),
>  				     pfdev->reset.wq,
> -				     NULL, "pan_js", pfdev->dev);
> +				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
> +				     pfdev->dev);
>  		if (ret) {
>  			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
>  			goto err_sched;
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index a42763e1429d..65a972b52eda 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -33,6 +33,20 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> +static bool bad_policies(struct drm_gpu_scheduler **sched_list,
> +			 unsigned int num_sched_list)

Rename the function to the status quo,
	drm_sched_policy_mismatch(...

> +{
> +	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
> +	unsigned int i;
> +
> +	/* All schedule policies must match */
> +	for (i = 1; i < num_sched_list; ++i)
> +		if (sched_policy != sched_list[i]->sched_policy)
> +			return true;
> +
> +	return false;
> +}
> +
>  /**
>   * drm_sched_entity_init - Init a context entity used by scheduler when
>   * submit to HW ring.
> @@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  unsigned int num_sched_list,
>  			  atomic_t *guilty)
>  {
> -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> +	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
> +	    bad_policies(sched_list, num_sched_list))
>  		return -EINVAL;
>  
>  	memset(entity, 0, sizeof(struct drm_sched_entity));
> @@ -486,7 +501,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	 * Update the entity's location in the min heap according to
>  	 * the timestamp of the next job, if any.
>  	 */
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
> +	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
>  		struct drm_sched_job *next;
>  
>  		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> @@ -558,7 +573,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
>  	struct drm_sched_entity *entity = sched_job->entity;
> -	bool first;
> +	bool first, fifo = entity->rq->sched->sched_policy ==
> +		DRM_SCHED_POLICY_FIFO;
>  	ktime_t submit_ts;
>  
>  	trace_drm_sched_job(sched_job, entity);
> @@ -587,7 +603,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  		drm_sched_rq_add_entity(entity->rq, entity);
>  		spin_unlock(&entity->rq_lock);
>  
> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +		if (fifo)
>  			drm_sched_rq_update_fifo(entity, submit_ts);
>  
>  		drm_sched_wakeup_if_can_queue(entity->rq->sched);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 614e8c97a622..545d5298c086 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -66,14 +66,14 @@
>  #define to_drm_sched_job(sched_job)		\
>  		container_of((sched_job), struct drm_sched_job, queue_node)
>  
> -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
> +int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>  
>  /**
>   * DOC: sched_policy (int)
>   * Used to override default entities scheduling policy in a run queue.
>   */
> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
> -module_param_named(sched_policy, drm_sched_policy, int, 0444);
> +MODULE_PARM_DESC(sched_policy, "Specify the default scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");

Note, that you don't need to add "default" in the text as it is already there at the very end "FIFO (default)."
Else, it gets confusing what is meant by "default". Like this:

	Specify the default scheduling policy for entities on a run-queue, 1 = Round Robin, 2 = FIFO (default).

See "default" appear twice and it creates confusion? We don't need our internal "default" play to get
exported all the way to the casual user reading this. It is much clear, however,

	Specify the scheduling policy for entities on a run-queue, 1 = Round Robin, 2 = FIFO (default).

To mean, if unset, the default one would be used. But this is all internal code stuff.

So I'd say leave this one alone.

> +module_param_named(sched_policy, default_drm_sched_policy, int, 0444);

Put "default" as a postfix:
default_drm_sched_policy --> drm_sched_policy_default

>  
>  static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>  							    const struct rb_node *b)
> @@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>  	if (rq->current_entity == entity)
>  		rq->current_entity = NULL;
>  
> -	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> +	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
>  		drm_sched_rq_remove_fifo_locked(entity);
>  
>  	spin_unlock(&rq->lock);
> @@ -898,7 +898,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>  
>  	/* Kernel run queue has higher priority than normal run queue*/
>  	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
> -		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
> +		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>  			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
>  			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
>  		if (entity)
> @@ -1071,6 +1071,7 @@ static void drm_sched_main(struct work_struct *w)
>   *		used
>   * @score: optional score atomic shared with other schedulers
>   * @name: name used for debugging
> + * @sched_policy: schedule policy
>   * @dev: target &struct device
>   *
>   * Return 0 on success, otherwise error code.
> @@ -1080,9 +1081,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   struct workqueue_struct *submit_wq,
>  		   unsigned hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev)
> +		   atomic_t *score, const char *name,
> +		   enum drm_sched_policy sched_policy,
> +		   struct device *dev)
>  {
>  	int i;
> +
> +	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
> +		return -EINVAL;
> +
>  	sched->ops = ops;
>  	sched->hw_submission_limit = hw_submission;
>  	sched->name = name;
> @@ -1092,6 +1099,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  	sched->hang_limit = hang_limit;
>  	sched->score = score ? score : &sched->_score;
>  	sched->dev = dev;
> +	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
> +		sched->sched_policy = default_drm_sched_policy;
> +	else
> +		sched->sched_policy = sched_policy;
>  	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>  		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>  
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 38e092ea41e6..5e3fe77fa991 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_bin_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_bin", v3d->drm.dev);
> +			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
> +			     v3d->drm.dev);
>  	if (ret)
>  		return ret;
>  
> @@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_render_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_render", v3d->drm.dev);
> +			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
> +			     v3d->drm.dev);
>  	if (ret)
>  		goto fail;
>  
> @@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  			     &v3d_tfu_sched_ops, NULL,
>  			     hw_jobs_limit, job_hang_limit,
>  			     msecs_to_jiffies(hang_limit_ms), NULL,
> -			     NULL, "v3d_tfu", v3d->drm.dev);
> +			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
> +			     v3d->drm.dev);
>  	if (ret)
>  		goto fail;
>  
> @@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  				     &v3d_csd_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_csd", v3d->drm.dev);
> +				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
> +				     v3d->drm.dev);
>  		if (ret)
>  			goto fail;
>  
> @@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>  				     &v3d_cache_clean_sched_ops, NULL,
>  				     hw_jobs_limit, job_hang_limit,
>  				     msecs_to_jiffies(hang_limit_ms), NULL,
> -				     NULL, "v3d_cache_clean", v3d->drm.dev);
> +				     NULL, "v3d_cache_clean",
> +				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
>  		if (ret)
>  			goto fail;
>  	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 278106e358a8..897d52a4ff4f 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -72,11 +72,15 @@ enum drm_sched_priority {
>  	DRM_SCHED_PRIORITY_UNSET = -2
>  };
>  
> -/* Used to chose between FIFO and RR jobs scheduling */
> -extern int drm_sched_policy;
> -
> -#define DRM_SCHED_POLICY_RR    0
> -#define DRM_SCHED_POLICY_FIFO  1
> +/* Used to chose default scheduling policy*/
> +extern int default_drm_sched_policy;
> +
> +enum drm_sched_policy {
> +	DRM_SCHED_POLICY_DEFAULT,
> +	DRM_SCHED_POLICY_RR,
> +	DRM_SCHED_POLICY_FIFO,
> +	DRM_SCHED_POLICY_COUNT,
> +};

No. Use as the first (0th) element name "DRM_SCHED_POLICY_UNSET".
The DRM scheduling policies are,
	* unset, meaning no preference, whatever the default is, (but that's NOT the "default"),
	* Round-Robin, and
	* FIFO.
"Default" is a _result_ of the policy being _unset_. "Default" is not a policy.
IOW, we want to say,
	"If you don't set the policy (i.e. it's unset), we'll set it to the default one,
which could be either Round-Robin, or FIFO."

It may look a bit strange in function calls up there, "What do you mean `unset'? What is it?"
but it needs to be understood that the _policy_ is "unset", "rr", or "fifo", and if it is "unset",
we'll set it to whatever the default one was set to, at boot/compile time, RR or FIFO.

Note that "unset" is equivalent to a function not having the policy parameter altogether (as right now).
Now that you're adding it, you can extend that, as opposed to renaming the enum
to "DEFAULT" to tell the caller that it will be set to the default one. But we don't need
to tell function behaviour in the name of a function parameter/enum element.

>  
>  /**
>   * struct drm_sched_entity - A wrapper around a job queue (typically
> @@ -489,6 +493,7 @@ struct drm_sched_backend_ops {
>   *              guilty and it will no longer be considered for scheduling.
>   * @score: score to help loadbalancer pick a idle sched
>   * @_score: score used when the driver doesn't provide one
> + * @sched_policy: Schedule policy for scheduler
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
>   * @pause_submit: pause queuing of @work_submit on @submit_wq
> @@ -514,6 +519,7 @@ struct drm_gpu_scheduler {
>  	int				hang_limit;
>  	atomic_t                        *score;
>  	atomic_t                        _score;
> +	enum drm_sched_policy		sched_policy;
>  	bool				ready;
>  	bool				free_guilty;
>  	bool				pause_submit;
> @@ -525,7 +531,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>  		   struct workqueue_struct *submit_wq,
>  		   uint32_t hw_submission, unsigned hang_limit,
>  		   long timeout, struct workqueue_struct *timeout_wq,
> -		   atomic_t *score, const char *name, struct device *dev);
> +		   atomic_t *score, const char *name,
> +		   enum drm_sched_policy sched_policy,
> +		   struct device *dev);
>  
>  void drm_sched_fini(struct drm_gpu_scheduler *sched);
>  int drm_sched_job_init(struct drm_sched_job *job,

-- 
Regards,
Luben

