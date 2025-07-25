Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D37FCB11927
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 09:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFFE10E43E;
	Fri, 25 Jul 2025 07:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nss/H2e9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77D210E43E;
 Fri, 25 Jul 2025 07:27:37 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4550709f2c1so14463045e9.3; 
 Fri, 25 Jul 2025 00:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753428456; x=1754033256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6QL8IFabAlNq2YUnjd0j76KbVt8/qh8cFRe9/l7opeg=;
 b=Nss/H2e9W7IEEkQysx+fRjmCLvPMdlWano/zLP3WAPzFcjqf5E1L6M6SL+2XhnFg8q
 hsihOAYmuFspFe9s8tcB2OSjIezVRDGDNUYMMGTBU0KzRtbKu8rFwMJMxvqUz1oyCptv
 9kLmGy2jk2fwxIs1Oiw5RIJIvt7Y+Xovxsh1/Xr9qhtfB6jtaWoeVzeYhCgrbhbGohKj
 eJTXNHbq1+Dg1SgqSIbHKq1OsiyvgnTi5nlUBobCK1NOP0jvP08K0b+UBqE7q8rnmbQQ
 NE/sS8BQE9zw8vneF0DuJNpR1QJBNQzNmgfB2hZFJ/z83GBCeJQaqfXV4ThGFxKWOHd6
 zZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753428456; x=1754033256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6QL8IFabAlNq2YUnjd0j76KbVt8/qh8cFRe9/l7opeg=;
 b=XcwUQTjEdtV5xPYip8d4ODZQuGVY8YCyYnSQTKnkGK+fL/34NLoJr4e2In2zHcjG1l
 oDYkrVQoosIBYx5JliunQxDsDA2RG12er3/ti696mdTGEmmeW9IuHT0SM06I4JDsHerp
 2g7kRhPS9GguTWQSYjTv0xOw5B/9Rm15OoiQJzUXojo6phaapsVQl25CuB+P1jonO3Sp
 w18A+AF7ivdjokGwAAxvCQC7j2sZAQRkkjekws3kqllQS8blfGQZRDpU/XbxEUXXCvy5
 oy9QXiOJJCo70fJh2YV5YN3amMeh/ZHP/YGyddm/AvnJ4ziQWL/QjFppjicCAeEWo8cK
 uguA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6i+K2eoE0FMj/6ly52/bYzcsktecC7qUlffxpn0SS5Lm6Qtl6cxd2UTlwfvzQVsQ/Y2gnUJATMAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylJLhOTdyd4Y8AMyzRiPJmt+Nl6W7tzUkEXDnQtJgwtU7j9P1c
 nxB5Dd2HiiKpAxvQvaOeDmEfjH0vcE8NKkX8CH69Wy5ARnbisEe0/U50ZazHdQ==
X-Gm-Gg: ASbGncsaqFKrFnd2M5KlVWkMCl5+W6ie7ETSR0p8uw5pB9BFX2pYxXuxa7iI13zquzw
 zdwbZU26gb690oEDao1fcMVFbSodgINFCxvfQEr1+cYIdImnvzcKVt5Cv0wmJTt3oqI8MmFNtwL
 jV6Am1RqoKa8TBTDuleiPU2HknjwxmZH5ly6yn5YevAbSFnrNBNEzPxUaw7Kyf0XUALEFgC2BM7
 3E+luzqA8MmemdjeowKh5uP6qhpmUsnsJefOpnyaT4JIUr+mDzjG40ZfYoe6xo2CvaPGHXn7D/6
 /3ueXJh0r4qtWPT7Ga4QQrv4HHnjiZTrD3jF1aWj7w9bZg5uWo3nCfE4KF9r38YVCjYg1uzRPZg
 +PNr8bb71YnbXrv5IW2YJhgVOwwkU5Oy2
X-Google-Smtp-Source: AGHT+IHXUqI3/O2tykas7YCqb0hJEiPruqG27l3QuNQZxuNeJkfBrL0rNt4o7YlL5rbuFTNvpq5rEg==
X-Received: by 2002:a05:600c:37c4:b0:455:ed0f:e8ec with SMTP id
 5b1f17b1804b1-45877447987mr4301385e9.9.1753428455491; 
 Fri, 25 Jul 2025 00:27:35 -0700 (PDT)
Received: from fedora ([193.77.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fc7885esm4227301f8f.35.2025.07.25.00.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 00:27:34 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH] drm/i915/active: Use try_cmpxchg64() in __active_lookup()
Date: Fri, 25 Jul 2025 09:26:42 +0200
Message-ID: <20250725072727.68486-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.50.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace this pattern in __active_lookup():

    cmpxchg64(*ptr, old, new) == old

... with the simpler and faster:

    try_cmpxchg64(*ptr, &old, new)

The x86 CMPXCHG instruction returns success in the ZF flag,
so this change saves a compare after the CMPXCHG.

The patch also improves the explanation of what the code really
does. cmpxchg64() will *succeed* for the winner of the race and
try_cmpxchg64() nicely documents this fact.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_active.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
index 0dbc4e289300..6b0c1162505a 100644
--- a/drivers/gpu/drm/i915/i915_active.c
+++ b/drivers/gpu/drm/i915/i915_active.c
@@ -257,10 +257,9 @@ static struct active_node *__active_lookup(struct i915_active *ref, u64 idx)
 		 * claimed the cache and we know that is does not match our
 		 * idx. If, and only if, the timeline is currently zero is it
 		 * worth competing to claim it atomically for ourselves (for
-		 * only the winner of that race will cmpxchg return the old
-		 * value of 0).
+		 * only the winner of that race will cmpxchg succeed).
 		 */
-		if (!cached && !cmpxchg64(&it->timeline, 0, idx))
+		if (!cached && try_cmpxchg64(&it->timeline, &cached, idx))
 			return it;
 	}
 
-- 
2.50.1

