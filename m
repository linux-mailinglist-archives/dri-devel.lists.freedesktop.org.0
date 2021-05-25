Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8D738F6AA
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 02:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FA56E99B;
	Tue, 25 May 2021 00:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908246E99C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 00:02:52 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 cu11-20020a17090afa8bb029015d5d5d2175so12186505pjb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 17:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/T35r9H/xYdI5Daj3afSSqWpMxR8pN+3BRmstBRd2eo=;
 b=XtJTTLAFoWjzdg0MeNYuiQac377tNakIga9O2eo1eKTa8+hf0jzBkj7TfYpMGXT/9c
 yWVh9Bqh6rd4c6lQvUcja9C8SSi70125WPI0n8Z+OZqxjVDyPZZZarT+YdaE/J5/4EI0
 QChngXtryr++KD3aFI4F4hISiVpW27jfctnlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/T35r9H/xYdI5Daj3afSSqWpMxR8pN+3BRmstBRd2eo=;
 b=eDmuv3xOONxhK78wJnh1FiM9Tay+qtR4iEZNqLFqiHLWa3HoJNmTiT7ZIDQsCBvEE0
 +f9/XeoagzlZ5AIArAD8f+AYaQ2+HWdsRa8MpKxlIoMX9/Q1hP40/TYdaZz0qB1TTP53
 kQQGkZ5Q5vi6fZydSzRJ7WmKtypnKKpNySNmuX4IpMV6fQdr1p41kLsjx0iM+qXHwyM9
 GncnKNDCOlH9JvcYvbceM+SSeBRIbCEpwSVgJpFPDfVvt0YwzVfpXUsxpN/JeUURMVZI
 ru37FPu6f8F4+7MP0jK5pnvyyEBbzhHMy8Evj+eiK+Zw0wnTsCj9hTup+SDi7h2l9SEx
 dj5A==
X-Gm-Message-State: AOAM530O3pcnIS47LoYQCbv2Fznv4CKqZOMLPqUMKI2JhDqK8SrTOTZZ
 pKF0LuGT9W4nCwEjLJPYjAlxQw==
X-Google-Smtp-Source: ABdhPJygsw79I/6gDgsXc111IivaKqoEq603iWbw3jkbei76BrFXoUYpIE1evcNNxFoe9oHbDOi/Mw==
X-Received: by 2002:a17:903:2312:b029:f0:cd8e:c843 with SMTP id
 d18-20020a1709032312b02900f0cd8ec843mr27708566plh.6.1621900972211; 
 Mon, 24 May 2021 17:02:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
 by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 17:02:51 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v8 09/11] drm/bridge: ti-sn65dsi86: Add support for the DP AUX
 bus
Date: Mon, 24 May 2021 17:01:57 -0700
Message-Id: <20210524165920.v8.9.Ib5fe0638da85800141ce141bb8e441c5f25438d4@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525000159.3384921-1-dianders@chromium.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
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

(no changes since v7)

Changes in v7:
- Patch to support for DP AUX bus on ti-sn65dsi86 new for v7.

 drivers/gpu/drm/bridge/Kconfig        |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 7e7f28eb9546..a82952a85db4 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -292,6 +292,7 @@ config DRM_TI_SN65DSI86
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select AUXILIARY_BUS
+	select DRM_DP_AUX_BUS
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
 
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 1ea07d704705..5263206792f6 100644
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
@@ -1448,19 +1449,27 @@ static int ti_sn_aux_probe(struct auxiliary_device *adev,
 	pdata->aux.transfer = ti_sn_aux_transfer;
 	drm_dp_aux_init(&pdata->aux);
 
+	ret = devm_of_dp_aux_populate_ep_devices(&pdata->aux);
+	if (ret)
+		goto err;
+
 	/*
 	 * The eDP to MIPI bridge parts don't work until the AUX channel is
 	 * setup so we don't add it in the main driver probe, we add it now.
 	 */
 	ret = ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
 
+	if (ret)
+		goto err;
+
+	return 0;
+err:
 	/*
 	 * Clear of_node on any errors. Really this only matters if the error
 	 * is -EPROBE_DEFER to avoid (again) keep pinctrl from claiming when
 	 * it tries the probe again, but it shouldn't hurt on any error.
 	 */
-	if (ret)
-		adev->dev.of_node = NULL;
+	adev->dev.of_node = NULL;
 
 	return ret;
 }
-- 
2.31.1.818.g46aad6cb9e-goog

