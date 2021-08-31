Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B733FCE52
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 22:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BF0897D0;
	Tue, 31 Aug 2021 20:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D639E897D0;
 Tue, 31 Aug 2021 20:21:39 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id g9so524600ioq.11;
 Tue, 31 Aug 2021 13:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yv9YRDAo21vPUpqq6KEd4YHQvcm8cpWSUp6HK2qPHDk=;
 b=nKEO2sA9RNXa/COb4Oof/EkP0lulNWqSv4xbF8nbsyHxRK6Q3kHq7P7GkBRtE3Kdt2
 bql4F0KUn7YGKXEDG7kdu+mYfTfaPoTxF92YNhNgpDNSXQk6eMnvrMYDtitXmnn2Qde9
 82NF1LfYU50VNXVUfS+x1Qmx6jpVNnxyyQXNOf8ax7UVDGPB9RrfHHl/rsqpFU4ZmjKb
 GchBWTcsoctOzjHoUA2EsDHNgfMCWLP4DjIN3W0tD5JMjLcXJ6w9Zh2O3HHaNzIUxyFH
 87qm6+KUk7of/7P7EfrRq3ZB5NSqy3bBd7B0ImsDIC9by7lfJw273DGdaJ9N2HxxUY8O
 MRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yv9YRDAo21vPUpqq6KEd4YHQvcm8cpWSUp6HK2qPHDk=;
 b=otXi5sSLfCeulYmNGo2BZsFNlKRgv5kVvl9s6mixEBYOZojCNSermAY80iC8mMBHFb
 vvu+YIqa2epNWzzSLKXuUJqkUFYWsiGERB54I14t4p1AVmALbWM+M/d62FUqrxrukF+q
 6feAy0e2cf25Gw94btQ18QT6lG40C2kEBcAY1044ClcLyGgG+7nggk9uq/vWneog0SR5
 yBpVzaZMNRe2jB5fpongG/mEkvmYJpHcO6IJDeZgx7W/okp5SH1Ozl6OSLL4YbU5kNU5
 RYJcCa1E/+fxm02QdL5it98fisvlpXATp2JJu9zJDAmFl2SPU8aIKvS31N1FLZiZPTK0
 KWQQ==
X-Gm-Message-State: AOAM532JAs8oYy3joTOCkFfkqm86eOABOop45g8+/UHYoHmNAY0Ik9We
 srXs/y0F2mzR9U7U7mAgbxI=
X-Google-Smtp-Source: ABdhPJz8fln4kSXOzMYZNrXWgoMrkH1zDRuSuWNF9ErsAK2lP1IaxWTOZDe/ytRdBgYLObj5IF2rAg==
X-Received: by 2002:a05:6638:191c:: with SMTP id
 p28mr4445838jal.41.1630441299131; 
 Tue, 31 Aug 2021 13:21:39 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id u15sm10597384ilk.53.2021.08.31.13.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:21:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7 0/8] use DYNAMIC_DEBUG to implement DRM.debug
Date: Tue, 31 Aug 2021 14:21:25 -0600
Message-Id: <20210831202133.2165222-1-jim.cromie@gmail.com>
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

Hi Jason, DRM folks,

In DRM-debug currently, drm_debug_enabled() is called a lot to decide
whether or not to write debug messages.  Each test is cheap, but costs
continue with uptime.  DYNAMIC_DEBUG "dyndbg", when built with
JUMP_LABEL, replaces each of those tests with a patchable NOOP, for
"zero cost when off" debugs.

this is v7:
- drops RFC distractions -JBaron
- drops patch-1: kp->data addition in moduleparams.h not needed -JBaron
- rework dyndbg callbacks to use kp->arg instead -JBaron
- fixes for problem configs reported -lkp 
- others noted per patch below ---

Broadly, this patchset does 3 things:

Adds DEFINE_DYNAMIC_DEBUG_CATEGORIES, which defines a mapping from
bits to "categorized" pr_debugs, a sysfs interface, and callbacks to
implement the bits as dynamic_debug >controls.  This is modelled after
DRM's debug interface.

Uses the new macro in amdgpu & i915 to control existing pr_debugs
according to their ad-hoc categorizations.

Adapts the drm-debug API (~20 macros) to configurably "replace"
drm_dbg & drm_dev_dbg with pr_debug & dev_dbg, which avoids
drm_debug_enabled() overheads.  DEFINE_DYNAMIC_DEBUG_CATEGORIES is
used to create the controlling bitmap, which is wired to __drm_debug
var so remaining drm_debug_enabled() users stay in sync.

on a virtual box:
bash-5.1# for m in i915 amdgpu nouveau; do modprobe $m; done
[43833.332326] dyndbg: 384 debug prints in module drm
[43833.609577] dyndbg: 211 debug prints in module drm_kms_helper
[43833.707124] dyndbg:   2 debug prints in module ttm
[43837.471166] dyndbg: 1727 debug prints in module i915
[43838.030774] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[43838.031905] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[43846.209583] dyndbg: 3852 debug prints in module amdgpu
[43846.261391] [drm] amdgpu kernel modesetting enabled.
[43846.262512] amdgpu: CRAT table not found
[43846.263264] amdgpu: Virtual CRAT table created for CPU
[43846.264293] amdgpu: Topology: Add CPU node
[43846.743781] dyndbg:   3 debug prints in module wmi
[43852.517497] dyndbg:  92 debug prints in module nouveau

There are a few multi-second delays there, just before dyndbg
initializes the large blocks of debug prints.


Jim Cromie (8):
  dyndbg: add DEFINE_DYNAMIC_DEBUG_CATEGORIES and callbacks
  dyndbg: remove spaces in pr_debug "gvt: core:" etc prefixes
  i915/gvt: use DEFINE_DYNAMIC_DEBUG_CATEGORIES to create "gvt:core:"
    etc categories
  amdgpu: use DEFINE_DYNAMIC_DEBUG_CATEGORIES
  drm_print: add choice to use dynamic debug in drm-debug
  drm_print: instrument drm_debug_enabled
  amdgpu_ucode: reduce number of pr_debug calls
  nouveau: fold multiple DRM_DEBUG_DRIVERs together

 drivers/gpu/drm/Kconfig                       |  13 +
 drivers/gpu/drm/Makefile                      |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c     | 293 ++++++++++--------
 .../gpu/drm/amd/display/dc/core/dc_debug.c    |  44 ++-
 drivers/gpu/drm/drm_print.c                   |  53 +++-
 drivers/gpu/drm/i915/Makefile                 |   4 +
 drivers/gpu/drm/i915/gvt/debug.h              |  18 +-
 drivers/gpu/drm/i915/i915_params.c            |  35 +++
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  36 ++-
 include/drm/drm_print.h                       | 150 +++++++--
 include/linux/dynamic_debug.h                 |  60 ++++
 lib/dynamic_debug.c                           |  79 ++++-
 12 files changed, 582 insertions(+), 206 deletions(-)

-- 
2.31.1

