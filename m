Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABA6B52AD9
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECAC10EA42;
	Thu, 11 Sep 2025 07:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3p3iFdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E95E10EA41;
 Thu, 11 Sep 2025 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757577498; x=1789113498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oXbmaS48fO9o/2YikXjGdRRz6a3wwA1geRn/x6qZ98k=;
 b=D3p3iFdV/WISyYJgLF24AFkJf/qJZ2uCxKtYtsBRCeG50dXK4jT2QcaU
 otTAawoocknnQAqosLH9O3LqKchMDzemNLckUDIz4rjfhlOO8x6IK0nNi
 95shxPkxJCY565cak5u0Gp2yzsElQdbllKScgQp0KkKkGZAa7Bwqvl6oy
 fAuyUyaYwmC10ERSAQxyZttBuMGa4OPeFHzAOyZzzVaTejSbjawDGsQd5
 zutpbxz+PmqIJkurG4OyOP49sYpP/vhSUUZF++ghV2Ch7HydSOZWKMfgX
 qgQVDfuNWldB5rGl340MIVBQEr3C2VRecwAJxxOBKrC4/hMHXLjhHwefH w==;
X-CSE-ConnectionGUID: eqwFd64cTLyqTAripVMpfQ==
X-CSE-MsgGUID: LFRZT1SWTd2yL+LPjp+5Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63728916"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63728916"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:58:17 -0700
X-CSE-ConnectionGUID: O3u/AQjKQdy10kNOvrGpzQ==
X-CSE-MsgGUID: nDzn6KzfTp+gnd+hYQglJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="174422511"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.187])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:58:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 09/11] drm/xe/vram: Use pci_rebar_get_max_size()
Date: Thu, 11 Sep 2025 10:56:03 +0300
Message-Id: <20250911075605.5277-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
References: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use pci_rebar_get_max_size() from PCI core in resize_vram_bar() to
simplify code.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 08a9abebfee7..b063c072df1e 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -53,16 +53,11 @@ static void resize_vram_bar(struct xe_device *xe)
 	resource_size_t current_size;
 	resource_size_t rebar_size;
 	struct resource *root_res;
-	u32 bar_size_mask;
+	int max_size, i;
 	u32 pci_cmd;
-	int i;
 
 	/* gather some relevant info */
 	current_size = pci_resource_len(pdev, LMEM_BAR);
-	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
-
-	if (!bar_size_mask)
-		return;
 
 	if (force_vram_bar_size < 0)
 		return;
@@ -76,7 +71,8 @@ static void resize_vram_bar(struct xe_device *xe)
 			drm_info(&xe->drm,
 				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
 				 (u64)pci_rebar_size_to_bytes(rebar_size) >> 20,
-				 bar_size_mask, (u64)current_size >> 20);
+				 pci_rebar_get_possible_sizes(pdev, LMEM_BAR),
+				 (u64)current_size >> 20);
 			return;
 		}
 
@@ -84,7 +80,10 @@ static void resize_vram_bar(struct xe_device *xe)
 		if (rebar_size == current_size)
 			return;
 	} else {
-		rebar_size = pci_rebar_size_to_bytes(__fls(bar_size_mask));
+		max_size = pci_rebar_get_max_size(pdev, LMEM_BAR);
+		if (max_size < 0)
+			return;
+		rebar_size = pci_rebar_size_to_bytes(max_size);
 
 		/* only resize if larger than current */
 		if (rebar_size <= current_size)
-- 
2.39.5

