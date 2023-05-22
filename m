Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FBC70BC42
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2368D10E2E0;
	Mon, 22 May 2023 11:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242F210E2DC;
 Mon, 22 May 2023 11:50:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 776276216D;
 Mon, 22 May 2023 11:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E43C433EF;
 Mon, 22 May 2023 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684756254;
 bh=QMY8AN4XNoiYR7KoNx0vHC4ZvMlbDMumIpM77gUBNA0=;
 h=From:To:Cc:Subject:Date:From;
 b=GK3XkFY9WK12/04J9x0b3YSrR6RHJ/L+5wg0ufR6DXuAdpqSWUuSQwjGUdFvumlqZ
 wdBgJcTub7mtefoFo68N8eWvIsAXlc9AoKL+lJspLafBF39m/gtQ0tD7mTf7Nl9oL4
 K0sTVgQiWpJ+yIJl1eZb8P910WSAASR0KCSHHfnUKE51h+LfMZVnJ5ZEeGCNciOBw3
 yIpAIM5CxNENKxj48UNbhB0NZWyAthkw3TiqjeiD2VRDGwYJxO6gED+hPOhFZ0ySJL
 hipm6EPcOyQErvWkGerPhdCt9nabCvWm+2PBg/T/tFxMuB5+/6B22qbtnIVZmTbIEA
 y0DxIbKssYkNA==
From: Arnd Bergmann <arnd@kernel.org>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Asad kamal <asad.kamal@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>
Subject: [PATCH 1/5] drm/amd/pm: mark irq functions as 'static'
Date: Mon, 22 May 2023 13:50:28 +0200
Message-Id: <20230522115047.1169839-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Yang Wang <KevinYang.Wang@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, bobzhou <bob.zhou@amd.com>,
 Le Ma <le.ma@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Two newly added functions cause a warning because they lack a prototype:

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1328:5: error: no previous prototype for 'smu_v13_0_6_set_irq_state' [-Werror=missing-prototypes]
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:1368:5: error: no previous prototype for 'smu_v13_0_6_register_irq_handler' [-Werror=missing-prototypes]

They are only used locally, so just mark them static.

Fixes: 48b5659cf086 ("drm/amd/pm: Add ih for SMU v13.0.6 thermal throttling")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index a712b2bf2d25..41b49cc827cd 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -1325,7 +1325,7 @@ static int smu_v13_0_6_irq_process(struct amdgpu_device *adev,
 	return 0;
 }
 
-int smu_v13_0_6_set_irq_state(struct amdgpu_device *adev,
+static int smu_v13_0_6_set_irq_state(struct amdgpu_device *adev,
 			      struct amdgpu_irq_src *source,
 			      unsigned tyep,
 			      enum amdgpu_interrupt_state state)
@@ -1365,7 +1365,7 @@ static const struct amdgpu_irq_src_funcs smu_v13_0_6_irq_funcs =
 	.process = smu_v13_0_6_irq_process,
 };
 
-int smu_v13_0_6_register_irq_handler(struct smu_context *smu)
+static int smu_v13_0_6_register_irq_handler(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 	struct amdgpu_irq_src *irq_src = &smu->irq_source;
-- 
2.39.2

