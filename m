Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E61B5687995
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 10:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F5810E4C9;
	Thu,  2 Feb 2023 09:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824F910E4C9
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 09:56:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso3283910wmp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 01:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g/86veRiNMAotlC8E0v66dTb033ZYUef8g783vJEeso=;
 b=YFCI8EFeCKYROGksvronNRcrP2dUv7lv5d83xpOGukCR2zmdfK9Y5acLGr5BQiJ/yf
 mIb7Ap6/BSnvDzEYjcmwtifoC/UNLk3KnZoWCk9SKvoXOYNJbfcRqky9V6NAXMlicM72
 GYiHow9zyNP0Ts0TQyh4Yc5lE42Szfa74niaAM9zBU686dRPY9FtOoBvJDYR1CzS9YdH
 yow9KWz1NYlsZ5gcm4PdaEs64mX/zJj39IdVooIhTiFxOrExzTqc4S5/KM0Px0LFuxPn
 fzjvf87fYmmAIX3p/6keLN0dSypDEz9Y/ae4dHk5FGhF9FsPy0puR8pmiDSs8Rv/pZnl
 NOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g/86veRiNMAotlC8E0v66dTb033ZYUef8g783vJEeso=;
 b=mTNvhkHG3/144tPgL09neZLwjiIeqNmK4Ro2glDV12MyKXKO/CHb+/gNr7ZsCLqWpG
 yPftLSpxJsE4ZvGEyx1Omqhez/Z9HayC7R8HON4GGy0ubAYVeHn4yhfgWRQFSUX6eevZ
 9a14BjXs12zfbfGMr4NQcHt1syg4j4nJKSpizN2sF7QkRZAURyDpCmKUrS9g3ardLMKX
 RFwQIfXobzHtPPvyu7tfoOsBCShoB7XaonP2CtbsELHl5VW5n43gZD/EHz9HVkKZuhIe
 HHYVue1wRDLEsE83R6GANBKPlfF+iThxntJkrqQWilZBNiqJSGhZ/ykM9NQXJ6trcwLx
 z/Zw==
X-Gm-Message-State: AO0yUKX2tcL1ie/A2OYpV5ddGko+TtkDRxWIl7tmarCjn80F2Hcf47ei
 Ma0qKJW7jFKs9O5CCwQg1DY=
X-Google-Smtp-Source: AK7set/jUCFaL62fEij5mmBXq0rmi9tGj3yGhlRhFiz5oyT6fMYAFUcO6qIEIwd7Uu9v6LHsmXmdgg==
X-Received: by 2002:a05:600c:4f07:b0:3dc:50c1:5fd4 with SMTP id
 l7-20020a05600c4f0700b003dc50c15fd4mr5713832wmq.15.1675331800896; 
 Thu, 02 Feb 2023 01:56:40 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c17d500b003dc5b59ed7asm3895142wmo.11.2023.02.02.01.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 01:56:40 -0800 (PST)
Message-ID: <1287614a-754f-a5b9-d940-3f4fdc8f3bce@gmail.com>
Date: Thu, 2 Feb 2023 10:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] drm/mediatek: dp: Only trigger DRM HPD events if
 bridge is attached
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230202045734.2773503-1-wenst@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230202045734.2773503-1-wenst@chromium.org>
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
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02/02/2023 05:57, Chen-Yu Tsai wrote:
> The MediaTek DisplayPort interface bridge driver starts its interrupts
> as soon as its probed. However when the interrupts trigger the bridge
> might not have been attached to a DRM device. As drm_helper_hpd_irq_event()
> does not check whether the passed in drm_device is valid or not, a NULL
> pointer passed in results in a kernel NULL pointer dereference in it.
> 
> Check whether the bridge is attached and only trigger an HPD event if
> it is.
> 
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> Changes since v1
> - Dropped prerequisite-patch-ids
> - Added Guillaume's Reviewed-by
> 
> This applies on top of mediatek-drm-next.
> 
>   drivers/gpu/drm/mediatek/mtk_dp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 1f94fcc144d3..a82f53e1a146 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1823,7 +1823,8 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   	spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);
>   
>   	if (status & MTK_DP_THREAD_CABLE_STATE_CHG) {
> -		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> +		if (mtk_dp->bridge.dev)
> +			drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
>   
>   		if (!mtk_dp->train_info.cable_plugged_in) {
>   			mtk_dp_disable_sdp_aui(mtk_dp);
