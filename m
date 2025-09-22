Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D80CB8F8C9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 10:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2DD10E3EE;
	Mon, 22 Sep 2025 08:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="21IsPcLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010042.outbound.protection.outlook.com [52.101.56.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C5710E3D9;
 Mon, 22 Sep 2025 08:34:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8lf1ord3/rwW+zjAcq1W+gyDHVjP4RePTUQ76RSHGTPsA5PL1VnH5j0BTKjfByPiAlHfMzyU32vJ+dIicUvnTOeHTb9Fr0uboEw/LXFEtiN1yflA2dDhgVCEbNU/CdjmiJd6U9x5KNRkfLcHO6h81QVQcC3ikvgHyvLwUS/nYtqAUoMglLHAUMTbzxAyd0urynnRVKDdLumPHlRQoVwH/xDXIeSVEBZQjohDVYEdpwXbptqWv+qW5jic2FnQNkfSpmHCm3BFxe8MnjZF9kNmwTheEso6BHjWdfzzM0J3HHh1tKB7SUpcFeEMHdxQdfeMb32g/pan7xabi/r4k7pAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pM2iRIyZg5E78yJjK8P24wj7I5/atg3bfKWkc/BRj5Y=;
 b=wtXOsjtb9jXe4JZ2r0hnA335NKsy1Dll++LERvk3HzBvQIdt7nJR3H7IUbG1Zhr+kNqzLhFFRmACAs+YIEtx95qhthxZ7UhDqQu6lo4NVQzlzU8/aP0YVksqOzFw4BmifkF1wLeO50UXnwELVWDMYQkAI9GlwxpSaLnEJT0+9RXPnRCeibVvDE85bNSw6v9BwMh1ZiE7+MHMVn7EBXRXEdmGfcUniNrd4Jgv8eDjDqrs6QxxDwcY3P7UuzlWjGpPkub0Jmb4CYvpDduppXBSVcDBVs9QPiEd4K5z3CiO7tkOtKMCO+HjAzq/53bfVwEmVvr5ZxIGeS5M565nHE2hTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM2iRIyZg5E78yJjK8P24wj7I5/atg3bfKWkc/BRj5Y=;
 b=21IsPcLk/xwCmK/Zd2WEep+bV2GYlCFRcRd3me9tw53ERJCcuyyzcdim3gEuVfSbKe+PCFQcxz5J3c9MK16Kp2Z5K9fMVSf1qQmmvXVXQMed3Xd6GG/ryz+eJPnPCTscqZeaqcrEBjYX09UK+sH+RqvHwmaYFABplThxs36WU8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:34:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 08:34:34 +0000
Message-ID: <4762e5ef-8427-4fdc-ab22-da2dbcb7b8ac@amd.com>
Date: Mon, 22 Sep 2025 10:34:29 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Revert "drm/gem: Acquire references on GEM handles
 for framebuffers"
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250919155519.1104256-1-mwen@igalia.com>
 <20250919155519.1104256-3-mwen@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250919155519.1104256-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0308.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_
