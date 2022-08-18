Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DB4598D5F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 22:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CED410E622;
	Thu, 18 Aug 2022 20:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1A710E2A5;
 Thu, 18 Aug 2022 20:07:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+hrpLoUdiemQTW1/zyUPy411eTyhRAeSD7ClTaYfMZPUGNDZ+UO0cqiqEUyrRl8LsWDfc2Q6I0E7lQMT3OYkWlet4ToEBKvQzZnVYgQ8n93rdIISndpeKr5l4EnvxPLyA8TUJUfeGGFn123IGFhcZaaxt9HYk3T5dB5R/iw363XWZ61SrIe5IVHfruVBJJOLkiN1LrVm2drbgBE+Jx78VtKVF+NokUJOhS7JjvhdEOlO0xbGdI756oVEeqxw+nYwFbWCTvOMjoUjmNcsUnZ4Uqg8tNIZoihSu7NW6nBeHTYMW8YSNgp4BHsfbjEJtk76hHdb2BGsE87m9L+6eJ1Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiT4Or1gdW1aTRdBd32veGESwwAtVr/W27ag3VMlre8=;
 b=knEd3xyA70syDori05AUOVrVewH3ks2vo0KgFcPfFvO8vE30A5fGaLFaTqoq7Al3TQXAGLOZaFur3OQ0CmCygnTr0lhepVRhUZY17SCtARG8Eqr0i31OWlal3rg9L7qWYAoGl+3KrPILqXcvgzUqkCHH2R4XW3bpGW224qmib3t8XreuGjr4/OC0MzUz2n+GYDfxXGJIJUcp5Jzws6TmTaUUeWr130zyxnvXJf6j/l/Iu7vrWkg9Uevsr338NFkuxNTQLu1+4C6FD1I2ItMlOIVPyqEW45MCT/RLumvJOi/5tz3mgso+4GIOjU3FCDuXRw58HbZ8mgF7mZ7Q20yZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiT4Or1gdW1aTRdBd32veGESwwAtVr/W27ag3VMlre8=;
 b=ezX15m7cDQTEgNXMCI1bpxY9xRPt/c6vM26ReinX1BI0NsM23DKULxfyx0PMYzN2wuPdpcdm2ZGIURfJGJLoNcMxGam3cD1bLq4KkZQQIqeySs0ZC4UDm7mageWExLiWOBnuJ8ujV3RNSrEV+mWoNo73yJrEnIQ0DIPEkf9KMybxO7R9oUdXMddD2epaBNoyzB/WXLfyxz+BTrOK8dUWTUuHRL2yit4gCLmcxEtsiDMcDX7rZuK0hTFVUbRECbt7Dq4znL4IsxvkN9FUqWQDdAYTCwxf10qLrjsm/Qk+FZ8rZKDl9O2DeLsHZJ3l0hU+aUAytT4y3BjS2yXzA+S/qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 18 Aug
 2022 20:07:52 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02%3]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 20:07:52 +0000
Subject: Re: [PATCH v3 09/31] ACPI: video: Make backlight class device
 registration a separate step (v2)
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
 <20220818184302.10051-10-hdegoede@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <b177636d-bc68-cd25-4a28-8131ef4625fe@nvidia.com>
