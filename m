Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9A487251
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A84C1131C4;
	Fri,  7 Jan 2022 05:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50D511318B;
 Fri,  7 Jan 2022 05:29:50 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id r16so2097775ile.8;
 Thu, 06 Jan 2022 21:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HE6rGl4+lTFmvO6USR2ILfrynKOlclK8dPgu7S7zjx4=;
 b=a/8NVQILS1Z0rPpJg3vXACkLCnhakIXxZp6n3duXgKfvjT8HZFx/KJHo6Ek2L/rLa0
 JX4ih/IOGrPScR1hhbs/QJLpS1+2t5vR9CVh+L3v5NvKvXt1TQ03Ei/ra2rAM5WGBgXd
 EVhHOUWb5ulJlsEcPxZz3ocXR5vCJ1bTVEwXLu1Ut4lxwk/HbTaioO4dzaQyeoY3AUBq
 s7Z7NwG45L1YnJ4i2aSMO+T8NRoJzhkJVUKBkZKCKCf+mzTDgkDL1ZpwhD4wPWcQdWMF
 oZ9xXj2J5m45GQnndGsiXcL3Pcxm8Grpgtb+5wfiuAfUAeKyEuc8D/ZOQcxfKnv3BQ+N
 lR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HE6rGl4+lTFmvO6USR2ILfrynKOlclK8dPgu7S7zjx4=;
 b=AkZ8ExCFruFnbuWCSUiLRuPPvwSKwZe4x1J24jbNlo9JeXjbHm7geknjpimn+VE8v7
 dlvAo+HVcIoex+a39Tq13tcHaFsY8LLNd7l7kv06KagzKwIhUD9TlJF7aMcDW+Lp4LZi
 8PyOIzxzuPzzXOaqLrGRiUJFXAI/UQnlYjVog3GJ9cGNlUfhny22VBi3YMMCssOO2WT9
 UuLVp34DObeidewvvhOknVIqdL7Vi1s3s/Bt9PMUh1PJ3OeXnXUf6lfql1WzuurOkg3Q
 rAaw6Vra730RFE2CSrTc2uoZhxu7rWiXXOCLfFnsZPck+Efjjg0EY39fnZ0bV+CEGM36
 pTIA==
X-Gm-Message-State: AOAM533SyCreafbWdAI0BTSs+bGUIJMQ0vAmOp2Z4SwJ8DRf93i33jnw
 eg3tK0bgsRe30UGq31Cj/N2l4GhdqiE=
X-Google-Smtp-Source: ABdhPJzVRVEb5+ua7spdzukBh9MZssTqGLo4AVH1KFZsovhJMEbVb37fAvB6OQiouVHb83nK2gxmag==
X-Received: by 2002:a05:6e02:1cae:: with SMTP id
 x14mr29287416ill.237.1641533389790; 
 Thu, 06 Jan 2022 21:29:49 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:29:49 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 00/19] dyndbg & drm.debug to tracefs
Date: Thu,  6 Jan 2022 22:29:23 -0700
Message-Id: <20220107052942.1349447-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Jason, Steve, Greg, DRM-folks,

This patchset plumbs debug streams, from dynamic-debug, and from
drm.debug, into tracefs.  Enabling traffic is done on both source &
destination:

	# enable at source
	echo module usbcore +T > /proc/dynamic_debug/control
	# enable events into tracefs
	echo 1 > /sys/kernel/tracing/events/dyndbg/enable

	# enable at source
	echo 0x03 > /sys/module/drm/parameters/debug
	# enable events into tracefs
	echo 1 > /sys/kernel/tracing/events/drm/enable

This allows selectivity at the sources, and in principle, filtering at
tracefs (which is unaddressed, except for arg-passthru).


Here is v11, it differs subsantially from v10:

A: All tracefs action is via 4 new trace-events:

from dyndbg:
  pr_debug() sends trace_prdbg()
  dev_dbg()  sends trace_devdbg()
  both preserve args unchanged

similarly from drm:
  drm_dev_dbg() -> trace_drm_devdbg()
  drm_dbg()	-> trace_drm_dbg()
  again, args are captured unchanged.
  for some reason 3 other drm_vblank* events showed up, I dont know why.

These 4 events (not counting vblank) all capture the args unchanged;
ISTM full exposure of available info is best for filtering/triggering
purposes.


B: dynamic-debug gets proper .class_id, and query support (dyndbg:)

so that this is legal input:

   echo module drm class 3 +T > /proc/dynamic_debug/control

v10 used "format drm:core:", which worked, but required addition of
category string prefixes, and possible user-facing-changes issues.

New field is uint:4, big enough to fit DRMs enum drm_debug_category
(once it has been condensed). The name is .class_id, distinct from but
related to DRMs "category".

