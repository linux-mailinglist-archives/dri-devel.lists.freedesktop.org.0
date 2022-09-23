Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F45E83EC
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A555A10E97F;
	Fri, 23 Sep 2022 20:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0944610E97F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:35:30 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so6936436pja.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=KTqecIsN+rZ/r5vRTPXwhG2Fjp/tipSlLDdfMKYcgLM=;
 b=f94Wfd7xAB1tMy6calf6l5p3x+2in7DyzsV50yDKB7taURdsPaCM2OydY1fFaru/ZW
 GjJIt1JF0yieLkvcBlF4pMte8sdTYkDdvEAsIZ7RUdwd9PufKMe5RpGZe3MTKJDT6pI8
 HpvD4dvO90+mj+6aFpo4NQqtgUTesDjf+bmbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KTqecIsN+rZ/r5vRTPXwhG2Fjp/tipSlLDdfMKYcgLM=;
 b=SU4u3XlOxJEHFmvltIAKU9hTEoyXu5SfCTQoXHmWZp/lFTXz9bGB0vATKhaML/S6mC
 ko/GxOOsQEqO0SNcewAMM+h43EhuT+1uFydtNgDwOw93e6gdJbbdt+9Gw5ULP9qFM7xw
 byyroeibN48pHM+1jFoFunQfHF3+6D3+T2BeHL5qn7QKSledTCkGt4c/x6j4QaGpJbjd
 rxCdx8j+mv1iJK1lbzfL8vhqiWvfxchPfCYcTtEtSS++p5qhitXDS1IY0q3yQdRIKXyh
 p3c/C6awcKqeMtH2+nX+VCEO8Q28Qmm87NiCnGut3acZeSnwuc/kZ1BcXQLjRZ1QtnbY
 igVw==
X-Gm-Message-State: ACrzQf2WDQv2KhpBuNiV8n3XhIOFsbySyGpxL8xCz2tzKC4N+aHnPdZv
 28hcr2TijzGk8fTXNiyKijJWlQ==
X-Google-Smtp-Source: AMsMyM7vRbdvmLwAu4r0h4O20VFgjtnhlCkk0pZbrUyBGB40i196nKU6gbtNpTH2GFxoX0kIPq3SIA==
X-Received: by 2002:a17:903:244d:b0:178:a0eb:d4bc with SMTP id
 l13-20020a170903244d00b00178a0ebd4bcmr10401235pls.33.1663965329543; 
 Fri, 23 Sep 2022 13:35:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a170902d2c200b001715a939ac5sm6372093plc.295.2022.09.23.13.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:35:28 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 15/16] mm: Make ksize() a reporting-only function
Date: Fri, 23 Sep 2022 13:28:21 -0700
Message-Id: <20220923202822.2667581-16-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4409; h=from:subject;
 bh=eTOvroLnBC5lEfD5J+pHwkaq4l0Z2pdeLmvVu9h6d+U=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbmYN/aRzOKQ1vH75NEteIR/Vhz22yGW0UEIcgR
 Yp367AqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5gAKCRCJcvTf3G3AJiNkD/
 92DJis5bkVWVuBFAf6aPfGIKZn18fqqWhgDNIB1gL3+/JoYlzCund6gFEcY8zTobmS/RbZGu3aZ6aG
 eGxVM7yZ+jxRPM4eiG3l1HwhmL3cHQjHtqkRmDgIyPZ9xwxYKivuUOcVZws84e+7hawBwlAhMt8li+
 bgO93T234fS5FLzN/RobhSkg6ISNsI03S8QmlYHytLaSLXUZwSR0/mPUZnFFUrJZk61wAHwMxs68nu
 PInfWb4QkBwNwAwxJn7jG6OEI5/PSX0n80TMD9CEDNK8sroaMS2C4k5gxVvI8qQZGlT6YpdDGy5BFI
 oEYbO9baL9bYedtNrwWblW1L3ZmdrGVL1MbXkb3ToBxpDPvQrgQHkNTDqQsY4nttLsp3PP7SZolYSA
 EuyQgZv8SE2uzK0Y60dBBdrNDexKK0+R5g1mk0Fk/fCLG+1/b859Ulh7OdVyoMlBRQRnPMPCaAyju1
 28AEPnC9DBu3Gim8BVHKN3GTgZ0QlUPONvmBGSbAWx359vzIQcmmHIqEMaug8yVrFqRB+cIVXcvtuT
 EI3ZSAAQpODVZpTsW0ZJatcd0IVMg0oWKcDLxZqolmsP3Ns+cC1eix7TMk2B/1g377zgGeJaByDfib
 tGymOAoaYv3yr/v92FdCHUFaW37DaZ7ARFElDKWqSBGJtj//OOcTik6X79dA==
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
Cc: Roman Gushchin <roman.gushchin@linux.dev>, dri-devel@lists.freedesktop.org,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Eric Dumazet <edumazet@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, linux-hardening@vger.kernel.org,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>, kasan-dev@googlegroups.com,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, llvm@lists.linux.dev,
 Kees Cook <keescook@chromium.org>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Yonghong Song <yhs@fb.com>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With all "silently resizing" callers of ksize() refactored, remove the
