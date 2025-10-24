Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4E2C06AA3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 16:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F5A10E1F9;
	Fri, 24 Oct 2025 14:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pL0WT0KQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A968010E1F9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 14:17:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5F9354540E;
 Fri, 24 Oct 2025 14:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD95EC4CEF1;
 Fri, 24 Oct 2025 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761315454;
 bh=Ydi1aT2dMr4B5BaKBUc3yFTYNIR0YpQPCQqOfvnwZZg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pL0WT0KQo50WPj8SmgBn6sUVWhguKk2oWlfuNRLomYbA47LmbgyLEx8eom9k/xRKp
 19sET7pT3zwwAE6067SZ404DXcO9JKgRqw5oUpj2h4kzj4zzNZs7K9ECaP6+1h1hNI
 dfBymU2ODF9fRw1hxmNh7kXUyHnC736BCTOFjGsxcCaDvnU9JhR4z8huHtUGYf/ePo
 qJD5dotMsgwc7ytv9Z7q2438AnsB5LDd9L56QinK1e1T6zVJWVXYkgJv0RNOJr5ac+
 a9zY7mBB6Cu8Q+4dZFrYrLalbVWx9VDg6q79l8GKyfSC1+sCMwX5ZRKkMzbLMef9Qk
 1JBMdwq4LeRtw==
Message-ID: <b21ba8b4-a31f-44e5-a2da-ba585a93d3a6@kernel.org>
Date: Fri, 24 Oct 2025 16:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
 <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
 <89812f66-25a6-4f9e-aa4f-74adbf116db8@kernel.org>
 <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
 <8cba66d2-9608-4a5c-a2af-6cc91f46a49f@kernel.org>
 <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <cefe8f07-68a3-4c93-ae46-ebb01ff6fa2c@igalia.com>
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

On 10/24/25 3:37 PM, Tvrtko Ursulin wrote:
> Good to know. I am coming from the angle that netiquette, at least in the olden
> days, used to be that when you join an established thread you don't trim too
> much of the context. For the benefit of people joining the thread at that very
> point, especially when re-raising an argument which has already been discussed.

I see it the opposite way, leaving too much context wastes people's time
searching for the actual reply, see also [1].

If someone wants the full context, previously sent mails are always available.

[1] https://subspace.kernel.org/etiquette.html#trim-your-quotes-when-replying

>> Now, you can argue that you mean "driver has been detached from the fence",
>> which means something along the lines of "the driver has no business with the
>> fence anymore", but this is not what people think of when they read
>> "detached-driver".Okay people. :)

Not a big deal, but for you to note: Quite some of your replies I've received
recently add text to the quoted parts, in this case the "Okay people. :)".

> How about "unknown-driver", would that satisfy you?

Honestly, the most accurate thing to say would be "fence-signaled", because
that's the actual condition which causes the change.
