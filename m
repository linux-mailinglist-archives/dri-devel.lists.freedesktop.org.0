Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA844DD76
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 23:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1FB6E444;
	Thu, 11 Nov 2021 22:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F05D6E3F4;
 Thu, 11 Nov 2021 22:02:13 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id k21so8791222ioh.4;
 Thu, 11 Nov 2021 14:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0un44DHPF22aIu/HzLHma+ZAGuW3yhyQnyzoD6Bo4g=;
 b=LsPGof+zsUFAVyeeuWMR8rDTyfXXZteC5O6U+uTIqDG0dmpHnvGSBPuAE1Ep3ZGjoW
 chAGE5CJEECetg8w7TPZ9khCi6BMRIm7GKcd1UyTczg6lyrFUh7T0faa2dorBtfoL/9/
 DyZ9CJkdT6dhVy7VCoCY9/i48ts1cglC4+tmIzGcNFRSIFuBEPzszCz3oWOdQeA0Spf2
 gI8eaCja1joJdIaJpOkex4VaUgHkEqYV97oNWr2xlwOR4afIFCcQfklfQy3q+JJNRP7f
 YGLb7AlgVFuo8MkeYYAL1JkIQmrsokF73vh1bMsmN+VZns84uzuRAZHWeUxNZ13CzOhw
 Ca1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W0un44DHPF22aIu/HzLHma+ZAGuW3yhyQnyzoD6Bo4g=;
 b=xJUPMJG4zofHSHq9qXFyFFYc2G3w1F/Zy0SFFY13HxnalLinVURkGu3f16KXsXaZra
 5Qsk7X6StH/wWVCZ86B4uffMcPoONuQZwQJ+gTipSdKSJRJ33q6q36wDzHI4kJOPy+mb
 p61oZKOh3X21NBlo7zRmXakto/2nI111idHCYGNie/EEw14XNuRAOKWZWXUJZk6oPUMY
 8lEYQ29y3jPTy8S/7fBWwj7X2dlleCSHbqUfgaQeWG7hWE/h2qc83HnQkrDGibQf1mQq
 p7f5Iwx3lA9sLRQHkJOUiGtB7m9nkGRLj+p0q/cxrQlcrSSI3O7f4BI9nVWW4iCDmFvw
 ofgA==
X-Gm-Message-State: AOAM531FRvFnT0tOJFQI2qVo/cSDuwv8EHhFI2yinNCUWoIRvKc7o5zN
 1pHB3CDgfUgu4+JUIiyI6VI=
X-Google-Smtp-Source: ABdhPJzs6rZ8CI3ZcO3tiNDiGEXL5v28XlBw3PrkhFHmmi3ZAJA4is7Z6XBwGrA6mAdZC8h8pl/vGw==
X-Received: by 2002:a05:6638:2402:: with SMTP id
 z2mr1084436jat.122.1636668132873; 
 Thu, 11 Nov 2021 14:02:12 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id t5sm2612315ilp.8.2021.11.11.14.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 14:02:12 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, robdclark@gmail.com,
 sean@poorly.run, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 lyude@redhat.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 00/10 RESEND] use DYNAMIC_DEBUG to implement DRM.debug &
 DRM.trace
Date: Thu, 11 Nov 2021 15:01:56 -0700
Message-Id: <20211111220206.121610-1-jim.cromie@gmail.com>
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

Hi Jason, Greg, DRM-everyone, everyone,

resend to add more people, after rebasing on master to pick up
306589856399 drm/print: Add deprecation notes to DRM_...() functions

This patchset has 3 separate but related parts:

1. DEFINE_DYNAMIC_DEBUG_BITGRPS macro [patch 1/10]

   Declares DRM.debug style bitmap, bits control pr_debugs by matching formats
   Adds callback to translate bits to $cmd > dynamic_debug/control
   This could obsolete EXPORT(dynamic_debug_exec_queries) not included.

   /* anticipated_usage */
   static struct dyndbg_desc drm_categories_map[] = {
   	  [0] = { DRM_DBG_CAT_CORE },
	  [1] = { DRM_DBG_CAT_DRIVER },
	  [2] = { DRM_DBG_CAT_KMS },
	  [3] = { DRM_DBG_CAT_PRIME }, ... };

   DEFINE_DYNAMIC_DEBUG_BITGRPS(debug, __drm_debug,
				" bits control drm.debug categories ",
				drm_categories_map);

   Please consider this patch for -next/now/current:
   - new interface, new code, no users to break
   - allows DRM folks to consider in earnest.
   - api bikeshedding to do ?
     struct dyndbg_desc isnt that great a name, others too probably.

