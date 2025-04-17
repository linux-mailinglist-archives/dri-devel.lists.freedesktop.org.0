Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE82A92224
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 18:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8481F10EB5D;
	Thu, 17 Apr 2025 15:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l1sEW4CK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D0E10EB57;
 Thu, 17 Apr 2025 15:59:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vu13qNFRgPGES4r1yQlcHKftqLkuUvof+0bnkA+0EQDk8nOyF/DJNrsDLkXqv6xTAGE7g5iZCN3tfVwAve+rdzAW89ZxLxjFJNZ1qj6lPUj9NRyTd8Z/Efu0EFHxb+EKHo+uGRlUEXqPa3sUaeutH6llnIiqaiAFcnImsnl62UBXcGS2JoKGj7umebgEM5rnRreR1NL1PlYrxx1HGELZ+ywQ/0ituzy1wa6hRoNkZXs4XXZdxr9S/t1lo2mboC2JCTSy39acrZvMyhKZLF5j/wy9d410M791p7KbDScO452oh/wbvQ140+kSj67G5fsmfWvd2pj51wqKsA2kw6yrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeAra+Zcc34m8PCN749vUEYKuZKSW/wFGstUiGSoVDw=;
 b=FPmGz0f1D5lL2N2/TuI5YNqbxci02c88JBO616Q+GTb2uj6zze6K98YYae37AyTCHvJA91PXv2OhtKlIXAHElNXfoXIF9aMYhwCD++cNPbxrezVY+nfuMFO8uC8O+/DODI4KoRROoEpjSDcUjyO9huZGi8zaJ6xUCG0cvmcofPuCNn8KfgyZCmn1veZs9N60+TBlUoiZL/6Q8zBSwoTrfsFSdh3K/krWAlTNRJSvAZwABtzpwLsSS+2WAwl5f6oL3M44/NJQAsXqoHreekLzSh9qO8k7akqmrfJiB58V2tPWkERSptW+yja+A/pfxmL5vF1/wuRwWiUJ1bQWIvr+yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeAra+Zcc34m8PCN749vUEYKuZKSW/wFGstUiGSoVDw=;
 b=l1sEW4CKd39PYdB4Eqr8jW6aWIhjpPLNh27hQcpgsTqg9EwsxRwKkhpEB19CjGyHfNBwPey4v4skN6hAai7BqgugA9JDoAYG0FjIL78FjoVIueG6Q6Xzo8S73c6feBNrOKWBQfVM0/VcUv+hPIOyatYEcgTDCdrvIpaY9yapZ6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 15:59:48 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 15:59:48 +0000
