Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CC956054D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D5E10E1B0;
	Wed, 29 Jun 2022 16:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332A110E1B0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 16:06:00 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d17so15517844pfq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TBAwmf3hnEIm7QQKkyiSy9nlUtJMyt9Dhl/BWJJycfc=;
 b=buTrPCP9r/wJ5oPOB0f0DJpQ8V6tW7tfgOZx2uSKkWC/2vMmTvjE64AO/lHrRX+HQZ
 kv/SgncYR3nlgqpLobh8CHATSg3+hman5T/V8BqdImV4gzzCxVSyKUVDF4ugwYM5V0rB
 vsaHoCA+cobRTBtdrQ5roQiuTM4algBDblNEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TBAwmf3hnEIm7QQKkyiSy9nlUtJMyt9Dhl/BWJJycfc=;
 b=Tn5hr13TD8RYCvPgTo9nnI8XZbT5lPEjgmEPp2mTiQwwZlDyB/9eHcJ2CecsomHNqc
 dp+lk0k7deKZqdCtaQv/diblyc4a/L6D/9k6RgBdOW4DfJpvWPf3nKicfwxv47AxyiAP
 DRvcDB4VHmuOUbt1/CFW/AV/fLGQMRH1wT0X8CvIpE2QP/ab79OTlA173Ajfa0Z8/XmQ
 LogUpOV1426ECdWGCj2DlNdwo2QEUQI2xZvLlQjeSGo14mI48YuOt50VpEkM0Dm10xVt
 1+Bb96YaQvriM6mUo8jCm1wxzQRsACSObo6gVClwn+ec3azwO+Ic6CLeW+Ib/X+SAKk4
 3vYw==
X-Gm-Message-State: AJIora8Mdo8ZItsNnqiKdIVCXuJaut1BBw5V8S1UXMcbumnveUcZHsva
 1FJYa21t6yytM45qvLDNS5UOeGrW5cZahQ==
X-Google-Smtp-Source: AGRyM1vhnDIT9TahKVUJ4QdTOs1R1i/R1LLtMlUuU993m40WNKgeQ8IODX+weGpoOHAl3yYNfw7CIg==
X-Received: by 2002:a05:6a00:23d2:b0:525:951a:edf1 with SMTP id
 g18-20020a056a0023d200b00525951aedf1mr10948462pfc.62.1656518759660; 
 Wed, 29 Jun 2022 09:05:59 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9841:721:7d8b:4502])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a170902e3d300b00163f8ddf160sm11495350ple.161.2022.06.29.09.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 09:05:59 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 0/4] anx7625: Cleanup, fixes, and implement wait_hpd_asserted
Date: Thu, 30 Jun 2022 00:05:46 +0800
Message-Id: <20220629160550.433980-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains:
Cleanup:
- Convert to use devm_i2c_new_dummy_device()
- Use pm_runtime_force_suspend(resume)
Fixes:
- Fix NULL pointer crash when using edp-panel
and Impelment wait_hpd_asserted() callback.

The patches are not related to each other, but they are all
anx7625 patches so they are all stacked in this series.

Hsin-Yi Wang (4):
  drm/bridge: anx7625: Convert to devm_i2c_new_dummy_device()
  drm/bridge: anx7625: Use pm_runtime_force_suspend(resume)
  drm/bridge: anx7625: Fix NULL pointer crash when using edp-panel
  drm/bridge: anx7625: Add wait_hpd_asserted() callback

 drivers/gpu/drm/bridge/analogix/anx7625.c | 179 ++++++++--------------
 1 file changed, 65 insertions(+), 114 deletions(-)

-- 
2.37.0.rc0.161.g10f37bed90-goog

