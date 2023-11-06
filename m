Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328F7E2E94
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 22:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C55210E41B;
	Mon,  6 Nov 2023 21:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4076210E41F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 21:03:44 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2809a824bbbso3666035a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 13:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699304624; x=1699909424;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7kMz5bDbNmGy2pUD82uFFbL5daLBA/vsaP69IFKgup4=;
 b=jniWG4/OT8hhBiOiHu6/WNs/ixiqWMfxj6ZphM9lFEBpPOj7N0aablrqS7//FlzGxf
 bNTXbYhAeGM/2SHOfdi/7T/RK9UEoQpQzFJvUP+LlrkVCcAd5VCwsu137a8MaBy5j75n
 0pd/f0wpLcfXNMbMUQn61h1H0hRRRyUhYR4bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699304624; x=1699909424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7kMz5bDbNmGy2pUD82uFFbL5daLBA/vsaP69IFKgup4=;
 b=vJkJbmzsnwVi8Kv3xPbWOTt7b7wHL0e+ERmCvCUj6C5lWnQFw9hfj0oYdoDjOiNByx
 ze9nAvbHteNl/gf8SYPsYSQGjNQEm6Krl63BxiuDHNP4ZP2wMxq/wYPIvaz0wEd/68CR
 /6E/HUjsuO0qGArb4pQZiG3QfDQsJUyQFIQqFgDPVwVJgjdej0eKVLvXrV7OrZId9jwT
 LsNgujO0U0o4K27LOmBKIZoebecAa2fe9Pyg6mKt3KfOzAxsiUMiTzEEbspOrIH7p+u2
 mKd805RZof9MuJ6tuZfvqEp71m29T919jTQIyKQNzyKQhPozK492khPPKvkrm/iJIOsw
 WAUw==
X-Gm-Message-State: AOJu0YyK1Svny0dPa1O3bfiPO4bhIM+zYGqn1b1AcUNg8afg/76C+AIE
 36C/FPKqeDIaWMJgTA++p3nVfQ==
X-Google-Smtp-Source: AGHT+IEkWl9k5SAj8xLAUFrAxgucK+63CpEdIfXgMDfEcYRDMLt8uvfDT+d+MntyPAZQDi9dGqzUsQ==
X-Received: by 2002:a17:90a:1a03:b0:280:f4a:86b4 with SMTP id
 3-20020a17090a1a0300b002800f4a86b4mr23561724pjk.17.1699304623756; 
 Mon, 06 Nov 2023 13:03:43 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:3374:ff6c:474e:a78])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170902c14b00b001c75a07f62esm6291220plj.34.2023.11.06.13.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 13:03:43 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 3/3] drm/panel-edp: Avoid adding multiple preferred modes
Date: Mon,  6 Nov 2023 13:00:52 -0800
Message-ID: <20231106210337.2900034-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231106210337.2900034-1-hsinyi@chromium.org>
References: <20231106210337.2900034-1-hsinyi@chromium.org>
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
v3->v4: don't skip read edid. only skip add modes.
---
 drivers/gpu/drm/panel/panel-edp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 0fb439b5efb1..c8bb4baf1d45 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -590,6 +590,7 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 {
 	struct panel_edp *p = to_panel_edp(panel);
 	int num = 0;
+	bool has_hard_coded_modes = p->desc->num_timings || p->desc->num_modes;
 	bool has_override_edid_mode = p->detected_panel &&
 				      p->detected_panel != ERR_PTR(-EINVAL) &&
 				      p->detected_panel->override_edid_mode;
@@ -600,7 +601,11 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 
 		if (!p->edid)
 			p->edid = drm_get_edid(connector, p->ddc);
-		if (p->edid) {
+		/*
+		 * If both edid and hard-coded modes exists, skip edid modes to
+		 * avoid multiple preferred modes.
+		 */
+		if (p->edid && !has_hard_coded_modes) {
 			if (has_override_edid_mode) {
 				/*
 				 * override_edid_mode is specified. Use
@@ -622,7 +627,7 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	 * and no modes (the generic edp-panel case) because it will clobber
 	 * the display_info that was already set by drm_add_edid_modes().
 	 */
-	if (p->desc->num_timings || p->desc->num_modes)
+	if (has_hard_coded_modes)
 		num += panel_edp_get_non_edid_modes(p, connector);
 	else if (!num)
 		dev_warn(p->base.dev, "No display modes\n");
-- 
2.42.0.869.gea05f2083d-goog

