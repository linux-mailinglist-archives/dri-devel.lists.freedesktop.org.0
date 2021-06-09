Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B943A1C4B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7B56EAD2;
	Wed,  9 Jun 2021 17:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44A36EB48
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:45:16 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso1879958pjp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b7i/sI2grlFleaXu6G+WbNlIN/xmEbLbsHG793e7tpI=;
 b=DWeufDMV/+rAV6M8+K7cWs/7Vx3/jyH0UGEXSZ7waqu4LoUgRHfslzCRd5Kc1cwHys
 dy3tn4sBXPd5W7sqL+k7BRU0DN4C06eEtoi/HFzWIIlP7u4ljMnEoyCGwi+argEGGh8k
 1bidD9a5oGielK9QXaoanySpxN1JkqZIiO5KzHKf9W463AKwoC6eKEE7PvJjLYfP35xu
 xOfIcu5Q9Y6mPJuYFfAvk5Kal0U4RlAxsBjOgon/S9lga6HVgZwb6MpP0zdB8Zkg4Y19
 XWx/hMB7ymAxZkdsylMItsNY42r7zmpGbXa7pGFZDxvNSd0aINEVBg52lk9jMQqM5tB9
 aMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b7i/sI2grlFleaXu6G+WbNlIN/xmEbLbsHG793e7tpI=;
 b=h/W/SAg/3zKY3CAa4140jGH8mGGWOXetg2KPjj/dLvTIUwqkah7dhSBUFPRUqXQ3Ki
 buhtYSqGn5sXxLUF1CVKqxbA5CFWNEihg8UEur6aMYdwhIv1u+S4WrhwvzxXjM4QkoXf
 hxILT+YiJew9Au9flJEsL7434R4Vcm3ng8I7t2JiL4fsOKsaAKNKiHdAQndUU0VuQLPB
 XHmu6xRNcVq5j1YDprr0Q/QOuZIYUvKjM/cwISGzR1VRnuvI9H8WGOhshzT7knWxJ2/M
 uEwiUw8qin2PDYW2twTCGa2OKrCz0rXJpOTfT3bUVMenwXYI5+weoyLFK0hWxNONCG2j
 HtGg==
X-Gm-Message-State: AOAM533pr2HQmNy5kp8jM7JvnkkVfPTNqE5e/PKAiekAjvUnhRNzqlhx
 AWVA9KvqW+swz4mlgXGTjnyO3toC+yK32w==
X-Google-Smtp-Source: ABdhPJwKmgoUAsSVtiuKeiG4sJa/slfc9etldlgfbaK/dVIk2LQlL7ZdtQJefAXfEayVExKWKoV4GQ==
X-Received: by 2002:a17:90a:2a08:: with SMTP id
 i8mr2911826pjd.122.1623260716246; 
 Wed, 09 Jun 2021 10:45:16 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:45:15 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 31/31] HACK: Always finalize contexts
Date: Wed,  9 Jun 2021 12:44:18 -0500
Message-Id: <20210609174418.249585-32-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609174418.249585-1-jason@jlekstrand.net>
References: <20210609174418.249585-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only for verifying the previous patch with I-G-T.  DO NOT MERGE!
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 7d6f52d8a8012..9395d9d7f9530 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1996,7 +1996,7 @@ int i915_gem_context_create_ioctl(struct drm_device *dev, void *data,
 			goto err_pc;
 	}
 
-	if (GRAPHICS_VER(i915) > 12) {
+	if (1 || (GRAPHICS_VER(i915) > 12)) {
 		struct i915_gem_context *ctx;
 
 		/* Get ourselves a context ID */
-- 
2.31.1

