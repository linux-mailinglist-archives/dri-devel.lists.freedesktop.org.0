Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA502A564B5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 11:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CEA10E9B5;
	Fri,  7 Mar 2025 10:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="jj7l/xSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-11.smtpout.orange.fr [193.252.22.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBDA10E9B5;
 Fri,  7 Mar 2025 10:11:57 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id qUg1tfGVlO34bqUg5t6MfF; Fri, 07 Mar 2025 11:11:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741342305;
 bh=rxZFizxQTBf57y6b0wCquCkeYusfLguu3ogCv2zWKsA=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=jj7l/xSyo97Ssu9r2QJlDbaqbyLHkqd/3QAVQh6ZefmhIl7zELC8scJwkVdToCRO4
 Rf/5kwAwqAlxlMXxiz8x22GyZljZWIGiQWSyFah2YGdHDfTCicGKRDzCCTFJhGmhgR
 sgksIUCET9ynUU4EXxt2Isstw/rKj+73nCf06orE1FHTVVhFBxiT2wINbBr1rsvmqY
 bqMdVKwzgpixlO61UWINpm5Mp7/GAwTQlg3Id1YeCmx2kOpmd5TNuoAK1DD5jYosmO
 faOAemypUs4zm0vt3rAo2x/Bt6fhdWIPU3BTvCK3KOBXb+cjbBBoSAyQ4Ap/HQ5xMM
 q0WmYATRxQVMg==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 07 Mar 2025 11:11:45 +0100
X-ME-IP: 124.33.176.97
Message-ID: <df371256-d981-433b-bcba-00a445e04c41@wanadoo.fr>
Date: Fri, 7 Mar 2025 19:11:42 +0900
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
 <722e147b-fdd1-4098-8d60-48c83e36a7f7@wanadoo.fr>
 <Z8nhdz5FZIHYb4Yi@smile.fi.intel.com>
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
In-Reply-To: <Z8nhdz5FZIHYb4Yi@smile.fi.intel.com>
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

On 07/03/2025 at 02:55, Andy Shevchenko wrote:
> On Fri, Mar 07, 2025 at 01:08:15AM +0900, Vincent Mailhol wrote:
>> On 06/03/2025 at 22:11, Andy Shevchenko wrote:
>>> On Thu, Mar 06, 2025 at 08:29:58PM +0900, Vincent Mailhol via B4 Relay wrote:
>>>> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>>>>
>>>> Add some additional tests in lib/test_bits.c to cover the expected
>>>> results of the fixed type BIT_U*() macros.
>>>
>>> Still would be good to have a small assembly test case for GENMASK*() as they
>>> went split and it will be a good regression test in case somebody decides to
>>> unify both without much thinking..
>>
>> Let me confirm that I correctly understood your ask. Would something
>> like this meet your expectations?
> 
> I believe it should be written in asm.

I am not confident enough in my assembly skills to submit asm patches to
the kernel. So, I would rather take a pass on that one.

Regardless, if somebody decides to unify both without much thinking as
you said, I am fully confident that the patch will get Nack-ed right
away. So, I do not have any concerns.


Yours sincerely,
Vincent Mailhol

