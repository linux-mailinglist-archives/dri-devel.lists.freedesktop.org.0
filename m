Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A987DB51B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 09:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2134A10E237;
	Mon, 30 Oct 2023 08:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C65F10E237
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yE3I9hxpgr+dfNEMK5SrOBDC+WCXJP+qei2H3hbmduQ=; b=rNGLLnMBn52pEkj/PDc/D+U6kG
 3CEA9qL+1C9I4uNnwcnH8jCQXs19lsgLQna23Yalnl39PlhcxKXewS1k3lOq+kFuIyhIzY/6AwcHI
 3jvq4+8ZvmB8O2oDxVbLlmRS9qshdgw8aLAWHapghxqSJCe2xEbapwUfP7MdsFAs2MlMu7cbpcqAz
 DmFEuwxzY764Hx0yjrat4F5qQOm2BuSwZ7nbY6MJBDNJ8D40mY6wDWWmPT1hxiWTIvuXJpZAM5lyl
 0E5AImS/yzpfBJ4Uo1FiM6tNnXKByL4gy9AN64qcopHr+oZLXndjDqN1nVClB1DGZuxLMiRZItO3o
 X9xqV4iw==;
Received: from 229.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.229]
 helo=vega..) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxNeB-00Ep4m-D0; Mon, 30 Oct 2023 09:29:19 +0100
From: Iago Toral Quiroga <itoral@igalia.com>
To: Maira Canal <mcanal@igalia.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] V3D module changes for Pi5
Date: Mon, 30 Oct 2023 09:28:54 +0100
Message-Id: <20231030082858.30321-1-itoral@igalia.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>, Stefan Wahren <wahrenst@gmx.net>
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

