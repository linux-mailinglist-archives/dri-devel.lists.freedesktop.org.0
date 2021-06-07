Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4179F39E4CD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6606E94E;
	Mon,  7 Jun 2021 17:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4306E94D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:06:26 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id s14so12668513pfd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QFddLOHKMkDWCo/3CJ6wD0VeACMC/xRkHRaz1DXreL4=;
 b=VUYMkHkOdCN0d9Kzmy6/vVCz4a+LAxY0BdwuAOSzLNJqvbgmWJqXOQLjZPftDM/hFA
 S4sKnmI3ocXTQZ7wYLwrOSH9jg491VW9QKj9matJ/vZQJfuwtnvtxYsexmODKmy1v7cn
 m9RJtgRs3BMDFegVPavrzKA20e2ng0ZkRXfyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QFddLOHKMkDWCo/3CJ6wD0VeACMC/xRkHRaz1DXreL4=;
 b=FjSJV0jU0EFZ5NJfwpUQgsWFQZrqD2wt1owYsq1r//zamNaHcIgD8yYjVFrTE4YXSm
 ba8FfgVuLY80Mt9BeKZY9jqyfdeqSOW0YtkhdHmhoFgE/hG7zShLEqcAtyR8vIqSfqs9
 ur6o+jbVt4EuQD/NQ5NGg/4VA2dnWJnMT2AReuamCFLbJQqtZVLQR9CuLAkjxvpzszOT
 7cdMJl6QToZ2fJJvSARkc1YuAWicrPNpFEROQqsvNeLzKhhY9H/aSAPT05AR3bNgHTLi
 xEBnHtcALJfBYOrP79NtsN2P1orGwxwKfDLLAwZA5iGuJUDBIulUcLyGjo9H8nWsZa7D
 7wIQ==
X-Gm-Message-State: AOAM531VzRHy0UfQAQmKJxmGnCBs08ywNSr06Lre6oowyoenQkncWuLx
 H9e1atCdAvH0zIRh6raGsGufDQ==
X-Google-Smtp-Source: ABdhPJzGbsmGgNdYrdMCYElyKRxtwRKUm08v3yvz8uRp/WDjLVgv0nkTYzOdWrjU9NDZEuLzFn7CEw==
X-Received: by 2002:a05:6a00:882:b029:24b:afda:acfa with SMTP id
 q2-20020a056a000882b029024bafdaacfamr17889560pfj.72.1623085586388; 
 Mon, 07 Jun 2021 10:06:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f656:ffce:6348:a42a])
 by smtp.gmail.com with ESMTPSA id fs24sm12897639pjb.6.2021.06.07.10.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:06:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v9 08/11] drm/bridge: ti-sn65dsi86: Add support for the DP AUX
 bus
Date: Mon,  7 Jun 2021 10:05:52 -0700
Message-Id: <20210607100234.v9.8.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <20210607170555.4006050-1-dianders@chromium.org>
References: <20210607170555.4006050-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to provide our panel with access to the DP AUX channel. The
way to do this is to let our panel be a child of ours using the fancy
new DP AUX bus support.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---

Changes in v9:
- Rebased atop v9 ("Promote the AUX channel") patch.

Changes in v7:
- Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.

 drivers/gpu/drm/bridge/Kconfig        | 1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c96e4b38d1d3..5e1e28d4520f 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -293,6 +293,7 @@ config DRM_TI_SN65DSI86
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
+	select DRM_DP_AUX_BUS
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 8e61005cf4ad..32bd35c98d95 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -23,6 +23,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_dp_aux_bus.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
@@ -1426,12 +1427,17 @@ static int ti_sn_aux_probe(struct auxiliary_device *adev,
 			   const struct auxiliary_device_id *id)
 {
 	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+	int ret;
 
 	pdata->aux.name = "ti-sn65dsi86-aux";
 	pdata->aux.dev = &adev->dev;
 	pdata->aux.transfer = ti_sn_aux_transfer;
 	drm_dp_aux_init(&pdata->aux);
 
+	ret = devm_of_dp_aux_populate_ep_devices(&pdata->aux);
+	if (ret)
+		return ret;
+
 	/*
 	 * The eDP to MIPI bridge parts don't work until the AUX channel is
 	 * setup so we don't add it in the main driver probe, we add it now.
-- 
2.32.0.rc1.229.g3e70b5a671-goog

