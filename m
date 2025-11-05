Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6102C34842
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AAF10E6CC;
	Wed,  5 Nov 2025 08:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ILzj+rNh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010029.outbound.protection.outlook.com [52.101.61.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE6E10E6CC;
 Wed,  5 Nov 2025 08:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFuA6uIq777r/vNawH9wuKpywKQJ9LRu4a6B1i4P+CNI7BbBebVstY24a3vOQxbpXO8I+vCm/jH/Y/OdJRLNtecpwYFwvdA/FpaiqKXjKWyMZrfirAvltydh0iaO/CZi93ek4xGe/G2W0Yk5f93Sk+6gNyEUYrrB8Z69CDmAJBAqEMpmAQhyyJTvaUN4WYDJZG08NIZ4Sb1TP/4IehncRtGmSsztisM9zEe6o2wXv6AVjWQeSBw4GkuIcKKL1KTo+0WWA4Bm0t979yR/YE6fdtbg8MudpzCjGUndC/zfJeXBa6YydMc4UY+wH5vxbOeiX3VG6ajaSwprHuuNouuz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsIbacMQuf9z7tPoFk2c86IusVho4ai/QA2mqKMskG8=;
 b=jyfH7hOByr5Oc7aqdp9XFNonwUxiYb1Q4fJETvmkS2jPCNQAwDXx2IUtciaUpRpDZF4vVRJan4UPZgIz9KB4xEZOxDk5cz3w9PWMRsAkiVxuaihnKK3L51icBe4bFBqZSbDr6zB6Ef+fbKF+zZ5O7y0bdFhx/hmRAaytnHcEgxKOnmfYfJ1AJ7gqe2M/sRCwhv5CoISEAMsH1yDTQXh8BNApPziIPShMTkQZ0g6gdxjYnc2OfTRtI4EFa/k0W8P/tmApoNpH+DLL7KIZb2rn738Q6visbvtjSPfXlugsHLx4oT+C72Bju5Dw76RFIvVic3cnVX/EA4RwV/P96F35Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsIbacMQuf9z7tPoFk2c86IusVho4ai/QA2mqKMskG8=;
 b=ILzj+rNh7cMvGSaDA/BqfRfWpyZlwHvix5SMc9EaYrrWQLWj6PTIUN/YOHmiKG0oy6Qo5CC4dSwE8NQxSoXIXoojEwwrfDGMzoGpgbBlAQdOcNTW/GNc0ioS61/IjFvf/9yDfL2PCI0rhrDFCbyN9A7jgZ023tL/mGXRsZ97t10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8164.namprd12.prod.outlook.com (2603:10b6:806:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 08:41:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 08:41:20 +0000
Message-ID: <ef0ca8d0-d2a1-4a31-a7da-41c32b40c233@amd.com>
Date: Wed, 5 Nov 2025 09:41:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/20] drm/amdgpu: introduce
 amdgpu_sdma_set_vm_pte_scheds
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-16-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251104083605.13677-16-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2d6f09-2c75-4d04-8da0-08de1c471804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjNyMGV0QWlMRFI3Z3AvSUJheDB0K2VTOTA5REt1OFROUXB6TDFpanAxYjdE?=
 =?utf-8?B?M3Q5QmlieEVxY3RINUZZZDRPRzRlaTF4RUFiOXpscVdEQkx0SmUralJmWjc5?=
 =?utf-8?B?TG5ueEpidDVOZ0VGS3l1OW5RT2hJV3pidzljUURObFFybTg0MWsyWWVTcEZZ?=
 =?utf-8?B?dnRMMy9qZmlldGVuTVlLWlhESUFxWjBEWTdUdERNVU1lM21QeHpvMTJZeVNT?=
 =?utf-8?B?aDAxcDNCaFZoSEt1aW5UUFhXK1hQVE5nQWRpUGdoalRXaXQ0b3JGOFpjNWhQ?=
 =?utf-8?B?Z2s4OGlaUVNaaFR3Ukp6NFcxNTB0bU9oVVdSR0VhZ2NtdWFWdmMyYmkydk9Z?=
 =?utf-8?B?eXN4d0VQM1F1ZVNFSVlMTDFXbFJ3R3VadDAxc2NtTU9GTGVhR0VvZzJaVUFh?=
 =?utf-8?B?czFDcmpHMzh4RXpoQ1o4SnZkNGZvaDdUQWRlaXk5eTJmNjMxN3pFQ2NKYzRF?=
 =?utf-8?B?ZTFTSEN1M3lmNXhSZVNjcWpKMXgydUVvdkdqZ3llWUE4Y21YK3VJOW9xQkU0?=
 =?utf-8?B?ODVkR1NicDJSVWlqam1CU1ZvaElrR0NOcVpMQkVMTVVFQjIyMFZCQXZsdnZu?=
 =?utf-8?B?cEIxQnBkWWgwV1g4YTlTdUdiSzVsYUdqcnBzUmlSbHEyeU1sV2d1ZElDYUgz?=
 =?utf-8?B?RFVWaDZGVS9sRTk5KytqV2VuS0ZRcFl2RHk1YUJQWVVLZDNHUHFqcm11U0Jj?=
 =?utf-8?B?VHQxQVVLYitDQ3FLeEN4MTlnR1llNWs5cThGMmxTRjZBMlZQVGNDbXVOR3pD?=
 =?utf-8?B?dkZPakMxT3pDODl5dVlLOTVaWTlrQVFITmthRll4bEUzQVl6ZmdobXNQdWcx?=
 =?utf-8?B?bUcwdG1pdzVhUDRkMngvOXJJRFozRkFSM3JXc040bHVLd2dCWFNKaXowcHhS?=
 =?utf-8?B?UlhJOFZpVVM5cjdNN1pKMHRzYnNPdnFObncrSk4vS3I0ZUEvaUpWN2U1NWFy?=
 =?utf-8?B?cmsxTUNIMmFUaThDZXovWDRBSFVrT3c3TGdpdFM2aG5zY2R3QmJYYzBFVER2?=
 =?utf-8?B?d3czZEFHYnY5UXBRRC9SSUhOS1EwSXRHeTdVZ1I1OEZRK015UW96b05VV3hH?=
 =?utf-8?B?SXBvMkJzaGUxVTFkNjJkQlFUd1VlVjgxbnRiejJRMXpNbFZpUGxoZnE0NGRF?=
 =?utf-8?B?cXJyemxxbGxiVWszcHZVV2Q3Qkd2RHBEci91UUZVdktxdHhpMHhTSHlmVUV4?=
 =?utf-8?B?YU1pTVQ1TVlIS1hMOVVrR2NRcTFIeS9iQUpDOW5DWDNSTld6MU5sNmZOcXo0?=
 =?utf-8?B?d2lVRDJNZFBLcU1VOXIxOVNvbDd6ZlZjTTg3NEIwYkxzdVp4QzhBdUxtMXky?=
 =?utf-8?B?SkVHR0VkcTFjU0tvSnd0SUtaR1pERDUrYmhlaktnTW54cHA1V0VTOVdFeGh0?=
 =?utf-8?B?alRnTHJNOWNPTWc3d2dIZjNGVnNLb24rbk5SV0w2bkZSZWMwckRMbW12Qk03?=
 =?utf-8?B?STU4QWE4UXNWOWtkdktSNFVPcnV4dUdxcnliU2RrdzVUVkg1S0oyNFhaMTBI?=
 =?utf-8?B?ODR0OTNYNHI0OHo3RVMrY1lNcXdvc3FsOEkxMTQ3Wi9rZEVhYnJVbi9aNXUz?=
 =?utf-8?B?UHc0c2tOdmtvaDIxSFBaQnE4Y0dNWGt0anRtbkJYaDY2eFo3eUVYanBsRzl0?=
 =?utf-8?B?Q1RtVmRFdWZnZkZDVE00QXhNV1ptYWxSZFRWeUlYNGFtVUlqYWxnbkcwVEJD?=
 =?utf-8?B?ZmtDc25CUW44T1l1eFBhVGYyWW1SdWxNVk11bFFVU1UrV2prSXBVWFlETFU3?=
 =?utf-8?B?ZU5VcUhOOTZBVnRnOEF1SUsyL1JkMW1pSXFLdldiTUM2VVZOazlyWmFJN3M1?=
 =?utf-8?B?ZDdvZnpCQnY1RmhER3VZM214TEUzeDluazhETHJCK0RTR3dFeFNJQ3hRQnJw?=
 =?utf-8?B?WlJXa3hUdVRuVm0xN0FWeFFwQVZRVG5pbEhTU1J6ZlZSUmxlOGRCRDlOcGxh?=
 =?utf-8?Q?WTKzrxYjPHwH++QpHt+IBYIfg5Prnr+v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUtJU2IyUGpsMW5uME5ieDdXUTZmeS9NYzhiTlJzbXY4dG9oNmhWV3JkZ3dz?=
 =?utf-8?B?RnpDMGdtYzlpazJwZUZLN1ErS0FNRTM5V3ZUZ0xWczBCQjVQV3pnL0tvWFl0?=
 =?utf-8?B?SWNDNUM3d0RxUXdOblkxL3dJYUprUXlGakdmVDZqb1lXSDU3S1gzTUxkQmZ2?=
 =?utf-8?B?RFhUTW9Yek1MQ0Z6OWJ0VEJqcjRpc0dMSVM5a2tUMms1SWNVbThHbEliTGx6?=
 =?utf-8?B?Mm8rK2tBWHdDZUN5MDN2VVBJU2RzdFd3MU9iNy9nUytRUFYwMk9RSzN1eEJM?=
 =?utf-8?B?NzkrVTV1SkYxbFUwNXhhNzgyenMydHlUM1lVOWI0ZVVGWElGTXhMaWJTUE5v?=
 =?utf-8?B?RU1IbW4vQlJ4aDNPcFQ1NDFoUktPcW5adjRwa1lwTktXSEh3L2pUTUZWdFY5?=
 =?utf-8?B?OU5UUmVUbkVTRzd3NFFjU0FBdGRHNW1jZTZsME9TZzR1Y0ViazNvdTZ0bjZx?=
 =?utf-8?B?WUFxdzRuYzFDN3pHMTZMdVBLK2Rkanp3eFgyV25QZEQrcWYzSkFwQzN3cStl?=
 =?utf-8?B?M0wvMU55WXVYZk9FeEZqS1luZS95VVZ4RXk4RGgrLzlMbXBydkZnNXp5Q1gx?=
 =?utf-8?B?WURnWkdSWXFWTjFYSXFvL3p4aVF2L3A0MkNQTFJDQnp3WnNyUTVIYWltczg0?=
 =?utf-8?B?c0xmdjVyaEJ5ZC8xcEtYRTlocmx4aXAzbzhDV0JFdmkrSmJGWlpuVHk2UDFN?=
 =?utf-8?B?cWRYWUI2TVhBREkyRWs2b3A2MllpRTdCSEJCc0FwU1lvMENQWUVnWDRGYlQ5?=
 =?utf-8?B?Z29pa2dFY2QyZkk1elJkT1JlUldVUmtSVm9obTdKVnRYbGlDZFRzZ3E4MFFy?=
 =?utf-8?B?VzYvUlFwVHdQSzJJcWdVTzNla3d6d2E3MGJPdjVRZE1TVlUwS1BYcUFleEFv?=
 =?utf-8?B?eFZUb2hveURERldycUdybWxvS25sYWlQd29QTjRjemlMYUloRmtnTjZ1eFp6?=
 =?utf-8?B?QW1qMWN5TTRXbGV0K214SGFpOURGU1dQSVk3enVvL29HanFaL3FDYnpTbGhS?=
 =?utf-8?B?MnR1RU5zUFJqRHNFeWdWMmFNaCs4MjV0MTg5ZDkyeUtPNHlObCtuTlFPVUxX?=
 =?utf-8?B?ZDZhT0ZKVFMyYVArbnpwdFQwRkxyUkovRDdaQTUzNG1idVdXWDQ3bkxDVWtu?=
 =?utf-8?B?eU5SK3ViNElqNWN3amNpMFlIdlRHbklTRk01SW1EanZpVUszSS9oa0tpTVRo?=
 =?utf-8?B?VGoyNGNVdTBtaWR6M0ZxTXpnc2Zac0dTQldyalNFaGFlekd0NmRsbWF6cXhw?=
 =?utf-8?B?dFVFUXluTVl6SWlSQkpHYlY2ODhKb3hsdVFtUU5TWUJrQ1g4bUxKNWlWYnRE?=
 =?utf-8?B?WmJjbFhyUlZ2TkJpWGErZHZIaXFKQlovQXNQZXMyQ2c3SEVrLzE5WmY3KzU1?=
 =?utf-8?B?ZzZXaEVHTHJpcHZ5bXc1cXhmZlJLcXFiM2dxcW84emxlOTEzcktCUE9GZmgw?=
 =?utf-8?B?cU1HNWYrSUxYRlgzbFBvbjJzaUY2ZkUwMzZPU3c3cFB3b3JFdWIyVmVnU0Vj?=
 =?utf-8?B?ZVBuKytseHdDc3FGRm9JZGxFY3plQ0Y4NUEwTW9IMWVCNTZGUzZ4d1BXYkJW?=
 =?utf-8?B?R2NnelJoczZoZXQ0L0Z2cmlRWjc3ME9LVUZ3OGp2RVBrM2lYZHFpVDV0UG91?=
 =?utf-8?B?alBxUTVwamQvK1M0WVY3MWtNZlppU24xeGo1Z09yRFEzcWwwVTRXTy9WRHFO?=
 =?utf-8?B?UkNMVXowMVROUG1QQmxmWlQrYWRaTDlRZG51WTE5Sk44UzhRb0JFMk8zUGpo?=
 =?utf-8?B?VkpkcFRRMERxbk1NTHh2L2p6NG1pWTNzbUFYYzZmSFRGNFovaWFTclJWcHhX?=
 =?utf-8?B?N1lGQitQMGlXQ2FrQ1B5WndJL2ZmdURXT3ZMaEwyZnFyYWkvZlNOUCtuSFl3?=
 =?utf-8?B?eWpYSWJGeGsrQWFzVXRkTStPQkRXbk0zbDJMamxBelhRUmJoWWZMSmJQTUpK?=
 =?utf-8?B?WU9YOFZNWVM5M0wyUjBBeDBxeEptU1RRMTQvckxzQkRibzNNTXVIZ1NnditF?=
 =?utf-8?B?TFZyOWlCK3l2YjBRTkdJclBnWnNsRUxETUZHbWY5eXpoYVFPTTJwSHE0SU9T?=
 =?utf-8?B?NjJjRDllNm9Kb21LS0NMd0VEQTFQOVhuK0ZCb2d4Mk1mOFFPSVl4bzhQamF3?=
 =?utf-8?Q?0QoayDEcQvC3kjySC1K0XKG8f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2d6f09-2c75-4d04-8da0-08de1c471804
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:41:20.7776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXje7/8GPSWqlgzXzLCco9h70ZMVSMg3XmQ+WqefjMUKWZ4qtEhBMrZ/+wIm+6US
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164
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

On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
> All sdma versions used the same logic, so add a helper and move the
> common code to a single place.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   | 15 +++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c    |  8 +-------
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   |  8 +-------
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   |  8 +-------
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 12 +-----------
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 12 +-----------
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   |  8 +-------
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   |  8 +-------
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   |  8 +-------
>  drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   |  8 +-------
>  drivers/gpu/drm/amd/amdgpu/si_dma.c      |  8 +-------
>  12 files changed, 26 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index a9dc13659899..dead938a59a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1614,6 +1614,7 @@ bool amdgpu_device_has_display_hardware(struct amdgpu_device *adev);
>  ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
>  ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
>  void amdgpu_sdma_set_buffer_funcs_rings(struct amdgpu_device *adev);
> +void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev);
>  
>  /* atpx handler */
>  #if defined(CONFIG_VGA_SWITCHEROO)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index bc11e212f08c..b66e41e979ad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -3210,3 +3210,18 @@ void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
>  		task_info->process_name, task_info->tgid,
>  		task_info->task.comm, task_info->task.pid);
>  }
> +
> +void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev)

