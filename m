Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069048BB61B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F60C1132AC;
	Fri,  3 May 2024 21:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dfwpp6Me";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9221132AB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:38:18 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2b43490e0e2so126765a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772297; x=1715377097;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkS+rg5OKiFoHCGrecPUpnEeRZJMeWyJ+snKafgy5vs=;
 b=dfwpp6MeprmhZkfIeKi1OQln+w4TGicUX5nDsDwLrm54COUzyjwPBM6QBf8wFE/z+F
 0MvjUBo+EoOaza2Ua38YI1Cr8u7hq8oM+iGBCjehcA0uR33QPlme31WiheTEk4SlOQ/s
 rDY6XIYdbh3bwdbXl3IXFY28woRHPHtNwn7o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772297; x=1715377097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkS+rg5OKiFoHCGrecPUpnEeRZJMeWyJ+snKafgy5vs=;
 b=X7S0rudL/r43Ittp2AWBSSVrfbze2HszbE1P1M4wExj/O24wVIv6ro1dt43zY1TXeD
 7Uc4ra7Q0Ftmw+4isKlGqW2Wxo0je9lA71xdY1rxIH9N8AO/Xk7rUaOPiGt2qphdpzUc
 HW7oDQbW0fncAmeW47oQWg2LX1rFezhM9wo40FtmFiWc8lQ6YFeTAmqtKDd+suENxijH
 amlyWrUbw72yrMI+w3KU86XaEdB6RroKyxdir9jJ0VzeEMziVn9uyJ5XFFplP7E4dOGr
 kWJfKoOKaxcp/GfxXj5t4s9zJoBOTyMwZAxc3XVsW0Fae5CARRg5C7za2a8ZQeHhRPmq
 uxCw==
X-Gm-Message-State: AOJu0Yw/olqiFBnroMigdCHqL95kzF41xYl2KRMlRPF3tapS81vDlm1/
 PrsMJJNAfVP6pjZRpCTRwFTv4aXu42qU+emRB9mLmqabNFMUu9lYGUU5Xhj69kkfaKmowWLZWqG
 yqg==
X-Google-Smtp-Source: AGHT+IHkW28tWyRIV7NmgOtGvUD0tFuJ+wrkeXjluxHwAroLQKxUR2uvyN5Qr5JmQy9q9YdYC6JW1Q==
X-Received: by 2002:a17:90a:6081:b0:2a2:8ed7:da34 with SMTP id
 z1-20020a17090a608100b002a28ed7da34mr3992252pji.1.1714772297001; 
 Fri, 03 May 2024 14:38:17 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:38:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 48/48] drm/panel: Update TODO list item for cleaning up
 prepared/enabled tracking
Date: Fri,  3 May 2024 14:33:29 -0700
Message-ID: <20240503143327.RFT.v2.48.I104cdece7324b0c365e552a17f9883414ffaea01@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 Documentation/gpu/todo.rst | 47 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index e2a0585915b3..4063bc45bbd3 100644
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
 
 
 Core refactorings
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

