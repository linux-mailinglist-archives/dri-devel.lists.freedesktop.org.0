Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45E19B2B0D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 10:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EF610E437;
	Mon, 28 Oct 2024 09:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RKR/8iU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D52510E141
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730106584;
 bh=RrNX39g0rq7db1nKULH9Y0fs1HbOSJyWDZQmvN0UvUg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RKR/8iU/wJEYI+J7N2dtM+s3eZv9jXzERl6VnGrqD2JLPag3hI38s+ANtc8V4AO/q
 KtNVbFvzDonr/uSGfZ8tEZ4DaorTLxuInXyEN8+ePSVlrD/0WrFBO1dIl/ogw/ttJk
 TlPmJ/xGGQLN73dfr6qUfzzaaserKqYijfCg/i1qlGFtp/Fu4ujd2kbBx+oKgvExqr
 vn4t7k3XsoGSMsYq0YwxgEfIMnZM3P1TXlIDB+LUeS7l2pbAenJ/YJvJ8drnYZAwjn
 8LcST6h1j8q9Xhp+9xdq4j8+M95MnlF/WTi0UtYAH0XzMkz70eq0DPouBD8xVUPYqt
 SIrU8ttRCtE8A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0908817E1134;
 Mon, 28 Oct 2024 10:09:43 +0100 (CET)
Message-ID: <9c83ea27-1221-4920-920e-9e7876ceaf90@collabora.com>
Date: Mon, 28 Oct 2024 10:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/mediatek: Fix child node refcount handling in
 early exit
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
 <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
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

Il 11/10/24 21:21, Javier Carrasco ha scritto:
> Early exits (goto, break, return) from for_each_child_of_node() required
> an explicit call to of_node_put(), which was not introduced with the
> break if cnt == MAX_CRTC.
> 
> Add the missing of_node_put() before the break.
> 
> Cc: stable@vger.kernel.org
> Fixes: d761b9450e31 ("drm/mediatek: Add cnt checking for coverity issue")
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


