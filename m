Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56836EFFB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7286F46A;
	Thu, 29 Apr 2021 19:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623DE6F468
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 19:04:06 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id t21so4190892plo.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DxHFyR56JHQIHWQCaKRZay6PSQ7IFQJkTDKfmL68Bg4=;
 b=fcSMUcjrOyKg0a6g+w1jMhfb2Tc0gdrbjLOd+cJIOuh6cji5YtuLRgkLuYQ2OfLsyD
 xmFPRfX5ViO/zxWBk+Sij7Dh+uGSzibwZ3okQQVe2ZXEVbY2QHFf0OTr3GuokQzc0Q2H
 sqFe/QhijCSol3ZcOztsJq7b6vGob5pO8On1WyL7Vwrtcn0nWOEhMY/3vwOmQgwo+K27
 Ou4X6icYc0ms/SEsP6em0dARXKnGoiFI+98f73aphNfXVpR8mQRB0znnmyz3Rc00ufpl
 BBfFFzn3pmj+Q3uOfgzvQdehLDPSf0UnEHM77R/IFpsJdWkCjTIKr3+ujrPpJz3pV8kA
 tV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DxHFyR56JHQIHWQCaKRZay6PSQ7IFQJkTDKfmL68Bg4=;
 b=oiyYGLQ8tH/lOaSs1UHqNbXODKKk7zg8uxg3tMJxEaBdWA4xspAyqsCjgj086LWD94
 li6gqopH3QrbA4FxRCPEgvDNhot61OU+G2TgHcn4LraEso20JqbBSFaejia9FhIWie3c
 798jPy6ZkUVh0Zwv7H1WFsQBZ/myk1YgKqChdo1hK1KM2TSJzNUs4i8hsxiC7ukzv7TT
 TDQxkaxGYEMYcUCPdo3uKNf3i+O1eAwnfkgtSrMfXPGHTRFKHS6DuXojkHAnM98Wlv4n
 5d5BA3MMDBrSz3oMCeApBYlWrL1x1Jkm7XIy6O6Vkj6irdshqxTL55UZhv3ogX8A7uaz
 ttJw==
X-Gm-Message-State: AOAM532eROSNB3tn6uA+IveWi6l/uElknR5ZbXwrdk6KukI2lWJ3FcH7
 9DZrBKy1LF1vLXhNS3yrYO/O/A==
X-Google-Smtp-Source: ABdhPJzcrrHhHyShP9plz4tENuEqOX33XNkQtPpjeWBi4xmu6atea20fT2jX+Xo2qg3mGaQ11+6/6Q==
X-Received: by 2002:a17:90a:510d:: with SMTP id
 t13mr1275591pjh.97.1619723045992; 
 Thu, 29 Apr 2021 12:04:05 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id b21sm3114405pji.39.2021.04.29.12.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 12:04:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/25] drm/i915/gem: Disallow creating contexts with too many
 engines
Date: Thu, 29 Apr 2021 14:03:27 -0500
Message-Id: <20210429190340.1555632-13-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429190340.1555632-1-jason@jlekstrand.net>
References: <20210429190340.1555632-1-jason@jlekstrand.net>
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