This also includes _CLS name & arg extensions of the Factory macros
that implement dyndbgs jump-label/NOOP optimizations.


C: integration of dyndbg into drm.debug (drm_print:)

The purpose here (and originally) is to avoid drm_debug_enabled()
runtime costs, and to put a more flexible substrate underneath the
sysfs bitmap api.  Ive made it CONFIG dependent, since each _ddebug is
56 bytes, and i915 & amdgpu have ~1700 & ~3800 callsites respectively,
of which 127 & ~2k are plain pr_debugs.

1. We shrink enum drm_debug_category to fit in 4 bits, at nominal
   cost of BIT(category) at runtime, which dyndbg will avoid anyway.

2. Add the trace_drm_*dbg() events

3. insert macro indirection, and use it to wrap drm_*dbg()s in
   dyndbg's _no_desc_ Factory macro.

4. add __drm_debug_enabled (optimized to true) to use behind jumplabel.

5. use _CLS extension of _no_desc_ Factory macro
   this makes cls available to initialize _ddebug.class_id

6. alter drm_*dbg, replacing category with struct _ddebug *desc.
   desc.class_id is category
   desc.flags allows selection of PRINTK or TRACE or both

7. propagate struct _ddebug *desc thru trace_drm_*dbg()
   make all of _ddebug available for filtering

8. add sysfs bitmap to dyndbg, use it to implement drm.debug


D: The "flight-recorder" special instance was unneeded, and is gone:

this handles it generically:

    mkdir instances/flightrec
    echo 1 > instances/flightrec/events/drm/enable
    echo module autopilot +T >/proc/dynamic_debug/control

v10 is here:
https://lore.kernel.org/lkml/20211105192637.2370737-1-jim.cromie@gmail.com/

patches 1-3 are from:
  https://lore.kernel.org/lkml/20200721141105.16034-1-vincent.whitchurch@axis.com/

this patchset addresses goals of:
  https://patchwork.freedesktop.org/series/78133/
  https://lore.kernel.org/lkml/3706af20bc64a320ff8f3ff8950738b988f4bdf5.1636452784.git.quic_saipraka@quicinc.com/


Jim Cromie (19):

1st 3 are basically direct from <vincent.whitchurch@axis.com>
execpt I dropped his printk:dyndbg event:
  dyndbg: add _DPRINTK_FLAGS_ENABLED
  dyndbg: add _DPRINTK_FLAGS_TRACE
  dyndbg: add write-to-tracefs code

add 2 events, and record args (could be squashed)
  dyndbg: add trace-events for pr_debug, dev_dbg
  dyndbg: add desc, dev fields to event record

add field, selection mechanisms, and CLS extensions to Factory macros
  dyndbg: add class_id to callsites

make category fit in .class_id:
  drm_print: condense enum drm_debug_category

repeat trace event addition:
  drm_print: add trace_drm_dbg, trace_drm_devdbg events

kconfig+Make-flag:
  drm_print: add CONFIG_DRM_USE_DYNDBG

macro indirection:
  drm_print: interpose drm_dev_dbg, __drm_dbg with forwarding macros

add >control entries for ~4660 drm.debug callsites:
  drm_print: wrap drm_dev_dbg in _dynamic_func_call_no_desc
  drm_print: wrap drm_dbg in _dynamic_func_call_no_desc

prep:
  drm_print: refine drm_debug_enabled for dyndbg+jump-label

drive-by:
  drm_print: prefer bare printk KERN_DEBUG on generic fn

get .class_id initialized at compile.
  drm_print: use _dynamic_func_call_no_desc_cls

need this to selectively trace/print:
  drm_print: add struct _ddebug desc to drm_dbg, drm_dev_dbg

propagate arg upgrade of HEAD~1 into trace-events:
  drm_print: add struct _ddebug *desc to trace-drm-*() params

add and use sysfs bitmap support:
  dyndbg: add DEFINE_DYNAMIC_DEBUG_CLASSBITS macro and callbacks
  drm_print: use DEFINE_DYNAMIC_DEBUG_CLASSBITS for drm.debug

 .../admin-guide/dynamic-debug-howto.rst       |  12 +
 drivers/gpu/drm/Kconfig                       |  12 +
 drivers/gpu/drm/drm_print.c                   |  66 +++--
 include/drm/drm_print.h                       |  80 +++--
 include/linux/dynamic_debug.h                 | 101 ++++++-
 include/trace/events/drm.h                    |  68 +++++
 include/trace/events/dyndbg.h                 |  74 +++++
 lib/dynamic_debug.c                           | 273 +++++++++++++++---
 8 files changed, 601 insertions(+), 85 deletions(-)
 create mode 100644 include/trace/events/drm.h
 create mode 100644 include/trace/events/dyndbg.h

-- 
2.33.1

