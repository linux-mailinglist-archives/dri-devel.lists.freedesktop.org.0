Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E72778DDC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 13:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56AC10E0A5;
	Fri, 11 Aug 2023 11:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0E710E0A5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691753865; x=1723289865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UlowVvu3E5elLPnj6UtdARW1f7puMiDhsw3+v5Y7s2k=;
 b=Bdf6xzIHNF50Q43ROfG7jFMVrJuT+AGnCx3/SGJAGDSPLuO35gnqosNT
 QBWECIcfSvVmjINcQGJ0IxR2lVF3rcUu19bxO9adKcE3FHndnMZbUnbne
 vwn+3oTOJFOkmqnB3S5gTo/UN3bibBXCfd64KRaGXnWq2Gh9REnOTorkm
 fTPjff3FM4hwbiEBGuFGTsgukboRCqGA140WPg9JoKNKFFSICmQSc1hw9
 YtgHVt3LVGbSQ0ZL2m6aUYKCDHrP57ZKVwTTcvRlsCKrjI/yjAJ32ClYH
 KoqIEqVdcQLGN8yu3mnvFdQ8pdvhxM+uNFd+nblVHBckRBCp0btEzu9pV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="370553871"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="370553871"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 04:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="767646210"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="767646210"
Received: from ppuzio-mobl1.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.31.54])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 04:37:41 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH drm-misc-next] drm/ttm/tests: Require MMU when testing
Date: Fri, 11 Aug 2023 13:36:49 +0200
Message-Id: <20230811113649.697886-1-karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Satisfy MMU dependency when testing TTM with KUnit. This fixes
compilation errors on platforms that don't select this option
by default.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308110133.f0lhFwMV-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202308111032.enU8IisR-lkp@intel.com/
---
 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 9d1f0e04fd56..ab9ef1c20349 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -198,7 +198,7 @@ config DRM_TTM
 config DRM_TTM_KUNIT_TEST
         tristate "KUnit tests for TTM" if !KUNIT_ALL_TESTS
         default n
-        depends on DRM && KUNIT
+        depends on DRM && KUNIT && MMU
         select DRM_TTM
         select DRM_EXPORT_FOR_TESTS if m
         select DRM_KUNIT_TEST_HELPERS
-- 
2.25.1

