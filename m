Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B62CD92D13D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC0210E769;
	Wed, 10 Jul 2024 12:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="da2E35dn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3170910E769
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720613000;
 bh=d10p4L1E8b5F+cfdvkoHTqHYhe1n5q2q3q5jflV+NUM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=da2E35dnLoh/D6dncK1MOF659gZtixJOF0zKQXs15kwnIAwifk87M+GGNp0+tRffN
 5rM5if0iTQZliIkZtLvmOzdGsbFDJBc798BJQv69hR3+Sa6czLdoXI5a+Kkp97GM4p
 O7kR30z3aBI8gUoHJGvFgCy8hW3/SD7MSU+HJ3uXYUBsbsHyPO8iEG50wtzXTFZHbK
 EMaNl/JPj+WIzvVVoXjYeLfj3P5+6OI9AZR4oxr9wfbx8upkikGC5ebl2wVzTvtr9T
 ti8AkJP0ljmzXr3OgX1wbEeZ5pxQIFRXx0TqJMycKxma+LXE7W3FHT5Za3UySyQCB3
 9NJAij73ezv7w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 541F53781185;
 Wed, 10 Jul 2024 12:03:19 +0000 (UTC)
Message-ID: <147231f5-7732-4400-9feb-f563c07dbc91@collabora.com>
Date: Wed, 10 Jul 2024 14:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/mediatek: Support "Pre-multiplied" blending in
 Mixer
To: shawn.sung@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
References: <20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com>
 <20240710-alpha-blending-v3-4-289c187f9c6f@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240710-alpha-blending-v3-4-289c187f9c6f@mediatek.com>
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

Il 10/07/24 10:52, Hsiao Chien Sung via B4 Relay ha scritto:
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
> 
> Support "Pre-multiplied" alpha blending mode in Mixer.
> Before this patch, only the coverage mode is supported.
> 
> To replace the default setting that is set in mtk_ethdr_config(),
> we change mtk_ddp_write_mask() to mtk_ddp_write(), and this change will
> also reset the NON_PREMULTI_SOURCE bit that was assigned in
> mtk_ethdr_config(). Therefore, we must still set NON_PREMULTI_SOURCE bit
> if the blend mode is not DRM_MODE_BLEND_PREMULTI.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


