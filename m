Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E3E1F8FDB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238F36E291;
	Mon, 15 Jun 2020 07:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE0089EA9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 06:53:01 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id h3so12450631ilh.13
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=l7NqrBVPm55TBMnhB8GUWUjLTUxcL6eNHsDiGUxal5I=;
 b=nkVJFgevcODeA1AiC94JJnvIYyQe+jwYYSgOR8nE5HriFZTKjNPyQJxSzqBnqEngiw
 n5UisSMFNqj6olBJvMBQP+PvjRpqnaOv35p4N3RPkZrtRUgwTY0J475ABpsNm+99wASN
 ATx7iNksqv4nRnhaI4H9/6dXXRXuRlD6Vyex43MJkpfaeWqI1trgomEwHjX0IWNoxMhL
 SgwtpS/S/Z4YgYB6O5z/cOa6GMWpS/QOXrJrwVRAlvpBSurIiBGUgl5cCP7fbqh9GUh1
 ycudI/SXnqFwuEFKYge9EajppLTMMhU3rwik2JFV/pF/V89nqA7+Kyjmx8DlHl7WSNLl
 LpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=l7NqrBVPm55TBMnhB8GUWUjLTUxcL6eNHsDiGUxal5I=;
 b=dhs0LiekH+4ILzWZy7cM576OGWn6l4FQ4sSIMqzzmXaWxAkRA+FY9bZqQsn7OnE63e
 QPN3Or/03XTBrpP5R3QgnhbSuph9IXTFuxRJqUhhIdZqYeaHBsDRR68dla5Q3Ltd1Hl8
 HkGTuk8WWDbnBGiGIKICGuDFMPuOGYk5JpTfh5jNIAELGtwQSOHIs91S408Fg3tFACw7
 qmgLmWqdaR53tAugiq0p/XKlBhOs3Y1KpfSjFcdNcV/GN7nRVMHcfypSaeN7hih69TlA
 zJJwU3uH1XHIWVx3FXDIQVT0Fz1zzLKY9UY9YWdv8jpc/Xx8wSPj+8QHKa/4tTiwz51t
 UNdA==
X-Gm-Message-State: AOAM532MNZVSZOP8uHWtjZKvOs9dtdt3/QxczLyh6PgpfqgTQEL9IGL1
 PLKgIFgQfD2N+Bql6gmUj44=
X-Google-Smtp-Source: ABdhPJxaHRK5nnGHScRiGFj7JW23P9/j3SoAXAEFRUS2BO9oz5yv9zNOby9jq9cqp1b66vGrHSFMWA==
X-Received: by 2002:a05:6e02:4a7:: with SMTP id
 e7mr20934834ils.180.1592117580805; 
 Sat, 13 Jun 2020 23:53:00 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id n82sm5821135iod.23.2020.06.13.23.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 23:53:00 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: fix ref count leak in vc4_dsi_encoder_enable
Date: Sun, 14 Jun 2020 01:52:50 -0500
Message-Id: <20200614065251.94106-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in vc4_dsi_encoder_enable, the call to pm_runtime_get_sync increments
the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index eaf276978ee7..e651de9d1c7d 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -838,7 +838,7 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 	ret = pm_runtime_get_sync(dev);
 	if (ret) {
 		DRM_ERROR("Failed to runtime PM enable on DSI%d\n", dsi->port);
-		return;
+		goto out;
 	}
 
 	if (debug_dump_regs) {
@@ -916,13 +916,13 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 	ret = clk_prepare_enable(dsi->escape_clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on DSI escape clock: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	ret = clk_prepare_enable(dsi->pll_phy_clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on DSI PLL: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	hs_clock = clk_get_rate(dsi->pll_phy_clock);
@@ -944,7 +944,7 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 	ret = clk_prepare_enable(dsi->pixel_clock);
 	if (ret) {
 		DRM_ERROR("Failed to turn on DSI pixel clock: %d\n", ret);
-		return;
+		goto out;
 	}
 
 	/* How many ns one DSI unit interval is.  Note that the clock
@@ -1088,6 +1088,8 @@ static void vc4_dsi_encoder_enable(struct drm_encoder *encoder)
 		dev_info(&dsi->pdev->dev, "DSI regs after:\n");
 		drm_print_regset32(&p, &dsi->regset);
 	}
+out:
+	pm_runtime_put(dev);
 }
 
 static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
