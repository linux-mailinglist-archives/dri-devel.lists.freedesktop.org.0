Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C358640CA82
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADAA6E982;
	Wed, 15 Sep 2021 16:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEDD6E97E;
 Wed, 15 Sep 2021 16:40:04 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id b8so3557001ilh.12;
 Wed, 15 Sep 2021 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDt8RHYkskYH5bCZrpjTNsOpmRiTxdwpQyKpfX6RY3A=;
 b=c4nZOkxKhXrjzF+4aRawGgyBeuDQjMquxOQaXTLEjRuUh9Clvwgifr3VCvJ+3/BnMd
 H3TsbOAAgDWfqJzfVi5rFN4vIsbwBxEJC/5SBt9ACtoMTKx0xS8dGLP8hlDxAE3qEeyj
 aiUe7xoACIfeh/0AgBCa6WZklAaroRxXjZhxO0yGjFaCuUBgbCeHVIYWMNACkC6LczMr
 Z/L9VPYLKhPHKwXF0GqI2tDWYGe4MsnOMPtlS3mLR8eGsmJXlWpzHeDtEwlL74nmtuLA
 8EtEkknEf0/uwfoyjNZPi4pZeTvv29i2rnJ1bXCqpf/4h5uwmcZgHRNdS5ND5bsMvC9n
 H2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wDt8RHYkskYH5bCZrpjTNsOpmRiTxdwpQyKpfX6RY3A=;
 b=bBS9eXYcTJ+jzT9x1ebGkgxA/t7+Wly8Nl+lV0XeL6a6eaMhGrNGwny2HQLBBkFWNi
 JNkM8pk6QSSdShTk3PXE+r5LwgWGRv/PTa6j2dhEiYmWLMxJO8uZXx6ml0CzFXuPCrVp
 hS7HFl/tuNAdmR0z6ZRcBCBfeBqF81l7tFfyjRWxg8fsHu4Xgn/ufPGuL0Aj2EKhNS5w
 imbwi43CcY1IKf2gkvbeXZVzPx8h1U8gQTAPkXljjsRfHGrSIwsf7Ju6FgTZ+1RA44hM
 vYdMe7ozFXf0+LaEJRmjvzWF72cRROuGm92gIfZg1hgd11J/LSaDd0mOs0hTy1mvil2g
 AV5w==
X-Gm-Message-State: AOAM5314FxmtlbTn6k3U5AqPWZT1TcwREc93RmAMC19RQ5V9ph0rBOdb
 7JArfULZhh2ZH/7eFjHvVJw=
X-Google-Smtp-Source: ABdhPJy5WFtRgBXIOMhVv5W9EirkoNRgDbTYeUFkQJ/30M5ye1Y7oMEnSngpAqjZtlR4c3M+5BW8vg==
X-Received: by 2002:a92:d84f:: with SMTP id h15mr737927ilq.42.1631724003998;
 Wed, 15 Sep 2021 09:40:03 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 00/16] use DYNAMIC_DEBUG to implement DRM.debug
Date: Wed, 15 Sep 2021 10:39:41 -0600
Message-Id: <20210915163957.2949166-1-jim.cromie@gmail.com>
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

Hi Jason, Greg, Daniel, DRM folks,

In DRM-debug currently, drm_debug_enabled() is called a lot to decide
whether or not to write debug messages.  Each test is cheap, but costs
continue with uptime.  DYNAMIC_DEBUG "dyndbg", when built with
JUMP_LABEL, replaces each of those tests with a patchable NOOP, for
"zero cost when off" debugs.

Broadly, this patchset does 3 things, in 2 trees:

Adds DEFINE_DYNAMIC_DEBUG_CATEGORIES, which defines a mapping from
bits to "categorized" pr_debugs, a sysfs interface, and callbacks to
implement the bits as dynamic_debug >controls.  This is modelled after
DRM's debug interface.

Uses the new macro in amdgpu & i915 to control existing pr_debugs
according to their ad-hoc categorizations.

Adapts the drm-debug API (~20 macros) to configurably "replace"
drm_dbg & drm_dev_dbg with pr_debug & dev_dbg, which avoids
drm_debug_enabled() overheads.  CONFIG_DRM_USE_DYNAMIC_DEBUG controls
this; the memory costs are substantial (many new/converted drm
callsites, 56 bytes/pr_debug), so the choice should be made by the
user.

       	       #prdbgs  KiB     #with DRM_USE_DYNAMIC_DEBUG=y
  kernel       3079	166k
  drm		  1	.06k     376	 21k
  drm_kms_helper		 207	 12k
  i915	        167	9.3k	1811	101k
  amdgpu       2339	130k	3917	220k
  nouveau      	  3	.17k	 105	~60k

DEFINE_DYNAMIC_DEBUG_CATEGORIES is used to create the controlling
bitmap, which is wired to __drm_debug var so remaining
drm_debug_enabled() users stay in sync.

this is v8:
- 7 small tweaks to dyndbg pr-infos etc, no functional changes
- drop help field from dyndbg_bitdesc
- simplify declarative interface
- move ^ anchor, trailing space to macro helper
  this makes callback slightly more generic
- i915/gvt move code, Makefile bits per Tvrtko
- mem cost numbers
- more CI fixes

I think the dyndbg patches qualify to get in this cycle; all but the
last are no-functional-changes, the last is a new feature (which uses
existing mechanics without any adjustments), and has no users yet, so
it can't cause regressions.

Obviously, DRM is the anticipated user.  I've fixed the patchwork CI
problems I have seen on v6, v7, and lkp-robot reports since.  Since
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by default, it should have seen "on"
testing, not just "off" testing.

Jim Cromie (16):

Dyndbg no-functional-changes chunk:
  dyndbg: add module to a vpr-info in dd-exec-queries
  dyndbg: pr-info in boot-param should say so
  dyndbg: rationalize verbosity
  dyndbg: use alt-quotes in vpr-infos, not those user might use
  dyndbg: vpr-info on remove-module complete, not starting
  dyndbg: no vpr-info on empty queries
  dyndbg-doc: fix bootparam usage example (possible conflict

New Feature, using unchanged mechanisms:  
  dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES bitmap and callbacks

DRM 1st user(s):
  drm: fix doc grammar error
  i915/gvt: remove spaces in pr_debug "gvt: core:" etc prefixes
  i915/gvt: use DEFINE_DYNAMIC_DEBUG_CATEGORIES for existing prdbgs
  amdgpu: use DEFINE_DYNAMIC_DEBUG_CATEGORIES on existing prdbgs
  drm_print: add choice to use dynamic debug in drm-debug
  drm_print: instrument drm_debug_enabled
  amdgpu_ucode: reduce number of pr_debug calls
  nouveau: fold multiple DRM_DEBUG_DRIVERs together

 .../admin-guide/dynamic-debug-howto.rst       |   8 +-
 drivers/gpu/drm/Kconfig                       |  26 ++
 drivers/gpu/drm/Makefile                      |   3 +
 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 293 ++++++++++--------
 .../gpu/drm/amd/display/dc/core/dc_debug.c    |  43 ++-
 drivers/gpu/drm/drm_print.c                   |  53 +++-
 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/gvt/debug.h              |  18 +-
 drivers/gpu/drm/i915/intel_gvt.c              |  34 ++
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  36 ++-
 include/drm/drm_drv.h                         |   2 +-
 include/drm/drm_print.h                       | 184 ++++++++---
 include/linux/dynamic_debug.h                 |  62 ++++
 lib/dynamic_debug.c                           | 121 ++++++--
 15 files changed, 650 insertions(+), 237 deletions(-)

-- 
2.31.1