Message-ID: <d5892bab-1f85-41bc-9e59-4fde6d5c2560@amd.com>
Date: Thu, 17 Apr 2025 21:29:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 3/5] drm/amdgpu: use drm_file_err in fence timeouts
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417123155.4002358-1-sunil.khatri@amd.com>
 <20250417123155.4002358-3-sunil.khatri@amd.com>
 <1bf5b875-52bb-4ce0-8b7a-50837407bada@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <1bf5b875-52bb-4ce0-8b7a-50837407bada@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::34) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b108d7-424b-42a6-e78b-08dd7dc8e149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmJSMnhJZGpGWVFSSnI5VXoyUFUyTkZXUlpWUjNhVXVRK0tsOWdlZUVvNGow?=
 =?utf-8?B?SVFWZGtEQmJtYU5TZnJSbldHeGhXZGxxZzFpbFlORmlWTFN6Z2hiOGRhYjFt?=
 =?utf-8?B?RWJ4ell0eXRPSzBlT0crZ09zWE1ZQnVyRjFWOEJDQ0p5MHoyMVdNb0RyNzhh?=
 =?utf-8?B?bzNtZ2E0MXFTNktwN0FabkRvV0xnaG1mTTVSNWtZcWtSUnBCdkF2WjQ5TTVx?=
 =?utf-8?B?WERvWHNnOSt2Ui9LN3VEc2g2VHBheXFlcFdGZ04ycTRPb01FVVhYZkdOcUtT?=
 =?utf-8?B?Tk9waEZoNFk3Zmp2MWkveCtINmdpTzlBVU5ocFlpRmVGZ0tXMGNqWU1oc1VH?=
 =?utf-8?B?MjZlMDNOM1pCQVMvSnFLV0JUbHZxbVJERkRXN21vOU8yVllrdDRTUWFVK2ly?=
 =?utf-8?B?dWM0M3RMMmw5c2xNQnBpQ0tPUkl1d2FicllQUDdrTnpRQ3VobDlCazZrTXcz?=
 =?utf-8?B?Q1pYVzA5bjYwcm5xWWcyWnExc2hiQnIyNTM4YnQxK3hZbEJWZm1iSXJvTlk5?=
 =?utf-8?B?T0VXanR3R1VpVmI1ajdmUGR0NnpFdUo3U1lqOExjekRvZHRwcmUvbkZ6TXVm?=
 =?utf-8?B?elZDSEF2b3c1YjNtRkpqSVJJVlo5azBjSTdpYldtMW84cmpWM0F0NTZLZUJy?=
 =?utf-8?B?cGFGUXppYUlGZWFmanJsZGpUeFJkenpidjdIb3dQZDREbmwyZzhKb1ZrUkRa?=
 =?utf-8?B?R1laRWdydHhJd0tEREJkUHZYaEwzT1R5K240cUg4TEUvOGdYaFkwYVdjY3Z0?=
 =?utf-8?B?a0pQdmNvalh1KzRTK254bDNocnFzQXMyY3V6U2xuV0h5eHdIbnE0clRVYmhz?=
 =?utf-8?B?UU1Bd0FPTFAxSUFXVEZneVhnRnBSem1EWHNiaUVmOEhrY044Q2NCb25xRkV1?=
 =?utf-8?B?bFhTNXp6UU5vei9rTUxXaUNFdmp1dW5aeTV5VmdoNmhsTXFUdWNkVm52OW5a?=
 =?utf-8?B?MGI5elNJU2V1RHNya3A4KzN5TjdJVG5KZm5ldndLWEk3SUs4b1dSenVZR29B?=
 =?utf-8?B?MkdtSi9XaC9YSENHWUJYa3h4RUpIaUNtTGFyRjBKajc1SmU2bHpmRC8xbVlo?=
 =?utf-8?B?VkVyNys0RXdjTmtkdFNWTkU1REUzdURTMzdHZUIwYkpjdm41amNxb1NCQWJu?=
 =?utf-8?B?OEhnSkovSHZQNHBVYTFDTWRRK3ZkNmZhakRhUE81Nm5OTXdsN0ZVNlgzaEU5?=
 =?utf-8?B?ejBBSkVMQTl5Y0FmdnNuMlF1MmtiN1lmZ3N5QVJHbDN2V0tjSmxHY2gxMHFj?=
 =?utf-8?B?TXl4aUViZFFEazg2WGlPY1orT3MrUENnVmxoTEdvZThqcjh6QWlzS3Riclpv?=
 =?utf-8?B?QjBvZ0tqajRwUXhOYncxL0hFSTBJZ1dPNkdBLzdjbGVFS09LZFRBSFJNTUUx?=
 =?utf-8?B?NGNOMk82Y0xZWTRQT1ZHSDBheXh1bXB6U1V1MnZQWXhQT0Z3eWRqckNnYlJk?=
 =?utf-8?B?UFhiYWFnVVhQZUI1ZmdQMGFxbG13ZkJYcmZFVi96ZnYyVTYxdVF6d296YjJG?=
 =?utf-8?B?dmhMcDN2UmluZXA1b081bEl0R21SbmFiYjIwSTQveFRxdzJVa1BOaVVYVEFN?=
 =?utf-8?B?ODRXRzNZVXlGMTFpWkRIU3NvUFh3YmNJZzF5MXVETVpPZXB1UENNdCsrQmR0?=
 =?utf-8?B?UVlzZ29aRmhLb2V4R2VRZ0tpSk41cVlJMWFKN3RiTGF2MWhPcUt0QlMvKy9J?=
 =?utf-8?B?ZGphc05abDFkTEJxN1FELzB3T21oeE95Nnk0RG11cnVUb09KUVg5cnN2djNX?=
 =?utf-8?B?OUxFNUQ0UDZjbUF2cmxFUjFtME1MWTRYbktOanZGcTBSdDB3S2NtWHM4eTRy?=
 =?utf-8?B?dGszSGhWTlVJUm1Vem5VbGVNMW5VU1ZNendlaWpvaUw0Nmc4VGhBMCtZRUdW?=
 =?utf-8?B?U3g0ZEhEc2lJSlFKbWZsRmtmeWNGa2FpVG1HWW9xVkR1bytJTFhXd0YzQk5L?=
 =?utf-8?Q?ozvZ3RJ4r0g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHpPTEs5VjJCc0NnN3RIWDAzb0l0QUFkcmJBVlBUblRrQjFHdXZZTlJ4ZnFm?=
 =?utf-8?B?SFVtSG14V2dKcEpKbFlEZm03bUpKcDFLdS8zb3ZteG5IV0FVUUlRcXIrV01H?=
 =?utf-8?B?RGJtTWZrRlNsYzVuZkIzUWZWdVZ6L3BJR25aM3ZJbG4vbXRmY3hNMXVmVTNR?=
 =?utf-8?B?WlQ3MlJSTGV1cVAzT21aWjBBRU9vQ1NMQmNyZnpJZGllQy9nQ3VINkZ0TjJt?=
 =?utf-8?B?Zy84aW94WjJtYitmOUROQVVBRzNsUjNFb25qWUhQSTEzNHkybU5xM3BLZXY0?=
 =?utf-8?B?bFdhUTd6bkZxaFdPQnJIalJyWldJMzJ3NjgxTTR1bytCTVNnWkVBTWxjeGJY?=
 =?utf-8?B?VU94UXk5dzVQMFlOcDIwb0VwK05ERDd0YjhvUk5PSlBoREcvTVFkZ0hQNnlj?=
 =?utf-8?B?a0NIeUFCaGJrWjlTUWZMaUFyRXlTQVZDOUdXOE5CMFBYQUo5aWRPcHUwM0w4?=
 =?utf-8?B?ak1wTVFyRU4xY1c0ejRzQjlwR0dYWVpoRXd6a3drUW1FengvdW90YlFsbE9M?=
 =?utf-8?B?V3grK1kvdkJNLy9JTzRDR1oxWERsRTE1UVZDbmR3a2s2L0ZkQTE5cVBjQWZm?=
 =?utf-8?B?TE1VRjlKeVNRRllzTFl2OUp1MnkwbThKUk9RV3k1MmVtaGNleG9BTWprY0Vp?=
 =?utf-8?B?SWlPdXVPQlk3NXZiZHBGTlZuQ01oTWNHL2sybE02YzVRVU5NUVFPb05OMndu?=
 =?utf-8?B?UjBkbnYzbUpzM0NVOCtSWW9Lb21RNE1WT0hTQW9OQ1VJY2RHWVlVaDFwdlo2?=
 =?utf-8?B?cUVNTElRaVdjVnFYTHNWcURMcXRZSWVmTlZ6R2ZUbERybSthM1IxS2NvTjZk?=
 =?utf-8?B?Z3I3bzFMRXJodnhoekZBNkFPbjd0WEZDeHlDeGV1MkdwNVJpZnRnZngvZjEw?=
 =?utf-8?B?VlJ4RExnQm1BVjdOaGNsYzdiR2ZqNTZwLzJnSUYyRCtYVjZ0dVdBaW8vQlZz?=
 =?utf-8?B?a2lHR0VCVjRzSFNleHUvRGQyZmFyOXB4ZnRhZVFXZ3VXTFRjbGQ5T3ZCdktH?=
 =?utf-8?B?dDZzODJneTR4SGh2TE5qTk9xZzZNRXdkRHVUQ0JFZ0Exa3J6L0k0NmorVkdL?=
 =?utf-8?B?bHZNd3dmTW1JMWNvczJybC9DbWhyRlRiZ3FmTkZoNUJXdkNLQWJrb1hHaEwz?=
 =?utf-8?B?blhCRTdVTzBPZVZzUDU3Q0NQMVB3bTZSMGNiaDVkMXR0QzR4NlNtOU96SGtN?=
 =?utf-8?B?U09XT1ZXKzhSTlVkUGZUdzFaQjdSZ3lzNGJPSXR2dmQ3dm5IR0U3RWNhQ2E5?=
 =?utf-8?B?eWx4WXVJZGdVWU5TTmhWTkFLbTBET1RXeUJFZWRKaUozVlBGZTM1YStDV1dl?=
 =?utf-8?B?MDdPYjVKL0hRMWR6dkJjd3ZuU0cwTHRGTXo3ZHhVUEJ1Nks5SjlKRVZvS0Rn?=
 =?utf-8?B?L0RCeCtETjUzekpyZkNFVnp3Q1VaOVpEMHg2TFlZTzVIbUxia05CYllSZVda?=
 =?utf-8?B?STFEY1VZd0YvWk5wSlE1ZXFxU2l5NzdVWm8wa1UrVy80a3k1azVPVGt2Q2Nx?=
 =?utf-8?B?NmVBSHN1VXVOS1c4SjhaM1NpR3R2blU5NEE2UVVjOXVqR01qV001cCtjdEpQ?=
 =?utf-8?B?YUZJeHRYZVpoSjR2cWtFcHNNTzJKdTR1MHYvMm15L2w0b2hCYU4rLzFFRGRl?=
 =?utf-8?B?bXdHUVVRd05XZy9ZUGlMZGgyQlpjUHJ1SHFIbUE1am5RZlRjZTdGYjlaQTdD?=
 =?utf-8?B?WWNyYUxvYUU5cUZheTkyb1UwTmxaSEZuWmZRSDF1ZDh5SXdXcm9WT1o2M1ZU?=
 =?utf-8?B?QVNMd2Q3N2xTc2ZqQnhiRXpscHpTVWlkZlVrL1lSNDdaclNoR25vRHdLZVQ4?=
 =?utf-8?B?bytnWXhnS3g1ajRZREVxaTBEZktqR1psaGxWaDJQenltd2pidXRlZnc2YXZI?=
 =?utf-8?B?eHEvc010NHVacWpYa2tvOTJBSjA1cS9zcGpVWkhuaXZQN1J2ODM4UlpwRXpr?=
 =?utf-8?B?eUVvUG15WCt6Rlp6WDhUTHZjbnl6Tml4N3Z3bUFrUTEwSGo3S1FwVExPSVRt?=
 =?utf-8?B?YlBUM21ibmdidjFyak9yVWw2Z3ZPYVNUbjVVOThEUWR5K2NNSVJIRlR5Y3JW?=
 =?utf-8?B?SVdaUGo0VUxvQVdaV0hUYU55WG9OdkRHRGFPdHhXbXJoTS9MWml0UmMxWXJX?=
 =?utf-8?Q?mHqFACVfApn7bbFto+YyOoGfD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b108d7-424b-42a6-e78b-08dd7dc8e149
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:59:48.6383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqKoopG7Dc+gjU8XNzFMTu3+a2YKUop13xwtkJEHMkzo1XhgfksemVt3bZxD51Om/t2yphiV+LOEmSS9Jv3p8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222
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


