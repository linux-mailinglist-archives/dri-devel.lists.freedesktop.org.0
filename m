Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11E8FBE53
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 23:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49A910E503;
	Tue,  4 Jun 2024 21:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YyKY/8nn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FB610E475;
 Tue,  4 Jun 2024 21:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C16FvczZsMLNRt/ZDmGcth8Feqnp5aMvO9j1aLLzlCh6m1dWrIdzHoE3lZijtQHCqMZxLH+8W6dIHe/MwlANXWqG4p2e0aON6cZQFHRi/uFlped8FitiG/xCig4SJ+nqHINj9z0QuDbFBWBlEszRRQzgOWSsAvFzX2TRgrjzy4VlGnpPn+ingxBaHfskHZQ42nLP4hyV/BUT2RvSGpD6NxoBKtHrpUdXyATbO8NyHF6q39D80iE8SsQC75MSF8C1E4ISlX46mTd0p6k7d1mR06P8Wjeb/O3/fkKNOV4uB6F0xRbxb00IiNUnduWJnezS8wMgVuQqEPlSUL9tSaWaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCq3vL71pK/s4GXH4Rfb7nyEY8uATsFQn+G07rq33wE=;
 b=LIQfsiaDiAXuSj6nlzAQUx6vn/D/jXN3z3Quq8+rOonNofSfibGhiuQe3m0aekAQz0S3EE8EO8t6LtU9DnX0iuHyQXyn0oZI3xfOCFtxfKsetgHL6GKNt2WqkshIwggBcK9aJTbl6NPO9QIgB3VBB5s05boeLHAmXqPGhryc67IyFTTEREm2TPlBugujjKm1LhWIBcXtfs+hCSTwogbpetjvY/ckwpWsp2PjpldRKK00/ryu0jc0CGANx03vUTl5F0G385UL1NGNr0E9/yvSSDdZle2FNcoRdaF4VHP9/bOrPSH+T4RxY/2rVX+H/o2teGTEjVfQ6GgoMb8MRXonHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCq3vL71pK/s4GXH4Rfb7nyEY8uATsFQn+G07rq33wE=;
 b=YyKY/8nnNrWaJvpJyHku7so8Cn13eGxkmCBt5AdOkmwB5T24AHTTllA4oOugqa/gjgKAjdUql516m5Fdw/GZErkaq7LchGAY6ILZr8qf4KtlsyGBGzuC0Na6v8IJtQ14OSLrPdPOu652W2U9EEvIsQRvTE1o4r1gcU+FM6yl9dg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 4 Jun
 2024 21:52:39 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 21:52:39 +0000
