Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9606366A2FA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D569A10EAB1;
	Fri, 13 Jan 2023 19:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4DD10EAB0;
 Fri, 13 Jan 2023 19:30:36 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id q190so10873988iod.10;
 Fri, 13 Jan 2023 11:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XnRopoNlvG+D9+iG6iHQg7VYyXddiuMiUnVKRk8Wero=;
 b=FsKBh0Q3tsVo23MPYkHFDzPoXjUHgdkXT2HbSmfopFfzvxa6ltz2dNshkCX97+cU9y
 RKrsm2QjpmObKwRAX9N5GBxcawNa3zlFk6MTLs9zjwIv9G8UHF6xCzCAGJod7AHyt/jg
 fztSybcn8xZKzZpi+mIJoap+uRR6e2sAvTtE33CPtjZgySXX9VN5Nt9Gy+Wq5x1BBE1I
 A0X5K626ijRF6IgPCiUJWT3oWU6IMaSSpfANTfu7GkCfuPREX/zu7jpVYMDI1GI/Yej6
 7YX5PdI7M901SEqlk1tr70rIiBRBluOXqUCTnjZRadhpUF/18a6u4eB6uZHzqvUlE0Nz
 itgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XnRopoNlvG+D9+iG6iHQg7VYyXddiuMiUnVKRk8Wero=;
 b=1VRRjcZhiYB62hAV/o2umavNrDSLWE3Jz1s3Pb3zTZnU+iipJ2NNhEJc9lRvVoNIPQ
 iAPo2g8PB6cJjjP89lJYB44zfcVtMkU6Ey0ksWlsblCZkrO802msg8qwBqT8f62CPDkW
 ULgkKzxaBOpbWDJjG6YzSI/4yWPLrrrlOoLXXkoc+h4aNTbwrixEBH28BG/kYrvXrcBB
 FRfrjFi8IzdQejSbFwvD6G1Vc+SmtwSqpWOnQHQk6U7Eu+KBlUxcKXFOX+YiRHQsU2rf
 y+jfXcKrzjCDOU+DW36a1nDu8jd+82/h4ajFKMCQtMws/yy5NfxRRFn8nODxICrpxNlL
 hpVw==
X-Gm-Message-State: AFqh2koPsTKsg2ocNDj4pA1C5NkyPFtswMWcwb0Id1Rk8PPGniMZAKpE
 MtwERZuG3r/QYT/1K2QCT74=
X-Google-Smtp-Source: AMrXdXsvsEdVppqpUgTBThUpljvrv0u87YuCqPZ9oMX0E0AEKYLxffD0Nagju1YYFIHmIif6je00Hw==
X-Received: by 2002:a5e:8401:0:b0:704:8128:3aae with SMTP id
 h1-20020a5e8401000000b0070481283aaemr3973437ioj.13.1673638235955; 
 Fri, 13 Jan 2023 11:30:35 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:35 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/20] DRM_USE_DYNAMIC_DEBUG regression
Date: Fri, 13 Jan 2023 12:29:56 -0700
Message-Id: <20230113193016.749791-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

DRM_USE_DYNAMIC_DEBUG=y has a regression enabling drm.debug in drivers

It is due to a chicken-egg problem loading modules; on `modprobe
i915`, drm is loaded 1st, and drm/parameters/debug is set.  When
drm_debug_enabled() tested it at runtime, things just worked.

But with DRM_USE_DYNAMIC_DEBUG=y, the runtime test is replaced with a
post-insmod enablement of drm_dbg/dyndbg callsites, via dyndbg's
callback on __drm_debug.  So with drm.ko loaded before the dependent
modules, their debug callsites arent present to be enabled.

OVERVIEW

As Jani Nikula noted rather more gently, DECLARE_DYNDBG_CLASSMAP is
error-prone enough to call broken: it relied upon identical classmap
definitions in all modules using DRM_UT_*.  IOW, it muddled the K&R
distinction between a (single) definition, and multiple references.

So 4 patches here split it into:

DYNDBG_CLASSMAP_DEFINE	used once per subsystem to define each classmap.
DYNDBG_CLASSMAP_USE	declare dependence on a DEFINEd classmap.

This makes the weird coordinated-changes-by-identical-classmaps
"feature" unnecessary.

DYNDBG_CLASSMAP_DEFINE initializes the classmap, stores it into the
(existing) __dyndbg_classes section, and exports the struct var
(unlike DECLARE_DYNDBG_CLASSMAP).

DYNDBG_CLASSMAP_USE initializes a class-ref struct, containing the
user-module-name, and a ref to the exported classmap var.

