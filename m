Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68649A5F8DA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8D210E21D;
	Thu, 13 Mar 2025 14:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="A5cnM9XV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388CE10E8C4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P3srhLIfq8Wq4n45Wagy1GLghBDDbdc8AIcVQdkfytk=; b=A5cnM9XVhkblo5+fl9OPXY1H/R
 X8WPUr6csTXcvhgikGs5W5sDBy7g9Ep07YAfGrooShi3hfFzHERvtOsHwkhN3dR5+nQ0VATApyDhD
 ZQAZ7Uj8w4ico5hXCBra9jTgAppYL29rP6AR36ujbl/PigeTGfIKjfi4ld1TrjW7+dU2bOaPJB1VW
 xO7RO4iXl4ixE1XJUCTKAcgkNBg4ghcSSO196BwfD5eFjaXAbAari/tRaG4fEZ3k03zNcqrSqB1Ht
 rvdGRW9UeRTtFnU0ENZwuOq+kABgfFBZ4oFK88vJzqHLtJHBVyRNQcLIL6h5BANphT9MLDP3frHx+
 ORsVpmZw==;
Received: from [189.7.87.170] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tsjpQ-008Cju-UH; Thu, 13 Mar 2025 15:46:39 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 0/7] drm/v3d: Fix GPU reset issues on the Raspberry Pi 5
Date: Thu, 13 Mar 2025 11:43:25 -0300
Message-Id: <20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA7v0mcC/23NQQ7CIBAF0Ks0rMXAgG1x5T2MCwJDS6JtA5Vom
 t5d2sSoscv/J//NRCIGj5Eci4kETD76vstB7gpiWt01SL3NmQCDAwOQNAlLm+FOA0YcqfMPjBQ
 scGcqVnFuSV4OAddDHp4vObc+jn14rk8SX9q3V256iVNGa6FVqZy1yvCTb/TV673pb2QBE3wQw
 eptBDICSigjmGPGyD9EfCGcbyMiI6V0lZYgKzTsB5nn+QUrxOXZQQEAAA==
X-Change-ID: 20250224-v3d-gpu-reset-fixes-2d21fc70711d
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, kernel-dev@igalia.com, stable@vger.kernel.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Emma Anholt <emma@anholt.net>, "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3355; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=fGbjVVhtgTGnk+Pdsq2/tMP9YwJwXrXJYfwHG5ZtuOM=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn0u/HlES3T+/8LfsRS2qERjnnzhB7NYzEoTXLB
 sDmyEY5U3iJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9LvxwAKCRA/8w6Kdoj6
 qvg2B/44yeYdYbn7dPw5jdr2dYPPF7aGGCfhOdBTwYVqQa6VupwU+Dt/3gcTEtUxkSM++I3Cbvf
 senMLa0t+JTpwIUI0zxewvr9nfqWgKzmNBJq9SOc4rvzSeII61Q/l0kEPLWPvQsMeobMfG6tFOI
 FYKqZHNVkx+nFlpKc+I0ext2K17YiaVFJlvSpqKNctda2V7DDRBTVAFxx9SAuAns9Lb/mX5k4ht
 B7H53wvLIiCP9jg06cv7oWxtDSg7qJu8FkbqhK+fNCT7WV/nQgTl/HgD0BGduDSHGX11dekY0J1
 cZsKuSHsQxW1fpZUnqnpsj9I7rNo4yZCThFQFJ2i4QMcXaig
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

This series addresses GPU reset issues reported in [1], where running a
long compute job would trigger repeated GPU resets, leading to a UI
freeze.

Patches #1 and #2 prevent the same faulty job from being resubmitted in a
loop, mitigating the first cause of the issue.

However, the issue isn't entirely solved. Even with only a single GPU
reset, the UI still freezes on the Raspberry Pi 5, indicating a GPU hang.
Patches #3 to #6 address this by properly configuring the V3D_SMS
registers, which are required for power management and resets in V3D 7.1.

Patch #7 updates the DT maintainership, replacing Emma with the current
v3d driver maintainer.

[1] https://github.com/raspberrypi/linux/issues/6660

Best Regards,
- Maíra

---
v1 -> v2:
- [1/6, 2/6, 5/6] Add Iago's R-b (Iago Toral)
- [3/6] Use V3D_GEN_* macros consistently throughout the driver (Phil Elwell)
- [3/6] Don't add Iago's R-b in 3/6 due to changes in the patch
- [4/6] Add per-compatible restrictions to enforce per‐SoC register rules (Conor Dooley)
- [6/6] Add Emma's A-b, collected through IRC (Emma Anholt)
- [6/6] Add Rob's A-b (Rob Herring)
- Link to v1: https://lore.kernel.org/r/20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com

v2 -> v3:
- [3/7] Add Iago's R-b (Iago Toral)
- [4/7, 5/7] Separate the patches to ease the reviewing process -> Now,
  PATCH 4/7 only adds the per-compatible rules and PATCH 5/7 adds the
  SMS registers
- [4/7] `allOf` goes above `additionalProperties` (Krzysztof Kozlowski)
- [4/7, 5/7] Sync `reg` and `reg-names` items (Krzysztof Kozlowski)
- Link to v2: https://lore.kernel.org/r/20250308-v3d-gpu-reset-fixes-v2-0-2939c30f0cc4@igalia.com

v3 -> v4:
- [4/7] BCM2712 has an external reset controller, therefore the "bridge"
	register is not needed (Krzysztof Kozlowski)
- [4/7] Remove the word "required" from the reg descriptions (Rob Herring)
- [5/7] Improve commit message (Rob Herring)
- Link to v3: https://lore.kernel.org/r/20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com

---
Maíra Canal (7):
      drm/v3d: Don't run jobs that have errors flagged in its fence
      drm/v3d: Set job pointer to NULL when the job's fence has an error
      drm/v3d: Associate a V3D tech revision to all supported devices
      dt-bindings: gpu: v3d: Add per-compatible register restrictions
      dt-bindings: gpu: v3d: Add SMS register to BCM2712 compatible
      drm/v3d: Use V3D_SMS registers for power on/off and reset on V3D 7.x
      dt-bindings: gpu: Add V3D driver maintainer as DT maintainer

 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      |  77 ++++++++++---
 drivers/gpu/drm/v3d/v3d_debugfs.c                  | 126 ++++++++++-----------
 drivers/gpu/drm/v3d/v3d_drv.c                      |  62 +++++++++-
 drivers/gpu/drm/v3d/v3d_drv.h                      |  22 +++-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  27 ++++-
 drivers/gpu/drm/v3d/v3d_irq.c                      |   6 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |   4 +-
 drivers/gpu/drm/v3d/v3d_regs.h                     |  26 +++++
 drivers/gpu/drm/v3d/v3d_sched.c                    |  29 ++++-
 9 files changed, 279 insertions(+), 100 deletions(-)
---
base-commit: 10646ddac2917b31c985ceff0e4982c42a9c924b
change-id: 20250224-v3d-gpu-reset-fixes-2d21fc70711d

