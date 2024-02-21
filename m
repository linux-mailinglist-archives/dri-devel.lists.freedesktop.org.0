Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0785E92F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 21:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4F110E804;
	Wed, 21 Feb 2024 20:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="UDghL9no";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2118.outbound.protection.outlook.com [40.107.22.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE3B10E7EE
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 20:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcirZnYa9aGHZ3g1EpZSX8HLm93g+9NnPNqGjbwpe8RSaYOV4jaXsQwcV47wa21X3UqMKhVgcGUGDEW6imDXeh+vqmpS8F1lkSHeb7UD2kNpO1l6CMAYS067KERklqyZIlzj5Qgk+/apfnVo73qw1aousiAI88vHlfQHO2AwbEt64bJCSeOC1nptWZRga24mNRuxvOKzdp0wj6zoyX7xFfIsrIsfYfbIvbvEsLJWs28l1cbbNKO3gMl5i4rsHaMiqSN5NrziN+3g0qJoUGnjK2MjBRRJy1kuIIwK/8tEqq+KmSNCb40G+wvQmtD8H8rsbWoxziK2I4mfONR8dQYbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXOQM1VvRDOWKH97CZHpyjHBYwY+8I5piZLsKCJKjBw=;
 b=iVkzUIH9ceDaFJFkTn9hkSsnkciFuaAOYl2weTZZ9jliNJwBjLOlnmvgwyfvHTKVHpUVtXIw8ZKn6xm4wIYCzWnpQ4Q9Uv1dOOk8XUOvA0j/TMxvoim1Sc9Loo7bB+A5w7PdPRyKbGPVtn1C/r+uoHxYKc8B4kdhVzbos7Eoz2CliL1koRHvt+0GJRQZatlG99DEiUq0GTCZRTIVK5zfdcU6Wkv39+trReZ8eHVyiIK2FByIOIHpMudfABsA7AsBMaLmMOTu5fGfE4ZiH9Ztkq7hviipE1LzuTQJy+39nUuyHLuSt+iwwT1L8JxZrEsmMHjUkGk6hCaihK8YH8Xlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXOQM1VvRDOWKH97CZHpyjHBYwY+8I5piZLsKCJKjBw=;
 b=UDghL9notPWWz46LEJB13T07oIhCtqgUJAi6/9wxP8Ol7GLTYIwoqnUpR1zsoufETBzahUBc+JEClSYdR6dhDOQrQnyybSwXwjPFkm5NYNI73pxtGIeM9e5dewwBb3YIx8nfCa5qwh1gZ6cJpdTqS1zDshrar6mabXfRCeS/bd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DBBPR08MB5978.eurprd08.prod.outlook.com (2603:10a6:10:1f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 20:40:42 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Wed, 21 Feb 2024
 20:40:42 +0000
Message-ID: <503d9ea9-9812-498b-a5ee-2579ba8a7ecf@wolfvision.net>
Date: Wed, 21 Feb 2024 21:40:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] usb: misc: onboard_dev: use device supply names
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net>
 <ZdZcLOlSc3FScjLK@google.com>
Content-Language: en-US
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <ZdZcLOlSc3FScjLK@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::19) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DBBPR08MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: 856b3e27-d280-4a2f-4a10-08dc331d5ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tkRhZ5w6AI7ce21L7Ezks5HDf1Dg1h6trbTTyE9w3h7tgV+uH2WjznA65aZ3mWxywUD5YWgZE3dZ2qemHEv47a8nF+MOD+rrYAA0VFDBSiNIWA0CqAxp/q4Od8zkuLfy6qVOnp7gCsX17dhHgO4B/Q/GAZ27MaJs8vndc3RMrh4g4XnN1uo5dJqd4kiLZvztK0yXp5M8LwxwXaWxE71Jup+ZCfKGjrixnk47ouTNVo7QHidUMXmUZQbH8o3WsPQV7gF7qMh6dVYkzE9O0beT6Pd68luJxHihgKFEKwphrci5hDixGzIclgzylP3oufRay7Ir49PxXTsmBhhNqbemei+dbc1bN5+NCvHa8DwTWKz5ANumq/ZHxwgIG24j8zOwRgIk9YF4MeorJSzSaK+1gA1p14+d6u3q0pXCSDdBgnDWiPOHBZjw9/loft/P7QG+FaQ0swsl3yO31TdwEC/Kb4CFay8b11HHF2foFlgQswcIr3tDwbv2epAy026JGIdG8+p6jwptMOilG/jJAtFu1jm+t8MFdrFO6qcaeiECFoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXo4MlNVWlF0NFRuTGJ6QytMUE12TVdSNURFQ0cya3UzZ3ltVkVjRUhlcUM4?=
 =?utf-8?B?OEZLTzFlelV6MVRyOUFyK0NDRmRGTTZaaFh4VFBYaUYyK0wxY0VkREpuNnhV?=
 =?utf-8?B?Q3NRcWdkRUoyeTd5ckZHNjdYZUQzTG5kVE9LUUV1anBzSDJRcHJTbUgvcjVQ?=
 =?utf-8?B?UTg4aG92anRPaWZtN0gvSi95QUFhSXlTdWFRNzkvU2xhcTRoeG9LbGZ3ZE82?=
 =?utf-8?B?YlVLbHdtdm1FRlViaFI5WmFxQWJzRmRaTk1Vc3hOMG42OFNFTG1iRlZYTzUv?=
 =?utf-8?B?ZHVKRVBjcCt2clVva1pucEVTdy8waVBxbmM5a05oUlBtaGZEWEwrK3JpekhM?=
 =?utf-8?B?dU1iMFpkY09QOFRMdzdIK2hqRXI1VE9RQzNwamkxSVkwVkRiZlVxcjc3TkJH?=
 =?utf-8?B?MUZmMGxmd3FNT1Nmb0hvOXVXRmllTTRjYlRBajZ2bVRaQWdIY1NTMTUrTHQ3?=
 =?utf-8?B?S1RPUHdDdWNXc3pseXhMTXl2OG1EdE03alRUUW4rVVJGdzVuOEdQL0s0K2Np?=
 =?utf-8?B?Nm44WVNLYVY0Tk9hWHN6OE9aQ1N6ZCtTMWM2L1JkOHBhNEdpSXgyVDYvRThh?=
 =?utf-8?B?eGc3ak40ZzJSL2NqcUtJZk5ONUZsMTBaUU51enNaVFkyNGdOeUpDQXE3ZHVm?=
 =?utf-8?B?bUVscWFMOGRmUDBHeHhrTmNPSWxSV3JDMk9RSjVDYUxlYXdrQmhUcWhGTjEz?=
 =?utf-8?B?L2Z2MVpGVnViR1ZPcFlUWTNtUVo4N0svWDZaaHgrV0NDNW1yS1NQRFNlMFZ1?=
 =?utf-8?B?OWtTaTVIVzE0N0RsMUdBa1oyUUtoRHZXZm1PNFd3RktlUzZFNnBLcUJkeEVC?=
 =?utf-8?B?SHQ4NTBIaGtEV3BUd0hZSHVYTEwxZ0N2amVzYzM1OG9vUEU3dFZCTklwNUJo?=
 =?utf-8?B?a244K0ErdWJubHQxM2lBQytOUjcwYWlIT2ZQMkpoT1htb2hrMHBSaHRoa3h3?=
 =?utf-8?B?U2dZSC9wSFBqNXI5clhuQmw5VUNXaXowRytKR3k1NVpZQXFtQ29jTmlyZTlv?=
 =?utf-8?B?ZVpocWE2OHpMVk1HVHI1MG12dWdVaFJQT2UrdVpVZ2ovS0dIMHlGZWNJcWNU?=
 =?utf-8?B?bm02cWk2Mkg2UC80VjRZSCtGY3BsUVlhczV5YXppR243Z0J3akpvaTM3YWxU?=
 =?utf-8?B?Rm81SDFPZHo4YnhSRlRUa0Rla0ttY2pGSW5oY2tpMWlDNXhXdlpBZmpyNW5H?=
 =?utf-8?B?a3p2ZGJNZm9FbHY0bWg4VWJOSXEweFhBNHVMVTFPNmtZUDEvOHpEK09zOGMx?=
 =?utf-8?B?WVJvVHI5TDBFVGZGc3VCeThoTnJzbDlCZkx4Y0l6SmFubGlyRkhXUVp3SG1u?=
 =?utf-8?B?dDhPVzZncEFxRkxrcUlzbEIxYUFTVldONGtsWW4vbDBjRXRwTGluMzFNVHBB?=
 =?utf-8?B?WXVsaUZLU1AyU0RVQVdhZGNpSWRLYjZsemUvellzaUY4Ti8vY2RqNHljMU9q?=
 =?utf-8?B?SVg3eGplNkl2Q3hkREhoanBwcFpaWDdqdFFzQnM4UlRWUzFQNGRnZ0dWZ3J4?=
 =?utf-8?B?d05FVFVLQTIzc0V4ZVlvTTgzMHY2Qnpkb3U0aWNZUkcxRGRnczFVQXNTZlFV?=
 =?utf-8?B?ZDBnMDQwR1JJL0JRWUx2Q2M1dTg4aXJuUVVEMzM1eFBPaTN3Mk8rRGJ3cGpi?=
 =?utf-8?B?QUZsejE2RkIzR3hTZGg1dGRHTVNhWEROMTBIQnN5d1BPdEtRSW15NEVqQjZs?=
 =?utf-8?B?WGV6SFA3RWExZG1CR014QVl3bFN0M0pPcUpBdkZYbnhsMmF3eTlzc2E0TjdE?=
 =?utf-8?B?YXk0a2w3ajhjNWhDK29RaTlRWE9KTk9WTGJKbTJoenBMTEN4R3padXdhb0Ey?=
 =?utf-8?B?UGduT25FcXI4aE83anJUcjlndDZWTFlyeHFQVHZFNFhGSkZNaGZPODNoSDFv?=
 =?utf-8?B?aU1ZMHJyNHEzMTl0NVlWZjhWK0ZkVThIanprK3I0TmxrTlpVS2ZwSmpQQ2Ev?=
 =?utf-8?B?S29JRE94WDFEeDZUR28zd1l4K2xFN3l4V2UrWHlXNFBoZ0hRMWRDSXFUSDJw?=
 =?utf-8?B?QVBBWlBWTml4MytZZ3hTdG10QWJvd0hBZ1Axbm5RRWJ6M1RoZXZsVWQrS1E1?=
 =?utf-8?B?ZWY0SDFaaE8yRmtlWW5ydWRnRjRuUzRPWVRRT3A5eThVbmpldTIxRVNlZVcw?=
 =?utf-8?B?aVoyUlYyYTJKTnJURzBraThUdCt3VXFsYTFKNmNZWFlGR2N4MDA5YTlER0pt?=
 =?utf-8?B?SWk4bGRLNkNRUmtId3lmWUswUjdNRHBuK3ZyVXh3TGsxeWtucTZ5M09neUZJ?=
 =?utf-8?Q?Wed46KEYs9+P4V/g9U1Dk2/sgK7TX57s8up9F2QZ7c=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 856b3e27-d280-4a2f-4a10-08dc331d5ed4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 20:40:42.0283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnsE+LqjT4itSY0kEQOoQfmp+wDs5GsuKwRzihp6Bv9D+UWnTjl17b1EkYU1SOAI8EOpkXHUtsfBYgImtNvIZRtK7ET3f2b77qFpqav1NwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5978
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.02.24 21:25, Matthias Kaehlcke wrote:
> On Tue, Feb 20, 2024 at 03:05:50PM +0100, Javier Carrasco wrote:
>> The current mechanism uses generic names for the power supplies, which
>> conflicts with proper name definitions in the device bindings.
>>
>> Add a per-device property to include real supply names and keep generic
>> names as a fallback mechanism for backward compatibility.
>>
>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
>> ---
>>  drivers/usb/misc/onboard_usb_dev.c | 54 ++++++++++++++++++++------------------
>>  drivers/usb/misc/onboard_usb_dev.h | 23 ++++++++++++++++
>>  2 files changed, 52 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
>> index f43130a6786f..e66fcac93006 100644
>> --- a/drivers/usb/misc/onboard_usb_dev.c
>> +++ b/drivers/usb/misc/onboard_usb_dev.c
>> @@ -29,18 +29,6 @@
>>  
>>  #include "onboard_usb_dev.h"
>>  
>> -/*
>> - * Use generic names, as the actual names might differ between devices. If a new
>> - * device requires more than the currently supported supplies, add a new one
>> - * here.
>> - */
>> -static const char * const supply_names[] = {
>> -	"vdd",
>> -	"vdd2",
>> -};
>> -
>> -#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
>> -
>>  static void onboard_dev_attach_usb_driver(struct work_struct *work);
>>  
>>  static struct usb_device_driver onboard_dev_usbdev_driver;
>> @@ -66,6 +54,33 @@ struct onboard_dev {
>>  	struct clk *clk;
>>  };
>>  
>> +static int onboard_dev_get_regulator_bulk(struct device *dev,
>> +					  struct onboard_dev *onboard_dev)
>> +{
>> +	unsigned int i;
>> +	int err;
>> +
>> +	const char * const *supply_names = onboard_dev->pdata->supply_names;
>> +
>> +	if (onboard_dev->pdata->num_supplies > MAX_SUPPLIES)
>> +		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
>> +				     MAX_SUPPLIES);
>> +
>> +	if (!supply_names[0])
>> +		supply_names = generic_supply_names;
> 
> Please change to 'if (!supply_names)' and omit the initialization of
> .supply_names for devices that use the generic supply names.
> 

