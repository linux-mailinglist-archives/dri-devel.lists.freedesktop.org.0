Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51D4168F6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 02:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0C16E134;
	Fri, 24 Sep 2021 00:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F596E134
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 00:34:09 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id g2so3133008pfc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 17:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yEiQvpP90gfZjBo9eARQA/dGO0k9EVx8RLJE4fBEffo=;
 b=iR0mGqFCRUve5BCBSrrRcCdy8Dh8jyvq9GbxxKiMzpchO1ZIxZb+bU3DDa8VjY75qD
 aP79hLfIzswYkIp/Lq5ReRkVdZiGpLFR0q6LI+w1MVPOGcx8B2kVGMmAtwlsIaGLFHtm
 1gM/Mh8A0kxKQFbL1vfPtfs69DXNEF02mUmOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yEiQvpP90gfZjBo9eARQA/dGO0k9EVx8RLJE4fBEffo=;
 b=OrDXxNZnkVA2ZiSyicwG5stCMCL5hvKeoSpKwyLdhIikPJ6niqpXXT/aWHI8J1W1qO
 F6ui6E5/d6yRjUkyZR0LB4ub0Xiaa+QuoDBJA/KM0DAcLPnyTtquUSdAXxWuEuliSxFb
 9mOWNDRYtSNMFg01GKbdunSSbsX+k9AY0KpnDXxwvdEZY9OCZ2Q6MR6TVpUwsQfOc2mg
 F4zVHierRXDjHa7Oz2kiVlPvzyMkYKniRGGfYFj56Kl0Gwmf02Y9/HQyMBHFZJeqWVgZ
 UTBpxKVLkTWCFydQ6KdGT9lWEdSKBDG7axIVUzDRMAFaRG8HuOMlESTgoCN7U47SOJ4z
 myGg==
X-Gm-Message-State: AOAM5324LZNjY0n0DLy1Q+/6lyy55X9GwDojtVvKsrATT9F7vRgDDQLT
 TcB9L/Qdm4SZnDC+F8sV0F2E9g==
X-Google-Smtp-Source: ABdhPJwi1hDYHJLiTqVsQKo2Qj1wDbfpdCAQz2Fk7pGYUTkrXOEnn2izG27x7hKRaxz+DtaCR3lmDw==
X-Received: by 2002:a05:6a00:1944:b0:438:d002:6e35 with SMTP id
 s4-20020a056a00194400b00438d0026e35mr7047397pfk.20.1632443648891; 
 Thu, 23 Sep 2021 17:34:08 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:74de:c8b7:3a35:1063])
 by smtp.gmail.com with UTF8SMTPSA id z17sm6932766pfj.185.2021.09.23.17.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 17:34:08 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Heiko Stuebner <heiko@sntech.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/3] drm/panel: innolux-p079zca: Delete panel on attach()
 failure
Date: Thu, 23 Sep 2021 17:33:54 -0700
Message-Id: <20210923173336.2.I9023cf8811a3abf4964ed84eb681721d8bb489d6@changeid>
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

This problem exists since the driver's introduction, but is especially
relevant after refactored for dual-DSI variants.

Fixes: 14c8f2e9f8ea ("drm/panel: add Innolux P079ZCA panel driver")
Fixes: 7ad4e4636c54 ("drm/panel: p079zca: Refactor panel driver to support multiple panels")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/panel/panel-innolux-p079zca.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index aea316225391..f194b62e290c 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -484,6 +484,7 @@ static void innolux_panel_del(struct innolux_panel *innolux)
 static int innolux_panel_probe(struct mipi_dsi_device *dsi)
 {
 	const struct panel_desc *desc;
+	struct innolux_panel *innolux;
 	int err;
 
 	desc = of_device_get_match_data(&dsi->dev);
@@ -495,7 +496,14 @@ static int innolux_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	err = mipi_dsi_attach(dsi);
+	if (err < 0) {
+		innolux = mipi_dsi_get_drvdata(dsi);
+		innolux_panel_del(innolux);
+		return err;
+	}
+
+	return 0;
 }
 
 static int innolux_panel_remove(struct mipi_dsi_device *dsi)
-- 
2.33.0.685.g46640cef36-goog

