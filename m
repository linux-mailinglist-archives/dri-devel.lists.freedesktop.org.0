Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7293499D9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 19:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D801F6EB79;
	Thu, 25 Mar 2021 18:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AC76EB79;
 Thu, 25 Mar 2021 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hiler.eu;
 s=selector2; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From; bh=rMxRV24sOunPf49yInVkdOpzBHpWmpqohwhw9aavtS8=; b=Wb9xw7
 Y5j6BgJbRWP7kyPpZI9StLv8LMjtRaKG8Ppib9pBALPJ38Vzt/EDwAricxkFxe+9nR46MEeN9HZVI
 jBNtT7fOffq3kd86xROENL4C3zB7couDhrdxfewsz3KrPwbliC1lEYeWR0vy6zMwjTB41u2PniX82
 7yv5Ps9GH95paNPjBR8HIh2sMbfeLCXHzOmQFzFrtfc4nA9yD2Frv3XtSJgEdnvHPCeM0k5WLy6Lc
 tlY8LdVz8IZzyCM2kqYlTI1eKqFKuQx6RlAPTIdGGitWBkMbVfepRyoXIBI3O3j+79tunWVkf6GWZ
 kk+CDZeuwlnyIWqoMbauLppIL2Yw==;
Received: from [10.9.9.72] (helo=submission01.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <arek@hiler.eu>)
 id 1lPVCd-0007DF-VJ; Thu, 25 Mar 2021 19:59:32 +0100
Received: by submission01.runbox with esmtpsa [Authenticated alias (933559)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lPVCU-0001MG-3U; Thu, 25 Mar 2021 19:59:22 +0100
From: Arkadiusz Hiler <arek@hiler.eu>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/5] benchmarks: Build gem_exec_tracer with meson
Date: Thu, 25 Mar 2021 20:59:11 +0200
Message-Id: <20210325185915.51590-1-arek@hiler.eu>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Seems it has been overlooked during mesonification.

It's a shared module that's meant to be LD_PRELOAD-ed to intercept
EXECBUFFER2 calls for the purpose of replaying them later.

Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>
---
 benchmarks/meson.build | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/benchmarks/meson.build b/benchmarks/meson.build
index c70e1aac..bede51dc 100644
--- a/benchmarks/meson.build
+++ b/benchmarks/meson.build
@@ -35,3 +35,11 @@ foreach prog : benchmark_progs
 		   install_dir : benchmarksdir,
 		   dependencies : igt_deps)
 endforeach
+
+lib_gem_exec_tracer = shared_module(
+  'gem_exec_tracer',
+  'gem_exec_tracer.c',
+  dependencies : dlsym,
+  include_directories : inc,
+  install_dir : benchmarksdir,
+  install: true)
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
