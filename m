Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F239A3D48A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 10:22:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FCF10E8FF;
	Thu, 20 Feb 2025 09:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iXk3bBHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2905D10E905;
 Thu, 20 Feb 2025 09:22:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lscwgFOmzMI7EsCvjr1GIlGuc5/mhGuG85ailn9RwK5f5j2Jox1Twi0fc3o28BtMyZwAIRCM/9Fr3PIiwyZn7a5FPZ+ptJDsy+YxOhZkARupi8hLZvtwUdvtB+PqRqoYwMUtePi/v8c93tkleslde6VoW8ObEiMwoNPfaTnK67Ph9Qa9LVJbR8LdLxupMXWvL7w7g23bXt0YPe65vcVRlpnFKLFBwWeynhQ1Km5cl6fC4KscZ1TgJmD28+SqXqmJbJC5At5eKROYBq4asUz76jIsCjTwzhSCwUhFm3+RjT+VIntMtKqULwA+QIRcWTgKlfvceMSY37pcvX8QFoIRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3+BNuIHT3/MRMJMLS0lTsy5I/wQpWc1p3bKrrCcm1U=;
 b=UrEtka8lP3HtyizdV8FGGZRqPw+Vz7PiH+umRld74zB/jt5D+FBnnGurP2NuQrZOeafWGZVuM5sejXl9egx2o6uwmxuHkTP0DbRfdjxPHZ3tacsbLuFF3Ls/T2dnMJNf2WV6ubh+AJCg4Y0Fe4oT4AuyR/QWLQcf0cSVQsg76sll8+NPZjbIQr/lv0iwstKosoGniWba+DsWLDduAT/eMMxw7LkWOTOKH5N7vq//nwzrpnP2t/j38MBsnZLVwqzdsOMbpOnUeNWzxA3+djCWmMAkIuGXSveBIzLXAN6133ewSfDm6jGePJiAroUh3ZvNBOLy/adyY6MFxerwjhZigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3+BNuIHT3/MRMJMLS0lTsy5I/wQpWc1p3bKrrCcm1U=;
 b=iXk3bBHpwVuyP1oUvbG2WlWq89jeWCfvQV1HiWcKvH2aJ/HtDIP2zRSA2R7ZO/0jm9kXRXI0AUODOg1dsXtO6Jur6+AZqoe2wi/0b0mh7TCM9icRbFVEDZ3X03lXYCnYQnWDJp5rwZr0UBSWucmwQNYkWP/OZEEuk8XwO9PSyLM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 20 Feb
 2025 09:22:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 09:22:33 +0000
