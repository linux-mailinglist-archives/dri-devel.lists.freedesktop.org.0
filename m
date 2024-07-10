Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2594792DA68
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 22:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE7F10E21E;
	Wed, 10 Jul 2024 20:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lgjkGjE+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8505E10E21E;
 Wed, 10 Jul 2024 20:48:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkfI6D1xHoBUg5BfjvV06SFL5jgOIUTPFCpZaPhb27sACJVUD2OnJ94/Vws6QOFb3HuvfdveCY44AmBr+WnMZisxQG9LSAOSAso/nFWbLPKN8Bermcew5XjXVXodsTOjaBdY25uPnyMY/7dRC2G5q3+5KsEum8HWuv2CCjvFhGe/nfgNW95BLNW5BdrKG2jWTtki6V/u12x00Sfg0/u0LUDzEODeEOs5nt0llYHXJn9BIw9yuutK6X2XtMDvDH6i14wSkDUYn26j+1zIOP0AL7CzPqZAvXJ4L5JFK4NnyRBboisYtOf8B0tMSRn7VO/rg8lFKguF02Nv/hizrCqUxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM4BIdomjim101DcRHTUvAy6suM/dzF2ffd0O1Rt4P8=;
 b=ZbWIAVCT5WXsBWl1EDhWqVCsimay7az6GGQbI430P7Za8vtiHuMTr15ydjHtmxXhkyen0M9rJn6cU1kCsHhDGB+qH2gfqx2pWpIWH/oMqHPjeUprkSWZW9yBAS/12OzEFXBoGUQ7SI9RKWokIi81WzxVEZfbYlniUbLpO6CV4X6wcRTwEfeAs2KlRnQxJrauLZtY/i8LFAtsh0gcWyLnWZyMXE33dmTVO8wXVjvYX/oXW5D9r9+uwYrAVd+OElCI0gi8lWi4vEA0jHz3PzzUL8zpfHl17rsi/I1vnYLgTPhVeDKYjtAJ/SqtPCDLR2lIJrnckzLgzzRdGrDjgh1l2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM4BIdomjim101DcRHTUvAy6suM/dzF2ffd0O1Rt4P8=;
 b=lgjkGjE+hIjQ99rk3wnYYkuW7AljO6nCW2MhOdeDf0Kqd76VajeIVuSAC5u4KMTLpVuEeuTTnseAnTXZ6Hl/yqLJxAcJ27EO/UjjXrDBkLG6YCi2Sl9WaLwvY6Us4BlZm+Io9onJx77Xg2j0GJZIVvxLT7O10cUzpDxVv456bUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 20:48:47 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 20:48:47 +0000
