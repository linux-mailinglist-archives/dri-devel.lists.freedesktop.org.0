Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85338FC085
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 02:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E3310E658;
	Wed,  5 Jun 2024 00:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GBBjjlkc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F61B10E657
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 00:25:06 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1f44b42d1caso47922515ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 17:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717547105; x=1718151905;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vlZTq3P9ASgfMnpyKeb65Qgki+yiSpyIBUooUCR0W14=;
 b=GBBjjlkcB7GtC6vwDeuHgfPV1hD1EcMQ45+kISe2VemkgXc7FvHC8NJ5yPO3QWuLJR
 iLHaSD9Ubw0FmBWk0cSU97btsZQaWqHN8RmoPoYyg6vwqU8uYdQifF7s+qzzOHxYXiq2
 +XngS7rs93Ns7vOI8q8i8aelwj8GT/KzQgH60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717547105; x=1718151905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vlZTq3P9ASgfMnpyKeb65Qgki+yiSpyIBUooUCR0W14=;
 b=HacWhM/LK9pcJRWPTBe/ZdssyYxqhBLtBLXdxQQEI/7BD3DAjSpwV82p7hvTcVS+Uy
 2nFjEQHG4jM6v/VhBisx1LztdDhEhNc+4yVqMSWMk1P/hZ+or6WL0mpH6OLcR+wyzk6m
 SRLORSgIO7o+OK/nsfQdFwRE7KQblj/idzD72+06iW0iEbyq0cxzGoUiO6hjixrcQOfb
 9xyqey7TvkU2TssEczIJmRWG0SvBvlYf98DuKKteybtaY3W7C1gXHTqFSBgQu8WG51Ao
 SKXKPxWPi74giqjxcTyVITbtJBPZ0LWudXLlcVcHBGLM4YRZDxuNB6+u+st4BR8zYKlP
 ub1A==
X-Gm-Message-State: AOJu0YxQbJC2FMdNFX6aGct0YKWXn6FTT50h15oGBCc9sfZ0l5EIkdzm
 ivGDTwWIfPkCWm7L6lfEwgH3wVLH1aWURqhn3A3IwnggEf9mSDbpT1jPOnZb6YI84WGSZJ2wF5U
 =
X-Google-Smtp-Source: AGHT+IHCl9HTHlC9W7JWoyZsGp761gmkTX3Uui28lis3mNrYBsiyHkfuCERpgY42hnsZKMYFoOJAWQ==
X-Received: by 2002:a17:902:ecc3:b0:1f4:8e97:de25 with SMTP id
 d9443c01a7336-1f6a5a6aba7mr12326755ad.44.1717547104998; 
 Tue, 04 Jun 2024 17:25:04 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:3609:ff79:4625:8a71])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 17:25:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/24] drm/panel: Update TODO list item for cleaning up
 prepared/enabled tracking
Date: Tue,  4 Jun 2024 17:23:09 -0700
Message-ID: <20240604172305.v3.23.I104cdece7324b0c365e552a17f9883414ffaea01@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
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

Now that most panels have been updated not to track/double-check their
prepared/enabled state update the TODO with next steps.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 Documentation/gpu/todo.rst | 47 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 2734b8a34541..2ea6ffc9b22b 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -469,30 +469,35 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Starter
 
-Clean up checks for already prepared/enabled in panels
-------------------------------------------------------
-
-In a whole pile of panel drivers, we have code to make the
-prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
-been called. To get some idea of the duplicated code, try::
-
-  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
-  git grep 'if.*>enabled' -- drivers/gpu/drm/panel
-
-In the patch ("drm/panel: Check for already prepared/enabled in drm_panel")
-we've moved this check to the core. Now we can most definitely remove the
-check from the individual panels and save a pile of code.
-
-In adition to removing the check from the individual panels, it is believed
-that even the core shouldn't need this check and that should be considered
-an error if other code ever relies on this check. The check in the core
-currently prints a warning whenever something is relying on this check with
-dev_warn(). After a little while, we likely want to promote this to a
-WARN(1) to help encourage folks not to rely on this behavior.
+Remove disable/unprepare in remove/shutdown in panel-simple and panel-edp
+-------------------------------------------------------------------------
+
+As of commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
+drm_panel"), we have a check in the drm_panel core to make sure nobody
+double-calls prepare/enable/disable/unprepare. Eventually that should probably
+be turned into a WARN_ON() or somehow made louder, but right now we actually
+expect it to trigger and so we don't want it to be too loud.
+
+Specifically, that warning will trigger for panel-edp and panel-simple at
+shutdown time because those panels hardcode a call to drm_panel_disable()
+and drm_panel_unprepare() at shutdown and remove time that they call regardless
+of panel state. On systems with a properly coded DRM modeset driver that
+calls drm_atomic_helper_shutdown() this is pretty much guaranteed to cause
+the warning to fire.
+
+Unfortunately we can't safely remove the calls in panel-edp and panel-simple
+until we're sure that all DRM modeset drivers that are used with those panels
+properly call drm_atomic_helper_shutdown(). This TODO item is to validate
+that all DRM modeset drivers used with panel-edp and panel-simple properly
+call drm_atomic_helper_shutdown() and then remove the calls to
+disable/unprepare from those panels. Alternatively, this TODO item could be
+removed by convincing stakeholders that those calls are fine and downgrading
+the error message in drm_panel_disable() / drm_panel_unprepare() to a
+debug-level message.
 
 Contact: Douglas Anderson <dianders@chromium.org>
 
-Level: Starter/Intermediate
+Level: Intermediate
 
 Transition away from using mipi_dsi_*_write_seq()
 -------------------------------------------------
-- 
2.45.1.288.g0e0cd299f1-goog

