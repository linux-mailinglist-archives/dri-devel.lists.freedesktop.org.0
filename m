Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05513C0C589
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232CB10E393;
	Mon, 27 Oct 2025 08:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rufVP4OS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0042E10E393
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:41:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D1FA54185D;
 Mon, 27 Oct 2025 08:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEC6C4CEF1;
 Mon, 27 Oct 2025 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761554473;
 bh=p7L1ppdjpTPK5vdV3Mi+mMZfy8PqxfrJ0ZCIY6BoM3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rufVP4OSJtQ3/mqTsI9HPHrUO+OB+vlQGbAQqIDt1z1/AZr7oI74LCqffPdj8vLew
 JW1i1LFS8BrXSqZRhEm8DGIdLLQVtvMjlTR4+W3Nd5kmSFHSa0+5cnJLiMCDqe1zZi
 BZNURd+k0QiE1zTDpsPp4znfOXhDST9Y3ZAdAzHCG4QUeEz2dKvoj2FRR+7KtARw0K
 x93tfow3vIZdl4w3bnKt+Aq0n8eljgp5LLbcx8nSChwFpPFXxJxXmmuBeEl5qZ6Ewt
 QStYGjeV2llAJvn5SGcXYs1zeEWXAMkH7z30MF1MUyoV1y4kbm/N2jrDV4GJAx84ZL
 F0pZYbv/EemuQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1vDImy-000000000Gc-2Ow9;
 Mon, 27 Oct 2025 09:41:16 +0100
Date: Mon, 27 Oct 2025 09:41:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, Ma Ke <make24@iscas.ac.cn>,
 Sjoerd Simons <sjoerd@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/mediatek: fix device use-after-free on unbind
Message-ID: <aP8wLMrFTsJI-Lr3@hovoldconsulting.com>
References: <20251006093937.27869-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006093937.27869-1-johan@kernel.org>
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

Hi Chun-Kuang,

On Mon, Oct 06, 2025 at 11:39:37AM +0200, Johan Hovold wrote:
> A recent change fixed device reference leaks when looking up drm
> platform device driver data during bind() but failed to remove a partial
> fix which had been added by commit 80805b62ea5b ("drm/mediatek: Fix
> kobject put for component sub-drivers").
> 
> This results in a reference imbalance on component bind() failures and
> on unbind() which could lead to a user-after-free.
> 
> Make sure to only drop the references after retrieving the driver data
> by effectively reverting the previous partial fix.
> 
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.
> 
> Fixes: 1f403699c40f ("drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv")
> Reported-by: Sjoerd Simons <sjoerd@collabora.com>
> Link: https://lore.kernel.org/r/20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com
> Cc: stable@vger.kernel.org
> Cc: Ma Ke <make24@iscas.ac.cn>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

This patch fixes a regression in 6.17-rc4 that apparently breaks boot
for some users. To make things worse, the offending commit was also
backported to the stable trees.

You need to get this one into mainline as soon as possible, that is,
this week and into 6.18-rc4.

Johan
