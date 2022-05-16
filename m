Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDB55293E5
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780CC10E40E;
	Mon, 16 May 2022 22:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C6110E6E4;
 Mon, 16 May 2022 22:56:50 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id q203so1804195iod.0;
 Mon, 16 May 2022 15:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qcZZHg+TLqIZsJwY0xT23BgALoUDhOorLW9Ut6wOSOw=;
 b=FqvigUMS8JGQuCA1Nsz2ZCQW0CGL3/J+5HWxfwlJkBB+UD2M1w5l1guOsm4XdY8k/W
 WgCsM8XzRwK+/bIP+d2+9ScKj8PHlGPJ1NS6rD85hbumfsuEfqXAqYJg1LrGn3oLCdK2
 3YrkXF2ps9m5n1IxyBNEVCtPHeTXpNFBejUIASmi8jsanEGgyVyJtU/lcKRvoYGeqc93
 Fh3/9oFFW5CCoI354AHf6i0PlZUmIffGcw9GPuf8C2zyHoB2+5Px+mHNmPxg2xss+v09
 P7+mkOG/dOsAgj84+bp0J0Hzac+r1XdD0yCCcc8NcCDTTbVTYmaTa3/JCujLwAxtyJPv
 xasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qcZZHg+TLqIZsJwY0xT23BgALoUDhOorLW9Ut6wOSOw=;
 b=59R0AEsNjC6aETYxaQiQ8uvGHeiZsLgyyRRVJ7llKtV/LB/RYnc9A/EOzSf5TndqBD
 dnvl6mwH+DhhJI1szmErLpakg0SF5CmsI/YwjdLStyj4D1xIlz8kuYALLA7Pw5aHfiPM
 B8fz8ShT7dd2V8sN4ZBsTLWjYBv2sp8VeuRUQeOqNCzkIjzlYszj0iz/oLG++rIZjo7I
 Rk1LqbJ3dEuZqtqH7DsZSAwe+JZGUACcEExyhK1UhtSV8Fjx5N+5jIRaVtQNH3Gvwa53
 KsTknVbxuHS2EvOnNmWbGoHFRp9KJIYB9dYee5c16ES0iy0TOd6oHtPS5XO3PWZnbreh
 0IbA==
X-Gm-Message-State: AOAM530wACE/EZ8WK8iq+Ei6FYKtWzZ6pn4xqcHlYAOujjvKdD5n/b/9
 6/JrvAsp9WOM+uMtgWoVgXo=
X-Google-Smtp-Source: ABdhPJy5J7Mt2Dw8Hniu35JQaJ+4z10SEom9QpdbA6SOCZgC0kdiBY6n9OBegQMCb5L4wG4Q1Di/8A==
X-Received: by 2002:a02:b804:0:b0:32d:fc36:b397 with SMTP id
 o4-20020a02b804000000b0032dfc36b397mr10079451jam.271.1652741809030; 
 Mon, 16 May 2022 15:56:49 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:56:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH v2 00/27] DRM.debug on DYNAMIC_DEBUG, add trace events
Date: Mon, 16 May 2022 16:56:13 -0600
Message-Id: <20220516225640.3102269-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 Chris Wilson <chris@chris-wilson.co.uk>, will@kernel.org, maz@kernel.org,
 mingo@redhat.com, daniel.vetter@ffwll.ch, quic_psodagud@quicinc.com,
 arnd@arndb.de, linux-arm-msm@vger.kernel.org, rostedt@goodmis.org,
 Pekka Paalanen <ppaalanen@gmail.com>, mathieu.desnoyers@efficios.com,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM.debug API is 23 macros, issuing 10 exclusive categories of debug
messages.  By rough count, they are used 5140 times in the kernel.
These all call drm_dbg or drm_devdbg, which call drm_debug_enabled(),
which checks bits in global __drm_debug.  Some of these are page-flips
and vblanks, and get called often.

DYNAMIC_DEBUG (with CONFIG_JUMP_LABEL) is built to avoid this kind of
work, with NOOPd jump/callsites.

