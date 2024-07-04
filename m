Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB6A927201
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67CD10EA36;
	Thu,  4 Jul 2024 08:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lo94w6mZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC16210E93C;
 Thu,  4 Jul 2024 08:47:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knNn4bWl7iixR84PIL9EBcA2SQl3ffk9qJf0vkuav8OSktfq1+NddJ/7+N2FhuhcIZvDduWzbnWvVhrfjqp3iZvGA++8QRayYFOECw+q8DFRDMAbTVfgsPfpEUeWMIffvTwWIVrLSildysYGsnr/GUGy2pYmVsu0ATU4g+5/dQRqE9Fr3+fYTRcZJL/T3aOOHAniqffrFCS/QDeSh1kAmLdKUJKQOtt98/OYkdR7F4oABlvtmsXon8oUto0Q//8Vn3qMuuRgAJLiqokuYQ1e51BuMW/0IEWiJpAE2oWmxVXuJa4/TemT/1GLPsSftvxOeza125CosieVubgho4uymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbFcUsr/jU3Z6Vdfp+ibrDFEKU6Nz+9GynqmIzUyhU4=;
 b=AbyxfMMlHmRwbcFq6P7vcqwss9IFukHvyYUhImmoEFFkkUY3gcuxD6jETAGuBsUt84Xww7MDEs1k+MgI6tpcFCrA8NUniakLBQwkvNCDhJ2AYiwmYSTe+z9uWGf4Q4C3hyfRcLiICklM0vcVwRKs0a0ha4l/ASa608JmIThHrHmySghkfeOpziEzuHmJSqTIuKH7kLfWsCJIshC18nws/m8kPljRePcEm18mLvmamf10SgS5oS/NYHusGnzHUXct9RLpo+qcoId8NJ6c4nsbkeCKAjj/nDMIrE2BQde4GEQVfaKtqRilUX0eWN8Ao1c3m5CoSMXuOvIPOmKzgbBLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbFcUsr/jU3Z6Vdfp+ibrDFEKU6Nz+9GynqmIzUyhU4=;
 b=Lo94w6mZGiiplxLJ2HhEQDuEzwp9AhouGjlI4cDI5gTLMBFf24d0NdKdsAO3UH+s2GrxqzXA9umX+jMIn31+UejIa2LFOxST9iZj2K7wZwiVII7kiaz6LcXXxolihldYRNjJ5GdSq+1uT73JehcA6wRR+dU2S4L+jspXtALuKjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Thu, 4 Jul
 2024 08:47:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 08:47:52 +0000
