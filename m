Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1C8801ED6
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 22:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B225F10E228;
	Sat,  2 Dec 2023 21:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ABD10E0D5
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 21:41:18 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bc8a9503fso4491938e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 13:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701553277; x=1702158077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWlbs0KWaBVaE8N6qVsZVkB13N3rqr1ujf1GT2aj7Uc=;
 b=lbOWokJtEPsIFeegFirwbaS7UM83lh6iYMv9iZIA237lnmWE1ZTT9jaE9jGm16ggwE
 LpaH3rQ7jWWoQtAUMjn1Hpog2rAUYBLEjEaPtEgfK+uSwquNrwNUsbs+x11++Zw3CTbt
 naD8aVg/EzmMYg9SjjSiL0giUpjFlJrbUjZRE1965fdKJsxA+8H+U16CMc8gQe7/Kj8O
 b/A5AXB3RdMLidR72Nm0vP/yCAuuWNbDto6T4vrWOq92YskFk0S2vqXk163VjjT6Ao2A
 3nrAY0bf/dUnrSQ8pX+rVgSZXS+PJ3Y3qNaTyOIMoOy9cpdzG7WRBW5aNxyrhN0NHpWN
 tSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701553277; x=1702158077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QWlbs0KWaBVaE8N6qVsZVkB13N3rqr1ujf1GT2aj7Uc=;
 b=UcByvytohW1AyYBS19eH59p9IHvdzy2jZGJo9k2x4jlqVdMBnekBZ3TX07HuSXD7aJ
 oSxISCCTzFQovxA043U2g4/k11C38F0wUzGKDyfQ05FPooizxsNDkrde4IrcHdJYIw5L
 xq//vDNwJMf7IxyfdlHWsyafJDUusHboaVH9oKVxFfizcdSdbZ9PkLWvbeLaAUq6peM4
 VwrLNVx5GdPsOVs3yYKal/0QXYg4flfirY9wrCWq/M+CUFM1yXDQOqWITW8GpOWeE/mZ
 WKB/2p3l771fO1pGSU+UfRPJBVreEpf2MbyFJ3mmwJ6mZOEBeoMhcSSZPM7045k0u3CO
 hRjQ==
X-Gm-Message-State: AOJu0YzJ0mt7NMKc6zAs5CMwdWYtwPjnowNumQupu3U/dqzlJXb3brzL
 thmFeJKl78qXWSDIcpXfrsYg1w==
X-Google-Smtp-Source: AGHT+IE4fJCooRxy/WvcclobOdpHuXuNKEXkbUoo4PErcRVQclKZm/XLN5PrK52OLiSuV17YyY06tA==
X-Received: by 2002:a05:6512:2151:b0:50b:f2c5:56b2 with SMTP id
 s17-20020a056512215100b0050bf2c556b2mr7119lfr.47.1701553277170; 
 Sat, 02 Dec 2023 13:41:17 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 k39-20020a0565123da700b0050bf06eb35esm78810lfv.86.2023.12.02.13.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 13:41:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: (subset) [PATCH RFC v7 00/10] Support for Solid Fill Planes
Date: Sat,  2 Dec 2023 23:41:13 +0200
Message-ID: <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: sebastian.wick@redhat.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ppaalanen@gmail.com,
 laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 wayland-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 27 Oct 2023 15:32:50 -0700, Jessica Zhang wrote:
> Some drivers support hardware that have optimizations for solid fill
> planes. This series aims to expose these capabilities to userspace as
> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> hardware composer HAL) that can be set by apps like the Android Gears
> test app.
> 
> In order to expose this capability to userspace, this series will:
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm: Introduce pixel_source DRM plane property
        commit: e50e5fed41c7eed2db4119645bf3480ec43fec11
[02/10] drm: Introduce solid fill DRM plane property
        commit: 85863a4e16e77079ee14865905ddc3ef9483a640
[03/10] drm: Add solid fill pixel source
        commit: 4b64167042927531f4cfaf035b8f88c2f7a05f06
[04/10] drm/atomic: Add pixel source to plane state dump
        commit: 8283ac7871a959848e09fc6593b8c12b8febfee6
[05/10] drm/atomic: Add solid fill data to plane state dump
        commit: e86413f5442ee094e66b3e75f2d3419ed0df9520
[06/10] drm/atomic: Move framebuffer checks to helper
        commit: 4ba6b7a646321e740c7f2d80c90505019c4e8fce
[07/10] drm/atomic: Loosen FB atomic checks
        commit: f1e75da5364e780905d9cd6043f9c74cdcf84073

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
