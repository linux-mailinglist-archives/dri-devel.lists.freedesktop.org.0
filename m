Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF4D7DB7ED
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6E110E285;
	Mon, 30 Oct 2023 10:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5897210E287
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:23:45 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7082:5ab3:115b:c8d0])
 by baptiste.telenet-ops.be with bizsmtp
 id 4APi2B0091qcjVs01APi8M; Mon, 30 Oct 2023 11:23:42 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qxPQq-007p2t-PZ;
 Mon, 30 Oct 2023 11:23:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qxPQs-006o58-Di;
 Mon, 30 Oct 2023 11:23:42 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm v5 1/9] intel: determine target endianness using meson
Date: Mon, 30 Oct 2023 11:23:28 +0100
Message-Id: <27fc7125f8312610a72b78cdea5a2155cfec9466.1698661177.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698661177.git.geert@linux-m68k.org>
References: <cover.1698661177.git.geert@linux-m68k.org>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The endianness of the target is currently determined based on
preprocessor symbols.  Unfortunately some symbols checked are wrong
(sparc64-linux-gnu-gcc does not define __BIG_ENDIAN__ or SPARC), and
several checks for big-endian architectures are missing.

Fix this by introducing a new preprocessor symbol HAVE_BIG_ENDIAN, which
is set based on meson's knowledge of the target endianness.

Android.common.mk does not need an update, as Android is always
little-endian (https://developer.android.com/ndk/guides/abis.html).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
v5:
  - Add Reviewed-by,

v4:
  - Replace explicit #ifdef checks by a define set by meson,

v3:
  - No changes,

v2:
  - Add arm, aarch64, microblaze, s390, and sh.
---
 intel/uthash.h | 4 ++--
 meson.build    | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/intel/uthash.h b/intel/uthash.h
index 45d1f9fc12a1d6f9..62e1650804841638 100644
--- a/intel/uthash.h
+++ b/intel/uthash.h
@@ -648,11 +648,11 @@ do {
 #define MUR_PLUS2_ALIGNED(p) (((unsigned long)p & 3UL) == 2UL)
 #define MUR_PLUS3_ALIGNED(p) (((unsigned long)p & 3UL) == 3UL)
 #define WP(p) ((uint32_t*)((unsigned long)(p) & ~3UL))
-#if (defined(__BIG_ENDIAN__) || defined(SPARC) || defined(__ppc__) || defined(__ppc64__))
+#ifdef HAVE_BIG_ENDIAN
 #define MUR_THREE_ONE(p) ((((*WP(p))&0x00ffffff) << 8) | (((*(WP(p)+1))&0xff000000) >> 24))
 #define MUR_TWO_TWO(p)   ((((*WP(p))&0x0000ffff) <<16) | (((*(WP(p)+1))&0xffff0000) >> 16))
 #define MUR_ONE_THREE(p) ((((*WP(p))&0x000000ff) <<24) | (((*(WP(p)+1))&0xffffff00) >>  8))
-#else /* assume little endian non-intel */
+#else /* little endian non-intel */
 #define MUR_THREE_ONE(p) ((((*WP(p))&0xffffff00) >> 8) | (((*(WP(p)+1))&0x000000ff) << 24))
 #define MUR_TWO_TWO(p)   ((((*WP(p))&0xffff0000) >>16) | (((*(WP(p)+1))&0x0000ffff) << 16))
 #define MUR_ONE_THREE(p) ((((*WP(p))&0xff000000) >>24) | (((*(WP(p)+1))&0x00ffffff) <<  8))
diff --git a/meson.build b/meson.build
index e203965d82eb620b..d2fdf7929f363f84 100644
--- a/meson.build
+++ b/meson.build
@@ -226,6 +226,11 @@ if with_freedreno_kgsl and not with_freedreno
   error('cannot enable freedreno-kgsl without freedreno support')
 endif
 config.set10('_GNU_SOURCE', true)
+
+if target_machine.endian() == 'big'
+  config.set('HAVE_BIG_ENDIAN', 1)
+endif
+
 config_file = configure_file(
   configuration : config,
   output : 'config.h',
-- 
2.34.1

