Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0C497969F
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 14:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AE310E04D;
	Sun, 15 Sep 2024 12:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m/QPgKMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6AD10E04D
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 12:42:26 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-374c962e5adso2225493f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726404145; x=1727008945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KAmoRpSGu0fthg3IsTh3p9z8Wk1qhoLI0UGs01+Vzbg=;
 b=m/QPgKMaGzKZywRqHMN11CLBsNYAebO86QRM+gPhndv8L1x1iinRkjn5kI5UEPo9zn
 XV1UpCdHVTAaPZuS+SQj5ar5AIifvsxbZwODhMe52YlJb1uWI3uY582Muw3h2akx3Jgc
 fF9obtQTOSDGD78MM7uEOOofdln8E7aas6bvcsvViFFBc/zNOAza50S5L8N7jT3GDMSR
 MXEwkR2lgPeOP7aBTF0EO3Z3xXnXxSNjazHJBKdzYhbh3sUAnGEVLwVp2n7Q00FjdEBs
 qsNvvBONWQUTJy788C78hvTbHkW7D+h6znygKbXOywsLJA5G00DQCmUM4mRxYzteyxyh
 Jweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726404145; x=1727008945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KAmoRpSGu0fthg3IsTh3p9z8Wk1qhoLI0UGs01+Vzbg=;
 b=FPlSU6Bbg5sh98UNXgFnuHvsANbzEBAeyKY/rLSwSC2e77pcCJIlAeACFvNe8s58Aw
 PDd2r1fowACE2f2TPH5f0jvTRCL8sdifkzM0PQJdCV7ij+WM1e+4tEGpILfJTyZ7BPt9
 HSZjwpNbUv6tYurWu3TwRpD/ArpGu9HZIZwI8+v5xAmawwamiQKSg9tLxVLyB0z1EYyo
 pTK/T6OzeGlXPFVOX5h2AbNvw4wAFAbF1giiKi9XFZZaXPI79MoBb6IWqTzTO9+PtY/d
 +WJRYnx5zoX04NWldsXFv+PGfjTjfiwuYCj1SSepS6E6D53etPHkUAil6HoTDFtpTdqY
 7jqA==
X-Gm-Message-State: AOJu0Yxyzduw2OXs/m+QXFngJd/VmBf/rbsRy+kX/nDClRhmMTbZlNS8
 nNOPJ8ekoYOkc+0RZit9KM7shaqnqQeYv38lfcMC2EEIcpH6fEQG
X-Google-Smtp-Source: AGHT+IH13ljMpV/M4s6ZTPZ7igI97OJY6H/YX0z75kicoEwj0ihA0PkxmlqVfGWTgPZhVPTCLOld8Q==
X-Received: by 2002:adf:edce:0:b0:374:cb28:b3f8 with SMTP id
 ffacd0b85a97d-378c27a268bmr7448921f8f.1.1726404144909; 
 Sun, 15 Sep 2024 05:42:24 -0700 (PDT)
Received: from void.void ([141.226.169.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73e80afsm4578802f8f.38.2024.09.15.05.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 05:42:24 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Kreimer <algonell@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] drm/sun4i: Fix a typo
Date: Sun, 15 Sep 2024 15:42:20 +0300
Message-Id: <20240915124220.105873-1-algonell@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Fix a typo in comments.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index d7898c9c9cc0..0b24a5e3ac5f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -120,7 +120,7 @@
 /* format 21 is packed YUV444 10-bit */
 
 /*
- * Sub-engines listed bellow are unused for now. The EN registers are here only
+ * Sub-engines listed below are unused for now. The EN registers are here only
  * to be used to disable these sub-engines.
  */
 #define SUN8I_MIXER_FCE_EN			0xa0000
-- 
2.39.5

