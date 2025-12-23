Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB34CD8B5E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 11:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D56910E130;
	Tue, 23 Dec 2025 10:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u9vNJBwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A73110E130
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 10:05:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AF5E76013A;
 Tue, 23 Dec 2025 10:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4701C113D0;
 Tue, 23 Dec 2025 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766484331;
 bh=2bElGj6oTaVx916jVSsTwC8Pc7YB1+/6sP52v4v8qrk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u9vNJBwBzKlcs1iotQo3Aud3FwV5HGfV0d8l9NULIJwKEoT9uv4jcqrsuI0nvAfhc
 r9QwSemUJNubJhWdtT+COwO4ahleqdeXym5IAhephj+vWAZGwnMcbUNeJYjNc5qSGX
 ZdG/cIueWN6Stnsm/tUFB2d+//9SD1m3h6jTeRjZkDk/L+RaR32ruNve2RM+yIMyMp
 Ot7sbhrezOQ3l97MJyurlVbjRSB8X+PrtEnQo39bBjaX/DOoZK8qlBJl86D5Ig4lxe
 0pogJzbZfKB0VcKQSLIRpcWiNTiY/uTYPQG+dtif6Jhxuvt0OVq6kyH91YW0YshWAD
 1Xy4uT+wAgYkw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Lizhi Hou <lizhi.hou@amd.com>, Sasha Levin <sashal@kernel.org>,
 mamin506@gmail.com, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.18] accel/amdxdna: Block running under a hypervisor
Date: Tue, 23 Dec 2025 05:05:13 -0500
Message-ID: <20251223100518.2383364-9-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223100518.2383364-1-sashal@kernel.org>
References: <20251223100518.2383364-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.2
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

From: "Mario Limonciello (AMD)" <superm1@kernel.org>

[ Upstream commit 7bbf6d15e935abbb3d604c1fa157350e84a26f98 ]

SVA support is required, which isn't configured by hypervisor
solutions.

Closes: https://github.com/QubesOS/qubes-issues/issues/10275
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4656
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
Link: https://patch.msgid.link/20251213054513.87925-1-superm1@kernel.org
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Commit Analysis: accel/amdxdna: Block running under a hypervisor

### 1. COMMIT MESSAGE ANALYSIS

The commit message indicates this fix prevents the amdxdna driver from
running under hypervisors because SVA (Shared Virtual Addressing)
support is required but not configured in hypervisor solutions. Two bug
tracker links are provided:
- QubesOS issue #10275
- freedesktop.org AMD issue #4656

This shows real users are hitting this problem.

### 2. CODE CHANGE ANALYSIS

The change is minimal:

```c
+#include <asm/hypervisor.h>
...
+       if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
+               XDNA_ERR(xdna, "Running under hypervisor not
supported");
+               return -EINVAL;
+       }
```

The fix adds an early check in `aie2_init()` that:
1. Uses the well-established x86 hypervisor detection infrastructure
2. If not running on bare metal (native), prints an error and returns
   -EINVAL
3. This happens before any resource allocation, making it a clean early-
   exit

**The bug mechanism:** Without this check, when users run this driver in
virtualized environments (QubesOS, etc.), the driver attempts to
initialize but fails due to missing SVA support. This leads to confusing
errors, potential crashes, or undefined behavior. The fix makes the
driver fail gracefully with a clear message.

### 3. CLASSIFICATION

This is a **bug fix** - specifically a "graceful failure" fix that
prevents the driver from attempting an unsupported configuration. It
does not add features; it blocks an unsupported environment with a clear
error.

### 4. SCOPE AND RISK ASSESSMENT

- **Lines changed:** 5 lines (1 include + 4 lines of logic)
- **Files touched:** 1 file
- **Complexity:** Very low - trivial conditional check
- **Risk:** Very low - early return before any resource allocation
- **Dependencies:** Uses `hypervisor_is_type()` and `X86_HYPER_NATIVE`
  which have been in the kernel for years (x86 hypervisor detection is
  mature infrastructure)

### 5. USER IMPACT

- **Affected users:** Those running VMs (QubesOS, etc.) with AMD XDNA
  hardware
- **Severity without fix:** Confusing failures, crashes, or undefined
  behavior when attempting to use the driver
- **Severity with fix:** Clean error message explaining the limitation

The linked issues show this is a real problem users are encountering.

### 6. STABILITY INDICATORS

- Has `Reviewed-by:` from AMD engineer (Lizhi Hou)
- Has real bug reports from multiple sources
- Simple, obvious fix

### 7. DEPENDENCY CHECK

The amdxdna driver is relatively new (added around kernel 6.11-6.12). It
exists in:
- Recent mainline releases
- Potentially only very recent stable trees (6.12.x if supported)

The hypervisor detection APIs used (`hypervisor_is_type`,
`X86_HYPER_NATIVE`) are stable and have existed for years.

### 8. STABLE CRITERIA ASSESSMENT

| Criterion | Assessment |
|-----------|------------|
| Obviously correct | ✅ Yes - trivial check |
| Fixes real bug | ✅ Yes - prevents crashes in VMs |
| Important issue | ✅ Yes - affects VM users |
| Small/contained | ✅ Yes - 5 lines |
| No new features | ✅ Yes - disables unsupported config |
| Low risk | ✅ Yes - clean early return |

### CONCLUSION

This commit is appropriate for stable backporting. It's a small, low-
risk fix that prevents the driver from running in unsupported
virtualized environments where it would otherwise fail with confusing
behavior or crashes. The fix is surgically precise - adding an early
check with a clean error return.

The stable maintainers will only apply this to kernel versions that
contain the amdxdna driver (likely only very recent stable trees like
6.12.x). The patch itself meets all stable criteria: obviously correct,
fixes a real bug that users are hitting, small scope, and no new
features.

**YES**

 drivers/accel/amdxdna/aie2_pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 43f725e1a2d7..6e07793bbeac 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -17,6 +17,7 @@
 #include <linux/iopoll.h>
 #include <linux/pci.h>
 #include <linux/xarray.h>
+#include <asm/hypervisor.h>
 
 #include "aie2_msg_priv.h"
 #include "aie2_pci.h"
@@ -486,6 +487,11 @@ static int aie2_init(struct amdxdna_dev *xdna)
 	unsigned long bars = 0;
 	int i, nvec, ret;
 
+	if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
+		XDNA_ERR(xdna, "Running under hypervisor not supported");
+		return -EINVAL;
+	}
+
 	ndev = drmm_kzalloc(&xdna->ddev, sizeof(*ndev), GFP_KERNEL);
 	if (!ndev)
 		return -ENOMEM;
-- 
2.51.0

