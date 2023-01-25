Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D58F67BCFE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3A510E884;
	Wed, 25 Jan 2023 20:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7A710E8A1;
 Wed, 25 Jan 2023 20:38:18 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id m15so18690ilq.2;
 Wed, 25 Jan 2023 12:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XWAR+JVdClFEqIZLwZS5aE51GB9NDfpmdgMKWd8ije0=;
 b=QMXKd9QMmknSmmF7xgTJxJ9O+qq3gyirSe0CZ4JneajnNjpjWjf1WrQIQCbxsvRDip
 jmh38Hd9YHADa8zwWSHo6Zec9Jz6SXAxjwXFvOPh9R/jM3PlDzNrmRmrCtuhRy8654pf
 Ea4uoKqpza1mRyBJAoXJQJIdhUPLzRM4YmCX0QxYGgdNzUpv/+dqH+AdulLIOrx7143T
 n2u0eNxbmLL8LUnwnfn5+btR9BmnPaLE9LRMOBgeivQe2DR+WtzLWP6KSn3+bxhfVKf/
 kQ9UngLTQ2mLOIrRaOT2Zv/NATcKvTI2QZkdTmXLKb/Tmq9vBcf6o8fXjWIt4zeTCBh9
 NKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XWAR+JVdClFEqIZLwZS5aE51GB9NDfpmdgMKWd8ije0=;
 b=lA9XE+ZfUDi12we8KqRvuwncMM3FsV3yigDwWKQEOs27pKe1SofB9lH6gUfbw1tFBv
 x0ag8TXooR96w6vummGPCrb7Ksbaxq168jczg7WuMGGsYWZB+mhSZOMYeo6vfxrFjEHA
 NZUUpOxcQFYNaN6vakQAQNNC8VLyC7TCX1OUviSo10nDg2F+LJlAzYFUWFDBBFM067nN
 sNFr/XSvngXgY1cQfGSe87ZsU89BenAW9T0BZsmv8xFklrb8wgzNDjIrZXQsssaXTbjO
 usMiK+iz3GiKT1CCqSWwLFZQ6VJ/objEMMvTsvBC/tcGV/6M/lR/efAw0LJvd71jw/Ki
 RUkg==
X-Gm-Message-State: AFqh2koIvneTVQurTIbZDpW6xgEaR1Xldn5WTFn/RFGyH8hchhkDgzKW
 RfavwtqmmOHp+RtIOjDVIknpCUGMzyw=
X-Google-Smtp-Source: AMrXdXv5sI27NHK/DU4zL2fgUW55Vh2RtE6AIBo5tBNme+LX0WkcmiwMNZ9WpjUbGhKy7zxeGIjadw==
X-Received: by 2002:a05:6e02:1345:b0:30f:4cac:e011 with SMTP id
 k5-20020a056e02134500b0030f4cace011mr15327238ilr.29.1674679097769; 
 Wed, 25 Jan 2023 12:38:17 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:17 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 19/19] jump_label: RFC / temporary for CI - tolerate
 toggled state
Date: Wed, 25 Jan 2023 13:37:43 -0700
Message-Id: <20230125203743.564009-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, Jason Baron <jbaron@akamai.com>, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__jump_label_patch currently will "crash the box" if it finds a
jump_entry not as expected; it makes no allowances for the well-formed
but incorrect "toggled" state.  This patch changes panic-on-toggled
into a warning, allowing to reduce the problem to a repeatable script.

note: this patch is arch/x86 only, so might not help CI at all.

submod () {
    # set drm.debug analogues
    echo  MP test_dynamic_debug p_disjoint_bits=${1:-0} p_level_num=${2:-0}
    modprobe test_dynamic_debug p_disjoint_bits=${1:-0} p_level_num=${2:-0} dyndbg=+p
    # _submod should pick up kparams
    echo  MP test_dynamic_debug_submod dyndbg=+pmf
    modprobe test_dynamic_debug_submod dyndbg=+pmf
}
unmod () {
    rmmod test_dynamic_debug_submod
    rmmod test_dynamic_debug
}
note () {
    echo NOTE: $* >&2
    sleep 0.1
}

