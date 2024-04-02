Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3407C89523A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 13:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D47510FC97;
	Tue,  2 Apr 2024 11:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KdHw54ie";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2112.outbound.protection.outlook.com [40.107.92.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EDE10FC96;
 Tue,  2 Apr 2024 11:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msPEY5/f1PD8FDM+7wFLziuHsIVbeTZbZW9ss72vB2OOUYnD51gBtPjtgNuwj8BvpWXJdM8V0NKfwze95PnjFjWxEo3+MeAkVoepHl23S6fSGKE22D7TZnvMXkS3owsSiwTtXaNFITumqCDjDEIfIZDnBubUPT/maUpjbaKpe4EjywN9z3cDg/Clp6x2dS9gvVjLHxUGCs92tBcnDLrxiw8+/nNd764+GNuBnP9HdW+PmGEo1iBZYA/XWEZsjF+aSzxGRB2GqCy2zluCAVrSKj9U/OTlFdVZ7Ec0eKtYF9lmZ015rtpUuNweIRaTbKgXXCq4LbP+nmz4BCa0fVlMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDIMk7uMguR7UhALQz5r6yWEAhhq8QKR4Kcmr9YyFlw=;
 b=FpmFOFG94aT7aGu860OkgvgXGOMzlIPy4f7YXOigJuKJikLEl+6AcEC6F5J71aYwld/8T4goX2QwL5RIsHSRlVd8uAlh//5IBxVclG54Y97UwU15qC88hGYyqWb2x/5DL5oiITcWDBXXUYBjkoiPL5vHhoh6qeBEqmZIFZevNfc+BHpVNYE6M4M/Qsgi6rRnNYwZPU1ztBlynP9YjWKVajyTnLLmItse9GGH0hUsio2nIMDe97q62dvAY3QDCPbYLg1ocL1lItYPGLvMw0OGf5k0L8uHcIIaHryEg2Du4A4o7ljUtaIWlaLIAT38FYq3vCcb9cnWiXTJbsCbDLdw/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDIMk7uMguR7UhALQz5r6yWEAhhq8QKR4Kcmr9YyFlw=;
 b=KdHw54ieoiqoyRN3wPdtGxdQAF85dw7LfaoG9pOEuHL483iWeGP6r6Oj4LqLxEq5REv89/CFEGFKJNsNhUhr12e5w2iWkmL8jWjsi08pxGiXvMZVyf82vsVIDf32f8rscDsYoHTNG5TCRli3X2Dm/1ntM5pbvXfB48mctROK61U=
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by DS0PR12MB7702.namprd12.prod.outlook.com (2603:10b6:8:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 11:55:58 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 11:55:58 +0000
Message-ID: <8dcfeda5-fa95-39c5-6264-248941934ee6@amd.com>
Date: Tue, 2 Apr 2024 17:25:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 0/8] TTM shrinker helpers and xe buffer object shrinker
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::12) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|DS0PR12MB7702:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NobJOunqLWlzDafyMNFUhZaM8NMInwyRwmSZZxcdD75ZSWr65GJmyfGOoOuE8oqk+F3+Na/hTLAHPHxMzce+QDMCO3Umbcy3qRNDlbWmigrtJQTVVFE+R6k21Eha82KnW5NjEtfobOehphOXlZZwut72/kI0CxttMtA+CweV7WU8TOXaKmfkHfAqoIqSN8tyTiVgpJV9xe2rKBblQSbB5hPo53bNuFjkxKbol22iiCgOMk+3fzyRilCw3cW+G5wsZRNAc7lxXt9wzX6YgnCBJ3wIj/f4Hmz/y8OVrKE43WgHWGsBt9sfKOKKOdBvV97D6WEoqROkdFgU+pa3PuMONz8dL1CxFZpQehbilBGNIqaM3wW6rjsIqHXM/o01Yv2wfdonxFscGnjhKIi+RupSC7awhLbsYdglbGOB1ijhaXsng6ErI7RvMRCNbsLuncLqzqBM9BTdhdBHcYQUtpadjOBC07vwY7agqi9oNfr/v+q4oayn4l6LWpPTM061pOcCgoRbtyEIw0Is6EzCugcc7bPFfd+PVupwYmLc3TqvdSMsAHN6uY7+e4oQUChS/1NBIJMx38UYEhy00psFhE21LU+Be1tM5krkUSJ7FNpNcYx34N0aV/BWwzq7jctYy2AI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzBPalBBMkEvSC95LzliQ0M0NG56VTJvT1BZUzR2aVMzd2J3bUl1NjNqMklv?=
 =?utf-8?B?M0F3WFVUdG5OeXFHNktKZTQ0cmZ4YXZqbWRLdVVkaEVBeUF3aTdKd1ZJVUFq?=
 =?utf-8?B?Nm10VWMxRVliRHFFRStXaFBacUJVbFBTRWxtTHhtWUtyelJaT0dMQkNLSEtl?=
 =?utf-8?B?NkhETUMyZHNJTHJOSVd3cm55VnM3WHJnRXlXTTF1RUlndUh3eU9HSE4rYXhh?=
 =?utf-8?B?a000VEpxOGNmQ1EzbHRDV3liSlhNdGh1WXNkb2E2VU5WbEs3VTRGajhYbUFx?=
 =?utf-8?B?SnNtM3JIVWV0Q3FZQzJFNlU3by9OTDRxSEZIcTRRYnc1L0xxZWRmanU4NWgv?=
 =?utf-8?B?blluOURWbXY3R3crN0F6ajVLeTdCQy8xeGIwSWh1QXo3dVhaVHNxdmJIOFFX?=
 =?utf-8?B?VDBpbFNwRDVrM0JzL3Q4MUFIS0pZOGZRclVhRkdkL0RFemFxcDZ2ZERuUXZS?=
 =?utf-8?B?aFdVVFE5UFRkOU14ZnM3TjlUM0lTdXRXVlh5MEUwcklXcDVleDczYmt3Z09z?=
 =?utf-8?B?dm1DblhCZTIzVVMxa2o0ZnEzeVhnRXhMK3A1aXZ4TzROdDB6dXVaTzhmdHRx?=
 =?utf-8?B?NEFjVmdmajdhK0tzYk51U2R2T0hkNkVqanhCb1hsZFdSY1EvRHRaTmVQYWp2?=
 =?utf-8?B?YndBckNpWkYrbVBrME1QZ1pkajZuQjh6ODYrSGhNZjd6dDA1dDZWNG45WDYy?=
 =?utf-8?B?dUhwWWVsSEYxczBHZmFiRmdlYmtTNkI5dUNJM3cyRFRqMytkK2l2Y2xrb2Qx?=
 =?utf-8?B?QXFXL1NYRTZsZ1lJMzQwZXF4SUM5dDZKU28wZk5NUVNFRk1aaXdMNVhOOVEr?=
 =?utf-8?B?VjZjbG5TYVBwbktCVkxFb1FNTC80YUF0TE1yL2RFUWlRWThPOVRHZTlmYXNU?=
 =?utf-8?B?aWdNMEV6OUIvRmhDaktnL2tpZ24xb3VXTkRwd1VCQXpxN0ttWDlsNnhWdXc0?=
 =?utf-8?B?NmtxY0pEQjkxNHVzUm9rUnJ0QkZNNVdNaEJORHd4UVlUY2RGTGxFMzVCWW1R?=
 =?utf-8?B?T094V0dmSlFkaDFHOWhKZGJhVlMrR0w5bjJWQXl3SmVTalcrSUZteGZPeDJu?=
 =?utf-8?B?dWZZaC9IUldRODFnL1Y2bWVVT0hMM0wxZXdaVnBoaXExWGhqS2VuR1FNWlJk?=
 =?utf-8?B?ZDRmeTNxNDFFbWd0d2t1cDRKQTUxN2RFLzcwOFVZWEpSS1V0WmtXZHloTkZo?=
 =?utf-8?B?U1M1SEI2RDlYOS9pQXM5R3ZROUVNalBFSHpwbXVqdGk4WEMwZnRweVROa1Yv?=
 =?utf-8?B?WW11QjF1c0gzbDl4azdLYlN2T2xKSjVWTFA5WlZPb0gzS3VxcDY0M1h5NGNE?=
 =?utf-8?B?TU5qdzRYR01WQVZpczNSUzk4V2lVRzdhR2lsYTIrY2hkVysxM1hhMzlGYmRG?=
 =?utf-8?B?Y21tYXNuYVV3VHRnVmFseHAzYjl5UVpJRkQ2Z0hlUUtxRkNMWVdBTFFmeXAr?=
 =?utf-8?B?Y0FwRFROQk9jWGxVYUdXMjFWYkdZd1lMZ2VZdDcyT24xelNRU3pmdm01NWln?=
 =?utf-8?B?bTVmeE1ZZnhMUndPb2RtNXowVERqbGtsRE82bHhCNitDVHRPMW15RjliS1FO?=
 =?utf-8?B?SmxwamRQYTVGNWpRVHQ2YzgvZ3haMGQ2Qkh5RkY1WEt0MVRpcHFWb2dSdmlx?=
 =?utf-8?B?TGdaOGF4S2RoRGlGeExNK2RZdmtGVHdrOUF1cU5tN3R4c1FtRnVQSGEyeVBy?=
 =?utf-8?B?aUY1TE0rajd3Q1pDWGFmeXhJSXlhNks3RFdUTEdXL0luM3pkRUd0a1BSYTRQ?=
 =?utf-8?B?bWNyUE9tMXM0V2w4VFU3d1hvZTFIdFl6Z1NIU3NkS213SVdGZnJOb3VRQVRl?=
 =?utf-8?B?b1VpTnRTMjFYQTBUZGNSNFZLZTV5emwzV09wZWxtK05YV2lhZk1QNlZYbEJ6?=
 =?utf-8?B?L1lYT3c0K0c1ZE1HbzZRZkViSGJlUXZLVkxiRmZDbmplVkp4anVsN3JOMkx4?=
 =?utf-8?B?VjB1RGxIT25qaGRmUUVBZFlDU1ZacURDT1doZmh2U3pNNTBaTm1ISWFiT0ZP?=
 =?utf-8?B?bzkySUJZOS82cGJmSHUyczE0Qm5taXpRUVBlMTE0TzBtSXVZbGdaYVEwV3ly?=
 =?utf-8?B?U3gyL2cxVDBhRnJBR2RxcVB6YkFlTXVBaWlzcmZCeU9EdzdBWkpNWjdiRklp?=
 =?utf-8?Q?mCr0+A1o4c/C/P+V2DogfZUiA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15b0ec3-7fc4-4987-c910-08dc530bdbc8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 11:55:58.0557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Lhvj7PdjkyaD8Fp6XC/dbEaoLy45wpqFFyozOGnlo7Oi3g4b5PuY/gWVHM2u/YHbeYLfyhdEcxRF+Et48LDDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7702
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


