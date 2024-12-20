Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8FD9F898B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A9B10EE40;
	Fri, 20 Dec 2024 01:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kiW5ErkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7DA10EE3C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:30:55 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso1312601e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658254; x=1735263054; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IzTtQjuhpCjVrIgeBhHjNDNPAoY696uerkKb/GkTgyE=;
 b=kiW5ErkXuMuhi5f25Ho92rE+wfo2Hmq8cnL9X0yTDOM5D/lcp7BWIvIdbny1jHNUNO
 Nx88CA15mTNigIhXnEiqOgNLGsk0ZDHNj5la+yYYBsT0iP1PlTiUL4E39XmXgPQQL2af
 EPeYxAyBULNd6OQHiwnQW5OZ1WaVnM1+PLSMdPgAwq9ofjyl98ZrpiqBLoqyfRSdVpza
 RbecOF21P3m9eOA7nDsjhD2FsKB52ZK6jsiQBeFnpo1HhsBMrnOMMJNMjy1zdoz2uVSU
 jZ9u3o2z/YiRTY+GVharMVkvxCuFsfHB9UdALLbNAmXjbWFpFFb0VCU6uM+Y+9zM9hsy
 lLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658254; x=1735263054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IzTtQjuhpCjVrIgeBhHjNDNPAoY696uerkKb/GkTgyE=;
 b=NBWNIqDFN5INjX6I5tptlB6aj/HX8LoP3NDtdtCWBYldt5+JeZDlyoD8tJ7ebJ+/ew
 AZ7VDN7DfJsMc2Uf5gxg+gWZLwEyOtO9Uo/djZ8a+5j372exi64RzqYIZhqpPMTZpjwB
 3BewOkJvwd+CLlYHWP6919MEsv7vfXsRjLehypdg6FPf9wupPyIJGDPyDVAEzgoeJBmd
 ucMKbsKhRsNRRwigvpn7DTYTKdyetkygJc505KvHJn+mYzLCP1+SAO9Wa8etOMJC966t
 Zy3E+KxqbzyAqRdDEvvqImblDky53/4tBT4i+pLNVYJd8wHexs9GocYepIAEjVcF33mX
 KcWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCIa7jW1qBg5BRJLgzfBi9wiwmEv6HEKBfeJT9Ix6ljE5rEoTrpAv9/uxvhpNMOeItBg/QtFKjgvw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoPHQJ+HgqP3+wBcEBVQzs91QC4Wue/b4kNN5E5MJATNncuLzG
 ERR9+3TxMnSJWBfCkhyLJlte9nEJJA0h2/24+kIO5QaqXMu8RHAocZCllmMa/Ac=
X-Gm-Gg: ASbGnctcgHinbwOVWYbMdS7xGKw87+zmeO/cYuCs3nOIQZsH6+71elE5J/u77EhBKGQ
 a0/c/a6scaVCTyxPaTQp/APLP9jl3CPDrO5XQYBFxweum4q5vD4B8Z2wNEw6PO78z8+HJYDjFUc
 h282Setl6cZ6LiyZHVKBqyH6YIwNFVSMfDpBLlTDvSJPhZh36XxVe8mqebM76ydDVbVR8DsBMU+
 itTWoDlgVKzbTKVeb5IgUJLexFlLPgDRTvPUTRHI51CJDfn4GhCijE0K6ScvBcVxzVuiZ6p9vpi
 u+Ksf0olq7Yxq0+tbZhE7UiMJWCQEB+pIcpx
X-Google-Smtp-Source: AGHT+IHdJ9hhUuTWasllcN07J9evI4uSKaQYhemK2gVhtQ3JoeUtiyvLdaFFgPjMSuptdLf8CoAAmQ==
X-Received: by 2002:a05:6512:3c98:b0:53e:239b:6097 with SMTP id
 2adb3069b0e04-54229597f58mr165121e87.50.1734658253608; 
 Thu, 19 Dec 2024 17:30:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223600099sm336151e87.78.2024.12.19.17.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:30:52 -0800 (PST)
Date: Fri, 20 Dec 2024 03:30:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stefan Ekenberg <stefan.ekenberg@axis.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel@axis.com,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4] drm/bridge: adv7511_audio: Update Audio InfoFrame
 properly
Message-ID: <hahl4w56e23duuehcvqeaq7orrm77o7cobwpbgl5xh56fynefc@lapt2cdjuhai>
References: <20241119-adv7511-audio-info-frame-v4-1-4ae68e76c89c@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-adv7511-audio-info-frame-v4-1-4ae68e76c89c@axis.com>
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

On Tue, Nov 19, 2024 at 08:40:29AM +0100, Stefan Ekenberg wrote:
> AUDIO_UPDATE bit (Bit 5 of MAIN register 0x4A) needs to be set to 1
> while updating Audio InfoFrame information and then set to 0 when done.
> Otherwise partially updated Audio InfoFrames could be sent out. Two
> cases where this rule were not followed are fixed:
>  - In adv7511_hdmi_hw_params() make sure AUDIO_UPDATE bit is updated
>    before/after setting ADV7511_REG_AUDIO_INFOFRAME.
>  - In audio_startup() use the correct register for clearing
>    AUDIO_UPDATE bit.
> 
> The problem with corrupted audio infoframes were discovered by letting
> a HDMI logic analyser check the output of ADV7535.
> 
> Note that this patchs replaces writing REG_GC(1) with
> REG_INFOFRAME_UPDATE. Bit 5 of REG_GC(1) is positioned within field
> GC_PP[3:0] and that field doesn't control audio infoframe and is read-
> only. My conclusion therefore was that the author if this code meant to
> clear bit 5 of REG_INFOFRAME_UPDATE from the very beginning.
> 
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Fixes: 53c515befe28 ("drm/bridge: adv7511: Add Audio support")
> Signed-off-by: Stefan Ekenberg <stefan.ekenberg@axis.com>
> ---
> Changes in v4:
> - Add Tested-by tag
> - Link to v3: https://lore.kernel.org/r/20241118-adv7511-audio-info-frame-v3-1-31edd9931856@axis.com
> 
> Changes in v3:
> - Extend commit message and explain replacement of REG_GC(1)
> - Link to v2: https://lore.kernel.org/r/20241115-adv7511-audio-info-frame-v2-1-ca4793ef3a91@axis.com
> 
> Changes in v2:
> - Add Fixes tag
> - Link to v1: https://lore.kernel.org/r/20241113-adv7511-audio-info-frame-v1-1-49b368b995a5@axis.com
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