X-MS-Office365-Filtering-Correlation-Id: 82693da9-6c60-4bb4-864c-08ddf9b2db76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elBWYkhLTHJQMUpRSXJqeVk5S1BDbHcvVW1PT0NGNUw1c0FpZ0lpVlUwQ1Vq?=
 =?utf-8?B?MU0yV2g1c1luOVdXb0ZZSVRxTm4wZHNCVHZ1aTVmMWlKbTY0OU9UWktkYlpq?=
 =?utf-8?B?R0NPMkJJZTBwVWV2T0RkRUkza2FBbDJjTzBweXE5c0JESEdBZWtjV0FCOE9o?=
 =?utf-8?B?cE9FOU9OVE84NmlndndBbUtocDkvYi9lYng2RVQyVXRVb3pkMEpkY3hmSGEw?=
 =?utf-8?B?VE9FZDZYNGxMOGVQWEJaWXk3QlpUVFczSW9nSllseDFqbTRvbjc3b3E0M2pn?=
 =?utf-8?B?T3N5ekwvZFZkUVhoSjJaSnZvdEZzUXY2bnVLVkJWakR2UUNpRVlXTDNHeVRT?=
 =?utf-8?B?U2hSbm00ckdSeGFzRVBXRm5HeGRPaDk1TlR3NXhtdGRpNkVHeXFMSFNWT041?=
 =?utf-8?B?V2lBdW9hbWhlZlZRSTFPdTZPeXk0elIwZzBtYUFGaVZuUUlxRWI3anMya2xW?=
 =?utf-8?B?bjgzcnROb2o5Um0wL3dXYzRBa0lKbmgzZmQyMXlWcVpyT3lkZ1pKZGFsZHBs?=
 =?utf-8?B?ZnlDRXd4dlBjSzVBTC9lV3Q0bG9KMnNNdHpTN0J6WG1KajRVVXhXUGl2amZa?=
 =?utf-8?B?SjJIQ0llaytKdnhtSDQwcW1PRDFmVk5KdlFIZi9BUjNSSWxLWHY0RWp1K0ZE?=
 =?utf-8?B?VTgraDh2bDR5Rm9rSUhmQzhBTHF5MWRMVWsrZmlzNHlyS2ZoekxUNHQ1R1NV?=
 =?utf-8?B?YmhCcUl1NE44WExKKzVxZmNGSnI3UnlMSURsaHV5R2xncC9qN3VXYnhsVG45?=
 =?utf-8?B?Q1JkYnZENjYrWGZvdnVvaGpmcHFOa01ENGxsRjRFK1lrOEgrSWg4anU1NCtm?=
 =?utf-8?B?ekx6eU5ueDV3WVF1WFNDbmN5b3JNYTR5c3VJQXJXRlBkcHVBVlBoYUlnWjM1?=
 =?utf-8?B?TDhPUjlRK2JIZ2RmK3BJWFl2OG0wWlRsYm8wYS9ydVVsQXowRDZ3Z2JGbjJi?=
 =?utf-8?B?b01SWS9yNTI0N3VBejVGMGd4SUZSU21wY1JEQXo4Qm94dXJlV3Jsa1lSZ0lL?=
 =?utf-8?B?TGgwcEx2dDVrVGlTSEx4M1psYnJDYk1jZmszZ1JSQ1VqRWczN1lYZ1JYd25p?=
 =?utf-8?B?R2k1ZTJhLzh0MjlFWkxaV091MzJxbmdKUlUvcGl6aDh1ejZmb2xQOGo0aWVO?=
 =?utf-8?B?blhiSHZEV2hhd283WC9Cb05DTVlsMDlEbjUxMk1LQnIzcFp1T1lsZWphSmN6?=
 =?utf-8?B?b0ljRFd6SldQY013REY4dGk1N2pzbGlnRzNVYytyUklpYm5vWmFlYVpWZVkx?=
 =?utf-8?B?NTVTNlZQdUdmRUh5ZVBYemVNUmgyMS9ZVyt6VXJPL1ZBQ2lNZDl6cFJBRTRS?=
 =?utf-8?B?Um5PL29KcG5aTlFJL0RHM2crcnBiV3h5ZUREa2Y2SVdhdmk4NlJOL1lPOW1k?=
 =?utf-8?B?V2lSOGZXSXNqN2hzZ1lZeXBJL2NyeXFkVnJnQXBCRGVMOHhRb1hXVXpTWE1U?=
 =?utf-8?B?WlNhUXBHUDU3Vmc3R003dVcrL0xLU1EwWHJZMFYxV2tZeGJWczI2OWtibENn?=
 =?utf-8?B?R2ZSdGlsbEQ2d1VvQzhWZkhzMG9wNjhBYVFtckp1VHc4emJQZW80T0puYlpX?=
 =?utf-8?B?TTZSNkd0eUdxQndVOUZnTFM5ZXdhMzg3c1U3Y3VEMWwyUGFQYnlWUEFxcGxN?=
 =?utf-8?B?L2lsMVFPckVuWmFIRFdlOEhXaldwTEY0WGx2Yy9HQStyUkxGZmRqRy9LZ1lF?=
 =?utf-8?B?NVFBZlZsU1ovWXZac1hmNU1sSDNtOStSb0lXODE2RnpSaXl3Z1FpMll6WWFX?=
 =?utf-8?B?ZTdtQmQ5dWNQQ0wrT1hQQmpXNEhHcytHZ0wvaFBCYmN0dkh1V3RFZ2FWMkww?=
 =?utf-8?B?Y1BwU0ViUlQwTi9ML0x6MHZnZy9BZXpSbnY0NjFZTFczZ29scE9kUCt4L1R5?=
 =?utf-8?B?YWcyL1FRRmk1U2NldGJMR0dPMjhURTZ2Z1V2aTkwdWNWeXN0MGFUUUV1YlpH?=
 =?utf-8?Q?SNvIQgb6cFc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVhwc2VsNkowK3JiT25nbzJWcW9VSit1YzVQVk1QN2hTK2gxV0JvMHBTbnpK?=
 =?utf-8?B?WUZFRlEySDRnbDdzaGRqS3pmTUNEZDZQWWxtNWs3bG00dE1nRUNtc3JzLysy?=
 =?utf-8?B?V2xJMkY2a05UNWdkZVE1WG1UeTJsaEtsU1FMbFJ6ZmNoUlZzbXh5ZnA1TVhP?=
 =?utf-8?B?WUhaNlNYcndPNzdzVXFOY0lEUzRmaDhreWZLTFlrMUt6RjE3MkR1WDBLc1dr?=
 =?utf-8?B?U1J3Q3hPcGN2MmxKams3QmhIKzlIdVN6S3ZpOCt0RUltaXN5NnErZE5yK1Fr?=
 =?utf-8?B?M2l4TSt6eTJTRm1XUU5JMzR0MVNKeS9zeGQ0U1RsMUlENmd3U0pydEJlamFZ?=
 =?utf-8?B?TjFwQnhYbG9vMlpvYkVjKzF4U0Z0OXNJekIxS3lMUDJCUm9oa2U3ZGYxZExw?=
 =?utf-8?B?Z3o4R0YxT1BlLzhlNkIrOFN1bE9JMjh6NXBjbVJlTVM0bTFMcUgrMWI2Wnlh?=
 =?utf-8?B?eEh2bS9ISlFpTGVJTDNreitEZ3MvZEwvMXVBNkVxc20yWlZRbWNEQnFkMGFL?=
 =?utf-8?B?cyt6NW55NVhORktnYmJ3OG05bEZRY3h4amFLc1V3OC9yRlNsQnByRmdmNDJE?=
 =?utf-8?B?WGRycmhLTDZoT3RSOHI2MCt1ZVVBNTduY1doV3R1SGd4Umo5QmhlTmhLeWVm?=
 =?utf-8?B?RG0xaEYzSCtwVGFEbWlTeDZWaktQNmlqL09RMFpzcW15L21RN1FtdW1xR3lC?=
 =?utf-8?B?U1NlakN3V29xYitRdDNCZ3lFb0M0QTFyUWJvRkxKMlFmMHJ3ODNyZCs3VG5G?=
 =?utf-8?B?VTBjVVpEOWxsYmNsdVdZa3ZiUWVwOUY2a21hRWNRUng0TWVTK29ISm9UWVBi?=
 =?utf-8?B?TUQ5R1cvcm8ra3BEOFladDlrOTJIdGJjWEpLc2trNTk1WFBhWkg4cm5uY3FI?=
 =?utf-8?B?cW1ZZzRPc0h5UlUvOGxXUnBxM1ZIa3hwekprOWNQZ1c2QTBicHBkZVU4Nmps?=
 =?utf-8?B?TC93UEwweGV2N1RMSUhWNTJsRTJFK3I3djBvNzZWeHNuWElaL3hoRitMdTYw?=
 =?utf-8?B?K3lsRWJNYUw4dWJxQnVtSjV4a1hnN01MYkJkUkQ0dnZuVWtwWitON2dTSEFk?=
 =?utf-8?B?QkNoaGJKSkRHdXd2NG4vQWloVlZ3VUVocW9tc0JCOGZVbkpEdHAxbEw4em1k?=
 =?utf-8?B?VEFTelpvcG5ieEtpaktkaGI2alBNbnI0NVpoU0hDU3NJdXFqQXV4T2U1aXcz?=
 =?utf-8?B?aUZVNVp5Y2YrTUszbDBLS2JIakdzUWc5U1hReXlsbnNkVXh6aTUzbGdNeDd2?=
 =?utf-8?B?eUc3c3NWZzBjZjdjQTBtNnBzQjNnNFcwcVpBelhQYVNtL0xjRkN5VkczVWp6?=
 =?utf-8?B?S2FCU3lWbG84MHR3aWtFekJwNEE0QWM4WEsxcEM5aTFxS1E2c1V0aHZhQTRU?=
 =?utf-8?B?bkVoQkdwTi93RjYzUEVNTTJoVUMyMVdZeWtZbW93SXgvb3YwQWZzYTFVYlRQ?=
 =?utf-8?B?TnM5Y3JZL3o4dmp5Y2xmQitVQjlUazZPS2tHUHRQNUpaWnhCcjl2TXVxUmV3?=
 =?utf-8?B?SnZmeUM4YmxiN2h5Y09ONU9OMDQ2ZlZZaXBUTXIrQ01CTEhxN05Uc0pjb1NG?=
 =?utf-8?B?QmF0azd1dUc1WW0yaFQzMHJFdGFSRno5WW5SY2Y1YVJvQkFkV3BkSkQ0ZnBo?=
 =?utf-8?B?ays3M0lPeDFwc0VWQTRrUkZVb1RGOUpFbENDdXdVL2RXN1ZyTnVTUG02VU84?=
 =?utf-8?B?dG11SmhTamhnNi9jUlFITUVERERFSFR3ZGxVSnp6MHdrVjAxRWs5dDhISE1D?=
 =?utf-8?B?a0l3RGVYd2pRNkJlVEtKZzNZWEVRYzdMY2crMzZ5WGhWTVFnR0l2ZUdJNCs5?=
 =?utf-8?B?T2FZRFJDdnhwZnpZNjkxZzU5VjIzVk5CY1UrYUN5QXBnKzg0Z1EyMVArazBx?=
 =?utf-8?B?dTFhaEVkNkRsNWxMVGxpYVUzTCt3WEJ1bEkrdEVMeHlVQ1NtQWxsbWhxMk9z?=
 =?utf-8?B?L1ZZY25DcWV2MVlXRnBiTUNVazZQcWZJaElpM2RFTERQY2JNd2M1MDFKajlY?=
 =?utf-8?B?S2VVOXNpOEFqN0wwVlBIdFV5K29YSC9KTkVmRFV2TjJIbVp1YTVZRWc0RzhE?=
 =?utf-8?B?Z0Z3YjM2Mk5XL1BockovWlRtbitEbG41cVowSkJFUFpva0dBczFxNElRM3lQ?=
 =?utf-8?Q?5+qO5n1Y83mXIorpiUzb1mcPT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82693da9-6c60-4bb4-864c-08ddf9b2db76
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:34:34.0296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhA/A/ef29bNF4SwBZETvH8MOWnXlmsTjIY2aZGZIAwZ9neh+QRMIhpRIgk4TiOl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5685
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

