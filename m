Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAE2ADD5E2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 18:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A23610E77F;
	Tue, 17 Jun 2025 16:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zrgahzmy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D1110E1A3;
 Tue, 17 Jun 2025 16:27:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EA3484A5FA;
 Tue, 17 Jun 2025 16:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230A6C4CEF1;
 Tue, 17 Jun 2025 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750177649;
 bh=0JvMIX5VE3UZ2PuPbWz/hygBVEzRe8JIsK6JG4EPabc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZrgahzmyV3lWcacODYqYVlGg9f9NCrxzu+dTN817wgW+mAjHZSXfzRzOBmQidxTjv
 MaVj/2InldezhSjlyobccfl8edOX54u6RFetpiWIvQ8YqgXlBdheD9Upm16L7WL2+2
 s733Ze5JFdH8aTRJv02RCqDR3z32cA5Lvxz1CXir0LwREIs5+HjVmM5PyVmaIRPddF
 zb06UjGWAVtch9ahQ5z2D53FuEPyQ4uRSdnyYGA+v3w5De4/4tcr6YW0Pigjf/CN8B
 gVD2K7AVQ/N5Fxp1hC7xJUHIvRAATfVOo7WLk6LjMi7nHTxav4UMGti/AI5O0HF+I6
 b9nA0guskwKDw==
Message-ID: <03a49712-6b9b-4c04-8283-f2f04b331d2c@kernel.org>
Date: Tue, 17 Jun 2025 18:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/gsp: get zeroed pages for any device allocations
 we need
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20250617050904.153255-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250617050904.153255-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/17/25 7:09 AM, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This seems to remove some random behaviour around suspend/resume
> operations, and ordering of memory allocations.

What do you mean with ordering of memory allocations?

> 
> Cc: stable@vger.kernel.org

I think we should add:

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")

> Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> index baf42339f93e..4460da3239b5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
> @@ -1583,7 +1583,7 @@ nvkm_gsp_sg(struct nvkm_device *device, u64 size, struct sg_table *sgt)
>   		return ret;
>   
>   	for_each_sgtable_sg(sgt, sgl, i) {
> -		struct page *page = alloc_page(GFP_KERNEL);
> +		struct page *page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>   
>   		if (!page) {
>   			nvkm_gsp_sg_free(device, sgt);