That looks much cleaner, I will apply it to the next version.

>> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
>> index ebe83e19d818..59dced6bd339 100644
>> --- a/drivers/usb/misc/onboard_usb_dev.h
>> +++ b/drivers/usb/misc/onboard_usb_dev.h
>> @@ -6,63 +6,86 @@
>>  #ifndef _USB_MISC_ONBOARD_USB_DEV_H
>>  #define _USB_MISC_ONBOARD_USB_DEV_H
>>  
>> +/*
>> + * Fallback supply names for backwards compatibility. If the device requires
>> + * more than the currently supported supplies, add a new one here, and if
>> + * possible, the real name supplies to the device-specific data.
>> + */
>> +static const char * const generic_supply_names[] = {
>> +	"vdd",
>> +	"vdd2",
>> +};
>> +
>> +#define MAX_SUPPLIES ARRAY_SIZE(generic_supply_names)
> 
> This will have to change when support for a device with more than 2 non-generic
> supply names gets added. Please use a literal value for MAX_SUPPLIES instead of
> ARRAY_SIZE. If the literal is 2 it would still need to change for future devices
> with more supplies, but that change would be more straighforward.
> 

I am not completely sure about this. Someone could increase MAX_SUPPLIES
without adding a generic name. Actually two modifications will be
necessary for every addition (name and MAX_SUPPLIES). If ARRAY_SIZE is
used, only new names are required, and MAX_SUPPLIES is automatically
increased.

I understand that the whole point of this is getting rid of the generic
names, but we still have to provide generic names for every extra
supply, at least for code consistency and to avoid size mismatches
between real an generic supply names.

>> +
>>  struct onboard_dev_pdata {
>>  	unsigned long reset_us;		/* reset pulse width in us */
>>  	unsigned int num_supplies;	/* number of supplies */
>>  	bool is_hub;
>> +	const char * const supply_names[MAX_SUPPLIES];
>> +
>>  };
>>  
>>  static const struct onboard_dev_pdata microchip_usb424_data = {
>>  	.reset_us = 1,
>>  	.num_supplies = 1,
>> +	.supply_names = { NULL },
>>  	.is_hub = true,
>>  };
>>
>> ...

Thanks again for your feedback.

Best regards,
Javier Carrasco

