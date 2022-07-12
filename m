Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1D3572711
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 22:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE88295570;
	Tue, 12 Jul 2022 20:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBF394E81;
 Tue, 12 Jul 2022 20:14:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djJYiBje8ale8yy5tWadSoH0r0VpJcQGYjUaHaCiVt/F0ccOIAWA6TCG+MoHJU6FIZ03oVyh7cPGVu7GVExS4tWNwLxUWHyKfv9wgenZT0aVmc8aTUgVui47hEjxW54ViEZvPvwL/01Cc9sW795vqSsGWrmierw/V6iXdIuDjBqq/cYpHhRRbtsUNSBVn5QqVNpxd9gB+ZsP6gwW7xPJLnBmLFjeX7lHZ51Lcc8SmpaSQ37/1O/x5xdPnMoG1NSyw+YVDfgsqn5HKjbuNBNbCOSP4k+yuib/lU/K99lSa8Up9sO2K98fnOd5c1rbRiQYCe88ZwM0MwIOYe+y+0hC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUDjrfG8m/9DlZQhKotjmrDcoV/CJjHJ/z/Mf0NhsDY=;
 b=Uw519/8sKBODYG/evx2gxD4dYo/zYkIWGB1tk150Y+jzTLoMWsvfnKjlH/6y1O0kNZY6Lxbe8mAhq8VxeZtDmJUoZ01ovlX72balfdalKeMjYwQJB/86m5QvJVzuqg+Dsc1MRvcv+gn5hCib3cPv1Ds3TM4l/a5Dh8jCIDc2fKZCrB+i65gY08n1wTrJeZSZKQaNV4tKamkQV7fjQ5qsvJ2u8Cn+ycRFUUFTi9npXCTip9DC2+ei8Y94TMXdQo6HmnxvyLrQFMCBOCAUKgmFC8BIFBg/gNeudRYHI9/C1oamyJzk0HGSav3dpph8+/t+vRxjKAJbjYTuvYt5+er6+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUDjrfG8m/9DlZQhKotjmrDcoV/CJjHJ/z/Mf0NhsDY=;
 b=Sh9jGnIZ2vuZJoKTVxKtE7DvZvWXpKMLlRidutPAl7+4i9Pm54NDjSipr5+AEkBKOJ06v+UbSRqsi+r+pAzrlcBwY+ubJQieR5bRmcMW87kvL/dklnCeuUVeTWsUP/JJwQNHUGtwINl4AmUVgwZFtgKH8kEes6a6j0duekWmBs4cSzMEq8/hVT3DUMQNV25N6IIAcyDOG06KIhZY860wSfZlGvEOsFyCB7kgyHPNPdtWi5J3WJyfgNX1R+LRgA9nThGbz4A7m26B5cXBNX4mkiznnUkaX33EtrRVhLWM4pSVoei8QG0o8zzYxoEMN55GIQbsYNqguY9PQC4xJN8ndg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 BL0PR12MB5523.namprd12.prod.outlook.com (2603:10b6:208:1ce::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 20:13:55 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::d043:c95a:cf42:cff4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::d043:c95a:cf42:cff4%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 20:13:55 +0000
Message-ID: <8cde70e6-1115-9b7f-d550-52b9e3623c85@nvidia.com>
Date: Tue, 12 Jul 2022 15:13:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 16/29] ACPI: video: Add Nvidia WMI EC brightness
 control detection
