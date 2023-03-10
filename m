Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E436B3B82
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 10:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E8210E9BA;
	Fri, 10 Mar 2023 09:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FE110E9BA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 09:58:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 6FBC441A42;
 Fri, 10 Mar 2023 09:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678442307;
 bh=LtN6uEnQFoBBfW+UmMREhhL0TvAkXsTHFcube89Rcuw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=CSsTogLbJ3+SxBlBKcTuPYgblHdktTZu1HtKPXoPnaBU+cKpuTN10fypVp6me00ef
 eNGwg2sMWRri3vEnU4E0ykBDd9sXMphBoUWkPxumA6xtcEYE9niya2+7j6JjiJ4Y2s
 9rxT78EC45uAbC5SXf291ZnB7QuIb8wICC+yup3fbFtMSxmvCEgRQwws/qsoHQ6MnX
 ZJAXAXwYg+QQ9hcc2WILdf9BUVfaKDlXPGERhlbAABogVm/qXIDOIXMqqHKTzeVEs3
 poikebzHhh6jfA+hrZJi0cvL1GX8ZfXtdRx3T18CW0etJh7KIHy43te+QOsiDojZrG
 SbvEOhWTqUk6A==
Message-ID: <25349030-5cc6-90a2-f1d2-4f9a67c4f194@asahilina.net>
Date: Fri, 10 Mar 2023 18:58:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RFC 11/18] drm/scheduler: Clean up jobs when the scheduler
 is torn down
Content-Language: en-US
To: Faith Ekstrand <faith.ekstrand@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
 <20230307-rust-drm-v1-11-917ff5bc80a8@asahilina.net>
 <bbd7c5ee-c2f0-3e19-757d-a9aff1a26d3d@linux.intel.com>
 <585fa052-4eff-940e-b307-2415c315686a@amd.com>
 <3320e497-09c0-6eb6-84c5-bab2e63f28ec@asahilina.net>
 <7b39ef96-3ec5-c492-6e1b-bf065b7c90a2@amd.com>
 <0f14c1ae-0c39-106c-9563-7c1c672154c0@asahilina.net>
 <e18500b5-21a0-77fd-8434-86258cefce5a@amd.com>
 <8696d00a-c642-b080-c19a-b0e619e4b585@asahilina.net>
 <5f0814a3-4be3-a609-d3b3-dd51a4f459a1@amd.com>
 <9403e89d-a78f-8abd-2869-20da23d89475@asahilina.net>
 <777dea65ef81c402d0765b1244b40633c483f4b2.camel@collabora.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <777dea65ef81c402d0765b1244b40633c483f4b2.camel@collabora.com>
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
 Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>, asahi@lists.linux.dev,
 linux-sgx@vger.kernel.org, Ella Stanforth <ella@iglunix.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/03/2023 04.59, Faith Ekstrand wrote:
> On Thu, 2023-03-09 at 18:43 +0900, Asahi Lina wrote:
>> On 09/03/2023 17.42, Christian König wrote:
>>> Long story short: Don't do this! This is what the Windows drivers
>>> have 
>>> been doing and it creates tons of problems.
> 
> Yeah, we tried to do a bit of that in the GL days.  It was a bad idea.

I think I should clarify: I was proposing re-queueing innocent jobs from
innocent queues/VMs that were impacted by a fault. The reason is that we
may be able to tweak firmware state to force it to do that safely,
during the firmware recovery cycle, such that an aborted job restarts
and then subsequent jobs/commands continue as normal. We can't leave it
to userspace because if we do nothing, the affected job ends up
incomplete but then everything after it that is already queued still
runs, and that is definitely a recipe for a bigger mess if userspace
wants to seamlessly recover. The firmware recovery cycle is a
"stop-the-world" situation for the GPU (the firmware literally
busy-loops waiting for the driver to set a continue flag in memory...),
so that's the only real chance that the driver gets to make decisions
about what is going to happen next.

Of course, that only works if individual possibly concurrently running
commands are idempotent, but I think a lot of typical GPU work is? (E.g.
any render pass without side effects other than the render targets and
where the background shader does no loads, or even render passes that do
loads but where all draws are opaque, which are all things the current
Gallium driver is intimately familiar with since Crazy Tiler
Optimizations™ need that info to be provided anyway). So I was wondering
whether it'd make sense to have such an idempotency/restartable flag on
job submission, and then the driver would do its best to recover and
rerun it if it gets killed by an unrelated concurrent bad job.

