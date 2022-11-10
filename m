Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E829A62438F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DBE10E7BE;
	Thu, 10 Nov 2022 13:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57A410E7B8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:48:02 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k8so2357218wrh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 05:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFQJswkFzF6rVK/ySLw3u7BUeEqvWgS7HaoyjTUbHaU=;
 b=FbYEQ4sMHFTKTwrRg+TG7p4q/Sr4qC7TP+ZtXyuyZAo3X/0cPO8yi/3DZcDjiSJbmY
 W6IVpxLaN2Nh/907f6VE9WpUWDsacrmTcvjmaQbc1K3qvhJcBwH99WHeauqEFD6dTq9h
 A2hdmu9SQVRciA7r1JEnwzQwioxi3IkeYWz0h1oojcrY+tRWuHICQPJAxdettUko9BwS
 BdpYTJBNDjqTGO9eXrOAL2nwNNXzGmdqLsSCauwh9jgdgHxB5bPThosvesBkr9u06xUH
 FF2wdmAP8xn4m5Os2UWdRjTrewr45n02PBcTLjVrbW7F8Un9M4+4ThHm62SiSfwTgesf
 d48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFQJswkFzF6rVK/ySLw3u7BUeEqvWgS7HaoyjTUbHaU=;
 b=VoABHcanwWaOdODoG1QuiSgSG7ETwZfqGM22uCQua8xVu32LcRGX3uX5rdT6NiLPor
 xPg8IddaygBXDIEi0jvQY89AVO2834dSZRydS4hQzv9DVzAlMtxlZmxltCYnuS+pg4ST
 RZsINfBe3Xu2+egLbxnqV3lT7voy15v5ews7WlWx+FqZJOhligqMdRp7ly0e/YiFdoLf
 /T/Z7SIrMBlDA02w9Xap21eR5BW4fJQAAAb6R94S1GJovZIOL8ezYjvQ5HcrT9ylW51P
 sSBPMiRYQ/QfO16aVxthGw9R3l2ysYf1/s6iApph34TTPiO204+BeLyyAL2p1GUQH4O7
 rN7Q==
X-Gm-Message-State: ACrzQf1FTYOJfIr7oUh+EhdLKbD2DIfMPZ/xyIhZMzBNvtLoFlDHZ8zW
 PK8M02xfPMSWfuDrepL0fNg=
X-Google-Smtp-Source: AMsMyM7gP18kf7x+r2v5ySSaGrpwqLnSocitkDpa2Ir6vPYu4sHLNdb9K9bA9IMDJVsOH9kpsnIG3A==
X-Received: by 2002:adf:e603:0:b0:236:80ac:5f4b with SMTP id
 p3-20020adfe603000000b0023680ac5f4bmr40517495wrm.83.1668088081038; 
 Thu, 10 Nov 2022 05:48:01 -0800 (PST)
Received: from localhost.localdomain ([94.73.35.109])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a5d4302000000b0022ae0965a8asm15717060wrq.24.2022.11.10.05.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 05:48:00 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: mripard@kernel.org
Subject: [PATCH v2 2/2] drm/vc4: hdmi: Fix pointer dereference before check
Date: Thu, 10 Nov 2022 14:47:52 +0100
Message-Id: <20221110134752.238820-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110134752.238820-1-jose.exposito89@gmail.com>
References: <20221110134752.238820-1-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a49f88e5d2b9..6b223a5fcf6f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -318,8 +318,8 @@ static int reset_pipe(struct drm_crtc *crtc,
 static int vc4_hdmi_reset_link(struct drm_connector *connector,
 			       struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *drm = connector->dev;
-	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
+	struct drm_device *drm;
+	struct vc4_hdmi *vc4_hdmi;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_crtc *crtc;
@@ -330,6 +330,7 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
 	if (!connector)
 		return 0;
 
+	drm = connector->dev;
 	ret = drm_modeset_lock(&drm->mode_config.connection_mutex, ctx);
 	if (ret)
 		return ret;
@@ -347,6 +348,7 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
 	if (!crtc_state->active)
 		return 0;
 
+	vc4_hdmi = connector_to_vc4_hdmi(connector);
 	if (!vc4_hdmi_supports_scrambling(vc4_hdmi))
 		return 0;
 
-- 
2.25.1

