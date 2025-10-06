Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7F7BBDAA1
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 12:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4758A10E30F;
	Mon,  6 Oct 2025 10:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kZQHbgFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C43E10E30F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 10:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759745996;
 bh=FGngKFGUOoQ67NlKMtIhMKfRHDJUydjDXUVwZnGvaXE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kZQHbgFEVkqzqny8xB1KGVW+PH0YijNBjcE5e/BG2gLnrJwsAbtVTFxphRzMbryFJ
 BqpJ9mDYcX46oFqbPoitbFPWL8KYRytLQ21LSOgY0t9h8Hww4ElKdfbNyDt65icNaO
 xWWy9DGhjKnoV5GxnD3QBlfu1lzTqKNFoeJqJBPp806DegVfMZPCJroc/fQHYbGtCq
 Mf699NiE0gIytJMSE6ZAICcdvlexlf/H251cE7N3PbNS0fT27oB1mu6N+FUQWeI3dV
 5IMnatuhl62PG4GmRoc98tuaMHDUQZds/PMtwV8Z6NMg1zkGZSQs3onk0qM78Lfoze
 knPNyxmoN4elA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A34A17E038B;
 Mon,  6 Oct 2025 12:19:55 +0200 (CEST)
Message-ID: <e03fb71c-5d50-40c6-b6f8-965319f472c9@collabora.com>
Date: Mon, 6 Oct 2025 12:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: fix device use-after-free on unbind
To: Johan Hovold <johan@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Ma Ke <make24@iscas.ac.cn>, Sjoerd Simons <sjoerd@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251006093937.27869-1-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251006093937.27869-1-johan@kernel.org>
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

Il 06/10/25 11:39, Johan Hovold ha scritto:
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

Heh, nice!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


