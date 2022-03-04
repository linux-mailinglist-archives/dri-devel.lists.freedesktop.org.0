Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7664CD35E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 12:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF0210E4B1;
	Fri,  4 Mar 2022 11:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127FD10E4B1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 11:24:55 +0000 (UTC)
Received: from [IPV6:2a01:e0a:120:3210:7306:9b30:8b22:3e7d] (unknown
 [IPv6:2a01:e0a:120:3210:7306:9b30:8b22:3e7d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3A7461F465D3;
 Fri,  4 Mar 2022 11:24:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646393093;
 bh=yTe/V30XP6omoCEeMk1jAeuDrsOa74fOZiKjXc7oly0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F73leBvPeP7IuwJRp2RmOQsRbF8YKgQDZkK5Qv0MtLsIKeSOXqY2Nuw5HIScydcoa
 8bciQQEwDGezHBhSX+kQfjExzVxOn7ovgJUtMVHfF4DjvQNHkrCGYhI6wsfmNmRBuU
 K/NY33dF3OQtJwpUCCKAYQmDyjr/qAH4XJg0v1ZS4p2WY2I0LQSV3zMbbAzW6S5Gd7
 96EljkMuDmBiHYn9VlqwS8LGpvu2hv6+D1oYTf006QPi7OG/GtxK0WFClJtANSvFtZ
 700lyGelg4h3zX++9mrbTSO4hQXQLt7NFmF6Hu+tAGzBjWsG/246clU1dUfwaolUkh
 yb3DMERXOt+JA==
Message-ID: <fb73a54a-7e75-2e5d-d78a-cacb5f065b06@collabora.com>
Date: Fri, 4 Mar 2022 12:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2, 0/4] Cooperate with DSI RX devices to modify dsi funcs
 and delay mipi high to cooperate with panel sequence
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
References: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <1646388956-8033-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: jitao.shi@mediatek.com, allen-kh.cheng@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Le 04/03/2022 à 11:15, xinlei.lee@mediatek.com a écrit :
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> In upstream-v5.8, dsi_enable will operate panel_enable, but this
> modification has been moved in v5.9. In order to ensure the timing of
> dsi_power_on/off and the timing of pulling up/down the MIPI signal,
> the modification of v5.9 is synchronized in this series of patches.

Hello,

I'm trying to debug an issue on mt8183 kukui krane sku176 device.
The problem is that boe-tv101wum-nl6 panel isn't working.
At boot time I can see these logs:
panel-boe-tv101wum-nl6 14014000.dsi.0: failed to write command 1
panel-boe-tv101wum-nl6 14014000.dsi.0: failed to init panel: -62
and a DSI interrupt time out.

Since I believe the problem is link to DSI/panel enabling sequence
I have try this series but that doesn't solve the issue.
I notice that when going out of deep sleep mode panel is functional.

May you have any idea to debug/solve this problem ?

Regards,
Benjamin

>
> Changes since v1:
> 1. Dsi sequence marked with patch adjustment
> 2. Fixes: mtk_dsi: Use the drm_panel_bridge
>
> Jitao Shi (3):
>    drm/mediatek: Adjust the timing of mipi signal from LP00 to LP11
>    drm/mediatek: Separate poweron/poweroff from enable/disable and define
>      new funcs
>    drm/mediatek: keep dsi as LP00 before dcs cmds transfer
>
> Xinlei Lee (1):
>    drm/mediatek: Add pull-down MIPI operation in mtk_dsi_poweroff
>      function
>
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 73 ++++++++++++++++++++----------
>   1 file changed, 49 insertions(+), 24 deletions(-)
>
