Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D935AB1619D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AFA10E688;
	Wed, 30 Jul 2025 13:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JPQQOTcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CE410E688
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 13:35:33 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3b792b0b829so1573049f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753882532; x=1754487332; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DgvKS8DaDiL/wBtkxwBKkV0gJ6kZM0mGIKOU+fc9kg8=;
 b=JPQQOTcg32LIXHz870cZVd6d3DE8/I3vcKGZZQlu88pluTOTPI5wd9WKvysXsacrw+
 YyZV1ltZoV1yyEtK6hzzWmNqpP/BwmTaxKrKlr6WmEm7j4KxGCo9En7+3YERPXU724VA
 8I8i1FiKSJOjQMwBGUmjiydozHECHaPaYuFt9OtunLXLAGUdxru6RoKrdEZvSOvav5FM
 TaWe0oHF/RlErIsbGItuXKwJYX1cVjCOC+mO5bb8djMwglep5Ivkb/GiOBTKVjLwtvEe
 qLnUgNdrcj75WlWSyNhkqK6d2TSzWHa4OsljM9/zZ7Mvd48Yh79e0zO0xWvwW/kTUVvh
 zHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753882532; x=1754487332;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DgvKS8DaDiL/wBtkxwBKkV0gJ6kZM0mGIKOU+fc9kg8=;
 b=iFZ3vy8t/jDFTH7tqDSDEyBaFGvSs4NfVcHRATpkTCtQd3nIRQi8tqeQAR+EFtp+7/
 SqxE5RMnCGLGFt8PjCX4gZQH8659iadQNJki2AaH/yQQ/B+0HKCJvL21H0K9UAPqfZwN
 ecNIguZy1Rav/w3vclk70SLT0zgA9eo3VIy8kSPrRsnOFfs9vss6MZzAXyPgKyOu5SQT
 YRm3zCNVtIz3nQWWmIDUQa/kW/SqGP3YAmwJETp5UUoMmcGY2Z9CUkhzvGi2xz6zD0Fg
 mymUQh6FU61Yvyx8oTQ4lDqNqEKnFRFXTFjqU6/fBTTb5qywweYCQC59630qUvTqYtXF
 FCXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVULrjx1saij0qFdmP8X/BovZrVdoi8MsWHtX1vFwvgvpW7A16VyWNqrRCPmBi4zmH56TvKoIQ/S5U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzemq0cL0FZ1xUYBCWUfj0yhKZFUZFjUzNwV8+qqUZRkyMHI6jz
 KkqgBPB4KJ7P6nEEZ7bS5ntx88SKgegaB05c2N67hwdHfKGw2B4HIbd0
X-Gm-Gg: ASbGncv42Apw+Yna36oBjnhMn3bvpwA/O4gAOXxynDKRHqbuW/s9HtG/ULnpc40uOK2
 ggzYhL0x0Sg71IGcZE1ARTg1mv2QkGWiqcMedrE6oB2kzyLuyaLpLTwCyFMpNlE4dOD+81tGki5
 dwoMFqkYSd3qDbsly5ecNc3okkl06ScrFiFe8Xw+fexnwZkIqBRII0LDZn6IZCulwcUiMnfwHYq
 EahVWgddQmI7PGEk85/hnJpbzuTdnP+7Gks+LX43b4YctbMtzT1+G0nGRAulQhUeylZxYfDX/Wj
 7p8OAmjB5JK0JtemGFgI19O6XybXl/UKG8aZiQrKxPBaz5G5M7UoxwLMibbvNku2mE969InCPWe
 gi9V6UCiB90sXM/pB930w1fB9l6iM8NI=
X-Google-Smtp-Source: AGHT+IGxvs6MD8s+eM6heMdRcLibqqQD+sjLFfiyGfps4+dBebSFKDUzokFvJFWoYKvyRnAss8ibdA==
X-Received: by 2002:a05:6000:1888:b0:3b7:739d:b4bf with SMTP id
 ffacd0b85a97d-3b79501de12mr2280627f8f.51.1753882531799; 
 Wed, 30 Jul 2025 06:35:31 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b78d45d010sm7204560f8f.8.2025.07.30.06.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 06:35:31 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/kmb: Fix dereference of pointer plane before a null
 check
Date: Wed, 30 Jul 2025 14:34:57 +0100
Message-ID: <20250730133457.2076784-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

Currently pointer plane is being dereferenced on the calls to
drm_atomic_get_old_plane_state and drm_atomic_get_new_plane_state
when assigning old_plane_state and new_plane_state, this could
lead to a null pointer dereference. Fix this by first performing
a null pointer check on plane, then assigning old_plane_state and
new_plance_state and then null pointer checking these.

Fixes: 977697e20b3d ("drm/atomic: Pass the full state to planes atomic disable and update")
Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state pointer")

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9e0562aa2bcb..07498deba1b6 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -341,10 +341,8 @@ static void kmb_plane_set_alpha(struct kmb_drm_private *kmb,
 static void kmb_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state,
-										 plane);
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
+	struct drm_plane_state *old_plane_state;
+	struct drm_plane_state *new_plane_state;
 	struct drm_framebuffer *fb;
 	struct kmb_drm_private *kmb;
 	unsigned int width;
@@ -359,7 +357,12 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	static dma_addr_t addr[MAX_SUB_PLANES];
 	struct disp_cfg *init_disp_cfg;
 
-	if (!plane || !new_plane_state || !old_plane_state)
+	if (!plane)
+		return;
+
+	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	if (!old_plane_state || !new_plane_state)
 		return;
 
 	fb = new_plane_state->fb;
-- 
2.50.0

