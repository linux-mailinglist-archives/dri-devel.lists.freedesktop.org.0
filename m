Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955841A544B
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF6E6E226;
	Sat, 11 Apr 2020 23:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A152A6E222;
 Sat, 11 Apr 2020 23:05:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9944F214D8;
 Sat, 11 Apr 2020 23:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646307;
 bh=/8VrXNcNLIf8zNDY6AJSrHlUWb80YHaWdex7BWzbC1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zUsz//6+NMuYIl/jtsXTIvLXO9/z2KbSG8lSGgdQBqZEHJUmAgen3VVisI3lLlyfq
 VGYHt1FdjueJHXNo93n6RQHsg8JENrvqhafV3oU4ovZRe/OSjJjJ71Qcz5YTsma+sh
 wXmN9VABRqLcfLv/KiDJ+0ZWzu+HWwywKJMxv14I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 065/149] drm/amdgpu: Fix missing error check in
 suspend
Date: Sat, 11 Apr 2020 19:02:22 -0400
Message-Id: <20200411230347.22371-65-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230347.22371-1-sashal@kernel.org>
References: <20200411230347.22371-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <felix.kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Oak Zeng <oak.zeng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

[ Upstream commit 70bedd68e7b3a7f1d7f3198bb698fc23bc5aaa68 ]

amdgpu_device_suspend might return an error code since it can be called
from both runtime and system suspend flows. Add the missing return code
in case of a failure.

Reviewed-by: Oak Zeng <oak.zeng@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 42f4febe24c6d..921e2944255b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1225,6 +1225,9 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 	drm_kms_helper_poll_disable(drm_dev);
 
 	ret = amdgpu_device_suspend(drm_dev, false);
+	if (ret)
+		return ret;
+
 	if (amdgpu_device_supports_boco(drm_dev)) {
 		/* Only need to handle PCI state in the driver for ATPX
 		 * PCI core handles it for _PR3.
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
