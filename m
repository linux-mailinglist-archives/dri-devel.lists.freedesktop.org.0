Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A9C64A718
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 19:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A3610E27C;
	Mon, 12 Dec 2022 18:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322F510E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 18:29:32 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id w23so12935500ply.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 10:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xGy/dr3xnTd09Wes74zcnkCLJRPoRcwYVdKIhaAdf0A=;
 b=V9X4I7SjtEdIVDQyYAMTthUD+608KYuUl9DeFjZoiMuuWKPEt/ip0ooj8Rba4UXK/r
 f7+Pu2OQW7Z+j6ikuqr5QgP8XhJ/z9bw2XHfeiTpDFP0/RpdjhsoQX9TADEq4/u6Wk/U
 pfWgtA8qLd0VBa84jzYsaLOMNl4Vrj76ziqgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xGy/dr3xnTd09Wes74zcnkCLJRPoRcwYVdKIhaAdf0A=;
 b=c/WImjDBmsi9PK2wyPDv6z1yZ3+Le5eK+2qNYZ0kYWJU0n+03+AfMLvR0RS1a8+xse
 8O05p3tScoP4V9K8Y+RWoY0Zx/H6wSUKhoLmCLOjZEy4G4wH8t3tQb37WtR9osT+mZYv
 OGkKZHlYsi0K3S5vbRjS0zv3OmxR1Xo6BlKGLAtvHGHds/KG7nfvi3kxxcd1TLrvP/cz
 NTpwC2w6JMUwSSeUZ3bOnKbQZ7TWNxY02aoBmIgjAoKDDqkpyBU2O/okFCeJ3N/FwTkC
 b9NPq/p/ufa2E7830XOvM3hMPrsfqt56EDIO7CEAHkNbopV55YDowPaAp7I8NlWy6bbt
 jc2w==
X-Gm-Message-State: ANoB5plEPWIQgajQbTMSV36hPJbEEELQdNKzSKPNSJqUsVFRpCCNvWdC
 eCbzyX7C1Ozpo7MdrDYfg1o36g==
X-Google-Smtp-Source: AA0mqf6OZzcjGTfX6opHHMfOYHHuCamR/qjSp70OHckx4mGgPamOxz1KFTWDF91icXWcdNWynYAN8g==
X-Received: by 2002:a17:90a:c791:b0:216:ed9:cadc with SMTP id
 gn17-20020a17090ac79100b002160ed9cadcmr17032498pjb.21.1670869771618; 
 Mon, 12 Dec 2022 10:29:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
 by smtp.gmail.com with ESMTPSA id
 n28-20020a634d5c000000b0046fefb18a09sm5357998pgl.91.2022.12.12.10.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 10:29:30 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain 
Date: Mon, 12 Dec 2022 23:59:20 +0530
Message-Id: <20221212182923.29155-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split the Exynos DSI bridge chain update patches from Samsung DSIM
bridge driver for easy to apply.

Changes for v11:
- enable bridge.pre_enable_prev_first
Changes for v10:
- collect Marek.V Review tag

Any inputs?
Jagan.

Jagan Teki (2):
  drm: panel: Enable prepare_prev_first flag for samsung-s6e panels
  drm: exynos: dsi: Restore proper bridge chain order

Marek Szyprowski (1):
  drm/bridge: tc358764: Enable pre_enable_prev_first flag

 drivers/gpu/drm/bridge/tc358764.c                | 1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c          | 9 +++++++--
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c    | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c    | 1 +
 5 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.25.1