Content-Language: en-US
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
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-17-hdegoede@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
In-Reply-To: <20220712193910.439171-17-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::10) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0952113e-10c3-4459-ee9c-08da64430bdc
X-MS-TrafficTypeDiagnostic: BL0PR12MB5523:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4VDpPNz5v73jh359mrHfY4tY7pcZ4F6xOiV8EZ2O8qFT30nHvJ8bzZUyc2bWKJJLVGy2xiJXivSAbdLilxzFFbNAPf3LfOw+Et2WXuurLOomnzDfwe6t1TmRQQ35iei1tIQcvFjUEfVO7ElntA136upsfdzBiopKUoXRs6rtKnC4FpD71D8Huog6oB7kU27perrl3oqtE9MLYZAWXjfz99+U0jF0PL8kaMzMhnJkkBHMfUWOohIRhIi2WC3miFRveiqRH5yc4nIGk6cUcBwnHi15Y6jP/yZheRoBYn72rFgsRX2Fou1iRB09qSaMgW3NTsnomkuwBfnYhlrZ2lysB7dovn9uy+JsT0ChkEs7bjfw0xTwEnF0MZjc0aOx3oFZ5FL6XmbC2z3qMX7hPxu115hl1m6Vka5rGBp5B7MZgEwKeKRmGLcDT9WF7kC0uMB6JlODSe+GIpEAB85I2aUgBPWYvp4SDYfmyoN3YsRKaaurmKKhu5gBtvBGuN8bF4sNKW2HNXi44Wb959Drqm3lNuT9nD49BFGiGktyfCWLSmoe6T6hUOR5jDfQ/BHI5gCFkeD2BXhJft44gsWSJyEhani02ZWbIr82NoQYbjI8VBEyfeHP3LCp+0hXqqvNqTtn9eMfJ4mJ0D991YZOAeafnjia4mXta1NFCLtC8uKPBjCF79e7CtcUsHafoV4igHFPuMBn8I7Cgd2qD7pkLzfjjOfZojQFWc1SD6kCe1c8G+gd4BorXcU3k6lUF7db7zKV+tFiv4J7Wsmxk9fmmDP7ZKKlT2sBW2aNVxFsMYKoW8I9AJW4mWRzsJ3/wxHbbJZ06EWrNuuguXPqkmpon9BOxbSCTXoy0l9p8/8vHsh+2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(186003)(54906003)(31696002)(4326008)(66476007)(86362001)(2616005)(66946007)(110136005)(316002)(6506007)(5660300002)(6666004)(7416002)(53546011)(66556008)(8676002)(8936002)(41300700001)(6512007)(38100700002)(26005)(83380400001)(2906002)(921005)(478600001)(6486002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVBpVlNnZVRhcDgvVXVBRm12QXFKcEU3d2cyR0FNTmNSbDdXRlFWZUNiSXh6?=
 =?utf-8?B?V05qMHprWjZMMFUvWFdFWkhiWkZCeXNubTRLYXBadk42RERsd1dkNFh4ckVT?=
 =?utf-8?B?ditlc1dJNGhmb24vODdPQjluUndIbHBuYW5oSVBGcTlmNmFKWUFYNzRTNGQw?=
 =?utf-8?B?dEJVTll0YWZ4YXNKNXhicUhoWjM2dCtyam5zczR0dWRFNDBGSmhuMlZLVzZQ?=
 =?utf-8?B?Uyt2aTVNS0IwQmMvRG12M29qS3c5WEtveHd4OXJtalpteHVINDFIdENXUHls?=
 =?utf-8?B?K05TbE9hOHY4Uk9iQmhPeEhsd3RrSjdLYlo2QmtKMmp6WTZ3cGxOejZ5cWxF?=
 =?utf-8?B?T2lwYzlaQXRJbVh2ZTdlOStSWGhoOEhIb2dlc1NvV2RvR0Z6NXE3UjRMTjFJ?=
 =?utf-8?B?ZHliL3hDMTgvYit3c1NKWFdKZnNKQ1kyNGh1ZzA5RVBLSnUzVUQxTnFMZTNX?=
 =?utf-8?B?NitnYnBHZk1zZkMrdk9maktHYkg1MnU1aE5wUHdOSzg2elo0MTZPK1lXRGZ6?=
 =?utf-8?B?NFBIdXFUanh2eXlxUm5wSVlMZGhCODhWbWNZN0VzaS9EU0sxMXlJZENnc3dN?=
 =?utf-8?B?NDQ0VFphQ0ZKSEczNzdWamFRaU90TDJKZ0gxb2JTWjRyb3ZUZVArZ1N4WVVC?=
 =?utf-8?B?bWZrbGcyTlAxVjF3ckhIQ1ZRR0FIYUUrWDNjTVNUd3BUMStTU0k1dGhOa3ds?=
 =?utf-8?B?bzYvOU9RdnhDa0pSc3pCMU1nSUFMd3pibVQ3L2pVSTBwN3dZTHBFYkhyMTBR?=
 =?utf-8?B?TG1XQmdQa21uMlhSY3BtQkEwR2J1MCtMRlIwQUNyS0p4RXFmemdUazJWMzhX?=
 =?utf-8?B?WE5Cd1k1N3F1YUpRcks1TWx0WXdabTB4a1lSQTJhS3Q0TU5yb09JNDlmZW5h?=
 =?utf-8?B?VVUvQXlOKzljd0lMY3FEeS9VbC9saTlqMUVsem9mbElyTjFjNG95ZDkwcmtk?=
 =?utf-8?B?bU1QTzV4NytzdExwd1dSaURHcXpncCt5Q3hTaXdWMDZadEdTL1BHRDhiemxz?=
 =?utf-8?B?dzFaaHJvUEF2c0djWEtZVzd5ZmltODBhOVh3c1NvOU42NkpYTHZsbGgrektY?=
 =?utf-8?B?N3hYQ1BTNzR6ckRMKytPR1VRamIwR3NpTzVwemp0cjB5eE9xeVYzSVFycjBh?=
 =?utf-8?B?bUZZWHhlczdySmp3MUNBWDR5emVQK0Q4b0FKUFJvelM5NjJSSFdnKy9FZHRM?=
 =?utf-8?B?cmR2TzRaWGxiL0dUSkczSXhyMGdub1hLYm9SZDh0UDNYYUoyM1ZoZkxNWjN3?=
 =?utf-8?B?Z3VSckppSGd2V0xBZHNPV3dFZll3YU1KQ0preGUyT1FBWGI5OUZDU1IxV0lM?=
 =?utf-8?B?RzRXMUh4MHZtanBvR2doamFNNllQcGwvaHovNkVmbmZQWkwra0w5cWF0eUpy?=
 =?utf-8?B?clZRQzNrMEsyNmxMWWllUm9nV2xsMXBvSEpLT0VWeGd0T3ZVdStFN0pOVVNn?=
 =?utf-8?B?U2d5MC9teGZybk9ieVdzWFFJQm1BRnRUaWs4V0RXYjdNc0dZQWFNNG11VUFq?=
 =?utf-8?B?T2RSMmVQQUhvV2RGaHFwVm5PQ24yNU1STDB6VDN5azNyS1lGbStSK3p0UHBY?=
 =?utf-8?B?aVI2dExha3kvazlDTC9uV09yS2VDYlFkWXZpWlJETm9rUmJrNm5Zb3NwWmJo?=
 =?utf-8?B?akR2VFQwM3ZCRVJPMzN1MUcxdFg3ZS9YQmJtcmllbjJreGxaRzFLV0pqQUMw?=
 =?utf-8?B?alZIbjZNS0M0bnlIUkJBY3dRNWFOdk0vaFlMY1loRlZON285QU14QkNIdXRS?=
 =?utf-8?B?V01Hd2RYYVlpNVJwczQxZEpLNi9JbUF1Szc4d3RyeGZuQWV3Z0JNbXJ0cTRk?=
 =?utf-8?B?UnpJOGtGSHMxOTlONVFlZDlOUThENCswb3cxSCt3clVIbmp4RUxxeFZjSEt3?=
 =?utf-8?B?aXN5a1Jjc3haRXlYOGNtQnFEdHE2MTNtcXdyRHRTUUsxWlZSNmdBNFNUaGgz?=
 =?utf-8?B?dmk5RFBGZE9QR1pVK0NGQ1RBRVZXdWNaM3RPQVdBSGIwNFpCdnNjNFhXR09O?=
 =?utf-8?B?SXBWYTNQSFZFeUl0Y3dKU2RQbmliZkhZMlFVVmFkMVRtRnBaaCtLTFBQNmpn?=
 =?utf-8?B?Rnk5R3NNQUJSRk5mNDlWOS92RkdNU1Bxbmx1RXNzSytvSG9udlFkVTdwQnhB?=
 =?utf-8?Q?EGREzZ/6Qzr2qadRSbAZGRKbH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0952113e-10c3-4459-ee9c-08da64430bdc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 20:13:55.2367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBkpxTyqrvN6ACR07yLBVRZFRYp4Oe5Qsj2aOrDJ2tmaSkdFzh6qOGEq8kjjDgrpEoCW30HNabsjKYsOjIaWfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5523
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
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, Hans:

On 7/12/22 14:38, Hans de Goede wrote:
> On some new laptop designs a new Nvidia specific WMI interface is present
> which gives info about panel brightness control and may allow controlling
> the brightness through this interface when the embedded controller is used
> for brightness control.
>
> When this WMI interface is present and indicates that the EC is used,
> then this interface should be used for brightness control.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/acpi/Kconfig           |  1 +
>   drivers/acpi/video_detect.c    | 35 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/gma500/Kconfig |  2 ++
>   drivers/gpu/drm/i915/Kconfig   |  2 ++
>   include/acpi/video.h           |  1 +
>   5 files changed, 41 insertions(+)
>
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index 1e34f846508f..c372385cfc3f 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -212,6 +212,7 @@ config ACPI_VIDEO
>   	tristate "Video"
>   	depends on X86 && BACKLIGHT_CLASS_DEVICE
>   	depends on INPUT
> +	depends on ACPI_WMI
>   	select THERMAL
>   	help
>   	  This driver implements the ACPI Extensions For Display Adapters
> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index 8c2863403040..7b89dc9a04a2 100644
> --- a/drivers/acpi/video_detect.c
> +++ b/drivers/acpi/video_detect.c
> @@ -75,6 +75,35 @@ find_video(acpi_handle handle, u32 lvl, void *context, void **rv)
>   	return AE_OK;
>   }
>   
> +#define WMI_BRIGHTNESS_METHOD_SOURCE			2
> +#define WMI_BRIGHTNESS_MODE_GET				0
> +#define WMI_BRIGHTNESS_SOURCE_EC			2
> +
> +struct wmi_brightness_args {
> +	u32 mode;
> +	u32 val;
> +	u32 ret;
> +	u32 ignored[3];
> +};
> +
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
> +				     WMI_BRIGHTNESS_METHOD_SOURCE, &buf, &buf);
> +	if (ACPI_FAILURE(status))
> +		return false;
> +
> +	return args.ret == WMI_BRIGHTNESS_SOURCE_EC;
> +}
> +


