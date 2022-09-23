Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FDB5E8399
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2685410E93F;
	Fri, 23 Sep 2022 20:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63E910E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:35 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso1236395pjd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=z4tB+xVARH2BbBzGKcf3E9OvsPG9MUKkIVIFYw9OFoE=;
 b=Q4rh+gmlpihEosurwwZcg5v36Y7S4n07nnD5qTUDm6HH7U8YnWvyJeQCcPZN5psqhA
 1FcoXjDJH32RpyVhUAH8KodhEdorGpw+FG6gvM+RSEQNuZXjSLQE5zdS1isnmk0JOB4S
 3CG9eUjuqlbNuMG0YbmCq/VnSQeCLDo3sbD6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=z4tB+xVARH2BbBzGKcf3E9OvsPG9MUKkIVIFYw9OFoE=;
 b=jIoX+ohJqSoge+gPl6L8cywBFggpidLUsHdjwPDitGF7owIitc2BULThwq/B251r74
 dpK1vtlyLOEGxcMjFSqIE6tsV60a521Uu8lCAvj786OM89Uj9Bdja4voUMsqlB19Fov2
 Cj8FYzUK93sm14ZdTNeWAOB+5SbboqieP5PhdhGoNjdxhDtmN8aArzD1Xeqf4PhfXt+h
 OoIetBrY9EDRr3eo1fg3iRzqZbeC6+7wcTCzZkWSt6Fz/Prc5algSvixYqIt16EwtBrr
 c64VwkCXjXQSiz0iWJDAPjITErqeGtcuagyQCDml4iv7Vrd3I9EC7KJJhXsoeJuqjZmO
 yoow==
X-Gm-Message-State: ACrzQf1KZi0MQ4S/uBMTNMZ9mtArZ6eFTtarA3zHVj8JEmCIq25AZpXY
 iHQvXcAsrwzJYObzMazPQ0+3oA==
X-Google-Smtp-Source: AMsMyM75IrvvzFBms5bHfHu6V2O7UB+rtpwccRdUWoQNc25BPNZqqAb4Stuw+QSSG5uxeFf6i+40Yw==
X-Received: by 2002:a17:90b:4b46:b0:202:7a55:5588 with SMTP id
 mi6-20020a17090b4b4600b002027a555588mr11300183pjb.55.1663964915056; 
 Fri, 23 Sep 2022 13:28:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a170902d4c500b00176b66954a6sm6438596plg.121.2022.09.23.13.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:32 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 14/16] kasan: Remove ksize()-related tests
Date: Fri, 23 Sep 2022 13:28:20 -0700
Message-Id: <20220923202822.2667581-15-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3002; h=from:subject;
 bh=nsR089jDUY/rZ3RkLnBCmN0cxhulkR1WvQxc2IILkdA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbmz8DrfaIQlG3nQhgCokX0k1pjcPoiZW0Jauf3
 tW1sqtCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5gAKCRCJcvTf3G3AJhLbEA
 CE0iCQD7eLDXpM8ch5Nl2WFXcHp3LHX4r5WZApWbPThez4fy3zQ6oNOuYG3svqE9Ty3HRWiGtAuj1z
 52ieVU1DgCeOcKoR+WWmyjUwvEKyYiR5nSddmdky8FqqpEzQC4EtPsNCfpE7C5WkkbCFT2YOnKkP+I
 c+XG3sdrbNkpYqdfxTpOaqfpmDejGo/bN62+BnL1P/oGYvKbQbJwTsGZSFgCcDiGxIx4MUs8kdvOoE
 f3E1N/A5SnQc82KMjdHOBvqyr5/nmPWBXDf9PlAi8EX9EOeSdWA63gqrcMmtWF7k53AM8y3nnA1WjF
 ArSY9BsRELGcOYhJ3ZLW3AkptdWRSxpYNY4+Bez24YkZOCmYJtf8k9uUGxCocTzQbk81lJAneIcRM6
 CmmNxTps7Rcdxo//FEpitZVXcFDFcuKqMUFVXOtgkBr5VTyqhFW3U3sns9A/xdIvuzU1nLW21+Z/gs
 rX/cfIV7h8BHZawSfOBQwanV/aeRIHMA3P7DqC6Wryes8omgf/NBRyzIEWcXGOjM+KfNjcPoqUYaPn
 VmEXb44aYqHppQofZHS2SZ2s3815KS6eI25k+LJIkeIBCtJfER9/IiKu4geqN/K/Fc2osV+7bYCzqb
 C4y72qoT68wn68L1UOdkRy8UoFwG12ut8cp2hnf2M1C3fLZUVpj8BctMNe3A==
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
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, linux-hardening@vger.kernel.org,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>, kasan-dev@googlegroups.com,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "David S. Miller" <davem@davemloft.net>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for no longer unpoisoning in ksize(), remove the behavioral
self-tests for ksize().

Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/test_kasan.c  | 42 ------------------------------------------
 mm/kasan/shadow.c |  4 +---
 2 files changed, 1 insertion(+), 45 deletions(-)

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index 58c1b01ccfe2..bdd0ced8f8d7 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -753,46 +753,6 @@ static void kasan_global_oob_left(struct kunit *test)
 	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
 }
 
-/* Check that ksize() makes the whole object accessible. */
-static void ksize_unpoisons_memory(struct kunit *test)
-{
-	char *ptr;
-	size_t size = 123, real_size;
-
-	ptr = kmalloc(size, GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
-	real_size = ksize(ptr);
-
-	OPTIMIZER_HIDE_VAR(ptr);
-
-	/* This access shouldn't trigger a KASAN report. */
-	ptr[size] = 'x';
-
-	/* This one must. */
-	KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[real_size]);
-
-	kfree(ptr);
-}
-
-/*
- * Check that a use-after-free is detected by ksize() and via normal accesses
- * after it.
- */
-static void ksize_uaf(struct kunit *test)
-{
-	char *ptr;
-	int size = 128 - KASAN_GRANULE_SIZE;
-
-	ptr = kmalloc(size, GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ptr);
-	kfree(ptr);
-
-	OPTIMIZER_HIDE_VAR(ptr);
-	KUNIT_EXPECT_KASAN_FAIL(test, ksize(ptr));
-	KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[0]);
-	KUNIT_EXPECT_KASAN_FAIL(test, ((volatile char *)ptr)[size]);
-}
-
 static void kasan_stack_oob(struct kunit *test)
 {
 	char stack_array[10];
@@ -1392,8 +1352,6 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(kasan_stack_oob),
 	KUNIT_CASE(kasan_alloca_oob_left),
 	KUNIT_CASE(kasan_alloca_oob_right),
-	KUNIT_CASE(ksize_unpoisons_memory),
-	KUNIT_CASE(ksize_uaf),
 	KUNIT_CASE(kmem_cache_double_free),
 	KUNIT_CASE(kmem_cache_invalid_free),
 	KUNIT_CASE(kmem_cache_double_destroy),
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 0e3648b603a6..0895c73e9b69 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -124,9 +124,7 @@ void kasan_unpoison(const void *addr, size_t size, bool init)
 	addr = kasan_reset_tag(addr);
 
 	/*
-	 * Skip KFENCE memory if called explicitly outside of sl*b. Also note
-	 * that calls to ksize(), where size is not a multiple of machine-word
-	 * size, would otherwise poison the invalid portion of the word.
+	 * Skip KFENCE memory if called explicitly outside of sl*b.
 	 */
 	if (is_kfence_address(addr))
 		return;
-- 
2.34.1

