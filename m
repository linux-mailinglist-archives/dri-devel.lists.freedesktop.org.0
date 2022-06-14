Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7292E54B52D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 17:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797E510E16E;
	Tue, 14 Jun 2022 15:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B71610E16E;
 Tue, 14 Jun 2022 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=4oU1oWX+jsx2yVECU+J4GzVeqRTUpkYpEcI7jpWRWSM=; b=CAmCZeyvgMGohCYzJwQaBxGpJd
 1mwP0O6OvQMDswAeSdBetEw2wv0TWulwLfmXx2GeKTQHpka4Xf2lynQ8X4DTb9tKpk2Rq2EIo+v2e
 ZCBDp/Ueqn81IltWc2k3mokZCZTnqq9uqCH6qkeRJTVdu0b6n2bY8HON7ojtwEJNwjGhmfxJdZGsc
 Q8Q9A7kWcjEZRNI48iINeE1aETeexeOgRNyiFLyq8nUf5r71khTVkR+YHt2lEdDPrIlFVcmrOx/F5
 g8OQBRBTmMmamhOjuYzSFuX0je+E2NT4bELtXrhg4vKVdCzVX6gWuB3wdvQIDwTKqLKymHW+miu+b
 +zkPudbg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=casper.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o18v6-000IW5-Do; Tue, 14 Jun 2022 15:57:32 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: add stub for crtc_debugfs_init()
Date: Tue, 14 Jun 2022 08:57:26 -0700
Message-Id: <20220614155726.26211-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.35.3
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
Cc: Randy Dunlap <rdunlap@infradead.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 patches@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix build error when CONFIG_DEBUG_FS is not enabled by adding a
stub function for crtc_debugfs_init().

Eliminates this build error:

../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function ‘amdgpu_dm_crtc_late_register’:
../drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6599:2: error: implicit declaration of function ‘crtc_debugfs_init’; did you mean ‘amdgpu_debugfs_init’? [-Werror=implicit-function-declaration]
  crtc_debugfs_init(crtc);
  ^~~~~~~~~~~~~~~~~
  amdgpu_debugfs_init

Fixes: 86bc22191892 ("drm/amd/display: Support crc on specific region")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c         |    2 --
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h |    6 ++++++
 2 files changed, 6 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -57,9 +57,7 @@
 #include "amdgpu_dm_irq.h"
 #include "dm_helpers.h"
 #include "amdgpu_dm_mst_types.h"
-#if defined(CONFIG_DEBUG_FS)
 #include "amdgpu_dm_debugfs.h"
-#endif
 #include "amdgpu_dm_psr.h"
 
 #include "ivsrcid/ivsrcid_vislands30.h"
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.h
@@ -31,6 +31,12 @@
 
 void connector_debugfs_init(struct amdgpu_dm_connector *connector);
 void dtn_debugfs_init(struct amdgpu_device *adev);
+
+#ifdef CONFIG_DEBUG_FS
 void crtc_debugfs_init(struct drm_crtc *crtc);
+#else
+static inline void crtc_debugfs_init(struct drm_crtc *crtc)
+{}
+#endif
 
 #endif
