Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E316D39E590
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E116E973;
	Mon,  7 Jun 2021 17:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9162E6E973
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 990A63F462;
 Mon,  7 Jun 2021 19:35:15 +0200 (CEST)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="n7zS2qtx";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUVXLLch55a8; Mon,  7 Jun 2021 19:35:13 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 7705B3F439;
 Mon,  7 Jun 2021 19:35:13 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 040933600BE;
 Mon,  7 Jun 2021 19:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1623087313; bh=f0IFpF7vHABw1Ero2fjoOJXtcawV7BxUvIqeGOxYbSY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=n7zS2qtxON8Xq34PBAqysLtjdkwdI1njwwgc5KAx+C9SCvomagEmWQtit/FNbdU3f
 SOMJ2ZOvKJIpkdit3YjX+3U4hkAiBCDLDyWUirjqSPD+9Y1VECiUNSEGMKaFLuI4+5
 AahGYC2ux7RJCGXAxaYL5Um0GTxTuBBh/Re7sIOw=
Subject: Re: [PATCH] drm/ttm: fix access to uninitialized variable.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210607171152.15914-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <b623c6c3-407b-f1c9-eb5f-22ae248e78c3@shipmail.org>
Date: Mon, 7 Jun 2021 19:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607171152.15914-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 6/7/21 7:11 PM, Christian König wrote:
> The resource is not allocated yet, so no chance that this will work.
>
> Use the placement instead.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 7e7284da5630..0c74f4cb2a3b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -736,7 +736,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   	struct ww_acquire_ctx *ticket;
>   	int ret;
>   
> -	man = ttm_manager_type(bdev, (*mem)->mem_type);
> +	man = ttm_manager_type(bdev, place->mem_type);
>   	ticket = dma_resv_locking_ctx(bo->base.resv);
>   	do {
>   		ret = ttm_resource_alloc(bo, place, mem);
