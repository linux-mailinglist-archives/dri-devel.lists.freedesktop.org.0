Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A856A6B1B89
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 07:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA81610E7AA;
	Thu,  9 Mar 2023 06:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD9810E7AA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 06:30:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 346EA42037;
 Thu,  9 Mar 2023 06:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678343426;
 bh=/hhFWpC+hto8GAX0pJh+P6OQkNm/8ab+JjGGIX4mhlg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=P6/7ZSEeWqAst+e/b9Q/j9CQZQ/8ZVEuqr7EW67BxjeMhzgYAVhb4Lqg2rGGw6mMN
 K7gyGOyxcEa8LvgGCcfexFaGyA7NDqDRv5eqrCHYT0dosQP1+bQzr+vP++WmmQq/6A
 3h70p1rPUjAoUog3DU7vldubJmJNBoMg16jPo3ft9xgaQ1DrcAiKF1gdnxpzmvafCw
 BYr6a2c9/eo8t/Rj5u8+VJnAggjM4/RxHoRfhH9vTwfbYazvHAA+qEEPPh5fUmNuob
 ul2RrpYuijhMUjrlwH6W44l0HYbiVNcAohS/tkdvPlupsDS10YITpFEENn0d2DFDk5
 ZQ+n7HgLXEaEA==
Message-ID: <3e5e0120-50fd-51c0-d817-5b1dc4c14e97@asahilina.net>
Date: Thu, 9 Mar 2023 15:30:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 10/18] drm/scheduler: Add can_run_job callback
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
 <20230307-rust-drm-v1-10-917ff5bc80a8@asahilina.net>
 <cd788ccf-0cf1-85d5-1bf8-efc259bd7e11@amd.com>
 <a075d886-0820-b6fb-fcd0-45bfdc75e37d@asahilina.net>
 <2b1060e9-86ba-7e16-14f1-5b5fa63de719@amd.com>
 <9f76bb68-b462-b138-d0ad-d27c972530d4@asahilina.net>
 <a39c6b40-f190-002d-ae1c-8b58c6442df2@amd.com>
 <4bbfc1a3-cfc3-87f4-897b-b6637bac3bd0@asahilina.net>
 <b0aa78b2-b432-200a-8953-a80c462fa6ee@amd.com>
 <c0624252-070e-bd44-2116-93a1d63a1359@asahilina.net>
 <d1fccceb-ca77-f653-17fc-63168e0da884@amd.com>
 <9c3dc2ad-11e4-6004-7230-8ca752e3d9f7@asahilina.net>
 <d544748c-8a2b-7c08-f199-182a56af22be@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <d544748c-8a2b-7c08-f199-182a56af22be@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mary <mary@mary.zone>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2023 05.14, Christian König wrote:
>> I think you mean wake_up_interruptible(). That would be
>> drm_sched_job_done(), on the fence callback when a job completes, which
>> as I keep saying is the same logic used for
>> hw_rq_count/hw_submission_limit tracking.
> 
> As the documentation to wait_event says:
> 
>   * wake_up() has to be called after changing any variable that could
>   * change the result of the wait condition.
> 
> So what you essentially try to do here is to skip that and say 
> drm_sched_job_done() would call that anyway, but when you read any 
> variable to determine that state then as far as I can see nothing is 
> guarantying that order.

The driver needs to guarantee that any changes to that state precede a
job completion fence signal of course, that's the entire idea of the
API. It's supposed to represent a check for per-scheduler (or more
specific, but not more global) resources that are released on job
completion. Of course if you misuse the API you could cause a problem,
but what I'm trying to say is that the API as designed and when used as
intended does work properly.

Put another way: job completions always need to cause the sched main
loop to run an iteration anyway (otherwise we wouldn't make forward
progress), and job completions are exactly the signal that the
can_run_job() condition may have changed.

> The only other possibility how you could use the callback correctly 
> would be to call drm_fence_is_signaled() to query the state of your hw 
> submission from the same fence which is then signaled. But then the 
> question is once more why you don't give that fence directly to the 
> scheduler?

But the driver is supposed to guarantee that the ordering is always 1.
resources freed, 2. fence signaled. So you don't need to check for the
fence, you can just check for the resource state. If the callback
returns false then by definition the fence wasn't yet signaled at some
point during its execution (because the resources weren't yet freed),
and since it would be in the wait_event_interruptible() check path, by
definition the fence signaling at any point during or after the check
would cause the thread to wake up again and re-check.

Thread 1                                          Thread 2
1. wait_event_interruptible() arms wq             1. Free resources
2. can_run_job() checks resources                 2. Signal fence
3. wait_event_interruptible() sleeps on wq        3. Fence wakes up wq
4. loop

There is no possible interleaving of those sequences that leads to a
lost event and the thread not waking up:
- If T2.3 happens before T1.1, that means T2.1 happened earlier and T1.2
must return true.
- If T2.3 happens after T1.1 but before T1.3, the wq code will ensure
the wq does not sleep (or immediately wakes up) at T1.3 since it was
signaled during the condition check, after the wq was armed. At the next
check loop, T1.2 will then return true, since T2.1 already happened
before T2.3.
- If T2.3 happens during T1.3, the wq wakes up normally and does another
check, and at that point T1.2 returns true.

QED.

~~ Lina
