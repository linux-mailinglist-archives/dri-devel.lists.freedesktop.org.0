Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A7BEBEA3
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 00:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D9E310E1C2;
	Fri, 17 Oct 2025 22:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="piMEMgXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B3510E1BD;
 Fri, 17 Oct 2025 22:22:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgS2v9NTv0RGaxmCMlmxT4VV5oqCjnk4yRvpwlUs++CGEdfmibY9PQdZyYB3Lu/tukBILl33A7RlMunWa0NzzJgj63W3honYHn1Im5frN3sbwC7k6LbNgkkia7LC4cmGM8pi4HU4DPnQaX2qHGfUHPp2aza5hqb/MKAjphxV58k1VlV99Cfsv/sZJg4lQ8yPyknYq8yTmdcq4Q0rcdzfyxm9Zf/rHZAyxgBzbNR4VhoEaV5W8MqMKN8/AkvI6Qaye91i5NblS+w7drONPUudmwLl8bNaaXHoOJBU0w+7k4cD1Mc1+Sw/tsA3amzGOjfWNbTyOYEohFh75NcIb6X4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndrLVsezrjPmYMZTukHJxQGhxQcXnmJCLXEr98y71rI=;
 b=cR0nmlvl2qHFTAhjbe5Af4Fvvqci+Dh+y6LIEuXugdGFu9vOj2aAioVPlV2R+BLtsHVrTsWj+/3l3mbYoF19mjD+XKNguUwgU1sHI4LHQjwKRjxAD45CyeUNfog5pqtQjEn87Eochu0lg4e/JzUGk2KQviv7DW45Q5tMKQsif4+QO1pygs1xJPwoGTkT8F83ysPsPwESzyY0rbzzdEiywZd/GCQd4cMFp1Baeujt8GpOD1e7mmRpUD0Ov+e8URboha2Qagp8SMMPan4U0X8zluIsA07kO6Dw40SHv5p/rb0CEOKmIQp24mlp7zy+m9mwsc5DYEWULGJzQof5yH7hXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndrLVsezrjPmYMZTukHJxQGhxQcXnmJCLXEr98y71rI=;
 b=piMEMgXAfdn7xblDRdvsV20P7MA/vqXfLIs4VVj96cfxdGi5put7QgSeOMtGaOHN/QOmDVasf8MGQr28h6sfLSUYKFKUwJsIzX9D//SiTQHM8a8pndqWKSuI9w89WJ/FiuNNzadQ3eXuwqwaetv2Hry5Xx/jmLpkthTFyggPum0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ2PR12MB7821.namprd12.prod.outlook.com (2603:10b6:a03:4d2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 22:22:56 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9228.005; Fri, 17 Oct 2025
 22:22:55 +0000
