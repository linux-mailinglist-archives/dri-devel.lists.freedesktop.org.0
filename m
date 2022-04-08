Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EDF4F90A5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 10:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32BF10F01B;
	Fri,  8 Apr 2022 08:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DDE10EFE0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 08:21:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0BC531F46C62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649406110;
 bh=5hTYFqNB9vDIxHeFkZOuvaqNuZxpgzcJpUFPnM90T7A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RX2ac4nHdftRiVxnIm/L5xLNJ346VIem9P4MCmnuKCk9O3k39+2W9DAYtLA8WHl5s
 WRg5G8B1tppItIlehtNiZNLX9peiMae6F1O1Ewu/dI2ue4OMlTaazbd0INZ/VKJ2j6
 7zWzEK66mcjqyd8IyXdc7vFR9OOd/fGZnJ+5RISKzOXLRm5P25tx6hJQ9gbji4aegA
 GcRGQt5XDzNSCrjVM97T0cv4yzbyaQkzF8v9ln+q2elehSPLXs9VqjJNPg0tHwB6Pt
 rNWrgJlYlPdfsM7hETLT6GSDmAeq+doDka/C4xwdBK/N4lOLYKJLLq4SeMO/HCDSEJ
 PaFNHVl4XbYFQ==
Message-ID: <20848108-31bc-357c-224b-9cbdd465b195@collabora.com>
Date: Fri, 8 Apr 2022 10:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/bridge: anx7625: Use uint8 for lane-swing arrays
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
References: <20220408013034.673418-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408013034.673418-1-nfraprado@collabora.com>
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
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 08/04/22 03:30, Nícolas F. R. A. Prado ha scritto:
> As defined in the anx7625 dt-binding, the analogix,lane0-swing and
> analogix,lane1-swing properties are uint8 arrays. Yet, the driver was
> reading the array as if it were of uint32 and masking to 8-bit before
> writing to the registers. This means that a devicetree written in
> accordance to the dt-binding would have its values incorrectly parsed.
> 
> Fix the issue by reading the array as uint8 and storing them as uint8
> internally, so that we can also drop the masking when writing the
> registers.
> 
> Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
