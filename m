Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E305A1BFF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 00:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF77210E3BC;
	Thu, 25 Aug 2022 22:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6281010E37E;
 Thu, 25 Aug 2022 22:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFu6OfJAm7kH9WAmnqf23d2OrSBWI+PqgTHrYDjSXZenZitbkd9lvM5PDasoFXcXRNn+xTFrZ3orq0vKtFII44oQdSgcYbRkaZAhLx+TZ3ToKN5kOaJIWIQf9vm7MzL0el3w3YC6UkuA+w1SSDyW3W7O5tJXK1Gkr0b4+1ktxImFM2FbQbB3TD2GHviGNpvaiQ69qUoTL5fHjcZbBAQ+gjIrYNdsWyMHIEKhT5zOgk033Xq2u7L/w7Ir/c2VeV7ukTnMBX80/wqgl511Hk6G2qmgr66aFgN5GmJyzGkb3+A/sfWd3fQZI/XMaaRTYGaxpINFcpFOFEXRwt/HJKzqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzOnNrMVb9n4jzdfZCm0d8X8JjCYqOUk5LdVrYVJfJw=;
 b=bbhMZxBokki5bMZ3Ze+lKclCFeqbuEtYMLDSeRsLIK0xtJiX2fbHSo7VIQf7bdr3n9WkaNHcSyJVMIGFjuywAM7pA42EiS49DcGqF0u8gS5+NKEAMZccfNPUqYoaxiMk12ntW0PS2zSBNNSogZeb9vz3W7A34QD1UHzGHJ0sj/DPdI5E7qlvjLJfjh/KV9qdrxTD7l0f7kOiiAV+ol7fyqx/U43QO8DFdvLFXhBdOOMH5zy6ZGHTe0ZjZIvUepEPMJdMzOwyZcG5CIz59nQgWRtv21w05nVXQeusyvrl6fny5twWdQ3Ypt+Yv9hkTTCjIwiK9vZLE90tWceazsVDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzOnNrMVb9n4jzdfZCm0d8X8JjCYqOUk5LdVrYVJfJw=;
 b=Zxxn5f0BLwp5dC1cJcxp2X17C70jnZL9rKtk/LPfs8WxAgl+5wo4ro84i/eFj+Pw6wUyeBoaRN4ZOfwSSiuG4J+UbWa6BimNGC4PAxvOZFYeCl0bhO6UbqkFMBIsznhKgOUvVOGRdVTG+v6LbXF5S2fchFeWpah1ONBe+RP+QjKyeZ/MDmPnwyfOXcS/qOAI5ScG1DBLA7l+wql7dx/zcrr6fbdCYZRtXauUCLujCJxvOlX8M0ysAdXZgFFow8ycCpfEPMu3YX5Bpa76UtlNYOYsCIrNeNILHg0za8AZYPuFmjTiDYPUq64K+muacWroxIgjuJhTDJUc0BvyzShpmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2763.namprd12.prod.outlook.com (2603:10b6:5:48::16) by
 CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Thu, 25 Aug 2022 22:12:02 +0000
Received: from DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02]) by DM6PR12MB2763.namprd12.prod.outlook.com
 ([fe80::6012:2e0d:2697:8b02%3]) with mapi id 15.20.5566.014; Thu, 25 Aug 2022
 22:12:02 +0000
Subject: Re: [PATCH v5 15/31] platform/x86: nvidia-wmi-ec-backlight: Move fw
 interface definitions to a header (v2)
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
 <20220825143726.269890-16-hdegoede@redhat.com>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <4201ab83-a859-8533-b93b-88c012514590@nvidia.com>
