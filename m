Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ED01C0E91
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F70C6EA62;
	Fri,  1 May 2020 07:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1F56E27C;
 Thu, 30 Apr 2020 22:10:50 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b2fc6ad;
 Thu, 30 Apr 2020 21:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=mail; bh=aJFrtx6lQiBbgvKXPLew//Y8Ivk=; b=lHSlfuScgujAfXJtyKYA
 1RfqTOsRlND8ZJBESNTBjJ3IbgUyajG5cOXCrHYltelH69//dV1x/XPeXX0CwW+k
 71LXbj/jJ2Gin8s/PKsrAEarzTAHG3r05Zr0d8J5ztjLV6r/9/J8jAVclxG9/AmO
 qZ3vfzKjL59/YIUuSJv9y42mR27ZmItkPkAlpMdz+8FG7km7xNnFbTc89TIpOvR3
 aaPDDUGNxwP+d2F4hwlEjS6TaRD05C47OxTxwwFssa43xeY+EVn9WzaMYHqxJycL
 x5ydiSJeP5h3jGy2+hWAoaEV8pvtNtW2yTu4lEqijWGcY5j/AsHNqEdYirvth3iL
 iQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4ee62b72
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 30 Apr 2020 21:58:52 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, bigeasy@linutronix.de, tglx@linutronix.de,
 chris@chris-wilson.co.uk
Subject: [PATCH] drm/i915: check to see if SIMD registers are available before
 using SIMD
Date: Thu, 30 Apr 2020 16:10:16 -0600
Message-Id: <20200430221016.3866-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sometimes it's not okay to use SIMD registers, the conditions for which
have changed subtly from kernel release to kernel release. Usually the
pattern is to check for may_use_simd() and then fallback to using
something slower in the unlikely case SIMD registers aren't available.
So, this patch fixes up i915's accelerated memcpy routines to fallback
to boring memcpy if may_use_simd() is false.

Cc: stable@vger.kernel.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/gpu/drm/i915/i915_memcpy.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/i915/i915_memcpy.c
index fdd550405fd3..7c0e022586bc 100644
--- a/drivers/gpu/drm/i915/i915_memcpy.c
+++ b/drivers/gpu/drm/i915/i915_memcpy.c
@@ -24,6 +24,7 @@
 
 #include <linux/kernel.h>
 #include <asm/fpu/api.h>
+#include <asm/simd.h>
 
 #include "i915_memcpy.h"
 
@@ -38,6 +39,12 @@ static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
 #ifdef CONFIG_AS_MOVNTDQA
 static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
 {
+	if (unlikely(!may_use_simd())) {
+		memcpy(dst, src, len);
+		return;
+	}
+
+
 	kernel_fpu_begin();
 
 	while (len >= 4) {
@@ -67,6 +74,11 @@ static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
 
 static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
 {
+	if (unlikely(!may_use_simd())) {
+		memcpy(dst, src, len);
+		return;
+	}
+
 	kernel_fpu_begin();
 
 	while (len >= 4) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
