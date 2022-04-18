Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0FA505D64
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 19:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F50D10E568;
	Mon, 18 Apr 2022 17:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3357610E496
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 17:18:14 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q19so20001970pgm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 10:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6VccAa3X7Ms6K2SzwVUd0nrVrjIkZMldYG3f21qBakQ=;
 b=Wu45mOMXTib78iHCt2WfxT3OuOVxcIwRYu2fpBCu2udIyfPFlb3hMAlwNmb216jy8Y
 5Jg4h1Jin8fkEiz/z0cXM5xK7/LFaJAPAmpC/Shk6Rkf7kf8H3FzrcxupEw6uEzhlZ4n
 xbK1PqTXijDz2ir1vKY2051TxWfLwrS2Nr9X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6VccAa3X7Ms6K2SzwVUd0nrVrjIkZMldYG3f21qBakQ=;
 b=aGeJadB181ByQY3eGv1c/yyVNgENsr+RCWcigoNfap+9CUNaOsFAAGFz+DQ6+ZDC2s
 MMnt5Q9NcK1CYTOgCGNEolu7A2pM50mbEEgt/0Z/GfUs6TgjwLdLzDur/IQTbQDDJB8x
 47mRaXw7f97FShnuj5qoVdjtMkUUpH4a0VQ9wN+aXYBBoozPKJsDdxeMCUnHDVGRDPRg
 9C+y2CJEuSt6TujZegh+aKh8KeNs+EE5Po/S0H+GBMf324KeTnLl7FXJicRhePW6Ot2q
 evag6RixRTHQXV32eOplZQh9hiF4cKcVUNScmsgfOPaNETGwl9+zO/SI4EZnyv+BphJ+
 Zfdg==
X-Gm-Message-State: AOAM531ljBfm9JA3AI+U/zFYgciMmnSwLgtVX1+lYoP02bsPVXFAXACr
 /17Qw5glB7Hv/PwRLr0lawtEyGk1WnM5mUHz/Dk=
X-Google-Smtp-Source: ABdhPJzcbIa5UELYyDPJfDv8jCV3cTdq5XTaYyI/3HgRDpS9aMCXHdRatp1W5hnnE3AxNjy5N3DCEg==
X-Received: by 2002:a05:6a00:b54:b0:50a:8eec:e449 with SMTP id
 p20-20020a056a000b5400b0050a8eece449mr1509710pfo.80.1650302293686; 
 Mon, 18 Apr 2022 10:18:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:94f4:f90:c59f:129b])
 by smtp.gmail.com with ESMTPSA id
 n184-20020a6227c1000000b0050a3bbd36d6sm12152126pfn.204.2022.04.18.10.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 10:18:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/dp: Introduce wait_hpd_asserted() for the DP AUX
 bus
Date: Mon, 18 Apr 2022 10:17:53 -0700
Message-Id: <20220418171757.2282651-1-dianders@chromium.org>
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

 drivers/gpu/drm/bridge/parade-ps8640.c        | 34 +++++++++------
 drivers/gpu/drm/panel/panel-edp.c             | 33 ++++++++++-----
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 41 +++++++++++++------
 include/drm/dp/drm_dp_helper.h                | 26 ++++++++++++
 4 files changed, 98 insertions(+), 36 deletions(-)

-- 
2.36.0.rc0.470.gd361397f0d-goog

