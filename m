Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3DEA9AEE4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 15:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E5410E7F7;
	Thu, 24 Apr 2025 13:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BkJgZDK3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B591510E7F7;
 Thu, 24 Apr 2025 13:24:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E6D65C3A77;
 Thu, 24 Apr 2025 13:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF77C4CEE3;
 Thu, 24 Apr 2025 13:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745501061;
 bh=5BvkCvimTwN5NICaMdIH9+jiIrA1JIL41Q3aBs5HSRU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BkJgZDK3qDzBeK7OGhanAll8tyyF2cUdBIpnmDCT/yVvKmNXwQQfggybwxP7+FOlN
 oUFznwgEpnchDMpmbCBzwiMAfiZe52Q796GdiyOpNBYI7Qinq1npnUSphs35RNIVPR
 H0UsxWORsKLJaOcJT4P8YmAIEFEJ6Uji0opaFKbIeF8RgSBH88PJEcroF4RWctFo//
 jxz80HJ78cPRjNZffFdGCm/oBh1jl9P0WouNkBSlAHjPJJgsiGLbxeXY9d9ziYtM+A
 EAfDd4YF4HTDOx63R/hh3kSz28pPQduVmqTUmujLyoNfQWymhHT2zPbxCBiQJdNJov
 bFscp05F9GhYg==
Message-ID: <609c8b1a-d7a9-4667-bd6c-1455c639fcd0@kernel.org>
Date: Thu, 24 Apr 2025 15:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/nouveau: Check dma_fence in canonical way
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250424130254.42046-2-phasta@kernel.org>
 <20250424130254.42046-6-phasta@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250424130254.42046-6-phasta@kernel.org>
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

On 4/24/25 3:02 PM, Philipp Stanner wrote:
> In nouveau_fence_done(), a fence is checked for being signaled by
> manually evaluating the base fence's bits. This can be done in a
> canonical manner through dma_fence_is_signaled().
> 
> Replace the bit-check with dma_fence_is_signaled().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index fb9811938c82..d5654e26d5bc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -253,7 +253,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
>   	struct nouveau_channel *chan;
>   	unsigned long flags;
>   
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
> +	if (dma_fence_is_signaled(&fence->base))

This is only correct with commit bbe5679f30d7 ("drm/nouveau: Fix WARN_ON in
nouveau_fence_context_kill()") from drm-misc-fixes, correct?
