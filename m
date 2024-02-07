Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0302284D3C3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 22:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A483110E6FE;
	Wed,  7 Feb 2024 21:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pRUUUAdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1586D10E6F0;
 Wed,  7 Feb 2024 21:24:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 623F5CE1B1F;
 Wed,  7 Feb 2024 21:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117F9C433F1;
 Wed,  7 Feb 2024 21:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707341061;
 bh=YQMdPLT85u6VmS+BxkTgirUdZ3i3i9GOontpVmmubnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pRUUUAdRSHaOKmuS2aC2QEDDxv4j0t2lleXEqfzEf/vwKVsevOPND0QsZJwWwruVm
 5iwKuKwSIwKR5SCRlVjDIs5IUeEOUM3sJ7swbRoe3+TMk5f2+07pdCHGxY69ARu4PQ
 eH/gnij+ydCnu6aIJeRb98EIZArxvaatikixDbF5KxN8Dp+Q6jGJjAFARdTykbXiYy
 y5fVTMlU3dk32LvUrY9DlHSWgrmBNXgG0hn+Cgr8CHKP3Jg0/qM7tAwOaFxgdD32eC
 t3Elcv+FlIAUCdaoFZThYe2hblsTIVhSv1RHewY1MaWgdD271tn30rTxdyDy1CTYwL
 5rgcXdpruq9HA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mukul Joshi <mukul.joshi@amd.com>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 22/38] drm/amdkfd: Use correct drm device for
 cgroup permission check
Date: Wed,  7 Feb 2024 16:23:08 -0500
Message-ID: <20240207212337.2351-22-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207212337.2351-1-sashal@kernel.org>
References: <20240207212337.2351-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.16
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

From: Mukul Joshi <mukul.joshi@amd.com>

[ Upstream commit 4119734e06a7f30e7e8eb666692a58b85dca0269 ]

On GFX 9.4.3, for a given KFD node, fetch the correct drm device from
XCP manager when checking for cgroup permissions.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
Reviewed-by: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 3287a3961395..12ee273e87e1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1482,10 +1482,15 @@ void kfd_dec_compute_active(struct kfd_node *dev);
 
 /* Cgroup Support */
 /* Check with device cgroup if @kfd device is accessible */
-static inline int kfd_devcgroup_check_permission(struct kfd_node *kfd)
+static inline int kfd_devcgroup_check_permission(struct kfd_node *node)
 {
 #if defined(CONFIG_CGROUP_DEVICE) || defined(CONFIG_CGROUP_BPF)
-	struct drm_device *ddev = adev_to_drm(kfd->adev);
+	struct drm_device *ddev;
+
+	if (node->xcp)
+		ddev = node->xcp->ddev;
+	else
+		ddev = adev_to_drm(node->adev);
 
 	return devcgroup_check_permission(DEVCG_DEV_CHAR, DRM_MAJOR,
 					  ddev->render->index,
-- 
2.43.0

