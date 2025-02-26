Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5744CA46B98
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 20:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EBD10E9D1;
	Wed, 26 Feb 2025 19:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dYLm0z+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6588A10E2F2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mpwa6/uBXoaoc6fsdsrIQ+p/83zvCQFS2f88erlQmg4=; b=dYLm0z+k/u+7NgY7O3kmn9/3Us
 /W1Gzpev5TE2VP8xAi66OVCgdPDwwiQJDskJbt4lqkCh0eTFJInKsNwwbzu/1qohXL5ltPinZlMKj
 VF/FwAc0fdYYOw6tvKu8eboCKLl1VGihVe+nbbtB54DtwqSX0R6aeLw+X5MA+r35FHq+qTOS+X5sX
 SRK6M0uoOXBfh7wmFU6EHKQr297znCVWm5diVJlVBcFic7U2US4XCNHzL2m1UAPhIdrHYEsU6tXQF
 F1+/62M9c1cOQ8e9e3Z9ocLTpGjjq8j/Qq3o5l30oAGP8rFZhQashDP3S6G+0yDjwk4am+BAE3ekW
 XbeKOHHw==;
Received: from [187.36.213.55]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnNZ0-0019lA-Jt; Wed, 26 Feb 2025 20:59:32 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/6] drm/v3d: Fix GPU reset issues on the Raspberry Pi 5
Date: Wed, 26 Feb 2025 16:58:58 -0300
Message-Id: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAINyv2cC/x3LMQqAMAxA0atIZgNtVASvIg7SRs2ipdEilN7d4
 vj4/AzKUVhhajJETqJynRW2bcAd67kziq8GMjQYoh5T53EPD0ZWvnGTlxXJk93caEZrPdQzRP5
 DHeellA9ZJWboZQAAAA==
X-Change-ID: 20250224-v3d-gpu-reset-fixes-2d21fc70711d
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 stable@vger.kernel.org, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=maTR3ti8tvPnzk7Cgr35MKKCHPcKWcgGdel0PTrdSgU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBnv3KfjQe2bjSPQxhTZuEzwp81ZDAzKQENWg2nx
 hKZm+uac9aJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ79ynwAKCRA/8w6Kdoj6
 quyUCADWpDpWKUIno8zufuNqCvo4qBqsEN1B1NXlbDLjG2Uto2HMMOp5DgL854AtHG/1QXCQ9cF
 OjT5VEZzx68M0qyGJr7xBJ819dEfpMSsz2dXMiriiAViQ+xV0XuDk//6hVJgo/DDCa80tE0Q4+j
 C63GhFjtsUmrnqTf0ROzZsHPDJ7epGMuR+u0RBbSlKa4J5AS81973fa5/9oYVm/yZajnbV1Q/9x
 KQYYX80OPdWTCYWea2k2OvbnN+/g5z0cN0PKbozag8L2wIdTB+wSKGCptbTzQfMf8u3TVgd0bN9
 7P/YdM946JCZiVA1JE+yZ7tXWoLhDrLjm3GVYkt+aeoGZIC5
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
Patches #3 to #5 address this by properly configuring the V3D_SMS
registers, which are required for power management and resets in V3D 7.1.

Patch #6 updates the DT maintainership, replacing Emma with the current
v3d driver maintainer.

[1] https://github.com/raspberrypi/linux/issues/6660

Best Regards,
- Maíra

---
Maíra Canal (6):
      drm/v3d: Don't run jobs that have errors flagged in its fence
      drm/v3d: Set job pointer to NULL when the job's fence has an error
      drm/v3d: Associate a V3D tech revision to all supported devices
      dt-bindings: gpu: v3d: Add SMS to the registers' list
      drm/v3d: Use V3D_SMS registers for power on/off and reset on V3D 7.x
      dt-bindings: gpu: Add V3D driver maintainer as DT maintainer

 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      |  8 +--
 drivers/gpu/drm/v3d/v3d_drv.c                      | 58 ++++++++++++++++++++--
 drivers/gpu/drm/v3d/v3d_drv.h                      | 18 +++++++
 drivers/gpu/drm/v3d/v3d_gem.c                      | 17 +++++++
 drivers/gpu/drm/v3d/v3d_regs.h                     | 26 ++++++++++
 drivers/gpu/drm/v3d/v3d_sched.c                    | 23 +++++++--
 6 files changed, 140 insertions(+), 10 deletions(-)
---
base-commit: 099b79f94366f3110783301e20d8136d762247f8
change-id: 20250224-v3d-gpu-reset-fixes-2d21fc70711d

