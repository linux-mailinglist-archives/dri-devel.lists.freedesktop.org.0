Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E951F66A356
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C588810EB16;
	Fri, 13 Jan 2023 19:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C3C10EAF4;
 Fri, 13 Jan 2023 19:31:05 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id d22so2109999iof.5;
 Fri, 13 Jan 2023 11:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OEx7az1CRhHYvlWmc4MRaaF+3uZ2KBGutBbs32Sne1U=;
 b=FhAzt65WMpkrR6NV7Xt7h3ayQ1k6xsxgl2OalNQTIYKgl5qLokbMgec7unfxHUd5a2
 Zi2tqvpd/Z0fJiYaNTSbz+ceCWeMuAQuIhmBRPLiWl3KdbVX2kGFYGCHAiVJjr6ZFXpK
 mulX6DdxFu020z1xE5CiSVPtwxJpydyjshfktoCjVArtKCZA8yPcSH88ouHDogFd/JZ6
 rhXjSGns5MY8y08NphDOjkYOd974+6OzNEPafa77gOzRX4bR9iudqz55O2o103eOfQ6G
 mS9rmEG4LRNWN/KNHw+s9OXyRwKB/s7qNVixaonck4QDZuMn0l9UZUSn2ax5xbfb0Eko
 atJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OEx7az1CRhHYvlWmc4MRaaF+3uZ2KBGutBbs32Sne1U=;
 b=zkUajdAZEcIfYSZgmvRkpoBCj9ZmHq6dwVh8iMsRs7ZppOTPtKDhs10crndOW2OBfO
 1aVRrFCY1B7UFK3KB+Epm6FjL8C0VvIQH01nGdNi9cWtb6dxrogKRZa1vqr+o+415Y0P
 T1ekzoR4frWjeYNH8u8sauwqjyvs2h3LnUOBLaMQ6XgmGyN4tDUGMs61eTFp1x5aoMXw
 y/9fGScukjnpnUK/vo1/AKZQh+CGQL6y3nogojqNVJSxZzZjgWXUB94f348p7VqbufcP
 jOy5aok/z+fv3txjvGp54Fxh9DOoKduNZAUT9RQx9nO0isJZOJNntru5kVM8iQ+bDDTG
 XqRw==
X-Gm-Message-State: AFqh2kqbzmN93B4zlESUpS1IkBGfYn9N+Pi1ARJ5bxl8e90+lHbi/74s
 4085zcVF8GUpTfVYfkmjTqA=
X-Google-Smtp-Source: AMrXdXvqPlUeQL8K6/DCtOPddlhNQBa8PJpqgD9AwZBGJqC+QeZ1GxQF/yHWpBEPmeucGj1gmAkTPw==
X-Received: by 2002:a05:6602:298a:b0:6e2:f989:5a8a with SMTP id
 o10-20020a056602298a00b006e2f9895a8amr50131385ior.11.1673638264314; 
 Fri, 13 Jan 2023 11:31:04 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:31:03 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 20/20] jump_label: RFC - tolerate toggled state
Date: Fri, 13 Jan 2023 12:30:16 -0700
Message-Id: <20230113193016.749791-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113193016.749791-1-jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
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
 daniel.vetter@ffwll.ch, jbaron@akamai.com, seanpaul@chromium.org,
 gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__jump_label_patch currently will "crash the box" if it finds a
jump_entry not as expected.  ISTM this overly harsh; it doesn't
distinguish between "alternate/opposite" state, and truly
"insane/corrupted".

The "opposite" (but well-formed) state is a milder mis-initialization
problem, and some less severe mitigation seems practical.  ATM this
just warns about it; a range/enum of outcomes: warn, crash, silence,
ok, fixup-continue, etc, are possible on a case-by-case basis.

Ive managed to create this mis-initialization condition with
test_dynamic_debug.ko & _submod.ko.  These replicate DRM's regression
on DRM_USE_DYNAMIC_DEBUG=y; drm.debug callsites in drivers/helpers
(dependent modules) are not enabled along with those in drm.ko itself.

