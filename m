Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5937EB0C73C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E757210E086;
	Mon, 21 Jul 2025 15:06:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sT1wn+w2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5ECC10E086
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 15:06:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B4E695C6099;
 Mon, 21 Jul 2025 15:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89810C4CEED;
 Mon, 21 Jul 2025 15:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753110370;
 bh=3ZDzpHnQOUHziQ8M+YM8Ui/PJs0MPtGKOTMPlp8JC1U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sT1wn+w2ElytKnMVfe1xQ19z72ib/caz9V67ui9JPKNQbtpF33AO7coGOYT05M/3c
 Rhv16CTZeWBkncSB7mCIJoT56KLNipkmARkToIvbKC6i14oYdZvFAfgUgh4Jg9akZh
 AexN+DKakfq2RhIOIzJdLMsec5m2epEA7U8t3Evl6i58zX6I6/4BXdyHBgDGpoJG9K
 gBV5ADzxQWraf4+Eu+u/gxjjgfZtJaqMK8uTSEsVQDF84Ch+tgac7dC0RP0CGcKRPV
 ChJt+PUrdGMDB3m5PLzFfnYgau1ur55oEdGMl175ef+ZxVHC1r7pw1gVQJzJ3dsN9P
 qA0AJ4oUTmftQ==
Message-ID: <f71d7815-f478-4930-bc8e-cb5a412062ad@kernel.org>
Date: Mon, 21 Jul 2025 17:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl arguments
To: Alice Ryhl <aliceryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>, daniel.almeida@collabora.com
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
 lyude@redhat.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250626162313.2755584-1-beata.michalska@arm.com>
 <aH5U2Jm6Jpf5LyB9@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <aH5U2Jm6Jpf5LyB9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 7/21/25 4:55 PM, Alice Ryhl wrote:
> On Thu, Jun 26, 2025 at 06:23:13PM +0200, Beata Michalska wrote:
>> With the Opaque<T>, the expectations are that Rust should not
>> make any assumptions on the layout or invariants of the wrapped
>> C types. That runs rather counter to ioctl arguments, which must
>> adhere to certain data-layout constraints. By using Opaque<T>,
>> ioctl handlers are forced to use unsafe code where none is actually
>> needed. This adds needless complexity and maintenance overhead,
>> brining no safety benefits.
>> Drop the use of Opaque for ioctl arguments as that is not the best
>> fit here.
>>
>> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> 
> I'm guessing this should go through the DRM tree?
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Yeah, I can pick it up, but it won't be considered for the upcoming merge window
anymore, but for the next. After -rc6 drm-misc is in feature freeze and I also
already send the PR for Nova.

Daniel, Beata: Is there a reason you need this earlier?
