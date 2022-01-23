Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C83497478
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 19:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BD910E8FA;
	Sun, 23 Jan 2022 18:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1518810E950;
 Sun, 23 Jan 2022 18:40:42 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so9261295pjb.1; 
 Sun, 23 Jan 2022 10:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=475Re6o4qrxmTY2+dJD1szR+aZ9ztNBAVJwVf2XomiQ=;
 b=jmVObv+DHvV/nfgWMGm7G0AiVWxWK811CYrpCGiHV6xY0cRphRK/F1bxcyarhazE7G
 QO3y6iESjwSCWQV4XxfbN0VGrGzLnz+MQAZouCPpYGATGaaGpx/xFlQQHIUbUBuvRRw5
 0P/sPgZ/Zob1yCiUwsGdNVWUVVlgMqpf+xC55wv1WQFaeiZGDLCbtdTLECSRwzD1BwDr
 5hJchQzstXRUP379uF+B/2jyU8zwFVQtEt3XnUASMZLgJzQPBHWzsJ7NMd9Pe5Hmto0M
 h6UFu1fpTLkx6o30OssQidiED5LGIyGRgU4+4B2Dhf6WKpYvcVZFv0Kk+WkaLBOUlnoc
 3Wyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=475Re6o4qrxmTY2+dJD1szR+aZ9ztNBAVJwVf2XomiQ=;
 b=5E51w8uV/1vNzEipKpblv6nQVtc1Zm738fECzdBuye8E4M0A3e0IhbZBKX1t5vDoGl
 3xatnHIp72p2jYIkqzgNT5CEndSKiMYUxL72nkmZG8sHZnsa/lprQKffbBJd9CRE0cvR
 Ne1cSOpLBACEoSV/Zl/DRW//5dTuB5xadfszVOiLuBknGK4NtsNjMKMUl2kB0BFKZlm0
 aQF5vnecmoC6q/lSN0IrmqskNj2JsPgdGtmUD6XRkWJz7SlgG6cx6RCvtT09yOIjnV6V
 lzCHwPOT2uvKmcfErNoa8D82GBh8v+SJYHjIB2Tb1HDHwAYPpWJyBEcrMlKscs5kp6li
 jqyQ==
X-Gm-Message-State: AOAM532M5bvXG6je68Iod3mcclqmQJQFM0JJllbhOGfwpFNB+vub2VPe
 jkU3kREL0jj1YFhUV2992CM=
X-Google-Smtp-Source: ABdhPJyghkxvVhznkwLCfy/A1+7acBwkBZ1BlnfDfQwJqPCZvzndSaF4vpp9USN1uOTwz9n3zy27xQ==
X-Received: by 2002:a17:90a:460f:: with SMTP id
 w15mr9814786pjg.123.1642963241641; 
 Sun, 23 Jan 2022 10:40:41 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id q9sm13712586pfk.137.2022.01.23.10.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 10:40:41 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: Yury Norov <yury.norov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 David Laight <David.Laight@aculab.com>, Joe Perches <joe@perches.com>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Alexey Klimov <aklimov@redhat.com>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 17/54] gpu: drm: replace cpumask_weight with cpumask_empty
 where appropriate
Date: Sun, 23 Jan 2022 10:38:48 -0800
Message-Id: <20220123183925.1052919-18-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220123183925.1052919-1-yury.norov@gmail.com>
References: <20220123183925.1052919-1-yury.norov@gmail.com>
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

i915_pmu_cpu_online() calls cpumask_weight() to check if any bit of a
given cpumask is set. We can do it more efficiently with cpumask_empty()
because cpumask_empty() stops traversing the cpumask as soon as it finds
first set bit, while cpumask_weight() counts all bits unconditionally.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index ea655161793e..1894c876b31d 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1048,7 +1048,7 @@ static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
 	GEM_BUG_ON(!pmu->base.event_init);
 
 	/* Select the first online CPU as a designated reader. */
-	if (!cpumask_weight(&i915_pmu_cpumask))
+	if (cpumask_empty(&i915_pmu_cpumask))
 		cpumask_set_cpu(cpu, &i915_pmu_cpumask);
 
 	return 0;
-- 
2.30.2

