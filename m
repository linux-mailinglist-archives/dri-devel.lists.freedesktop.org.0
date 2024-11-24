Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA42E9D70D3
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4148C10E4FA;
	Sun, 24 Nov 2024 13:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fKLKc0m9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC67D10E4FA;
 Sun, 24 Nov 2024 13:41:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C25B4A40B6F;
 Sun, 24 Nov 2024 13:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E074C4CED1;
 Sun, 24 Nov 2024 13:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455668;
 bh=i5n8i85CiaDqJq0okw0QSIMrqOa9fli68JfJ6AVn8xY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fKLKc0m9bmE4TXRTQ42z5JdybUzVnXCUvfCw+pi30IY8Usky4O5U3ioAfGhLxN1dt
 z6bUvctYMwW1OKd4WVl9z+PR1J3tRgukYZwrXfvWwZBfkwsXZS1fmhwc5QYDb/Og5/
 pD33ZlAq6vGiaYbnjgASwx+insjX34nRcYIiaN0OBZBFBJMvnVeuyjb0W84wtOw6ak
 mIsfzx2RJ7rxWPWJvOSY7onb+u0BDPh/it6MKWXgrC6de431Y8xfiZA46wsv/O9Oy8
 mVKxuxlPrlRyB3M5jHBMozMvKfy/rXBY0YWLGZCSt/QxQ97Jlgu52uekdpqsLGZf8x
 asBxingfTITrw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 02/87] drm/xe/pciids: separate ARL and MTL PCI IDs
Date: Sun, 24 Nov 2024 08:37:40 -0500
Message-ID: <20241124134102.3344326-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124134102.3344326-1-sashal@kernel.org>
References: <20241124134102.3344326-1-sashal@kernel.org>
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

[ Upstream commit cdb56a63f7eef34e89b045fc8bcae8d326bbdb19 ]

Avoid including PCI IDs for one platform to the PCI IDs of another. It's
more clear to deal with them completely separately at the PCI ID macro
level.

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/a30cb0da7694a8eccceba66d676ac59aa0e96176.1725443121.git.jani.nikula@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xe/xe_pci.c   |  1 +
 include/drm/intel/xe_pciids.h | 13 ++++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index dde4a929f5873..0719b74443e71 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -388,6 +388,7 @@ static const struct pci_device_id pciidlist[] = {
 	XE_RPLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
 	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
+	XE_ARL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
 	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
 	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 7ee7524141f10..67dad09e62bc8 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -174,16 +174,19 @@
 	XE_ATS_M150_IDS(MACRO__, ## __VA_ARGS__),\
 	XE_ATS_M75_IDS(MACRO__, ## __VA_ARGS__)
 
-/* MTL / ARL */
+/* ARL */
+#define XE_ARL_IDS(MACRO__, ...)		\
+	MACRO__(0x7D41, ## __VA_ARGS__),	\
+	MACRO__(0x7D51, ## __VA_ARGS__),        \
+	MACRO__(0x7D67, ## __VA_ARGS__),	\
+	MACRO__(0x7DD1, ## __VA_ARGS__)
+
+/* MTL */
 #define XE_MTL_IDS(MACRO__, ...)		\
 	MACRO__(0x7D40, ## __VA_ARGS__),	\
-	MACRO__(0x7D41, ## __VA_ARGS__),	\
 	MACRO__(0x7D45, ## __VA_ARGS__),	\
-	MACRO__(0x7D51, ## __VA_ARGS__),        \
 	MACRO__(0x7D55, ## __VA_ARGS__),	\
 	MACRO__(0x7D60, ## __VA_ARGS__),	\
-	MACRO__(0x7D67, ## __VA_ARGS__),	\
-	MACRO__(0x7DD1, ## __VA_ARGS__),        \
 	MACRO__(0x7DD5, ## __VA_ARGS__)
 
 #define XE_LNL_IDS(MACRO__, ...) \
-- 
2.43.0

