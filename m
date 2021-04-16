Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A3C362B59
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2BA6ED03;
	Fri, 16 Apr 2021 22:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DFE6ECFA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:41:18 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id h20so14738478plr.4
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3CBaXnhofZGLokcy5GKI7ovd/IyjXTz3GY4vum4+iKE=;
 b=RY9sWPnXQ22UDA7OtbghdHNT21aZAAof29hxLZmb6hl0qDiDEFDBuZNzVjSOZH65/P
 NW5oXgKdIbmRdm9evOGtekxD1IzIb5bDA5Fmem9VOjTClXuXtf3o1P6oF2ovR4Rc1HRz
 qnN7ko1TT0jsz8C3bbsgAhAqtdFxaXjcK/9/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3CBaXnhofZGLokcy5GKI7ovd/IyjXTz3GY4vum4+iKE=;
 b=sqM8xgxB3f5ukWSOZpni3zlQ0CtnaPsW/HAfLsLlh1jVjGAIFLzIaNuHlsvQfgmKcy
 zL4Aza9t4I+vSJXRgWYsiZ3FbWFueVKOfnX5ykmtMVcV7LJ9NQM3hRyX4V/lNWQnHRRt
 dZyG0lIJtjP9Cno/LnCYLulDo0nuLZBjRn7WKFGB3ipamSd+oAi6zotkQFDPf/DtOdwq
 RiT6NQOfsufS/7d03rNWuLZeAlZorpLUe08TxtYJlCh2Ej6Bxjco52NbWsr2sTG0VBMQ
 FMwqj8nBnfdUHagx4tqgUB+pQ9dvzJO3wjtYV54CBUBIZiZGWEU3Aqo0wl9mrSiGzQ0P
 Cbqg==
X-Gm-Message-State: AOAM532Xv9/wWgSOAdlqY9GXuFhks1koE327LW0vzvzh3+PrU1LbU83d
 zlh4DbMWnxHQ1vpAbt91hVxTdg==
X-Google-Smtp-Source: ABdhPJzuekYu017q0WOwn61aSZTq9qM6Vt9uP5gSgkDqcxNAy23/m+0FCgWy1W+/j12tg2B/IgMV/A==
X-Received: by 2002:a17:90a:c281:: with SMTP id
 f1mr11652998pjt.58.1618612878456; 
 Fri, 16 Apr 2021 15:41:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:41:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 23/27] drm/panel: panel-simple: Power the panel when
 reading the EDID
Date: Fri, 16 Apr 2021 15:39:46 -0700
Message-Id: <20210416153909.v4.23.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org
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
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c91e8aa108f7..40382c1be692 100644
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
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
