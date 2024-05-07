Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188788BDDA6
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 11:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59A21124A7;
	Tue,  7 May 2024 09:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TGl1ByHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C881124A7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=dlPMSeZOxF6v3l
 K25IAhR7EO+g98g2PsBqwha+jijX0=; b=TGl1ByHBfYg0+zU4kasR0kqmwQ1WJM
 AJQ1o+1WXddHEhQsRJhzq0rByAYwprBmsEtprZqmO0YKb2jHXHIldxCxagbeJ0cg
 fYkBEJWnwNTSyb9kpAnaqP+3mCXl2DNUlalh4aA9AwRBRIqngcKKY/YhycPCeFVe
 rRKjcVAfw1Pvf1yE5bzl9IwX/aCkLHFz43R6huLUKhv0UiBaP8nDCzzyDNblIJ/D
 IFkdavoCh813zSJZvKrRbQky2SVE+NYq1bAH6TvnhErMOIzApMx6ywTqVDdDRbNq
 LEV+KNsSlCebWePMzTwj4p80vm+xC2g9QWPymJQJN3Jy+O7lZEwJgyWQ==
Received: (qmail 167706 invoked from network); 7 May 2024 11:02:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 7 May 2024 11:02:04 +0200
X-UD-Smtp-Session: l3s3148p1@E8iMcNkXAp0gAwDPX0CuAO+oYiCi4tWm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dri-devel@lists.freedesktop.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/arm/comeda: don't use confusing 'timeout' variable name
Date: Tue,  7 May 2024 11:02:01 +0200
Message-ID: <20240507090200.7936-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
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

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Check the return value directly to drop
'timeout'  which also fixes its wrong type.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 2c661f28410e..9bec59cf9c06 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -294,7 +294,6 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 	struct komeda_dev *mdev = kcrtc->master->mdev;
 	struct completion *flip_done;
 	struct completion temp;
-	int timeout;
 
 	/* if caller doesn't send a flip_done, use a private flip_done */
 	if (input_flip_done) {
@@ -308,8 +307,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 	mdev->funcs->flush(mdev, kcrtc->master->id, 0);
 
 	/* wait the flip take affect.*/
-	timeout = wait_for_completion_timeout(flip_done, HZ);
-	if (timeout == 0) {
+	if (wait_for_completion_timeout(flip_done, HZ) == 0) {
 		DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->master->id);
 		if (!input_flip_done) {
 			unsigned long flags;
-- 
2.43.0