Message-ID: <cc2063e0-f988-48c7-a90c-b45e2c53782c@amd.com>
Date: Thu, 4 Jul 2024 10:47:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Add address alignment support to DCC
 buffers
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com
Cc: alexander.deucher@amd.com, frank.min@amd.com, marek.olsak@amd.com
References: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
 <20240704083008.870021-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240704083008.870021-2-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cd2069-6843-40ec-1aa1-08dc9c05fdd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW5BNUlVcTRMb3ZGaTgvaG1HY1lPdThOSFNCVTRlSFdCUTFscGtNaTlFaDZh?=
 =?utf-8?B?VFhIMzZJQThUbGptMXNXdlVLWncvVTV5WHJqQnR4RVgvSEZSZGt1c2E4bTE0?=
 =?utf-8?B?Uld5RUEyMEN4S3BxenFqeFhmNUdxelZKVCtjZThvNTN4dFI2UFZqRm9FTERx?=
 =?utf-8?B?OHRXQm1UaVhBWHpnNml2NlNMcWxUTG5EYlAzeFBTazhUd2JSR0lhTGt2Uk5r?=
 =?utf-8?B?ZUdqUko0Z1FLRzc0eHFxQ3B3cndLWG5aaFA2Y1RUek1yVlZWY2x6V0VIRXln?=
 =?utf-8?B?bWFyYUNPTEJGWnVTa2JPaFJsbVpBdVQxd2VoNis1OTJiQ0dQWmdtTCtTTzUy?=
 =?utf-8?B?THpaM1ArWjB0eWJndkY1WmEvQ0tXMkQ4VVZCTmpqNUlDSVR6MGhCSk42Rjlw?=
 =?utf-8?B?KzR4NWl3c1M5THJjQnNvNjhrUXBHSjFyVFlUUnZ3WjlKanl6endlZUt1Qms4?=
 =?utf-8?B?ZjV5eDNiTlhGY3dmYlBRTW4zeE9ocyt2NVRDMTIwTW9qSXVHc2RSeUtPV2ZE?=
 =?utf-8?B?Vkc4YVgyVzdBc1dpYzkvanQ1NU9Fam5IYkRhM2M4RDVBN3NzSGZwc1BwOE1Z?=
 =?utf-8?B?dnZsYXR5WVcvOTc3eEtJZkpsSHo4YmNqNUNOU0ZPTTNISHNqMzF4ZkNtRzhU?=
 =?utf-8?B?V0R1cm5QN0NYZ3p0MVE0NU50WVhSbWtwdU9pSzkyV20wVEw5VnNieUh2MFZ4?=
 =?utf-8?B?T2N1UUM0Q2Y1SDhPZW1qK2dIRVZXSEk1VXFQeUp0UU53LzltWEFmdnRYNTEy?=
 =?utf-8?B?RkVaWHlFMEJGbGE2TkZuQkRLTk95TjM2R2l3MlBSbFRJZEtNSnFmeDdhMUF3?=
 =?utf-8?B?dnBqWllibVRoTWZ2eGE1UkZkT2UwWlFIUzd6Mm5KQVovaWFLS1JTWEMySVNJ?=
 =?utf-8?B?TnhwSHhmRU9aZXk1NTVZdkc1WE8vZkszNk0ya1pGLzFSVzYrVkc5NzllWVBI?=
 =?utf-8?B?dEx1dnlNdjBtc01ndXFEV3MvaFFUenpBT0lYb1BIZkdWaVRMQjNFbVpONStw?=
 =?utf-8?B?Vm9XaVdsMHMrYTBNZHdzN2pQR3dvZ2ZYSDNqMWxhck5MT0pPbCs3THFoQUZl?=
 =?utf-8?B?dC94eWk0OGNETm1FTXV4NTI0Wm5Wem5SU1ZBazBac1NQYXg1MVY0cGtteTZr?=
 =?utf-8?B?eWZXL1JHL2ROa2x2ZjlOYTVWVG5UYzJYd01jdmtNZnVETFBnajA1eHYzZ3Z6?=
 =?utf-8?B?cksrcVZBVkk3Y0FOVHE4YmVTWVhEcEFheURRK0FoeGU5ZUpCOTNEeVFrcWtw?=
 =?utf-8?B?MUtvRHBTZjBRMHQ0SDNKdWJRSEdlYVE4NU9kd1ltZEc2TTdROW9nQ2JsUzlV?=
 =?utf-8?B?NXMzRHlaVVdFekk2T1hZbzMrWE9oU2hNcE0vSSszVUVRZTd3NGFrVWxrZ2lv?=
 =?utf-8?B?RzZwdjFaRDc5RHFrUGRwUCtyU2g2dEE2VEVSa01vcUdaMVMxMDE0RGFmYXFP?=
 =?utf-8?B?cmw4REJlMzBFZEhlNUF1RkpQTHN5bGNneDhXMUY5TGRvTEs3S29CazI1aGda?=
 =?utf-8?B?Q1RYVkpvam9iYjhXUXZSUm5JaDhaaGJVWVllK3p3TU9tTjJjOWxNWVBFWGIy?=
 =?utf-8?B?ZHBvRll4WmNWaUNNbjNPaG50eFljdCtTNEp2WVZZNk55VnNFQjY3ZUR3dnRH?=
 =?utf-8?B?cU81c1lrUVVhL1FmelEyQWN3Qmh4S2tFWEVZTVZyQlhuQXdVSWd1Z25WbEZm?=
 =?utf-8?B?MmVDKzFRS2lPWEhYeHhTMXRLbGUyZytLUjdHL2JXVHZRNHkrSFpEU1RUcDcv?=
 =?utf-8?B?QWV3SENoVm9JRVZ5S2tmS3RJWXZHRHd4N2dYZUU1a29wcWs1cVNwditIWjRT?=
 =?utf-8?B?bDhYV2RQeWdYUnRkRUJoUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWxUYys5QTVYd2E5MW5rc3RUd251b3hnRXc4eDFwYUZrWDk2WjFRMUZqYUVx?=
 =?utf-8?B?Y0dydnJ0MTZsRU1zc0l4OURuZThnNE1wVGRHQ1pDeFY1Zm5HRkZWeTFYdDdQ?=
 =?utf-8?B?Q3VidTR6SjZ4NXdSSWRiOHBwSzkrQjRYUG9RR3BZZDA2MmRJZkhLOVJwSXBO?=
 =?utf-8?B?U2F0ZjA3VVlXOFlTRWU3U0J2dStUUUU4YTBObVdpMlhkWC9XbU5BWUlEOVJs?=
 =?utf-8?B?bG92dEp5SWhLYnhkT3NKYzN3ZXRnbE0rV1ZSMDNrazYvbTRXaCswSUlOa1N0?=
 =?utf-8?B?bzZnMjU0bHpJb29ldCtudXpxNGRsWGVIeU1YZFcyYVZaT3p1aFdnOVMvVlNF?=
 =?utf-8?B?VGtKK3lNay9HRFFyVis4aGZOa1h1SG5UZk4xRUQ4dDl5Y2ZNWHc4YnBVVTZh?=
 =?utf-8?B?RERzQm0rLysyNnpNQURsN1lYVlV0TW1sanpJWGhBTyt1ZGNyUEpIcmNtNkN3?=
 =?utf-8?B?NG5pdlF6ZmorRFVtNkhtbGJSSERWUW1HUG9wS0I5WHhiVUVZZDFhNGt6SjBq?=
 =?utf-8?B?VzJIanpxSGFDL1o4dU5xbFJQZGh1Z2VweCtxcEhGdUZKbUxuZy95S2E3R3Rz?=
 =?utf-8?B?Sk5wTjJJbmdiSXA0cWViZFdzbVdCcWZyaWpSQVIxSk9BMnJsUmtUSnRTbzA3?=
 =?utf-8?B?dERUY2JOVnIvOGFjWGd0cjBDSHVlOVp3azN3TVdjeE56Rm50VDZUOTZXTXBx?=
 =?utf-8?B?Y3oraFB6RnhURG9vbm9RVG1Sem94VDBHTmoxOWFjY2srMFE0V1lWVVZWL0dz?=
 =?utf-8?B?YlZITm1SZzRDWE40eFlKdTNiWmlxbEo2MVVHdkxXaHk3aVZMM0lXcE1sQ0p2?=
 =?utf-8?B?eDNJYmV5RE9nM01zNzBGM2JYYUtrcVNYczRnSkYrb3Y1UzhNUFJVMlBZd1hq?=
 =?utf-8?B?cHpsR3pGN1l4OVBDQjZJcThPSVZ0U2dUdGVLekwrQStpMk4rTjQybWdPNUF4?=
 =?utf-8?B?eEhYTWRFSzQ2Ry9vL2QrbG1zTEh2cmFKSEY5ZWFLcWxZK1k3QStCVklJd0kx?=
 =?utf-8?B?aDhzQ2lHVzRBNmY5VUtqc1VHVHhWSnk5NGRVeVZpUlBhWDVCUTZuUGdhM2ZD?=
 =?utf-8?B?bG9mUGJGTW9rTWQzOGcrbTVlNlVQNll0blFCREhCRXVRTFVMVTMwQ0ZucGFZ?=
 =?utf-8?B?ZjdDTTZ5UlhyTTZMUG81RUU1UklYckwrSW81Y2VFUDVMR3NSQ2M1enh1WTJB?=
 =?utf-8?B?OHEzNm83c2FNNTU1bG9hUk40MnFYY3hOdjlMaTROVHpIN2ZNcXVlV0JtallG?=
 =?utf-8?B?VkE1aFd5TVIxMTUzbWpLc3ZuTzlxOVlNMVZQb1hRNTZPZWFVdFhPZWV0VGwv?=
 =?utf-8?B?K3k2eGVUdzdVTlN5bXZsRzdRZWVBVVhMRktabXVhTjRhTkhSSlZEdzB3bkRa?=
 =?utf-8?B?eVFMUGNvZzgrb01ScW5nT1JBTE9JNXJyZTg3VVlodVRTTU8za1JMazQ4bXpQ?=
 =?utf-8?B?ZTI5STlNazZ2NTJhYnJ0OGFycWJqY2d6c1UzTitzZGJ1R1RsbEtmNisxK1Jo?=
 =?utf-8?B?MmZiekhrOERoSTQxZDBLZlJVRzNYRkNueTJia0xKeWlqYVRDc2tmcjJCemN5?=
 =?utf-8?B?Yjd3RFV3V3RxY2RWN0sxMjVoUkd5RXpTNFo3U3lpMGxlZ0FZSmh2S2k2Q2pn?=
 =?utf-8?B?Y3dnYjNSTStSUDBZcWcrOVlCN1ZxZ1NTSml5MENSeHJoYnFDbUlLNnptYjA3?=
 =?utf-8?B?RUtUTW1QWE5iVGpmNjR1VExNVENHSXM1N1BDTkF6Wlg1Z1lnb21zT25Yc1Jy?=
 =?utf-8?B?Z0NKb2JQaXREOW9pZG5FQ3FyY2NCUTUwZUV5MW9scWIyTmxBRXJhU3lHcFBC?=
 =?utf-8?B?MVlBVUYvcE1BcllhR0RRWHNnMThXeUdBRk05MVhBU0JuZk55LzJhYmFIUyta?=
 =?utf-8?B?Q0gxKzhwT1kwU1E1UmpCNFBYaWNFellJdWxPcUlaUks1b1RLSE9nZ3NIbTht?=
 =?utf-8?B?em1lSEMyQWQ2ZHlselZqSXRITUNHT3RrV1lUMHlsUFZ3SHdqVWVkWFdNdGo2?=
 =?utf-8?B?YytJckN3b0p0TExaeG1UblBYbGN4QnMxN24vTzhpTE92SXJwTEZlT1hmd3JV?=
 =?utf-8?B?eXRyNzFNbkNLVStCU05BcFM5anFzc2d0TU9uT001YzIvbk9WMnh4TFhnR2FX?=
 =?utf-8?Q?/S9sx6AlgBtMmLhiLW6oiOP0B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cd2069-6843-40ec-1aa1-08dc9c05fdd1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 08:47:52.7993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4nnX8XF+0Z2/vmmXZ8XNtleeiOY+xogZwavtNaJX0dGlERu5XYnE9L+WJWT39wE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
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

