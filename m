Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4430746619
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 01:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F16310E254;
	Mon,  3 Jul 2023 23:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9552C10E05D;
 Mon,  3 Jul 2023 15:09:12 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fba86f069bso3854518e87.3; 
 Mon, 03 Jul 2023 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688396950; x=1690988950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZM6qVqvWt1I2BgabBjdwqk9L05J50In8hCGZpzZU0J8=;
 b=b4xu7CCdz/dJ76lzYoo3GkzuOZXURVVPrZRgnBNDR+Vp8AONZQTt3U8J+xte9czkNV
 gVrmLYSs2/wJANfJ9wDikHfdTXUsCN4bVEIQg64fRiUC3pcbLZbs+nPYhgiCAVtMj508
 5NY9oA4bAj1zkyF8oGJH7mhrmBYeRDg8mVvo9uqIDPMqwAf6u3PV2t2g2GUlUM1PaLWo
 dH9mwjsKm18Ddzn0dAspR0LEyw65rwwdms7WffPGVLYqhSkRBepiTP8L1xqisnN7piAd
 gf5qYr4y3p813lvb53RhfzTDpyGym6xLpRPBEab25KVr44mZLgQyFaX3qtpoAJase4dc
 addw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688396950; x=1690988950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZM6qVqvWt1I2BgabBjdwqk9L05J50In8hCGZpzZU0J8=;
 b=JvjZWhrvAYb+fReMwQBRYdcPR1kbmUx4eFi6QnS9SIQIyw16IDw8mxyrpxjao9r4V+
 kZpMhMxediDobPPA73aqXz4qAeRAQPdthNoD0vGYldX5ykkTaSVgqgL7IC8LIktyms37
 7h0JAKr7Fh9XmxQKbzvc7NMMcBkjNMjSHNFjz+LFj8kSz2xQVnUJHrPLG1yumI0N0oma
 Kr5qxYP+dAjIAtbg7FfSi1/FWMu9PZCft3Z/q3eYDP+92qvwKsmtgK2aw/RoRRS9Gt9c
 sBIcgG0xH6cd52nvNp62gCimsyMBcizuwcpvu5p1qgMVxN9/xueco7jxFvfYb96qipnO
 +r9g==
X-Gm-Message-State: ABy/qLanGZ6u5kzF+2QaYleL+E/8o/9ETY2zNH2bdpScQckvmReI7cVx
 AYJ8+ZUTqKbQH5KwFl0Ts7GBxW7fXoLzoWEI
X-Google-Smtp-Source: APBJJlE3KQ1SG6ccqPBqxmI7ZwNLWnW7syZsJMoLOXEaVktd3RA/EmCt+g+H/mifRRMLmWz9uB+jhQ==
X-Received: by 2002:ac2:58fb:0:b0:4fb:9772:6639 with SMTP id
 v27-20020ac258fb000000b004fb97726639mr6466708lfo.6.1688396950214; 
 Mon, 03 Jul 2023 08:09:10 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a1709062c0800b009786c8249d6sm12221211ejh.175.2023.07.03.08.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 08:09:09 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/pmu: Use local64_try_cmpxchg in i915_pmu_event_read
Date: Mon,  3 Jul 2023 17:08:18 +0200
Message-ID: <20230703150859.6176-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 03 Jul 2023 23:16:23 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Uros Bizjak <ubizjak@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use local64_try_cmpxchg instead of local64_cmpxchg (*ptr, old, new) == old
in i915_pmu_event_read.  x86 CMPXCHG instruction returns success in ZF flag,
so this change saves a compare after cmpxchg (and related move instruction
in front of cmpxchg).

Also, try_cmpxchg implicitly assigns old *ptr value to "old" when cmpxchg
fails. There is no need to re-read the value in the loop.

No functional change intended.

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index d35973b41186..108b675088ba 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -696,12 +696,11 @@ static void i915_pmu_event_read(struct perf_event *event)
 		event->hw.state = PERF_HES_STOPPED;
 		return;
 	}
-again:
-	prev = local64_read(&hwc->prev_count);
-	new = __i915_pmu_event_read(event);
 
-	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
-		goto again;
+	prev = local64_read(&hwc->prev_count);
+	do {
+		new = __i915_pmu_event_read(event);
+	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
 
 	local64_add(new - prev, &event->count);
 }
-- 
2.41.0