On 4/17/2025 7:11 PM, Tvrtko Ursulin wrote:
>
> On 17/04/2025 13:31, Sunil Khatri wrote:
>> use drm_file_err instead of DRM_ERROR which adds
>> process and pid information in the userqueue error
>> logging.
>>
>> Sample log:
>> [   42.444297] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] 
>> *ERROR* Timed out waiting for fence f=000000001c74d978 for 
>> comm:Xwayland pid:3427
>> [   42.444669] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not 
>> suspending userqueue, timeout waiting for comm:Xwayland pid:3427
>> [   42.824729] [drm:amdgpu_userqueue_wait_for_signal [amdgpu]] 
>> *ERROR* Timed out waiting for fence f=0000000074407d3e for 
>> comm:systemd-logind pid:1058
>> [   42.825082] [drm:amdgpu_userqueue_suspend [amdgpu]] *ERROR* Not 
>> suspending userqueue, timeout waiting for comm:systemd-logind pid:1058
>
> If you have some oomph left after this many revisions in a short time 
> it would be good to update the examples to latest format.

Will push the changes in new patch set

regards

Sunil

>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 21 ++++++++++++-------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> index cd9dc0018ee6..613a3a63301b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> @@ -43,8 +43,9 @@ amdgpu_userqueue_cleanup(struct amdgpu_userq_mgr 
>> *uq_mgr,
>>       if (f && !dma_fence_is_signaled(f)) {
>>           ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>>           if (ret <= 0) {
>> -            DRM_ERROR("Timed out waiting for fence=%llu:%llu\n",
>> -                  f->context, f->seqno);
>> +            drm_file_err(uq_mgr->file,
>> +                     "Timed out waiting for fence: context=%llu 
>> seqno:%llu\n",
>> +                     f->context, f->seqno);
>
> I would just go "...fence=%llu:%llu" for consistency with tracepoints 
> but up to you.
>
>>               return;
>>           }
>>       }
>> @@ -456,7 +457,8 @@ amdgpu_userqueue_resume_all(struct 
>> amdgpu_userq_mgr *uq_mgr)
>>       }
>>         if (ret)
>> -        DRM_ERROR("Failed to map all the queues\n");
>> +        drm_file_err(uq_mgr->file, "Failed to map all the queues\n");
>> +
>>       return ret;
>>   }
>>   @@ -614,7 +616,8 @@ amdgpu_userqueue_suspend_all(struct 
>> amdgpu_userq_mgr *uq_mgr)
>>       }
>>         if (ret)
>> -        DRM_ERROR("Couldn't unmap all the queues\n");
>> +        drm_file_err(uq_mgr->file, "Couldn't unmap all the queues\n");
>> +
>>       return ret;
>>   }
>>   @@ -631,8 +634,10 @@ amdgpu_userqueue_wait_for_signal(struct 
>> amdgpu_userq_mgr *uq_mgr)
>>               continue;
>>           ret = dma_fence_wait_timeout(f, true, msecs_to_jiffies(100));
>>           if (ret <= 0) {
>> -            DRM_ERROR("Timed out waiting for fence=%llu:%llu\n",
>> -                  f->context, f->seqno);
>> +            drm_file_err(uq_mgr->file,
>> +                     "Timed out waiting for fence: context=%llu 
>> seqno:%llu\n",
>> +                     f->context, f->seqno);
>> +
>>               return -ETIMEDOUT;
>>           }
>>       }
>> @@ -651,13 +656,13 @@ amdgpu_userqueue_suspend(struct 
>> amdgpu_userq_mgr *uq_mgr,
>>       /* Wait for any pending userqueue fence work to finish */
>>       ret = amdgpu_userqueue_wait_for_signal(uq_mgr);
>>       if (ret) {
>> -        DRM_ERROR("Not suspending userqueue, timeout waiting for 
>> work\n");
>> +        drm_file_err(uq_mgr->file, "Not suspending userqueue, 
>> timeout waiting\n");
>
> ...work?
>
> Anyway, we can tidy it later.
>
> With or without fence=%llu:%llu:
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Regards,
>
> Tvrtko
>
>>           return;
>>       }
>>         ret = amdgpu_userqueue_suspend_all(uq_mgr);
>>       if (ret) {
>> -        DRM_ERROR("Failed to evict userqueue\n");
>> +        drm_file_err(uq_mgr->file, "Failed to evict userqueue\n");
>>           return;
>>       }
>
