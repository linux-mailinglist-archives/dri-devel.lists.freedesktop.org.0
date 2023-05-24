Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4CE70FA87
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 17:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD0E10E2D2;
	Wed, 24 May 2023 15:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0FD10E2D2;
 Wed, 24 May 2023 15:38:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 36FDC6348F;
 Wed, 24 May 2023 15:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E836CC433EF;
 Wed, 24 May 2023 15:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684942721;
 bh=jEpldFaIL8OnA89BNINi6Q1IrGoWIGj+ECcNkECyKvs=;
 h=From:Date:Subject:To:Cc:From;
 b=Uk+0Okw2PjNvaphg/aulpUrbFKny49/4wUDB7dULE3wPHold2LaXO52/AsBGt66nF
 sGIIqiTIB23pzsqodJB9xXi7n23uVBIGBKLJUUljeD7zw5iM8nOygtz2dfxQxlydjD
 DrYyRDNrRewy9lRM0VAL22kElLr4CDMKX/TUj8y94tEkqtUQRKE4k119tFnXOfRYF5
 7xPC3XLW3KbrEmqJUPQAUO0y7Ame2EZ2XP/DvO4V9yJuqMRSX5FLxevayR+9Ga2XhR
 2OHMZBU97uM/mVQoWUgbX1KAfObX35LYJsJN6aP5FRbc19qH4T+iyK1l5oHtLKzlhS
 9eBmvkmi+/Zng==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 24 May 2023 08:38:27 -0700
Subject: [PATCH] drm/i915: Fix clang -Wimplicit-fallthrough in
 intel_async_flip_check_hw()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230524-intel_async_flip_check_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHIvbmQC/x2OWwrDIBAArxL87oI1FkqvUorodo1LjRG1L0LuX
 tPPYWCYVVQqTFVchlUUenHlJXU4HgaBwaaJgO+dhZJqlCelgVOjaGz9JjQ+cjYYCB8mvIHnHBm
 5gbcxtlCW5xQANWrp5HiWyosedbYSuGIThj0729qo7CIX8vz5n1xv2/YDozQ2gpkAAAA=
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030; i=nathan@kernel.org;
 h=from:subject:message-id; bh=jEpldFaIL8OnA89BNINi6Q1IrGoWIGj+ECcNkECyKvs=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCl5+g2vXoY0cN5XEAw3mbRAx2jrMdOGiV7+szoiTB4tl
 YxQmD2lo5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEyEXZqRYVtTZPTcu2dmd000
 /pxzM/3lqckOxcpuNbIL585tnRIc/IaRYe+sSZWt3/z8D+0wqXRdHKkS5eezyZNh2QuP5x5tyhf
 WsQMA
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
Cc: kernel test robot <lkp@intel.com>, trix@redhat.com,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev, ndesaulniers@google.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

  drivers/gpu/drm/i915/display/intel_display.c:6012:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
                  case I915_FORMAT_MOD_X_TILED:
                  ^
  drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert 'break;' to avoid fall-through
                  case I915_FORMAT_MOD_X_TILED:
                  ^
                  break;
  1 error generated.

Clang is a little more pedantic than GCC, which does not warn when
falling through to a case that is just break or return. Clang's version
is more in line with the kernel's own stance in deprecated.rst, which
states that all switch/case blocks must end in either break,
fallthrough, continue, goto, or return. Add the missing break to silence
the warning.

Fixes: 937859485aef ("drm/i915: Support Async Flip on Linear buffers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/202305241902.UvHtMoxa-lkp@intel.com/
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/i915/display/intel_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0490c6412ab5..6d49e0ab3e85 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6008,6 +6008,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
 					    plane->base.base.id, plane->base.name);
 				return -EINVAL;
 			}
+			break;
 
 		case I915_FORMAT_MOD_X_TILED:
 		case I915_FORMAT_MOD_Y_TILED:

---
base-commit: 9a2cb1b31c040e2f1b313e2f7921f0f5e6b66d82
change-id: 20230524-intel_async_flip_check_hw-implicit-fallthrough-c4c40b03802f

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

