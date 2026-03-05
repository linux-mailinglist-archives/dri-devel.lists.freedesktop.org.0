Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIs0ECyjqWl5BQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:37:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8BF214A41
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 16:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA1410EC28;
	Thu,  5 Mar 2026 15:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nXquMt/o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F6910E2BF;
 Thu,  5 Mar 2026 15:37:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B328C61344;
 Thu,  5 Mar 2026 15:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391BFC19423;
 Thu,  5 Mar 2026 15:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772725030;
 bh=6tujxYpRlhxev6CqOHJ+H3QHJmBdmYEOacOOWDxfjrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nXquMt/oLERUwzeQ9JN2sXweNmfxtj9AAk2HljBlMGJHuHYFfSTECv18cqj/BENwY
 WlJcAwVzkITu0NQOSFYV4yZOsFu3kRs0c5CcvE4jZY3kuCYnUTUUM7JBmQoWy9KBeu
 i2bi6CLNo/5NhUGKFoDueubPe/INcD1ZhThGN1g1vxXcp2HKA/8PKUwvmzIOPstq/y
 Uwk5LlvuUoolHy0vPu95Jm1rilRUi2FpCQe6eN9XsgfTYVLkNHHbN22ikkUl7c/uVX
 dVMnM0b8vOhXZiB4pdvRi6bF+KhT6pDUgtmMQ+3mY+jKiY00pPo3RTP5o/vEJSXjMV
 qLkoGWErlx6xQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: sguttula <suresh.guttula@amd.com>,
 Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] drm/amdgpu/vcn5: Add SMU dpm interface type
Date: Thu,  5 Mar 2026 10:36:46 -0500
Message-ID: <20260305153704.106918-3-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305153704.106918-1-sashal@kernel.org>
References: <20260305153704.106918-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.6
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
X-Rspamd-Queue-Id: 8D8BF214A41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: sguttula <suresh.guttula@amd.com>

[ Upstream commit a5fe1a54513196e4bc8f9170006057dc31e7155e ]

This will set AMDGPU_VCN_SMU_DPM_INTERFACE_* smu_type
based on soc type and fixing ring timeout issue seen
for DPM enabled case.

Signed-off-by: sguttula <suresh.guttula@amd.com>
Reviewed-by: Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit f0f23c315b38c55e8ce9484cf59b65811f350630)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### What the commit does
This adds 3 lines to `vcn_v5_0_0_sw_init()` that set the SMU DPM
(Dynamic Power Management) interface type in the VCN firmware shared
memory structure. It sets `AMDGPU_VCN_SMU_DPM_INTERFACE_FLAG` in
`present_flag_0` and tells the firmware whether the platform is an APU
or DGPU.

### Bug being fixed
The commit message explicitly states it's "fixing ring timeout issue
seen for DPM enabled case." Ring timeouts on GPU hardware mean the GPU's
command ring becomes unresponsive, which causes GPU hangs and failed
video encoding/decoding operations. This is a serious user-visible
issue.

### Pattern analysis
This is clearly a missing initialization that was already present in VCN
v4.0 (`vcn_v4_0.c:157-159`) and VCN v4.0.5 (`vcn_v4_0_5.c:201-203`) but
was omitted when VCN v5.0.0 was written. The code added is **identical**
to the VCN v4.0 pattern:
```c
fw_shared->present_flag_0 |=
cpu_to_le32(AMDGPU_VCN_SMU_DPM_INTERFACE_FLAG);
fw_shared->smu_dpm_interface.smu_interface_type = (adev->flags &
AMD_IS_APU) ?
    AMDGPU_VCN_SMU_DPM_INTERFACE_APU :
AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU;
```

### Stable kernel criteria
1. **Obviously correct**: YES - exact copy of well-established pattern
   from VCN v4.0
2. **Fixes a real bug**: YES - ring timeouts causing GPU hangs
3. **Important**: YES - ring timeouts prevent proper GPU video
   functionality
4. **Small and contained**: YES - 3 lines, single file, single function
5. **No new features**: Correct - enables existing DPM functionality to
   work properly
6. **Risk**: Very low - the `smu_dpm_interface` field already exists in
   the `amdgpu_vcn5_fw_shared` structure; the constants are already
   defined; this just populates fields that were left uninitialized

### Affected versions
VCN v5.0.0 was added in commit `b6d1a06320519` which is present since
v6.10. Stable trees 6.12.y, 6.11.y, and 6.10.y would benefit from this
fix.

### Verification
- Verified vcn_v5_0_0.c current code at line 173-175 shows
  `present_flag_0` being set but **no** `smu_dpm_interface`
  initialization (confirmed the bug exists)
- Verified vcn_v4_0.c lines 157-159 contain the identical DPM interface
  initialization pattern
- Verified `AMDGPU_VCN_SMU_DPM_INTERFACE_FLAG`,
  `AMDGPU_VCN_SMU_DPM_INTERFACE_APU`,
  `AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU` are defined in `amdgpu_vcn.h`
- Verified `smu_dpm_interface` field exists in `amdgpu_vcn5_fw_shared`
  structure definition
- Verified VCN v5.0.0 was first added in commit b6d1a06320519, present
  since v6.10
- Could not directly verify the upstream cherry-pick source commit
  f0f23c315b38 (not reachable from current branch), but the "(cherry
  picked from commit ...)" tag confirms it was already deemed important
  within the amdgpu tree

### Conclusion
This is a small, surgical fix for a real hardware issue (ring timeouts)
on VCN 5.0 AMD GPUs. The fix follows an identical pattern already used
in VCN v4.0 and v4.0.5 drivers, making it obviously correct. The risk is
minimal - it simply populates firmware shared memory fields that were
being left uninitialized. Users with VCN 5.0 hardware experiencing DPM-
related ring timeouts would directly benefit.

**YES**

 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 0202df5db1e12..6109124f852e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -174,6 +174,10 @@ static int vcn_v5_0_0_sw_init(struct amdgpu_ip_block *ip_block)
 		fw_shared->present_flag_0 = cpu_to_le32(AMDGPU_FW_SHARED_FLAG_0_UNIFIED_QUEUE);
 		fw_shared->sq.is_enabled = 1;
 
+		fw_shared->present_flag_0 |= cpu_to_le32(AMDGPU_VCN_SMU_DPM_INTERFACE_FLAG);
+		fw_shared->smu_dpm_interface.smu_interface_type = (adev->flags & AMD_IS_APU) ?
+			AMDGPU_VCN_SMU_DPM_INTERFACE_APU : AMDGPU_VCN_SMU_DPM_INTERFACE_DGPU;
+
 		if (amdgpu_vcnfw_log)
 			amdgpu_vcn_fwlog_init(&adev->vcn.inst[i]);
 
-- 
2.51.0

