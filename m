Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349D6CD259
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 08:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A50B10E4C2;
	Wed, 29 Mar 2023 06:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D5A10E257
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:56:09 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-54574d6204aso145489207b3.15
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 23:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680072968;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+6FGLc7DezyggwEDA6SlL49TwBy1ESwTS9CYC+SnZVM=;
 b=ip2ObvbwjKAThNEYJ+mAP6NxZUtLziQmG7qqimp6FSTliXsWvpp5OlH/S6qdrm6D4K
 IZicU6MzuIcQCE61oioHol6VvVAaXHIE2dhWe8vuYyDhNoqEF4mloHHEnoPtfVHcGjfO
 wyOpfLQ6H4o5KUW557F4zn4wpZzfuWs34QzeytMTnFRjkNgloAfzhWoWJ4+dReISEOZP
 1rYuW6kB2TWKMSZvrnsbDg6JDBJqvZGSBzqMLAdDCWB8oHH9sNVSUcHox19tuqORYQv+
 VXEem2/SMiKw6ug/GxM5zdBr9xY2Tv/ZorcJKFJg0KtMQRKjxshwFRGO2BOugKdYpD2h
 yDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680072968;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6FGLc7DezyggwEDA6SlL49TwBy1ESwTS9CYC+SnZVM=;
 b=MNIp9/XbLRdBsvaL0N0L+Hjm/LaEocj5DPx3V9OhcF4TfDjbEbAGfRtG1xnp8PSyS6
 9iCiejX6LstiCGGDVq2gAZLaWh4D24UjnyMuNNUgjdliO+g45nGh09QF1EJwN03wCazU
 DYfP3Bd/GvT3p1flbmMEONUSwzG6cB/CglebH3gr7x6Utdyo5YDHLh9vGqibghjaEhR4
 k6ZcujvLU/o0SnJYZ7+u0ZwbXuVdJ3EGR+NYJjtw2VyKcYovJaQIAnJAuoSHt5nBcvSi
 yooeOVzN3+I1Nk6kbczvF+UmQ8X7ayChgmzSPK7kPgWgHuZ/3a8HS5EzRKVRqlhn24Ky
 gAOw==
X-Gm-Message-State: AAQBX9fA06A72uL1lh3GW4uLTbcfbzTR252b8h4gf+eij68zA5MhLTr+
 +FQvZWVDciioFdZQllRRs/MyjbcuaElOrg==
X-Google-Smtp-Source: AKy350aW0oXIdid/PamI5UXVN98qdXztLtQJ5ZEohZbEr95Se93u+cliygWLulbEfIGKqnK6l7npl+MIXUEaIA==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:1547:b0:b46:4a5e:365f with SMTP
 id r7-20020a056902154700b00b464a5e365fmr12420681ybu.8.1680072968620; Tue, 28
 Mar 2023 23:56:08 -0700 (PDT)
Date: Wed, 29 Mar 2023 14:55:34 +0800
In-Reply-To: <20230329065532.2122295-1-davidgow@google.com>
Mime-Version: 1.0
References: <20230329065532.2122295-1-davidgow@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230329065532.2122295-2-davidgow@google.com>
Subject: [PATCH 2/2] drm: test: Fix 32-bit issue in drm_buddy_test
From: David Gow <davidgow@google.com>
To: "=?UTF-8?q?Lu=C3=ADs=20Mendes?=" <luis.p.mendes@gmail.com>, 
 "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org, David Gow <davidgow@google.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_buddy_test KUnit tests verify that returned blocks have sizes
which are powers of two using is_power_of_2(). However, is_power_of_2()
operations on a 'long', but the block size is a u64. So on systems where
long is 32-bit, this can sometimes fail even on correctly sized blocks.

This only reproduces randomly, as the parameters passed to the buddy
allocator in this test are random. The seed 0xb2e06022 reproduced it
fine here.

For now, just hardcode an is_power_of_2() implementation using
x & (x - 1).

Signed-off-by: David Gow <davidgow@google.com>
---

There are actually a couple of is_power_of_2_u64() implementations
already around in:
- drivers/gpu/drm/i915/i915_utils.h
- fs/btrfs/misc.h (called is_power_of_two_u64) 

So the ideal thing would be to consolidate these in one place.


---
 drivers/gpu/drm/tests/drm_buddy_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index f8ee714df396..09ee6f6af896 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -89,7 +89,8 @@ static int check_block(struct kunit *test, struct drm_buddy *mm,
 		err = -EINVAL;
 	}
 
-	if (!is_power_of_2(block_size)) {
+	/* We can't use is_power_of_2() for a u64 on 32-bit systems. */
+	if (block_size & (block_size - 1)) {
 		kunit_err(test, "block size not power of two\n");
 		err = -EINVAL;
 	}
-- 
2.40.0.348.gf938b09366-goog