Date: Thu, 18 Aug 2022 15:07:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20220818184302.10051-10-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SA9P221CA0027.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::32) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e466b45-4d2e-48e8-19fe-08da8155550d
X-MS-TrafficTypeDiagnostic: MN0PR12MB6079:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 281cgpfCA6v/PROI1wKvmJXqKNBq4MPhhcN8CT/6FRVqun4AGwC/wJUxXophwkKtoCNw/41NsDNkRi3NDfYJvBDh9u0sd4OrE5/PORiRWGatN9bqlENMZs36MvBuLC5/YEJXF/r2rfoRa6vP4hF1gvo2ltCIiBPw8MKYaVb45MOAORhQamkDjG8RdGnSAGNY14WmMAbVVs7l1hmT0Npz6bFR3proCLvYe8GzI1dhhg60L7aQFFiAn3bh128RABavVj1OTljSJBA5h6GwV6x+rv8Lr6l0ub4gvW/s5pjcrtPczomA+8Ez7dBvxkwLX43Z7mvPnQq3+RWDjKtxd36VPugViatJirolYSbkQSbutbjxyLzKzF/C8WYT15lxioi38C/pr/3c6v5Dp1Q3MSS+yGizeuEWTLKtEiXDC7K+7VlLSFKhzZLVLpaGtm78AoI4/oOXj8xyogvVG2Kc5Brtca2alAFoRsLMg/Z62lFHNUvNga3Eh9+aukY+Wx3WRCfiRva8R2XmZVG8bzFfXXaXW8MP/RtIY+HF9q2L+cvCwD1jm31gNDxebG+MGSJsplFV6Av7WdEC1uWPgPs9niTuRjZ1LdhbOylFRLl3jIc59+Ied6tq7zOQJEMYTq1DcrSx1DeJpNXCMU0L+rMtckxqIsaQ/s8VNGjpb648Yp7zewxwYbr/tCOW4bklxmd8ShEOSa6giQqOnZv4yKJElNSmlUHy9eFwQnxPpQqjGbvYzbUcmZsGHdCyANRmd/eXz3mcNFqPr8GWu78qr6ZXWC0QoTK1A2ZqBkdi0qgMDVblWVcR5SlKCZdItS1J6SEnY5EK9OhQ9lbWKzHM5Xr712wb5uJSXWRyVf1Lmc3t9RCyvdobqMtVaS3Zo7s7p3RhaOi0gD3eDK61P3MSOb2oOFOWWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(6666004)(66946007)(31696002)(6506007)(26005)(316002)(5660300002)(66476007)(110136005)(38100700002)(86362001)(4326008)(66556008)(54906003)(8936002)(6512007)(36756003)(8676002)(53546011)(41300700001)(921005)(186003)(2906002)(478600001)(7416002)(31686004)(2616005)(6486002)(16799955002)(83380400001)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWEwaE1jMitZK3FvR3BoVU9Dc0FwTTFtQWtNdVRwcmpxam9VTEptd2JhS0xa?=
 =?utf-8?B?SFlWKzFKejBMdDY3ZyswSUF4bVZtWk1DdEdXM2xjUSttNEV2SjdsWXlWMXI1?=
 =?utf-8?B?bmRwZ2dneHhKZTIzN2Y2RDZSRExrY3oxZmJWb05qTFB3cXR4Zk15aVZCS0NB?=
 =?utf-8?B?QmNrWlFMUFpRNVJqQWo4QTVqNzIyVmM1ZXRjTEJVVEpiK1lyQklONU9TY1ZD?=
 =?utf-8?B?dTNWZTlhSWM4elZGT0hwdFYxaDZqbU9TU2RybWJuZGgrZGxYVWFISytTZGxG?=
 =?utf-8?B?SkxkRGg4bzRhUkJhSWpKUmlBQzN3MWdnSTgyOFJLZzkyTnpDeUwxRXdpTXNx?=
 =?utf-8?B?cG1nNE1qR1RST3pjNFd5b3dlSmdGQnluQTdXMElGOFFkcndtaEZpNW9qYk5B?=
 =?utf-8?B?aHdJRDNNZGNwRUljVUE1ejNFY3U0VGRrT3VLOVR1Y1JrYjhTTmYvalhHWmhv?=
 =?utf-8?B?cUtwTlY4YjhpSk0xUGpkVlU0SkVkdmlFQ1hGYzVtT3VDUTRaeThTZXphUDhQ?=
 =?utf-8?B?N2lCRjhPVGZZNk9UdkVrQ0VjTDRHUmUyVnBhTHZiNXc1UHdFNjJONHN5dFN1?=
 =?utf-8?B?bEJaSTNwUWVjV0h5YzM0cC8rTmdEZUwzWFNMVDNuR2tCTis0TEZQK1JXcUJE?=
 =?utf-8?B?VFM3Y0JsQlh0WUdKN2lNdnRncFhrUkl3a3VoeENxQVJuQ1BPYkZ4SWNmUXRQ?=
 =?utf-8?B?NXd1QzFjTzN1eVRySzVwZ1I3VnozbXQyNHJSRnBTQ3E0SkRpUVpUNjJTcWNO?=
 =?utf-8?B?TnhnZG1QcDVQQU9iOS9nT3EzcSt0RkdIY2FBcHhNQlpEM1RkK28raUFnbHNF?=
 =?utf-8?B?NEl3dGpXODZGMnlLOVlpdzhSMi96L3VMV0FjR2ZrTGRNWlEzUlAvMjMwMjVG?=
 =?utf-8?B?STErYitKM2pocFJpTzAxUk5DQjlQVmVJQXVKNUIzemtYaHBwVjU4Y1dJc1NO?=
 =?utf-8?B?RmJwbVZ6RmFXdWlpK1pKUnZWMGVUeEcxeC9KdXdJYmhUNGFZM3BLK2krRGcz?=
 =?utf-8?B?NVpjNml1RXUxWDlDVU1BcTBaMU1ib2NZNkcybHBudStlZ2ZJM291UlJsV0NZ?=
 =?utf-8?B?Qnc0WjZyQUExUWV4YWNMMVlLV3I2Y25JNlNMaWtSR3kxZE5hVkdSNXFTZitD?=
 =?utf-8?B?QlN0UjZFOUZQY3NieWtMR2ZiSnNLYVJrZGZ3S1I0aUUvUkpHTUI4WlkyZmU5?=
 =?utf-8?B?cFcwVEZ0Y3oxQmxhNkkwUlllOUJpbWpWaVprYnhMYlFadXpZcmdpLy9uYUp3?=
 =?utf-8?B?S0pTVEZmalBCaUhzR2UyYzlpaTRQbzBPUUJRVUNNVnUrVlFxV2xvT3NMNUw4?=
 =?utf-8?B?RjlJemZ2WXUvdkZyK1RHUmhmaVViRXR5Y0x6ajF4ejEwMWtHL3RoRTRvajJ0?=
 =?utf-8?B?L1duY0lEN0RSeWs4aTJxRldaOHRlcE41NWh1cGdrVXI4NlFVQS95dUlneSs2?=
 =?utf-8?B?SVQxUVVzS05zZVM5MU1LTzFxbHhTb0FOc0k0aWtiL0g5d1ZpTHRQaG5XWnND?=
 =?utf-8?B?cHpNOGdtZUUxbzNFU3lVR2Y0eStXa2ExK1lSZmJhUW8zZDFHaDV3TGFZc2tl?=
 =?utf-8?B?NXdaOXloVHA0SGhSTUdRVWs4ZTR4Ym9RRnBxcCtvY25TM1c2dldJa3FacXF6?=
 =?utf-8?B?RThBTHRJOVRLSVVzNmNTc1hvdUErR3hGS0haVGc5Rlo5L2RBSGZ3SWtPYkIv?=
 =?utf-8?B?Tkg5L2hiNk9yOXFpak9kV3pPalVZdVdKU0Z4YkpMOU4yeXluYXNROHl6OGww?=
 =?utf-8?B?VCtNd0Y5U00xR1hZRE9DQjhBbGY2VFdXWXBXdE9ocUxISXJkbmRJdldIZllL?=
 =?utf-8?B?K0g2QWZ0T0ZmTExuZWJiRU5KTE55M0doVi90K2RISHRzTUdrellncDJhVHI0?=
 =?utf-8?B?N0hXazF2R3ZYbVFmbHNxS0lxSG9xV25iVUplTHA4TWVDLzQ3ekhHcnl5OEI0?=
 =?utf-8?B?cStQa2RSSEtIOXRQR2h0VDZTUVRPZlF1ZU9iOW5naTNKUmU1VHNnQXRhZUxS?=
 =?utf-8?B?T2UrdjZLczZ3QWIvMHVVRkIrRWhBMXlhU05lRnNIaWgwY3Z2Qk9NWC9qWHFV?=
 =?utf-8?B?K2w1SWlqS2NDaUtPODQ5Q01XSlpNV3J5R0ExLzZVRFpaZFVZNVZKYk5hU2VU?=
 =?utf-8?Q?b8sN5L0b+MfcTN22wPQ/S8SXk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e466b45-4d2e-48e8-19fe-08da8155550d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 20:07:52.7502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RejiDhdShmOR89kGDRVR4mOKq9o0HSXfdEhKOh0nivkA/LjBj2RjiwRtd5IKQC01KaVwPAca1sbFJYCGBAh2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079
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
> On x86/ACPI boards the acpi_video driver will usually initialize before
> the kms driver (except i915). This causes /sys/class/backlight/acpi_video0
> to show up and then the kms driver registers its own native backlight
> device after which the drivers/acpi/video_detect.c code unregisters
> the acpi_video0 device (when acpi_video_get_backlight_type()==native).
>
> This means that userspace briefly sees 2 devices and the disappearing of
> acpi_video0 after a brief time confuses the systemd backlight level
> save/restore code, see e.g.:
> https://bbs.archlinux.org/viewtopic.php?id=269920
>
> To fix this make backlight class device registration a separate step
> done by a new acpi_video_register_backlight() function. The intend is for
> this to be called by the drm/kms driver *after* it is done setting up its
> own native backlight device. So that acpi_video_get_backlight_type() knows
> if a native backlight will be available or not at acpi_video backlight
> registration time, avoiding the add + remove dance.
>
> Note the new acpi_video_register_backlight() function is also called from
> a delayed work to ensure that the acpi_video backlight devices does get
> registered if necessary even if there is no drm/kms driver or when it is
> disabled.
>
> Changes in v2:
> - Make register_backlight_delay a module parameter, mainly so that it can
>    be disabled by Nvidia binary driver users
>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/acpi/acpi_video.c | 50 ++++++++++++++++++++++++++++++++++++---
>   include/acpi/video.h      |  2 ++
>   2 files changed, 49 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
> index 8545bf94866f..09dd86f86cf3 100644
> --- a/drivers/acpi/acpi_video.c
> +++ b/drivers/acpi/acpi_video.c
> @@ -73,6 +73,16 @@ module_param(device_id_scheme, bool, 0444);
>   static int only_lcd = -1;
>   module_param(only_lcd, int, 0444);
>   
> +/*
> + * Display probing is known to take up to 5 seconds, so delay the fallback
> + * backlight registration by 5 seconds + 3 seconds for some extra margin.
> + */
> +static int register_backlight_delay = 8;
> +module_param(register_backlight_delay, int, 0444);


