Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D99F90DF2A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 00:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8F810E7DD;
	Tue, 18 Jun 2024 22:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v5FLuAKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728CA10E73E;
 Tue, 18 Jun 2024 22:36:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZonIK8MH9smVEdheG74+R/AdPq2NsRuvGS8pH3hbYdlTKcX0A1+7lls7CdF0/sArn/q8VAiKJeyczwdiOBFocqIyAYwdg+nfU0+9VCmupsSXabEaI/6Bd5HslN778EVGVNCvVA/nIh9AUu47/f+nfjPWNRhvZz5sfUw0v/ZWagsYDinYXvwqJNYJOg+gUP0W2EwxqfeifyTRfLsdodnifZ/+uQ/q23XZxWr3SHLDHqsPM4cLUkjA2IJESblVU7t6mjlpXcgEPhUqMyXmMA/ReJmVeaeNdJToI6l3tpk9ZWzEUAr+fHcrE7zEWwtzrhYZlW/ZHtU0YhznM66bd/iuTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjO2XqpAxXgXMho/NdZLOU17+XGQmLyqX+aAyqJZfRM=;
 b=bRbi21E9vQr8zlIoDnIgFr2NFVHFidf4kxB0SOP9r/0xHvY9c+qilMzxaHl22ULsXkj05Vb1/8ai3gBBiyp6eWW/Csno8ecL5DIwZ1+/aalP2JoGyU3BhiN833e0a/8aBhyjgv8Kc/ZyxtxuE2OJ4OOm2Z57OL6nw3aSRfoyfrVxX4C6au+QSI4n5H3eC+HBotVeJZEG7hj8+cO/7wNs0k6gFr3P5cG1ouB4ORa9wNYMaUAyxtMP3Ro4wRW2IwXvxR9vCbl81RlIENf9UUIppDuU6NSaWGMsDCPZZZthbqe4gaLf8e0VI38+/EwOngLIqBuiBV5J3c7Y8JAnY0Qh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjO2XqpAxXgXMho/NdZLOU17+XGQmLyqX+aAyqJZfRM=;
 b=v5FLuAKKNpouwHB0mtKRkhstYlZDFcKzEPAPJNl0V0vBR5hFE3P3jCVGk714H5hFJvh3qT8xKRxswhk+AcMVPIRxCsW+XuAUQLz5PT4BAcWs/0t4C4vo4Bkec9ZBe0twD4AlGTg+z35aIKRX+8Op8K6+GqocZ1lEe46UaSRYb2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 DS0PR12MB7898.namprd12.prod.outlook.com (2603:10b6:8:14c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Tue, 18 Jun 2024 22:36:18 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%6]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 22:36:18 +0000
