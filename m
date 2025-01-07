Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BD1A04315
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FA510E330;
	Tue,  7 Jan 2025 14:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lXi+wx3h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7069910E330;
 Tue,  7 Jan 2025 14:48:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CF091A416DD;
 Tue,  7 Jan 2025 14:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25DDC4CEDD;
 Tue,  7 Jan 2025 14:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736261296;
 bh=xxaRG9lwJbdVbuVlu8ldeSeKaq8OrnocA6ebMdDf7kQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lXi+wx3halfF7o1dogppSLKUwKIVX1NeBO6hrgFOVlIMKrPEtYuMMhMT2pPM4bKuR
 kkW+KSAYGIc8hgCPZqcJcNbd8P55njCGCiZT+50Rta50f3lVamuvkw68DECW8Hr811
 yPW/PJkvdooDPP4D2Dy/2zJr+N+qEBclR8G9Q/vcF+qXEAu+n81f2DOfuRV1Qr3+zD
 yf501+TG22KnCp0mfm+NclToTrVuG4mitEZCcG9fwttb4t0eqGrCL4T4+/XTVaOnW0
 P2kRygVO7RChD/AovRswn8XelpVHhhnO83h3QTY9VudtRyTdw4gFtoZbM8aNvAkUZv
 BmfFLDPWAXYAw==
Date: Tue, 7 Jan 2025 15:48:12 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/nouveau/disp: Fix missing backlight control
 on Macbook 5,1
Message-ID: <Z30-rE1KvMQv8_Lc@pollux>
References: <20250102114944.11499-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102114944.11499-1-tiwai@suse.de>
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

On Thu, Jan 02, 2025 at 12:49:36PM +0100, Takashi Iwai wrote:
> Macbook 5,1 with MCP79 lost its backlight control since the recent
> change for supporting GFP-RM; it rewrote the whole nv50 backlight
> control code and each display engine is supposed to have an entry for
> IOR bl callback, but it didn't cover mcp77.
> 
> This patch adds the missing bl entry initialization for mcp77 display
> engine to recover the backlight control.
> 
> Fixes: 2274ce7e3681 ("drm/nouveau/disp: add output backlight control methods")
> Cc: <stable@vger.kernel.org>
> Link: https://bugzilla.suse.com/show_bug.cgi?id=1223838
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Applied to drm-misc-fixes, thanks!

> ---
> 
> The previous submission seemed fallin in a crack:
>   https://lore.kernel.org/all/20240517110853.8481-1-tiwai@suse.de/
> so just resending it.
> 
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c
> index 841e3b69fcaf..5a0c9b8a79f3 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c
> @@ -31,6 +31,7 @@ mcp77_sor = {
>  	.state = g94_sor_state,
>  	.power = nv50_sor_power,
>  	.clock = nv50_sor_clock,
> +	.bl = &nv50_sor_bl,
>  	.hdmi = &g84_sor_hdmi,
>  	.dp = &g94_sor_dp,
>  };
> -- 
> 2.43.0
> 
