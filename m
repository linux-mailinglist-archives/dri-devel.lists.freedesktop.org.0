Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51977AD8CE8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FE710E9AA;
	Fri, 13 Jun 2025 13:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iRoncZbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760B010E9AA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 13:12:07 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-450dd065828so17190115e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 06:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749820326; x=1750425126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x/axTRGu5YCBdk/I5EWWJbeox6K1QjR3ErGaJK0oM14=;
 b=iRoncZbvq4FAOqDl9qxnLKWeq7QkfBpO0yPYCGSvCqsFTLOO+5LHNYr2kDe8TJezk0
 fePYCV6k6szyef6yxhdBAzxqFGcDY/D141rbWmd3KbZ0wPmpxBS7W+wjT2hX/ts9gViu
 f43n2NR0a51gGG0AKaamQFkK7mxyxhW/iNG3A0tDYeSHP5QbNHlXGd803HZ/TyINGH7h
 pJwK7ktWanhtUGIS5nsd91eHJHAptTdJLFIPzEjG+nWip7TfOG3HuyF7ihtATPrP8y2l
 6/aA6rdDU5b3gj6itl5Vlb/cBcgipJnOTIpNSFk7siT/aQHzGxjjoxxj4VnskIvBiX0G
 trPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749820326; x=1750425126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x/axTRGu5YCBdk/I5EWWJbeox6K1QjR3ErGaJK0oM14=;
 b=eOQ7pcAbqAZhFy+Polt319OHhBv6eHAoxORxyf2R+vu43HZqTc8I5izbAfKG5lAMV3
 DJvuT8SCUH73ngCpcn9f6dtjfw3VMq6wNYgRyeHApKZnLVhMYRxGI20wXOYGbItXA8hA
 jIEg6kXQ4pK/zebcfRxNX6+cdPTukCLUwljqCh+JMc53BFCB7P4NAIuJFtAy1tS1U2XP
 HYCJ1gMBMeriFEmZMjy+zOj6z7zWHbJFks7iY2HpvCw+A9KrXwU3J0JNvouH5TAWfmlg
 RK+24DENftfxLvkiAbsdhYev7O7DKmNB3jJCSFFGmuYrk9Qdtcj7CP4QHzOy3g5awIsx
 ka1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXatUyHuniQPdQ5a96X+tVSgq+1HTVm/kREY8ayYMYiD605BFvUB63J8/WuGCYDuwHIRhL0plZqL5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmUDRy+P8+08zYDHCzRQBKd8S9TwDDHuGTOpqOKsSGWnZks2nC
 vUoYR788uK57GKQnr6u89fXaZl4DQrvka0iIT6HAaD7G8VE2CDROhT5a
X-Gm-Gg: ASbGncukhOaeOJyys17BL+RpfiyOalDHjGOAQRWr9cxOM2JGYo7LWNH3EOM0SaSEWLK
 3QdEobZ6b1mkJYYSdLOPtknAp4B+pHEocsevvlfyaTvHqUh8T1cMbJWDzvTEhKygE3R9KxXVWPa
 /e8pO7OQmhzjhJ/Vy1bWgufVMx6qETIF8VBxkC024eswNBK2N6Ky4YtDw3Ef8iLXqLG/DCYWcAL
 22TXmxr8quy4Kfkld+Fntos7TvQzbgT22wlld/V4PLlsWz0CtfX2F5vRPHY5j8ZUW5HXjzYtWg9
 qiW9YFw5buxXQwz/Ap3So4CtUi6Ojg/+lzmPTORXedWBLuk0dk4f5moK3SI+ioJ314LjyiT08MH
 H
X-Google-Smtp-Source: AGHT+IFkMlMYeEUOhLrwTtR7ayG0CY3TVMZrsRnpAy04+pn32zCkLCnwjkF7+lKNgkeVjJqqXiLaig==
X-Received: by 2002:a05:600c:3509:b0:453:c39:d0a7 with SMTP id
 5b1f17b1804b1-45334a7fd92mr28949825e9.5.1749820325648; 
 Fri, 13 Jun 2025 06:12:05 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15f2:1000:ce0c:2fbe:2ade:3d45])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4531febf905sm92921905e9.0.2025.06.13.06.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 06:12:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: jani.saarinen@intel.com, jani.nikula@linux.intel.com, tursulin@ursulin.net,
 simona.vetter@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/prime: fix drm_prime_add_buf_handle
Date: Fri, 13 Jun 2025 15:12:01 +0200
Message-Id: <20250613131201.2141-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613131201.2141-1-christian.koenig@amd.com>
References: <20250613131201.2141-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is possible through flink or IOCTLs like MODE_GETFB2 to create
multiple handles for the same underlying GEM object.

But in prime we explicitely don't want to have multiple handles for the
same DMA-buf. So just ignore it if a DMA-buf is exported with another
handle.

This was made obvious by removing the extra check in
drm_gem_prime_handle_to_dmabuf() to not add the handle if we could already
find it in the housekeeping structures.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_prime.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1d93b44c00c4..f5f30d947b61 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -113,6 +113,17 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
 
 		rb = *p;
 		pos = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
+
+		/*
+		 * Just ignore the new handle if we already have an handle for
+		 * this DMA-buf.
+		 */
+		if (dma_buf == pos->dma_buf) {
+			dma_buf_put(dma_buf);
+			kfree(member);
+			return 0;
+
+		}
 		if (dma_buf > pos->dma_buf)
 			p = &rb->rb_right;
 		else
-- 
2.34.1

