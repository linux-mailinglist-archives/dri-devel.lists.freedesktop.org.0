Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B25877F09C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 08:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8D810E18A;
	Thu, 17 Aug 2023 06:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CFD10E183;
 Thu, 17 Aug 2023 06:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFTwuon5ouWEQcaN77X/40j3JE2keO5NBIdkJylMN/nmzGzjnAfSozIFWPpU5ROT00KGwL48zPzQggVe6udIza4+usfSZ3iUQsXpk5sZqB3iHSrJ1WKc+P2FKL0pYj4lodzc2wcB3zadFBBYFZ8z4/1ClxOdGkYT/rdDLC+alkrlFWUvosUKyrT/ZjBEoRP36NtB9rW05EmnWt35xupnqcUPXk2dNic28ybZw/uwLc7nbWxenuHYRSua8ZXZ3am7+RP5/fvnZix1DZFGw1LIGLLr0g5tgM3Q8BqWguwct+qGUlebW+B+FPcVG2553TCWkXvinhSatH14OTvd6xXCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87i8VhHwe929pduBgZl3a+9K0ZIunDO0ZwUz/il3RVE=;
 b=i97FSqPTOi479ETI9X3nUpa05kIgEGLdH+y4PyUz5iWC7bmim0wYCzt1Qj6usPzYpdlenV3vrqiASSfjegVKjo+NZ9K2LehuTJKcjJY3H07U3mAq5K40hcy15Y5PHUuQ/TELdcJK2iwpFsEiuXwe8hFUQUtbt185uv+sFToCfgT819QSj7/iiwt6pd4O5nI/vcb3+dJTURSWv+zhBQsgZbwMi3A+4CAMCdkbzzFbjSoc4pATKtAEUIhbN2mSgCikwH0LOSeEfVlDwCk600L+lOGFZzZFvalWQu9YOj9F/Vq6MRbJILutt5ZpFpQ9azFUEH/+FYkqQVnXWnogBV6uZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87i8VhHwe929pduBgZl3a+9K0ZIunDO0ZwUz/il3RVE=;
 b=4ttyTAlvPy2hEUXxfro7byPNmCfSxshfbMseW2fO5oQtMShqJMGHpcrctLauTI3iygyKomNNdNu41hYbnMK3o6aSzf53zcHfJw6TTDq2XeaOvZF88MhmCkqyEDrQILKk6lNAynqi63EnIiY4P/Ge6BxnT2LzDKKSV5o2p+a1jCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DM6PR12MB4925.namprd12.prod.outlook.com (2603:10b6:5:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 06:41:12 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 06:41:12 +0000
Message-ID: <07ef59db-da17-15cf-789a-7f5d01b2c9c9@amd.com>
Date: Thu, 17 Aug 2023 08:41:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/4] drm/amdgpu: Rework coredump to use memory
 dynamically
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230815195100.294458-1-andrealmeid@igalia.com>
 <20230815195100.294458-3-andrealmeid@igalia.com>
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <20230815195100.294458-3-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BEXP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::20)
 To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|DM6PR12MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: 388e33bc-e5e5-4295-487d-08db9eecf25a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OhFFWrxP1m/DmPtPebdroYLK9xwu8FLxHiwiY3Vb7wCUfep9/F7ivYHTaPJ84nqqxjI1kyfF0qopYZCrjWmOtc5CNerFty35g0qiFlS9i2pcKQP3GdoY3cowX268mOJOsvSTvBOf1JEA4b/l4/XbIplEoPFz/eROk/zi1yoWAkFeLwyL93SvAZl18qa8e/WBZsMRyI2I8jTR2RE3OxQht1sJk0YDAGsWekmMnHhe0kPziHi1fjpgRluZIVW3KiGLj6fVsAQYf9ImUPuwF2IzCySO5+ipxVFvqSrCxPBGPvUM2RmsnoJE4e+er+sJSPuDo0lT2x38LpT0el68bJGg+Poy3py2cj5ICe0k7XY+FP7ClWfyx7WPBLKhP1HSNz23eQgoNXM1jl33U0vJ937D5/Yt0lwA50LjG1turOno/4i3cGt3Fz+YMAhAwSc7VXcKxJc2iyQmRxHi+Te+AJjGpDoz8h+1xrdalM+aN3PpWdxpLn2aUpG4bVKj0vkJIEkXrCpRYXrqTCgczty5QPs8yaFLEDb1cIeiCUZSa0Xlb1c4EEvVdGR4uSruxf65onBeMMvEp4EcZeErIB7149HHDcNneUtDJKEtIwPv3eB9wRa+eUayXb2/IsG+OUbCDz1SIGjU0nDPmrLlPkEy2cU9ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(316002)(54906003)(66556008)(66946007)(66476007)(31686004)(5660300002)(41300700001)(44832011)(38100700002)(4326008)(8936002)(8676002)(26005)(2906002)(83380400001)(478600001)(86362001)(53546011)(6512007)(31696002)(36756003)(6506007)(6666004)(6486002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE9yTnl4UWJsazJIOFBhWmdLVXBITHdvdU1zQzZUMjluaVdDVFVkcEs5L0lM?=
 =?utf-8?B?dFZ5UWFuVHJ1Z0xlTExMOVBzcUN3TDNDUFdqT1Vab0szcXgxVjVhWXVhNm1r?=
 =?utf-8?B?M3ROT0g2K21RdlcwOEovR3ZLSjVOSkRyUmRyOFpGMnNSd0FvZlY4dGFnOHkv?=
 =?utf-8?B?YUoxT0hHRXEraW1lMGpOTHJidjNhQnJ4UmVGN0pDS1JzNHNmb1V3clZCL1FL?=
 =?utf-8?B?L1VXY003M3ZGdXRhMHVOYmVmeVhkbEV4QXlDUE9MajkzUnRvNWhEWUNBZnB0?=
 =?utf-8?B?ZThoL0xELzVzeitvM1pHdjVwMENQeW42ZVh6NlN4SE9VMEM4MEpoQWx6RFNK?=
 =?utf-8?B?eWFxbE93VFdOOHJBWU1kbWIrNlkwSytpTi9YNi9CTXhDcFJjWFZyc0JGcGJQ?=
 =?utf-8?B?ZThLU3FVdHNrdGJtVFBYVlFqYUFMd0hpekh2U28yZFRJSnhRWkF5UStiMDlB?=
 =?utf-8?B?RitVanhpTkNrcWltQjY2VnNGZDA3SjBCSDBiSm5vSjZhVE1kcUE4aHBnbFla?=
 =?utf-8?B?M2x6YVBNNDRiSmxBN1pOTG9vQlp1NTQ2TGp1UVVNUFpPak9rOFhtZXozNVVV?=
 =?utf-8?B?ZGdzeXcrR01WYUFtckx4WGJBeHEwNVlmbGo3QW5sQTk1bFRpYlhBYWh4cFl3?=
 =?utf-8?B?aWQrN0crbUFuT3pQbWU5VHhReG9pRlBzRE85WXg2NWJ2WGhtT3ZwZXdPYTha?=
 =?utf-8?B?R3dkSUgvcEQwQm1Lb2VwOWpDbnByMEFHWUNzSWM0MFFPUkhheWZNcVRZRFV1?=
 =?utf-8?B?VmJkZTV4ODdaQ09lcmdtaHdMTnpoQ3FRNHBXWVEzVFd6dHZsM2YxQUtueWN0?=
 =?utf-8?B?WkFYNGc2WVVIWjVPbFNzcDFCQ1czVDBTRlRXZUtsR3pibTE4UktHVUVOZzIv?=
 =?utf-8?B?bTRmSXg4aGg4Y3dKWFREQ3VtMVgxbGd2NTlTdUV4SUZKdkN0N2l3bXpBTk9k?=
 =?utf-8?B?OFlHNk5xN3BCRHJWd2lqMXZhU1Y5K0dxRWZyUjJpRkpSdi9RRWk5UTB2RkRX?=
 =?utf-8?B?WThuemJHMDJPZmtFMDA0UkxwUTNkZ0FYSTJsanU4R0h0NWVpc2VKR1BCR0Y4?=
 =?utf-8?B?VThLTEcvU3FpeWNBdENia1JMSU50RmQrU1EwVnVVNVJKM2hsendmMWRxZDVS?=
 =?utf-8?B?VlltbzZvTURvTkVPRjZyM21hbDk3eXp1LzVDTldiaG9ZSGZrSllhdjIyR252?=
 =?utf-8?B?SHVzQ0IzNERFOHVIekhiVEhqWEFnSVpNYWsrQ2M1dVhHV3BCQmVvVjNxcitI?=
 =?utf-8?B?d1hIR2UvYlFLQlp5bnU1Zkd2SmZMbGZXNzRUdHJjSUJyY29QS1JnUTQwRjZU?=
 =?utf-8?B?Z0dyWDJENnZIaFRuWmtxMENzb3BBdjN0LzdRKzF6WExhcUgwZWxIejdQNDI5?=
 =?utf-8?B?dVNhWHVKR3JjQ25JeGxpRXdZNlZoUHVkVmNZWlVqVkRURTd5aTdScm1sK3oy?=
 =?utf-8?B?ZnRHMlV2ZHdxWlZmYTJtZkwrdkh4VTk0dDdUQXZ5NTNqQ3o2V3JWaWUwNndF?=
 =?utf-8?B?SG1QdVdiNG9pejZNQ2FSOTRoQUZieHl5QTRwbzBTemt1WUI0TEFyRE45QXBa?=
 =?utf-8?B?UXRjV0R1VDNMeVJXbUYxbU8zdzFjc3F6M2dhNVRDeWRzbTluQ0JwbXhNSjk4?=
 =?utf-8?B?LzNRc2o5cVJWSGcxWTJKZ3dMRzc3SU9VSzNQdmsvb3o0RXlqelVzZEJaaE90?=
 =?utf-8?B?REZ2NFhFZ2w2a3ZuYWc1c21JaFVaSlJOSlNzQXNrSVV4K1hLeHMrbnlyY2RC?=
 =?utf-8?B?KzFPUUpKcDdPcUdzang1cjlRRjh1K3ZVaVhQeUJQQ1dWdlFlU2Z6MHNUZEp1?=
 =?utf-8?B?TVE1cWExMldISm85eVdIcjdQaG5iSXluMWp5OURlWEk4WVJmMWdrNzM4NnhP?=
 =?utf-8?B?bVZXait5eENhVFRhaEdwTzJGdjNJcmlQTG9zRkhEdVpCWUI3ZVNWTC9vcmJv?=
 =?utf-8?B?R1Jhek51NXdGaU15NDQ4a1FHelk5dEd0YjRXVEZIdTVFQTRqZ0dHMlMwbVBz?=
 =?utf-8?B?bnpxMEY1dVRGaTZrcEJ4TzF2ZU1tY25hS0N5VWpIbjk4ZUxGNFhiU0t0bGpZ?=
 =?utf-8?B?QThPRVZxL2JORW1yamRML2h0QjJTMFhrblV4OWRNUm5YUzhpUkJ3RmtMblla?=
 =?utf-8?Q?0yixYYme2EEP09ZNpY1l9lf32?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388e33bc-e5e5-4295-487d-08db9eecf25a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 06:41:12.1432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMUM9udjd9MODaigE25bYRRtNqxuggIJ0LBeJz+Vj57pZ5mrcA6xHTfBEhwK983idIuoMoueJ9P6aAOSA+WHlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4925
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

Hello Andre,

On 15/08/2023 21:50, André Almeida wrote:
> Instead of storing coredump information inside amdgpu_device struct,
> move if to a proper separated struct and allocate it dynamically. This
> will make it easier to further expand the logged information.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
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

The patch looks good to me in general, but I would recommend slightly 
different arrangement and segregation of GPU reset information.

Please consider a higher level structure adev->gpu_reset_info, and move 
everything related to reset dump info into that, including this new 
coredump_info structure, something like this:

struct amdgpu_reset_info {

     uint32_t *reset_dump_reg_list;

     uint32_t *reset_dump_reg_value;

     int num_regs;

#ifdef CONFIG_DEV_COREDUMP

    struct amdgpu_coredump_info *coredump_info;/* keep this dynamic 
allocation */

#endif

}


This will make sure that all the relevant information is at the same place.

- Shashank

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
