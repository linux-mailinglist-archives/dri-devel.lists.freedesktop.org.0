Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C838A85A048
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 10:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019F510E27E;
	Mon, 19 Feb 2024 09:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42A110E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 09:54:18 +0000 (UTC)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gauss.telenet-ops.be (Postfix) with ESMTPS id 4TddD76VL9z4wwcd
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 10:54:15 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:79b0:1378:2db5:5f5a])
 by laurent.telenet-ops.be with bizsmtp
 id oxuE2B0051qcN2A01xuEdN; Mon, 19 Feb 2024 10:54:15 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rc0Lm-0016At-Ck;
 Mon, 19 Feb 2024 10:54:14 +0100
Date: Mon, 19 Feb 2024 10:54:14 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-kernel@vger.kernel.org
cc: Fangrui Song <maskray@google.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 sparclinux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: Build regressions/improvements in v6.8-rc5
In-Reply-To: <20240219080729.777675-1-geert@linux-m68k.org>
Message-ID: <a8609e7e-fb0-7ac-aca9-6aa21ba5126b@linux-m68k.org>
References: <CAHk-=wi8vZD7EXZfob-yhfDERyfzWxzMOzG9FsOuaKU-v6+PHA@mail.gmail.com>
 <20240219080729.777675-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Mon, 19 Feb 2024, Geert Uytterhoeven wrote:
> JFYI, when comparing v6.8-rc5[1] to v6.8-rc4[3], the summaries are:
>  - build errors: +6/-14

   + /kisskb/src/arch/arm64/include/asm/jump_label.h: error: invalid 'asm': invalid operand:  => 25:2

arm64-gcc5/arm64-allmodconfig

   + /kisskb/src/arch/sparc/kernel/setup_64.c: error: no previous prototype for 'alloc_irqstack_bootmem' [-Werror=missing-prototypes]:  => 602:13

sparc64-gcc{5,13}/sparc64-{allmod,allno,def}config

   + /kisskb/src/arch/sparc/kernel/time_64.c: error: no previous prototype for 'sched_clock' [-Werror=missing-prototypes]:  => 880:20

sparc64-gcc5/sparc64-{allmod,allno,def}config
sparc64-gcc13/sparc64-{allno,def}config

   + error: modpost: "__moddi3" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!:  => N/A
   + error: modpost: "__umoddi3" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!:  => N/A

m68k-gcc8/m68k-allmodconfig
xtensa-gcc13/xtensa-allmodconfig
parisc-gcc13/parisc-allmodconfig

Fixes available

   + {standard input}: Error: unknown pseudo-op: `.cfi_def_cfa_offse':  => 605

SH ICE crickets

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/b401b621758e46812da61fa58a67c3fd8d91de0d/ (144 out of 239 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/841c35169323cd833294798e58b9bf63fa4fa1de/ (238 out of 239 configs)

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
