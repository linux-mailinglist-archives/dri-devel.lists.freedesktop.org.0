Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F4A4B1984
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 00:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C4B10E988;
	Thu, 10 Feb 2022 23:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188C410E988;
 Thu, 10 Feb 2022 23:31:39 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id c12so5036625ilm.8;
 Thu, 10 Feb 2022 15:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cBa2U3XOOVlsojEDVXj/o83IuBw5ETmXBNJi4yT/mck=;
 b=jHSBDPHH5F/Vu7vkrUGPef+o7tUEfAEhl2PoRlxgkCIVVBSidmw9uoJm5ymTT6uz7U
 3pffuiDZNdBK94zTP95WUpBGuA4KamvVVf+MC7XSjB2nZG+dK2TvwXlQ6Bckx4CEO+Yo
 e0MBSfMLtj2iby5Q2GF35xLHWDBso6GFt1XjoBnPxNu86jWo1lCR2vG4HtD5+tH/9aJP
 OAruOIYwdHx6XDS8/GY+DdK51p13TeK26Uf/QDWOoZldYjOXc5rWsvHHoTuWsRjT3/AS
 10ubpI+g8KCocxoIO6IF2muT6+nBFRdueT1NFzZW82akR34riORhlm6VJ3wgO4FgV413
 BSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cBa2U3XOOVlsojEDVXj/o83IuBw5ETmXBNJi4yT/mck=;
 b=H0R5p4+mdN5Xt+lasaIc4vmjSt1KHG32qdCfpnpRL1idNn5vfwyU3n58FHtkntIMMM
 BCaHqK2fubXSeCsySLRRUG/Ev9V4xi0dozWaVvS+UTIufS0JGnm9kP6AX7DukXoEb7Wu
 1nriLLlY1mCLP9+Amm7OwHkzM8Dd6O0+Y4CQnAHL2ghDDP149w97GgZPjpe/pJVFEOdG
 7Dv1fyqvQsBqyKajdTmSrmU0b+Gq+w8q4cGe/Pmfq+Mj7iC/MVjS/ZAJGWzlEXuTEPrP
 h9UCDNAW0ocC5ix/ItOOYRHG6yXxw4s9hn77a73HVUW0Iqnt9HD1RM/m26t4HKhGhD/0
 cDzQ==
X-Gm-Message-State: AOAM533InxUbOzgmZB6P+XBjS9Ht7UFup/qCINaSGbjc9NfAk/+qq0+X
 oNiuI8M/mmEske1dv5qEIZU=
X-Google-Smtp-Source: ABdhPJy8lL1944IEHiv7kjDJbzucordqvuC8LbtZQRP1RQFcCYSZIqSbwhqVBTtPLxpQaswpU1x/lA==
X-Received: by 2002:a05:6e02:148:: with SMTP id
 j8mr4737390ilr.218.1644535898397; 
 Thu, 10 Feb 2022 15:31:38 -0800 (PST)
Received: from localhost ([12.28.44.171])
 by smtp.gmail.com with ESMTPSA id l6sm7395096ilt.16.2022.02.10.15.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 15:31:38 -0800 (PST)
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
Subject: [PATCH 18/49] drm/i915/pmu: replace cpumask_weight with cpumask_empty
 where appropriate
Date: Thu, 10 Feb 2022 14:49:02 -0800
Message-Id: <20220210224933.379149-19-yury.norov@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220210224933.379149-1-yury.norov@gmail.com>
References: <20220210224933.379149-1-yury.norov@gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_pmu_cpu_online() calls cpumask_weight() to check if any bit of a
given cpumask is set. We can do it more efficiently with cpumask_empty()
because cpumask_empty() stops traversing the cpumask as soon as it finds
first set bit, while cpumask_weight() counts all bits unconditionally.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index cfc21042499d..7299ed9937dd 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1050,7 +1050,7 @@ static int i915_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
 	GEM_BUG_ON(!pmu->base.event_init);
 
 	/* Select the first online CPU as a designated reader. */
-	if (!cpumask_weight(&i915_pmu_cpumask))
+	if (cpumask_empty(&i915_pmu_cpumask))
 		cpumask_set_cpu(cpu, &i915_pmu_cpumask);
 
 	return 0;
-- 
2.32.0