This patchset is RFC because:
- it touches 2.5 subsystems: dyndbg, drm, tracefs (new events)
- dyndbg class support is built for drm, needs it for validation
- new api, used by drm
- big memory impact, with 5100 new pr-debug callsites.
- drm class bikeshedding opportunities
- others, names etc.

DYNAMIC_DEBUG:

Adapt to directly represent 32 exclusive classes / categories.
All existing users get _CLASS_DFLT:31, reserving 0-30 for opt-in.

dynamic_debug_register_classes(): Tells dyndbg that caller/client is
using .class_id's 0..N, and wants them exposed and manipulatable with
names: DRM_UT_KMS etc.

Client invokes DYNAMIC_DEBUG_CLASSES to define the name->id map,
then registers it during its initialization.

Then, when a dyndbg command-query has "class FOO":

 echo class DRM_UT_KMS +p > /proc/dynamic_debug/control

ddebug_change() will 1st ddebug_validate_classname() for each module,
using its registered class-maps; only modules which know DRM_UT_KMS
will get those callsite adjustments.  This "protects" each module's
class-id space, unlike "class 4" query syntax.

Add bitmap support for:
  echo 0x02 > /sys/module/drm/parameters/debug

Add symbolic bitmap, because we have the class-names:
  echo +DRM_UT_KMS,+DRM_UT_ATOMIC > /sys/module/drm/parameters/debug

Add test_dynamic_debug, to prove out the API.

 which is (used 3x to prove class-id ranges):
  - DYNAMIC_DEBUG_CLASSES(var, ... [3 class-name-literals each])
  - dynamic_debug_register_classes(var)
  - dynamic_debug_unregister_classes(var)
 also (6x):
  +module_param_cb(<node-name>, &param_ops_dyndbg_classes, /[pt][123]_bitmap/, 0600);

Bits 0,1,2 of each of the 6 bitmaps control the 3 named classes in
each of 3 groups, toggling their p,T bits respectively.

RFC:

dynamic_debug_register_classes() cannot act early enough to be in
effect at module-load.  So this will not work as you'd reasonably
expect:

  modprobe test_dynamic_debug dyndbg='+pfm; class FOO +pfmlt'

The 1st query:+pfm will be enabled during load, but in the 2nd query,
"class FOO" will be unknown at load time.  Early class enablement
would be nice.  DYNAMIC_DEBUG_CLASSES is a static initializer, which
is certainly early enough, but Im missing a trick, suggestions?

Wildcarding on classname is possible, maybe useful:

   echo +DRM_UT_\* > /sys/module/drm/parameters/debug

If contemplated in earnest, it should consider the difference between
"DRM_*" and "*_KMS", wrt observing across class hierarchies, as well
as decide whether that echo means 1st match, or all matching names.

__pr_debug_cls(cls, fmt,...) is just for testing, drm doesnt need it.


DRM adaptation:

Basically, these patches add another layer of macro indirection, which
by CONFIG_DRM_USE_DYNAMIC_DEBUG=y, wraps drm_*dbg() in dyndbg's callsite
Factory macro, and adds the new descriptor arg to the funcs.

With these patches, drm.debugs appear as controllable *pr-dbg* callsites:

[   11.804352] dyndbg: register_classes: drm
[   11.920715] dyndbg: 234 debug prints in module drm_kms_helper
[   11.932135] dyndbg:   2 debug prints in module ttm
[   11.936119] dyndbg:   8 debug prints in module video
[   12.537543] dyndbg: 1756 debug prints in module i915
[   12.555045] dyndbg: register_classes: i915
[   12.666727] AMD-Vi: AMD IOMMUv2 functionality not available on this ..
[   13.735310] dyndbg: 3859 debug prints in module amdgpu

