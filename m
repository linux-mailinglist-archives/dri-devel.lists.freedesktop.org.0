Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD49FA63606
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 15:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4955D10E153;
	Sun, 16 Mar 2025 14:16:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Vz8xGN21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7146610E14B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GTWa5kwPqHBmCbBE4oXDcWTPcQ6LPEgzrAREqrPkZSU=; b=Vz8xGN21S7wsa3u9S6rt+pvI33
 XHgLWyJAFTTBjxbdFzUwmnWv+HWzivhbsdgDGKTwqGLV6gj2mwNb4KaAiOuz80dNRZanDZOhhViiN
 8NaHZSjM6Jei76UZWhUWUDN1nqtmkAZVeiRL0Q64NrBsF6TlO5AXcs6kF+6uEhpHe/xLxSoUlEyLy
 V3l70jCuksLOsXJdoSAKWqOPfvb7ieF1KjOyX46kgFzCzL2WknH0g/ID1LH3rQEkcY1sZPQCJKRgv
 8ALzy11g/NSeyXIVMGCSVFhVXb8BPHRpjAVmOjLDKlYETfWcuSjBfWycVLs1mTVDnccQnFdycko+h
 itT8OLvw==;
Received: from [189.7.87.178] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ttomx-0016D3-3W; Sun, 16 Mar 2025 15:16:27 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v5 0/6] drm/v3d: Fix GPU reset issues on the Raspberry Pi 5
Date: Sun, 16 Mar 2025 11:15:07 -0300
Message-Id: <20250316-v3d-gpu-reset-fixes-v5-0-9779cdb12f06@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOzc1mcC/23NQWoDMQwF0KsEr+siyc54nFXvEbowsjwxtJlgp
 yYlzN3rBEpTMsv/xX+6qiolS1W7zVUVabnm+djD9mWj+BCOk+gce1YEtAUiq5uJejp96SJVzjr
 li1RNkTCxA4cYVV+eitwPfbh/7/mQ63ku3/cnDW/trzeseg016NEEP/gUo2d8y1P4yOGV5091A
 xv9IQbGdYQ6Qt54NpCA2T4h5gFBXEdMRwabXLBknTA8IfYRMeuI7QijuBHiKOCHf8iyLD/udaW
 ChgEAAA==
X-Change-ID: 20250224-v3d-gpu-reset-fixes-2d21fc70711d
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, kernel-dev@igalia.com, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Emma Anholt <emma@anholt.net>, "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4492; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=bLzJs1+KVokn9rMtVsjEvz8MaL3UKHVVfJcBPtevXkY=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn1t0x7Hxnio4TPJofo0r5TIxHiso7MmSoxYlSO
 7Se/BtfYfWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9bdMQAKCRA/8w6Kdoj6
 qprQCACRhgsLf1g27yDngiSnJt0LefdlfcanfpSpM0MxtG8in3RmMg6mr9v9Y7pXEhCkrSSqmOa
 BLeS6//3J3sOS6judoO+0rGbXR5TOIc/1D4noZK6AKYuEsJp4EE940QV+i1zjpaesXuyzsXr9Te
 Tc+e+079SFU14i42xivb2bYrGBB3LgezTNcQfY/CapPZ/M2bZyUToRWFgNJdagN4HYlBB6Dak+K
 NHEBkSowvNhf21YOhiN6YtE6X7t5syh37raF8ekODmw98Bb7UvSt7JF7YaI1BhT0peD5SqvR5Vj
 w9leXkgCF/8sUbUwNrOYGxMj1/5fmWcX1/x7nRbecCxE0p+P
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

The patches that prevent the same faulty job from being resubmitted in a
loop were merged in drm-misc/drm-misc-fixes in v4.

However, those patches don't solve the issue entirely. Even with a single
GPU reset, the UI still freezes on the Raspberry Pi 5, indicating a GPU
hang. Patches #1, #3, and #6 address this by properly configuring the
V3D_SMS registers, which are required for power management and resets
in V3D 7.1.

Patches #2, #4, and #5 are associated changes related to the robustness
of the DT bindings. Patch #3 added a new register bank to the DT binding
and during the reviewing process, we identified points that could to be
improved in the DT binding.

Patch #2 started by adding per-compatible register restrictions to ensure
that the DTB accurately reflects the hardware design. Patch #4 adds more
examples to improve DT binding checks and #5 updates the DT
maintainership, replacing Emma with the current v3d driver maintainer.

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

v4 -> v5:
- [1/7, 2/7] Applied to drm-misc/drm-misc-fixes
- Changed the commit order to aggregate all DT binding related patches
- [2/6] Add the widest constraints to `reg` and `reg-names` (Krzysztof Kozlowski)
- [2/6] Only declare the registers that exists in a SoC, don't declare all
  the possible registers for a V3D generation (Krzysztof Kozlowski)
- [2/6] Enforce register order by ascending address/offset (Florian Fainelli)
- [2/6] Fix the example to match the new stable ABI
- [3/6] Add Krzysztof's A-b (Krzysztof Kozlowski)
- [4/6] New PATCH: Add more examples to the DT binding
- [5/6] Add "v3d: " to commit title
- Link to v4: https://lore.kernel.org/r/20250313-v3d-gpu-reset-fixes-v4-0-c1e780d8e096@igalia.com

---
Maíra Canal (6):
      drm/v3d: Associate a V3D tech revision to all supported devices
      dt-bindings: gpu: v3d: Add per-compatible register restrictions
      dt-bindings: gpu: v3d: Add SMS register to BCM2712 compatible
      dt-bindings: gpu: v3d: Add additional examples to improve binding checks
      dt-bindings: gpu: v3d: Add V3D driver maintainer as DT maintainer
      drm/v3d: Use V3D_SMS registers for power on/off and reset on V3D 7.x

 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 124 +++++++++++++++++---
 drivers/gpu/drm/v3d/v3d_debugfs.c                  | 126 ++++++++++-----------
 drivers/gpu/drm/v3d/v3d_drv.c                      |  62 +++++++++-
 drivers/gpu/drm/v3d/v3d_drv.h                      |  22 +++-
 drivers/gpu/drm/v3d/v3d_gem.c                      |  27 ++++-
 drivers/gpu/drm/v3d/v3d_irq.c                      |   6 +-
 drivers/gpu/drm/v3d/v3d_perfmon.c                  |   4 +-
 drivers/gpu/drm/v3d/v3d_regs.h                     |  26 +++++
 drivers/gpu/drm/v3d/v3d_sched.c                    |   6 +-
 9 files changed, 303 insertions(+), 100 deletions(-)
---
base-commit: 83a0237859bc5a9e0a716e1db8e7fd3cafd63259
change-id: 20250224-v3d-gpu-reset-fixes-2d21fc70711d

