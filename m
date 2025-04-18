Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BDDA92EC0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 02:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1F710E1E9;
	Fri, 18 Apr 2025 00:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Dy8FXPLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2802910E1E9;
 Fri, 18 Apr 2025 00:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=c0zCwIR2YZCux8Gj1g6mDQzfRIobFooUknXOTVAhgoI=; b=Dy8FXPLUVmqWDYyu
 /cQtnjJXJ0JfNFYUIqbMvJGtkIZf9JCUh2s5z5qTlZWiDq0OBp65djrJVqxKercS1E0iJP7j1CnK/
 YBfXi8/Kp2GYw57z1KnJL5csSHnFt8hHiZmqDX0ESiqLfdSv39Tk1uxPW+aanNEtfrQUXFuotFvL5
 xV5h4Q4N9ijypOpChsF/dfMo9O9k2dTE12XIlT6as7X+Fwj75lzeUE+aWLDgVtb3QJ8cyM39Rn5AP
 DlbVIWEz/8dGpF3jyy6h1HHHD8u/iOy/AyU/mMgm4KNpyCQBd5f+k1jatBilhUOiQQpOjo8B2iOq7
 EnOiiQxqKnFHwAA5fg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1u5ZTr-00CPl8-1r;
 Fri, 18 Apr 2025 00:21:19 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
Date: Fri, 18 Apr 2025 01:21:15 +0100
Message-ID: <20250418002117.130612-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418002117.130612-1-linux@treblig.org>
References: <20250418002117.130612-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

radeon_doorbell_free() was added in 2013 by
commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
allocator")
but never used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/radeon/radeon.h        |  1 -
 drivers/gpu/drm/radeon/radeon_device.c | 14 --------------
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 8605c074d9f7..58111fdf520d 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -686,7 +686,6 @@ struct radeon_doorbell {
 };
 
 int radeon_doorbell_get(struct radeon_device *rdev, u32 *page);
-void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell);
 
 /*
  * IRQS.
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index bbd39348a7ab..4127ffb4bb6f 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -392,20 +392,6 @@ int radeon_doorbell_get(struct radeon_device *rdev, u32 *doorbell)
 	}
 }
 
-/**
- * radeon_doorbell_free - Free a doorbell entry
- *
- * @rdev: radeon_device pointer
- * @doorbell: doorbell index
- *
- * Free a doorbell allocated for use by the driver (all asics)
- */
-void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell)
-{
-	if (doorbell < rdev->doorbell.num_doorbells)
-		__clear_bit(doorbell, rdev->doorbell.used);
-}
-
 /*
  * radeon_wb_*()
  * Writeback is the method by which the GPU updates special pages
-- 
2.49.0