amdgpu's large count includes:
   582  direct uses/mentions of pr_debug
    43  defns of DC_LOG_*, which use either pr_debug or DRM_DEBUG_*
 ~1000  uses of DC_LOG_*
  1116  uses of dml_print in drivers/gpu/drm/amd
    15  drm_dbg_\\w+ drivers/gpu/drm/amd
   273  DRM_DEBUG_\\w+ drivers/gpu/drm/amd    

i915 has:
  1072  drm_dbg_\\w+ drivers/gpu/drm/i915/ | wc  -l
   200  DRM_DEBUG_\\w+ drivers/gpu/drm/i915/
    46  pr_debug drivers/gpu/drm/i915/
   144  gvt_dbg_\\w+ drivers/gpu/drm/i915/gvt, using pr_debug

This impacts the data footprint, so everything new/drm is dependent on
DRM_USE_DYNAMIC_DEBUG=y.

RFC for DRM:

- decoration flags "fmlt" do not work on drm_*dbg().
  (drm_*dbg() dont use pr_debug, they *become* one flavor of them)
  this could (should?) be added, and maybe tailored for drm.
  some of the device prefixes are very long, a "d" flag could optionalize them.

- api use needs review wrt drm life-cycle.
  enum drm_debug_category and DYNAMIC_DEBUG_CLASSES could be together?

- class-names could stand review, perhaps extension
  "drm:core:" etc have appeared (maybe just from me)
  or a "plan" to look at it later

- i915 & amdgpu have pr_debugs (DC_LOG_*, gvt_dbg_*) that have
class-ish prefixes that are separate from, but similar to DRM_UT_*,
and could stand review and possible unification with reformed or
extended drm categories.

- the change to enum drm_debug_category from bitmask values to 0..31
  means that we foreclose this possiblility:

   drm_dbg(DRM_UT_CORE|DRM_UT_KMS, "wierd double-cat experiment");

- nouveau has very few drm.debug calls,
  has NV_DEBUG, VMM_DEBUG, nvkm_printk_, I havent looked deeply.

DYNDBG/DRM -> TRACEFS

My 1st try was motivated by Sean Paul's patch - DRM.trace:
https://patchwork.freedesktop.org/patch/445549/?series=78133&rev=5

Those used trace_printk, so were not good for upstream.

Vincent Whitchurch's code:
https://lore.kernel.org/lkml/20200721141105.16034-1-vincent.whitchurch@axis.com/

added similar features, by sending printk:console events from dyndbg.
It met with a good reception from Steve Rostedt, so I re-started with
that.

The biggest addition (from UI viewpoint) is 4 new trace-events, 2 each
from dyndbg (pr_debug, dev_dbg) and drm (drm_dbg, drm_dev_dbg); 2 have
dev, other 2 avoid storing nulls.  Im unsure that 4 distinctions is
valuable, but it seemed most obvious to reflect them straight thru to
tracefs.

RFC: the event/message formats are a bit of a mash-up; 

in /sys/kernel/tracing:
drm/drm_debug/format:print fmt: "%s", __get_str(msg)
drm/drm_devdbg/format:print fmt: "cat:%d, %s %s", \
	REC->drm_debug_category, dev_name(REC->dev), __get_str(msg)

The 1st prints just the mesg itself, 2nd prints category as int;
it'd be better if DRM.class-name replaced (not just augmented) the
event-name "drm_devdbg" in the trace, is that possible ?

dyndbg/prdbg/format:
print fmt: "%s.%s %s", REC->desc->modname, REC->desc->function, __get_str(msg)
dyndbg/devdbg/format:
print fmt: "%s.%s %s", REC->desc->modname, REC->desc->function, __get_str(msg)

These add a prefix string similar to dyndbg's decorations, except they
don't use dyndbg's "fmlt" decoration flags.

There are also 3 vblank trace-events already,
  declared in: drivers/gpu/drm/drm_trace.h
