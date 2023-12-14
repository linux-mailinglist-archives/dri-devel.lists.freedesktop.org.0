Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F1F812446
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 02:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A9510E8B7;
	Thu, 14 Dec 2023 01:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BE910E8B7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 01:05:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c9f559b82cso87370321fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 17:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702515905; x=1703120705;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=HkhdBtSmWwRfNHiwiMECGN6RIaBB+5rPDSa5547POLU=;
 b=AkY6DAkUwcM7SbwObwurAAmhahuBbkANNo2ztK/MVrJ7UJ1Cs83HGX7H89jCuHiA6T
 FQU752lv5T6zpO2IwcE69ZZeP3oi36X0p69y1lWbO57x+OFbgLzNgRrxuRwxB3vkoN/6
 KRAPkXEXvWjfXK2oqKjDjDyUbuo0sx8uTE7Mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702515905; x=1703120705;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HkhdBtSmWwRfNHiwiMECGN6RIaBB+5rPDSa5547POLU=;
 b=wzTEsGSJvApTEm8nWtxpZz9rYUWPedFFgP2CzpzIaRGmN2rvd7Vx8XfVLa8GIaApbS
 iQRLijFz9AG9V4y6LGfW2hnv30o4+7vhHZhhLXGeo69m0fn+ppAUEsOYNyQ+XaxeLF18
 DcdimbmT7R77spIYeQJV6A8h2JAlFdPVPeN609CpYbKva+MGkbOYTwqnJNB58SDOokHa
 DaqwT5Nk5TarPHOgM4MvAVyZCW05+sTiGLggmsOGOCj2RvcqMsxay29H64koM+grzFLG
 ykRnxjVeLzYDCwh4XXgd25VtCPsiDxDHWKNd32+TdqPsQU9AK4iEwb9PpYcdbSARCLZI
 09cQ==
X-Gm-Message-State: AOJu0Yw/nQ6rsxe+LefSXJ3DOiYbkqX7F5ebY3QjYvDtXfNwSKVjE0+F
 ITFdTwIl1SlOuk9jqYUxo5zom8NwwdcdFVLL7Z5FhA==
X-Google-Smtp-Source: AGHT+IF69Ly0RR20PQb/TZjZLM+6Nams1IX/WItd9cZEzf5KMg5g/Ejl1lhmIsE6oRJQJmFHNCMgb0HmFsfsOThyLCw=
X-Received: by 2002:a2e:9441:0:b0:2c9:fece:5be4 with SMTP id
 o1-20020a2e9441000000b002c9fece5be4mr3498017ljh.42.1702515904718; Wed, 13 Dec
 2023 17:05:04 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Dec 2023 17:05:04 -0800
MIME-Version: 1.0
In-Reply-To: <20231211165526.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
References: <20231211165526.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 13 Dec 2023 17:05:04 -0800
Message-ID: <CAE-0n5199hd1wUtsYpDVRHDwtP75wHB-44Hj9AF5fdGrN_nATQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: parade-ps8640: Never increase the length
 when reading from AUX
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philip Chen <philipchen@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2023-12-11 16:55:26)
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 8161b1a1a4b1..fb2ec4264549 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -302,7 +302,7 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
>
>                 fallthrough;
>         case SWAUX_STATUS_ACKM:
> -               len = data & SWAUX_M_MASK;
> +               len = min(len, (unsigned int)(data & SWAUX_M_MASK));
>                 break;
>         case SWAUX_STATUS_DEFER:
>         case SWAUX_STATUS_I2C_DEFER:
> @@ -310,7 +310,7 @@ static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
>                         msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
>                 else
>                         msg->reply |= DP_AUX_I2C_REPLY_DEFER;
> -               len = data & SWAUX_M_MASK;
> +               len = min(len, (unsigned int)(data & SWAUX_M_MASK));
>                 break;
>         case SWAUX_STATUS_INVALID:
>                 return -EOPNOTSUPP;

If the hardware indicates the len is larger than the length of 'buf' do
we need to throw away reads of the fifo until we read the length that
we're told? I'm specifically looking at the read loop at the end of
ps8640_aux_transfer_msg() where it reads a byte at a time out of
'PAGE0_SWAUX_RDATA'. So maybe what we need to do is have 'buf_len' and
'len' and then return the min of the two at the end of the function but
only copy over 'buf_len' amount.
