Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461F63BAD46
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 15:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DFD89B95;
	Sun,  4 Jul 2021 13:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A22D89B95
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 13:59:30 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so6694907pjl.5
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZchmjbZcuG8d79fGOuJrTm3zKZcJ0x4q/PTaiXaZWo=;
 b=WQmWODfaTpdwEd7USiDiriTpaY76zXQhP0ffAl16+LJ4j8HIgjGmJghZkHu1DWawvc
 nl7cs7+rF1LhOZdVrrWyxJKVA+LEbHHN/r1WyUjBpYBGqRmkMc5yqPYUTRWu1CtSDzkU
 MfR0RVFUlLLgROhfe2A+zMhqo2glKxYpGEQoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZchmjbZcuG8d79fGOuJrTm3zKZcJ0x4q/PTaiXaZWo=;
 b=Serdl2nOr+7FZeRxEBs6TnZcXvhD4EW0vnIE3OltZ6Ltd93K69MLWuH893DoRXZ/K6
 rufhCbAQ5K5+Z9j9P68BwFZLbsARCC/55a4YQwHLyVm/xN2l0FDnsrfT5QfkkPkMjbPd
 hFs0muBPgh2yWCEdEAosZCkRwy5JzjbF1YSnhDK/Ffv81IGls/H7bdIUDS/DE84BiyMK
 GU0okT8XupO3Z0TFbRR5/KFnu3SxglawIigUInSGzk8TzAHH6LtwZ5Al00TFjT3A/jVi
 8+SlJEyvJQEfRqkVujB3PHfUFgZUV7Q2paU0QvUshpM9aReF4A2lZL/o3L+Bzr+Km2+X
 ysVg==
X-Gm-Message-State: AOAM530PlRkxftHjb/MGmtzJb75NN0YTvgztck6BOgz3S7ugbS9flhbS
 d7mUFP68dfrUUkP/lj4cVOIU3w==
X-Google-Smtp-Source: ABdhPJxVPwt4Nb6yxv4YmtH20r1DKBZ1WMc9WPqPhleaq0VHERawfSzARi/+Gq7kPy5Z6bh6THv/mQ==
X-Received: by 2002:a17:90a:c916:: with SMTP id
 v22mr9950407pjt.47.1625407170239; 
 Sun, 04 Jul 2021 06:59:30 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
 by smtp.gmail.com with ESMTPSA id r29sm8387993pfq.177.2021.07.04.06.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 06:59:29 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: [PATCH] drm/stm: ltdc: Silence -EPROBE_DEFER till bridge attached
Date: Sun,  4 Jul 2021 19:29:14 +0530
Message-Id: <20210704135914.268308-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As dw-mipi-dsi supported all possible ways to find the DSI
devices. It can take multiple iterations for ltdc to find
all components attached to the DSI bridge.

The current ltdc driver failed to find the endpoint as
it returned -EINVAL for the first iteration itself. This leads
to following error:

[    3.099289] [drm:ltdc_load] *ERROR* init encoder endpoint 0

So, check the return value and cleanup the encoder only if it's
not -EPROBE_DEFER. This make all components in the attached DSI
bridge found properly.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/stm/ltdc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 08b71248044d..95e983d3ffb5 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1122,8 +1122,9 @@ static int ltdc_encoder_init(struct drm_device *ddev, struct drm_bridge *bridge)
 
 	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret) {
-		drm_encoder_cleanup(encoder);
-		return -EINVAL;
+		if (ret != -EPROBE_DEFER)
+			drm_encoder_cleanup(encoder);
+		return ret;
 	}
 
 	DRM_DEBUG_DRIVER("Bridge encoder:%d created\n", encoder->base.id);
@@ -1266,7 +1267,8 @@ int ltdc_load(struct drm_device *ddev)
 		if (bridge) {
 			ret = ltdc_encoder_init(ddev, bridge);
 			if (ret) {
-				DRM_ERROR("init encoder endpoint %d\n", i);
+				if (ret != -EPROBE_DEFER)
+					DRM_ERROR("init encoder endpoint %d\n", i);
 				goto err;
 			}
 		}
-- 
2.25.1

