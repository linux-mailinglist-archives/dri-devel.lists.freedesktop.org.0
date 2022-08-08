Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A583858C5B1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 11:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE6C957B4;
	Mon,  8 Aug 2022 09:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C031E95967
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 09:33:49 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id m4so15527378ejr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 02:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=GefsinhhZIvzOgke7/j4icom1htodcT5WCpPQe8e5y8=;
 b=S/opORLqyTfnOu0Daq4yL0wo2oib7dNnwoTOvBbJD6W1BZJ0OPAbkYnd/LAxs2qvi0
 /Xl4YEhXQ13JuM7/tNN/z1II3hLf0tTpOt123F4bRnAzsGzbV8rfAZlXK7QajOX541tn
 cLLkA0A1OCruRyhi65G3u9MlmV6buWY1osyY6ENgWMNm07gIpp1fA3zF61i/PyRFv65K
 1NNOl1J3mcpg+F+z5Yz2nOL732BQ1uzzjqi2dnYIUUChPWUw/p6IQb/RFVL9j4YPLYFv
 zQThIuZrHALJ5CV+yQF0Onnp17JbmNX/FbJwJlrKYu6FaMYOIdWGR5qDU9bc+leVMz/I
 UY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=GefsinhhZIvzOgke7/j4icom1htodcT5WCpPQe8e5y8=;
 b=Yv+kfMXusIGoGipPt089Jy62x3hHd0dybrsKdTHroX6DhHg6WPVYVWbU3uukT/37m7
 ugee39RH/jBEcG/7HzBXXmSIgOOYCJgoMuCUWdk+2KthzJvaoi8jcybinf0T8IRj/EmL
 40HtLcWIMfVSTQCs+kTN2+8tj63+9hM0SNVip+jIubT7KUl0Y4Yd7LZbsnTOvwT6PC0m
 /0y24EPR8QiCoxr/nLgLvUTZlphzFnJGqPt/YmCH1WJch4HZ7N3r1yZv5HNaEE1OV8tE
 CvtqDV+pPJv4lTRLE5BdIoGPLqVPe9p2pzh3X3F1gyuipUXCCym1lA8RlQ4/pK5K2p13
 vocg==
X-Gm-Message-State: ACgBeo0YjnTWKgAROl8KGrNmnQK8tbqNhBybvPP/tnXySOa/QwAxsVFR
 KQ2gnzn/KUBWiNbUbSNBNOKL2nyAuZsomADyRGKKCA==
X-Google-Smtp-Source: AA6agR7brckEvbEzJvrYSAuJQWiGLxzv7DxLaAmWGD2gLMrCpdNaKTvehj2HlCdSdENeHhdHsjDf97yAScpdW6/xOXQ=
X-Received: by 2002:a17:907:781a:b0:730:cd06:3572 with SMTP id
 la26-20020a170907781a00b00730cd063572mr13385426ejc.487.1659951228289; Mon, 08
 Aug 2022 02:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073119.1578972-1-zengjx95@gmail.com>
In-Reply-To: <20220727073119.1578972-1-zengjx95@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 8 Aug 2022 11:33:37 +0200
Message-ID: <CAG3jFyuMboP9OBJgYD01thVvhdb6wR5BeLN+za_ZUFM1QT4HDg@mail.gmail.com>
Subject: Re: [PATCH] gpu: lontium-lt9611: Fix NULL pointer dereference in
 lt9611_connector_init()
To: Zeng Jingxiang <zengjx95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Zeng Jingxiang <linuszeng@tencent.com>, jonas@kwiboo.se, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022 at 09:31, Zeng Jingxiang <zengjx95@gmail.com> wrote:
>
> From: Zeng Jingxiang <linuszeng@tencent.com>
>
> A NULL check for bridge->encoder shows that it may be NULL, but it
> already been dereferenced on all paths leading to the check.
> 812     if (!bridge->encoder) {
>
> Dereference the pointer bridge->encoder.
> 810     drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
>
> Signed-off-by: Zeng Jingxiang <linuszeng@tencent.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 7ef8fe5abc12..81a4751573fa 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -807,13 +807,14 @@ static int lt9611_connector_init(struct drm_bridge *bridge, struct lt9611 *lt961
>
>         drm_connector_helper_add(&lt9611->connector,
>                                  &lt9611_bridge_connector_helper_funcs);
> -       drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
>
>         if (!bridge->encoder) {
>                 DRM_ERROR("Parent encoder object not found");
>                 return -ENODEV;
>         }
>
> +       drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
> +
>         return 0;
>  }
>
> --
> 2.27.0
>

Applied to drm-misc-next.