Message-ID: <e06f433d-9aa6-46a0-ad51-47fafe74e5ca@amd.com>
Date: Wed, 10 Jul 2024 16:48:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@google.com>
References: <20240703051722.328-1-mario.limonciello@amd.com>
 <20240703051722.328-3-mario.limonciello@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240703051722.328-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0091.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::28) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: aff590ac-e170-4e60-8ae2-08dca121b1e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmFrNHVLTk5rSnd0cldyQzd0eU0rNDdxblZWcGcrSmFWaXNGZVB1RzQyQnJy?=
 =?utf-8?B?Sm5SbVF5Rm1UdXpablFKUURqcVlaeXVld3VYeVFhVkhrb0xJSVZPSVVkR21t?=
 =?utf-8?B?dDhJRjk5NkxLSjZMNXh3dEV4UWdmWTIvTk9DMjh0U1B4aUNhTHRvZnJxNnA0?=
 =?utf-8?B?WGpIN0dlTGRhd0J2Z3NvemxiMGZJZkQxWVZFNWRINTE3WVVEN3hKbndKRjN0?=
 =?utf-8?B?b08rbTVIV1lMUSt2akw4ZTJ5VVFia1MwRjlVWldyZktMTnJOSFdPWTl0c25K?=
 =?utf-8?B?THkzRkYvbUJsUEM1anBCM1ltbU9jbCtZNnNPSlYzbXh6WmlhSVM3R0g3QjM3?=
 =?utf-8?B?cnhFRjJPYm9Mb1FCZ3BsM0VLQkdjNFhRQUpkNnE2RlJmdVVtU21ZNHZQZ2VR?=
 =?utf-8?B?dlFWemlOcVZ5cmlLOEYreFpzMFpPRDUvelpqWHpvdVlkQlh5bHZ1cnpVL0hD?=
 =?utf-8?B?d3Z4Y0ZXc25RR2tnMHBnWVVHZTkydFFiZm9IUm5zM0pWQmxrV04zZjFWNnBh?=
 =?utf-8?B?bTF4cUlhYlR5UkdTMHgrbU5EenFvT0g3cWhxU0dMbk15T1g5MDRHYXVhdHI0?=
 =?utf-8?B?Q1BwSHlFelFqT0VFRDJzV2lPUlE5U29pK3FlcitYQUowUGhXYlJoSG9hd3Nt?=
 =?utf-8?B?c2RyRnlQeEVwSk5XSmRjMHIvZ2x6N1JUZGZGd3E4U044Z3VNY2VPWGhaMURq?=
 =?utf-8?B?SkIwVDYvQ29uRExCRldwUUJzL25QSE9MbFFSaFh0RUN6NDFuRllGbDhBK3lF?=
 =?utf-8?B?aVRsVjJlTHJkbDlmL1l2cDJYUVFlKzQwTmZMdzRCU3o3QmkyQjJwdmVFdDRK?=
 =?utf-8?B?NHZROXV5OUp1cWI4NEwrYlhWRU1VaTBXMEh4K251eUhvYWhtSGRydnp0L0Zv?=
 =?utf-8?B?V29yWkd5Uit1M1F5MjN2dWk1Y1YzZjV1aUtBNFhKTVVYeE9Cb3N0OXZqRk1J?=
 =?utf-8?B?eFluSjlWUDc1cm1GYmFQWDNTcHFJNld0cTlSdzNhQlcvanYvZE5nTmZMZEJy?=
 =?utf-8?B?aXlXVXJpcExkMXFabWYzT1g3bEhZY0xRamxNRXNTRHBsWWpCMi85aks0OFl4?=
 =?utf-8?B?aXBXY2lWWlRwdVJjOWdKa3FqUTB2S0srMG5Rd1piRXQ3WTYxdGJsZ3FyOUtG?=
 =?utf-8?B?TlhXd0J0Tm1scnNsZ2xWeGpRZ25vRm9ZTmN1UUZUUDVybzdVd1JzbEtUalBC?=
 =?utf-8?B?aWhYZTVmUElOQmR2cjN0YURlcndadVoxYUdKQkwvMWtra1UvT1J0L0ZCUVFu?=
 =?utf-8?B?K04wZ0tIN09zNUxIeVl6ZlpyVDcxVk4ybWEwMFJnMjJya0pDRGZXcS9HVDZ3?=
 =?utf-8?B?SE9Uc0hEcXcwa0xxWUFVNzZKS1h2eHNKMGhoelYzVkdnei94azJFcTJ5ZnVU?=
 =?utf-8?B?b05YVko0QWRrVkZVY0hkMU1ocjEwWjY1K3kvWFlFcDJWOWlrTTd4Y05LajE0?=
 =?utf-8?B?b1RCbiswVktyTWRuSG13RGwzS3lkN2ZDdlJWYmh5S1FaS3F6amppWmhQSjdP?=
 =?utf-8?B?cDY0V2VhOEhpSDNpOTdxWDBYcUZ5VkhPbHFRcDhUTEREVkp1R2J3N2dVVnhs?=
 =?utf-8?B?dVpOblZuaWpDbWRQdVI4MWZYZlpDck1TbnUvdlZ4UUQwbXF3cGlKQURKNmx1?=
 =?utf-8?B?NmkyRGNXUUF0WHhWOVlRaTFKdnprS2RMV0xnUkNWUmtvZU1ybkZKTUp0M3Zp?=
 =?utf-8?B?ZnJ2WFZSUmxzVTRqM0VSV3UzbGdwU0ZyY3hVUmFTSjZsYXNkTXQzdW8rWEt4?=
 =?utf-8?B?YWJoakJyNjJhL0J2RXh0LzcwcnFqV1p3OFJiWXJuaEpqL3hnYTRFaUpRbmZ5?=
 =?utf-8?B?QnpjaVhCblIrbWhpTEFKQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjZhTFo1QWlsMmlMTTJLU2wyOFRhVW5vZ3RJTDcwWjREb0R0elJ6Vm1sNkdN?=
 =?utf-8?B?ZUpXU2RQTmlZbjRjZjB3NVp6Q0VRSDF0czNJOGZuNHVOTmQrdWRMR2FlVU1t?=
 =?utf-8?B?STc5UzRER05nSklkeHY4T09DVkJaQkhmNm03cTNtVlUrTWJoQ29WMVUvMjF0?=
 =?utf-8?B?S3FjaUZ4bitpMjQ1ZURJNzdoMm1zTk1tb25rdzJib0NsdXBzeHJseWY0ZlVT?=
 =?utf-8?B?Zm9MYmN1MkRCTVlvYkhZWHNhRS91R2RFS28zaTZNeEFsWEJ0bFpZUHU5Z0k4?=
 =?utf-8?B?aGh6VktNZmJxRUNyTzlSb2hiY0JrVndzM0FiTWdLcTlRM1NFbVNCb09WaGlO?=
 =?utf-8?B?eEM1MTBlTHdHcW5wTGxQL2xoZUVWVUdDU2JnOW4rdVZ3OTloejQxNmpPRFhy?=
 =?utf-8?B?TDR5V2pNYStrVE11Q0p0S1hWVXZOc1Q4N0l6enExY0pBK1dud0RDSmpzVDlV?=
 =?utf-8?B?SlR5YlQ0UGFiKzBrbWlseWRwYitrdFJlcHpZR2o2ZStOMlhxNDlPV0dPZ3I2?=
 =?utf-8?B?Q1dBenRQNmZKeVlxcFNiekVqTDdlcDFnVEJrZG90VzFlL0tyeTlYUlZWWW9V?=
 =?utf-8?B?MnFabklseS9FTmVXbG9jOVcyWDh5U0xxME5zdm1xalo5ZnExWWZjSUcrT04r?=
 =?utf-8?B?bHdoWHJkRXdmWmRwZGxUaUd5SU5uWkE0QUduL1Rmbk81RVQ0M0FkYnVzQXFX?=
 =?utf-8?B?dmozS3Nyam16enJZL2ZhZlRRaVVhanU1eXpRa05Xc0ZubEt5SXhMMWo5YlBx?=
 =?utf-8?B?SXIxMTIrNUxPVGJWaW0xSUl6dmhXLzN0dHl1QkhNRTBHc1dNNE95QzVLUUlJ?=
 =?utf-8?B?TmpkVUZLYkh2THI1UWJsL0cyeWRPRk40Q0c0RnlET0xHeXpLUDNxV1ZkaVA4?=
 =?utf-8?B?S3o3ZlNLYk54THdjaW1nUURIdWNIL2dxM00zRkk4YUVCR2o4OGZnS2s3WUlR?=
 =?utf-8?B?Q25STUJRVUF4d0tnbVg0cW8zN3owalIzVm9vN3NPckY0VHFnaCtzTld6SDBL?=
 =?utf-8?B?S1dXeVliUklISWhyMGhIU2VqcDk4RUxBV3pSTytJcjN5dG4xeCt1eWJlNGFt?=
 =?utf-8?B?Q2xLUkZXRWVkM2htT0ZQY3BlV0lSL29BL2dtUnVaRGd5V2xic2NXOUl0L0xZ?=
 =?utf-8?B?MkZoTVR4Tmp5dTk5Q3pCcWVYcTlqaDlsUnh0K0RYcDZRam44R0pyeUpjZnF5?=
 =?utf-8?B?M3lxdEhMYUlCc0FGVFQxTGZkeHVBWlBnTjhlMjFPajBNZjZ6K1d5eVdhVzdQ?=
 =?utf-8?B?amRqQysrTGtGalh2VFZmdnExZTV6em1jNW1RRTdZMXN5VzhnMFFLTDk0bXNt?=
 =?utf-8?B?VXpScXZteFEyZldQZnF2L1ZML3o0eWNDTGJtWUNaSHJrQjFvNVMvdFlGRGFr?=
 =?utf-8?B?alpFdmlqMGEzS1RZc2Vid0xoQ2JMditUS0xESHZtVHptVGpzdjR1NitkZW9m?=
 =?utf-8?B?SWNaRjZLTTMwQnN3cHp6NXJYOXNVMjZWejlJczBTb3ZXc2p2amJETGlVNWxT?=
 =?utf-8?B?N2lWOFlWc1NuYU0yRnNKMk1aMi9vTTZQWUF3R1JIQVQybmlHY3JrUzZaZmNE?=
 =?utf-8?B?YTlHdkl0QUpjS0VSYXZJaFVuRHc2MmNhM1NtQmdXbVNBSkJwblBoMjNXNkZz?=
 =?utf-8?B?VWVLY29vY2NvVWZuSWZIUjNzOTVzRDFEdEIzNGlpVitKVzhqMWhxRU15aUJ6?=
 =?utf-8?B?cy8yNzNxUkZ1OGI5N1VGaTc5bkh1VjRicDd6cHBUQ0hXdjVqL24rM0ZYUDVx?=
 =?utf-8?B?ZkdYMUtORE9Qb3hCZURTZ0ttRXl1blFETG81c3pCRFJzMWVjYVVaUFcrbFlS?=
 =?utf-8?B?VU5jaVg1cXVJaXphR3N4MTVHWW4rUWtvb1ZteWFoRXBORFFmMlRLNWwrRmE0?=
 =?utf-8?B?bjdoRkt6OTkwS2lkeXJsN1AxM1VCZU83VGtRME9haXVoeU03b1QrczkyTW5C?=
 =?utf-8?B?SWUveUFCWGVjbUJXd3poZlh2NElwUDl3SklYakJwRkVZbUI4K01UaTB5Wm1t?=
 =?utf-8?B?cDdxN0taT0tFa2ZpRjEvSUMxdkRDZEg0RTB5UWE1eHJIQ0lHaDdPM0JRSFA1?=
 =?utf-8?B?RkpNZE1HZUFYc1hwWGd6V1QvTGZQRmlTTTdLS1diTWdwTzQ0cjdDbEg3Q0M1?=
 =?utf-8?Q?JVgMbJ3DiqrrtwPE6S6Z75rh3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff590ac-e170-4e60-8ae2-08dca121b1e8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 20:48:47.3224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNVkSskYr1IDA+bcGB68XB7as4o4iiXZb+ajwL/PxOCwUlUnPpwEpeYslZUkbceO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243
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



