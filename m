Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9EB42436C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 18:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7706EDBE;
	Wed,  6 Oct 2021 16:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BE36EDBE;
 Wed,  6 Oct 2021 16:54:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="312251829"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="312251829"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:51:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="458489123"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga002.jf.intel.com with ESMTP; 06 Oct 2021 09:51:16 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	dri-devel@lists.freedesktop.org, Ruhl@freedesktop.org,
	Michael J <michael.j.ruhl@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 1/1] tests/i915_pxp: Use ioctl_wrapper for
 DRM_IOCTL_PRIME_HANDLE_TO_FD
Date: Wed,  6 Oct 2021 09:51:51 -0700
Message-Id: <20211006165151.247868-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.25.1
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

Replace private helper with call to ioctl_wrapper for
DRM_IOCTL_PRIME_HANDLE_TO_FD.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index 79040165..0430f4b8 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -622,23 +622,6 @@ static void test_render_pxp_protsrc_to_protdest(int i915)
 	buf_ops_destroy(bops);
 }
 
-static int export_handle(int fd, uint32_t handle, int *outfd)
-{
-	struct drm_prime_handle args;
-	int ret;
-
-	args.handle = handle;
-	args.flags = DRM_CLOEXEC;
-	args.fd = -1;
-
-	ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
-	if (ret)
-		ret = errno;
-	*outfd = args.fd;
-
-	return ret;
-}
-
 static void test_pxp_dmabuffshare_refcnt(void)
 {
 	uint32_t ctx[2], sbo[2], dbo[2];
@@ -659,8 +642,7 @@ static void test_pxp_dmabuffshare_refcnt(void)
 			dbo[0] = alloc_and_fill_dest_buff(fd[0], true, TSTSURF_SIZE,
 							  TSTSURF_INITCOLOR1);
 		} else {
-			ret = export_handle(fd[0], dbo[0], &dmabuf_fd);
-			igt_assert(ret == 0);
+			dmabuf_fd = prime_handle_to_fd(fd[0], dbo[0]);
 			dbo[1] = prime_fd_to_handle(fd[1], dmabuf_fd);
 			igt_assert(dbo[1]);
 		}
-- 
2.25.1

