Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9DB25D232
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806056EB1B;
	Fri,  4 Sep 2020 07:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEF96EA7C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 04:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=rw2SpJXmuuSf2V4HQI7ewnL26HiqL3Q6q6BfzMSHMoo=; b=VjdZriedxbMRubWGqXJhVsayF4
 CAqnuOxmGdoAmDy4h0pJ+oMpMO+2K5E8eUlW8miqHwQ6DvsGxdR2KPChmx8Spga/5rS/VMtx1pxXe
 BThZPNUkZm2GlCknYa3BdXRKw8yGg4BalTtpBCkeOjYZaPL8NxugrCq7rNYFLKvcytMHHYo0JSUwS
 FTmCvHTzwC3ddI7HpDli4t1qln9M8dJHCt/yxcF+nrJ8a2EjTimPA/aMklJplPHrmeSqrnEXJtMMj
 x9KZET7zwVvzjJB13mRuZtTi2AVKft6as+qhXnSiPCTFzQo15Y2oOAHnGoVWKqdQgA1cAbmnWEKa7
 94eLmA8Q==;
Received: from [2601:1c0:6280:3f0::351]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE3XE-0001PW-GT; Fri, 04 Sep 2020 04:41:12 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hyun Kwon
 <hyun.kwon@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm: xlnx: fix build warning & errors when DMADEVICES is not
 set
Message-ID: <1f7bdabb-e28b-2cc1-5fbd-92c381299ba9@infradead.org>
Date: Thu, 3 Sep 2020 21:41:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:34 +0000
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix kconfig warnings & build errors caused by DRM_ZYNQMP_DPSUB.

Any driver that selects DMA_ENGINE should make sure that
DMADEVICES is already enabled.
As is, this causes build errors in many other drivers.

See https://lore.kernel.org/lkml/202009020239.oUPh82Xc%25lkp@intel.com/
for the numerous build errors.

WARNING: unmet direct dependencies detected for DMA_ENGINE
  Depends on [n]: DMADEVICES [=n]
  Selected by [y]:
  - DRM_ZYNQMP_DPSUB [=y] && HAS_IOMEM [=y] && (ARCH_ZYNQMP || COMPILE_TEST [=y]) && COMMON_CLK [=y] && DRM [=y] && OF [=y]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/xlnx/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20200903.orig/drivers/gpu/drm/xlnx/Kconfig
+++ linux-next-20200903/drivers/gpu/drm/xlnx/Kconfig
@@ -2,6 +2,7 @@ config DRM_ZYNQMP_DPSUB
 	tristate "ZynqMP DisplayPort Controller Driver"
 	depends on ARCH_ZYNQMP || COMPILE_TEST
 	depends on COMMON_CLK && DRM && OF
+	depends on DMADEVICES
 	select DMA_ENGINE
 	select DRM_GEM_CMA_HELPER
 	select DRM_KMS_CMA_HELPER

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
