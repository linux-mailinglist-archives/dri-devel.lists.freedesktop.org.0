Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B670688C59B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 15:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FDD10EB2D;
	Tue, 26 Mar 2024 14:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E4BQDDTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF52010EA60;
 Tue, 26 Mar 2024 14:47:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9ACA36124E;
 Tue, 26 Mar 2024 14:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C54DC433F1;
 Tue, 26 Mar 2024 14:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711464475;
 bh=2VRodtLYji0E2iO14KF37hDwen2VjVMAvwAcrcgPpT4=;
 h=From:To:Cc:Subject:Date:From;
 b=E4BQDDTkgrdwdIkmMvielkRpTAsqHIEG3dNSrY21fnxwoLYvLOoCje+XGKi0Q6+lb
 vXFNIViLU9NTXcLVTR3XwdRIIouf6xWYpzwnmHI2t5ZxiCoyK5CtJGLAMaMQhP4GqM
 LFJItP61E8WSzWQOgV3iidHNLT5C63yxLkS/wCtha2CzziKBhSzJgJ8mdUJnDc4MsM
 mHMWnrCmz0M9BMr26mXQL/Ot8TdiiiLpbc7Z6ykNI9wEj4r4WuyvPMGjqE0R7U0B4a
 JYlh8463XR1dZ+1yi/iNsx2NnACkLOIgc70LBf5p2SbJ28JbOOieq3jHp29R//i1VX
 XyBZZot1G0W0w==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>,
 Bill Metzenthen <billm@melbpc.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Jakub Kicinski <kuba@kernel.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 "Manoj N. Kumar" <manoj@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: [PATCH 00/12] kbuild: enable some -Wextra warnings by default
Date: Tue, 26 Mar 2024 15:47:15 +0100
Message-Id: <20240326144741.3094687-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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

From: Arnd Bergmann <arnd@arndb.de>

This is a follow-up on a couple of patch series I sent in the past,
enabling -Wextra (aside from stuff that is explicitly disabled),
-Wcast-function-pointer-strict and -Wrestrict.

I have tested these on 'defconfig' and 'allmodconfig' builds across
all architectures, as well as many 'randconfig' builds on x86, arm and
arm64. It would be nice to have all the Makefile.extrawarn changes in
v6.10, hopefully with the driver fixes going in before that through
the respective subsystem trees.

     Arnd

Arnd Bergmann (12):
  kbuild: make -Woverride-init warnings more consistent
  [v3] parport: mfc3: avoid empty-body warning
  kbuild: turn on -Wextra by default
  kbuild: remove redundant extra warning flags
  firmware: dmi-id: add a release callback function
  nouveau: fix function cast warning
  cxlflash: fix function pointer cast warnings
  x86: math-emu: fix function cast warnings
  kbuild: enable -Wcast-function-type-strict unconditionally
  sata: sx4: fix pdc20621_get_from_dimm() on 64-bit
  [v4] kallsyms: rework symbol lookup return codes
  kbuild: turn on -Wrestrict by default

 arch/x86/math-emu/fpu_etc.c                   |  9 +++--
 arch/x86/math-emu/fpu_trig.c                  |  6 ++--
 arch/x86/math-emu/reg_constant.c              |  7 +++-
 drivers/ata/sata_sx4.c                        |  6 ++--
 drivers/firmware/dmi-id.c                     |  7 +++-
 .../gpu/drm/amd/display/dc/dce110/Makefile    |  2 +-
 .../gpu/drm/amd/display/dc/dce112/Makefile    |  2 +-
 .../gpu/drm/amd/display/dc/dce120/Makefile    |  2 +-
 drivers/gpu/drm/amd/display/dc/dce60/Makefile |  2 +-
 drivers/gpu/drm/amd/display/dc/dce80/Makefile |  2 +-
 drivers/gpu/drm/i915/Makefile                 |  6 ++--
 .../drm/nouveau/nvkm/subdev/bios/shadowof.c   |  7 +++-
 drivers/gpu/drm/xe/Makefile                   |  4 +--
 drivers/net/ethernet/renesas/sh_eth.c         |  2 +-
 drivers/parport/parport_mfc3.c                |  3 +-
 drivers/pinctrl/aspeed/Makefile               |  2 +-
 drivers/scsi/cxlflash/lunmgt.c                |  4 +--
 drivers/scsi/cxlflash/main.c                  | 14 ++++----
 drivers/scsi/cxlflash/superpipe.c             | 34 +++++++++----------
 drivers/scsi/cxlflash/superpipe.h             | 11 +++---
 drivers/scsi/cxlflash/vlun.c                  |  7 ++--
 fs/proc/Makefile                              |  2 +-
 include/linux/filter.h                        | 14 ++++----
 include/linux/ftrace.h                        |  6 ++--
 include/linux/module.h                        | 14 ++++----
 kernel/bpf/Makefile                           |  2 +-
 kernel/bpf/core.c                             |  7 ++--
 kernel/kallsyms.c                             | 23 +++++++------
 kernel/module/kallsyms.c                      | 26 +++++++-------
 kernel/trace/ftrace.c                         | 13 +++----
 mm/Makefile                                   |  3 +-
 scripts/Makefile.extrawarn                    | 33 ++++--------------
 32 files changed, 134 insertions(+), 148 deletions(-)

-- 
2.39.2

Cc: Bill Metzenthen <billm@melbpc.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: x86@kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: "Manoj N. Kumar" <manoj@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-ide@vger.kernel.org
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-scsi@vger.kernel.org
Cc: bpf@vger.kernel.org
Cc: linux-trace-kernel@vger.kernel.org
Cc: linux-modules@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kbuild@vger.kernel.org
Cc: llvm@lists.linux.dev