2. use (1) to reimplement drm.debug [patches 3-7]:

   1st in amdgpu & i915 to control existing pr_debugs by their formats
   POC for (1)
   then in drm-print, for all drm.debug API users
   has kernel-footprint impact:
      amdgpu has ~3k pr_debugs.  (120kb callsite data)
      i915.ko has ~2k  

   avoids drm_debug_enabled(), gives NOOP savings & new flexibility.
   changes drm.debug categories from enum to format-prefix-string
   alters in-log format to include the format-prefix-string
   Daniel Vetter liked this at -v3
   https://lore.kernel.org/lkml/YPbPvm%2FxcBlTK1wq@phenom.ffwll.local/
   Im sure Ive (still) missed stuff.


3. separately, Sean Paul proposed: drm.trace to mirror drm.debug to tracefs
   https://patchwork.freedesktop.org/series/78133/

He argues:
   tracefs is fast/lightweight compared to syslog
   independent selection (of drm categories) to tracefs
       gives tailored traffic w.o flooding syslog

ISTM he's correct.  So it follows that write-to-tracefs is also a good
feature for dyndbg, where its then available for all pr_debug users,
including all of drm, on a per-site basis, via echo +T >control.  (iff
CONFIG_TRACING).

So basically, I borg'd his:
   [patch 14/14] drm/print: Add tracefs support to the drm logging helpers

Then I added a T flag, so it can be toggled from shell:

   # turn on all drm's pr_debug --> tracefs
   echo module drm +T > /proc/dynamic_debug/control

It appears to just work: (RFC)

The instance name is a placeholder, per-module subdirs kinda fits the
tracefs pattern, but full mod/file-basename/function/line feels like
overkill, mod/basename-func.line would flatten it nicely. RFC.


[root@gandalf dyndbg-tracefs]# pwd
/sys/kernel/tracing/instances/dyndbg-tracefs
[root@gandalf dyndbg-tracefs]# echo 1 > /sys/module/drm/parameters/trace
[root@gandalf dyndbg-tracefs]# head -n16 trace | sed -e 's/^#//'
 tracer: nop

 entries-in-buffer/entries-written: 405/405   #P:24

                                _-----=> irqs-off
                               / _----=> need-resched
                              | / _---=> hardirq/softirq
                              || / _--=> preempt-depth
                              ||| / _-=> migrate-disable
                              |||| /     delay
           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
              | |         |   |||||     |         |
           <...>-2254    [000] .....  7040.894352: __dynamic_pr_debug: drm:core: comm="gnome-shel:cs0" pid=2254, dev=0xe200, auth=1, AMDGPU_CS
           <...>-2207    [015] .....  7040.894654: __dynamic_pr_debug: drm:core: comm="gnome-shell" pid=2207, dev=0xe200, auth=1, DRM_IOCTL_MODE_ADDFB2
           <...>-2207    [015] .....  7040.995403: __dynamic_pr_debug: drm:core: comm="gnome-shell" pid=2207, dev=0xe200, auth=1, DRM_IOCTL_MODE_RMFB
           <...>-2207    [015] .....  7040.995413: __dynamic_pr_debug: drm:core: OBJ ID: 121 (2)

This is the pr-debug doing most of that logging: (from dynamic_debug/control)

  drivers/gpu/drm/drm_ioctl.c:866 [drm]drm_ioctl =T "drm:core: comm=\042%s\042 pid=%d, dev=0x%lx, auth=%d, %s\012"

Turning on decoration flags changes the trace:

  echo module drm format drm:core: +mflt > /proc/dynamic_debug/control 

           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
              | |         |   |||||     |         |
           <...>-2254    [003] ..... 15980.936660: __dynamic_pr_debug: [2254] drm:drm_ioctl:866: drm:core: comm="gnome-shel:cs0" pid=2254, dev=0xe200, auth=1, AMDGPU_CS
           <...>-2207    [015] ..... 15980.936966: __dynamic_pr_debug: [2207] drm:drm_ioctl:866: drm:core: comm="gnome-shell" pid=2207, dev=0xe200, auth=1, DRM_IOCTL_MODE_ADDFB2
           <...>-2207    [015] ..... 15981.037727: __dynamic_pr_debug: [2207] drm:drm_ioctl:866: drm:core: comm="gnome-shell" pid=2207, dev=0xe200, auth=1, DRM_IOCTL_MODE_RMFB
           <...>-2207    [015] ..... 15981.037739: __dynamic_pr_debug: [2207] drm:drm_mode_object_put:195: drm:core: OBJ ID: 124 (2)
           <...>-2207    [015] ..... 15981.037742: __dynamic_pr_debug: [2207] drm:drm_mode_object_put:195: drm:core: OBJ ID: 124 (1)

