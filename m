Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299DCC6E0DC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 11:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5B210E5D1;
	Wed, 19 Nov 2025 10:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EI/HHgWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010022.outbound.protection.outlook.com [52.101.46.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442F010E5D0;
 Wed, 19 Nov 2025 10:49:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdLrkNSKr1LAMKIrdXsQYzYqEEKdLpwuFMsfBiJv4BFsJxwPbc+1Jae8q3Z8HVdZcRr8qN6JiYlSejgkerc6tzEVPyGbxeEdxVoB8gQcRnWQMkAloCmXaElmuNVViQE5PpnCKoMGHsMaZA+yINLMqluPgO07v9NhkjcYLOEbj/9a3sbs/k91r3Rrav+W8BqOlGY3w2Bnb73vFbGsp76wml4wGtow22+OW3ofxiPgrwSEEIwHU1FrZODKfbVgevjU/7X2mOQk17NV2/fC2bp4XI0Eiz8XusPHaoFztNfmwXieglEh/PN6UJV0id/3NzrLcjyzW/dqbAYUsZsyk28WYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H25hB+jpeF6a7ViaRHxoaqxstG27sa4O0IHaVVJvOHE=;
 b=wCcTxlN6H2crvchb33qzybV6mPsQHVOD6/J4vfe9xgqFMLYlrrMh+TQbiqc9AzJ2OFoJNoFrrddocGZq6yhV4+sGZYJk6yhIENtQLvngStaeOnBVtW9zoXaVZW6Ul+6nt49erck4QFP7YpZiG8KAXa2gJJS5xidtbhcVSnkZipBN93/8ZEXP4EQw3mLuoU4T3gkJgrsGlDC8DwjhHVdZ26SbLhLQ7H2XmPKGO8C00wZnBvC4ANHr6wRZVLsZkzIkZWr3FoRcAt9j4/dpuuY5n2usOyoJd5SmFN+WBkLkwuEB/EjchtlCPiadVgkf/It1LFriNN8aHzJBmVcPvzOr7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H25hB+jpeF6a7ViaRHxoaqxstG27sa4O0IHaVVJvOHE=;
 b=EI/HHgWMRUFffo5BxsKHR5Mz4Yg1fr3qypgPuP9oH0GscHdENl5VF9/FjrXzKvZDLdh9tnJZAEsXLw/FoI9iidh+hiwS0OEdEQ3oy0nQAGesSAEt8733Xqc7smwMb+Za5UDSfSRXWIPy3+SZL74wg2x0ZqaL8eK23I4dIJSNaZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7964.namprd12.prod.outlook.com (2603:10b6:a03:4cf::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 10:49:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 10:49:25 +0000
Message-ID: <5f412000-b31d-46cf-af84-443c5b28caee@amd.com>
Date: Wed, 19 Nov 2025 11:49:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/20] drm/amdgpu: pass all the sdma scheds to
 amdgpu_mman
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-16-pierre-eric.pelloux-prayer@amd.com>
 <2920edba-469e-424a-87da-475821bd5c2e@amd.com>
 <5dbbce76-b8c6-4654-8098-fce1ee7b7b47@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5dbbce76-b8c6-4654-8098-fce1ee7b7b47@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0349.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: a916a091-14c2-4a17-4660-08de27594e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXNYZEkwaDM2ZVQ5UXcwajVWcFRrd0VNOEpDRy93Skd2YkpmalhZcUZpdHk5?=
 =?utf-8?B?L2VUWUxCbzdYTjlTeGRkZUJJUXB4a0dxQWhsdnlRa2VhWXBIbHJzc2JBWFIr?=
 =?utf-8?B?Q1h2RmFzWUE5ay9HTnVrTlYwSDBVQncvRGtLUGJwYU95VFpJTnV4NCtHSkNO?=
 =?utf-8?B?U2lMSGFTNFFjYzZlT0k1TDNtTE9GdWxNeGZRSFBnN0NEL2tQR0pnYUN3ZFB3?=
 =?utf-8?B?dkhIbEJOVytqM04xcXNVSnlTeUl3SG83V01pTUxJVjI2YVAycmJkVHRSLzlv?=
 =?utf-8?B?a2ZzNEJ2OHRnMUZQWlQ5MDh4M1VDTmRwaUY5ZXdzM0xsQ2V1QUtybE5FbnYx?=
 =?utf-8?B?aWpXU29kUmxRVlRWSDhFNTlZcTZmTld1RXpWck45cVovblc5OFRua1hpMGRL?=
 =?utf-8?B?M0xwUUx0a0NRSGJIcGdKdDFwYTUwSjZpeW5oNzhETWp5RVZNc3B1bjZTaVcv?=
 =?utf-8?B?SW93aWpmWDZEa3paalo5RVR1R0g2VjRyOVdlZUVyd1k2TjNHbytGUDltNEFU?=
 =?utf-8?B?azE4WTEwUVRXT2todW1xQ2lIcUMwaG9PY2gxZ2JXU0hrY3hPVVV4V3N3ZGk4?=
 =?utf-8?B?bUExWHFreGdNNFJzSWM2VTJaMUlYbFpoTDFaaktQSzJQTmJkTXF6bjZGS3VJ?=
 =?utf-8?B?SGVJTGNacjZVYUtvZVJteGxZS2RvNXZjaVBmNTh1MkdtNml2RFpHMXZHaG8r?=
 =?utf-8?B?czRvblRwTXZsV1ZHUG82cEN2TGhxZXRjbWxpY3BwOVlUbmR0UDBOZng2YU5m?=
 =?utf-8?B?MnNwbktkc1VEYzQ4ZWhqdUxaZTg3cjNSRkRZcHE1QTViQlAzMGdiZWx3VDUv?=
 =?utf-8?B?VGZGSUZia2tKb0NpUTY3Z1l1N1A4aTQrUGZ1K1B2dDNFQm93enRhRzJ2cnpI?=
 =?utf-8?B?S1hFUEdoM2tabVJudTJndmRZSGRHd1d3bktLeEVXaUpMNmdidDM1SmN2bU5l?=
 =?utf-8?B?ZSs2U1FxWERlTGFhdmtHaDZCZWJ5c2lVRFlpclZJbmRUNm1VVkdzcmNBaTE4?=
 =?utf-8?B?dkgwbGxSTks1MWhIWDRGUVE5eHFPWHppWEtLMWo2ZUVnSDA1WE5Jd09TRi9m?=
 =?utf-8?B?K3plNklFaGsrekRHb3FxaHd1OVFQYWI3TnRZNWh0MTJGbHlFSVE2dDh3SkYx?=
 =?utf-8?B?UEtHdVJvUEo5cHgybitiS2dNM2owNXhoVkJkNEVYUmR6dVF5eXQ1SnJQUWE3?=
 =?utf-8?B?UW9iUVpHU2gvZXBRdTF4c1BDOVlWYWViQmVvYzFiV01iWHVjd3M3ZmZ2TWdX?=
 =?utf-8?B?R2pJenNaWWphaDBLNjhuOGxSMERDMkxBdS9VakRDcHNuREdmQXhPc3ZyYUhv?=
 =?utf-8?B?ZWZEb1NPdnpHZU12ZTF6L1NHNUFGT1V1eWtkTEw0elNMakVBMXAzREdVcG9t?=
 =?utf-8?B?eURVYW4vVmZsU1RxVGNWcmw4TElmbys3UGorTWZVV3puV0M4UEJldXhodjc3?=
 =?utf-8?B?NVFHNk1xSU5vOUM3a2RPanlOdTlGL0Q2UUQ1WHRKdHRXWVA3UEFaQlpHOE9m?=
 =?utf-8?B?NGNFZEJvTSs0d1FOcmxlb0J0NkxnZHoraDcwVGUzdnV3TGI2dUhyWm9icUx0?=
 =?utf-8?B?VjljR0U5SXowbzFGaGFXc2pkZzY3NjA2TEkzUDVtemMySi9NWTBmOUVRMVpT?=
 =?utf-8?B?TndtZGpkQzE3dEFTREdtbWpSbTRuSnpWdktVOWhjb0FLNDIyZU55ZnhnM2JS?=
 =?utf-8?B?ZTFCWnNnamw1bTZkL2RLK2ZRWk1mcWlmakNyZ1BFRTBXdis0dG04VkRoOWE0?=
 =?utf-8?B?alFxaGhkVjM2eFVGTnNQU01uaWhsblJGUER6eUVqQXlqd0J0ZUEwaVphWlN6?=
 =?utf-8?B?S09EZ0dPR2xRbnFmbEg5NGhIdEpGdklMN0wzSEMxSXFuWGJ3WXRZdGQrRnN5?=
 =?utf-8?B?N1hmTjVHdmNvdVR4NnhyNmxlSE5FMkUwOEZLZHhQdGxuaEZjeFRuZklxc0Vz?=
 =?utf-8?Q?Q7I9gdn7Wg+I1aK+lCQtgSXXUqciG/J0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVp1aTJmNnVmOFBMaEdxYTVabDRBSHpJQk1qaWMxdlgrSVdneGtWcCtNeTFE?=
 =?utf-8?B?eWE1Y05EUnhLWERyZTgySlJybkppVGZYWStNWm04amhCNDhSbTJaRlU0UXRJ?=
 =?utf-8?B?UWRsZytkdTgrd1RnMTMyWGFGMi8xS2tLWnNtaFdhRm1LMGhNNmptMmx3ejJa?=
 =?utf-8?B?R1h2MFNkZjhHT1J3ZWdRZGFwMk5qa3lwbkdmaUVmeU5reTg3NVUvVEdsODZy?=
 =?utf-8?B?dEJJamN3WWszM3Q4TFltRS9PZEhFVlQyQVpUa2VuZEVuNnMwd21razFaR0l6?=
 =?utf-8?B?Umk0Yll2czJNTEFoMEpnUTNNNGNDc3Q5MGM0SWVPZnU2K09lVUVUNVNCVi9l?=
 =?utf-8?B?Sjh4NW9UNzczclQrQ2dDd2R0WGJ5eUgwd3JMOE1sTGd6NGh6V1lQMXJKL0Zt?=
 =?utf-8?B?OWZrNkJSMDZMQ0EzSmp3c3d2TFA1QmV6elQ2N0tDMnNjTXpSQldsclZVYWJq?=
 =?utf-8?B?UDlmTjZFRVdCbXVkaGZwdFVaVTJPYUVxdnZ6YUZTVGFCSzRqR2gxRURaMitN?=
 =?utf-8?B?d1ZPN3VJdWJGOGlpbEJxVkRteTdaVUlhSy9FOFE1bW9yRWoyM1RQQ1krcjkr?=
 =?utf-8?B?ZHllb1AraFo1UUEvLzlWcDdzR2VSaHhEdk8xUmJTZnZNUTFCc2xrdzBTdnN4?=
 =?utf-8?B?bXBFc29Mb2V0TVBrWmFaMGRydGVzTW5jSE15dG84S0lmSCtkbWJRcnZ1V0kx?=
 =?utf-8?B?V3M4ekRrZm9VTjdvdnlUY3c3QW1WeDdHS3k1VnhEd016YmpTTS9RcitHYjdt?=
 =?utf-8?B?RTczak41bDl3aTZKOUJsTDIwN01aaGtiam5VMDlPYXVzVS85cVhrYmZCbGlZ?=
 =?utf-8?B?dldhYnZndzR3ZTJsdWg2aDIxTWdhczlDWTJzZlBiM3h5OU5od0s1L2lJbEFV?=
 =?utf-8?B?d3p1WS9OZ2lrcmxhUGlkTisvOElyWHhYOTdwQ3VjelM3eGZSdWFTdUxsc0tZ?=
 =?utf-8?B?Z3lEeTVFazFkelBKcVR2V3dNZmovR2o0QjRyQlJBODRvVUtqbHFDRDFEUVIw?=
 =?utf-8?B?SHZ0cVM0Z2svbjJUYllrWFFjY2JXMHdSRHpycVpRdnVZL1VnTnp3UzFXd0dD?=
 =?utf-8?B?R01ZMEI5dzU1SXpobEF0Ny9icGFobkZvWUlWaDVlVTYyNGgyNmNKVC95elhQ?=
 =?utf-8?B?b3FrZEV6Y1dsWk1yVk4xalEzc29kcklRVFJIUmVaVlVmVVBwdVk4UWNITmtq?=
 =?utf-8?B?Z0w0eFdjenNyZjFMUytEbmhnSVpONUt3dGd4cks2M2pyMDdtYmwySGtTbnpR?=
 =?utf-8?B?RHZqNUtEUUFhbURlRURqWC9RUTR3RzBWNUVCaW9ueWhqTVE2LzhLMHpwdDlL?=
 =?utf-8?B?amExdWNpVUZXOUk2Z2ZTbjlPbFphdnlFc29Ya09JMmt3ZjB0ZFVqc1lCL1lX?=
 =?utf-8?B?eDR4RHZnbkNSai82N0wwL09hWE9oNXpiV0RMZ3NQSVEyWG5XUVg1enp4NnV3?=
 =?utf-8?B?TFIrM25mZ3lUVEFDNkpZZ0EycnhlZ1Z2Tm9iT2Y3WXRzZWRCWkhsODRDTFhZ?=
 =?utf-8?B?aGNQYXdPc0hTNy9CcnpiUFJtRVkwbnJ4ak5RNmVVS090OWtyYWxVTHdlN2t5?=
 =?utf-8?B?a2ZoWGZWQjlrZGR4Z3UxcFdYY1dlTXhoYWRIeWNBdjFXN2ZtTjRoeGh0YzNO?=
 =?utf-8?B?bzZ4eVU3UjJqMm4wQXRUVjBVMFVRak5TRnpvUW5VSGI5UE42aHcyNkx4M3pK?=
 =?utf-8?B?NXp3SkVzNGoyM0oyNmJBQXNSeUdJSlFndHUzZGJaUVcvUXIrQzVqRVFwR2NY?=
 =?utf-8?B?c0UyRGFydWd1QUhlRFFIL3VuSXhOYkhKSTB3L2h3dW5QQWJBTXNuZTBhWHZT?=
 =?utf-8?B?dnN0V0NHMXlrM2YwYUhxbllHamRBR2l1ODEvNHkzd24zc1NselBETmZVK1lE?=
 =?utf-8?B?ZTA5cWtLaFlsRFNPSFlJVGV0T3JFa3hRRzN1blQ2UEQ2dE9JUUd2U2dHR0l1?=
 =?utf-8?B?VTJBbktqbG8vQjkzV2xOMGord0xwUkNjZ2ZYa1ZyY0h2eTd2UGRVVjZnallP?=
 =?utf-8?B?SlJCQi84cjdxQnl6TmIxK3Z1Sy9ZTFp5ZlBOMTBPTEFIdnRCakJESzZlZVB6?=
 =?utf-8?B?RTV0S1JsY2dqVlJidWxnbkxUdmhlblNGVHFaVlhvbHZVcDlqU09pS0trakwx?=
 =?utf-8?Q?5ZOOCFuSW6xqCU4dRqo3NbK+i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a916a091-14c2-4a17-4660-08de27594e5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:49:25.5444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KHOSNxCVvG52i/4uPn0PedeqJuPa1p/DMNi64V6bXYsmhvwTw3HAe/ZXz4XZQ25
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7964
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

On 11/19/25 10:34, Pierre-Eric Pelloux-Prayer wrote:
> 
> 
> Le 17/11/2025 à 10:46, Christian König a écrit :
>> On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
>>> This will allow the use of all of them for clear/fill buffer
>>> operations.
>>> Since drm_sched_entity_init requires a scheduler array, we
>>> store schedulers rather than rings. For the few places that need
>>> access to a ring, we can get it from the sched using container_of.
>>>
>>> Since the code is the same for all sdma versions, add a new
>>> helper amdgpu_sdma_set_buffer_funcs_scheds to set buffer_funcs_scheds
>>> based on the number of sdma instances.
>>>
>>> Note: the new sched array is identical to the amdgpu_vm_manager one.
>>> These 2 could be merged.
>>
>> I realized a bit after we discussed it that this isn't true.
>>
>> We need the two arrays separated for a Navi 1x workaround to work correctly.
> 
> Why 2 arrays? AFAICT the only needed thing is for amdgpu_ttm to be aware that it should only use a single sched in this situation.

So it could just use the first entry of the array for TTM and the full array for VM updates.

Good point, I haven't thought about that possibility.

> 
>>
>> Anyway, that doesn't affect reviewing this patch here.
>>
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c |  4 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  8 ++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c       |  4 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 41 +++++++++++++++----
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  3 +-
>>>   drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |  3 +-
>>>   drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |  3 +-
>>>   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |  3 +-
>>>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  6 +--
>>>   drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  6 +--
>>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |  6 +--
>>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  6 +--
>>>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |  3 +-
>>>   drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |  3 +-
>>>   drivers/gpu/drm/amd/amdgpu/si_dma.c           |  3 +-
>>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c      |  3 +-
>>>   17 files changed, 62 insertions(+), 45 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 3fab3dc9f3e4..05c13fb0e6bf 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -1615,6 +1615,8 @@ ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
>>>   ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
>>>   void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
>>>                      const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
>>> +void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
>>> +                     const struct amdgpu_buffer_funcs *buffer_funcs);
>>>     /* atpx handler */
>>>   #if defined(CONFIG_VGA_SWITCHEROO)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
>>> index b59040a8771f..9ea927e07a77 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
>>> @@ -32,12 +32,14 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>>>                       uint64_t saddr, uint64_t daddr, int n, s64 *time_ms)
>>>   {
>>>       ktime_t stime, etime;
>>> +    struct amdgpu_ring *ring;
>>>       struct dma_fence *fence;
>>>       int i, r;
>>>   +    ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>>
>> We have the to_amdgpu_ring() macro for that.
> 
> I'll update the patch, thx.
> 
>>
>>> +
>>>       stime = ktime_get();
>>>       for (i = 0; i < n; i++) {
>>> -        struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>>           r = amdgpu_copy_buffer(ring, &adev->mman.default_entity.base,
>>>                          saddr, daddr, size, NULL, &fence,
>>>                          false, 0);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index b92234d63562..1927d940fbca 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -3303,7 +3303,7 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>>>       if (r)
>>>           goto init_failed;
>>>   -    if (adev->mman.buffer_funcs_ring->sched.ready)
>>> +    if (adev->mman.buffer_funcs_scheds[0]->ready)
>>>           amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>>         /* Don't init kfd if whole hive need to be reset during init */
>>> @@ -4143,7 +4143,7 @@ static int amdgpu_device_ip_resume(struct amdgpu_device *adev)
>>>         r = amdgpu_device_ip_resume_phase2(adev);
>>>   -    if (adev->mman.buffer_funcs_ring->sched.ready)
>>> +    if (adev->mman.buffer_funcs_scheds[0]->ready)
>>
>> We should probably drop that check here and move this into amdgpu_ttm_set_buffer_funcs_status().
> 
> What should amdgpu_ttm_set_buffer_funcs_status() do if ready is false but enable is true? Exit early?

Yes, probably while printing a warning like "Not enabling DMA transfers for in kernel use..." or something like that.

>>
>>>           amdgpu_ttm_set_buffer_funcs_status(adev, true);
>>>         if (r)
>>> @@ -4493,7 +4493,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>>       adev->num_rings = 0;
>>>       RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
>>>       adev->mman.buffer_funcs = NULL;
>>> -    adev->mman.buffer_funcs_ring = NULL;
>>> +    adev->mman.num_buffer_funcs_scheds = 0;
>>>       adev->vm_manager.vm_pte_funcs = NULL;
>>>       adev->vm_manager.vm_pte_num_scheds = 0;
>>>       adev->gmc.gmc_funcs = NULL;
>>> @@ -5965,7 +5965,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
>>>                   if (r)
>>>                       goto out;
>>>   -                if (tmp_adev->mman.buffer_funcs_ring->sched.ready)
>>> +                if (tmp_adev->mman.buffer_funcs_scheds[0]->ready)
>>>                       amdgpu_ttm_set_buffer_funcs_status(tmp_adev, true);
>>>                     r = amdgpu_device_ip_resume_phase3(tmp_adev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>> index 2713dd51ab9a..4433d8620129 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
>>> @@ -651,12 +651,14 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
>>>   void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>>>                     uint32_t vmhub, uint32_t flush_type)
>>>   {
>>> -    struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>> +    struct amdgpu_ring *ring;
>>>       struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
>>>       struct dma_fence *fence;
>>>       struct amdgpu_job *job;
>>>       int r, i;
>>>   +    ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>>> +
>>>       if (!hub->sdma_invalidation_workaround || vmid ||
>>>           !adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
>>>           !ring->sched.ready) {
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index 6c333dba7a35..11fec0fa4c11 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -308,7 +308,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>                         struct dma_resv *resv,
>>>                         struct dma_fence **f)
>>>   {
>>> -    struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>> +    struct amdgpu_ring *ring;
>>>       struct amdgpu_res_cursor src_mm, dst_mm;
>>>       struct dma_fence *fence = NULL;
>>>       int r = 0;
>>> @@ -321,6 +321,8 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
>>>           return -EINVAL;
>>>       }
>>>   +    ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>>> +
>>>       amdgpu_res_first(src->mem, src->offset, size, &src_mm);
>>>       amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
>>>   @@ -1493,6 +1495,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>>>       struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
>>>       struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
>>>       struct amdgpu_res_cursor src_mm;
>>> +    struct amdgpu_ring *ring;
>>>       struct amdgpu_job *job;
>>>       struct dma_fence *fence;
>>>       uint64_t src_addr, dst_addr;
>>> @@ -1530,7 +1533,8 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>>>       amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
>>>                   PAGE_SIZE, 0);
>>>   -    amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
>>> +    ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>>> +    amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>>>       WARN_ON(job->ibs[0].length_dw > num_dw);
>>>         fence = amdgpu_job_submit(job);
>>> @@ -2196,11 +2200,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>>>           return windows;
>>>         if (enable) {
>>> -        struct amdgpu_ring *ring;
>>>           struct drm_gpu_scheduler *sched;
>>>   -        ring = adev->mman.buffer_funcs_ring;
>>> -        sched = &ring->sched;
>>> +        sched = adev->mman.buffer_funcs_scheds[0];
>>>           r = drm_sched_entity_init(&adev->mman.default_entity.base,
>>>                         DRM_SCHED_PRIORITY_KERNEL, &sched,
>>>                         1, NULL);
>>> @@ -2432,7 +2434,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>                   struct dma_fence **fence)
>>>   {
>>>       struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>> -    struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>> +    struct amdgpu_ring *ring;
>>>       struct amdgpu_ttm_buffer_entity *entity;
>>>       struct amdgpu_res_cursor cursor;
>>>       u64 addr;
>>> @@ -2443,6 +2445,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>>         if (!fence)
>>>           return -EINVAL;
>>> +
>>> +    ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>>>       entity = &adev->mman.clear_entities[0];
>>>       *fence = dma_fence_get_stub();
>>>   @@ -2494,9 +2498,9 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>>>                  u64 k_job_id)
>>>   {
>>>       struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>> -    struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
>>>       struct dma_fence *fence = NULL;
>>>       struct amdgpu_res_cursor dst;
>>> +    struct amdgpu_ring *ring;
>>>       int r, e;
>>>         if (!adev->mman.buffer_funcs_enabled) {
>>> @@ -2505,6 +2509,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
>>>           return -EINVAL;
>>>       }
>>>   +    ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
>>> +
>>>       if (entity == NULL) {
>>>           e = atomic_inc_return(&adev->mman.next_clear_entity) %
>>>                         adev->mman.num_clear_entities;
>>> @@ -2579,6 +2585,27 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>>>       return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
>>>   }
>>>   +void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
>>> +                     const struct amdgpu_buffer_funcs *buffer_funcs)
>>> +{
>>> +    struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
>>> +    struct drm_gpu_scheduler *sched;
>>> +    int i;
>>> +
>>> +    adev->mman.buffer_funcs = buffer_funcs;
>>> +
>>> +    for (i = 0; i < adev->sdma.num_instances; i++) {
>>> +        if (adev->sdma.has_page_queue)
>>> +            sched = &adev->sdma.instance[i].page.sched;
>>> +        else
>>> +            sched = &adev->sdma.instance[i].ring.sched;
>>> +        adev->mman.buffer_funcs_scheds[i] = sched;
>>> +    }
>>> +
>>> +    adev->mman.num_buffer_funcs_scheds = hub->sdma_invalidation_workaround ?
>>> +        1 : adev->sdma.num_instances;
>>> +}
>>> +
>>
>> Probably better to make all SDMA version switch to use amdgpu_sdma_set_buffer_funcs_scheds() one patch and then changing amdgpu_sdma_set_buffer_funcs_scheds() to use more than one DMA engine a second patch.
> 
> I'm not sure it's useful: this patch simply creates an array of scheduler, but every user of this array only use the first sched.
> Enabling multiple schedulers usage is done in the "drm/amdgpu: give ttm entities access to all the sdma scheds" patch.

Oh, good point as well. Yeah than in that case please go ahead with what you have currently.

Thanks,
Christian.

> 
> Pierre-Eric

