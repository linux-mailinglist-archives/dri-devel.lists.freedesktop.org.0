Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5B75531AD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 14:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD5310E4E5;
	Tue, 21 Jun 2022 12:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D5FA10EBEC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 12:11:42 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C68D96601795;
 Tue, 21 Jun 2022 13:11:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655813500;
 bh=DKwtRGko3s5x/gAEoSQN2wLREgvcMu85ngMm3S7JYTo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RU8k6ptkWXi/VlsfNEeonqcHZ+3DSgxSgiDRQ67KyoHDfrOWVfRB77VoeXy0YqlA2
 Mandvf5OUdDTtzOGPfvBSjD9pj0KNxEnA3flVT7hfINGK44mnlcozfLAbl8AOuGeLR
 Yfkahl2xmpLifqJrbwMUFptUspYq79F+ffMQcR3a0UBkZj1xwcS8JEEk5PpcctE1UC
 Pc78W8mcAmAwhw4IczNjEBJsyZAyBtQmmiRYM+1ktwnkevNVusS6LpOp9/EOmKxx/+
 QnT6ycnQo2XkQRWrWg3q6NtdABnJh0gvD2wlMAdzUOkL6gksxEnl/33+kA+kJ1VbBK
 BrTtygaCgqV5w==
Message-ID: <55c98626-9b95-7721-94cf-8c471580a53b@collabora.com>
Date: Tue, 21 Jun 2022 14:11:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 12/14] drm/mediatek: dpi: add config to control
 setting of direct connection to pins
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
 <20220621113732.11595-13-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220621113732.11595-13-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> MediaTek dpi supports direct connection to pins while dp_intf does not
> support. Therefore, add a config "support_direct_pin" to control this.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 438bf3bc5e4a..ef7f828a4b1e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -129,6 +129,8 @@ struct mtk_dpi_yc_limit {
>    * @is_ck_de_pol: Support CK/DE polarity.
>    * @swap_input_support: Support input swap function.
>    * @color_fmt_trans_support: Enable color format transfer.
> + * @support_direct_pin: Dpi can directly connect pins, and enable this config
> + *			to do this.

@support_direct_pin: IP supports direct connection to pins

or

@support_direct_pin: IP has direct connection to DP pins

or

@support_direct_pin: IP connects directly to DP pins

pick one, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


