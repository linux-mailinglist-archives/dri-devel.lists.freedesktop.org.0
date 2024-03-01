Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAD786DD66
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B3A10E29B;
	Fri,  1 Mar 2024 08:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DtMW0puY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32CA10E29B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709282826;
 bh=5MxkYGIx2DdVeJ4zAV3mxPPY60bkLJwsDM9R11jSvKU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DtMW0puYArAtKYfVDkcFg4Yb57s2iOxXvnrkqbgfb5A1BsQPQyVnpOqAzOU0/SbPl
 0QlQ6sWsaP7Y8IMz65A2UsaGWaOuauKCl36wV2S4EDF9hjIrxE99hCT9ofSZoI+Fp0
 dxEPMbTPpa0/DWM517QrTgn5Xc3NYvW3gh+p1iQIDj/8gI9PXVaqcyG606cQDCMtSC
 0p0nkti0Osax5MnZzd7fGQBLZGyjirdK2VKczA5aPu8/6VSYxXtta64QGvwQYVWJhT
 yN+NS/s+OxmTMPBAqw0ugQHjntr9ACCS/YSTC9gxYId3/gAGNQ4z5oN79rwc4UbSiv
 ijX6U2on/S4sw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BBE7537814A4;
 Fri,  1 Mar 2024 08:47:04 +0000 (UTC)
Message-ID: <dbe8b3c3-e7ce-4b28-bd5c-47e180fdf275@collabora.com>
Date: Fri, 1 Mar 2024 09:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] drm: Switch from dev_err to dev_err_probe for
 missing DSI host error path
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 owen <qwt9588@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>, Adrien Grassein <adrien.grassein@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Vinay Simha BN <simhavcs@gmail.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240229-anx7625-defer-log-no-dsi-host-v2-0-00506941049a@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229-anx7625-defer-log-no-dsi-host-v2-0-00506941049a@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 01/03/24 01:12, Nícolas F. R. A. Prado ha scritto:
> This series changes every occurence of the following pattern:
> 
> 	dsi_host = of_find_mipi_dsi_host_by_node(dsi);
> 	if (!dsi_host) {
> 		dev_err(dev, "failed to find dsi host\n");
> 		return -EPROBE_DEFER;
> 	}
> 
> into
> 
> 	dsi_host = of_find_mipi_dsi_host_by_node(dsi);
> 	if (!dsi_host)
> 		return dev_err_probe(dev, -EPROBE_DEFER, "failed to find dsi host\n");
> 
> This registers the defer probe reason (so it can later be printed by the
> driver core or checked on demand through the devices_deferred file in
> debugfs) and prevents errors to be spammed in the kernel log every time
> the driver retries to probe, unnecessarily alerting userspace about
> something that is a normal part of the boot process.
> 
> I have omitted a Fixes: tag in the last patch, for the truly-nt35597
> panel, because it predates the dev_err_probe() helper.
> 
> Changes in v2:
> - Added patches 2 onwards to fix all occurences of this pattern instead
>    of just for the anx7625 driver
> - Link to v1: https://lore.kernel.org/r/20240226-anx7625-defer-log-no-dsi-host-v1-1-242b1af31884@collabora.com
> 

Apart from patch [8/9], where you're going over 100 cols, this series looks good.

After fixing that, on v3, please feel free to add my....

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...to all of the patches in this series (and the one that you'll fix as well).

Cheers!
Angelo

> ---
> Nícolas F. R. A. Prado (9):
>        drm/bridge: anx7625: Don't log an error when DSI host can't be found
>        drm/bridge: icn6211: Don't log an error when DSI host can't be found
>        drm/bridge: lt8912b: Don't log an error when DSI host can't be found
>        drm/bridge: lt9611: Don't log an error when DSI host can't be found
>        drm/bridge: lt9611uxc: Don't log an error when DSI host can't be found
>        drm/bridge: tc358775: Don't log an error when DSI host can't be found
>        drm/bridge: dpc3433: Don't log an error when DSI host can't be found
>        drm/panel: novatek-nt35950: Don't log an error when DSI host can't be found
>        drm/panel: truly-nt35597: Don't log an error when DSI host can't be found
> 
>   drivers/gpu/drm/bridge/analogix/anx7625.c     |  6 ++----
>   drivers/gpu/drm/bridge/chipone-icn6211.c      |  6 ++----
>   drivers/gpu/drm/bridge/lontium-lt8912b.c      |  6 ++----
>   drivers/gpu/drm/bridge/lontium-lt9611.c       |  6 ++----
>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c    |  6 ++----
>   drivers/gpu/drm/bridge/tc358775.c             |  6 ++----
>   drivers/gpu/drm/bridge/ti-dlpc3433.c          | 17 +++++++++--------
>   drivers/gpu/drm/panel/panel-novatek-nt35950.c |  6 ++----
>   drivers/gpu/drm/panel/panel-truly-nt35597.c   |  6 ++----
>   9 files changed, 25 insertions(+), 40 deletions(-)
> ---
> base-commit: 2ae0a045e6814c8c1d676d6153c605a65746aa29
> change-id: 20240226-anx7625-defer-log-no-dsi-host-c3f9ccbcb287
> 
> Best regards,



