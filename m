Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B435B855FE7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 11:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34C510E463;
	Thu, 15 Feb 2024 10:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3xpIKCTi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1578610E57F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707993983;
 bh=YbT37hERPMotSbqysWVXhccVGhmIL5NWBAzDOuVxwJo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=3xpIKCTiI4T2EIGKteQ1V5vk5Ykel3u0GclVdzPNz2BVTzI+JuiTpjFJ9OO8VrMQn
 Q7Z12jsjx/DJGyab5s9d0jv5M1DhUkaHD9hyLV4yn+5mnONLSWcXJ8ysyRtBQJXJEZ
 3TzWRL2OpuvR3gZxxAZ1xkgqbwJoNEhlG5cmPL4b8uWp+/RZpR41s5Ys24593D9hUX
 SBiPR2kqz7O06TpoKA+buky6hJincltVxPygzHSYS8cjkSY/FxJgwkYJEGGafwqNWA
 4xlA9DWhjyFSIV6DVNOgifAVu72GEMWw4gMQZzy+kQ+W28gal2MX2ddqJuVh2taRHY
 qXnHq6ptKefnw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D0DF83780FC7;
 Thu, 15 Feb 2024 10:46:21 +0000 (UTC)
Message-ID: <96cbca68-052f-42dd-a410-da9061d54c06@collabora.com>
Date: Thu, 15 Feb 2024 11:46:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] drm/mediatek: Support alpha blending in display
 driver
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Sean Paul <seanpaul@chromium.org>, Fei Shao <fshao@chromium.org>,
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
 <20240215101119.12629-8-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215101119.12629-8-shawn.sung@mediatek.com>
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

Il 15/02/24 11:11, Hsiao Chien Sung ha scritto:
> Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
> adding correct blend mode property when the planes init.
> Before this patch, only the "Coverage" mode (default) is supported.
> 
> For more information, there are three pixel blend modes in DRM driver:
> "None", "Pre-multiplied", and "Coverage".
> 
> To understand the difference between these modes, let's take a look at
> the following two approaches to do alpha blending:
> 
> 1. Straight:
> dst.RGB = src.RGB * src.A + dst.RGB * (1 - src.A)
> This is straightforward and easy to understand, when the source layer is
> compositing with the destination layer, it's alpha will affect the
> result. This is also known as "post-multiplied", or "Coverage" mode.
> 
> 2. Pre-multiplied:
> dst.RGB = src.RGB + dst.RGB * (1 - src.A)
> Since the source RGB have already multiplied its alpha, only destination
> RGB need to multiply it. This is the "Pre-multiplied" mode in DRM.
> 
> For the "None" blend mode in DRM, it means the pixel alpha is ignored
> when compositing the layers, only the constant alpha for the composited
> layer will take effects.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


