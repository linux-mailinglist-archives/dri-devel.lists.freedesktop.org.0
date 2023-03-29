Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76E96CDA7B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA54C10EABC;
	Wed, 29 Mar 2023 13:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC1310EABC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:19:47 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id q102so14012896pjq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u6Zop59KiDms2RJ1oWf1wfATSRqRH4OJms0tUCu66Ds=;
 b=QQ4mv0hzsvmkqMfZ15yfLZhf/wl79O4+d+NBuatGYLK4BGPk9Np/s4ckoMZRB3LZXo
 I3dscvMrxXCbTMtb7/FDV05iLJ2rUvj36gPeS7d0vqmmPQeVd2WB7IiqF1xr4PDKBwF2
 i3aV50EnDgs+bsKD5ZfaHeeybIOgqGkOc1ghc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u6Zop59KiDms2RJ1oWf1wfATSRqRH4OJms0tUCu66Ds=;
 b=NkN4+a4k+Xyl9omDTuc8FdDtMrJyld25u1YzgHmHeEDywwxsnJqs2kWMv+BYrUIT1K
 Hqtsb2ludNxH7kYYxvzLKEG9PkApBkwnbC/t6xodSbOBdpyQd5+HxEno7Nzlqkk1Qy/7
 dNwpAG5kE6GIaq9FEl5NLMrF0a68BPUqYP5U8SgW3HYNU9YPZvWscntSg9ZiXrv2AZ3a
 Vi2BYcA+TvPhZJVXBeJMy4lSJz+8ciHcuSbvN/QA4Inx8bNc+pGNlKijwN2/xkW78g2Z
 nTzdStJbssvRZnclM8eVxhgRUB4Uiyvk8Ux+5jFx+RX4Krk5YLA7oP2Ck/PqWH7hRc09
 3Bmw==
X-Gm-Message-State: AAQBX9ef/AGZvzYJoQQlDSIgPVu4uZZQP8PRkHgititPq4NQ63wu+2xv
 F/CrkgrcqBjPaUiMGxBmc+0Aew==
X-Google-Smtp-Source: AKy350bJSgXAsk9heZqbdTPpDv1tZiTFnee58NDrLnd5uUac7ubukuyOG3UH7pLKrlBz3vrhjtw4ZQ==
X-Received: by 2002:a17:902:d2d2:b0:1a0:6ed9:f9d0 with SMTP id
 n18-20020a170902d2d200b001a06ed9f9d0mr24347448plc.68.1680095987116; 
 Wed, 29 Mar 2023 06:19:47 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902854900b0019c90f8c831sm22949389plo.242.2023.03.29.06.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:19:46 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 11/12] drm/bridge: Document bridge init order with
 enable_next_first
Date: Wed, 29 Mar 2023 18:49:28 +0530
Message-Id: <20230329131929.1328612-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329131929.1328612-1-jagan@amarulasolutions.com>
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to switch HS mode properly by DSI host, the DSI sink has to
send the MIPI-DCS commands first before the DSI host switches to HS
mode.

This behavior requires a bridge init alter in @enable and @disable
function calls with the help of @enable_next_first.

Document the affected bridge init order with a proper explanation.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/drm_bridge.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index cdc2669b3512..3c6c9937537a 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -190,6 +190,21 @@
  * Ultra Low Power State (ULPS) is not explicitly supported by DRM. If
  * implemented, it therefore needs to be handled entirely within the DSI Host
  * driver.
+ *
+ * DSI sink devices typically send the MIPI-DCS commands to the DSI host via
+ * general MIPI_DSI_DCS read and write API. The classical DSI sequence
+ * mentioned that the DSI host receives MIPI-DCS commands from the DSI sink
+ * first in order to switch HS mode properly. Once the DSI host switches to
+ * HS mode any MIPI-DCS commands from the DSI sink are unfunctional.
+ *
+ * DSI sink uses the @enable function to send the MIPI-DCS commands. In a
+ * typical DSI host, sink pipeline the @enable call chain start with the
+ * DSI host, and then the DSI sink which is the "wrong" order as DSI host
+ * @enable is called and switched to HS mode before DSI sink @enable. If
+ * the DSI host enables with the @enable_next_first flag then the @enable
+ * for the DSI sink will be called first before the @enable of the DSI host.
+ * This alter bridge init order makes sure that the MIPI-DCS commands send
+ * first and then switch to the HS mode properly by the DSI host.
  */
 
 static DEFINE_MUTEX(bridge_lock);
-- 
2.25.1

