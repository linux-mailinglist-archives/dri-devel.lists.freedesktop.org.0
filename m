Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E13542BE0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9701B10E3A9;
	Wed,  8 Jun 2022 09:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB8010E3E1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:48:38 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so17861581pjs.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Kwtqm69tvB7WRggJ5XHn949T/ZlxMDJh6EaE6ZnDiY=;
 b=YiFjyl4RYZQSh2zneOZKlgN1NfU3DRQWkkpcKfqjp4gdEGrKO0TU93MKmu/BaDusgr
 zeN07NEm+R/RJuhTParW40BbEBlEfW6j4KaVcmMe4NVLl7RXkACfADg2vkGqZxj8WJlW
 uaqt6JEDWLB/Ntzjx+fFCaPdezjTpOAfA3lkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Kwtqm69tvB7WRggJ5XHn949T/ZlxMDJh6EaE6ZnDiY=;
 b=UrUbxdA2ydHoe/QKFrmG/qpHbZoe+1kRXi3r8HM9WbJ633+Nc2ip6ziCuSs++BAFg0
 /WPqRJG+DBOB7D2Z3ri/0QltsVy/PQdlkrKDLRdJoJ1VA9oFxGmLW/Ayv/XNqkqam8u3
 n6wU7GAuk1F84N5XEmYagU0HHRp4uw7UhGNENxyGslzNCfBUL2QJ8QQYc/GToxY+TV3O
 iqlQEtfcSoQERZn52ha9TqGM0eXu5qlUoeOjjxe597dmyOONKIljpEskX0AIBCfggQhH
 /zAQKLZMAy3+nTggeIjdKygX1FicbszfmyiPFg++cdBWegkjkhKUPko2k8mUCOS7fUmr
 F7DQ==
X-Gm-Message-State: AOAM530EiaUPtbRQBq4uak4vAeIAJi+mf3GcOsDt48UHi3uBwptfVRvX
 XbTi+9fBQmvaBVYI5XrmEygTZw==
X-Google-Smtp-Source: ABdhPJw8/VjrArS/YwkMwV0jBdv3BkZXAYmdj1+zyPegpaHvf6Ix+84rliKCIlsZqY98UOd6QgTghQ==
X-Received: by 2002:a17:90b:4d0a:b0:1e2:c0b4:8bb8 with SMTP id
 mw10-20020a17090b4d0a00b001e2c0b48bb8mr36934374pjb.94.1654681717995; 
 Wed, 08 Jun 2022 02:48:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c46b:e7b1:f6c8:5eb8])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090a950a00b001e28e80a8d6sm13584038pjo.38.2022.06.08.02.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 02:48:37 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 5/8] drm/panel: panel-simple: Implement .get_orientation
 callback
Date: Wed,  8 Jun 2022 17:48:13 +0800
Message-Id: <20220608094816.2898692-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220608094816.2898692-1-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4a2e580a2f7b..b4b919525189 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -411,7 +411,10 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	/* add hard-coded panel modes */
 	num += panel_simple_get_non_edid_modes(p, connector);
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -434,12 +437,21 @@ static int panel_simple_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
+{
+       struct panel_simple *p = to_panel_simple(panel);
+
+       return p->orientation;
+}
+
+
 static const struct drm_panel_funcs panel_simple_funcs = {
 	.disable = panel_simple_disable,
 	.unprepare = panel_simple_unprepare,
 	.prepare = panel_simple_prepare,
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
+	.get_orientation = panel_simple_get_orientation,
 	.get_timings = panel_simple_get_timings,
 };
 
-- 
2.36.1.255.ge46751e96f-goog

