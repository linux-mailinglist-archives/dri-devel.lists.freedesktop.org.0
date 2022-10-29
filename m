Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E616121E2
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 11:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2D410E0D3;
	Sat, 29 Oct 2022 09:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDB410E0D3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 09:34:39 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id n14so4453996wmq.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 02:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0s7cusbjRhvfSFjBw6Lx4DFnE28qr99VM/89xctrXcY=;
 b=R8r9MYiVR/n1QCShgiCRjvlsyCmGxIth8d68WOBKuFwGFdpvU0hLifsKHXaA0i7R7T
 FATSb70x39JDuCr+RFIEMHkzCbXWDBVXLQrDeb9y7eB4/OehDirtQMwmoI+nEp+BrN0G
 u/fUtaHezDnpUbrRdrgmORy9rD4FhXGYMCmjG/LapRowSvd+EZrEGPnCIBo1dsmqrQzE
 esyFj2o/J+WqlmQTU+aoX79Wvn1x2MTGTvXbk00TQxNzSp0U4mMc+L1GZbZv4260jlSX
 DI4iK78azGeF6BR5yBioI4MAexmAQiV7qakqP16N3f0ibROLougrJyoyhWfCUkuqRZ00
 Lydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0s7cusbjRhvfSFjBw6Lx4DFnE28qr99VM/89xctrXcY=;
 b=tv+ysTjWrC59bdxMnENTaeCZjjlO1jD4gp76JWu4DrCnVM58oOdQ5wz7oxrUebIihT
 k+/WN+JGBcnzecbEh3WA5VDsp/p3Z+AL2ZNfzIYKAX6DswsWJ6e72BWtgrge26jw17X2
 Xei2bsB3UOoF9DXGc+u87GZydjzAcFgXt/G1O7FYoBq6HITr4yoBpeaCBRl4k8bCM/bq
 KXJ96sjXGP9WbpMwUBqsF8l53omm/pWK80wv1clmauz23pL1/udQRt2pVQv3z3OUhJmY
 Wf+LOfTMVrqeMZBKYsJy1NI1ZBl6iht9idyJI4dIeXUno4JQdVqoB0y3lT2sjCZR7vEK
 pDUQ==
X-Gm-Message-State: ACrzQf3/3KdtBkTs30CrtSeZ2YBgHvCG18SS/MtlrdZAixhZMFRj3RnA
 yWYd1HCuxYSNJj3bnfYRHms=
X-Google-Smtp-Source: AMsMyM6Amig+erFbtqG7wwXSWmzDP5vkjeNyXS8CvHdnIWkIsJz9SDcz1bFmgAx7ObVYinv/0KmjpA==
X-Received: by 2002:a05:600c:310f:b0:3c6:ff0a:c41 with SMTP id
 g15-20020a05600c310f00b003c6ff0a0c41mr11820655wmo.91.1667036078032; 
 Sat, 29 Oct 2022 02:34:38 -0700 (PDT)
Received: from localhost.localdomain ([94.73.35.109])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfe3d2000000b00236705daefesm1053785wrm.39.2022.10.29.02.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 02:34:37 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: mripard@kernel.org
Subject: [PATCH] drm/vc4: hdmi: Fix pointer dereference before check
Date: Sat, 29 Oct 2022 11:34:13 +0200
Message-Id: <20221029093413.546103-1-jose.exposito89@gmail.com>
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
Cc: emma@anholt.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug") introduced
the vc4_hdmi_reset_link() function. This function dereferences the
"connector" pointer before checking whether it is NULL or not.

Rework variable assignment to avoid this issue.

Fixes: 6bed2ea3cb38 ("drm/vc4: hdmi: Reset link on hotplug")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4a73fafca51b..07d058b6afb7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -319,9 +319,9 @@ static int reset_pipe(struct drm_crtc *crtc,
 static int vc4_hdmi_reset_link(struct drm_connector *connector,
 			       struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *drm = connector->dev;
-	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
-	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
+	struct drm_device *drm;
+	struct vc4_hdmi *vc4_hdmi;
+	struct drm_encoder *encoder;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
@@ -332,6 +332,10 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
 	if (!connector)
 		return 0;
 
+	drm = connector->dev;
+	vc4_hdmi = connector_to_vc4_hdmi(connector);
+	encoder = &vc4_hdmi->encoder.base;
+
 	ret = drm_modeset_lock(&drm->mode_config.connection_mutex, ctx);
 	if (ret)
 		return ret;
-- 
2.25.1

