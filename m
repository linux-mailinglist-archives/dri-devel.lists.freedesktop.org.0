Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BAB53A11A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0610F10EB1F;
	Wed,  1 Jun 2022 09:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE30D10EB4B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:46:54 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d22so1285305plr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZBqJiw5iICb15XSMEIziFVB5wuNumdiuBxaQCMR6NjU=;
 b=AQSKii1jvRtBpq0Lrpj8ovAJqJPE2589nykaQe03mHf8JaCrY3Z4O1XawIEbsR/4UU
 PxLNY93/gtlAHrORYa+QAoX+Tb6aPH+1e2spp2tc7pfScCEf8S8gOf1+2pzvef6Lvi4o
 Vs3SdULDuc7uOWfaH/zRnk8xF0Wbjb+VseM+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZBqJiw5iICb15XSMEIziFVB5wuNumdiuBxaQCMR6NjU=;
 b=z3jztIqHVV4e3+uzHfRj73YWb/18kK28GoLZqDOhRJ/lzfLpVGNrr6RO45YWH+X/8y
 nG+2okl5Be8LvnR+dcD2dSiz8R/W5OoY1+1tVgQsQw+9wrZVrq7149lKnYAmxrYvMt4s
 MV9XS7h68Kd7CkKZ/DF2P/z/t+BKM3vZt5O7Mw6BYwxKd9OQJeQYYdVoJ4OibUQ+3naL
 fxVyw67Ex3qtSCDhPN8OUMMdaMCQ+GJT/mqS00sOnc+FMf7RecmRBea/iDTQX54w2T0l
 c6zL1eIWm56WVQd/M4p+NdhXxx53dgPlhQaVDFmv6u2N6cKCVNe9Mn0bcqS6cE15LVam
 MdhQ==
X-Gm-Message-State: AOAM530xM75o8AtNRK6iBp7eaJdRB0K5iDyPOD9VPhBLe024LQ03KB0g
 s8HBjIqv3pC+DXDVTCrA/qkhGg==
X-Google-Smtp-Source: ABdhPJw72ka+6aqP/KnDSsfh0kJMmqQ6I49pRZC2aCEKoh72sgZsPQ9ORjmrG0OhkVOV4FFUNg74Gg==
X-Received: by 2002:a17:90a:6308:b0:1de:fb6c:5944 with SMTP id
 e8-20020a17090a630800b001defb6c5944mr33599246pjj.60.1654076814431; 
 Wed, 01 Jun 2022 02:46:54 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
 by smtp.gmail.com with ESMTPSA id
 x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:46:54 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2 3/8] drm/panel: panel-edp: Implement .get_orientation
 callback
Date: Wed,  1 Jun 2022 17:46:32 +0800
Message-Id: <20220601094637.1200634-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601094637.1200634-1-hsinyi@chromium.org>
References: <20220601094637.1200634-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To return the orientation property to drm/kms driver.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 1732b4f56e38..a2133581a72d 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -609,6 +609,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
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
@@ -637,6 +644,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
 	.prepare = panel_edp_prepare,
 	.enable = panel_edp_enable,
 	.get_modes = panel_edp_get_modes,
+	.get_orientation = panel_edp_get_orientation,
 	.get_timings = panel_edp_get_timings,
 	.debugfs_init = panel_edp_debugfs_init,
 };
-- 
2.36.1.255.ge46751e96f-goog

