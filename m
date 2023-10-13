Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8BE7C82EB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 12:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0761410E0C8;
	Fri, 13 Oct 2023 10:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF0910E5D4
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 10:22:57 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4S6Myk33b1z9st0;
 Fri, 13 Oct 2023 12:22:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1697192574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+7Fm0Kv6UOgaMzCusyoEOSULpE/m8KVT7FMKs/BR0Ys=;
 b=FOmtRxf37zr6oKHfmsEO/FKw2bEELABW08wdh6XA9SCVo/VljS9JclP8pjgT3cg6t2zzT2
 FyhzbeMhYlCCXru4h08eaLWwW7jXAGc/ZX3pnMsOa1a6/uwZDeusf0oKvPwnD3FIAbCqy6
 ahwgxBEW1t4DwgyFWY4M99Tr8gHAkhUXJDDrDlsSfCYPzfgg0Diu3EqGM00HBsFsw0nL28
 OqRiGv/I/T36JWjxWjGBVlHGdwAoO37I/K8VnC4kLKZ85zztiuHyFVrA1YKuRpKId09CKX
 qICKQ0Jyb9bD2vIXz2w8PEHZ/twI/rveXOyht5/ArEYQL/7Qufw3MZuJCBvgKg==
Message-ID: <a4a5dc87-001b-2948-e74f-8c51d170b9b2@mailbox.org>
Date: Fri, 13 Oct 2023 12:22:52 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-CA
To: Daniel Vetter <daniel@ffwll.ch>, Ray Strode <halfline@gmail.com>
References: <20230926170549.2589045-1-halfline@gmail.com>
 <ZR6IlVR-A5KtIHEU@phenom.ffwll.local>
 <CAA_UwzL=2PjeH_qW2GJa_XzJCeWkz9NcokPQX3-qn2f0iPz+Rw@mail.gmail.com>
 <90e7f66f-96bf-4e90-88c8-75019bc506a4@amd.com>
 <CAA_UwzJ7q8aq_iw3wimeQXmvKp8Z253J7oqi3UQqcKdkRmAcAA@mail.gmail.com>
 <9f9b50fa-8bad-4e96-ac60-21c48f473fc6@amd.com> <ZSPv1iAwJMgnsDu3@intel.com>
 <dc0c733e-df75-42f8-a920-cca8eebfa0dc@amd.com>
 <ZSU4aGnYsqUvz1ry@phenom.ffwll.local>
 <CAA_UwzJF3Smi_JSQ4S3B1kG23MEXppVfm0Sc1ftVktaoumymuA@mail.gmail.com>
 <ZSkQxEL4596_pQW1@phenom.ffwll.local>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <ZSkQxEL4596_pQW1@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tqxdmjbcipo9sxqoxiws34jyfjamy379
X-MBO-RS-ID: 0a43f868be203d7b721
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
Cc: daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/23 11:41, Daniel Vetter wrote:
> On Thu, Oct 12, 2023 at 02:19:41PM -0400, Ray Strode wrote:
>> On Mon, Oct 09, 2023 at 02:36:17PM +0200, Christian König wrote:
>>>>>> To be clear, my take is, if driver code is running in process context
>>>>>> and needs to wait for periods of time on the order of or in excess of
>>>>>> a typical process time slice it should be sleeping during the waiting.
>>>>>> If the operation is at a point where it can be cancelled without side
>>>>>> effects, the sleeping should be INTERRUPTIBLE. If it's past the point
>>>>>> of no return, sleeping should be UNINTERRUPTIBLE. At no point, in my
>>>>>> opinion, should kernel code busy block a typical process for dozens of
>>>>>> milliseconds while keeping the process RUNNING. I don't think this is
>>>>>> a controversial take.
>>>>> Exactly that's what I completely disagree on.
>>
>> Okay if we can't agree that it's not okay for user space (or the
>> kernel running in the context of user space) to busy loop a cpu core
>> at 100% utilization throughout and beyond the process's entire
>> scheduled time slice then we really are at an impasse. I gotta say i'm
>> astonished that this seemingly indefensible behavior is somehow a
>> point of contention, but I'm not going to keep arguing about it beyond
>> this email.
>>
>> I mean we're not talking about scientific computing, or code
>> compilation, or seti@home. We're talking about nearly the equivalent
>> of `while (1) __asm__ ("nop");`
> 
> I don't think anyone said this shouldn't be fixed or improved.
> 
> What I'm saying is that the atomic ioctl is not going to make guarantees
> that it will not take up to much cpu time (for some extremely vague value
> of "too much") to the point that userspace can configure it's compositor
> in a way that it _will_ get killed if we _ever_ violate this rule.
> 
> We should of course try to do as good as job as possible, but that's not
> what you're asking for. You're asking for a hard real-time guarantee with
> the implication if we ever break it, it's a regression, and the kernel has
> to bend over backwards with tricks like in your patch to make it work.

I don't think mutter really needs or wants such a hard real-time guarantee. What it needs is a fighting chance to react before the kernel kills its process.

The intended mechanism for this is SIGXCPU, but that can't work if the kernel is stuck in a busy-loop. Ray's patch seems like one way to avoid that.

That said, as long as SIGXCPU can work as intended with the non-blocking commits mutter uses for everything except modesets, mutter's workaround of dropping RT priority for the blocking commits seems acceptable for the time being.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

