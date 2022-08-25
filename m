Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771D95A1B09
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 23:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7971410E322;
	Thu, 25 Aug 2022 21:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA0110E322;
 Thu, 25 Aug 2022 21:27:33 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k18-20020a05600c0b5200b003a5dab49d0bso3156433wmr.3; 
 Thu, 25 Aug 2022 14:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=gVyA5Z8on1cy579HoV3noOGIo3WqfSZOmskPQryMgtM=;
 b=eh/92dgXe0iyyY3sIgffq4zQH1CFGZMuz44bFe8eqZHrFui9w/sE6IF5yB6Fdl31m9
 q/giSA6K9TF82r9Z7/3a4lVAFzW09wfSy/165AHuuX16K0vRUPKCGD88QxiQrmNNKFx/
 PNqEaEBMyUErAL98l5VkqMECNhnqLIbgF9x4D6cHJgp36/cUymxzMzQQUJrrxSPR1sbt
 tHiJVRpf39VhrJtrS58T4jfliailuywTFaV0Thv6p9mpo8wn9z+7N1sXsoBeOU89UV5s
 QbzmqMrzJx9P96pqjjVEkAMxG/vEgHLJT3Oq/CqKdjvYxbHH4kMnlj0pz7TUi/E6SNFj
 m1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=gVyA5Z8on1cy579HoV3noOGIo3WqfSZOmskPQryMgtM=;
 b=7MHXnOUInU67yVrwyAI7CH6PPdmHoGKAhmYITd2kdKNx0vu+n1xt7HdXIXc+IeHuyZ
 NfDvBWXFOvEvnsJNF9PXIQkWGtfdsTmdj74iWJuR6qQkr6cub8vmC6SluUXuKDUj0n1M
 WXlqSo9eiH5PmO8R2UARQWUaYi5iM6GT8jYt1y7E3JJz5LyfhmEb4oLH+5oub6M01D0h
 bkzjZeDxmPpmePbU4Sj2/JEzydVlGJkXF+m8r4/1dlnXC81Qmi0L0uCT7d6FJDQKGpqj
 1pPURzOmJUB+jPK944mYi0emcUsewbZxyUCLbZPhLyw3IHNl4ztMe6OI2fFOV+x7J5tg
 Q+pA==
X-Gm-Message-State: ACgBeo204vrPLIz3k71sWnEvbyLDSZMft0hnazkZxBHPRL2QfxUZvrDJ
 UhrTQBK8dsyEBxGqdXTpsqM=
X-Google-Smtp-Source: AA6agR6cucYg/Du4YLrUO/NU1z88fXBAfmGuIRfE4Qrrqd+tO0lSZk3dovhgHxZZ4bK1jgQbd4MAWw==
X-Received: by 2002:a05:600c:198e:b0:3a5:d4a2:8896 with SMTP id
 t14-20020a05600c198e00b003a5d4a28896mr8967780wmq.140.1661462851646; 
 Thu, 25 Aug 2022 14:27:31 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net.
 [82.149.1.172]) by smtp.gmail.com with ESMTPSA id
 k1-20020a5d6e81000000b0021e8d205705sm242110wrz.51.2022.08.25.14.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 14:27:31 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] gpu: move from strlcpy with unused retval to strscpy
Date: Thu, 25 Aug 2022 23:27:29 +0200
Message-ID: <22761203.6Emhk5qWAg@kista>
In-Reply-To: <20220818210008.6721-1-wsa+renesas@sang-engineering.com>
References: <20220818210008.6721-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Samuel Holland <samuel@sholland.org>,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Evan Quan <evan.quan@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Sandy Huang <hjc@rock-chips.com>,
 Robert Foss <robert.foss@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne =C4=8Detrtek, 18. avgust 2022 ob 23:00:07 CEST je Wolfram Sang napisal(=
a):
> Follow the advice of the below link and prefer 'strscpy' in this
> subsystem. Conversion is 1:1 because the return value is not used.
> Generated by a coccinelle script.
>=20
> Link:
> https://lore.kernel.org/r/CAHk-=3DwgfRnXz0W3D37d01q3JFkr_i_uTL=3DV6A6G1oU=
Zcprmk
> nw@mail.gmail.com/ Signed-off-by: Wolfram Sang
> <wsa+renesas@sang-engineering.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/amd/amdgpu/atom.c                   | 2 +-
>  drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c      | 2 +-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 +++---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           | 2 +-
>  drivers/gpu/drm/display/drm_dp_helper.c             | 2 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c       | 2 +-
>  drivers/gpu/drm/drm_mipi_dsi.c                      | 2 +-
>  drivers/gpu/drm/i2c/tda998x_drv.c                   | 2 +-
>  drivers/gpu/drm/i915/selftests/i915_perf.c          | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c             | 2 +-
>  drivers/gpu/drm/radeon/radeon_atombios.c            | 4 ++--
>  drivers/gpu/drm/radeon/radeon_combios.c             | 4 ++--
>  drivers/gpu/drm/rockchip/inno_hdmi.c                | 2 +-
>  drivers/gpu/drm/rockchip/rk3066_hdmi.c              | 2 +-
>  drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c              | 2 +-
>  15 files changed, 19 insertions(+), 19 deletions(-)



