Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A05542BE2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9957B10E38F;
	Wed,  8 Jun 2022 09:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD4D10E549
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:48:43 +0000 (UTC)
Received: by mail-vs1-xe2b.google.com with SMTP id 68so19160353vse.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYeDQhf6C4qNcR/ypeqIeNKvzW6/RJ1frKBoLaPHIDU=;
 b=PC2Lf+u82p33uAaLxsXBYJ5HR2k1jQ6H+aVDwMbLLghVBr2zDl0OupdsKQJX49uHlU
 jghqbYWRYx6nQjD4D/zcrT57r9Z1nUyag0neqj0aXKiuTekODbs3teUCdmSgDnmW6Gj4
 HkfsrRM9CHzuMRJnbG3uPkwoM/Cze2d1WnxpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYeDQhf6C4qNcR/ypeqIeNKvzW6/RJ1frKBoLaPHIDU=;
 b=pUapzZ2JX7MK8+QmrlhN+1IMi6x31JMZ9fiApat6VSPX1HEc01+lIdwQBX6ba1CYsu
 ybtvTKQwKcrRKAnfxQBE9ybWawxkMIK9A8S9BLQYkvZeIluDmCE5vwvPiG5MnPO6wuR7
 S9ju7Tc4gMUO1sE3CVQyPZMI0pQeWQ0BUTuQBbhQ/0UARkSDDgOzYyufprj/DzlmZVtc
 TquUA0EdoT2HV0zCzCjbjdwgM9CiTL1/nDO9pHOGSRSLL+7hOk6ddzJi56kFxZQ6OaXJ
 Tezt7iNSzQuPGaq6+T5ZpCmH8xpKndxyflaulpM1PvEQvwAdWh3BvWExXPN8xzalcq5O
 zOSw==
X-Gm-Message-State: AOAM533E4OX87KyT9/Rht3emWrNWeIPw5Nmlf2IUhCBOPp42KDwpdO9b
 OSs7n2z6DuKz4+YW6hT7TMa0Hzta6XSQBA==
X-Google-Smtp-Source: ABdhPJwCus0/AHl/dRscJRgIX7poTraTPgZla5QlFjXvawXiC6yhcifPPOgD8PTJrjHmTVrLJxUjpg==
X-Received: by 2002:a05:6a00:170b:b0:51b:cf4b:9187 with SMTP id
 h11-20020a056a00170b00b0051bcf4b9187mr31051182pfc.15.1654681711868; 
 Wed, 08 Jun 2022 02:48:31 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c46b:e7b1:f6c8:5eb8])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090a950a00b001e28e80a8d6sm13584038pjo.38.2022.06.08.02.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 02:48:31 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 3/8] drm/panel: panel-edp: Implement .get_orientation
 callback
Date: Wed,  8 Jun 2022 17:48:11 +0800
Message-Id: <20220608094816.2898692-4-hsinyi@chromium.org>
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
---
 drivers/gpu/drm/panel/panel-edp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c96014464355..ee622c1dd532 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -586,7 +586,10 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	else if (!num)
 		dev_warn(p->base.dev, "No display modes\n");
 
-	/* set up connector's "panel orientation" property */
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, p->orientation);
 
 	return num;
@@ -609,6 +612,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
 	return p->desc->num_timings;
 }
 
+static enum drm_panel_orientation panel_edp_get_orientation(struct drm_panel *panel)
+{
+	struct panel_edp *p = to_panel_edp(panel);
+
+       return p->orientation;
+}
+
 static int detected_panel_show(struct seq_file *s, void *data)
 {
 	struct drm_panel *panel = s->private;
@@ -637,6 +647,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
 	.prepare = panel_edp_prepare,
 	.enable = panel_edp_enable,
 	.get_modes = panel_edp_get_modes,
+	.get_orientation = panel_edp_get_orientation,
 	.get_timings = panel_edp_get_timings,
 	.debugfs_init = panel_edp_debugfs_init,
 };
-- 
2.36.1.255.ge46751e96f-goog

