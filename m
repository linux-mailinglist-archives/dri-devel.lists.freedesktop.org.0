Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46812C7A82E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8F510E077;
	Fri, 21 Nov 2025 15:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XuIfhD+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C5710E077;
 Fri, 21 Nov 2025 15:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npY9X70xwZ0FXG3Xzi1PD2bXqtoAKEQYs7dCtHguapZegpjrBWqaKWdFEBPmROSuacZhnyk9AnfepB1E5QyONFJ0ZNhMvPtg1f9iuMGFXwnCSUtxbxJN8ohrVT+uL7xgD6SfqPFEgjpQGPVkVe2prjmvfAkFbwxz9kBn4DSZhw6T+mEpvWThh1Vs8BViVPzU0Sl3rJjTHabTGUuMl5PFDE/lg8EtZee38IlsEBeCE+jmBWTn0bT5ahtwVglrXhGTmdR+3Ed85iCKbMG/152lBeNftNCjuDPZb9dXz4cXa2ew7LDWzuXk9soqEdafqGtqY23uhgnMCMD8eK34+gQopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bi0m4Bdvy0gZ3BUBmIRH9IHBH2HbQq+rDdv8Swj+k2k=;
 b=veczzH/VRRv65ErOUelywbd2bRF3ytFTWSOvR/ok6LLde2ld+SY2at2/EfdSbn1ja3OfUMh8AwZfW0mBv6mhPE3036sPdTsuDq35Bh/izFsFrlBADDO0wzLoZBSbxgHBKth5WV0xJa4OWpOk3GheRQDZagoJTR6vqTm4LbYQhUme/SB7Gl6mdcV5DmOG0/J5QMqmpr1WU/j6jSN64p/VeyRkSv6xI5DQRzAvtcMTY/Kdt2Rn+dXZMSa+76ebm1t7w/w/SRXP4SBjkrGQQmcl2JYMB3U5ndCNlid/p/WIAGJR+ZdGnjYwCr8ksFsQIlPTDAsIxxr5q71JuJwmObOKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi0m4Bdvy0gZ3BUBmIRH9IHBH2HbQq+rDdv8Swj+k2k=;
 b=XuIfhD+EeH7BQ7P1ZOCFZ/wZDFHIJ6vCWvKXpTC8R9GD5o1sZfkR2Sl1e4AMi+isLuil8t3x979UBvvehNlT9CjoiYQ8b5DdjzNvjlEw5am8DM8JUJ7iapxaJQ3SA6KSPwsip2pcl3RiGPfzlBNVMeDdMmnm/NiEsGm6eWHCZtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB7173.namprd12.prod.outlook.com (2603:10b6:806:2b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 21 Nov
 2025 15:24:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 15:24:01 +0000
Message-ID: <29299d67-d7e5-435e-9c80-89d8cce6ed95@amd.com>
Date: Fri, 21 Nov 2025 16:23:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/28] drm/amdgpu: move sched status check inside
 amdgpu_ttm_set_buffer_funcs_status
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-19-pierre-eric.pelloux-prayer@amd.com>
 <1afb2956-af6c-4218-83b3-85f241332ec9@amd.com>
 <41ae6d5b-8b50-427b-a89e-d9c5df7779b8@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <41ae6d5b-8b50-427b-a89e-d9c5df7779b8@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a1025bf-b04b-4212-92a3-08de2911ff1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anNJeUZWWDVqWmpPY28zZU1BWGpCZUpPcXpBeU5vOXlBZnNOWWJEaWZLUHlh?=
 =?utf-8?B?T3hUdks3bUpVMFpjT01oMGVJdkQxWGNsMEJEaHRpM25ZWlhrbGFOZGxoR2g3?=
 =?utf-8?B?NUF5MVpCUWE2dFVMMXNyQ1A1SUMxNTZ3YUQwbi9QOWhxczAzMTk4dzVnbW9m?=
 =?utf-8?B?OW0rL0wwK3V4c2VIaGIzWUpBdkNmMkNxcWNldlFtNytkdUpaWnFNRUw2am1n?=
 =?utf-8?B?M1dvY1FIYzFzVUhJdEdDaE5DdkhOcjlVY0VBUlBLVDArQThCR0FRM3ZIMzU1?=
 =?utf-8?B?YmZCOGVYQWNFUXNwZjJlMDJaTW10VWRmK2ljVTQ2OXpvVHVzT0xKMGpsWm9I?=
 =?utf-8?B?UE9aakRPRzB0Z3NtY2tqblNROVQxSVJJc2p0SXVQVmhGUnFxSm1kS290NnJZ?=
 =?utf-8?B?cTRuRmk0bDBLNS9zWjFKNGRYTlVaaW41TjQ0bnh5K3BnQkdqdzh0SG9XTWQz?=
 =?utf-8?B?R0dCUFBvZW5oczJPcFhIS3AySUlYWkFzR2tQYXZxdDZPMGYzcXQzSWxHZlkx?=
 =?utf-8?B?dFlyVy9HT0Z6ZTJmUXMrNWx5a2ttQnQvQzhVN0tEZ2trNHZEdVFwemVzbW1Y?=
 =?utf-8?B?OVprU2EwY24zUjlQTWJqZENyeU42ZUkyQ1FGdlNQQXdwbWk4VXJTTjFoVkFI?=
 =?utf-8?B?T0NJVE5XMnRwNlF6ZkNQMTVaVXgwTmRpclNUcy9DeGVLczRLMUpoV0NBZFp3?=
 =?utf-8?B?U0QrWnZhM05MeU4rN0pxTnMvNHdsSzNCcFdxd2diQmJHaU01S3QrNGttUCsx?=
 =?utf-8?B?L3J2Y0o0dGdacFE3WW11L1I5UU85dlJWQjVIbEtucEo2SVk3MWo0elBtVTEv?=
 =?utf-8?B?dTV2VWR3S2xUR0ZiVlhndDJaeFhYYjlPQ2k0d0dudnVKbHpGWUFGMUplUnVt?=
 =?utf-8?B?Q1dmTnRCRUFZNlU2SDhMejBUWEl2dzU1blQxclFqZWNocFZObjZubGdKclJ0?=
 =?utf-8?B?MEo5cjJRZ2pVTjdjL09ETEZ0bGNJUi9aNk1kMXJ3SGorZHpOWldmOWlqUUh5?=
 =?utf-8?B?bDZuNXVmUGJSbUMxMThBTXl2alNnUW5pNjVhSmhWWGU4RWlEL3Z1aXhEMEpn?=
 =?utf-8?B?SGR6RmJLN2RTSVVpU24rYkVPUjRHSGdTblBReXNhUGJxdmVqWEN2Zi8yUExz?=
 =?utf-8?B?cERNQUhyaU1jb3g3MXBZNmRuVmVTVmFFdVpWSEorVjZKdkQrM1BRb0NmV0pF?=
 =?utf-8?B?d1RRV0w0Q2dSN2t5RUl4YU9LekVuZktKTy9Ha1ZSalcwM0FQdUg1enBiYkR4?=
 =?utf-8?B?a1lQajh3VmVFZklTeGRnUlZnOHVaNm0rRmVuTUJmQlhyNmRvMVp5ZXNkQURt?=
 =?utf-8?B?MysrTVhQdWxhSi9aOTllY1VBMDBFMURvVjdlcFRFclF2SXBkNC9HL2krTGpl?=
 =?utf-8?B?bXJId0xRNmhqclpuY0NwSUtzVjZRR2lNT2xzeDNNUHFHYi8yT3NMeWgveVV0?=
 =?utf-8?B?dU01Nm56ZGIxUVU1ZzFuNUN4aTllenk4cm5EQW9TSndaNFRXQ3NCVVprU0dN?=
 =?utf-8?B?NWk5a1lTUEhycHpkNWJKZlI3NXA5ZHRkUUwrTVRsUENPcTJ2UXpQUkQ2anB3?=
 =?utf-8?B?aHhlWXRnQWROYTVHRjZNODZTTXJrZVREM1lWMlo4a0xadmlkUnUzYVJMQmtI?=
 =?utf-8?B?WFhZL2dRM1ppNmdmblBxd3V2Zk9mRTQ5a1FKM0tVbU5rcTlycWl2ZDlLd25N?=
 =?utf-8?B?anlKeENyNnhBbnZqeTJaUFBQeUdTc2hsQnFjZzJqbWJkcENHNGYwM0RDZDlY?=
 =?utf-8?B?R1ExcUVYNzZwRGdwVmdYU0t6UlRxZW9DcWZzQ0dKaExzS2F4TmtXQnVZa3VQ?=
 =?utf-8?B?bkpQSDlWaEM4ZkJFYkpvbzI2aXZaL2ZGdXhXc202V1I3MGtnK3gvbStrQytM?=
 =?utf-8?B?K0lVUVdjdGhBMEwvUURUZnc3c0lOd2ZIUUh2VXRuc1ZMY3NhYjVOeHorS00r?=
 =?utf-8?Q?lO+/lNv9mlOPMVRC5nhjdft5MRywXGW2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHNRMzcxMVJDc1NhS2F4Z1VVMGVRUkozUnFJZW9iUkFwdmdpbFlneG9JcDFt?=
 =?utf-8?B?Vmc0TEVuaU1qeHFFZTRXb3lzMU9oK3IwWWRWS3ZzanFPY3RkRE4vK0R1SUll?=
 =?utf-8?B?T2dEQTBFY1pISnpTc0F6SWphOGdvTFc1bU9zS3lrU01oTVMwN29nbWFwNDZk?=
 =?utf-8?B?NGZmWWVLblFsSGtEMHN6bGcvVExKcyt5STNxMjJ5cGhZYU9jTmpRVm80Qm5F?=
 =?utf-8?B?ZXdNRUhvV0NmT0hlZ2NaL0NyZ2szTHFVVk9tNG5rdm12bEN0eHVMdVk1ZEx3?=
 =?utf-8?B?a2NoWVNDZ0VXOGpVUWlCeXRiNzIzZzJQak5xRm9obGR4b0RxUTBxYTJLMllp?=
 =?utf-8?B?Z29IcXExQ2N0MFFIdU1SczdGVVk0R01BQ0t6VXBueFJZWkJsWDVDa2EzM0h1?=
 =?utf-8?B?LzNiblJBNWNaRWNaY0tJWlUvR09zRFh1ZGt6dHIwR0dkRGE4ZzhLdExqbGdP?=
 =?utf-8?B?cWRvYThPVVhnQ2R3QTJVbEZLN0QxZkNiNWhnSGU5bWIzMVJIRG51a25JNGtB?=
 =?utf-8?B?c1BnWmJFTEpuWExUdDhNMDB0TktGNzFGNzY0bUQ3ZTgrSkQ0UXhVVHN4QWhN?=
 =?utf-8?B?ajJzTzhxWFNjT1ZJZXlzeTlxVXRiV3crNnNDc2thS3EvK3d6eFEyRjZ3cU4z?=
 =?utf-8?B?bktDazlmR1FrR2pmdktHRnBPSThOcGJDYVZzYWlaOVdadkZoMUNOcHNDOFdD?=
 =?utf-8?B?S2RCQ3EzQzhwblc3aEFHaHFPbWdxeUgyZ0E1Mk9qUlJEQkNVUCtydnJtY0dl?=
 =?utf-8?B?UVIwdjV4U0FrSnV3K2VGQ25BSWg5N2gzczdBeVZJZTY0cTM0UWhjQ2k3L3Jl?=
 =?utf-8?B?SHEvMVVxMmVHTGxhcitLRjlwTmFrOUFUbVk4RFdTRGdZTUtFK2p2SEZrUGhr?=
 =?utf-8?B?SllVcVNqbEJvUzY5M25ObnprS20rTzZma3pPOUFVd1dObFI2UHc1WU8wMjVv?=
 =?utf-8?B?N0EyTDlIazBLa3ZOZDJiSFV6MndiWTY2dVlwenNwMlFRbnA2c0ZtY1M1R2d5?=
 =?utf-8?B?a0FjcU52bUNsSEZCTHBnRnRBV0FoRUMxRTRDcEpVWGg4VUZOUGc4TWRaZC8y?=
 =?utf-8?B?RXQ3bVluekp0SnBQSEpDc1A5TFpUUW5xTERaOFRFNU5DMnB5MCtSNENEcVFG?=
 =?utf-8?B?RVE5ZWMvZ3R6K3F3b3QrKy9KU1Zkc2dGbVVSaURMTWNmaGJPMmFXWUppNzBB?=
 =?utf-8?B?VGRITUQ2VGtNUTk1c1p1U3dHVmkzQ1RWdHhyS21jNDFleit4L1pma2FxQ29i?=
 =?utf-8?B?d2NyenpWdHpkU3dPVitBdlo1bTlNZlFBN1pCRmRuWElQdTRLMm9DVVI5ZU9O?=
 =?utf-8?B?TGdLZHZCNlhCR09RUFdsdUxVVHFUWXJpbEkraVJLVHNPSFNaOUdESEZzdUJS?=
 =?utf-8?B?alJXZmVSNUZhZ0VTTTlPY1ZteVBwM1pVT2pXY3Ywelg5ZEg1dDZGTFhlRTI1?=
 =?utf-8?B?WUFWK2x2K2J1bTJWM25JYnVpSDB1cVMxcnJoZzBYL3c3cW5DaC8rNFNtRjJJ?=
 =?utf-8?B?cEJNQlB2QXIyVGNWay9PSUgxajlvR0lSbEhub0V5SDNYalJGMjJIUlI4NHI2?=
 =?utf-8?B?TGpWSWV6ZTBMaWdrUWxieWtJRDZicjJKbklLQWNzOTVGS21Id29ET3ZaUWYr?=
 =?utf-8?B?MXJPVUFueHJ0NzRIVUxzU2pMWEhnL1phTkg3eWNmeStLQU9xaE9oaDVLT2NW?=
 =?utf-8?B?OEplbG5BdkxlN0VHR1pZeGloSHNWdlZ4ckFMZHh3VGhmNHA4d2ZqRWwrY2gy?=
 =?utf-8?B?ekl0Rmh2eWhyL0ovVFdvWUFvS3J1ZktlY1haUEU5TVN6Ui9MQWo3eDZPYzJu?=
 =?utf-8?B?aCtBbTZ3VW1OUU5lL1ZleCtFL1VsYTNta1k2VE1MSEJodFpEQUEzVm5GdVpr?=
 =?utf-8?B?T04zeFViVFk2Y1lvbGpKMU1keFFqWmJHcnJPaytWOW1iYTc5NGwvbUhIL21t?=
 =?utf-8?B?NGhERzhkdko1bXMyeEMrcVJudGVnSXZ6UjZwMlIvVmhkM2kyK3YyUkszZ1ph?=
 =?utf-8?B?M08zeTZpVXppNU1GTzRXM1lXdHF1V05zU2RZOXlicnk2c3dnV05vR09BQ3I0?=
 =?utf-8?B?UkhOR1J6Q2lPUjNwcTFUTWo2ZTNPaC9yZ0puR1EwNnlUZFpnQlNqRXlBUTdQ?=
 =?utf-8?Q?tkFFRsvJ7tn+SN4TyC+drZFR7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1025bf-b04b-4212-92a3-08de2911ff1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:24:00.8087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUcqiEIpjmMVkNsReVe5sM19QSf5vzjBnw4LztXeWAClzZxgPke1BDxjGiMQ/VCn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7173
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



