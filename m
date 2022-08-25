Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312415A1C2E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 00:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64C310E452;
	Thu, 25 Aug 2022 22:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22B710E425;
 Thu, 25 Aug 2022 22:21:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XypPLCKszgYMSL2RARSXof36Dtj1y1q0EMBEtlN2eLvxTfsBmBMeeZVi2EOicpCccinAbBhH3g1JhOdpbZb4diVaKvmm0RaJhxpyfEH7JJ7OFpMuxLjoT6Cwckmz2jCz9j3yZbWvSLTbZPLB8wIW1pjraoyL0XTZb/4BLlQqepn3RhnIBBGAnqtpQ/ZMXTBJQd4tAJlE0zlb7oQTv+IO/dCq/LJZblMfJMaF9o7a8aGyjgMzRA6bL/ZHqHjfDqnEshGhJ0LgyUrhWeapwaK/9w43UIT392uiAzdBREDYXQEbF+b/lOv/HG/ZGRnaNWe+n3xHQZTvf5XRm2zl3mnn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtJOGodIXk6u8qY+FGOZ/+enxJrzHv3zoWOp4ruiPNg=;
 b=mwr/LYbhMbzztGZRfaaPFXnUDHonw5A8FaYjB3Cj0mU4EkkkfXbf26WIaZy85zmWVzK1kok2nfDLsKnkzpdIXKsl3nL/sgrqOSlxIjFWyxMaNxMDOnv17cU5EfrlkBPA4UUqa0WnKZHykf7gCvaaMrqK03Xp6ZaEUYrGNEG56SVz14F6jP09Lap9vdQIo4JAHrwKPRxtLm63IXvMOgKxJXZF7FcD+6kGXPm+/omwiapLS2CdxOSz8TDL47nAB76Zua0Mrk/NM7aEDOfpj6Y2p2LGegr1dpPIhD3DylrG8zeaOyuBNNCyYJCTvN3HSJmWhTFLsGmaup4qC3Mm8TphYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtJOGodIXk6u8qY+FGOZ/+enxJrzHv3zoWOp4ruiPNg=;
 b=MkJ0NMiHXzukXkgphjAWtk6BIVAGAynKEonA9UxIXNjKEqIJrLOZvTejnbqD9wBL8uhh6coJjZId1VqObCQtc9WWrO8DML4roNAGesEtV+kK9gqS4adSp3IuRKz0h5GiH4Ifw5FkiZZauM/ThGT8agEGKsBNsfcuVwK4GkCNolyEUWzvckgr9jZxXO/3hbPL7Jz4nlcCgluT8UvXvqiDSeTMTRoCaaDzHDuIYIcRW1VeFfsTk8uQ7vesPuZcMHBmIIsg3x+MfhiTjgb88BE2fR0EXv35sJoXUpTFF76Am+DIZo2sSeXb9mNn1ttYb0kRz1g0XGcDL1FcsMBMAF1uqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 MW2PR12MB2457.namprd12.prod.outlook.com (2603:10b6:907:10::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Thu, 25 Aug 2022 22:21:26 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02%3]) with mapi id 15.20.5566.014; Thu, 25 Aug 2022
 22:21:26 +0000
Subject: Re: [PATCH v5 17/31] ACPI: video: Add Nvidia WMI EC brightness
 control detection (v3)
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
References: <20220825143726.269890-1-hdegoede@redhat.com>
 <20220825143726.269890-18-hdegoede@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <a4d786a2-f2a2-fec7-df9d-18418c583301@nvidia.com>
Date: Thu, 25 Aug 2022 17:21:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20220825143726.269890-18-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN7PR04CA0051.namprd04.prod.outlook.com
 (2603:10b6:806:120::26) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 254e5621-d9ae-4df2-f24b-08da86e8263c
