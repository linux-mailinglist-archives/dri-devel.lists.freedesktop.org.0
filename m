Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B42A7066C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 17:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF5F10E594;
	Tue, 25 Mar 2025 16:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="tiJFTH5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-73.smtpout.orange.fr [193.252.22.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A021910E5A9;
 Tue, 25 Mar 2025 16:13:43 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id x6u9t37x6tnYFx6uDtX3uZ; Tue, 25 Mar 2025 17:13:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1742919219;
 bh=crtO4nY030F+MQJ69+CW8A/eV1yW5fNaq8Gf3pToO9o=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=tiJFTH5YxHAUqpQqQSULkIZyMczsMpdCqTLCb7gsFW8wVvLkdi1kR8enq+hUe3bJY
 iXAxEn27OwmVubxPGT9f/olt6/Xu5RU3F1J3WrX2UbLqt4VnIrvWmN6dVe1WHhpApB
 rO7t7+jKlaQhUjetzWTI/t5cDovG8FcgGiO1tKyfTbP1IBle22KEXyNtxZ8O3C6Vqc
 iPCIcNvifh5jyKiV5OM7ItwjVEFD9D4vsvaRYVVzrw+ejuajkXLkOntpWeKwVv94B7
 u5zT7zp3n/X5B7/Rfmd8XES4bEovPSog3qixh96KO0vX3AkCVEo5n7uVsDE3GsYa9F
 71heKjyR9FgiA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Tue, 25 Mar 2025 17:13:39 +0100
X-ME-IP: 124.33.176.97
Message-ID: <58d6a3ba-4db9-4b17-a2ba-96d7f8b52e85@wanadoo.fr>
Date: Wed, 26 Mar 2025 01:13:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] bits: Fixed-type GENMASK_U*() and BIT_U*()
To: Yury Norov <yury.norov@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr>
 <Z-FsJPA1aq7KyTlm@thinkpad> <7e114fdb-0340-4a3c-956f-b26c9373041d@wanadoo.fr>
 <Z-LKapMBpMfJwcL7@thinkpad>
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
In-Reply-To: <Z-LKapMBpMfJwcL7@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 26/03/2025 at 00:23, Yury Norov wrote:
> On Tue, Mar 25, 2025 at 01:23:22AM +0900, Vincent Mailhol wrote:

(...)

> This series doesn't apply on 6.15-rc1 because test_bits.c has moved to
> lib/tests. Can you please rebase your v8 and submit? I see no other
> issues to merge it in bitmap-for-next.

git was smart enough to rebase everything automatically!

Here is the v8 (which includes the other few nitpicks from you and Andy):

https://lore.kernel.org/all/20250326-fixed-type-genmasks-v8-0-24afed16ca00@wanadoo.fr/

Do you also want me to rebase the other series which consolidates the
GENMASK(), GENMASK_ULL() and GENMASK_U128() now? Or should I wait a while?


Yours sincerely,
Vincent Mailhol

