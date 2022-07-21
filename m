Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 508D057D5E2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 23:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B508EDA8;
	Thu, 21 Jul 2022 21:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2068A8EBB5;
 Thu, 21 Jul 2022 21:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5QzQ+DD6tVQrBul2FdieqLYfGaZ1Rd3LVjBEgf8Dy5NbCkOernOvYBMtr2lEy7KUg1X6Araj8RhdcnmUmLk6q1+Bd6wpZSGmsdEpd1lLJJeUkxDZR61uEi7Ad1aIKA0PUrOT3Rfu7V+/v0emRM/niOfAHBWBt9OqDy73Ebjnx4N/ObwgOZluHtH7E32NYL8BO9Wj3VayJtn5emohrYLbWnasCKSkAay8Avw+bzyldUMYWIaqvh6g69NTlaHLj1T0BR7IDs7YXsq/G4wO2TgMmyRxKB8YumaZPmPvCVX8gP9Q8KPfJS+/P5s09Y5Q7IPUsWPH8Ivx0jlZMFNrY+F7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1C/0oNIsNZe/4LQMZJj3woOuUc+3we2d2WVgPqvFEo=;
 b=iheCL+8nnNv+R7jZ5m0AFc32aAMfhPxoIVk4AKSBuh8O7knOeYW7R+xTXpCF+S4X6oxi8c12A+a6PdnCLLs6nb01/2NxL0ezj9WYJSXHThb582sH+HGJRcBn3HYa9kxffJ7zZTAxadvfV0L0Kxdhhqy18+4XPfs1A5G3ALJsJierO1PiHudPT7wu0y14Ve89OEX3y1hufaiKxpLb7Xy/NoYqeZLkvx5fCZVCXT0FCkKBNRwHxPgZaU36iAh53veTLCj2rLX8g3Zu0/XGIVO9EADxdPyAAi3jB/Ri40G4GBLVvKiz74xLyvN/a0VM7rod8eQPw3BLg1t7nE20yZ7/xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1C/0oNIsNZe/4LQMZJj3woOuUc+3we2d2WVgPqvFEo=;
 b=lUpd7drc82vh1YbPK4dP7dsYKiSKzKU+1oVFhXNlWUI7PoIaYaOPflpCukSWcyYUjST64aagtakPDQvEPHCl2VuPIql+ggq1yEvWeeQqHLOp6opZznIOTb2HHriL1HvQChoSMi+zNSSoCCC1itps1b3ql87ACtnoUIxmf4afuAxWDXbm9/cUcTC5W3+ApBOAG8DIbVfeYG3pKajy71wjfWnp0++8vyo50XbcJ3YyJxJy/JwdyG73eExTDnagh0yMdqktquUtcW2qo4H8qsQo3pYYq3rgi/6NHOh7nhthfnIOCfLwaFku0P+2jq0SwoZBD5FO63IsaJ0CQiEMzaJdfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 21:24:57 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::d043:c95a:cf42:cff4]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::d043:c95a:cf42:cff4%7]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 21:24:57 +0000
Message-ID: <641cb059-48f5-5f05-5ec2-610f1215391c@nvidia.com>
Date: Thu, 21 Jul 2022 16:24:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/29] ACPI: video: Add
 acpi_video_backlight_use_native() helper
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
 <20220712193910.439171-2-hdegoede@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
In-Reply-To: <20220712193910.439171-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR11CA0067.namprd11.prod.outlook.com
 (2603:10b6:5:14c::44) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4664dbb-b980-40bb-f23e-08da6b5f7617
