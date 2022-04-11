Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BD4FBDF0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B6F10F647;
	Mon, 11 Apr 2022 13:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5185D10F647
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649685454; x=1681221454;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T821ySS8rZoHbTELJnuJuRoojb1w85tWwbUrDQrjjUk=;
 b=iD1ax9j1m/Wqi85HWDkYzjzFXHL7bA3IhD5oarlevNw9ShGDnMXQrCQI
 SKjVsNjh8inQOOcmoSTJKW9dL1xjhOpw8i7L2UZLNv9MjpiuCbQRLSXQd
 /KxDy6S7WtPtZXJEiT+gbpHHcvWFOFgRDvZUewgf30GVSvTZ5pqH6h072
 1iD4AvcLVTqQyJsrj+6+oiMP1MOIr8xwHN9pSgqtGjfpXRRzny1H7LlC1
 /VgYAUCqrEzGflX9EuZAJlo2qHX+xhaCMjGIknWuZG6YNEBE2aYpDx4re
 fSvi7J9EZkX3D+RKpnWvYJtgLzb9mQNAwtM3bkWQoRQe6KsMNhsT1IWe0 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="249401948"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="249401948"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:55:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="644091767"
Received: from dxharrix-mobl.ger.corp.intel.com (HELO [10.252.1.119])
 ([10.252.1.119])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:55:19 -0700
Message-ID: <ba95cca1-9aa3-edfd-3462-ab8afb2314d6@intel.com>
Date: Mon, 11 Apr 2022 14:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: fix logic inversion in ttm_eu_reserve_buffers
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
References: <20220411134537.2854-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220411134537.2854-1-christian.koenig@amd.com>
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

On 11/04/2022 14:45, Christian König wrote:
> That should have been max, not min.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: 73511edf8b19 ("dma-buf: specify usage while adding fences to dma_resv obj v7")

Should that rather be:

Fixes: c8d4c18bfbc4 ("dma-buf/drivers: make reserving a shared slot 
mandatory v4")

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/ttm/ttm_execbuf_util.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> index 0eb995d25df1..dbee34a058df 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -101,7 +101,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
>   			continue;
>   		}
>   
> -		num_fences = min(entry->num_shared, 1u);
> +		num_fences = max(entry->num_shared, 1u);
>   		if (!ret) {
>   			ret = dma_resv_reserve_fences(bo->base.resv,
>   						      num_fences);
