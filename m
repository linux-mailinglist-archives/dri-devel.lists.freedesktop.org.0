Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC12A598CC8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 21:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5531510E785;
	Thu, 18 Aug 2022 19:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061.outbound.protection.outlook.com [40.107.243.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B288A10E0EB;
 Thu, 18 Aug 2022 19:44:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfBuFtjloB+FPC88NuLLd2JGsny9pxBxNYfF5PwoOJFDyNkYrjUzMntEq2s7f82sFCZN4CEBMd6ugKr5OVDgtkkF1ckF0WDulsYpqjYMC5u6B+URx9qTa0qTRAPoVD5GsSS8frGRaVgmS6aI11gZLBqo8vj1uU3p6DpsSQoDLq+YW+yrLef81Rhw0uBjXomoDDJIeUVSQuqG8ZEVgRnAf6hfC4/uhKeZYhPP2Az7EJwppuvvNVRhGkQB4jB7WsZacbqfIWMFuqbt8PFaJrAONRAq7Jm2wSUWlIAK2P6S3PZwYrPDmOsH9F0Ho7Tzoz9fK5sJGfxnxCAS/I9+1SoVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5lsBRnMxqvMyNjRtkqX3Q0Bxv+YmQnpOxsNKFxiSjY=;
 b=hYfn8/If6GJo9YXhcurnxZ13sJLHEJ9MeGMQzhPsvnVZ39gk2BGTRaFz/HPr8pFSh+O14bOIYf32vyr152pBcCxNgQ0EmfxD0DiCv2T+JKjibe+zkdmbMKHRifCjGgacuEEBGIrtUja2xOVa801TG404Oa5bbolZM/jkIHUIdHtjMQYatvguug3xRifaf6K3J/nETd9EJ3keVRsvbnx9yUwkn5tChNDSCpmy/aQeGSnbLxbLa98fvfyTJBZa5E3+Dla6ey0K1d9Xur+2rPDpw3WV9+7YV+s9VKwy+CNC58pnAf2S3d0b5ymgH7FnFz7PM2W9nem09Ad9tgrsSWUR0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5lsBRnMxqvMyNjRtkqX3Q0Bxv+YmQnpOxsNKFxiSjY=;
 b=n+CLvHANjoeXdUjSZdcbm+UV9Th0MvAYvkKTThhZt4GM0hcVuLAGL2vgHcXJAFvbmGeQjXq6XkahZyfAZ5/gt516nlYzbIXt8KKjNISE561fexqqYS0dRJzNjrdMyIbEVFuKHr1ewZ4dRT/3El+nsKn0no67e79hzev7KKUTOA/E+dbapfGQ6kwfqs2KUVMrxttVa4pSh/3Pxr8pLqUcTZ/yE5wOSD8VMa32ShjfQbgqxPrQTqC2+hTPn0URhyQ6p9hN4f2agBMkyAaaey1T5OTLe9pNgTi7hEArP1ydSz8ZC4tvLwWmbfDFFWPix3GmbF55mi3fD/UieDHeB1Gi/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 DM6PR12MB3562.namprd12.prod.outlook.com (2603:10b6:5:3c::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.16; Thu, 18 Aug 2022 19:44:05 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02%3]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 19:44:05 +0000
Subject: Re: [PATCH v3 17/31] ACPI: video: Add Nvidia WMI EC brightness
 control detection (v2)
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
References: <20220818184302.10051-1-hdegoede@redhat.com>
 <20220818184302.10051-18-hdegoede@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <12c58f49-835c-c247-f34a-9b2f439b8db8@nvidia.com>
Date: Thu, 18 Aug 2022 14:44:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20220818184302.10051-18-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN7P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::12) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e8f89ce-0c38-4b81-a8ea-08da81520213
X-MS-TrafficTypeDiagnostic: DM6PR12MB3562:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqXlIGTHc4b+R+4zxBMgHDup02es/gPqO0RGq0prrsGteMFmCcvj9Yc4u6D261XfAPGCPffD1E3MttGr0sg8rTh8bkyprynAb79ocFOUJGPsx4CrYx66eo9lYpHp4Ui4r7Zwl1Qxh/ARfTYZDHnE2as3nk2o9RvDJjC3oXCQ3I22XJ4he+lbcU1mGi94ui8EtJDJBTaBN7mJpD3wASvUt3lB7lDaRnjrUufXy51MmEaAq6OUHX2o346VZ9Ge7uvSoOaoIL7wrHJiWwSXubnAaFjf87NO3VIWmoZTmlr5KnLxiCGsTuDXCQM2l/S7PyaE+1fR/OjqYdsXGP2OhK7dUWlp8izgT7bmjtjBcqMJ8viqynXbOa/zqXzOW7AYtOj50FZENPgB8beTGmXc9NBtWILDNNmF0EXEcyAjrlkYVDyIF7ZcgiUFvFGfBYZ9+HFTXvMKo8NkEPM5vBSi9fO8vTwRBw29k0MEaPm9OKP9JBjUQyT+BTl4X1yLeBxP4xzyb45VzE63um0wM1/mFGkIH7SRK6CkreiISky6Eqb60QtxmKjZSPbImpG/LCEPgnR4QsTvCgSEjtLOwxbRNVczEM636aqkVIWqeIUlNlPHvMs4EjD9IlUvA9qRquMPvB4UM7X2Y2+fXDxRO9vU36vNxBtOALOHRvi3fHQysZcrJHDirmQ3jikSeaYzil0D9asAgnLmPAl83jxMyqWLSkIbc7LMTB2YXw+7BxLI2mKQ3GbMwSZVjiZ3Vus68aaxe3GHIRSGNiOJnLGLRw1lTNJYxcJ1WLDoJWxve8ij4mh6HZbp8CEanWPw5kP3VvMnytcF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(31696002)(86362001)(38100700002)(110136005)(921005)(316002)(54906003)(5660300002)(8936002)(66476007)(7416002)(66946007)(8676002)(66556008)(2906002)(4326008)(186003)(2616005)(83380400001)(6486002)(478600001)(26005)(6512007)(6666004)(36756003)(6506007)(41300700001)(53546011)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXNoSy82bFAxbEFuSUt5UGJYQ0pVeEhZWTV0eXN0YkJaRGZGWVl6aHVMRGhJ?=
 =?utf-8?B?VGFIQzB0MkJTd2lKWXVOcEJaYzBDZGlzcDRJWEZiWklBV0pMMVhyQU5nYVli?=
 =?utf-8?B?djI2N2tqYWM2UVdOUXVJanQvdHArbkVXOFdGay9BM3lJS2M0eUFtVVoyZ0Er?=
 =?utf-8?B?cjU4WmtoSWM2aXJ3MTN5Tk5XbnAwSzRYWXRNbnlkWTZCcEZKdDBoSXhEZnd3?=
 =?utf-8?B?aUQrcFQ3M25QSW5RTjBlK2o3STlzbkhzSEVyMWloMWcwWEpuZWwvcTRvQy9J?=
 =?utf-8?B?NEVhVytIY2s2bnpFY2s5SkRHQm81SStmTHdoV2kzRngxblEzd1pxL1VDTjdl?=
 =?utf-8?B?Wm1tQ3FOcUNibzF5Z2s4N2Z0VVpHMmJzRHA1MXMvSlZhWmRoZEt2Ulkza1BN?=
 =?utf-8?B?SDNPN2xOQW5TdW03UWxGbU1aa1FPM2xRdkhQV0lyVjlLQTJnakVnUjdsYnNP?=
 =?utf-8?B?OWpRUzUvOXg5dzZ2UXRtOEJxSm14dmZHR3Ztb2tFOVY3bGNwWTNweFVXTDB6?=
 =?utf-8?B?dUhmSnI0UXAvc0NObVFlNTI3OWtqZm5GNGRuOWczUXVxVkFOaUVlUWZBTkY5?=
 =?utf-8?B?NnNoaXkzNE9pejZ4VWg5WnYxUU5zU24wVkJqU3d2RU5CbGFGWmpyUWlQZ0h3?=
 =?utf-8?B?RnluRHN0Q0FjY0tmeXp3UjdPSHBpOUVzU2lUNUN4aytiU2cvaEFsWi9ZbTBl?=
 =?utf-8?B?V1ErUE1UNlMrdExwVnYwdW9XMVJCU2J0K3VMUTNBMVlzYU1XbmtMNzJiMHdK?=
 =?utf-8?B?VHlUUEhhcTlyY2xGODB2SjJFTk5wMHU0cUtkRFluOWZYREQ3a3hXNkZGZ3VC?=
 =?utf-8?B?T3lLWWtTejR1dnMxZWVvUWxZWmFKVzhSY0N5cmhmeFZtaFNYUGJFOEd2bU5a?=
 =?utf-8?B?LzhwLzJzTDFZU0EvYXh5dXhkbStubW9RRHlnME5MSEJSNjhqeWtiUkE0bWsx?=
 =?utf-8?B?cm5FcXhCVU84UVVYRVAwbTVEM1BvRUhRa1R3WjFOdUZUTTNTVlN6VXVtZ3g3?=
 =?utf-8?B?c294T0Y2b2NyZXlrQXhHbExCZUdoVXU5a3FqUGxhNDRmMnhVQVMwTGplaFM3?=
 =?utf-8?B?SktkRjNhNS92OXhGajVrd3ZvWU4vYlB0VmVZbDJyQ1pHMERCVlVpRERUaHZJ?=
 =?utf-8?B?VS82TXE1aCtSd2ttOGUzWHVZOS9iQTQ1cWlTNFZ3SUNxNWVPUW9WM3dIRWpm?=
 =?utf-8?B?Z3g3UTRMcWdRZlBnK2NIN0JxYzlWNHc4amhVK0lzVHJDdEF5Mm9lKy85K2JU?=
 =?utf-8?B?ZTExeTU0dTJHZTZkblZ3b1VuajhVa0pBUU5qMjV1anQxaDdxMGI3ejk2bmlJ?=
 =?utf-8?B?RVdxRnZOOEZYY2pQcGNpOHN3RWRiM0oxNXhtRlBLRHFucHJhck96UXBPeFly?=
 =?utf-8?B?K3p3R0Z6V2JMY1ZRN2FrSk40ZlYxT09RR0s3UVkvbVQ1dWpLNmE0T0drRVJ1?=
 =?utf-8?B?TUpHT0JXcmRzV0RvRlljZEFiTEdEazdrQTljOGpKSXJHemJpaXp2Y2oxTGxi?=
 =?utf-8?B?cERXVDBNZHRWWjErUWtGUmJwNjlrbDl6MWp5N29jODRhUDBRQ2wxS1ZXbGJE?=
 =?utf-8?B?VlJzNC96ekhDSXlSRm9NRTBXUnExWUZKejJYbVNJankwNVIwVUFKcmg3NER0?=
 =?utf-8?B?b1JSSnlHTlVUSTZ2Q1NpMWRwTWFFSytNc1RsVkszckVoUVd0Nm9JbjlyVlI3?=
 =?utf-8?B?MG91UVYyZDVQbWtzdWxQc2locHhqTlZnYXJpOUF1ZTcyemJrN0h6R092cE16?=
 =?utf-8?B?WUZ1SzJxWitlM24yNDF2QzFDaWN1RFI0Mjc5NXkyOENlTW1ucTZMRzN0RVlU?=
 =?utf-8?B?eU00MVFnZXN6Y210emlrTlpmbXhMLzlDcHZMYk1Zc2ZDSUw1S2poUUlCVFRy?=
 =?utf-8?B?SC84Q3dPVUMxYzBCWTZta29zeEJqQ1lYVDcyLy9RdGFhWlEyZ3QxbFVFUkNW?=
 =?utf-8?B?MVJYSFVTeXhJS1lJdHl1eE9GMllhaHRmc3g5K2VMZURCSEVvUEY4NmFVMzBz?=
 =?utf-8?B?Sm9LYnl0UlJmdEVTbnNxa3oyL1I2Y0MzV3pTa0UvUkNxOHhTYzliLzM4V0Ro?=
 =?utf-8?B?S0RFRHFObXdJTDJJNWpTblpVWnFxUmNWaTJtVU5xdmR1eGtnaGJVRWllRERD?=
 =?utf-8?Q?vx9EFHgw5p5FmRGU4egJ8Z0n6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8f89ce-0c38-4b81-a8ea-08da81520213
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 19:44:05.0209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUXvag2A3ijzLV/inp/Gvkg/XrsAYwIa0AvgqVCkdeP6qo+7xdZ3cUGbqfgg3ogC8EH4Llkl8SZR7FFDL8eX7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3562
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/18/22 1:42 PM, Hans de Goede wrote:
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
> index cc9d0d91e268..1749e85d6921 100644
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
> +	status = wmi_evaluate_method("603E9613-EF25-4338-A3D0-C46177516DB7", 0,


I think it would be preferable for the GUID to be in the new shared 
header file as well. Apart from that, I think this change looks sane.


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
