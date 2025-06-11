Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1A1AD5477
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521CD10E639;
	Wed, 11 Jun 2025 11:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VlMGPn3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C59010E2D0;
 Wed, 11 Jun 2025 11:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRGrL2/EwPZAtM3Q9iK2nP665TmjmZjFL56+65j4IvCSLH8YumZ9Mf+J21rpVmY1U2Fumbb+B/jRbPEkercoTupr7roZ3OVHQyPbFN3ypDLsBdnDbrn0eitLx5MIdzoJtABk2p//wrHo7zOB0S9JJecmvtxD+LJ/Me2L+pbqnJ//Us+/pEx/XO/46RzK33eGcRHcoezbPCskc1D2nG7ZV8F4dOUFP451YVE+Nn1R3zqWdbl1otWpG0Y7s1BLhk4H9gX12L8qnSQ0rw2IO8LAJk9WrguRLfWx/GGB8KjP7HIlEpr99OOYOikcBnUsE2rXYEgBo1I97U8QK1JRnkHXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfdWa3eStW0e+2P6HrFzP7p6CV8XGk/iPjVg0XYBw7U=;
 b=vqn0wXwgnACii1Si2OoP6Jc0zbt8MVSdTpHsF9btIZQTbHEoCb9vbsKvjuOG81uNFAbWCjNnWLOM4gPNtQ9mK//LULrY+hXd7xGul2DPYeSpbU/qgMk6r94Sp/YGnfE6F2+/wAb1AgsyugjVTHVhLSNKEcRzrHZwXJYkAyoUqpVDGAKgppj5lFja0Au8uNPg+oe7rCsL80WTBcorzjorbEe/ahBl+Xs5znCXi1batsU9kDvpIuqZx3nnxb3+C0sr1cJh3Tu1ISmWM6m66+ERouCdRhW1ETfXaPN/9RH4qC4hYznRD8na7Z+4PwFAP3OTRn26yy6/+Hcmhn/9tmOUAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfdWa3eStW0e+2P6HrFzP7p6CV8XGk/iPjVg0XYBw7U=;
 b=VlMGPn3FrmKJWoo3Y0vp/278pVCfxkKUQhg1MweEiDTChsB+c0nLS7SOwvNDrNULK0d3FfTgXFV9Kz7Hr7s8dx2qgooXrmmiI45SMoAo/g1PsZyAFBkDbUCHyOSXaNXqIyxxHD4Pt+jKvN8WGNrsoqWsk77ZeuOZwuk1hHReJ3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.39; Wed, 11 Jun
 2025 11:47:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 11 Jun 2025
 11:47:22 +0000
