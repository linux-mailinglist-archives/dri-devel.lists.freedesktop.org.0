Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A022B1F479
	for <lists+dri-devel@lfdr.de>; Sat,  9 Aug 2025 13:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FF810E172;
	Sat,  9 Aug 2025 11:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YLxn6cmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B0010E164;
 Sat,  9 Aug 2025 11:58:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 51E895C4396;
 Sat,  9 Aug 2025 11:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A95C4CEE7;
 Sat,  9 Aug 2025 11:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754740681;
 bh=96kNACRVCV1c87TFTqINC4yqHRBAKaSPpsPng/1U7Ig=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YLxn6cmZfxv/e3LqoLgDaqqG138UdGxN0qEuIae/myH0Yy7NDNe1IBO6Gtc1BgL8e
 xLAkWuUMU9rToaM+GsmQy/u6SBPKvll0TNnyyQuRHy4BWuh29UkrxeVd0qXNOmHc4U
 PaoD3IGEoFlxEsKyl3vcMmDTsa0K8H7tl/TAU8niDOz5+Gq3mHWXOiITgCD2gD9CiT
 71nxKaV3Sqjm0JDOpbuA+ccgiwuI1GhAknU40P/XVek8iN/htP4J0pAhjkIRgZFs+D
 9NNQ5pemm5baU6PoYIMel+7Udydi+0CsK3qGOjwR6zWsFxuB8WQy4FstDevpMv+dEL
 ut4TjM7bct2AA==
Message-ID: <2cbb1df8-bb1c-4bae-8be0-c2ce2c7fa6fc@kernel.org>
Date: Sat, 9 Aug 2025 13:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: nouveau: fifo: ga100: fix null pointer dereferences
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: lyude@redhat.com, airlied@gmail.com, simona@ffwll.ch, bskeggs@redhat.com, 
 kherbst@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 akhileshpatilvnit@gmail.com, skhan@linuxfoundation.org
References: <aJcACwrvcjCq78eH@bhairav-test.ee.iitb.ac.in>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aJcACwrvcjCq78eH@bhairav-test.ee.iitb.ac.in>
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

Hi Akhilesh,

On 8/9/25 10:00 AM, Akhilesh Patil wrote:
> Fix potential NULL pointer dereference in ga100_fifo_nonstall_allow()
> and ga100_fifo_nonstall_block() when nvkm_runl_get() returns NULL.
> Fix CVE-476 as reported by coverity tool (CID: 1660771)
> 
> Fixes: 55e1a5996085 ("drm/nouveau/fifo/ga100-: add per-runlist nonstall intr handling")
> Addresses-Coverity-ID: 1660771
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>

Thanks for the patch.

> ---
>   drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> index e74493a4569e..a441fb602f28 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
> @@ -520,7 +520,9 @@ ga100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
>   	struct nvkm_fifo *fifo = container_of(event, typeof(*fifo), nonstall.event);
>   	struct nvkm_runl *runl = nvkm_runl_get(fifo, index, 0);
>   
> -	nvkm_inth_block(&runl->nonstall.inth);
> +	WARN_ON(!runl);

There's two potential cases here. Either nvkm_runl_get() may expectedly return
NULL in this context, or nvkm_runl_get() returning NULL would be a bug.

In the former case we should gracefully handle it, i.e. no WARN_ON() etc. In the
latter case, there is no need to check, otherwise we'd need to check every
pointer for NULL all the time.

In this case it should be the latter, so the code should be correct as is.

> +	if (runl)
> +		nvkm_inth_block(&runl->nonstall.inth);
>   }
>   
>   static void
> @@ -529,7 +531,9 @@ ga100_fifo_nonstall_allow(struct nvkm_event *event, int type, int index)
>   	struct nvkm_fifo *fifo = container_of(event, typeof(*fifo), nonstall.event);
>   	struct nvkm_runl *runl = nvkm_runl_get(fifo, index, 0);
>   
> -	nvkm_inth_allow(&runl->nonstall.inth);
> +	WARN_ON(!runl);
> +	if (runl)
> +		nvkm_inth_allow(&runl->nonstall.inth);
>   }
>   
>   const struct nvkm_event_func

