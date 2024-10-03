Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87498EDF3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D30110E808;
	Thu,  3 Oct 2024 11:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I23fG1AQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A153F10E809
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727954357; x=1759490357;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ht6BOdo/uExQPz87ZD97otAb+P2YHbbKEyj+c2e+QSE=;
 b=I23fG1AQcIbuswnGwcRQ8EXoLlXLscrlZ3VGJv1epSyd8X8sgCwXmtt4
 7AM+oQ3KAx/NMCrkT3XSweiC7QfiiVZllWxDDkBmS6mJMSphGrzrZMmkI
 GktHHQr7Q1YBONId1/AOzcGiIGEa5jx6UofuUMGT9Dw+sLR7KgUMwwJ6v
 IyW1EfzB/k0sajh/ScbTLVQaDwFsbORlYMfZmMFDS4zbchilNWfcw0Ka4
 eRW9oeIkXm2BL9oioumgj530z6s9yb79PPZ3DW0Ysl3J7sS8psB+s+uLL
 XnsDVpGb34T89ZkpPoxod0uDlIoNDxjqovu6Ya/Shj2HuxmHxnhWXQyqS g==;
X-CSE-ConnectionGUID: 5bufaP17R+CuR7PJKesOwQ==
X-CSE-MsgGUID: cupcGRmfQ0aKaECeXrnJdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012987"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27012987"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:19:17 -0700
X-CSE-ConnectionGUID: 5TI6i9/JRaqAfvW1KHPUEw==
X-CSE-MsgGUID: GvcE8CGcSYiUC5QAfH6g/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74423787"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:19:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:19:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 07/10] drm/imx/dcss: Allow build with COMPILE_TEST=y
Date: Thu,  3 Oct 2024 14:18:48 +0300
Message-ID: <20241003111851.10453-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Allow imx/dcss to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/imx/dcss/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 9d58f41bd00c..e014ed3ae66c 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -7,7 +7,7 @@ config DRM_IMX_DCSS
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_GEM_DMA_HELPER
 	select VIDEOMODE_HELPERS
-	depends on DRM && ARCH_MXC && ARM64
+	depends on DRM && ((ARCH_MXC && ARM64) || COMPILE_TEST)
 	help
 	  Choose this if you have a NXP i.MX8MQ based system and want to use the
 	  Display Controller Subsystem. This option enables DCSS support.
-- 
2.45.2

