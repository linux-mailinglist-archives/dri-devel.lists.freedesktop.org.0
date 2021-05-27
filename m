Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C373933DC
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2241B6F45D;
	Thu, 27 May 2021 16:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72D6F458
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:24 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id c12so991243pfl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AIDizxQ4UDUcjVr9hejmmeBEYh5jxyhNoh2wE4chMAo=;
 b=smTS9ICJ8Sip1NsKNWIkLO+F95kqyBVsHhaOMDgwx/fvz37vURWeYI1SpcqhQGKKCA
 EbfN1m2qwBjquj5ct9hB9R80k7VxioYoSIT2Rf+rAqze33MT74r4pqtHrk7GdGc4Vxoj
 bAy424a2dk5h3EyNUie95OntlZebehh3OncRQ0xxqoXNmMF094+lBOeCbmORTtXQnawe
 2RBXZlihJOUGDB4puxQSKdGy9lZGpCqaHDOYBvW9ygd1CbAKzgXeYzRpR71NXFPLN7Ml
 uRerM3gP95B/rBu0Ud9iXa1Q1l5dgrh2+EPuuIgGTRNfL0fAd6+9arcEKHtmlMccLCUQ
 qpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AIDizxQ4UDUcjVr9hejmmeBEYh5jxyhNoh2wE4chMAo=;
 b=tmcJNyEzJ/uDh05eEGI2IhJdMyhNIUrWwLkTXDPHTKZjySdyuBunJbHtO3fbgeonV7
 wnSZPl5hQYEQx6ag63pVwe7wJiM9gjIHyGdksHxgE7eZIUXMqhYTQf6cy6DWBlG6KO3A
 Zs1Cq0PZc7dKNcuwAx0oLDFkfJkJxEFztLrukxfH5p/ceZNZ6ba4z4rIen/9YRDrULzs
 CzuUaoRIq1y1wuiLposfiHTyEaLswLZDwleUtYMyj20vo/IsSAqjZNJUW9NrVtUYoIa0
 zoZHirXeuUClNwWQryjHOG3q5G4K3YM6oh+LRnetbGIoifM83fhz9IqIA5J4ZzmqgD8M
 woyQ==
X-Gm-Message-State: AOAM530mK0XdpSmdRj0/FCBnByiUye8QPVYZ3VQ6xwciG8YwWTfOvYRQ
 OTj8knwqMreLoQq8wtUpykbHrg==
X-Google-Smtp-Source: ABdhPJyK1EJ2dwQlTNhqf/FlfmQbzv0sbE7cUTNzJFYA9rnnZ/WOLdUG6cnuUU0jX5PDrjvOtuT0Ig==
X-Received: by 2002:a62:d0c2:0:b029:2d9:529f:f4ef with SMTP id
 p185-20020a62d0c20000b02902d9529ff4efmr4543244pfg.41.1622132843384; 
 Thu, 27 May 2021 09:27:23 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:23 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 20/29] drm/i915/gem: Make an alignment check more sensible
Date: Thu, 27 May 2021 11:26:41 -0500
Message-Id: <20210527162650.1182544-21-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527162650.1182544-1-jason@jlekstrand.net>
References: <20210527162650.1182544-1-jason@jlekstrand.net>
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

What we really want to check is that size of the engines array, i.e.
args->size - sizeof(*user) is divisible by the element size, i.e.
sizeof(*user->engines) because that's what's required for computing the
array length right below the check.  However, we're currently not doing
this and instead doing a compile-time check that sizeof(*user) is
divisible by sizeof(*user->engines) and avoiding the subtraction.  As
far as I can tell, the only reason for the more confusing pair of checks
is to avoid a single subtraction of a constant.

The other thing the BUILD_BUG_ON might be trying to implicitly check is
that offsetof(user->engines) == sizeof(*user) and we don't have any
weird padding throwing us off.  However, that's not the check it's doing
and it's not even a reliable way to do that check.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 12a148ba421b6..cf7c281977a3e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1758,9 +1758,8 @@ set_engines(struct i915_gem_context *ctx,
 		goto replace;
 	}
 
-	BUILD_BUG_ON(!IS_ALIGNED(sizeof(*user), sizeof(*user->engines)));
 	if (args->size < sizeof(*user) ||
-	    !IS_ALIGNED(args->size, sizeof(*user->engines))) {
+	    !IS_ALIGNED(args->size -  sizeof(*user), sizeof(*user->engines))) {
 		drm_dbg(&i915->drm, "Invalid size for engine array: %d\n",
 			args->size);
 		return -EINVAL;
-- 
2.31.1

