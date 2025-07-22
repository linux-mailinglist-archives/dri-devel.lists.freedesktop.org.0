Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161CB0CF66
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 03:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D635810E5CC;
	Tue, 22 Jul 2025 01:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Eh4P6E0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C81C10E5CE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 01:53:28 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-749248d06faso4192031b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 18:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753149208; x=1753754008;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
 b=Eh4P6E0MzsOyr++hxHVCfGtdEsG7OWzg6a+K00fMBh5PGp8JK31B4QTJQVrFWseE1V
 /XDYTf9vyrxex53LhIE7s6Z/n2J0g9NJPpcgFc1T1jJmJo2VvujS9TsHxJIHwrh76yeh
 0zlHNE3HZo6igGkJYR7YobPDsVQglDSV/wqr1LVq7wR5mwNi83rBNz6cx0AkV5CmaZ7C
 69kBresI++M084lnXYiouVCfb70Yh9HUSfBlowXIcd6pcRQ4B6OAO8gMIu7bxe2pWkyZ
 qtNOIzR89MsNOWXEZ5jZ4ihQ/LVwVQgfaI12xJRB0g0LTn+LjF0DSlu894jFHQOjmTVc
 DIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753149208; x=1753754008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
 b=g53pNsYCxOOzOD8uVx+PyvaCkF+I43skoQ2I1s24EsgJ0EaiOAbVK9Wkq0J2d3JQsV
 qaeyEy8rW1YjGt2LqOywk1rlFv9I0oBDks4o/sJ/z+0tAt2BMv1jHD4LMgMh3OqQjsU9
 48I2lcgtYdLvF+3AY5BP8WZgCOP1ccpVBGalma/TvKPK1TkWywwBvawpS3wA35Tg6MZr
 k46APNwZTA/y/A11LgSvZDyyktrVTaFRNWb2pe2Cdp7VLFVfbw7mZ5ind3M8WRQ8t0DZ
 GubrW7TpCRCQZXdl9yGUT0b/GWpXJb/0UQ5WKsbjGyqY+TjJERwaFqlaXMKfkwp9vnz0
 5PdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMbiML5jyDMQL0PWUveY//xUZCufZD2M/mG2BDdXOtuIDJ7HiVL0je7rKmo18zNGt+/P1Tleakqg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzROV9aHtBkCxKvTQjtmXyPrwHT+uvH5kD9lxI2ADL6Vch65i5e
 z1gNB4zM6dNnKjBeXo4XVwLx/qXsFgfAkEiYkfeeXY4yd1Ea9cfNGAQBhNpHddt1k80=
X-Gm-Gg: ASbGncs3WFuYTD++zMsQOl3uuWyQ5Ud1HKRSvWRH09sc0QH2VGp4bisdjFNlm6fLEi/
 IbLzDrSXNfITAmhAfE220MNBuzbbkkJAqSbnecjQo9xJ6UePav2wAAdHNO8RT8sIPLLI8dvt8OF
 pImS4wcRiu/uZrahaum9u4REVzemLfLKvaNw4m9iiWg1MJHZ3scd7f/m+MxTHS2dpIhAq25FSKn
 EAl1RMvU8chRSrhsSLDPdAdqJNiC2t0Of4q0GYDMuoVZYWbO1+gNNGsOC7/BC5ZPyu/zc/7RBqL
 wHLo1x+xKu2rkVSo5cHHym9of47HdENu/UpFVg34TDDX8lIdVRu+Sb1XwDU4MuKqTQk0qAWWSKs
 81u/O+m315XJM9FhuHNbX1lnF49ZAKjRp+utOqywspVGt7rqxgA==
X-Google-Smtp-Source: AGHT+IE6DV4AnVW0+4Gsag1rZoVLI3l8Jq88LM8p0J3ZdDdDROI+eXGNgt3ap9Wn8cOMjGOum41DxA==
X-Received: by 2002:a05:6a00:2e0d:b0:740:67aa:94ab with SMTP id
 d2e1a72fcca58-758462d74b4mr25646084b3a.0.1753149207483; 
 Mon, 21 Jul 2025 18:53:27 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe62d9fsm6017441a12.1.2025.07.21.18.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 18:53:27 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v6 4/4] drm: docs: Update task from drm TODO list
Date: Mon, 21 Jul 2025 19:53:11 -0600
Message-ID: <20250722015313.561966-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722015313.561966-1-me@brighamcampbell.com>
References: <20250722015313.561966-1-me@brighamcampbell.com>
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

Update TODO item from drm documentation to contain more applicable
information regarding the removal of deprecated MIPI DSI functions and
no longer reference functions which have already been removed from the
kernel.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/gpu/todo.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index be8637da3fe9..92db80793bba 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -497,19 +497,19 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Intermediate
 
-Transition away from using mipi_dsi_*_write_seq()
--------------------------------------------------
+Transition away from using deprecated MIPI DSI functions
+--------------------------------------------------------
 
-The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
-non-intuitive because, if there are errors, they return out of the *caller's*
-function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
-and mipi_dsi_dcs_write_seq_multi() macros instead.
+There are many functions defined in ``drm_mipi_dsi.c`` which have been
+deprecated. Each deprecated function was deprecated in favor of its `multi`
+variant (e.g. `mipi_dsi_generic_write()` and `mipi_dsi_generic_write_multi()`).
+The `multi` variant of a function includes improved error handling and logic
+which makes it more convenient to make several calls in a row, as most MIPI
+drivers do.
 
-Once all callers are transitioned, the macros and the functions that they call,
-mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
-probably be removed. Alternatively, if people feel like the _multi() variants
-are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
-variants but change them not to return out of the caller.
+Drivers should be updated to use undeprecated functions. Once all usages of the
+deprecated MIPI DSI functions have been removed, their definitions may be
+removed from ``drm_mipi_dsi.c``.
 
 Contact: Douglas Anderson <dianders@chromium.org>
 
-- 
2.50.1