The distinction allows separate treatment of classmaps and
classmap-refs, the latter getting additional behavior to propagate
class'd prdbg settings to modules being loaded.

Consider i915.ko, a DYNDBG_CLASSMAP_USEr: due to dependencies,
`modprobe drm debug=$val` is done 1st.  For DRM_USE_DYNAMIC_DEBUG=y,
drm.debug=$val invokes dyndbg's kparam callback, which applies "class
DRM_UT_*" >controls as given by the bits.  But i915.ko isn't modprobed
yet, so misses those >controls.  These must be 're-delivered' when
i915 is modprobed.

Recapitulating ddebug_attach_module_classes(1) for (existing) classes;
ddebug_attach_client_module_classes(2) does this for (new) class-refs,
as they are found when modprobing drm-drivers.

2 calls ddebug_apply_parents_params(3) on each referred classmap defn.

3 scans kernel-params owned by the module DEFINEing the classmap,
either builtin or loadable, calls ddebug_match_apply_kparam(4) on each.

4 finds those kparams wired to dyndbg's param-ops, which are therefore
castable to struct ddebug_class_param, and have a ref to the classmap
that they "control".  So 4 finds classmap definitions whose owner
matches the user-module being loaded, and applies the kparam's state
(__drm_debug in this case) by calling ddebug_apply_class_bitmap().

test_dynamic_debug is extended to recreate DRM's multi-module
regression, it builds both test_dynamic_debug.ko and _submod.ko, with
an ifdef to _DEFINE in the main module, and _USE in the submod.  This
gives both modules identical set of prdbgs, which is helpful for
humans comparing results.

STATUS

here it is, "working":

doing class DRM_UT_CORE -p
[ 9904.961750] dyndbg: read 21 bytes from userspace
[ 9904.962286] dyndbg: query 0: "class DRM_UT_CORE -p" mod:*
[ 9904.962848] dyndbg: split into words: "class" "DRM_UT_CORE" "-p"
[ 9904.963444] dyndbg: op='-' flags=0x0 maskp=0xfffffffe
[ 9904.963945] dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=DRM_UT_CORE
[ 9904.964781] dyndbg: good-class: drm.DRM_UT_CORE  module:drm nd:302 nc:1 nu:0
[ 9904.966411] dyndbg: class-ref: drm_kms_helper.DRM_UT_CORE  module:drm_kms_helper nd:95 nc:0 nu:1
[ 9904.967265] dyndbg: class-ref: drm_display_helper.DRM_UT_CORE  module:drm_display_helper nd:150 nc:0 nu:1
[ 9904.968349] dyndbg: class-ref: i915.DRM_UT_CORE  module:i915 nd:1659 nc:0 nu:1
[ 9904.969801] dyndbg: class-ref: amdgpu.DRM_UT_CORE  module:amdgpu nd:4425 nc:0 nu:1
[ 9904.977079] dyndbg: class-ref: nouveau.DRM_UT_CORE  module:nouveau nd:103 nc:0 nu:1
[ 9904.977830] dyndbg: processed 1 queries, with 507 matches, 0 errs
doing class DRM_UT_DRIVER +p
[ 9906.151761] dyndbg: read 23 bytes from userspace
[ 9906.152241] dyndbg: query 0: "class DRM_UT_DRIVER +p" mod:*
[ 9906.152793] dyndbg: split into words: "class" "DRM_UT_DRIVER" "+p"
[ 9906.153388] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[ 9906.153896] dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=DRM_UT_DRIVER
[ 9906.154746] dyndbg: good-class: drm.DRM_UT_DRIVER  module:drm nd:302 nc:1 nu:0
[ 9906.155433] dyndbg: class-ref: drm_kms_helper.DRM_UT_DRIVER  module:drm_kms_helper nd:95 nc:0 nu:1
[ 9906.156267] dyndbg: class-ref: drm_display_helper.DRM_UT_DRIVER  module:drm_display_helper nd:150 nc:0 nu:1
[ 9906.157365] dyndbg: class-ref: i915.DRM_UT_DRIVER  module:i915 nd:1659 nc:0 nu:1
[ 9906.163848] dyndbg: class-ref: amdgpu.DRM_UT_DRIVER  module:amdgpu nd:4425 nc:0 nu:1
[ 9906.178963] dyndbg: class-ref: nouveau.DRM_UT_DRIVER  module:nouveau nd:103 nc:0 nu:1
[ 9906.179934] dyndbg: processed 1 queries, with 1286 matches, 0 errs

It is still WIP, but Daniel Vetter inquired, so I figured Id send what I got.

