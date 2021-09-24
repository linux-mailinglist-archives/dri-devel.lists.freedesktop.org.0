Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D794168F8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 02:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A5F6E139;
	Fri, 24 Sep 2021 00:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3154E6E135
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 00:34:11 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id r2so8081401pgl.10
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 17:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=brQvCkiWnm8n1ZB3+QwJJqLl2orjJJoMuam9WVOZX4g=;
 b=K25XKNh0Or3/qOoxYeoOlHUvqywO8dnTxSdrH/WVKQLJornC5fyEEbxtBNm/cEv5/s
 kcWEzvLXYAi72EQvNhqsl0I0ImLdedR/GGTNR5neJdBqn5C4Ep9Ll7tke1ngn7umRQeF
 P87WQWko3lyiyaqbq410TJmewbH9g0DWZe9p0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=brQvCkiWnm8n1ZB3+QwJJqLl2orjJJoMuam9WVOZX4g=;
 b=yezrRvFzyKQxdxWbWxElE0cnbOpHHAMfHSlNY5ksuAGTrT3VJ1DfMkuAzv/oa696SS
 E8I8/7brS3iZgYG1e4Kng06k+OK95bo4Pju9ip8YDWDafkJxE7HlhsMSdvAfRnGC6O5t
 SwSeIx4Rx3uHJdOp01ynbvQUbiv2aNb/ZlPsOsqwSDMi5jrCjypzR3BjLayz05FLjvoP
 X+cOmhm02qMS/XxHM3Q2lqtx9YiWA/FGXnXvY9ELBxm3XDWc5xr1MY/8nkjAOAIuGWs0
 1EQOgalhkkv4jucycBm3wFtpPB57cIV53FtTvL+ktTgFkZH8qkwojWlw/KogREm+vxXl
 XxRA==
X-Gm-Message-State: AOAM530AOdQj7B4HigWOWIWggUh9FfDmfd7+mEaPVsQ4pM6QBbEtkYCP
 ZdoJbAWnskG1ppjrn7ydif/SXQ==
X-Google-Smtp-Source: ABdhPJwiOv/whqWReLlPFjTjV+JRvxrOQXUtYwqh/IUV6UK0b2Dt+OIIMph8lD/YY0/3wB4idEEIWw==
X-Received: by 2002:a05:6a00:16ca:b0:413:d3f7:646f with SMTP id
 l10-20020a056a0016ca00b00413d3f7646fmr7204222pfc.7.1632443650783; 
 Thu, 23 Sep 2021 17:34:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:74de:c8b7:3a35:1063])
 by smtp.gmail.com with UTF8SMTPSA id m2sm8070878pgd.70.2021.09.23.17.34.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 17:34:10 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Heiko Stuebner <heiko@sntech.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Brian Norris <briannorris@chromium.org>
Subject: [PATCH 3/3] drm/panel: Delete panel on mipi_dsi_attach() failure
Date: Thu, 23 Sep 2021 17:33:55 -0700
Message-Id: <20210923173336.3.If9e74fa9b1d6eaa9e0e5b95b2b957b992740251c@changeid>
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

Many DSI panel drivers fail to clean up their panel references on
mipi_dsi_attach() failure, so we're leaving a dangling drm_panel
reference to freed memory. Clean that up on failure.

Noticed by inspection, after seeing similar problems on other drivers.
Therefore, I'm not marking Fixes/stable.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c    | 8 +++++++-
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c           | 8 +++++++-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c           | 8 +++++++-
 drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c     | 8 +++++++-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c             | 8 +++++++-
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c | 1 +
 drivers/gpu/drm/panel/panel-samsung-sofef00.c            | 1 +
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c          | 8 +++++++-
 8 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index 581661b506f8..f9c1f7bc8218 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -227,7 +227,13 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = 4;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int feiyang_dsi_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 733010b5e4f5..3c86ad262d5e 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -473,7 +473,13 @@ static int jdi_panel_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		jdi_panel_del(jdi);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int jdi_panel_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 533cd3934b8b..839b263fb3c0 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -656,7 +656,13 @@ static int nt36672a_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	err = mipi_dsi_attach(dsi);
+	if (err < 0) {
+		drm_panel_remove(&pinfo->base);
+		return err;
+	}
+
+	return 0;
 }
 
 static int nt36672a_panel_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 3c20beeb1781..3991f5d950af 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -241,7 +241,13 @@ static int wuxga_nt_panel_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		wuxga_nt_panel_del(wuxga_nt);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index a3782830ae3c..1fb579a574d9 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -199,7 +199,13 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = 4;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		drm_panel_remove(&ctx->panel);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int rb070d30_panel_dsi_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
index ea63799ff2a1..29fde3823212 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
@@ -247,6 +247,7 @@ static int s6e88a0_ams452ef01_probe(struct mipi_dsi_device *dsi)
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 8cb1853574bb..6d107e14fcc5 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -302,6 +302,7 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
+		drm_panel_remove(&ctx->panel);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index b937e24dac8e..25829a0a8e80 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -296,7 +296,13 @@ static int sharp_nt_panel_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0) {
+		sharp_nt_panel_del(sharp_nt);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int sharp_nt_panel_remove(struct mipi_dsi_device *dsi)
-- 
2.33.0.685.g46640cef36-goog

