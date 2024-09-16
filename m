Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF69397A36B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2801610E387;
	Mon, 16 Sep 2024 13:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RdqPE0Tb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F06410E380;
 Mon, 16 Sep 2024 13:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726495138; x=1758031138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XwjfPtNKP3xj4mYiGTP+Pjdqb0DSUXkzIDtfWZSx5QA=;
 b=RdqPE0TbqNBmgTctIMcwV5oJn5jUZV+YCAkl2kCJdOGU+8OWepmwaEfA
 oF+V8Jsg/odnyn4kB3T0XZgiJFBWuius+I94MJkTc3SMrwHoUkVz9P4FG
 gCmYWxCuN37q2L+93AyiIf5k8vQ5DVWRjg7VE8QBTH6P/6kqxr24Kd4K4
 fHy1m2Io2ThknznLCE3YJy2kUS9g5l5ZJgKz4pizhq91j3m6P0PbzmKcK
 odlVE/RTTiIrcyU2YwaJV1+5gJ3ZXJQvX0lBhRztGKatHuICefNhVg0S2
 fpdnYcVHEK0g0OmdisTKSlnqtNAHrHuggmIPmjSWUd9BjaWAvn85AKpf0 g==;
X-CSE-ConnectionGUID: 7Xxm+M3aQW27jGAZG2tAuA==
X-CSE-MsgGUID: VTuff+seTIOhWOEA3lpJ/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36666901"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="36666901"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:58:12 -0700
X-CSE-ConnectionGUID: 2veiaqVQRSezaq52EQaNLQ==
X-CSE-MsgGUID: wmGrMlcLSc6g4I8AYGZDbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68837453"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 06:58:08 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Mark Brown <broonie@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 09/12] drm/i915/spi: add intel_spi_region map
Date: Mon, 16 Sep 2024 16:49:25 +0300
Message-Id: <20240916134928.3654054-10-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916134928.3654054-1-alexander.usyskin@intel.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
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

From: Tomas Winkler <tomas.winkler@intel.com>

Add the dGFX spi region map and convey it via auxiliary device
to the spi child device.

CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/gpu/drm/i915/spi/intel_spi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
index 4b90e42b0f86..200139531d26 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi.c
@@ -11,6 +11,13 @@
 
 #define GEN12_GUNIT_SPI_SIZE 0x80
 
+static const struct intel_dg_spi_region regions[INTEL_DG_SPI_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
 static void i915_spi_release_dev(struct device *dev)
 {
 }
@@ -31,6 +38,7 @@ void intel_spi_init(struct drm_i915_private *dev_priv)
 	spi->bar.end = spi->bar.start + GEN12_GUNIT_SPI_SIZE - 1;
 	spi->bar.flags = IORESOURCE_MEM;
 	spi->bar.desc = IORES_DESC_NONE;
+	spi->regions = regions;
 
 	aux_dev->name = "spi";
 	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
-- 
2.34.1

