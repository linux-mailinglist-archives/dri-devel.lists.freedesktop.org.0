Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6F64EA84C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 09:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C8410E420;
	Tue, 29 Mar 2022 07:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E00A10E413;
 Tue, 29 Mar 2022 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648537626; x=1680073626;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hJCPwH7SOlcNlxTVq5wQ0kZ37jUz1wZR7OY+KI6Gqrg=;
 b=QtLJhvQLVmLpBKYWx2mLR2xQUlmOzTxBrXt6XvfKhfZmH1HSjIZcICFZ
 fOzhDXPH/jfsSdoiCwmxoTqkrWyJBEliJeLoPfIYrDNvgI8kf3IP/puPM
 P0SaeLAjleZF84mEZ9C3jNIsTm5UvSU68P1LCevYcveIVZjbl8fPXpdf/
 zsmiccRyyJULNrT482UBjeUkfNqWwrNpUF4zmz5psenXkdQQcfOhLQnQC
 UM7v7ZY7BH9dF67SnyAd0n7HFynYio+lrSX976dHCpB7/LGiSdFBIVgzQ
 rXwatL1FaUkJ9fW8sWnRcDNylMVB1QsmP6pC2eHhdsVgOAP5fIvW8H2Gj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="246669322"
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="246669322"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 00:07:05 -0700
X-IronPort-AV: E=Sophos;i="5.90,219,1643702400"; d="scan'208";a="652722563"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.86])
 ([10.249.254.86])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 00:07:03 -0700
Message-ID: <3d46abe4-5113-e1b8-56be-19ac678d62f2@linux.intel.com>
Date: Tue, 29 Mar 2022 09:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf/sync-file: fix logic error in
 new fence merge code
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ville.syrjala@linux.intel.com, daniel@ffwll.ch
References: <20220329070001.134180-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
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

For the series,

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


On 3/29/22 09:00, Christian König wrote:
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
