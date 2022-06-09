Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA05444C4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C07B10F93C;
	Thu,  9 Jun 2022 07:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE96510F93C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:27:47 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id e66so21059093pgc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/3gA/gCwNifa063k5zO2io8sIa7XPaHVQ/76HnmkOsg=;
 b=NMwQPNA8GcvOzDm4isJzui7YhPgnhg1xX3kh0UaVTH2jfU4mkwDoRC0quvFK4/QecR
 arfnWRpveJ0pUy0K4Zn7eItprSorYSdiUF0DxIYSzy+sPVzUfh/4UU+9GQWFSrnbBwol
 4dws/dn+SgtfP55mhYaY5yVIN0hIRkMuNotpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/3gA/gCwNifa063k5zO2io8sIa7XPaHVQ/76HnmkOsg=;
 b=ol/Re7YKjJn3Mq3uVM6J6aSVna/uah28EzS55r3p8plkRk/dLvP7vTEko7ULmbjzUK
 dVaXok28RWCCT90/WFrkX9jrow8uSIXq/S28gWnkFRYotL6O46bir0mU6ivVYwbyFZp7
 pZf51wgIw/sgz25nz8WUUiHJWWv5ClEoB7/A7/arlbakXFFZcCsrAp7rbj8ihCAAMSW6
 71tOTvLAfE0JZ+wL2l+9zUIgLs9AXdegj6bBxPRwVB1TKRPAdZopyB1VLxtnh/2BzN/u
 Qli7ndjiuOO2sysibv5LpwEZI7gFmgiNF8div+wQ4ikwY62Xa1aXK2/LPJ8mi+hGg6LM
 iyZg==
X-Gm-Message-State: AOAM533bD6mUXkIDxrKMT5jsQ/OnIB249RG4I1hFtmIh82MWrO9tbcJE
 wRlNaB1C2EuNJGPJcjjGfVC1sw==
X-Google-Smtp-Source: ABdhPJxNBX/FBxOUBMeGOirfu/EQZDMrKKnPoYbe2fo82dpTd1VenDY+rtKnkXplac6gWM5VzUu+0Q==
X-Received: by 2002:a05:6a00:15d3:b0:51c:1a20:f8d8 with SMTP id
 o19-20020a056a0015d300b0051c1a20f8d8mr19746114pfu.57.1654759667464; 
 Thu, 09 Jun 2022 00:27:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5119:d95b:c6cd:77fb])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a1709027ed000b0016403cae7desm15312221plb.276.2022.06.09.00.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 00:27:47 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v7 3/8] drm/panel: panel-edp: Implement .get_orientation
 callback
Date: Thu,  9 Jun 2022 15:27:17 +0800
Message-Id: <20220609072722.3488207-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220609072722.3488207-1-hsinyi@chromium.org>
References: <20220609072722.3488207-1-hsinyi@chromium.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c96014464355c..ee622c1dd5322 100644
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

