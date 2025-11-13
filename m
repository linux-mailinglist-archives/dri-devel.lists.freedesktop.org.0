Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4AC59560
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 19:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D0610E917;
	Thu, 13 Nov 2025 18:03:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n3C5BY2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4E710E916;
 Thu, 13 Nov 2025 18:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763057000; x=1794593000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e5pHv3WKNR67jU/OKNlgxz1wxiWJXKsANnUH51oNoN4=;
 b=n3C5BY2B9Nt0XJT2oOlh3vZfBJIxx4RVhvfZq182eHFXcsvPzj5L32Zl
 QOYJzLAlD+BHaP+9/rLioss6nRENkdDazsRliRXfHcUuKj56xKSuIrWZz
 pZnjiY0C80+ucmgjAGcwErVv4c57G21W86uyoIm5ibCho4M+zS+SYHRrR
 E8CY7zrd/woHLLphHxuczvFd10Bc07FK1iLQ11a70WFwUUzjt1J6Pgg5G
 3M/oMd/77+sE1FXWdmYQAxdM7AHcx/Uqbr8M7r+pAgn5FC36LxhARUh3m
 x6esLUI7GhitnI2rwdJruNue13W4nu6705xt45mFrp2NLShQaY3COP446 w==;
X-CSE-ConnectionGUID: iRU0/E4bReS2Qf5GgjcYew==
X-CSE-MsgGUID: m++JWxkfQHyq1NBZ4IN+Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65186393"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65186393"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:03:19 -0800
X-CSE-ConnectionGUID: vw5syRMES/e5N/FePsjwlQ==
X-CSE-MsgGUID: GX9mxbz3QqCr9ylcbbcFmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="194001333"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:03:13 -0800
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
 Andi Shyti <andi.shyti@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v4 10/11] drm/amdgpu: Use pci_rebar_get_max_size()
Date: Thu, 13 Nov 2025 20:00:52 +0200
Message-Id: <20251113180053.27944-11-ilpo.jarvinen@linux.intel.com>
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

Use pci_rebar_get_max_size() to simplify amdgpu_device_resize_fb_bar().

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f11a255786d7..da2b6158b65f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1673,9 +1673,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 	int rbar_size = pci_rebar_bytes_to_size(adev->gmc.real_vram_size);
 	struct pci_bus *root;
 	struct resource *res;
+	int max_size, r;
 	unsigned int i;
 	u16 cmd;
-	int r;
 
 	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
 		return 0;
@@ -1721,8 +1721,10 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
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

