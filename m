Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF734EA9DD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1490710E780;
	Tue, 29 Mar 2022 08:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9067910E780;
 Tue, 29 Mar 2022 08:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648544110; x=1680080110;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tDLiIM4fM4aVooDuS+m3AxIYkSfzmE5NwOQk6eQG/k8=;
 b=A6ApYhKpdo9hY2pJSwyXpvcJPnHIr3CFKluDdVc265R17Huz5S0E2Gxj
 HYdpj1VeGhk2DNHNgZUGF1mA5/Z4ybPSaDd9GWMfxC+oRvXCFnqOMpcC8
 5phP6xkM2XX1Wac0FGaJpamiSrSTQNFtZ9/ePVZybERqNHIafrlTvSMDn
 QMkCiC1s3e4NYWIND7Yo85skpNitlmQ18BbK8wh+cjQeGlSXSsn641UMZ
 Rm/ulcLB28ufQY7w1gMWbBg89h+yhFhgUryrXkhOWrbHN77WEIxQum8t0
 yJf3jWLavxeyhOL/UE5NJjTidDOh7xzktaoc/pJJVR56vkIjXVLOhvoFd g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="239132171"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="239132171"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 01:55:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="546301604"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.38.4])
 ([10.252.38.4])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 01:55:07 -0700
Message-ID: <f57af86a-bbc7-ee6b-a094-ddb9b095c954@linux.intel.com>
Date: Tue, 29 Mar 2022 10:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dma-buf/sync-file: fix logic error in new fence merge
 code
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ville.syrjala@linux.intel.com, daniel@ffwll.ch
References: <20220329070001.134180-1-christian.koenig@amd.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220329070001.134180-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I finally managed to find a machine and tested this series. If it is not 
too late

The series is Tested-by: Nirmoy Das <nirmoy.das@intel.com>

On 3/29/2022 9:00 AM, Christian König wrote:
> When the array is empty because everything is signaled we can't use
> add_fence() to add something because that would filter the signaled
> fence again.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: 519f490db07e ("dma-buf/sync-file: fix warning about fence containers")
> ---
>   drivers/dma-buf/sync_file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index b8dea4ec123b..514d213261df 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -262,7 +262,7 @@ static struct sync_file *sync_file_merge(const char *name, struct sync_file *a,
>   	}
>   
>   	if (index == 0)
> -		add_fence(fences, &index, dma_fence_get_stub());
> +		fences[index++] = dma_fence_get_stub();
>   
>   	if (num_fences > index) {
>   		struct dma_fence **tmp;