On 19.09.25 17:54, Melissa Wen wrote:
> This reverts commit 5307dce878d4126e1b375587318955bd019c3741.
> 
> We've already reverted all other commits related to dma_bug handling and
> there is still something wrong with this approach that does not allow
> unloading a driver. By reverting this commit, we'd just go back ot the
> old behavior.

I don't think we want to do this.

Keeping the backing store alive for DMA-bufs while they are used for scanout is actually a really important bug fix.

Regards,
Christian.

> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/drm_gem.c                    | 44 ++------------------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 16 ++++---
>  drivers/gpu/drm/drm_internal.h               |  2 -
>  3 files changed, 11 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 09f80a84d61a..12efc04fb896 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -213,35 +213,6 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
>  }
>  EXPORT_SYMBOL(drm_gem_private_object_fini);
>  
> -static void drm_gem_object_handle_get(struct drm_gem_object *obj)
> -{
> -	struct drm_device *dev = obj->dev;
> -
> -	drm_WARN_ON(dev, !mutex_is_locked(&dev->object_name_lock));
> -
> -	if (obj->handle_count++ == 0)
> -		drm_gem_object_get(obj);
> -}
> -
> -/**
> - * drm_gem_object_handle_get_unlocked - acquire reference on user-space handles
> - * @obj: GEM object
> - *
> - * Acquires a reference on the GEM buffer object's handle. Required
> - * to keep the GEM object alive. Call drm_gem_object_handle_put_unlocked()
> - * to release the reference.
> - */
> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj)
> -{
> -	struct drm_device *dev = obj->dev;
> -
> -	guard(mutex)(&dev->object_name_lock);
> -
> -	drm_WARN_ON(dev, !obj->handle_count); /* first ref taken in create-tail helper */
> -	drm_gem_object_handle_get(obj);
> -}
> -EXPORT_SYMBOL(drm_gem_object_handle_get_unlocked);
> -
>  /**
>   * drm_gem_object_handle_free - release resources bound to userspace handles
>   * @obj: GEM object to clean up.
> @@ -272,14 +243,8 @@ static void drm_gem_object_exported_dma_buf_free(struct drm_gem_object *obj)
>  	}
>  }
>  
> -/**
> - * drm_gem_object_handle_put_unlocked - releases reference on user-space handles
> - * @obj: GEM object
> - *
> - * Releases a reference on the GEM buffer object's handle. Possibly releases
> - * the GEM buffer object and associated dma-buf objects.
> - */
> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
> +static void
> +drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  {
>  	struct drm_device *dev = obj->dev;
>  	bool final = false;
> @@ -304,7 +269,6 @@ void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj)
>  	if (final)
>  		drm_gem_object_put(obj);
>  }
> -EXPORT_SYMBOL(drm_gem_object_handle_put_unlocked);
>  
>  /*
>   * Called at device or object close to release the file's
> @@ -434,8 +398,8 @@ drm_gem_handle_create_tail(struct drm_file *file_priv,
>  	int ret;
>  
>  	WARN_ON(!mutex_is_locked(&dev->object_name_lock));
> -
> -	drm_gem_object_handle_get(obj);
> +	if (obj->handle_count++ == 0)
> +		drm_gem_object_get(obj);
>  
>  	/*
>  	 * Get the user-visible handle using idr.  Preload and perform
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index e364fa36ee36..4bc89d33df59 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -101,7 +101,7 @@ void drm_gem_fb_destroy(struct drm_framebuffer *fb)
>  	unsigned int i;
>  
>  	for (i = 0; i < fb->format->num_planes; i++)
> -		drm_gem_object_handle_put_unlocked(fb->obj[i]);
> +		drm_gem_object_put(fb->obj[i]);
>  
>  	drm_framebuffer_cleanup(fb);
>  	kfree(fb);
> @@ -179,10 +179,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  		if (!objs[i]) {
>  			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>  			ret = -ENOENT;
> -			goto err_gem_object_handle_put_unlocked;
> +			goto err_gem_object_put;
>  		}
> -		drm_gem_object_handle_get_unlocked(objs[i]);
> -		drm_gem_object_put(objs[i]);
>  
>  		min_size = (height - 1) * mode_cmd->pitches[i]
>  			 + drm_format_info_min_pitch(info, i, width)
> @@ -192,22 +190,22 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			drm_dbg_kms(dev,
>  				    "GEM object size (%zu) smaller than minimum size (%u) for plane %d\n",
>  				    objs[i]->size, min_size, i);
> -			drm_gem_object_handle_put_unlocked(objs[i]);
> +			drm_gem_object_put(objs[i]);
>  			ret = -EINVAL;
> -			goto err_gem_object_handle_put_unlocked;
> +			goto err_gem_object_put;
>  		}
>  	}
>  
>  	ret = drm_gem_fb_init(dev, fb, info, mode_cmd, objs, i, funcs);
>  	if (ret)
> -		goto err_gem_object_handle_put_unlocked;
> +		goto err_gem_object_put;
>  
>  	return 0;
>  
> -err_gem_object_handle_put_unlocked:
> +err_gem_object_put:
>  	while (i > 0) {
>  		--i;
> -		drm_gem_object_handle_put_unlocked(objs[i]);
> +		drm_gem_object_put(objs[i]);
>  	}
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index ec1bf58e5714..5265eac81077 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -163,8 +163,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
>  
>  /* drm_gem.c */
>  int drm_gem_init(struct drm_device *dev);
> -void drm_gem_object_handle_get_unlocked(struct drm_gem_object *obj);
> -void drm_gem_object_handle_put_unlocked(struct drm_gem_object *obj);
>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			       struct drm_gem_object *obj,
>  			       u32 *handlep);

