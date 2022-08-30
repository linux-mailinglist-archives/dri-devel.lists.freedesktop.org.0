Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58D95A5D02
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 09:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E1B10E7FB;
	Tue, 30 Aug 2022 07:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8074510E7FB;
 Tue, 30 Aug 2022 07:33:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eavw7j/mC0Ya1v2mtf7iQVSc8IZyB+Q+mfRtsySq7WATikGatvf5hTOfOS3xUt6b/BUoLqM2miCIPLTk7IwTj9+Qep1QO+aG5f3Va25dqu3Snu38B7tQ0T2TM2gC5rpt2hy/fI0JKRnTLlg6v3wV8mERMvy1KWDOmIVqzQvVgH/FXGbLuJ/XJzIXID9u2P5k5RrIbqOk0qu8h685uVMNwzJmKgyidJnAiG90f0kdpSvg8LjG1/V+DGAhGYj3iXNjugyrGjXaGSGjRqyThMPtnnFALR5g3VW3H0X1zWHO0pgCChfYmJcnXWAVCBr0MLMGqvSQ6mrWrWtPIPOUuOZQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIBl43SWXjnfdE3S8S631KaFHQP3l1LhDlCwjdiln8w=;
 b=niwVAts0laljBXnPHPAjDzm6wWQT9qVMPD47bLPCUjTMp7Peh/8PBmMWT15ff6IFHOpxQFOmrzwUNA9ASF5de9nUQbfrYJfgmLIvrRvrIelBLcHKM1LJp/EYa6MFZ74FLz8+WUI4rDrqdaDQWiI4DUu1YLRwqlvkNhiqwsjq6+yNkxrjw6gy2HOXg9t3Biwv4CKTtV17UAOvl5AgCtsUZ7Nq1NXMWfYDKa0O5VERqa5NCZFsllpoj7MVr3GS7BmOsNdA9iB2z/9Ik0e1jrx6+lB1oU/e72d9VzYUdGGVfEHSaVXEVVgq8Z4p38sR7nKKqnmRZA3A4nnnmVcyCbn6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIBl43SWXjnfdE3S8S631KaFHQP3l1LhDlCwjdiln8w=;
 b=hEahhJi7HSRl8DFFI2HEPY1Eqq1humJ/P5GF6DK/wsj9nx6TJRhsUuNGV4Y7prCvbZ2Kq1lyi6Ru72+vDnfFBzlgy2tFKUbiMEyQIG5NeZu0e4IEnT2ORlHiyUf1wgAsTUfLU16p6yu/0uekyHW1oppkB5Gv/YO3OB6J+cyg1k8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR1201MB0154.namprd12.prod.outlook.com (2603:10b6:4:58::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Tue, 30 Aug
 2022 07:33:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 07:33:55 +0000
Message-ID: <1de21f6e-4b11-ee9b-1b54-fd67728766ad@amd.com>
Date: Tue, 30 Aug 2022 09:33:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] drm/i915: audit bo->resource usage
Content-Language: en-US
To: dri-devel@lists.freedesktop.org,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20220824142353.10293-1-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220824142353.10293-1-luben.tuikov@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0005.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 943226b6-ebe3-47e6-c36a-08da8a59fe48
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0154:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnQp7R3Z5vWSC1kXaXyCn8yV8eRCk3QErURikNzzADppH2rUVLTPShqnsQ/+nSuZ72rqlnPkaU6AiFZtzayWqtjeNQu5ic7yk2XWjhGF/p8yaKV+6FCPcIFwljsaG+Lbsab9Sa406/+GmYdpiUEj0Q2ZiUAfA1U1XA026CDGMBFr9TY8wa6e5UOwzrLDtu12VfkUwcioHPpGTN0kl68K/6MLOBu1qqDGkRAj+hN9lYdV/3OYQVld4T659hXnuThGemoCdOVCZQhwHvItfUcwtd/bRboTOP19oAs+KznzsVSpU2yWVMOw4TkJ7m5aB4uCx1AEI3jB5Aoe3ZcK13uipz2z3+bayqsjMm7RpcR9En+uSixgjfj+bJGY3iYjoIWlPjln1gXxEzsdXwsxoVtqtbDFdCAQdm8v0HFbLn7rQvGGIbRmyVj11lL3P6Q4/65YoQMMuNHPb7Pem8YwaLWrEKAxI/cp+MlbPOPr4YMhXu1QKBOcx04Qv/hRyRU5Fzt1DlcbPNhS+f8nRc5haMSrVo+HMIOh9mlUz0Yt50kyM9eSxX9iCI35Q/NyquJSvzGWJ73iJ64maiXkFevmvgIAm4yb+NipzT0fx45nE4RywfJ/1+0UCWILzPv7kmjFTFva8kEKYz+ILiu5RsnlUNzz5WyTojDv2ECMLTUqHH+qxD3QRclUg6OahxoyzeGLvx75SGOe9cTax9lu/1RkijoiZYNCMrT7UffeDDFdCKSIixNowtSdmoWDx1fMth4mPsH37uQfCtwBodJsltWpot2IhONoXrq6xCtHj9rOhacOQtw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(346002)(366004)(36756003)(2616005)(186003)(316002)(31686004)(6666004)(6506007)(83380400001)(2906002)(6512007)(26005)(66476007)(86362001)(31696002)(4326008)(5660300002)(6486002)(478600001)(8936002)(41300700001)(38100700002)(110136005)(66556008)(66946007)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHJ0MkUrdkV4VVQ0ZEpJdVY0bU9HVjFXaEdUZDQ1Ym1PaTl5TTNzQ0llajBz?=
 =?utf-8?B?WWt2ZnMzMjRNVmNtY3hMRlZrSi9sdGVXMTZLNCt5Smo2OW8rdWVJa1VkUUhY?=
 =?utf-8?B?SUJibzBLSG4vU1NTZC8vaExEdG9qQ2Q3Si9Iclh2aTlEZkVhWVlzQmRhT3h0?=
 =?utf-8?B?MjdYVzh4UGt3Mk01dUU3UXZjWmRsekplb2lIdXk5NmJIV3puZzZvZXE1ay9X?=
 =?utf-8?B?UVZyeEp0dUZhVnRnb2RFbU5jeVhRTURiZlI4VVAvLytvcHdkd0VWUmZrTkFh?=
 =?utf-8?B?c3Z6RjNtWWwvNmpoUDh3MlBpUHdPREVreWQ0Vm9MTHE2Nm5NakRtUG4ybStB?=
 =?utf-8?B?QTR4b1RsSlBCSERuUUFLaDdsYUNjNG9UZkNNSmhVZVMyMjg2SDQ4cmtwZGs1?=
 =?utf-8?B?UHViTFBQN29ZWWM2Q080ejdKNGFrYk83NlhtUVZVRFpUUG5FRnlJR050OTVX?=
 =?utf-8?B?dytzWnZCdVpGS1A2L2ZoNW1hRDR3b2pHc21qN2tOV3htNVVBdVJmNFZPMjcv?=
 =?utf-8?B?ODd3VE1RazRROWFYRVNXakx1TTc0ZzI4Z3doVk5OWlFRZGxwZ25QQTBtckNW?=
 =?utf-8?B?MHVIWXYranVMUS90NFpKNVR3KzI0cCtHUmszNmc2V1Y3UDdRRmliMmNtdTBD?=
 =?utf-8?B?eHNLL2pwcFdxTmdvL2VUQ2RKMWg1MWVZblVlaE4yb014OWtOZ29oc1JtZThE?=
 =?utf-8?B?ODVKOU9tSmpmSEVBYkxJdVBYamVXczdBME84bDg2NHovbExQdmVhZEc3VW1S?=
 =?utf-8?B?bHE3a1AwaCtlL2VBNTR5QllBZEkySzRxcmx1bUhtbkpEVi9SZXNpSm9SWDNF?=
 =?utf-8?B?NmZubE0yclF5TkdRSnhHYU9IWXRnQnNkWWFLeVIrdmFlSVBtbGFoSU9sMHZF?=
 =?utf-8?B?empBOXZ0aWpFMTdqcTRmQWRoVmRXM3REdHFLVk9vcGZlOUE0WHgxM1ByOFY1?=
 =?utf-8?B?bC9tTlpzN0VENG1lQzNQZlpNN1JXRGlPKzJxc25qRGxXUVZLdVNVYjdmUGNE?=
 =?utf-8?B?MGtkMmNGN29DUjdGQ2kvN2hxOFhkVVZsYVMvM0FTZVExVHVVRWxoVjkyeWt4?=
 =?utf-8?B?dTNac084S2FGNUt5elFvbzdvQWR5RldKbFBGSmsyUW5VVHdzMHdabFpzdDcz?=
 =?utf-8?B?cHR2UmdiY1FDY1k3TjVTdnlkK1BpZGhlOWxFZWZwZUQ3ZGVCU2FKREUxU0xu?=
 =?utf-8?B?c1ZVK1paaE5ValZBNkNyQk1UMnJTdW56MU9JT2pFSnpqREdGYkd5bmF5Skxx?=
 =?utf-8?B?VUhYaXJ4TU5uR3A3dk12OFV0S2dBTTREUzEzdTUwRi9UMFJLdU5SL3gvWVFD?=
 =?utf-8?B?alMrS0xEaW93ZkdLT1VnRkc3WjRSRkNNZHRTaW96dVQwTGhOMmNsdCt5RG8v?=
 =?utf-8?B?emRmYTBlOEpmSktKdFIzSXFLK3JqZWQ4ZkRSbUg0QWkzdkxPdU82S1UyMjly?=
 =?utf-8?B?cXh2U21jOEc1OHljUXhvQWd3TkhDYzZEczFTVjBTZmlLOTBmeFJma0NWem9h?=
 =?utf-8?B?S043YkxKTUVQbUI1NXFPL3Z6eWE5Y1pUTk5EdzVEYjFDSlJZTWtJV0hjQUs4?=
 =?utf-8?B?Ky9IN3R2TWs5NENheFhJcEp4cFVGdmdqeVgwWG81RWJMaC9BZEFJZ1VHRUVs?=
 =?utf-8?B?bU52Q20rY1JNb1FBNHpXWjBZVmUvRzBxd1dnNDRPb0I3b2pkUUhVS1JJZ3Bk?=
 =?utf-8?B?b0JlQUQvK3VYSzRITUlEQ1gxSGpXV09OWjlianpIQmVsWENjeFJQekN2UUhu?=
 =?utf-8?B?R2lDem4wRXBndXVjditkUVV4U21zTEhEM1BabURMLzFxY2dWNE44cFVRNEtr?=
 =?utf-8?B?YjU3djJDc1ArdVloU00zeEFSOSswV284T1BjaVdMMTNaVWR3ZUtlVEkyZFJt?=
 =?utf-8?B?TFhXZ1hzalNpSW5rYjgvckZIVTZnMldPR09FanRtVU5rNTdMWlhVZTQ2YkxX?=
 =?utf-8?B?YUZuaFRoSExOKzY2QmMrcVZGcyt3SWxaT0NMek5Fd2RKemYrb2w4VlVJSzlm?=
 =?utf-8?B?VVllNFlSRFZHWDU3MEhoNWpqYXpyZWpVbTZ3ZGJnZzRZb0huaWFOZlZ1VWFq?=
 =?utf-8?B?NzJYY3JZMjV4V2JxbmZyWWRZaDdFanN1QlhtSUhub3VmQTcvVG1yQUNpaGlq?=
 =?utf-8?Q?DNI5XZvOU6xpoAqrIB6Xj1aix?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943226b6-ebe3-47e6-c36a-08da8a59fe48
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 07:33:55.1281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qaIpq8EyNMv3k8EAr7TKtvULktBSqqMQdQI4X6FGfvHU0OnuFih7eCl51913e33
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0154
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
Cc: Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

