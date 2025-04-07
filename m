Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A42A7ECBC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 21:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0846510E11C;
	Mon,  7 Apr 2025 19:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WQ2XPV99";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E4810E11C;
 Mon,  7 Apr 2025 19:24:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C1A449FD8;
 Mon,  7 Apr 2025 19:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE11C4CEE7;
 Mon,  7 Apr 2025 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744053838;
 bh=YbNPsZN6HL6dUYMl9sFPgAsEQwv6L2hq+AKPCvpenEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WQ2XPV99IOL/Y10mTh4QHyHn0o/vzpByTSaB3ziQXI0TTrQh764O50bGN+6irqR1o
 +issO4W7mJYgBoNgWuUYmne37ynvTT5t2ma0xESdEfZn2ACZzx7GE3csBLYlPPZS8l
 5EzsXfvZJEtrs2N+Dnc9HTibCjMAfP4d3r1WnDqaqwkYT2OfN358IfwuJS9GtEG5cd
 nq2H18GPcgu9Fdj2tGAj58wKbsm1ECFNa7bcy3bF6ahcuBZ+WumQQIewmoobD5h83L
 0dkZLmbAx25zdoDTvLRg/OmjflKXnVBozXlefwUIT9M/kISo5qk7e716b1/NvU63Cy
 XhdWL1RyyYMqA==
Date: Mon, 7 Apr 2025 12:23:55 -0700
From: Kees Cook <kees@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] drm/nouveau: fence: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <202504071223.EDBF8A080@keescook>
References: <Z-2r6v-Cji7vwOsz@kspp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-2r6v-Cji7vwOsz@kspp>
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

On Wed, Apr 02, 2025 at 03:28:10PM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for an on-stack definition of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/gpu/drm/nouveau/nouveau_fence.c:188:38: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 7cc84472cece..7622587f149e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -184,10 +184,10 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
>  	struct nouveau_cli *cli = chan->cli;
>  	struct nouveau_drm *drm = cli->drm;
>  	struct nouveau_fence_priv *priv = (void*)drm->fence;
> -	struct {
> -		struct nvif_event_v0 base;
> -		struct nvif_chan_event_v0 host;
> -	} args;
> +	DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
> +			sizeof(struct nvif_chan_event_v0));
> +	struct nvif_chan_event_v0 *host =
> +				(struct nvif_chan_event_v0 *)args->data;
>  	int ret;
>  
>  	INIT_WORK(&fctx->uevent_work, nouveau_fence_uevent_work);
> @@ -207,12 +207,12 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
>  	if (!priv->uevent)
>  		return;
>  
> -	args.host.version = 0;
> -	args.host.type = NVIF_CHAN_EVENT_V0_NON_STALL_INTR;
> +	host->version = 0;
> +	host->type = NVIF_CHAN_EVENT_V0_NON_STALL_INTR;
>  
>  	ret = nvif_event_ctor(&chan->user, "fenceNonStallIntr", (chan->runlist << 16) | chan->chid,
>  			      nouveau_fence_wait_uevent_handler, false,
> -			      &args.base, sizeof(args), &fctx->event);
> +			      args, __struct_size(args), &fctx->event);
>  
>  	WARN_ON(ret);
>  }

Looks good to me. Good replacement, including the __struct_size() use.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
