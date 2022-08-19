Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA9B5A01F4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB1CC35CF;
	Wed, 24 Aug 2022 19:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EC610EA36
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 13:28:57 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id z2so5683413edc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 06:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=EcVjTGn7kbtsskUzpli5enhaWEJ97X0D7MTunymKgDA=;
 b=EFINGNzLMYGWNtRBOvem2NfAjEGK5CsDlouqgDIseNqvAWaE/67j8+xZEQr5fzwv50
 50O6DLABl/kbDSCNvLyErR7bNIUV7/S6PM5SuRZMqq8otAu0mRiY7BDFSa/U5ZLJ5eOP
 UgNDmX4snUTIH3fPqVyJdhA0C4d1pM2cfBFr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=EcVjTGn7kbtsskUzpli5enhaWEJ97X0D7MTunymKgDA=;
 b=M8e90huCX0cfn4KRYYKUpxI0ZP26gdeo/fCor0Z+dy8/9nkoexGAe6X31SwCPBcg2F
 qmMpH0P1oJYvcLrpsi26cBQCH0cF154nqRs/BMnT4dJ7ya5dNGYWBKzXygSkK2tTPfVA
 6uhqhVQMPVoLcpiOw95onnv58IHypE03Av7Wv+H5jeqMdXUbp8NGkddu9CIpzOVFdk6f
 FTtRGwgyu04nzf6bo/IRPLQ7Fj0yxzKpCKFUsKXERYq9gPkRrqV3o25a3hwCsXe3W23H
 lJtjc/Ff4unUmC9oToH/DWcnNwbIKVXS5Zf/yoHFWxn9BiGEB5NSXihnD8wmFMt+aflP
 bMrQ==
X-Gm-Message-State: ACgBeo3Ea4dvR2sm7RuXEwLbnstGFPgbNyEnkoxqG9bINtaHcRNfRid9
 Q5BG5B2n89dMagc059IrwVtz+gtZM6rLW6h8VXMpEw==
X-Google-Smtp-Source: AA6agR6NNo/OKhYHbs8DSbr0gfcQjweYTiRfMZ2zqaMVE6pXULEaWlXjNBLUMXZGbGHalj/+4CUprSImapqjpNaobAo=
X-Received: by 2002:a05:6402:4029:b0:443:a5f5:5324 with SMTP id
 d41-20020a056402402900b00443a5f55324mr6289038eda.51.1660915735800; Fri, 19
 Aug 2022 06:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721172727.14624-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 19 Aug 2022 21:28:44 +0800
Message-ID: <CAGXv+5H+BQcT=JTD3Y1necym=6uLHD8HgWpjjpyTLSin9D1KNA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: Add atomic {destroy, duplicate}_state, 
 reset callbacks
To: chunkuang.hu@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: jitao.shi@mediatek.com, xinlei.lee@mediatek.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 rex-bc.chen@mediatek.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 1:27 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add callbacks for atomic_destroy_state, atomic_duplicate_state and
> atomic_reset to restore functionality of the DSI driver: this solves
> vblank timeouts when another bridge is present in the chain.
>
> Tested bridge chain: DSI <=> ANX7625 => aux-bus panel
>
> Fixes: 7f6335c6a258 ("drm/mediatek: Modify dsi funcs to atomic operations")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This patch is now needed on top of v6.0-rc1, otherwise booting will
stall for a while waiting for display vblank, which never happens
because the DSI pipeline is not configured correctly.

ChenYu

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
>         .attach = mtk_dsi_bridge_attach,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>         .atomic_disable = mtk_dsi_bridge_atomic_disable,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>         .atomic_enable = mtk_dsi_bridge_atomic_enable,
>         .atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
>         .atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
>         .mode_set = mtk_dsi_bridge_mode_set,
>  };
>
> --
> 2.35.1
>