submod_probe () {

    echo 4 > /sys/module/dynamic_debug/parameters/verbose
    unmod
    submod $*

    note submod prdbgs are supposedly enabled
    grep test_dynamic_debug /proc/dynamic_debug/control
    cat /sys/module/test_dynamic_debug/parameters/do_prints

    note but they dont print here
    cat /sys/module/test_dynamic_debug_submod/parameters/do_prints

    note if D2_CORE in $1, trigger toggled warning
    note echo class D2_CORE -p
    echo class D2_CORE -p > /proc/dynamic_debug/control
}

heres the repeatable results

[   17.023758] virtme-init: triggering udev coldplug
[   18.285949] virtme-init: waiting for udev to settle
[   22.550866] i2c_piix4: module verification failed: signature and/or required key missing - tainting kernel
[   22.551945] dyndbg: add-module: i2c_piix4 12 sites 0.0
[   22.552277] dyndbg:  12 debug prints in module i2c_piix4
[   22.555099] piix4_smbus 0000:00:01.3: SMBus Host Controller at 0x700, revision 0
[   22.597344] dyndbg: add-module: serio_raw 2 sites 0.0
[   22.597633] dyndbg:   2 debug prints in module serio_raw
[   22.603506] input: PC Speaker as /devices/platform/pcspkr/input/input4
[   23.556657] dyndbg: add-module: intel_rapl_common 12 sites 0.0
[   23.557000] dyndbg:  12 debug prints in module intel_rapl_common
[   23.759499] dyndbg: add-module: intel_rapl_msr 2 sites 0.0
[   23.759928] dyndbg:   2 debug prints in module intel_rapl_msr
[   26.081050] virtme-init: udev is done
virtme-init: console is ttyS0
bash-5.2# . test-funcs.rc
:#> submod_probe 1 0
rmmod: ERROR: Module test_dynamic_debug_submod is not currently loaded
rmmod: ERROR: Module test_dynamic_debug is not currently loaded
MP test_dynamic_debug p_disjoint_bits=1 p_level_num=0 dyndbg=+pm
[   61.712445] dyndbg: add-module: test_dynamic_debug 33 sites 4.0
[   61.712789] dyndbg: classes[0..]: module:test_dynamic_debug base:22 len:8 ty:3
[   61.713144] dyndbg: module:test_dynamic_debug attached 4 classes
[   61.713894] dyndbg:  33 debug prints in module test_dynamic_debug
[   61.715486] dyndbg: bits:0x1 > *.p_disjoint_bits
[   61.715732] dyndbg: apply bitmap: 0x1 to: 0x0 for '*'
[   61.715983] dyndbg: query 0: "class D2_CORE +p" mod:*
[   61.716253] dyndbg: split into words: "class" "D2_CORE" "+p"
[   61.716539] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[   61.716794] dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=D2_CORE
[   61.717232] dyndbg: good-class: test_dynamic_debug.D2_CORE  module:test_dynamic_debug nd:33 nc:4 nu:0
[   61.717690] dyndbg: processed 1 queries, with 1 matches, 0 errs
[   61.717982] dyndbg: bit_0: 1 matches on class: D2_CORE -> 0x1
[   61.718283] dyndbg: applied bitmap: 0x1 to: 0x0 for '*'
[   61.718542] dyndbg: p_disjoint_bits: total matches: 1
[   61.718799] dyndbg: lvl:0 bits:0x0 > p_level_num
[   61.719029] dyndbg: p_level_num: total matches: 0
[   61.719279] dyndbg: module: test_dynamic_debug dyndbg="+pm"
[   61.719554] dyndbg: query 0: "+pm" mod:test_dynamic_debug
[   61.719824] dyndbg: split into words: "+pm"
[   61.720034] dyndbg: op='+' flags=0x3 maskp=0xffffffff
[   61.720299] dyndbg: parsed: func="" file="" module="test_dynamic_debug" format="" lineno=0-0 class=(null)
[   61.720786] dyndbg: changed lib/test_dynamic_debug.c:206 [test_dynamic_debug]test_dynamic_debug_exit p => pm
[   61.721289] dyndbg: changed lib/test_dynamic_debug.c:200 [test_dynamic_debug]test_dynamic_debug_init p => pm
[   61.721778] dyndbg: changed lib/test_dynamic_debug.c:198 [test_dynamic_debug]test_dynamic_debug_init p => pm
[   61.722283] dyndbg: changed lib/test_dynamic_debug.c:191 [test_dynamic_debug]do_prints p => pm
[   61.722711] dyndbg: changed lib/test_dynamic_debug.c:170 [test_dynamic_debug]do_levels p => pm
[   61.723128] dyndbg: changed lib/test_dynamic_debug.c:150 [test_dynamic_debug]do_cats p => pm
[   61.723554] dyndbg: processed 1 queries, with 6 matches, 0 errs
[   61.725233] test_dynamic_debug: test_dd: init start
[   61.725487] test_dynamic_debug: test_dd: do_prints:
[   61.725745] test_dynamic_debug: test_dd: doing categories
[   61.726011] test_dd: LOW msg
[   61.726176] test_dd: MID msg
[   61.726328] test_dd: HI msg
[   61.726470] test_dd: D2_CORE msg
[   61.726640] test_dd: D2_DRIVER msg
[   61.726815] test_dd: D2_KMS msg
[   61.726976] test_dd: D2_PRIME msg
[   61.727144] test_dd: D2_ATOMIC msg
[   61.727332] test_dd: D2_VBL msg
[   61.727494] test_dd: D2_STATE msg
[   61.727669] test_dd: D2_LEASE msg
[   61.727839] test_dd: D2_DP msg
[   61.727996] test_dd: D2_DRMRES msg
[   61.728187] test_dynamic_debug: test_dd: doing levels
[   61.728440] test_dd: V1 msg
[   61.728585] test_dd: V2 msg
[   61.728737] test_dd: V3 msg
[   61.728882] test_dd: V4 msg
[   61.729028] test_dd: V5 msg
[   61.729201] test_dd: V6 msg
[   61.729365] test_dd: V7 msg
[   61.729510] test_dd: L1 msg
[   61.729660] test_dd: L2 msg
[   61.729804] test_dd: L3 msg
[   61.729949] test_dd: L4 msg
[   61.730093] test_dd: L5 msg
[   61.730256] test_dd: L6 msg
[   61.730402] test_dd: L7 msg
[   61.730547] test_dynamic_debug: test_dd: init done
MP test_dynamic_debug_submod dyndbg=+pmf
[   61.908067] dyndbg: add-module: test_dynamic_debug_submod 33 sites 0.4
[   61.908669] dyndbg: class_ref[0] test_dynamic_debug_submod -> test_dynamic_debug
[   61.909089] dyndbg: class_ref[1] test_dynamic_debug_submod -> test_dynamic_debug
[   61.909466] dyndbg: class_ref[2] test_dynamic_debug_submod -> test_dynamic_debug
[   61.909841] dyndbg: class_ref[3] test_dynamic_debug_submod -> test_dynamic_debug
[   61.910232] dyndbg: loaded class: module:test_dynamic_debug base:22 len:8 type:3
[   61.910599] dyndbg: found kp:p_level_names =0x0
[   61.910601] dyndbg: mapped to: module:test_dynamic_debug base:22 len:8 type:3
[   61.911275] dyndbg: loaded class: module:test_dynamic_debug base:14 len:8 type:1
[   61.911672] dyndbg: found kp:p_level_num =0x0
[   61.911674] dyndbg: mapped to: module:test_dynamic_debug base:14 len:8 type:1
[   61.912318] dyndbg: loaded class: module:test_dynamic_debug base:10 len:3 type:2
[   61.912739] dyndbg: found kp:p_disjoint_names =0x0
[   61.912741] dyndbg: mapped to: module:test_dynamic_debug base:10 len:3 type:2
[   61.913373] dyndbg: loaded class: module:test_dynamic_debug base:0 len:10 type:0
[   61.913746] dyndbg: found kp:p_disjoint_bits =0x1
[   61.913747] dyndbg: mapped to: module:test_dynamic_debug base:0 len:10 type:0
[   61.914347] dyndbg: apply bitmap: 0x1 to: 0x0 for test_dynamic_debug_submod
[   61.914695] dyndbg: query 0: "class D2_CORE +p" mod:test_dynamic_debug_submod
[   61.915086] dyndbg: split into words: "class" "D2_CORE" "+p"
[   61.915413] dyndbg: op='+' flags=0x1 maskp=0xffffffff
[   61.915692] dyndbg: parsed: func="" file="" module="test_dynamic_debug_submod" format="" lineno=0-0 class=D2_CORE
[   61.916321] dyndbg: class-ref: test_dynamic_debug_submod.D2_CORE  module:test_dynamic_debug_submod nd:33 nc:0 nu:4
[   61.916912] dyndbg: changed lib/test_dynamic_debug.c:156 [test_dynamic_debug_submod]do_cats _ => p
[   61.917391] dyndbg: processed 1 queries, with 1 matches, 0 errs
[   61.917691] dyndbg: bit_0: 1 matches on class: D2_CORE -> 0x1
[   61.917980] dyndbg: applied bitmap: 0x1 to: 0x0 for test_dynamic_debug_submod
[   61.918341] dyndbg: attach-client-module:  module:test_dynamic_debug_submod nd:33 nc:0 nu:4
[   61.918755] dyndbg:  33 debug prints in module test_dynamic_debug_submod
[   61.919314] dyndbg: module: test_dynamic_debug_submod dyndbg="+pmf"
[   61.919668] dyndbg: query 0: "+pmf" mod:test_dynamic_debug_submod
[   61.920028] dyndbg: split into words: "+pmf"
[   61.920282] dyndbg: op='+' flags=0x7 maskp=0xffffffff
[   61.920576] dyndbg: parsed: func="" file="" module="test_dynamic_debug_submod" format="" lineno=0-0 class=(null)
[   61.921419] dyndbg: changed lib/test_dynamic_debug.c:206 [test_dynamic_debug_submod]test_dynamic_debug_exit _ => pmf
[   61.921990] dyndbg: changed lib/test_dynamic_debug.c:200 [test_dynamic_debug_submod]test_dynamic_debug_init _ => pmf
[   61.922559] dyndbg: changed lib/test_dynamic_debug.c:198 [test_dynamic_debug_submod]test_dynamic_debug_init _ => pmf
[   61.923165] dyndbg: changed lib/test_dynamic_debug.c:191 [test_dynamic_debug_submod]do_prints _ => pmf
[   61.923802] dyndbg: changed lib/test_dynamic_debug.c:170 [test_dynamic_debug_submod]do_levels _ => pmf
[   61.924584] dyndbg: changed lib/test_dynamic_debug.c:150 [test_dynamic_debug_submod]do_cats _ => pmf
[   61.925161] dyndbg: processed 1 queries, with 6 matches, 0 errs
[   61.926602] test_dynamic_debug_submod:test_dynamic_debug_init: test_dd_submod: init start
[   61.927092] test_dynamic_debug_submod:do_prints: test_dd_submod: do_prints:
[   61.927557] test_dynamic_debug_submod:do_cats: test_dd_submod: doing categories
[   61.928130] test_dynamic_debug_submod:do_levels: test_dd_submod: doing levels
[   61.928731] test_dynamic_debug_submod:test_dynamic_debug_init: test_dd_submod: init done
NOTE: submod prdbgs are supposedly enabled
lib/test_dynamic_debug.c:150 [test_dynamic_debug]do_cats =pm "doing categories\n"
lib/test_dynamic_debug.c:152 [test_dynamic_debug]do_cats =p "LOW msg\n" class:LOW
lib/test_dynamic_debug.c:153 [test_dynamic_debug]do_cats =p "MID msg\n" class:MID
lib/test_dynamic_debug.c:154 [test_dynamic_debug]do_cats =p "HI msg\n" class:HI
lib/test_dynamic_debug.c:156 [test_dynamic_debug]do_cats =p "D2_CORE msg\n" class:D2_CORE
lib/test_dynamic_debug.c:157 [test_dynamic_debug]do_cats =p "D2_DRIVER msg\n" class:D2_DRIVER
lib/test_dynamic_debug.c:158 [test_dynamic_debug]do_cats =p "D2_KMS msg\n" class:D2_KMS
lib/test_dynamic_debug.c:159 [test_dynamic_debug]do_cats =p "D2_PRIME msg\n" class:D2_PRIME
lib/test_dynamic_debug.c:160 [test_dynamic_debug]do_cats =p "D2_ATOMIC msg\n" class:D2_ATOMIC
lib/test_dynamic_debug.c:161 [test_dynamic_debug]do_cats =p "D2_VBL msg\n" class:D2_VBL
lib/test_dynamic_debug.c:162 [test_dynamic_debug]do_cats =p "D2_STATE msg\n" class:D2_STATE
lib/test_dynamic_debug.c:163 [test_dynamic_debug]do_cats =p "D2_LEASE msg\n" class:D2_LEASE
lib/test_dynamic_debug.c:164 [test_dynamic_debug]do_cats =p "D2_DP msg\n" class:D2_DP
lib/test_dynamic_debug.c:165 [test_dynamic_debug]do_cats =p "D2_DRMRES msg\n" class:D2_DRMRES
lib/test_dynamic_debug.c:170 [test_dynamic_debug]do_levels =pm "doing levels\n"
lib/test_dynamic_debug.c:172 [test_dynamic_debug]do_levels =p "V1 msg\n" class:V1
lib/test_dynamic_debug.c:173 [test_dynamic_debug]do_levels =p "V2 msg\n" class:V2
lib/test_dynamic_debug.c:174 [test_dynamic_debug]do_levels =p "V3 msg\n" class:V3
lib/test_dynamic_debug.c:175 [test_dynamic_debug]do_levels =p "V4 msg\n" class:V4
lib/test_dynamic_debug.c:176 [test_dynamic_debug]do_levels =p "V5 msg\n" class:V5
lib/test_dynamic_debug.c:177 [test_dynamic_debug]do_levels =p "V6 msg\n" class:V6
lib/test_dynamic_debug.c:178 [test_dynamic_debug]do_levels =p "V7 msg\n" class:V7
lib/test_dynamic_debug.c:180 [test_dynamic_debug]do_levels =p "L1 msg\n" class:L1
lib/test_dynamic_debug.c:181 [test_dynamic_debug]do_levels =p "L2 msg\n" class:L2
lib/test_dynamic_debug.c:182 [test_dynamic_debug]do_levels =p "L3 msg\n" class:L3
lib/test_dynamic_debug.c:183 [test_dynamic_debug]do_levels =p "L4 msg\n" class:L4
lib/test_dynamic_debug.c:184 [test_dynamic_debug]do_levels =p "L5 msg\n" class:L5
lib/test_dynamic_debug.c:185 [test_dynamic_debug]do_levels =p "L6 msg\n" class:L6
lib/test_dynamic_debug.c:186 [test_dynamic_debug]do_levels =p "L7 msg\n" class:L7
lib/test_dynamic_debug.c:191 [test_dynamic_debug]do_prints =pm "do_prints:\n"
lib/test_dynamic_debug.c:198 [test_dynamic_debug]test_dynamic_debug_init =pm "init start\n"
lib/test_dynamic_debug.c:200 [test_dynamic_debug]test_dynamic_debug_init =pm "init done\n"
lib/test_dynamic_debug.c:206 [test_dynamic_debug]test_dynamic_debug_exit =pm "exited\n"
lib/test_dynamic_debug.c:150 [test_dynamic_debug_submod]do_cats =pmf "doing categories\n"
lib/test_dynamic_debug.c:152 [test_dynamic_debug_submod]do_cats =_ "LOW msg\n" class:LOW
lib/test_dynamic_debug.c:153 [test_dynamic_debug_submod]do_cats =_ "MID msg\n" class:MID
lib/test_dynamic_debug.c:154 [test_dynamic_debug_submod]do_cats =_ "HI msg\n" class:HI
lib/test_dynamic_debug.c:156 [test_dynamic_debug_submod]do_cats =p "D2_CORE msg\n" class:D2_CORE
lib/test_dynamic_debug.c:157 [test_dynamic_debug_submod]do_cats =_ "D2_DRIVER msg\n" class:D2_DRIVER
lib/test_dynamic_debug.c:158 [test_dynamic_debug_submod]do_cats =_ "D2_KMS msg\n" class:D2_KMS
lib/test_dynamic_debug.c:159 [test_dynamic_debug_submod]do_cats =_ "D2_PRIME msg\n" class:D2_PRIME
lib/test_dynamic_debug.c:160 [test_dynamic_debug_submod]do_cats =_ "D2_ATOMIC msg\n" class:D2_ATOMIC
lib/test_dynamic_debug.c:161 [test_dynamic_debug_submod]do_cats =_ "D2_VBL msg\n" class:D2_VBL
lib/test_dynamic_debug.c:162 [test_dynamic_debug_submod]do_cats =_ "D2_STATE msg\n" class:D2_STATE
lib/test_dynamic_debug.c:163 [test_dynamic_debug_submod]do_cats =_ "D2_LEASE msg\n" class:D2_LEASE
lib/test_dynamic_debug.c:164 [test_dynamic_debug_submod]do_cats =_ "D2_DP msg\n" class:D2_DP
lib/test_dynamic_debug.c:165 [test_dynamic_debug_submod]do_cats =_ "D2_DRMRES msg\n" class:D2_DRMRES
lib/test_dynamic_debug.c:170 [test_dynamic_debug_submod]do_levels =pmf "doing levels\n"
lib/test_dynamic_debug.c:172 [test_dynamic_debug_submod]do_levels =_ "V1 msg\n" class:V1
lib/test_dynamic_debug.c:173 [test_dynamic_debug_submod]do_levels =_ "V2 msg\n" class:V2
lib/test_dynamic_debug.c:174 [test_dynamic_debug_submod]do_levels =_ "V3 msg\n" class:V3
lib/test_dynamic_debug.c:175 [test_dynamic_debug_submod]do_levels =_ "V4 msg\n" class:V4
lib/test_dynamic_debug.c:176 [test_dynamic_debug_submod]do_levels =_ "V5 msg\n" class:V5
lib/test_dynamic_debug.c:177 [test_dynamic_debug_submod]do_levels =_ "V6 msg\n" class:V6
lib/test_dynamic_debug.c:178 [test_dynamic_debug_submod]do_levels =_ "V7 msg\n" class:V7
lib/test_dynamic_debug.c:180 [test_dynamic_debug_submod]do_levels =_ "L1 msg\n" class:L1
lib/test_dynamic_debug.c:181 [test_dynamic_debug_submod]do_levels =_ "L2 msg\n" class:L2
lib/test_dynamic_debug.c:182 [test_dynamic_debug_submod]do_levels =_ "L3 msg\n" class:L3
lib/test_dynamic_debug.c:183 [test_dynamic_debug_submod]do_levels =_ "L4 msg\n" class:L4
lib/test_dynamic_debug.c:184 [test_dynamic_debug_submod]do_levels =_ "L5 msg\n" class:L5
lib/test_dynamic_debug.c:185 [test_dynamic_debug_submod]do_levels =_ "L6 msg\n" class:L6
lib/test_dynamic_debug.c:186 [test_dynamic_debug_submod]do_levels =_ "L7 msg\n" class:L7
lib/test_dynamic_debug.c:191 [test_dynamic_debug_submod]do_prints =pmf "do_prints:\n"
lib/test_dynamic_debug.c:198 [test_dynamic_debug_submod]test_dynamic_debug_init =pmf "init start\n"
lib/test_dynamic_debug.c:200 [test_dynamic_debug_submod]test_dynamic_debug_init =pmf "init done\n"
lib/test_dynamic_debug.c:206 [test_dynamic_debug_submod]test_dynamic_debug_exit =pmf "exited\n"
[   62.186979] test_dynamic_debug: test_dd: do_prints:
[   62.187728] test_dynamic_debug: test_dd: doing categories
[   62.188004] test_dd: LOW msg
[   62.188167] test_dd: MID msg
[   62.188319] test_dd: HI msg
[   62.188463] test_dd: D2_CORE msg
[   62.188632] test_dd: D2_DRIVER msg
[   62.188807] test_dd: D2_KMS msg
[   62.188968] test_dd: D2_PRIME msg
[   62.189138] test_dd: D2_ATOMIC msg
[   62.189321] test_dd: D2_VBL msg
[   62.189487] test_dd: D2_STATE msg
[   62.189661] test_dd: D2_LEASE msg
[   62.189832] test_dd: D2_DP msg
[   62.189991] test_dd: D2_DRMRES msg
[   62.190175] test_dynamic_debug: test_dd: doing levels
[   62.190431] test_dd: V1 msg
[   62.190577] test_dd: V2 msg
[   62.190725] test_dd: V3 msg
[   62.190870] test_dd: V4 msg
[   62.191014] test_dd: V5 msg
[   62.191169] test_dd: V6 msg
[   62.191316] test_dd: V7 msg
[   62.191460] test_dd: L1 msg
[   62.191605] test_dd: L2 msg
[   62.191759] test_dd: L3 msg
[   62.191903] test_dd: L4 msg
[   62.192047] test_dd: L5 msg
[   62.192200] test_dd: L6 msg
[   62.192376] test_dd: L7 msg
did do_prints
NOTE: but they dont print here
[   62.348171] test_dynamic_debug_submod:do_prints: test_dd_submod: do_prints:
[   62.348940] test_dynamic_debug_submod:do_cats: test_dd_submod: doing categories
[   62.349740] test_dynamic_debug_submod:do_levels: test_dd_submod: doing levels
did do_prints
NOTE: if D2_CORE in 1, trigger toggled warning
NOTE: echo class D2_CORE -p
[   62.632634] dyndbg: read 17 bytes from userspace
[   62.633077] dyndbg: query 0: "class D2_CORE -p" mod:*
[   62.633523] dyndbg: split into words: "class" "D2_CORE" "-p"
[   62.634646] dyndbg: op='-' flags=0x0 maskp=0xfffffffe
[   62.635636] dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=D2_CORE
[   62.637202] dyndbg: good-class: test_dynamic_debug.D2_CORE  module:test_dynamic_debug nd:33 nc:4 nu:0
[   62.639078] dyndbg: changed lib/test_dynamic_debug.c:156 [test_dynamic_debug]do_cats p => _
[   62.640840] dyndbg: class-ref: test_dynamic_debug_submod.D2_CORE  module:test_dynamic_debug_submod nd:33 nc:0 nu:4
[   62.642777] jump_label: found toggled op at do_cats+0x11/0x180 [test_dynamic_debug_submod] [000000002815e1ff] (0f 1f 44 00 00 != e9 fe 00 00 00)) size:5 type:0
[   62.645454] dyndbg: changed lib/test_dynamic_debug.c:156 [test_dynamic_debug_submod]do_cats p => _
[   62.647335] dyndbg: processed 1 queries, with 2 matches, 0 errs
:#>

