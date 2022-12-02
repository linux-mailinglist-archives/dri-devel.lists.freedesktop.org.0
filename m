Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE8C6408B9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 15:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AB310E6F9;
	Fri,  2 Dec 2022 14:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4738810E40F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 14:47:40 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id bx10so8194287wrb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Dec 2022 06:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=To1Cqk5kKO00vzLQEHmhgUwT19AikOQhkf3445jaw44=;
 b=JrgCNFJ9PGaZix1ZrYx5382yrhl6QUnnWME88qse9InMJeHUhZQ+1FVMyluiqI2BcE
 yURk5/IusS3zM22MmiSmtj8z7K9H2eHcdrKbavqcaDN8vpghLscEcWt2Kz6YRAP7Ufiz
 lT5F5QADzRVfDn4kufnCQ65xzy6zIWVgFpUrvLAb83ZtsRfRGT6SdYn3WHJb5DpV8TBn
 0kV2AHICBg6iF5M5ZOcoGHYW6cJAdoKOb5f1ZAdWMDJWPxrIZhmwfKgXQaAy8x3BA+vz
 WtkaA7qfvo6MB1epAcTkUy8695B90vaC8opOkw21zygqir5gjtdKDiQInYz/Na/8etka
 6iRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=To1Cqk5kKO00vzLQEHmhgUwT19AikOQhkf3445jaw44=;
 b=BWRiOboubj5RGx5+1TUzJalsUfuZVKYMobxFJ2Uuk+MNwx7XZHRuyyPy1DHkstpxiJ
 1zaPD/x5Ja7af0ZXouY+tfbzRKPiTzsl2e3t8bH+90JlpDm2rLzvyOlMkA357O7UDYlF
 VUFzG3ySeTK1BN4m9kXZgt5dPrDOjT8wZBEBcQu4/KNe8Qr6Rrmd/484mZQjLH76kqqT
 Y3aipj8QAXyRddLDozaUJDnvckeYijzTvsBlBAfEbZ5cgJ0UxB0UIwpnQ/lCD76fdemj
 jZdrJ1OBWaCjkWWrhkQhnwwK+6wzlhfQ4VSFLZsteYkqh2DTCWjeUNQDZSzw2HH2neNt
 da+g==
X-Gm-Message-State: ANoB5pkJXCC0K3rQ2azdVC9Xr3rdrYKTS/sjdHTwus1nXLgDJzMpxd3k
 oR1ublys8iIm4/Vk2kH53n79vw==
X-Google-Smtp-Source: AA0mqf7x9sexQiE1u5+ZZHOBl5GCCISCFC4RxcYVRTAPHgLYp4OANpdoGB4Psl1zAj4H+mo8As1wUg==
X-Received: by 2002:adf:fb4c:0:b0:236:5270:735e with SMTP id
 c12-20020adffb4c000000b002365270735emr32780220wrs.659.1669992458516; 
 Fri, 02 Dec 2022 06:47:38 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 n29-20020a05600c3b9d00b003c21ba7d7d6sm10700152wms.44.2022.12.02.06.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 06:47:38 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/bridge: Document the expected behaviour of DSI
 host controllers
Date: Fri,  2 Dec 2022 14:28:16 +0000
Message-Id: <20221202142816.860381-6-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202142816.860381-1-dave.stevenson@raspberrypi.com>
References: <20221202142816.860381-1-dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The exact behaviour of DSI host controllers is not specified,
therefore define it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/gpu/drm-kms-helpers.rst |  7 +++++
 drivers/gpu/drm/drm_bridge.c          | 39 +++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index a4860ffd6e86..b8ab05e42dbb 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -188,6 +188,13 @@ Bridge Helper Reference
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :export:
 
+MIPI-DSI bridge operation
+-------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: dsi bridge operations
+
+
 Bridge Connector Helper Reference
 ---------------------------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 41051869d6bf..bd73d32f29c0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -153,6 +153,45 @@
  * situation when probing.
  */
 
+/**
+ * DOC: dsi bridge operations
+ *
+ * DSI host interfaces are expected to be implemented as bridges rather than
+ * encoders, however there are a few aspects of their operation that need to
+ * be defined in order to provide a consistent interface.
+ *
+ * A DSI host should keep the PHY powered down until the pre_enable operation is
+ * called. All lanes are in an undefined idle state up to this point, and it
+ * must not be assumed that it is LP-11.
+ * pre_enable should initialise the PHY, set the data lanes to LP-11, and the
+ * clock lane to either LP-11 or HS depending on the mode_flag
+ * %MIPI_DSI_CLOCK_NON_CONTINUOUS.
+ *
+ * Ordinarily the downstream bridge DSI peripheral pre_enable will have been
+ * called before the DSI host. If the DSI peripheral requires LP-11 and/or
+ * the clock lane to be in HS mode prior to pre_enable, then it can set the
+ * &pre_enable_prev_first flag to request the pre_enable (and
+ * post_disable) order to be altered to enable the DSI host first.
+ *
+ * Either the CRTC being enabled, or the DSI host enable operation should switch
+ * the host to actively transmitting video on the data lanes.
+ *
+ * The reverse also applies. The DSI host disable operation or stopping the CRTC
+ * should stop transmitting video, and the data lanes should return to the LP-11
+ * state. The DSI host &post_disable operation should disable the PHY.
+ * If the &pre_enable_prev_first flag is set, then the DSI peripheral's
+ * bridge &post_disable will be called before the DSI host's post_disable.
+ *
+ * Whilst it is valid to call &host_transfer prior to pre_enable or after
+ * post_disable, the exact state of the lanes is undefined at this point. The
+ * DSI host should initialise the interface, transmit the data, and then disable
+ * the interface again.
+ *
+ * Ultra Low Power State (ULPS) is not explicitly supported by DRM. If
+ * implemented, it therefore needs to be handled entirely within the DSI Host
+ * driver.
+ */
+
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
 
-- 
2.34.1

