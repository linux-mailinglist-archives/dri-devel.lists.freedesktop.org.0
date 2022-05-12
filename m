Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC85248C4
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 11:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE5310E1C2;
	Thu, 12 May 2022 09:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7089910E3EC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 09:21:24 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id c11so4293384plg.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 02:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=trstv+pRRGZWnVg0+iN5UCLh2DdH9t4IV2sdILAbWVo=;
 b=KDQhOyYHM/ghyxsyYX2XznPNtfLuxQL/rD+vsMnBO34aYxBsr9ceM9eDUWXAMLJM1g
 9qJpLzk42GzZaBZbcgWUjy6LOebVHmF9bqI7MPkd/10lA1bpzvrEX45t8Y33GLQnbz1E
 4xjhKznHXiYyv4C74c+8dkaHPGwnM2Xr5nFisIkCTmppBiVXORiPXCaEqfAxG9UA6jiV
 iL9Ahrh/AabO+F2dHjvO1YsOn69pZxSPvrDoiSdzFVMIhkAU5/Q6mldf5ISJuihXbdN9
 8ApW3DsCjYYcUVvQ+vqQFrvDS6DEiNcNP1oYqHta/uiDkShGesbOpsU+nrVUkSoMHASh
 qtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=trstv+pRRGZWnVg0+iN5UCLh2DdH9t4IV2sdILAbWVo=;
 b=0XYEYFCt8u6Xn7r6M7YTEvEsi0odC85vjjr0rtIfS7OcRMSiMPbSpKsiyuHc04LlFK
 gOnVX0mNUd4gLPKKdS5Au1mlWoITJIR9kwiCi9MoyyYPus0igEKdwPq/Hf32AYQ2xp6m
 wubuFzcMvu7AitNTCVxx8Xvh1bm22EWSFzZYgEr9WLv7JFu7fWFIhVEZYUZc5coUSrYU
 kRJLN/nJcewrbuJSbtdrvMSTlVGy9dt1hXqhOxQcQ5pgI/ue669IWCHAcL6SIW2MgUTF
 elcCyjuO40T9aRt3ku8b1kMtwQQXL8TnZFgaAeeqxD7eJ9nFQg+kKVZVeOuShpSg+gH1
 AUMQ==
X-Gm-Message-State: AOAM5336cGYWX20jbrSBvCAU1+2EnDZjf/+gjEvPtu5lm9CGNitOTPF7
 UEijkxkyhL9b9dh8Q6H8pBY=
X-Google-Smtp-Source: ABdhPJzZwN6t9mhBq0vhDH0XiM6VYuy8GmDZ2wYMYQ05gapLnZQ2or//JNGRUEmvLf3VxVplWrAO8w==
X-Received: by 2002:a17:90b:1d82:b0:1dc:ba02:52a0 with SMTP id
 pf2-20020a17090b1d8200b001dcba0252a0mr9773736pjb.246.1652347284037; 
 Thu, 12 May 2022 02:21:24 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 gj9-20020a17090b108900b001cd4989fedfsm1336874pjb.43.2022.05.12.02.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 02:21:23 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Date: Thu, 12 May 2022 13:21:13 +0400
Message-Id: <20220512092114.38426-1-linmq006@gmail.com>
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
Cc: linmq006@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

of_find_device_by_node() takes a reference to the embedded struct device,
we should use put_device() to release it when not need anymore.
Add missing put_device() in error path to avoid refcount leak.

Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 5e306de6f485..de87f02cd388 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -435,8 +435,10 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 		cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
 
 		notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
-		if (!notifier)
+		if (!notifier) {
+			put_device(&pdev->dev);
 			return -ENOMEM;
+		}
 
 		meson_encoder_hdmi->cec_notifier = notifier;
 	}
-- 
2.25.1

