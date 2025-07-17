Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E35B0920F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 18:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE9010E855;
	Thu, 17 Jul 2025 16:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="CqXNHvxT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91D410E84E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:41:45 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso1583980b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 09:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752770505; x=1753375305;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
 b=CqXNHvxTgpBMedTA/ZWF9arKRhLPKvdXJ/8pldTTDaryKQWy+YQgfhWANs/9FYiQtr
 X33bVNquzw06riUDuKdlpIElxtjqq/I47lgz0MsVn9b8+tQ826iiGoGfa8ymnyPzPlJ8
 nMGM8IfHQCzbkYaKDsaJy1SmEg+7GSTRFqXl6ca0sfyAxS14qcC1On88+/9CeSbeiDX6
 NEHyj4zr3PGy7Wxil1b2N2mfcz58A9vJwCEaAI6TwyY8SdWa7NbWLju9zPWnR5EHMck5
 L7pfayTzu+CPtV8JnNXS2W/PVFMzg61VKp3Sle4XyLKaZkF1yON+3CXPXao8UeYw4eKi
 QJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752770505; x=1753375305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4rHylqCjx1w2oDPs7/xM2Riq8NSJ9PhhkdUN4+cutX8=;
 b=Aw5kMz9RopFbbqO07iPAxOWNOoh2mEH6t0MpxWG16e1BtCp3O9BYcU7JjsWNnizVCa
 IWabaUerHJX5a7OKQTM3jMQJb90v8b1d0TeRexalwP6TWdIJJ1FjuRC7iKMQM7Sl5nbA
 kcbNAcgrIg/pxLcd/WQiTovIVnnUXB40aybYnmca1bLcEDVA663yp03viR5RBBMDFjHR
 lbuU6q6tzBagOFiK2/QAt0pTsZClElgjKFsGEvqUC6m0fE4oL9lxzITRBnHp0WpSr+k8
 u0/o17DkYcxSrC50dbjYus3J9gz/NZyDOXxoHIZ8eLH46Ix6JtuAhPRaAR2mGgkYDIcD
 QL1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVusB3jKOWuT1GVzNzQI+bGt2WI4wL57C0B/VLsf3zg15Ka2uj3VAmP63woYz6xJ4lHNcrCqA/D3YI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP6YNU1tPulXbkp/lJk/t0AnJtKZcjvcOpagH2pi/M+ia5buLl
 n1MRUsOc65PaLbOjw0gERllrk8lQj7xl/0/5NMAqvTyMgXmFwDVHhbQj7NY3vtMP3rw=
X-Gm-Gg: ASbGncv25qdpHYVP6GefmKeR8U24oFCR1av+52ZCvzxcTqNbLzdQ9YEUBsF45iHV3dr
 wei5KfFOQCH8ZIcLRSTtgp9AGkTACqwJcWDubutEJtQBKi5Ep7lu9YzxlgJiYKLsvjslSx7ZAKA
 P13fwIl6a2H8QVGp/wbU8mV3JfDe9/m1e+YegQv41HbVpt0uGSQjqZf007DXDJuzgKdjcIJfTzI
 Z+XMQG/9tLSn5SJ0mn9aRchOmqKfM+dt1mwNhxh7NiHZL5v7Ej0ggt92PZ4C8A+PrQOsDgvrwMb
 kR5518iQmYBHbLotGNoK10xF2exEGTOsSUzYn/jf//ZaUvhusy7vZ8aWhIf5gHTgBK4Mqk2Er9/
 PMMIN60CrjGt0UZauLZTzr+GtPHrTQJC1vwSkFu5pqfY8ole8sQ==
X-Google-Smtp-Source: AGHT+IHrQlGV1Z7kY2qfK70zL4oggkzABvGWlF/G0WdpxXkZbFgRb1/eSGO9ppbowS9YeBigJnqdWA==
X-Received: by 2002:a17:90b:4985:b0:312:25dd:1c99 with SMTP id
 98e67ed59e1d1-31c9f45e1d0mr10064867a91.19.1752770505309; 
 Thu, 17 Jul 2025 09:41:45 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 09:41:44 -0700 (PDT)
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
Subject: [PATCH v4 4/4] drm: docs: Update task from drm TODO list
Date: Thu, 17 Jul 2025 10:40:52 -0600
Message-ID: <20250717164053.284969-5-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717164053.284969-1-me@brighamcampbell.com>
References: <20250717164053.284969-1-me@brighamcampbell.com>
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

