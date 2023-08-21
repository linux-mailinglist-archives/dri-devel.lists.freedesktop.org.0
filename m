Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5AA782B88
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 16:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D987B10E26C;
	Mon, 21 Aug 2023 14:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D886B10E0B0;
 Mon, 21 Aug 2023 14:20:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDT5HrnJLE8O48x9qGg6voQaoYj7+UNra3yVQqbFuOj27VItD8oSWE2p0KUqUkbvZmP6HSJskh/ha8EPyqelEtEaIT6/EQvJeDxbiweISqv9bLntc9Rdqg8U2HTivuzFBpjj9oBHDpFyckDViin38o84vVFc/P8kACLdXHNQycdtLsQg/ppltroRzrSWUJipbMg7gvnyYilogg9nGjgFBEtJNBa6LGwKoZNW5Ot7cPYji7kz8IFESPTGsrU0fEcD3TX4DR6hkgRECUkac9w9jGDUy95bqt8pIoRkejCCvRNNh3fofLUPnFltXx1WHcli4VEy864cTMLPrJ+Xn3K9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haPtjxH0CJA9sxbCc7kWCoic2UZV2Xrn5Gsyk9L3X3c=;
 b=E9c0ZOwUI74Fqfv99vNln4lw4uZm1Hr5qXybJ6xV+WnLNsm/Pk6V1fheJVzVygYettSwCJUsEluyNTVln1V2fhEYSwTImpv6ZNnefj5xb46udsWktdvleHLI9IqMC/tUGXWCKE8uiIfbnb3c6f1FosyEmoQPQyMIzWZzqTuXMHBUbiN4lPyx1XnICfOaFWz/98ZCUUaWE3tOEc9ufo8CrjWS+nU9mAyK9mO8T1jeP5C9EEmNHuibdkv6I1NGPBXqpaJh71UCPoCQgMGwxKF6EO+6kc+xVq8li1AQuzV7X+lYflqHG9f2mKqlXM4n2d5lnb5AORtfjIjFXFiGo9/m7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haPtjxH0CJA9sxbCc7kWCoic2UZV2Xrn5Gsyk9L3X3c=;
 b=pwb3NGQDVREwjzvCgvlnJxEtEfgCqpCJvC+TzQNvM7/bzNyGU5IlwwoSbMz0TiAvzbPJoclYKltQliPNuSFDFwSMmZx5SPbkEMRm40n4fk3nPQnZ0ESkhz0omkLGK6TYhvfALI5i5VBrsc/frIg+TXw3hrCcOg57/A0GEGaD/+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 14:20:36 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 14:20:36 +0000
