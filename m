Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6675F2812
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 07:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BE910E200;
	Mon,  3 Oct 2022 05:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF9410E0D5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 05:03:46 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so14262438pjs.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Oct 2022 22:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=SKy3cphhGQOtK4Xw6hd/Ts0fN078Qz7EqtaRCbvqhGk=;
 b=evF13t2H4/zBulXqbx8awpnC7qze9+BdxG1hE8KwU+XFR0yd/OBV8HlrqObrvWI5YE
 qSi3E31cSjfxOnb4yNCdveHbiPD5ZBpnHK9nXaFqXS9QB46PnE7ZpcbUGwPMmhr/ZiAj
 SytNbXNLJhCiNtS6dMhYA7bGsSk3BI4EQcmOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=SKy3cphhGQOtK4Xw6hd/Ts0fN078Qz7EqtaRCbvqhGk=;
 b=rlAARIsTkWLtOwmMV89yFiotFC8s8U/OhyxB07LbyIFusCnzB02r7ieU5nBclp24Mi
 3l4RSgSLCDQ1jDB5ECH1rvuY/W11bey+JF5incZ+Q2ka+m7yQJmpV64s2T09mxcVf1Tv
 Znl9SQgq5Lv3/5Q7AlVr9rj/0G+/jBCiK8TSFaJQy698lU8GPZ1YuqN2uBR4bHfg06Z6
 0zx0rU05iROyhh4OKBBssU5Cd5TOBR/FvGerlxdsM0ylccC0IUR7KS4/53IPbCu/A8hX
 QIATD364QlGxqy8P14yndqFTKM8kJEA1HSnwHL+g/R9kumTe8535j6nm0hKCSukzNoum
 24Iw==
X-Gm-Message-State: ACrzQf3BYCgZz3v+hUaynOTgmgIzsg3a14WunvaCmCgmxyhzQLn4lwNW
 /fl6fIpZH4h+TQgzM07lracprA==
X-Google-Smtp-Source: AMsMyM47kxxKPwIzvQ/AnnKgseNXS2gU3FfYWLvfmyT+I4DhmPL7viH3lMshF4vD1M0lSrBdnrbIMw==
X-Received: by 2002:a17:902:b089:b0:178:54cf:d692 with SMTP id
 p9-20020a170902b08900b0017854cfd692mr20306741plr.1.1664773426395; 
 Sun, 02 Oct 2022 22:03:46 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:dfa6:5a1a:b35a:db69])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a170902b48800b0017680faa1a8sm6174628plr.112.2022.10.02.22.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 22:03:45 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/2] drm/bridge: it6505: Power management fixes for it6505
 bridge
Date: Mon,  3 Oct 2022 13:03:33 +0800
Message-Id: <20221003050335.1007931-1-treapking@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
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
Cc: Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Hermes Wu <hermes.wu@ite.com.tw>, Hsin-Yi Wang <hsinyi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains 2 fixes related to it6505 power management.

Changes in v2:
- Handle the error from pm_runtime_get_sync in it6505_extcon_work

Pin-yen Lin (2):
  drm/bridge: it6505: Adapt runtime power management framework
  drm/bridge: it6505: Add pre_enable/post_disable callback

 drivers/gpu/drm/bridge/ite-it6505.c | 57 ++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 9 deletions(-)

-- 
2.38.0.rc1.362.ged0d419d3c-goog

