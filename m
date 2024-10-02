Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F6498D71D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 15:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F81E10E086;
	Wed,  2 Oct 2024 13:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="joPC/7v5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EB410E086;
 Wed,  2 Oct 2024 13:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wpxTdUtuJXylW+tH1ulRoo8rV6VyJb2ZDJRYxjw/NlGwI2O8IlBJITYvFraCl1Mh+BNNWzQUdiSu9UwEzSNwxuyoPZPXF3ROHC1Vsz3ARyRTZi82cweKO7vONz36q9RWTqAY1BnrHy+XN5B7lMqYzPVdAvL9bBviMRFiMUSdW8SZyN2xjA4InKw4lMqJ3Xex5RID2QgCu3lPCXF3HP908s3ZIctswKt5S0IiRLcayKWM7RipYnIdOuPJ1DMrLadzhT9EHiQhvEwlE0grU8SBy882nrEHIwpl2p5gqjQDh1Cdf+ElC4qL8ra2vxKCT5hEaDZPsHlc/3qcm/rJ7wNAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2DPsGcdAcV9H+owYaEqbH+dcNAzsMhwesUYwLoz340=;
 b=sRyhPw54m49sXtGOvpvnR+ZDm3jOKNsFKnX+MFwry5ZentSBjuPg46iXmojBNQf14NBbVzWWc8ochGRR+kv0P7wsE5OgpKq31CU0jeIKN2Fcxcze1B6D07K5f5FHxWYvbIXEq06M0Pnwngu8uxfeSyT2X3/xkkUr8lfHAFEJCz2UI93IiC4gtUZAqnWnuUz4lXMMwvSEJfAl6gqy/KDvqVGIx5jebjwuGP2erDqNPKc9GKEwwClYAhkur/Ws2+sspdYtsJLaKImLGSO1Jhd5vVFG5OZHYq2okdrGBwAogwP3tX0AohPkP0oExiH517nS7TtmMBmP7oZ/etx7XFZAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2DPsGcdAcV9H+owYaEqbH+dcNAzsMhwesUYwLoz340=;
 b=joPC/7v5rh42u5eLL0TcEIM5nvwEc9TmtXlCbylRakNOrX3bmDAj7gaDlbZ/Ka7MWMz1w87VY3irUXhTDgj3XdSWatxMSmQ1snNGAtJgCIxwV/3yJ1chGDQKPEuN3UAlxhks2YAofc86ALopX9iILhpe1qm6jeC908+I8oM7G6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8320.namprd12.prod.outlook.com (2603:10b6:8:f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Wed, 2 Oct
 2024 13:46:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 13:46:38 +0000
Message-ID: <91d734a4-af1c-4506-98fc-cd1bad0857a4@amd.com>
Date: Wed, 2 Oct 2024 15:46:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/ttm: Add a device flag to propagate -ENOSPC on
 OOM
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zack Rusin <zack.rusin@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Sui Jingfeng <suijingfeng@loongson.cn>
References: <20241002122422.287276-1-thomas.hellstrom@linux.intel.com>
 <20241002122422.287276-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241002122422.287276-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: f4af38f4-b863-48a7-dfb8-08dce2e8a33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0dnRnFBM2ozUU5Jd2FCenVNRldad1Rab2U4cG9ScERJQ3BOV1pSZFQzWUM3?=
 =?utf-8?B?eTc5U2VibDMraytEVVhaekZxQ2FNcjdRdzR5RytDclE2RXFZbzdoeERZVVlN?=
 =?utf-8?B?b1VmdHRwV0hWc09ZRkhnNndzNlE4aTNhWE9odWRhdjl1K2hiMTZsZXhUdzVt?=
 =?utf-8?B?d0tOSEZwaElPNjh5RjlseG1nb1FtMmNrR2hOOW5BckNXNVJZUHpWVnpQQ1pP?=
 =?utf-8?B?Q1FVU3Izc3ZNRkZIMkxxRkpxSVJZbDdrTjZ6eWNiWHZEdnFvNjB2SHVndjdy?=
 =?utf-8?B?ekF1bFNZM3JyL3RMTS85YmlGZVowcVdJdC8wMlFYaFRSdGtqNFJxa1VjeUxH?=
 =?utf-8?B?eUh2MHU1ZmxnVzJuaW11bS9FZSs3WkYxMkZDYm5kQU1RcnQ1ODFiUTFOY2dZ?=
 =?utf-8?B?K1RwRkVpL3EyQnBUSUVnWENBa0dmQTVMazZOb2NEaUVmbS96enlFOWxycTdH?=
 =?utf-8?B?ZENUb3hSdDlSK2R3VDF5SDQxd0xjVVFlQ3dEQm9EWEpSTnZlVlQybTZQTkIr?=
 =?utf-8?B?WlQzMkxaNVhNcWxYZlRjVTZVbzBySzdZN2dlaVRqam9SY0VhUG50RkV1eDlH?=
 =?utf-8?B?dGFvZEV1VDNhY2p3OExJRDIvdWVoUHBEVVZUaFVaZDQ5QWJoSXpMV1dvcmhU?=
 =?utf-8?B?L2szajZiWnIrUytqYTZ0eGhidlpmWWpmT3JKOHliQUs1aXJ2MVdmZkhlbi9W?=
 =?utf-8?B?NnRKZWsvMWo4YXFyMWg1QncySTBzeDRLd2t1MlZMdmNOcUJMMDhwSm9PVDFk?=
 =?utf-8?B?YlY1Rk5ONDlPNFk2ZFYwdDQ4eEQ5SXJYS1NuSXc3bVRZeWlsazV5TC8yeEZa?=
 =?utf-8?B?Yk5NNHJYaXhsd3l0QnB1c3lzdVhPWSt4bVJHbkJoZFErcis0U1dMZVh2UUdT?=
 =?utf-8?B?eFB5YjF2Rks3YVNSWlZPbm1KeCtKVW1lc2FOMVl1M1o4SHlOdm5SQnVwcm1j?=
 =?utf-8?B?SVR0RCtEU1VWY0c2dURJZ0w5QmZ1VDA2aUczL25uemFlWW83MFNmenR5VE1h?=
 =?utf-8?B?RTdTL0RZNG95U0w1MDN1OWVvazFMQ1BZTUxBT2dCdzA2eDdrQm5BQjVML3Yr?=
 =?utf-8?B?cUpyNVBSNXlVY1JTU0trZy9yL0cyY09HZWo0YnJ4SkJyUkNpMVluOTdvTUZn?=
 =?utf-8?B?Zno4MStMcFNUVVFRZkVQelJqajlKZDRuOURTWVNmT0k0Q0JCTU1SZ1JDdWtT?=
 =?utf-8?B?SXdJY2Rac1Yvb2lvMGgraXY3ek1WRW43aEtzTkNzSnJteEdud3pMc3YzYm9M?=
 =?utf-8?B?SXZVc0pyVnkwWjhrOW9XMEtqWlk3dkMrZW5GTHZkaUozRnY4ZGZjUGdLVE12?=
 =?utf-8?B?ZUJ3OEpENXphcU0vYjNnK2QvWDZDb2NLOHMwSndYeFhIUVJjS0s1ZFVFMGps?=
 =?utf-8?B?VW82eXNhbVZmSW8vRzRXSkJESzdjM0dCUWpaenhyWENNS25UeEdCWENwdXVt?=
 =?utf-8?B?WlNvSGZMYVhSOExaejdiMlJKc2k2b0NKTXN1cVBDenp1ZkxnWkhaMmwyRysr?=
 =?utf-8?B?UVFnVWFPYnZxWlRDRXhCMVR1YTJsSE8xcVdSSHdoMWxDLzJYeXNkeS9OVzYw?=
 =?utf-8?B?dTB4TVpWRkxDZ0N4WFZ6YWlhTTRrbit2aVZiV25TeVdVQ3ZVOGNtVkZHQ2hY?=
 =?utf-8?B?cVE1bWxNS283ekc4YXk1NzluRllZOWwwL3o0NW1oc3VhVWxkaXc3RWhBSW80?=
 =?utf-8?B?c3ljRXBOWGp5VmJBeDg0MWJIY0hvYnB2dzJsS2lSUFE5ZlB1QlFaSVdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXM5OVp4dWdwUXEzM1ZXVGhLK0R6Z0E5Q1BaOWk1aFRqUlR3TW5xaWN3WktD?=
 =?utf-8?B?Z0o0ZC80Nm1LUzRvRitoU09NTkZJQjhhME92Szg5THlTRExrK2Jjcis2Tit2?=
 =?utf-8?B?ZEJzN0NYWTBlMnV3UGtHczBZa0NsQkxUMDFxZElKeDd4T0Z5T0VJNXNKSFhW?=
 =?utf-8?B?OXRkTWNtQnJ4WkhEZHJMNW5MRFk2c3R4a2RTSFkrSitxVGcwUE9RVm12UzI2?=
 =?utf-8?B?bnpseE1NLzZPbFc2aC82eTFhZjJCVVFrTXUxOWdCNTB2S0dsMnczVzFENWZw?=
 =?utf-8?B?VG53RUtiY3R1UHFQaitZUi9ZUkwvcnd6Ylg2ZDBmNDlqa2k5Q0ZWSTI4dklF?=
 =?utf-8?B?T3ZxWnBLQ3lMZEJsQU5Jc05VNVRqeEpBSDFuRTJGS2FYaUJXKzRzbVIwc0M1?=
 =?utf-8?B?eVRwam9vT1NONXRybEFiZTRwQUtCZEpCbmpPUjh5YXNmOFlncUR5Q21Ic1dr?=
 =?utf-8?B?SEx5QldPTDl0Z2hXbTArOVRaYjRSRFZCeUxQKzZtZVR2WmhtYXprMVdyR09x?=
 =?utf-8?B?d29GN0gvSFBsNEVBNXBBVjhudU9rQzBrUWRuaURJVENGM2FMdndzUlBDYTkr?=
 =?utf-8?B?NUU3OFdWUG5td3dRQzc5S01hOTc5eVdqdTdDOGd0ajE4a1pieHhxUTdSVk41?=
 =?utf-8?B?dWtKQUJxUGFRZVlKUTRxRUNIems1cUk5WmIwT1VlckMwaHJJSWF3cEhJaGp6?=
 =?utf-8?B?c3NMMExSbnZvMHFuMEJ6eWdDOHVXQmpxZ0dEaWt5QytDTTlpSXNHMHZLNGx0?=
 =?utf-8?B?YmlicDVjVlRQWXFDNk5rakIwUXQ2S0l1OU9jZ2tjOTZvNjFxb2x6U1J0bWpU?=
 =?utf-8?B?aHZVdDJ6L0VtVDBhUUZDelBHZWVMYzlTRU00SGdYTno0TW82WGdXT1NWSXV0?=
 =?utf-8?B?aVlaeGlCSVJNdVc5bDUzYTZ3UThhNk8xVGdjRXcvWnVFblhvbGNKT1ExSHVO?=
 =?utf-8?B?WXl6VUw5TnpLa1NjOEJwN1V6aEloSmgwQnpiZ0FrNlFOamhiZ1h2L0NaZjJJ?=
 =?utf-8?B?aWNyMkxxcWMvTFBjTG96bzRjOHNhcFZYMEpNS1JscWxZdFlUMlJodDNRNVkr?=
 =?utf-8?B?cTAvZnV4RStQYzJGc3NlUFp3UTlNZ0xLWjNBRmJWWkpyUFRUT0tWL2l5QmVY?=
 =?utf-8?B?Sy8rLzZ4eEJ6SjhxYU5tci9adlRtVmFQaStVV0pQbXhVa3NBa0RkcSsxK0cx?=
 =?utf-8?B?YzZFbEo4YngydU5DU0MvUjRVY0M2WHlySTBMQ2hVdm9xVUQrU2RxcFBvMzY0?=
 =?utf-8?B?aXYyMDhFOFc0QU55cFJHaER0aDJxbW92aFUxMDFhTVBIMnFBcWEwdEZnbkht?=
 =?utf-8?B?NUZaS0xDTDdUNG5jUTVtNThqSVhuTmlLL1Q5cFdlMVZiSi96UEdyUDJiQU42?=
 =?utf-8?B?MEtIa0tRb2ZkU1ZGOGcxNExKcUFCMWtXZFdzRmdRK0Y1dFJtZnJpb20xakl0?=
 =?utf-8?B?ODRwT2cyd1Q5aXgrYTdNdXdkQnljK2tiWWxTT09pZGRzenlFdXFWbThwcmFG?=
 =?utf-8?B?eWlMUWx4dm9TZDFHZjE0bzJPNGEvSDA1bEh3MXZvU1Q3eGZjNHB5b3Z0dC8x?=
 =?utf-8?B?TnpqZW03VlRKOWt3MUZlWCtSNUpGbjRXYWZDTENyeGpudm1CRENFM1ZCbSsz?=
 =?utf-8?B?L2MzTlRTMXZ0dFBRcWJuMGNmMnJmSjVlNFptM2tWbDExdGtOYmFDSTVPc1p2?=
 =?utf-8?B?QWNVTzlDNnV0aEF5NE1VQjBnQ3hBK3BJREJPbGJqd1N5UkZIYmRyTlMyR0Zv?=
 =?utf-8?B?cE16WDVWd2N3Vk56TWllTkdVSVBmVzVTNmJ6SnM3c0tKY0pZeExQa3FJU3Zn?=
 =?utf-8?B?TWZnSS9sZjZWNEF2bWdYSy9jSVFqelltQmRvZVYwVXhaSGxYemVFZWp5NWRC?=
 =?utf-8?B?d3BwVzlMdzMyLzlqZ0tjQ1pUQldzRERJNnFWUjhFalBxZTZnZ1dheXZxNkpw?=
 =?utf-8?B?cUxKWjRvZnhHYkIvbVcvcllNbncxTlpIb2NRU3d3MGNsWGtKSEV6VGJoRFF3?=
 =?utf-8?B?c0xvQ2ZWWnVHWmJXR1hWSFRRZ0pFQUM5RVVYUC9kVGhUb3d5WTB0S1F6Y3lr?=
 =?utf-8?B?dFN5VmtvTU1SaWhvNjBpV2JzU0tMaWVQdkxjR3dzM1ZleVZaNlE2VXNueXRP?=
 =?utf-8?Q?KND1DzIplc9epKPZudLmGHSL0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4af38f4-b863-48a7-dfb8-08dce2e8a33c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 13:46:38.1157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjfE3aHcs22JWT9tQV16C482MI5bL/Yh9ZSPvMX6ZHcoJvMxbu1rV4TmCQhzrszs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8320
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

Am 02.10.24 um 14:24 schrieb Thomas Hellström:
> Some graphics APIs differentiate between out-of-graphics-memory and
> out-of-host-memory (system memory). Add a device init flag to
> have -ENOSPC propagated from the resource managers instead of being
> converted to -ENOMEM, to aid driver stacks in determining what
> error code to return or whether corrective action can be taken at
> the driver level.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Independent of how we communicate flags to the TTM device init function 
this looks like the right approach to me.

So feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c     |  2 +-
>   drivers/gpu/drm/ttm/ttm_device.c |  1 +
>   include/drm/ttm/ttm_device.h     | 13 +++++++++++++
>   3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 320592435252..c4bec2ad301b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -835,7 +835,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>   
>   	/* For backward compatibility with userspace */
>   	if (ret == -ENOSPC)
> -		return -ENOMEM;
> +		return bo->bdev->propagate_enospc ? ret : -ENOMEM;
>   
>   	/*
>   	 * We might need to add a TTM.
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 0c85d10e5e0b..aee9d52d745b 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -203,6 +203,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   	}
>   
>   	bdev->funcs = funcs;
> +	bdev->propagate_enospc = flags.propagate_enospc;
>   
>   	ttm_sys_man_init(bdev);
>   
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 1534bd946c78..f9da78bbd925 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -266,6 +266,13 @@ struct ttm_device {
>   	 * @wq: Work queue structure for the delayed delete workqueue.
>   	 */
>   	struct workqueue_struct *wq;
> +
> +	/**
> +	 * @propagate_enospc: Whether -ENOSPC should be propagated to the caller after
> +	 * graphics memory allocation failure. If false, this will be converted to
> +	 * -ENOMEM, which is the default behaviour.
> +	 */
> +	bool propagate_enospc;
>   };
>   
>   int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
> @@ -295,6 +302,12 @@ struct ttm_device_init_flags {
>   	u32 use_dma_alloc : 1;
>   	/** @use_dma32: If we should use GFP_DMA32 for device memory allocations. */
>   	u32 use_dma32 : 1;
> +	/**
> +	 * @propagate_enospc: Whether -ENOSPC should be propagated to the caller after
> +	 * graphics memory allocation failure. If false, this will be converted to
> +	 * -ENOMEM, which is the default behaviour.
> +	 */
> +	u32 propagate_enospc : 1;
>   };
>   
>   int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,