The warning is on submod.ko's D2_CORE prdbg, the -p change finds the
callsite already disabled.  That same callsite was supposedly enabled
earlier, but did not actually print when submod.pr_cats was called.
So it begs the question, what did get enabled earlier, that didnt draw
an error but also failed to enable the callsite ?

The initial value dependence is a strong hint, but I havent decoded it yet.

CC: Jason Baron <jbaron@akamai.com>
CC: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 arch/x86/kernel/jump_label.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index f5b8ef02d172..6c76bb8aed54 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -35,7 +35,7 @@ struct jump_label_patch {
 static struct jump_label_patch
 __jump_label_patch(struct jump_entry *entry, enum jump_label_type type)
 {
-	const void *expect, *code, *nop;
+	const void *expect, *code, *nop, *toggled;
 	const void *addr, *dest;
 	int size;
 
@@ -57,20 +57,28 @@ __jump_label_patch(struct jump_entry *entry, enum jump_label_type type)
 	default: BUG();
 	}
 
-	if (type == JUMP_LABEL_JMP)
+	if (type == JUMP_LABEL_JMP) {
 		expect = nop;
-	else
+		toggled = code;
+	} else {
 		expect = code;
-
+		toggled = nop;
+	}
 	if (memcmp(addr, expect, size)) {
 		/*
-		 * The location is not an op that we were expecting.
-		 * Something went wrong. Crash the box, as something could be
+		 * The location is not the op that we were expecting.
+		 * If its a well-formed toggled op, then warn,
+		 * otherwise crash the box, as something could be
 		 * corrupting the kernel.
 		 */
-		pr_crit("jump_label: Fatal kernel bug, unexpected op at %pS [%p] (%5ph != %5ph)) size:%d type:%d\n",
+		if (memcmp(addr, toggled, size)) {
+			pr_crit("jump_label: Fatal kernel bug, unexpected op at %pS [%p] (%5ph != %5ph)) size:%d type:%d\n",
+				addr, addr, addr, expect, size, type);
+			BUG();
+		} else {
+			pr_warn("jump_label: found toggled op at %pS [%p] (%5ph != %5ph)) size:%d type:%d\n",
 				addr, addr, addr, expect, size, type);
-		BUG();
+		}
 	}
 
 	if (type == JUMP_LABEL_NOP)
-- 
2.39.1

