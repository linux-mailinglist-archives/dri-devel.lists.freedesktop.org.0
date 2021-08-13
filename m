Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E693EB784
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 17:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FA16E853;
	Fri, 13 Aug 2021 15:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337DA6E851;
 Fri, 13 Aug 2021 15:17:53 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b7so4679911iob.4;
 Fri, 13 Aug 2021 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cIj6tKl77TPV1rFCxoY1MGaICLIufrJrZxmaIANAlf0=;
 b=BFWoy0c71QpTnxj1mIK/8d+VESAM779EmBu+vOky8Oiz8rpkbr2HWUrSKt9Lj8DsGo
 LuNhcSnO8tvpvOz0nihCikhiPoicVaMKRyWq+rMHUpPi7q63uG/wFslJgzABp0mMX4fj
 OqSbiw4pteYeV4silEcq0/kjz8Z9TJ3TtdPmTAj0dAKBRZW+Iu/gkSpeJrrdzH2VeYJO
 h8YlxM6WQ1mm50hoBeimyPWKnZo7UAoPz+KYhlsErUN2Xht2u580RS9K4FFStTSCLnGq
 h1l7i+xkXiAKg5zVNzboWmDw4vbmg/EfC5d8IgMrkvsNLmwIK57TtY1jMtjXjtkggVjq
 vHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cIj6tKl77TPV1rFCxoY1MGaICLIufrJrZxmaIANAlf0=;
 b=JXgpHrxYmAtg6IvoBbY6gycvnRLsfMRaYsRTimmPSnOVsQ8RVbYaNVrlc9aWgcUesd
 kmYFdG815M/ajQS4u10IpK2yFryvnFy3me9lTefFTm+oSUK+N0W5pluTuZsRI1S81VTF
 BRiYwKdmYifSbITUJhptU4Cz188QXM9aipSPWTX+QlpNS50cX3/Fjy57pEGObI9xgEX2
 abbjVNG8rSI4Q6ivjFRuBjgulv70ViDB3Gl1mlwCzmQ9+SSKdGj5E+RGVwD/hWXxGfdR
 GfNsisP18N2rEcrscthdZcX+UiM/JhB3GJSjG4a3CTyBpBQGfb02SXkZgCJuMK9ge8oD
 97AQ==
X-Gm-Message-State: AOAM531R7P6F5j38DdA50KblJpvXwKwhY4+F8ETPbUVqy3sRtBEZLdWR
 0QZhnwZ7rsKkXhwBcNCdjhQ=
X-Google-Smtp-Source: ABdhPJwl0y++6DyH5SePUYl/KOQMvjogp2wG9orrgmC5nLoN5JJds+qmT5bNnzDuSC8sItwPyBb+Jw==
X-Received: by 2002:a5d:96da:: with SMTP id r26mr2453061iol.47.1628867872350; 
 Fri, 13 Aug 2021 08:17:52 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id d4sm921145ilo.29.2021.08.13.08.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:17:51 -0700 (PDT)
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
 Huang Rui <ray.huang@amd.com>, Kevin Wang <kevin1.wang@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Chengming Gui <Jack.Gui@amd.com>,
 Aaron Liu <aaron.liu@amd.com>, Jim Cromie <jim.cromie@gmail.com>,
 John Clements <john.clements@amd.com>,
 Ashley Thomas <Ashley.Thomas2@amd.com>, Wyatt Wood <Wyatt.Wood@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Johan Hovold <johan@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 Joe Perches <joe@perches.com>, Nick Desaulniers <ndesaulniers@gooogle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vitor Massaru Iha <vitor@massaru.org>, Sedat Dilek <sedat.dilek@gmail.com>,
 Mel Gorman <mgorman@techsingularity.net>, Marco Elver <elver@google.com>,
 Alexander Potapenko <glider@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Arvind Sankar <nivedita@alum.mit.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jiri Olsa <jolsa@kernel.org>, Patricia Alfonso <trishalfonso@google.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Johannes Berg <johannes.berg@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/9] dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and use in
 DRM
Date: Fri, 13 Aug 2021 09:17:08 -0600
Message-Id: <20210813151734.1236324-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
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

hi Jason, Greg, Daniel, dri-everyone,

drm_debug_enabled() is called a lot (by drm-debug api) to do unlikely
bit-tests to selectively enable debug printing; this is a good job for
DYNAMIC_DEBUG, IFF it is built with JUMP_LABEL.
 
This patchset enables the use of dynamic-debug to avoid those
drm_debug_enabled() overheads, if CONFIG_DRM_USE_DYNAMIC_DEBUG=y.

v5: much rework

- based on Daniel Vetter's feedback, not RFC anymore. (except last one)

