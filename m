Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378899DB62F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 12:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D62710E334;
	Thu, 28 Nov 2024 11:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RfltLANa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3F510E324
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732791778;
 bh=BZ/0Vp8Wrsj8NYY6O3101ZBUfL1IfaFqS6M7eoB84UQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RfltLANaO/PShSHX9EIfAVlI+sE2LkcjuXCTHQKRVj7vaRllzMfR3KCPLw957b4Te
 k2f1TNn7omTSK1E8iZ2bS5zS7XnE2XezOJwzEH3BTCxhdnmfISZW7a7vQY7Gqux3nB
 9+O/+fNDgSUTYXhorRKl7bRR5//Q0sCH0QuH0g2JuoN+lo6oQCM0zLQdy+VNvullZ5
 mTxCdoNoiI9+q6oAXvaQoaDp5s6bRmN/pMUdpKwcCkrVwlgd29iVVtcPjQr/mP2Lv6
 Go1Zl0MYv1gmvbPkSgRFP6V0gnewH4ZRPhmLRNLUSP2opDhIomktAw21fLqq++AsvF
 NRhLAp+hzaNzA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B8EE17E360F;
 Thu, 28 Nov 2024 12:02:58 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH v2 1/5] drm/panthor: Preserve the result returned by
 panthor_fw_resume()
Date: Thu, 28 Nov 2024 12:02:50 +0100
Message-ID: <20241128110255.3182366-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241128110255.3182366-1-boris.brezillon@collabora.com>
References: <20241128110255.3182366-1-boris.brezillon@collabora.com>
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

WARN() will return true if the condition is true, false otherwise.
If we store the return of drm_WARN_ON() in ret, we lose the actual
error code.

v2:
- Add R-b

Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 984615f4ed27..e701e605d013 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -461,8 +461,8 @@ int panthor_device_resume(struct device *dev)
 	    drm_dev_enter(&ptdev->base, &cookie)) {
 		panthor_gpu_resume(ptdev);
 		panthor_mmu_resume(ptdev);
-		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
-		if (!ret) {
+		ret = panthor_fw_resume(ptdev);
+		if (!drm_WARN_ON(&ptdev->base, ret)) {
 			panthor_sched_resume(ptdev);
 		} else {
 			panthor_mmu_suspend(ptdev);
-- 
2.46.2

