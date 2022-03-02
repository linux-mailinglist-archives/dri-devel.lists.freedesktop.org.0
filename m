Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBDC4CA5E4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 14:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D077A10E4AC;
	Wed,  2 Mar 2022 13:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EE610E4AC;
 Wed,  2 Mar 2022 13:24:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eouFAoe4d1Yvibvu/QGUE0wpiqYZYz2IwaQ3SZhRByFyTNfIfXOCRVfduLZMp+awQd/H1NsIBGcT9vD89bO4IMKu81fmAxo1nsrgOt/qGAy6EzHiEFl4AARamx1kiXx0nmAguZ+0bjeC++D+LCMI7LPjbH5SUllMD4zS1mcny7bQEBl5cQA2x068m8uxN18ODmwLCw4RBTMfsiPrhNiuC1JgbA9kYvmA9o+9eMl3+3Gh3P2KZBCYulOEVMQwKYpsdVCMNYEdfZdVeqlTvgERLFD+oXOn/GZ6WAXIlWiHtzlqyEhSJ4YpWH7mY39Oqm6bTX6NHoeCanQWvULTRKx1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPsx4crHN3wGvmi34Bn2hZo/ym6MIXXERudp7iZtGjc=;
 b=Hv9hQl1ruvCZLoTJYUck1dAG+0dZD2m946WYRrKZ2re0fIz9lvvYBH/KqM0/uXTHUqnFmUC/Wt+iR5yC/Q5SpzN+KL0rfV//8eQSA9UmQR5KQw6rFU5XQ/7gd9yZPmkeYBGeqACbt5nzqFVeFfxV2rpJ5Bc09w6BRa4ty6rFCZKecH9jE5w6RvQUa+bfMCFfj/44FEHAyoDHam5V1rZqDJcnI5x4nDDVxHtICzdwsXAfX9dVnpLhm0IKit3dSUn2f5MexB4NIcWCcIzehYrVFDNKEqYURIWHNmMNWXuWgFy86z6pNJ9P5L6YlRTgsGBtp+as32yOSpkva8FQVZLtMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPsx4crHN3wGvmi34Bn2hZo/ym6MIXXERudp7iZtGjc=;
 b=yQRrGSAWYebyNX/aisOTKsbGW/9db4AXC1KOGbqEOoE6I8PHx6aYzDvW5RTbU5/kzL4k0e9PIfFeEMq1V7Xs9X1q0+hZfhRP7b6klpkPIhNpkb7BGn48Eku4NkOaYjzB36A3diDk3BOS4M/wrTUaEU+Q54M4eQ0XN/PyiREGKtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3438.namprd12.prod.outlook.com (2603:10b6:208:c8::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Wed, 2 Mar
 2022 13:24:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 13:24:55 +0000
Message-ID: <5dbe9c82-2f84-ec10-36e7-9fc3900938c6@amd.com>
Date: Wed, 2 Mar 2022 14:24:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/4] drm/ttm: parameter to add extra pages into ttm_tt
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220301215334.20543-1-ramalingam.c@intel.com>
 <20220301215334.20543-3-ramalingam.c@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220301215334.20543-3-ramalingam.c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a27d8dfa-5ecd-45fd-dc43-08d9fc500ab2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3438:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB343811171053928703A13DFE83039@MN2PR12MB3438.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eBPh9W4S+2qmVLR5YyCbpwJgdc6rBCtDWXf/90nHR7OXstR09Z7H1QxUQRoj80Aom86Wgxw017CrRo3cEWB3pQI8EXb2orpmDX74SGywfFRYUM0q6BqpoA4U7N6MScuxq5a6+bkOr/mY1DiOdCDm1Cgs5W1gD3QCSyIEmzQlA7sJTPgXubvQHAfyNvu5aHQ7HAyV2Xj+SvgTTS1Z/W+fwraDkYqXbj46lE9hnvyR6nAopvZ3JA/wRGzwd0+je+k/s/5und9aNPDd6w0YYtHgx3cGzkC7fWuCRxAFak+nVh9F1hT70sfl9CowRiMYGf8G7GyZ1ux7nsgKazO8pj0312v/CL8uGOCmK+2sUn9ae2yJA38pVdd0esqAv99uFUIPgfy3M3X3oC9SGmXPviHLSc1UThJiwABOAKIjR0D+m1QOcFwaxF/hIb7YW5qcM7MSaU+FhjTBEfPpbnnYDEkqbpQaH3oDFHrKt5KCvbqlyuJbNc8zTLFq0BHYq4/SWPqcLIAX5S9cSibWW0h9bgIuLTqTLnB/Lphhx/H4Cxigw3RJxJdWq7UkZQWxaGaaciWMR9u5RVa512tpf7rnUyQV5L050ilp1YmiZ/U4bgcpPKZ7XgEHtxMZWEWsumYo5hjb6KStaVd0EladXC3fiG0LCzVzoq2okBOxJi4+GD837W5kYFDPuxYByPKIAL8SQk9LSRu7xVktWVGkkyIZyMnQ9BxyvCK3Y2xaijFRIimeyZNMBm57C/4Qz7/KTLUP9x7Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6486002)(36756003)(6506007)(31686004)(83380400001)(508600001)(110136005)(54906003)(38100700002)(6512007)(86362001)(31696002)(5660300002)(316002)(8936002)(186003)(66476007)(66556008)(66946007)(8676002)(2906002)(4326008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTY4Rm9qWEcxOG8wUUdZOE9ycW9mZDZFbm81Y0JodnhrZ3ZJQkFlcGU3SXFY?=
 =?utf-8?B?aHYwT1JFNENiSjJEemV1c0RudGQ0ZUVqQlRIM0xxMjk0cmdhdE5pK2ZJZ1E0?=
 =?utf-8?B?UHpXaW01MHZiUFAzWWUrVHczODd5NjlneG5BMjVDZVhsZW93aHVIcms5ZUN6?=
 =?utf-8?B?QUxDdmV1MXM4UkdJZ2c2U2dFVFZjTitPVzVZbnQvZzZGK1d0eWNVdU95aEdI?=
 =?utf-8?B?V1VuTjRua2IzdG9TaEtLTVZPeXk2QVFkWXYyT2hrUGZRRkRicEN1ZFpvUytk?=
 =?utf-8?B?THJZNDJoaWYwdEF0Rnl5anNpMEV0VVZoTzhPSHNTS2wvbEdjYVJCOUVaZjZW?=
 =?utf-8?B?M0ExdS95L0lBUVhtaERwZnI4NzBVNDVwcSsvQ1hHRzNOTU92MTVuTlU1V3po?=
 =?utf-8?B?UUhJQkwzK2xHa0xrOHFwaFhLV3JCanJtMFdTTjNHUlQxOXl5L2dNRjF3VnVj?=
 =?utf-8?B?Y0FGSG5rZWtxS0RUWjFBaWduQW1mVHhtRWlheFYrcjNhTDYxdU1XTkxWaEQv?=
 =?utf-8?B?ak9jOW1vM2tmM0N6cHdJQ21sVmZLc3cyb3NuNVFMUk1IUzY0eTNodldZdVZh?=
 =?utf-8?B?WUNkS3VUaEJGNEUxeHVFRlgxYUNCb2k5dzRHbHl0QjI5OXV2WmZpdHkzNFV0?=
 =?utf-8?B?OWVESy9zakxNdXoxOHpRdVErY1RKYWR4RHJCS3lZMTFsRjBsNy9hWEcvTjVM?=
 =?utf-8?B?K0hVanpjVkU3RU9iYWtuRTIrcFhmU01MS293QWVvSWZwME04VmorOVdXeFFt?=
 =?utf-8?B?bnozSVg5TzJRSHYrR3FFVE12V09OV3F2SFB2SVBFdFVFYUZNWHFpV1oxZDBq?=
 =?utf-8?B?LzByRjhyVmpQcjRnYmI1Ykhvd080QU5ibVViUzlabDRqQXUrQ0NzSVJDR3VB?=
 =?utf-8?B?MUd6YjgxazRha3plazd4VEl6dUlaeGpVZGtVWFJ4NS9PTjNDMC8vT3cyWU1S?=
 =?utf-8?B?bitGL3pOTitJM3A4c0o4MHJ6SVZHM3pkci9VZnN2RHE4MmkzSmlPVi9zZGRV?=
 =?utf-8?B?TWM3Q1ZYaFF5WWJSRTh6WFByS3k4dVJKaWFlYittVkJFU0J0bXR1V3lDZmZk?=
 =?utf-8?B?ZG1kbWJSZzFnNmVsdHNKd0VxbHdXNWNDdnZLc3Vna1BPWFlmSXdBQ0h3ZXYy?=
 =?utf-8?B?akhZVldSSlV3SEhzb3BPRFRiM3g5ekJHa2h5MXM0ZXpieEpyamNiNGl4SHlp?=
 =?utf-8?B?OXVZYThxSXJvdjJvdlpqM2dLUVpmOW1TT0llZTUzQWR6dXdFSU8rUlR5azZp?=
 =?utf-8?B?Zk9ObVE3QmtodG9DSWt3eThVQVllUnN2QkRVK0RGSXZyUHdpbHhjRGd6a2FO?=
 =?utf-8?B?RTJzRTFFejZNYTJUM1RVSGlGeWlmM04zVkt5MjNEVVljdGpaQVJqSmt1aXJi?=
 =?utf-8?B?WFpmVk4zekpYUzFFRE9zSWQzK25SUDl3K01wTytEeWlIc0ZDNmNiNUR1bW5j?=
 =?utf-8?B?dXhqNXd1MElvQjBQUFVwMVhDVFdHU3dsd2RtWndFOXZGVi9wSzFEdFJWNWp1?=
 =?utf-8?B?UWNLa0RxWnNjY1h6akhpZFpUNEpZUkZDOFVIWUpuS2p0MGg4L1dPK2hKLy9i?=
 =?utf-8?B?T2FibTZzeEI5SDk0MUQzc2wrTjVJVURJS0VtRUFudFJaRHBLbXlyV0ZTZ2tx?=
 =?utf-8?B?ckZOR2VQZkxSbE9lM21HTWZLaVdzL1RpNnN0bkptZmhVQjBEWStUSi9neThU?=
 =?utf-8?B?S1N0WmwrL1d2dWxaNkdSQnllcVRKUlVTM2Z2NEpIeVZEUUloWVpTT0FpN1Nj?=
 =?utf-8?B?ZnU5VXBEYjhKWU5weFBZbXJQaUpQOWo4YkNSbUVqRTR0RGVtcC9yeHlhVVhF?=
 =?utf-8?B?MzNTdUs5MktSQUhEakVPcGZQTDVwaDBYK3gyWlpKbUVza2hxSUFnaEhjbWFB?=
 =?utf-8?B?ZkE0cFdVQnpBQy9WamRkd3dJcU45Zno0VS9SQnFXN1NvYWFYZGZYTVJLQmQw?=
 =?utf-8?B?WVBSUlRWYXdQbG9LbXE5UU1JZHhJbDYvMkJDdlFxRnFRRkJBaDJnTVRNRG5m?=
 =?utf-8?B?a3E0WU5xNnNKSHhXL0Vaa1E5Z0tXcnhEcm1FaXRQamkyZCsxUDlhR3cvcllV?=
 =?utf-8?B?MndZcER5Q3pqMG8yY2psb2hXNEZjNG5PVkhtRmpsNnpJelUzU1o1VEFxTDhQ?=
 =?utf-8?B?bWFGdDZFelpsbWxzbzJGMVhiOWRCZkpZY0ZCMVdGdmhENkN4VEVRbUR5c1pH?=
 =?utf-8?Q?6iCj1XCfVnsaHRDysR2FaHU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27d8dfa-5ecd-45fd-dc43-08d9fc500ab2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 13:24:55.8900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iY/N6VmJ0UHAi1aIWvVSUVlNhhgHPQs3F97atvePv2F0KT16IEDazexrtddcq0HX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3438
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.03.22 um 22:53 schrieb Ramalingam C:
> When a driver needs extra pages in ttm_tt, to facilidate such
> requirement, parameter called "extra_pages" is added for
> ttm_tt_init
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Christian Koenig <christian.koenig@amd.com>
> cc: Hellstrom Thomas <thomas.hellstrom@intel.com>

With the nits pointed out by Thomas the patch is Reviewed-by: Christian 
König <christian.koenig@amd.com> as well.

Let me know through which branch you want to push this upstream (i915 or 
drm-misc-next).

Thanks,
Christian.

> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c      |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  2 +-
>   drivers/gpu/drm/qxl/qxl_ttm.c              |  2 +-
>   drivers/gpu/drm/ttm/ttm_agp_backend.c      |  2 +-
>   drivers/gpu/drm/ttm/ttm_tt.c               | 12 +++++++-----
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
>   include/drm/ttm/ttm_tt.h                   |  4 +++-
>   7 files changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index dc7f938bfff2..123045b58fec 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -867,7 +867,7 @@ static struct ttm_tt *bo_driver_ttm_tt_create(struct ttm_buffer_object *bo,
>   	if (!tt)
>   		return NULL;
>   
> -	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached);
> +	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
>   	if (ret < 0)
>   		goto err_ttm_tt_init;
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 45cc5837ce00..1a8262f5f692 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -283,7 +283,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   		i915_tt->is_shmem = true;
>   	}
>   
> -	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching);
> +	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching, 0);
>   	if (ret)
>   		goto err_free;
>   
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index b2e33d5ba5d0..52156b54498f 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -113,7 +113,7 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
>   	ttm = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
>   	if (ttm == NULL)
>   		return NULL;
> -	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached)) {
> +	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached, 0)) {
>   		kfree(ttm);
>   		return NULL;
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> index 6ddc16f0fe2b..d27691f2e451 100644
> --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> @@ -134,7 +134,7 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
>   	agp_be->mem = NULL;
>   	agp_be->bridge = bridge;
>   
> -	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined)) {
> +	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined, 0)) {
>   		kfree(agp_be);
>   		return NULL;
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index d234aab800a0..1a66d9fc589a 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -134,9 +134,10 @@ void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>   static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   			       struct ttm_buffer_object *bo,
>   			       uint32_t page_flags,
> -			       enum ttm_caching caching)
> +			       enum ttm_caching caching,
> +			       unsigned long extra_pages)
>   {
> -	ttm->num_pages = PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT;
> +	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
>   	ttm->caching = ttm_cached;
>   	ttm->page_flags = page_flags;
>   	ttm->dma_address = NULL;
> @@ -146,9 +147,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>   }
>   
>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> -		uint32_t page_flags, enum ttm_caching caching)
> +		uint32_t page_flags, enum ttm_caching caching,
> +		unsigned long extra_pages)
>   {
> -	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> +	ttm_tt_init_fields(ttm, bo, page_flags, caching, extra_pages);
>   
>   	if (ttm_tt_alloc_page_directory(ttm)) {
>   		pr_err("Failed allocating page table\n");
> @@ -180,7 +182,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>   {
>   	int ret;
>   
> -	ttm_tt_init_fields(ttm, bo, page_flags, caching);
> +	ttm_tt_init_fields(ttm, bo, page_flags, caching, 0);
>   
>   	if (page_flags & TTM_TT_FLAG_EXTERNAL)
>   		ret = ttm_sg_tt_alloc_page_directory(ttm);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index b84ecc6d6611..4e3938e62c08 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -517,7 +517,7 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
>   				     ttm_cached);
>   	else
>   		ret = ttm_tt_init(&vmw_be->dma_ttm, bo, page_flags,
> -				  ttm_cached);
> +				  ttm_cached, 0);
>   	if (unlikely(ret != 0))
>   		goto out_no_init;
>   
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index f20832139815..17a0310e8aaa 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -140,6 +140,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
>    * @bo: The buffer object we create the ttm for.
>    * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
>    * @caching: the desired caching state of the pages
> + * @extra_pages: Extra pages needed for the driver.
>    *
>    * Create a struct ttm_tt to back data with system memory pages.
>    * No pages are actually allocated.
> @@ -147,7 +148,8 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
>    * NULL: Out of memory.
>    */
>   int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> -		uint32_t page_flags, enum ttm_caching caching);
> +		uint32_t page_flags, enum ttm_caching caching,
> +		unsigned long extra_pages);
>   int ttm_sg_tt_init(struct ttm_tt *ttm_dma, struct ttm_buffer_object *bo,
>   		   uint32_t page_flags, enum ttm_caching caching);
>   

