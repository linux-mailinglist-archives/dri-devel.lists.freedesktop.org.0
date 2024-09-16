Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAAA97A319
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460B910E371;
	Mon, 16 Sep 2024 13:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BbiQuQLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B2810E371
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:50:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy9vat5BXSKJ2K/R8ALUMATa/z5PpiyC3QnSlPC32wm7BZw997Wfoca8DfpV81fj0cRTbn0xLUy/VKfTePEfPIfOpTHMCTXs6xCu2VwlWEbpePSC4F4wwqQ8yM3lvF0QG2uMfryjNzLC3Zn4+ZhRkxwMFm9pIqT9ALJ8PIOujxy6byzJGzYqBWvDK4iZy5f/CcmjGeLXBIlI/cdh6moYN3X+qZ1vHnNbI+ett2yav9D8vtSAFsHPHDSVCAemXm/Dn1ijhFuOoI1r/lG/6JeCRZKxYqqSJbEcBLGYBChiZwisi2NDfhkWYIqgxPb59EMvzbTsC6Stzm3cRKXP4lg/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOwanmzkm2xQEatBFLw4/G1ZSdNz23iekO77GRHWxI4=;
 b=uV0C8x4omyVnXAjLYQMVZxkn8953dHW4Xlavznltyyf5/cWuMk3Y+v+rSHjhBu2+pyT5Dri2Dkl13dkfnHfUovvmtK60d+H+Adl8DHzIG5HO5SA0aeg7+JyuIK+BpeeexfgIWDVSElWVzuwVrypUYmDbZT0gjGIQV+DALzBYQv/1rQYwMom8FY6pu9d1vXKyyN21Q1GUUGmyklKFviKyO9EoHxUy112hU+rSX6HM/yAVWNius8cx5iR8FFULn208QQpGT5danK153Z26zjgmYA5SUWlAxmYxbp7fi9xqXDBqLij9idf1bqYk0wKz+AUZyBC1Wx6tMT5sb124aMc2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOwanmzkm2xQEatBFLw4/G1ZSdNz23iekO77GRHWxI4=;
 b=BbiQuQLZJcYRQSJtC1n8bFxkJjAnRFWE6SdOcpz6yvB16pXMw3hAlfXB1HMebYuKBXtkbee6IBlZXyqXMrb1mottyVTh8E53CrXJHLPw2Mj+iz1V/aHnqUP3YoUBHdRou1SlpESJuh/6x8lPkl88ThCpeMirxdHbRaC6OmTdtgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6228.namprd12.prod.outlook.com (2603:10b6:930:20::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 13:50:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 13:50:53 +0000
Message-ID: <84ab022e-7fe5-45d9-a939-2de4556852e9@amd.com>
Date: Mon, 16 Sep 2024 15:50:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/amdgpu: use drm_file name
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, tursulin@igalia.com,
 simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
 <20240916133223.1023773-3-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240916133223.1023773-3-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6228:EE_
X-MS-Office365-Filtering-Correlation-Id: c894832e-bf3e-42b0-39e7-08dcd656950f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVY1OE9vajk1MHRiQU9HNGNlRlpUdUhCUnlOR1FQYW0rZWJVSWttYjZ1aDFI?=
 =?utf-8?B?NXNCMGRiZC8rcEJBVkdIYm1SVkd5Zm5CSXBKa0N6VHpUcGJrY3g5NWZ1eTR2?=
 =?utf-8?B?Zk5aMlJqUjZ0Vm5qMTRGSFhmMnl3bjRKMHJ2TERmZ3NzKzJxeDM1dXljUjh0?=
 =?utf-8?B?aDEzRFp6R0VRdjRaOHJBeGUvNEJGWHZDZzFLaDJ2bXdjSHFGdndMb0lDZDlr?=
 =?utf-8?B?YmhZbFdqMjV4SlBXd0NGQlA3MXRBYldZaXhyelp1WkxYcGxZZlJVQ1B0L0g4?=
 =?utf-8?B?YTlwYXlGNFo5MXpSUEhadmN4VXFZWG9yb3YvdnJNR2ZBYzd0NWpvdG41dmhx?=
 =?utf-8?B?WEJIYVVpM2dITU0xSWVqTXlpejdrVHNMN2VMR3kwdTdiTkwvc3QwVGxZRXBm?=
 =?utf-8?B?cENhcFlxbGVuSU95ZFdqOVY1VVVvQjJYOHFPb2ZHLzIxUXlHN25BSU11RndU?=
 =?utf-8?B?Y1pQaTZtQWN1YXlwdUwwQUY0ZlJhRmJERzhPby8zbG1haXE1citWQmJNVlZW?=
 =?utf-8?B?YzdnMGswbjVHT3BwMnZJVEtEWXdCS0VRYnREV3dpLzFybVBkUGxkOTVicXF6?=
 =?utf-8?B?NktGUkg5a0EzeTZ3SGUrbExJS3dqMFlVYnNEZ1IzNzljNXZ5a3hoSEpOVjFn?=
 =?utf-8?B?d3pJRUdaK0hIM2tFWHBWSXZHQjhzTlQxUWYva1Q3NEZOTkF2YnBpUG9xK1hF?=
 =?utf-8?B?RXFWTzhDbUxQRG9SbEk3V3k5bFhDRnVtM1ZGYXVkWm5LcHdEVThFVHV2bWZo?=
 =?utf-8?B?M2ZtemQvbDgzc2ptSThiV1FaVzNpYlNCc3FuZW5FaE9ZcnhGZFdGRTMzOTFo?=
 =?utf-8?B?WE9lQ2kvMkVjaEJNZU92VHJyNWxpR2lST3FLNFNVYmZYY29Yd1FNQSswcU84?=
 =?utf-8?B?MWl3TG14MG9YeGlQYnNsWVVHYVpSTE4xQ0UwMkpJUHVsRmxGbHduU25aRUVr?=
 =?utf-8?B?NnY5cURreU1Tb0piK0pXcURtaWlWeXhpQUdLUWNzU01SaGtUSWQyZldDdzU1?=
 =?utf-8?B?Ykw4dnFvYlpaVHR1elMvOXpRci9vOUN0U1UrNTZMRVJBVm9heTdaN1BNSWpy?=
 =?utf-8?B?bW1iTUNGWk5KdThwM0FPQWxBcXJVZ2wxQzkxYm5VOTJoa3lXZXZwRHRoU0xm?=
 =?utf-8?B?cm84N2JrK1cxTlBOaFVSS3o3OEIxdWZpNnJOcDh5MklRSTFnTHEzNlk2NExG?=
 =?utf-8?B?alhYT08wYWpMd28xTzV5bTBZUDVQeVlUMTdmOElCb0lQWDhUQi9lUjY1T0hw?=
 =?utf-8?B?c3ZBRGNYdndYbU1XYXRkcWV0Zmx2OHhrR09rMVRXTWdGZHRUUmdBclFCTU0v?=
 =?utf-8?B?d3hibkhRSUdDdERKczYra2twWWl4YUlRT09HeDd3TDVFK0pkOCtVVERBUml4?=
 =?utf-8?B?WkgzSzJrZW5jRlZGYVlWdzQ1Z3dQcXUxWWFVZ2tHTG9SZ3NYYnluTmZEY3RW?=
 =?utf-8?B?TjQ0RUpRM05aMHVvWUdlemZ6Tm5LdFVJaGowWExiS3lRckpoL0lucG9OYmZl?=
 =?utf-8?B?cUtocWtaSnF2bG9rSm9tYVZ3YVB0cVliRjNhZ3lZYkl2bXYxWWpLUHRNemZa?=
 =?utf-8?B?UVAxOWI0My9ZSDlKWjl0aUZsUXJIbTRjVjllQWZQUzVIdnl5emZMOEhvaXIy?=
 =?utf-8?B?UDR5U3hRSHI3eVU0QUM5VGhJV2oyektVVUs4Um5zbW9OT3c3cFhQK1BOMG9m?=
 =?utf-8?B?amFtd2FiQlZRRGpDNTcxZW9jUm12UVpnNThYdEI5VDJwN1psZmc5Qmw3MVFN?=
 =?utf-8?B?a1I3eWIyQjZUa1hYQm83UnZDUEppWTB0ZHlnZ2sxSEI1TWpvZitwY1dvQ3E0?=
 =?utf-8?B?dldYN3N1bkxlbFRSTDdldz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dS81emk4dmNHQ3lJcXloR1BvTTkxenNpQjhyQVFrdkxEbFdYZW50OVVVRUV6?=
 =?utf-8?B?WFBFaGppUzVCV2JDTEVUVEhJYXJrM3hxSi9GVlliNlQ2THhqVU1Od3dmMVBp?=
 =?utf-8?B?YllsNmZyMUZ4cEZvNmtnYWZsZlIzNitHZlRjNk9DYlFaeE5WSVRibWord1g4?=
 =?utf-8?B?VE05SHhlZC9mZjM4MWhNY1RkQnhxRWJOeG5kU0ROY0JzQnpBbS8zdlYzeDZF?=
 =?utf-8?B?bDFXemRPUWNnUUFSbjJocllMWnV5aFpwNWwvT09taXJlSXNFWjZXRUlvMUs3?=
 =?utf-8?B?MVFyNDg0V1RLYUFxbHdFREFhbHY2TlZCMW0zb0duV2krSDBwdVdvMmdZTElw?=
 =?utf-8?B?L1hsNjFqWXJILzJhM2tEei9IdTBXZWp4MklaWDl1YThvaVpSS1E5dHp4UWY0?=
 =?utf-8?B?cG93UExybTV0VmdGRHlwMGZjTlZxNjhJTWVPUUlaMU9pdUoxZTRkZ0NWdlhP?=
 =?utf-8?B?a2NibTVWOG5QRStOb29hZnZkNzg5elVwdVB1YUFzSTdhRkErQ2ZHdlJxUVdC?=
 =?utf-8?B?QUY4d1lDRExTbEdCdnBwblM2VUtSZnF6b21CQ3BRYVlNU01MQ0JST2l3TWJm?=
 =?utf-8?B?YW9BemZVUDBiNUdKZUdVbGRISHA2MHRrcCtBNGs4TzM4VVBVRG5HYkg4dEdn?=
 =?utf-8?B?SzRqSElXRU9XVEFSb0pOVjZGUU1mN01WTlhuRUhKMzZzRXN4YUNiKzc2MVJV?=
 =?utf-8?B?WUMyanRTWkwrTkZ0KzF1SXZIWEVRSTg3ZTNsdGhOVjdnUUlZM20xcFZxWFBO?=
 =?utf-8?B?NDNTb3FHV0Q3S1daTEx4Tnd0OC9KVzdLMDhCWnpFc1Y2RW80cERzOFdsS3B6?=
 =?utf-8?B?R1NoV2JPYUpEOWJoam5UZTJ3bG5kMmU0bE9BMWdqY2dQeHJnSlNzODVUbi9j?=
 =?utf-8?B?a0RxWDRlQkJmREQ1SWJ2VzQ2VW5vajRQV3hVMWxFNWIxUEVQTE8waHFUbWh0?=
 =?utf-8?B?MUVKQkZJZ2tYeFdWM1QvZGJrYTJNN2VKRkZJUnUzaGZ5QlFONjVETC9Dd3hw?=
 =?utf-8?B?Tk9iRkNINFBUb2Noc0NKclRtK29pZ1c5ODQrQTd2bC8wSCtOQ3QwS3paRVJr?=
 =?utf-8?B?VHF0T1Q0WXp3aGY5Uy9ta1R4QmJDSFgzVW9PWGZRVVlYQTRtMDJ4S0pNVUlF?=
 =?utf-8?B?VGhRNHAyWGFNZHgwbUszQ2cvY0ltT2Q5NHdRUnR0VXJTU1RJL0hzdlRnaFBl?=
 =?utf-8?B?K1N6UjNNdEw1cDZtbjlISEs5TVZ1SWUxT2VOZkRBdUtiYXZoVWZFbk5URCsz?=
 =?utf-8?B?YlQ2MndXUlByZXVSa0ROeTZZaE5QL2xseC9mdDA4TE4yWWdHYytwZ0h4cmlH?=
 =?utf-8?B?aTduZm9jU0pSaS9sN3BlU0FjNTZVeTF3MXg3dGlUZkFBSXNDVjY1eW43QnJz?=
 =?utf-8?B?emQ2WHRCalFscThvSEVJK3NXY3hxQ2FUaFBWVE5jekVraE9yamk1cXcxNU1Y?=
 =?utf-8?B?clBoR3JtYUhITUhPVm5hR05RTlhCaXlyT0lGQ3NZSTF0WFpoNUw3U2w1M2E5?=
 =?utf-8?B?UVc1NkZYZEZXSjJrcGY1VDNSQVQ3b2RTakxlZkY1bWZGUHRJQjZ6Z0NWQjl5?=
 =?utf-8?B?L285b29vU0Y5UlBlaXloVnAvRDRQVDBlaGttMDJ4QVNmVEZMWCtXL1pQbEtw?=
 =?utf-8?B?WDAxUlh3Y0ppNGVQQmtQUExkdnZMaUlZaHhmcjRINHBPMTFVK0VHZTZEQUQ0?=
 =?utf-8?B?Y0FCWkZicjhnTjZpeTJZZlhwbzJ4Y05QTkV1WnFVNXdybWRLWHRZeHYrOWcw?=
 =?utf-8?B?T1dab0J2ZWpkaWw1RURxMndkTVcxQVBiNjJoSVlOSGlGN2ZNc3JFODJHUFRQ?=
 =?utf-8?B?M2MvcHZ3WmZiK3VrZU1PZ0xGNzZGMkRpYXJIazdJNjdzRUlkRTY4R203ZGRL?=
 =?utf-8?B?UXVxYlVaOTQ5RTB2Ny9mYTI5anNuM3pnY3Q3a1MwOURGaUVmWGd3Q1JlbHAw?=
 =?utf-8?B?bTlhbnRhejhzT1NaUktUYkJsMDVaejJQa3g1R1ZpTlZMdHlCT1Mxc1FFSWJK?=
 =?utf-8?B?dGQySGRyVFFsV2dTMWFxejRUWHpLck5NOEZKTUhSd3M0K3dBVzl6aXBhdWx0?=
 =?utf-8?B?dG9JTlZLVmZsK2IwbkVvWE0zUWFUZk9CTzJSQ1JnelVIRmpMQkc4MlV1eVFx?=
 =?utf-8?Q?bKS4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c894832e-bf3e-42b0-39e7-08dcd656950f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 13:50:53.7422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAzP9Glt6xvep46DtLt0EagLB+it4vq8rdpOtgcudMGNW/jXeivlazROh6tBnh82
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6228
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

Am 16.09.24 um 15:32 schrieb Pierre-Eric Pelloux-Prayer:
> In debugfs gem_info/vm_info files, timeout handler and page fault reports.
>
> This information is useful with the virtio/native-context driver: this
> allows the guest applications identifier to visible in amdgpu's output.
>
> The output in amdgpu_vm_info/amdgpu_gem_info looks like this:
>     pid:12255	Process:glxgears/test-set-fd-name ----------
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 16 +++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 25 +++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  4 +--
>   5 files changed, 40 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 6d5fd371d5ce..1712feb2c238 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1577,7 +1577,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>   	if (ret)
>   		return ret;
>   
> -	amdgpu_vm_set_task_info(avm);
> +	amdgpu_vm_set_task_info(avm, NULL);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 1e475eb01417..d32dc547cc80 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -310,7 +310,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>   	kvfree(chunk_array);
>   
>   	/* Use this opportunity to fill in task info for the vm */
> -	amdgpu_vm_set_task_info(vm);
> +	amdgpu_vm_set_task_info(vm, p->filp);
>   
>   	return 0;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 0e617dff8765..0c52168edbaf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -997,6 +997,10 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   	if (r)
>   		return r;
>   
> +	r = mutex_lock_interruptible(&file->name_lock);
> +	if (r)
> +		goto out;
> +
>   	list_for_each_entry(file, &dev->filelist, lhead) {
>   		struct task_struct *task;
>   		struct drm_gem_object *gobj;
> @@ -1012,8 +1016,13 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   		rcu_read_lock();
>   		pid = rcu_dereference(file->pid);
>   		task = pid_task(pid, PIDTYPE_TGID);
> -		seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
> -			   task ? task->comm : "<unknown>");
> +		seq_printf(m, "pid %8d command %s", pid_nr(pid),
> +				   task ? task->comm : "<unknown>");
> +		if (file->name) {
> +			seq_putc(m, '/');
> +			seq_puts(m, file->name);
> +		}
> +		seq_puts(m, ":\n");
>   		rcu_read_unlock();
>   
>   		spin_lock(&file->table_lock);
> @@ -1024,7 +1033,8 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   		}
>   		spin_unlock(&file->table_lock);
>   	}
> -
> +	mutex_unlock(&file->name_lock);
> +out:
>   	mutex_unlock(&dev->filelist_mutex);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index e20d19ae01b2..5701d74159d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2370,7 +2370,7 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>    *
>    * @vm: vm for which to set the info
>    */
> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *file)
>   {
>   	if (!vm->task_info)
>   		return;
> @@ -2385,7 +2385,28 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   		return;
>   
>   	vm->task_info->tgid = current->group_leader->pid;
> -	get_task_comm(vm->task_info->process_name, current->group_leader);
> +	__get_task_comm(vm->task_info->process_name, TASK_COMM_LEN,
> +			current->group_leader);
> +	/* Append drm_client_name if set. */
> +	if (file && file->name) {
> +		mutex_lock(&file->name_lock);
> +
> +		/* Assert that process_name is big enough to store process_name,
> +		 * so: (TASK_COMM_LEN - 1) + '/' + '\0'.
> +		 * This way we can concat file->name without worrying about space.
> +		 */
> +		static_assert(sizeof(vm->task_info->process_name) >= TASK_COMM_LEN + 1);

That won't work correctly.

> +		if (file->name) {
> +			int n;
> +
> +			n = strlen(vm->task_info->process_name);
> +			vm->task_info->process_name[n] = '/';
> +			strscpy_pad(&vm->task_info->process_name[n + 1],
> +				    file->name,
> +				    sizeof(vm->task_info->process_name) - (n + 1));
> +		}
> +		mutex_unlock(&file->name_lock);
> +	}
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index d12d66dca8e9..cabec384b4d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -232,7 +232,7 @@ struct amdgpu_vm_pte_funcs {
>   };
>   
>   struct amdgpu_task_info {
> -	char		process_name[TASK_COMM_LEN];
> +	char		process_name[NAME_MAX];

You would need here TASK_COMM_LEN + NAME_MAX + 1.

But I'm really wondering if we shouldn't rework amdgpu_task_info to not 
be based on fixed strings, but rather use a single dynamically allocated 
string.

Potentially even at the end of the structure after pid, tgid etc...

Regards,
Christian.

>   	char		task_name[TASK_COMM_LEN];
>   	pid_t		pid;
>   	pid_t		tgid;
> @@ -561,7 +561,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>   			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
>   			    bool write_fault);
>   
> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *file);
>   
>   void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
>   				struct amdgpu_vm *vm);

