Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E4D9628C7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BD210E525;
	Wed, 28 Aug 2024 13:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nKpF+PON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C98510E51F;
 Wed, 28 Aug 2024 13:36:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtXgGkamtyIxRaHQIqwwARUEstmN8u+sc15fgI/dxrnbCjWrJxvx5ls1T4r7BDw5PCg6evCz1uCqZa1Va7yq5/Sz4oU618WQluLNcJ40W+TpdXnwboRSdG4AZovfUrs0YGn3TL0D0X4OpcMWFQoNBmjSHCk8QjRyVPKndh81betG1I+qKYjhPdF4DMAZV0uGRU2NVd4evBHDkEZa1ksnTyR+tXzansxO6rHmIvz4N12nZ1BCrWfbWl2XoBiHa14CPWkPRwUqBFPqowlOqtM4LmGK7fp9QaJSTJwo1wD4DRD4HtdyTqOi9uGaGewaU6GFb8lVoua+yC+FgaJeFxHHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LFj+uzZBm4d/5VikDAG0YJExG8DoCr3T/PJV6eh3AA=;
 b=ni9FYBTYCV9zRBCT6C2BNaQAWUcrqTXbIKv/y7AZt7Y695RgzGXBfABamHJO2tSNUdbFP8YP6CeeIvuRY3WaZhMr3XghnFetYFSH+dtpse0Bf47JtZcOl+V/2GgcXym4LJKQCtM7DpF047mWn+IZ5z6ttHJn9ORtvOYlpAdaJVvtIKx2SzyzDrdyd993c32WTK0bZkZqAStXbpj1HjgnNejgEEh+NOkWGEVkZ+89Ypk12wqGriP15rJCrOoIf7e30tw/eXL0NRbqcyiWlDNLEcKyfoaJDO3yg7oxwSwfcYYlD+0gv4g8RbG/a4H+OOrmTp7nBegI52dQEycD9bt/XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LFj+uzZBm4d/5VikDAG0YJExG8DoCr3T/PJV6eh3AA=;
 b=nKpF+PONniYbU1ny5LIH1rsAKlNOnvGxTCxgISrpzG0sxvqtzRrdNMeaxETJ6QP04KWKgr/g0cvomCNG4U4StpjilsLW6ftFhrRbMM94/je4bbyi4sPeK5k0dlkPCL5/3ssdpkmuFB73xQKWGvPLX4AFhPyHTeA+j5yLVZ8hRyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Wed, 28 Aug
 2024 13:36:04 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 13:36:04 +0000
