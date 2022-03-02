Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43064C9B0A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 03:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13B210E535;
	Wed,  2 Mar 2022 02:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E208910E3D4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 02:11:52 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id g1so593130pfv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 18:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bN6s6TEZphRwWI80xPm4aDtJet1ujkPpuwP31QhXI/4=;
 b=Gi3ddJmZGU2EBvfYqXHrtA6sMRGzkmAZ0ATThinzacPTB+38oNB9Joc0MX5AaExxvf
 MnAEUHidDLO8fgXj+3CVfa620VMN43lZ1TjqxDWvnHrFvaZpRFmiWRl7nQoeoWpbPDxw
 8498XmP5qcqTmjP9MchQOKq88Y1K1krgttZz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bN6s6TEZphRwWI80xPm4aDtJet1ujkPpuwP31QhXI/4=;
 b=0UKcYzzyNRRkuX2wqO3wTLdi4reKB9rBQuZP9cyXo1iW/Sb02qRg6aakg6pGYRVSi5
 XQPT0rKHDaQ9Mrmeb0wIcup9PrSXYgGsFRLorAoMqaC22JcOOUXXrwJ+8BLQfYVQH+zA
 9THDSMpf9MeYNiQy4ka5P4gBfPxqXb3ODboVWwfYDwZXjxNKcOVI3bS8QCDuaxWdG7B2
 WYIJXBP2HtkQYpTxSOEAUFFuBJGiGPzl+/jJ+0r6lVfAdE6V1b5Zw0lIaKCKyACw18Y6
 IPaglsTpDqnqFi476ZguhqbrKhfMt20YHA6Y3q5dLIJDVRrBJUlcdIzcuLnRjiZRLAZG
 oArg==
X-Gm-Message-State: AOAM530mm51zoDAcHp25mOjRj8TwQy1JIOwj/yrH01rFq+GJVgzSmsxt
 5Tb88QBeANahX9NFSmGkFe1XiQ==
X-Google-Smtp-Source: ABdhPJxqAYWE+06jubmS6vphEWSmGaG3d5IxrqcrnICb1nu8otRMzyUve+NDlL+vrTTB6Qb3KPoVww==
X-Received: by 2002:a63:f745:0:b0:373:8350:889f with SMTP id
 f5-20020a63f745000000b003738350889fmr24420532pgk.620.1646187112488; 
 Tue, 01 Mar 2022 18:11:52 -0800 (PST)
Received: from localhost ([2620:15c:202:201:ddf3:7c12:38c:3c61])
 by smtp.gmail.com with UTF8SMTPSA id
 f15-20020a056a0022cf00b004f3b99a6c43sm18651273pfj.219.2022.03.01.18.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 18:11:51 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 2/2] drm/bridge: analogix_dp: Enable autosuspend
Date: Tue,  1 Mar 2022 18:11:39 -0800
Message-Id: <20220301181107.v4.2.I48b18ab197c9b649d376cf8cfd934e59d338f86d@changeid>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
In-Reply-To: <20220301181107.v4.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
References: <20220301181107.v4.1.I773a08785666ebb236917b0c8e6c05e3de471e75@changeid>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Brian Norris <briannorris@chromium.org>,
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP AUX transactions can consist of many short operations. There's no
need to power things up/down in short intervals.

I pick an arbitrary 100ms; for the systems I'm testing (Rockchip
RK3399), runtime-PM transitions only take a few microseconds.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v4:
 - call pm_runtime_mark_last_busy() and
   pm_runtime_dont_use_autosuspend()
 - drop excess pm references around drm_get_edid(), now that we grab and
   hold in the dp-aux helper

Changes in v3:
 - New in v3

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 16be279aed2c..b248d352f2bd 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1119,9 +1119,7 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 			return 0;
 		}
 
-		pm_runtime_get_sync(dp->dev);
 		edid = drm_get_edid(connector, &dp->aux.ddc);
-		pm_runtime_put(dp->dev);
 		if (edid) {
 			drm_connector_update_edid_property(&dp->connector,
 							   edid);
@@ -1642,7 +1640,8 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 
 	ret = analogix_dp_transfer(dp, msg);
 out:
-	pm_runtime_put(dp->dev);
+	pm_runtime_mark_last_busy(dp->dev);
+	pm_runtime_put_autosuspend(dp->dev);
 
 	return ret;
 }
@@ -1775,6 +1774,8 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 	if (ret)
 		return ret;
 
+	pm_runtime_use_autosuspend(dp->dev);
+	pm_runtime_set_autosuspend_delay(dp->dev, 100);
 	pm_runtime_enable(dp->dev);
 
 	ret = analogix_dp_create_bridge(drm_dev, dp);
@@ -1786,6 +1787,7 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 	return 0;
 
 err_disable_pm_runtime:
+	pm_runtime_dont_use_autosuspend(dp->dev);
 	pm_runtime_disable(dp->dev);
 	drm_dp_aux_unregister(&dp->aux);
 
@@ -1804,6 +1806,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp)
 	}
 
 	drm_dp_aux_unregister(&dp->aux);
+	pm_runtime_dont_use_autosuspend(dp->dev);
 	pm_runtime_disable(dp->dev);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
-- 
2.35.1.574.g5d30c73bfb-goog

