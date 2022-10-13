Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBDF5FD80A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3FD910E7E3;
	Thu, 13 Oct 2022 11:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF9810E7E3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:04:19 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so1621719pjl.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 04:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NvbS/I8HlQoCFmjUFv0JtyT8eokdGYfA7wkL/lpFTWg=;
 b=Ay0J5G8NHLTOS6rXjLmiS8l9zTWmvHczbyNjwYRvR1qHrImNmrH1jY3wMiBONvPwm7
 7d61qgwf98/EqlwVd/mq+mqym9Goz9iqrqsVaezDsWE0Sljlcf7xwaCfGf4hUL/eN6ZW
 uaj9TlPhDqmQaOXG3ZBWqgI3oiS7Fns5x968k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NvbS/I8HlQoCFmjUFv0JtyT8eokdGYfA7wkL/lpFTWg=;
 b=O84PCWRJOwlHETFztM2hq45bCPcm0yor3VnTJVDKtk1Sa6/uJhWYzll8sUSyZcJbN9
 52y0sGInNSvd8U45x3gi/RSZvo2HBnUqgF5xXTZiQPx92LLtUOvaxsiDmi+EitTgTNYV
 p2Mg4onUFKIctO7JYPD8Uc/UmPvC321Umcj5WpRbI2cERupzwwxf0xcqwkf+jZFTggRC
 aNsW7HeDtAUGn1SOlcBHmeRJcOiQHK443/AE8Bnk8P/xbKZ+g+qzgQ/aSKGjzErNudXp
 QRUOXQcehe12ojnJ3l0OkA0d0hmDBRkPSbQNov35Q/8CpIOq7A6ELaBReTDh/YPkqiXe
 6pnw==
X-Gm-Message-State: ACrzQf2Q0xy9Eg4wBbfqVXmocvqofSXFee+g1+B9PKE8UIGbUTmG+B9d
 vH8JO2j0p9gymp+cRcYsY/IHCA==
X-Google-Smtp-Source: AMsMyM6lUXvMM5tpyfSOIQtS1+CZpp68m5DYgKdzV5fiouCWtlb7eX/ojNAakZQwNCRsgJS2BE/c2Q==
X-Received: by 2002:a17:90b:23c5:b0:20b:1cb4:2ca9 with SMTP id
 md5-20020a17090b23c500b0020b1cb42ca9mr10755124pjb.139.1665659058897; 
 Thu, 13 Oct 2022 04:04:18 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:4b90:18ed:8d41:7622])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a17090ab88b00b0020af2411721sm2914794pjr.34.2022.10.13.04.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 04:04:18 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/3] Clean up it6505 driver and improve synchronization
Date: Thu, 13 Oct 2022 19:04:07 +0800
Message-Id: <20221013110411.1674359-1-treapking@chromium.org>
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
 Hermes Wu <hermes.wu@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The main purpose of this series is to improve the synchronizations of
it6505 driver. The first two patches are required for the third one, but
they alone can be clean ups to the driver.

Changes in v2:
- Remove redundant spaces in it6505_detect
- Read sink count in it6505_irq_hpd
- Add the empty line back

Pin-yen Lin (3):
  drm/bridge: it6505: Initialize AUX channel in it6505_i2c_probe
  drm/bridge: it6505: Setup links in it6505_irq_hpd
  drm/bridge: it6505: Improve synchronization between extcon subsystem

 drivers/gpu/drm/bridge/ite-it6505.c | 106 +++++++++++++---------------
 1 file changed, 51 insertions(+), 55 deletions(-)

-- 
2.38.0.rc1.362.ged0d419d3c-goog