The FUNCTION could stand tweaking (to match the callsite in the
control file, cited above), or perhaps replaced by the 'mfl'
decorations; the 't' flag is redundant for trace. Meh.

SELFTEST

A previous version of this patchset added test_dynamic_debug.ko, but
it relied upon code I ripped out when I made tracefs available by
default (without modules having to register 1st).  So it fails 10/29
tests, which counted +T sites executed, via side effect.

TODO: userspace selftest

  # to set expected tracing activity
  echo module test_dynamic_debug function do_debugging +T > control

  # run do_debugging function (todo: add sysfs knob) 
  echo 2 > /sys/module/test-dynamic-debug/parameters/run_me

If thats wrapped in the right trace_on, trace_pipe, etc incantations,
the +T enabled pr_debugs in do_debugging() can be counted, compared
against expectations, and passed or failed.

change since v9:
. patch confict against drm-misc resolved
. s/CATEGORIES/BITGRPS/ in 1/10 - keep name generic: bitmap + groups
. CATEGORIES is drm term, use it there only
. fix api friction wrt drm.trace knob
  2 separate macros: DEFINE_DYNAMIC_DEBUG_{LOG,TRACE}_GROUPS - JBaron

v9: https://patchwork.freedesktop.org/series/96327/
v8: https://patchwork.freedesktop.org/series/93914/
    https://lore.kernel.org/lkml/20210915163957.2949166-1-jim.cromie@gmail.com/

The major change since v8 is that +T now works for all users, if
CONFIG_TRACING=y, otherwise it complains/errors.

SUMMARY

- drm as dyndbg user adds almost 9k callsites to kernel running this patchset
  substantial footprint
  substantial source of pr-debug-trace events (not all, but some useful)

[jimc@gandalf wk-next]$ wc /proc/dynamic_debug/control 
8927 71062 1099699 /proc/dynamic_debug/control
[jimc@gandalf wk-next]$ uname -a
Linux gandalf 5.15.0-rh2-12144-g5d5db04dfb0c #3 SMP PREEMPT Thu Nov 11 10:5

- pr_debug as event provider
  using exported trace_array_printk 
  cheap with JUMP_LABEL
  precise, ad-hoc or organized callsite enablement
  callsite descriptor is in its interface, so are VARARGS
  inspectable, extensible wo api churn,
  iff trace_array_printk can do it.


Jim Cromie (10):
  dyndbg: add DEFINE_DYNAMIC_DEBUG_BITGRPS macro and callbacks
  drm: fix doc grammar
  amdgpu: use dyndbg.BITGRPS to control existing pr_debugs
  i915/gvt: trim spaces from pr_debug "gvt: core:" prefixes
  i915/gvt: use dyndbg.BITGRPS for existing pr_debugs
  drm_print: add choice to use dynamic debug in drm-debug
  drm_print: instrument drm_debug_enabled
  dyndbg: add print-to-tracefs, selftest with it - RFC
  dyndbg: create DEFINE_DYNAMIC_DEBUG_LOG|TRACE_GROUPS
  drm: use DEFINE_DYNAMIC_DEBUG_TRACE_GROUPS in 3 places

 .../admin-guide/dynamic-debug-howto.rst       |   7 +-
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/Kconfig                       |  26 ++
 drivers/gpu/drm/Makefile                      |   2 +
 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +
 .../gpu/drm/amd/display/dc/core/dc_debug.c    |  55 ++++-
 drivers/gpu/drm/drm_print.c                   |  62 +++--
 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/gvt/debug.h              |  18 +-
 drivers/gpu/drm/i915/intel_gvt.c              |  47 ++++
 include/drm/drm_drv.h                         |   2 +-
 include/drm/drm_print.h                       | 182 +++++++++++---
 include/linux/dynamic_debug.h                 |  88 ++++++-
 lib/Kconfig.debug                             |  11 +
 lib/Makefile                                  |   1 +
 lib/dynamic_debug.c                           | 203 ++++++++++++++--
 lib/test_dynamic_debug.c                      | 222 ++++++++++++++++++
 17 files changed, 843 insertions(+), 88 deletions(-)
 create mode 100644 lib/test_dynamic_debug.c

-- 
2.31.1

