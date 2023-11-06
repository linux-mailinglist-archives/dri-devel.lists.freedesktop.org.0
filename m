Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBBF7E2E2E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 21:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CF610E3FE;
	Mon,  6 Nov 2023 20:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE3C10E3FA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 20:27:27 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3b2b1af964dso3188470b6e.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 12:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699302446; x=1699907246;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJlE6HDvd5TvSMidl1UF4V7GiD3TUKDPHWop4ycck10=;
 b=YXUgUh2QYqQYMjcUrjvvspguBGZKUsrkPduBCd6qt4ShpXCwNn9nQ5cg1zEV86Nj7U
 3NKs1Ee2k85TuCmFl6jSYoPnTHSkvuEJKil128qnDVVgnjCY6ASDcCS5pmTQmzF+Pbay
 v4P6864GW4iLTCJawbt2DiPujJS6QgwDue984=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699302446; x=1699907246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJlE6HDvd5TvSMidl1UF4V7GiD3TUKDPHWop4ycck10=;
 b=fh52dKJUsvQ8Wcqz3zbDRXQHjlhmHXqUnhxPjeEQLYva8pz3pcq49SHn1mCmgUNenA
 sDLMJv7n5EzYCly+F3BfHRKeauKv5UzQfx2N5DmSUcZ+XBvc3bT92U9hmF7hEg8iSAgE
 K5+O8hzfFu7L3oPUJP+YvZBD2PfuCSinNpLJlTB5aMAdQq+v7NCK6qf8VccitiK6dUza
 U0tXqe/4biYLMaBxsQaPoJzo8UwjUIgM6Z8aNoRCVPEoalYiG280CPcc81HzCL004REM
 B1PcInV4jwQjb7V05JzxCiousFSV/2WwZx6av/p4deh/BpmZlvGD4OqbN0p3yljQKgdR
 86oQ==
X-Gm-Message-State: AOJu0YwW7dcTstxuh9B9lCnicS6KrRErEo8JyLXo6IdSw1NMN9pJynYq
 rwgSPHQsTMsZ3mHXmcQm6QmTYQ==
X-Google-Smtp-Source: AGHT+IHORZrZsA5dLANY/D81cJ/P7A/DV77m6AkT39LNl3opooSdqvw4XiSBztpduAKqkYdXSfyXgA==
X-Received: by 2002:a05:6808:1b14:b0:3a7:2390:3583 with SMTP id
 bx20-20020a0568081b1400b003a723903583mr38346779oib.38.1699302446477; 
 Mon, 06 Nov 2023 12:27:26 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:3374:ff6c:474e:a78])
 by smtp.gmail.com with ESMTPSA id
 fj36-20020a056a003a2400b00689f5940061sm6144150pfb.17.2023.11.06.12.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 12:27:26 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 3/3] drm/panel-edp: Avoid adding multiple preferred modes
Date: Mon,  6 Nov 2023 12:22:50 -0800
Message-ID: <20231106202718.2770821-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231106202718.2770821-1-hsinyi@chromium.org>
References: <20231106202718.2770821-1-hsinyi@chromium.org>
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

If both hard-coded mode and edid exists, only add mode from hard-coded.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2->v3: if hard-coded mode presents, don't add edid mode.
---
 drivers/gpu/drm/panel/panel-edp.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 0fb439b5efb1..54dbbdf62ec0 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -594,8 +594,20 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 				      p->detected_panel != ERR_PTR(-EINVAL) &&
 				      p->detected_panel->override_edid_mode;
 
-	/* probe EDID if a DDC bus is available */
-	if (p->ddc) {
+	/*
+	 * If both edid and hard-coded modes exists, only add hard-coded modes
+	 * to avoid multiple preferred modes.
+	 */
+	if (p->desc->num_timings || p->desc->num_modes) {
+		/*
+		 * Add hard-coded panel modes. Don't call this if there are no
+		 * timings and no modes (the generic edp-panel case) because it
+		 * will clobber the display_info that was already set by
+		 * drm_add_edid_modes().
+		 */
+		num += panel_edp_get_non_edid_modes(p, connector);
+	} else if (p->ddc) {
+		/* probe EDID if a DDC bus is available */
 		pm_runtime_get_sync(panel->dev);
 
 		if (!p->edid)
@@ -617,14 +629,7 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 		pm_runtime_put_autosuspend(panel->dev);
 	}
 
-	/*
-	 * Add hard-coded panel modes. Don't call this if there are no timings
-	 * and no modes (the generic edp-panel case) because it will clobber
-	 * the display_info that was already set by drm_add_edid_modes().
-	 */
-	if (p->desc->num_timings || p->desc->num_modes)
-		num += panel_edp_get_non_edid_modes(p, connector);
-	else if (!num)
+	if (!num)
 		dev_warn(p->base.dev, "No display modes\n");
 
 	/*
-- 
2.42.0.869.gea05f2083d-goog

