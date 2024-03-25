Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2864788B344
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 22:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979EC10EB2C;
	Mon, 25 Mar 2024 21:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="KoPTLsLi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C36110EB15
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 21:57:00 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-5dca1efad59so2841868a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711403819; x=1712008619;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bVuVcBwYjbmIMugv7i5Wq0OqJpJ+55dldjg1iRzEkE=;
 b=KoPTLsLieUnAlpkNnmGKj4Qf4iwUyfLQ6v4q88KTEOrPMbixEdjKkdYcNLrAePNDdh
 jbyLjhjbWXF0TKmGJ/qHBXMjIZHT/dBclwjAdq3KYfwTLfsZz9Kbw9H03BgdLXMpIMn4
 NMaRe8RZWMxzeDakyBrUBfT4yNPS6wThQe+h8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711403819; x=1712008619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5bVuVcBwYjbmIMugv7i5Wq0OqJpJ+55dldjg1iRzEkE=;
 b=cRsHiTU9cqunESBqdLcuU8e0ywBIHSxmq8KSkXY+skTGIgxPNsoRya7tfUoOsmC3Xw
 3i1+prKAeKsfbMMGJT1vOn+HMJqZAk9bGYSI0TAKFPJxeBawW6fqFV+wwPBsVOxni2pZ
 ISIljZVSKyU2XQS727CzKwBsj/Wcj1r6HXrVrm++4NjqDHbKhvdCCuMv2MvaZRcS2AUC
 7Iuqq/c2qTeMRayugFs2iAPGiKGOZCTUiup8iGXdWXv0Ndw6+ZLuA3OKpfYPfjb8k5pM
 8muBxJjNRS/K93kkZ0tPQY5m45+jkHJ8/ascQLP2fgxt8k2Foi6X+ex7yjxZM+quyBc4
 SK+Q==
X-Gm-Message-State: AOJu0Yz9evuppfP9u/TfV0UUiEj9PSn4aIQS+RGuojNVga2AHKEzSvhf
 aNqgEVNMZ2j3VhDMfusQ+/XX7kS11rIvFktaV6AC41bZPv81d2SuYsgY7YbV64QFOc095t001nU
 =
X-Google-Smtp-Source: AGHT+IFeEjtB0EjG3yoGX3VoRn27+gcFHG2pO1/kdc6fNCLKOImMjn5d9qKrY7U83VyykAGWyY6r3Q==
X-Received: by 2002:a17:902:eb8d:b0:1e0:10c1:6288 with SMTP id
 q13-20020a170902eb8d00b001e010c16288mr7281408plg.51.1711403819205; 
 Mon, 25 Mar 2024 14:56:59 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:f21b:7dde:93cc:b987])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a170902e54600b001def0897284sm5207866plf.76.2024.03.25.14.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 14:56:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Pin-yen Lin <treapking@chromium.org>,
 Prahlad Kilambi <prahladk@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/panel-edp: Abstract out function to set conservative
 timings
Date: Mon, 25 Mar 2024 14:56:25 -0700
Message-ID: <20240325145626.1.I659b2517d9f619d09e804e071591ecab76335dfb@changeid>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240325215631.3804796-1-dianders@chromium.org>
References: <20240325215631.3804796-1-dianders@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we're using the generic "edp-panel" compatible string and we fail
to detect an eDP panel then we fall back to conservative timings for
powering up and powering down the panel. Abstract out the function for
setting these timings so it can be used in future patches.

No functional change expected--just code movement.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 40 +++++++++++++++----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index c4f851200aa2..8a19fea90ddf 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -760,6 +760,25 @@ static void panel_edp_parse_panel_timing_node(struct device *dev,
 
 static const struct edp_panel_entry *find_edp_panel(u32 panel_id, const struct drm_edid *edid);
 
+static void panel_edp_set_conservative_timings(struct panel_edp *panel, struct panel_desc *desc)
+{
+	/*
+	 * It's highly likely that the panel will work if we use very
+	 * conservative timings, so let's do that.
+	 *
+	 * Nearly all panels have a "unprepare" delay of 500 ms though
+	 * there are a few with 1000. Let's stick 2000 in just to be
+	 * super conservative.
+	 *
+	 * An "enable" delay of 80 ms seems the most common, but we'll
+	 * throw in 200 ms to be safe.
+	 */
+	desc->delay.unprepare = 2000;
+	desc->delay.enable = 200;
+
+	panel->detected_panel = ERR_PTR(-EINVAL);
+}
+
 static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 {
 	struct panel_desc *desc;
@@ -816,26 +835,7 @@ static int generic_edp_panel_probe(struct device *dev, struct panel_edp *panel)
 		dev_warn(dev,
 			 "Unknown panel %s %#06x, using conservative timings\n",
 			 vend, product_id);
-
-		/*
-		 * It's highly likely that the panel will work if we use very
-		 * conservative timings, so let's do that. We already know that
-		 * the HPD-related delays must have worked since we got this
-		 * far, so we really just need the "unprepare" / "enable"
-		 * delays. We don't need "prepare_to_enable" since that
-		 * overlaps the "enable" delay anyway.
-		 *
-		 * Nearly all panels have a "unprepare" delay of 500 ms though
-		 * there are a few with 1000. Let's stick 2000 in just to be
-		 * super conservative.
-		 *
-		 * An "enable" delay of 80 ms seems the most common, but we'll
-		 * throw in 200 ms to be safe.
-		 */
-		desc->delay.unprepare = 2000;
-		desc->delay.enable = 200;
-
-		panel->detected_panel = ERR_PTR(-EINVAL);
+		panel_edp_set_conservative_timings(panel, desc);
 	} else {
 		dev_info(dev, "Detected %s %s (%#06x)\n",
 			 vend, panel->detected_panel->ident.name, product_id);
-- 
2.44.0.396.g6e790dbe36-goog

