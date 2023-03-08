Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038D96B125F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 20:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD18510E6F7;
	Wed,  8 Mar 2023 19:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6891010E6F4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 19:46:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id C4A4842037;
 Wed,  8 Mar 2023 19:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678304766;
 bh=371amrNIWdOrt1eX/rE/8QZd18kWMNJmNXDp2QdVSbs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=yGK2eXhVMDT3UcH3lltkf8vpz7BK33d21ZigE2QwncNn4koTKZf90jqyk41sFXyp/
 hCVYoec52IPuKLTdg8ImtH/hjN/ym4zWtZt5fw9ikDSLCKIEi3jIsdirbn7zRpIYwI
 sRiJ+y91O7fPhmVFFdjjSKo4af7KCCYZGexuOnmdFwyKkK5dcFL2tFdMT4pgAZpsUo
 sUt7oqPOFJNSbrS1U4HsWxouSmgeKt9R9dRHvlxLiJ0/pnfBoBUFfNbVrAANhAlqxF
 Kl7eIy+TonptlKOSkRhyAh9k4oVsIxOYVYCF56uABdqu2Tlpg4EAXwcIjXkxB8mkux
 H9MLMH0cWml/Q==
Message-ID: <9c3dc2ad-11e4-6004-7230-8ca752e3d9f7@asahilina.net>
Date: Thu, 9 Mar 2023 04:45:58 +0900
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
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <d1fccceb-ca77-f653-17fc-63168e0da884@amd.com>
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

On 09/03/2023 04.12, Christian König wrote:
> Am 08.03.23 um 20:05 schrieb Asahi Lina:
>> [SNIP]
>>> Well it's not the better way, it's the only way that works.
>>>
>>> I have to admit that my bet on your intentions was wrong, but even that
>>> use case doesn't work correctly.
>>>
>>> See when your callback returns false it is perfectly possible that all
>>> hw fences are signaled between returning that information and processing it.
>>>
>>> The result would be that the scheduler goes to sleep and never wakes up
>>> again.
>> That can't happen, because it will just go into another iteration of the
>> drm_sched main loop since there is an entity available still.
>>
>> Rather there is probably the opposite bug in this patch: the can_run_job
>> logic should be moved into the wait_event_interruptible() condition
>> check, otherwise I think it can end up busy-looping since the condition
>> itself can be true even when the can_run_job check blocks it.
>>
>> But there is no risk of it going to sleep and never waking up because
>> job completions will wake up the waitqueue by definition, and that
>> happens after the driver-side queues are popped. If this problem could
>> happen, then the existing hw_submission_limit logic would be broken in
>> the same way. It is logically equivalent in how it works.
>>
>> Basically, if properly done in wait_event_interruptible, it is exactly
>> the logic of that macro that prevents this race condition and makes
>> everything work at all. Without it, drm_sched would be completely broken.
>>
>>> As I said we exercised those ideas before and yes this approach here
>>> came up before as well and no it doesn't work.
>> It can never deadlock with this patch as it stands (though it could busy
>> loop), and if properly moved into the wait_event_interruptible(), it
>> would also never busy loop and work entirely as intended. The actual API
>> change is sound.
>>
>> I don't know why you're trying so hard to convince everyone that this
>> approach is fundamentally broken... It might be a bad idea for other
>> reasons, it might encourage incorrect usage, it might not be the best
>> option, there are plenty of arguments you can make... but you just keep
>> trying to make an argument that it just can't work at all for some
>> reason. Why? I already said I'm happy dropping it in favor of the fences...
> 
> Well because it is broken.
> 
> When you move the check into the wait_event_interruptible condition then 
> who is going to call wait_event_interruptible when the condition changes?

I think you mean wake_up_interruptible(). That would be
drm_sched_job_done(), on the fence callback when a job completes, which
as I keep saying is the same logic used for
hw_rq_count/hw_submission_limit tracking.

Please think about it for a second, it's really not that complicated to
see why it works:

- Driver pops off completed commands <-- can_run_job condition satisfied
- Driver signals fence
 - drm_sched_job_done_cb()
  - drm_sched_job_done()
   - atomic_dec(&sched->hw_rq_count); <-- hw_submission_limit satisfied
   - ...
   - wake_up_interruptible(&sched->wake_up_worker);
      ^- happens after both conditions are potentially satisfied

It really is completely equivalent to just making the hw_rq_count logic
customizable by the driver. The actual flow is the same. As long as the
driver guarantees it satisfies the can_run_job() condition before
signaling the completion fence that triggered that change, it works fine.

> As I said this idea came up before and was rejected multiple times.

Maybe it was a different idea, or maybe it was rejected for other
reasons, or maybe it was wrongly rejected for being broken when it isn't ^^

~~ Lina
