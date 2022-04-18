Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC52505D2C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 18:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A785510E154;
	Mon, 18 Apr 2022 16:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D9B10E154
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 16:58:33 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id q3so12829787plg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=491sLULzmlGZnrq6QIx86Myu+Z77mq9pr9+v487F+bc=;
 b=QFsNDmtLuRa8MARzTxIBlKpbwIsun1m3TqhOR6KBJKvXP7MAV5jxqdk6qXKe2xt/3i
 a0fvl5/4Mw6KLGK0NzvPor5GsPdOFKCHkeA4zVFanozzPvoPvW44XnudvbydI1MzMHbm
 hiv8uEFEFeAV13WJsHfXG/E6U1eqnhYUkvZeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=491sLULzmlGZnrq6QIx86Myu+Z77mq9pr9+v487F+bc=;
 b=twsiZJndtnTVxYIEKQLdSXQKjEjPaUjrBBF3shZrpD+qNnN8ryxORZbpQjkY6/QuiT
 xK24581p9kiha8JG62BOPQAcMQbhCKZKuEnRnQg776oxQ9gcwDKGgIyzy1va4uMU2jlW
 4xFadu8xIsYllOvF9P3aOb2Ob3oVVl6FY08EKBgGZ50Y5lixXwYHdhnPQBhrvBzgWkhM
 H3tC2UMs2XagF8QIcxvcSDO/ghPMT00cFzQns7Hp4LoVbKUdNM7sfYiugoU2Y6JC4FCB
 wJ3aR4y0w9/Yhq7cNspJIrq1U5ImEOducAaLrqZhnhlczPPJ9j71qyYduTfSs20g7MqY
 n1eA==
X-Gm-Message-State: AOAM532LY5dycMN6gWnUrLQKPmsXGWmVbsvbdFiUwiE0zGA+urmc2fGE
 oAa1q5wB5XxSUsUm+Zyn0wshtAVaHW1cDNZ4
X-Google-Smtp-Source: ABdhPJxJMuALfU4z0eS/x07j9x01pGshvsblfjUu+PvWZs9KC43EC1689mZc5oBSCn99eSsx7MuN9w==
X-Received: by 2002:a17:90a:d901:b0:1cb:97ae:636b with SMTP id
 c1-20020a17090ad90100b001cb97ae636bmr14153875pjv.60.1650301113070; 
 Mon, 18 Apr 2022 09:58:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:94f4:f90:c59f:129b])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a17090a150800b001cbaf536a3esm17700980pja.18.2022.04.18.09.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 09:58:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/dp: Introduce wait_hpd_asserted() for the DP AUX
 bus
Date: Mon, 18 Apr 2022 09:56:38 -0700
Message-Id: <20220418165642.2218514-1-dianders@chromium.org>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Kees Cook <keescook@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Philip Chen <philipchen@chromium.org>,
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

 drivers/gpu/drm/bridge/parade-ps8640.c        | 34 ++++++++++-------
 drivers/gpu/drm/panel/panel-edp.c             | 33 +++++++++++-----
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 38 ++++++++++++-------
 include/drm/dp/drm_dp_helper.h                | 26 +++++++++++++
 4 files changed, 95 insertions(+), 36 deletions(-)

-- 
2.36.0.rc0.470.gd361397f0d-goog

