Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B557B69A21D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C8B10E19B;
	Thu, 16 Feb 2023 23:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1556F10E19B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 23:09:58 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AB13A66021BB;
 Thu, 16 Feb 2023 23:09:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676588997;
 bh=eJ31KjQvfQ1OAUYYt2ngpiSKt3yk0pd1vQYJrvXlQMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=drPUZkvM1cTe3zfqASEwhAq9wlIuEQsSzLLIfL5qT2oxH/SQ0Bfrei/mCstanGeLK
 cJYU0TNIFgJXWmHPvm/YbM2Xx8LuaVWuFguMhmQ4jPpbXPdEF2dTdyxXX8vt5glsgX
 lP6ejH5vqDDT9UnIqfdc+1FM+4mUaJxwurG6EOLNUFp4omIvej9iH0O8EFdxXaacvP
 cMw4nvB7aZxGViBHxO7H0hYMt7qD8puLPMM06aPp4AFI81rqZBXNi9wkZDasbLHh4u
 SlbU0kG/t+5g49Y6kgzqsudtvkg85pDbcHy6O/NcpNhXqd25D9uYm9F1LFZjCd+iPc
 OGL8CFg4/kTkQ==
Date: Thu, 16 Feb 2023 18:09:46 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Drop device lock before
 drm_helper_hpd_irq_event()
Message-ID: <20230216230946.g3ojtx7na3smogbx@notapiano>
References: <20230116072234.3970768-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116072234.3970768-1-wenst@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 16, 2023 at 03:22:34PM +0800, Chen-Yu Tsai wrote:
> The device lock is used to serialize the low level power sequencing
> operations. Since drm_helper_hpd_irq_event() could end up calling
> .atomic_enable, which also calls power sequencing functions through
> runtime PM, this results in a real deadlock. This was observed on an
> MT8192-based Chromebook's external display (with appropriate patches [1]
> and DT changes applied).
> 
> Move the drm_helper_hpd_irq_event() call outside of the lock range. The
> lock only needs to be held so that the device status can be read back.
> This is the bare minimum change to avoid the deadlock. The lock could
> be dropped completely and have pm_runtime_get_if_in_use() increase the
> reference count, but this is not the same as pm_runtime_suspended().
> This also causes the internal display of the same device to not
> function correctly. Both the internal and external display of said
> device each use one anx7625 bridge.
> 
> [1] https://lore.kernel.org/dri-devel/20230112042104.4107253-1-treapking@chromium.org/
> 
> Fixes: 60487584a79a ("drm/bridge: anx7625: refactor power control to use runtime PM framework")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> FWIW I'm aware that this driver could be refactored a lot better.
> The work function might be simplified and merged into the threaded
> interrupt handler. The .detect op should be reading the HPD state
> from the hardware, not some cached state.
> 
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 7e1fb93a6ce4..bf1770b79bba 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1597,18 +1597,17 @@ static void anx7625_work_func(struct work_struct *work)
>  
>  	mutex_lock(&ctx->lock);
>  
> -	if (pm_runtime_suspended(&ctx->client->dev))
> -		goto unlock;
> +	if (pm_runtime_suspended(&ctx->client->dev)) {
> +		mutex_unlock(&ctx->lock);
> +		return;
> +	}
>  
>  	event = anx7625_hpd_change_detect(ctx);
> -	if (event < 0)

Are you intentionally dropping this early-return on error?

> -		goto unlock;
> +
> +	mutex_unlock(&ctx->lock);
>  
>  	if (ctx->bridge_attached)
>  		drm_helper_hpd_irq_event(ctx->bridge.dev);
> -
> -unlock:
> -	mutex_unlock(&ctx->lock);
>  }
>  
>  static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
> -- 
> 2.39.0.314.g84b9a713c41-goog
> 
