Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608888FBE55
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 23:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F277E10E548;
	Tue,  4 Jun 2024 21:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lWKmISBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FD910E548;
 Tue,  4 Jun 2024 21:53:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhQB7hfeTXAl+UswqRp6GPg/H/NwRnPqZ3rSJQra/E9Zp3tiU8LvetugsBIC/yW0/740YxnVwucVurTkKot/SaU+yJ4fjfZAXzI3CrtIJjRYs3AU52XMTMADAWC0yZqr32Ba8C/YrmsKFKKJZo9OJujIwDKXkw0sjX8o7boaENzoPkQjk7lnMCravZ5HJBHHKpQNtxmIOlSheO9PofCLM8WfP766xCRT9BSYw6rfQNiXdw9mAVJln0gIklGN2u/J2FF9G7mm8I+un4ux7n7N7Wxb+DHS0aUvZmCljgVP8RAU6kuyZV+cgpKbCDsjAe8y5jjPsUuUhEr9k6oKdbs5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4k9j4Qt53wmiprFceGNikLMR0607WY+upt9+a+sQQuw=;
 b=UtB7jK0jg96I458SXaeJbU/yHx8qo4amZP/3IhqRQGtv137CKXXHovagxpzce9tMHiUVVwSlOWC5U3eFdw7OlQVUcjf6XRV8iHwTv1JN+UcyEhhkE1Fou4Am7cgLRO5nytYBpkNghO8UlElL6ya8o37w1i3cwnaU2iKdpc+wdPgsoxNnnkT9+uj9HTGsnmtk4ZOygqyKGyI0fPayZooXVDuVP7YJykkLesqyASACN3k+qKAW6tSpWZD7Kf4oPuUkY0jfU5/ppfDTD4OFmiQ2KyU9RMwpGsrsHLMZfQ8Rzmc40JY0THlHYFoX9TLenS2stEdAjHDBW8siH2yRIs5UKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k9j4Qt53wmiprFceGNikLMR0607WY+upt9+a+sQQuw=;
 b=lWKmISBOleXHml8O69YlXoiefDKDoNI++qIfJIuUfwN8+N+6QBvpXwZeTa3rgREDBsFrEZSWOus3iluwg8vBznyDqt7QQQf8oOJ9ZUBkr7kLPN3mxwEe20I6d8BRN3kWE/X4tT+t7iSZxkuz0shOr0aLmgohk4jjgkI+DoNs0vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 4 Jun
 2024 21:53:01 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 21:53:01 +0000
