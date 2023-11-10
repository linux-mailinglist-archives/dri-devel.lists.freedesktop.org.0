Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E55E7E836F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 21:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CB710E238;
	Fri, 10 Nov 2023 20:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C0F10E238
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 20:08:39 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-da13698a6d3so3141750276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 12:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699646918; x=1700251718;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4YunHZgtb5nkD4PkAgnIRkW9gO+ZcmaQMUyBJXXvNgg=;
 b=Ycw+xOer7SjdcpwvpBoGKvEdvRQCfZ3dUqM/ZOnwCt0SP2QxSHEb47MmYGTi9RlQsR
 RVnsqMIgt9tgdqQ9dyI0wwSn2xRg5FEGgvvxhQ0w5zX8YRZDIqWvKyNUhi2DfbvxKP2x
 qij/RY6fGFr8/VskksHyXqMzzU+47feEc8ogko97rPmDRk6DLrjuJpw2hgUI8ZleWKlM
 Kif1iio65XZ7u4JJiRgQ5agq7Gbcqq7a8vSUTXspfP92UxEUSWu4pjSz66ffpGnPrUCI
 UJkCAhjPnmyBz5spo6cR8Xwp+DogeEqolgR5GJM900K0aYEwn7Ey9ezZ6x6e59WyEy88
 4gQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699646918; x=1700251718;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4YunHZgtb5nkD4PkAgnIRkW9gO+ZcmaQMUyBJXXvNgg=;
 b=Auc3cHtBD7mg4vKAsywmemiHM0NOp+b1M8j+0NMbEaA4WNdgbk2ttFf9QXol6MFin5
 rfb+cOijzutPsKWwdZ8wYXg5XCV1QRHUUS44qcKak75l3YT7gAhNG2CBWQvWkVLXo/wJ
 z/j9ADsSbIJfTMXHcwLvYGLVRL1p3wdKws9odYEjjNL6xMEGVKnjOFbDtaw7fvGNZJtu
 Wy9w2ql47fvq0BwuxLH+BXhn0g73jrsEzW0NcsS20oFNhLMN4Q6JOTofAcAXL1EWMP6V
 v9zOXvG64I41Dysf9nL6WtGJgHzoyhRPx39fmR7xV0peUTHdq+EqcqpDo+HCJxDNBKsa
 ZmZw==
X-Gm-Message-State: AOJu0YzvJfBZFy/unj1eicCHlqdZRsR6p0f7Dg/1WeWbyjEfyQMNfUgO
 1NJDrkS/OriO84LryoUq3sgInC+yvIGfWw==
X-Google-Smtp-Source: AGHT+IHpA8elPSDmxOHqJghOs6XywJyufpnZHYdeTgE8gm6TvPMzYUyvszmAZYiKI4lKiyHTNGpdXhSKe/S/Cw==
X-Received: from slicestar.c.googlers.com
 ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:d849:0:b0:d9a:f3dc:7d18 with SMTP id
 p70-20020a25d849000000b00d9af3dc7d18mr3271ybg.13.1699646918475; Fri, 10 Nov
 2023 12:08:38 -0800 (PST)
Date: Sat, 11 Nov 2023 04:08:26 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231110200830.1832556-1-davidgow@google.com>
Subject: [PATCH 1/3] kunit: Add a macro to wrap a deferred action function
From: David Gow <davidgow@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>,
 dlatypov@google.com, 
 Maxime Ripard <mripard@kernel.org>, Arthur Grillo <arthurgrillo@riseup.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
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
Cc: linux-kselftest@vger.kernel.org, David Gow <davidgow@google.com>,
 Emma Anholt <emma@anholt.net>, Benjamin Berg <benjamin.berg@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-hardening@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KUnit's deferred action API accepts a void(*)(void *) function pointer