Date: Thu, 25 Aug 2022 17:11:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20220825143726.269890-16-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SN7PR18CA0024.namprd18.prod.outlook.com
 (2603:10b6:806:f3::33) To DM6PR12MB2763.namprd12.prod.outlook.com
 (2603:10b6:5:48::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b39267ba-849a-4989-1aaf-08da86e6d5fd
X-MS-TrafficTypeDiagnostic: CH2PR12MB4277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: saj/WwOupsgi6rU06sJ41tVGdIsFFaqjGAq+8EAu99mQoZcpw4El/+jMKqzpyEfZPxzdUNhFMyYUOkKrnVz2A/NPesi7PuR2q5CIT8nZ7Iq8ICQq2GB4VtoY5ONYrRg2WuHmgl7OAVtcJqGxgaAFu4KmKzcAWQNfwuNoK+Z3ofZIALogEL5tvU/rD3UiRB6R8LCsiwHps6/eA+8yy2w+J+Sz8SBPf+nQcLiPrnTg2P9H76ZpM2AU4R503Xl54NkJIwvRyMg8mEGr7JzK9mMFm58Un+lW0juYoNWW7Ajq5VRifQPJnw6uulRJGFk7x/2psmbOUQJZ8h2H82uslUnQZZp6kg2Vv5Nc0/IOeImwq5l5bvYigqcAiRLyrQj7Gc2OJIm1/15E1Ad77p6FLcfZG1Q1NujU14MNoU43xmy3b4QwhjJJziaHoxAYlNcZGVnAdMEXw8S06G7Nwu3+3WIJ0++nYQzcWTPINU2OvZt6j45CjXjSvdyoHW+jN0Lepz9kHh/vSzrCglhjqc9uFXlD6H/rU3HIHR+6T/8nYORQaR65wrWTSdLU2ZWXYxaGoQC5lkXlWZGhjXLY2cyBu9KkXhxbw5Qn9iVM8TouscllkdfGVfWUEMkD7B/MgBiQElLqseRQ/rjKZDZPhDKAatjZi1v1UVSLzC1MjSE8Zbq8qCXpV89VzXBqKDFrFzD0FKvhyT7yRviTN2mQqrudn6rP3txHItjYuiYHCJLDp6WZvcFoBGSgSrSKOcyCGHh9y7F5YKtGtWToRyR1TJz0cFtwIVhS66aFvhchRe9WJdEq0clP3X7cZGPSU3Bzq0BApVtz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2763.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(38100700002)(6506007)(2616005)(6486002)(186003)(53546011)(36756003)(7416002)(5660300002)(6666004)(41300700001)(478600001)(2906002)(31686004)(8936002)(4326008)(110136005)(86362001)(31696002)(26005)(6512007)(83380400001)(66946007)(54906003)(316002)(66476007)(8676002)(66556008)(921005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1JndmxLcEwyeGUvQ29kUENYdEFoM1NVVTdXTkRvK0J1VmJ3UlMxZ2R5KzBD?=
 =?utf-8?B?aFV1akNkbkJ1OEJGT0RvaGFiS0lkNWRBdVBncTVVcXN2QTAxaDdXcDBNS3Jv?=
 =?utf-8?B?Q1hkN1QwR2lEQU5YQ2FzVlRhZTQvSWhmMXpHaDBPN1BnT3JZbmkza2x2Mnhp?=
 =?utf-8?B?cEUvclF4U2c3U3NoWFRMSXd4T2NQTzZOOGJDSkVMbjJXelc1UDNhdFBoSito?=
 =?utf-8?B?NitHalVzdVNTVFMvTmhnQm9DR1hldkJMRGxVRUt1Y3pMNGMzbG5Rb1JVaEF3?=
 =?utf-8?B?SC9KdjVZRldYaUY0QlFvUGV0eEIxK1VYT1c4TEhDcTVmdDFlYVhISnJrRjNT?=
 =?utf-8?B?bk9LWXVvSnNzYUxIWlV3RmdqVW9CaFpnUnZjTjJSTlVrV1FRSC8wc3o1YkRv?=
 =?utf-8?B?aXlzMmRJdnArdWJFK1ZoanRRQ0o0dy9xaU5lZm9PdlMwZUlkTExwNHdTcWMv?=
 =?utf-8?B?Y2NkWDhVZGZQN2R4Y0FVZjZkUTNsY0tRNGlIREZlc0hHS1RzNXFUQXM5aWh2?=
 =?utf-8?B?eHFqb2JoczN3Q1R2cDZCWFZhSWRFTmorTlVyQ2JITElyREhzVkhoL0lSazBW?=
 =?utf-8?B?S0dHL3lnV0pvQ1NsSEdVdnJZUTc3RFF2djI3QXFFT2tOYVRuSW9wbFQ0QXRX?=
 =?utf-8?B?aEwyaDlTanYxNG1sZDQ4aU1pQndBSzI1d0NaaXJSY2Jpdjg2NTZsUDNTSnRU?=
 =?utf-8?B?UHh6SzgzNWFWeWRHblR3UVNNOUdVRTg0bEFXdGw2YVVnNmREeFErYkF1SmlM?=
 =?utf-8?B?Yit6eDd5eXlmcjZXQWVGUHRzKytyai9GeGptMEMycGlINW9Bd3VyV0x1R24v?=
 =?utf-8?B?UUNlZ0tSc2dlNDlocEtyWXJiNXZ1ZHI3OTdoU2tnTFhaNXo2K0U3emp3azF6?=
 =?utf-8?B?SEdHZkRvZUd3Vkp2bkIvKzR0bWdKbWJwR0dnSVpFcGFQbDFLbE1QU2JWejZ5?=
 =?utf-8?B?dGpydEZrV0NzVXFrTGwrSHkrak1mTEMzR3BtUmdiUFNHRllZMUJoM2lPdW5O?=
 =?utf-8?B?Z0NQM1N1aEwvV3FuYUl0Y0V5ellhaE1ZUHR2TkRtRjROYmUxMDdhcldwVG5O?=
 =?utf-8?B?THk5N3BQMkt4NkROVkVQTHJ2QkxlVys1cVE2clA1WTlrL0NrYWtoTWlKdWtN?=
 =?utf-8?B?VVFEcUVXaUIzUkhxdkEvYy91ejZUTThLdnNRd1hydDliV2FXYmRFd2E4bXcx?=
 =?utf-8?B?QUdybENFeExYMXl1ODR2ZzFOaWR3S0FDZ253QTlrV0FQTmFIaWxKanpva3FQ?=
 =?utf-8?B?OWc0WUhiUEZQdTBFQzdsR0pWRHBRWnpuVGtJRVVyaC9Bc01uU0VlTVkraW0z?=
 =?utf-8?B?ZWpjSXV2VUdaQmI2NnhsNU9xSk4rRmxqTmEvNm1iMC9MblFKTURoL2puU0V5?=
 =?utf-8?B?bXlBKzhEKzhDMXpkcndoWnhkcWhnZHpKUTNhdHFkYkxFbTg0U3JiTEdiN1Z1?=
 =?utf-8?B?WnByOUhWZTNMRFREL2RXR1dZZmswb1JuZVdPbUZHNWpja1JKa2FnNWp6a2hX?=
 =?utf-8?B?ZERIMTRCY20xWnJSSytveXVrMmFaQ2w3Rmhzc0tLMDcvUStucGE5dE1oYmtP?=
 =?utf-8?B?R3lCRjRlSlNwNDZQaC9ISFVvZlFzOVdOSHhjWHByNG0xd2QwdmM4Rzd0Qm1n?=
 =?utf-8?B?ZFRuYTNkTzJvOHNHc2ttb2k1NlBJTVgrNkpkQXkwS2NxTWNIeVdDRmZkKzlu?=
 =?utf-8?B?cVl0WDdsSXYzcFJEVVFmLzR0OERuUThHQ3RTbkpyWlJXajJyd2J0elZoSy96?=
 =?utf-8?B?RVUyWDJaemRZclA1RTBSUUtyTXVTSVZVNUM4SHhMSE9nOFdtOE5aZjVlYUUz?=
 =?utf-8?B?QmRzbXJ4SVBIQ3YwbzVFUXhoSldvNXFIbXl1V3h6bEpaYk1RRkhxcURhclRr?=
 =?utf-8?B?dlVOOGZHOWxNN1pXaVo5K3lqZlZHaVMxZVE5YUthckw3NFI3UndYUzNYUC9F?=
 =?utf-8?B?S2g3V1FXRnFvcGsrS2NOZnJGYmpkYnVBeVowcFBiYW4yVWx3ZndGY2FYZTJB?=
 =?utf-8?B?bHdqdkJEcGdhWEhTV2MxMmVhMzRMR0M4T2pzYU1YNGZmbjUySEl3cTJ1akd4?=
 =?utf-8?B?dHZvckNLUGFvUzhUK245Y2t0R21FNWhVVGt1a0pNREducHYrcE13OHNBclNV?=
 =?utf-8?Q?zRv/VZp73D9P0G3XvGmp7k3NJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39267ba-849a-4989-1aaf-08da86e6d5fd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2763.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 22:12:01.9893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ub5uaQeHeGxC12euUqn0YTi+X38/dm1f01Q4GFJiwTSRyPXKSoU6rNBVQIQtEhcSpPHHy29pXVefO6xivxi+6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277
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
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, Hans.

Reviewed-by: Daniel Dadap <ddadap@nvidia.com>

On 8/25/22 9:37 AM, Hans de Goede wrote:
> Move the WMI interface definitions to a header, so that the definitions
> can be shared with drivers/acpi/video_detect.c .
>
> Changes in v2:
> - Add missing Nvidia copyright header
> - Move WMI_BRIGHTNESS_GUID to nvidia-wmi-ec-backlight.h as well
>
> Suggested-by: Daniel Dadap <ddadap@nvidia.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   MAINTAINERS                                   |  1 +
>   .../platform/x86/nvidia-wmi-ec-backlight.c    | 68 +----------------
>   .../x86/nvidia-wmi-ec-backlight.h             | 76 +++++++++++++++++++
>   3 files changed, 78 insertions(+), 67 deletions(-)
>   create mode 100644 include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d7f64dc0efe..d6f6b96f51f7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14527,6 +14527,7 @@ M:	Daniel Dadap <ddadap@nvidia.com>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Supported
>   F:	drivers/platform/x86/nvidia-wmi-ec-backlight.c
> +F:	include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
>   
>   NVM EXPRESS DRIVER
>   M:	Keith Busch <kbusch@kernel.org>
> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> index 61e37194df70..be803e47eac0 100644
> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> @@ -7,74 +7,10 @@
>   #include <linux/backlight.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
> +#include <linux/platform_data/x86/nvidia-wmi-ec-backlight.h>
>   #include <linux/types.h>
>   #include <linux/wmi.h>
>   
> -/**
> - * enum wmi_brightness_method - WMI method IDs
> - * @WMI_BRIGHTNESS_METHOD_LEVEL:  Get/Set EC brightness level status
> - * @WMI_BRIGHTNESS_METHOD_SOURCE: Get/Set EC Brightness Source
> - */
> -enum wmi_brightness_method {
> -	WMI_BRIGHTNESS_METHOD_LEVEL = 1,
> -	WMI_BRIGHTNESS_METHOD_SOURCE = 2,
> -	WMI_BRIGHTNESS_METHOD_MAX
> -};
> -
> -/**
> - * enum wmi_brightness_mode - Operation mode for WMI-wrapped method
> - * @WMI_BRIGHTNESS_MODE_GET:            Get the current brightness level/source.
> - * @WMI_BRIGHTNESS_MODE_SET:            Set the brightness level.
> - * @WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL:  Get the maximum brightness level. This
> - *                                      is only valid when the WMI method is
> - *                                      %WMI_BRIGHTNESS_METHOD_LEVEL.
> - */
> -enum wmi_brightness_mode {
> -	WMI_BRIGHTNESS_MODE_GET = 0,
> -	WMI_BRIGHTNESS_MODE_SET = 1,
> -	WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL = 2,
> -	WMI_BRIGHTNESS_MODE_MAX
> -};
> -
> -/**
> - * enum wmi_brightness_source - Backlight brightness control source selection
> - * @WMI_BRIGHTNESS_SOURCE_GPU: Backlight brightness is controlled by the GPU.
> - * @WMI_BRIGHTNESS_SOURCE_EC:  Backlight brightness is controlled by the
> - *                             system's Embedded Controller (EC).
> - * @WMI_BRIGHTNESS_SOURCE_AUX: Backlight brightness is controlled over the
> - *                             DisplayPort AUX channel.
> - */
> -enum wmi_brightness_source {
> -	WMI_BRIGHTNESS_SOURCE_GPU = 1,
> -	WMI_BRIGHTNESS_SOURCE_EC = 2,
> -	WMI_BRIGHTNESS_SOURCE_AUX = 3,
> -	WMI_BRIGHTNESS_SOURCE_MAX
> -};
> -
> -/**
> - * struct wmi_brightness_args - arguments for the WMI-wrapped ACPI method
> - * @mode:    Pass in an &enum wmi_brightness_mode value to select between
> - *           getting or setting a value.
> - * @val:     In parameter for value to set when using %WMI_BRIGHTNESS_MODE_SET
> - *           mode. Not used in conjunction with %WMI_BRIGHTNESS_MODE_GET or
> - *           %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL mode.
> - * @ret:     Out parameter returning retrieved value when operating in
> - *           %WMI_BRIGHTNESS_MODE_GET or %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL
> - *           mode. Not used in %WMI_BRIGHTNESS_MODE_SET mode.
> - * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
> - *
> - * This is the parameters structure for the WmiBrightnessNotify ACPI method as
> - * wrapped by WMI. The value passed in to @val or returned by @ret will be a
> - * brightness value when the WMI method ID is %WMI_BRIGHTNESS_METHOD_LEVEL, or
> - * an &enum wmi_brightness_source value with %WMI_BRIGHTNESS_METHOD_SOURCE.
> - */
> -struct wmi_brightness_args {
> -	u32 mode;
> -	u32 val;
> -	u32 ret;
> -	u32 ignored[3];
> -};
> -
>   /**
>    * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
>    * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
> @@ -191,8 +127,6 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
>   	return PTR_ERR_OR_ZERO(bdev);
>   }
>   
> -#define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> -
>   static const struct wmi_device_id nvidia_wmi_ec_backlight_id_table[] = {
>   	{ .guid_string = WMI_BRIGHTNESS_GUID },
>   	{ }
> diff --git a/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h b/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
> new file mode 100644
> index 000000000000..23d60130272c
> --- /dev/null
> +++ b/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#ifndef __PLATFORM_DATA_X86_NVIDIA_WMI_EC_BACKLIGHT_H
> +#define __PLATFORM_DATA_X86_NVIDIA_WMI_EC_BACKLIGHT_H
> +
> +#define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> +
> +/**
> + * enum wmi_brightness_method - WMI method IDs
> + * @WMI_BRIGHTNESS_METHOD_LEVEL:  Get/Set EC brightness level status
> + * @WMI_BRIGHTNESS_METHOD_SOURCE: Get/Set EC Brightness Source
> + */
> +enum wmi_brightness_method {
> +	WMI_BRIGHTNESS_METHOD_LEVEL = 1,
> +	WMI_BRIGHTNESS_METHOD_SOURCE = 2,
> +	WMI_BRIGHTNESS_METHOD_MAX
> +};
> +
> +/**
> + * enum wmi_brightness_mode - Operation mode for WMI-wrapped method
> + * @WMI_BRIGHTNESS_MODE_GET:            Get the current brightness level/source.
> + * @WMI_BRIGHTNESS_MODE_SET:            Set the brightness level.
> + * @WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL:  Get the maximum brightness level. This
> + *                                      is only valid when the WMI method is
> + *                                      %WMI_BRIGHTNESS_METHOD_LEVEL.
> + */
> +enum wmi_brightness_mode {
> +	WMI_BRIGHTNESS_MODE_GET = 0,
> +	WMI_BRIGHTNESS_MODE_SET = 1,
> +	WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL = 2,
> +	WMI_BRIGHTNESS_MODE_MAX
> +};
> +
> +/**
> + * enum wmi_brightness_source - Backlight brightness control source selection
> + * @WMI_BRIGHTNESS_SOURCE_GPU: Backlight brightness is controlled by the GPU.
> + * @WMI_BRIGHTNESS_SOURCE_EC:  Backlight brightness is controlled by the
> + *                             system's Embedded Controller (EC).
> + * @WMI_BRIGHTNESS_SOURCE_AUX: Backlight brightness is controlled over the
> + *                             DisplayPort AUX channel.
> + */
> +enum wmi_brightness_source {
> +	WMI_BRIGHTNESS_SOURCE_GPU = 1,
> +	WMI_BRIGHTNESS_SOURCE_EC = 2,
> +	WMI_BRIGHTNESS_SOURCE_AUX = 3,
> +	WMI_BRIGHTNESS_SOURCE_MAX
> +};
> +
> +/**
> + * struct wmi_brightness_args - arguments for the WMI-wrapped ACPI method
> + * @mode:    Pass in an &enum wmi_brightness_mode value to select between
> + *           getting or setting a value.
> + * @val:     In parameter for value to set when using %WMI_BRIGHTNESS_MODE_SET
> + *           mode. Not used in conjunction with %WMI_BRIGHTNESS_MODE_GET or
> + *           %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL mode.
> + * @ret:     Out parameter returning retrieved value when operating in
> + *           %WMI_BRIGHTNESS_MODE_GET or %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL
> + *           mode. Not used in %WMI_BRIGHTNESS_MODE_SET mode.
> + * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
> + *
> + * This is the parameters structure for the WmiBrightnessNotify ACPI method as
> + * wrapped by WMI. The value passed in to @val or returned by @ret will be a
> + * brightness value when the WMI method ID is %WMI_BRIGHTNESS_METHOD_LEVEL, or
> + * an &enum wmi_brightness_source value with %WMI_BRIGHTNESS_METHOD_SOURCE.
> + */
> +struct wmi_brightness_args {
> +	u32 mode;
> +	u32 val;
> +	u32 ret;
> +	u32 ignored[3];
> +};
> +
> +#endif
