Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0EB958BCB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B351610E358;
	Tue, 20 Aug 2024 15:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="moGZv2ig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E690110E358;
 Tue, 20 Aug 2024 15:59:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFgqt+SuxcW9RxrStQfhMY6xUHqMFIva87J0dpAPE/9/t80QAs7StXm6nm7DnRumWj7wh87p8HF1NZ9PPBqEMd0fQmnAeTECBo7taks+h07qXa/MAZ70GamSZ/ksLHEKAgDNS0xyBjJnkaGnp9YNjQdPKagxUrDK2dK35FjCP7crmQg8disXe3yhWOg8I2F8msAY6ryo4NeGeyzy063t+pIdaMLvZFa1OTr6KmM5hGX/BTbMnvndB5DrOI4vSXKVJXh+0XTv69hii1RCThhtFD0D3OKVViQzZAgPdhIax99Jcr/nBX2WDfz66Bjun0iHoggdJNwKDzxlXIR1o4tWtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn5XjcrfUKVO4r/7sLGszJpVzDrRiHOIxZMhyZfC4G8=;
 b=v6WUHwszwLtlcOF7g2unX/3urSlhd+rNOE/roGZXAjHgEGN7dZu3vryr85pDfnxEOac0+rOYEC4S2u4KJKyyFOiQvsnNHg2AIjxfkI5hYngr2kmyp2rrgTWvyygjTupuPd/pG/CBuFA7MeyEjbCdAs13Zz4b/XHYN/5rpJs40xC5QsI7v9+tecO3FP7Ukx0vxMHzcSYyRbl8DCNE/rGh3jCWnfg1t3qW0o5BkETRq1ucPlqh08i9gZV7AJu6+xrgi95QUuQs54TlCs2KQDMtd3usFVM0In6xWoCmxEon+Ya4DezTIf3+hMtVrZNwa5CYTx9XJDZvixucYJhAHCX6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn5XjcrfUKVO4r/7sLGszJpVzDrRiHOIxZMhyZfC4G8=;
 b=moGZv2igl04Zn4Pz/MrX3baBc0f7DpcjH9D2N0QCV8afXm/C7rJPV0xtKIn+xwlfKVRhA7Y0ueP8yZSCIRStrfYre4dZTUbiddr2VCXleA+HVFLiGOvc1uCDBAcuzKfGUAwK6i4m+hFmoqWz9WB+8jVvGZQotmr942jV0P4TmnY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17)
 by CH3PR12MB7596.namprd12.prod.outlook.com (2603:10b6:610:14b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 15:59:18 +0000
Received: from IA0PR12MB8208.namprd12.prod.outlook.com
 ([fe80::14af:1677:d840:8d2]) by IA0PR12MB8208.namprd12.prod.outlook.com
 ([fe80::14af:1677:d840:8d2%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 15:59:18 +0000
Message-ID: <6c7e61d9-4245-4c28-a528-96d8182cab8e@amd.com>
Date: Tue, 20 Aug 2024 21:29:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/gfx11: move the gfx mutex into the caller
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
References: <20240820143909.1933483-1-alexander.deucher@amd.com>
Content-Language: en-GB
From: SRINIVASAN SHANMUGAM <srinivasan.shanmugam@amd.com>
In-Reply-To: <20240820143909.1933483-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0127.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::17) To IA0PR12MB8208.namprd12.prod.outlook.com
 (2603:10b6:208:409::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8208:EE_|CH3PR12MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: c2210e80-09f4-47e9-5b3e-08dcc1310c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2NqTnpKT0hpY3JOYVZodFFndkxCYXFDZ3hGK0FxazlFWGU1RDlrWTF6UVNo?=
 =?utf-8?B?M3VMMXhHYVh4ai9lUWlzZ0lwT25HRXJQV3RnQ0VFd2ZXWGFMZ1lsTHFVSVRE?=
 =?utf-8?B?SkFUaUZvb0R5VGczaXNQRTdNbUlGM1lnNElQMmdHbGExUFA3bGJObTNzNlQ5?=
 =?utf-8?B?NVpIejhqcWFnNDJ2WFdWUkt6b2tPQk85TWc0VXY1Y3Awc01aeGZnSVB4cGlm?=
 =?utf-8?B?bFA2ZEkwSjhpc1dZWFZwQXJTYnN4MjVoR3EyUTcwUFBWd1pKVGE2Nzh2dE5u?=
 =?utf-8?B?VkFXZU52UjVENE9nQ0xjWUorZ0tNSE5vMXdwdGQ1MmM1dlZCQTdaL0ZaL1VV?=
 =?utf-8?B?cVB5dWlxQlFXOEdwMlkyRzY3SGpWZUM2T05uRkdlRStYeEgzcXZvV2VhaXFS?=
 =?utf-8?B?MDdsTGh4bklFL3ppbUlqS1RhTCtraVErNHBTbGtteWxpYU5KTjN3R1Y2R0M5?=
 =?utf-8?B?dGVQWkpVR295Umo3SWtXdHdOcTFOWE93QVMzT0pvbU9yNWJXZ3EwRllOQ0Ez?=
 =?utf-8?B?ZE5hUWJDNWt3SXFJQ2pIQ2NadVJKVHlDWE1YbVRvQlZpdW92SWhyOWdjcUVB?=
 =?utf-8?B?MlpTdFJkQWsxb3lOdWgya3puTUI5c0hNdEVvRklhcGdKQzFYV3AzSW10azVt?=
 =?utf-8?B?SlB2UmdUejd2RDE3UXZtSWN2NGpYclQ1NkFTakpaY3dkZStIQXZMSlZ6THRE?=
 =?utf-8?B?N0FDcHFjYTJvVWN0YjBHT2NSaVdzbUhrZHV3dnZTWnRFVG93OUZJR2syclV5?=
 =?utf-8?B?VVFUSG4xZk1GNmJoOHhQcmU3bkhEeVU5T1ZEblVuYVlTd3BZNkRza0tKVUJX?=
 =?utf-8?B?Uy9mMTJpRnQrK2Vtcm55NWZjemlySnRlZ096RW5MWmh0YUYrbVU3SVZyckZh?=
 =?utf-8?B?d3ZMTkI4QW12L21wa25GMWIzNlY3QVE1Qzk1Qk5lekM1RjhuZ2tHVG9vMWkr?=
 =?utf-8?B?dHZVVi95YURjSmJxQUVLNmxTWkxQcnUxQUlVNlplYzNsTXB2eWdmd0JtV28y?=
 =?utf-8?B?UVBSYks1dmVOWDBwTVUrWVpwR1BPWFBvc3VTV0psZk15SXJ5cXFUL0w2R1Fo?=
 =?utf-8?B?N3lWMEtKNWZlZ2hSU1ZNd2FiSlF1NzRRQjFvQWNTYUJmQXJvVXhkcmwxWm5k?=
 =?utf-8?B?R1g4OFJQVjNNOVdrU1Z2NjZhd1Z1RGhoSUNtMXphVzIzZ0dQMGVYUEw4UDJI?=
 =?utf-8?B?QmEvTFBEZkN5R1BMdGh2UzB3OGV1amc5eU45VWhWMGx4MEhZckJEdWxaT2tP?=
 =?utf-8?B?TGtOc1crODIvZXRCVFZKTmVFc2RWT1Erd1ZOdnJES0h1MGFMRDI4K01OSm15?=
 =?utf-8?B?anZyWTdwaitSbXhqbnIvUVVmZUxZZmxmcDE0WFlIbk9YdTJLT2tNenMyck1V?=
 =?utf-8?B?d0EwdGlmZlJjSCtLNWhGSlF6TmNtYWF0dDJ3c3lYQzdNN1Y0c3F2cWdRVGJ6?=
 =?utf-8?B?a0EwaTJoSW90WnJ0eHZ3c3o1OElrSjZtd2dld1ZOY2VEa2hUelYvK0FaK2Jq?=
 =?utf-8?B?WkI0dXdGOURLMDdaVnlaRlBaalNZbkwrd2FCRGMzTnNoMHlYS2JkVmJMWUF6?=
 =?utf-8?B?NTE3YXV1RlhZaWIreS9EZE0zKzRwYkFDU1cvRXFBSWhTaXFZejdSKzY1VTZC?=
 =?utf-8?B?NGZEVEcyN1AyNFJFa05RSWtmR0JGdEk2NGQ4WGYzcUNkTXBoYVR4QUo3Szhh?=
 =?utf-8?B?Q0J2cEJ5b3lQZ0hEd3BVcGtXdDR0eHAzTUxOUlM0a1kzNzZEajVKTlAyaXh5?=
 =?utf-8?B?TWlpOGtoOVlDRisvNFM2NWpqRHUwOUpFdkJncUlIN25FT1Vwd2svRUxUR0Fx?=
 =?utf-8?B?ODZ3QUQvZzNSYVBYS0JGUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR12MB8208.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGYvMkFja29MTHFMUEtWbm8vOE5qc2xyOTk3alpQTXp1R0c2OFZsaHdFM2J0?=
 =?utf-8?B?dUdYMlVEVzNnbWxvSlU0dW84Zi9SWHRRa2JOeURUcXlxSGY2LzhObnlRdFEx?=
 =?utf-8?B?Mk4xNFFEeUFCTUV0MjVCVHY4dDlZU1k0ZmV1SUdOUGJnNjZKYUttSjk5V1lG?=
 =?utf-8?B?YlVtK1ZkbWVMUzVlNUhzK0NLNm16azZpQmRlcFZwSXZyWWYwU2dtU2VVc21X?=
 =?utf-8?B?M3pWWlJCZTJQbGNIWTNqYXpDTENObWVJMzAxYWQ3bSs3UHVUbFJveWNQVmFn?=
 =?utf-8?B?TFBlTTBML2E0Vi9LOGJzTWVaVlFwSmJrTVVNQ0VFTUMrZVc5K2psSit3aGJM?=
 =?utf-8?B?NmxGZUIzZE9CSlgyT3pzSUdBeVBZKy9QWEIvMDVTZjRPN1ZJWW9XOE9YU1dP?=
 =?utf-8?B?WFRGYVRJeU1qdGxHZDZkMTAxM3F6a1NWVWZlTi9yRG5pVzVoampXdEVvT2cy?=
 =?utf-8?B?eEt5Rkt3VWw2VE1tc2hYdThIVEJPVlByeHVXaHU3YW0ybHc4RURiSEtFZjRq?=
 =?utf-8?B?TVVUdFNGTDFCdmxrdFY4TGk3N05VQ0U4SFJjVEI5ZE1wSHFnMmpaRlhCWWdH?=
 =?utf-8?B?VzdJbGc2RTNRRWtucjFxVlU1SUFzOE1uUGdZOVNuTkdNRGFqK3lxcFV4YTBw?=
 =?utf-8?B?dUNyNDZYbFBQckNZcjIwcFBUZUw1YWtnVTd5cVRyUk1Mall5WWJqSUNhTDdh?=
 =?utf-8?B?SFFaallhSHA0WmxrMUxiRW1MNU9MSk0wS2hMbE5Dd3dPQjlRNndmbVNxR1dM?=
 =?utf-8?B?SEx0R1R1RXVaRDZDUldCU0l2MUFOdHJYZ1A0K1VjQyt0NkZQRXRmeCt1NVhQ?=
 =?utf-8?B?M0NqY0ZFbHVMMXowdzZYTnpuclQ4TzhYd2NwSDlKOU03eVhybklqWmNDZlJp?=
 =?utf-8?B?cTlQeGh5c05hZTFOL3JMMGxmbGZaMmsrT0F5anZQNGtYeHlOTnlzdk8xVnVw?=
 =?utf-8?B?RGsrREg1TVE4S2JxNmZYN2dtaHRmbXZCcWZmSjZlVXBZd05ZOWNxVXo4ajdE?=
 =?utf-8?B?RGQ5UTBteXdRLzBLOEtGR3Y0UGFWWVloKzlTbG5DYjUxdkZEd3o1c3NXZGJJ?=
 =?utf-8?B?YnRLUnhJUzF4RStuWnkyRTNrcElFdU1ubE1YMUVxaVhjaHZLTVJubXhhbVBE?=
 =?utf-8?B?Tll1S2pjUzlFdS9CWWNZODNLMHFKZTIrL2F6SGlEOWNOY3JiSm54elAvQTMv?=
 =?utf-8?B?RWVxb3Y5aUVPN2hNYWhqS3ZMS2JscGpCU2lqa3BGZXl0cjk1Z0k5MGVQRmZq?=
 =?utf-8?B?eUlpMmY5cEVzY3p1ZWRVTXhWQkZoSE56ZXV1WVpYdXlIRHhHT1oydGFrUStI?=
 =?utf-8?B?ZFE0dStmTEF2SFo1ZG5YcUphcWVTRVZweDdqdnF4anYyY2FaVUdoTGJYcEdv?=
 =?utf-8?B?cXZtUXVoUERsRURyNU5YeEl5RGJ4Tldia2FBYWE0UE5IS0E4cFlGcEFZa2Rv?=
 =?utf-8?B?YU5GdlViYTRXdTQveVdzY2hrMHFleUZTSEhMN1dSdjJwUU5jTUNDb1FNcVpH?=
 =?utf-8?B?Z0tpYzhjZWhkeit5Nzd5SXZPZWsxdzNCR2dNeGJJMGZyMkZEeERmUXJkSTAx?=
 =?utf-8?B?dHh6Ykg4NVkydkVUNEpMSVdudjF1RENsWG1IVkVFWUtYQnIyZ0ZRTmxQZ3lJ?=
 =?utf-8?B?QUxnNTZRWlBvb2YzZGFuMzkxMWovRkc2OGZXNkNUQnpQdnpxV2dBQzErRjhj?=
 =?utf-8?B?TFJ2NTZMUTdYYmVqVEptcGFTZVg1N3RIUThSbXhOUG9BN2ZjLzV6aGVSY1BQ?=
 =?utf-8?B?QmVRMnRQS2xmTnFlMmFSQVk5WU5DaHUyM2JMZVM3bjA4VXFLSEJES2IvY1Yx?=
 =?utf-8?B?ZmllM1ZEcnhUNlIvT080NnBGb1RWTVBOalorOUVKejlENURaQ3hPeFJkNXZt?=
 =?utf-8?B?V2dPbnpBaGNkcHV3NUFReUJzU3Q0cEJIV0NJaWxVQmhkTjN2ZTB0S3FiNG9q?=
 =?utf-8?B?UkhoODhTWVFRNVJQOERyRDE0aGJmS3JCdU1PR05TcDNpU1FXMlpiOGZlQ1l0?=
 =?utf-8?B?cjRQeXhxaXBEbDJRQzBhK3luVUt2KzhNakJnVFBxVjlNRFpmdHM1RlYrTFBI?=
 =?utf-8?B?djRiOG9Rc3ZtWHcrRldnTFBIMFE3aWNHTkU0d3hVdjMrRmZCQU9nb0QwSjlH?=
 =?utf-8?Q?4S0Sw7rFTcU5EntR2c39N8zzq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2210e80-09f4-47e9-5b3e-08dcc1310c17
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8208.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 15:59:18.3099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPKkUyjQQVAbPbdqTFPUjdHt4i2X9f79XO4lQSqNpORb29Nw3DBEODOS3lLOQf4n3bD6WfED+JkWIH2skZilBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7596
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


On 8/20/2024 8:09 PM, Alex Deucher wrote:
> Otherwise we can fail to drop the software mutex when
> we fail to take the hardware mutex.
>
> Fixes: 76acba7b7f12 ("drm/amdgpu/gfx11: add a mutex for the gfx semaphore")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> index 5704ad25a49d6..aa7fdece8ad42 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -4747,8 +4747,6 @@ int gfx_v11_0_request_gfx_index_mutex(struct amdgpu_device *adev,
>   {
>   	u32 i, tmp, val;
>   
> -	if (req)
> -		mutex_lock(&adev->gfx.reset_sem_mutex);
>   	for (i = 0; i < adev->usec_timeout; i++) {
>   		/* Request with MeId=2, PipeId=0 */
>   		tmp = REG_SET_FIELD(0, CP_GFX_INDEX_MUTEX, REQUEST, req);
> @@ -4769,8 +4767,6 @@ int gfx_v11_0_request_gfx_index_mutex(struct amdgpu_device *adev,
>   		}
>   		udelay(1);
>   	}
> -	if (!req)
> -		mutex_unlock(&adev->gfx.reset_sem_mutex);
>   
>   	if (i >= adev->usec_timeout)
>   		return -EINVAL;
> @@ -4818,8 +4814,10 @@ static int gfx_v11_0_soft_reset(void *handle)
>   	mutex_unlock(&adev->srbm_mutex);
>   
>   	/* Try to acquire the gfx mutex before access to CP_VMID_RESET */
> +	mutex_lock(&adev->gfx.reset_sem_mutex);
>   	r = gfx_v11_0_request_gfx_index_mutex(adev, true);
>   	if (r) {
> +		mutex_unlock(&adev->gfx.reset_sem_mutex);
>   		DRM_ERROR("Failed to acquire the gfx mutex during soft reset\n");
>   		return r;
>   	}
> @@ -4834,6 +4832,7 @@ static int gfx_v11_0_soft_reset(void *handle)
>   
>   	/* release the gfx mutex */
>   	r = gfx_v11_0_request_gfx_index_mutex(adev, false);
> +	mutex_unlock(&adev->gfx.reset_sem_mutex);
>   	if (r) {
>   		DRM_ERROR("Failed to release the gfx mutex during soft reset\n");
>   		return r;
By moving locking and unlocking of the mutex to the gfx_v11_0_soft_reset 
function (the caller). This ensures that the mutex is always unlocked, 
regardless of whether (indicated by if (i >= adev->usec_timeout)) 
succeeds or fails.

Acked-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
