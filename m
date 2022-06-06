Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E126A53E3EC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 11:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183AA10E137;
	Mon,  6 Jun 2022 09:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 480 seconds by postgrey-1.36 at gabe;
 Mon, 06 Jun 2022 09:28:46 UTC
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D4B10E137
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 09:28:46 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FB226601F9F;
 Mon,  6 Jun 2022 10:20:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654507245;
 bh=hOGlwtWXwq/KtQAdrBRHTu7hvquStP9tnqCCNREO+V4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IeyJ67nKKhOvCq/O2roO/wRtNVHTWD0XYD1151pb1McHjwXiU06LB6usFcfbKoM1o
 I8zysIJNhvPsf+Zi8MB/0WLaNdorX7cEalKI16lHP8AlUGM1qONwSUeiVIpRAdhHqi
 fDr6jcSHWxRHwoJwqDYNcGEPoDUDkHqlCYkR7SlxwDhvpQpYHxCEna4LgJc7+cQCI6
 RhDZLvioI4NmNLHcyP4IdSUbBNUqd9kWBXwFpgI36hcOWcLEwMiGT76siTOCA0tKZJ
 2xjqba7WNUDIG3F6tV9sNwKrkqky+ijsXYSLg09HIZL/af0y6w+gHOG2OmJcdpe9HS
 O8ojqBgXiCOxw==
Message-ID: <ff24a0bf-8137-963a-3a4c-fb0280b5382c@collabora.com>
Date: Mon, 6 Jun 2022 11:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 8/8] drm/mediatek: Config orientation property if panel
 provides it
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-9-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220606044720.945964-9-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/06/22 06:47, Hsin-Yi Wang ha scritto:
> Panel orientation property should be set before drm_dev_register().
> Mediatek drm driver calls drm_dev_register() in .bind(). However, most
> panels sets orientation property relatively late, mostly in .get_modes()
> callback, since this is when they are able to get the connector and
> binds the orientation property to it, though the value should be known
> when the panel is probed.
> 
> Let the drm driver check if the remote end point is a panel and if it
> contains the orientation property. If it does, set it before
> drm_dev_register() is called.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