X-MS-TrafficTypeDiagnostic: MN2PR12MB4287:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5a3faq4CSzsDftecNffk4fkjH07GO7rmYSCqVs+qIu0xMxGHahE1/+Hd0rlN7nAA6N96DD96szvxnGb4h8TdF+OfVwEcmvV/M2t3+E2lEbGho79uwpg+sEhyAwkjmaV+Ah2pV8IxL4sQ0hQlxxNUxmbXrmmRk+w19uQG0ZK80mnAlY7qiat7g9b5gKu3vmyJlqwG/GP6XhNtSztHmFNx68l8KraN5Uah6M40W87UXpQ/lldfj3qjSYuw4GspqFDv2yPXyj0oD7a8dTk/Bs8AiUV88cHwptjaSryNwhiiz4DJ5SWZk18WCBXp8rMBDYeegNITXreT21lpq3rKdBX3YideNw2Twih+G0yajUAdqqJGEFNrWJK2QBkVQyji7EKhpJ2W9Qn1MY9v+uKoZIFiWt/Kh62DDsxZzOTstsTP6o3FipokW0RFcCVyIr4gOaLxM6ARfUvJOX3jiDcij60vjRjyzIuW8Y7x0ZcDkxeCzWaOjnGsoKcj1yenfVgGkc2c1xzKsebMRfq8EGi3uNfrEnqlf/CnMlEz86R1PFmtL+DDjqK87ugu01eVheqav9ayeXjpwjdqNFMJ21lpYYm8Li9v939KYhiqhPqukm+Lc+iEqdZciU/mEn6k/kTxxGJHJV+/f28J/SUkqTGMSxRgN1r1Q+odgjZf4WX/UE1iurb2z7tug3hueKdDE3yCmD5lnMNHK3tlzzSjt9WIcyjm+mYUqSsFY0N1MEgvlDR7U8Rydf3b0BqJjzo0Tvwijl1yGpYKk0ObVkVECUarvof2BvRy0nuhqXaDPyVg9UyfgYfsE32DH3PC5DWr5NopGPHfFaSMjO0O8EUFWoT64sB6g5pK3wavE8A/FXD0bPXFUV0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(8936002)(36756003)(921005)(31696002)(5660300002)(54906003)(31686004)(7416002)(478600001)(186003)(2616005)(110136005)(83380400001)(316002)(41300700001)(6666004)(6506007)(8676002)(38100700002)(86362001)(6486002)(2906002)(6512007)(26005)(53546011)(66556008)(66476007)(4326008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEhDVUNEQnFPSEZnc3kwdi80d2Y5SUlBUU14TGJaYlRXU09EZlg5NXkydTVv?=
 =?utf-8?B?a0FvNFZBZG45MmhnV3M4b2tacW9NVmZmMkR4TTh1YnRpTnNPaEVNZEJIRjR5?=
 =?utf-8?B?ZldDMGVkVklRV1NyNVA4UGloeEcrVVA1SlBNWXMwQmkvK2ptaWN1djVFSk9S?=
 =?utf-8?B?NXZmaW1LUzF1ZTVMMFRtUGVUaTV1OE1adWZmRU5leE1zT0ZrdDNMeTVHOGJj?=
 =?utf-8?B?VU8zYlZyU2pUT0FhbklpLzJtUDdHekU3d3JIVVBCaDc5cHIwbytySGdxSUZ4?=
 =?utf-8?B?UzFpaDYwUGdDZktpMnhpWSt2VFVJcnpoUFR3N3BLYXozczBKM2NKc1dka2I5?=
 =?utf-8?B?TCtKZGJYZW4yNm01dkxvOHdpOWVhaW1xdGl5eGdCTVZ2Y0xSR0lLYlh6VE1z?=
 =?utf-8?B?VXNuNEQxSDZsNFl3M1lBcllQaFNNbjdiMnF0M0piS05XV1FXOGxQWFJPa1Rr?=
 =?utf-8?B?UjhFZk03UFZzSTJMWmJmSldqK0J1cEdHMW0yL1BUL0tHT1RIZVFRRTZERlBu?=
 =?utf-8?B?cEtPMkliSEtLY0M3M3lYRzF0UUI3dWJFMG5RMFN2SUZ6KytIbW52OEdDdk9M?=
 =?utf-8?B?TW1BU2tXT0I3dHd3VVpvWWZzR0xWamg2MHBVczBqUFVQYWhwaXBXdkNNbHYx?=
 =?utf-8?B?dWIxRXQwYXpLQ09KMW9YRjdDNllLV0dGM0d3Wkc1UmN4c0RnaDVaTExZcFk0?=
 =?utf-8?B?UUVvcDVsRm82akZodmdYcXRVT3NuRjJOTEVxQ1VHMi9uZUtpUzJVTTJrcXdh?=
 =?utf-8?B?VXRUS1ZmeGh5NE90SG5RTEt0djZKa2pUZHp3OUZvWnY0SkUwK1dPRFRXc0pL?=
 =?utf-8?B?a2VqQlc1aWF6a0xjRTR1cm1WcTh0cHZFOGxkUnp1U3NJR2pzQjZheXY1TjRP?=
 =?utf-8?B?aDU1TWJ5ZmltSDZJWkZnOXF4M2dwUEZYMVpKL2ZzNlZQc1cvUEl3aVdKUUc1?=
 =?utf-8?B?Q2NBWE9TOE4xUUNYUVgyTkFFU2hsQ1ZOam1UVjl6MThPYmR1cThlZks1REVz?=
 =?utf-8?B?SXYyM3V1NHd5R1N4dnNXWXJ3amxXMlFiMnpKNlkzdzRpbU1BUTVVK2h5OG12?=
 =?utf-8?B?SHE2NmxkRnFCU2JnVkhlRVZ1dEFnK0N5ZTFuVDVmR3AwM2kyQjVWWWJnL1BR?=
 =?utf-8?B?dEo3RHl2V1VpQnFSTnlYcmhDOWY1RHc5N1p2bE91azVxTnBMYmwvR2pZcUUy?=
 =?utf-8?B?NzZpMG01QUc4Vy8wMlI4VTRzcXJiRE9mZUpwYm0xekl2cllPOHBLVTNPaDdt?=
 =?utf-8?B?aUtWdlF6VzRHczV4b3hWc05NL1A1NGJMZnhpOG5ySitEVHAySkgxZlAvcitJ?=
 =?utf-8?B?cDFzYWlMZG4yMHJtQWlKUnQ4T2ltR2c1VUtOT2l3dHFHb0VXSWpzOVZLOThN?=
 =?utf-8?B?Q1dnMFEwVGZZemZUa0twSGVmN3lvU2ViNW5ZbnpwNSt4WkhMbmhVS0xKU0Qz?=
 =?utf-8?B?clFqTUlEaDltL296aFd4YmY1bHp4eC90dW1iM3hCVkJIQnpoT0xxVWxtRTUr?=
 =?utf-8?B?NXlZTnNkZ05KSFhQYW5zQWYzL05LT3ZVUkFDWVIzeWVBUlprMTJ6bTh5ZGp6?=
 =?utf-8?B?M3ZiVmRVWU9hQ1BwZFZjSmxsLytVTk4vRVdCbXZPemJXZ3grWlh2TVBFcnBy?=
 =?utf-8?B?T1RyNVdZNTUyWHlWb0crNWJoRTFlc1pSMzhZT1NYaGNJbHZTbjZpaTdTc081?=
 =?utf-8?B?U2hsR0R5cDRqRjRBTExYclZwU21HaW84SDhQQXAyS2hONVJnaFhiOU43dTNk?=
 =?utf-8?B?VlhEY1JIR2RKSklTQUpGMVhLTmlMWldjUWFRUnVtbVFSd1R0RXJjc0gvUkx5?=
 =?utf-8?B?ME5xTmtob1AzRUQxektVRzNhQnI0SHUrbTZwblcvMlVvNGh0TlBIa0kwdEha?=
 =?utf-8?B?dnpLWDc2b1FWbXFwd25VRkw1MWZHTnlSYWFYSlJ3dkg0V1VHWUQ0NjFYVHUy?=
 =?utf-8?B?YmQyb2JPTTJBZE00cEtDMTZJNTBxTEZ1WnV6UlZVNVlTUjlzamV0YTY4VWgw?=
 =?utf-8?B?WnBDU1Z2eTkzdCtFU0txR2JXR0JrUnpaY3BEbEJVZTBwcFE1VFVMZTFvdzhq?=
 =?utf-8?B?Ulg1VW9HVzlESHhrem9CTzNhdHZhSUczVUNXbEVDZGI2cCtsU2NtbHFnakVT?=
 =?utf-8?Q?Kbgmbf+ELgIXhwhBFjf9tlcCf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4664dbb-b980-40bb-f23e-08da6b5f7617
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 21:24:57.6504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GKNVLwwbOCoWqCgtE2BSiW3jSQmYYdcT4r/t0cGVIA/XrPMSU3eL8W/03fog/1uzqwErYaBK2JXoAw68m7iyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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


On 7/12/22 14:38, Hans de Goede wrote:
> ATM on x86 laptops where we want userspace to use the acpi_video backlight
> device we often register both the GPU's native backlight device and
> acpi_video's firmware acpi_video# backlight device. This relies on
> userspace preferring firmware type backlight devices over native ones, but
> registering 2 backlight devices for a single display really is undesirable.
>
> On x86 laptops where the native GPU backlight device should be used,
> the registering of other backlight devices is avoided by their drivers
> using acpi_video_get_backlight_type() and only registering their backlight
> if the return value matches their type.
>
> acpi_video_get_backlight_type() uses
> backlight_device_get_by_type(BACKLIGHT_RAW) to determine if a native
> driver is available and will never return native if this returns
> false. This means that the GPU's native backlight registering code
> cannot just call acpi_video_get_backlight_type() to determine if it
> should register its backlight, since acpi_video_get_backlight_type() will
> never return native until the native backlight has already registered.
>
> To fix this add a new internal native function parameter to
> acpi_video_get_backlight_type(), which when set to true will make
> acpi_video_get_backlight_type() behave as if a native backlight has
> already been registered.
>
> And add a new acpi_video_backlight_use_native() helper, which sets this
> to true, for use in native GPU backlight code.
>
> Changes in v2:
> - Replace adding a native parameter to acpi_video_get_backlight_type() with
>    adding a new acpi_video_backlight_use_native() helper.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/acpi/video_detect.c | 24 ++++++++++++++++++++----
>   include/acpi/video.h        |  5 +++++
>   2 files changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index becc198e4c22..4346c990022d 100644
> --- a/drivers/acpi/video_detect.c
> +++ b/drivers/acpi/video_detect.c
> @@ -17,8 +17,9 @@
>    * Otherwise vendor specific drivers like thinkpad_acpi, asus-laptop,
>    * sony_acpi,... can take care about backlight brightness.
>    *
> - * Backlight drivers can use acpi_video_get_backlight_type() to determine
> - * which driver should handle the backlight.
> + * Backlight drivers can use acpi_video_get_backlight_type() to determine which
> + * driver should handle the backlight. RAW/GPU-driver backlight drivers must
> + * use the acpi_video_backlight_use_native() helper for this.
>    *
>    * If CONFIG_ACPI_VIDEO is neither set as "compiled in" (y) nor as a module (m)
>    * this file will not be compiled and acpi_video_get_backlight_type() will
> @@ -548,9 +549,10 @@ static int acpi_video_backlight_notify(struct notifier_block *nb,
>    * Arguably the native on win8 check should be done first, but that would
>    * be a behavior change, which may causes issues.
>    */
> -enum acpi_backlight_type acpi_video_get_backlight_type(void)
> +static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
>   {
>   	static DEFINE_MUTEX(init_mutex);
> +	static bool native_available;
>   	static bool init_done;
>   	static long video_caps;
>   
> @@ -570,6 +572,8 @@ enum acpi_backlight_type acpi_video_get_backlight_type(void)
>   			backlight_notifier_registered = true;
>   		init_done = true;
>   	}
> +	if (native)
> +		native_available = true;
>   	mutex_unlock(&init_mutex);
>   
>   	if (acpi_backlight_cmdline != acpi_backlight_undef)
> @@ -581,13 +585,25 @@ enum acpi_backlight_type acpi_video_get_backlight_type(void)
>   	if (!(video_caps & ACPI_VIDEO_BACKLIGHT))
>   		return acpi_backlight_vendor;
>   
> -	if (acpi_osi_is_win8() && backlight_device_get_by_type(BACKLIGHT_RAW))
> +	if (acpi_osi_is_win8() &&
> +	    (native_available || backlight_device_get_by_type(BACKLIGHT_RAW)))
>   		return acpi_backlight_native;
>   
>   	return acpi_backlight_video;


So I ran into a minor problem when testing the NVIDIA proprietary driver 
against this change set, after checking 
acpi_video_backlight_use_native() before registering the NVIDIA 
proprietary driver's backlight handler. Namely, for the case where a 
user installs the NVIDIA proprietary driver after the video.ko has 
already registered its backlight handler, we end up with both the 
firmware and native handlers registered simultaneously, since the ACPI 
video driver no longer unregisters its backlight handler. In this state, 
desktop environments end up preferring the registered but non-functional 
firmware handler from video.ko. (Manually twiddling the sysfs interface 
for the native NVIDIA handler works fine.) When rebooting the system 
after installing the NVIDIA proprietary driver, it is able to register 
its native handler before the delayed work to register the ACPI video 
backlight handler fires, so we end up with only one (native) handler, 
and userspace is happy.

Maybe this will be moot later on, when the existing sysfs interface is 
deprecated, and it probably isn't a huge deal, since a reboot fixes 
things (I imagine installing an in-tree DRM/KMS driver on an already 
running kernel isn't really a thing, which is why this isn't a problem 
with the in-tree drivers), but would it make sense to unregister the 
ACPI video backlight handler here before returning 
acpi_backlight_native? That way, we'll briefly end up with zero 
backlight handlers rather than briefly ending up with two of them. Not 
sure if that's really any better, though.


>   }
> +
> +enum acpi_backlight_type acpi_video_get_backlight_type(void)
> +{
> +	return __acpi_video_get_backlight_type(false);
> +}
>   EXPORT_SYMBOL(acpi_video_get_backlight_type);
>   
> +bool acpi_video_backlight_use_native(void)
> +{
> +	return __acpi_video_get_backlight_type(true) == acpi_backlight_native;
> +}
> +EXPORT_SYMBOL(acpi_video_backlight_use_native);
> +
>   /*
>    * Set the preferred backlight interface type based on DMI info.
>    * This function allows DMI blacklists to be implemented by external
> diff --git a/include/acpi/video.h b/include/acpi/video.h
> index db8548ff03ce..4705e339c252 100644
> --- a/include/acpi/video.h
> +++ b/include/acpi/video.h
> @@ -56,6 +56,7 @@ extern void acpi_video_unregister(void);
>   extern int acpi_video_get_edid(struct acpi_device *device, int type,
>   			       int device_id, void **edid);
>   extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
> +extern bool acpi_video_backlight_use_native(void);
>   extern void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type);
>   /*
>    * Note: The value returned by acpi_video_handles_brightness_key_presses()
> @@ -77,6 +78,10 @@ static inline enum acpi_backlight_type acpi_video_get_backlight_type(void)
>   {
>   	return acpi_backlight_vendor;
>   }
> +static inline bool acpi_video_backlight_use_native(void)
> +{
> +	return true;
> +}
>   static inline void acpi_video_set_dmi_backlight_type(enum acpi_backlight_type type)
>   {
>   }
