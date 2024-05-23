Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079548CCD20
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 09:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E5210E0C2;
	Thu, 23 May 2024 07:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bWhHCZDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36BC10E0C2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 07:38:01 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4200ee78f34so15999715e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 00:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716449880; x=1717054680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xl+iAI5K26DEll0VRgVu8PUUNjDInH4W5RuekMCF5nI=;
 b=bWhHCZDKn6jSPHEIOIM9pg/VOyRkK7hZfTf2ALq5V0mUxj8mgkNsBgFQ/FvYXdHxZq
 oIYsM2pQ49kQwccMbU2RN4TUWX+f9QAhukN+ndAf5I1dOowSudrTC+Jg9QgQLd+J0Pk8
 JsdK6JKdqahvKGu5fvhN9iaHcYBeHIvE6diDr42NZYL3/rZ0u/RwJSGG623IzFkqt6BZ
 mDz40JRo4jrZAEVgV+4vSiNVDZXi+VQJH/RKLh+a040i9DxcdPlF9XBxTS2UmPYTBCCh
 GHP8FcdlNH9t+A1NMVDpkoyzQskyYovCX12EqLnmYCbscL9Xo6G9HNzPq0fMnU8Y7M8z
 shTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716449880; x=1717054680;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xl+iAI5K26DEll0VRgVu8PUUNjDInH4W5RuekMCF5nI=;
 b=IADL+xrKCOQxLQ/S7SqbPzItWF6TB850pHTeRMNxRpmm6EknWlLuS1/s+cjMdzJfkU
 eTVQH5vozn01Ji3MLG7o0EWfJCSZVEiJhwOrEoFzc08JB81UF0wegpt1/nwaXirg6yrj
 e0TsbquwW6cjzld0E2WzCer7Vmxx/QBak1DRmH/f6nvCG2iF7YAdobQ7a48Q5AGS5d3S
 j8IisnfG6mTPinIf/00tTAmjmzVC1E1pFsz2q+17ho8bOqv6OXojkrz0nYXQIHsZ5sCA
 edgGMvo7tQw64vkVEz+th6Wnj2CqRA/55fhwcZqlk3gb/3LECBgUTe8nTTNb0rgFvvr5
 ptBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcWRM3UGK1UoRZwtsyDnW6JhmmvCe7ckEHcPjTKwwgwybs1NkOObWLpNgI4sF9/UgIe27Zol+TMUvwo/LQFMVfRucOvSktS8Tq5YIrGE+B
X-Gm-Message-State: AOJu0Yz01SB/OJqQunPlbAyktC82eiXUhDeAJB7ysu1e4CqxixG0VBmJ
 8mQhu5k3v2HRjpzWdFYcyGrSyQC3iU3EpYU21QROlIhYacfvB8hYpi3oNB9/ne0=
X-Google-Smtp-Source: AGHT+IGxCy+R6DXa1uioyKqLkzy8eBBddT/Xs+TEdS0tI/tLzh/voAk/5vtXzmVG0ekMZdWy6l+dbQ==
X-Received: by 2002:adf:9d87:0:b0:354:ddb1:1c37 with SMTP id
 ffacd0b85a97d-354ddb11c81mr3578880f8f.30.1716449879987; 
 Thu, 23 May 2024 00:37:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354fcf20f4csm282500f8f.47.2024.05.23.00.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 00:37:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Ondrej Jirman <megi@xff.cz>, 
 Shuijing Li <shuijing.li@mediatek.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Xinlei Lee <xinlei.lee@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240517213712.3135166-1-dianders@chromium.org>
References: <20240517213712.3135166-1-dianders@chromium.org>
Subject: Re: [PATCH 0/8] drm/panel: Some very minor err handling fixes +
 more _multi
Message-Id: <171644987900.2016197.4033111392889834294.b4-ty@linaro.org>
Date: Thu, 23 May 2024 09:37:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

Hi,

On Fri, 17 May 2024 14:36:35 -0700, Douglas Anderson wrote:
> This series is pretty much just addressing a few minor error handling
> bugs that I noticed recently while reviewing some panel patches. For
> the most part these are all old issues.
> 
> This also adjusts the new himax-hx83102 in a similar way that Dmitry
> did in his recent series that included commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling"). His
> series handled the panel driver that himax-hx83102 forked from but not
> himax-hx83102.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/8] drm/panel: himax-hx8394: Handle errors from mipi_dsi_dcs_set_display_on() better
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cc2db2ef8d9eebc0df03808ac0dadbdb96733499
[2/8] drm/panel: boe-tv101wum-nl6: If prepare fails, disable GPIO before regulators
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/587c48f622374e5d47b1d515c6006a4df4dee882
[3/8] drm/panel: boe-tv101wum-nl6: Check for errors on the NOP in prepare()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6320b9199dd99622668649c234d4e8a99e44a9c8
[4/8] drm/panel: ilitek-ili9882t: If prepare fails, disable GPIO before regulators
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/554c00181968d43426bfe68c86541b89265075de
[5/8] drm/panel: ilitek-ili9882t: Check for errors on the NOP in prepare()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6a7bd6cde73f0fb7e5faa964dbdeb45b55c64698
[6/8] drm/panel: himax-hx83102: If prepare fails, disable GPIO before regulators
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/509eaa8aeee64bd7a41ca53d8728e497a9991074
[7/8] drm/panel: himax-hx83102: Check for errors on the NOP in prepare()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/676a079fb3be66aed12cf40f236c77b8e7c189c3
[8/8] drm/panel: himax-hx83102: use wrapped MIPI DCS functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a2ab7cb169da38757323929f7b3b4cf396ec53b5

-- 
Neil