Am 04.07.24 um 10:30 schrieb Arunpravin Paneer Selvam:
> Add address alignment support to the DCC VRAM buffers.
>
> v2:
>    - adjust size based on the max_texture_channel_caches values
>      only for GFX12 DCC buffers.
>    - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply change only
>      for DCC buffers.
>    - roundup non power of two DCC buffer adjusted size to nearest
>      power of two number as the buddy allocator does not support non
>      power of two alignments. This applies only to the contiguous
>      DCC buffers.
>
> v3:(Alex)
>    - rewrite the max texture channel caches comparison code in an
>      algorithmic way to determine the alignment size.
>
> v4:(Alex)
>    - Move the logic from amdgpu_vram_mgr_dcc_alignment() to gmc_v12_0.c
>      and add a new gmc func callback for dcc alignment. If the callback
>      is non-NULL, call it to get the alignment, otherwise, use the default.
>
> v5:(Alex)
>    - Set the Alignment to a default value if the callback doesn't exist.
>    - Add the callback to amdgpu_gmc_funcs.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Acked-by: Christian König <christian.koenig@amd.com> for the series.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h      |  3 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36 ++++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c       | 15 ++++++++
>   3 files changed, 52 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> index febca3130497..49dfcf112ac1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> @@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {
>   				      uint64_t addr, uint64_t *flags);
>   	/* get the amount of memory used by the vbios for pre-OS console */
>   	unsigned int (*get_vbios_fb_size)(struct amdgpu_device *adev);
> +	/* get the DCC buffer alignment */
> +	u64 (*get_dcc_alignment)(struct amdgpu_device *adev);
>   
>   	enum amdgpu_memory_partition (*query_mem_partition_mode)(
>   		struct amdgpu_device *adev);
> @@ -363,6 +365,7 @@ struct amdgpu_gmc {
>   	(adev)->gmc.gmc_funcs->override_vm_pte_flags			\
>   		((adev), (vm), (addr), (pte_flags))
>   #define amdgpu_gmc_get_vbios_fb_size(adev) (adev)->gmc.gmc_funcs->get_vbios_fb_size((adev))
> +#define amdgpu_gmc_get_dcc_alignment(adev) ((adev)->gmc.gmc_funcs->get_dcc_alignment((adev)))
>   
>   /**
>    * amdgpu_gmc_vram_full_visible - Check if full VRAM is visible through the BAR
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index eb94f943b28e..756d1c8cbffd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -509,6 +509,16 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
>   	remaining_size = (u64)vres->base.size;
> +	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
> +	    bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
> +		u64 adjust_size;
> +
> +		if (adev->gmc.gmc_funcs->get_dcc_alignment) {
> +			adjust_size = amdgpu_gmc_get_dcc_alignment(adev);
> +			remaining_size = roundup_pow_of_two(remaining_size + adjust_size);
> +			vres->flags |= DRM_BUDDY_TRIM_DISABLE;
> +		}
> +	}
>   
>   	mutex_lock(&mgr->lock);
>   	while (remaining_size) {
> @@ -518,8 +528,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   			min_block_size = mgr->default_page_size;
>   
>   		size = remaining_size;
> -		if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
> -		    !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
> +
> +		if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
> +		    bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC)
> +			min_block_size = size;
> +		else if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
> +			 !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
>   			min_block_size = (u64)pages_per_block << PAGE_SHIFT;
>   
>   		BUG_ON(min_block_size < mm->chunk_size);
> @@ -550,6 +564,24 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	}
>   	mutex_unlock(&mgr->lock);
>   
> +	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
> +	    bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
> +		struct drm_buddy_block *dcc_block;
> +		u64 dcc_start, alignment;
> +
> +		dcc_block = amdgpu_vram_mgr_first_block(&vres->blocks);
> +		dcc_start = amdgpu_vram_mgr_block_start(dcc_block);
> +
> +		if (adev->gmc.gmc_funcs->get_dcc_alignment) {
> +			alignment = amdgpu_gmc_get_dcc_alignment(adev);
> +			/* Adjust the start address for DCC buffers only */
> +			dcc_start = roundup(dcc_start, alignment);
> +			drm_buddy_block_trim(mm, &dcc_start,
> +					     (u64)vres->base.size,
> +					     &vres->blocks);
> +		}
> +	}
> +
>   	vres->base.start = 0;
>   	size = max_t(u64, amdgpu_vram_mgr_blocks_size(&vres->blocks),
>   		     vres->base.size);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> index fd3ac483760e..4259edcdec8a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> @@ -542,6 +542,20 @@ static unsigned gmc_v12_0_get_vbios_fb_size(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> +static u64 gmc_v12_0_get_dcc_alignment(struct amdgpu_device *adev)
> +{
> +	u64 max_tex_channel_caches, alignment;
> +
> +	max_tex_channel_caches = adev->gfx.config.max_texture_channel_caches;
> +	if (is_power_of_2(max_tex_channel_caches))
> +		alignment = (max_tex_channel_caches / SZ_4) * max_tex_channel_caches;
> +	else
> +		alignment = roundup_pow_of_two(max_tex_channel_caches) *
> +				max_tex_channel_caches;
> +
> +	return (u64)alignment * SZ_1K;
> +}
> +
>   static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
>   	.flush_gpu_tlb = gmc_v12_0_flush_gpu_tlb,
>   	.flush_gpu_tlb_pasid = gmc_v12_0_flush_gpu_tlb_pasid,
> @@ -551,6 +565,7 @@ static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
>   	.get_vm_pde = gmc_v12_0_get_vm_pde,
>   	.get_vm_pte = gmc_v12_0_get_vm_pte,
>   	.get_vbios_fb_size = gmc_v12_0_get_vbios_fb_size,
> +	.get_dcc_alignment = gmc_v12_0_get_dcc_alignment,
>   };
>   
>   static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device *adev)

