Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3594359CD48
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 02:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE466A7D5A;
	Tue, 23 Aug 2022 00:43:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14186A7D40
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 00:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=OcnI4ebpnDu4G7YIVsCFew6u/5qBEhwNnUgkxxm55uc=; b=akCEHY61svxxMsDCCHNRmm8aVy
 ryA+6uUW4tYbeC25Y8VCRvhYMIhO5nItSq8O/1ldsTRuRPyTGUqNvx5BXhPYQfUOmvK1Cu7pEtjoJ
 4UssVcm3JY5kdlcoayCZmQCIyMbk8Zp6ALJkpChNQd6jS//sHMrBi/86I2WN3mysq5ze41P9cKxPu
 rwzlPIC8P+aARtrqtbQv7KvNcptSOdHsH1R1zcxKKj+0M13crjr5S739zRASwynttMPHUxZ3aMzrl
 PDZo3QSkXVJ0bBiNFwxpTbs1JR8ViNgl+azGSqwkx8PMTiDXgfE5Xym6hScXdi7lneg/Uy4CpwHQJ
 pFPnX9qw==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oQI0H-00Eo70-Cq; Tue, 23 Aug 2022 00:42:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm: fix drm_mipi_dbi build errors
Date: Mon, 22 Aug 2022 17:42:43 -0700
Message-Id: <20220823004243.11596-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.2
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 Dillon Min <dillon.minfei@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_mipi_dbi needs lots of DRM_KMS_HELPER support, so select
that Kconfig symbol like it is done is most other uses, and
the way that it was before MIPS_DBI was moved from tinydrm
to its core location.

Fixes these build errors:

ld: drivers/gpu/drm/drm_mipi_dbi.o: in function `mipi_dbi_buf_copy':
drivers/gpu/drm/drm_mipi_dbi.c:205: undefined reference to `drm_gem_fb_get_obj'
ld: drivers/gpu/drm/drm_mipi_dbi.c:211: undefined reference to `drm_gem_fb_begin_cpu_access'
ld: drivers/gpu/drm/drm_mipi_dbi.c:215: undefined reference to `drm_gem_fb_vmap'
ld: drivers/gpu/drm/drm_mipi_dbi.c:222: undefined reference to `drm_fb_swab'
ld: drivers/gpu/drm/drm_mipi_dbi.c:224: undefined reference to `drm_fb_memcpy'
ld: drivers/gpu/drm/drm_mipi_dbi.c:227: undefined reference to `drm_fb_xrgb8888_to_rgb565'
ld: drivers/gpu/drm/drm_mipi_dbi.c:235: undefined reference to `drm_gem_fb_vunmap'
ld: drivers/gpu/drm/drm_mipi_dbi.c:237: undefined reference to `drm_gem_fb_end_cpu_access'
ld: drivers/gpu/drm/drm_mipi_dbi.o: in function `mipi_dbi_dev_init_with_formats':
ld: drivers/gpu/drm/drm_mipi_dbi.o:/X64/../drivers/gpu/drm/drm_mipi_dbi.c:469: undefined reference to `drm_gem_fb_create_with_dirty'

Fixes: 174102f4de23 ("drm/tinydrm: Move mipi-dbi")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Dillon Min <dillon.minfei@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -31,6 +31,7 @@ menuconfig DRM
 config DRM_MIPI_DBI
 	tristate
 	depends on DRM
+	select DRM_KMS_HELPER
 
 config DRM_MIPI_DSI
 	bool