The series ends in an RFC patch; __jump_label_patch can "crash the
box" when the jump-entry is in the wrong state.  The code makes no
distinction between a well-formed "toggled" state and "insane".  This
patch gets me past some mis-initialization problem Im still probing.

Things seem to be mostly working.

Heres the script that Ive been testing with:
(see submod_test at bottom)

#!/bin/bash

# shell funcs to test module load behavior of dynamic-debug, using
# test_dynamic_debug module.  Meant to be useful at shell command
# line, after sourcing this.

PS1=":#> "	# obvious clue we're in the "environment"

# grease for use/play
alias ddcmd='echo $* > /proc/dynamic_debug/control'

# support modprobe foo dyndbg=$VAR testing
export THML="class HI +p;class MID +p;class LOW +p;"
export TLVLS="class L1 +p;class L2 +p;class L3 +p;class L4 -p;"

alias lmt='modprobe test_dynamic_debug dyndbg=+pmf'
alias rmt='rmmod test_dynamic_debug'
alias look='grep test_dynamic_debug /proc/dynamic_debug/control'

alias mpd='modprobe $1 dyndbg="$2"'
alias mpt='modprobe test_dynamic_debug dyndbg="$*"'

alias skt='cd /sys/kernel/tracing'
alias smtddp='cd /sys/module/test_dynamic_debug/parameters'

alias cget='grep $1 /proc/dynamic_debug/control'
lookfor () {
    grep $1 /proc/dynamic_debug/control
}

vx() {
    echo $* > /sys/module/dynamic_debug/parameters/verbose
}

# amdgpu has ~2200 pr-debugs (before drm-debug-on-dyndbg),
# use them to prove kernel has both DYNAMIC_DEBUG and a DRM module
# and modprobe <mod> dyndbg=+p works

load_drm_mod_test() {
    local mod=${1:-amdgpu}
    rmmod $mod 2>/dev/null
    modprobe $mod dyndbg=+pfm
    let count=$(grep =pmf /proc/dynamic_debug/control | grep $mod | wc -l)
    rmmod $mod

    if [ $count -gt 100 ] ; then
	echo $mod has $count pr-dbgs
	return 0
    else
	echo $mod: too few sites: $count, suspect bad config
	return -1
    fi
}


SMTDDP=/sys/module/test_dynamic_debug/parameters

function doit() {
    cat $SMTDDP/do_prints
}
qry_cmd() { # like ddcmd, with feedback
    echo "QCMD: $* to-control" >&2
    echo $* > /proc/dynamic_debug/control
}

