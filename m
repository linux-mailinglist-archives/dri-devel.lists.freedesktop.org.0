Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4543663CB2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 10:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07C910E573;
	Tue, 10 Jan 2023 09:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1401710E573
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 09:22:49 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E34A56602D72;
 Tue, 10 Jan 2023 09:22:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673342567;
 bh=I2gJPlcF+jyW1J551Fuqu3z1Wg3HeLzZXwOmprSzWkg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Srm7lmvX2lAUDnh8Y6LXq9YXq72EXOwU5zwlPc90QrJuH51Pko1MOj2SWwvFd/wwJ
 KPygbI+Pu4+s27nftvJetY7YDydh8fmzzizysqDvnB9TFEtOSJn0zOMclRbaTB9sfV
 d5Q4/YdrOr1JWMY+ZQhbdIJGCc4RRiqahOGeMTCxelyYPAZB1skcJoE9CdhBCbJ6Vl
 11MeGdnX4vD48PVqs3mbZxE658TP5exOrYFVajotf9tfLX7zdT/SaBuRQR+tpjjDvg
 jB0jXC+O8s9UtnsrqVs635Sam1mlO1W0Vyf4csB/23bQVClPkSp6JgR+pa1LlInjXF
 sJWTIh0RRVh0A==
Message-ID: <21efdb3e-3c4d-0bc9-bbde-34ec3e04bfad@collabora.com>
Date: Tue, 10 Jan 2023 10:22:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/3] drm/panel: boe-tv101wum-nl6: Fine tune the panel
 power sequence
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, thierry.reding@gmail.com, sam@ravnborg.org
References: <1673330093-6771-1-git-send-email-xinlei.lee@mediatek.com>
 <1673330093-6771-4-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1673330093-6771-4-git-send-email-xinlei.lee@mediatek.com>
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
Cc: linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/01/23 06:54, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> For "boe,tv105wum-nw0" this special panel, it is stipulated in the
> panel spec that MIPI needs to keep the LP11 state before the
> lcm_reset pin is pulled high.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index f0093035f1ff..67df61de64ae 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -36,6 +36,7 @@ struct panel_desc {
>   	const struct panel_init_cmd *init_cmds;
>   	unsigned int lanes;
>   	bool discharge_on_disable;
> +	bool lp11_before_reset;
>   };
>   
>   struct boe_panel {
> @@ -1261,6 +1262,10 @@ static int boe_panel_prepare(struct drm_panel *panel)
>   
>   	usleep_range(10000, 11000);
>   
> +	if (boe->desc->lp11_before_reset) {
> +		mipi_dsi_dcs_nop(boe->dsi);

NOP will never reach the driveric if it is in reset, which should apparently be
the state of it at that point in code.

I guess that you wanted to do that after LCM reset and before sending init cmds.

Regards,
Angelo

