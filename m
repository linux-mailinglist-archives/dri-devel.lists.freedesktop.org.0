Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE671782BA0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B0710E27F;
	Mon, 21 Aug 2023 14:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DD510E278;
 Mon, 21 Aug 2023 14:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4Vy67fpjXFl81U3yqZyv1cRqOVF7CDznxU6ipWKNZwsMtAFj1f3GERIoQd4U2bcWKqu8xMXJ96zdxsaorBKEZJpDapnrBQ071q3f4IMlRvSKNw2IpgkZDnNoL0zRtvAAc46FimxyqWfubqiuJfA2FVHGATBeOyc3NeCwACaTnZ2VKsD/6LbM7D6D5p1jZk+Kz+6NDhL8YDYVbu7+lsflYovzfSu6IMgU4MA18U0kBLOriLeUB9JNxBqTAeS3+fyFMAXctPFQO9Skb4PAx/eMR8hi1PlmOJL9HawdyofeQgPSJMw2DU9w5MYeIEBA126I4mQ8doHR3D8NDSiqs/aEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBS0/doGbWu38g+8092ACQHgwhtkLBDohox39dB3fK4=;
 b=OzHxyvvB9l0qth/ab9YVQs2KeuccRhIbmmsYbGbG09XAe82/MNCY+pUUjjj9ci9Y1IpT/fpXe/Tbfs8gV+8iCb59K8/JjkwQOOXhYoao9qSLXXL1OTzmVZkhP4Y2A3C9/yXMWVUp47QjkBMVxc1PdMisVcYNTPhIth/WFEp/W6Dir9u2DB7Y2unSjd7OrnNpsC7eY/IjJQgM8CpOPqK0pA1tcMq1Ex1YrJkwlc8fP3KXC1kmCVrbGTMF6C8D3Ty1pug+CDD6ZezLztcXb/xBM2niZv5Qu3cvgk8wYwsftqZMF5dfDvSJqESSYA9Z3cYrIewrVNPlZS7ffbhW6Xg1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBS0/doGbWu38g+8092ACQHgwhtkLBDohox39dB3fK4=;
 b=NN6QrHKmG59LIND9IVL/nQxWvpU02L397zdNHmL/r4plEDhwffPcJLAEEVLzMn2sM+ojKEye2TiylvIsJvmnFPp8YThsklgND380Lx3rmEIqFzfLO5ecJ+35P6VMmZYhG1j2SNgHBW3+KQp7Sk26RSje3I9uSy0vNxmW5ntra2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DS7PR12MB6360.namprd12.prod.outlook.com (2603:10b6:8:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 14:23:06 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 14:23:06 +0000
Message-ID: <7e785b0a-aa1e-b733-2521-694941b7593f@amd.com>
Date: Mon, 21 Aug 2023 16:22:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 4/5] drm/amdgpu: Move coredump code to amdgpu_reset file
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230817182050.205925-1-andrealmeid@igalia.com>
 <20230817182050.205925-5-andrealmeid@igalia.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230817182050.205925-5-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::19) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|DS7PR12MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c14085-4a45-4405-be56-08dba2522322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/bMSnqNYslR63z6jOQYXv9JxSglXaaLIsJl0+bg0zaSRRQ9L1M1bDpSgnRNF2kl/TA+iUvSe1PR3QcVJFVnoK82Jt83sq++H9jlCWFEtNV8m6QzYWoxfvCU1/1QVVwasA5lbKDBw40s7EAjnJ7yEB0ZNS9mZmVCGQEghZm1rcHlGUjpvBKhgtIzG3HLZKAK6USFdSLtNXImpkxC/95JGir/050BEKOTJP/RvRaT9ZmQQ/NwgdrWm+35cE410KCw0xVVqw0pCp+NsH1UM2/qFeteYtlAcFsmWjMx7kkc1PpOiZoRtOwsQLoOLVMaxDx6EGXNzMvgBJrdtAw9ZwjAq7gFMyudQlinlGYOMTUk3y9tNCV2CXKx40dyOauU8yDtw4rO4qRkuNCb2A0Msq43nGgcrth4h2xCF6mvBr9fVjvfm7adCo13d/egfRDhNT5knLxSLGgK74qWfghLTHhBIGn+xWtudlGhQKMnKqBNQXH+YRr4s6PqHTmIFIuYdxL7AfLOu/Qf4Vy5HNH0KyTVoy1Y+wf4iE13WqyjK2iYxlNzFKBWDH8WxuCbWCw6IlHlVXcl9YP7aCQ+CZOknEJ4a6RXspIC2lmIomYrIXBTtnjGpS/masZQgoBtQHR9E0wbP7hV6bcqRJ/JTob9USGwKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(54906003)(66556008)(66946007)(66476007)(316002)(6512007)(8936002)(8676002)(2616005)(4326008)(41300700001)(36756003)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(2906002)(83380400001)(86362001)(31696002)(31686004)(44832011)(5660300002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFVwUWo5bTRTU0k0Z2oyc0tIK00vWWtiYlNLTjlRRERRVm9hZXJxOVRlWkxo?=
 =?utf-8?B?Y2lEWXFURms0UWNiZ0Q1dHpnZFBSeFZYZ2dWWjZKelpqTUdJclc0ck5sbmQ0?=
 =?utf-8?B?VnNSMElhZnFKZElQRGw2OXNnN1FCVm5UbmJmdHRKYjA1L3VhOFJGR2JIOFZk?=
 =?utf-8?B?WUlHd09iTVBhZlJHUDJUNU1yTWFpMU5Kd2I2U0twRG1CZk15QUpzdFBPWE45?=
 =?utf-8?B?Uk0yNkRoQWI4RlFBenVZL3FoYkZ6V1Y4TG9TNUZYZElsTmpjcXk3VjYwZDk5?=
 =?utf-8?B?TWZjSWp4aTFtWlozQWR3cmd3K0RUZTBQdk1YUXVjejlITEt3Tm5jWHZjdVhF?=
 =?utf-8?B?SE9reU9WOTN1bUpGekNsUlJBNTZTMlNnUk83UVRXdm5sbzJUdkJvMWkyUVhh?=
 =?utf-8?B?dU90YTZFMHpGTXE0RVNHK3NaMmdLYUR3dDkyekk2ODAvTVNpcGs2bkFxbUN0?=
 =?utf-8?B?TTBJcEx2ZkJLQlhLTTIrUzUyUlQyZldKVHlMd24rYUp0NGxYb2JkTjJIKytJ?=
 =?utf-8?B?NVgrVThDWTh2amFOWEQxKytLRXovV21yZnVTRTZQbVFtYVF2TjFDZkxmbjN0?=
 =?utf-8?B?Qk5Vc09EZitZSWwrNzRGM2ZPTW41NjVGWTRYZjQveEZCRk9TeENoUG5ZVFVM?=
 =?utf-8?B?YzlBU3VSaEdxOC9qTnhycFVXM1V1Rk9Ram5pa2FBZjNBVVVmaUZJMWlib0Ex?=
 =?utf-8?B?UU1PYnM1L01oay92VUdhWjBjTUI2VmR2Q01wNGFpV245U1Z3N3pzc29ZeHM2?=
 =?utf-8?B?eFN0ZTNRdFl4enlyK2g4MVZDSnBGdFZSdkdzRWd4Mm1JUjdVQ3p1YUJ6NTAy?=
 =?utf-8?B?empETXVvU2dyeUg2Zk84SXdjdDY3amxNSmh2ZHd3a1oxOXFseksrWHZ3REZO?=
 =?utf-8?B?eFkzZjQwSjMzZVlmQndmckxOYmdURDhTY21mY3N6djF2ODBkNFZUaUQzWi9R?=
 =?utf-8?B?Ymt0MTFYZmc0TUN0MCtGNXQ5bCtDdzc5b1Mzdi9YTFpwM1pDbDRLV0UyVHJh?=
 =?utf-8?B?ZGNkeG8xVGN2Szd3WUtMUGRzNUp0OEU0VmJxTGphSlBnT1F3bERvS2liOWxo?=
 =?utf-8?B?R1EzQWlGRWlkRmhZeEgwbnBOZi94ZFVnMjBodUZRelVVME9TQkY0dmN0MW4y?=
 =?utf-8?B?WVpmaFFhT2dzRmlGZ2lXbjFLWDFJbFhCNEdveXQ3RFJ1NDdKV1hzRnEwd3lj?=
 =?utf-8?B?Zm5nTEhPbEZ2dDFKbUUwRldtbXpKVmswa3YwRXByUnlHWEJkd1UxRWxIT1Nq?=
 =?utf-8?B?dTRnajNTVFp4aE82SDdPbWJtaFhJdW5pdWJVOWhPOSs4dE4yY1lYM21md056?=
 =?utf-8?B?aVhOOGJlazVzS3had1doc2taZWF1aW1mbGRXcktyUy9KM0dLaHZlU1hNVWtW?=
 =?utf-8?B?ZENEemt2S3kyTUxpbE5DTEtUWmVlaGk4TnRTeVZIRmhya2F5ZlN5TlFLUmc2?=
 =?utf-8?B?dTRWdWZpVWFma0grS2IvVHBGd3RDSk94ZjJmQm9WWi9DL2RXSjJxQllyY0h0?=
 =?utf-8?B?T1Q0U2NXUW9ZQ0E0WC8xNUZ5UDB0a3FFMElJRHpmWVQzUzB6ci85OHFmcjJX?=
 =?utf-8?B?bDh6U1k1TFlCRUVJYmc1VUxGdk5qWDI5Zkxia2NQZzk0QnIvaDVoU1ZNV3JI?=
 =?utf-8?B?ZGhES2RTazkxMjJmMU1SbzdDWStzaUtwRlVoZm9zUE5GdmV4WW9YZlliODlm?=
 =?utf-8?B?MkRsZlZ2QUxsMHZOYjBCMXNyUUVzUmVwSWdYVW1PT2h3c3Vhbm5ORnlrYVdK?=
 =?utf-8?B?UXhSYzkrNlhHU29HRGhnWGtDeWd1NXMrQ0s1R1drNGkwV1pjdSszUFpIcUxw?=
 =?utf-8?B?RERsMTEwN2RPdkhjcEZPc0JlWG11VGU0R1F3S1JKUndlNmNKOEoxRUJMejN1?=
 =?utf-8?B?Z1JBYjBIMlVOL0Z3TXFISU9UclRWemRtUUNsWTNoY3ZpOWJJT1JSbTcwVVY1?=
 =?utf-8?B?N3BRZzAwZG5RREt1Y08vbGxzYU8rcFN6UkNKbTRaRzRtckpoRzltdEVhSlZu?=
 =?utf-8?B?NDErVFQ3cDArR1J3ak9wQnhqVnJqckIyWXFtd214UForUHcvUjlpN2dVZFJ5?=
 =?utf-8?B?VGMyeXErNnZTamJrSjlHZ3MrU0lNYTAvSitPM3NnUkdIODY1R0hYNVhzT09L?=
 =?utf-8?Q?hYDxTWjDSTmDrGCNg8S0W5GyU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c14085-4a45-4405-be56-08dba2522322
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:23:06.6854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7p26FiC6c+BoSsjA3Uzaf1vl5o9uylkEmg/kBDTBM0i3A8YoH3OY5PvIKeLswJ7UazgMLHXr6NNQiOxB1L1Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6360
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


On 17/08/2023 20:20, André Almeida wrote:
> Giving that we use codedump just for device resets, move it's functions
> and structs to a more semantic file, the amdgpu_reset.{c, h}.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v5: no change
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  9 ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 78 ----------------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 76 +++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 10 +++
>   4 files changed, 86 insertions(+), 87 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 56d78ca6e917..b11187d153ef 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -781,15 +781,6 @@ struct amdgpu_mqd {
>   #define AMDGPU_PRODUCT_NAME_LEN 64
>   struct amdgpu_reset_domain;
>   
> -#ifdef CONFIG_DEV_COREDUMP
> -struct amdgpu_coredump_info {
> -	struct amdgpu_device	*adev;
> -	struct amdgpu_task_info reset_task_info;
> -	struct timespec64	reset_time;
> -	bool			reset_vram_lost;
> -};
> -#endif
> -
>   struct amdgpu_reset_info {
>   	/* reset dump register */
>   	u32 *reset_dump_reg_list;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 96975591841d..883953f2ae53 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -32,8 +32,6 @@
>   #include <linux/slab.h>
>   #include <linux/iommu.h>
>   #include <linux/pci.h>
> -#include <linux/devcoredump.h>
> -#include <generated/utsrelease.h>
>   #include <linux/pci-p2pdma.h>
>   #include <linux/apple-gmux.h>
>   
> @@ -4799,82 +4797,6 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> -#ifndef CONFIG_DEV_COREDUMP
> -static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> -			    struct amdgpu_reset_context *reset_context)
> -{
> -}
> -#else
> -static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
> -		size_t count, void *data, size_t datalen)
> -{
> -	struct drm_printer p;
> -	struct amdgpu_coredump_info *coredump = data;
> -	struct drm_print_iterator iter;
> -	int i;
> -
> -	iter.data = buffer;
> -	iter.offset = 0;
> -	iter.start = offset;
> -	iter.remain = count;
> -
> -	p = drm_coredump_printer(&iter);
> -
> -	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
> -	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> -	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> -	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
> -	if (coredump->reset_task_info.pid)
> -		drm_printf(&p, "process_name: %s PID: %d\n",
> -			   coredump->reset_task_info.process_name,
> -			   coredump->reset_task_info.pid);
> -
> -	if (coredump->reset_vram_lost)
> -		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> -	if (coredump->adev->reset_info.num_regs) {
> -		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
> -
> -		for (i = 0; i < coredump->adev->reset_info.num_regs; i++)
> -			drm_printf(&p, "0x%08x: 0x%08x\n",
> -				   coredump->adev->reset_info.reset_dump_reg_list[i],
> -				   coredump->adev->reset_info.reset_dump_reg_value[i]);
> -	}
> -
> -	return count - iter.remain;
> -}
> -
> -static void amdgpu_devcoredump_free(void *data)
> -{
> -	kfree(data);
> -}
> -
> -static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> -			    struct amdgpu_reset_context *reset_context)
> -{
> -	struct amdgpu_coredump_info *coredump;
> -	struct drm_device *dev = adev_to_drm(adev);
> -
> -	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
> -
> -	if (!coredump) {
> -		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
> -		return;
> -	}
> -
> -	coredump->reset_vram_lost = vram_lost;
> -
> -	if (reset_context->job && reset_context->job->vm)
> -		coredump->reset_task_info = reset_context->job->vm->task_info;
> -
> -	coredump->adev = adev;
> -
> -	ktime_get_ts64(&coredump->reset_time);
> -
> -	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> -		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> -}
> -#endif
> -
>   int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>   			 struct amdgpu_reset_context *reset_context)
>   {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> index 5fed06ffcc6b..579b70a3cdab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
> @@ -21,6 +21,9 @@
>    *
>    */
>   
> +#include <linux/devcoredump.h>
> +#include <generated/utsrelease.h>
> +
>   #include "amdgpu_reset.h"
>   #include "aldebaran.h"
>   #include "sienna_cichlid.h"
> @@ -167,5 +170,78 @@ void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain)
>   	up_write(&reset_domain->sem);
>   }
>   
> +#ifndef CONFIG_DEV_COREDUMP
> +void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +		     struct amdgpu_reset_context *reset_context)
> +{
> +}
> +#else
> +static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
> +		size_t count, void *data, size_t datalen)
> +{
> +	struct drm_printer p;
> +	struct amdgpu_coredump_info *coredump = data;
> +	struct drm_print_iterator iter;
> +	int i;
> +
> +	iter.data = buffer;
> +	iter.offset = 0;
> +	iter.start = offset;
> +	iter.remain = count;
> +
> +	p = drm_coredump_printer(&iter);
> +
> +	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
> +	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> +	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> +	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
> +	if (coredump->reset_task_info.pid)
> +		drm_printf(&p, "process_name: %s PID: %d\n",
> +			   coredump->reset_task_info.process_name,
> +			   coredump->reset_task_info.pid);
> +
> +	if (coredump->reset_vram_lost)
> +		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> +	if (coredump->adev->reset_info.num_regs) {
> +		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
> +
> +		for (i = 0; i < coredump->adev->reset_info.num_regs; i++)
> +			drm_printf(&p, "0x%08x: 0x%08x\n",
> +				   coredump->adev->reset_info.reset_dump_reg_list[i],
> +				   coredump->adev->reset_info.reset_dump_reg_value[i]);
> +	}
> +
> +	return count - iter.remain;
> +}
>   
> +static void amdgpu_devcoredump_free(void *data)
> +{
> +	kfree(data);
> +}
>   
> +void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +			    struct amdgpu_reset_context *reset_context)
> +{
> +	struct amdgpu_coredump_info *coredump;
> +	struct drm_device *dev = adev_to_drm(adev);
> +
> +	coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
> +
> +	if (!coredump) {
> +		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func__);
> +		return;
> +	}
> +
> +	coredump->reset_vram_lost = vram_lost;
> +
> +	if (reset_context->job && reset_context->job->vm)
> +		coredump->reset_task_info = reset_context->job->vm->task_info;
> +
> +	coredump->adev = adev;
> +
> +	ktime_get_ts64(&coredump->reset_time);
> +
> +	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> +		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> +}
> +#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> index f4a501ff87d9..01e8183ade4b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
> @@ -87,6 +87,14 @@ struct amdgpu_reset_domain {
>   	atomic_t reset_res;
>   };
>   
> +#ifdef CONFIG_DEV_COREDUMP
> +struct amdgpu_coredump_info {
> +	struct amdgpu_device		*adev;
> +	struct amdgpu_task_info         reset_task_info;
> +	struct timespec64               reset_time;
> +	bool                            reset_vram_lost;
> +};
> +#endif
>   
>   int amdgpu_reset_init(struct amdgpu_device *adev);
>   int amdgpu_reset_fini(struct amdgpu_device *adev);
> @@ -126,4 +134,6 @@ void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain);
>   
>   void amdgpu_device_unlock_reset_domain(struct amdgpu_reset_domain *reset_domain);
>   
> +void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +		     struct amdgpu_reset_context *reset_context);
>   #endif

Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>

- Shashank