Message-ID: <c88cee5b-d7b0-401c-85b7-1aea3d6ad231@amd.com>
Date: Wed, 11 Jun 2025 13:47:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] sync_file: Protect access to driver and timeline
 name
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250610164226.10817-1-tvrtko.ursulin@igalia.com>
 <20250610164226.10817-2-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250610164226.10817-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:208:52f::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f03d7bc-1841-4d57-8760-08dda8ddba11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjlWTGI4bTdyV3lOQ0JNbHV1WjBsTlFqTlc1Q2FwTjlIYkRjdUs0c2V5d2g4?=
 =?utf-8?B?TVRaTzF6aDlNeFVQNjNJdE9MRWlWa0xaM1UwcUt0R2gvbGRaUnZvam9aTFlj?=
 =?utf-8?B?bDRzZTF3eElzTWM3cmg4NTJZN2wybG52ZkRhSnZFaGFycTZpMzZnMHA2Umsv?=
 =?utf-8?B?OFpJTjlIWkRBZVZQd2I1ZjBlckZlNnBrSm45QXN0aCtJZFhkSGd1Y09pSjRS?=
 =?utf-8?B?cW5zNFJGQW05VFlnRmJzdTlmK0ZFSUVmd0RGcDRZM2Jwd09UbDdoVmtvM0xK?=
 =?utf-8?B?Q2VkeURya2ZCbk1ucS9FQ1ZMdHNvei9kQ0pVTld3UVF0RzZPeW5ic2Z3WWJQ?=
 =?utf-8?B?RjQydHRjbStSMWFSMXVESDQ5ZVcxSVdkU0dSbTFRa05LZkVDN2t1UVFYNGlM?=
 =?utf-8?B?cWtjWktWdnM5eGFTZGw4YTlZTGkyNUxvU1hlR2Z2ek91UE9wSzdmVXFRL0o1?=
 =?utf-8?B?SEtBRHRmTVZnMkpXNzZHZG8vQUtVZ2NoZWpJWDhMOTMzRFhKbWpoeFUxMjdx?=
 =?utf-8?B?Z1g0aU1rS1hOOTZ2a1BuOERWeE1uODlWTDh5L3RNNjd1VDNKTTlrcVJ1OUVE?=
 =?utf-8?B?U0pYU3dCcGd1czNaa0U4ajBqK0p4aDVpTjlXUWpvUkhUTlJhdjhaSWUrQ20z?=
 =?utf-8?B?eXdRUGRwRWRIV1hiditaRkNWNGlNWUQ2YndJek4yelYzWnJhVUZoWUdLL0RZ?=
 =?utf-8?B?ZTdnbmticnVyNitnQzFkYVJnMC9lU2RvTm1iUlFoUVlieVpJVXZONGQzMUps?=
 =?utf-8?B?aHU0U0FhR3NpYng4WFpKZy9jTlR3NnFjeWRBZTlGc2gwcEh2VDlZdVBGQWNB?=
 =?utf-8?B?TDljbDdDMmRNRW5uL3IrWlc0RzZuVFl2eTJId3hpbERES0hGU3k3MDBVeXpH?=
 =?utf-8?B?Z05XeHR3eHR0eExHYktjajRqTE1QVDIzdUJlclZYR0hyckF6K0JWNHBtUXA2?=
 =?utf-8?B?bi9HeURaLzN5K2Z2NWhheVJKV2xPcVFINUpOVG5UMGU1K1BNemJYU3h4SFRY?=
 =?utf-8?B?dzc1eHA5d1JIYXU0NlM4eUtGSzgreGZrSGtRMEh1VjQxcnduRW0xSm9CbDNQ?=
 =?utf-8?B?b0dHSSt5Y3dicUJteGczdkQrU2dPdkRhOHA3emVnUHhKSVM5RnBqSi9UQzds?=
 =?utf-8?B?T2NTMXFmUkNCcUI4MXZ0cklBRmlvUWFRWjRNaVJGQlVNSEdiS1FHN3VZL3Bj?=
 =?utf-8?B?bVhZaGJQWnpKUHRyYWovMUM0ME5abkJIWGdJWmFKd1IrUDdBNGlLSTFlaXQz?=
 =?utf-8?B?M1hKSStqOUtSUFpSRk5zS2JocWlzVWlNTGdrUDhTSUhITHZyNjlYbkdVMGY0?=
 =?utf-8?B?bW82Q3ZBUWFUZXNrNGs5Mk5wdDZvQ2FmWmlzQzlQMzdXWFFhMERoSXRYeml4?=
 =?utf-8?B?cEdlUDNxclNaTS9MMWVLNGlQU2VtZGV1cGdQZjNveEhMMDh5bkpYUCtKMVBy?=
 =?utf-8?B?YytGT3JiVStSQVJCeXhCemc0RVpZS1pMbXpveVlIZm9BU3FZL2l2NEZqWitE?=
 =?utf-8?B?aVNsVFlZQ21LTE8rWlVwbDFwNG9GMGs4Q25yMEJNYUhGUmp3MGtCeWR6Rld5?=
 =?utf-8?B?cFV4NzZQYnA0RXlyVE5TRXdRZGNTZG5ySVIrb2pDZTI4dy9Oa2U0S0psYk1R?=
 =?utf-8?B?UGNGNkZDdnJOa0ZGYmRWblhhUmhJSEdJSkJ4WGd6R3ArUGtCY0R5ZytPSjhk?=
 =?utf-8?B?aFhJOUUvZzVHTE96T1hwSDh4MjJGNldUeTN5bDdSejcvUmU2eHpVbXI2QkFG?=
 =?utf-8?B?QjVvWVg5Q25rZTRGbWF6ZnBwcmVQck5mMUVlQm9PakhXZ3pLaUl3M0RmTkk0?=
 =?utf-8?B?R2dpdXpOTG93aUt3c2FNZU9qVmJ6YTZSZVVhc2o0NUVFZFpKbUlMbkxSM1B1?=
 =?utf-8?B?ZGhTSytBV2VIcU5BdjV0ODlaTEpBWU5PYzFyWlJPMldtdS9OU0R4c2gwYUtu?=
 =?utf-8?Q?nQkl1NfIQHc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVpnZlZZeENLN0lJUHQzenQrK2pDTjAwOGcvVWU2SlhURUd0azhGQTI0bjBM?=
 =?utf-8?B?OU9xaUthRFFOZGRteFBDdHkzZUVPYU1RekdBdFIzMW92MGx0TWlhVjBzNERU?=
 =?utf-8?B?eGM2R0hpQUFLdDc5SVo5Wmh0bnBRSmZVNjU4YTBqNEJFRDBYWDRNUi9PU1BT?=
 =?utf-8?B?SGZIbzRFWXNwSlpiRk5kYVJsTGxQWmYrTUxlNE9JWnoxeVBnY0xJbXdrcXd4?=
 =?utf-8?B?cUVxbnVwUE0xSFI3QVZXS1VGWTUzZlVYZ3g5REZGdnBiTmQ4MlcwcXlnNzV2?=
 =?utf-8?B?cEprUythbUk4VUREYTluZ3EycjdGTkxxd3VtdlByUUZyQ0NLT0dxbW1uempw?=
 =?utf-8?B?V3h3VlRpRDZ6QWNwcHFxcjQ1bS9jMzd3OFFhUlJnZHo3QzN3VTVEeTRKZEZu?=
 =?utf-8?B?N1FiYVdldzBFRytDWGtsZUU3d212Zy8xbkJoamcxek01RXV6SW9LWlNkbVlS?=
 =?utf-8?B?cElYbStnbURuU0VvVzR3Ryt2dlB4N29oVTE5MTZZV2V4ZGVSNzVXVFg0ZlVx?=
 =?utf-8?B?YUM0aWtwU0Z5SXM3WHN5aHZ4WEFldkw4bFpEa0V5V09QbUxrMHdnTXNvZnlN?=
 =?utf-8?B?VVphak9RQ0FuYWc0aUZEQ2g2TDUxUndMTzhVT2hoZ2pwQnhoblZJT1VoNjdI?=
 =?utf-8?B?di9xWk5ZZnRBTHJUSkIvcGhqTWYrV0VZelpVQ0diZjFtVXJjODhuVDBHb3FG?=
 =?utf-8?B?NEVmeEdHNkJkTmxlZEV1RkpTUVV0SnlXR0g1NUtyQWZqblVtWVFrUy90bTlP?=
 =?utf-8?B?c3NvM21tZ2k3a0x0NEZMM1cwUktqS1pZMWNLM0s1SVluWWllbDNzd0t0TlMy?=
 =?utf-8?B?YWJ3bnJ5L1BSQmhPbDB3Zng0ZERXRG9lR3RvM3I3SGh2dnN6OTBuMURRRnk5?=
 =?utf-8?B?Z1c4Q3NSY1cxMlZkZU9FQkI0YkxWbEZjUHJJTVUvOCtIaDVCdEc2ZnZxZHpU?=
 =?utf-8?B?UzVjOTZXVzQvN3BxM0luN01PNzluYk13dTRHNGFIV0xPYisrRHRZL08ySXZo?=
 =?utf-8?B?b2Z2L3Z5YkZiU0gxL2lOelRkdk9jQ0pHdldJWUoydUw2Rk1IRnpCY09QdzV4?=
 =?utf-8?B?ZzFqVjlGVnFFelg0VVI1VEwyYmQ1d1hVczJIT1BQWFdZSjc5bU9TMHpjc2h0?=
 =?utf-8?B?MkZmM1V2RkJhVHNvM0tkS2xjOUMvSUNGZnZXRy9vZXR0SnVvbXRNUk5qRFdV?=
 =?utf-8?B?Q0x4UXNnbThHbUxwNnE5ZVUxVkJYK01IK1hIMytyMmVmcUd5RjQ2VFB5RVdq?=
 =?utf-8?B?RzJodnB4MXY1L2p2V3dRT3djMUF3cDc1QnRGMnNOMkFhVkRsTlFKcGxkR3Nh?=
 =?utf-8?B?d2xYeUp5ZnZrQ0hOZnBvTXlYRlQ5SVkxV0NuQWFhSGhZUCszTG9WSTR5cVZ4?=
 =?utf-8?B?VVVZNGRneTVTY1Q2UmVJcFFOUFRjZHozSXhKOFB3allqQ0EyaVJkZ0VPZE9q?=
 =?utf-8?B?RVY4amFHaSt5bGRBc2FBWGdnWkJ5YnNIeCtDV0w3SVhhZ0t0OGJGdysrWDds?=
 =?utf-8?B?YitSQ3dDM2NpNmgwMldyRVBscGx1TFNhbXAyY2NHa1h4aGd5VGdETWNlcElQ?=
 =?utf-8?B?N2NKQkVxd2dQaStTREUxcEFYZzdFZHhlZDh1b2x1ZDJ3dW5tWmsxNytucU1I?=
 =?utf-8?B?b3gvRjlLZ0o0c2gvdi9NWWJCZHVQVE4vaUFuckp0Y3NyRmg4b3VhSXIrSjU3?=
 =?utf-8?B?bmRTVUpBOWU4TlRNSFNiSVpnanZCMUxBUmNjWXZhOEZ6NS9McjNVek4xTEJ2?=
 =?utf-8?B?UU1mdzcwbDc4L1BGdjF5ZXU1eEVuVlRXcWxjd0V0cEhDTUhNanVvU2NucmQw?=
 =?utf-8?B?dUtlWWFmRElwYktXRTFwaGJPUDhYaXR1TERhUG1aWGpvSmxGVEFRclBmWHM3?=
 =?utf-8?B?ejJGR0hBdjJxSms1Vkc1WnV3OVZ6dkpJSnY4SENDb1lZaHRYODNMY2NKd1c5?=
 =?utf-8?B?eWNibDNkQkJtYjdoT3M1UVVaSHJtWWtNM3VQdDByUExWWE5KekNPaEloNWhG?=
 =?utf-8?B?Q2I5TUV5UkhhbEZ4SVVzQ01jbXRNYkh4SEFVR0pET1R3QlJ3MzdWejFyWjAv?=
 =?utf-8?B?NVBlS3dFRmdqeHhsaStQMTNYNDdoK3UzRHAzbndSdnd1bHNTdDRxeWdvRFkx?=
 =?utf-8?Q?0LkEnr5L/TiukmChLIfoSJ2pO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f03d7bc-1841-4d57-8760-08dda8ddba11
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 11:47:22.0947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBzpZ2Aa79EHIpMktb7qIErVnR8jBLZ4TDfQI273eXKkMTGjJcJO1hB2VpjJzqyq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368
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

