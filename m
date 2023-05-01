Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6FD6F31FB
	for <lists+dri-devel@lfdr.de>; Mon,  1 May 2023 16:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A38210E2D7;
	Mon,  1 May 2023 14:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D80210E1D9;
 Mon,  1 May 2023 14:32:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0095960E9A;
 Mon,  1 May 2023 14:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52335C433EF;
 Mon,  1 May 2023 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682951543;
 bh=rszZaRt349rSKpXDtTUZKWMXkHmt5IGp9/2/HR6rRyo=;
 h=From:To:Cc:Subject:Date:From;
 b=p+8PyNo7PFE8jPejPTz6PdMaOMifB56eMcoqYWkzRafBVBPIq6ueWOSOcti27tEan
 0+X4BCVjwv6ajyGGhXqgMJqi+LfhrrGDt372wsBk9Gq/0OiRhkUuTnLxgIcnPiwT+m
 +9REaBkA3YYdFd3pdOITw7qyNiqjYvVZkADZ/hANf+5NMFceiZWekLkDhpw/RL7z+E
 tM3FYFzyZBtDjKnrOdPeNqgXn5kIKdG2gKdWQvlYra1Ckm5C3fF08HWo09UVh356i7
 LbUEgvFT+/1/eY9sU/bI+tc0i51tpj05fwGdRlosrNK1koDNcV8rERdJJ8bIhAsjzh
 9bW0neZkTfifA==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amd/display: mark amdgpu_dm_connector_funcs_force static
Date: Mon,  1 May 2023 16:31:53 +0200
Message-Id: <20230501143213.1571373-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Stylon Wang <stylon.wang@amd.com>, kernel test robot <lkp@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Alex Hung <alex.hung@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wenchieh Chien <wenchieh.chien@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

A global function without a header prototype has made it into
linux-next during the merge window:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6339:6: error: no previous prototype for 'amdgpu_dm_connector_funcs_force' [-Werror=missing-prototypes]

Mark the function static instead, as there are no other
callers outside this file.

Fixes: 0ba4a784a145 ("drm/amd/display: implement force function in amdgpu_dm_connector_funcs")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304251640.JClqTim9-lkp@intel.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This was previously reported by a bot for the drm-next tree but remains
broken in linux-next-20230428. Sending it out as I needed this fix
for my local builds.
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3647d21d688f..2bbb2988942d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6336,7 +6336,7 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 	return 0;
 }
 
-void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
+static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	struct dc_link *dc_link = aconnector->dc_link;
-- 
2.39.2

