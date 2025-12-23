Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4938CD9227
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 12:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C0210E1FF;
	Tue, 23 Dec 2025 11:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="f+er6LpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBB010E204
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 11:40:02 +0000 (UTC)
Received: from aerhardt-tuxedo.fritz.box (p57b9501c.dip0.t-ipconnect.de
 [87.185.80.28]) (Authenticated sender: a.erhardt@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 7A84F2FC021D;
 Tue, 23 Dec 2025 12:32:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1766489536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zIefKkZMzxo7MD02YKy4yO08bQ/1V31nPzenPtLvac=;
 b=f+er6LpIMar7t7I9tXI5C4WsMcvoZRGlOtKOlLY8Sg2/t4vHn08ysVsrPNQvkyvjSiohsZ
 mefm+0hKH6aJbY1URMSxVpejHp55Vx7v/rW1imQpzLcTgMMZ6CHmtS3ggvcHkN8UCHWOJF
 dcJBRS2+ooH6EbGrgWMdkWKTDXvKHnI=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=a.erhardt@tuxedocomputers.com
 smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Aaron Erhardt <aer@tuxedocomputers.com>
Subject: [RFC PATCH 1/1] drm: ensure that vblank diff is never negative
Date: Tue, 23 Dec 2025 12:22:46 +0100
Message-ID: <20251223112246.3026909-2-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223112246.3026909-1-aer@tuxedocomputers.com>
References: <20251223112246.3026909-1-aer@tuxedocomputers.com>
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

Handle cases, where drivers report incorrect timestamps and negative
time differences are calculated. If the negative difference is large
enough, negative missed vblanks are reported, but stored in an unsigned
integer which can causes freezes. This patch prevents this case.

This fix has been verified to fix problems with the i915 driver on
modern Intel CPUs (e.g. Intel Core Ultra 7 155H).

Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
---
 drivers/gpu/drm/drm_vblank.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 94e45ed6869d..1022b6d61e4e 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1563,7 +1563,14 @@ static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
 	} while (cur_vblank != __get_vblank_counter(dev, pipe) && --count > 0);
 
 	diff_ns = ktime_to_ns(ktime_sub(t_vblank, vblank->time));
-	if (framedur_ns)
+
+	/*
+	 * Make sure no bogus diffs result from negative differences
+	 * when incorrect timestamps are reported by a driver.
+	 */
+	if (drm_WARN_ON_ONCE(dev, t_vblank < vblank->time))
+		diff = 0;
+	else if (framedur_ns)
 		diff = DIV_ROUND_CLOSEST_ULL(diff_ns, framedur_ns);
 
 
-- 
2.43.0

