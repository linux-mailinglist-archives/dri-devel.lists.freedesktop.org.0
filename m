Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB954D048D1
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 17:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB17110E36D;
	Thu,  8 Jan 2026 16:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="somT5Me4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D6D10E36A
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 16:51:59 +0000 (UTC)
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de
 (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
 (Authenticated sender: a.erhardt@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 4ED042FC004A;
 Thu,  8 Jan 2026 17:51:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1767891117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zIefKkZMzxo7MD02YKy4yO08bQ/1V31nPzenPtLvac=;
 b=somT5Me4utwc5C4kKGD15Znawh/YuJYCResyw7SZAHFfgJ5ZDVy0exZwRM5zOe51n1SLc1
 Tyqajuf9lPw7cNAzx2mtSNLPXQlsqpxYYZVdFplz0iSn+4s4pxE4Ii2pplwhsydtcw9jmz
 ii644c10srauSIZPfZSvn6e5Rm4TXq4=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=a.erhardt@tuxedocomputers.com
 smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH 1/1] drm: ensure that vblank diff is never negative
Date: Thu,  8 Jan 2026 17:51:39 +0100
Message-ID: <20260108165139.1381835-2-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108165139.1381835-1-aer@tuxedocomputers.com>
References: <20260108165139.1381835-1-aer@tuxedocomputers.com>
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

