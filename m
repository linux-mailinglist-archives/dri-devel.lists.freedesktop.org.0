Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DF7539356
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 16:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D5910E14A;
	Tue, 31 May 2022 14:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5861110E130
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 14:49:46 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id g184so13077609pgc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 07:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceYIzlL/twTH8Sr59LajLbKK1xxBDxgWw7CtT5vS84w=;
 b=K0S/p3jRO0pqQZ0yw9hdVvC9iMKHlzc6CLAZtSMin3YKcxUYUj0ek3P+WGYNxDZl/h
 9azmVFZ0uzK8PCDufF/Gjw66qtxTwQqzJdFJuIxxWUxF8ww4bqrf15X+U13iBBErU1fp
 DX3oH+7ABnJSlbwItxycWDd41+OPp8j+1cKrlbFn39i5y4pgUCwGq499xs8oPoiRbGv/
 bwfjPX/feLbTjyI0TiFgnStzne1oJOBmjMLEgxGWTeffJ/3xpVBhg6lwr/qhOoGdjBWq
 JqCwX0CVSpdiZWifOYpTuacvZTwYd6lwx9r5/r0M8zr3ltCWRlJ2SukjjgtidI0y2BYS
 Zzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceYIzlL/twTH8Sr59LajLbKK1xxBDxgWw7CtT5vS84w=;
 b=HadamhckGozBK1SNzumjEqoikpboTNT1HqfNQVrXORjJCDqhSA0OXooRPibubCzGRc
 MBhD61Qi8ylkOcG1Cv/U8XSClk03Hei57CTZfk1/QQxP2pfXhxQPNp7+jgoPAjlvtkS+
 U6Q2gYHMaFqe/1B/h/Ub4PWfJJln8NH7RVTM9rO2witGOfixbUYIKkh5IS7/afHhnY3H
 8i5vXQJ57NtSRiAvvR9kF5p98qRDIa4mouU2GK3fIAzMtQKRx+6HBvgwcVW0B34y9YHu
 OTlKOZ2aseG6oR5jhIyO/0XK/3JV4R6tWdkrXtTT9amtLYeIPEJaBHhEmaTkbKfvLrtk
 NrGQ==
X-Gm-Message-State: AOAM531ZtuTIhR6nQOBYSA+TAJPTR1nlhpn4rO71J5pP5MVWnyTKxjuC
 CumEkavvw9WUlPSigFbTMDU=
X-Google-Smtp-Source: ABdhPJzDSi4itj4Z6llVe4OArFqnAITyU34dFBtLDFQN+cm+fuixe6WVqtcPuXnd4vYgLmf0MRQtHA==
X-Received: by 2002:a63:ef4e:0:b0:3f9:e8c4:b72d with SMTP id
 c14-20020a63ef4e000000b003f9e8c4b72dmr42409832pgk.328.1654008585955; 
 Tue, 31 May 2022 07:49:45 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 d3-20020a17090a8d8300b001e2d4ef6160sm2007215pjo.27.2022.05.31.07.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 07:49:45 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/meson: encoder_hdmi: Fix refcount leak in
 meson_encoder_hdmi_init
Date: Tue, 31 May 2022 18:48:16 +0400
Message-Id: <20220531144818.26943-2-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531144818.26943-1-linmq006@gmail.com>
References: <20220531144818.26943-1-linmq006@gmail.com>
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

of_graph_get_remote_node() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: e67f6037ae1b ("drm/meson: split out encoder from meson_dw_hdmi")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 5e306de6f485..f3341458f8b7 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -363,6 +363,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	}
 
 	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
 	if (!meson_encoder_hdmi->next_bridge) {
 		dev_err(priv->dev, "Failed to find HDMI transceiver bridge\n");
 		return -EPROBE_DEFER;
-- 
2.25.1

