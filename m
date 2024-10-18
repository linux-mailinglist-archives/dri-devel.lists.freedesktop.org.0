Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6BB9A4201
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC3510E94C;
	Fri, 18 Oct 2024 15:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o3xQvM09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EA310E948;
 Fri, 18 Oct 2024 15:11:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F39D5C5C76;
 Fri, 18 Oct 2024 15:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BAEC4CEC3;
 Fri, 18 Oct 2024 15:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729264310;
 bh=ozQGRjTiJsgBjbD1hrI8hLdNjmZDLyuYj4VRqdkZMfs=;
 h=From:To:Cc:Subject:Date:From;
 b=o3xQvM092JnNMfXjoiZXQ3+03M4ehf+23ubfGB63ZUkeZcA6TcPHiiEj1O/FkZ1ty
 F4e+jaMZ/V7rVsM5dqLbmJUsa88Ud2R3o97PZqdQ+y099WhpGIDaWtzJwkJq65ojPr
 jcgntWoGHOLS5LrcXLFq55jYN/8EdpChcmHgRWPQS5LHahiHkt4t42Hu53K3dzEPGx
 qEjhzWmr3Sm3uNSuxdyeeP0r4J8jrr5K94+1lGA3Pa8qt+pEiIuisx3JXasvn+Bces
 jnZNab9TtabZfeuFYQd5JKb8O7SYEO9Rm5nm5PtOlPFil/jGA8O0S9//dxmEbkb5Sy
 XdxW58/uAiOUg==
From: Arnd Bergmann <arnd@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: [PATCH] drm: a6xx: avoid excessive stack usage
Date: Fri, 18 Oct 2024 15:11:38 +0000
Message-Id: <20241018151143.3543939-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

Clang-19 and above sometimes end up with multiple copies of the large
a6xx_hfi_msg_bw_table structure on the stack. The problem is that
a6xx_hfi_send_bw_table() calls a number of device specific functions to
fill the structure, but these create another copy of the structure on
the stack which gets copied to the first.

If the functions get inlined, that busts the warning limit:

drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]

Mark all of them as 'noinline_for_stack' ensure we only have one copy
of the structure per function.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index cdb3f6e74d3e..5699e0420eb8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -259,7 +259,8 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
-static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+/* noinline to avoid having multiple copies of 'msg' on stack */
+static noinline_for_stack void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
 	msg->bw_level_num = 1;
@@ -287,7 +288,7 @@ static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
-static void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	msg->bw_level_num = 13;
 
@@ -346,7 +347,7 @@ static void a619_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[0][0] = 0x40000000;
 }
 
-static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/*
 	 * Send a single "off" entry just to get things running
@@ -385,7 +386,7 @@ static void a640_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][2] =  0x60000001;
 }
 
-static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/*
 	 * Send a single "off" entry just to get things running
@@ -416,7 +417,7 @@ static void a650_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
-static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/*
 	 * Send a single "off" entry just to get things running
@@ -447,7 +448,7 @@ static void a690_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
-static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/*
 	 * Send a single "off" entry just to get things running
@@ -478,7 +479,7 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
-static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/*
 	 * Send a single "off" entry just to get things running
@@ -509,7 +510,7 @@ static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] =  0x60000001;
 }
 
-static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	msg->bw_level_num = 12;
 
@@ -565,7 +566,7 @@ static void a730_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] = 0x60000001;
 }
 
-static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	msg->bw_level_num = 1;
 
@@ -590,7 +591,7 @@ static void a740_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 	msg->cnoc_cmds_data[1][0] = 0x60000001;
 }
 
-static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+static noinline_for_stack void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
 	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
 	msg->bw_level_num = 1;
-- 
2.39.5