Please also add the vm_pte_funcs as parameters since those should always be set at the same time as the scheduler instances.

Apart from that looks good to me.

Regards,
Christian.

> +{
> +	struct drm_gpu_scheduler *sched;
> +	int i;
> +
> +	for (i = 0; i < adev->sdma.num_instances; i++) {
> +		if (adev->sdma.has_page_queue)
> +			sched = &adev->sdma.instance[i].page.sched;
> +		else
> +			sched = &adev->sdma.instance[i].ring.sched;
> +		adev->vm_manager.vm_pte_scheds[i] = sched;
> +	}
> +	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> index 25040997c367..f2515de65597 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> @@ -1347,14 +1347,8 @@ static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
>  
>  static void cik_sdma_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
>  	adev->vm_manager.vm_pte_funcs = &cik_sdma_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev);
>  }
>  
>  const struct amdgpu_ip_block_version cik_sdma_ip_block =
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> index 149356c9346a..4b2c7f75eadb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> @@ -1242,14 +1242,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
>  
>  static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
>  	adev->vm_manager.vm_pte_funcs = &sdma_v2_4_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> index 6b538b6bd18f..fe0c855a803a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> @@ -1684,14 +1684,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
>  
>  static void sdma_v3_0_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
>  	adev->vm_manager.vm_pte_funcs = &sdma_v3_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			 &adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v3_0_ip_block =
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index 60a97d1a82f2..405ccdfbafad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2622,18 +2622,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
>  
>  static void sdma_v4_0_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	struct drm_gpu_scheduler *sched;
> -	unsigned i;
> -
>  	adev->vm_manager.vm_pte_funcs = &sdma_v4_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (adev->sdma.has_page_queue)
> -			sched = &adev->sdma.instance[i].page.sched;
> -		else
> -			sched = &adev->sdma.instance[i].ring.sched;
> -		adev->vm_manager.vm_pte_scheds[i] = sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev);
>  }
>  
>  static void sdma_v4_0_get_ras_error_count(uint32_t value,
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> index d265157bc4e1..1b2868b16859 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -2323,18 +2323,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
>  
>  static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	struct drm_gpu_scheduler *sched;
> -	unsigned i;
> -
>  	adev->vm_manager.vm_pte_funcs = &sdma_v4_4_2_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (adev->sdma.has_page_queue)
> -			sched = &adev->sdma.instance[i].page.sched;
> -		else
> -			sched = &adev->sdma.instance[i].ring.sched;
> -		adev->vm_manager.vm_pte_scheds[i] = sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index 127f001ebb5a..af920e100400 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -2081,15 +2081,9 @@ static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
>  
>  static void sdma_v5_0_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
>  	if (adev->vm_manager.vm_pte_funcs == NULL) {
>  		adev->vm_manager.vm_pte_funcs = &sdma_v5_0_vm_pte_funcs;
> -		for (i = 0; i < adev->sdma.num_instances; i++) {
> -			adev->vm_manager.vm_pte_scheds[i] =
> -				&adev->sdma.instance[i].ring.sched;
> -		}
> -		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +		amdgpu_sdma_set_vm_pte_scheds(adev);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 78654ac3047d..29f597d56bcb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -2091,15 +2091,9 @@ static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
>  
>  static void sdma_v5_2_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
>  	if (adev->vm_manager.vm_pte_funcs == NULL) {
>  		adev->vm_manager.vm_pte_funcs = &sdma_v5_2_vm_pte_funcs;
> -		for (i = 0; i < adev->sdma.num_instances; i++) {
> -			adev->vm_manager.vm_pte_scheds[i] =
> -				&adev->sdma.instance[i].ring.sched;
> -		}
> -		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +		amdgpu_sdma_set_vm_pte_scheds(adev);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> index d1a7eb6e7ce2..03365db70d9c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -1897,14 +1897,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
>  
>  static void sdma_v6_0_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
>  	adev->vm_manager.vm_pte_funcs = &sdma_v6_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v6_0_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> index 9f15aa1df636..90d291c304d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> @@ -1839,14 +1839,8 @@ static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
>  
>  static void sdma_v7_0_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
>  	adev->vm_manager.vm_pte_funcs = &sdma_v7_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev);
>  }
>  
>  const struct amdgpu_ip_block_version sdma_v7_0_ip_block = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> index 621c6c17e6dd..4422aaeb99e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> @@ -840,14 +840,8 @@ static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
>  
>  static void si_dma_set_vm_pte_funcs(struct amdgpu_device *adev)
>  {
> -	unsigned i;
> -
>  	adev->vm_manager.vm_pte_funcs = &si_dma_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	amdgpu_sdma_set_vm_pte_scheds(adev);
>  }
>  
>  const struct amdgpu_ip_block_version si_dma_ip_block =