On 2024-07-03 01:17, Mario Limonciello wrote:
> When the `power_saving_policy` property is set to bit mask
> "Require color accuracy" ABM should be disabled immediately and
> any requests by sysfs to update will return an -EBUSY error.
> 
> When the `power_saving_policy` property is set to bit mask
> "Require low latency" PSR should be disabled.
> 
> When the property is restored to an empty bit mask ABM and PSR
> can be enabled again.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Leo Li <sunpeng.li@amd.com>

Thanks!

> ---
> v3->v4:
>   * Fix enabling again after disable (Xaver)
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++++++++++--
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
>   3 files changed, 51 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 3ecc7ef95172..cfb5220cf182 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1350,6 +1350,10 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>   					 "dither",
>   					 amdgpu_dither_enum_list, sz);
>   
> +	if (adev->dc_enabled)
> +		drm_mode_create_power_saving_policy_property(adev_to_drm(adev),
> +							     DRM_MODE_POWER_SAVING_POLICY_ALL);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f866a02f4f48..34da987350f5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6417,6 +6417,13 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
>   	} else if (property == adev->mode_info.underscan_property) {
>   		dm_new_state->underscan_enable = val;
>   		ret = 0;
> +	} else if (property == dev->mode_config.power_saving_policy) {
> +		dm_new_state->abm_forbidden = val & DRM_MODE_REQUIRE_COLOR_ACCURACY;
> +		dm_new_state->abm_level = (dm_new_state->abm_forbidden || !dm_old_state->abm_level) ?
> +						ABM_LEVEL_IMMEDIATE_DISABLE :
> +						dm_old_state->abm_level;
> +		dm_new_state->psr_forbidden = val & DRM_MODE_REQUIRE_LOW_LATENCY;
> +		ret = 0;
>   	}
>   
>   	return ret;
> @@ -6459,6 +6466,13 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>   	} else if (property == adev->mode_info.underscan_property) {
>   		*val = dm_state->underscan_enable;
>   		ret = 0;
> +	} else if (property == dev->mode_config.power_saving_policy) {
> +		*val = 0;
> +		if (dm_state->psr_forbidden)
> +			*val |= DRM_MODE_REQUIRE_LOW_LATENCY;
> +		if (dm_state->abm_forbidden)
> +			*val |= DRM_MODE_REQUIRE_COLOR_ACCURACY;
> +		ret = 0;
>   	}
>   
>   	return ret;
> @@ -6485,9 +6499,12 @@ static ssize_t panel_power_savings_show(struct device *device,
>   	u8 val;
>   
>   	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> -	val = to_dm_connector_state(connector->state)->abm_level ==
> -		ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
> -		to_dm_connector_state(connector->state)->abm_level;
> +	if (to_dm_connector_state(connector->state)->abm_forbidden)
> +		val = 0;
> +	else
> +		val = to_dm_connector_state(connector->state)->abm_level ==
> +			ABM_LEVEL_IMMEDIATE_DISABLE ? 0 :
> +			to_dm_connector_state(connector->state)->abm_level;
>   	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>   
>   	return sysfs_emit(buf, "%u\n", val);
> @@ -6511,10 +6528,16 @@ static ssize_t panel_power_savings_store(struct device *device,
>   		return -EINVAL;
>   
>   	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> -	to_dm_connector_state(connector->state)->abm_level = val ?:
> -		ABM_LEVEL_IMMEDIATE_DISABLE;
> +	if (to_dm_connector_state(connector->state)->abm_forbidden)
> +		ret = -EBUSY;
> +	else
> +		to_dm_connector_state(connector->state)->abm_level = val ?:
> +			ABM_LEVEL_IMMEDIATE_DISABLE;
>   	drm_modeset_unlock(&dev->mode_config.connection_mutex);
>   
> +	if (ret)
> +		return ret;
> +
>   	drm_kms_helper_hotplug_event(dev);
>   
>   	return count;
> @@ -7685,6 +7708,13 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>   	aconnector->base.state->max_bpc = 16;
>   	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
>   
> +	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
> +	    (dc_is_dmcu_initialized(adev->dm.dc) ||
> +	     adev->dm.dc->ctx->dmub_srv)) {
> +		drm_object_attach_property(&aconnector->base.base,
> +				dm->ddev->mode_config.power_saving_policy, 0);
> +	}
> +
>   	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
>   		/* Content Type is currently only implemented for HDMI. */
>   		drm_connector_attach_content_type_property(&aconnector->base);
> @@ -9284,6 +9314,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>   	for_each_oldnew_connector_in_state(state, connector, old_con_state, new_con_state, i) {
>   		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
>   		struct dm_connector_state *dm_old_con_state = to_dm_connector_state(old_con_state);
> +		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>   		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
>   		struct dc_surface_update *dummy_updates;
>   		struct dc_stream_update stream_update;
> @@ -9337,6 +9368,15 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>   			stream_update.hdr_static_metadata = &hdr_packet;
>   		}
>   
> +		aconnector->disallow_edp_enter_psr = dm_new_con_state->psr_forbidden;
> +
> +		/* immediately disable PSR if disallowed */
> +		if (aconnector->disallow_edp_enter_psr) {
> +			mutex_lock(&dm->dc_lock);
> +			amdgpu_dm_psr_disable(dm_new_crtc_state->stream);
> +			mutex_unlock(&dm->dc_lock);
> +		}
> +
>   		status = dc_stream_get_status(dm_new_crtc_state->stream);
>   
>   		if (WARN_ON(!status))
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 09519b7abf67..b246e82f5b0d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -873,6 +873,8 @@ struct dm_connector_state {
>   	bool underscan_enable;
>   	bool freesync_capable;
>   	bool update_hdcp;
> +	bool abm_forbidden;
> +	bool psr_forbidden;
>   	uint8_t abm_level;
>   	int vcpi_slots;
>   	uint64_t pbn;
