Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A84873FCE6A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 22:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE7C6E0BE;
	Tue, 31 Aug 2021 20:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451946E08C;
 Tue, 31 Aug 2021 20:21:43 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id f6so675477iox.0;
 Tue, 31 Aug 2021 13:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=88wRQUNtMUJi/6hPAvOwHORhoX/taPR74JK48uf6HWQ=;
 b=tOmsHdtr+3QHTB4nAZ0LrbXC75hOjRt0DUzslctjaj7goTX5XnHeSn1L7KRJtdWLI3
 JqMMyB7N5cBkQ/bMUztphUJ+oM+2H314BrNCemyeKd1vOMqrXE1SMep3EJStF/3liA7h
 u2hyWUUSRSbhgeSPchr36YwMj2or3GxAZuE1Zh3Bbl6ZdKrirfVIoMEdnuJQN1OyUKxW
 CGljvBZSYago5D/YvDZYnsZSAyNsU4AL541wcMcoOXngNRSnCA5aTTFdGbOrro61EuaC
 yT+Y4rtWdNsEHNrL57S1XIy4G4AMQV8WIYj8uUIGiGWoFK7z5uCMk4lK2gGkVT6H1VKg
 ps1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=88wRQUNtMUJi/6hPAvOwHORhoX/taPR74JK48uf6HWQ=;
 b=b5Q6Wrrfjm39UmsviKQl4R3HJdSTHtEZfQMTpTNIwTwo1rAqrZj5PpXU7VQgp1DdG5
 R0gIVzKBHhotSvmzJdOwUDwrxvObf+tYGx8Zs485hxcMbByhSzR77sT2omiEPEn5xEun
 SimuiYMGWZsYEBsucn7zf8jjbtUy/Q/n9QM+lllsd5LfOoWCScQ0/llbAWC7INRQb4Iu
 A4aU2nsSotZH+QKwYO9gWB5hhwVnHav1u0mn9tOWu13eyRGcG3zKknnqQGVrs2I4J1rr
 Gg+mekAF5TBx3yNNEOgjcvtdOYZ62SjpJ536h6tL3fmjgCHS+sg2SDkubut1F7Yr/yQA
 aCmw==
X-Gm-Message-State: AOAM531PeP4ev5lClS0Y+DBNPbRvmRCCAhij+ux78rrB+TKCJ7K6hqwh
 QNpERM4T+8xJx3m4kfA6ip91AzSI2Qk=
X-Google-Smtp-Source: ABdhPJx2LWgsyl+WrSNUOvCznskXzHNhCRv+oT+lELyqi541d9Xl3BoShcdyi5xKp2cgj4TtqNKxEw==
X-Received: by 2002:a02:946d:: with SMTP id a100mr4447643jai.118.1630441302509; 
 Tue, 31 Aug 2021 13:21:42 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id u15sm10597384ilk.53.2021.08.31.13.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:21:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7 3/8] i915/gvt: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to
 create "gvt:core:" etc categories
Date: Tue, 31 Aug 2021 14:21:28 -0600
Message-Id: <20210831202133.2165222-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831202133.2165222-1-jim.cromie@gmail.com>
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
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
v5:
. static decl of vector of bit->class descriptors - Emil.V
. relocate gvt-makefile chunk from elsewhere
v7:
. move ccflags addition up to i915/Makefile from i915/gvt
---
 drivers/gpu/drm/i915/Makefile      |  4 ++++
 drivers/gpu/drm/i915/i915_params.c | 35 ++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 4f22cac1c49b..5a4e371a3ec2 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -30,6 +30,10 @@ CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
 
 subdir-ccflags-y += -I$(srctree)/$(src)
 
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
+ccflags-y += -DDYNAMIC_DEBUG_MODULE
+#endif
+
 # Please keep these build lists sorted!
 
 # core driver code
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index e07f4cfea63a..e645e149485e 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -265,3 +265,38 @@ void i915_params_free(struct i915_params *params)
 	I915_PARAMS_FOR_EACH(FREE);
 #undef FREE
 }
+
+#ifdef CONFIG_DRM_USE_DYNAMIC_DEBUG
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

