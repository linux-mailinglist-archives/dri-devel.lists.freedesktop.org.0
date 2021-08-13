Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CCA3EB79D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C396E85F;
	Fri, 13 Aug 2021 15:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9866E85A;
 Fri, 13 Aug 2021 15:19:50 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id i4so11220945ila.1;
 Fri, 13 Aug 2021 08:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j0nfnl+luadMfBENeONGcQqctQXuoRc2drfaC6JFN/A=;
 b=GBZRjmAOPBa5yXLrsf6O+pIflq+4DOa/sjc9rs5KZWMeggk/Ngr5aWNqZAgIoXMGn8
 GebO/bbELPJUlaI7iC/OhwxEXhIyJu/9Hy1e/qK7f/1fh01ay9eQpyGdTPzxm8uAi8I3
 19J/zTBka6VYFLN/2kRRN863UF8MrVWdP4wheNKM6C+cGh6hFECEU3FafnSa//s0+JlX
 qiOZ02YqbRg4Omru4M6PiggCD4cMKh11QeNeMxo/LmBRZetzAkxlowAdkhVqaDCY4njg
 HaukA6BeRCpAIuB0U4Efh/yuaFHs95tAsg4VoxtblGZkWgtjWMOaeYSEbS1I3Y/784C5
 FBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j0nfnl+luadMfBENeONGcQqctQXuoRc2drfaC6JFN/A=;
 b=BLsOY/sB/wtjdmIvaRPURgihwyuGWciOIBtIa8AWlgQbBPGrH9suc8Zv7LUcbsVj/Q
 qYPDaf3F/xM3hrlcEqWfWMBI3HHDwY4hlLJ8JJAUa07HNWwn4xp8ICJq+5rq7MdiupUx
 o+Jw1LX92zrqg12hl+xxSnZ3eYctI4J8a91X7PyHey8TBBUD0MDbvNYMAfAZEN8JjlIp
 p69/UQuGIxnyID23iEqKhnS+PMvwJO03A6jha6tGGBFJ9bLdlaHA0IRqVhzwR8KrWWhe
 1KDQUE5Kt7H+07O9glZdW7thN87XLXoVhrsrFghVaPePdAisec1gzXJWpG6iZyum5LIU
 FYmw==
X-Gm-Message-State: AOAM530YP4pKta6LRVIHeEG2NBMUSkLU2K5ffes5O+HlcGM4uQ5kY6Dv
 Xw7W9WgPPxjfBZX8TpkEim8=
X-Google-Smtp-Source: ABdhPJz8bOriy9Ujvg+TITr8FCdz9ASMzyYVACa+RWgPp1vMNOi5JTxThdPOrnzmI/d1Miq3HQpWZA==
X-Received: by 2002:a92:c841:: with SMTP id b1mr2181218ilq.300.1628867989820; 
 Fri, 13 Aug 2021 08:19:49 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id d4sm921145ilo.29.2021.08.13.08.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:19:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org, seanpaul@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Baron <jbaron@akamai.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Huang Rui <ray.huang@amd.com>, Le Ma <le.ma@amd.com>,
 Chengming Gui <Jack.Gui@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Jim Cromie <jim.cromie@gmail.com>,
 John Clements <john.clements@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Ashley Thomas <Ashley.Thomas2@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Wyatt Wood <Wyatt.Wood@amd.com>,
 Johan Hovold <johan@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Joe Perches <joe@perches.com>,
 Nick Desaulniers <ndesaulniers@gooogle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Changbin Du <changbin.du@intel.com>, Marco Elver <elver@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Oliver Glitta <glittao@gmail.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Arnd Bergmann <arnd@arndb.de>, Patricia Alfonso <trishalfonso@google.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 5/9] i915/gvt: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to
 create "gvt:core:" etc categories
Date: Fri, 13 Aug 2021 09:17:13 -0600
Message-Id: <20210813151734.1236324-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813151734.1236324-1-jim.cromie@gmail.com>
References: <20210813151734.1236324-1-jim.cromie@gmail.com>
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

---
v4+:
. static decl of vector of bit->class descriptors - Emil.V
. relocate gvt-makefile chunk from elsewhere

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
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