Message-ID: <13862fb3-548c-44c1-9744-6b74dcff6ccd@amd.com>
Date: Fri, 17 Oct 2025 18:22:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] drm/amdgpu: independence for the amdkfd_fence!
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <20251013143502.1655-15-christian.koenig@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20251013143502.1655-15-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::37) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ2PR12MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 95cca80e-1b73-4034-6358-08de0dcbb86f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2VzTWxVQlFPY1B6cmFWS0Z1a0hPeVVzZ2E5R2JpTGJqclV2MXRxcndrQWp0?=
 =?utf-8?B?bGwwNzZmN1A0ZWRnb2dxTFBJN0swTmx0MGxnSWtDWjFJdm9UM3duM0F1UzR5?=
 =?utf-8?B?NVcxNFlZRXEzb3hnNFIrNTE2NmgwWkM2dHZobXlOWW9kN3JsZS9TbWI4M0lU?=
 =?utf-8?B?NTlGVWFoYlN2VUhqdHlkUUVyNEI1Smoya0xqZE5CWXFCa1Z4eGoxMTZ6RXJY?=
 =?utf-8?B?eStuK3lndUdIS21xazhNNVVsV1o5Lzd1NTVoalNscWd4SlBqU09MaldTR0dL?=
 =?utf-8?B?NUR5Qk1waFJZUWpiZWtvT1RHUUdJOFhsVnE3VTA5WFdWZGhLWGxrR2RXajNX?=
 =?utf-8?B?ckZNRU9sZFVDbjVZd0EyajdvTVMxZnlJR0Q5RUVPV2NwZ2FuaS8zU0U1dkY5?=
 =?utf-8?B?THdoaU9WNG8xVllwV09pZUVLaTFHdHI1NXdaQTBBbmZoRzRwR3ZZbXVwSXg4?=
 =?utf-8?B?Uml4VHBVTTBUNnBFeFpzTmgvWDdSSklIUUdSYjBhdHM1S0MvU016b29MYzdT?=
 =?utf-8?B?bEtyOUNwSk5JSzQ2NEpmWHlScWtnbTBEU09GZWRKUUNVendwZWFOS21FSDFG?=
 =?utf-8?B?K1c2RG4yd2s1bzYwMUdTc01zT0E0dWszMWVFQ3BVREVCYTdxcmxQNGtqcW9t?=
 =?utf-8?B?WXdHeGtTakhRZWNYSEE1aDVBK1lFbStTNTI4SS9CTUJDQzRraGk4VGFSYXJR?=
 =?utf-8?B?UjM4Z3dvRmpkeHRSc2xQTXgycUNzZmgyZlYzRXUrYVQvaE9ocWlucW5KWG1X?=
 =?utf-8?B?U2dyYUtHQ2FnSWtUdUMvYmdGV3VZdVN5R053UExTTzBSZDd3K2lNYS9JcEZx?=
 =?utf-8?B?dnJIRGd5ZS85L3o0djNhM2c2RG5qbTVKWmx3M2tUbXh1SWxFZWo0R1lPWkg4?=
 =?utf-8?B?K2JibU5XbjhFSSt6czluYyt4VlV0eEVzbU9hb3piaHFHQk5iQTVzNlNZcENo?=
 =?utf-8?B?Z0ppNmw4VnNLVzBUZ2RUSTg0Y1pVd3F3bzdocjJmdGl0K08yS1ZDWmNWMStk?=
 =?utf-8?B?RnRROHlBbm45dVJUT1dKYzk5dm9XNjZNTjVVZEV3NE1pRTlWS0JIMUhCTmNw?=
 =?utf-8?B?eDVBamdXZmxOaURvYm4xOGQzZjBFYysyMVNmQUR3QURKWUx5YXkrRUhraERV?=
 =?utf-8?B?MzVjYzUrQ0FEaGdodTZZSDhpZ1BabGpQeFFtbzhsZWVYdWJuT3pkOW1KWG0w?=
 =?utf-8?B?cVc1T3dEVysxNWl5blI4T2xJOFhPMXA3SG1UMXZMVk1sdnlJd2tVeGNnY01X?=
 =?utf-8?B?amFzRnpYY3VLYmVaZFFsNHNXRlVmRjltTHhYRWtDK25HUzYwUndMcFNNeHhz?=
 =?utf-8?B?THRtR3R4d0grOXY4VE5BcmErdGN2NGY1Ui9SR2ZsRkJPRXo3SkdUdENSaUo0?=
 =?utf-8?B?TysxS0lzTmF2aEMwNlA2a3dMb0djYmZOSHk5VnlIV00vRWs3OVBPcm1ZbkZl?=
 =?utf-8?B?WGgrdGFnVEVseUZSdTZIQmhQYjVpaXg4ck9Yb2U5NVFqMzBDT2l6SWF6WVFY?=
 =?utf-8?B?N2RXSFQwM0M2U3hJNFFSVDlERDVyeVdTZHUvQ01ibWY2LzYxZGNDeU9zekpT?=
 =?utf-8?B?WjlXMUlyREZwYVczQ1I4allna0dlOXp2bXptOFBURWV4d3hxemhOUUV3RFpa?=
 =?utf-8?B?d0s0NzdEZVBtMXZINHNoY084SzVodFREVHpRVHQ2ZjRIVWRLZmRZZUVHOXIx?=
 =?utf-8?B?QWxNd0pyaSt2eHpTbEdJQy95V0RxU0paSjRBUWlUcERRTTFXeWdIZzRNOWlo?=
 =?utf-8?B?QlN2dW5CSGd0TEhsaU8vMXpaMGFsMGNUNUZUeEduYmxSSFp2YXhTWUFVRUhC?=
 =?utf-8?B?eis0TWRDZHFobENLVittanNBbWVWbXB4SGlCRmtYaW1mMG0xSEZ1NEJsYXky?=
 =?utf-8?B?RmNVcnJZeG5jSGVWS1o3aTcxRUxNSDFKUzJrQjd2NHd2YzVZaVh3WnQvWHRG?=
 =?utf-8?Q?nYUXVxptDYnvapzCeEy8bkS9sWsVrOLU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUd5eTRjaGE1eXVyNDU4dytQa1oyVktKRkVmeUtrSm1pTGFoZWRsS2xFUGFo?=
 =?utf-8?B?UHdQa2ZCbDdkeTZnRDkwUEZGa3pIbzNTRnRaOGZUSVRCMmg0a0hSZll0dzkv?=
 =?utf-8?B?TVNTZHZEbEZ0SVMvYVM3MVhnS3NvREx3OFdOMGVQK2NGemRmeG8xcEhIL2ov?=
 =?utf-8?B?WnBodlR5alN4Wk16YzNBZHo5TmtuS3NkTm43V2kwWC9tcDNkbWU2TWwxU24v?=
 =?utf-8?B?eXBPbGEzT1pFa1RXVlJtYnNIUjdqcWhOSGpYNkZ5Z1djTjFjb1MxWjNiMGd4?=
 =?utf-8?B?ZmVaejY2dS9qV01iM25rUW1qdTZvUU5JVmlHMHZKdktyMG1yZEdEaS9LenR5?=
 =?utf-8?B?YWFzWGtlZUNjZnIvdnZ1UTJFMmhveXZOY1owZkU0VVBUZ1BPeGg5Yi9kOFBV?=
 =?utf-8?B?SWNaTGZONWhMMzJXRjAzNXRXbzBQTFcxNXZQSXlkcGNzMWc4TDBNYXQ4U2Z2?=
 =?utf-8?B?WGNScG9LN1NNU3hTUDdNWHdzNkZ6bGhrcnFMM25zM2RpV2JUYTMrczBoK0s1?=
 =?utf-8?B?WUVQSEhSSEtncHVwR0xpbVVUVkRGaTB5blUrNzBuMUNDcnRhdTdhUlRZaHk2?=
 =?utf-8?B?a0FVcmNTdld0ODI3cDZJWDhlOXBTTU41TmEyRkRLa2krQVRMdlFFdENWRGJL?=
 =?utf-8?B?K2orVWJ1djBIaTFlSDAzWE9wbE1CN01CYmU2Y0J6a2MxNFNLY0NFZndZRXQ5?=
 =?utf-8?B?Nk05TG8vU21aUGxqMlpkcHhPUndvTGdZa1JIajQ4eUExWkp1cFdLSmliZEtX?=
 =?utf-8?B?ZU1ISmU1cnI2YXN5SFFBQkVGVWhEUUNOQmFQZjlTOXQxZ1A0VEZicG04UERP?=
 =?utf-8?B?MVRDZHEzTTQ0QWZqWmIxNjRYb0lUUTF5ZDduZ1p2SzN3andSbm8rV0pXSk4r?=
 =?utf-8?B?ZnBKL1dPSXQ3bGM3bExab1F6NG42ZmMrN1NDZlY0SFI1ZUxTNzh6a0J1NGdF?=
 =?utf-8?B?KzJrNjlvV2NFcXc4UHhzVkkxSng3STh1RUtMR2dHdDlSamF3bkp5Qm1XT25I?=
 =?utf-8?B?RHZiaUo2KzA5dXlFTUtBMWNSeDBqcVNrU2tOUVR2TnBQeGl3NDBCZHJta2Nx?=
 =?utf-8?B?RTNwcEVjdkJXM0d3ME1kOTYwY2R6ZlJXVmhwOTZMUS93RWJzMUlZUUxnRGlw?=
 =?utf-8?B?Vkp2cU5kZFdjMmx6QlJzWHYvYkVkaC9BSHM4VkNtaGFnN2poYkpHTEJ1Y0Fa?=
 =?utf-8?B?SkUxa21jekR0MXJqYUpIdVYrdU1mU2VXQ0lkVDFoYkszVWI3VzFIUzdOelBW?=
 =?utf-8?B?RFJETW94Tm1lK1Vrd0dtRi8zT2RnSVFqVXZSTVhJcmdpcGwvR3IycWlPR3Va?=
 =?utf-8?B?VlQvOUMzSnFabGhuVDJMMXY2Y2tGU2xoMmIxQlZkN2R4MDRzUDdZUWFuSjFQ?=
 =?utf-8?B?R29hM3I5OURPOGhraDdYcm94YnJGcWo5TkQrc1ZySlcwcTBWa1VpZlVwUzJl?=
 =?utf-8?B?azdLRGZvdklJWHhxOG54MDZDVW5UUFJXT3lmVTJxNmlTc1dteXlXeG9wQkJv?=
 =?utf-8?B?WFdHVXVhcUF5OXQwVDAvN1M1aUdkQzNSOVNORDFEbmU2WkJpaVo4SEhIYm9z?=
 =?utf-8?B?T25ScGRQMUdrT256dS9hNUNvQStWMGhVeExrNXVtVmhNOHZPSHliTFZkdFNZ?=
 =?utf-8?B?MGNKOW9jY2FzdGEvVFhwU3VKTVpRb3Rvb21vUmEzNThPbHVQangvb1o2UDlh?=
 =?utf-8?B?UHdNSWhoZEdFamljUVRGdGFnc0V5WVF0L1AxN1dqUXlVVkcrc0EyUHFSSEZE?=
 =?utf-8?B?WVNsRnZpeHNZaURmSE53b3BOdEl4L1BTOUpJMGU3SUUrWllvK0lvc3VwMWtj?=
 =?utf-8?B?Rk5xSEFOOWU3d2pDcmFnOWZ3VUYrM0dUeWludktJQnhCajNrUjZOOTNLeHpK?=
 =?utf-8?B?Q2U1QXBWZEFDVS8ra2J4em53aW9tN1NoMVdobGREYzNtYzV6OVdVMUlvelZH?=
 =?utf-8?B?dDhxWWJlanlicGQ4MWd5OTRuajg2cDhLWnNUYzJqZFl1Rm11QkxQK0RNdEho?=
 =?utf-8?B?R3pmZVNkdGp4Ly9HSjFydC9rRzFMT3cxM2lmQWZzdTBlRDNGOTZMY25IZVZX?=
 =?utf-8?B?SUp3VzkwMzRucHJ6bitSUW5INXRYZTBNVHFLV3FKQ203T1FjV0dNeCtYS2ho?=
 =?utf-8?Q?grZxPo4Up6LWUfPSqdeeKesGt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cca80e-1b73-4034-6358-08de0dcbb86f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 22:22:55.8775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrYUo8w1UxSi5a/XQvezOwg1ttATImzATQZrRUZhevjy6orcwdxGBoarelXM5qMABXw6grKPaX1QWO2+eCzpBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7821
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


