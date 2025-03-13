Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0C9A5EB66
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 07:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746AA10E1F9;
	Thu, 13 Mar 2025 06:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="smsQezoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-12.smtpout.orange.fr [193.252.22.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CC910E1F9;
 Thu, 13 Mar 2025 06:00:58 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id sbcRtDEdRPGDMsbcctHq0o; Thu, 13 Mar 2025 07:00:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741845653;
 bh=B7wryxTeR4Td6Rfuy3YKp1Ppg9ZS+9mGllvjIUPWfnE=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=smsQezoJo6Gdb475kcPPl02/Keo4+WSgK5Yo5tMPGkBg0vx0I/XASikaaWDjy1Iwe
 EJHadEE2JgDAYp20Qap4X9n8FpSiacWOR/gVb0BUOVtpOVgzIG2Baj57tWtjRZsMw2
 hOQBOMDiz535v0UvWuLsxfXf6wvm3BL2XHpLSyAc3J40yyzfgshux74HgS0ptA9wC6
 6ELL8RpnUmMJTG4fRTvNtfkGlVEuxPbwkXILdN+4opWhued8vnvzi61YwFkd3U6jIG
 P5cLDnKnolsUJGQAHUZgtpJmAnov+ba1SKQPaX6gK0QZMNQGJHDGW0wXL98U2JCn1z
 6IeIZywWGj3bg==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 13 Mar 2025 07:00:53 +0100
X-ME-IP: 124.33.176.97
Message-ID: <b65e5d8c-e7ca-4137-b697-3322e112fff7@wanadoo.fr>
Date: Thu, 13 Mar 2025 15:00:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] test_bits: add tests for __GENMASK() and
 __GENMASK_ULL()
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-5-b443e9dcba63@wanadoo.fr>
 <e5afhg75ry6km3hjmzbimonxc6qfl4vzma7ucv55h6iohrbmbn@xqmxfuvoinp6>
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
In-Reply-To: <e5afhg75ry6km3hjmzbimonxc6qfl4vzma7ucv55h6iohrbmbn@xqmxfuvoinp6>
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

On 13/03/2025 at 13:13, Lucas De Marchi wrote:
> On Thu, Mar 06, 2025 at 08:29:56PM +0900, Vincent Mailhol via B4 Relay
> wrote:
>> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>>
>> The definitions of GENMASK() and GENMASK_ULL() do not depend any more
>> on __GENMASK() and __GENMASK_ULL(). Duplicate the existing unit tests
>> so that __GENMASK{,ULL}() is still covered.
>>
>> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>> ---
>> lib/test_bits.c | 18 ++++++++++++++++++
>> 1 file changed, 18 insertions(+)
>>
>> diff --git a/lib/test_bits.c b/lib/test_bits.c
>> index
>> c7b38d91e1f16d42b7ca92e62fbd6c19b37e76a0..dc93ded9fdb201e0d44b3c1cd71e233fd62258a5 100644
>> --- a/lib/test_bits.c
>> +++ b/lib/test_bits.c
>> @@ -7,6 +7,22 @@
>> #include <linux/bits.h>
>>
>>
>> +static void __genmask_test(struct kunit *test)
>> +{
>> +    KUNIT_EXPECT_EQ(test, 1ul, __GENMASK(0, 0));
>> +    KUNIT_EXPECT_EQ(test, 3ul, __GENMASK(1, 0));
>> +    KUNIT_EXPECT_EQ(test, 6ul, __GENMASK(2, 1));
>> +    KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, __GENMASK(31, 0));
> 
> why are you dropping the ones for TEST_GENMASK_FAILURES ?

Because the __GENMASK() and the __GENMASK_ULL() do not use
GENMASK_INPUT_CHECK(), it is not possible to have those
TEST_GENMASK_FAILURES negative test cases here.

I will add one sentence to the commit message to explain this.

>> +}
>> +
>> +static void __genmask_ull_test(struct kunit *test)
>> +{
>> +    KUNIT_EXPECT_EQ(test, 1ull, __GENMASK_ULL(0, 0));
>> +    KUNIT_EXPECT_EQ(test, 3ull, __GENMASK_ULL(1, 0));
>> +    KUNIT_EXPECT_EQ(test, 0x000000ffffe00000ull, __GENMASK_ULL(39, 21));
> 
> ditto
> 
> thanks
> Lucas De Marchi
> 
>> +    KUNIT_EXPECT_EQ(test, 0xffffffffffffffffull, __GENMASK_ULL(63, 0));
>> +}
>> +
>> static void genmask_test(struct kunit *test)
>> {
>>     KUNIT_EXPECT_EQ(test, 1ul, GENMASK(0, 0));
>> @@ -93,6 +109,8 @@ static void genmask_input_check_test(struct kunit
>> *test)
>>
>>
>> static struct kunit_case bits_test_cases[] = {
>> +    KUNIT_CASE(__genmask_test),
>> +    KUNIT_CASE(__genmask_ull_test),
>>     KUNIT_CASE(genmask_test),
>>     KUNIT_CASE(genmask_ull_test),
>>     KUNIT_CASE(genmask_u128_test),


Yours sincerely,
Vincent Mailhol

