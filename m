Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A7A1C1B6
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF3010EAAA;
	Sat, 25 Jan 2025 06:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nc5DZJqV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BB910EA96;
 Sat, 25 Jan 2025 06:47:43 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3cfc8772469so5195275ab.3; 
 Fri, 24 Jan 2025 22:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787663; x=1738392463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zMxBeI+ZLf9yVYG2cFYc0qaCJ8NkAf6XlTFRcgZVjQg=;
 b=Nc5DZJqVpsUnMc74Fh4s7hw8qRwTK/UZZGzD2NqzIf8YrVIEF1/7ZLM4+YB7whkvqk
 IRjJzj3kL45n+EsFf7xgeSoErjeTk8Qlvg/et8y+mc2V5OVT62KIUdo8h7pUqhg5Yq6q
 ll/c1kvOC0ugTmPnr1aky/Gn7eHhPLYQSfJ1RkM0wuw6PShozlFYalOpzeH7yq/RGudF
 HVyw0yqad9fZE2SfzPwtsWCHjcTOfVdg3EWNsEZWHpv8xbgcBBTKsuBI6mtWXd8j8O4B
 DB1UjVH0XVz55BYS7KhVBjqGb2fxmKZABVPPZPa9bce64RvtjlnSh69wa7yd8l4EBIlG
 cvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787663; x=1738392463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zMxBeI+ZLf9yVYG2cFYc0qaCJ8NkAf6XlTFRcgZVjQg=;
 b=I+12QpUzNN0qlAhmF2dmcerVLxC58fLT8cPCcjoN8uay1E4C6o6iFKBAZYgP+awvwk
 j/85UPYmBXZVRYma4euiiEBC/0RcSCt54LvmsCKGHBJXcCycwwBO3BaNQcE27YdbMnEQ
 m877OiRT7g0ka4ZfHtfcOiPtyVrtsGQ0A0lIPXXWfvVC30hp8LMIG+NpPwhIZk3ZrKnW
 1s438E/FO7SLnMz0AeyNlLbqv2RaZ5ScgzK4MZyzTrduqZ3yreuxrdBcicLwveiIhwLZ
 mq34dzztwjeltngNu9lI0uBftixJCCU7+E9E9z9mEllThpk+47ByHcI4CH9LN5BEben/
 WXFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5iS5QOKgDCSqktWnKWS/6a3e6ylJo3dJz9LZURxkVqsR/7RBg7OEA2Po963DEy3qxclfHh1sgoEWo@lists.freedesktop.org,
 AJvYcCV4YIudZJBv5eWaUpvfIvgdkMbX5xOS7a4YpR2jhi/XervInf3TwEF6lXiElQMHK2e+56nxtuE1Q77GV42gzQ==@lists.freedesktop.org,
 AJvYcCVicVe2nDAhexwdZ5JIOUWrrGTQnG6ex4riUFxfeaRYU6EBcws1o6dDY1K7KhtK2Nvv6gildqj3iQ5n@lists.freedesktop.org,
 AJvYcCWHFB9/aBwyu6PUrBFKtpYqbp74E5JwAC7J0tNG37+tURmXzGPnD8vSpSlfjUmb2BQiZSxWPV5w@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPJND6qx9FfvN1PoNS8DRs3QVVaivhTS7CFiST83HFM1o8Lpjj
 bD+lfSQMo7D9oa819tK3ELxsQBn6J1y8241TgH+V4dymEMF6+8G7
X-Gm-Gg: ASbGnctwu7rybhHCMrAibpnZ5ejT/88Qh10a5iZh6X2waYV72Kjxsz8So37nBRQQRmF
 UK5+F+tDJdSde/9552+rDKqvcEzKnLgsvVcN37mDHrjxC54xVgkwnuveCSeWP+j5TnMjK4rIHd4
 8e5SlM3q6QowG6zbaWecu4F913ctyxdfFBsIQ3wfB35/z9u8vVBsRu073NDTtP5J3Wg6Jro4njh
 pp3WHQRrg8zxvXcmjorhUMwTHVr/ApTbYV7XR1R9WIiMej4MMtIJm54vTGEfoet7j/PcY4POjrL
 Zi/HXAGZYeEGq/ntoRjTJAvZH2HPMi13XM42cw==
X-Google-Smtp-Source: AGHT+IFb1IYAOoDwrPX5oAD1/5R309ZYSOIrwtBkiFdBX9WxKJLvt5wVK1HYP6ZV250VsZiGsSrO6w==
X-Received: by 2002:a05:6602:2dc6:b0:843:ea9a:acc4 with SMTP id
 ca18e2360f4ac-851b61cacc9mr2996533339f.8.1737787663036; 
 Fri, 24 Jan 2025 22:47:43 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:42 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 62/63] drm-dyndbg: add DRM_CLASSMAP_USE to the
 drm_gem_shmem_helper driver
Date: Fri, 24 Jan 2025 23:46:16 -0700
Message-ID: <20250125064619.8305-63-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5ab351409312..481d18561688 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -23,6 +23,7 @@
 #include <drm/drm_print.h>
 
 MODULE_IMPORT_NS("DMA_BUF");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.48.1