On 3/29/2024 8:26 PM, Thomas Hellström wrote:
> This series implements TTM shrinker / eviction helpers and an xe bo
> shrinker. It builds on two previous series. First
>
> https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg484425.html
>
> for patch 1-4, which IMO still could be reviewed and pushed as a
> separate series.
>
> Second the previous TTM shrinker series 
On the latest drm-misc good amount of conflicts on both patch series, 
able to re-base first one, Second on has 16 patches.
If you have latest re-base patches, Please share it.

Regards,
S.Amarnath
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/
>
> Where the comment about layering
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
>
> now addressed, and this version also implements shmem objects for backup
> rather than direct swap-cache insertions, which was used in the previuos
> series. It turns out that with per-page backup / shrinking, shmem objects
> appears to work just as well as direct swap-cache insertions with the
> added benefit that was introduced in the previous TTM shrinker series to
> avoid running out of swap entries isn't really needed.
>
> In any case, patch 1-4 are better described in their separate series.
> (RFC is removed for those).
>
> Patch 5 could in theory be skipped but introduces a possibility to easily
> add or test multiple backup backends, like the direct swap-cache
> insertion or even files into fast dedicated nvme storage for for example.
>
> Patch 6 introduces helpers in the ttm_pool code for page-by-page shrinking
> and recovery. It avoids having to temporarily allocate a huge amount of
> memory to be able to shrink a buffer object. It also introduces the
> possibility to immediately write-back pages if needed, since that tends
> to be a bit delayed when left to kswapd.
>
> Patch 7 introduces a LRU walk helper for eviction and shrinking. It's
> currently xe-only but not xe-specific and can easily be moved to TTM when
> used by more than one driver or when eviction is implemented using it.
>
> Patch 8 introduces a helper callback for shrinking (Also ready to be
> moved to TTM) and an xe-specific shrinker implementation.
>
> Testing:
> ATM I don't think we have good tests to cover the shrinking functionality
> The series has been tested with a hack that continously creates
> TTM_TT buffer objects until system memory and swap space is exhausted,
> and then reads them back and frees them. However, these tests
> seem to be very slow.
> Ideally a similar test on a machine with very fast solid state or
> similar storage should be set up. Ideally also verifying content
> preservation.
>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
>
> Thomas Hellström (8):
>    drm/ttm: Allow TTM LRU list nodes of different types
>    drm/ttm: Use LRU hitches
>    drm/ttm, drm/amdgpu, drm/xe: Consider hitch moves within bulk sublist
>      moves
>    drm/ttm: Allow continued swapout after -ENOSPC falure
>    drm/ttm: Add a virtual base class for graphics memory backup
>    drm/ttm/pool: Provide a helper to shrink pages.
>    drm/xe, drm/ttm: Provide a generic LRU walker helper
>    drm/xe: Add a shrinker for xe bos
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |   4 +
>   drivers/gpu/drm/ttm/Makefile           |   2 +-
>   drivers/gpu/drm/ttm/ttm_backup_shmem.c | 137 +++++++++
>   drivers/gpu/drm/ttm/ttm_bo.c           |   1 +
>   drivers/gpu/drm/ttm/ttm_device.c       |  33 ++-
>   drivers/gpu/drm/ttm/ttm_pool.c         | 391 ++++++++++++++++++++++++-
>   drivers/gpu/drm/ttm/ttm_resource.c     | 231 ++++++++++++---
>   drivers/gpu/drm/ttm/ttm_tt.c           |  34 +++
>   drivers/gpu/drm/xe/Makefile            |   2 +
>   drivers/gpu/drm/xe/xe_bo.c             | 123 ++++++--
>   drivers/gpu/drm/xe/xe_bo.h             |   3 +
>   drivers/gpu/drm/xe/xe_device.c         |   8 +
>   drivers/gpu/drm/xe/xe_device_types.h   |   2 +
>   drivers/gpu/drm/xe/xe_shrinker.c       | 237 +++++++++++++++
>   drivers/gpu/drm/xe/xe_shrinker.h       |  18 ++
>   drivers/gpu/drm/xe/xe_ttm_helpers.c    | 224 ++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_helpers.h    |  63 ++++
>   drivers/gpu/drm/xe/xe_vm.c             |   4 +
>   include/drm/ttm/ttm_backup.h           | 136 +++++++++
>   include/drm/ttm/ttm_device.h           |   2 +
>   include/drm/ttm/ttm_pool.h             |   4 +
>   include/drm/ttm/ttm_resource.h         |  96 +++++-
>   include/drm/ttm/ttm_tt.h               |  19 ++
>   23 files changed, 1683 insertions(+), 91 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
>   create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
>   create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
>   create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ttm_helpers.h
>   create mode 100644 include/drm/ttm/ttm_backup.h
>
