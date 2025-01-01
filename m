Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA90F9FF45F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2025 16:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2600510E265;
	Wed,  1 Jan 2025 15:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1BmHh6a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B46110E22E;
 Wed,  1 Jan 2025 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735746667; x=1767282667;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DKlyLIWjqnpf+nAq/U+TMEeD4zkaljAwYs6Mr4SgMPo=;
 b=P1BmHh6aR+Prk7zz5qZqfJZf4yIiIy3g51LVW+3VebJZic7Imys8h+fj
 Eq3j7iDwxU2ILEytjWoRYprRBtdEMLHVDgPmrrFstjWhkFYK/QFspqQN3
 WwNsXF1RppPAviRCLy8DFP6uDq0QpeeTgkx5nY2V7wwuO3MeGdn8n1FBt
 3FN1kUjIFnu37eZmUQ6StWoWHuB3vXo8FncCsAx9Tf0krEpbPWXOcY4gw
 lLne/w8vaTHEB2/N/ikoeVZRgNixyXE/JWpjP9PBDnGvZ0bTbLoFhpXcU
 m822lBMqmBwsvUj3XtzpY+rLjoVZIKrXVVBf/W0snxKUV44oonkVfA/sT Q==;
X-CSE-ConnectionGUID: 5+RnQFgHTKya3f5RNBtXNw==
X-CSE-MsgGUID: 0ivvVTVNQ8u71TdAkDLj7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46485621"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; d="scan'208";a="46485621"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 07:51:07 -0800
X-CSE-ConnectionGUID: sM9h1oo2Tp6wmsoyZgg4MQ==
X-CSE-MsgGUID: 6zi7dCEZRyKlRIDgAcgkZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; d="scan'208";a="132138980"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jan 2025 07:51:02 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
 Oren Weil <oren.jer.weil@intel.com>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v4 06/11] mtd: intel-dg: align 64bit read and write
Date: Wed,  1 Jan 2025 17:39:20 +0200
Message-ID: <20250101153925.865703-7-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250101153925.865703-1-alexander.usyskin@intel.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
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

GSC NVM controller HW errors on quad access overlapping 1K border.
Align 64bit read and write to avoid readq/writeq over 1K border.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd-intel-dg.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
index 76ef7198fff8..230bf444b7fe 100644
--- a/drivers/mtd/devices/mtd-intel-dg.c
+++ b/drivers/mtd/devices/mtd-intel-dg.c
@@ -238,6 +238,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
 		len_s -= to_shift;
 	}
 
+	if (!IS_ALIGNED(to, sizeof(u64)) &&
+	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {
+		/*
+		 * Workaround reads/writes across 1k-aligned addresses
+		 * (start u32 before 1k, end u32 after)
+		 * as this fails on hardware.
+		 */
+		u32 data;
+
+		memcpy(&data, &buf[0], sizeof(u32));
+		idg_nvm_write32(nvm, to, data);
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		buf += sizeof(u32);
+		to += sizeof(u32);
+		len_s -= sizeof(u32);
+	}
+
 	len8 = ALIGN_DOWN(len_s, sizeof(u64));
 	for (i = 0; i < len8; i += sizeof(u64)) {
 		u64 data;
@@ -295,6 +313,23 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
 		from += from_shift;
 	}
 
+	if (!IS_ALIGNED(from, sizeof(u64)) &&
+	    ((from ^ (from + len_s)) & GENMASK(31, 10))) {
+		/*
+		 * Workaround reads/writes across 1k-aligned addresses
+		 * (start u32 before 1k, end u32 after)
+		 * as this fails on hardware.
+		 */
+		u32 data = idg_nvm_read32(nvm, from);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		memcpy(&buf[0], &data, sizeof(data));
+		len_s -= sizeof(u32);
+		buf += sizeof(u32);
+		from += sizeof(u32);
+	}
+
 	len8 = ALIGN_DOWN(len_s, sizeof(u64));
 	for (i = 0; i < len8; i += sizeof(u64)) {
 		u64 data = idg_nvm_read64(nvm, from + i);
-- 
2.43.0

