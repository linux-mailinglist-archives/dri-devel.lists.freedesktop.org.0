Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D4F968BB5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 18:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93F58972C;
	Mon,  2 Sep 2024 16:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWUEX/wk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6A08972C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725293615; x=1756829615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y9nzKmp6uHS9PIhToRGVYR3zjbZM7i37a84XGDDhGVE=;
 b=JWUEX/wkY3knmyStL/WGE1tqPz3IBTk+HyxxpxJ6z4W17h7MddQj1daY
 DH01k3YxaF8JzApJGvj2nBte6XcaHBkJTWsbbnAj6VKi+2jBuosKLXUzp
 kZvvGQX4B8CjHzkMXfm3hqhxk3lyc9pCm+nKMAhFAGGEvvqWdVyjO2rGZ
 dwd2gAiFtBIwUGhoOEufHwsrB/IgMSwHmEEBQ1la8rK3sHQa7SQlVNPcB
 QMVnf+mY7n2n9Y6IpGhtXUIAXE2jpUJlqd2Lzdk2m/BTOegPHZJHV/MTh
 4Ef3TcGk+LIBqBKkYcTc4DK7qxZvdaCfWky0DS1OZ92azWzIMQHsqJUsy Q==;
X-CSE-ConnectionGUID: S+XIQo1RRbujx0D3dLw3jg==
X-CSE-MsgGUID: 1qkJG3+ORW+Nc/84JCwdHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23447392"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23447392"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 09:13:34 -0700
X-CSE-ConnectionGUID: 680zeTzfQE6Dfo57Si2mUw==
X-CSE-MsgGUID: IJXoQuJgQEeKERmpqflBYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="102098066"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.4])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 09:13:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, kernel test robot <dan.carpenter@linaro.org>,
 Thierry Reding <treding@nvidia.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: fix potential uninitialized variable use
Date: Mon,  2 Sep 2024 19:13:17 +0300
Message-Id: <20240902161317.2437148-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

It's likely either output->drm_edid or output->ddc is non-NULL, but
avoid the uninitialized variable usage anyway.

Reported-by: kernel test robot <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/ZtXLyXxew7z6H2bD@stanley.mountain
Fixes: 98365ca74cbf ("drm/tegra: convert to struct drm_edid")
Cc: Thierry Reding <treding@nvidia.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/tegra/output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index e6b5863fec71..49e4f63a5550 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -21,7 +21,7 @@
 int tegra_output_connector_get_modes(struct drm_connector *connector)
 {
 	struct tegra_output *output = connector_to_output(connector);
-	const struct drm_edid *drm_edid;
+	const struct drm_edid *drm_edid = NULL;
 	int err = 0;
 
 	/*
-- 
2.39.2

