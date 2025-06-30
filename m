Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D5AEDC94
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 14:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F18910E22D;
	Mon, 30 Jun 2025 12:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WQLFB8ei";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2068.outbound.protection.outlook.com [40.107.212.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B6510E22D;
 Mon, 30 Jun 2025 12:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXKVtD7+UyLQiDpEwBVMMxKXirX93H+6B0ork1/ZjdbeBj+DPmlrDtD4dB34Ndm1vCAeZLTu6DFSHH9gvAJTFQr7iH5SD8xuOhs1yzISxhXCHjkJJSQvoJZqLzgdo2GjmG6Hfmq9lvSKhJpOGfG2kUV9OgwmiCJiVqfEUTCK+oZJ4bauVOM9kd64cU3xG7YZE/CxGCETXwJr44gimOb0r7DtTgKmRwiHVTNhLPnS4hBp8VfQUq6AiGRyCU/CKj3N52Q7kLQO74s5iiwRE/JhlKwSThu4CXmrRgWvR0/tkXhiTnKMwmT9h2PuHzwNebrkkB56SFdncW4dVly/nlTHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfbTfZON5SSAqhVh+XHV7/zeON2Wdv0Ve4SaW1BlMv0=;
 b=qTdifsubqwP0qFCU9IS52Z3EERVng9V1Z/UQl9lfm+b2SUnQN7V+7+PeSf6LOTucERXk1UTT8Ngn/N/8Vbckawt6z6xcvykprZylXrcnuuS/HpZwdr7weIIldBc8qGbv9gAuVCe77WRQIqz3qOZ7JpoOaqJlR1lwZ1eDHyKnOKg0fkjzXZB9fGBhHkTt6GhjWJ58fDSJCzKb+W+XDmx3bhTW7OkVQSPydhHuhGSWKajgNNo8MrJyAfn8W/xtFyM746nt9qKoOpkGk21GWj2cdU32qbYXyAOdwgq2bbov9m3ABmNIr+o5yb+4qkY5z/bolCb70TZ6kRC4DmZdVO8h5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfbTfZON5SSAqhVh+XHV7/zeON2Wdv0Ve4SaW1BlMv0=;
 b=WQLFB8eiVwm4sA0P0eUm8B31Mt3I1mPHGWtgMi2JzVD/uxl0+AhZUJ+I8O+WZDxMs9lBSLtKYdA+9l5cBaxa80QpPVXxBub8ELK/RwUktxaRyE2n71KIqx5cWnnvto9bwvXOHMgXyCZLsFRb6OJaYPDlRnW7ulLI8jqUJNsNTuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6527.namprd12.prod.outlook.com (2603:10b6:930:30::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 12:19:53 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 12:19:53 +0000
Message-ID: <ed4d1af8-652a-47fa-af35-95ce907e50aa@amd.com>
Date: Mon, 30 Jun 2025 14:19:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm/amdgpu: add debugfs support for VM pagetable
 per client
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250627094921.911009-1-sunil.khatri@amd.com>
 <20250627094921.911009-4-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250627094921.911009-4-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a985b75-05b9-417c-0015-08ddb7d06af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkRscXpYazB6dllTVHB6NlVpL3Q1YXNLbnZ2VHJFSFI4NkYxMERYbThGVE1h?=
 =?utf-8?B?ck1obmFVNXRWYVBtTmpNTHJpb2ZsVS91cnVOamhaNE5laHhYVllDL1VRb1hh?=
 =?utf-8?B?NFhoMmc4bEN6N1RRRlVNSTN5c2tqZWxXRjNwQ28xekh4bHkvR28zRkc0QnRI?=
 =?utf-8?B?MU15Z1U0dmxObjdYZUdTcWg0dFRkNzh4RzdYOFJNbDN2bHNVdWtaOTlXdmVW?=
 =?utf-8?B?U1NXcy9QSmh3M05JdzlRelhUVmpvQ0tEdEt3RGNYaksvbXZnL0htSjM4dU9P?=
 =?utf-8?B?L1dZeVJEbTRpT3hBTlpySnNOdU5FUlRoRm9wZ1lsNVRtRHVsWThwQmxhSnBn?=
 =?utf-8?B?bnZSYkV3SUU3dHU5YzdPbmRFbFltekhGTE5qRW5Jb3hiMDFjV2hnSWNzS0Ev?=
 =?utf-8?B?a1hHb1AzeGRicGN4OENGY1ZXZ0NXNEpSdVRNaFhLRUJLK0Y3Q3lsR3FHcTR5?=
 =?utf-8?B?RTg3eXB2eDdTbHU0TXByVHhuS3RYSzNjb3ZWekVvM2k1Ky9XRk45d2NSMFhR?=
 =?utf-8?B?Ty9NT3Y0Mk13TUtlOUdYbzBRNUg3ZytRLzgzUTFacVlJdmsxeW0vMXFNQjVX?=
 =?utf-8?B?bWExUWVMdElUeTgwOU5ObXhRRUVEb05tV0tqanRoM01BTE1uZTk3Q1FGWjln?=
 =?utf-8?B?ZmcvRzUzVkhjK1FxMmxNMVNqZjdaOGErWnIvL0NibDhjV1RiOUFDSG1kdHNR?=
 =?utf-8?B?TmRMVThJMUVkTHZJOHZKZ2hjMVl2dEpvejdoN2M4RHQyWkJvaElLckFiSXJ3?=
 =?utf-8?B?dDQ3dEIxWEgwSUNyYnpLU0NsOUVRbmlvaDkrVVZzQkdjbmcxOGI0NlNkczNl?=
 =?utf-8?B?RmxnN2NSdjJRRlBTL0hxZWFrWFY3M3NRYUhpUzNjOXc5cFdUU2grenpUd3Vo?=
 =?utf-8?B?b25KeE8rQW5tZmhMcDlFRTRnQWNnSE4vWnZWK1M1UEkyK1VPMUVxbkZ2NFpW?=
 =?utf-8?B?bzdrMW53cytpa1E1ZnpvNENZL28vbktHWVV1aHc5b3psc3FKbUZtZmczMHQ5?=
 =?utf-8?B?blNzOGR4NjZacmxBQXBmMW10SG10R1U2cXN1L25LVElLaUlZTzQ2R1pJMFNn?=
 =?utf-8?B?WS9wWVpCQlI0cGYyNDkzc2wwMWF6Vkt5S2pFRTZxY2V5MDNHQW8zNFJBVllm?=
 =?utf-8?B?OFhPMzZZVVBFTmtWQzRDeXhXWG1TRWlCeGlKTFp6eWFSYTVWbXhuellDNndJ?=
 =?utf-8?B?SCtSWE11K1VUQUlvc3cxYmdxZnJEbHljVnV5eFdpd2I2S0xoOGNWMGVKOS9x?=
 =?utf-8?B?aVoxWS94YU81VVdVV2JrOFZrZnlvc2tubWJPSkNINEJYMjFNa0NNbWJHWjUv?=
 =?utf-8?B?dE4wd29tUC92bEt3RHpoRGZQUmh6RkhOcXlEZEoxaUhNY25GdmlmSmNnbDVi?=
 =?utf-8?B?VEZOSWlhVG4rd0FYb2pRVHQ0Q2xyVkUwNGhheWM2TEh5UmladWk5eW45enlX?=
 =?utf-8?B?dHMxQW9ULytaY1NiZ2VOQnlmdnVOSEhyanhiMW0zdE1PUlcvQ2tpZEVCOEpl?=
 =?utf-8?B?czBpd1MySWJHeHdIUEM4WjcycW1iRkRWdERUc3ZuQzBGYXV1YjZ3ak94bXFG?=
 =?utf-8?B?dW1YUmlCUjNVTEJmRTVOMXNNTTVyY2x3Tnc3cGZDSlAzSG1rcUswbDFiSC9I?=
 =?utf-8?B?ejdmUnlUeERIYnhlNUdQTGxvYUxYMTRLZENYUHNGaHJoeVN0bjFvTDNHdTBi?=
 =?utf-8?B?MVBFaHdYYm5leHhxY3k1SzNweHBTQWRmeVBzNmFnWXNNbE11YWdxQ0NvVE02?=
 =?utf-8?B?ZDROMFo0aFVZWEVLL3BSY0oyL05XVmNmNGJrMW9YeG5XSUw5dXlKTktXNUVS?=
 =?utf-8?B?dVVZSVVrUUFKU2VPS0dnUlBtZk1TMEpyWXNUclo5bFhhWW03OTJpR3ByaU1k?=
 =?utf-8?B?R2xMOXBHWEZRV2ZFWnJNVFJhVU1vWmVsb1lGQXdJc2pCZGZFRklDYnQvUkZC?=
 =?utf-8?Q?z4PelmE4pVQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDRmQlBlNFpWNVErSmhiUUdrQnUrV0RwU0JyTkVLRGRxc2dicmNjN3RjemZX?=
 =?utf-8?B?TWVCK3Z2K0cxczN2T0ZxY25BK0N4REJ1bURIdDRNR2xkWjhsQW5rdzhoVmJh?=
 =?utf-8?B?aUlPK2t5bjQ1NEE5VU9VVzFCTGZkNEw5ZlAzNlZ3MmI2WFVwYjBiaXZ6TjdB?=
 =?utf-8?B?dUNpOFNVenZhL1VIZCt1T0ZCd3ZWUDhmODFmQW5GWW1SZlJBZkNsdUgxa2FF?=
 =?utf-8?B?S3VUeUdLclJPNUVZaTlIbGRZbm1TSmNLWWMvZEhOR0J6bWsrQkZ4OVhKUGh3?=
 =?utf-8?B?djF3Y25vWU1qUDNnSXZ6UEJYMEJ1OEs5NjA5OG8yQnU5ZVR0R2VBZm9wcmh5?=
 =?utf-8?B?ektFdnVEbUhvWUE2YWZHVXYzWEFxbHlFZWw1K3BLRG5obm0xTDQvN2pueVk4?=
 =?utf-8?B?aHhuQWhFbExmaGFuLzBMd1R4Z0VCTTNHTGI4aUsrV01Ybk9qamt4b05FN1k2?=
 =?utf-8?B?Q2hMVC9aYTVScTNmV0o3UnBGamthMis3N3I1SmNFSHp5YTl0SVZkOC9td3pt?=
 =?utf-8?B?U0ROZEFQWG45UFFuNUJERWxUTzY1bi95clQwY2VDMUN4ZzFScExQL054djlO?=
 =?utf-8?B?SnJsQ2crS0Z2cnhSODVMb3BJVUlraXZtUTNRYU4rM3F0a0c1a29LWE40eTV6?=
 =?utf-8?B?T0wxSTd2UlpkeE1Xc3dKWUN4SHRxSmNrbVpvYmZLeGlhaklac0ZLSlBzY0ZN?=
 =?utf-8?B?dVlqbmNnQWVxWm5NenJxUFdBdWV4UGpFbDloTjhKVVRHL3ZWODc2RVZLVWVo?=
 =?utf-8?B?a2RCMzFPYVFhQ1Bqd2xOZEVmeVpvalZ2Ry95M05qaENpWnRicEt6WFhTTXNI?=
 =?utf-8?B?MlQzak1VeDhBL3RHZVFmbGEvTDZRcGpoNEJIM1VYdzNxdE9kSDFibTh1Uk02?=
 =?utf-8?B?K0FYQ0RObDVwRTNtdnJsOU5uY3BpRUUzb0JqRDFPbmhQZlFVUDg2U0JDeFhL?=
 =?utf-8?B?UU1SUWJrNXJScG5xTjMzcnBMK1Ridkk2TTRPd25WYmRVVDI3akFGVDlDMnlt?=
 =?utf-8?B?RmhPYnZ4S1VQcnZKTm1oMm85TCtMT0RSQWRRZllxWWYyczhTMjkyQmEwT2d3?=
 =?utf-8?B?NU1QQmhNaVgvSTlXSFROZXFGV1VDc1RWcUYxK3VBcktoeVAva3lvZ0ZGTlQy?=
 =?utf-8?B?VXdJSkQvczRhaVc0dXlCcXJzUzkyRWczdEY2djZQTk5UajVuR3JPZ3kyb29p?=
 =?utf-8?B?bE12RUdBcUg5Uk9TYzNURmxKa1E3UzRybDZLT1lVVEMzb21jeFBlUEVkZUI1?=
 =?utf-8?B?Y25CY2tZZFFDTS92QXE0OHBiZ0pGdDdOd08raTJQRW96V1FQenR6ZFNkYkRK?=
 =?utf-8?B?UkEvWGlUKzlFQ1dQWktCTFJpMlplL3NzM1Vlc0QydWRGQWI5WmkxS0ZWc3l5?=
 =?utf-8?B?dFJPQ0JteGZBempiNWo5RTJnUG5Jb1p1MWFPTmhad3BqaFNPQW82MW1MOExH?=
 =?utf-8?B?Ukt4eFFaVnhLd0NQMFNTR0gwOE52a0RwUml2Y0h2SmNJbHo5dlpWZDMyM1pH?=
 =?utf-8?B?bVZxbnRpMlFoNE9JeUpHQncwNStqamlWM2s2QU5JVnhrVk5rcHR1aHMzNWFS?=
 =?utf-8?B?WW9ydDJkWThhZGM4eU01c3l3RXZPdS9mZGdvQ216VWVRVDhJZ1JaZFNnZkM5?=
 =?utf-8?B?MjlYY3ZGKzdiTEhDMG55eFRUU1VNSkVLVDd4cXlCNWJBRUdGdWJtQ0xic05q?=
 =?utf-8?B?V2szUVhnNkZQbklyWkhXQ0tXNlFJRlZEaThWd2ZQaG5PNW5wZ2NoSDRzREVy?=
 =?utf-8?B?aWFvVWNkcnBsU1lUdUJvTGFaaXBwMHBRaDJHR1FLdkRPNVBNWC9wd3o1T3Yz?=
 =?utf-8?B?RnZqcGUrODBmOVdpSHhCMk9pMFVYK0pVNkE3NGRSeUNJL1RBU0RvOVNmNDFW?=
 =?utf-8?B?MGYrelZsVloyN3J3VTNyWkFyZUY3ZVh1VmRGbDZqVUxQbDdzL0lPRXg4ekdF?=
 =?utf-8?B?OUM0Q1YzWVF6U0t5WGJraGRKbUsvOHpPUUx5QkRhQVp0cVEwT3doNUFkOVUv?=
 =?utf-8?B?VVNsWGg1OVZQdVdxdGhxdE1sRnRCb3VUUGRDZWV5K1FURGluL2NUNm5Ec3lq?=
 =?utf-8?B?ZnkvYithZENWeUNwYVJWWE9wbmdSYjFKODdpdFlzUlFTUTgrbWJ3QnFZU0Vi?=
 =?utf-8?Q?4zv8pteTnZfJEhj6xzxZqCrnV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a985b75-05b9-417c-0015-08ddb7d06af1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 12:19:53.4519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/V8fngKy3TDL7CV1rDj3+D7VH0truROIglZQBzOOlfDQdGrf/HXj2lqcEHyWPpU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6527
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



On 27.06.25 11:49, Sunil Khatri wrote:
> Add a debugfs file under the client directory which shares
> the root page table base address of the VM.
> 
> This address could be used to dump the pagetable for debug
> memory issues.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 50 ++++++++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 +-
>  3 files changed, 53 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 195ed81d39ff..27aa1b551dbf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1395,7 +1395,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
>  	if (r)
>  		goto error_pasid;
>  
> -	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id);
> +	r = amdgpu_vm_init(adev, &fpriv->vm, fpriv->xcp_id, file_priv);
>  	if (r)
>  		goto error_pasid;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 3911c78f8282..93843c9bc9ed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2520,12 +2520,58 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>  	get_task_comm(vm->task_info->process_name, current->group_leader);
>  }
>  
> +#if defined(CONFIG_DEBUG_FS)
> +static int amdgpu_pt_info_read(struct seq_file *m, void *unused)
> +{
> +	struct drm_file *file;
> +	struct amdgpu_fpriv *fpriv;
> +	struct amdgpu_bo *root_bo;
> +	int r;
> +
> +	file = m->private;
> +	if (!file)
> +		return -EINVAL;
> +
> +	fpriv = file->driver_priv;
> +	if (!fpriv && !fpriv->vm.root.bo)
> +		return -ENODEV;
> +

> +	root_bo = amdgpu_bo_ref(fpriv->vm.root.bo);
> +	r = amdgpu_bo_reserve(root_bo, true);
> +	if (r) {
> +		amdgpu_bo_unref(&root_bo);
> +		return -EINVAL;
> +	}
> +
> +	seq_printf(m, "gpu_address: 0x%llx\n", amdgpu_bo_gpu_offset(fpriv->vm.root.bo));
> +
> +	amdgpu_bo_unreserve(root_bo);
> +	amdgpu_bo_unref(&root_bo);

This chunk here as helper in amdgpu_vm.c, move the rest of the code into amdgpu_debugfs.c.

> +
> +	return 0;
> +}
> +
> +static int amdgpu_pt_info_open(struct inode *inode, struct file *file)
> +{
> +	return single_open(file, amdgpu_pt_info_read, inode->i_private);
> +}
> +
> +static const struct file_operations amdgpu_pt_info_fops = {
> +	.owner = THIS_MODULE,
> +	.open = amdgpu_pt_info_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = single_release,
> +};
> +#endif
> +
>  /**
>   * amdgpu_vm_init - initialize a vm instance
>   *
>   * @adev: amdgpu_device pointer
>   * @vm: requested vm
>   * @xcp_id: GPU partition selection id
> + * @file: drm_file
>   *
>   * Init @vm fields.
>   *
> @@ -2533,7 +2579,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   * 0 for success, error for failure.
>   */
>  int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
> -		   int32_t xcp_id)
> +		   int32_t xcp_id, struct drm_file *file)
>  {
>  	struct amdgpu_bo *root_bo;
>  	struct amdgpu_bo_vm *root;
> @@ -2609,6 +2655,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	if (r)
>  		DRM_DEBUG("Failed to create task info for VM\n");
>  
> +	debugfs_create_file("vm_pagetable_info", 0444, file->debugfs_client, file,
> +			    &amdgpu_pt_info_fops);

Put that into amdgpu_debugfs.c instead of amdgpu_vm.c.

Apart from that looks good to me,
Christian.

>  	amdgpu_bo_unreserve(vm->root.bo);
>  	amdgpu_bo_unref(&root_bo);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index f3ad687125ad..555afaf867c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -487,7 +487,9 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  			u32 pasid);
>  
>  long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout);
> -int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id);
> +int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id,
> +		   struct drm_file *file);
> +
>  int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>  void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
>  int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,

