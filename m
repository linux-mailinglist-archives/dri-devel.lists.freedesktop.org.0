Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B5C54BD10
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 23:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D5510F5BC;
	Tue, 14 Jun 2022 21:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48EE10F5BC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 21:54:38 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 184so9663062pga.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4H4NUn2COrLp0xRa2CBlPVWg2u2KQwlrtLFJ1rLvcbY=;
 b=aPUqpJuTW2ZEhs8q222WyLL2uAmKddpR8yFqy+uAwQgI8aG3d4TujliIQh+rDF2M7j
 CF9baksp+VUo0+FVwURSragwSTKY/5p1A5mdjuLb98RN4LrqVKbnwoKIbpQja+ZEDN8a
 j0EB/NVbNwJojEqVwLhqEXG7H4veo0TiilYfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4H4NUn2COrLp0xRa2CBlPVWg2u2KQwlrtLFJ1rLvcbY=;
 b=VIi0I4DJj5by9nPWx7z0/lrjhXCPDrgjVGCcjKJ//y0ZRMtRWYoxz0f+EihzJt4yqF
 tmr3mOxGieDPZ6AdpcjmQOWHrvDwCmNWwhIbpe/Ioi0b1nmx5Sfm85dlYwqLnjfZN5qQ
 DCniDbLbqH5FzvsswNnZg0Ia/aiJ0LqQgd3GAdTygkxYkdb8777tBOhKQpfE1b0bRxGd
 O1mpLelVgBZJ4I8nQEjYRn/bYMUFL7Obta87qXPocACViFtLyOVKwaNk3uLgyxWvngbt
 XwnHSCfoN0m3c6rXWgSqLWLfLWjBf39wo3brggTJ4W4MMYsHGZAx+OFr1MSkoWGHAPRR
 P2VA==
X-Gm-Message-State: AOAM532ar7VryUZUgeg9+H7P0JDb8NHFy8Eu48uXqUbyZW3vJFUVeSOa
 d7tSt9iOCK//g9FSy74mLNufkoxvWaFFGEHT
X-Google-Smtp-Source: AGRyM1u/yF9eLDb7e/TJmxATeXtE5Z6AOnB/WD28MbfZxfTCpN9K62ERWgY38EUgexp8Ck6tiN1hEQ==
X-Received: by 2002:aa7:94a6:0:b0:51b:ddb8:1fcf with SMTP id
 a6-20020aa794a6000000b0051bddb81fcfmr6288329pfl.23.1655243678378; 
 Tue, 14 Jun 2022 14:54:38 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f355:be2d:74b7:3c7c])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090264c200b0016641a646cbsm7668968pli.218.2022.06.14.14.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 14:54:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] drm/dp: Introduce wait_hpd_asserted() for the DP AUX
 bus
Date: Tue, 14 Jun 2022 14:54:14 -0700
Message-Id: <20220614215418.910948-1-dianders@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the 2nd four patches from my RFC series ("drm/dp: Improvements
for DP AUX channel") [1]. I've broken the series in two so we can make
progress on the two halves separately.

v2 of this series changes to add wait_hpd_asserted() instead of
is_hpd_asserted(). This allows us to move the extra delay needed for
ps8640 into the ps8640 driver itself.

The idea for this series came up during the review process of
Sankeerth's series trying to add eDP for Qualcomm SoCs [2].

This _doesn't_ attempt to fix the Analogix driver. If this works out,
ideally someone can post a patch up to do that.

[1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
[2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/

Changes in v4:
- Add comment that caller powered up the panel.
- Comments now explain that we may wait longer due to debouncing.
- Mention in commit message debouncing vs. powering on timing.
- Rebased to handle the fact that the stuct moved files.
- Reorganized logic as per Dmitry's suggestion.

Changes in v3:
- Don't check "hpd_asserted" boolean when unset.
- Handle errors from gpiod_get_value_cansleep() properly.

Changes in v2:
- Change is_hpd_asserted() to wait_hpd_asserted()

Douglas Anderson (4):
  drm/dp: Add wait_hpd_asserted() callback to struct drm_dp_aux
  drm/panel-edp: Take advantage of wait_hpd_asserted() in struct
    drm_dp_aux
  drm/panel: atna33xc20: Take advantage of wait_hpd_asserted() in struct
    drm_dp_aux
  drm/bridge: parade-ps8640: Provide wait_hpd_asserted() in struct
    drm_dp_aux

 drivers/gpu/drm/bridge/parade-ps8640.c        | 39 +++++++++-----
 drivers/gpu/drm/panel/panel-edp.c             | 33 ++++++++----
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 51 ++++++++++++++-----
 include/drm/display/drm_dp_helper.h           | 30 +++++++++++
 4 files changed, 117 insertions(+), 36 deletions(-)

-- 
2.36.1.476.g0c4daa206d-goog

