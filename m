Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD558B0F76
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 18:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9EE510EED3;
	Wed, 24 Apr 2024 16:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q4KLqyhm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C435110EED3;
 Wed, 24 Apr 2024 16:14:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 274ED61BAA;
 Wed, 24 Apr 2024 16:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3650C113CD;
 Wed, 24 Apr 2024 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713975247;
 bh=gLX2YQyGmAdgLq6u/YnjgsLNR5DZySU5Kt1Sc3fzigg=;
 h=From:Date:Subject:To:Cc:From;
 b=q4KLqyhm93bjEfGDwxOu/oZXHejviVibimbuNe6+vK8Qu5SoXvRCuBZqblCHtvksQ
 646Ofixj4IpCShiWwbP0RyLRVEN1VSfCQBMOtAw85PkvRD1mCB1/6VprLlDLu92WyC
 2cLj/OeNRoR0vQdJiNYqSwduEWbhNkIJmBfGaZnOkVhEMOV6MqgdVm7LXIq44IVIFC
 8BIf230ddi6Mrd/DZT2gOFV4DHJstmDLbq2pLSmWL3tTRwP6OZjqXdfijoOpt1gar/
 08HGiJkRZwzSLkL4UH7JoVYP7QhhahsCLs0IJqiQDbFQt5bz4AvUoSlEsKsZaW30Ss
 don6tvs6P0WiQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 24 Apr 2024 09:14:02 -0700
Subject: [PATCH] drm/amd/display: Avoid -Wenum-float-conversion in
 add_margin_and_round_to_dfs_grainularity()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-amdgpu-display-dcn401-enum-float-conversion-v1-1-43a2b132ef44@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMkvKWYC/x3NwQrCMAyA4VcZORtoSxH1VcRDSLMZ2NLSuqGMv
 bvV43/5/h2aVJUGt2GHKps2zdbDnwbgJ9kkqKk3BBeiiyEiLWkqKyZtZaYPJrboPIqtC45zphd
 ytk3qz0F2V2Z/CWehAF0sVUZ9/2/3x3F8AUNHqwV9AAAA
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Cc: ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
 arnd@arndb.de, aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gLX2YQyGmAdgLq6u/YnjgsLNR5DZySU5Kt1Sc3fzigg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGma+ueaZSyMBI9H8yzfOLvpwiaB4up/8ybKL0zJF9kgF
 O9atmtNRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIn2SGf+pTo9krf/ybkaWw
 03PGTKVl0mmCT9z3Ha9mtrDeunHKoceMDKeVOT8qnyqfzFClFvJSaWryWgG3KUlSlUx3ZkRqHkp
 24gcA
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When building with clang 19 or newer (which strengthened some of the
enum conversion warnings for C), there is a warning (or error with
CONFIG_WERROR=y) around doing arithmetic with an enumerated type and a
floating point expression.

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:181:58: error: arithmetic between enumeration type 'enum dentist_divider_range' and floating-point type 'double' [-Werror,-Wenum-float-conversion]
    181 |         divider = (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
        |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
  1 error generated.

This conversion is expected due to the nature of the enumerated value
and definition, so silence the warning by casting the enumeration to an
integer explicitly to make it clear to the compiler.

Fixes: 3df48ddedee4 ("drm/amd/display: Add new DCN401 sources")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Alternatively, perhaps the potential truncation could happen before the
multiplication?

  divider = DFS_DIVIDER_RANGE_SCALE_FACTOR * (unsigned int)(vco_freq_khz / clock_khz);

I suspect the result of the division is probably not very large
(certainly not within UINT_MAX / 4), so I would not expect the
multiplication to overflow, but I was not sure so I decided to take the
safer, NFC change. I am happy to respin as necessary.
---
 .../gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
index e6698ee65843..65eb0187e965 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
@@ -178,7 +178,7 @@ static bool add_margin_and_round_to_dfs_grainularity(double clock_khz, double ma
 
 	clock_khz *= 1.0 + margin;
 
-	divider = (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
+	divider = (unsigned int)((int)DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
 
 	/* we want to floor here to get higher clock than required rather than lower */
 	if (divider < DFS_DIVIDER_RANGE_2_START) {

---
base-commit: d60dc4dd72412d5d9566fdf391e4202b05f88912
change-id: 20240424-amdgpu-display-dcn401-enum-float-conversion-c09cc1826ea2

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

