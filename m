Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6F49271DF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2EA10EA33;
	Thu,  4 Jul 2024 08:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="16eO5BK7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59A210EA33
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720082380;
 bh=sA8QHdLjPfav8TbcR6YQwgjbQ2b9bEIoala4MwhSdHQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=16eO5BK7kK2Lkg2zf6iwJnuoX6jV/9md/Okmd/oDGJysDlbvLlL+iiBSsjnBCrVmB
 o7NgTFQSGV4KKd60agtZrmIGWQa494sujbbYTh3It9tz5hnGCIJyBBgsnzipSnFd6o
 B96BSRjoOKoI4mbGiywgmOCdDPRzYcmbsoPvJ2hGmr+6iUv7z/gogwd6jn/knibjpu
 OICww3UMFyne62ITObPlocHg65aSvPjJsMzD/wc5PDofjTzs1jepFIi2dPP2qHX4jt
 kU9sTEjwzjgIPwjI7Pm64pxGb2yAZsTBe4A1LFgz5F2wcO7zFsFw/ervuV56PP9vHo
 vAkfAa9Sd7knA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D4130378216A;
 Thu,  4 Jul 2024 08:39:39 +0000 (UTC)
Message-ID: <7c1d5e3f-ed2d-4f12-945c-32ee90e78e2a@collabora.com>
Date: Thu, 4 Jul 2024 10:39:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix missing configuration flags in
 mtk_crtc_ddp_config()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jeffrey Kardatzke <jkardatzke@google.com>
References: <20240703103308.10198-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240703103308.10198-1-jason-jh.lin@mediatek.com>
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

Il 03/07/24 12:33, Jason-JH.Lin ha scritto:
> In mtk_crtc_ddp_config(), mtk_crtc will use some configuration flags to
> generate instructions to cmdq_handle, such as:
>    state->pending_config
>    mtk_crtc->pending_planes
>    plane_state->pending.config
>    mtk_crtc->pending_async_planes
>    plane_state->pending.async_config
> 
> These configuration flags may be set to false when a GCE IRQ comes calling
> ddp_cmdq_cb(). This may result in missing prepare instructions,
> especially if mtk_crtc_update_config() with the flase need_vblank (no need
> to wait for vblank) cases.
> 
> Therefore, use the mtk_crtc->config_updating flag set at the beginning of
> mtk_crtc_update_config() to ensure that these configuration flags won't be
> changed when the mtk_crtc_ddp_config() is preparing instructions.
> 
> Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet is done")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


