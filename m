Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2F97CD921
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 12:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD90510E0C1;
	Wed, 18 Oct 2023 10:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAA910E0C1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 10:24:26 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B32BF66072F7;
 Wed, 18 Oct 2023 11:24:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697624665;
 bh=uHLAE7NLmQVbBRFl49l71ZZ0a4YX4vaL+aj4ZDekqUg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FYiWQKGYS6VICc8IcmuQq3Q4mMEoZyCIlkCfVc9mBT+AMMX0CvXg2eY5Cy/jE5Tyd
 ADtS+aWoVPTKR3FnhcL54PTL9rV1RdgeTwWF480HaZQNvkwxAFT1MGB4F6v1LTgvVQ
 uPfLqJjGhpKdU0tT+Bx89aK2th25X3F64TXR2OwTU02vt4cCbBPdEUV6Egd0x2C/BZ
 fE54WJFpx2T1ctFqOGWzkFq89Hbs0onoNRKA7UInio6E7eipnUOqIinOSeFQT9PjKe
 OpooGiiAOt6Yh3AmOzqhZriVK+VZkFYG+3D85+auNAtVNeXt5CKZKXUFxIqo7JOR85
 hQKbXsaGlCmLw==
Message-ID: <85277960-8c6a-485d-8dd4-9c1eb37f5818@collabora.com>
Date: Wed, 18 Oct 2023 12:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] MediaTek DRM - DSI driver cleanups
Content-Language: en-US
To: chunkuang.hu@kernel.org
References: <20230524093412.92211-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230524093412.92211-1-angelogioacchino.delregno@collabora.com>
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
Cc: Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/05/23 11:34, AngeloGioacchino Del Regno ha scritto:
> This series performs some cleanups for mtk_dsi, enhancing human
> readability, using kernel provided macros where possible and
> also reducing code size.
> 
> Tested on MT8173 and MT8192 Chromebooks (using a DSI<->DP bridge)
> and on MT6795 Sony Xperia M5 (DSI video mode panel).
> 
> Please note:
> This series depends and can be applied only on top of [1].
> 
> [1]: https://lore.kernel.org/lkml/20230523104234.7849-1-angelogioacchino.delregno@collabora.com/
> 
> AngeloGioacchino Del Regno (4):
>    drm/mediatek: dsi: Use GENMASK() for register mask definitions
>    drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
>    drm/mediatek: dsi: Use bitfield macros where useful
>    drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
> 
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 198 +++++++++++++----------------
>   1 file changed, 88 insertions(+), 110 deletions(-)
> 

Hello CK,

this series still applies and it's a nice cleanup.

Is there anything wrong with this? Can you please check it out?

Thanks,
Angelo