Message-ID: <9b0a4a13-9d60-49a5-9166-6bb714f4dbfd@amd.com>
Date: Thu, 20 Feb 2025 10:22:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amdgpu: Trigger a wedged event for every type of
 reset
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com, siqueira@igalia.com
References: <20250219213517.281556-1-andrealmeid@igalia.com>
 <20250219213517.281556-4-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250219213517.281556-4-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0407.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 197528e9-221c-4d07-ae51-08dd51901b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHc3TnVTRGVLUDErT1RmK2NEYzVHczl1c002SVkwblV3Y3UwSDRNWDYweVlo?=
 =?utf-8?B?QVNFK0V5VUhSaGpqdTc5WnFzMk5zWVdMMjg2ZzZPa3B0bGgyeDQ2cnZmK043?=
 =?utf-8?B?ZjZjODc3dVU4VFpoUjkwVzBRc1ZKaW8wOFNycjRIYmxUeUhMcC84aWhuTGNt?=
 =?utf-8?B?NHByQVlSSUY2ZEMyQ1dEeVZLMXY4b3d3c0RNeW4xSThoUHk4cHUweSt1dWV1?=
 =?utf-8?B?MnB5NGxVcC9RL3pZbkxoUkJncEFETjN5eWpIbjhBT3lrSjc1REZURDdKZC9r?=
 =?utf-8?B?SnhPd2lMY3h4SU00SWxyUlI5NmZNMGZacjNwUWxNbEFZYjhTTXFzUVJxN1NQ?=
 =?utf-8?B?TFVQKzF6Z1RjbitOdEVFWWJZenJjR2k2M3ZESzNhakdtN005b00vRUp5MFJE?=
 =?utf-8?B?R0EvRC9QaXFDZkR5Mm56MHVGMnh0Rlc5NHcxcmJwd3I0WWhzdyt3ZUFiZ3ZK?=
 =?utf-8?B?NGxESWs0SkhXa2VZQ3ZkRzRyWS9iaXlKeVBQUkpZRGVKeU5qQ21CY04xeGg0?=
 =?utf-8?B?ZjVqTzAzUjBvL2pMSmJJM2p4akFRRHBmT1BHZW9qbnZNd1pGZ1UyTTNUWWho?=
 =?utf-8?B?ais5RlBGV1Z0a3NudWhJV0F5eCtUNUhoM0hIeEZ2bnNNNmxSc1JZQ0lTQWRm?=
 =?utf-8?B?TWgrMkczKzVwMlJQWTdvcWUrT3hzTDRxc1JHZW03QWhQTXRqMkNHY2dNUkNu?=
 =?utf-8?B?elk3Z3BFdCtTeWd4M3JOR0xIV0t5bE5QOEw4VHBWQWdiUThXVVVtdDRDcmU3?=
 =?utf-8?B?aVdJU1JWbzN6Q05PSUFYd0hEdlUxWkZzcEgzYUlkK1UxTTBTc2U4Rk9pUHh1?=
 =?utf-8?B?RHUzSzlzR3lncHU1SnRqMC9lemJCQjVUNUZkQjg1dHUyMjlEWXloRS9nK090?=
 =?utf-8?B?NFplbHc5TUhIcjFTNHQvR3lvRVhLdndIWFhjS09icS90WE9qaVhHK1JieTlT?=
 =?utf-8?B?QlBaMEYzNkRTSTVwdDNSZXkySUprcGJvbnZOSXJua1htNGJMT2NLYkFEalFG?=
 =?utf-8?B?R1U1RUQzeWMrOVI1cHBrTkprYkMwd2lET3VBMW9zYSttb2RHMGJTV0kyRkRw?=
 =?utf-8?B?dkVhK29HdnllUlYzYnp6L09TdWdSeGdaVXVYMk9FZTFOOFNCQTNjMHlBVXRO?=
 =?utf-8?B?S01Ba2ZLTkxLazVSRVRRaEdpLzYwOXJmVzNHSWNxSm8vbGxLQytBNjR4MFFQ?=
 =?utf-8?B?ZVdDc0gxMEtzVVVQSzRTbDR1OWNJekFEaHdDUDY3R3piRk5SRDBkVTR5SGdj?=
 =?utf-8?B?VjcxYzNVQjE0eXk2RkpHbnhLZFJGQTdxdDlJb3c2dlU1Zk54eGZjRTZubHp4?=
 =?utf-8?B?MENMdGd5N2lhR0ZBWlJKOFRDa2Z3S2JiZUNPTTJKdExIaW10L0F0L1VTbTA2?=
 =?utf-8?B?alV5aWVObEhTQ1REc1NNQ1JHaHIvUFMzSWJ2V0N1NVIxaWJIZ3J6NDV5OElk?=
 =?utf-8?B?bUZSci9nK2VFeG0xWkoxemM1blJQems1YmMvUzhBZlN0MXp3dDlsaVFnY3J2?=
 =?utf-8?B?Ump4dXB4dVc4eTRyd1pxSTVEcnc4SUZNRXN4ZjRNRHVWUEwrZ3NMVjcvTXBr?=
 =?utf-8?B?YW51ZVB6c1VVSGFXbVpvNHhYb2ZuaUJpQm1CRHp4YzFhd0J4RkZPaHhialZR?=
 =?utf-8?B?YzFFU0QzTVpHaE11YlBiSFJxNWtQbjJERGE1cVg4bE5QQkRwSWUvK1c5VTdV?=
 =?utf-8?B?cE8vOGJwa2RidWtVUWZVZVlJN1J5R2J0dUh3bVFaWSsyMjVLdk9xQVlNSnpq?=
 =?utf-8?B?MHpZaHVwVmhFL3ZsK1JLcWpHTEpQMTZ6MC92MSt1SWZwVEtsYk44RW5meDJr?=
 =?utf-8?B?U3QwV2xFd0hNcHQ2bUVTT1lqNWdnR1NrS09wMzVwZmRDYnVqRG84RU1ZNHYy?=
 =?utf-8?Q?HRbf81bykLHPM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnN2eE5LVVBhU2tJMkZRSVB6N3d3OTJ6TUVsSStCQlA5WFhRSm9PQkV0eVFO?=
 =?utf-8?B?Uk51VW9CUGhTbnJkaVMrMGoweC8wZjR4ZTBGRGN5K2ptU0V0eTdrZGtQWGJN?=
 =?utf-8?B?RnRBSjJaNGMyZXhXdk8wUlo3cENJSHZ5SytmS3N2NEszYUpqZkNiTldyYmlW?=
 =?utf-8?B?bEVQaWI5Zyt0MUhiK0VuSldNUERETU9LUERXTjZuVnZPUytCZnBwVTRKRnJx?=
 =?utf-8?B?cFdNODJtZ1VXeUQwQytiOTU2VmpZdFhCbzViL3htL0Q3L3A0anNnTGhkRHRD?=
 =?utf-8?B?Qkttc1ZpRnI2Z2tJbGZES1VKakRLUk1YaCtBRXdHTWlaSE5yT0lnZWxkbTRa?=
 =?utf-8?B?S0FXSXMxVjkrMWZQWDBncFVJVTY4dDEreDRuMjNmUGFXTldaRno5TmFuaW0x?=
 =?utf-8?B?QWl0c2dRL1JaU1RHOFlCc3lPUFgwNXFTMENSRXgwTnN4Yk1UK2JadUdvUDdB?=
 =?utf-8?B?eWQ3dWkzeVFlMTR3YmpHdWp2eFlnbjVlNW9ISllLTjRaMVNDTGdwb2ZFcXFl?=
 =?utf-8?B?Y1phVTlrRFZveUdXRkh5MElIS2pENXRnSU5FeElXY0VDOGJhVzFRT0k2dmVP?=
 =?utf-8?B?VU9TVGljdTJXdzBaU0hTTkZMcGpITXBvMTJnaXY5MS90c3BFK1NGTnA4QVli?=
 =?utf-8?B?QUdwYmlqWEgvYml3MFQ5U0FMZ2R1bFc3WVhoZW0zS0xsUjVFN0VYVVpMTDUy?=
 =?utf-8?B?RldFSHhQeVFuZWpLSE4vWlFxRjh3N2N4VmtVQ3VKNFVWckRCQjQ1aDlIQW1C?=
 =?utf-8?B?cVVYN2VILzZVRkp5dENiNzVVTjQ1VXVJaHR5MEJkYmlHeG9ncG9XNTBTWWpi?=
 =?utf-8?B?WjI1cUt5SDIxc3JwcWhNYVZDenh4WUVkVVJ4ZmY2WmQ4cGFkeW8xd3c0WFMy?=
 =?utf-8?B?Zjk1ZEF0b0VtNFUxYzNRVytIUGc5SG9weFR6MUtPSG1keFhSc1hLbHJZcmhJ?=
 =?utf-8?B?emlzb1FwMnI4QU1Na1JJODZPYzVuY2VKeCswK08yamFqd1ltSW5yWDBkRUlH?=
 =?utf-8?B?clB6RWdiSGNkNllGWkUyVFpkVGdVTWpVWW9UK1ZESGhuaWZPeVhZT0hPWmQ2?=
 =?utf-8?B?TWwxZGt6VmM2MUJVSVg2Y25IalpiT3RvK3hPWDJOcXBQbmhjNDgwcWlBQ2VZ?=
 =?utf-8?B?WW9mSVQ5bVNiQ2hudjZ3MTRZdDdtSFBtTFZmeVgzQTUrRXp4YkFBQ0lUWEx1?=
 =?utf-8?B?RC9BWk1MWnRieTNwNjZCaFNBbkwyWUN1NjBCWlhVMVhrMmQwSWNxU0VKY0hW?=
 =?utf-8?B?eE5zNTF1TDVkTUpDNlRUYnd5aW52VmhoSHZnM1hULzZHODY4eE5WNW1FNWtJ?=
 =?utf-8?B?MndrMjVrUEFNSko1TnViczJTaHZYN1BvaDVCcUdsUW5NRy9FK2VNMm4zR2sz?=
 =?utf-8?B?b095RXlLZnhRdnV3Qi9QWmNFL2xQQkFjSXN6YjhpSGwyK1A2WWdrTWo1b0Zr?=
 =?utf-8?B?N0pROTFoUlU4d0lzcWNaWHduWWtBOHRoTlYyNk9vOFh2UUg3R3dxU2pHVzdL?=
 =?utf-8?B?ZVYwbDE3UkRJTTlDWjl4dllwZ21kazVBajloQmZrcXBZOHBQcUw1cHJWZTB3?=
 =?utf-8?B?em5CWnhlMXkrMy9Yb1JzT21ML29CQXdaUTh5Y2ErbnlGQm9WbFI2NmVXUzZD?=
 =?utf-8?B?emo1THZJcHBZbldMOFRsUDllOFYwMERBZkZ0Q0VjOU1PejA1cXNqOXRYelBL?=
 =?utf-8?B?TFJoandhOHh5VGgrbHNBSTRtcHZ1dUxqZDBIMzdWR2o3YUUxLzRDYXA4UVVp?=
 =?utf-8?B?SHlWZzRBYkluVkJYYlFncWZKRHpOZ3JvaFBqS3kvekFPaTVzMWxKNWhrd1M5?=
 =?utf-8?B?aytNMjY1Q2l6VysvUzRpNUxSNFFwUTZQbDB3WXRZU3luYzZzVnlXR21WL01u?=
 =?utf-8?B?ZmxuRE94d1dIdS9EZ25wejNhOFQzeEdVMlpQWXkydDV4SWdkNGkrS2FUQURM?=
 =?utf-8?B?S1ZKeG0rL1hIbDdnblJoa0x3WnVicjZaVHdDTWIvZ0RFTW1VMGJIK1E3Y2Z2?=
 =?utf-8?B?QkVEZEhlbG9pNUFYcnR3TXREbUtDTUEzRjB1U2plY3ZYWHMrQ2RTYXgvUTY2?=
 =?utf-8?B?cElJNzZrTUZHREI1WENnRWJxRGdiSTBONHpFcEg4SWI1WCtvaE9zdHNrMzhD?=
 =?utf-8?Q?f8SZj70MjfnZJgM6V5c8LQYA7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197528e9-221c-4d07-ae51-08dd51901b5f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 09:22:33.4075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHUKwagsYuwTnnbYmqc2L6M//94Of01B8ibf9vo/k0QCjylkeGEqZo+iU2eoa/ZP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6290
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