Would it make sense to make this parameter writable from userspace, e.g. 
so that it can be set by a udev rule rather than relying on a riskier 
kernel command line edit? Then again, that probably makes things more 
complicated, since you'd have to check the parameter again when the 
worker fires, and changing the parameter to a non-zero value from either 
zero or a different non-zero value would be too weird. And making a 
separate writable parameter to allow userspace to turn the worker into a 
noop despite it being enabled when the kernel was initially loaded seems 
wrong, too.


> +MODULE_PARM_DESC(register_backlight_delay,
> +	"Delay in seconds before doing fallback (non GPU driver triggered) "
> +	"backlight registration, set to 0 to disable.");
> +
>   static bool may_report_brightness_keys;
>   static int register_count;
>   static DEFINE_MUTEX(register_count_mutex);
> @@ -81,6 +91,9 @@ static LIST_HEAD(video_bus_head);
>   static int acpi_video_bus_add(struct acpi_device *device);
>   static int acpi_video_bus_remove(struct acpi_device *device);
>   static void acpi_video_bus_notify(struct acpi_device *device, u32 event);
> +static void acpi_video_bus_register_backlight_work(struct work_struct *ignored);
> +static DECLARE_DELAYED_WORK(video_bus_register_backlight_work,
> +			    acpi_video_bus_register_backlight_work);
>   void acpi_video_detect_exit(void);
>   
>   /*
> @@ -1859,8 +1872,6 @@ static int acpi_video_bus_register_backlight(struct acpi_video_bus *video)
>   	if (video->backlight_registered)
>   		return 0;
>   
> -	acpi_video_run_bcl_for_osi(video);
> -
>   	if (acpi_video_get_backlight_type() != acpi_backlight_video)
>   		return 0;
>   
> @@ -2086,7 +2097,11 @@ static int acpi_video_bus_add(struct acpi_device *device)
>   	list_add_tail(&video->entry, &video_bus_head);
>   	mutex_unlock(&video_list_lock);
>   
> -	acpi_video_bus_register_backlight(video);
> +	/*
> +	 * The userspace visible backlight_device gets registered separately
> +	 * from acpi_video_register_backlight().
> +	 */
> +	acpi_video_run_bcl_for_osi(video);
>   	acpi_video_bus_add_notify_handler(video);
>   
>   	return 0;
> @@ -2125,6 +2140,11 @@ static int acpi_video_bus_remove(struct acpi_device *device)
>   	return 0;
>   }
>   
> +static void acpi_video_bus_register_backlight_work(struct work_struct *ignored)
> +{
> +	acpi_video_register_backlight();
> +}
> +
>   static int __init is_i740(struct pci_dev *dev)
>   {
>   	if (dev->device == 0x00D1)
> @@ -2235,6 +2255,18 @@ int acpi_video_register(void)
>   	 */
>   	register_count = 1;
>   
> +	/*
> +	 * acpi_video_bus_add() skips registering the userspace visible
> +	 * backlight_device. The intend is for this to be registered by the
> +	 * drm/kms driver calling acpi_video_register_backlight() *after* it is
> +	 * done setting up its own native backlight device. The delayed work
> +	 * ensures that acpi_video_register_backlight() always gets called
> +	 * eventually, in case there is no drm/kms driver or it is disabled.
> +	 */
> +	if (register_backlight_delay)
> +		schedule_delayed_work(&video_bus_register_backlight_work,
> +				      register_backlight_delay * HZ);
> +
>   leave:
>   	mutex_unlock(&register_count_mutex);
>   	return ret;
> @@ -2245,6 +2277,7 @@ void acpi_video_unregister(void)
>   {
>   	mutex_lock(&register_count_mutex);
>   	if (register_count) {
> +		cancel_delayed_work_sync(&video_bus_register_backlight_work);
>   		acpi_bus_unregister_driver(&acpi_video_bus);
>   		register_count = 0;
>   		may_report_brightness_keys = false;
> @@ -2253,6 +2286,17 @@ void acpi_video_unregister(void)
>   }
>   EXPORT_SYMBOL(acpi_video_unregister);
>   
> +void acpi_video_register_backlight(void)
> +{
> +	struct acpi_video_bus *video;
> +
> +	mutex_lock(&video_list_lock);
> +	list_for_each_entry(video, &video_bus_head, entry)
> +		acpi_video_bus_register_backlight(video);
> +	mutex_unlock(&video_list_lock);
> +}
> +EXPORT_SYMBOL(acpi_video_register_backlight);
> +
>   void acpi_video_unregister_backlight(void)
>   {
>   	struct acpi_video_bus *video;
> diff --git a/include/acpi/video.h b/include/acpi/video.h
> index 4705e339c252..0625806d3bbd 100644
> --- a/include/acpi/video.h
> +++ b/include/acpi/video.h
> @@ -53,6 +53,7 @@ enum acpi_backlight_type {
>   #if IS_ENABLED(CONFIG_ACPI_VIDEO)
>   extern int acpi_video_register(void);
>   extern void acpi_video_unregister(void);
> +extern void acpi_video_register_backlight(void);
>   extern int acpi_video_get_edid(struct acpi_device *device, int type,
>   			       int device_id, void **edid);
>   extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
> @@ -69,6 +70,7 @@ extern int acpi_video_get_levels(struct acpi_device *device,
>   #else
>   static inline int acpi_video_register(void) { return -ENODEV; }
>   static inline void acpi_video_unregister(void) { return; }
> +static inline void acpi_video_register_backlight(void) { return; }
>   static inline int acpi_video_get_edid(struct acpi_device *device, int type,
>   				      int device_id, void **edid)
>   {
