Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D145DA78FA7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E5B10E7B9;
	Wed,  2 Apr 2025 13:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="pvpXpP2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E45C10E7B4;
 Wed,  2 Apr 2025 13:22:11 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZSQWg5MlTz9tlj;
 Wed,  2 Apr 2025 15:22:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1743600127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OEFLwQGV8kwA47pjDYZtqrNGxwn0fUtyTLovXFASnZY=;
 b=pvpXpP2CWYi/b2qBoNQyT/t1b17bM/N6dCp8pWV/WqddnSdT4E5XVIcslpY167Qow2aIf2
 iyhJih1UoO3bjEaGAx8qOyyO1bXJSPSZCkqCX/WHigzlqvkN3s6MLxOA8+fg1/7A3oKswS
 rM/G7yObM/24EwcaqWZ1lRUVgfHbxE6ca/jBB8Ia5QMG4wB3LzrRmEZgMs+zURoraAup6A
 smP7dN6Bm3bVc9DcfM8sjUuqj8uYc76ya+SRW8D2qW07Vu2pAvVir1sogLrIVafPb0DF+A
 K0vTJfYb4SGqvK/hKjntADh1Bf3qUc5OcJGYDzUZq46C704X5EQTxUAdmuknSA==
Message-ID: <3bdd9d9a-e019-4469-a90b-92d105c67427@mailbox.org>
Date: Wed, 2 Apr 2025 15:22:04 +0200
MIME-Version: 1.0
Subject: Re: [RFC v3 06/14] drm/sched: Implement RR via FIFO
To: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
 <20250331201705.60663-7-tvrtko.ursulin@igalia.com>
 <e4594adff1606e6a92714bbcad5838c3f100acdf.camel@mailbox.org>
 <264be6a0-b9be-4430-9de4-276456e34214@mailbox.org>
 <58b680faeeeea1c317b43a34c71d978efe72009d.camel@mailbox.org>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <58b680faeeeea1c317b43a34c71d978efe72009d.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 68983e1b8174621f439
X-MBO-RS-META: cymkjm6jm3ys9cua8dk68ycha8cy8xft
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

On 2025-04-02 14:00, Philipp Stanner wrote:
> On Wed, 2025-04-02 at 12:58 +0200, Michel Dänzer wrote:
>> On 2025-04-02 12:46, Philipp Stanner wrote:
>>> On Mon, 2025-03-31 at 21:16 +0100, Tvrtko Ursulin wrote:
>>>> Round-robin being the non-default policy and unclear how much it
>>>> is
>>>> used,
>>>> we can notice that it can be implemented using the FIFO data
>>>> structures if
>>>> we only invent a fake submit timestamp which is monotonically
>>>> increasing
>>>> inside drm_sched_rq instances.
>>>>
>>>> So instead of remembering which was the last entity the scheduler
>>>> worker
>>>> picked, we can bump the picked one to the bottom of the tree,
>>>> achieving
>>>> the same round-robin behaviour.
>>>>
>>>> Advantage is that we can consolidate to a single code path and
>>>> remove
>>>> a
>>>> bunch of code. Downside is round-robin mode now needs to lock on
>>>> the
>>>> job
>>>> pop path but that should not be visible.
>>>
>>> Why did you decide to do it that way and then later remove RR &
>>> FIFO
>>> alltogether in patch 10, basically?
>>>
>>> I think the far cleaner way for our development-process would be a
>>> separate patch(-series) that *removes* RR completely. Advantages
>>> are:
>>>
>>>    1. It should be relatively easy to do
>>>    2. It would simplify the existing code base independently of
>>> what
>>>       happens with your RFC series here
>>>    3. Before changing everyone's scheduling policy to a completely
>>> new,
>>>       deadline-based one, we could first be sure for a few release
>>>       cycles that everyone is now on FIFO, establishing common
>>> ground.
>>>    4. We could CC every- and anyone who might use RR or might know
>>>       someone who does
>>>    5. If it turns out we screwed up and someone really relies on
>>> RR, it
>>>       would be easy to revert.
>>>
>>> I am not aware of any RR users and have, in past discussions, never
>>> heard of any. So removing it is more tempting for the above
>>> reasons.
>>
>> https://gitlab.freedesktop.org/drm/amd/-/issues/2516 has a bunch of
>> RR users...
> 
> Right, there's a number of people complaining about the regression. But
> what I'm interested in is: how did it evolve since then. Are there
> distributions who set the module parameter? Does Steam do it? Or is it
> individual users who work around the problem that way?

I know only of the latter.


> https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2679509
> 
> ^ this comment for example seems to indicate that on newer Wayland
> versions part of the problem has vanished?

That's about using the Wine wayland driver (which uses the Wayland protocol directly) instead of the x11 driver (which uses the X11 protocol via Xwayland). Xwayland not being involved can avoid at least some of the issues (in particular, the scenario I described in https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2119750 can't happen then). That doesn't solve the issues when Xwayland is involved though, just avoids them.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
