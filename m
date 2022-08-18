Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8574B598CD3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 21:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DEB10E6B6;
	Thu, 18 Aug 2022 19:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE9910E3D1;
 Thu, 18 Aug 2022 19:46:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSdc3R4aTeh887dS/yhHWKnwrQhrR8Yon75X181AZzaQtnqrEfL3drnIIYLtlTeWilyl76RplzY+8rT3uhN69R6pqO1/BAmhcOSbGQShAoG+lAjDsJ3ZiMJQ7GjO5IKoWouioRZyNurzUnAUDk34FpVn6cLYEeAupe9vTI53iDM0ynZJ5hK3apgFCp4EALomNRulblD55BgZm75Px9o0HOoZ8xQRVva2taAph1WEguXF3poYahR4LATjONDFJP5DN2Vpkdlkl63tpqHfIZMbdvh3O6tdKjSm4GH3CYqt+LjMiiYjElekaSDFZ1vr9MVnTX7QONSvXlPr3Eg+pXlcDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON4Yca3JdR1998TKBaVfnV2aMdPEgBvlHIlqv1Ynems=;
 b=Ly5ErJtjSwZP0XG1Q1Cm1akcMvYj8L4WJqslJrzAH4GRkw+VWMorHVJMmTzEu6Y/I7Ugld/MGGamD5wmhyQXc9ojGPjDNKMCGDPlGy/TNyRhtFBjh2Cp1l2gfN2Uu0oHgmuzthXdFvQsWk3DJ6BCRsY32onIsm8SaQVLvvpiIEMOuRAymdOBOWNHErQxdt6tlZnVY6AWCfaXUrzkDcLzR0uQuHwDmpuHJtj5c4bHXlS865QfhRcZc8H52PrxeiUV0+y82wifIKPXeGHwgAa+gWUcLkyJTjbGOCXC/mR/wLJ5Wm39ahTT1qWm2BYxq20UNAg8NsaP+8V6dy/sulZORA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON4Yca3JdR1998TKBaVfnV2aMdPEgBvlHIlqv1Ynems=;
 b=PNss7KX0Oxqe+pGOSjV1rwozgmdGVz1MTPcs+bFXBfkWuNNFFx9Yzp+9P1d7PoJnkpCl82+SWvr3s5S9tYSZzvSBQohR6N5OJ2Jr4fTEjhIo3Pu6ls1dKRUI5DCM3QZiF/KOjzSsg1cEXC6G7E/KrBzMXNSUoNyZXsbxW5bLftOaPiqMagwgnIlHpcR43p53x3Xp9Of8JTOuC32XPeYCdT3hSyUD1Rx/vDN5W89r8BjZmeOZlfu7K2gKjl9B8vrMSI5N8H1wW3TpAGSkBeXGKhRZ6yBuuHZ5wA63jbqo+LjDPKYmm4oFnWn+PK/lPiQEyqpNckOeIXeMSsOtgjpknw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 BN6PR12MB1137.namprd12.prod.outlook.com (2603:10b6:404:1c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.10; Thu, 18 Aug 2022 19:46:36 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02%3]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 19:46:36 +0000
Subject: Re: [PATCH v3 19/31] platform/x86: nvidia-wmi-ec-backlight: Use
 acpi_video_get_backlight_type()
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
 <20220818184302.10051-20-hdegoede@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <6f5e3452-a18f-cde2-2cdd-cbf80d3b9f4b@nvidia.com>
