Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF477401D0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 19:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE1010E30F;
	Tue, 27 Jun 2023 17:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79D910E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 17:01:13 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3fba64e4fbcso9247895e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 10:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687885272; x=1690477272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+uGhz1ZekJEDv+o6yXgK9sgLmec5ROnru0Fe+zZ8aiQ=;
 b=G/E9S1pC+gegYTlgEBMtA32SF9TYtq5yBgLX2e+59/iC0jrdp2iyi9Vmvu/qUMPNRg
 f1ExwlIa2JlBUOkTeAQk0Zfoh9L4yohYuqRKWgb6XePBAe8BlL6v5JvDitiQC86YHCjp
 YPqf7s75eBkYneBNzezTK7nvu0QN5VCXM35l40G3c6gstpSMPD0hIbWRY+DYmaYQa8zI
 UtEAVY9XGaDVlt6IkYGPDObGZrVpHDaoDPPzHJsRbnB9erQeg5oUVsk5IPGDqOXqHNw3
 GecKX2tfkk3Kea5e+ig5iIJKu766iLLOKiJQjSeRhFyRdkBjLZ1j7v5yFXo8Z8UUPnL/
 h6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687885272; x=1690477272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+uGhz1ZekJEDv+o6yXgK9sgLmec5ROnru0Fe+zZ8aiQ=;
 b=LpWMz+xc2Msd3Sog6PqGJWwSXDvYpDHhlfPYwv+huwn+jUvEU4KlZNhcCYefkRVhlQ
 dEkHm6TnwH8wyCYpS805YkuuXdbj1t/LuWzhPmklauMI/Gy0WF65Vj6U22q9MLfucpAG
 +hVHTa+8dZpKnIE9P6sX0PbBAyBKm7nPlOVC0uQDbID10Jq+USnBFm+6XSjSTKicGRjh
 evxp3w9tS3YJnMtEHAKOIjPvJUw4cFmAZLWZL0mspzSV1HXCNU32N1ccn+9tPdQmubsD
 +6ufku6ZcE4zyWGXNn5+PWnhr2Rh3CxkaUSaMiFRWN69EPbQw6TzdJaydEdDy75NI95B
 dWcw==
X-Gm-Message-State: AC+VfDyrNOQjBxMnTGpm0+i8lYxucda48o4U6mvNYmGAf9KQOlLKjHWu
 Iucb6yiPfY23nrp+zcZf/F4=
X-Google-Smtp-Source: ACHHUZ7iuGNPU4+nlFFvwSQAqwhKvN3i5/0Ig+a69Bfy4AwbsJqAACXIJ+M2KAZSYia7jl+vER3V7Q==
X-Received: by 2002:adf:f9d0:0:b0:314:824:3788 with SMTP id
 w16-20020adff9d0000000b0031408243788mr89599wrr.27.1687885271693; 
 Tue, 27 Jun 2023 10:01:11 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 f13-20020a5d50cd000000b0030647d1f34bsm11074801wrt.1.2023.06.27.10.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:01:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/edid: make read-only const array static
Date: Tue, 27 Jun 2023 18:01:09 +0100
Message-Id: <20230627170109.751829-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the const array on the stack, instead make it static.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e0dbd9140726..39b13417b749 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3962,7 +3962,7 @@ static int drm_cvt_modes(struct drm_connector *connector,
 	struct drm_display_mode *newmode;
 	struct drm_device *dev = connector->dev;
 	const struct cvt_timing *cvt;
-	const int rates[] = { 60, 85, 75, 60, 50 };
+	static const int rates[] = { 60, 85, 75, 60, 50 };
 	const u8 empty[3] = { 0, 0, 0 };
 
 	for (i = 0; i < 4; i++) {
-- 
2.39.2

