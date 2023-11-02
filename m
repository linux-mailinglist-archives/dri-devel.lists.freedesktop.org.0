Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD87DFC38
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 23:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A475610E15F;
	Thu,  2 Nov 2023 22:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE2110E15F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 22:13:19 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6be1bc5aa1cso1544761b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 15:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698963199; x=1699567999;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6k2Y92G/jCAECpt6DbXki9hGcN+8cUNHTMZGe3U3vro=;
 b=Obt0Hz4sbEjVvkPL14eXO6NcDW1CHbTAdPQUX78jXzoFm4My8B4xRkxy4N3VDxnItl
 VkZDjNOnELeKo7Sr1/EUA8LaQu2Bwm42SSFoLhQF57Gax2FSTXuipygGLhEG1umJFafK
 3rpcpfsf9pn6mcEJYp3/Oy1J++DiVUm5U7cNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698963199; x=1699567999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6k2Y92G/jCAECpt6DbXki9hGcN+8cUNHTMZGe3U3vro=;
 b=N99euGNCgN/Q+LdRRysnDMlcr6eo4vn+O6Ma0CJjaGImaCnkqzTfx6ieW2Ec93ttPY
 SJhj2q5pMWYDOy3e9C5nvA49tR6Io1hhOCQxTR6io12affi8qjvWCOWCifSvGEo97eU1
 2/xZpm4IEj/opP7vXfMVt9OXcC/KSuu+1c7RG+OBaJhe+A9ktE3K1/lxXYLYjejo/rQt
 q60iqpfPj8/Bl34Kf8Xjzf9Ypm9plc3FsoF+vTfQueFq0UsR6heDoTf46YoRtqjrpOxW
 AsExRFFv4noad9mPXJhlyvl0mkyXEzQEza6bIi8ami1xwPw5Ei5TbrPGw5vVaiARddE8
 EtfQ==
X-Gm-Message-State: AOJu0YyRSxCJ0uhTMUSSqhzecwWNm82b3IybAEgiiemiuxrYjZR8dGRa
 IPFdI6o1rrQkc9SHhHKgwvXsiQ==
X-Google-Smtp-Source: AGHT+IFcKkkz7brh/0hN1MoCPTTUpKInqIB/9LI0IuW8BCu1m1IuUn6xzc+uTlndeCutONBDxOEn2A==
X-Received: by 2002:a05:6a00:2d09:b0:6b6:5ed4:dd42 with SMTP id
 fa9-20020a056a002d0900b006b65ed4dd42mr23406858pfb.31.1698963199539; 
 Thu, 02 Nov 2023 15:13:19 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:6ec1:79de:6e50:d6fa])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a63ce06000000b00565e96d9874sm196057pgf.89.2023.11.02.15.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:13:19 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 4/4] drm/panel-edp: Choose correct preferred mode
Date: Thu,  2 Nov 2023 14:47:50 -0700
Message-ID: <20231102221309.1971910-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231102221309.1971910-1-hsinyi@chromium.org>
References: <20231102221309.1971910-1-hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a non generic edp-panel is under aux-bus, the mode read from edid would
still be selected as preferred and results in multiple preferred modes,
which is ambiguous.

If a hard-coded mode is present, unset the preferred bit of the modes read
from edid.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v1->v2: split patches from drm_modes.
---
 drivers/gpu/drm/panel/panel-edp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 0fb439b5efb1..021322ff9f65 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -622,10 +622,13 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	 * and no modes (the generic edp-panel case) because it will clobber
 	 * the display_info that was already set by drm_add_edid_modes().
 	 */
-	if (p->desc->num_timings || p->desc->num_modes)
+	if (p->desc->num_timings || p->desc->num_modes) {
+		/* hard-coded modes present, unset preferred modes from edid. */
+		drm_mode_unset_preferred_modes(connector);
 		num += panel_edp_get_non_edid_modes(p, connector);
-	else if (!num)
+	} else if (!num) {
 		dev_warn(p->base.dev, "No display modes\n");
+	}
 
 	/*
 	 * TODO: Remove once all drm drivers call
-- 
2.42.0.869.gea05f2083d-goog