Message-ID: <5c070eb6-94d5-dc5f-764d-df48ad0284bc@amd.com>
Date: Mon, 21 Aug 2023 16:20:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 2/5] drm/amdgpu: Rework coredump to use memory
 dynamically
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230817182050.205925-1-andrealmeid@igalia.com>
 <20230817182050.205925-3-andrealmeid@igalia.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230817182050.205925-3-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::23) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: da72737d-4377-44fb-ec65-08dba251c68a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1gzlnPfVKB1tidh5lKO7qzKs9skU/aeMV99IFNBUtSb4FJPZgJ4+7DqzoEleQe0SAyTHetoX8Lof59wlfGi7HHXOtWWwmMntbRnlDY7sESVwaVlNtslgA2axO88+z7PJvNj+JtmJQXb39/3Zdg3569cuNeI8WsVEbMCHq0VqTB32X4LyutV4gYQ8Jd20IX4mzZmHjNe32Ek2Qb+oFVDxq9KpeDCREHMRINp4B1RsDsHZ+HvSATbQT603bR/Zb2/dnKda8d/QWt8SdWNiPaIm2nWpBCtr2Fz9mqFmBYQMlZmQvWLoTOjYBK4W2jqo8bvdi7qw2TeDw+PU5hkh8b4HSxMpPXx5TNtXq+U3q4QbWJeSmULiEZJeg9HpvY9ZxdLBG+5p8yo8Y5+c0RyJIhc1FKyCWRt24hTIFfphtmIzKEW0WBdwMCdwqTxs/fyVmHg63zANpb69tTUS6WfF2Sr8sqoqSF+/my7SS1sT5a9d8qnjIxgGPInIEFFrmQgMHpeOxWJK3WRNdsHUbXMeX0VnD5eqoD17/grATE11Z/ZmnR678qDa1d9pU0PGvErnQ7gcX7KTDbmELp6xyN5k7jR6fvQyh58zsHRSEE/vn9PPjuaD74ta+LvSgiqTgAnsOOCE+NVPu+a4GLLNswLMDnc7RQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(2906002)(53546011)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(44832011)(26005)(86362001)(31686004)(31696002)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(54906003)(66556008)(66476007)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFTcU81bURvNk1DK0kzbUxZT2owbmRxWEcwYk1RTWVya0Y4aHRyaWI2cWNj?=
 =?utf-8?B?WENBdlhRTmViZFFPelV3U3NGZmw2d3lZRGNWSmhKdHFaUHlKSnR5YjNWdmRX?=
 =?utf-8?B?Mk9FQ2RDMXhRY2ZpZXAycW9ZZmkvS3AxZTJrWFZhYlRzb3RQWG9oRUxCV0J3?=
 =?utf-8?B?OEdMR2FPZzJFYmJnN0x3M0hHUEdmM1I1MjJmb3RscEQrRHJzV2QxSExBSjlh?=
 =?utf-8?B?alhiUS85QmVzZkhwVHpUbEJYTkZZYlBDZmhkeWpLdkpyWWFXOWJWL3NYR2FF?=
 =?utf-8?B?R2dlb1hmOXc4V3Q2NVJTYllRaGVDSE9jUDBHV1BGUjBqd2NIK2xhOGVJUWFo?=
 =?utf-8?B?REluUEJqVVdGOVk5LzVLbkxqSDhQMFlya0lmN1g3ZmxsRFhCQzhWWC9MekJu?=
 =?utf-8?B?NU1rMm5tS0NMQTljM0dTSFRUWG54dTFzZVNtT1JjWWRuc3Y3NjRyUzVQTy9B?=
 =?utf-8?B?RE8xQW5iWTB0L0o0aG9DSkNXYXBZci9RMGg4SzR4d1NBak9RMjJiakFENVBw?=
 =?utf-8?B?OTNVNVlMa0l3NksybTgvYkswUHN6dGVTUk5TR0dxcGYwL21kUTNqd2dVZC9w?=
 =?utf-8?B?UE5yNWs1Umk1RjFNblp0MXYvc1FVak4zTE50L05weGJsOU5aME1HaHJoVDNR?=
 =?utf-8?B?MElUY1c3MGczWW5Vd1JHbElUY2RqUm9FbllwSTJxeWg1WW40b05yZENQSmlx?=
 =?utf-8?B?Um5TOWhBbXpMYVVIaDhaUElQUEx3eEZ6bjd2ckxZT0I4UVFBTFk1NFNRcVB6?=
 =?utf-8?B?dUZIcGhOSHFOOWNoeW4xTEJWNHRqZDdSS3IvN2NOenpydTRDZEtWZ2FJZGF4?=
 =?utf-8?B?QlR5dmJCbkIzeGFrc2FLR0FmKzdCOXVISEpaYU1mZXVqUnQyQWRHS2c4UkRD?=
 =?utf-8?B?WXBjWHk3dGUvMDdZYUwva0ZVTm5VaURPbzMzZ2M5TWVCM0ZMblliU0Q0dFg0?=
 =?utf-8?B?VFE5Ylp6RlB0KzBKbXpEU1VNWVN0L0dxWVRCNzJIUWdxMTJOOVNLSW00b004?=
 =?utf-8?B?Rm0wVkpDVkFkV1VoUjYzWXA3a3B0RzFienE0THJuVmFLT2hoT21BVzNSWFRQ?=
 =?utf-8?B?R3k4ZHpIRlZEK08zNUhYazJBNkhPVnY3bkYxNnp3clZSU3kwTUtLbmx4bjAx?=
 =?utf-8?B?R3VGeDU0TXR0NElaMUZsVlFDNVlOd2JpSEluWXhTK3RIc081QkpiQWJoYmha?=
 =?utf-8?B?M2J5NWhYQ3NNZ3dzdVk5OGhOK01VMDY5VEx4bG5ROEMveXpjWWc2bXRUbzk0?=
 =?utf-8?B?SmwvZFYzZmVuTHpzaU15UTkydXBLY1VreVRPQ1RqNW15VFRrcWgzUjhRb3Jn?=
 =?utf-8?B?aXFzZmpmRW40Y0FyelJOM3RaOHpTRmViS05qMWJITHMvaTBxeEpSeVc5S0FL?=
 =?utf-8?B?VERqeFpYMFpJenNBWmRDcXVhNFBMdEo0WFBEUVlyR2o2blYwLzQ2UUFweWhV?=
 =?utf-8?B?NEZxeDEvVm9Ga1M2V2R5ZTdPbW50M1BKVEU5OVFvdm5rSkF6dE5aLzIvNHlE?=
 =?utf-8?B?ak9ub0tLNXFtSmhYcjJsR254aTArV25yR1JSVHdGb3IzWGNKZEFoT0VWaU5M?=
 =?utf-8?B?Q2N6RmtxT2dsUnFTKzdiaFBqRGtBTnZHTTRPY1ZEM2k2RnN2dmVwWENwVHIr?=
 =?utf-8?B?YjZXQTdmTm9PcS9qMU1rRElFdE9nMEJpRzlBeHQxZ21ieG1YZ1R6K2d1bUo2?=
 =?utf-8?B?UVo0UXdnUmQvNWZ2dHA2UVltM2FqYUlUY2Z2c3JsZW11RG5UMnlJQ1hyRjl6?=
 =?utf-8?B?QWNia0l2S1R5dzZJSHRzZjNsOEZqTmd3ZUFpd3hHTHJIUGpYd0NyOTVHNHpY?=
 =?utf-8?B?aGVzNGpOeVg4Z1BFTEEwMmZnRCtqd2NGUjl0RE5kRUROZVpvQ1o3R1dsQTlC?=
 =?utf-8?B?RktBR2IrbFRPQjkxYi91RCtMbEQxVDAxL01GM1dkZ29aMmVGM2UwRXYwVmhL?=
 =?utf-8?B?RDhVYkF1OTNFNlRwY1FSS2FlM2FHRmU0WWlaTEZ3NERtbkNnNzhLdHRwK2Uz?=
 =?utf-8?B?djh5RTdkaDJ2MDBnRHBNbVp1N1NIV3hqd0c1OHVXNzhJT2dZRDcwV3VWcUds?=
 =?utf-8?B?dnFUQWJCeDJCTFo5Skd3bk96QmpqbHozdnVDYmZxZ29rTzRmNjhoMk5uY1Q5?=
 =?utf-8?Q?yiDddWownSdslUAmhwgYs3g/T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da72737d-4377-44fb-ec65-08dba251c68a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:20:36.1183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9n1+PYOSUkMGQeUsEmM6GGiy4VRFnRtjJHmG11RrjfZobajTTUVEvomZVwTSI3A8GtMpgOE5fUi/AzFFq/Klqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
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
> Instead of storing coredump information inside amdgpu_device struct,
> move if to a proper separated struct and allocate it dynamically. This
> will make it easier to further expand the logged information.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v5: no change
> v4: change kmalloc to kzalloc
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 63 ++++++++++++++--------
>   2 files changed, 49 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 9c6a332261ab..0d560b713948 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1088,11 +1088,6 @@ struct amdgpu_device {
>   	uint32_t                        *reset_dump_reg_list;
>   	uint32_t			*reset_dump_reg_value;
>   	int                             num_regs;
> -#ifdef CONFIG_DEV_COREDUMP
> -	struct amdgpu_task_info         reset_task_info;
> -	bool                            reset_vram_lost;
> -	struct timespec64               reset_time;
> -#endif
>   
>   	bool                            scpm_enabled;
>   	uint32_t                        scpm_status;
> @@ -1105,6 +1100,15 @@ struct amdgpu_device {
>   	uint32_t			aid_mask;
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
> +
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>   {
>   	return container_of(ddev, struct amdgpu_device, ddev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index bf4781551f88..b5b879bcc5c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4799,12 +4799,17 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> -#ifdef CONFIG_DEV_COREDUMP
> +#ifndef CONFIG_DEV_COREDUMP
> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +			    struct amdgpu_reset_context *reset_context)
> +{
> +}
> +#else
>   static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   		size_t count, void *data, size_t datalen)
>   {
>   	struct drm_printer p;
> -	struct amdgpu_device *adev = data;
> +	struct amdgpu_coredump_info *coredump = data;
>   	struct drm_print_iterator iter;
>   	int i;
>   
> @@ -4818,21 +4823,21 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
>   	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>   	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> -	drm_printf(&p, "time: %lld.%09ld\n", adev->reset_time.tv_sec, adev->reset_time.tv_nsec);
> -	if (adev->reset_task_info.pid)
> +	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
> +	if (coredump->reset_task_info.pid)
>   		drm_printf(&p, "process_name: %s PID: %d\n",
> -			   adev->reset_task_info.process_name,
> -			   adev->reset_task_info.pid);
> +			   coredump->reset_task_info.process_name,
> +			   coredump->reset_task_info.pid);
>   
> -	if (adev->reset_vram_lost)
> +	if (coredump->reset_vram_lost)
>   		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> -	if (adev->num_regs) {
> +	if (coredump->adev->num_regs) {
>   		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n");
>   
> -		for (i = 0; i < adev->num_regs; i++)
> +		for (i = 0; i < coredump->adev->num_regs; i++)
>   			drm_printf(&p, "0x%08x: 0x%08x\n",
> -				   adev->reset_dump_reg_list[i],
> -				   adev->reset_dump_reg_value[i]);
> +				   coredump->adev->reset_dump_reg_list[i],
> +				   coredump->adev->reset_dump_reg_value[i]);
>   	}
>   
>   	return count - iter.remain;
> @@ -4840,14 +4845,32 @@ static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>   
>   static void amdgpu_devcoredump_free(void *data)
>   {
> +	kfree(data);
>   }
>   
> -static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *adev)
> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
> +			    struct amdgpu_reset_context *reset_context)
>   {
> +	struct amdgpu_coredump_info *coredump;
>   	struct drm_device *dev = adev_to_drm(adev);
>   
> -	ktime_get_ts64(&adev->reset_time);
> -	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_NOWAIT,
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
>   		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
>   }
>   #endif
> @@ -4955,15 +4978,9 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
>   					goto out;
>   
>   				vram_lost = amdgpu_device_check_vram_lost(tmp_adev);
> -#ifdef CONFIG_DEV_COREDUMP
> -				tmp_adev->reset_vram_lost = vram_lost;
> -				memset(&tmp_adev->reset_task_info, 0,
> -						sizeof(tmp_adev->reset_task_info));
> -				if (reset_context->job && reset_context->job->vm)
> -					tmp_adev->reset_task_info =
> -						reset_context->job->vm->task_info;
> -				amdgpu_reset_capture_coredumpm(tmp_adev);
> -#endif
> +
> +				amdgpu_coredump(tmp_adev, vram_lost, reset_context);
> +
>   				if (vram_lost) {
>   					DRM_INFO("VRAM is lost due to GPU reset!\n");
>   					amdgpu_inc_vram_lost(tmp_adev);

Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>

- Shashank
