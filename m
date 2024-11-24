Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F709D70D0
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C827C10E4F7;
	Sun, 24 Nov 2024 13:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VHxT2Skk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261A910E4F5;
 Sun, 24 Nov 2024 13:41:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B304A5C4A5F;
 Sun, 24 Nov 2024 13:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA686C4CECC;
 Sun, 24 Nov 2024 13:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455666;
 bh=cIKtMrcV2rEjOhLuX0Jd/uzPUs7Pfub37mdd5xM0grI=;
 h=From:To:Cc:Subject:Date:From;
 b=VHxT2SkkbthM1ziVgJI4oUF9IkjsELTTJQmC92Rx7R3d9pe8nrq5/eJKH/FC01xDn
 3FAnYLjL4IyK6p+As5rF5f2+dHTQv3bIOZQ5jLQZjFbhYkt5rKbE1YHxFxOM3BrBXv
 sXQybXMAmxbBJfyIsHSAv+lOqpOPyGhzMZZcuByLxLxOKc7BspEJLsNw2ofLl4IIbG
 dicL8MsWfuVlTe0xU92dzhtSMrsh8RaMLMYYh+Mb5OZRykmMmLS+vY5jW4FOWuU05P
 cozW1SzPdZVDSBmby3lLaJ1luhROcHKDW5V2t1EEdEDWPYjd8DMdoUb27C/8vOGfcp
 zwicVApleP+Ng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 01/87] drm/xe/pciids: separate RPL-U and RPL-P
 PCI IDs
Date: Sun, 24 Nov 2024 08:37:39 -0500
Message-ID: <20241124134102.3344326-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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

From: Jani Nikula <jani.nikula@intel.com>

[ Upstream commit d454902a690db47f1880f963514bbf0fc7a129a8 ]

Avoid including PCI IDs for one platform to the PCI IDs of another. It's
more clear to deal with them completely separately at the PCI ID macro
level.

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/4868d36fbfa8c38ea2d490bca82cf6370b8d65dd.1725443121.git.jani.nikula@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_pci.c   | 1 +
 include/drm/intel/xe_pciids.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5929ac61dbe0a..dde4a929f5873 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -383,6 +383,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_ADLN_IDS(INTEL_VGA_DEVICE, &adl_n_desc),
+	XE_RPLU_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_RPLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
 	XE_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 644872a35c352..7ee7524141f10 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -120,7 +120,6 @@
 
 /* RPL-P */
 #define XE_RPLP_IDS(MACRO__, ...)		\
-	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__),	\
 	MACRO__(0xA720, ## __VA_ARGS__),	\
 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
 	MACRO__(0xA7A8, ## __VA_ARGS__),	\
-- 
2.43.0