which is called when the test is exited. However, we very frequently
want to use existing functions which accept a single pointer, but which
may not be of type void*. While this is probably dodgy enough to be on
the wrong side of the C standard, it's been often used for similar
callbacks, and gcc's -Wcast-function-type seems to ignore cases where
the only difference is the type of the argument, assuming it's
compatible (i.e., they're both pointers to data).

However, clang 16 has introduced -Wcast-function-type-strict, which no
longer permits any deviation in function pointer type. This seems to be
because it'd break CFI, which validates the type of function calls.

This rather ruins our attempts to cast functions to defer them, and
leaves us with a few options. The one we've chosen is to implement a
macro which will generate a wrapper function which accepts a void*, and
casts the argument to the appropriate type.

For example, if you were trying to wrap:
void foo_close(struct foo *handle);
you could use:
KUNIT_DEFINE_ACTION_WRAPPER(kunit_action_foo_close,
			    foo_close,
			    struct foo *);

This would create a new kunit_action_foo_close() function, of type
kunit_action_t, which could be passed into kunit_add_action() and
similar functions.

In addition to defining this macro, update KUnit and its tests to use
it.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Signed-off-by: David Gow <davidgow@google.com>
---

This is a follow-up to the RFC here:
https://lore.kernel.org/linux-kselftest/20230915050125.3609689-1-davidgow@google.com/

There's no difference in the macro implementation, just an update to the
KUnit tests to use it. This version is intended to complement:
https://lore.kernel.org/all/20231106172557.2963-1-rf@opensource.cirrus.com/

There are also two follow-up patches in the series to use this macro in
various DRM tests.

Hopefully this will solve any CFI issues that show up with KUnit.

Thanks,
-- David

---
 include/kunit/resource.h | 9 +++++++++
 lib/kunit/kunit-test.c   | 5 +----
 lib/kunit/test.c         | 6 ++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/include/kunit/resource.h b/include/kunit/resource.h
index c7383e90f5c9..4110e13970dc 100644
--- a/include/kunit/resource.h
+++ b/include/kunit/resource.h
@@ -390,6 +390,15 @@ void kunit_remove_resource(struct kunit *test, struct kunit_resource *res);
 /* A 'deferred action' function to be used with kunit_add_action. */
 typedef void (kunit_action_t)(void *);
 
+/* We can't cast function pointers to kunit_action_t if CFI is enabled. */
+#define KUNIT_DEFINE_ACTION_WRAPPER(wrapper, orig, arg_type) \
+	static void wrapper(void *in) \
+	{ \
+		arg_type arg = (arg_type)in; \
+		orig(arg); \
+	}
+
+
 /**
  * kunit_add_action() - Call a function when the test ends.
  * @test: Test case to associate the action with.
diff --git a/lib/kunit/kunit-test.c b/lib/kunit/kunit-test.c
index de2113a58fa0..ee6927c60979 100644
--- a/lib/kunit/kunit-test.c
+++ b/lib/kunit/kunit-test.c
@@ -538,10 +538,7 @@ static struct kunit_suite kunit_resource_test_suite = {
 #if IS_BUILTIN(CONFIG_KUNIT_TEST)
 
 /* This avoids a cast warning if kfree() is passed direct to kunit_add_action(). */
-static void kfree_wrapper(void *p)
-{
-	kfree(p);
-}
+KUNIT_DEFINE_ACTION_WRAPPER(kfree_wrapper, kfree, const void *);
 
 static void kunit_log_test(struct kunit *test)
 {
diff --git a/lib/kunit/test.c b/lib/kunit/test.c
index f2eb71f1a66c..0308865194bb 100644
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@ -772,6 +772,8 @@ static struct notifier_block kunit_mod_nb = {
 };
 #endif
 
+KUNIT_DEFINE_ACTION_WRAPPER(kfree_action_wrapper, kfree, const void *)
+
 void *kunit_kmalloc_array(struct kunit *test, size_t n, size_t size, gfp_t gfp)
 {
 	void *data;
@@ -781,7 +783,7 @@ void *kunit_kmalloc_array(struct kunit *test, size_t n, size_t size, gfp_t gfp)
 	if (!data)
 		return NULL;
 
-	if (kunit_add_action_or_reset(test, (kunit_action_t *)kfree, data) != 0)
+	if (kunit_add_action_or_reset(test, kfree_action_wrapper, data) != 0)
 		return NULL;
 
 	return data;
@@ -793,7 +795,7 @@ void kunit_kfree(struct kunit *test, const void *ptr)
 	if (!ptr)
 		return;
 
-	kunit_release_action(test, (kunit_action_t *)kfree, (void *)ptr);
+	kunit_release_action(test, kfree_action_wrapper, (void *)ptr);
 }
 EXPORT_SYMBOL_GPL(kunit_kfree);
 
-- 
2.42.0.869.gea05f2083d-goog