Message-ID: <08cd3481-ec07-442c-aa79-bc9f68aa776b@amd.com>
Date: Tue, 4 Jun 2024 17:52:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@google.com>
References: <20240522220531.32728-1-mario.limonciello@amd.com>
 <20240522220531.32728-3-mario.limonciello@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240522220531.32728-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0401.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::25) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f70646b-2d97-4b63-b2e9-08dc84e09b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZW15cENjMEhkdk9TOEVaUGhVL3pVMm5iNDVZOHZDUVpDb0F4TXlPQVV6emo3?=
 =?utf-8?B?T1AyVkpZcmxwMmM1a0VhK1NIOGlvbjdZZ0lycmFwQzNGdWc3QkhWV1Q5Tlg4?=
 =?utf-8?B?WUQ4cUtmaE1Ic3N0OWt5OTIxUXkzS0J3TnlrcGVXM2EwaHg5Ui92YUl5SGtz?=
 =?utf-8?B?U1FRRHFVSE1tNWRDRFh4NWVjZTF0SHhJd05sVkUrcTJQMFloeEpEUDFKWGZv?=
 =?utf-8?B?RlpGRjcwSC9XT0J3eHZtdFZkaEhpR2dibGNuSmxqTnZkbTB0SzNPVk9VUWxp?=
 =?utf-8?B?UTBZeG9vOTNzQ0FXcE55N3RZWERsRTNIOURkUFJseXErc3RQWjVwdmtYZ0pt?=
 =?utf-8?B?eG5BMHZFdktYdlVHVGNObFFuOEtnaTRweTY1Q0gzUWZNZDNQRVhqS0E5UHBp?=
 =?utf-8?B?YjAzZ0JzMzlSQ2hsU2pRRzZpd2w4OG5OajBWQkVJVjEzTWhqRDcyVldDTkNY?=
 =?utf-8?B?UE8wUzIyR0xDa2hzdDhSTnVMVDJ4VTF5dWdHWGQ1RjNiTWtKc1VHVlV1ckZx?=
 =?utf-8?B?SEJzQlJYdS9tUjNEcEhmN245eWc1RzUrRmhEbXlWd2VBdE9Ic1pIczFGNFJ1?=
 =?utf-8?B?RlZpMm02MXplOVYvNGNkYXpQaDRZL1pqQTJjaHVETmU5Y20vUDM1OTZPaUFm?=
 =?utf-8?B?WGRDUElRMTkzMFM0OWV5YmZaV0NDWTJDVUFXSklqSGk4cFpTeHBwRWg5ZGJM?=
 =?utf-8?B?ZFYrUE1sOEYzWXJlRFp5d3VlTjJkdmtZa0ptTkVQVEdMTVJ5QkNMWFh3aVE2?=
 =?utf-8?B?bjYxVStVQVlhY3lSWnVrVDNXMm11SVV3TnN1bU1ZcVB6ZjA4bkdkN0x6QmpL?=
 =?utf-8?B?ODFpaDJMbkhqZ2MzOExxa2t1R1loT3hIdnAvNXkyVVJjdEJYeHBYZVlOR0ZJ?=
 =?utf-8?B?TWx6NDgwcE5CL29LaVR6N3ZRVEw3aXVLdmlhWkdlVDNvMjlyRzJUcDBIRU03?=
 =?utf-8?B?S1BnUG5DQ05UamRwVXhvRFNiZkNZbm9Wd0g4d2pQV1FqTkR3S0FNMlYrd2t1?=
 =?utf-8?B?N1hVVmtOOCtEcjU3Q2dWVmhPQ0FLeVhCbjZuSnlxZ0Y0VnlaUks4TXE5a2J3?=
 =?utf-8?B?Vk5sYmlUMzRzelpuNjNqbUZKd3NQeTJvR0N1cEN5c2xycVFLRmxQdEVRNU1h?=
 =?utf-8?B?c2ZocEVYOWhwSmpCM2dkcC93UEl2dS9haUp5QkRUeiswd3VhbFRST2pJTE45?=
 =?utf-8?B?S1gxcXJBeFBMaDRlZmZGYitxSTFhR016dmtaSmRZZ0pTQ0tVM3JiNHJCVVMy?=
 =?utf-8?B?TlNucUFZOVMweXgzSDJRMnRkcUR0cldzM2FjUzF4ODFlN2IrTFdpWWFuVzJZ?=
 =?utf-8?B?djk0QmdKTnI0VVFueFFlNGhuSWpGWTlRWGhOYkY1SFVEcjZKcWpGMVpZbHJU?=
 =?utf-8?B?Q21qSTR1R2Z6ZjRjQmp0UjIvWEtOWCtNa2dKeFZKR1h2T2R6dVlrZkJwVnd3?=
 =?utf-8?B?ZCtxZ05KSDJPZlJZYUZyOUprajMraHFMbVp4Qno0a25hSTBkb2JDUWVFeU51?=
 =?utf-8?B?c0dUT1BaeWFoMUlhQncwUStXaTF6UDl0UTlBN1N6VXEwV2Jtd0pRb0FleTlV?=
 =?utf-8?B?ZEdWeGhpZmZJMGxOQlNlSTgvTG15U2FzV0tHbFdtaWVjTlR0OFkyV0MxVDJj?=
 =?utf-8?B?ZW5nVWhCazRFVnUyV2pySGwyWmJwNExwNXVjUDE4c3FkVG5zVERzWDFxRHJV?=
 =?utf-8?B?Mjl0aTIrbFVMRk0vb3U0NWZxL3hJNVBFZTNPVGd0bzloWXhoSWVxd2NRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3p6ZEx1VUF2YXBhWjMwaDJjekpDM0IvQ3JsRTZJNks0SXhVVjd4ODh2Y3RP?=
 =?utf-8?B?WnNkOUNNVDY2UEY1R3BUcUhqczhURGNReVdVYmpQSTJrK0ZuZDBhU0F3N1l6?=
 =?utf-8?B?MlJZa2pJdWNzV0JDYnU5Q05WMTJmTVRKdFQxWE1ZeWYxd0Rqay9aM1NYT3VR?=
 =?utf-8?B?L0hwNW8rSWw4MVg4ZnI3TlovNEpLRXIxL0hQSDllRHF2alArc1ZacnJYSW8x?=
 =?utf-8?B?cDBVd2xsMkpZMnpzYTVoNVVPSGRucUtOSHYxNll6c09vbXloU1VLZWorS29p?=
 =?utf-8?B?Y3NvMExwZm5KRzQ0eTY4ckNTUnZhN2g5cXE2RWsxOS90STBGdkFZY3ZWZ1Bp?=
 =?utf-8?B?VUdBRE9mQmlRZ3lHRGtYSVZJWGFLN1BZR3BiUXQ4eC9WQWtnSGV2NTVOTDlv?=
 =?utf-8?B?R1JCbno4bVR6LzBXV1VObytkWU5wL3dEQ05ESDlTZmZjVkY0S09qU2tSVnNV?=
 =?utf-8?B?L1NOMGQxRCtvd3ZHUVVkMzlJUmdlQWM5TWJXbG1wRFpHcFc4cCs0Um9hUVFO?=
 =?utf-8?B?bmN4cVN6b3Y1WXVDRmM2OHNobmhwRWdLWDBZdGtMdUJWZHEyKzMxWDJ5RkM4?=
 =?utf-8?B?MVdYVU92VURXQTkzRlpDN2Yyc2U1bmVqQyt6TC9vOFN4S2ZJTTQ0VHlNZkJs?=
 =?utf-8?B?NDR5REh1U3ZRcVJqMy9JeTZtb1laaXJrQi9rN3ZPem1MUWlLSGdVbm9hTmtQ?=
 =?utf-8?B?bXd0d1UxaUFrQVJxN3pxZ2RUTWdCVzhlWTl1aWxKeTcxc3NpS2ExTEtBZUt6?=
 =?utf-8?B?Ny9ZYkRGam5sdEtZczVqT2E4UmY0SlJVZTdiQnlOYzEyOFJiYmwwQjduNTZi?=
 =?utf-8?B?MXNKVGJ1c25xQmF4SXN4RFR5cCs1RlBCMTdFZWNzN1I1Z3lNT3JMVDFsOWMz?=
 =?utf-8?B?UDl0SSszUUJUdFF2UmhCNlRMUnhxbXo2TUF4L3c5RlhsZXMySVZzSWVGSjJT?=
 =?utf-8?B?TkRJMnJicmJLVEoxaEJPeDlMcVZ4Y3ZxRTdwTHU1TzVCVTdsbGJyekN1ZVpK?=
 =?utf-8?B?V0VSRzhxUFVhNFZycGp2ZVN6UlNUQ2xOSWk1THVzWEVHa20xSnlVQTRFMVY3?=
 =?utf-8?B?QzZ2YzNiSURJSmlLbW51MzY2c012MmdiVERSeFVlalZDRWN5WHNycUxEMEYy?=
 =?utf-8?B?bklLZlpVc3ZkMHRqUHVGS3l1R1FwUTZJUmZUaGVaNmM0K1NiUmlXWXpURy9O?=
 =?utf-8?B?T1k2Ris2ajRZMnRnTmJDL1YvVCtPOFlxRWdTRVAyUUNxbktvQzRhemh2Z3Fq?=
 =?utf-8?B?WDRkNDc2RnZVTU53emExZ3AwVjJMZW1mTTJDcDVseWZKSXZZbE5rU0NYYVcw?=
 =?utf-8?B?QjVBV2srY242M0o3SzlKRUM4R29GWk40N0tybGJjdjhYdDZ6dW9pK3ViTmFq?=
 =?utf-8?B?emsrZm1VaXpjWmF5ejVFd1RoUHRpY3cxWk4wKzRiUC9qdHpkMUcrVm9vMzdo?=
 =?utf-8?B?T3pFK3d0YUorVXBORkRnOXBKNE5FMG5ubk5lS3hnNHoya0E2cVdyS0JQNEd5?=
 =?utf-8?B?dGNCV1JWUDJkYnBqMVVtb3E5VnRXckZQSEs4TldKek1DWXBxdkpTVGVjNElj?=
 =?utf-8?B?TWdkT295aGhRaHFNRU1oNllFTG1NQkR1SDgvTjRZeEx0RWt5bnJpN0JRdENW?=
 =?utf-8?B?L2swWEs1bDIrUThpVnRYZnBuRTllUnMyeklqVlQxQUFwZW1qYVhFeTE5OUN0?=
 =?utf-8?B?S3JFSUNSYmNydlFiNlovdnBwVHBqOHUrUHNiRmVmaGs5VTFndWE5RWsxZmcw?=
 =?utf-8?B?eHhFdUVTVGlwc3FVdlpVcDhHOTNXVDRnS2pGU0FTUzFKWTc2K2FxWi91dit1?=
 =?utf-8?B?ajkzM3ZSaklCWHBpbGVJb29GMVluR0FkY2lYWFRFTGxPdm9HaVZkazlzS3FR?=
 =?utf-8?B?QXhBTUlLUW8xckxMaWRqcC8vamNVdjFaZThyM3h2cW5wdUJmUEN2aGxvQkR3?=
 =?utf-8?B?RHdJSWhIQXlpQmUyRUxVTHQvNm14WkVUUE5lZzB0c0tlSFd2eXJQdlE4dThx?=
 =?utf-8?B?UkFiVUpBd3dsUXZuekJkQ2V6TnFwUkhNSFJ0TXg3NzVGZzd0c01JZlFZSWFM?=
 =?utf-8?B?SkxWZlhqelN6UkZtVFdqUXFQdVdJOW80RmtmMEZCRVZCS25oYkNpOW1jUVMv?=
 =?utf-8?Q?oD0Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f70646b-2d97-4b63-b2e9-08dc84e09b79
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 21:52:19.7576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dX4xPvAcvqfQlcBHOSoz9jb9zGHZCthGcL2ZRQOBXLQYV8Z62oCMSeskAEsdvk0X
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
> When the `power_saving_policy` property is set to bit mask
> "Require color accuracy" ABM should be disabled immediately and
> any requests by sysfs to update will return an -EBUSY error.
> 
> When the `power_saving_policy` property is set to bit mask
> "Require low latency" PSR should be disabled.
> 
> When the property is restored to an empty bit mask the previous
> value of ABM and pSR will be restored.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 51 +++++++++++++++++--
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
>   3 files changed, 52 insertions(+), 5 deletions(-)
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
> index 01b0a331e4a6..a480e86892de 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6421,6 +6421,13 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
>   	} else if (property == adev->mode_info.underscan_property) {
>   		dm_new_state->underscan_enable = val;
>   		ret = 0;
> +	} else if (property == dev->mode_config.power_saving_policy) {
> +		dm_new_state->abm_forbidden = val & DRM_MODE_REQUIRE_COLOR_ACCURACY;
> +		dm_new_state->abm_level = (dm_new_state->abm_forbidden || !amdgpu_dm_abm_level) ?
> +						ABM_LEVEL_IMMEDIATE_DISABLE :
> +						amdgpu_dm_abm_level;
> +		dm_new_state->psr_forbidden = val & DRM_MODE_REQUIRE_LOW_LATENCY;
> +		ret = 0;
>   	}
>   
>   	return ret;
> @@ -6463,6 +6470,13 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
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
> @@ -6489,9 +6503,12 @@ static ssize_t panel_power_savings_show(struct device *device,
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
> @@ -6515,10 +6532,16 @@ static ssize_t panel_power_savings_store(struct device *device,
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
> @@ -7689,6 +7712,13 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
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
> @@ -9344,6 +9374,11 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>   			stream_update.hdr_static_metadata = &hdr_packet;
>   		}
>   
> +		if (dm_old_con_state->psr_forbidden && !dm_new_con_state->psr_forbidden)
> +			amdgpu_dm_psr_disable(dm_new_crtc_state->stream);
> +		else if (!dm_old_con_state->psr_forbidden && dm_new_con_state->psr_forbidden)
> +			amdgpu_dm_psr_enable(dm_new_crtc_state->stream);
> +

Thanks for the patch!

Unfortunately, enabling/disabling PSR today isn't as straightforward as a call
to amdgpu_dm_psr_enable/disable. The conditions for enabling PSR is quite
convoluted and need some untangling...

For now, I think the easiest way to pipe this property through is to hijack the
`amdgpu_dm_connector->disallow_edp_enter_psr` flag. IIRC, it is currently hooked
up to a debugfs that force disables PSR for testing purposes. Eventually, we can
probably deprecate the debugfs and use this property instead.

We could change the above 'if/else if' to something like the following:

```
struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
<snip>

aconnector->disallow_edp_enter_psr = dm_new_con_state->psr_forbidden

/* immediately disable PSR if disallowed */
if (aconnector->disallow_edp_enter_psr) {
	mutex_lock(&dm->dc_lock);
	amdgpu_dm_psr_disable(dm_new_crtc_state->stream);
	mutex_unlock(&dm->dc_lock);
}
```

The moment disallow_edp_enter_psr flips to 0, the next fast update should
re-enable PSR. There isn't any guarantee of an immediate re-enable, but I think
that should be fine.


>   		status = dc_stream_get_status(dm_new_crtc_state->stream);
>   
>   		if (WARN_ON(!status))
> @@ -10019,6 +10054,12 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
>   		update_stream_scaling_settings(
>   			&new_crtc_state->mode, dm_new_conn_state, dm_new_crtc_state->stream);
>   
> +
> +	if (dm_old_conn_state->psr_forbidden && !dm_new_conn_state->psr_forbidden)
> +		amdgpu_dm_psr_disable(dm_new_crtc_state->stream);
> +	else if (!dm_old_conn_state->psr_forbidden && dm_new_conn_state->psr_forbidden)
> +		amdgpu_dm_psr_enable(dm_new_crtc_state->stream);
> +

dm_update_crtc_state() can be called as part of atomic check, so we should not 
do any hw programming here.

There aren't any reasons I can think of to reject allow/disallowing PSR either, 
so this part shouldn't be necessary and can be dropped.

Thanks,
Leo

>   	/* ABM settings */
>   	dm_new_crtc_state->abm_level = dm_new_conn_state->abm_level;
>   
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
