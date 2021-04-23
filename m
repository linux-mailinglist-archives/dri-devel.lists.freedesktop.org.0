Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF423697C2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 19:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52D36EC26;
	Fri, 23 Apr 2021 17:00:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7336EC18
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:59:59 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id q2so2499114pfk.9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2irDBnkqmM3wv0GuRvBUKKKvXT4OqqpqCxXsJUDi0yY=;
 b=nY3NEiJjTVhYaqtF4JkoIDdonIMHogVty/rQuAsexe9F4i2Uhwz/XdA3pTBItC0bzq
 O62ca7z8DZ8y/Bjr8vjTyiwT2cmF4NCXYoGPgFaSCni0Y68OlxdULfQFsPTmFEEZP/mK
 NcMkrdksVuMVbn9LSzJ4n66ujsp1NyKYNVX1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2irDBnkqmM3wv0GuRvBUKKKvXT4OqqpqCxXsJUDi0yY=;
 b=rUPE2dCQRP2d8liuOuv29fjpcKmwZK25ZczyKAzr9d/GpL0Edv9DlLgB5FokLenGHR
 ND55jdIkS/B+m3blD/cg6gLFSt3sLCd/FK+cMdsNF7CFmbZzFbF0AjvvGmYjcFRSl2rt
 b0WYiKhCV0WTUTReF15FTpFurhLC5QO3AvJJdpVbzxFdBvLkY4a/sFJYR0Cv9JCeGXtM
 op4x+Jt5YQyDI+shfXICGZDFQL94VfOn4M3GD7nrjQJ6pcQcTSPmKgkKmTsuvqaA/zUD
 aAYrlNzNVLWVmkzL4nEc3H+8qxI2GQXaSvqFTK8kEPo9wcPruME+he4ZY/uXu0QHZwr7
 /ldA==
X-Gm-Message-State: AOAM533jbelFAo/baobWlq2E1Sf5ZS0pn4AsV9ZOVTNzdMB3yinjTK9U
 l5M15iJaS1zzgS6xKK+hkkAEmA==
X-Google-Smtp-Source: ABdhPJyNRywKHcTfgakgp2CqXZs7wKXnf4eben+Fiu78mA2c8AJYA0KF0c2Abkct8V8f1il2rA20/Q==
X-Received: by 2002:a05:6a00:2bb:b029:25d:92b:bf3b with SMTP id
 q27-20020a056a0002bbb029025d092bbf3bmr4694708pfs.52.1619197199276; 
 Fri, 23 Apr 2021 09:59:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6d86:663d:71f8:6a11])
 by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:59:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v5 17/20] drm/panel: panel-simple: Power the panel when
 reading the EDID
Date: Fri, 23 Apr 2021 09:59:03 -0700
Message-Id: <20210423095743.v5.17.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I don't believe that it ever makes sense to read the EDID when a panel
is not powered and the powering on of the panel is the job of
prepare(). Let's make sure that this happens before we try to read the
EDID. We use the pm_runtime functions directly rather than directly
calling the normal prepare() function because the pm_runtime functions
are definitely refcounted whereas it's less clear if the prepare() one
is.

NOTE: I'm not 100% sure how EDID reading was working for folks in the
past, but I can only assume that it was failing on the initial attempt
and then working only later. This patch, presumably, will fix that. If
some panel out there really can read the EDID without powering up and
it's a big advantage to preserve the old behavior we can add a
per-panel flag. It appears that providing the DDC bus to the panel in
the past was somewhat uncommon in any case.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4de33c929a59..a12dfe8b8d90 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -510,12 +510,18 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 
 	/* probe EDID if a DDC bus is available */
 	if (p->ddc) {
-		struct edid *edid = drm_get_edid(connector, p->ddc);
+		struct edid *edid;
 
+		pm_runtime_get_sync(panel->dev);
+
+		edid = drm_get_edid(connector, p->ddc);
 		if (edid) {
 			num += drm_add_edid_modes(connector, edid);
 			kfree(edid);
 		}
+
+		pm_runtime_mark_last_busy(panel->dev);
+		pm_runtime_put_autosuspend(panel->dev);
 	}
 
 	/* add hard-coded panel modes */
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
