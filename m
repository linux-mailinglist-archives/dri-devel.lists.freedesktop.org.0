Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E4D7DC76E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 08:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EB210E419;
	Tue, 31 Oct 2023 07:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA71910E416
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Gjq6fjQV3V/kUXnqDrmOdv5PactEotElsmcVGlJqFI=; b=ro5B47lA1kK7u/l6aQkUvTm8Mn
 gt6i4VPrp2ERG9ipJ5pjW7Nq2eab9AshZnpUTempPgIOktHDhPdj9qqroP6P04yZRaqtKX8ZmT1nx
 HjE/8JeWv04nshw//4AAg9hfudjaBTCvSg3obYSurCb7jGiE4ApbvX96bWIwnbpu2w/Nw1uWbGWY4
 Ab8H/J4Xb65BHWn75AJ3xC7kbmC8xlzTEnZVo1rvemvI4bFb4RWEsF04QxCU4WDpZtMkeaP4hgPDk
 VTvyud/RYNdHfJfDaH+PCVF/doen51C4HZEOoIXAsImNghjwjd9x0BTVq6oBf4wrDsxq7Ej75I85M
 7w0KjnZA==;
Received: from 251.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.251]
 helo=vega.mundo-R.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxjLU-00FHU5-HX; Tue, 31 Oct 2023 08:39:28 +0100
From: Iago Toral Quiroga <itoral@igalia.com>
To: dri-devel@lists.freedesktop.org,
	Maira Canal <mcanal@igalia.com>
Subject: [PATCH v3 0/4] V3D module changes for Pi5
Date: Tue, 31 Oct 2023 08:38:55 +0100
Message-Id: <20231031073859.25298-1-itoral@igalia.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Melissa Wen <mwen@igalia.com>, kernel-dev@igalia.com,
 Rob Herring <robh+dt@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series includes patches to update the V3D kernel module
that drives the VideoCore VI GPU in Raspberry Pi 4 to also support
the Video Core VII iteration present in Raspberry Pi 5.

The first patch in the series adds a small uAPI update required for
TFU jobs, the second patch addresses the bulk of the work and
involves mostly updates to register addresses, the third and fourth
patches match the 'brcm,2712-v3d' device string from Pi5 with the
V3D driver.

The changes for the user-space driver can be found in the
corresponding Mesa MR here:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25450

Changes in v2:
  - Addeded s-o-b to patches (Maíra Canal)
  - patch 2: fixed style warnings (Maíra Canal)
  - patch 2: Use macro with version param to get reg addresses (Maíra Canal)
  - new patch: Update the device tree binding (Stefan Wahren)

Changes in v3:
  - Moved changelog entries in patches to cover letter (Stefan Wahren)
  - Added DT maintainers (Stefan Wahren, Krzysztof Kozlowski)

Iago Toral Quiroga (4):
  drm/v3d: update UAPI to match user-space for V3D 7.x
  drm/v3d: fix up register addresses for V3D 7.x
  dt-bindings: gpu: v3d: Add BCM2712's compatible
  drm/v3d: add brcm,2712-v3d as a compatible V3D device

 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml |   1 +
 drivers/gpu/drm/v3d/v3d_debugfs.c             | 178 ++++++++++--------
 drivers/gpu/drm/v3d/v3d_drv.c                 |   1 +
 drivers/gpu/drm/v3d/v3d_gem.c                 |   4 +-
 drivers/gpu/drm/v3d/v3d_irq.c                 |  46 +++--
 drivers/gpu/drm/v3d/v3d_regs.h                |  94 +++++----
 drivers/gpu/drm/v3d/v3d_sched.c               |  38 ++--
 include/uapi/drm/v3d_drm.h                    |   5 +
 8 files changed, 211 insertions(+), 156 deletions(-)

-- 
2.39.2

