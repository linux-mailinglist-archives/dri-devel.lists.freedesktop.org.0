Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A796B105E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 18:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8830510E6C9;
	Wed,  8 Mar 2023 17:44:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8CB10E6C9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 17:44:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id DAE6041DF4;
 Wed,  8 Mar 2023 17:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678297490;
 bh=fhXB/EYYX9j8qxFHx1ZRx8caCPXojBAtmHMmCPfk7/c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=D8uQBUHl406auUb4dgJPw/yDLp3vQCmgE9+0F5HY1bdli22kwGEGbT4SkxZaMNooS
 ZpLzFCm5pCeALq5rxsxhI4v/XdIR1ZIGHaoDM2on86t0B9wBOopKdlyvAKXzprhS1Q
 HodEPkB7neoFcykRt8Qd+kTERz10lzWtJSVHUoZlnUMVdhM2VjGNIUyhjs+QJEeUlD
 82GrtZJ1mTeafPZkk97TBy0XztQZgjtu7wJdGgymG56KQpHZaU3s8kttKkfv2r/3tu
 fklvJcKvD3EPQlvr9EIXkAT2GCYbGzlBHVw+mNPPPjTXLJMtoNWs2qVp2wEluvsT+a
 5dBzDRJfxskDQ==
Message-ID: <c82660f4-e2d0-35ca-304a-57d1abcf814d@asahilina.net>
Date: Thu, 9 Mar 2023 02:44:42 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
Content-Language: en-US
To: alyssa@rosenzweig.io, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=c3=b6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
References: <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
 <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
 <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
 <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
 <8e93126cfaf47ebad0dc70e038ccc92f@rosenzweig.io>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <8e93126cfaf47ebad0dc70e038ccc92f@rosenzweig.io>
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>, asahi@lists.linux.dev,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 02.39, alyssa@rosenzweig.io wrote:
>> You can't ask me for a list
>> of pending jobs (the scheduler knows this, it doesn't make any sense to
>> duplicate that outside)
> 
> Silly question: could you add a new exported function to drm_sched to get the list of pending jobs, to be used by the Rust abstraction internally? IDK if that makes any sense.

The drm_sched struct is public, we could just go in there and do it
anyway... but then I need to figure out how to do
`list_for_each_entry_safe` in Rust and this all makes very little sense
when it's clearly the scheduler's job to provide some form of cleanup
function users can use to do it...

I mean, I guess I can do that if Christian is adamantly against
providing a safe C API, but it's clearly not the right solution and I
hope this is not the approach maintainers take with Rust abstractions,
because that's going to make our lives a lot harder for no good reason,
and it also means C users don't get any of the benefits of Rust
abstraction work if the APIs can't be improved at all along with it.

~~ Lina