Message-ID: <86cd26b6-b128-46b1-b34c-dc3cd91a05fc@amd.com>
Date: Wed, 28 Aug 2024 09:36:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/44] drm/vkms: Add kunit tests for VKMS LUT handling
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>
References: <20240819205714.316380-1-harry.wentland@amd.com>
 <20240819205714.316380-4-harry.wentland@amd.com>
 <Zs4RwDvKT_8TyyD0@louis-chauvet-laptop>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <Zs4RwDvKT_8TyyD0@louis-chauvet-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0094.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::22) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: e27a6507-e4fc-4d56-0b46-08dcc7665d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjExa0l6RXNYVFJnUk5MU2c1YXJuV1gvTlhOUDBQTDNpck5RMElFZmV2cUhE?=
 =?utf-8?B?eU01S29HMDZ1dWdEamp3TnFvYTdjSHJtUDJmS3dYZGVocDh2MUkwRWo2cWth?=
 =?utf-8?B?UmpyS080UlIyOUdmYUFlSXpjNnVZY1pPQ0dmbTU0dFV2UGtXckJ5UzRUbk9x?=
 =?utf-8?B?c2U5ZjQwTkVueE1YN2ZlZ050OEp1ZldnbW5uRHN3R0t2OFg0M0RzaVVCdzNj?=
 =?utf-8?B?UUhJaTNVcWJKQXB0V0VtUFkzQU9uZDhMcEdYYUhydEJLR2VtRFJZdUJFbWkr?=
 =?utf-8?B?S0lBYnM1UiswMlkwRWxRL2RaclQzOFg4aE5rSlozQXVhaWN0MGxVT3VhbjJP?=
 =?utf-8?B?RGh1eUN1ODVZSUJPT25oRXlnWlRtdkc0cDg1V2UwWVNrZFZKYkZsUDU2WWp4?=
 =?utf-8?B?dzhyTVp4K3lhcFU4dkZTT0ZRb0RQS3pqbFNLejV6SjZEMmNMTUJFWDJwdEpW?=
 =?utf-8?B?b3lPN1kvU2RzWGRDSCt1UzVSOGhJS0NEa0R2amd2OGxtSlNJWXVxTzdpb210?=
 =?utf-8?B?YkpzMkRZRTJhb0R0LzhtYzcxNU9DOHpuTFNSWjZxQWt2bHlHUTg3YVhyTXpM?=
 =?utf-8?B?UUtlYThBZFNGUTJ5T29lQkxtaEYrdWR6Ukd6YXUxUGFsTlZLelpyeElHajB6?=
 =?utf-8?B?LzV0TWVhd1piQ0h2ZElDbUIrRXBITkJtR0NhNVUxUDJNdURSYTFIdldrM0Fr?=
 =?utf-8?B?aEhzaXFpdlVQd2ZUOVhDYmpGY3l4OHIzUkE5TUVhZUxkVU5wRXF0MUl2dmJE?=
 =?utf-8?B?bEJpU0luTllURjlMcXd6aGFadjUxbzZmOXJ4VkRpbkdjdHRyM2QzV3F3Vi9y?=
 =?utf-8?B?RG9SWWdtZXFKdHJaWHVZMXVIbGg0UmdHK1o0RDFqdmpudSsvMWM2SUF0YjBl?=
 =?utf-8?B?KzR1cFlraFJGYzVzTkxFZ2ZmYWRCNHZKemhrbmNrUWtvczUyMTVOUzFMM2Ur?=
 =?utf-8?B?OVJ0NjVsVytqQWhWMGZyaEVTdk9wYlZ0MmcxSjRxajBQNElRUGt4Nm9FdTdB?=
 =?utf-8?B?Ky80NmtqcEh1TDRjYWRSejdXTThJR1lFREVsZnRpUkY1UncvOFRTajd5NERp?=
 =?utf-8?B?SHROclM0Vnp3MHdLNjQ4OWVMdW5OTTBUT1pVZkpsN0dST1N2dndmVEhLZjlF?=
 =?utf-8?B?Y3dxR2tqWWNOS0FuNUlkMzFDVVJvckQ4S0htU1FCYWE0bHBwcDNPVS9pTGd5?=
 =?utf-8?B?SDAwd1FIcE5KaXFiZmVGUm5MYVBCQmFOWVdTSC9vSlkzdHhCT25ka0Frc2V5?=
 =?utf-8?B?ZzdnVmpJS2NzbG55cTB4YTJYNFAvbDFJc242Yk5XdFJ2ZTkwb1g0UlNSSnVW?=
 =?utf-8?B?ZkZQN1B0bW9WQlB5Rnd2czV0TG5xWm5uSG5RVWgwclVHR21QUjh0M3Eyb2RG?=
 =?utf-8?B?Mnp3NWlZb1hxZWxQZmlkbjlPcnM0eG03ekUyU0xjcmEwa292NTJxVnhWK090?=
 =?utf-8?B?SDRIcTU5b0lKaDBOSzRzR2YyRnNXbTNwcHJFWmFvNXQxdkp3ZjgrcFhQZGVL?=
 =?utf-8?B?NmxyVm10RDBkMldGMlpvMmI1MldLN0wvSitiUDVLMEkxWVNjb1hDTDBuRU9I?=
 =?utf-8?B?cXFJU2lhNllPWDE0OVlIbzZxa3VUdXkrT2p6b2VvNHBPMTRDL3k0UTZlYmxW?=
 =?utf-8?B?aDZzZFVpREdsZG1mVE1FZ2ttWmZ1VUhOamh4M054WTN4RFAxTG0yUXphTW9R?=
 =?utf-8?B?eHh2THJtb1BBZ1lydjFjVEE3U0F6YkhWNVNuUXpETWlhckVLWDVURzZuRlE1?=
 =?utf-8?Q?p75n3A2rx3iJP7K/68QH0YgYhssc2qorsec88LD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUpaRmpaQ0QwcU92ZUk4SXpUTDFKR2h6WEdmV0dTTEZ2TmlEWW9uSGRZRzBt?=
 =?utf-8?B?eWk2dUdIbFhNNlNFRS9IeTlKcjhWM2FoS1duMTFiRGJWV0dsNGNQaGFBWkxI?=
 =?utf-8?B?dWJPS2NsSHF4Wm81dmlObWRydzJKVnR2dndqQ29WNFpMTS9nR1RiMDVuUEdk?=
 =?utf-8?B?UjRQRTJUQkcwZmR6aEhCNUhZREZqM3QrZkdaZWVnc0Yva2JWa0xyOXBSQnVC?=
 =?utf-8?B?V3NvaGgwY2lUL1BYTVVoR0taL0RGRmNsZlNpSzFmWmQvRTBFMk10dHdpbmUr?=
 =?utf-8?B?NktvbXBaZ0tCU1lnTjBXRGRROEYvbGZsNWw4Z1JuV21CQWZORGQxL0FZckx4?=
 =?utf-8?B?MzNYckk4RnNYMGJvMkVPYjlLSm8waHVyMnYyNG1paWN3d0dVa042OXYrUlVh?=
 =?utf-8?B?NnZPdHJtaDZ0c2owR2pVaDIxVVpYRE00TWpBa0tYemRkQlFBUmNTdWxpN2N5?=
 =?utf-8?B?Wm1UcTJUUWZhc3dSNFFXMitoSTZ0VUhndkJYcFM1U2N1dTVMTlVmemEvMUtX?=
 =?utf-8?B?Z2VRWjIvOEhvVmRuZXQ1YkxSUExYRVAxcnlQNVd3dVRWeVVWSTdPSUJMc25R?=
 =?utf-8?B?Ymlxc25VK2FwdXBvNEgxWG9WY2tEajhTT0Yrb3ZRaU02cEZtb251SUoyRDF4?=
 =?utf-8?B?VHVhaTBvVVNucjc2dzc2a0pWRFl3NzdjUGlTdjdMNjRXZTBPOVdaMkt2REJK?=
 =?utf-8?B?bEpkZFFkeHF5RzhUcG1QTk9rNmY0aFd6L3BPQTVocWc5anF2VVlPSFE4N1Ry?=
 =?utf-8?B?dkV1NFNHYm5zUE5JN29RZ29vclkvSVV1SDVsZVN0UFd5dGE2N3FTTmEvZExK?=
 =?utf-8?B?QXR4eWVqdm5XUSsxVzA1MVZvNkliNTNXK1JwZlhieXRHL2RsRjR6V0RmNnh5?=
 =?utf-8?B?NllKNGY1V1l2eGJaZjl4UU5sRC9NQ3hoQWJ0SlhNWFFWWUswU09QN1IwTFgv?=
 =?utf-8?B?ZkFIQWFWM0QySjBzaGlUQmFxaEJjdy92eDNzM1NlaXZxTVI0VXBpbVFPMk1W?=
 =?utf-8?B?NTVwc20xeHhtTzdDbjEwaHhDbVdmSEtUZloxZHh3L1FyRUIrbnJRYWFqSzFv?=
 =?utf-8?B?M2hUSXVkTlhyaHNidmNSKzZEY051N0N6azhYSkVhTDVQLzQvVFcyZ0RGZmYx?=
 =?utf-8?B?VWhzdkdpSG1pckhlL29yMjRVTnBWczZodXpwbWxpWEEvMWcwN2dVckdqbnkv?=
 =?utf-8?B?anVwRjRPc3Jsa1FWcEpyb3lYVkhYV1FoQTVMY0UyM2VrZnBLRTlCQWNIZmF6?=
 =?utf-8?B?ZFZWaGlBOE1JVCthcHZTcjdsbVFvY3NxYUF0bWl6a0wvd1liMk1FVU5YL2dB?=
 =?utf-8?B?Ym1reVo0U0xRU3cvWUUwbVlnOEZkZWRwaHFhZmh5QkMxa0V5MmdtL0NxM1Uy?=
 =?utf-8?B?d2JTK20wZnlKTVNHZEtiY2prMmEwR3FFQmdPb0ZqbzRway9uUStiNzkxeTNL?=
 =?utf-8?B?TTBrdU5nRHlVeGNYbk1oeVIwTmtDVEpjVjhFT01JcCtyNlBLWVgyQUJvVUZS?=
 =?utf-8?B?bXVyWkYxL0MvMGpZUHFEM3BDNk0wZS91Zi9SbnM5a2ZGNlFPK2RKc1B5dllF?=
 =?utf-8?B?VWQvUXNLSTkxMzVtbXNCOWVWWU1jS2wyYXdLM2ZHdlFRVG1wZlh6ZHhkcW5r?=
 =?utf-8?B?QkdjaTZ2OGpYTHNFMUVzbFRrVUxqWms4S25mTDQ3b1dhL0JTbkJEY2R2Vjhl?=
 =?utf-8?B?Y3ZZVHlPNnZwbmxhU2JSemNkTE01N09JNlBGZUFpeDM4VVM1ZHpnSTY5THVh?=
 =?utf-8?B?S2xoYitiTEErbnp2SFZaSWdXTkdpU2dFUi9RK1R2c2p2a1NaLzcwdjExZmM1?=
 =?utf-8?B?REtybGZXaytFdXMzaXltcytvZW1qU0RMRE1CY2JTaWtDZTd4SGNWYnZKTjl6?=
 =?utf-8?B?ZTBqb1JvZ2RqVmNOSi9qaG11eE9xaUhESzVqcTlldXpueE8vS2Y1NnA0T0RY?=
 =?utf-8?B?N3NvOVhsTmROUk9kYlVHaTFYZTVtUU1mZldiMlVsTTJzYkl0MjRwUUhQT2VM?=
 =?utf-8?B?aDZnaS9iUURHeWtKcExJQ0Z2OFpYTDFyb2x3V0o2MUcvUGZVVzhDTnBlVTRM?=
 =?utf-8?B?YUNNVk9uYXV5NEVXUFo4cGhrTVN5ejI5ZS9jUE5qSlprcTluNFd6ajE5T3I1?=
 =?utf-8?Q?bM2z9Dn9m3nwZMOqnonl0rCb5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27a6507-e4fc-4d56-0b46-08dcc7665d2c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 13:36:04.6380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKuZQq/tqoQrcXnNsTVF0IK6stKXwJpWseDeFOUQOvbW05Fb/jizykiTfcY/Xyduqmm+fdFTbMjEhHTUzbB+MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877
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



