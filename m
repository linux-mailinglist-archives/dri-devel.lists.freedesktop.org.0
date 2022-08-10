Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF558F3C2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 23:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06718901C6;
	Wed, 10 Aug 2022 21:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38F814B0A5
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 21:15:23 +0000 (UTC)
Received: from notapiano (korma.collabora.co.uk [168.119.224.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5965D6601C74;
 Wed, 10 Aug 2022 22:15:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660166122;
 bh=/jwBuBx79c+lk7i4kE7uZcAxqKWyDiBWEZ+cunWmR8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GvWzDwX0VnghTEO0QFED/hL1bYc0BmK5NdO9GgXLRMZBmo4xFdsI1+HUKIexdrZU3
 t1kciV686A0kO1LKnmvEBDmN+HU/UKXcHqBwOB9IXx4viufCZbIt9AWT3vohoycFYh
 j5SrFZnSKHHuMJHCXm4D8urFnrjLTBptx49lPhnwjMG4qbYz0XIBWY+mMuQU5KCZdo
 mZwj59EUoqrrCEE1tqhQVnkytD8qIB6mRQ4BI55in0xWVcqUVI7veJatspDIz3HqTo
 q1hzwfwFbF3x7fmqd8OycPrqam9pIxQ7tqz54EFzf/QX+esMGspdF9PKcuU7Efp3c3
 +hmmAOJaqc7gA==
Date: Wed, 10 Aug 2022 17:15:14 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Add atomic {destroy, duplicate}_state, 
 reset callbacks
Message-ID: <20220810211514.nmufrsi6gssb2kel@notapiano>
References: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
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
Cc: chunkuang.hu@kernel.org, jitao.shi@mediatek.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 rex-bc.chen@mediatek.com, linux-arm-kernel@lists.infradead.org,
 xinlei.lee@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 21, 2022 at 07:27:27PM +0200, AngeloGioacchino Del Regno wrote:
> Add callbacks for atomic_destroy_state, atomic_duplicate_state and
> atomic_reset to restore functionality of the DSI driver: this solves
> vblank timeouts when another bridge is present in the chain.
> 
> Tested bridge chain: DSI <=> ANX7625 => aux-bus panel
> 
> Fixes: 7f6335c6a258 ("drm/mediatek: Modify dsi funcs to atomic operations")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Tested on mt8183-jacuzzi-juniper. As part of enabling IGT tests on that machine
in KernelCI, this regression needs to be fixed. [1]

Thanks,
Nícolas

[1] https://github.com/kernelci/kernelci-core/pull/1059

> ---
> 
> Note: The commit that has been mentioned in the Fixes tag should
>       *not* have my Reviewed-by tag, as the author changed it but
>       erroneously retained the tag that I had released for an
>       earlier version of that commit (which was fine, but the new
>       version broke mtk_dsi!).
> 
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 9cc406e1eee1..5b624e0f5b0a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -808,10 +808,13 @@ static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>  
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>  	.attach = mtk_dsi_bridge_attach,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_disable = mtk_dsi_bridge_atomic_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_enable = mtk_dsi_bridge_atomic_enable,
>  	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
>  	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.mode_set = mtk_dsi_bridge_mode_set,
>  };
>  
> -- 
> 2.35.1
> 
> 
