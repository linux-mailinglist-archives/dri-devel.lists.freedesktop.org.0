Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7587F4FA1B9
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 04:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0652210E1B2;
	Sat,  9 Apr 2022 02:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C7210E1B2
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 02:37:05 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id z16so9994356pfh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 19:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k0r4eugt/zHQSwmjktu+6LYEjQZQ8ZAZdKlNVpJcKJU=;
 b=I8mJTJYqOErm2ec//WI+XTEovyymBRMahAIacDQgqkTgdMcYuibYVSQdv2LVeO0HOy
 8Lb1S2uWve12AKz9ZK8hFYNF5BXUrwfCVbrZuP5MWkmtfzkPUI0GJmyMLQkK/sh6pSO1
 WXgsqljLwtoYQl/lgROvlA8KTA8SFTlXG0EVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k0r4eugt/zHQSwmjktu+6LYEjQZQ8ZAZdKlNVpJcKJU=;
 b=IYE0VK2xlrxMpiAQtaXec58r61Fwe4x3zlNzY0ILn4d6nXaQP71z9njr5yprChZ+uD
 jBt+m8prncyFVHXoWGG8b6f2vdLl++fxKbZwPVX4h/gX6d6WK2bdJvJEdDgmsZRIuiJv
 XQPq5Het01dFFbUBhnSVG9i5jx5O85N/2ffaOEUvUZf+ib3T/LlO0GRoh0egeykESm+R
 kpwjqZNnyjAzEusEu1uXvoLLprr1KaEmnq+nRVyZV+ZwJEtF8ATijZS0bYTq9cM6crX1
 1al3igZ409D23j5eSXQGE+cbzuHTDQRWJYUMaMqYS78pJHh+ehEKmVj+QVzs+l2ex8qv
 uL4g==
X-Gm-Message-State: AOAM533m+TFR6HFV8VNbUBsLsCXqKNDXmbCyT3ILSqI8E5R2AxhRXi6c
 PunXrqzNxhnnch6sfxwckGnE0+yTmdRadkfxshrpCw==
X-Google-Smtp-Source: ABdhPJyHdJUiczO0eILsMOQhkv7fmwI8W0QSVzkpdCsY8n0607fbDN/FuUPnIR7FGuzc6v2Ce5dP1w==
X-Received: by 2002:a63:6a88:0:b0:398:54fb:85ba with SMTP id
 f130-20020a636a88000000b0039854fb85bamr18035803pgc.88.1649471825230; 
 Fri, 08 Apr 2022 19:37:05 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:17db:64e:48d4:a4e])
 by smtp.gmail.com with ESMTPSA id
 188-20020a6215c5000000b0050597294893sm759999pfv.124.2022.04.08.19.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 19:37:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/6] drm/dp: Improvements for DP AUX channel
Date: Fri,  8 Apr 2022 19:36:22 -0700
Message-Id: <20220409023628.2104952-1-dianders@chromium.org>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
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
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch addresses pre-existing issues that came up during the
review process of Sankeerth's series trying to add eDP for Qualcomm
SoCs [1].

It's really sorta two series but jammed into one. The first two
patches fix a problem with ps8640 when the panel doesn't finish
probing right away. The rest of the patches attempt to improve how eDP
panel drivers deal with the HPD signal. NOTE: if everyone hates the
"generic driver" that I added in the first patch, I have a different
version that just adds uses the Linux auxiliary bus stright in
ps8640. I'm happy to switch back to that, but it seemed like a buncha
copy-pasta that I was hoping to avoid.

I haven't done a crazy amount of testing with this, but it seems to
work and I wanted to get something out there. I'll try to do some more
testing next week. This is why I added the tag "RFC". It's entirely
possibled that I've actually caught all the bugs and this is great,
but I just wanted to be sure.

This _doesn't_ attempt to fix the Analogix driver. If this works out,
ideally someone can post a patch up to do that.

[1] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/


Douglas Anderson (6):
  drm/dp: Helpers to make it easier for drivers to use DP AUX bus
    properly
  drm/bridge: parade-ps8640: Break probe in two to handle DP AUX better
  drm/dp: Add is_hpd_asserted() callback to struct drm_dp_aux
  drm/panel-edp: Take advantage of is_hpd_asserted() in struct
    drm_dp_aux
  drm/panel: atna33xc20: Take advantage of is_hpd_asserted() in struct
    drm_dp_aux
  drm/bridge: parade-ps8640: Provide is_hpd_asserted() in struct
    drm_dp_aux

 drivers/gpu/drm/bridge/parade-ps8640.c        |  87 +++++----
 drivers/gpu/drm/dp/drm_dp_aux_bus.c           | 165 +++++++++++++++++-
 drivers/gpu/drm/panel/panel-edp.c             |  37 +++-
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  |  35 +++-
 include/drm/dp/drm_dp_aux_bus.h               |  58 ++++++
 include/drm/dp/drm_dp_helper.h                |  14 ++
 6 files changed, 353 insertions(+), 43 deletions(-)

-- 
2.35.1.1178.g4f1659d476-goog

