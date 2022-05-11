Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B43695236A9
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 17:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9872B10E6D0;
	Wed, 11 May 2022 15:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2B410E6D0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 15:04:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E7E401F43201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652281491;
 bh=mxWYOQgLw0CZGqfrBC0Eg5W6UfeqjHZIz/sEb1ggWik=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Nxg/uwf/s7WPIv/mqp+jozD5PuYhmwbINGe5FRHRMxcP+KnVQNuJ3QzDTmviaDqqD
 qZx70JQLfTCc50DGrfLbfKAYRvjxUYlbI/SEE8s/nozlS5wO0O5+XNbQ4bA5SSOaTD
 Q9GQImxwPwHWPGK1b06syFI0xnwdQXv/oL3a6L5AGGKAyPDdHMxjpuzsPUuFB1R5T7
 6ZkaZILgBzQ87402zUxydp0SeXVMLNhpLaD8WGzlyZjtyT7dLyyEjUrCP1lHaGKvUB
 NJsDUCEe30J1S2UxJYlmIOA3sras6Q/yAMH8KN2O1vIqtBmzd9vc8x047FqS9Y50q4
 8j4pmm5l5Ktbg==
Message-ID: <20f078a8-f050-127f-b720-b5fc8c893c9c@collabora.com>
Date: Wed, 11 May 2022 17:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5, 4/5] drm/mediatek: keep dsi as LP00 before dcs cmds
 transfer
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
References: <1652236596-21648-1-git-send-email-xinlei.lee@mediatek.com>
 <1652236596-21648-5-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1652236596-21648-5-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/05/22 04:36, xinlei.lee@mediatek.com ha scritto:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> To comply with the panel sequence, hold the mipi signal to LP00 before the dcs cmds transmission,
> and pull the mipi signal high from LP00 to LP11 until the start of the dcs cmds transmission.
> The normal panel timing is :
> (1) pp1800 DC pull up
> (2) avdd & avee AC pull high
> (3) lcm_reset pull high -> pull low -> pull high
> (4) Pull MIPI signal high (LP11) -> initial code -> send video data(HS mode)
> The power-off sequence is reversed.
> If dsi is not in cmd mode, then dsi will pull the mipi signal high in the mtk_output_dsi_enable function.
> The delay in lane_ready func is the reaction time of dsi_rx after pulling up the mipi signal.
> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