Message-ID: <32a04412-6adc-4b3d-b8fb-06643878d5a8@amd.com>
Date: Tue, 4 Jun 2024 17:52:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: Introduce 'power saving policy' drm property
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@google.com>
References: <20240522220531.32728-1-mario.limonciello@amd.com>
 <20240522220531.32728-2-mario.limonciello@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240522220531.32728-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0405.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::18) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 88267355-8ddc-45a9-e024-08dc84e0b495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TW9NYU1RSHRqNGJ2Yzg4SUM0R0RGNUVQZ0FzaVg5blEwQmxzd2xEaENyenBU?=
 =?utf-8?B?NjFnTmNad0tpNlpGeWdiYTBudDVkUGx3Y1dGUDhlRGdpWHVoTHdITFVtQWda?=
 =?utf-8?B?amoycXh3TWU0TG10cE9NTnY3bkZ2Q2lHM2hlZEt5K1E3cFhsWFphV3cvekpY?=
 =?utf-8?B?NFd4bGdablVJTzkzcE5TUVpUdW9aQjRJb0VvN3ZaRW16cyt0S2tPQUp1ek1M?=
 =?utf-8?B?czJFZld6cjUyZE1ybndjYW9xV0NRbVJKd29aeUZhOVpaVkMrQ1Y4MFp4L3h6?=
 =?utf-8?B?WmRTdUF4V2VCUEo3alc4ZGhYcldIc3RMZUw0RmdJUVVLdTA2MDFOYXVRT0ZK?=
 =?utf-8?B?YlVOT1NmNXBiUEFGdGFYTlhzbGNJaVAwREdPVTRiUWY0REFnbXEwUjMva1dl?=
 =?utf-8?B?UjdyVFRNM3hmRDdKNHF5TjRrWWZ0OWhmbWUwWW5Pc2NnaklnS1dNM005ZDZy?=
 =?utf-8?B?N09ma3ZrMkpyZXNrSXk5SEkwUStjNUlpZ3lneHFsaFN3azlTUjY5Ky9kcWcx?=
 =?utf-8?B?OHZ2cnRtRFFBSC9QSlV2SE13NG5LSGdWRDk2M1pLSXV4OFRDc1VJM2JncDN1?=
 =?utf-8?B?bEg2QjY0TzlaTGVRbmN4VW5vV3pmdGdUQ0dLbWwyc2ErQ0tubWk1cTVxM2U4?=
 =?utf-8?B?SXo2YVFhQjdCU0p3ME45aDNXK1NTcm5yTjhzamhLcXYvMjFLbVo4dUQrblha?=
 =?utf-8?B?azVhcDhFRnRTbVpDT3JZL2VIalJKcnZSd1ZiWmFzSWI3RkJTMXpHMStzcHgr?=
 =?utf-8?B?Q2tKRzJ5VVVNMkhjTkJ2eEFGRUllaStXa1cwZ3dlblNxRGUvS0hqbWV6am10?=
 =?utf-8?B?aEp1d1k2NWtlYUxJOWlBVG02T3E3WHVMUjdYTVNKUWFDMHNhbHd5VHNjRE5z?=
 =?utf-8?B?cXFpSHh1cEhWQmY3WEQ4YlBCcUdYeWYzZFFncGkyb3RHZGdKQ0NESUVMT2xs?=
 =?utf-8?B?QjN3T2xXVHdlUnRzTG5SWEVLanQ4Yzh1SWpreE5UVXJRQ0RTVld1aXM2L0xa?=
 =?utf-8?B?TGs3MC9WWlJXWldtWWNPOHRkWi9QRXhqU25LaEQxRGRKZ2lkL3JSLzFrZHAw?=
 =?utf-8?B?cWpNTHdKMmtnNHRRUlYzM0JXZlRxWWFEZk5xM1hsL21ZRG14bDk0VW5nTFZX?=
 =?utf-8?B?ZmxWSlpqa0w2WmhZK0w2UGtMY2t2VE5DaEhsWlI4Z3FQOFdQS3V3NEFtK1kw?=
 =?utf-8?B?R0JNcEF6QlhGT3NBV090STZ0aVhzS1A2KzlzckRXUlJsRFpzbGpHUTVUYXlp?=
 =?utf-8?B?WjY0WHg1bFY0bUkyNk8rY2FHanFMSmhVUFJiQ3luTjBxT3RkUWN5RjN0SmFY?=
 =?utf-8?B?akpGTFhUVXlWZDlrOENmQVlNUkJQMGx0TmN6bFBNMlRwTVNNRmJoS3lObWI3?=
 =?utf-8?B?OUtNSzhBd2R4c2xaSHdHVFJhL1RrWXlKSVFiMnNHQnN2dEhuK1hDVk9mVjAr?=
 =?utf-8?B?cG0wQlBmeUM3TmRMbWt6VThwU1ZmSFpnQnZaYysxQXFONityZnF1YVdiaEFV?=
 =?utf-8?B?NmFJWlBNTlQ5Yk16RjJhaFY4eG9jdnRIQ3pjc2J1dzVYQlREaFIwN1hBTFd0?=
 =?utf-8?B?dlRtUTMreDBDTXN5RndzQkRGRjdzdnJuaTVYTldwNVZoNEFTU0N5M3FzYTJ3?=
 =?utf-8?B?clZRMHpVeEYxanFTZ3JVNnBRV3JBbGI1SzdUc0pvUHowQVdSKy9WdHNweHd1?=
 =?utf-8?B?SDVUWnRCZ1RhQVc1R2FhVElIQmVobDlaKzlyam1KSGg3SkYvMzY1RVdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnUxZ2F1Vm5hUWZ4a1RZYUJ5NVFVamplTDVwT1lwTFFTK1YxVGtzeWo5Wm1M?=
 =?utf-8?B?YVFqdExCMHlDeldJNVZSSVJaa1FPd3FTWjJQem1qUjJuc2dvUjlFODlHV1Qr?=
 =?utf-8?B?d1cyWlFTMnlCTTc4aEs1VEpsRm52V1RKUnF5M2E3aGcwaUZJMzlQQjlIRjlX?=
 =?utf-8?B?NWhyWnR5YTNHVjB4VkJCVU1OcVVLNXZZL09XKzVreUhkZ0w1bVpIeE1tT3hj?=
 =?utf-8?B?a2hjTmE1WDFBZzhZZVZpRHU4ZjBEdDdaTE4rVlRiWS9wcExkTVlqSnNmSndq?=
 =?utf-8?B?TTZjeVZVTTlCeElsLzlRZVNIcG9WLzVFZS90N2VqbWJiOGhvNkZwdXlPQ21Q?=
 =?utf-8?B?b2xjbHUvQUpjQXRHZkErS04vOEs2NHBnbFZjSXJTeW5SUDJGbkJ4Y3NDc2pG?=
 =?utf-8?B?THZtR05zb1QreWVYYnVzd2hHMVNEWFR1KzRVQTMweVRDVEdVVE0yaER2aG52?=
 =?utf-8?B?WFBlV0Ztb1BQQjd6OW85UnZEMGw0ajhnb2Qrbjc2QlJzNDI1c2xrL2k0MDQz?=
 =?utf-8?B?N0VtcWRoRjM4bTFRQ3p0anozby9Ub3RGaGg2elNVSUMyMmNDTjh5WTlxQy8v?=
 =?utf-8?B?RWRUQ0YvM0dqbXZMRWxXTzZWWDljTUt6V2Y4VnlITVlpeEpSWWdzZkVOSnI3?=
 =?utf-8?B?Q0VOM2trd1M3MUwxc0RyYVZHaHV5RE4zUXJLb09XcE92ZTNpNVFJWWJITFhD?=
 =?utf-8?B?US8yU1VpcDVnV21kUWtnWTZKMkhQZjFRK0ROY1pKTTd0VXhHam1FbkZ1N2xx?=
 =?utf-8?B?RW9YQUNGT2lLQ3J6Z3hRaDNJM0NKbW01a05ZaWtJNmE2VUJUTnF5T05XeXdz?=
 =?utf-8?B?VWNyMTV1cnI5d1NXUGJzNjhodVl5M1RTV2JSc05PaytGbUxjcFYycHdKWnFx?=
 =?utf-8?B?SkJ1UXQ4bHZjejNCdStBd2JPMFU1Q1hoSS8yUHlGRzVVYTk5RWRPNzlHY0tO?=
 =?utf-8?B?ZUdvcEN5MDdackZ6SHc2UGJaL2R0Z3RodGY5SFlNZCtDWlN6T3FFL3JUQ3lv?=
 =?utf-8?B?cVZLWGtLeUJ5Z2dCNU5HZjlPaTJhMG5mYUNzaXE4RGo4K0VJTWk0VUZxWEdK?=
 =?utf-8?B?NG9ncmh6OHVSemRJdmxraHFvSzZUOWZYTzZCTHgvRTAzMGtOSjRMTCtwVEdj?=
 =?utf-8?B?Mk54QnY2c2htSEY5TUVFVjFtY1pjOXZyMnM2ajh6aStXeGtuRWhQZ1d1R043?=
 =?utf-8?B?TE40RHh2ZGFsb2x2NzFaYWRGaW9nQ1I0d2k0VG9kb3RNbCtlQnh2NSt6YkY1?=
 =?utf-8?B?emg3eFo3R0hWbWdxbGZ6MkhLTTQrU2tiakRpMVp1cGhQdWl0SlBKMDhOcVFh?=
 =?utf-8?B?QjJSZ0RqbkVXMDZrS1BNZ0dDcDdSdDBoR202RVVWMkxvbWs2Y01xQmlpRkh6?=
 =?utf-8?B?MFZ4akdBY2NrbGhNeXZ4TW9LUys1ZVp2cENyd3k1RWlYenowektmbjBnbmpJ?=
 =?utf-8?B?RGxENDdCM1huQXUzTEpLVWhzTTNqaWpKczFEVDN6d2ErK1Q4NWhqUEQzSHZx?=
 =?utf-8?B?MjRLSnBWWis4MGcrQWdKaFpUbXUyQW9jWk1FamNXMVVWSEN5K0ZFcXVLVHlX?=
 =?utf-8?B?NUdSeW9VTjRuTkhZWGpGcFdyMG85cmNnVC9xNGttYUdITWdGSkNFciszU3Ns?=
 =?utf-8?B?eFB1STBpVDRSd1EzaTdwTk5pTnliN1EvTTFaTUJueDZyTEVBWGVVcEcwTERx?=
 =?utf-8?B?NGUveWNPQzFxcDZlbkFsaUo0VzBsTDZkbXpZanE5OFlBOXk2T3diSFZ1d3Vy?=
 =?utf-8?B?RE9PZ2thdjZLVTJCcFVHc0ZVRFBXREVCZXROSlRSR3FQZUFwRkk4Q0hpK3JI?=
 =?utf-8?B?ZXpsNjNvVUYvM3NCU25HcE1sV2FVay94OXFYM3VvYTRqcFhHT2VJaEpBWGpN?=
 =?utf-8?B?aFhRVEo3dENDQ0J2VVJkK2pNNUhaVE8yT0FzZWhPU1ZXdUtOZjN3bVh1UTBm?=
 =?utf-8?B?MnlOZDQzSlAwaDhJVisyRWVxWjRITC8xZWx4STk0R0g1YmNMSi91TVdhRmY5?=
 =?utf-8?B?SXZmYzArNlVNMFhFaHZKVTZEZCtlVy9iTFJiUU5McUNVYmZvYy9DSUxHM1V6?=
 =?utf-8?B?MW92akFyN0liZ25pWTFFUVRYQnNkQ0RFcm04Q25JSnNzK01SMmNSd2s2Vm5Z?=
 =?utf-8?Q?jIkA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88267355-8ddc-45a9-e024-08dc84e0b495
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 21:53:01.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1AtZ2SufprUf3UTrzYLGfymPazFfr+1MMyab1gNgIhTo4/K1U2lQmvUOojrMxKTB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900
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



