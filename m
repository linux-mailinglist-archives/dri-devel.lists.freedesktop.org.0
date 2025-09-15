Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32937B57467
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 11:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7908B10E3C2;
	Mon, 15 Sep 2025 09:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQcQXQLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE7310E35B;
 Mon, 15 Sep 2025 09:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757927791; x=1789463791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfZr4Pu+txZSdm11dML+ugv1o9AcchyGUheFrRE9JQI=;
 b=HQcQXQLtSmSospyzi9jFez0B5H+a+pD9EwzY6ROUEik15Q9pY+jQ5nH0
 GaTCRICDCFCC+q8aFcyuNWm0Zq8zz4vRiYCNEUZuU2U6uNTTg6e90Oxd+
 GAr+NeePQKKAvXfcHvwXKhx9PGt2J4l2P5J/uC2IWA9ngiFCY7X7ZgEIb
 cBCzaBnIXmErsK32asenwCJbjS4Q5IgsqYSkx3Yb4DaR+u7+3Hc7x+NGH
 p12u9t3AsiZWIs/JKV1fSaTSeUuzaA+hQMUyeiqiLjAQrKz6um+GQOFaq
 NHwlehd0pXXvqSlv8HA6abNpFxOqSbTu1Zr3dhJW5SXpHAAVceljLiVm2 A==;
X-CSE-ConnectionGUID: msJL1znGTLqWghE8CqLmyA==
X-CSE-MsgGUID: +GWMFR3ESzmU24uF7PPFGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="70857590"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="70857590"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:16:30 -0700
X-CSE-ConnectionGUID: ggiUXmqWSJSnYWLjrJfVAw==
X-CSE-MsgGUID: fKhnZoS/RnyxtA+lMtysoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="174392588"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.39])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 02:16:23 -0700
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
 "Michael J . Ruhl" <mjruhl@habana.ai>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 10/11] drm/amdgpu: Use pci_rebar_get_max_size()
Date: Mon, 15 Sep 2025 12:13:57 +0300
Message-Id: <20250915091358.9203-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
References: <20250915091358.9203-1-ilpo.jarvinen@linux.intel.com>
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

Use pci_rebar_get_max_size() from PCI core to simplify code in
amdgpu_device_resize_fb_bar().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 01d234cf8156..c4ab503fb5d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1670,9 +1670,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 	int rbar_size = pci_rebar_bytes_to_size(adev->gmc.real_vram_size);
 	struct pci_bus *root;
 	struct resource *res;
+	int max_size, r;
 	unsigned int i;
 	u16 cmd;
-	int r;
 
 	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
 		return 0;
@@ -1718,8 +1718,10 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 		return 0;
 
 	/* Limit the BAR size to what is available */
-	rbar_size = min(fls(pci_rebar_get_possible_sizes(adev->pdev, 0)) - 1,
-			rbar_size);
+	max_size = pci_rebar_get_max_size(adev->pdev, 0);
+	if (max_size < 0)
+		return 0;
+	rbar_size = min(max_size, rbar_size);
 
 	/* Disable memory decoding while we change the BAR addresses and size */
 	pci_read_config_word(adev->pdev, PCI_COMMAND, &cmd);
-- 
2.39.5