Heres that "opposite" state, occurring:

:#> echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
[  235.258452] dyndbg: bits:0x1 > *.p_disjoint_bits
[  235.258908] dyndbg: apply bitmap: 0x1 to: 0x4f for '*'
[  235.259351] dyndbg: query 0: "class D2_DRIVER -p" mod:*
[  235.259799] dyndbg: split into words: "class" "D2_DRIVER" "-p"
[  235.260290] dyndbg: op='-' flags=0x0 maskp=0xfffffffe
[  235.260720] dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=D2_DRIVER
[  235.261418] dyndbg: good-class: test_dynamic_debug.D2_DRIVER module: test_dynamic_debug nd: 32 nc: 4 nu: 0
[  235.262276] dyndbg: class-ref: test_dynamic_debug_submod.D2_DRIVER module: test_dynamic_debug_submod nd: 32 nc: 0 nu: 4
[  235.263178] jump_label: found alternate op at do_cats+0x16/0x180 [test_dynamic_debug_submod] [00000000ba944cc2] (0f 1f 44 00 00 != e9 e1 00 00 00)) size:5 type:0
[  235.264431] dyndbg: processed 1 queries, with 2 matches, 0 errs
[  235.264951] dyndbg: bit_1: 2 matches on class: D2_DRIVER -> 0x1
[  235.265444] dyndbg: query 0: "class D2_KMS -p" mod:*
[  235.265869] dyndbg: split into words: "class" "D2_KMS" "-p"
[  235.266337] dyndbg: op='-' flags=0x0 maskp=0xfffffffe
[  235.266767] dyndbg: parsed: func="" file="" module="" format="" lineno=0-0 class=D2_KMS
[  235.267432] dyndbg: good-class: test_dynamic_debug.D2_KMS module: test_dynamic_debug nd: 32 nc: 4 nu: 0
[  235.268264] dyndbg: class-ref: test_dynamic_debug_submod.D2_KMS module: test_dynamic_debug_submod nd: 32 nc: 0 nu: 4
[  235.269142] jump_label: found alternate op at do_cats+0x1b/0x180 [test_dynamic_debug_submod] [00000000e8d6c160] (0f 1f 44 00 00 != e9 c4 00 00 00)) size:5 type:0
[  235.270384] dyndbg: processed 1 queries, with 2 matches, 0 errs

RFC:

Ive hit this case a few times, but havent been able to isolate the
when and why.

warn-only is something of a punt, and I'm still left with remaining
bugs which are likely related; I'm able to toggle the p-flag on
callsites in the submod, but their enablement still doesn't yield
logging activity.

CC: Jason Baron <jbaron@akamai.com>
CC: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---

heres the Fatal kernel bug: (its on a -dirty kernel)

