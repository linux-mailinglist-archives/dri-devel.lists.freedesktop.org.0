Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183915E8398
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C0910E92F;
	Fri, 23 Sep 2022 20:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24D210E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:30 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id y11so1062240pjv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=k0IswvXpcAvdiLZPIXN3c5DjnsYKqakODd7BbfXTQEI=;
 b=QrmiCQX9GiyAvK9+mKup1boveHjE9itEI0YZkgCTiluR2mt+7uynIg0wgHzS0fo3Kt
 s8lgk0G0b7iFD6G/bf8SXd7GtoYB2il63LkywVZCSQDCieP6Y6mrV2z2ASYtCsyN6DKS
 xeEqLxywxC671K6eBmRXgIzL8IhhLMZaUYHMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=k0IswvXpcAvdiLZPIXN3c5DjnsYKqakODd7BbfXTQEI=;
 b=cu1aT17fQt8jnUN0H2X9yAMQHlw9EKIuE7i/qcwMp/7H0b7dLbWY4kvBbJjsH9Ipab
 Aj9I5neDAbe18PZkHC7BgEYfVRH1vZjxzU9hQAMxmSagoDtsP6432g1aw57xJsoYawtD
 O9PzuvqwlJiIx3hWs8SmELRmP+9mLBaSOoJZ21lk07aPmg6QOf6mHYgj3j+rmcnc+kWl
 89Zxo/lIfFF1mO8bBwmaF1bczmyadX67OTromrChop84ZFJmTlG8JXnyrij/hBJcQ7WQ
 NbJ0mcW6xM7riEwMGCIgQYzRD+2EqrhYihZzGjAZ5TivxZyzw99Y81AVvQsi4P2E2new
 Hcqw==
X-Gm-Message-State: ACrzQf2ZRKf6Vb1CCPI0CcCR4W5PXr7e91OQ6ILynV7U1nXw3EU3rqGY
 ytLQBoMY6ZudfraevjRGD6fNMQ==
X-Google-Smtp-Source: AMsMyM5hUgD6utpVMAl6ShfvZOmvi4K16Slmi0TDE2X8XGDljCU6xLMJTIptVSCg6vqu21Nf0Aqn/w==
X-Received: by 2002:a17:90b:1c09:b0:203:af4d:ed6 with SMTP id
 oc9-20020a17090b1c0900b00203af4d0ed6mr22702155pjb.243.1663964910372; 
 Fri, 23 Sep 2022 13:28:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a17090ad58b00b001fd77933fb3sm2032999pju.17.2022.09.23.13.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:28 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 05/16] net: ipa: Proactively round up to kmalloc bucket size
Date: Fri, 23 Sep 2022 13:28:11 -0700
Message-Id: <20220923202822.2667581-6-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; h=from:subject;
 bh=IY1ALzn2CwEEDJeKMCN2d2RSu1qSDYHH3sl/8qGPuY0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbk0/S4oiPoPLUr2gK0zbu5nD58CBtVyli7/b9z
 b2gIR0qJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5AAKCRCJcvTf3G3AJg5DD/
 49Q+Vbxd75ylphO0zAoxF1E8P7/YQRC083ZhpstciRAvjCqnpLi5zdF920rTUU+1hjspMRJaMkLZZ5
 bK5uDN9URaJ1VBwYD+6+cHrxZwypqnLzdn14wwH8UG1QuBQhNDvUuCFwvkUBf9/Bp+0g8k8JGKzhTu
 6eWxuatrO7c1lHLgNshKa4CHOwSIXGl1Q8U+crVj889yJ+3vaBJUKAFLpG7i9/BXIbxLtC96UzXJeG
 NpqcAteIRbx3lZMeVrME7GvP1FKrpZi+5WLpqgRlT3zHEnEjOfHgoh+/WIeqHjr5vo7twX5652tP2N
 Mx8LmRcy1QGFOC7cJrUAt1lxtEm2xDE0DDTWbtrLD/urw/SDcZInXg9OaQJScBgPEF5EimBTanoAdX
 npz666oA+SsIyft7lopXirXDXC9dc2tpNbbWXNbUbi/8SOXb4M64nUSj261gX1dFmmdiMTVkMJi6k9
 jkjF4KkszF50l/ZyuXITZfH/g97qx+FCiVCme/NzouQsbRqcFRQc4aqwS5nAJR5semKAPwFBzi4o8K
 IAGeXk3wxbSLA2xKLlfWqmWPjgqVVs0+TV5yEo1uzFYRf9/vtUmqFEKouB6fcB43xqHMU/prp6VRKO
 cZ5pTG4vUmHBldHcHEO1sFYR/POcX3tBkkrlcVrJzjuOaTUmZSZ3vpMsCr9Q==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Alex Elder <elder@linaro.org>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Yonghong Song <yhs@fb.com>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of discovering the kmalloc bucket size _after_ allocation, round
up proactively so the allocation is explicitly made for the full size,
allowing the compiler to correctly reason about the resulting size of
the buffer through the existing __alloc_size() hint.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Reviewed-by: Alex Elder <elder@linaro.org>
Link: https://lore.kernel.org/lkml/4d75a9fd-1b94-7208-9de8-5a0102223e68@ieee.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ipa/gsi_trans.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
index 18e7e8c405be..eeec149b5d89 100644
--- a/drivers/net/ipa/gsi_trans.c
+++ b/drivers/net/ipa/gsi_trans.c
@@ -88,6 +88,7 @@ struct gsi_tre {
 int gsi_trans_pool_init(struct gsi_trans_pool *pool, size_t size, u32 count,
 			u32 max_alloc)
 {
+	size_t alloc_size;
 	void *virt;
 
 	if (!size)
@@ -104,13 +105,15 @@ int gsi_trans_pool_init(struct gsi_trans_pool *pool, size_t size, u32 count,
 	 * If there aren't enough entries starting at the free index,
 	 * we just allocate free entries from the beginning of the pool.
 	 */
-	virt = kcalloc(count + max_alloc - 1, size, GFP_KERNEL);
+	alloc_size = size_mul(count + max_alloc - 1, size);
+	alloc_size = kmalloc_size_roundup(alloc_size);
+	virt = kzalloc(alloc_size, GFP_KERNEL);
 	if (!virt)
 		return -ENOMEM;
 
 	pool->base = virt;
 	/* If the allocator gave us any extra memory, use it */
-	pool->count = ksize(pool->base) / size;
+	pool->count = alloc_size / size;
 	pool->free = 0;
 	pool->max_alloc = max_alloc;
 	pool->size = size;
-- 
2.34.1

