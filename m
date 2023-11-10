Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2ED7E7E15
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 18:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCC810E13E;
	Fri, 10 Nov 2023 17:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1BA10E13E;
 Fri, 10 Nov 2023 17:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x9s/LbhV6ymMyl2qdLIGf9X5DBfCTAfDF4eYJOh9Vx0=; b=Rkji7kiMy3kxAH1nXHMd2o11vW
 YkoQAPbjQkUUCVyHGx3ZCOv54R91m7pMbf9s7MKo9JChwsa5O7RIOU+iV5k6XJDR1XZ3d5coTfna4
 tg+3k/5mZOd5vHXYQbG608Uj0B+syDGE6Uu95R8SKwyU3hcPddOBAJu91GYZO49UyLymGpLyIU26J
 xv8o4eyZFkrNXPz91IQYXIzYMNzRPVWDCf+ViigyzJ2SXIwtRBj8+asXia15DVpx7Sy8DrB1dA+HT
 AevadpkkluIvrmtJU0oU17Ey6W64MSnXWXJDl83330V7b8hCHGSrmwVzVoxkg1Lp+aFO1Qmi7a0Jl
 IuNRbBdg==;
Received: from pool-96-246-156-208.nycmny.fios.verizon.net ([96.246.156.208]
 helo=X1.myfiosgateway.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r1VEF-001ikc-7x; Fri, 10 Nov 2023 18:23:35 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/amd: Document device reset methods
Date: Fri, 10 Nov 2023 12:23:28 -0500
Message-ID: <20231110172328.27451-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.1
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
Cc: alexander.deucher@amd.com, ray.huang@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 christian.koenig@amd.com, kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document what each amdgpu driver reset method does.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v2: Add more details and small correction (Alex)

 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a79d53bdbe13..c4675572f907 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -504,6 +504,31 @@ struct amdgpu_allowed_register_entry {
 	bool grbm_indexed;
 };
 
+/**
+ * enum amd_reset_method - Methods for resetting AMD GPU devices
+ *
+ * @AMD_RESET_METHOD_NONE: The device will not be reset.
+ * @AMD_RESET_LEGACY: Method reserved for SI, CIK and VI ASICs.
+ * @AMD_RESET_MODE0: Reset the entire ASIC. Not currently available for the
+ *                   any device.
+ * @AMD_RESET_MODE1: Resets all IP blocks on the ASIC (SDMA, GFX, VCN, etc.)
+ *                   individually. Suitable only for some discrete GPU, not
+ *                   available for all ASICs.
+ * @AMD_RESET_MODE2: Resets a lesser level of IPs compared to MODE1. Which IPs
+ *                   are reset depends on the ASIC. Notably doesn't reset IPs
+ *                   shared with the CPU on APUs or the memory controllers (so
+ *                   VRAM is not lost). Not available on all ASICs.
+ * @AMD_RESET_BACO: BACO (Bus Alive, Chip Off) method powers off and on the card
+ *                  but without powering off the PCI bus. Suitable only for
+ *                  discrete GPUs.
+ * @AMD_RESET_PCI: Does a full bus reset using core Linux subsystem PCI reset
+ *                 and does a secondary bus reset or FLR, depending on what the
+ *                 underlying hardware supports.
+ *
+ * Methods available for AMD GPU driver for resetting the device. Not all
+ * methods are suitable for every device. User can overwrite the method using
+ * module parameter `reset_method`.
+ */
 enum amd_reset_method {
 	AMD_RESET_METHOD_NONE = -1,
 	AMD_RESET_METHOD_LEGACY = 0,
-- 
2.42.1

