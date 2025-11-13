Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99435C59554
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 19:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D479E10E920;
	Thu, 13 Nov 2025 18:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X51RPD2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFE410E91B;
 Thu, 13 Nov 2025 18:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056987; x=1794592987;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zzHUHDFiSrAkWDG3zV+mEV8zw5HhIV42xiqeOVVULv8=;
 b=X51RPD2TKEPUFHDLYEIoJ/nPESYfuN25ko4fupWe7Pxs+l2nIFdWOYSz
 jZRs7SsfMqqw2tVht3pPuqmGIl/WOD/GjF1JqZJ7xTDVNli54hm1UIent
 unLbDgcRs6BLZN3FK1EydhOiqVC6P2mg5dy5ELodCKJYLKREUC8/qZszJ
 QfydIzFPjsfXfm2EwgpnTmXriLjoeP3iUYAlLq7oplvQS4UA/M4ksBaP4
 gMamCw/iD4biF9HYtyCjhUJ1cBh1YtXBvbVTu66+b9BRxa1eK+E0Dkz+N
 QlQ3DXo4cRLdUpLhZtYXCscj8OCHNStDJsuH6U+k/Lb/bEa6DT8PB7rPh A==;
X-CSE-ConnectionGUID: JBMAfmj3T3mj3WUtdWlCnQ==
X-CSE-MsgGUID: cuE64Lg2SQC3KCseLulKxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76490903"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="76490903"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:03:07 -0800
X-CSE-ConnectionGUID: jfhU2e5sR4OutZlp++bzsg==
X-CSE-MsgGUID: OQItNN3zSxaXHybVHw/VwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189407998"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:02:59 -0800
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
 "Michael J . Ruhl" <mjruhl@habana.ai>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 09/11] drm/xe/vram: Use pci_rebar_get_max_size()
Date: Thu, 13 Nov 2025 20:00:51 +0200
Message-Id: <20251113180053.27944-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251113180053.27944-1-ilpo.jarvinen@linux.intel.com>
References: <20251113180053.27944-1-ilpo.jarvinen@linux.intel.com>
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

Use pci_rebar_get_max_size() from PCI core in resize_vram_bar() to simplify
code.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 57c224fa0b56..524469f8a4bd 100644
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

