Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF80386D198
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 19:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5C610E410;
	Thu, 29 Feb 2024 18:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l2yCqsHZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D05910E3F8;
 Thu, 29 Feb 2024 18:11:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 394C161333;
 Thu, 29 Feb 2024 18:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA85BC433A6;
 Thu, 29 Feb 2024 18:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709230270;
 bh=a5/6+2LTn+N0eUr8eiV1Ty/edBikw63mMsI6aVDC6Ss=;
 h=From:To:Cc:Subject:Date:From;
 b=l2yCqsHZ6H7hX115YD1FwHAzweYh5q7rp1bnWXvWvqrMjEQtBO2S0OD5YHzjg5IKz
 vlixsoeEX2ykU/3WRJwPYUvU+1fpah+SIV71lDnHmKF8PrsdwRQGAf8ohE8ofyHJI5
 FOE8hk15AEsB6Ro8NiO7Yc0eAvDJuxkY1jVw5//stvK+juNOWsKfJ1n5LuUoH7uHqD
 sf8a1P/b7FW4B1JEtGpT0DlsTU4TWbqplGvLDnKRGN27VEiUnmno+SgUS5/BQb6Alc
 M1A7GbDAcMkaBC2U82NaxG21HYa06KamZAS0PHt6qDrRcEp0zKHrQSOPrwEhccmOAs
 WKMpWj5S6D8gA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] drm/amdgpu: remove misleading amdgpu_pmops_runtime_idle()
 comment
Date: Thu, 29 Feb 2024 12:11:06 -0600
Message-Id: <20240229181106.351877-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
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

From: Bjorn Helgaas <bhelgaas@google.com>

After 4020c2280233 ("drm/amdgpu: don't runtime suspend if there are
displays attached (v3)"), "ret" is unconditionally set later before being
used, so there's point in initializing it and the associated comment is no
longer meaningful.

Remove the comment and the unnecessary initialization.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index cc69005f5b46..68416e2a9130 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2744,8 +2744,7 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(drm_dev);
-	/* we don't want the main rpm_idle to call suspend - we want to autosuspend */
-	int ret = 1;
+	int ret;
 
 	if (adev->pm.rpm_mode == AMDGPU_RUNPM_NONE) {
 		pm_runtime_forbid(dev);
-- 
2.34.1