Then again this all depends on an investigation into what we *can* do
during firmware recovery that hasn't happened at all yet. It might be
that it isn't safe to do anything really, or that doing things depends
on touching even deeper firmware state structs that we treat as opaque
right now and we really don't want to have to touch...

But maybe none of this is worth it in practice, it just sounded like it
could be useful maybe?

Now that I look at it, we have a lovely "what is this flag doing anyway"
bit already passed from Mesa through to the firmware we called
ASAHI_RENDER_SET_WHEN_RELOADING_Z_OR_S which, now that I look at it, is
actually getting set when any attachment (any color, Z, S) is not being
cleared for that pass (so it's loaded). That could very well be an "is
not idempotent" flag... and maybe that means the firmware does this for
us already? Sounds like something to test... I might have some 16Kx16K
GLmark runs to do concurrent with an evil faulting job now ^^ (and then
that also means we need to set it when shaders have side effects and
stuff, which right now we don't).

>>> Just signal the problem back to userspace and let the user space
>>> driver 
>>> decide what to do.
>>>
>>> The background is that most graphics applications (games etc..)
>>> then 
>>> rather start on the next frame instead of submitting the current
>>> one 
>>> again while compute applications make sure that the abort and tell
>>> the 
>>> user that the calculations might be corrupted and need to be
>>> redone.
> 
> The guarantee that Vulkan makes is that, if you idle the GPU and you
> haven't gotten a DEVICE_LOST yet, your data is good.  If you get a
> DEVICE_LOST, all bets are off.  The problem is that, no matter how fast
> the error propagation may be in the kernel or userspace driver, errors
> can still show up in strange ways.  An OOB buffer access could end up
> modifying a shader binary which gets run 3 frames later and causes a
> corruption.  Once you've faulted, you really have no idea how far back
> is good or what memory is corrupted.  You have to assume that
> everything mapped to the GPU VA space is potentially toast.

Yes of course, for the actually faulting VM all bets are off after a
fault (though we can try a bit harder at least... I have a READ_ONLY BO
flag now, I should set it on the shader pools!).

>> Actually I wanted to ask about error notifications. Right now we have
>> an
>> out-of-band mechanism to provide detailed fault info to userspace
>> which
>> works fine, but in principle it's optional.
> 
> This is fine, in principal.  Because of the nature of errors, async is
> fine as long as the error shows up eventually.  Faster is better, for
> sure, but error latency doesn't really matter in practice.
> 
>> However, I also mark the hw
>>  fences as errored when a fault happens (with an errno that describes
>> the overall situation), but that never makes it into the drm_sched
>> job
>> complete fence. I looked at the drm_sched code and I didn't see any
>> error propagation. Is that supposed to work, or am I supposed to
>> directly mark the drm_sched side fence as complete, or did I
>> misunderstand all this? I get the feeling maybe existing drivers just
>> rely on the recovery/timeout/etc paths to mark jobs as errored (since
>> those do it explicitly) and never need error forwarding from the hw
>> fence?
> 
> The end behavior needs to be that all fences for all jobs submitted to
> the queue get signaled.  That's needed to satisfy the finite time
> guarantees of dma_fence.  Exactly how that happens (let the job run,
> abort all the jobs, etc.) is an implementation detail for the driver to
> decide.  If you want, you can also set a bit on the context (or queue)
> to mark it as dead and start returning EIO or similar from any ioctls
> trying to submit more work if you wanted.  Not required but you can.

Fences have an error flag though, does that get reported to userspace
somehow? I thought it did, but maybe not, or maybe only drm_sched not
propagating it is the issue?

In other words, absent my fancy stats reporting BO system, what is the
normal way that an explicit sync driver signals to userspace that the
job associated with a syncobj has failed?

(If there is no way, then I'll probably want to change the stats BO
system to be configurable, so if you ask for no stats/time info, you
only get overall job status and faults, which has less overhead.)

~~ Lina
