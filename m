Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6381C9408
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EA96EA0A;
	Thu,  7 May 2020 15:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204946EA08
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:11:19 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so6866248wrt.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IEt34ydeTf3lwqiP0gjezhd7HkNuQ6YI4mSylebzvqU=;
 b=Kh16blF131hgTfVl4IaLEAnPLxChxrNv+JStGwPHyUIpOlkIr42stNIa/jKSxzucmD
 WhRXYIYJ19bDPEFBIynoFn+K3n0my36aUvQeukKjYUZ1ZYtELI8Mrd+cUWTdgjrmjACy
 31iPQnH0qvd11SbeTio9K2NiPycpb5eJe7D5SFmDXxDQnyNN3ylVanXdrf9xu68lmW9c
 6xVnit79VWlXlYjCz8uBfmWGdVBzMqLZeCJELJK86imNPQY4fT1t963lc4o/Xpsdr9md
 fZWILGy/CTWwnBV2IcZ2yGoQPWrNbfitiSYLJJdF6G3ni8o8oBEMZwJ6vUAebDcLiJBW
 tE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IEt34ydeTf3lwqiP0gjezhd7HkNuQ6YI4mSylebzvqU=;
 b=Uw+dkygTQM/7ugcUWQFGCN5wEfo2ZJXmcuoDhjhmu9ICVlHx8Rr0yzzoh4TbhGBuy1
 vKktjpQWkukMJCflcLXH9mQdpjojmRG90cPG0KdDLIXQ4gkrRY/o8hto7vtl1nC0cE4k
 eWf61WJpwjvT65BbqyaSxl9xWLufS9Z0eE52OwkyVqpnhn2LID6UkH7kfP9WCAar/7rE
 KsScoUzmNp43bLx+eMQQjIgbva7bA1SUhu9TWXj0PG4qjM78AN3naH5s9DNlVYmuVti+
 kBYpEZxJv1mcLZIdcO7TpkvJvtq7saxVJceW2pYvFnUrkG6rLnlnb27KJv8EGjHi35zn
 ZOfw==
X-Gm-Message-State: AGi0PubxTm0JRNfHe7rU2sGWY9LA1MbIsxab30i42A7aBzmfOygGHXeU
 nZh822JbM0bazLu4zUkWbhWkFkOP
X-Google-Smtp-Source: APiQypKilJbi89nKLM9ZIgl/hgcjMhC/4GTcGTwkJDAE9/o/CGxp0Nt/A5aI5jbqNgvEviN35Y8vjA==
X-Received: by 2002:adf:82b3:: with SMTP id 48mr15504949wrc.223.1588864277366; 
 Thu, 07 May 2020 08:11:17 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:11:16 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/36] drm/i915: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Thu,  7 May 2020 16:08:04 +0100
Message-Id: <20200507150822.114464-19-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
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
Cc: emil.l.velikov@gmail.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 41351cbf31b5..aba7517c2837 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -105,7 +105,7 @@ __attribute__((nonnull))
 static inline void
 i915_gem_object_put(struct drm_i915_gem_object *obj)
 {
-	drm_gem_object_put_unlocked(&obj->base);
+	drm_gem_object_put(&obj->base);
 }
 
 #define assert_object_held(obj) dma_resv_assert_held((obj)->base.resv)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