can we get an rb/acked-by for this i915 change?

Basically we are just making sure that the driver doesn't crash when 
bo->resource is NULL and a bo doesn't have any backing store assigned to it.

The Intel CI seems to be happy with this change, so I'm pretty sure it 
is correct.

Thanks,
Christian.

Am 24.08.22 um 16:23 schrieb Luben Tuikov:
> From: Christian König <christian.koenig@amd.com>
>
> Make sure we can at least move and alloc TT objects without backing store.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 6 ++----
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
>   2 files changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index bc9c432edffe03..45ce2d1f754cc4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -271,8 +271,6 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   {
>   	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
>   						     bdev);
> -	struct ttm_resource_manager *man =
> -		ttm_manager_type(bo->bdev, bo->resource->mem_type);
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   	unsigned long ccs_pages = 0;
>   	enum ttm_caching caching;
> @@ -286,8 +284,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   	if (!i915_tt)
>   		return NULL;
>   
> -	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
> -	    man->use_tt)
> +	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR && bo->resource &&
> +	    ttm_manager_type(bo->bdev, bo->resource->mem_type)->use_tt)
>   		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>   
>   	caching = i915_ttm_select_tt_caching(obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> index 9a7e50534b84bb..c420d1ab605b6f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>   	bool clear;
>   	int ret;
>   
> -	if (GEM_WARN_ON(!obj)) {
> +	if (GEM_WARN_ON(!obj) || !bo->resource) {
>   		ttm_bo_move_null(bo, dst_mem);
>   		return 0;
>   	}

