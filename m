Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC0562DED
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 10:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CF010E52B;
	Fri,  1 Jul 2022 08:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFE710E52B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 08:24:46 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E6AC66601974;
 Fri,  1 Jul 2022 09:24:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656663885;
 bh=6VbdfSOOs3Mk31GnoM4flK6rivXwW2rx7zZhOL2M5uc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mYFw5+jeerPUkzUWglYj+XMjkDIMdGTB6AeVXME2HCO7fsc2gX3Ece34moLO8e2la
 b2A7aelCOsmvOQZ60qGa5LMnK+LSwPdbm17RzOE5f+9tp44JSrUkXv89n7Y4oHFehA
 9lhXRhDnDJB0AcvhDJUloxfrrNo4JjRBbn1ccpHXU60sG2h2NQPVHSqhdqwQFSAaDb
 mnon/U++cZloCHMuYbRrnyYgsasVnFie+kgNKgV3/pSwWQ0p8a3ljeJXbo0Co4IIf1
 flbgLkTb5B/Skq6rh4ENMfCNDsBbrg9/H+AwfYsd82jv8irpKCDymb6PBQriLJU6G+
 TvSwAP4NuNdLw==
Message-ID: <250cd177-fbbf-343c-80c1-d9278c01410a@collabora.com>
Date: Fri, 1 Jul 2022 10:24:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v13 10/10] drm/mediatek: fix no audio when resolution
 change
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
References: <20220701062808.18596-1-rex-bc.chen@mediatek.com>
 <20220701062808.18596-11-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701062808.18596-11-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 01/07/22 08:28, Bo-Chen Chen ha scritto:
> When switching resolutions, config the audio setting with the
> previous audio parameters.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Change the title to:
drm/mediatek: Use cached audio config when changing resolution

...and a more suitable description would be:

Use the cached audio configuration during a resolution switch
to avoid loss of sound.

(perhaps also explain why we're losing it and why using cached
data is necessary).

After which...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
