Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE103F420D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E9D89F24;
	Sun, 22 Aug 2021 22:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED0789EB1;
 Sun, 22 Aug 2021 22:20:53 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 x9-20020a056830278900b0051b8be1192fso10541325otu.7; 
 Sun, 22 Aug 2021 15:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Di0vKi6q1FQK7H2Iauu5LRuMFu/619Qh3TdTrNtKXuA=;
 b=tkqpGHbOO1QfJaHHrjSYZV7sKqxU8LscpiATOjdtyBrYvalZ9xwCc/QRtKMPRBeM3O
 3Us3/BDJ4e3nAf9cDIu/wobznv7ozP+Ugyrsovxtni/JsiGp3ida5BX2QiI/BKJ7IqM+
 5o2DgNteMcs2dC9Vmhwqr6H/3bD/84053Ep9+9JWmx7kmr991Qn/nGMylV4vpljJ3mtl
 uSM3sWRDNqrC8waHsm8aGd5lvmKEFTxng2l9oCVRXHSlHlqmPJ4WgOdRkGK2bNqIlrT8
 1AA/n7ESClY5iOu7PmhraN4cZVc6ru94/0E6PkaU5fF5xy4LhGx/HjNWGzCCBPto8CCC
 gkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Di0vKi6q1FQK7H2Iauu5LRuMFu/619Qh3TdTrNtKXuA=;
 b=sW8qP8FAF5uhCFRtfZ9OKULlL9okEmNEXMEqmGtklWjHYSXcHw5mb8WvCRwkj60Oym
 pE2DxoDfS4clXHaatGsFOPxa20X19zvbMPGfZjtwcwvVmz5Q/senYMlIT38tGSlUHAa0
 f9Frnu7KTM28JNKXg8wcfwDmiXmmi2Tvo5q3n+YT3ghPWTk0aXj/jgkl0slMDHJfaQtp
 OxYejRc+bn6xha7qjy3noBEC7BXgx9TRNeb/G+VIdhN0EDpsgM7xAxI4Weo9f534wLVr
 XJAcKr7CMhp3R/2kM8aVRofmh1T/PnXfPZKXaif1W/T8BauAqsaqqHyAevqVlfI/ukmZ
 3DJw==
X-Gm-Message-State: AOAM531Nm6EfsuQpMRk/GK+hHEP36yRqhsy3MMh9dyZmufPgtt4jBxr2
 k7vzBR+jke2qrnpMiEmRXv4=
X-Google-Smtp-Source: ABdhPJyPpT9XiFfOy8V8QORSZfW/NxURz4DN+wweH36YGXMRDoirpmpnVsnD73+/3/1paYsfg+mTUA==
X-Received: by 2002:a9d:6b8b:: with SMTP id b11mr25581181otq.351.1629670852237; 
 Sun, 22 Aug 2021 15:20:52 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 05/11] amdgpu: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to
 control categorized pr_debugs
Date: Sun, 22 Aug 2021 16:20:03 -0600
Message-Id: <20210822222009.2035788-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822222009.2035788-1-jim.cromie@gmail.com>
References: <20210822222009.2035788-1-jim.cromie@gmail.com>
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

logger_types.h defines many DC_LOG_*() categorized debug wrappers.
Most of these use DRM debug API, so are controllable using drm.debug,
but others use bare pr_debug("$prefix: .."), each with a different
class-prefix matching "^\[\w+\]:"

Use DEFINE_DYNAMIC_DEBUG_CATEGORIES to create a /sys debug_dc
parameter, modinfos, and to specify a map from bits -> categorized
pr_debugs to be controlled.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../gpu/drm/amd/display/dc/core/dc_debug.c    | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index 21be2a684393..69e68d721512 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -36,8 +36,50 @@
 
 #include "resource.h"
 
-#define DC_LOGGER_INIT(logger)
+#ifdef DRM_USE_DYNAMIC_DEBUG
+/* define a drm.debug style dyndbg pr-debug control point */
+#include <linux/dynamic_debug.h>
+
+unsigned long __debug_dc;
+EXPORT_SYMBOL(__debug_dc);
+
+#define _help_(key)	"\t   " key "\t- help for " key "\n"
+
+/* Id like to do these inside DEFINE_DYNAMIC_DEBUG_CATEGORIES, if possible */
+#define DC_DYNDBG_BITMAP_DESC(name)					\
+	"Control pr_debugs via /sys/module/amdgpu/parameters/" #name	\
+	", where each bit controls a debug category.\n"			\
+	_help_("[SURFACE]:")						\
+	_help_("[CURSOR]:")						\
+	_help_("[PFLIP]:")						\
+	_help_("[VBLANK]:")						\
+	_help_("[HW_LINK_TRAINING]:")					\
+	_help_("[HW_AUDIO]:")						\
+	_help_("[SCALER]:")						\
+	_help_("[BIOS]:")						\
+	_help_("[BANDWIDTH_CALCS]:")					\
+	_help_("[DML]:")						\
+	_help_("[IF_TRACE]:")						\
+	_help_("[GAMMA]:")						\
+	_help_("[SMU_MSG]:")
+
+DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_dc, __debug_dc,
+	DC_DYNDBG_BITMAP_DESC(debug_dc),
+	_DD_cat_("[CURSOR]:"),
+	_DD_cat_("[PFLIP]:"),
+	_DD_cat_("[VBLANK]:"),
+	_DD_cat_("[HW_LINK_TRAINING]:"),
+	_DD_cat_("[HW_AUDIO]:"),
+	_DD_cat_("[SCALER]:"),
+	_DD_cat_("[BIOS]:"),
+	_DD_cat_("[BANDWIDTH_CALCS]:"),
+	_DD_cat_("[DML]:"),
+	_DD_cat_("[IF_TRACE]:"),
+	_DD_cat_("[GAMMA]:"),
+	_DD_cat_("[SMU_MSG]:"));
+#endif
 
+#define DC_LOGGER_INIT(logger)
 
 #define SURFACE_TRACE(...) do {\
 		if (dc->debug.surface_trace) \
-- 
2.31.1