X-MS-TrafficTypeDiagnostic: MW2PR12MB2457:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pH0l1KFYmJT5dtY2FiPPcw6Z965k2NBF7z7B8PsINCVqejX0+pOmPOTonrhCHW+OfAk6mwtN58hx5sKeex/ERm1Ros272L7R47QShVumfLfBLnzEerzPvfrdCsJXi6V54O7lghyf+ZQGUo+UI6eOBKqMl6gDvl4U5aZkXn2wR58fGCSOzR3WSj3YjskLpwubDgcYaMVsx577LkIE/OSL2wCyWyPNro1w+/OE51ShB37eKlUGweHCToNPPcn05nGaPuVFdEJJemGqjpDlOxCr9dPQBN2B2jD1gtIHNWEV/QKaBciL3ZhYTWbn3SO3SM0eTWnMFOQpCy1aeQSJ3QTtd0rsZ+qfx/nKgu+oYrvkpF4kcP27kinpVJYvgApl99l7dT6bJ7yRVbZcn8wgsjK3bExEk6dgsUKxPfSIhRzt+f5aQxjKvAv1hAj1QGEhpYzH7/LVC0IdJ7ydQFnDNVwLaNYMezwd7A9LdsV58t5Q1Zy3ZpIiLJPrbwbysQ9lm0TDgiGDAxMzrrVI6h1iRBQS+L9fYu3tx/CUM5GlxYzm+ZsFjWQuJCIwK1w/LkQIbB5BFnssfAL4cdgrwMiU6cVGiCSAxCEIvEr8mhAp97j3BhqE3Id6w+wVr5NmaJsBsABAJHj1/HOcXMMEfYfwSgLuAVrFvDZvaL7S0xCC4D7e9clTRETlB+sPT3MkEcxJYxIIQ4AIZQ2Qi6vnO/4BmLFoop7K4Qjqy5sK16+LdZz0kPllaCT0lLg0eBS5EKMEwiPRBoArPpWv3MgTmkjv4xV2b2fC+z0DJPeBcM1s0SmVy/LYXh9SQiZT2HPj1eG/wGle
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(31686004)(36756003)(83380400001)(186003)(2616005)(5660300002)(2906002)(6512007)(6506007)(7416002)(53546011)(26005)(478600001)(54906003)(8676002)(110136005)(38100700002)(316002)(66556008)(6666004)(31696002)(4326008)(86362001)(66946007)(66476007)(8936002)(6486002)(921005)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0hLZ1ZFeFhQMFpwRkhreWR2a2d5cHhBclpPMUY1VTJ4NVpHcFFWdVJSN0xM?=
 =?utf-8?B?QUZhZmFEdzg3ZTdMelJ2UU9GbytpMVBWcGhYdXZDMm81bDJTclk2M2Jrbk9l?=
 =?utf-8?B?SnV4ZjdrOHJGUFNtNGJSOHpDdWtFZDRjdms5Q3h5QUswNC9vWDU5M2FlVm5z?=
 =?utf-8?B?OGxPQU1sdVR1MWVtbXpWb1ZJZ0Z4bG9ZYVpMTVJQZjNvNWFhQWVBaXdzZGFt?=
 =?utf-8?B?VzJENUxhUWRuMXBxMWtUMlBKRitxZm1VR2JmZ3h1TG90dzFJYjdNcjN4Qm5j?=
 =?utf-8?B?Y3RRUjh0NnVGZE4vMUtSQVB6NVdDMDVZSDAvcUlaNWFxSnhKVW1HWmVsMU1M?=
 =?utf-8?B?VFJxd1JSSFdFUWwvWGVkUXFQZ2RQQnRvVDVrMXFiZzlrdDdsRVZrSHRFN0FP?=
 =?utf-8?B?UTR4YlVoQ0VjeFpDV2lYQkFISXR6RTRIZVFxOUFRSVIxR3hnRXR3TWVFbVAv?=
 =?utf-8?B?bDVVSXBNejE3bFk0aThZaU9STUJtTEF3RlQ2Q0RXTTF4WXdkeU9MZDgzM2gy?=
 =?utf-8?B?SGc0anc2OGY3dyt3Y09PclA0NS9VYjdzMDlLdlBmYVJ1d3daSlJzUWo1a204?=
 =?utf-8?B?MnlIWXloRTQ3KzQ1R3J6QitvaW1qbnhTM0VrVHgrczZCdDN4bUJqZHA3SE9G?=
 =?utf-8?B?d1JkenpjdlZHZ2Q2VkE3aHBoZDhIbG1SRjlnclNLUVU5Z2ozcCtlN1NnMmJQ?=
 =?utf-8?B?di96SFdQTUZBZkpXM2NyUTFxTnE3OVR2YWlsRTVLcDZiR0pyMmNMdHZxMUp5?=
 =?utf-8?B?eEI1WGo3K0dldmVyWGtGT3poamEwMDQrbzl2ZktSbTFHc2MydjJ6bDJGRm1p?=
 =?utf-8?B?N016S0xSSlRqRnNNU25SdmJRWmxqU2NaMDZ0MlZQTUVPekowSkJLZHBsczMy?=
 =?utf-8?B?Tk8rRm9aUWViRGVwZHlFbHA3UXB2MjZIc3JtWGE0bHIxSmhpZlRrakVabGdN?=
 =?utf-8?B?RUNVeUpWZUFZZjltSmtmL05qdFk4S2krZllhdUlsZnFQbXNFekl4RFN6ZWNw?=
 =?utf-8?B?QXMwMVVvNEV1RHRBSGlCS0JXV21QUE10WHRubnZURy9lRzRERWplRzZwdytn?=
 =?utf-8?B?d09QSHk4K3VrSlQxYkhEaGJFcE1ZU0FRRklKTlJoYWh4NGowVVpTUDdpU09r?=
 =?utf-8?B?Z2NjRlBnZVJqN1ZpeWVWenMybVBoRGx5UDYweGNCYUJwQWtCK0krMzNLOUh1?=
 =?utf-8?B?SldFRFJEZEE5ZkVxWHIrOTJZRE1uT2REZ3AwVFhCVldvZ25aMG5xQUNwWFZP?=
 =?utf-8?B?SW9ZcENYYXdoSHY2RlFzOUVDUEMwSzVNVCsvWUo3T3pKa2M2WDM4SEpaZWVt?=
 =?utf-8?B?dVJXR25PVWxSK0R6bmxueHVBZ3cvRXNJS1ZiZi9zTW8vekVsWTc4MWozT0FL?=
 =?utf-8?B?eDlJOXVBQWh5Rjk0TVd3bmgwd1kwMjlpMzFsQ2t6Uk8zaXh2Q243U2xycGVF?=
 =?utf-8?B?MlkrTkg4bE5RSlB2bmQxQ3Vta2VQNHErRnhheFQyaVlCS1ZpUS9jQk9Xcmov?=
 =?utf-8?B?U240bE5TM3J0QnZhRzBjS2F2aFNGM3E2aFJBVkdINGpzYzloNW00REZ2Qzhv?=
 =?utf-8?B?VGFJanV0ckNtZDl4R2J3cDdsK1BDNTNCQ040VXVJMWZKY25KdklFTVJGZml5?=
 =?utf-8?B?RXlDbkl6YTBTYXE4Y0JpMW5FeE9iOEQ4aUdvZHI2bnNjN0ZOcS9mYVFHWUFt?=
 =?utf-8?B?SGZ6bUpZTFc2VnlyWHh3ZDNzdzJGZW5Qa256Rko4ZEVpUmM2dHNwTnhPU1N0?=
 =?utf-8?B?ZjRBWDkwUzhiMDlZQ2hveGEyV3hOT2FtV3RqbnNXNWRESTJSSm5Xb29hTWVr?=
 =?utf-8?B?SCs3QUN1RDJZUkVXRjE0YSsyOEM4T25COWxVZ1FpdGRFaTdWOVA3RURyTEZM?=
 =?utf-8?B?ZExZekNzbFB4ZFV0RG5sREZVcFRvZDJkS0RLekdPR0NkNzJCYVF2QTlZSWY3?=
 =?utf-8?B?bmZhYytvMHd2Z0lKUVlFSi9UaXE4eXloeVNlNHFtQVVJdTdmOTRPeEZJMEk0?=
 =?utf-8?B?cWxIU1UyM1U4WDI4UjJ6cVNFL2VEcDRHMkdxOFp6czRBQkZSRzFSeThVNURs?=
 =?utf-8?B?NlFKb1N4NTZGa01IZTVETlQ2MXM5QUN0ZnNLTUkvcTZTdlQ1eG1TS2RySlFm?=
 =?utf-8?Q?2y/VxD+zWil1BT11rVrcHmK5L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254e5621-d9ae-4df2-f24b-08da86e8263c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 22:21:26.0284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rqtg2E35Xzsu696GAS++x1n4qDI2IQIird3GQRfDYsp19sZFTHINM9Y8RAtHHLnBmsNDVb2dNkRLQtRHnqzgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2457
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
Cc: nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/25/22 9:37 AM, Hans de Goede wrote:
> On some new laptop designs a new Nvidia specific WMI interface is present
> which gives info about panel brightness control and may allow controlling
> the brightness through this interface when the embedded controller is used
> for brightness control.
>
> When this WMI interface is present and indicates that the EC is used,
> then this interface should be used for brightness control.
>
> Changes in v2:
> - Use the new shared nvidia-wmi-ec-backlight.h header for the
>    WMI firmware API definitions
> - ACPI_VIDEO can now be enabled on non X86 too,
>    adjust the Kconfig changes to match this.
>
> Changes in v3:
> - Use WMI_BRIGHTNESS_GUID define
>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/acpi/Kconfig           |  1 +
>   drivers/acpi/video_detect.c    | 37 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/gma500/Kconfig |  2 ++
>   drivers/gpu/drm/i915/Kconfig   |  2 ++
>   include/acpi/video.h           |  1 +
>   5 files changed, 43 insertions(+)
>
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index 7802d8846a8d..44ad4b6bd234 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -212,6 +212,7 @@ config ACPI_VIDEO
>   	tristate "Video"
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	depends on INPUT
> +	depends on ACPI_WMI || !X86
>   	select THERMAL
>   	help
>   	  This driver implements the ACPI Extensions For Display Adapters
> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index cc9d0d91e268..4dc7fb865083 100644
> --- a/drivers/acpi/video_detect.c
> +++ b/drivers/acpi/video_detect.c
> @@ -32,6 +32,7 @@
>   #include <linux/dmi.h>
>   #include <linux/module.h>
>   #include <linux/pci.h>
> +#include <linux/platform_data/x86/nvidia-wmi-ec-backlight.h>
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   #include <acpi/video.h>
> @@ -75,6 +76,36 @@ find_video(acpi_handle handle, u32 lvl, void *context, void **rv)
>   	return AE_OK;
>   }
>   
> +/* This depends on ACPI_WMI which is X86 only */
> +#ifdef CONFIG_X86


