Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7FB585966
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 11:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53B110F364;
	Sat, 30 Jul 2022 09:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE89C10E769
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 09:16:26 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id o13so8344496edc.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ikzYAjzqfaF+a4GkobxDatu0soZrTXVKMloqR9b6tU=;
 b=ODVq1f1/LK9nGxTfjwXO4ssEzwk81G34edDpsOIHpHTuvnSmZevpPG/84UYDkXBv8U
 CLgbMgUZM8dS1bS1AyLYl9eEjgXp3UpwCxBos92t40mUCmBL3QUrK5RfTtU0vwM/AzDe
 gmM98LP8su2vSEdNxfnnqf5nFNmj1zOGilWCgwL/9zXisxjzzlMldbxrv42qo7OKN4nN
 27y9j7VR8dYZ9tQS/gG1Z4hMSlz1BdNwI7wotbL/IkpHLM3nNYdF72nwzeGiuQZSM/0c
 J5AvjWooDFx+mBcmo+4oeRfdmWr2nWcGaUn/UAI5dUv0Ma/OVWJCC+ckBWsKfufFtS+7
 xQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ikzYAjzqfaF+a4GkobxDatu0soZrTXVKMloqR9b6tU=;
 b=bhyxZxstcMaXlpXLM865iwaDjv1sT0sy1SVAOMgenVOgF9glEavctG28XSrt5F4E2h
 gc/WWdrNFhqjg1GTGDYKean8fyQj1By3aUsqKttVit74LrJF7vWBSj967W4l4d1eHrFh
 DhlTlQYbrD7IcH+h3eWroco/QAp8vPKbTDAZAZpBTUePQE+Rg5N0WLEUo3cIqYB2F1kc
 2aocvywgH7GPZCTUkjivmPT5eI8z9z5xzqEvG5w/G6NUf329zYkE2/p8N/8bTF5pG1Eh
 oDWMUY0Y45ReMA+aeqKQhf1Y5omTlxSXa5OVVqccHN9PcjJFH1JZE8QLub3Qc+Tq/Sl3
 Hxvg==
X-Gm-Message-State: AJIora+ZSQx5IKZAdRxogbQTTx4xR9+oCtfc5K2rkSGTwOyJ8Djh35v+
 LekrhzdDsXCOZptrXClLA1g=
X-Google-Smtp-Source: AGRyM1vwibvRhtEPZaZcnZE0I3sovCWh/d2MGizGNAj8LqkgAI7GjPSEvzFNhCBH1UWn2jszQI2xYA==
X-Received: by 2002:a05:6402:40d2:b0:43c:5a4d:c3b4 with SMTP id
 z18-20020a05640240d200b0043c5a4dc3b4mr7329019edb.95.1659172585551; 
 Sat, 30 Jul 2022 02:16:25 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net.
 [194.152.27.124]) by smtp.gmail.com with ESMTPSA id
 p24-20020a17090653d800b0073045f26d41sm676395ejo.72.2022.07.30.02.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 02:16:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v1 31/35] drm/sun4i: tv: Add missing reset assertion
Date: Sat, 30 Jul 2022 11:16:23 +0200
Message-ID: <1822091.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-31-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-31-3d53ae722097@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 29. julij 2022 ob 18:35:14 CEST je Maxime Ripard napisal(a):
> The reset line is deasserted at bind, and asserted if we ever encounter an
> error there. However, it's never deasserted in unbind which will lead to a

s/deasserted/asserted/

Once fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> resource unbalance.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index ad6a3739bfa9..74ff5ad6a8b9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -605,6 +605,7 @@ static void sun4i_tv_unbind(struct device *dev, struct
> device *master, drm_connector_cleanup(&tv->connector);
>  	drm_encoder_cleanup(&tv->encoder);
>  	clk_disable_unprepare(tv->clk);
> +	reset_control_assert(tv->reset);
>  }
> 
>  static const struct component_ops sun4i_tv_ops = {