Message-ID: <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
Date: Tue, 18 Jun 2024 18:36:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@google.com>
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20240606020404.210989-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::11) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|DS0PR12MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 08bd754e-58b5-48f1-9df1-08dc8fe711e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXNLUXpFRk1DS25SaElZcGs1RUdkYVJUc1N3K1pxL0JwS0tQSWtEM2tKUnJh?=
 =?utf-8?B?UVFCK2hqSzRMMWJQcnYwMnB0S3h5SDluWGtwaFFNR0w0aFRHb1ZtSWwvZDls?=
 =?utf-8?B?UUUxT1lSVkNWRm9kbnVLSmRxQmQ3TktvWmJ0dnJLMy9td2xDbldKWStIUzNv?=
 =?utf-8?B?cFpyanZ5NXFBT2hUYnNBUk5IMzg3VU10TXJkVGFHcnZtTzl1OE9OYnRpL2ZI?=
 =?utf-8?B?bzZJelNia1M0aDF2KzBDU2oyb1pBZ29iVGUrOFcvb0NQUWN6L2o0NGpVUVRr?=
 =?utf-8?B?b3hEN3d2V2N1U0lKOGZtWDROVzZ6M3NRUDlPUEwyZWVOVmZaNWlKWGI4VXdG?=
 =?utf-8?B?cFpDTUc0TWJ6TWkzcXFpUDNlOGg0ZXFaeUdwYXlmSHNTS3hLaTFlM0UzUmNj?=
 =?utf-8?B?bmN3cGhvVG1DeHU3M0NXdGZYbEt4TGF1dXRTWUpkSytyOHNPWmhpRHk0Y1VF?=
 =?utf-8?B?bnF4N1ZGVFJvdUVHN1lqYnZtNVJWSHVlSk5wRDRkQis5VE5sM2dGczFaQ1hu?=
 =?utf-8?B?elgzWnNtUzNRNFpucTZOZ1RNOFpwLzlrREdVbE1XeVAxUVRJOXV3Q280ZkZZ?=
 =?utf-8?B?NHFsL1IySG0rb05NbWNZOVlOQ3NVV3JXNnJPSXlPK2dQeW42VzRMYTR1Uktj?=
 =?utf-8?B?RGEyQ3dSTlppNGREV3huYnVaZmpGWXJiSU9xMUkxQWZUQytrWGdhZmp2ZDhz?=
 =?utf-8?B?TUUvREQzb2lXZG5qTmI1SzlQOXZZMTloTHlpNW5KeEJ0WWxadXVORGVYV0hT?=
 =?utf-8?B?M2NjZUdCdTdYNVNSWlUva2pTZGY0QzVqMHJJNHNYVFRiUldzb3ZONzFUV1Nx?=
 =?utf-8?B?UFlkT01XTEpWOXVSR1NTcUE2aTZwNWdjOTJlZ084bUt1OG1aSklxKzBtQWRn?=
 =?utf-8?B?eHI2Y3JQUXEvVml3b0E0eXlLN0VQWVQvNGNISytsUmw1eVN6UnBRNy90YmtI?=
 =?utf-8?B?MkVLbllXYW9FanpKMjBxMmVuRU1tUE1VRFBiRStJQjNjQ0F0Tkc1Z3EvVTJm?=
 =?utf-8?B?QXEzMDIrY2UwNHM0dUFhN3Nsb1pNVWNxcjJsbk9TYlJ1Y2Y1RXZ1dTRRMFhv?=
 =?utf-8?B?WTlkVmZMVTFnZ093YkR3dUZyVkJkalRKc2dpSXRnVXJPdEJWa21GWm1ieW5i?=
 =?utf-8?B?Z0JjSHFVQnNLSU5EWTc1SjhrTTRZa2NTNW9BRk5ZcnR2MmxLTnc5cnpqZDM3?=
 =?utf-8?B?MTUrc3luS2NZbld4dFpMcTQyRTFjNmJ2Wm1xMFFYc3BzQXE2R1l1Q3l4dlNu?=
 =?utf-8?B?OGREY3NtVWhTOTMyZVZsQUh0YU5hQjFFZjhxOXZGYXRPclBIbURDdmFkaEVY?=
 =?utf-8?B?SEpocHYzbFJpNCt2dmgzY2txUWVFV25lT2VGYVNaT0NhSkR6aGd0YW8wbzlQ?=
 =?utf-8?B?Qlp5RTd0WWNGNFlOSStuK29kY1c3c2NjR0ZTMGhEeDZtckthSTFvU243U1I0?=
 =?utf-8?B?YVhvKzNndEtJbkdQYnlpcjNYVERQaWExZmtYY3lGOFFabmxpeTM1aHFaVnNK?=
 =?utf-8?B?MjlyelJOUmlUUjhibjI0V2U2S0d5T0xEODN1TnVxUk5GMUVCeGk2Y2xqbVFE?=
 =?utf-8?B?VC9VQWFvMW5yUXZka2p0M2I0cVp2bk1idVdLNFQwdkJURkNSR3FmT3pVSVAy?=
 =?utf-8?B?VGZkQ2kwRmw2OFA2MDduOFFWeDlHTk1pNFgxVTB4cW16dG5lMDlFeWNpUVNl?=
 =?utf-8?B?c1A2VXNQb1N6R0w5OE4wbGtta0VqeUIweWpQaTNMUlNRZWp5YlVFUXp1MnI4?=
 =?utf-8?Q?x0CIv5hKVbvRBkWJo6KtBSKgH+tN6eJl1XWEO5K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnVSbTFKVTFaUUJkb1p3dXRqMzZpeFdPS2lxbXMrek5Lb21RRzQxNXQ3cGFW?=
 =?utf-8?B?QTczS1FCb0tPSVRZdG5HQVhDL2RaYXhSLzIxN0luQWc3a3pOclhXWC9GZTZI?=
 =?utf-8?B?WEVKS3J2SVRPWkw1SUY2eG1tVUpHMHhMeHpzK1hXRDdvcVhTM0E4d29ud3hm?=
 =?utf-8?B?ZjhGeHNPU2Jxbm5MZi92enpnc1dmMVFZMHN2Z2NEanpnTmpMTG45TE9ydFJr?=
 =?utf-8?B?dEF3Z1VhWndlcHhPUEZMWDZNaUpsTHhweDhGSzE2KzJUVm5scnUxNEZXRWxY?=
 =?utf-8?B?SVhoSlI2V1FGZlZNRTRzOEF0L2U5NDByc3I3R0pBQXZDTkFYeVYzQ0M3T2dv?=
 =?utf-8?B?REt3UWN0c3IyYVE5a1MwTDFIdXQ3VXFrR3V6cGh5Nkp1RER6WGpkZ2krUE0r?=
 =?utf-8?B?L2xuMk12SGlqVVdqcDlSK0pkMklsUmhPclVmRXdBRDRnWThiTXFoQmJTR0ZD?=
 =?utf-8?B?VmU5WFBUbUtXWHJNR25FTVVNY29xWnBScGU4ZWs0eEZIeGRlYldQNGpobGRE?=
 =?utf-8?B?SmtGRTNJeXpzUlBZd3FaYUhQVEFuRm9mdDUrcml2VlJmR1U2QmxpK1BpcUxL?=
 =?utf-8?B?MUxGS2x5M1pxQ2FwT1Z4SW5WQWdWMG5lUUllS1dxd09PdlltWWx1bGFiRDdF?=
 =?utf-8?B?RHRlVzJoOVBCMFZUaFpNL2JsQU4reE1WaVpWelNsUTRDSlpqZU1lSDRQZU83?=
 =?utf-8?B?MFV1YmhyL1VTM0lYWDU4VzJmUW9NRENrbUl3WFA0bm0wNWZucUlmS25NU3My?=
 =?utf-8?B?ZEM0K0RsSjNrclI2ZEl5d3NldWNvMXY3cU1heXFIN2VDVEVKWE1VeFhlcjAw?=
 =?utf-8?B?K1BaVEJqSytvd0xwSTFOOUlZZE9wSXJBUnU2ckRIWjJqeWZIbzJkU1NLSkpE?=
 =?utf-8?B?NW03d1NFVGl2WFlXZkVLU29jY3FXRzdlWjA3eUUxMWFFTUp4MHNKb0EyaDAz?=
 =?utf-8?B?ekRLVWNTL2RMT3dQVGUrWTJsa1VUbjZMbUg5K2J3S3hqV21QOXk0bFBGQVJT?=
 =?utf-8?B?UmJsVzdDOURPck92KzQyUStXenVaaEZHczdyMkNMWDRWSmVMODE3ZGZvMlU3?=
 =?utf-8?B?MEE5VkkvaUpvSzZMRzByeEFLR1ZvdmpINnhTRXF0SDhxQncvNmRKU2UrNWtT?=
 =?utf-8?B?UjRwZ0EzOUFuTkxYUnpkSTFkTGYycmo2bFRuNGwwdzIrdmJhU3lWR3FCSFJX?=
 =?utf-8?B?YUc1dDNpTE9zZ0h0WUFscU1KYzJJQ2hHU3Q3K21hZXVXSUhaWWNrUTBaWWhM?=
 =?utf-8?B?UDdxb3NIS2gyL2F6ZURCam5zazdKVlgvY05Ua2MxZzlVR2pROTVma0YxeTdw?=
 =?utf-8?B?czBhZThYSkM3OHZ6VGVnRWdUUkVZRlIvNWhsTE41b1FydWR4SForYWFLZ3p4?=
 =?utf-8?B?NDhDZXdrU0RJaG5jQzdRR3JIbEFRYzRMQTRqMExnS28zV1NJdDZtZ1NVemQ3?=
 =?utf-8?B?aEorRVQrNjFCUVdXME5jbWtUVzFBVExxWWR0MnBlNlRNaEtoRE9OVVJpbExV?=
 =?utf-8?B?QVE2dnMwdVF0T292RFY2UWdNdEpKODlDeGM5YjF6TktJa2J2Q0FYeGozUVh0?=
 =?utf-8?B?NzB0Y3NqaVJpeHRVM1BPMTVrVVhuUllnRE4rSWlGMmQxWkZ1N1J6VDJBN05h?=
 =?utf-8?B?amg5YlhTWkRvV0p6SEZTb2picVVHWml5bWttVnFuTkpQckd2cGZ0YWVzbjBO?=
 =?utf-8?B?RzY2WmhGaHEwcURVTDVMVDkvZnpzUU5FUWN6RmxrZm5nM1JRaFY4RStWYmRy?=
 =?utf-8?B?TVRBSThXcDVrVS8xZGRBeVA4MjNmK2ExTWVQYTIvLzlyRXlLY1dyMW53N1Z0?=
 =?utf-8?B?T2VkYkhkYjlzODU3VUp4WWxUTmNIcmxQQjJFNEFPSHJjQllqZTlCMkJKekwv?=
 =?utf-8?B?eVI0Tk9PSmgySlUzQVlTUFVrcjNYK044aUhjcXl1V0tjVkNGZ1ZpNnlKcXVh?=
 =?utf-8?B?S3p1ZGVoUnl4RDB3Nm5mdFdlbWNQWjBpWkgzZi9nNkdISlN3U2JQSHFVYU5M?=
 =?utf-8?B?dGJmRGE1Yk9DamlSeVRaMS9IRyt1eFQ1aEdGVGtFajErTlpZYnFHNDhFTUk0?=
 =?utf-8?B?VlBOcjVSZnEvOE9PVG9NRjdzdHJIVXJUbldwcTF6TWdESGFNSjVwQ3pqR0tK?=
 =?utf-8?Q?xR/ygAf+mjXIFRyhGJT4G36R5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bd754e-58b5-48f1-9df1-08dc8fe711e7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 22:36:18.2555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtynvpKOhHy4uc8jqJEoEPuafspwBPlje6gqaO/fhS3MQ2dr4q9hXXLUNCtKhiuH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7898
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



On 2024-06-05 22:04, Mario Limonciello wrote:
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>

Thanks!

> ---
> v2->v3:
>   * Use `disallow_edp_enter_psr` instead
>   * Drop case in dm_update_crtc_state()
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
> index f1d67c6f4b98..5fd7210b2479 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6436,6 +6436,13 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
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
> @@ -6478,6 +6485,13 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
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
> @@ -6504,9 +6518,12 @@ static ssize_t panel_power_savings_show(struct device *device,
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
> @@ -6530,10 +6547,16 @@ static ssize_t panel_power_savings_store(struct device *device,
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
> @@ -7704,6 +7727,13 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
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
> @@ -9307,6 +9337,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
>   	for_each_oldnew_connector_in_state(state, connector, old_con_state, new_con_state, i) {
>   		struct dm_connector_state *dm_new_con_state = to_dm_connector_state(new_con_state);
>   		struct dm_connector_state *dm_old_con_state = to_dm_connector_state(old_con_state);
> +		struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>   		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(dm_new_con_state->base.crtc);
>   		struct dc_surface_update *dummy_updates;
>   		struct dc_stream_update stream_update;
> @@ -9360,6 +9391,15 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
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
