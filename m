Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA61A88934A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 08:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8656C10E63A;
	Mon, 25 Mar 2024 07:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PAlWMF6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6689710E63A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 07:25:17 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6e6b54a28d0so2548470b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 00:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711351517; x=1711956317;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X+MjbtDBOKGPD9jVghLidV+HqVDg672gc0v95BdsAEo=;
 b=PAlWMF6M36uKnp8H5unWtCX2PfbN6a+yPAxMZai69abE7mgKxTmjnMa0DWTj8LKi8R
 wZrmE+0WlouQ/zjef54Dt1sacMBatz09V1GL5IcJfqxfdoTUJOGcgJ05I+LDIBA1f7nV
 Le++uNWubBfVHpnSxQdNu42M7RShmkn83vyPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711351517; x=1711956317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X+MjbtDBOKGPD9jVghLidV+HqVDg672gc0v95BdsAEo=;
 b=AAX7ND0lcdcRym2rbv0N6i78VmRStEaGjWp229EN3hAvtuqBZJR7GzZqbtt0yxVwUP
 ThAhGmbCQWs+HrluChJg2yn8TM18BJc8TtZeOQfEyeWzT4HToe8+qfqNHuXAyZd+r2nk
 bnauiwktiNRzry5rINs8geqAVb8DRtfmfZfPAkJUO+xjpBSSP03WJ5V5//5qUTpthrab
 I7RRgOk1bjFlbQruEzlmbT0W4/OflfmUJF9KdaKxD1ErNC85mriCHIYmJnhBa/Up275k
 5FGPbXczQPajsMAmqlHHPPUhEBMk1345UZZXcSgr0lKeFRlPxq3KJcOhx/4kpcjbqHG/
 Tp+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoG3F/R4GxQzQLLbpDNRbTa9HiarOL/qwRf/A2eUjWuktfKq7BqGTfRYQab54RAL9j/3QpScTOof/ePU6riT6gmplF9hZJwAuf3+PkGlyJ
X-Gm-Message-State: AOJu0YwB0Y+M2AGxgxVRAnmAAJp0QABjIEbUqkeHyZoF8FLiGStggIsH
 0hh0Earg/QYw3JUh5mYBE9vGgCOeqjkT6Ic+loIjCGaUSBEJocZzxW4LCNdOvg==
X-Google-Smtp-Source: AGHT+IHxupfZP61/dL8Pe/rmSqXGAZIOKra49157wwAJjtT1t+dgbt+8Az+2w4zZx+qc2GdM6EKybw==
X-Received: by 2002:a05:6a00:21d0:b0:6e6:d018:4a91 with SMTP id
 t16-20020a056a0021d000b006e6d0184a91mr6760277pfj.29.1711351516764; 
 Mon, 25 Mar 2024 00:25:16 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com.com
 (36.157.124.34.bc.googleusercontent.com. [34.124.157.36])
 by smtp.gmail.com with ESMTPSA id
 w188-20020a6262c5000000b006e6c0080466sm3901148pfb.176.2024.03.25.00.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 00:25:16 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Xin Ji <xji@analogixsemi.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v3] drm/bridge: anx7625: Update audio status while
 detecting
Date: Mon, 25 Mar 2024 07:24:21 +0000
Message-ID: <20240325-anx7625-v3-1-056a52f66791@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Previously, the audio status was not updated during detection, leading=0D
to a persistent audio despite hot plugging events. To resolve this=0D
issue, update the audio status during detection.=0D
=0D
Fixes: 566fef1226c1 ("drm/bridge: anx7625: add HDMI audio function")=0D
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>=0D
---=0D
Changes in v3:=0D
- Add Fixes tag.=0D
- Link to v2: https://lore.kernel.org/r/20240306-anx7625-v2-1-7138e00b25bf@=
chromium.org=0D
=0D
Changes in v2:=0D
- Add a space after the colons in the subject line.=0D
- Link to v1: https://lore.kernel.org/r/20240305-anx7625-v1-1-83ed3ccfa64c@=
chromium.org=0D
---=0D
 drivers/gpu/drm/bridge/analogix/anx7625.c | 9 ++++++++-=0D
 1 file changed, 8 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/br=
idge/analogix/anx7625.c=0D
index 29d91493b101a..9f0d0c5b8ebf5 100644=0D
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c=0D
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c=0D
@@ -2481,15 +2481,22 @@ static void anx7625_bridge_atomic_disable(struct dr=
m_bridge *bridge,=0D
 	mutex_unlock(&ctx->aux_lock);=0D
 }=0D
 =0D
+static void=0D
+anx7625_audio_update_connector_status(struct anx7625_data *ctx,=0D
+				      enum drm_connector_status status);=0D
+=0D
 static enum drm_connector_status=0D
 anx7625_bridge_detect(struct drm_bridge *bridge)=0D
 {=0D
 	struct anx7625_data *ctx =3D bridge_to_anx7625(bridge);=0D
 	struct device *dev =3D ctx->dev;=0D
+	enum drm_connector_status status;=0D
 =0D
 	DRM_DEV_DEBUG_DRIVER(dev, "drm bridge detect\n");=0D
 =0D
-	return anx7625_sink_detect(ctx);=0D
+	status =3D anx7625_sink_detect(ctx);=0D
+	anx7625_audio_update_connector_status(ctx, status);=0D
+	return status;=0D
 }=0D
 =0D
 static struct edid *anx7625_bridge_get_edid(struct drm_bridge *bridge,=0D
=0D
---=0D
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72=0D
change-id: 20240305-anx7625-fe16d3a9d37d=0D
=0D
Best regards,=0D
-- =0D
Hsin-Te Yuan <yuanhsinte@chromium.org>=0D
=0D
