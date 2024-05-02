Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D965B8BA1CE
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 23:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C4010E65E;
	Thu,  2 May 2024 21:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eQuorxj3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0988D10E65E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 21:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=TsEbpVzAc9NqZy
 rn7SWKxRL9u6cwRW1R8AWr1oj8/Yc=; b=eQuorxj3SIIIV3g+HrkZIsC+es5jDY
 7TajLTeO2219fxqnBMjk1R7PIxrR4kg1YlqimD9/4qz2NQYDXUHXvk3BOXZw1u97
 eKp6OUZv2yoQE/o6I8A6ubJjeCkVPATu9ESGdvicBHY8yWcRcFTmdn+pwJ6TThBL
 +sZv5G79qFKBlhyip4ZwbL7qgxN/9wAnuA5qh0FQFxEmP4OhBFwiF8YVu+YLUZxb
 KVVP5OQl3SxHgnhEGu7bDUHoJxCoI/ncCrem0Hsl/DGfxvMRjJAOvlFvyBKjKxab
 5WxUDnTjEiX5rVTsYyC3iSqNvWGOPYgJjeefkpdBYkdIR9jEOmj6jbUQ==
Received: (qmail 3366312 invoked from network); 2 May 2024 23:02:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 2 May 2024 23:02:55 +0200
X-UD-Smtp-Session: l3s3148p1@a1dX7X4XpsdehhrT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dri-devel@lists.freedesktop.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/1] drm: arm: display: komeda: komeda_crtc: use 'time_left'
 variable with wait_for_completion_timeout()
Date: Thu,  2 May 2024 23:02:53 +0200
Message-ID: <20240502210252.11617-2-wsa+renesas@sang-engineering.com>
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

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Fix to the proper variable type 'unsigned long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 2c661f28410e..c867acb737d6 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -294,7 +294,7 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 	struct komeda_dev *mdev = kcrtc->master->mdev;
 	struct completion *flip_done;
 	struct completion temp;
-	int timeout;
+	unsigned long time_left;
 
 	/* if caller doesn't send a flip_done, use a private flip_done */
 	if (input_flip_done) {
@@ -308,8 +308,8 @@ komeda_crtc_flush_and_wait_for_flip_done(struct komeda_crtc *kcrtc,
 	mdev->funcs->flush(mdev, kcrtc->master->id, 0);
 
 	/* wait the flip take affect.*/
-	timeout = wait_for_completion_timeout(flip_done, HZ);
-	if (timeout == 0) {
+	time_left = wait_for_completion_timeout(flip_done, HZ);
+	if (time_left == 0) {
 		DRM_ERROR("wait pipe%d flip done timeout\n", kcrtc->master->id);
 		if (!input_flip_done) {
 			unsigned long flags;
-- 
2.43.0

