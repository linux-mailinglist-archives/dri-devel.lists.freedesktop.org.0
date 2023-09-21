Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D4C7A951D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 16:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7C110E137;
	Thu, 21 Sep 2023 14:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E06710E5AF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 14:15:27 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1695305725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOWN2bP3bL+i8WU1AdRgy2WvLGaYMKjJkqdur8ZMT5U=;
 b=zORUY5Xkv3wz1yjY4DDKkQzFNInGAaoCeKEqG8+SzR8M7zDT0N1ruCuMNVKDpM/fKlgh73
 fCJ9m049d4T1G6He4zIdup4YW9DyLZfJ3UttPGqrGWJ9oE7ZDP7ycRW5rcLKKikjQCRGET
 jCLgZa1VMJ7KQVKgCsAC3egfUFh3s+VfG4ZqUPCPd3sjB2aTLTTj+gpVxI0tR5NdXqVO5l
 3bXUalpS8v/0gDxhZJLRMkBHXbg1kii1QG768G1dMAVf5JAGh1f0A/30F6o1mOJcITctew
 //OuRxjrxXhzO68wK9aob0OVtekkra0z7oi6HKnN5NN1ekbE6Ih5O43FeqhxxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1695305725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FOWN2bP3bL+i8WU1AdRgy2WvLGaYMKjJkqdur8ZMT5U=;
 b=sHscKoKcbk8ILIhokgaU/401GuFMDm+ywMOvfMNuLAGr4ihRWdmUt0LzNlUx4RJMoS+GcD
 MZ3VQCQlC4Y4mODQ==
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/5] drm/amd/display: Remove migrate_en/dis from
 dc_fpu_begin().
Date: Thu, 21 Sep 2023 16:15:12 +0200
Message-Id: <20230921141516.520471-2-bigeasy@linutronix.de>
In-Reply-To: <20230921141516.520471-1-bigeasy@linutronix.de>
References: <20230921141516.520471-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Tianci Yin <tianci.yin@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a revert of the commit mentioned below while it is not wrong, as
in the kernel will explode, having migrate_disable() here it is
complete waste of resources.

Additionally commit message is plain wrong the review tag does not make
it any better. The migrate_disable() interface has a fat comment
describing it and it includes the word "undesired" in the headline which
should tickle people to read it before using it.
Initially I assumed it is worded too harsh but now I beg to differ.

The reviewer of the original commit, even not understanding what
migrate_disable() does should ask the following:

- migrate_disable() is added only to the CONFIG_X86 block and it claims
  to protect fpu_recursion_depth. Why are the other the architectures
  excluded?

- migrate_disable() is added after fpu_recursion_depth was modified.
  Shouldn't it be added before the modification or referencing takes
  place?

Moving on.
Disabling preemption DOES prevent CPU migration. A task, that can not be
pushed away from the CPU by the scheduler (due to disabled preemption)
can not be pushed or migrated to another CPU.

Disabling migration DOES NOT ensure consistency of per-CPU variables. It
only ensures that the task acts always on the same per-CPU variable. The
task remains preemptible meaning multiple tasks can access the same
per-CPU variable. This in turn leads to inconsistency for the statement

                  *pcpu -=3D 1;

with two tasks on one CPU and a preemption point during the RMW
operation:

     Task A                           Task B
     read pcpu to reg  # 0
     inc reg           # 0 -> 1
                                      read pcpu to reg  # 0
                                      inc reg           # 0 -> 1
                                      write reg to pcpu # 1
     write reg to pcpu # 1

At the end pcpu reads 1 but should read 2 instead. Boom.

get_cpu_ptr() already contains a preempt_disable() statement. That means
that the per-CPU variable can only be referenced by a single task which
is currently running. The only inconsistency that can occur if the
variable is additionally accessed from an interrupt.

Remove migrate_disable/enable() from dc_fpu_begin/end().

Cc: Tianci Yin <tianci.yin@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Fixes: 0c316556d1249 ("drm/amd/display: Disable migration to ensure consist=
ency of per-CPU variable")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/d=
rm/amd/display/amdgpu_dm/dc_fpu.c
index 172aa10a8800f..86f4c0e046548 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -91,7 +91,6 @@ void dc_fpu_begin(const char *function_name, const int li=
ne)
=20
 	if (*pcpu =3D=3D 1) {
 #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
-		migrate_disable();
 		kernel_fpu_begin();
 #elif defined(CONFIG_PPC64)
 		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
@@ -132,7 +131,6 @@ void dc_fpu_end(const char *function_name, const int li=
ne)
 	if (*pcpu <=3D 0) {
 #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_end();
-		migrate_enable();
 #elif defined(CONFIG_PPC64)
 		if (cpu_has_feature(CPU_FTR_VSX_COMP)) {
 			disable_kernel_vsx();
--=20
2.40.1

