Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF35FC947
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 18:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5156310E689;
	Wed, 12 Oct 2022 16:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB1E10E689
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 16:29:06 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id l1so16685917pld.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zEdWcD+PQjJsMWbU+rPCMKkfbd3uH2dO24A3yRJKCPI=;
 b=hZmmn5tNlXiy4LGhQryxBGEcMEBfQTUNUsGBnm0oq66GNqtpe9fxY/DhKQ54G+FOkv
 QMCuobV4ZxzQL0RKJpPcRxuap15nTWDRbdFPA04S83ClBCF1e6PoJhzGl7dXd3bClIZg
 YC6dHlpZblOGq482JtVxwdfiffvk5y6zCTS3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zEdWcD+PQjJsMWbU+rPCMKkfbd3uH2dO24A3yRJKCPI=;
 b=kfApPaxLSn+Quf20NrHsBLjeO+rbCSNYsvALjZ32vULmrqfEUC9rStIzgIlaN9Yoes
 zhlL8A+rq0BjZxqH3VSR2wh8Dz+UvAksoFbBONxloUpsSPKx/hZcT01Ly8f0Aw3Gz+EA
 9yCM/sCsnMNxDV+3D1Abqz0HBd95cQhpK6owgVXEji3QTTcqs2sX+t+tUDRjonVCM+P5
 Pw75gmIced9UzpGkmlTg5k3K20nYasC2hAJ2sSgYnSgUt/lxnpnjQq9NB5j9gbKl78P4
 EEgumlm5/AxKT2AjpcAJmn21mHH+0WFNdcvBICVrTUBzA+u+DVgU/UndYyrby/Ra0mfg
 R7JA==
X-Gm-Message-State: ACrzQf2XSQRKfWGv0rJjN6GsGOuF9HfeY4P4BsOj987dq8I2WAoE/Lqt
 4YFmcaOVs1WmfsCoJFwQdLzznQ==
X-Google-Smtp-Source: AMsMyM7B804zXyZ/q0Uyus/SbQjVuKl9zAvAwF04Rv9koXL1sV1gaVGkBT56mWBvmiM/3YmIPS+UDw==
X-Received: by 2002:a17:902:6907:b0:179:c9bc:dd73 with SMTP id
 j7-20020a170902690700b00179c9bcdd73mr30805355plk.159.1665592146555; 
 Wed, 12 Oct 2022 09:29:06 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:2921:f6a9:5848:18e1])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a635704000000b0045dc85c4a5fsm9722163pgb.44.2022.10.12.09.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 09:29:05 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] Clean up it6505 driver and improve synchronization
Date: Thu, 13 Oct 2022 00:28:56 +0800
Message-Id: <20221012162900.2876686-1-treapking@chromium.org>
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


Pin-yen Lin (3):
  drm/bridge: it6505: Initialize AUX channel in it6505_i2c_probe
  drm/bridge: it6505: Setup links in it6505_irq_hpd
  drm/bridge: it6505: Improve synchronization between extcon subsystem

 drivers/gpu/drm/bridge/ite-it6505.c | 99 +++++++++++++----------------
 1 file changed, 44 insertions(+), 55 deletions(-)

-- 
2.38.0.rc1.362.ged0d419d3c-goog

