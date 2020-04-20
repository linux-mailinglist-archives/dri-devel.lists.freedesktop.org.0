Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D63AD1B0DF6
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 16:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5E388C5A;
	Mon, 20 Apr 2020 14:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB59288C5A;
 Mon, 20 Apr 2020 14:08:49 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1jQX6N-0006NI-2h; Mon, 20 Apr 2020 14:08:47 +0000
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/amdgpu: fix a dereference on pointer hive before it
 is null checked
Date: Mon, 20 Apr 2020 15:08:46 +0100
Message-Id: <20200420140846.78062-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Currently pointer hive is being dereferenced before it is being null
checked and hence can lead to null pointer dereference issues. Fix this
by only dereferencing pointer hive after it has been null checked.

Addresses-Coverity: ("Dereference before null check")
Fixes: 25d4275e1931 ("drm/amdgpu: fix race between pstate and remote buffer map")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 54d8a3e7e75c..2c0a59ba2826 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -389,15 +389,17 @@ int amdgpu_xgmi_set_pstate(struct amdgpu_device *adev, int pstate)
 {
 	int ret = 0;
 	struct amdgpu_hive_info *hive = amdgpu_get_xgmi_hive(adev, 0);
-	struct amdgpu_device *request_adev = hive->hi_req_gpu ?
-						hive->hi_req_gpu : adev;
+	struct amdgpu_device *request_adev;
 	bool is_hi_req = pstate == AMDGPU_XGMI_PSTATE_MAX_VEGA20;
-	bool init_low = hive->pstate == AMDGPU_XGMI_PSTATE_UNKNOWN;
+	bool init_low;
 
 	/* fw bug so temporarily disable pstate switching */
 	if (!hive || adev->asic_type == CHIP_VEGA20)
 		return 0;
 
+	request_adev = hive->hi_req_gpu ? hive->hi_req_gpu : adev;
+	init_low = hive->pstate == AMDGPU_XGMI_PSTATE_UNKNOWN;
+
 	mutex_lock(&hive->hive_lock);
 
 	if (is_hi_req)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