15:TRACE_EVENT(drm_vblank_event,
35:TRACE_EVENT(drm_vblank_event_queued,
52:TRACE_EVENT(drm_vblank_event_delivered,

STATUS

kernel-test-robot tested this patchset (on 5.18-rc6).
github:[jimc:blead] BUILD SUCCESS 6c59e52ac81dd81ac7da4522a5e15b7ac488d5b5
May 15, 2022, 8:39 AM (1 day ago)


Ive been testing, mostly on virtme, mostly with this:
#!/bin/bash

# test class FOO handling of dynamic-debug

alias lmt='modprobe test_dynamic_debug dyndbg=+pmf'
alias rmt='rmmod test_dynamic_debug'
alias look='grep test_dynamic_debug /proc/dynamic_debug/control'

lookfor() {
    grep $1 /proc/dynamic_debug/control
}

vx() {
    echo $* > /sys/module/dynamic_debug/parameters/verbose
}

# amdgpu has ~2200 pr-debugs (before drm-debug-on-dyndbg),
# use them to prove modprobe <mod> dyndbg=+p works

test_param_dyndbg() {

    modprobe amdgpu dyndbg=+pfm
    let count=$(grep =pmf /proc/dynamic_debug/control | grep amdgpu | wc -l)

    if [ $count -gt 200 ] ; then
	echo amdgpu has $count pr-dbgs
	return 0
    else
	echo failed $count
	return -1
    fi
}
out=$(test_param_dyndbg)
echo out:$out $?
[ $? -eq 0 ] || exit $?

qry_cmd() {
    echo "QCMD: $*   >control" >&2
    echo $* > /proc/dynamic_debug/control
}

# enable dyndbg tracing
dynable() {
    grep -P \\d $SKT/events/dyndbg/{.,*}/enable
    echo 1 > $SKT/events/dyndbg/enable
    grep -P \\d $SKT/events/dyndbg/{.,*}/enable
}

# enable drm tracing
drmable() {
    grep -P \\d $SKT/events/drm/{.,*}/enable
    echo 1 > $SKT/events/drm/enable
    grep -P \\d $SKT/events/drm/{.,*}/enable
}

function doit() {
    cat /sys/module/test_dynamic_debug/parameters/do_prints
}

# test class FOO behavior of test_dynamic_debug module
ttest_module__() {
    flg=$1
    dmesg -C
    modprobe test_dynamic_debug dyndbg=+pfm
    doit

    for cls in FOO BAR BUZZ; do
	qry_cmd module test_dynamic_debug class $cls $flg
	doit
    done
    doit

    for cls in Foo Bar Buzz; do
	qry_cmd module test_dynamic_debug class $cls $flg
	doit
    done
    doit

    for cls in bing bong boom; do
	qry_cmd module test_dynamic_debug class $cls $flg
	doit
    done
    doit

    dmesg | grep class
}

ttest_module() {

    ttest_module__ +p
    ttest_module__ -p

    #ttest_module__ +T
    #ttest_module__ -T
}

#dynable
#drmable

ttest_module
grep test_dyn /proc/dynamic_debug/control


# use/test bitmaps

set_tddm_() {
    val=$1;
    knob=$2;
    echo "TDDM: $val >$knob" >&2
    echo $val > /sys/module/test_dynamic_debug/parameters/$knob
    cat /sys/module/test_dynamic_debug/parameters/$knob
}

CLS_1="FOO -FOO +FOO -FOO BAR -BAR +BAR -BAR BUZZ -BUZZ +BUZZ -BUZZ"
CLS_2=" Foo  Bar  Buzz -Foo -Bar -Buzz +Foo +Bar +Buzz -Foo -Bar -Buzz"
CLS_3=" bing bong boom -bing -bong -boom +bing +bong +boom -bing -bong -boom"

tddm_sysnode_classes__() {
    targ=$1
    shift
    cls=$*
    for bitsym in $cls;
    do
	set_tddm_ $bitsym $targ
    done
}

# work all 3 sysfs bitmaps

for sysnode in c1_syslog_bits c2_syslog_bits c3_syslog_bits;
do
    for val in 0 1 2 4 8 0;
    do
	tddm_sysnode_classes__ $sysnode $val
    done
done

tddm_sysnode_classes__ c1_syslog_bits $CLS_1
tddm_sysnode_classes__ c2_syslog_bits $CLS_2
tddm_sysnode_classes__ c3_syslog_bits $CLS_3

echo "show unknown: c3-names on c1-knob" >&2
tddm_sysnode_classes__ c1_trace_bits $CLS_3

echo "flags look inverted" >&2
tddm_sysnode_classes__ c1_syslog_bits $CLS_1

CLS_1_=FOO,-FOO,+FOO,-FOO,BAR,-BAR,+BAR,-BAR,BUZZ,-BUZZ,+BUZZ,-BUZZ
CLS_2_=Foo,Bar,Buzz,-Foo,-Bar,-Buzz,+Foo,+Bar,+Buzz,-Foo,-Bar,-Buzz
# leading err doesnt wreck the rest
CLS_3_=,bing,bong,boom,-bing,-bong,-boom,+bing,+bong,+boom,-bing,-bong,-boom

tddm_sysnode_classes__ c1_syslog_bits $CLS_1_
tddm_sysnode_classes__ c2_syslog_bits $CLS_2_
tddm_sysnode_classes__ c3_syslog_bits $CLS_3_


Cc: Sean Paul <seanpaul@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>

Jim Cromie (27):
  dyndbg: fix static_branch manipulation
  dyndbg: show both old and new in change-info
  dyndbg: fix module.dyndbg handling
  dyndbg: drop EXPORTed dynamic_debug_exec_queries
  dyndbg: add exclusive class_id to pr_debug callsites
  dyndbg: add dynamic_debug_(un)register_classes
  dyndbg: validate class FOO on module
  dyndbg: add drm.debug style bitmap support
  Doc/dyndbg: document new class class_name query support
  dyndbg: let query-modname override defaulting modname
  dyndbg: support symbolic class-names in bitmap
  dyndbg: change zero-or-one classes-map to maps list
  dyndbg: add __pr_debug_cls(class, fmt, ...)
  dyndbg: add test_dynamic_debug module
  drm: POC drm on dyndbg - map class-names to drm_debug_category's
  drm/print: POC drm on dyndbg - use bitmap
  drm_print: condense enum drm_debug_category
  drm_print: interpose drm_*dbg with forwarding macros
  drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro
  drm_print: refine drm_debug_enabled for jump-label
  drm_print: prefer bare printk KERN_DEBUG on generic fn
  drm_print: add _ddebug desc to drm_*dbg prototypes
  dyndbg: add _DPRINTK_FLAGS_ENABLED
  dyndbg: add _DPRINTK_FLAGS_TRACE
  dyndbg: add write-events-to-tracefs code
  dyndbg: 4 new trace-events: pr_debug, dev_dbg, drm_{,dev}debug
  dyndbg/drm: POC add tracebits sysfs-knob

 .../admin-guide/dynamic-debug-howto.rst       |  12 +
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/Kconfig                       |  12 +
 drivers/gpu/drm/Makefile                      |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   3 +
 drivers/gpu/drm/drm_drv.c                     |   5 +
 drivers/gpu/drm/drm_print.c                   |  69 ++-
 drivers/gpu/drm/i915/i915_module.c            |  11 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   4 +
 include/drm/drm_drv.h                         |  26 +
 include/drm/drm_print.h                       |  84 ++-
 include/linux/dynamic_debug.h                 | 136 ++++-
 include/trace/events/drm.h                    |  68 +++
 include/trace/events/dyndbg.h                 |  74 +++
 lib/Kconfig.debug                             |  11 +
 lib/Makefile                                  |   1 +
 lib/dynamic_debug.c                           | 487 +++++++++++++++---
 lib/test_dynamic_debug.c                      | 172 +++++++
 18 files changed, 1049 insertions(+), 129 deletions(-)
 create mode 100644 include/trace/events/drm.h
 create mode 100644 include/trace/events/dyndbg.h
 create mode 100644 lib/test_dynamic_debug.c

-- 
2.35.1

