Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318A442F4DC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 16:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D4D6EDAE;
	Fri, 15 Oct 2021 14:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400C36EDAE
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 14:11:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m22so26948956wrb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 07:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SK5WSwXHZWoI/1ZBUvfDbCPhpcOUhghwxwipgWWDC98=;
 b=8B6JOltmwuzEfGkzrOKCjgmb6sk8JOnMULoXp871nvfb8vFUJ2EdlOZtTK7G4JrJcw
 eyBOHEMW5X/iGMIw6FR33U2jt+wak87HGpcNSIYzSFI3tRZUJ1lk2RvMtcy74/87tNFR
 ePFhvcDSKBfjBjTlE+CjEzSFbIP2aXyZslhj+ysU4Ie/YamccgSLDOeQ3d7dsvpsGWGO
 HoGNxI3wMYWQCUm2UjCG7kjyojNGGylze+ZNWWdhMzR10cLd6MocYdXwBnP8cqRDGz6B
 4rVVW77uPZ5I2YVVjmu2W3UanuyGTAkeUKVAXrlAcuNpTtNcBzlKmKZ/K85fT5YWNmY6
 VySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SK5WSwXHZWoI/1ZBUvfDbCPhpcOUhghwxwipgWWDC98=;
 b=3gdt+eEHr3hSFRLM5AEjE26nxD4Ezyr/p6HN7wtygU9KCzRRgbCVmno03wUI+yGgbP
 dhcjuRTjRGaa8AgHRRtf5tQ6SrLUMRENW5cn7AdF7Sxx67rkZEkXQOhP8Xz0ziIhwMdH
 cmILgSgHhscapKkyHxqYHCYkB99QzoCGexVgqYWWY+dOsZ+cPkny4//3+nxqf5VPpvqV
 LYPW7aBdivMWPDIW+AwiHoOMHps/L5iN/d2uyZf0PZsGdEPLD3/NGi3wZtcxuehpFcbG
 flf9H0zc8PqNJf3UkYZjfJssNlUhqeyDodZAISjzQaNHp0YFS6bI2nr35gq8S7v9wQTH
 gJsw==
X-Gm-Message-State: AOAM532wmeYZFmEknDe0F5WkFHOtThRnu7K/ybMDkrFdD109ChepbMMj
 m6xBhPXh/3hXhrF4poFTh5lDjQ==
X-Google-Smtp-Source: ABdhPJw/1LkkObJ3ghkbZlL8mXeEQ65q7HmlYnmT+4W1ZJ1xvKR2Kc179nzGYBN3EYBY+dBTEAhtGA==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr14612259wrs.80.1634307070511; 
 Fri, 15 Oct 2021 07:11:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id f15sm4971434wrt.38.2021.10.15.07.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:11:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/6] drm/meson: rework encoders to pass ATTACH_NO_CONNECTOR
Date: Fri, 15 Oct 2021 16:11:01 +0200
Message-Id: <20211015141107.2430800-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2607; h=from:subject;
 bh=fTkgFMlSB5Ej7MF+TequNqhZSjRHV4SIxj9PjVk81iE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaYoipSArcNV7nFCbup2fdmzNK3qHxA1qegi12EUX
 2eGrp7SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWmKIgAKCRB33NvayMhJ0dkcD/
 9qlX4Gb1Is7ynKt7PiVlO7GkGeshsI29vfmJIFP6+ArJtfQIqxGFcFobg23cGo8fvZ4wX8UoXB+8C9
 8MsuVXqNOoZnAmr2igGcYO2TvbazqG74mqzkStuvbmGEDLepBT315heMyfyDlyT0K/2pRu2MmNjINM
 mnT1zHtaNmS6gBH0zp+vGzojAIrhJMg7BzCEqDZ/3enp3saAazHP7+3fVcKf0KLOaXpzeZeRSfWlnp
 y11/5Gfx1PPbqLsQdb/pRHQrZGsvOxzgASt6l8A8UiGek3YD6CJqjmiejllwolyrkWl69zbpDqqbZC
 Y7RgjOhMcEMMls1oeLdikoSBtLAkasX+qzjlmjQzGbjVITun55XaFcRkqnnH9Xskkm85UF1PJk+WzT
 IpLxhMsvnrlGQw9JqHOdTYdzNLnZCeaRRpKq8sSwUAWmwEbRMkehxmMIhm87dG2mYDIWt8sh4hKSzj
 ks0VptYcTWLlMQlDxZRd7mgd3O/fxnP3nBGgHEbg9PdItyacSU5/FeMx5lwnvAnW2nK9kIESAduVFy
 cGK0TXiMG7qOpLzvLt/h8rCCPwxcmENXjHM6J8oKH5Wq+0vx948FXlmY5+afSZ9Ws+nOQkjAWHuBPh
 EVbGkLFvuTvjD59SJmDvli1PlO858luVua+adFk2PE3FKK6nMpD3N3p2tfFA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This serie finnally reworks the drm/meson driver by extracting the encoders
in their own file and moves to bridge-only callbacks.

This permits passing the ATTACH_NO_CONNECTOR bridge attach flag and finally
use the CVBS & HDMI display-connector driver.

This will ease Martin Blumenstingl writing the HDMI transceiver driver for
the older Meson8/8b SoCs, and sets the proper architecture for the work in
progress MIPI-DSI support.

Finally, this serie will path the way to a removal of the device component
and use the drmm memory management.

Changes since v1 at [1];
 - patch 1: added sam's review tag, fixed include order, fixed doc wording
 - patch 2: added sam's ack tag, switched to dev_dbg()
 - patch 3: moved mode_set to atomic_enable, removed DRM_DEBUG, fixed include order
 - patch 4: added sam's ack tag & applied to drm-misc-next
 - patch 5 & 6: added sam's ack tag
 - patch 7: added sam's review tag, stopped saving connector, moved mode_set to atomic_enable,
 	added missing atomic state callbacks, fixed include order, switched to dev_dbg/dev_err

[1] https://lore.kernel.org/r/20211014152606.2289528-1-narmstrong@baylibre.com

Neil Armstrong (6):
  drm/bridge: display-connector: implement bus fmts callbacks
  drm/meson: remove useless recursive components matching
  drm/meson: split out encoder from meson_dw_hdmi
  drm/meson: encoder_hdmi: switch to bridge
    DRM_BRIDGE_ATTACH_NO_CONNECTOR
  drm/meson: rename venc_cvbs to encoder_cvbs
  drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/display-connector.c    |  86 ++++
 drivers/gpu/drm/meson/Kconfig                 |   2 +
 drivers/gpu/drm/meson/Makefile                |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |  71 ++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c         | 342 +------------
 drivers/gpu/drm/meson/meson_encoder_cvbs.c    | 291 +++++++++++
 ...meson_venc_cvbs.h => meson_encoder_cvbs.h} |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c    | 452 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_encoder_hdmi.h    |  12 +
 drivers/gpu/drm/meson/meson_venc_cvbs.c       | 293 ------------
 10 files changed, 894 insertions(+), 660 deletions(-)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_cvbs.c
 rename drivers/gpu/drm/meson/{meson_venc_cvbs.h => meson_encoder_cvbs.h} (92%)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h
 delete mode 100644 drivers/gpu/drm/meson/meson_venc_cvbs.c


base-commit: f6632721cd6231e1bf28b5317dcc7543e43359f7
-- 
2.25.1