- move POC bit_map callback code into dynamic_debug
  add .data to struct kernel_param
  add DEFINE_DYNAMIC_DEBUG_CATEGORIES :
  a declarative interface for bits => control-queries
  this is all new functionality.

- use DEFINE_DYNAMIC_DEBUG_CATEGORIES in i915, amdgpu
  adds selectivity/control to existing categorizations

- DRM_USE_DYNAMIC_DEBUG
  replace DRM_UT_<CAT> (an enum)
  with DRM_CAT_<CAT>   (a prefix string, cpp-prepended to format)
  _UT_ still present, drm_debug_enabled() still used
  todo:
  change __drm_debug param-var to read DDD_CATEGORIES's param-var
  might suffice to keep parallel schemes coherent.
  
- RFC add tracer func as syslog alternate
  test_dynamic_debug.ko: uses tracer for observability, does selftest
  has some misuse risk; calling pr_debug recursively.

v4: (brown-bagger, various fixes after snips)
v3: fixes missed SOB, && on BOL, commit-log tweaks
v2: https://lore.kernel.org/lkml/20210711055003.528167-1-jim.cromie@gmail.com/
v1: https://lore.kernel.org/lkml/20201204035318.332419-1-jim.cromie@gmail.com/

Doing so creates many new pr_debug callsites,
otherwise i915 has ~120 prdbgs, and drm has just 1;

  bash-5.1# modprobe i915
  dyndbg:   8 debug prints in module video
  dyndbg: 305 debug prints in module drm
  dyndbg: 207 debug prints in module drm_kms_helper
  dyndbg:   2 debug prints in module ttm
  dyndbg: 1720 debug prints in module i915

On amdgpu, enabling it adds ~3200 prdbgs, currently at 56 bytes each.
So CONFIG_DRM_USE_DYNAMIC_DEBUG=y affects resource requirements.
Im working on a diet-plan.

Im running this patchset bare-metal on an i7/i915 laptop & an
r9/amdgpu desktop (both as loadable modules).  I booted the amdgpu box
with:

BOOT_IMAGE=(hd2,gpt2)/vmlinuz-5.14.0-rc4-d7a-00009-g5db471cba844 \
     root=UUID=mumble ro \
     rootflags=subvol=root00 rhgb \
     dynamic_debug.verbose=3 main.dyndbg=+p \
     amdgpu.debug=1 amdgpu.test=1 \
     "amdgpu.dyndbg=format ^[ +p"

That last line enables ~1700 prdbg callsites with a format like '[DML'
etc at boot, and amdgpu.test=1 triggers 90 seconds of tests, yielding
~76k prdbgs in 409 seconds, before I turned them off with:

  echo module amdgpu -p > /proc/dynamic_debug/control

Its worth noting, this changes the dyndbg-state underneath settings
applied with `echo > parameters/debug`; the latter is qualitatively
writeonly, maybe a param_get should return "NA" "-1"

this merged cleanly, on top of
commit d65ef4634e5c795a6a4df1d198992c70e9692fb3 (drm-tip/drm-tip)

Jim Cromie (9):
  drm/print: fixup spelling in a comment
  moduleparam: add data member to struct kernel_param
  dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and callbacks
  i915/gvt: remove spaces in pr_debug "gvt: core:" etc prefixes
  i915/gvt: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to create "gvt:core:"
    etc categories
  amdgpu: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to control categorized
    pr_debugs
  drm_print: add choice to use dynamic debug in drm-debug
  amdgpu_ucode: reduce number of pr_debug calls
  dyndbg: RFC add tracer facility RFC

 drivers/gpu/drm/Kconfig                       |  13 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 293 ++++++++++--------
 .../gpu/drm/amd/display/dc/core/dc_debug.c    |  44 ++-
 drivers/gpu/drm/drm_print.c                   |  49 ++-
 drivers/gpu/drm/i915/gvt/Makefile             |   4 +
 drivers/gpu/drm/i915/gvt/debug.h              |  18 +-
 drivers/gpu/drm/i915/i915_params.c            |  35 +++
 include/drm/drm_print.h                       | 143 +++++++--
 include/linux/dynamic_debug.h                 |  82 ++++-
 include/linux/moduleparam.h                   |  11 +-
 lib/Kconfig.debug                             |  10 +
 lib/Makefile                                  |   1 +
 lib/dynamic_debug.c                           | 171 ++++++++--
 lib/test_dynamic_debug.c                      | 247 +++++++++++++++
 14 files changed, 901 insertions(+), 220 deletions(-)
 create mode 100644 lib/test_dynamic_debug.c

-- 
2.31.1

