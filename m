Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428033718AA
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689426E8F6;
	Mon,  3 May 2021 15:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2786E8F5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:58:16 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id v20so3055927plo.10
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DxHFyR56JHQIHWQCaKRZay6PSQ7IFQJkTDKfmL68Bg4=;
 b=Gkcsx8sOXH5ML0aQsXT7y2mHgcRWQ5x0FJyLsmMyV7f5ev+3McK2W/nCtzEiaFY7x7
 qMKcoOCT/ydIsL9NLIIZUAFOl1vqVetsJV+7axn8VZjaqXY/jqYUbjbjLoK9GlFSj1Qa
 JfxbuGaog0yIm12Vm3qBFdOanjQ87t/doswbAEbPnnzKipdx2D/Nkd8OZeGMKU8rwATb
 npzza5uOgrrEYA1/jZo5obq0ToiD7EqYDxlBisE36ujNZ2QJq12XVdRu+fTfLVPM/OqC
 BvcUkGC+Pqph4z6TlEN3OuOkQb5jXGbzF6QjSga+QTmcZ5iKCAPPkI0i8gUduBwq8qJt
 XBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DxHFyR56JHQIHWQCaKRZay6PSQ7IFQJkTDKfmL68Bg4=;
 b=hJOIpWpz+vlBOWCfHwMhoerbxsMd/hzgLLb46oZE/oPQfghiPzVTnk+dXUVceqAn2O
 BQwpsvrNmW991T2Igk6ZXaAbyb9eytcrZvqoleFxAmYfTOCP8HpWPnwGaoE6Z4IimECB
 iWHxyzlWmneN6oUL1AJnmiN9B6hQiqfGp5I2Fthmr9984w3BdL8a7WzRWfmrxJ8cWqIR
 6TX2LbX3NCt5wtNf5UZlnMFwd1CejANlueaRJdqlGyoTm/Bf9uXllTjCfT07/2AOTZhb
 vY3zeWQEhuQR1pclDOVt+iJceDdxnzAGpTgMiLpXhMMoVgtNP+/RWwav4paJ+cWVvs8e
 XDUQ==
X-Gm-Message-State: AOAM530HqtmT+VPbAL+5ivwbgeHgTa9oXhw5IV/nP7BHlYtgwgR3Ma5r
 RzALNBxhCBLqqDVeviqP9uEL7Q==
X-Google-Smtp-Source: ABdhPJz6OE8p/2eslel0fTDqmsVHp4k3yY96AFFrvaTKEUd9VXXOzs4jib8ofFdwusmIyKRC/KOqrQ==
X-Received: by 2002:a17:902:9042:b029:ee:86f1:61d2 with SMTP id
 w2-20020a1709029042b02900ee86f161d2mr21079615plz.58.1620057495711; 
 Mon, 03 May 2021 08:58:15 -0700 (PDT)
Received: from omlet.com (jfdmzpr05-ext.jf.intel.com. [134.134.139.74])
 by smtp.gmail.com with ESMTPSA id gf21sm9783296pjb.20.2021.05.03.08.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:58:14 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/27] drm/i915/gem: Disallow creating contexts with too many
 engines
Date: Mon,  3 May 2021 10:57:33 -0500
Message-Id: <20210503155748.1961781-13-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503155748.1961781-1-jason@jlekstrand.net>
References: <20210503155748.1961781-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index be42dc918ef6f..8e254d83d65f2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1640,11 +1640,11 @@ set_engines(struct i915_gem_context *ctx,
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
