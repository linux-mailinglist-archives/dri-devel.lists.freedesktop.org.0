Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DAE3F4219
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBCA89F01;
	Sun, 22 Aug 2021 22:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBFF89EA3;
 Sun, 22 Aug 2021 22:20:51 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso19980539ots.5; 
 Sun, 22 Aug 2021 15:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HcxXOS2YF8uquZi7kiX9qsCJzDtlyXVg/tWg1kXIEfw=;
 b=Lt3kAYxhulbTWzHw+KRuN9FilPfa/EzpwZR9uYqxRniMUOewDlJ4DGDT8qecdeIdMb
 CDj4rDXnMKefO6KQWz1XdVcSRAsJyfeuabR8mYqwE6NeAzqc73aEtG+EMfgnzZnRbBHw
 aUIoY4KEupW8c8za+nlCgiX5usqNljYfAin+m5PENm/85RqyKpQJOZqI4lTGCcrU2ony
 4cXIMTEP7H7VrSkoTEfudzitfhwRzFBfaryP7wk//ofLSWWhatIXLq9Z2B19XvkDs8qS
 4Ur8y+2bJmFRzvYQoPky3KY26CfC1RjNcSjjQPX0+groURVxmIE8aFjBmfe0wt2TpQoH
 MM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HcxXOS2YF8uquZi7kiX9qsCJzDtlyXVg/tWg1kXIEfw=;
 b=PK1lZSq2sU3XAgtTT73uR7K67WseenidYXyYOuqd26K+bKhUNwWs4kl6pim1zFsqfs
 +4nFoxGzUtT1rKOSw8jwcyKJqyg+xRC59aK1gN1ulVFmndAZHW5hXVFFt6wiHYbdTlxT
 spQwgdjWMqxwkhxS0hgZwwTgTU9SpiYDJDT9e3aCkrAudILBfMWko9sUj9PynfP8Ls7l
 JaRMV2ciwv+3TkmGICAGh1a0GnMvGR1+ub/GjIFlRraz1SXn832ZivQp+JAzTUNN0xu/
 DXC9ZTm7rkxmFpMf0yDZrsusbN7OowCgmYPBeECxvaFV7pI7C7Y3OF1BjmoEh9qQRavu
 sgoQ==
X-Gm-Message-State: AOAM5337g5R2OL7uqRnAou8L/wGl57o8FrdRpT2RIp2kFkpGOsqc1mEQ
 2cJlJW9bgS8sK0ALdiVufKY=
X-Google-Smtp-Source: ABdhPJyKh74f82CLns65Ub2YpnD6FguJkzgMrm73NZeDP62Hn3m6BcP++K3oGODLJTjANh7XmyyENg==
X-Received: by 2002:a9d:6c1:: with SMTP id 59mr24916964otx.318.1629670851093; 
 Sun, 22 Aug 2021 15:20:51 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id x198sm2964122ooa.43.2021.08.22.15.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 15:20:50 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, seanpaul@chromium.org,
 jeyu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 04/11] i915/gvt: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to
 create "gvt:core:" etc categories
Date: Sun, 22 Aug 2021 16:20:02 -0600
Message-Id: <20210822222009.2035788-5-jim.cromie@gmail.com>
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

The gvt component of this driver has ~120 pr_debugs, in 9 categories
quite similar to those in DRM.  Following the interface model of
drm.debug, add a parameter to map bits to these categorizations.

DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
	"dyndbg bitmap desc",
	{ "gvt:cmd: ",  "command processing" },
	{ "gvt:core: ", "core help" },
	{ "gvt:dpy: ",  "display help" },
	{ "gvt:el: ",   "help" },
	{ "gvt:irq: ",  "help" },
	{ "gvt:mm: ",   "help" },
	{ "gvt:mmio: ", "help" },
	{ "gvt:render: ", "help" },
	{ "gvt:sched: " "help" });

The actual patch has a few details different, cmd_help() macro emits
the initialization construct.

if CONFIG_DRM_USE_DYNAMIC_DEBUG, then -DDYNAMIC_DEBUG_MODULE is added
cflags, by gvt/Makefile.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v4+:
. static decl of vector of bit->class descriptors - Emil.V
. relocate gvt-makefile chunk from elsewhere
---
 drivers/gpu/drm/i915/gvt/Makefile  |  4 ++++
 drivers/gpu/drm/i915/i915_params.c | 35 ++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/Makefile b/drivers/gpu/drm/i915/gvt/Makefile
index ea8324abc784..846ba73b8de6 100644
--- a/drivers/gpu/drm/i915/gvt/Makefile
+++ b/drivers/gpu/drm/i915/gvt/Makefile
@@ -7,3 +7,7 @@ GVT_SOURCE := gvt.o aperture_gm.o handlers.o vgpu.o trace_points.o firmware.o \
 
 ccflags-y				+= -I $(srctree)/$(src) -I $(srctree)/$(src)/$(GVT_DIR)/
 i915-y					+= $(addprefix $(GVT_DIR)/, $(GVT_SOURCE))
+
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+ccflags-y	+= -DDYNAMIC_DEBUG_MODULE
+#endif
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index e07f4cfea63a..683e942a074e 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -265,3 +265,38 @@ void i915_params_free(struct i915_params *params)
 	I915_PARAMS_FOR_EACH(FREE);
 #undef FREE
 }
+
+#ifdef DRM_USE_DYNAMIC_DEBUG
+/* todo: needs DYNAMIC_DEBUG_MODULE in some cases */
+
+unsigned long __gvt_debug;
+EXPORT_SYMBOL(__gvt_debug);
+
+#define _help(key)	"\t    \"" key "\"\t: help for " key "\n"
+
+#define I915_GVT_CATEGORIES(name) \
+	" Enable debug output via /sys/module/i915/parameters/" #name	\
+	", where each bit enables a debug category.\n"			\
+	_help("gvt:cmd:")						\
+	_help("gvt:core:")						\
+	_help("gvt:dpy:")						\
+	_help("gvt:el:")						\
+	_help("gvt:irq:")						\
+	_help("gvt:mm:")						\
+	_help("gvt:mmio:")						\
+	_help("gvt:render:")						\
+	_help("gvt:sched:")
+
+DEFINE_DYNAMIC_DEBUG_CATEGORIES(debug_gvt, __gvt_debug,
+				I915_GVT_CATEGORIES(debug_gvt),
+				_DD_cat_("gvt:cmd:"),
+				_DD_cat_("gvt:core:"),
+				_DD_cat_("gvt:dpy:"),
+				_DD_cat_("gvt:el:"),
+				_DD_cat_("gvt:irq:"),
+				_DD_cat_("gvt:mm:"),
+				_DD_cat_("gvt:mmio:"),
+				_DD_cat_("gvt:render:"),
+				_DD_cat_("gvt:sched:"));
+
+#endif
-- 
2.31.1