On 2024-08-27 13:49, Louis Chauvet wrote:
> Le 19/08/24 - 16:56, Harry Wentland a écrit :
> 
> [...]
> 
>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
>> index 3d6785d081f2..3ecda70c2b55 100644
>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
>> @@ -435,3 +435,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 3d6785d081f2..3ecda70c2b55 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -435,3 +435,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
>  
>  	return ret;
>  }
> +
> +#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
> +#include "tests/vkms_color_tests.c"
> +#endif>  
>>  	return ret;
>>  }
>> +
>> +#ifdef CONFIG_DRM_VKMS_KUNIT_TESTS
>> +#include "tests/vkms_color_tests.c"
>> +#endif
> 
> This is very strange to include a .c in this file, is it something done a 
> lot in the kernel? I can find only one occurence of this pattern in the 
> kernel [1], the other tests are in their own modules.
> 
> In addition it crate many warning during compilations:
> 	warning: symbol 'test_*' was not declared. Should it be static?
> 
> As other tests will be introduced (yuv [2], config [3]), it is maybe 
> interesting to introduce a new module as [2] is doing?

The VISIBLE_IF_KUNIT et al. is much nicer than including a .c file.
Thanks for pointing me to them. Will change this.

Harry

> 
> [1]: https://elixir.bootlin.com/linux/v6.11-rc5/source/fs/ext4/mballoc.c#L7047
> [2]: https://lore.kernel.org/all/20240809-yuv-v10-14-1a7c764166f7@bootlin.com/
> [3]: https://lore.kernel.org/all/20240814-google-remove-crtc-index-from-parameter-v1-15-6e179abf9fd4@bootlin.com/
> 