On 2025-10-13 09:48, Christian König wrote:
> This should allow amdkfd_fences to outlive the amdgpu module.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  6 ++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 36 +++++++------------
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  7 ++--
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  4 +--
>   4 files changed, 24 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 9e120c934cc1..35c59c784b7b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
>   #endif
>   #if IS_ENABLED(CONFIG_HSA_AMD)
>   bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
> +void amdkfd_fence_signal(struct dma_fence *f);
>   struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
>   void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
>   int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
> @@ -210,6 +211,11 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
>   	return false;
>   }
>   
> +static inline
> +void amdkfd_fence_signal(struct dma_fence *f)
> +{
> +}
> +
>   static inline
>   struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
>   {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> index 09c919f72b6c..69bca4536326 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> @@ -127,29 +127,9 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
>   		if (!svm_range_schedule_evict_svm_bo(fence))
>   			return true;
>   	}
> -	return false;
> -}
> -
> -/**
> - * amdkfd_fence_release - callback that fence can be freed
> - *
> - * @f: dma_fence
> - *
> - * This function is called when the reference count becomes zero.
> - * Drops the mm_struct reference and RCU schedules freeing up the fence.
> - */
> -static void amdkfd_fence_release(struct dma_fence *f)
> -{
> -	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
> -
> -	/* Unconditionally signal the fence. The process is getting
> -	 * terminated.
> -	 */
> -	if (WARN_ON(!fence))
> -		return; /* Not an amdgpu_amdkfd_fence */
> -
>   	mmdrop(fence->mm);
> -	kfree_rcu(f, rcu);
> +	fence->mm = NULL;
> +	return false;
>   }
>   
>   /**
> @@ -174,9 +154,19 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
>   	return false;
>   }
>   
> +void amdkfd_fence_signal(struct dma_fence *f)
> +{
> +	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
> +
> +	if (fence) {
> +		mmdrop(fence->mm);
> +		fence->mm = NULL;

Isn't fence->mm already NULL here if it was dropped in 
amdkfd_fence_enable_signaling?

Regards,
   Felix


> +	}
> +	dma_fence_signal(f);
> +}
> +
>   static const struct dma_fence_ops amdkfd_fence_ops = {
>   	.get_driver_name = amdkfd_fence_get_driver_name,
>   	.get_timeline_name = amdkfd_fence_get_timeline_name,
>   	.enable_signaling = amdkfd_fence_enable_signaling,
> -	.release = amdkfd_fence_release,
>   };
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index ddfe30c13e9d..779d7701bac9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1177,7 +1177,7 @@ static void kfd_process_wq_release(struct work_struct *work)
>   	synchronize_rcu();
>   	ef = rcu_access_pointer(p->ef);
>   	if (ef)
> -		dma_fence_signal(ef);
> +		amdkfd_fence_signal(ef);
>   
>   	kfd_process_remove_sysfs(p);
>   	kfd_debugfs_remove_process(p);
> @@ -1986,7 +1986,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
>   static int signal_eviction_fence(struct kfd_process *p)
>   {
>   	struct dma_fence *ef;
> -	int ret;
>   
>   	rcu_read_lock();
>   	ef = dma_fence_get_rcu_safe(&p->ef);
> @@ -1994,10 +1993,10 @@ static int signal_eviction_fence(struct kfd_process *p)
>   	if (!ef)
>   		return -EINVAL;
>   
> -	ret = dma_fence_signal(ef);
> +	amdkfd_fence_signal(ef);
>   	dma_fence_put(ef);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static void evict_process_worker(struct work_struct *work)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 91609dd5730f..01ce2d853602 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -428,7 +428,7 @@ static void svm_range_bo_release(struct kref *kref)
>   
>   	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base))
>   		/* We're not in the eviction worker. Signal the fence. */
> -		dma_fence_signal(&svm_bo->eviction_fence->base);
> +		amdkfd_fence_signal(&svm_bo->eviction_fence->base);
>   	dma_fence_put(&svm_bo->eviction_fence->base);
>   	amdgpu_bo_unref(&svm_bo->bo);
>   	kfree(svm_bo);
> @@ -3628,7 +3628,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
>   	mmap_read_unlock(mm);
>   	mmput(mm);
>   
> -	dma_fence_signal(&svm_bo->eviction_fence->base);
> +	amdkfd_fence_signal(&svm_bo->eviction_fence->base);
>   
>   	/* This is the last reference to svm_bo, after svm_range_vram_node_free
>   	 * has been called in svm_migrate_vram_to_ram
