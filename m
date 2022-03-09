Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B664D2A5B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 09:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B5710E907;
	Wed,  9 Mar 2022 08:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AE510E907;
 Wed,  9 Mar 2022 08:09:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIZIl0IpeaX7QBrXfwttVr3rYGSDG/h++2grKX73CD/JiFL+PaJGIV8wowarenoGkE0UPQITO9ymoSIPYzTm6PCUiTixm3fJBGwAxpIU3hbzkZmWfrJ4JnhRZ15KaZpXkvjF4im6WfVXCYE3RILUx2fRc03F9RhRacdHiJZ/qc9OTUM3iR43tzg86CQTxtW4lEE9MF5+nl8I7A44XK96mCzu75hfpIzIWjNyZkQHTqthpTbAUTOJCvnRm1/fMPFKsort8BNNqPS6vkL9eXSHfGONKXFqL3jcLps7Zmg3RMzO9bS53VD5dDiKR2JAS7HA28Xtq807VwfItDtI6D60UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAswukRJhd/SAuH+MqLXfQ34qFItmWRtp1qrMnY1//U=;
 b=UfyPUfMxf7EQjf+0qMeifhlZ8VeH/9i1nrwp2y9un7/nkOLExXnSd57MQMcLlJihIzQKfLnkoD5SBc53uh7EJ18F2fgbhSGJuzvr+iBopADi0n9F51qLtY7FjR1AkyEwcWroxPbMtYbUiY4IeNWELB+zZ5Y7yDRNKIrBXZMp8Cu1Ufy2CAIrLUiRk3WTRx6BLl9RNEPJqUcoNOLe9uU6IaOwnXawLEU8wvThH+1lQxymsaxaV9aXe6qxF+1UCPENRrK8/VFMHPH6BiVV0V5Nl++c5sLJlpwW8DJ2t6k/+Qx1G/UGOH3T6BonEzizMmzGr84sCRYTBsuUauH/RBiOPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAswukRJhd/SAuH+MqLXfQ34qFItmWRtp1qrMnY1//U=;
 b=E2DsgKmK9/bWV/qpauuElS5TahBUA+MGzKi4QG9zG5reIuCxVjApiYEzSJ166HnEM85oKu6kOuPmmmmnVNriIH3jXdsRFVv+F/TOxNw15K1NWJdXiGg5d+I2qx9nY8kyJZJqzLv9OCWfTE+vt3fy5sNzjYuXp0wvI0c/7rY+KU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by DM5PR12MB1563.namprd12.prod.outlook.com (2603:10b6:4:a::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.15; Wed, 9 Mar 2022 08:09:10 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::d56d:98df:8ef5:14f1]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::d56d:98df:8ef5:14f1%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 08:09:09 +0000
