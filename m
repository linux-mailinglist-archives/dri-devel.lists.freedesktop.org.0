Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0582C565BFB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7945610FA05;
	Mon,  4 Jul 2022 16:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B7D10E02D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 11:44:56 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B65B06601606;
 Mon,  4 Jul 2022 12:44:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656935095;
 bh=jjo/dyeQs/GxvVIxuo7XEbbDAa6wk9DN2Its8ccnRJ0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nbJnzWpIAwOdT1NnRPK3dzVlUURFg7owdJam04RFnvJ1M7R5J4KEmBvJsOP+V62Qh
 cY5xqLdSoHcmUI1epUxuKG90LJlj5x7P9/YpS1EfHuyIYfayhQnnHzB9256yBDKyDP
 M2ubH3i6prhjBmd1BXjyeoDFPIr+8Ccn1khWm1dNo6cRhlEz7hhqswvZxf/yFv8wM6
 elWZfMriM/zOTb1xhCbkpKSl6ls0PEEQXcwEVLwMWnP8a71fKlm2EAr8VzXnKkUw2g
 qj/elSmFNeBE3KTdMf4xaVV4bWxSfwIWabWi6niy/+tiqVJDzTFL/4QwFSbaxW7N+n
 NedgxcEU4P/Xw==
Message-ID: <e405bbc2-c1af-f445-5b78-021b8e88090a@collabora.com>
Date: Mon, 4 Jul 2022 13:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/mediatek: ensure bridge disable happends before
 suspend
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220629190545.478113-1-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220629190545.478113-1-hsinyi@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 29/06/22 21:05, Hsin-Yi Wang ha scritto:
> Make sure bridge_disable will be called before suspend by calling
> drm_mode_config_helper_suspend() in .prepare callback.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> The issue is found if suspend is called via VT2 in several MTK SoC (eg.
> MT8173, MT8183, MT8186) chromebook boards with eDP bridge:
> bridge disable is called through mtk-drm's suspend, and it needs to be
> called before bridge pm runtime suspend.
> So we move the hook to .prepare() and .complete().
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