On 2024-05-22 18:05, Mario Limonciello wrote:
> The `power saving policy` DRM property is an optional property that
> can be added to a connector by a driver.
> 
> This property is for compositors to indicate intent of policy of
> whether a driver can use power saving features that may compromise
> the experience intended by the compositor.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Leo Li <sunpeng.li@amd.com>

Thanks!
> ---
>   drivers/gpu/drm/drm_connector.c | 46 +++++++++++++++++++++++++++++++++
>   include/drm/drm_connector.h     |  2 ++
>   include/drm/drm_mode_config.h   |  5 ++++
>   include/uapi/drm/drm_mode.h     |  7 +++++
>   4 files changed, 60 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 4d2df7f64dc5..088a5874c7a4 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -961,6 +961,11 @@ static const struct drm_prop_enum_list drm_scaling_mode_enum_list[] = {
>   	{ DRM_MODE_SCALE_ASPECT, "Full aspect" },
>   };
>   
> +static const struct drm_prop_enum_list drm_power_saving_policy_enum_list[] = {
> +	{ __builtin_ffs(DRM_MODE_REQUIRE_COLOR_ACCURACY) - 1, "Require color accuracy" },
> +	{ __builtin_ffs(DRM_MODE_REQUIRE_LOW_LATENCY) - 1, "Require low latency" },
> +};
> +
>   static const struct drm_prop_enum_list drm_aspect_ratio_enum_list[] = {
>   	{ DRM_MODE_PICTURE_ASPECT_NONE, "Automatic" },
>   	{ DRM_MODE_PICTURE_ASPECT_4_3, "4:3" },
> @@ -1499,6 +1504,16 @@ static const u32 dp_colorspaces =
>    *
>    *	Drivers can set up these properties by calling
>    *	drm_mode_create_tv_margin_properties().
> + * power saving policy:
> + *	This property is used to set the power saving policy for the connector.
> + *	This property is populated with a bitmask of optional requirements set
> + *	by the drm master for the drm driver to respect:
> + *	- "Require color accuracy": Disable power saving features that will
> + *	  affect color fidelity.
> + *	  For example: Hardware assisted backlight modulation.
> + *	- "Require low latency": Disable power saving features that will
> + *	  affect latency.
> + *	  For example: Panel self refresh (PSR)
>    */
>   
>   int drm_connector_create_standard_properties(struct drm_device *dev)
> @@ -1963,6 +1978,37 @@ int drm_mode_create_scaling_mode_property(struct drm_device *dev)
>   }
>   EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
>   
> +/**
> + * drm_mode_create_power_saving_policy_property - create power saving policy property
> + * @dev: DRM device
> + * @supported_policies: bitmask of supported power saving policies
> + *
> + * Called by a driver the first time it's needed, must be attached to desired
> + * connectors.
> + *
> + * Returns: %0
> + */
> +int drm_mode_create_power_saving_policy_property(struct drm_device *dev,
> +						 uint64_t supported_policies)
> +{
> +	struct drm_property *power_saving;
> +
> +	if (dev->mode_config.power_saving_policy)
> +		return 0;
> +	WARN_ON((supported_policies & DRM_MODE_POWER_SAVING_POLICY_ALL) == 0);
> +
> +	power_saving =
> +		drm_property_create_bitmask(dev, 0, "power saving policy",
> +					    drm_power_saving_policy_enum_list,
> +					    ARRAY_SIZE(drm_power_saving_policy_enum_list),
> +					    supported_policies);
> +
> +	dev->mode_config.power_saving_policy = power_saving;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_mode_create_power_saving_policy_property);
> +
>   /**
>    * DOC: Variable refresh properties
>    *
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index fe88d7fc6b8f..b0ec2ec48de7 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2025,6 +2025,8 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
>   					   u32 supported_colorspaces);
>   int drm_mode_create_content_type_property(struct drm_device *dev);
>   int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
> +int drm_mode_create_power_saving_policy_property(struct drm_device *dev,
> +						 uint64_t supported_policies);
>   
>   int drm_connector_set_path_property(struct drm_connector *connector,
>   				    const char *path);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 973119a9176b..32077e701e2f 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -954,6 +954,11 @@ struct drm_mode_config {
>   	 */
>   	struct drm_atomic_state *suspend_state;
>   
> +	/**
> +	 * @power_saving_policy: bitmask for power saving policy requests.
> +	 */
> +	struct drm_property *power_saving_policy;
> +
>   	const struct drm_mode_config_helper_funcs *helper_private;
>   };
>   
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 7040e7ea80c7..c2c86623552c 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -152,6 +152,13 @@ extern "C" {
>   #define DRM_MODE_SCALE_CENTER		2 /* Centered, no scaling */
>   #define DRM_MODE_SCALE_ASPECT		3 /* Full screen, preserve aspect */
>   
> +/* power saving policy options */
> +#define DRM_MODE_REQUIRE_COLOR_ACCURACY	BIT(0)	/* Compositor requires color accuracy */
> +#define DRM_MODE_REQUIRE_LOW_LATENCY	BIT(1)	/* Compositor requires low latency */
> +
> +#define DRM_MODE_POWER_SAVING_POLICY_ALL	(DRM_MODE_REQUIRE_COLOR_ACCURACY |\
> +						 DRM_MODE_REQUIRE_LOW_LATENCY)
> +
>   /* Dithering mode options */
>   #define DRM_MODE_DITHERING_OFF	0
>   #define DRM_MODE_DITHERING_ON	1
