Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F879DA861
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 14:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A4E10E27E;
	Wed, 27 Nov 2024 13:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mq/V6nuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AD410E141;
 Wed, 27 Nov 2024 13:19:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laJMdq5hCjx4hWzkb9iAUIKXVJZSbnMROg+IMRpCTJmlh62gCXKuiX4TzRogJcKsOhyYT38Z/N0Bg4zS5XbAsn4fZMx1grrURnGtfeckZAhbOpV3acRAxCc1H8jnxhHPw0rEsmsMEsjmIotNWZWJbzR0wQWCbOafX7OPRXJ9Eb6FijIJf8USVrIO14BvFIlRnBmbLYAT56AAOpjQaDRsdP6hlYTWmejjQqntaCMqFemOhMBSPTQPtrJLilFP8UYFnJfORdCrSfr21eWYshG41PFQ3Ha5LG/fAbc+VDI+ZrzDLbWrHz1YbDY3tRVMBTIsaiMC22S9nuVa7fa86ZxATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjMapdpImbZqWTLOHp0lz8IDfs4Bf/qLMi5mE9JM/tU=;
 b=gkQh6uyH9toIARnTHn6yV3jrwy7o6XCfSIvkQ4wiHsBIXsYggdJrlWj76sia9kmCTKuPDEuh7zsM5qlvcBbTIxx3Hd/vtDdUTt/oLUGTwLORzrdg2XcVQZNos8KlMPUm4gUwpbBVVQJ4iTq5KxHVN3nbfzSXqrOVUVwzi2AOT3P/YkP4pIgiVz5bIO1lxZzFMdlTzP1eto8ugHzN7Gy8EB2QXZD/ldTwgX1XhnH/Zs+yjt2JUhm4CGT67drAeAMUaXXyeE1QcQDFTuu51g2XvbF0m/O1z72MHAu3EvOxaEnrANigfFXPweN7oo3OPCVEW58f1TFTlrjKrA5k28caSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjMapdpImbZqWTLOHp0lz8IDfs4Bf/qLMi5mE9JM/tU=;
 b=Mq/V6nuqRAZ4JUkJTfUQAWqW+8blJ0L4mLkiBnILQiOp5vlk4sLAKJy9LYJTDjQox38asrFyZiLoeSnFeQMRGWIBkh+uUkDENaSb7gq8Ofd8Jcj+89dQqvMXF3bKJANum0/PJF6GeYZY5NeqjzwR7A/SIvO6nFOV2gmOm1Yf9PU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7926.namprd12.prod.outlook.com (2603:10b6:8:14a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 13:19:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 13:19:38 +0000
Message-ID: <0554dd02-06a5-4da1-821a-e2b26b651402@amd.com>
Date: Wed, 27 Nov 2024 14:19:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
References: <20241126174615.2665852-1-matthew.brost@intel.com>
 <20241126174615.2665852-3-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241126174615.2665852-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 41af0d25-a836-4cb7-f101-08dd0ee624b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWZGY0ZiMGw0cU50YzFjaDdJK1I5eTJyWVZDOEE2bng1L2pmMXkvTWRyV0hE?=
 =?utf-8?B?S1QwaVVOYi9MOGdaSC9xeWJlWkdqdndxbXBrbWxGVkVhVTQ3bytyTTJ1N01O?=
 =?utf-8?B?MDJuSjFKZ2cyVGZiaXlCeEJjeU4zc1ZhUkcvS1drMWNoU2tGWlMydkRiaDM5?=
 =?utf-8?B?d2dDRjRTekd2VDVwZGpHY2dLbGpndUFBeE5FL0kySFBScU1VbHoyT3pTeXpo?=
 =?utf-8?B?SjZwVjdOc2k3Z2Z1N3doRnN1MGxEOGZ5anhJTHQ5RngyYXRxNHVHa1hGYUZM?=
 =?utf-8?B?S1FUWlVvM3lMQ0JCUVUwOGh6MGZhMHdYYmlueVp3OHFrcng2N0pDbHluZlJ2?=
 =?utf-8?B?eVV3SGVrN21scnBjY290QWMvbmE0enpZeUxvUUtjWFpxRC9ZWDF5d2JVWCsy?=
 =?utf-8?B?ZjB3NkkrN1g5TWIrN240VmJoOHUvRTdtako1Tk4zUUZFNmh1bjhDR0liUnZz?=
 =?utf-8?B?bW9hemJlaXl3MHZBZ1EvczhyS1BrbW8wUzA5MzBLeHhYOW5SWWlxWVE2N1k1?=
 =?utf-8?B?eVBRSStIbGlwSmdqY1RpeTRkeDhKQ1ZnRmVNTTgzTzJFMVVPWHlIdVRBNFdr?=
 =?utf-8?B?am80dGxqNkJqL2hSOTNiRWZ5b25zNHM5dFZjQlpDc3Y4OVRpV0dnK1NMK29D?=
 =?utf-8?B?eHVLRVF6NS9wYXU2enpWNzF1SUY4WCtDTlIrMmJQSFRrZC9RMUd0TXJ4bTl2?=
 =?utf-8?B?YTBBSjdFWU9ScXNwUnd1NERYeEwyWEhrSm1qSFVZT1dsWFdha1J4b0tIbUJp?=
 =?utf-8?B?ejA0Vnp5S0R6dk8yTjB6RSs0YTZSWWtmV2N6OWpRM1BBTWpwWVhpRGpHVUd5?=
 =?utf-8?B?am1TUnBXYk42c09vb1RMUXJYeldoUHRUVEc3aThNNjVlSzF6Qm94c3NJQ0c0?=
 =?utf-8?B?Si9WT0RPcXNNU21kRFN2YWE0WGNSQXV1dER4WkE4em82V25wZFdaejlPMEha?=
 =?utf-8?B?OCtlV0FMcGVmTVZIWlBRRG1IbmZVOFlacTM5eFBtcm82RGREZjRPS2swNHZy?=
 =?utf-8?B?a3c1b0FIODI2K2kvSHhVY3FFUDFYYUJuWmttY0s0aldna1I1NjhidGV1bFU0?=
 =?utf-8?B?RUloYm45TmpxWHB5UXBwRUlKOUhHSnBlSSs0RVFFak9oZy8vRmxocHljTkU4?=
 =?utf-8?B?TThmaHNSdTUyVEZFL2s4cGduMlRhc2xUcDgzMnpEdDlpYzYzR01BQ1p0dEdh?=
 =?utf-8?B?LzJ3cHoxeUJhS2dLQU9iNmQrUmZYRHhYT3ozSzEzVTJMRGZUSXdaOW5MTlhI?=
 =?utf-8?B?TmtOd1djd3RiMjlmNEd4dUtkallpWmYxclZWNDRnL0FNcUtoTUMwc3BDYXcz?=
 =?utf-8?B?NlAveFpXOGxleGtZYTN3TUVYZ25PSm9UeTNOVG9palJZaXZkOGdnM2lpa1BS?=
 =?utf-8?B?RFA3VDBrLzdrNEh5eUZ4clNydmkweG9LbEY5ZGd5VXpXNkF3bkNsY2FoN3Bq?=
 =?utf-8?B?b2tqOFAvMGdPenUvRG4yZHIvb3FiM0l4WUFYZjVmSkkxUitVdjJtc3FJVXM4?=
 =?utf-8?B?Y3RhVWtkTTFRcFhVZWpzbVFVSWNXUkdIK05oYUlGZ3RPQ09kaE8rNVhzb0Zr?=
 =?utf-8?B?aDl4U1IvUGE0Mi9PYncreW13N2NMSDZqN3ZIRnovendrVjVvaUNvLzEwZ3hY?=
 =?utf-8?B?Q21TVnB3OXdlS0FLQSt3YVpGMEV6OUhZeVd5a2JGVmcvTmhQWmNZNjVhaTk5?=
 =?utf-8?B?YWxobEFiRVV4enZoRWhjOGRCcExxMHp4OXdEZWI5a2ozdGkxT0JBMHl5SDIr?=
 =?utf-8?B?ek9mWHBuRWVQVFNwa0Mrcy92THNaQ0tPMEx3aVJVYkVucnJ4cjlxTVRuTXlN?=
 =?utf-8?B?VUdMZzdHMlQweVZnaUhGUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3U3NENyUDBRRDNuRmxwUnRpREdGeHFybVNTUUlDTmZjRFRmL2xGdTRidFNh?=
 =?utf-8?B?SG83RGtJbnkyMXN2REU4ZTU1ZzJRWS9JK2cvOEtOS01UMStTQnBBZTNTck9z?=
 =?utf-8?B?ZkcyL2xWWktuenhYMFdoVzNyU3JuU3ZPU2JJQm01UWVRZUVkeTlHVGgrMlpk?=
 =?utf-8?B?N3ZSQThlOEkxaGNKd1c5TVJONGFLaFJPdHc0a2pxY2FKWnpoUlk2dGFVNys3?=
 =?utf-8?B?V0NnYUVlSzA5WFdHZHJKbERVYzBRcy9iaytwTDZaK2dsVU5DRVBNTDFpQkND?=
 =?utf-8?B?NE9vVlpHRWhmL1FTb0t0bXBrU0pPaGRHaTVBdGpsT3FHU2FPbnpGUGE0aFp2?=
 =?utf-8?B?RVE2L2hNMmV1RUpMZ3Z6K00vSlNHelpDdlFUR1BpRXBMZFo3TkovMmRValIz?=
 =?utf-8?B?VGxXOURRR3lrZUUvb3pWYXJHWjdTQzJiVG5RSG0yZnpIYkFWcFQzcjBNd3hW?=
 =?utf-8?B?bXJWclN1K2hXdjJpa1FkU0FQbzdYc1NtcDVKZ3dVckZvNVRPaE1xSWE4R2RB?=
 =?utf-8?B?REZzN1FLKzNpbitsK1FqKzhwN1V2VmJZSXpFTC9PdVdGR2lEQXk2YVIvMHh5?=
 =?utf-8?B?blNOdmpGSFJNRTAzcXJtWFY3RDRsUGEyRjdHQXdXWDlIVDg5UlR0NnVjWXVW?=
 =?utf-8?B?cEM3cTFlK3lVSXFneGttbk1zWTBPdE9vbElnTVRmZmpUT1NkdldlTXpNTUVB?=
 =?utf-8?B?SDE5cmNDdEJRWlBDTXFPMTR4OUF1dGNEUThVTWRBMm90ODJBamNydEpGQmtn?=
 =?utf-8?B?bTlFNURDVEtNeCtIS1Ixa1dBMFhOdEZBYTREQnU4SmxqWVdIeVRjdW1XakFs?=
 =?utf-8?B?L3pxK3RsSG5UZXBoWGUwUEt1VWZNZzR4VkNyZ05CbVdsMTVSMk1oSGdtbmI0?=
 =?utf-8?B?VW50TmdDaFZZQ1BmVHBpcGZBMEJ2M0NCZkViSmpEYm5KMzYrbUt0enpsdU5J?=
 =?utf-8?B?VzlnWWRNakVYQWgzMVRnRVE3K1EveHVUU1ZJQ25QSUJzcTJvMDNFV1VhOHNL?=
 =?utf-8?B?bnJpTEFGVUFVUWxKb2lDcDFvNDUzUzlKNFRwd3M4SWVzcGZXcFh1NEZaZW8v?=
 =?utf-8?B?dFE3MDFKTVRQeUVlSFljLzV1U0FKcGloaDdYc3owdVAzdDJUS1hmUnYrZlV3?=
 =?utf-8?B?OGdzUDliWUVWdnBxckZRbCtnbFF2ZHZxVUVZQTBYSm1kNWtrRDhwelRsVnkz?=
 =?utf-8?B?N3h0akZHcnA3TTJyd28yOCtqa3RtOUQrSmtCb2htQkEzWGxRRXJWd09BOFpG?=
 =?utf-8?B?QXlwZEdRNHREVGNYVUhLMFMvblhEMjJqakFDM1FLRkhjM05kWTl2dngwTGZ6?=
 =?utf-8?B?TTF0YTA4QS8xYkdURExRaTZnMytUZnV6eVZiMkJNWVdBWTBlbWlWY2dXMVJs?=
 =?utf-8?B?eGFXYjAzY1JZWmNVOXlIQkM2c1lZWWsxb1hMeFZRN2l3dERKMFhqcE9oQWpv?=
 =?utf-8?B?TktPSHFpaFZ4Sk9rVitOVGlnNTBLMlp1dE82ODcwbDJ1V0tTSTFuQ1FwaDlR?=
 =?utf-8?B?Q1dNUGdwUFJVeGdvb1g4SXh1S0JFL0tWTW1rV2VlL3Znam1UVnVWRm56RXc0?=
 =?utf-8?B?OGdVT0E3UzZTWFpkUEtZWUtWVUJwVUkra2NxR0VhT0lUUWFGQzgwd1ZRTmVK?=
 =?utf-8?B?QVVEYms4czJWR0NJTVAybS9ibElnb2RNTjhBOGUwUWVKSEhZTUg0VklPWmFo?=
 =?utf-8?B?alNaMHM3RFZVWUUzb0I3cGlibjZ3RFhWWjEwdlhNbjhjL04xeGdEWFVOSDBY?=
 =?utf-8?B?U1R4YjlGVW9pSlc1SG5kUTBnVjRYNzY5VEpZSE1hV2Q1MXllUm8zbWh3RVQy?=
 =?utf-8?B?bEhKL0gxRHJNK2huUmwxZVJEZW9TdytJS1FjWnRWc0w1aSt2UjhIaDhMZ2pV?=
 =?utf-8?B?V3k2Q3FhZjN0WU9BaU5oVG9PdWpaMWJnSUFXRkNsZG9FODNkN2t0MGE0WVBE?=
 =?utf-8?B?ci9paTA4MC9hYTJTM1Fydis3aGZkS0tUbFgzZE0xSGpWYWlEa0QwR0U3VUht?=
 =?utf-8?B?cWppQzUwd1B1c0tpeWpMNHRUNEFxSXRJOFVSV2hWLzR2TkwwZnpkVXRUWjVl?=
 =?utf-8?B?QURkK1VIYlVMd1pxTHFpK25RNmdSdlB1SUVKd3MzaSt6Q24yaytsU2hkNHQr?=
 =?utf-8?Q?6ydEBW+fwVowpk0tsW1nyErOH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41af0d25-a836-4cb7-f101-08dd0ee624b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 13:19:38.0192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWfYVe6u6bG37sbzsB36EyBJqhfCbCX1r6Zam7HztgeNNbjsZ9lbKjjePtl//22v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7926
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

Am 26.11.24 um 18:46 schrieb Matthew Brost:
> Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
> VRAM easily be accessed. Add ttm_bo_access, which is similar to
> ttm_bo_vm_access, to access such memory.
>
> v4:
>   - Fix checkpatch warnings (CI)
> v5:
>   - Fix checkpatch warnings (CI)
> v6:
>   - Fix kernel doc (Auld)
> v7:
>   - Move ttm_bo_access to ttm_bo_vm.c (Christian)
>
> Cc: Christian König <christian.koenig@amd.com>
> Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 40 ++++++++++++++++++++++++++-------
>   include/drm/ttm/ttm_bo.h        |  2 ++
>   2 files changed, 34 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 2c699ed1963a..f02d3966cc84 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -405,13 +405,25 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>   	return len;
>   }
>   
> -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> -		     void *buf, int len, int write)
> +/**
> + * ttm_bo_access - Helper to access a buffer object
> + *
> + * @bo: ttm buffer object
> + * @offset: access offset into buffer object
> + * @buf: pointer to caller memory to read into or write from
> + * @len: length of access
> + * @write: write access
> + *
> + * Utility function to access a buffer object. Useful when buffer object cannot
> + * be easily mapped (non-contiguous, non-visible, etc...). Should not directly
> + * be exported to user space via a peak / poke interface.
> + *
> + * Returns:
> + * @len if successful, negative error code on failure.
> + */
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> +		  void *buf, int len, int write)
>   {
> -	struct ttm_buffer_object *bo = vma->vm_private_data;
> -	unsigned long offset = (addr) - vma->vm_start +
> -		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> -		 << PAGE_SHIFT);
>   	int ret;
>   
>   	if (len < 1 || (offset + len) > bo->base.size)
> @@ -429,8 +441,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   		break;
>   	default:
>   		if (bo->bdev->funcs->access_memory)
> -			ret = bo->bdev->funcs->access_memory(
> -				bo, offset, buf, len, write);
> +			ret = bo->bdev->funcs->access_memory
> +				(bo, offset, buf, len, write);
>   		else
>   			ret = -EIO;
>   	}
> @@ -439,6 +451,18 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL(ttm_bo_access);
> +
> +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> +		     void *buf, int len, int write)
> +{
> +	struct ttm_buffer_object *bo = vma->vm_private_data;
> +	unsigned long offset = (addr) - vma->vm_start +
> +		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> +		 << PAGE_SHIFT);
> +
> +	return ttm_bo_access(bo, offset, buf, len, write);
> +}
>   EXPORT_SYMBOL(ttm_bo_vm_access);
>   
>   static const struct vm_operations_struct ttm_bo_vm_ops = {
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 5804408815be..8ea11cd8df39 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>   int ttm_bo_evict_first(struct ttm_device *bdev,
>   		       struct ttm_resource_manager *man,
>   		       struct ttm_operation_ctx *ctx);
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
> +		  void *buf, int len, int write);
>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>   			     struct vm_fault *vmf);
>   vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,

