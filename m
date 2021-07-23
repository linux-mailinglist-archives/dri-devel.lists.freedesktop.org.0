Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B51D03D30CA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 02:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711126F883;
	Fri, 23 Jul 2021 00:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7386F87F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 00:22:14 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id f1so1348900plg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 17:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gWScQ3RoXdLdJS9t+RJN8kdgO9NRWYfVw++Ppk8gyUQ=;
 b=XqCcX4qSfe4fNA6xqHdCXE7WfptpmrsuVLTgFjOiMco81rVjYmUxtJip9IGSAumy3g
 PY/iX0k4asGRdW1+C7Odrq6m1900W/I8qEao9ifYHDajtZ6v8UJqceHNZnyoQApRRfJL
 AlchELWMfPx3fYJN1EkRqZPAOr9sTG5BTSjCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gWScQ3RoXdLdJS9t+RJN8kdgO9NRWYfVw++Ppk8gyUQ=;
 b=XuQxhS6M8riUTpDA9fXk4lrFAgDxsJB1O+m53kZeeFBNpXIv+I+y15WdONKp/rtHui
 tC5xMdD6RpEINk2xLgAf2NEJG3WS+LlnloW2/6CQZoBBxXK8gEI5e/6lMPutGuvbv7bQ
 MHXBAZZRItTKEgy6XUOuu6atin/WZBb2pgk6xEYgvoLKvqtEU5L/ILQxa5u2SNr3yl63
 Hd5f9XLpPPSmBS0dBNaMGVyLAMgv+NxJhuPxYwYltbbgOcaA/0+U/55zSXqOp0Xg1hZL
 cZwlzP1VVp71lzyYhdwpzdZm1SzSmj65nK/Hnv3M3V7Qn8uw6CDaGc1gvLuxzA16izma
 XWYw==
X-Gm-Message-State: AOAM531lVF694QNT+yNfdeD2KTnf5uK0AUFBmOOnOCdrvNGdayAYTHD1
 wHDEHQnnNGTo9taynTCuQ89K1A==
X-Google-Smtp-Source: ABdhPJwHpj2aZr9pdn1A/6Wx4oICGJjmdyIfL+SVJ2uAcEvkUKah5a3ORUThg/UpxLy0oPpE5BTJDA==
X-Received: by 2002:a17:90a:6c61:: with SMTP id
 x88mr11582187pjj.122.1626999734119; 
 Thu, 22 Jul 2021 17:22:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
 by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 17:22:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 4/8] drm/panel-simple: Don't re-read the EDID every time
 we power off the panel
Date: Thu, 22 Jul 2021 17:21:42 -0700
Message-Id: <20210722172104.RFC.4.Ib810fb3bebd0bd6763e4609e1a6764d06064081e@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210723002146.1962910-1-dianders@chromium.org>
References: <20210723002146.1962910-1-dianders@chromium.org>
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
Cc: devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Steev Klimaszewski <steev@kali.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The simple-panel driver is for panels that are not hot-pluggable at
runtime. Let's keep our cached EDID around until driver unload.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b286bd4444f..bcdc84b20827 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -370,9 +370,6 @@ static int panel_simple_suspend(struct device *dev)
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
-	kfree(p->edid);
-	p->edid = NULL;
-
 	return 0;
 }
 
@@ -862,6 +859,9 @@ static int panel_simple_remove(struct device *dev)
 	if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
 		put_device(&panel->ddc->dev);
 
+	kfree(panel->edid);
+	panel->edid = NULL;
+
 	return 0;
 }
 
-- 
2.32.0.432.gabb21c7263-goog

