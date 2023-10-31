Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6EE7DCE74
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 15:01:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B75B10E4E6;
	Tue, 31 Oct 2023 14:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E1A10E4E6;
 Tue, 31 Oct 2023 14:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlUHMYF3sBkikxQsWSUaOx0LPR5PmhszDK640OWbqnIPp2DcN/jQ3PS4RV+TafMJYo/ttIxaJTzRZTHsxmkBzVCdmeh6wlD9M2kb8ElgdtL9E1wGtAS9ZB3ss+qB8gTj4xMVdfoqHZb0sCKyHFhw9pJ5B6SyB8zHSbjfrv77dVMoIZrvoah0u/rGjQzYM5uxA+B2QkBfMiqtP+9UkeatafMPEfqSr6HbcmXCgZM3Oma+z7j6HydWzQw6z9F/oSrZO723KULboalYXGCXTWl1gVBpwQmVi+laXU3a/Bgy6CjoShyiMg7v87DyfNk4ZXn6E5vDxiQ1IONVPsx310wizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zb4H+DA7D8Z3lZs5r9hRyGPW7UrFpXonP+vgLbbrCR0=;
 b=FWLe5KgVW9ej82I4d6zJh4CR8GrrwfCeYsERhvPHufq0u+rSALhy5qOvUmCRqHemqWSK3DNoPKggjzM2k1i8+7lBC+l5YxEu3U8OG6F/ZSyl062eeTEl9exYWED6PAbetpAYYduNJ2XVmDdkZ76mC7o70A7KrnbnfxFr4FQelrUjC66cNc9o8nHFnD7DXq+pJm9d6D9NwCN038wykUg2C9owsWJQMluipnR5Dy17Gh7RSd1TwLgJDIRJoDIW6K7dmOP9pXcS5L4OxZMHFf1mZFCJqRGY/PdvNWQczDhNvOG7uAoiwKvLKoqrp1oJV85nUirEuXHVyvtGpnssCgTQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zb4H+DA7D8Z3lZs5r9hRyGPW7UrFpXonP+vgLbbrCR0=;
 b=bNVxjKSijNYDgTz6pAqLoMhOgYy+APtCFtZziR5rkypbfhVJZ5TZCuKvhe29zdVkagwL5a69RxVnBpEmeJ/vFEyvyoxhf5I3cTcGn/maE0JLp5tvp57WeOa6/MG+0PbkCPGT1rS/BewZFZi7co4vmFFBzgTe8dvSv0JGkBkDkGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4974.namprd12.prod.outlook.com (2603:10b6:5:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 14:01:05 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 14:01:05 +0000
Message-ID: <e8398e2e-696e-416e-bca4-e491f6584ace@amd.com>
Date: Tue, 31 Oct 2023 15:01:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/amdgpu: Remove redundant state change after
 validation.
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-5-ishitatsuyuki@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231031134059.171277-5-ishitatsuyuki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: a339f8f5-ecaa-44f3-65dd-08dbda19d2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukY8t3rC5szD2gRAJtnLHRJD7EcFI784gwumB8bOd/dezSoVjyFmc8l+FsU5KB9/nrXmBh94+LtXv7YIx0vFhEf9NYqg/0V5MUjMQVXBL6SzDx12dPcuRjODCDsKOxvRWClEIEysh/mZ+Y2O83VjaUi8BoEwPOqrzZGsEefOwOZ5L/m9DN5BGkFSiZ2UScJ4BXJ8GaktSj+cWlkCHY2FpP0DE1m8P2X9C7aBmzbLoPVwz3d50UI51qokI1+o+uLBnUF5VFGHlE9nUIFqPSQRD0A+esJPPQOm9Q1IU/6lSEEIHq0Lo2mriS1u7AC/640B2kPyimq7ysvh9gPwyKDxGkfIU4t24/4trrGdqevuWWm7e0DYNVF0Of1C+ECsBmFkFaLFEMx0EodHB24amzi9lkF3SJMynKu1FFut60nn9q7VOvt/Aw0kxwMmy28i0F/4tyVnnkCX0zjQayVNTtUrs4//23GHgS36nK9qb1OyhYf4rtgpNLrutvVyjzK6sSmG/EsuNNUFf0E9+FJs5XdxvMs26LyjApl7meTf3WLf0nw2UeRhU5pEqwZGW31W1OlMUHlWI1QiOJzqNEFb41nLJDKkK9teKahVNOre5uXaWzi+sTPSlCUtlc2yEs46SCCoHsTEcx46p5qpDF4Eol3rNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(41300700001)(316002)(66556008)(66476007)(66946007)(26005)(4326008)(8936002)(8676002)(6486002)(2906002)(31686004)(5660300002)(478600001)(6506007)(6512007)(36756003)(2616005)(83380400001)(38100700002)(86362001)(6666004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzNMRkNQdXZ1cVJaeWNmY0lvUjlQaG1ManFmdkpoS2E3VisrTVdhT1RCTmxY?=
 =?utf-8?B?aWJmWWxNQzFQTStMajB0clNrRUYrRkdlM2UwYWhHbUV4ZUYyYTRzckN6VHRw?=
 =?utf-8?B?T1RHSkRNOXhKbWVxeFBjdGU4SlprYWNhZXJWQ2xGM2lnV3R5VnNwalV5WlFx?=
 =?utf-8?B?QXRjUW05MWRZWWtUS1FhaVBrbjY0eHFWUlNvN1F6TU1SR0FxN2wvaUp4RVM5?=
 =?utf-8?B?eVoveUx3NURrT2NhTGpyeDBnL1RJOE1POFVXNEFnUXNQekpURzhBSGNhMmVV?=
 =?utf-8?B?ZHlrVzBaUHlPd2NBMnc5SFduS0RHV2VBazlCbWw5N2pOYzdtYjd2cmFDV29M?=
 =?utf-8?B?eVg0QXNJbXd1MWN4dzBxMkcwcHQrdUJZV3VFYmJyempIWWovb2xBSGpXdDBT?=
 =?utf-8?B?dlQxUzRCbUN4WjBhQmlPcTkxM21GQXNoOTc4bkpQbzlJc1liU1QzSW1yTmgv?=
 =?utf-8?B?cncxbUlIb2JIUU1lVnkzT0k2UnNyUW8vQ0lZT0NmUng3bGFSbEtySE5rTEN6?=
 =?utf-8?B?dS90Nlo1VFVNOXM1VnE3Q1NSUHZ2MW9FU243M2tIYm1kNy9mcUE4Yng5Z2lm?=
 =?utf-8?B?NWROOCtDbVA5a2lCa3hxbFFXRVJ1ZUh2eVcxSzloam83NGNYRTArVElwQ29P?=
 =?utf-8?B?QXVyalRTd3dQL09KOGlsVUpKaDhBK2VjQXdDTVZqYlVKMlI1Ym5HV0Znb25Z?=
 =?utf-8?B?MlNldGJUalp0TTBRWExCUXpJNk1hYjJKeFBvOExjSDZBVU5USDF0Q3hBOU5R?=
 =?utf-8?B?cmp3V3IzR29CczBwc0lDd1ZMcTNaYUZpV2M3d2Z0Z09SYjgyK1pVT1hqd3lH?=
 =?utf-8?B?NmprZFA2TkQzVWVRUkVzRGZEbFYvNmJMR1BMVU1ETVNlei96Uk5iU1AweHla?=
 =?utf-8?B?OENHMkxkYnZQNnBDWFF0U1EzVkFmVmhOaGhpc3BSWEJKd1NvVmh1MjVWNzNn?=
 =?utf-8?B?WlpyZW5VMUs2RUNFdXZ2TEx2N3RycVVzVURkbWNVQkhTSXNMajVrWlNWcU9a?=
 =?utf-8?B?cU5xdFVVUnYxdkUxdlZPZldMa3owOG14dVVSK3JLOTlPenpFMlNJVnVPeHVN?=
 =?utf-8?B?MUw0Y3d4SlhwTklKMHNLeDZpeTlycFJWaW5QcGRUQUNoMFI4N2tPTVR2RVFH?=
 =?utf-8?B?LytKa2lBaXRZMkpXSmVhSjdpMDI3R1R5cXVUajh3cHJ3d2MxQm00elJienQy?=
 =?utf-8?B?WnA4d0d0RVhQRUNEa2VZMVg5dmRxeW9PVjBsMFQ2Vnk0WUJNWnhVV2NCbG1w?=
 =?utf-8?B?L0Z6L1VFYVBoQWduSTdEbnVWNnJLbTlYV0t2WmlJU1F6bDFoZEI2ckFENkpU?=
 =?utf-8?B?bzJmRHh6aGNkQ29KOEdyQWhLZTVaN1NBaktBQXBaVmxFMk9yTUdyYVVtRzRk?=
 =?utf-8?B?UTdjT3pQbnkwRE5WamdQRUdabVpia0ZVK05SNzZYODBmUitSOFU1Y1RpaU41?=
 =?utf-8?B?VnFQYnZjVHZrc09oenlnVTh6eWFqOTcxM0RSTmdIS05uN2dpVGFHSTZ4dzFZ?=
 =?utf-8?B?M3FtZS9xM25abVNBNDg2cFhTU3pjWmJaK1pOUGpOS1BEU2JDWWFndHUyMzZD?=
 =?utf-8?B?VzFQWlFQWFg0YVU0cWFEUitFc29ZRGw0Rnk3QmpxVStlZmd0cG1weHpVTGc1?=
 =?utf-8?B?VnpkWFFoamNUdEQ3VU1ZakpraDFGM1dXWWYzbWFXd1ZxQUo4bHdVUkIvSHpw?=
 =?utf-8?B?bW53ckV6QWVDZk1aTzJuQTduR1Y5dU1adGQvVXFkdkU5WDZJdG4vblMrTGQr?=
 =?utf-8?B?YTN0WDl4K21jd3lIVGVXT3BQbWthQXVTSUFObTV3dkdTWmtBeHFKVlk0YTM4?=
 =?utf-8?B?VjNUNTBlNUIrZ0NSM1hIeWFoS3Y1ekdXYWcwdjhqVGgzVmFnMnNWclIzWmhl?=
 =?utf-8?B?aHlPa3drWFVPOHNyY2lrVXg4Q0hYMXNZWHNuZ1lSSGtXOWtlNGNTc2hBQUdB?=
 =?utf-8?B?M3FjOHUrVFVBNlVuK3FSb2FVOXpMQ2pFd2pJODRBSUpvQ2txVDFWcnhBWGpL?=
 =?utf-8?B?a2RTU0Z4OEhGc3dOc0Fxems4QS9acjR0dWw0L3BSbStOODFxc1A5SDN3eUQy?=
 =?utf-8?B?bDcrSHpZZXEwSXI0WHlJWUQvMDNTNGtuVFU1WlZ1TnF6NHVORVl6VCtpbTRo?=
 =?utf-8?Q?PsuzWNwjizpBQAp//LjJj5U6f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a339f8f5-ecaa-44f3-65dd-08dbda19d2dd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 14:01:05.4078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VRiwSuyUad71vjyoev+mCeplT3TjHus3LTC2Gx6jUiBpTkpXsAqZ4+k5SBB/Abzw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4974
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

Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
> All the state changes are handled in the TTM move callback; doing it again
> here just leads to more confusion.

The state move here is because we need to track which PDs/PTs are 
already validated and which have new locations reflected in the PDEs.

With this change here you will sooner or later run into PDE corruption.

>
> The table update remains here because it needs to be done exactly once,
> while doing it in the move callback will result it getting triggered twice,
> once by the actual BO and once by the shadow BO.

The table update isn't done in the move callback because you can't take 
the appropriate locks there.

Regards,
Christian.


>
> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 01d31891cd05..50f7cee639ac 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -495,12 +495,9 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   				return r;
>   		}
>   
> -		if (bo->tbo.type != ttm_bo_type_kernel) {
> -			amdgpu_vm_bo_moved(bo_base);
> -		} else {
> +		if (bo->tbo.type == ttm_bo_type_kernel)
>   			vm->update_funcs->map_table(to_amdgpu_bo_vm(bo));
> -			amdgpu_vm_bo_relocated(bo_base);
> -		}
> +
>   		spin_lock(&vm->status_lock);
>   	}
>   	spin_unlock(&vm->status_lock);

