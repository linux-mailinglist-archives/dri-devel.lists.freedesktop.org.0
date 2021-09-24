Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E804168F7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 02:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B03A6E135;
	Fri, 24 Sep 2021 00:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454096E135
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 00:34:07 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so8163043pjc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 17:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GXGQzd3Jce1GxoSPTZ2A43YJGDeYWsQ75s4W02haYwg=;
 b=nHwKrm85EJLFa5o7M8uboJTdffKYHc0HAPbo3aMjs0nIRAAEQp51SzW5Tn2rOV9ahi
 DbLzOsPVZiZFExYUpwFk7ktyoXgqDnjK2flS57f+8nttDDjahC3E5VDqvLS6EHj4OBau
 u7LVZGfmSPr93DyP9F0j+5DYfLwErGThZmnMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXGQzd3Jce1GxoSPTZ2A43YJGDeYWsQ75s4W02haYwg=;
 b=P1sX0kQCbu3QI84ww6RwW/mUe/qDH0akszN+JeQ9NrVb0dGzeMSn/lf/toIpFpnEq2
 p7f0KsA7dzS8a1bPJEGlW3/VVtZfWVtybMyksjWcvJAsyUIizW6dTbWZJ+3ZIBjXxoSP
 VNw3br5DqDYaEWvsCfCqYIOY8rFJekwX4vhfRpSlxHBdtt1KbT/N/eJbP9Zu5h4do1oj
 6/G1Q1oaUy/yrEq4nuEZheSugOlUyusjLKxOlxxwrJqB8LvkBLSLOXcrAf92v2c6Wcyd
 m6LopOul/MQawGoIyGDboFZbrdKEu9L8JeFdd48ZfuVXHeZ2c4cmkSP3WhNuOvk2dz7f
 53Iw==
X-Gm-Message-State: AOAM532ljODMoxwQ+Ktt6UArLvcSXbgStgW1Sb3VjK6n6xfiEFloREVT
 SBkPAnT1UuUlyhOAtiUhqBH2nw==
X-Google-Smtp-Source: ABdhPJx1E98jD2DkQdaawUmqRlzLrAbBO7749cZgFl3tEU29OWh4NKQSpueGR38+XSYRfWHElUfPlA==
X-Received: by 2002:a17:90b:1102:: with SMTP id
 gi2mr8456536pjb.43.1632443646797; 
 Thu, 23 Sep 2021 17:34:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:74de:c8b7:3a35:1063])
 by smtp.gmail.com with UTF8SMTPSA id c3sm7465375pgn.76.2021.09.23.17.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 17:34:06 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Heiko Stuebner <heiko@sntech.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/3] drm/panel: kingdisplay-kd097d04: Delete panel on attach()
 failure
Date: Thu, 23 Sep 2021 17:33:53 -0700
Message-Id: <20210923173336.1.Icb4d9dbc1817f4e826361a4f1cea7461541668f0@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210924003355.2071543-1-briannorris@chromium.org>
References: <20210924003355.2071543-1-briannorris@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we fail to attach (e.g., because 1 of 2 dual-DSI controllers aren't
ready), we leave a dangling drm_panel reference to freed memory. Clean
that up on failure.

Fixes: 2a994cbed6b2 ("drm/panel: Add Kingdisplay KD097D04 panel driver")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 86e4213e8bb1..daccb1fd5fda 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -406,7 +406,13 @@ static int kingdisplay_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	err = mipi_dsi_attach(dsi);
+	if (err < 0) {
+		kingdisplay_panel_del(kingdisplay);
+		return err;
+	}
+
+	return 0;
 }
 
 static int kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
-- 
2.33.0.685.g46640cef36-goog

