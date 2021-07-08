Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98AD3C1660
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB376E901;
	Thu,  8 Jul 2021 15:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616306E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:48:53 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id u11so8322957oiv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p9LihMbkz0D/b2xxGApls+quCG+XTK2bjRKq93kZNxc=;
 b=ejeeRrBCxcV71b+0zKdd+CAMyzM+QaWLBKDEvU7XFDFDhtFLdovRADZqq2OqvfkSPz
 QNvpUGR2e6+dD+cSIFgSeZIvrC9vfiioWuTQPBR54Ve8uRSAnXuu+8EK830DkN+GFzhj
 RNvfo94inO/DNZGYTdRu2913ojTs7r+lVja5oCx8VxtsyUv9XtE51JwZ6Yt+HNsQ1CWO
 dbczHaf9h+zZ0qutfLi9gIKRsVLt9XOBeEylpO3/NKYx3PASEZObumn+ctRhfjY2ZQNG
 aJwtUWQwzUaaEK59ryK5eTlPpIa0OFaNyz4zZLdk//h6tSmso5XzK7AhUF0uHz6UQH9l
 5hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9LihMbkz0D/b2xxGApls+quCG+XTK2bjRKq93kZNxc=;
 b=uQxn/DWdCL8yPAryRHxLz8iajI9IAH7CdlucS39Jjh7/jf/ZEg9OsK2cYnsHIqIjku
 RjOf3/96DDfwEnD8yxKn93ieU1cEseMeFPjmqFFfEzYRr+cCvGtLhFD4tK9BFECL40UF
 7/nfh5hBS+hQmDizT+xxVgwiV9gn8TrPzdFRnKInI85RhX9OY3euVghHKHsPcvRFyPtO
 Ax4zeq6ZMH3TLJlHK0Z/I1Mu0hiAqQcB85fIv5iHkxszfM4bSrJU0Cd9d/KsYrE5SUUr
 Y6csBZ+FwG7Wyq6xgKXlKngLjHTHvLBp/Fj7nkLoExRs8YqOggkN5zEzAtqe94NAgJ3a
 /Fqw==
X-Gm-Message-State: AOAM530bXTA4kEL+13r76AYuI6/bGHZz70CV9i8tRmXZA83AZe5ZSQQ0
 DqFOuPRXJdFRsSYQ4CQIWQl1Fg==
X-Google-Smtp-Source: ABdhPJw02aU2H50NshOn2AYegMNk/ayuXJ4lk+tFrVhYUBPlmBeZ7LnDeX0qXX0wzmcGIDwWeZ2BCw==
X-Received: by 2002:a05:6808:159d:: with SMTP id
 t29mr23387217oiw.159.1625759332689; 
 Thu, 08 Jul 2021 08:48:52 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id d20sm548356otq.62.2021.07.08.08.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:48:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/30] drm/i915/gem: Disallow creating contexts with too many
 engines
Date: Thu,  8 Jul 2021 10:48:17 -0500
Message-Id: <20210708154835.528166-13-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708154835.528166-1-jason@jlekstrand.net>
References: <20210708154835.528166-1-jason@jlekstrand.net>
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