On 11/21/25 16:12, Pierre-Eric Pelloux-Prayer wrote:
> 
> 
> Le 21/11/2025 à 16:08, Christian König a écrit :
>>
>>
>> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>>> It avoids duplicated code and allows to output a warning.
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++++---------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  6 ++++++
>>>   2 files changed, 10 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 54f7c81f287b..7167db54d722 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -3309,9 +3309,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>>>       if (r)
>>>           goto init_failed;
>>>   -    if (adev->mman.buffer_funcs_ring &&
>>> -        adev->mman.buffer_funcs_ring->sched.ready)
>>> -        amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>> +    amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>>         /* Don't init kfd if whole hive need to be reset during init */
>>>       if (adev->init_lvl->level != AMDGPU_INIT_LEVEL_MINIMAL_XGMI) {
>>> @@ -4191,8 +4189,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
>>>         r = amdgpu_device_ip_resume_phase2(adev);
>>>   -    if (adev->mman.buffer_funcs_ring->sched.ready)
>>> -        amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>> +    amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>>         if (r)
>>>           return r;
>>> @@ -5321,8 +5318,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
>>>       return 0;
>>>     unwind_evict:
>>> -    if (adev->mman.buffer_funcs_ring->sched.ready)
>>> -        amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>> +    amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>>       amdgpu_fence_driver_hw_init(adev);
>>>     unwind_userq:
>>> @@ -6050,8 +6046,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>>>                   if (r)
>>>                       goto out;
>>>   -                if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
>>> -                    amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>>> +                amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>>>                     r = amdgpu_device_ip_resume_phase3(tmp_adev);
>>>                   if (r)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 489880b2fb8e..9024dde0c5a7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -2233,6 +2233,12 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>>           adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
>>>           return reserved_windows;
>>>   +    if ((!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) &&
>>> +        enable) {
>>> +        dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
>>> +        return 0;
>>> +    }
>>> +
>>
>> Only check that when enabling the functions. Could be that when disabling them we have sched.ready set to false already.
> 
> The check already has a "&& enable" condition. Are you suggesting something different?

Ah, missed that. But you have an "if (enabled) {" right below it. So I suggest to just move the check in there.

Regards,
Christian.

> 
> PE
> 
> 
>>
>> Apart from that looks good to me.
>>
>> Regards,
>> Christian.
>>
>>>       if (enable) {
>>>           struct amdgpu_ring *ring;
>>>           struct drm_gpu_scheduler *sched;

