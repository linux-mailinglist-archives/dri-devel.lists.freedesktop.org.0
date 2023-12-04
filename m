Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E1D803635
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 15:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E65E10E1E2;
	Mon,  4 Dec 2023 14:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1811B10E254
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 14:16:38 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c9f57d9952so21777171fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 06:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701699396; x=1702304196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnNKn8nu723Lg0zpF/kv/3F1mKY2Dj8RO/b7j9k36Wk=;
 b=CYxvANpQgvOe2msEQpHctyhmWuTT/2gZahKogPLeuihnNBdtd7Fiv6odGjxZL++wE/
 fSCo8enUiQTuCVioVYLodunKdBdOQe9Sa8WCo/2vI9xcGfk3y4my18/mo2Yhi1+T6VF0
 9ZKgyCR8QfMceq1ygLN5t+XflOWUSPzL7qgTlraffOuGL69U+HdVVbVmaqxqdaehSvKI
 BNigItRKux7QfhZpK+xLEcAWtg0BUkq6n6gYb8P7zAO8YJPfNGoKiEA1gXRZfztApGiS
 JZVZDXJ/ThKlQ5MKYyz2BpBCTWMjv1NnerV9oD/oWqwpcwC1xckGGg9p0kOYZNweP3rA
 foDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701699396; x=1702304196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tnNKn8nu723Lg0zpF/kv/3F1mKY2Dj8RO/b7j9k36Wk=;
 b=U6xYn68mYCmrw4NxEQ1xGfnd9Ca1642eVYUcQIKiYe5XtclsYUy9zB6LBaEazjcEhy
 +IBMXpLUFgGbkq6uAacFJC+meXEYuSyYs0uJAoRYSox2BPWhN3JTZxzO1KLkOc18VdJr
 Uui3BgauFQ7Wiyd4W3DUTizXRLvJ/W5POBPXsYYU67mQvCg6SSRJSSmwRhEQjd48iDRd
 4jdyBpJOsLcE3HKlEiBHGlpIECAOVjHLyGTFAAwE8FQeoeSnoA8X7aUS+bz2o8YvyXLw
 CyCdYV7jb/BBT6CbJew3WcEVmloQ37knKz1PPwJwIEoQB0s74aW88IcZm2bz5wZE8gvB
 lp8g==
X-Gm-Message-State: AOJu0Yz9v27QwFTjdGZmfNi/YU60QhTTv6YoEA/5X07iZv6PBMkIMQR7
 3MjrZnUzq51ElfJ9QDW7CM1EZA==
X-Google-Smtp-Source: AGHT+IHddUgNiM5+JeDrcniHCScJhE7jly22t2q9+rXWr3RDXN6X9hcnxXrPXIv6LuNWyNWoqwMFJg==
X-Received: by 2002:a2e:8041:0:b0:2c9:d863:2c1c with SMTP id
 p1-20020a2e8041000000b002c9d8632c1cmr3034669ljg.69.1701699396066; 
 Mon, 04 Dec 2023 06:16:36 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 v3-20020a2e9243000000b002c9fda71acesm487033ljg.127.2023.12.04.06.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:16:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RESEND 0/6] drm: simplify support for transparent DRM
 bridges
Date: Mon,  4 Dec 2023 16:16:30 +0200
Message-ID: <170169936705.76859.13553998311101543980.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 03 Dec 2023 14:43:27 +0300, Dmitry Baryshkov wrote:
> Greg, could you please ack the last patch to be merged through the
> drm-misc tree? You have acked patch 3, but since that time I've added
> patches 4-6.
> 
> Supporting DP/USB-C can result in a chain of several transparent
> bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
> in a different way resulted either in series of hacks or in device tree
> not reflecting the actual hardware design. This results in drivers
> having similar boilerplate code for such bridges.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/bridge: add transparent bridge helper
      commit: 2a04739139b2b2761571e18937e2400e71eff664
[2/6] phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
      commit: 35921910bbd0b6ab595cead16d0c8faadbf2fd94
[3/6] usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
      commit: c5d296bad640b190c52ef7508114d70e971a4bba
[4/6] drm/bridge: implement generic DP HPD bridge
      commit: e560518a6c2e60f1566473c146fddcff3281f617
[5/6] soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
      commit: 2bcca96abfbf89d26fc10fc92e40532bb2ae8891
[6/6] usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
      commit: 7d9f1b72b29698e3030c2b163522cf4aa91b47e9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
