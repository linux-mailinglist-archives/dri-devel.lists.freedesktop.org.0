Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3327B5079
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 12:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DCC10E03C;
	Mon,  2 Oct 2023 10:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3398310E281
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 10:40:31 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0944B6607079;
 Mon,  2 Oct 2023 11:40:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696243229;
 bh=zdwCD43UfICihrrGOtD5MsrAfDo/vCHnNja+3qedKhI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T/l3DasIV6nFyGmVrtCMB1QOuyi8SauQTEgbdq3mzWoViVA7SPyiSTOUrUQ5O2umH
 ux4j/p7snMoFI5zOjn7GZ2vSRyoZ2kX7Jwoa4dGnWytaQ3MKB1aimgSnYDSR8qqlbZ
 hR/6Fa6mMVQAegrDLr/RUBpv1ZryWzCSllPahKVr8En7j39cananl4hyFRRam7kE4I
 m1SLexmP4XxBmQiDKngddSkyEsAAz9Q+cZuD8AMpACBRZ4iq8DiiOelMm+khan6S9r
 qzfIfbQZckAIaDTstVQ5ZVA/3F2XtuZ9n8Kdc06Ec8opuINIpJp00SJ8LmUuJ1MGDa
 WX2F19nY0Bp2w==
Message-ID: <57e41130-8a29-212b-df93-8fe0786ac08c@collabora.com>
Date: Mon, 2 Oct 2023 12:40:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] drm/mediatek: Correctly free sg_table in gem prime vmap
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20231002092051.555479-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231002092051.555479-1-wenst@chromium.org>
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
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 02/10/23 11:20, Chen-Yu Tsai ha scritto:
> The MediaTek DRM driver implements GEM PRIME vmap by fetching the
> sg_table for the object, iterating through the pages, and then
> vmapping them. In essence, unlike the GEM DMA helpers which vmap
> when the object is first created or imported, the MediaTek version
> does it on request.
> 
> Unfortunately, the code never correctly frees the sg_table contents.
> This results in a kernel memory leak. On a Hayato device with a text
> console on the internal display, this results in the system running
> out of memory in a few days from all the console screen cursor updates.
> 
> Add sg_free_table() to correctly free the contents of the sg_table. This
> was missing despite explicitly required by mtk_gem_prime_get_sg_table().
> 
> Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


