Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEC4B5128B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 11:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA8F10E8AC;
	Wed, 10 Sep 2025 09:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cd/oGOOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA53710E8AC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757496810;
 bh=4TW25vHkdcjLk7pdZ8NdI1vAv/tKPvhm66WuGiHLE+k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cd/oGOOJc4U2WUp7XJXVtXpOjWP/MDcbgLpQZb8xexNryDX/Joz7CozswDCywThc1
 0Or8g/UM46NVvS7NpgT7mEh6BSpi80p1qFnCsTC7iPjTGn2zjscp6eVSCWIOLp2mEn
 161E4AjeuJyoMnIHMRbxSv7RYt3yXWx4wNoO46z5zIW7I4LRUnAL49//HIMqPEfnUA
 6tm/4jFzAYL7bk/RCG29RF2bsWpZ6Dse7IlGjhLSZgveMzrqowkzeNSAIoy2rNRyNO
 QqY4QCmobYYIWms9Ea8aDykmcY0MN1+CJnDaXVtlnUiozXTe1nyUq/kQ+LbmwBVO/s
 S2socrRuR3ktw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E342417E0100;
 Wed, 10 Sep 2025 11:33:29 +0200 (CEST)
Message-ID: <cb896db9-6fed-4e83-baa1-c075fdf1df1e@collabora.com>
Date: Wed, 10 Sep 2025 11:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/mediatek: fix potential OF node use-after-free
To: Johan Hovold <johan@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ma Ke <make24@iscas.ac.cn>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250829090345.21075-1-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250829090345.21075-1-johan@kernel.org>
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

Il 29/08/25 11:03, Johan Hovold ha scritto:
> A recent change (included in the drm pull request for 6.17-rc4) fixed a
> device reference leak but also introduced a potential OF node
> use-after-free.
> 
> This series fixes the new OF node reference imbalance and drops the
> unnecessary gotos introduced by the broken fix, effectively reverting
> that change in favour of the minimal fix I had previously posted here:
> 
> 	https://lore.kernel.org/lkml/20250722092722.425-1-johan@kernel.org/
> 
> These should go into 6.17 which (soon) has the broken fix, which was
> also marked for stable backport.
> 
> Johan
> 
> 
> Johan Hovold (2):
>    drm/mediatek: fix potential OF node use-after-free
>    drm/mediatek: clean up driver data initialisation
> 
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 23 +++++++++--------------
>   1 file changed, 9 insertions(+), 14 deletions(-)
> 

The whole series is
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

*** URGENT ***

CK, please send this immediately, because [1] breaks *ALL MediaTek boards* making
them *unbootable*.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/mediatek?h=next-20250910&id=1f403699c40f0806a707a9a6eed3b8904224021a

This series fixes the situation and makes them boot again.

Regards,
Angelo
