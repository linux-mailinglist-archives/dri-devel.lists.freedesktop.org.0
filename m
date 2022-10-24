Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD3460AEE0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFC7210E848;
	Mon, 24 Oct 2022 15:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7469310E843;
 Mon, 24 Oct 2022 15:20:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 209E0B81613;
 Mon, 24 Oct 2022 15:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE89C433D6;
 Mon, 24 Oct 2022 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666624810;
 bh=H2bKuQI9GGnT8jp0d4tu2szA9KN0+j+7o9HEhnNIOAI=;
 h=From:To:Cc:Subject:Date:From;
 b=WoLIxN2J0sQj1lnHeB/69IKFfxkr/06CGGaWg19KyogHWAluwtV2hQUEN79g8Zz4g
 9pN9DAwLqeeHBGBS8HnNeazdVVPp/eFhJR0+YWLYAxtH2o0Ahpmlj7kndZxqY1gT6O
 Uvqd75ZE2iDKM8nLXaL3XrH4RHc4AS4cFgNZcYrZILSEaKrgYDPXDmVdXxV1Nuz/fv
 zPL/vtgVJJck6GFVrapNJpnxk+Y2p1HY35w61pU9xuSka9SjBAcelvjbQYABruoKZb
 aHCJ2shrf7AIM8/FqAF+9eQPEKs6QEGC6A61ndesM3amr1zuAnFzPsJDfgyUy8Uqkn
 6dtwQsBe1tXyg==
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Subject: [PATCH] drm/amdgpu: Fix uninitialized warning in
 mmhub_v2_0_get_clockgating()
Date: Mon, 24 Oct 2022 08:19:53 -0700
Message-Id: <20221024151953.2238616-1-nathan@kernel.org>
X-Mailer: git-send-email 2.38.1
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clang warns:

  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c:686:3: error: variable 'data' is uninitialized when used here [-Werror,-Wuninitialized]
                  data |= MM_ATC_L2_MISC_CG__ENABLE_MASK;
                  ^~~~
  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c:674:10: note: initialize the variable 'data' to silence this warning
          int data, data1;
                  ^
                  = 0
  1 error generated.

This clearly should have just been a regular '=', as there was no prior
assignment.

Fixes: 7a4fad619819 ("drm/amdgpu: Remove ATC L2 access for MMHUB 2.1.x")
Link: https://github.com/ClangBuiltLinux/linux/issues/1748
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
index 5ec6d17fed09..998b5d17b271 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
@@ -683,7 +683,7 @@ static void mmhub_v2_0_get_clockgating(struct amdgpu_device *adev, u64 *flags)
 		/* There is no ATCL2 in MMHUB for 2.1.x. Keep the status
 		 * based on DAGB
 		 */
-		data |= MM_ATC_L2_MISC_CG__ENABLE_MASK;
+		data = MM_ATC_L2_MISC_CG__ENABLE_MASK;
 		data1 = RREG32_SOC15(MMHUB, 0, mmDAGB0_CNTL_MISC2_Sienna_Cichlid);
 		break;
 	default:

base-commit: fb5e487f910e1105019b883e8ed25e36e4bfd657
-- 
2.38.1

