Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A93354AB00
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 09:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84ED10FBCB;
	Tue, 14 Jun 2022 07:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7EF10FBCB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 07:52:16 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F2C4766016A5;
 Tue, 14 Jun 2022 08:52:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655193134;
 bh=YiYxfz9UJYMv0Yzl92YcMKOgxfk4MMa4/uB2sRksOJM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UUod8iVfxYNNRG93+40eRBJxUTQ3ZMgriSgsL2pjQ7TOiQCiDUa9nUiDsYxWRkP1I
 J5w3HAl/BXe/Q6B6GwMcl3f9CawLTS2jXqIIot2MCzgKx1VFkVC0GNtMAC6dwA2sDu
 sEDwNJugHElihkizTLODY+vFVbqAyo2Nc0A+SANM34T/+FBJEumOXIHLvqCqkGORER
 1n53h10MPyNSaoBd/YmIETwznwOUFBZEAvHx3Flg9n9RcaFEA42l6jXeKo+8jwHlhJ
 md6WWZoS6XWPCD3fJHg9pceZe1BIdNxOqZ1IZUCGa5AbcJ7mX8a4xoOH/xSH5aIdN5
 E7/yJ3pSnhAkQ==
Message-ID: <9c8c712c-75d1-bd0f-0205-be769ce5e83d@collabora.com>
Date: Tue, 14 Jun 2022 09:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/bridge: anx7625: Zero error variable when panel
 bridge not present
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Robert Foss <robert.foss@linaro.org>
References: <20220613163705.1531721-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220613163705.1531721-1-nfraprado@collabora.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/06/22 18:37, Nícolas F. R. A. Prado ha scritto:
> While parsing the DT, the anx7625 driver checks for the presence of a
> panel bridge on endpoint 1. If it is missing, pdata->panel_bridge stores
> the error pointer and the function returns successfully without first
> cleaning that variable. This is an issue since other functions later
> check for the presence of a panel bridge by testing the trueness of that
> variable.
> 
> In order to ensure proper behavior, zero out pdata->panel_bridge before
> returning when no panel bridge is found.
> 
> Fixes: 9e82ea0fb1df ("drm/bridge: anx7625: switch to devm_drm_of_get_bridge")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

I would've preferred s/zero out/cleanup/g but it's also fine as you wrote it.
Besides, good catch!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

