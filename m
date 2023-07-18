Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FFD758768
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 23:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B8310E3CE;
	Tue, 18 Jul 2023 21:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C6710E3C0;
 Tue, 18 Jul 2023 21:44:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 79F1E611BE;
 Tue, 18 Jul 2023 21:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21FECC433C8;
 Tue, 18 Jul 2023 21:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689716681;
 bh=9i72DqKN7lkzR+XKZkj569gR0u3PkPJgu4SGD0TiESk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VO1YUR3LS3/Hl/O2yHRQKkIi5H+XQyI52EPEZV39Rd9s8//n/TuptytlL3mlBIAdB
 NRIeT8nbBeLWfgC89NcyndXHEhB9IFb4j2qXfcyE+DnCs/Hsw4IVxXfioT6qbVh9P8
 DwQ0kwUb4Sg7MLVE558dlrOhA94DDXfyirifZaJutlq45kLCMle3v5FmMcaTBPnIPV
 NjEPRPj2cy/KOCEv/xDbPuWYg5hIiS2y4BkDqanVIuRyIj+tbcGXZTEJwa57z9CvQk
 a05ERCYj8GzwUp9LxnGvsqyjTR1+/HCzI+i9q40+W/q9LVcxKzYwVsZTA/wchS36va
 HrrhbiOtDxLIg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 18 Jul 2023 14:44:20 -0700
Subject: [PATCH 2/2] drm/i915: Avoid -Wconstant-logical-operand in
 nsecs_to_jiffies_timeout()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-2-36ed8fc8faea@kernel.org>
References: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-0-36ed8fc8faea@kernel.org>
In-Reply-To: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-0-36ed8fc8faea@kernel.org>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, emma@anholt.net, 
 mwen@igalia.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765; i=nathan@kernel.org;
 h=from:subject:message-id; bh=9i72DqKN7lkzR+XKZkj569gR0u3PkPJgu4SGD0TiESk=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCnb2Y/96479l8qx589uPx+1Y5byJgp8XluOPLj5Y7rkx
 e8Hroe2d5SyMIhxMMiKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJpMUxMuz4vVXfaWXw3SyD
 zC/z35Uf/BG9KiH3cLzc1Lvds5+xmFkw/E+c8Ij34udDV8q2Pmvar7SMz3XBpu3CJ6Jd1lybzaf
 5p5wXAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: trix@redhat.com, intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 ndesaulniers@google.com, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 justinstitt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A proposed update to clang's -Wconstant-logical-operand to warn when the
left hand side is a constant shows the following instance in
nsecs_to_jiffies_timeout() when NSEC_PER_SEC is not a multiple of HZ,
such as CONFIG_HZ=300:

  drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
    189 |         if (NSEC_PER_SEC % HZ &&
        |             ~~~~~~~~~~~~~~~~~ ^
  drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: note: use '&' for a bitwise operation
    189 |         if (NSEC_PER_SEC % HZ &&
        |                               ^~
        |                               &
  drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: note: remove constant to silence this warning
  1 warning generated.

Turn this into an explicit comparison against zero to make the
expression a boolean to make it clear this should be a logical check,
not a bitwise one.

Link: https://reviews.llvm.org/D142609
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_wait.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
index 4a33ad2d122b..d4b918fb11ce 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
@@ -186,7 +186,7 @@ i915_gem_object_wait(struct drm_i915_gem_object *obj,
 static inline unsigned long nsecs_to_jiffies_timeout(const u64 n)
 {
 	/* nsecs_to_jiffies64() does not guard against overflow */
-	if (NSEC_PER_SEC % HZ &&
+	if ((NSEC_PER_SEC % HZ) != 0 &&
 	    div_u64(n, NSEC_PER_SEC) >= MAX_JIFFY_OFFSET / HZ)
 		return MAX_JIFFY_OFFSET;
 

-- 
2.41.0

