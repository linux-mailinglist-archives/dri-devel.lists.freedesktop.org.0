Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D25A3A1C22
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA56E6EABE;
	Wed,  9 Jun 2021 17:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BA86EAB2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 17:44:44 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id o9so17313802pgd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 10:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p9LihMbkz0D/b2xxGApls+quCG+XTK2bjRKq93kZNxc=;
 b=PSgQB/YHZuvFwR8mOo+24INTrD9lsmkpetu2QnUVOgbarZDlvXm/ZeaOtIQZZ+fXO/
 x+UlPXnhrEI2Ajp6zrO2qa2kRn/utazjU6Lo2vcxV9Dx8h77jfdjDUHpODWA8yj/xwl4
 WVnZgm5g/JqdoTanHm1q96UVCZSqSqGMkecwn8pDytTuWEvZvjWbvJxzyfxJlOMExpaX
 nzagp5vraI30dIMnX4dKbk2K2TaWJtT+XorBxzZ8bjeabX6sa7uELoACbIPmgEHBb9co
 UMzEQTSyj4042ZANeWyq0GHofOxYb4WPKRY+MVXoArr32yIyiQBURg+8pC5C6rZapGbK
 qnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9LihMbkz0D/b2xxGApls+quCG+XTK2bjRKq93kZNxc=;
 b=P3wHQBAoLHqEeY3latiSQPYsIGBQicXx0eye2rzm8kUbnfNALXzOxhbz8blwS+pHqy
 TQ2xRfYRmgwIlGCxtLRg53mtloL9rkQpz8l/1EUXziBZgCoBBhRxJ9SI4+5qqlA6GUhX
 p24b5bf5PTnsZMSr+0V586T3/r8oB5EiP/S7JS6iJElTucNJnQFVFlS+/JDSLYyFkytS
 3rXiEhgwsa212GrgRX4eL30h7oW0jepoKKmHPy+qnc3rt+uiBnBvqdj/F6cQsgt1PTqz
 Aj9XNKZ24klKBv3baPwOtH96rvE6eCXJnAQbU2OKeTb00WhcwZj64UapYIFLzcylhIht
 LJzw==
X-Gm-Message-State: AOAM531B+cGasXXfQFKCqcrcMdIg0TK52piny0Ip8hNdsHXTuyyIf79Q
 GAI97RzwUydkSDbrGu2Aj39Y6rtM2Ol63w==
X-Google-Smtp-Source: ABdhPJx3zyxQBM7eFLkCc0WRAUboQ3OAY042f5+qRWsYx5RpSP5oN+VLx7VixFHDQERMnIhiXlCGJA==
X-Received: by 2002:a62:5547:0:b029:2ec:8f20:4e2 with SMTP id
 j68-20020a6255470000b02902ec8f2004e2mr914243pfb.71.1623260684060; 
 Wed, 09 Jun 2021 10:44:44 -0700 (PDT)
Received: from omlet.lan (jfdmzpr04-ext.jf.intel.com. [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id b10sm208619pfi.122.2021.06.09.10.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:44:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/31] drm/i915/gem: Disallow creating contexts with too many
 engines
Date: Wed,  9 Jun 2021 12:43:59 -0500
Message-Id: <20210609174418.249585-13-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no sense in allowing userspace to create more engines than it
can possibly access via execbuf.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 5eca91ded3423..0ba8506fb966f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1639,11 +1639,11 @@ set_engines(struct i915_gem_context *ctx,
 		return -EINVAL;
 	}
 
-	/*
-	 * Note that I915_EXEC_RING_MASK limits execbuf to only using the
-	 * first 64 engines defined here.
-	 */
 	num_engines = (args->size - sizeof(*user)) / sizeof(*user->engines);
+	/* RING_MASK has no shift so we can use it directly here */
+	if (num_engines > I915_EXEC_RING_MASK + 1)
+		return -EINVAL;
+
 	set.engines = alloc_engines(num_engines);
 	if (!set.engines)
 		return -ENOMEM;
-- 
2.31.1

