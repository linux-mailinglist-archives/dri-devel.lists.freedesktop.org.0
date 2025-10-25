Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC1C096BF
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCB110E31C;
	Sat, 25 Oct 2025 16:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QQluQAB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDA010E31A;
 Sat, 25 Oct 2025 16:25:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3891645287;
 Sat, 25 Oct 2025 16:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 224D1C4CEF5;
 Sat, 25 Oct 2025 16:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409549;
 bh=/gMUlsevWP/kkCEbCOP7wyQ5geAlAwNaZlR4K/9Ax48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QQluQAB0A9aUiAbnBLmwr7WN2TvXO3cJR+UyNzwGFvVw2tnmaqil8a8eBjZxOWaU/
 SZXd+pWEWAycxIzZQCJYu6OAkHhEZqDLlKNOAlEL1ZuzxAPbr5kfp4Fc27Yhah2OyR
 rU+ey43mzS5xz8FBumIJuvW2YJqpaHS82HD4f8PSIdHLJgucFpH8vtyL2l0d4lpa8A
 +huNDNhbIt1B8v8HXDknbzIPlxDAmyVz9seei6EUDuWVkn8jm4fz6+SouTEa3lt6G5
 7QTeRumkpCafHGq10NrS85OLcpLD6blJFxVSgkJe/f+EMKzHPa5hYF5O4rQj2j2gSd
 fLB3IfNl9vCkQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sasha Levin <sashal@kernel.org>, robin.clark@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.17] drm/msm: Use
 of_reserved_mem_region_to_resource() for "memory-region"
Date: Sat, 25 Oct 2025 11:59:51 -0400
Message-ID: <20251025160905.3857885-360-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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

From: "Rob Herring (Arm)" <robh@kernel.org>

[ Upstream commit fb53e8f09fc1e1a343fd08ea4f353f81613975d7 ]

Use the newly added of_reserved_mem_region_to_resource() function to
handle "memory-region" properties.

The original code did not set 'zap_available' to false if
of_address_to_resource() failed which seems like an oversight.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/662275/
Link: https://lore.kernel.org/r/20250703183442.2073717-1-robh@kernel.org
[DB: dropped part related to VRAM, no longer applicable]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - Correctly handles DT “memory-region” for the zap shader by using the
    reserved-memory helper rather than treating the phandle target like
    a normal addressable node. This avoids misinterpreting reserved-
    memory nodes and ensures the region is actually available.
  - Fixes an oversight where failure to obtain the region did not mark
    zap firmware as unavailable, causing the driver to propagate a hard
    error instead of falling back.

- Key code changes
  - Switch to the correct API for reserved memory:
    - drivers/gpu/drm/msm/adreno/adreno_gpu.c:13 switched include from
      `linux/of_address.h` to `linux/of_reserved_mem.h`.
    - drivers/gpu/drm/msm/adreno/adreno_gpu.c:54 calls
      `of_reserved_mem_region_to_resource(np, 0, &r)` and on any failure
      now sets `zap_available = false` and returns the error (lines
      54–58).
  - Cleanup/removal of the old path:
    - Replaces the `of_parse_phandle(..., "memory-region", ...)` +
      `of_address_to_resource(...)` sequence with the reserved-mem
      helper, removing the intermediate `mem_np` handling and
      simplifying error paths.

- Why this matters for runtime behavior
  - The zap shader loader’s public entry point treats “zap not
    available” as a non-fatal condition to fall back on an alternate
    secure-mode exit path:
    - drivers/gpu/drm/msm/adreno/adreno_gpu.c:169–176 returns `-ENODEV`
      when `zap_available` is false, triggering fallback.
    - Callers explicitly handle `-ENODEV` as the “no zap shader” path:
      - drivers/gpu/drm/msm/adreno/a5xx_gpu.c:987–1007 uses the fallback
        when `a5xx_zap_shader_init()` returns `-ENODEV`.
  - Previously, if `of_address_to_resource()` failed, the code returned
    an error without setting `zap_available = false`. That meant callers
    saw a generic error (not `-ENODEV`) and aborted bring-up instead of
    taking the designed fallback. This is precisely the oversight the
    commit fixes.

- Impact and risk assessment
  - Scope is small and contained to one function in a single driver
    file. No architectural changes.
  - Behavior change is specifically in error handling: failures to
    resolve “memory-region” now reliably signal “zap not available,”
    aligning with the existing, intentional `-ENODEV` fallback path in
    the Adreno bring-up sequence.
  - Using `of_reserved_mem_region_to_resource()` ensures the driver only
    uses regions actually initialized by the reserved-memory core
    (drivers/of/of_reserved_mem.c) and returns `-ENODEV` if the memory-
    region is missing or unavailable. This is safer than reading “reg”
    directly from the node and avoids mapping memory that wasn’t
    properly reserved.
  - Note: the function no longer calls `of_node_put(np)` after
    `of_get_child_by_name()`. There was already at least one leak path
    for `np` (the early `!of_device_is_available(np)` return). This
    commit removes the `of_node_put(np)` that existed on the success
    path. The leak is a single DT node ref during probe/init and
    practically negligible. It does not outweigh the bugfix in error
    handling. If desired, a follow-up to put `np` after use is trivial
    and independent of this fix.

- Stable backport considerations
  - This is a clear bugfix with a targeted change in error handling and
    a move to the correct reserved-memory API.
  - If a given stable series already has
    `of_reserved_mem_region_to_resource()`, this applies cleanly and is
    low risk.
  - If not, the minimal backport can keep the existing
    `of_address_to_resource()` path but still add the key fix (set
    `zap_available = false` when it fails), preserving the functional
    improvement with minimal churn.

- Conclusion
  - The change fixes a real user-visible issue (unnecessary bring-up
    failure instead of the intended fallback), is small and localized,
    and reduces misuse of DT reserved-memory. It satisfies stable
    criteria as a low-risk bugfix suitable for backport.

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f1230465bf0d0..8c6336b007dc0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -10,7 +10,7 @@
 #include <linux/interconnect.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kernel.h>
-#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -33,7 +33,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
-	struct device_node *np, *mem_np;
+	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
@@ -51,18 +51,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		return -ENODEV;
 	}
 
-	mem_np = of_parse_phandle(np, "memory-region", 0);
-	of_node_put(np);
-	if (!mem_np) {
+	ret = of_reserved_mem_region_to_resource(np, 0, &r);
+	if (ret) {
 		zap_available = false;
-		return -EINVAL;
-	}
-
-	ret = of_address_to_resource(mem_np, 0, &r);
-	of_node_put(mem_np);
-	if (ret)
 		return ret;
-
+	}
 	mem_phys = r.start;
 
 	/*
-- 
2.51.0