# exercise class FOO behavior of test_dynamic_debug module
ttest_module__() {
    flg=$1
    dmesg -C
    modprobe test_dynamic_debug dyndbg=+pfm
    doit

    for cls in L1 L2 L3; do
	qry_cmd module test_dynamic_debug class $cls $flg
	doit
    done
    doit

    for cls in LOW MID HI; do
	qry_cmd module test_dynamic_debug class $cls $flg
	doit
    done
    doit

    for cls in D2_CORE D2_KMS D2_DRIVER; do
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


# use/test bitmaps
# knob is a sysfs-node

tddm_is_knob_() {
    knob=$1;
    if [ -f $SMTDDP/$knob ]; then
	return 0
    else
	echo missing sysfs node: $knob, skipping tests
	return 1
    fi
}

tddm_set_knob_() {
    knob=$1;
    val=$2;
    expect=$3;
    [[ -z $knob || -z $val ]] && echo "expecting 2+args: knob val [result]" && return
    
    echo "TDDM: $val >$knob" >&2 && sleep 0.1
    echo $val > $SMTDDP/$knob
    echo "? $?"

    val=`cat $SMTDDP/$knob`
    [[ -z $expect ]] && expect=$val

    if [[ $val == $expect ]]; then
	echo pass-ish $val
    else
	echo fail $val != $expect
    fi
}

tddm_knob_clname_() {
    targ=$1
    cls=$2
    res=$3
    tddm_is_knob_ $targ || continue;
    tddm_set_knob_ $targ $cls $res
    cat $SMTDDP/do_prints
}

tddm_knob_classes_() {
    targ=$1
    shift
    cls=$*

    tddm_is_knob_ $targ || return;
    for bitsym in $cls;
    do
	tddm_knob_clname_ $targ $bitsym 
	cat $SMTDDP/do_prints
    done
}

# round-trip-test - args: node val want explanation
rtt_nvwx() {
    node=$1	# to this
    val=$2	# write this
    want=$3	# expect this on readback
    [ -z $3 ] && echo "want args: node input result" && return

    shift 3;
    echo "RTT: $val -> $node : $want :: DOING: $*" >&2 && sleep 0.1

    echo $val > $SMTDDP/$node
    rc=$(cat $SMTDDP/$node)
    # echo rc $rc
    # pretty literal test
    [[ $rc != $want ]] && echo crap [[ $rc != $want ]] && return 1
}

# test-round-trip, using above.

# test disjoint - disjoint interface
trx_disjoint_names() {
    nm=$1
    rtt_nvwx $nm -HI,-MID,-LOW 0x0  all-off
    rtt_nvwx $nm HI 0x4  hi
    rtt_nvwx $nm MID 0x6  mid,hi
    rtt_nvwx $nm LOW 0x7  low,mid,hi
    rtt_nvwx $nm -HI 0x3  -hi,low,mid
    rtt_nvwx $nm -MID 0x1  -mid,low
    rtt_nvwx $nm -LOW 0x0  -low

    # multi-bit update
    rtt_nvwx $nm +LOW,MID,HI 0x7  3-on

    # same-bit, multi-toggle (for exersize)
    rtt_nvwx $nm -LOW,+LOW,-LOW,LOW,-LOW,LOW 0x7  on-off-repeat
}
trt_disjoint_names() {
    trx_disjoint_names T_disjoint_names
}
trp_disjoint_names() {
    trx_disjoint_names p_disjoint_names
}

# traditional bitmap
trx_disjoint_bits() {
    nm=$1
    echo 0 > $SMTDDP/$nm
    rtt_nvwx $nm  0x0  0x0	no change
    rtt_nvwx $nm  0x1  0x1	disjoint_CORE
    rtt_nvwx $nm  0x2  0x2	disjoint_DRIVER,
    rtt_nvwx $nm  0x4  0x4	disjoint_KMS,
    rtt_nvwx $nm  0x10  0x10	disjoint_PRIME,
    rtt_nvwx $nm  0x20  0x20	disjoint_ATOMIC,
    rtt_nvwx $nm  0x40  0x40	disjoint_VBL,
    rtt_nvwx $nm  0x80  0x80	disjoint_STATE,
    rtt_nvwx $nm  0x100 0x100	disjoint_LEASE,

    rtt_nvwx $nm  0x4f  0x4f	disjoint_VBL and below
}
trt_disjoint_bits() {
    trx_disjoint_bits T_disjoint_bits
}
trp_disjoint_bits() {
    trx_disjoint_bits p_disjoint_bits
}

# traditional numeric verbose
trx_level_num() {
    nm=$1
    echo 0 > $SMTDDP/$nm
    rtt_nvwx $nm 0  0  clear all
    rtt_nvwx $nm 1  1  level 1
    rtt_nvwx $nm 2  2  levels 2,1
    rtt_nvwx $nm 3  3  levels 3,2,1
    rtt_nvwx $nm 4  4  levels 4-1
    rtt_nvwx $nm 5  5  levels 5-1
    rtt_nvwx $nm 6  6  levels 6-1
    rtt_nvwx $nm 7  7  levels 7-1
    rtt_nvwx $nm 2  2  levels 2,1
}
trt_level_num() {
    trx_level_num T_level_num
}
trp_level_num() {
    trx_level_num p_level_num
}

#  levels
trx_level_names() {
    nm=$1
    rtt_nvwx $nm -L0 0  clear all
    rtt_nvwx $nm L0  0  clear all
    rtt_nvwx $nm L1  1  level 1
    rtt_nvwx $nm L2  2  levels 2,1
    rtt_nvwx $nm L3  3  levels 3-1
    rtt_nvwx $nm L4  4  levels 4-1
    rtt_nvwx $nm L5  5  levels 5-1
    rtt_nvwx $nm L7  7  levels 7-1
}
trt_level_names() {
    trx_level_names T_level_names
}
trp_level_names() {
    trx_level_names p_level_names
}

# these are more like exersize
#tddm_syslog_classes_1
#tddm_syslog_classes_2
#tddm_syslog_prio
#tddm_syslog_verbose


trt_all() {
    # 1st, cuz its got base = 0, simplest
    trt_disjoint_bits
    trt_disjoint_names
    trt_level_names
    trt_level_num
}
trp_all() {
    # 1st, cuz its got base = 0, simplest
    trp_disjoint_bits
    trp_disjoint_names
    trp_level_names
    trp_level_num
}

init () {
    modprobe test_dynamic_debug
    smtddp
    echo 0 > p_disjoint_names
    echo 0 > p_level_names
    echo 0 > p_level_num
    echo 0 > p_disjoint_bits
}
init_ () {
    echo 0 > T_disjoint_names
    echo 0 > T_level_names
    echo 0 > T_level_num
    echo 0 > T_disjoint_bits
}

alias refresh="cd -; . test-funcs.rc; cd -"


# need tests for
# p_disjoint_bits
# p_disjoint_names
# p_level_num

submod () {
    # set dyndbg-params at load
    echo  mp test_dynamic_debug p_disjoint_bits=${1:-0} p_level_num=${2:-0}
    modprobe test_dynamic_debug p_disjoint_bits=${1:-0} p_level_num=${2:-0} dyndbg=+p
    modprobe test_dynamic_debug_submod dyndbg=+p
}
unmod () {
    rmmod test_dynamic_debug_submod
    rmmod test_dynamic_debug
}

ddgrep () {
    grep $1 /proc/dynamic_debug/control
}


# these dont use bitmap interface:
# so no levels behavior is available here


VX="V0 V1 V2 V3 V4 V5 V6"

for_X () {
    flag=$1
    classes=$2
    for C in $classes; do
	ddc_grep class:$C
	qry_cmd class $C $flag
	ddc_grep class:$C
    done
}
for_Vn () {
    flag=$1
    for C in V0 V1 V2 V3 V4 V5 V6; do
	ddgrep class:$C
	qry_cmd class $C $flag
	ddgrep class:$C
    done
}

for_D2 () {
    flag=$1
    for C in D2_CORE D2_DRIVER D2_KMS D2_PRIME D2_ATOMIC D2_VBL D2_STATE D2_LEASE D2_DP D2_DRMRES; do
	ddgrep class:$C
	qry_cmd class $C $flag
	ddgrep class:$C
    done
}

toggle_D2 () {
    for_D2 -p
    for_D2 +p
}

toggle_Vn () {
    for_Vn +p
    for_Vn -p
}


submod_test () {
    vx 4
    unmod
    submod 0x3ff 3

    ddgrep _submod
    echo 1 > /sys/module/test_dynamic_debug/parameters/do_prints
    echo 1 > /sys/module/test_dynamic_debug_submod/parameters/do_prints 

    echo 0 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
    echo 0x2ff > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits

    echo 1 > /sys/module/test_dynamic_debug/parameters/do_prints 
    echo 1 > /sys/module/test_dynamic_debug_submod/parameters/do_prints 
}


Jim Cromie (20):
  test-dyndbg: fixup CLASSMAP usage error
  test-dyndbg: show that DEBUG enables prdbgs at compiletime
  dyndbg: replace classmap list with a vector
  dyndbg: make ddebug_apply_class_bitmap more selective
  dyndbg: split param_set_dyndbg_classes to inner/outer
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: reduce verbose/debug clutter
  dyndbg: tighten ddebug_class_name() 1st arg
  dyndbg: constify ddebug_apply_class_bitmap args
  dyndbg-API: split DECLARE_(DYNDBG_CLASSMAP) to $1(_DEFINE|_USE)
  dyndbg-API: specialize DYNDBG_CLASSMAP_(DEFINE|USE)
  dyndbg-API: DYNDBG_CLASSMAP_USE drop extra args
  dyndbg-API: DYNDBG_CLASSMAP_DEFINE() improvements
  drm_print: fix stale macro-name in comment
  test-dyndbg: build test_dynamic_debug_submod
  test-dyndbg: rename DD_SYS_WRAP to DYNDBG_CLASSMAP_PARAM
  test-dyndbg: disable WIP dyndbg-trace params
  test-dyndbg: tune sub-module behavior
  dyndbg: unwrap __ddebug_add_module inner function NOTYET
  jump_label: RFC - tolerate toggled state

 arch/x86/kernel/jump_label.c            |  26 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  14 +-
 drivers/gpu/drm/display/drm_dp_helper.c |  14 +-
 drivers/gpu/drm/drm_crtc_helper.c       |  14 +-
 drivers/gpu/drm/drm_print.c             |  22 +-
 drivers/gpu/drm/i915/i915_params.c      |  14 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  14 +-
 include/asm-generic/vmlinux.lds.h       |   3 +
 include/drm/drm_print.h                 |   6 +-
 include/linux/dynamic_debug.h           |  57 +++--
 include/linux/map.h                     |  54 +++++
 kernel/module/main.c                    |   2 +
 lib/Makefile                            |   3 +-
 lib/dynamic_debug.c                     | 268 +++++++++++++++++-------
 lib/test_dynamic_debug.c                | 116 ++++++----
 lib/test_dynamic_debug_submod.c         |  10 +
 16 files changed, 437 insertions(+), 200 deletions(-)
 create mode 100644 include/linux/map.h
 create mode 100644 lib/test_dynamic_debug_submod.c

-- 
2.39.0