Date: Thu, 18 Aug 2022 14:46:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20220818184302.10051-20-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: DS7PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::34) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a89fdbd-25ac-4d8d-7cfb-08da81525c04
X-MS-TrafficTypeDiagnostic: BN6PR12MB1137:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uqzH75NjJf0XIfef/Q8Fhre7fSOYNqpBSb7bOmyqMB9AkyKlIJeYDrx+129+pocd6gIkq17Q0c2G9VILEcksW02Z74svA5/TpiVDkPY6taUD78S6gwL/WO07i+iKbz8PpEuyVzP7vP0ZbExs4Op55xhyh+HNiaOU9r6mL6ikUeUWKn+cM/njoJACZxpkXOp8GYbs8pVDVwhRkMzINbNw6+Tv3sa1alF9AT/rNLMprevq5J6e1EvXIOmkhMCXmVWzOYH3NuWw2MxapSXiq6vVB70b8VubtK+xbUROG7k0Pm+hQFiZlWKQ3tDlHZgAhNBkx+2jCz1CGAWphD9kzeMx3FLYrt2DWLLV9rAFDWQlLzWheyl597jcEZTwRO7fHae2vv30a84JBKgFtOXO9F2/xzu+hPUnZl+i5S5Bg1SSe0yy1dggB1LipVI5ANTB5L1W0tjmsqTJo37Cn0+5v9pufe0hJ6JVehouaI9g3lFUyKbo9rW4upTDUCODkNMHf2zvboLtqPI3gX/Ed1Gm5paUsvzlwM1U0JLlkk3KSUihOgtmuHphaybXOzx6xlF24gwwSwkGk718TTuP5JZtLLexNwvD63wpzQICg+rBE+n4FG+dpq6YrX54UY0OYQlMAy3AyS8+FuSuvApD5+3due9hIgPxDzovV87cXKOFC/W1dYi4OoiQ1Cc/LDkV00KRWdP+sJyDB0/P/X/Z7F8AIbMd+ppyYFSavpguNf6kGFLmoi5hJfYoxiYXU1ixxRG6oRmSQtrDTbCMHuB3sbMlJMrFzJmLv1hf+JWKaD/yXG7Rv07EbX3hOuO2mLV0ZS/KJyPC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(110136005)(316002)(66476007)(4326008)(54906003)(66556008)(66946007)(2906002)(8676002)(8936002)(38100700002)(7416002)(31686004)(5660300002)(921005)(186003)(31696002)(41300700001)(86362001)(6486002)(6666004)(6506007)(26005)(6512007)(53546011)(36756003)(478600001)(83380400001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z04rZHN6NDQ0V1U2UXJIaEl0RVJqV0ViMHF0RkdVeG5iekZHVGgyUkh2NlZz?=
 =?utf-8?B?dlJsVUtZOFdPWU90QzlMYkJURE9QZ0dYOURiN2ZGaTZ1WmdaczdNQnRQYy84?=
 =?utf-8?B?U0UrSFRSNWJrMjR5eW9CWVpqazA0SjFJVHErc1ZBTG82MEZHZHJyNk1ZTThU?=
 =?utf-8?B?U3NITXpXbzlyd0VyeStjSk04UTUzNmN4Qk4xREo1dStidTBBTTBRZlJaRjVI?=
 =?utf-8?B?c0VRdmFhNWg4b3hQNGR0M0I5djBaaGFSMjJNY2RGSTBKcVJyS1RUOEdGOThv?=
 =?utf-8?B?MnRDbVgzMXg3MkRVQ3NvM3NSSUVyUVFuNnpyQzd3UElwbEdWTTFqdHhmNXRx?=
 =?utf-8?B?cGpNeU5UTExncnoySk42Wjc3bE9ZZ08xTytpb01ZSklqYmdLYTNvUi9URFVx?=
 =?utf-8?B?SXUwMUxuTTVsZ1dWQlVWRnlVdis3aDFmVVdNWURDUWZKWVFDWjZYWGZjUi84?=
 =?utf-8?B?VFZmbjVINS8rOFA5UVdhUUFySEZNVWx3N3dua0dLT3ZLaU1CN2RIUkJMZ0Zr?=
 =?utf-8?B?Tnl3Y0JtbGxLUXg0dVMwQnI1QUt5YlZiT3cvRlREeTZYUHZjRC9oYmd0NXdp?=
 =?utf-8?B?eklvNW1xZzFZaTU3UTR4b3ZyTjBNVEIzU0J1aTJDY0s2NzU5QWN6MWNMb1N2?=
 =?utf-8?B?Y25Tb24vZzNOdFFqcDZ5V2V6SkY2ZjZyMGJHTGVjODJRcVY2NHNMdDlTZUpD?=
 =?utf-8?B?a3JpUWJNdXZuaHVMNzdlRVFkOGVkem5RajRFSTMyU1ZieUpNR3lYc2d3K1Mr?=
 =?utf-8?B?Tm41bGk3N1FrMEloNS9RV1hSN0UyaTRoK1pVYndLSldrUXo5Q1B5T0RIelRN?=
 =?utf-8?B?cWVuK0lsbFJ4dWNIclN6TGpoUTZrWkpmYWluRHFPUGx2RldnQzV2YlNNNVJP?=
 =?utf-8?B?dWtjOElTbzJsa2c1L0piNVEwMWYwc2huY3ZQbDB4QnpFY0FBTDliRlg0ZENo?=
 =?utf-8?B?UnVGTGM5YWEzWmZTcjVHZGdlNjVaYVZPcHB0N3ZpRmNRN3ZhZlpPbmUzeFgz?=
 =?utf-8?B?bEZhbTZFVUNSSkIySWhEbndEYkIyWFdBVGtqOWg2TXJxbWpmZEJJc3M0SFQ3?=
 =?utf-8?B?Y1JCcnFIT1c5bngxc0pyeGFtNExROWJEMEl4OUgzQWdsTEtkS3dPVHVyVGky?=
 =?utf-8?B?bE1rMVpnZnJJT1hFY3F0WjNsREZEL25FT3d0QkMyZ0xKb0dmS2lDMWxaalpL?=
 =?utf-8?B?QURidktJRS9NaVAzQithVUJ3SW83UzlSYXVuOE9TeFd0RlBoOFc4c2NqZEZy?=
 =?utf-8?B?U1BBc1JpaWhKYnVJWlhHRytVSWk2bnJmcXdyKzlEbm4zRm5RbTJVdS9BUFlM?=
 =?utf-8?B?cGpOUXdTazNkUXFoQXUzN1YzM0pxOXdsclJyR01oU3NWYzJOODFmSDB4WEcv?=
 =?utf-8?B?b0pSYTR5Z0pMbkVOQzNUdHpwV2RTNFhRdnNrWEZIQjVJMElaYmhOWHZGcTRi?=
 =?utf-8?B?SVB6M3U5enVFT1VMTFV1cFhLYkNjWS9xUkpaelRHTXh3QmsyMUl0dmpFKy9F?=
 =?utf-8?B?VHNuQnlYblQ5YTdjK29MK3RGWk9zZGpOdSswNVM5R2N1TUJlNm9vRHR1ZUJ0?=
 =?utf-8?B?a1FGUlFVTlhJRXJJaW85ckFVYXVpZERhd2Fwbkd5MHlHaThFZGVaZlgwU1N5?=
 =?utf-8?B?YmdwUzQ3RFMvVEpiYWVqc1EvT3U5dlNpd2NRblhIUGJxN3k3TUJNYTJENFI1?=
 =?utf-8?B?UCtaTFFPQWVtZ1J1c3pUTFA0Q3dVUVJZaXBCeGJPT3cwN2NRUkx0bytLTHNZ?=
 =?utf-8?B?VDFncVQ2b0x5TVNvb1k0VkNLeGhFa2I1M1R6MjhwNEpaMlAzN2dxbFRxRmU0?=
 =?utf-8?B?aTdMclpSY3huVGlYQmgzbXJrTWtKN3FzYVM0cVNiMCs5NFhmeDdXN0JLS3c5?=
 =?utf-8?B?MFN3RFdLUGZad0pjYnlvQXhHVzFYc3JDYUtSdUF4SXFpWURuaTI4aDVqd29o?=
 =?utf-8?B?bWlneXFYVnoxZWZzWFoydnlJdFJNTHpHejlYM25aajRVeVVmanNuY0Zqc2M0?=
 =?utf-8?B?UUZOQjkxSm9rMW9XMm84NjIzRWdzcVJta1I1T1YveCt0bEhNSGJmVnhrZS9h?=
 =?utf-8?B?NEtzL1U4czRrN2F3M2NsdHdEak1iWWx2WE9HbWRnaUpsT0dRSmFYYitLaWxs?=
 =?utf-8?Q?Erg71vjosk81MxysH8pGAlMIE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a89fdbd-25ac-4d8d-7cfb-08da81525c04
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 19:46:35.9008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFYlbPDP9gDUUNtdYZEbk3uEFA4CuOTWJF86ssWwQKOo1F8CJBvr3HkPy4CS73s2DrPjfuo3ldA4DKq3shpsWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1137
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

On 8/18/22 1:42 PM, Hans de Goede wrote:
> Add an acpi_video_get_backlight_type() == acpi_backlight_nvidia_wmi_ec
> check. This will make nvidia-wmi-ec-backlight properly honor the user
> selecting a different backlight driver through the acpi_backlight=...
> kernel commandline option.
>
> Since the auto-detect code check for nvidia-wmi-ec-backlight in
> drivers/acpi/video_detect.c already checks that the WMI advertised
> brightness-source is the embedded controller, this new check makes it
> unnecessary for nvidia_wmi_ec_backlight_probe() to check this itself.
>
> Suggested-by: Daniel Dadap <ddadap@nvidia.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/platform/x86/Kconfig                   |  1 +
>   drivers/platform/x86/nvidia-wmi-ec-backlight.c | 14 +++-----------
>   2 files changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f2f98e942cf2..0cc5ac35fc57 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -93,6 +93,7 @@ config PEAQ_WMI
>   
>   config NVIDIA_WMI_EC_BACKLIGHT
>   	tristate "EC Backlight Driver for Hybrid Graphics Notebook Systems"
> +	depends on ACPI_VIDEO
>   	depends on ACPI_WMI
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	help
> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> index e84e1d629b14..83d544180264 100644
> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> @@ -10,6 +10,7 @@
>   #include <linux/platform_data/x86/nvidia-wmi-ec-backlight.h>
>   #include <linux/types.h>
>   #include <linux/wmi.h>
> +#include <acpi/video.h>
>   
>   /**
>    * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
> @@ -87,19 +88,10 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
>   {
>   	struct backlight_properties props = {};
>   	struct backlight_device *bdev;
> -	u32 source;
>   	int ret;
>   
> -	ret = wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
> -	                           WMI_BRIGHTNESS_MODE_GET, &source);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * This driver is only to be used when brightness control is handled
> -	 * by the EC; otherwise, the GPU driver(s) should control brightness.
> -	 */
> -	if (source != WMI_BRIGHTNESS_SOURCE_EC)
> +	/* drivers/acpi/video_detect.c also checks that SOURCE == EC */
> +	if (acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
>   		return -ENODEV;
>   
>   	/*


Reviewed-by: Daniel Dadap <ddadap@nvidia.com>

