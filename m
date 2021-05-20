Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25A1389F0A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 09:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CC96EF33;
	Thu, 20 May 2021 07:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88846EEA8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 06:45:45 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id a11so8451854plh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 23:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SRcdw8c/Pj8wxn1zjwxzT7G0xYC0ST2l17AHlwIRLXQ=;
 b=aZFPncyh96kPYQqIYVFxmkFbmpjVmRY5jv1B1Wc+BW4z3jAgdICY4BgX3D+j0DzFDn
 KBkFeMhiPU/jDR8+vTVWWj6M/aWMVxDfs5qLjaxXa0km0FhU3S2kPb5EDgv6pFeS4HfS
 XTPGkuF+gU/hf2GUlRUWSTW3xTI8rOtQb5MHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SRcdw8c/Pj8wxn1zjwxzT7G0xYC0ST2l17AHlwIRLXQ=;
 b=EEn3LyvQANaUN1etTdwdk6AnIB13W7p29dFrfXf1r3GOuAyEch+cC/FNOOSrwNkbSr
 2F91j/NuwOJ123ytq0otdBkbtWJTsPWo9J3rVl6JzWgC/eUj4YtfC4p+oDif2y6pGZuD
 /pM4xmFWvi7BEI5zE3Z1HEoh2HNf3cudXSTWfjrtAepR36kUKCXFRX/9Wgsoa/eY4XvQ
 78tbspfPzitzzyrjB2j8JGDftajT18FQaQ3GMNzd3OVFKFRV2RePR7n4GnYBJay5KcKh
 /Twn2cfwt+rhtroKynHHn1uICPOa0HomhBGm4hPEIThy5wawptg9OaqO31nVz6VKyjKj
 gWuQ==
X-Gm-Message-State: AOAM531EI22vNVYI2NDWa49p6W4N/peKa0PecJIRXsD6HP4CjxsmYd2t
 /EJb0dGfzKg3wf5HbEpxOuvOoA==
X-Google-Smtp-Source: ABdhPJwXumfYk25jLMt5I1JnCLtagaL42xzRZT3YgY2ItnIC+jgV2nP8qLk5B3WTGJ689/jINcgaew==
X-Received: by 2002:a17:90b:3905:: with SMTP id
 ob5mr3600257pjb.94.1621493145414; 
 Wed, 19 May 2021 23:45:45 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id b124sm1100086pfa.27.2021.05.19.23.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 23:45:44 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH] drm/bridge: anx7625: Synchronously run runtime suspend.
Date: Thu, 20 May 2021 14:44:52 +0800
Message-Id: <20210520064508.3121211-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 May 2021 07:41:41 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally when using pm_runtime_put, there's a chance that the runtime
suspend hook will be run after the following anx7625_bridge_mode_set
call, resulting in the display_timing_valid field to be cleared, and the
following power on fail.

Change all pm_runtime_put to pm_runtime_put_sync, so all power off
operations are guaranteed to be done after the call returns.

Fixes: 60487584a79a ("drm/bridge: anx7625: refactor power control to use runtime PM framework")
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 29493cc2d300..7519b7a0f29d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1255,7 +1255,7 @@ static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
 
 	pm_runtime_get_sync(dev);
 	edid_num = sp_tx_edid_read(ctx, p_edid->edid_raw_data);
-	pm_runtime_put(dev);
+	pm_runtime_put_sync(dev);
 
 	if (edid_num < 1) {
 		DRM_DEV_ERROR(dev, "Fail to read EDID: %d\n", edid_num);
@@ -1573,7 +1573,7 @@ static void anx7625_bridge_disable(struct drm_bridge *bridge)
 
 	anx7625_dp_stop(ctx);
 
-	pm_runtime_put(dev);
+	pm_runtime_put_sync(dev);
 }
 
 static enum drm_connector_status

base-commit: 7a42b92b6d30c3f09629c7d5ada9e3de2aba01af
-- 
2.31.1.751.gd2f1c929bd-goog