Message-ID: <c2658705-0822-47fa-2a21-a292f0eb2042@amd.com>
Date: Wed, 9 Mar 2022 09:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: Shashank Sharma <contactshashanksharma@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20220308180403.75566-1-contactshashanksharma@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220308180403.75566-1-contactshashanksharma@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::24) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9626bd07-2106-4793-6520-08da01a4168a
X-MS-TrafficTypeDiagnostic: DM5PR12MB1563:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB156395FC9BAD9168AA9B3E5B830A9@DM5PR12MB1563.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t+5Cv8CrqJdHCzcledrkAklvnujmgq8AOIAC8EmJzYC22XczYn7ea5CsUu9q8grBKbToXrE8J6H9/cN6nQoBiKrOj2SQ1TylqOy6hvkXR7tSuV0s00UhEPJ/WoIqnxKwRMEAgvUCoYA55HOrTqB9fDskKZ0nYRWFYsI9QRZ/sH0Euer4jL5KwP4hp0KEzR6pr5Totpfsp+AbvV5ZjIvRnuJP7zOHAuyWVUO7MtTDX7yfxxVisseRKQ40r1dcKEtedtwOIss1xiufDfJyKybZIt4BiNnQIPEeX6l6j7gtzAaghNmzemkNLU1zyoLl0XDs1wWc+LAOKCdOzl7Ik148AgiiKLTOIYmiUFpT4Cmy3jlFOTUzcYJzVXC2VhXFkWL4pXSgU8zglBzOINboq3hQnv5PDghj39LvwSk9ZSxTKxWv57QcaEqAEh+X1QtBqywMeBons3/iurwQLxEjP8Eq8fh452SI04Gm8ATve4kOk1daG3jeShjHzFxFbLwGfsOm1ka4nyn9qsOiUNrgUM29bUSzsyegKkmsG3Oa9kWsbys6/TLZAGVj3uKT5QtC5qdScmUAvwMMGrJ/z/HPydxir83X8crAUVm3O9h1skhypdVX0Oyy8GUkpI/lKtFIVyK+eW7O96YUuqbu7g7gxIr3yam3vAvGt/KPLkvHiFSqpnZ4Lb4c0YIQ7fZCz42hEWgYXAaeaC//smb2Rg0oFm6Hw8C6LV2IBK7Kegnrtc4UfZkBHJB5xTiiAi6NeWh2lUw5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(36756003)(2906002)(31686004)(2616005)(54906003)(38100700002)(316002)(5660300002)(6486002)(6512007)(8936002)(508600001)(31696002)(86362001)(66946007)(66476007)(6506007)(4326008)(8676002)(66556008)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTcvYlNTUjZGaGEvSUEzdjNOZ0hWYzFwL3UrRFJTUEk3Q0ViYXhydUJXdE9H?=
 =?utf-8?B?aFJCczJjdzNJOTU1aDZVSjFYZ3BINzJpVjVXVkxCc1hiUjg5dGVCYWdkUnYv?=
 =?utf-8?B?KzNUaWQ1NG1kWUIzWkpqNVNyeEd3aUdKbVliTERERURZNTNvdEwvOHRiWFgx?=
 =?utf-8?B?Vmt4YlN5dWhqOWNSOUQ4VXNQb3ZRV1I0UzA3bFFrbWMreVNrbU1jTnUwU3Qy?=
 =?utf-8?B?NW1wc0hGR0NRTzVNN3I2ZnpOWkJIVFdOQTI5ZTg5dW13QWJqS0NwOUNvZERi?=
 =?utf-8?B?RGtXUSszRmRycFN6MXpUWGNyMTBEa2QyOGlQS3Y4MWVOYlBpMEFXR1BIdVdm?=
 =?utf-8?B?MUNvRE5aY3cwdlpBT2UwRngzWEZUOHdxdFVyNU5ZeS9jdkh0d1hMdmNudkhN?=
 =?utf-8?B?NkI4c0tYUkJ2V0JDRFg3RWFUZkcxNjgyTlJoMENFNFE2ODByK1ZjYmVPN2Ir?=
 =?utf-8?B?U0ZrN2l2d0cyM1NxbjQreHllTE13UXQ0RkRibEpNTlVqNnBiN05JSEJaQUtR?=
 =?utf-8?B?VTdLOWVRK2JXUXJDTTk5YU5sYUEzOWxuN2M0WnFNOHFkazhNSGpPTGg3Z0lW?=
 =?utf-8?B?UUJMc1IzelliTjIrWm5BN3c1RzFWOE1Vc2NhSm1OUVlGR2JraitOOFF4cExj?=
 =?utf-8?B?d1ArK0JyOVIyV254QTBJOUhJQVJQQk56MGNwYmpMa2YybWZuOWJzaGs0TVRu?=
 =?utf-8?B?L2V2UytDR2FCTEk5VkJFQ25QSElXZGJyYm5DYkdvZDVqRERWQmFOQVhrTXpq?=
 =?utf-8?B?NnFiN0xCRmRQRE9NYkU0emlLekRPS3o1VC9kOTFPWEoxVjJhUGRGQjNrRjJR?=
 =?utf-8?B?eHExc2dYbG94RjkwTkRCRUhDVVhXanBqbS8zMWdmU0p2N0lnSXN2NFlQdEUy?=
 =?utf-8?B?dzQyNVUxWldiOWVReEQ2THhVT2pqYjNuQTIydFdrQzJtNmRQR0F0TFZHYmQv?=
 =?utf-8?B?Q0ViVTR0bTlvUWdPVisyaUJnL2FLNmxFOXFJZ2d4dXJKaUZJVjRjU3BZajcz?=
 =?utf-8?B?V1pDRHhLMFRsMzIyYWVnRU41eXdlYVpCK3ZNd2doZVR5eWgxeEk2eSttTGVr?=
 =?utf-8?B?UlVlUm96SjZIR0NMZkhPMm1KNjZnMHNOZjRmaVhkNmc0eXVwV3Z3ZjhkOUpW?=
 =?utf-8?B?aFJZNGsyUVZxb3pZcWw3blZ4L0xjTkJ3d3JxQk4xeG8xVUthVFhHUHpRSG90?=
 =?utf-8?B?cllLdHdaT1BORmVBT0UwN2g2NXVaN09mS0tLVFJNY3NWbTRtcjZpWngzQzdF?=
 =?utf-8?B?YisrOUhGR1JBQVZJeGpGM3oxWHVXV1FwNnVGakE3cW0zQWs0R1RZK1dUV2xx?=
 =?utf-8?B?Ui84OS9nMVRkUEpoSU4vOURrR210S2xhY1h2UjF4dXlKQ2toOVp1a2gwS3FZ?=
 =?utf-8?B?TEZpTUFzSzY5VlRSYi9MQ09XaWRJRFJyQW9Cd0dVckhQcEN3M1U0R2p2ZXhx?=
 =?utf-8?B?QWFpQlMwd1IranZLMTJoT21QN0ZFZXlFdXJmcmgzQkQ2ZmZ3THF1K2dRTVNl?=
 =?utf-8?B?VEJUTzREbFV2ZDdaQWZJa3I5YTk4aHpwZnFhQVZJdnBndEdYNWFDOHhxd1h0?=
 =?utf-8?B?cEdLSWo2TWRXRW1ydHFVSjZtZFkxU25yc1JhWGxua2FtN21reDVxbkNFOFE3?=
 =?utf-8?B?YVVMdE9sK1FYazd4SC9xSFFVcXI1NExycEJhQzUrdXlNNGRCZEI3L3lGL0o2?=
 =?utf-8?B?d3V1Yk1LVEIwSkdOb2NiNUNoanRYNGlEcEdFWmVjc2lRZlNoUW0rWUZSZGZ3?=
 =?utf-8?B?SFdvN2NhTStObHEzWnFKNk5ETTNUbDQ5RDZWTlhyamFEeE1hOS90eU5VZnly?=
 =?utf-8?B?RU1NSmczWnlKY3B1RzE2d3RHYWpjQnJ0b2d2RkEwNUhzR241dFdWZmZ5L0ht?=
 =?utf-8?B?dUJTYzQzaGpibCswaG5aYTJQNEtjREdqa1NxeTJPUWxOVXdmdlNJNGt1Y01C?=
 =?utf-8?B?ZjhhTEs0dXdrLzE4b3Z6RHJzOUkrLzZCRExzaDRlU3VMZGNOTzJvdWNlbFgr?=
 =?utf-8?B?OVdtQTkwaENERDFrU0NUN1gyTTRKL2ZDQW1tdFJuNEdSbnJoUVFrWGtoa3pS?=
 =?utf-8?B?dVNXU2ppTU45ZUlLRjdBdjNOY0hCYlFxQ0RzQ1dMRzRsRXdpMVJGZkpVQXVi?=
 =?utf-8?B?VVA5L1NDcmY2UzJUSHhkbmRkTlg4UGI5VTZDSnZFY3FyQStUY0w3b05rZ2I4?=
 =?utf-8?Q?rIy/lJNERPXlsd6AOpJwBLk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9626bd07-2106-4793-6520-08da01a4168a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 08:09:09.4841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: we5uUP0A6BTDlPuXAZUVJ2slRtd7GGKOQXn4PG47D1cmnxKJd21FW7ivIiHNEEmi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1563
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
Cc: Alexandar Deucher <alexander.deucher@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, Shashank Sharma <shashank.sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.03.22 um 19:04 schrieb Shashank Sharma:
> From: Shashank Sharma <shashank.sharma@amd.com>
>
> This patch adds a new sysfs event, which will indicate
> the userland about a GPU reset, and can also provide
> some information like:
> - process ID of the process involved with the GPU reset
> - process name of the involved process
> - the GPU status info (using flags)
>
> This patch also introduces the first flag of the flags
> bitmap, which can be appended as and when required.
>
> V2: Addressed review comments from Christian and Amar
>     - move the reset information structure to DRM layer
>     - drop _ctx from struct name
>     - make pid 32 bit(than 64)
>     - set flag when VRAM invalid (than valid)
>     - add process name as well (Amar)
>
> Cc: Alexandar Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Amaranath Somalapuram <amaranath.somalapuram@amd.com>
> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
> ---
>   drivers/gpu/drm/drm_sysfs.c | 31 +++++++++++++++++++++++++++++++
>   include/drm/drm_sysfs.h     | 10 ++++++++++
>   2 files changed, 41 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 430e00b16eec..840994810910 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -409,6 +409,37 @@ void drm_sysfs_hotplug_event(struct drm_device *dev)
>   }
>   EXPORT_SYMBOL(drm_sysfs_hotplug_event);
>   
> +/**
> + * drm_sysfs_reset_event - generate a DRM uevent to indicate GPU reset
> + * @dev: DRM device
> + * @reset_info: The contextual information about the reset (like PID, flags)
> + *
> + * Send a uevent for the DRM device specified by @dev. This informs
> + * user that a GPU reset has occurred, so that an interested client
> + * can take any recovery or profiling measure.
> + */
> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info)
> +{
> +	unsigned char pid_str[13];
> +	unsigned char flags_str[15];
> +	unsigned char pname_str[TASK_COMM_LEN + 6];
> +	unsigned char reset_str[] = "RESET=1";
> +	char *envp[] = { reset_str, pid_str, pname_str, flags_str, NULL };

In general we try to sort those longest first and maybe break envp on 
multiple lines.

> +
> +	if (!reset_info) {
> +		DRM_WARN("No reset info, not sending the event\n");
> +		return;
> +	}

Please don't do stuff like that, providing no reset_info is a coding 
error and should really result in a crash.

Regards,
Christian.

> +
> +	DRM_DEBUG("generating reset event\n");
> +
> +	snprintf(pid_str, ARRAY_SIZE(pid_str), "PID=%u", reset_info->pid);
> +	snprintf(pname_str, ARRAY_SIZE(pname_str), "NAME=%s", reset_info->pname);
> +	snprintf(flags_str, ARRAY_SIZE(flags_str), "FLAGS=%u", reset_info->flags);
> +	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_sysfs_reset_event);
> +
>   /**
>    * drm_sysfs_connector_hotplug_event - generate a DRM uevent for any connector
>    * change
> diff --git a/include/drm/drm_sysfs.h b/include/drm/drm_sysfs.h
> index 6273cac44e47..5ba11c760619 100644
> --- a/include/drm/drm_sysfs.h
> +++ b/include/drm/drm_sysfs.h
> @@ -1,16 +1,26 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   #ifndef _DRM_SYSFS_H_
>   #define _DRM_SYSFS_H_
> +#include <linux/sched.h>
> +
> +#define DRM_GPU_RESET_FLAG_VRAM_INVALID (1 << 0)
>   
>   struct drm_device;
>   struct device;
>   struct drm_connector;
>   struct drm_property;
>   
> +struct drm_reset_event {
> +	uint32_t pid;
> +	uint32_t flags;
> +	char pname[TASK_COMM_LEN];
> +};
> +
>   int drm_class_device_register(struct device *dev);
>   void drm_class_device_unregister(struct device *dev);
>   
>   void drm_sysfs_hotplug_event(struct drm_device *dev);
> +void drm_sysfs_reset_event(struct drm_device *dev, struct drm_reset_event *reset_info);
>   void drm_sysfs_connector_hotplug_event(struct drm_connector *connector);
>   void drm_sysfs_connector_status_event(struct drm_connector *connector,
>   				      struct drm_property *property);

