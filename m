Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEA6A6DFF3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D322110E49B;
	Mon, 24 Mar 2025 16:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="plw1bbqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-69.smtpout.orange.fr [193.252.22.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C8A10E49B;
 Mon, 24 Mar 2025 16:39:44 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id wkphtqyvuqGhjwkpntp5DD; Mon, 24 Mar 2025 17:39:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1742834382;
 bh=fWDg5sAJRa5yGnJsUjCGug0MakuT+w++shbZerB1ON4=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=plw1bbqE0z5rfrjQQw+4DOFlYoe4aXV3HOaYnSLm4RqTOwzMgwQKESyqhPy7pOEzI
 RzgjMUqxC8ZfAHGz5LF9ADf/97gKqsFaQHLOpeDQdBoj4wEjt64flQbW5nouKULz4h
 93zAhY4igdCOqZ4ALMnPyRm7wTEm2NxGiFBIckIwP30Sw8w6NISDz4h2kjuJfSikGp
 jxqoEh4a/Cd8GSM30qRtkSdvYka3Cbow7j8N4sYl43NVW1kqgfg5H+HN8Fna2ogrA1
 KA7ghA72CgLM2GpLM8NRIsgQ88QLvJBI8rk4/9xmMj4RW6KI9x4skpd9321SXaLNBp
 ozWdbaJ0vBkRQ==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 24 Mar 2025 17:39:42 +0100
X-ME-IP: 124.33.176.97
Message-ID: <1f9ea3e3-e348-46d7-9b15-8c017762b12f@wanadoo.fr>
Date: Tue, 25 Mar 2025 01:39:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
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
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250322-consolidate-genmask-v1-0-54bfd36c5643@wanadoo.fr>
 <Z-GEFcciqCwxL88W@thinkpad>
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
In-Reply-To: <Z-GEFcciqCwxL88W@thinkpad>
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

On 25/03/2025 at 01:11, Yury Norov wrote:
> + Anshuman Khandual, Catalin Marinas, linux-arm-kernel@lists.infradead.org
> 
> This series moves GENMASK_U128 out of uapi. ARM is the only proposed
> user. Add ARM people for visibility.

Actually, not yet. Here, I am decoupling GENMASK_U128() from
__GENMASK_U128(), but I did not touch the uapi.

After this series, __GENMASK_U128() is not used anymore in the kernel,
but I am not brave enough to remove it myself because there is always a
risk that some userland code somewhere is relying on it…

(...)

Yours sincerely,
Vincent Mailhol