logic in ksize() that would allow it to be used to effectively change
the size of an allocation (bypassing __alloc_size hints, etc). Users
wanting this feature need to either use kmalloc_size_roundup() before an
allocation, or call krealloc() directly.

For kfree_sensitive(), move the unpoisoning logic inline. Replace the
open-coded ksize() in __do_krealloc with ksize() now that it doesn't
perform unpoisoning.

Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-mm@kvack.org
Cc: kasan-dev@googlegroups.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 mm/slab_common.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index d7420cf649f8..60b77bcdc2e3 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1160,13 +1160,8 @@ __do_krealloc(const void *p, size_t new_size, gfp_t flags)
 	void *ret;
 	size_t ks;
 
-	/* Don't use instrumented ksize to allow precise KASAN poisoning. */
-	if (likely(!ZERO_OR_NULL_PTR(p))) {
-		if (!kasan_check_byte(p))
-			return NULL;
-		ks = kfence_ksize(p) ?: __ksize(p);
-	} else
-		ks = 0;
+	/* How large is the allocation actually? */
+	ks = ksize(p);
 
 	/* If the object still fits, repoison it precisely. */
 	if (ks >= new_size) {
@@ -1232,8 +1227,10 @@ void kfree_sensitive(const void *p)
 	void *mem = (void *)p;
 
 	ks = ksize(mem);
-	if (ks)
+	if (ks) {
+		kasan_unpoison_range(mem, ks);
 		memzero_explicit(mem, ks);
+	}
 	kfree(mem);
 }
 EXPORT_SYMBOL(kfree_sensitive);
@@ -1242,10 +1239,11 @@ EXPORT_SYMBOL(kfree_sensitive);
  * ksize - get the actual amount of memory allocated for a given object
  * @objp: Pointer to the object
  *
- * kmalloc may internally round up allocations and return more memory
+ * kmalloc() may internally round up allocations and return more memory
  * than requested. ksize() can be used to determine the actual amount of
- * memory allocated. The caller may use this additional memory, even though
- * a smaller amount of memory was initially specified with the kmalloc call.
+ * allocated memory. The caller may NOT use this additional memory, unless
+ * it calls krealloc(). To avoid an alloc/realloc cycle, callers can use
+ * kmalloc_size_roundup() to find the size of the associated kmalloc bucket.
  * The caller must guarantee that objp points to a valid object previously
  * allocated with either kmalloc() or kmem_cache_alloc(). The object
  * must not be freed during the duration of the call.
@@ -1254,13 +1252,11 @@ EXPORT_SYMBOL(kfree_sensitive);
  */
 size_t ksize(const void *objp)
 {
-	size_t size;
-
 	/*
-	 * We need to first check that the pointer to the object is valid, and
-	 * only then unpoison the memory. The report printed from ksize() is
-	 * more useful, then when it's printed later when the behaviour could
-	 * be undefined due to a potential use-after-free or double-free.
+	 * We need to first check that the pointer to the object is valid.
+	 * The KASAN report printed from ksize() is more useful, then when
+	 * it's printed later when the behaviour could be undefined due to
+	 * a potential use-after-free or double-free.
 	 *
 	 * We use kasan_check_byte(), which is supported for the hardware
 	 * tag-based KASAN mode, unlike kasan_check_read/write().
@@ -1274,13 +1270,7 @@ size_t ksize(const void *objp)
 	if (unlikely(ZERO_OR_NULL_PTR(objp)) || !kasan_check_byte(objp))
 		return 0;
 
-	size = kfence_ksize(objp) ?: __ksize(objp);
-	/*
-	 * We assume that ksize callers could use whole allocated area,
-	 * so we need to unpoison this area.
-	 */
-	kasan_unpoison_range(objp, size);
-	return size;
+	return kfence_ksize(objp) ?: __ksize(objp);
 }
 EXPORT_SYMBOL(ksize);
 
-- 
2.34.1

