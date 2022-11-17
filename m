Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FD662D641
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 10:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7296F10E57D;
	Thu, 17 Nov 2022 09:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2609A10E57D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 09:17:47 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F167A6602A93;
 Thu, 17 Nov 2022 09:17:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668676665;
 bh=+3trhUpoX/ZER/bgVCe7lqj7hlaCm7bEoi7xml2ME+w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mKRMliuHq0j2e1YDmvQbui9tZVaOhBrryb8IZeGbqEMnaTZ0xL57rwxlUD5ukFpol
 m0slQAD4VpplPGwL7ifkB78jYcaZpQPSCqqmu4dixctE57EUbR2mAR6MMJK3OCwuFI
 CilS6phNK1bUqP8wEz+FdvTqNLGcTgifobjjqlkBHqL44sx0w8icgCsekuGgux49ax
 2NKUYy/bCjv3G+cQ6WQJvJj0H2ByeLWGs+qzBVAhCJdJpzSvto4GMO+bN/eJ/q7rgZ
 FeDDy0SdEstP1ETvknoNGjvkoncGv+/AJaKf9d2y5k+YZ7gcmOIpakmOQbDvMcfx7S
 qevX8u9iTURaQ==
Message-ID: <1aae3f77-8228-5d69-15a3-1f44fafb87d4@collabora.com>
Date: Thu, 17 Nov 2022 10:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5] drm/mediatek: Add AFBC support to Mediatek DRM driver
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20221116193335.36320-1-greenjustin@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221116193335.36320-1-greenjustin@google.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, wenst@chromium.org, matthias.bgg@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/11/22 20:33, Justin Green ha scritto:
> From: Justin Green <greenjustin@chromium.org>
> 
> Tested on MT8195 and confirmed both correct video output and improved DRAM
> bandwidth performance.
> 
> v5:
> * Removed some dead defines.
> * Refactored mtk_ovl_set_afbc().
> 
> v4:
> * Move modifier validation to format_mod_supported function.
> * Add modifiers to drm_universal_plane_init() call.
> * Make comparisons to DRM_FORMAT_MOD_LINEAR explicit rather than relying on
>    DRM_FORMAT_LINEAR being equal to 0.
> * Gate AFBC control bit writes on device compatibility.
> 
> v3:
> * Replaced pitch bitshift math with union based approach.
> * Refactored overlay register writes to shared code between non-AFBC and
>    AFBC.
> * Minor code cleanups.
> 
> v2:
> * Marked mtk_ovl_set_afbc as static.
> * Reflowed some lines to fit column limit.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>

Can you please move the version log to *after* the "---"?
That's not something that should actually end up being in the commit description.

After that, or if the maintainer wants to take care about removing that
while applying...:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