[ 2831.639643] dyndbg: good-class: test_dynamic_debug.D2_CORE module: test_dynamic_debug nd: 32 nc: 4 nu: 0
[ 2831.641316] dyndbg: class-ref: test_dynamic_debug_submod.D2_CORE module: test_dynamic_debug_submod nd: 32 nc: 0 nu: 4
[ 2831.642048] jump_label: Fatal kernel bug, unexpected op at do_cats+0x11/0x180 [test_dynamic_debug_submod] [00000000fa724232] (0f 1f 44 00 00 != e9 fe 00 00 00)) size:5 type:0
[ 2831.643077] ------------[ cut here ]------------
[ 2831.643537] kernel BUG at arch/x86/kernel/jump_label.c:73!
[ 2831.643902] invalid opcode: 0000 [#1] PREEMPT SMP KASAN
[ 2831.644248] CPU: 1 PID: 425 Comm: bash Tainted: G            E      6.1.0-tf2-00021-gbe37efe8728f-dirty #696
[ 2831.644862] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.1-2.fc37 04/01/2014
[ 2831.645431] RIP: 0010:__jump_label_patch.cold+0x24/0x26
[ 2831.645773] Code: 83 e9 ef 00 ac fe 48 c7 c3 20 4c 5c 85 41 56 45 89 f9 49 89 d8 4c 89 e9 4c 89 ea 4c 89 ee 48 c7 c7 00 70 c5 82 e8 d7 1a 01 00 <0f> 0b 41 54 45 31 e4 55 48 89 fd 53 bb 00 00 00 80 48 81 c3 00 20
[ 2831.646896] RSP: 0018:ffffc9000101f738 EFLAGS: 00010282
[ 2831.647242] RAX: 00000000000000a2 RBX: ffffffff855c4c20 RCX: 0000000000000000
[ 2831.647702] RDX: 00000000000000a2 RSI: ffffffff81294fc4 RDI: fffff52000203ede
[ 2831.648155] RBP: ffffc9000101f778 R08: 0000000000000003 R09: ffffc9000101f4ff
[ 2831.648626] R10: fffff52000203e9f R11: 78656e75202c756a R12: ffffffff855c4c20
[ 2831.649096] R13: ffffffffc0250011 R14: 0000000000000000 R15: 0000000000000005
[ 2831.649498] FS:  00007fe4014aa740(0000) GS:ffff88805ae00000(0000) knlGS:0000000000000000
[ 2831.649894] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2831.650175] CR2: 00007f9c326e6c08 CR3: 000000000ff59000 CR4: 0000000000750ee0
[ 2831.650520] PKRU: 55555554
[ 2831.650667] Call Trace:
[ 2831.650793]  <TASK>
[ 2831.650903]  ? do_cats+0x11/0x180 [test_dynamic_debug_submod]
[ 2831.651195]  arch_jump_label_transform_queue+0x43/0xa0
[ 2831.651450]  __jump_label_update+0x9b/0x1b0
[ 2831.651670]  static_key_disable_cpuslocked+0x9f/0xd0
[ 2831.651917]  static_key_disable+0x16/0x20
[ 2831.652117]  ddebug_change+0x45d/0x5c0
---
 arch/x86/kernel/jump_label.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/jump_label.c b/arch/x86/kernel/jump_label.c
index f5b8ef02d172..9175f7e8c267 100644
--- a/arch/x86/kernel/jump_label.c
+++ b/arch/x86/kernel/jump_label.c
@@ -35,7 +35,7 @@ struct jump_label_patch {
 static struct jump_label_patch
 __jump_label_patch(struct jump_entry *entry, enum jump_label_type type)
 {
-	const void *expect, *code, *nop;
+	const void *expect, *code, *nop, *alt;
 	const void *addr, *dest;
 	int size;
 
@@ -57,20 +57,28 @@ __jump_label_patch(struct jump_entry *entry, enum jump_label_type type)
 	default: BUG();
 	}
 
-	if (type == JUMP_LABEL_JMP)
+	if (type == JUMP_LABEL_JMP) {
 		expect = nop;
-	else
+		alt = code;
+	} else {
 		expect = code;
-
+		alt = nop;
+	}
 	if (memcmp(addr, expect, size)) {
 		/*
-		 * The location is not an op that we were expecting.
-		 * Something went wrong. Crash the box, as something could be
-		 * corrupting the kernel.
+		 * The location is not the op that we were expecting.
+		 * If its the alternate/toggled op, then warn, otherwise
+		 * something went more wrong. Crash the box, as
+		 * something could be corrupting the kernel.
 		 */
-		pr_crit("jump_label: Fatal kernel bug, unexpected op at %pS [%p] (%5ph != %5ph)) size:%d type:%d\n",
+		if (memcmp(addr, alt, size)) {
+			pr_crit("jump_label: Fatal kernel bug, unexpected op at %pS [%p] (%5ph != %5ph)) size:%d type:%d\n",
+				addr, addr, addr, expect, size, type);
+			BUG();
+		} else {
+			pr_warn("jump_label: found alternate op at %pS [%p] (%5ph != %5ph)) size:%d type:%d\n",
 				addr, addr, addr, expect, size, type);
-		BUG();
+		}
 	}
 
 	if (type == JUMP_LABEL_NOP)
-- 
2.39.0

