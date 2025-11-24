Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F9FC7FCC6
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 11:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C266810E086;
	Mon, 24 Nov 2025 10:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bi2RSZIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFA610E086
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 10:03:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 75B7E403B8;
 Mon, 24 Nov 2025 10:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AD2C116D0;
 Mon, 24 Nov 2025 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763978613;
 bh=3OFtNIJlB5pb83NXaUCm1QhQaxVx50ZAfl+2hNDkg0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bi2RSZIhIrMeP9lQ7E6Lmm9GslpS3QdXywuDs9Fna/5l1DPEkZkA/RedhcXdqoZdD
 1utTkzWvZrIn1dFLitOdHpNORhel1fHvMHmVBd3JgQ6icLqYTo5m6nS9ZD+IGQQl4t
 BNa6eSjaJj0x0RjIUtxTPQ6isX7nQxOGoUvsqaz54aLB8So6aXI4d6dcRfzw9Sv+gk
 BsE5tMwq60c9kDu6ArZZUCjQ0uCNx8Zv6XJOW+rFhrSsfcgYjwBg+tbby5yE7hafcM
 Lus0cO5JsPfxtypi0XoMIp9JD9CYTEqK6+1Xrucbf1V7kFnUOU6puou0/bJOzXQaj2
 CMaT59c1woIqQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vNTPw-0000000025T-2FTh;
 Mon, 24 Nov 2025 11:03:32 +0100
Date: Mon, 24 Nov 2025 11:03:32 +0100
From: Johan Hovold <johan@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] drm/tegra: fix device leak on probe()
Message-ID: <aSQtdG3MiSq9YJAP@hovoldconsulting.com>
References: <20251121112432.32456-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121112432.32456-1-johan@kernel.org>
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

On Fri, Nov 21, 2025 at 12:24:32PM +0100, Johan Hovold wrote:
> Make sure to drop the reference taken when looking up the companion
> device during probe().
> 
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.
> 
> Fixes: f68ba6912bd2 ("drm/tegra: dc: Link DC1 to DC0 on Tegra20")
> Cc: stable@vger.kernel.org	# 4.16
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/tegra/dc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 59d5c1ba145a..7a6b30df6a89 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -3148,6 +3148,8 @@ static int tegra_dc_couple(struct tegra_dc *dc)
>  		dc->client.parent = &parent->client;
>  
>  		dev_dbg(dc->dev, "coupled to %s\n", dev_name(companion));
> +
> +		put_device(companion);

I noticed that this has been fixed in rc7 when rebasing so please
disregard this one.

Johan
