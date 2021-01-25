Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CBE3024CB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 13:24:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27286E08C;
	Mon, 25 Jan 2021 12:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976ED6E082;
 Mon, 25 Jan 2021 12:24:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D80B322472;
 Mon, 25 Jan 2021 12:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611577449;
 bh=61aLXnewGYT9pW69xQYb5+pJ+KbuONrN6DKFyYDPFOQ=;
 h=From:To:Cc:Subject:Date:From;
 b=sxpg1Z0P1BDyGQORROsgzEAv87fhNu0NhIOxsa9G9N//mYQ/Z1/9rvYANgnJ/bYGP
 iHZOJzXdK89VJj3DL/38vZAYlSkf02YLEAl9cqX+Acme98VSbl6gEWp9LxyhTECUDF
 K/RMRNPDt+ESva8julDgcZwqUlmB+eNf+Rs/GqfCzGnZN+R2uQpu2RoJs+c3cnKwmP
 lU6ykNqHRJLTIczgSuV5Yrd7ml5vQDsvrKrX8xvq1qGKHWEVC91QfOSjcxBs53moKe
 h+wFuTCoj/7UNN+PK2p1IuW2Y84Ce3PDxXxJyGk4kmRY8YYXdb0XqMF0DBwtWYeh0T
 QoLbwE5pi97sA==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH] amdgpu: fix clang build warning
Date: Mon, 25 Jan 2021 13:23:20 +0100
Message-Id: <20210125122402.4036126-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Joshua Aberback <joshua.aberback@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Roman Li <Roman.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

clang warns about the -mhard-float command line arguments
on architectures that do not support this:

clang: error: argument unused during compilation: '-mhard-float' [-Werror,-Wunused-command-line-argument]

Move this into the gcc-specific arguments.

Fixes: e77165bf7b02 ("drm/amd/display: Add DCN3 blocks to Makefile")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/dcn30/Makefile  | 6 ++++--
 drivers/gpu/drm/amd/display/dc/dcn301/Makefile | 3 ++-
 drivers/gpu/drm/amd/display/dc/dcn302/Makefile | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/Makefile b/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
index c20331eb62e0..dfd77b3cc84d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/Makefile
@@ -32,8 +32,8 @@ DCN30 = dcn30_init.o dcn30_hubbub.o dcn30_hubp.o dcn30_dpp.o dcn30_optc.o \
 
 
 ifdef CONFIG_X86
-CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_resource.o := -mhard-float -msse
-CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_optc.o := -mhard-float -msse
+CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_resource.o := -msse
+CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_optc.o := -msse
 endif
 
 ifdef CONFIG_PPC64
@@ -45,6 +45,8 @@ ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
+CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_resource.o += -mhard-float
+CFLAGS_$(AMDDALPATH)/dc/dcn30/dcn30_optc.o += -mhard-float
 endif
 
 ifdef CONFIG_X86
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/Makefile b/drivers/gpu/drm/amd/display/dc/dcn301/Makefile
index 3ca7d911d25c..09264716d1dc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/Makefile
@@ -14,7 +14,7 @@ DCN301 = dcn301_init.o dcn301_resource.o dcn301_dccg.o \
 		dcn301_dio_link_encoder.o dcn301_hwseq.o dcn301_panel_cntl.o dcn301_hubbub.o
 
 ifdef CONFIG_X86
-CFLAGS_$(AMDDALPATH)/dc/dcn301/dcn301_resource.o := -mhard-float -msse
+CFLAGS_$(AMDDALPATH)/dc/dcn301/dcn301_resource.o := -msse
 endif
 
 ifdef CONFIG_PPC64
@@ -25,6 +25,7 @@ ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
+CFLAGS_$(AMDDALPATH)/dc/dcn301/dcn301_resource.o += -mhard-float
 endif
 
 ifdef CONFIG_X86
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/Makefile b/drivers/gpu/drm/amd/display/dc/dcn302/Makefile
index 8d4924b7dc22..101620a8867a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn302/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/Makefile
@@ -13,7 +13,7 @@
 DCN3_02 = dcn302_init.o dcn302_hwseq.o dcn302_resource.o
 
 ifdef CONFIG_X86
-CFLAGS_$(AMDDALPATH)/dc/dcn302/dcn302_resource.o := -mhard-float -msse
+CFLAGS_$(AMDDALPATH)/dc/dcn302/dcn302_resource.o := -msse
 endif
 
 ifdef CONFIG_PPC64
@@ -24,6 +24,7 @@ ifdef CONFIG_CC_IS_GCC
 ifeq ($(call cc-ifversion, -lt, 0701, y), y)
 IS_OLD_GCC = 1
 endif
+CFLAGS_$(AMDDALPATH)/dc/dcn302/dcn302_resource.o += -mhard-float
 endif
 
 ifdef CONFIG_X86
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
