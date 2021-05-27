Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D7B3933D7
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795266F456;
	Thu, 27 May 2021 16:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3E66F44B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:27:13 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id l70so342796pga.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 09:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EjGRkqxqO7FFzGrHtIbmYStBAIExddeHGNU1mZ0bVMQ=;
 b=sRZiUxSJnxyNXAtrL4SXJCzLJIQt45PLCQvMaerERP5O1gzY3XKnANTefTvfeiZ7em
 Bre1+XpFeznMHMQ25sPWT+ta9dNG+HkCa0A9m+TKdv2nErvSjsWB+YmyTGom7Ckpx4KQ
 ky9gMZc8aAxYX4DcWEDXDBhzml8otvHyDKenUAHB8XFBCUnaYWKVdPhjCtT4zAZIrQ2L
 Y2MgBOnebUJeUbP3ztV/mJx1JWG68dhHztWip69YiJtpx7wnmQOqDr5cd6ZIp9igX68s
 s0xBFuwC4cEN+zNo8TGIeAFFfQD7vwbXqVYaEkpmcqCvxtex943rSSd0BGlNnL5jhcq1
 pfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EjGRkqxqO7FFzGrHtIbmYStBAIExddeHGNU1mZ0bVMQ=;
 b=GmZQz2RX0HE+G+SwXgegQV/OuTg0jsUBpNhG6O0mPHie7dCcDv5J9cjpcrnCvPVVsn
 1y1GzW24XQT/aXN99nPwDpLgTDzl6g6RDDK7ivJ31DvpWRrXoG1X/ivF0x6bwr3w53iO
 uju0tQPUNIdhZZ7fXeTE/RqbWnmuhjJ5D2Frf0ZdkiFtoLxUGCKDlhYrep4EY6HdDxXl
 qPD5pqn9u0zUhS7ZH/v0Vz4RWk5U7W2t+LC2DNSMexHrJ8ewDof1ydGEWd9wqOfBqVJX
 vBAytkaHjmiKhMdUvGGV8sa4zH1Dl3WuM/JxSaRg6Ce75auKuu3kkkxdhpIigZaISIin
 XsbQ==
X-Gm-Message-State: AOAM532p/4CvqIVE/nTtmotsHLB+cfTdwsA+wsp6XINqyznE7XvKHF9c
 NjGB+rpn6IfyQjcE1Aa/0htvr7C7e2dTeA==
X-Google-Smtp-Source: ABdhPJx+3PQyS5hqlrJlh18Q/5dx2RexO0rLFGeV2NPVMUJqY2TZQPl1VN00Mvlf18nt+VAgiBwUOw==
X-Received: by 2002:a63:a5e:: with SMTP id z30mr919662pgk.126.1622132832727;
 Thu, 27 May 2021 09:27:12 -0700 (PDT)
Received: from omlet.com ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h9sm2298711pja.42.2021.05.27.09.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:27:12 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/29] drm/i915/gem: Disallow creating contexts with too many
 engines
Date: Thu, 27 May 2021 11:26:33 -0500
Message-Id: <20210527162650.1182544-13-jason@jlekstrand.net>
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
index 5e159fb526631..2b9207b557cc9 100644
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