On 6/10/25 18:42, Tvrtko Ursulin wrote:
> Protect the access to driver and timeline name which otherwise could be
> freed as dma-fence exported is signalling fences.
> 
> This prepares the code for incoming dma-fence API changes which will start
> asserting these accesses are done from a RCU locked section.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/sync_file.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 212df4b849fe..747e377fb954 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -135,12 +135,18 @@ char *sync_file_get_name(struct sync_file *sync_file, char *buf, int len)
>  		strscpy(buf, sync_file->user_name, len);
>  	} else {
>  		struct dma_fence *fence = sync_file->fence;
> +		const char __rcu *timeline;
> +		const char __rcu *driver;
>  
> +		rcu_read_lock();
> +		driver = dma_fence_driver_name(fence);
> +		timeline = dma_fence_timeline_name(fence);
>  		snprintf(buf, len, "%s-%s%llu-%lld",
> -			 dma_fence_driver_name(fence),
> -			 dma_fence_timeline_name(fence),
> +			 rcu_dereference(driver),
> +			 rcu_dereference(timeline),
>  			 fence->context,
>  			 fence->seqno);
> +		rcu_read_unlock();
>  	}
>  
>  	return buf;
> @@ -262,9 +268,17 @@ static long sync_file_ioctl_merge(struct sync_file *sync_file,
>  static int sync_fill_fence_info(struct dma_fence *fence,
>  				 struct sync_fence_info *info)
>  {
> -	strscpy(info->obj_name, dma_fence_timeline_name(fence),
> +	const char __rcu *timeline;
> +	const char __rcu *driver;
> +
> +	rcu_read_lock();
> +
> +	driver = dma_fence_driver_name(fence);
> +	timeline = dma_fence_timeline_name(fence);
> +
> +	strscpy(info->obj_name, rcu_dereference(timeline),
>  		sizeof(info->obj_name));
> -	strscpy(info->driver_name, dma_fence_driver_name(fence),
> +	strscpy(info->driver_name, rcu_dereference(driver),
>  		sizeof(info->driver_name));
>  
>  	info->status = dma_fence_get_status(fence);
> @@ -273,6 +287,8 @@ static int sync_fill_fence_info(struct dma_fence *fence,
>  			ktime_to_ns(dma_fence_timestamp(fence)) :
>  			ktime_set(0, 0);
>  
> +	rcu_read_unlock();
> +
>  	return info->status;
>  }
>  

