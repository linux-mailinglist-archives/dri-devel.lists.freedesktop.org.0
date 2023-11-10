Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 977227E7D87
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 16:56:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B548810E114;
	Fri, 10 Nov 2023 15:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B5910E114;
 Fri, 10 Nov 2023 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PXwXN5tEaR5kdeL10MocxWEaauKlj7fnNpl4PFnuxYM=; b=d1kbIHQgk3i7aNFylGG3Bb2XtI
 AmBsCJCFTGSWWS+JpsukzdbLm80G/eW43IctFGZ3y0SxuGQ8tCPMJRv7eX1YGTX41ouUDPVFXcAu3
 1DFFveqrJUD4hJ3RvcPkZsDrS6AnufUvcRR3IVFkHsEkojSPGtHIaPxT71zkPHGz0BEufb3OTZdic
 avFBnBOGyB0mAucQCN1fyneCryJ0HF7BJCk5L8PMN6OUD69/VkrgFXtc+b9HMddus1BMbRPVCMFy3
 2kJwmjzSf6zPgzzfVlsu1MqH9KtMlTDyVMcxMBSrusmxxHVnDLb2cmgdFVnbKzZPN9ZT46epEcgNY
 PZi+w30g==;
Received: from pool-96-246-156-208.nycmny.fios.verizon.net ([96.246.156.208]
 helo=X1.myfiosgateway.com) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r1TrU-001hA7-V0; Fri, 10 Nov 2023 16:56:01 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: Document device reset methods
Date: Fri, 10 Nov 2023 10:55:48 -0500
Message-ID: <20231110155548.20599-1-andrealmeid@igalia.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a79d53bdbe13..500f86c79eb7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -504,6 +504,26 @@ struct amdgpu_allowed_register_entry {
 	bool grbm_indexed;
 };
 
+/**
+ * enum amd_reset_method - Methods for resetting AMD GPU devices
+ *
+ * @AMD_RESET_METHOD_NONE: The device will not be reset.
+ * @AMD_RESET_LEGACY: Method reserved for SI/CIK asics.
+ * @AMD_RESET_MODE0: High level PCIe reset.
+ * @AMD_RESET_MODE1: Resets each IP block (SDMA, GFX, VCN, etc.) individually.
+ *                   Suitable only for some discrete GPUs.
+ * @AMD_RESET_MODE2: Resets only the GFX block. Useful for APUs, giving that
+ *                   the rest of IP blocks and SMU is shared with the CPU.
+ * @AMD_RESET_BACO: BACO (Bus Alive, Chip Off) method powers off and on the card
+ *                  but without powering off the PCI bus. Suitable only for
+ *                  discrete GPUs.
+ * @AMD_RESET_PCI: Does a full bus reset, including powering on and off the
+ *                 card.
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