This could probably also provide the { return false; } stub which you 
have for non-x86 if the kernel is built without nvidia-wmi-ec-backight, 
e.g.:

#if defined(CONFIG_X86) && (defined(CONFIG_NVIDIA_WMI_EC_BACKLIGHT) || 
defined(CONFIG_NVIDIA_WMI_EC_BACKLIGHT_MODULE))

Although I suppose that would break things if somebody has a kernel that 
originally had NVIDIA_WMI_EC_BACKLIGHT=n in Kconfig, and then builds the 
nvidia-wmi-ec-backlight driver out-of-tree later. I don't know whether 
that's intended to be a supported use case, so I guess it is fine either 
way.


> +static bool nvidia_wmi_ec_supported(void)
> +{
> +	struct wmi_brightness_args args = {
> +		.mode = WMI_BRIGHTNESS_MODE_GET,
> +		.val = 0,
> +		.ret = 0,
> +	};
> +	struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
> +	acpi_status status;
> +
> +	status = wmi_evaluate_method(WMI_BRIGHTNESS_GUID, 0,
> +				     WMI_BRIGHTNESS_METHOD_SOURCE, &buf, &buf);
> +	if (ACPI_FAILURE(status))
> +		return false;
> +
> +	/*
> +	 * If brightness is handled by the EC then nvidia-wmi-ec-backlight
> +	 * should be used, else the GPU driver(s) should be used.
> +	 */
> +	return args.ret == WMI_BRIGHTNESS_SOURCE_EC;
> +}
> +#else
> +static bool nvidia_wmi_ec_supported(void)
> +{
> +	return false;
> +}
> +#endif
> +
>   /* Force to use vendor driver when the ACPI device is known to be
>    * buggy */
>   static int video_detect_force_vendor(const struct dmi_system_id *d)
> @@ -541,6 +572,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>   static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>   {
>   	static DEFINE_MUTEX(init_mutex);
> +	static bool nvidia_wmi_ec_present;
>   	static bool native_available;
>   	static bool init_done;
>   	static long video_caps;
> @@ -553,6 +585,7 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>   		acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
>   				    ACPI_UINT32_MAX, find_video, NULL,
>   				    &video_caps, NULL);
> +		nvidia_wmi_ec_present = nvidia_wmi_ec_supported();
>   		init_done = true;
>   	}
>   	if (native)
> @@ -570,6 +603,10 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>   	if (acpi_backlight_dmi != acpi_backlight_undef)
>   		return acpi_backlight_dmi;
>   
> +	/* Special cases such as nvidia_wmi_ec and apple gmux. */
> +	if (nvidia_wmi_ec_present)
> +		return acpi_backlight_nvidia_wmi_ec;
> +
>   	/* On systems with ACPI video use either native or ACPI video. */
>   	if (video_caps & ACPI_VIDEO_BACKLIGHT) {
>   		/*
> diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> index 0cff20265f97..807b989e3c77 100644
> --- a/drivers/gpu/drm/gma500/Kconfig
> +++ b/drivers/gpu/drm/gma500/Kconfig
> @@ -7,6 +7,8 @@ config DRM_GMA500
>   	select ACPI_VIDEO if ACPI
>   	select BACKLIGHT_CLASS_DEVICE if ACPI
>   	select INPUT if ACPI
> +	select X86_PLATFORM_DEVICES if ACPI
> +	select ACPI_WMI if ACPI
>   	help
>   	  Say yes for an experimental 2D KMS framebuffer driver for the
>   	  Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 7ae3b7d67fcf..3efce05d7b57 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -23,6 +23,8 @@ config DRM_I915
>   	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
>   	select BACKLIGHT_CLASS_DEVICE if ACPI
>   	select INPUT if ACPI
> +	select X86_PLATFORM_DEVICES if ACPI
> +	select ACPI_WMI if ACPI
>   	select ACPI_VIDEO if ACPI
>   	select ACPI_BUTTON if ACPI
>   	select SYNC_FILE
> diff --git a/include/acpi/video.h b/include/acpi/video.h
> index 0625806d3bbd..91578e77ac4e 100644
> --- a/include/acpi/video.h
> +++ b/include/acpi/video.h
> @@ -48,6 +48,7 @@ enum acpi_backlight_type {
>   	acpi_backlight_video,
>   	acpi_backlight_vendor,
>   	acpi_backlight_native,
> +	acpi_backlight_nvidia_wmi_ec,
>   };
>   
>   #if IS_ENABLED(CONFIG_ACPI_VIDEO)
