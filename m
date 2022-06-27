Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0406B55B918
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 12:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E8810E33E;
	Mon, 27 Jun 2022 10:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484F610EACA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 10:19:13 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DF39D6601822;
 Mon, 27 Jun 2022 11:19:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656325152;
 bh=ifo75he1zccAIukoq+Y8qsDgP4/nZXF5zclgYxbptVk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lVOS5KTI98Vc61DG5Wu6FehcIW9LZn6qFy4x9kE3Yms9Biycc8h1k3BSp22jHfw37
 2BxgTCmUVocIqXwecu/NupfEuvcPB07kyR5zcsY5QGCcca+SLmuEd2A85xkr/Np7Es
 Jnuq9nQ2FqqbPiLS/uNijdergVGxEPJvETQNoQQF50EcDvHCkhPQf0YTGnW9XIlwEs
 TV7mIt+bhnFo21XPpc68wodVYGvUhiSYHH6rLPclM0imkfznCGs1TfMEAruDTHAW5L
 q/MTD9ZhdaevACN1VNr2mly5ZSkbMxeXeLeHMAKFvwwliGXyeCDWs4MTDHOlXhdGGi
 Sxru0TEIEteWQ==
Message-ID: <9e60dfa4-b648-8005-2cf3-f993dddf57a6@collabora.com>
Date: Mon, 27 Jun 2022 12:19:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v12 07/10] drm/mediatek: add hpd debounce
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
 <20220627080341.5087-8-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220627080341.5087-8-rex-bc.chen@mediatek.com>
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
 granquet@baylibre.com, jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/06/22 10:03, Bo-Chen Chen ha scritto:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
>  From the DP spec 1.4a chapter 3.3, upstream devices should implement
> HPD signal de-bouncing on an external connection.
> A period of 100ms should be used to detect an HPD connect event.
> To cover these cases, HPD de-bounce should be implemented only after
> HPD low has been detected for at least 100ms.
> 
> Therefore,
> 1. If HPD is low (which means plugging out) for longer than 100ms:
>     we need to do de-bouncing (which means we need to wait for 100ms).
> 2. If HPD low is for less than 100ms:
>     we don't need to care about the de-bouncing.
> 
> In this patch, we start a 100ms timer and use a need_debounce boolean
> to implement the feature.
> 
> Two cases when HPD is high:
> 1. If the timer is expired (>100ms):
>     - need_debounce is true.
>     - When HPD high (plugging event comes), need_debounce will be true
>       and then we need to do de-bouncing (wait for 100ms).
> 2. If the timer is not expired (<100ms):
>     - need_debounce is false.
>     - When HPD high (plugging event comes), need_debounce will be false
>       and no need to do de-bouncing.
> 
> HPD_______             __________________
>            |            |<-  100ms   ->
>            |____________|
>            <-  100ms   ->
> 
> Without HPD de-bouncing, USB-C to HDMI Adapaters will not be detected.
> 
> The change has been successfully tested with the following devices:
> - Dell Adapter - USB-C to HDMI
> - Acer 1in1 HDMI dongle
> - Ugreen 1in1 HDMI dongle
> - innowatt HDMI + USB3 hub
> - Acer 2in1 HDMI dongle
> - Apple 3in1 HDMI dongle (A2119)
> - J5Create 3in1 HDMI dongle (JAC379)
> 
> Tested-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

