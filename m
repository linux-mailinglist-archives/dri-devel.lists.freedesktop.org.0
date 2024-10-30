Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AA09B593E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 02:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A2810E72E;
	Wed, 30 Oct 2024 01:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mpIuWVwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AEA10E72B;
 Wed, 30 Oct 2024 01:41:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Da5LoA5H2N3V5MuRv6iUt1IHXKsQ4RLeWQuUUfJF9mJzjCgR1v0RFKtK+WaX93mvFcQI6eYLU3RmNehS8InQ72q3YjMn/0SObHTLGK/Cy+vpCaaZp+i/VfwLUNZIap3Aec+3sTcoHuYvrQh/rLpUhU7ZpcOJ5szUiftU+SHEIXk54TkbeqGhFH8yTfg9atV7rs8bjOg25c3rZ9uRnG7T7tNAhf1n0cOKbe4jSuxzXPvcsL2cXelqPNTNLv0euyf+XGD/70VEEXxCEU88r04efzOpaKVFfThHQvGd2XBv8Y35eA3Sz7baaBLEzppewvC8qylN/ic9Gng57fyb1Le7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roFLcDCHW17prPBTJsp14TozwXnEZV25chNzCFaaOHY=;
 b=VKG1zWecyEFffWgy49fxYX302PF1rin/4F1hDwLYkIQfmIbHo6aJ4Xy7SlbQTfnclLQdsRgFrTwtN/g5O+6ufh8Jj945obL1SEOTjmT8o6Bp3nHPuQjN7tYEeeGJnnrj19VRfr6KlUv2aVVQ/m8ZvEbbkglzl70DctLo7BUr+NgoRi3UJbw+JuSMbCxYvTuyyNUSTvmsC4rQt2YWAtJNV9/bpldSqnWalSxbcUVAxA050cfksO5qg3P2YvbrDl27v83Gw8W7/UnXDn0nYgGCq1qEZIRg222tAFXPnZyXOu/08pZnXsFx00KRgA3eWaU5YZRuPl9ojeLjMMRRiKFhgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roFLcDCHW17prPBTJsp14TozwXnEZV25chNzCFaaOHY=;
 b=mpIuWVwVZk9DeKhucLah/wZy6SOlR8bKq+FRbmd2Ijh5JbpMMiFFSTJr2Tfxx0yhoiLisYhKbP0ZYbU+JFIF8Nw68b6LFdxVYnYxMR8pkPmYli0cQu1L7xJLtpNRZXshRMb/w4d9NfbTYMLWE9Nw2J4ElodT8uWH1KdvA5V/js4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB5883.namprd12.prod.outlook.com (2603:10b6:208:37b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 30 Oct
 2024 01:41:25 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 01:41:24 +0000
Message-ID: <08add1ec-ceae-4f74-83b0-72d0df510950@amd.com>
Date: Tue, 29 Oct 2024 20:41:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu: prevent NULL pointer dereference if ATIF is not
 supported
To: Antonio Quartulli <antonio@mandelbit.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241029233232.27692-1-antonio@mandelbit.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241029233232.27692-1-antonio@mandelbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 203a093a-f7ad-469b-01fc-08dcf883f6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGNPMEdxeDg0L0J1VExMRVNBQjkvSEJ1R0RoRVd2ZFZDK2N2bE5xbEFYcFJt?=
 =?utf-8?B?YWZORGJxamxlVWFBeFN2SEtvQjI0WlYxYWZnRmZWU3VDV2RBM1ZGYXdvMmV2?=
 =?utf-8?B?SkdxVHAvVEZiTXNGY2FaQWlTMldvcEQxd2pSOFJiSjh0dy93a3NjMnN6bGdy?=
 =?utf-8?B?ZUxTcnJ5Z1RDOG9hODVGQ1M4cjBWNzE5eUtaVm5DYUhRb2J2SVpVUytlNHFB?=
 =?utf-8?B?YkFSRlhXaTVZOTAxS2Z5UUNFUTBIdTYyWksyd0VsMWdieWN1NTN0eWRxeWs3?=
 =?utf-8?B?a24wU1hnZVlRdGs0aThyeTcxdXhIb0QwV083N05EUzZGOWlRVWdVWk9TNmVv?=
 =?utf-8?B?NXV6V0p4aG9KdE5xUVJJcCs2UUVFTEF2RUJScS9Qai8rY0lwYzZGY0hSK0l2?=
 =?utf-8?B?TGQ4MTB2dXZyRWlpVGZQem1odDNHUUNjNzBvVWFHL0wrd0krSkF1TlhFMXRS?=
 =?utf-8?B?SmFtaGRBbTd4ZVZseUlOeHlaeWowMnM3YkEwYzU5ZVlyQXdQMHErQkFIM3ZS?=
 =?utf-8?B?ZXhkZjYzQklpWGVSZ1g2OTBFZEhlMGZWOWc4V0VzdjdVTVdxbVU1ekQwNElI?=
 =?utf-8?B?SlNCOVdUQ1UyRUYrazBHVy9rYmpzZHRXRVU5VDgyOEdYZUM5VDJ5RTA3WCtB?=
 =?utf-8?B?TlgrcXdsdjMrR2lMZzMvMWZOSzVyaENJa1NzaVM0T0FDUHhGdEx4UWh4SlpJ?=
 =?utf-8?B?OXIxTkdxeEFBOHgvSDlaYzY1REpvUklWRmVmWVlOZ3lyS3ZkSGpkVlRRNHN0?=
 =?utf-8?B?bHlNYzZ0by9xUTI4aXg3eUk3UmFFSEE4Um5DQk42cW8wWmkrR3FKM3FseHc0?=
 =?utf-8?B?enZaeFRpZ2xTSE9NM2JqYjJCVmZCSUxrQmNoeUFLL1oxTXFlYmVRVy9vR3ZQ?=
 =?utf-8?B?a3RJQmc3Qi9jakRuMWQzRkI0eUR4bFdYV01mOVlnUk5vcDEwaDJVM2Z0cVNS?=
 =?utf-8?B?dFNEK3VWaDB1b01iVFNvRG1Xd1ppd1ZmM1luOUcxN3JtN1VhT2I5bkJpK2Nz?=
 =?utf-8?B?RmZmUUgrM2k0M0JZK3ZlaXQveHZMYmNmNkxTeUFTUmNnNmpEaXZWazU3UUdM?=
 =?utf-8?B?Wi90QlBraWlPeWtSL2Z0Mk5kSXRHUXpSWEh5REhvOUJWMmlpRGtVejZpN3cr?=
 =?utf-8?B?UmZMN0daNllQd0lvdWZLR0M2N3JFeStZN0FDQWp0bmZYUjRYL2lzQ0lXZzZL?=
 =?utf-8?B?dEhVMk9vcVh1UEZqTm5oWkQzbC9QTFRSSXJnb2Zra25jZVEwN1VDc1ZLRTZ6?=
 =?utf-8?B?c21Rb0NEbHBsL3NvWmpSVmtncm0rM1VjZC9jRGR2NENSRFM5NWl0Z0kzbU5M?=
 =?utf-8?B?TEhoY3dhbWI5ZEZiVGE4cytGNFAzYlhKR0ZvNGdMNGZYdFMrU25oclR6T2JT?=
 =?utf-8?B?dHR6WWp2cSt3WkdzbjNNeEpCbmt6cC9zaHVoaGo5MXd5MDhJTE9ubDZYOG5P?=
 =?utf-8?B?NU5LU3ZlSjh2YTVCMitTeldvejRNbWdaaDF5YlNENWpLR01DL1JpTy9PaElR?=
 =?utf-8?B?eERFUnMzSmxxaUlXQ2JrWUlCVGhRRU9HNHN3REJZSnFXSVdaTkF6MW5uZUhy?=
 =?utf-8?B?RURCQ2ovb3dtalpTUDlnSld5K2hQSEIzK1lGNGMvVTcwVWJodXFJZGR5TXV1?=
 =?utf-8?B?YTVGUFFKZDRKancrNWNINTl1Zk9Wd1hRV29YUkh6VXlXVk15WFBoYjNNTndY?=
 =?utf-8?B?ejBVT1NzaEFFZFI2RVNIUVk1aitmRVZ3dVVvTll4Q216MVZXbldjZ05VZHNU?=
 =?utf-8?Q?BZuB7niOuh7rOzdXwhRJG7wkYetBi+hBpArikbh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjEwNHI1dUNUZ1BtU0lJeFVTdStiS1A5eEdDZU1lK2R2V09XaFU2NE4ybzBv?=
 =?utf-8?B?WDc4U0F5cCtBYWlXVzZENlZNR2RWS2ZseHB4TXFKakt6cWRZeVRoM1p1SExR?=
 =?utf-8?B?R0hGT2FvMStIaW5JeGNLakd4djVpbXdzMGMvUjB0NGFJSmwrdDZEc2o4Y0Rm?=
 =?utf-8?B?RDBYY3NIaG1NekV6RFZqT002aktpdUFydkdLeGhtNXdLZVZvbHQxbzA3ekRk?=
 =?utf-8?B?dG9rK0tXN25yZ0NaQWdpNHN0YmU5cEtpWC9zOVpTWGEzTjAwcG8zQlJreDEw?=
 =?utf-8?B?YmFlL05SN1B3WlFVRVdKcHFhVkgwemowTS94TGVack44Y1l1bUJKQm1NZEE2?=
 =?utf-8?B?b0UzUVNlK1FhMzFsbTVPS3c3Y2w0QUxIY2tBMFg2bytNeG5URFU0Y25TNFMv?=
 =?utf-8?B?WU1kNGcySVk0SU9HYnVGQ1NveGk0a3RiK3k3NHdFNE83dzRDRnJCY2dKVkMy?=
 =?utf-8?B?QjltMFc1SWVodjVVRzVuQ3FJb2doNlIxcHFiNC9vcW9CL1hkVGorSmxMdXJx?=
 =?utf-8?B?SUlGUTJWbit3S1NWU2h3SURrVmJFcE9TS3FORVZpNnRjZzgzRUY4Sk80bm5I?=
 =?utf-8?B?SXRQd1p4ZTJ5djF5eXR0ODAzdmp2dUltcUtUYmw0V2pBQ3lsajZQU2o5bTlv?=
 =?utf-8?B?RTNFdjN1S1VGSGZtc3VQa1gzc2laUzFmWVBLQS9VVzlXeTMwRjlrWXVTa3Br?=
 =?utf-8?B?K3RhTVdlakpNQ3FVK2YyWU1xNGFRTjJneVpST2NkSElLd0FPSE9vVSt5VVFm?=
 =?utf-8?B?RE1OYkVDSW5uUkg5M0VhUVdhdTAxOFQ1c1VkZnJjK2FBTFZJYVRieVF2YWMy?=
 =?utf-8?B?bFM2V2hNcXM3b2FYZjZsNXR6TzdVbUQ0dEUvR2JlTGplWSttbEN1cG1qMDlM?=
 =?utf-8?B?R0liUmx2MGlPTEY0QnRuZWlOYlV6N21zcnNmUkFIdWs1a1lZNmk2MlRGQmdh?=
 =?utf-8?B?K2lzUER1L3hWYWlUTFRmaXdRcmZjZzFKandkaS9wMkFRcHAzYzBUOVBNM215?=
 =?utf-8?B?UVFpTUx3WVYyM1gvYjFsVnhLNGplcTNXV1dIQ3VwRXZyZllvQXBqWU9maFdR?=
 =?utf-8?B?cmU3UXkvNlNMVzJ4dU9GVzdFbXRmYWdSWHE3SENkMDlHWXAvd2M4Q3ZKa3lq?=
 =?utf-8?B?ZzVCaHZoMHVrRitGcTZqUU1UYzdQRkszWTRkc0dQUHFZNjVrd3ZMVS83QlJz?=
 =?utf-8?B?bFUvWklQQ3YyQkhHQ2toYlpFdkRDdEVnaTVBS0NzbHpwL2JDakU5cUhzWHlu?=
 =?utf-8?B?eWJ1NkxpakJwYW8rZ1NaMGJETzVtTXIvODRkQmdWbmdSUHNvM2dweXg4WFJT?=
 =?utf-8?B?blp0SDdZU2VQN083K1RMaTV0TUxLMnk2bEhTeFFVSzFjUm1LOVdnUDFOMFJa?=
 =?utf-8?B?ZGhndDQ2NmZSUkdMRXFabEF2aEt6NDRpVmZjVkVwejl5OTZvMC9TTER6VU40?=
 =?utf-8?B?cXRQRkZ4L2lxMlphQ2Frcy9RZHN3TDNZaTFZYitBNHVrZHNiUXFaVUtmdkls?=
 =?utf-8?B?ODE1V3lnSDZBOFFKRDBtMVpUd2IrMStLZDRrNEkzNkkxOVhjWkoxWWlibEF6?=
 =?utf-8?B?RzhCdTJnNEpjZ0JPQTNNWHpkQ0dIdWVoZXF3WTEzQ1phOEVza2NYZlcrejE1?=
 =?utf-8?B?Z3Nlb01JaWtMTWRuYnN5bU1XZC9xL3JoRXhubVJBYTVFM1crdDZlVzl5T1Na?=
 =?utf-8?B?OElHUk9RWHU1NXFzbE04YjdSS0FIYmNNRk41MlFVOHVkc2tEYk00Q0ZxVUZj?=
 =?utf-8?B?Y2lwZzUvK0JHaDRVbHBVRnFlUjNiTjZGS3k5UGVyc2tYUW9oNk1ZYzJTTGZ0?=
 =?utf-8?B?K2dqYUloRjlDUmdLZ2NBWmc3Slp2Q2ZwNGFYTGl5anJySzRCazFnZUtCV2dZ?=
 =?utf-8?B?MUtoT2hxRGF3RzVMSXhnWG9TZHZjSmdnSUd3YlY5alFNRWtKcUNoeWtwUWg3?=
 =?utf-8?B?WVkwZ29MUStjeVpsYXQzWVAwS0RWREtjY3hmTjVZUTJFTk41TEEzOW43Wjlm?=
 =?utf-8?B?L0FodmFwdTI5SERaVWVmaUcycmRWblVoRXI5WENRZ2lQQnRpZWZxZDRud2ZG?=
 =?utf-8?B?TmM4S0dqcmQremhmWnB6YktjcFdoYzZGcFQ1SmgvLzRzOTFMT3dRWUtYS3NN?=
 =?utf-8?Q?ECopr9GszbASYcyUzVSYBEyWk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203a093a-f7ad-469b-01fc-08dcf883f6fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 01:41:24.9344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqnF4lLZCqqgq+jVFF1dsQFyQJ4aBhRXfyyv3qJhpLp04ckU9k/BE1xQdmcX7XoAAHhzz8SOSDv8vJuREzgcTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5883
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

On 10/29/2024 18:32, Antonio Quartulli wrote:
> acpi_evaluate_object() may return AE_NOT_FOUND (failure), which
> would result in dereferencing buffer.pointer (obj) while being NULL.
> 
> Bail out also when status is AE_NOT_FOUND with a proper error message.
> 
> This fixes 1 FORWARD_NULL issue reported by Coverity
> Report: CID 1600951:  Null pointer dereferences  (FORWARD_NULL)
> 
> Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>

I'm not really sure how realistic this failure is.  Can you share the 
full call trace that Coverity identified?

amdgpu_atif_pci_probe_handle() will check whether the handle is 
available in the first place.  We'll never this this far if that failed.

Because of that I don't follow how this could return AE_NOT_FOUND.
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index cce85389427f..f10c3261a4ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -172,10 +172,13 @@ static union acpi_object *amdgpu_atif_call(struct amdgpu_atif *atif,
>   				      &buffer);
>   	obj = (union acpi_object *)buffer.pointer;
>   
> -	/* Fail if calling the method fails and ATIF is supported */
> -	if (ACPI_FAILURE(status) && status != AE_NOT_FOUND) {
> -		DRM_DEBUG_DRIVER("failed to evaluate ATIF got %s\n",
> -				 acpi_format_exception(status));
> +	/* Fail if calling the method fails */
> +	if (ACPI_FAILURE(status)) {
> +		if (status != AE_NOT_FOUND)
> +			DRM_DEBUG_DRIVER("failed to evaluate ATIF got %s\n",
> +					 acpi_format_exception(status));
> +		else
> +			DRM_DEBUG_DRIVER("ATIF not supported\n");
>   		kfree(obj);
>   		return NULL;
>   	}