Am 19.02.25 um 22:35 schrieb André Almeida:
> Instead of only triggering a wedged event for complete GPU resets,
> trigger for all types, like soft resets and ring resets. Regardless of
> the reset, it's useful for userspace to know that it happened because
> the kernel will reject further submissions from that app.
>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  3 ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 16 +++++++++-------
>  2 files changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 24ba52d76045..36738c1a5b59 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6123,9 +6123,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  
>  	atomic_set(&adev->reset_domain->reset_res, r);
>  
> -	if (!r)
> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> -

Feel free to add my rb to patch #1 and #2, but this here is a bad idea.

We have resets which are not triggered by a submission timeout, but rather because of RAS (for example) and those would now not be raised any more.

Regards,
Christian.

>  	return r;
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 698e5799e542..1082b957e7b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -91,8 +91,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  	struct amdgpu_job *job = to_amdgpu_job(s_job);
>  	struct amdgpu_task_info *ti;
>  	struct amdgpu_device *adev = ring->adev;
> -	int idx;
> -	int r;
> +	int idx, ret = 0;
>  
>  	if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
>  		dev_info(adev->dev, "%s - device unplugged skipping recovery on scheduler:%s",
> @@ -141,8 +140,8 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  		 * we'll fall back to full GPU reset.
>  		 */
>  		drm_sched_wqueue_stop(&ring->sched);
> -		r = amdgpu_ring_reset(ring, job->vmid);
> -		if (!r) {
> +		ret = amdgpu_ring_reset(ring, job->vmid);
> +		if (!ret) {
>  			if (amdgpu_ring_sched_ready(ring))
>  				drm_sched_stop(&ring->sched, s_job);
>  			atomic_inc(&ring->adev->gpu_reset_counter);
> @@ -170,9 +169,9 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  		 */
>  		set_bit(AMDGPU_SKIP_COREDUMP, &reset_context.flags);
>  
> -		r = amdgpu_device_gpu_recover(ring->adev, job, &reset_context);
> -		if (r)
> -			dev_err(adev->dev, "GPU Recovery Failed: %d\n", r);
> +		ret = amdgpu_device_gpu_recover(ring->adev, job, &reset_context);
> +		if (ret)
> +			dev_err(adev->dev, "GPU Recovery Failed: %d\n", ret);
>  	} else {
>  		drm_sched_suspend_timeout(&ring->sched);
>  		if (amdgpu_sriov_vf(adev))
> @@ -180,6 +179,9 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  	}
>  
>  exit:
> +	if (!ret)
> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);
> +
>  	drm_dev_exit(idx);
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }

