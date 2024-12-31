Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF389FEBF2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 01:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD0B10E59F;
	Tue, 31 Dec 2024 00:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="GBD04wKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5B010E59F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 00:44:37 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aaec61d0f65so1439507066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1735605816; x=1736210616;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IMEB8NCZ8QveU/RhcsTwV/DZjVBc049BfdXpRNTavFw=;
 b=GBD04wKVCzAfoixPY7OFh9b2RGM4UO72+XBQjfMopXyBuFTJIaCs2DGMW+6Qb1BxYp
 kG5ZqYVWHAH4hXbpLBFLCfLKCUxD5QjCCWEpZcFKFCRZTiE5r00rt1iKh46AbLx0iB98
 nwHcEXaxJmjIYyrArA93eoobuGbw37bT+IfBnJdYwtbD599Q3OVP91QI45mFH8ZYsQOE
 dGBl+31fxq0FvjLstv1FeKozwpwqtMshqQvte+oxxmDPLbOW6pm9gCh/qMnxqZRw+0yd
 teieYgJd8pXCseQqc1JonLft1ikhlRfxVez4YkFd+5unigAI3Uv0hhLotor8wJKQ11x4
 /xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735605816; x=1736210616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IMEB8NCZ8QveU/RhcsTwV/DZjVBc049BfdXpRNTavFw=;
 b=jYw12CDfOH07tutJaJ1q3Ekz84Gw9Q2Q5Uj0Cw86YN7z4rWSa+7PI+5j36IigcVP2+
 JNdJygaenr9wHSnCeW9D/RlMxc6VIbO3WrZCQAIWamJMSZTdZ0YESKOqqnZib2gqDn82
 6iRe21k/OMIXChIW5C7GUar/Qr1DA5VpViGbhPREPC8DpSTlCwzpq4/ApeKDp+Tg2K4b
 SEA8Mygs9Pf74Ztcx9dsc95CydtG9r9Bhi/04QPF3n51eFzaL9AHpavk8D4T1TujZ38F
 lJ60IH1kSw9hqUwFmnZYxkJOiFMEaiYDrBFCe0yXqLCD18jKsqmLsq9otzdmJXALVKgO
 xy4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+MSV/DttqsVr/Kcc8R221q7owDDGAOAsHhh6qIl9o4iMJjIgnB/9e5R0CAimXurQaWhNY1iL5Bl0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxucXtjehP1GoQPG6E+pK6uH0pqu7UBFkNOb4UIWIh3PWRtg0j3
 IC2ZhPrrE6VE23B/Sw0LSodpg2aNRepJuzeRuZJ5l07zSL1l1stw
X-Gm-Gg: ASbGncuz7MCiK3GnYV57x/DkmPQpZZQyQ1+3a/vAGwNRs3BcBWK1D6uVT636Su2/TBJ
 HrYvTLpxfShc9NQiD8E5dpEPfFIiF+vkETgw8l2yiWY28CZ7SEFN46wAsCTc0Ac6+lD+0xnCXrI
 daOzuiF7DZ4z3PCsnGkeW8dGC6fjAvL/OAhC4tKGzVrm/v2tMiN5k2HUTKrlRgB473Eo/U4FiDc
 f68hfmLV62BTvyaAJmfOTRRZXNbPM4GU5I8Dm7ALa1MgEA6uS9dksVfOsoBpsoG0DWztTUR9NIa
 VUhNBLte6CNjG+g4PnyVVmXijh/hnw6jk0yvdPXPcQyjXaZpC3rkzGjxoAYUc0xWGxvSrkiPQHc
 ut2QWR8A45zdFLopIjnk0G+2u4w==
X-Google-Smtp-Source: AGHT+IHEGIcJK+SSB1VqPTnorkRP+VtiC6uvv9JG0CKDkLO9JdbaG0jU5yoLZ0jcvFezMTEsCCv8Bg==
X-Received: by 2002:a17:906:99cc:b0:aae:85a9:5b66 with SMTP id
 a640c23a62f3a-aae85a95d37mr2281685866b.60.1735605815987; 
 Mon, 30 Dec 2024 16:43:35 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a02-3100-a465-b000-1e86-0bff-fe2f-57b7.310.pool.telefonica.de.
 [2a02:3100:a465:b000:1e86:bff:fe2f:57b7])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-aac0f06dc7esm1523425066b.193.2024.12.30.16.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 16:43:33 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dmitry.baryshkov@linaro.org
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 alain.volmat@foss.st.com, alim.akhtar@samsung.com, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, inki.dae@samsung.com,
 jani.nikula@linux.intel.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 kernel-list@raspberrypi.com, krzk@kernel.org, kyungmin.park@samsung.com,
 lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 mcanal@igalia.com, mripard@kernel.org, neil.armstrong@linaro.org,
 p.zabel@pengutronix.de, perex@perex.cz, ple@baylibre.com, rfoss@kernel.org,
 rgallaispou@gmail.com, simona@ffwll.ch, sw0312.kim@samsung.com,
 tiwai@suse.com, tzimmermann@suse.de
Subject: RE: [PATCH v10 03/10] drm/connector: implement generic HDMI audio
 helpers
Date: Tue, 31 Dec 2024 01:43:11 +0100
Message-ID: <20241231004311.2574720-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-3-dc89577cd438@linaro.org>
MIME-Version: 1.0
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

Hello Dmitry,

this is great work - thanks for your efforts!

To give some context:
I am working on a HDMI controller driver for the Amlogic Meson8/8b/8m2
SoCs. Unfortunately the driver is not mature enough for upstream
submission (all I have is the vendor driver which serves as reference).
That said, my goal is to upstream the driver at some point. I have
already switched my driver to use hdmi_{clear,write}_infoframe. Now
I'm trying this series to simplify my code even further - by using
your audio helper work!

> --- /dev/null
> +++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
> @@ -0,0 +1,190 @@
> [...]
> +static const struct hdmi_codec_ops drm_connector_hdmi_audio_ops = {
> +	.audio_startup = drm_connector_hdmi_audio_startup,
> +	.prepare = drm_connector_hdmi_audio_prepare,
> +	.audio_shutdown = drm_connector_hdmi_audio_shutdown,
> +	.mute_stream = drm_connector_hdmi_audio_mute_stream,
> +	.get_eld = drm_connector_hdmi_audio_get_eld,
> +	.get_dai_id = drm_connector_hdmi_audio_get_dai_id,
> +	.hook_plugged_cb = drm_connector_hdmi_audio_hook_plugged_cb,
> +};
On my platform drm_connector_hdmi_audio_prepare() is never called. As
a result of that the audio infoframe is never written to my HDMI
controller hardware (hdmi_write_infoframe() is never called with type
HDMI_INFOFRAME_TYPE_AUDIO). My hack to make it work is to add the
following line to drm_connector_hdmi_audio_ops:
  .hw_params = drm_connector_hdmi_audio_prepare,

I checked all instances of struct hdmi_codec_ops in v6.13-rc3 and it
seems that there is only a single driver which uses the .prepare
callback (drivers/gpu/drm/vc4/vc4_hdmi.c). All other drivers seem to
implement .hw_params instead.

The audio controller code for my platform is already upstream:
- sound/soc/meson/aiu-codec-ctrl.c
- sound/soc/meson/aiu-encoder-i2s.c
- sound/soc/meson/aiu-fifo-i2s.c

My understanding is that you have a platform with a lontium-lt9611
HDMI controller available for testing. Can you please help me
investigate and find out which piece of code is calling
hdmi_codec_prepare() and therefore lt9611_hdmi_audio_prepare() on
your board?


Thank you and best regards,
Martin
