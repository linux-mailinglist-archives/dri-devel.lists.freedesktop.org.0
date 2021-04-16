Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AAA362B55
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 00:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF8E6ED02;
	Fri, 16 Apr 2021 22:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA5AC6ECFA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 22:41:19 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id u7so12920834plr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 15:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7uYaRXTJ9SzjKPinVOIa28yrACdd5IDUsRVEw7A47h4=;
 b=Nbw4sDF5xEN+X83f92ecl+/EPhWBNbObado3b9Jjiv2edeJw1nN2spoXZY4Y96pgIX
 qhaSuqrOV0w90yWzwCoAEHXY7pZWnYCRu6FjP/qDh4ciu5IHRJ4B3JSUKcsX4u5nDG2q
 uX42NRCRihbgjYl+eeM8yacOQVWwPUtyB5cKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7uYaRXTJ9SzjKPinVOIa28yrACdd5IDUsRVEw7A47h4=;
 b=GTrtgL2qN9xUJv2v2bhcBLxS6Xpu8ACsijb6vxBP4hn1pNLA9lao2bbUPto0PqujGK
 eVei8lk0skiKWar9FtfoYPeacDQel8bZ9NaP5sJ+aRXx+UNa8Zo79uL2jExgLwsw1xRg
 uOhlssY+bZi9rKdT/mY3oe6AaAYTfFILFZ0CkNv7hcIb2aCdJv+vLh7hBHWXdTneMDCy
 8EDRj1f0nnQXVRXfSKXwqNFD4vrHC9/rV+OfCnQ87+7q3gF6ja4JjXVnW7kFGnie6hb/
 q1NlBbrKufRXo8wJ7tmg0Mxt7pQHl4UJf9sKmX2wS1VFOKSnRqcXNW3RhS/FwvMxBQ93
 SHtw==
X-Gm-Message-State: AOAM532u1S14W9vc0GmDQ1aDCiRprXbajOGGXrKMmIC9L/ELwF4Dm1vA
 b50FKykpveSPoxWewXO6zpfoWA==
X-Google-Smtp-Source: ABdhPJweffa8csxEuLym54xIiGWDrpRtoZP1G8Yw7KMaqPmglHVlQGjo6oV1pRzh8WSUnopwMlc62Q==
X-Received: by 2002:a17:90a:8a0e:: with SMTP id
 w14mr11627576pjn.221.1618612879486; 
 Fri, 16 Apr 2021 15:41:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
 by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 15:41:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v4 24/27] drm/panel: panel-simple: Cache the EDID as long as
 we retain power
Date: Fri, 16 Apr 2021 15:39:47 -0700
Message-Id: <20210416153909.v4.24.If050957eaa85cf45b10bcf61e6f7fa61c9750ebf@changeid>
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

It doesn't make sense to go out to the bus and read the EDID over and
over again. Let's cache it and throw away the cache when we turn power
off from the panel. Autosuspend means that even if there are several
calls to read the EDID before we officially turn the power on then we
should get good use out of this cache.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 40382c1be692..5a2953c4ca44 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -189,6 +189,8 @@ struct panel_simple {
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *hpd_gpio;
 
+	struct edid *edid;
+
 	struct drm_display_mode override_mode;
 
 	enum drm_panel_orientation orientation;
@@ -345,6 +347,9 @@ static int panel_simple_suspend(struct device *dev)
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
+	kfree(p->edid);
+	p->edid = NULL;
+
 	return 0;
 }
 
@@ -510,15 +515,13 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 
 	/* probe EDID if a DDC bus is available */
 	if (p->ddc) {
-		struct edid *edid;
-
 		pm_runtime_get_sync(panel->dev);
 
-		edid = drm_get_edid(connector, p->ddc);
-		if (edid) {
-			num += drm_add_edid_modes(connector, edid);
-			kfree(edid);
-		}
+		if (!p->edid)
+			p->edid = drm_get_edid(connector, p->ddc);
+
+		if (p->edid)
+			num += drm_add_edid_modes(connector, p->edid);
 
 		pm_runtime_mark_last_busy(panel->dev);
 		pm_runtime_put_autosuspend(panel->dev);
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
