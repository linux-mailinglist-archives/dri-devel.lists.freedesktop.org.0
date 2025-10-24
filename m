Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EB9C066BD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 15:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9429E10EA7F;
	Fri, 24 Oct 2025 13:13:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dd7+s8Cv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EFD10EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 13:13:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 50BC160549;
 Fri, 24 Oct 2025 13:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5664AC4CEF1;
 Fri, 24 Oct 2025 13:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761311623;
 bh=SWAb6pqCtfM8mITOfpQz1UmNMlpz6ASkBTr/7697xSs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dd7+s8CvPPkqyKtNvHl6g3gkiZvEHmPdXyYjDbbWJOsRJkSy2uyNykASGhn/bp+P2
 lcsA2QR4HT3IGE2s66R/+wlgXP+7Kmh+sAuv/S09AdMza7aSLQngTBmsCWKiZ3dwLH
 y5KTlk92oilF6esGoFhbjlLB5IBbbKNPQecky4aLk6gQcxuuPbBSmbarIGxsC/80/e
 zXU2RFm1BffNVBwTf358mgLwbuEleBgtBCcHyJlWgoTiWvPbrDKCQbgR7sTGP55P3x
 zVLe21CMmJZG4VjYYeLb/U/svwJZ58cpjaX3Cl59QXHjDre7BayaCV/EoftB5zrdDe
 54KQipHXx3oOQ==
Message-ID: <8cba66d2-9608-4a5c-a2af-6cc91f46a49f@kernel.org>
Date: Fri, 24 Oct 2025 15:13:39 +0200
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
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <5640fbf1-7b8d-4537-9f1a-b401a7a4934b@igalia.com>
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

On 10/24/25 2:40 PM, Tvrtko Ursulin wrote:
> You trim too much of the quote making it unclear if you read the whole story.

I'm well aware of the context.
> If the driver isn't detached from the signalled fence then it is vulnerable to
> use after free.
When someone just reads "detached-driver" is creates the impression that the
driver is unbound from its device, since this is what this term is usually used for.

(And this is even the case you want to protect against, i.e. the string behind
the pointer returned by get_driver_name() has been freed.)

However, the condition that has changed when you print "driver-detached" is that
the fence has been signaled, independent of whether the driver has been detached
from the device.

Now, you can argue that you mean "driver has been detached from the fence",
which means something along the lines of "the driver has no business with the
fence anymore", but this is not what people think of when they read
"detached-driver".
