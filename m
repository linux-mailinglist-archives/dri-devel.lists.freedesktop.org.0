Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850373A0B85
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 06:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9909B6ECCF;
	Wed,  9 Jun 2021 04:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E846ECCB
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 04:36:55 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id n12so18349571pgs.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 21:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d6LSEZKBAhdZjMmY2eIdVyTStZG1ZTtq+r153OUT+pY=;
 b=p0jJe2rJC70Ncot1gsFl9OOINmhd7pi1hI3Dffg2ASBXbACxZ9ukD7Ntzt/hs465W3
 zxBJx/kQiXM3zeXzVqMJTbFXHXwdTtGjBT/7KA/lcArO/iVfcSfAxmvuJgZvPNrdr9ub
 9krPlOAz0d1VOTYpWUdkCKS22Nl8gNZUY/681IxYQwkAHGdh+cAMxQsjNyjqB0dvYv/2
 qRf5PdR/ymb9RPWr8wjO1yITKHnntHNTzvH5QH9XR8uPP85ZdexTPuJjbSjKjS5Z654d
 ghc8IS+Iqj71/7mLa2yP1Al3yKLiLIx7kHS3NCC+a58Zm9/x1p9xfEfOvcnhscaIn88s
 XlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d6LSEZKBAhdZjMmY2eIdVyTStZG1ZTtq+r153OUT+pY=;
 b=Ep/UN7y6qpjpIzVP6xCAkWSbPOpLyVod7mUQVZOurae60K3vZeno1x1WGozl2fDxAt
 AwF9r3Xu7qpn6t9dmJm75M3zRZ4Ly/ctGNcNvKC/ZaYTcOYr9e+ATYi1Y9HnHLl4yjYs
 xqBU57X1uYx10k2PbNYODTAidGqw8N+IbXYTboEj0wFLk4Yjyk/cEp9yAldHLq13FDu9
 +VJNAiQh/bJeHtP5dsNnaPiDQKZ892QzQMB4uq8BRBmDaCcC0LhBDZJkcGo2QJVyCjjQ
 5V7K5k9D9HTvuDKDf9UQ+o+p9THek89yrkclClLWeYjedC3yuBGWCz2tq7V1h9hm8SZ4
 VK5w==
X-Gm-Message-State: AOAM533O3QraDKBzS/2QHaBscDs+3fu8e+Au7oFa/HJeuWGmJ+d3CmCU
 ZwX+hSze7sV+r4+nUheIfywGW1XA/kSGjg==
X-Google-Smtp-Source: ABdhPJwLInceztcGMzjBrotjkDLmBeFxb6DkCj4Dr4EfV86OODcSEc9O254J5k808pVNIF25DdSaDw==
X-Received: by 2002:a63:7e11:: with SMTP id z17mr1833877pgc.9.1623213414812;
 Tue, 08 Jun 2021 21:36:54 -0700 (PDT)
Received: from omlet.com (jfdmzpr06-ext.jf.intel.com. [134.134.137.75])
 by smtp.gmail.com with ESMTPSA id t5sm11991612pfe.116.2021.06.08.21.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 21:36:54 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 20/31] drm/i915/gem: Make an alignment check more sensible
Date: Tue,  8 Jun 2021 23:36:02 -0500
Message-Id: <20210609043613.102962-21-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609043613.102962-1-jason@jlekstrand.net>
References: <20210609043613.102962-1-jason@jlekstrand.net>
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
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/gem/i915_gem_context.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index 8df284dcfcf3a..de2601c81f603 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1763,9 +1763,8 @@ set_engines(struct i915_gem_context *ctx,
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

