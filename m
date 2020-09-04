Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574825DF3C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 18:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0596EC7B;
	Fri,  4 Sep 2020 16:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AE26EC7B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 16:07:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k15so7242248wrn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dE2rJAPqiyT9tOUmyIj2SaDYVLXFYZg6Wl2vSBnlHxE=;
 b=EF6OmSJH+7dt89vuPxvV/hpSg3tH7SK0Uj32m20Prq4OQQ0k6DT2mO3blxHJNxP5u5
 FLKOTXOF8pzc4cUvspLiU1WLpEZ8faQCBAOlri333mOtn8L1KCesl/Nr/9pgz2/bS819
 krYvp9rdx72TkawdnK6MGnN3fxOLOI8BM4QdYLvSDxorSB7QaYejH3Nv9LB7q4tqqfIR
 imfKXMl/jvnvf4OB4NM1Lu6bH7FA1J5XiwRInSVwvsqJfszH3GZGAkWQty4yp8hxBYvK
 FQZyWPCmOGIuoDQh0mwdECkfP0h69cBm3+76/PbG7b1uAKbq83Eaid+m/e3Cv/r+9b8N
 isFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dE2rJAPqiyT9tOUmyIj2SaDYVLXFYZg6Wl2vSBnlHxE=;
 b=ZJVykmqoipEgg+/QlIEcDKXt2ZQZnJviDx4rNOLyrYomW4dIqm0H/K39tLPRULgZgx
 rmL29n7izMLWg/Feo8hQjtWlS6zCWbnYiAZkaapn01tI6r7xHHscEQ183FXCntAxIvkZ
 4iQnG5lbAAvGR3GgvMlPWs7w5FAF5D443J96W63VDvmkdvHFWKRdB+9zACY+1PWyKJhu
 /xJRjP2qkchXzpvL6MUmiJH0bszAp7XdjUZU4/JQqF7i2UvqqHV11ONnuEMqNAVck1j7
 2B32Bc/7kNO+DduluKgXsJCPTAYjlwU4c1xGvW6bISEvN3OtvOgx5XPSSNT1tA0EbkS9
 Cn/Q==
X-Gm-Message-State: AOAM531CbIxyrks9tw0gCTYGPyCLFthB/iYrdLU8i7CvwDPZlx0/aztt
 bZNTy2/pRQzC6/pSJMzLzfKv8w==
X-Google-Smtp-Source: ABdhPJzkIZgbva8zzDUZFSetEEloCYGaSf+WX6M3YWKP6pD/abJC24cUC3PPf1+KMjbn/CmJ4Lumtg==
X-Received: by 2002:a5d:680e:: with SMTP id w14mr7897158wru.50.1599235630746; 
 Fri, 04 Sep 2020 09:07:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id h185sm12467609wme.25.2020.09.04.09.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 09:07:10 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 02/11] drm/amd: Init modifier field of helper fb.
Date: Fri,  4 Sep 2020 18:07:00 +0200
Message-Id: <20200904160709.123970-3-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
References: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise the field ends up being used uninitialized when
enabling modifiers, failing validation with high likelyhood.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
index 88ebdb3b3c7d..efc31bd6121d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
@@ -201,7 +201,7 @@ static int amdgpufb_create(struct drm_fb_helper *helper,
 	struct amdgpu_device *adev = rfbdev->adev;
 	struct fb_info *info;
 	struct drm_framebuffer *fb = NULL;
-	struct drm_mode_fb_cmd2 mode_cmd;
+	struct drm_mode_fb_cmd2 mode_cmd = {0};
 	struct drm_gem_object *gobj = NULL;
 	struct amdgpu_bo *abo = NULL;
 	int ret;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