The code duplication here with nvidia-wmi-ec-backlight.c is a little 
unfortunate. Can we move the constants, struct definition, and WMI GUID 
from that file to a header file that's used both by the EC backlight 
driver and the ACPI video driver?

I was thinking it might be nice to add a wrapper around 
wmi_brightness_notify() in nvidia-wmi-ec-backlight.c that does this 
source == WMI_BRIGHTNESS_SOURCE_EC test, and then export it so that it 
can be called both here and in the EC backlight driver's probe routine, 
but then I guess that would make video.ko depend on 
nvidia-wmi-ec-backlight.ko, which seems wrong. It also seems wrong to 
implement the WMI plumbing in the ACPI video driver, and export it so 
that the EC backlight driver can use it, so I guess I can live with the 
duplication of the relatively simple WMI stuff here, it would just be 
nice to not have to define all of the API constants, structure, and GUID 
twice.


>   /* Force to use vendor driver when the ACPI device is known to be
>    * buggy */
>   static int video_detect_force_vendor(const struct dmi_system_id *d)
> @@ -518,6 +547,7 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
>   static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>   {
>   	static DEFINE_MUTEX(init_mutex);
> +	static bool nvidia_wmi_ec_present;
>   	static bool native_available;
>   	static bool init_done;
>   	static long video_caps;
> @@ -530,6 +560,7 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>   		acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
>   				    ACPI_UINT32_MAX, find_video, NULL,
>   				    &video_caps, NULL);
> +		nvidia_wmi_ec_present = nvidia_wmi_ec_supported();
>   		init_done = true;
>   	}
>   	if (native)
> @@ -547,6 +578,10 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>   	if (acpi_backlight_dmi != acpi_backlight_undef)
>   		return acpi_backlight_dmi;
>   
> +	/* Special cases such as nvidia_wmi_ec and apple gmux. */
> +	if (nvidia_wmi_ec_present)
> +		return acpi_backlight_nvidia_wmi_ec;


Should there also be a change to the EC backlight driver to call 
acpi_video_get_backlight_type() and make sure we get 
acpi_backlight_nvidia_wmi_ec? I don't see such a change in this patch 
series; I could implement it (and test it) against your patch if there's 
some reason you didn't do so with the current patchset.


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


I'm not sure I understand why the Intel DRM drivers pick up the 
additional platform/x86 and WMI dependencies here. ACPI_VIDEO already 
depends on these, doesn't it? If Kconfig doesn't otherwise automatically 
pull in an option's dependencies when selecting that option, then 
shouldn't Nouveau's Kconfig get updated as well? It selects ACPI_VIDEO 
in some configuration cases. (It looks like amdgpu doesn't currently 
select ACPI_VIDEO, maybe because it doesn't depend on it the way the 
Intel drivers do: there are several AMD+NVIDIA iGPU/dGPU designs out 
there which use this backlight interface.)


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
