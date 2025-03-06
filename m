Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46347A55034
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CEB10E9ED;
	Thu,  6 Mar 2025 16:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="WiFKufXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-17.smtpout.orange.fr [193.252.22.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC5110EA0A;
 Thu,  6 Mar 2025 16:08:20 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id qDlStMikP0ogTqDlftO2fs; Thu, 06 Mar 2025 17:08:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741277300;
 bh=uGTIrVl9lBU8APAWKpcHUHguIxwD0cUIqzO9NpuCA9I=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=WiFKufXslWpe8Su6MzkgZj/f0j05oabHMLX4jrXOmX36bhPnZ02Wu+8QlXPhNvnFr
 OYgBA1Z2f00apfEeoSqtVxS6cAYRKYhaLOh2A/ndwwooQY6WcY0IMjDI5U8W871PDn
 ZWW+FhLixYxLN6zTaiSmDt0cKxio4xK1rLs2/xQqZvE8HDf1Z3FFbHhN6wJIGde7TF
 7t+m2MqTQO1UVZbi9x0SmlvVIZ2zQVOaBiVQJwPsSU+P/bCAbl3jzfWB0RJb7+Widf
 g0+TjI7zmxhK5gTN0Mnq+HrJ9xEKhF+lDhErVKkOAc4LbJ0Hw7iG62thiVtro+mpuF
 pKeEIVkUIJ6aQ==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 Mar 2025 17:08:20 +0100
X-ME-IP: 124.33.176.97
Message-ID: <722e147b-fdd1-4098-8d60-48c83e36a7f7@wanadoo.fr>
Date: Fri, 7 Mar 2025 01:08:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] test_bits: add tests for BIT_U*()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-7-b443e9dcba63@wanadoo.fr>
 <Z8mfAQGUvm3z86kE@smile.fi.intel.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <Z8mfAQGUvm3z86kE@smile.fi.intel.com>
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

On 06/03/2025 at 22:11, Andy Shevchenko wrote:
> On Thu, Mar 06, 2025 at 08:29:58PM +0900, Vincent Mailhol via B4 Relay wrote:
>> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>>
>> Add some additional tests in lib/test_bits.c to cover the expected
>> results of the fixed type BIT_U*() macros.
> 
> Still would be good to have a small assembly test case for GENMASK*() as they
> went split and it will be a good regression test in case somebody decides to
> unify both without much thinking..

Let me confirm that I correctly understood your ask. Would something
like this meet your expectations?

diff --git a/lib/test_bits.c b/lib/test_bits.c
index 72984fae7b81..869b291587e6 100644
--- a/lib/test_bits.c
+++ b/lib/test_bits.c
@@ -136,6 +136,29 @@ static void genmask_input_check_test(struct kunit
*test)
 	KUNIT_EXPECT_EQ(test, 0, GENMASK_INPUT_CHECK(127, 0));
 }

+#undef __LINUX_BITS_H
+#undef GENMASK
+#undef GENMASK_ULL
+#define __ASSEMBLY__
+#include <linux/bits.h>
+static void asm_genmask_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1ul, GENMASK(0, 0));
+	KUNIT_EXPECT_EQ(test, 3ul, GENMASK(1, 0));
+	KUNIT_EXPECT_EQ(test, 6ul, GENMASK(2, 1));
+	KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, GENMASK(31, 0));
+}
+
+static void asm_genmask_ull_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, 1ull, GENMASK_ULL(0, 0));
+	KUNIT_EXPECT_EQ(test, 3ull, GENMASK_ULL(1, 0));
+	KUNIT_EXPECT_EQ(test, 0x000000ffffe00000ull, GENMASK_ULL(39, 21));
+	KUNIT_EXPECT_EQ(test, 0xffffffffffffffffull, GENMASK_ULL(63, 0));
+}
+#undef __ASSEMBLY__
+#undef GENMASK
+#undef GENMASK_ULL

 static struct kunit_case bits_test_cases[] = {
        KUNIT_CASE(__genmask_test),
@@ -144,6 +167,8 @@ static struct kunit_case bits_test_cases[] = {
 	KUNIT_CASE(genmask_ull_test),
 	KUNIT_CASE(genmask_u128_test),
 	KUNIT_CASE(genmask_input_check_test),
+	KUNIT_CASE(asm_genmask_test),
+	KUNIT_CASE(asm_genmask_ull_test),
 	{}
 };


Yours sincerely,
Vincent Mailhol

