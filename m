Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4555F3C38
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 06:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4491210E599;
	Tue,  4 Oct 2022 04:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3968410E599
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 04:49:51 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id f193so11773525pgc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Oct 2022 21:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=/xVdKxSIlA3DamunWOFIjrLXOpuuwkDNyivJpgCyiPU=;
 b=QK8w8Nbim8Dy4b7jBA6WMd0/bAxFA6dLjO9vWe3fw3TyZ/GBjHN8JXbKNa7rnSX/nG
 +XPUS37IimuizTqi1z6wAa7liidEbUFx2k3iUgNhmmBvAG157qymamz3mZ+2j4AgkUvp
 WtjaSi1e8D9m2ErJKJ1XN0bITDZX3dLTGr1Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=/xVdKxSIlA3DamunWOFIjrLXOpuuwkDNyivJpgCyiPU=;
 b=pcsh/t2WXu5usW2nvftM4vE2YySIy66/do74DuGl+nL3bRZ28gvwR2p9LpebBupRF+
 u+72ZxiUJLLDs1N5QaY5OBNK8VIM9MCFvHFDVmOteii6cEeRGJMJS/mv0sy4hxWQiBsa
 2MFRGAGP6rTRlPfYpV1hanZSDcrEu6hugYHUTP/E3sQW2L9FN176kHi9ghwSziuWOc9T
 W/SLtKt5qpH19wzR5mFYo4V1YGt+kgZhMIaRfazC7KNbYyahSMq6GjsqqQ5Jn2FpCsQ4
 Z6N8jslO5vg2/MLwyg1Gh1ZP0K7qEOs1ahyr51tD1nW+gkJtGsyFD15qe+Sv/cNM+ZTw
 QPig==
X-Gm-Message-State: ACrzQf3nfXHYwSmMe0gey65DrE/A7XEZdaMRml3/wa8YmswL/FKTZ6wd
 +hPiCW9PF7nF5XOpNRfgGOPXSg==
X-Google-Smtp-Source: AMsMyM4ZLKqSUOaZeoB/LQLmyjuSOO6HvPUcObJzr5sJGGqZz1PKZWAFs+4r053KrZ5RlLuU492T0w==
X-Received: by 2002:a63:188:0:b0:43c:22e9:2d10 with SMTP id
 130-20020a630188000000b0043c22e92d10mr21837722pgb.12.1664858990734; 
 Mon, 03 Oct 2022 21:49:50 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:5713:ccf0:f1dd:69d2])
 by smtp.gmail.com with ESMTPSA id
 gl1-20020a17090b120100b0020ab3f9c27dsm1095051pjb.55.2022.10.03.21.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 21:49:50 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/2] drm/bridge: it6505: Power management fixes for it6505
 bridge
Date: Tue,  4 Oct 2022 12:49:41 +0800
Message-Id: <20221004044943.2407781-1-treapking@chromium.org>
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

Changes in v3:
- Handle the error from extcon_get_state
- Collect review tag

Changes in v2:
- Handle the error from pm_runtime_get_sync in it6505_extcon_work

Pin-yen Lin (2):
  drm/bridge: it6505: Adapt runtime power management framework
  drm/bridge: it6505: Add pre_enable/post_disable callback

 drivers/gpu/drm/bridge/ite-it6505.c | 58 ++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 10 deletions(-)

-- 
2.38.0.rc1.362.ged0d419d3c-goog

