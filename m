Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7D471C10
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 19:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B2D10E9D5;
	Sun, 12 Dec 2021 18:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293D010E9D5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 18:14:38 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 gf14-20020a17090ac7ce00b001a7a2a0b5c3so13061188pjb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 10:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ODad71QnrfhPAOKOPo81L7ZBy76dLDUdhdeNiih9Lcw=;
 b=C1pwC9TCUsasC73wgDBewV6RUb2AT4qGm2Irl5u/I9PJo72b0OQHH8++a6Jsbo9Zlg
 fKBVZyVLEGIjCpIQNa4XXrSMfsSYDOWgAc6qRfbOzmBpf97z24RpmmAK5u9CdQhX/Jm/
 mX7WPC+LjExEqJ7w3T5rhkw5xl/lN2/U5GIHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ODad71QnrfhPAOKOPo81L7ZBy76dLDUdhdeNiih9Lcw=;
 b=iPB6i1vfcfQ00zHU1bog6PraRYG8r7XMV2r6m8v+RWCx38tWLAIpUN7PjUxm1npmUs
 xct3jK9oug/P9bV9kwt5+EcH8Xay2fJEM8yhNerr0JpKFsxaoHww3gIqK++rWXyQ356B
 Wb+g04KSf0WmZJogcrNawixApWn12G5daTByeXz75YnbpEsEk58ZmRxTdl5Be8ycA5cI
 2/Llov1pWPMM9/vrrn/nlsc9vkWXIqVe/fmnJ7nd4WikouuQL29FgQg4SpPVvbN8AWqT
 7x4cKAvAkCsta0/rRsSj9l9JS3uTT940PXijKYy+nAIArjaw1NNWrotwISV1nYeBYaMR
 VTkg==
X-Gm-Message-State: AOAM530AMz4kbP96vcHtfbot+T1nK9Cg+oHy+Vq+1FH0QC3Sa/iHCZwO
 wIHwDRuTlOE9g6igiyA2AGj2fw==
X-Google-Smtp-Source: ABdhPJxWph00BctxjB6wwlgfUBtizjjFIjdKnWU/Xx2MM1b/lpdufNH4IrOmzGqbl+4MQJV5mzZV8g==
X-Received: by 2002:a17:90b:30e:: with SMTP id
 ay14mr38328526pjb.60.1639332878135; 
 Sun, 12 Dec 2021 10:14:38 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:264b:de7a:bc69:cfbd])
 by smtp.gmail.com with ESMTPSA id bt2sm4567904pjb.33.2021.12.12.10.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 10:14:37 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: [PATCH v3 0/7] drm: exynos: dsi: Convert drm bridge
Date: Sun, 12 Dec 2021 23:44:09 +0530
Message-Id: <20211212181416.3312656-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Updated series about drm bridge conversion of exynos dsi.

Patch 1: panel checker

Patch 2: panel_bridge API

Patch 3: Bridge conversion

Patch 4: pree_enable, post_disable

Patch 5: Atomic functions

Patch 6: atomic_set

Patch 7: DSI init in enable

[1] https://patchwork.kernel.org/project/dri-devel/cover/20211210191922.2367979-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (7):
  drm: exynos: dsi: Check panel for panel helpers
  drm: exynos: dsi: Use drm panel_bridge API
  drm: exynos: dsi: Convert to bridge driver
  drm: exynos: dsi: Separate pre_enable, post_disable code
  drm: exynos: dsi: Switch to atomic funcs
  drm: exynos: dsi: Get the mode from bridge
  drm: exynos: dsi: Move DSI init in bridge enable

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 240 ++++++++----------------
 1 file changed, 75 insertions(+), 165 deletions(-)

-- 
2.25.1

