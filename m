Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B255BD3C426
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 10:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A66710E5A4;
	Tue, 20 Jan 2026 09:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FzvkvTJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFEF10E5A3;
 Tue, 20 Jan 2026 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8qNj/Nnvyivr9EuRGcKz3wI3QHvS+TPp2PlLgCyIQ2Q=; b=FzvkvTJh9J9Xzr1pOVOTJdyjbe
 eV5aRW2ZheeVR4a1v47VZff3kFCEG4WPHBXmesl4pldQXbtLrmMfWUCoO1jfIkhyckHdcn//JuQQr
 Opu9lW2/UnQ57wVrNP3K58hXN26p7/U4WDGMYA6j/YNhHQGYmDupr8fcwMThM2IPa+SzmthLhWQ2f
 0cEy9VubkIiXRYUBqNvDkRF3t3xj/43gfXU1XE/jZr6+EQjeli+ASNlNqGynro77Y+VN/qnf//6QQ
 +cVt3xRzZ92xYPSHc3Mtus6CifV0tu8Bv0mqfTsysIXZhMUPrpXE3+uNvHY+z+s43UadHnwUCnTLB
 1i5UCavg==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vi8Or-007Vqr-Jv; Tue, 20 Jan 2026 10:51:49 +0100
Message-ID: <b5b3461f-7434-42db-bad3-ae9187fdbfc1@igalia.com>
Date: Tue, 20 Jan 2026 09:51:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/28] drm/sched: Add fair scheduling policy
To: Danilo Krummrich <dakr@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-10-tvrtko.ursulin@igalia.com>
 <DFONORJMB1ZM.1JHSIXB9ULHJV@kernel.org>
 <1fceb644-ff22-45c8-bd83-4a32786c35f2@igalia.com>
 <DFP4XVVKNIRC.2O817MGMKCQ3P@kernel.org>
 <7b1d848c-a0e3-4960-94da-4f9001c1d96f@igalia.com>
 <DFPK5HIP7G9C.2LJ6AOH2UPLEO@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <DFPK5HIP7G9C.2LJ6AOH2UPLEO@kernel.org>
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


On 15/01/2026 23:39, Danilo Krummrich wrote:
> On Thu Jan 15, 2026 at 2:00 PM CET, Tvrtko Ursulin wrote:

8><

>> Okay but I am sure you know there are memory barriers, RCU, SPSC queue,
>> completions, worker management, and at least two locks, and everything
>> is interdependent.
> 
> I am, and I couldn't describe the maintainance burden of the scheduler any
> better. :)
> 
>> This series at least removes a bunch of code without making things more
>> complicated and so can be a good base for further rework. If you suggest to
>> hold it until all of the above is resolved it will be a few more years easily.
> 
> Let me explain a bit where I'm coming from:
> 
>  From a maintainer perspective - without saying that things are either black or
> white - I'm assessing contributors and contributions on whether the intention is
> to improve the infrastructure in terms of design and maintainability or whether
> the main intention is to "just" get a certain feature merged.
> 
> While both are valuable contributions that are appreciated, contributions that
> have a tendency into the latter direction, have to be seen with more sceptisism.
> 
> Especially when the code base already has known design issues, bulding features
> on top is very dangerous. Not necessarily because the resulting code might be
> wrong or because of regressions, etc. But because it most likely increases the
> difficulty resolving the existing issues -- in the worst case leading to a dead
> end.
> 
> Having that said, I am not saying that you "just" try to get your feature merged
> no matter what. Quite the opposite, I very much appreciate your contributions to
> the scheduler and recognize the cleanup work you are doing.
> 
> However, for this series I require you to acknowledge that, even if correct,
> some of this code introduces additional workarounds due to existing design
> issues, locking and synchronization subtleties that should be solved in better
> ways.
> 
> I have no objections going ahead with this series if we are on the same page
> regarding this and you are willing to also help out fixing those underlying
> design issues, locking and synchronization quirks, etc. subsequently.
> 
> But if you are more leaning in the direction of "I don't see an issue overall,
> the code is correct!" I do have concerns.
> 
> Improving the situation with the scheduler is the fundamental reason why Philipp
> and me were stepping up as maintainers, Philipp being more of the active part
> (doing a great job) and me working more in the background, helping and mentoring
> him.
> 
> Believe me when I say that we want this to move forward, but we also have to
> ensure that we are not making a step into the direction of increasing the
> difficulty to solve the underlying issues.
> 
> So, again, if we are on the same page with this, no objections from my side.

I thought it would have been obvious by now that I am trying to improve 
and fix things across the board. I even mentioned I had attempted a more 
ambitious rewrite already, which hit some stumbling blocks, so I settled 
for this smaller step first.

I am also glad to hear there is desire to attempt more significant 
refactors. Because in the past I was a bit concerned with a little bit 
of "it's scary don't touch it" messaging.

So yes, I do plan to stick around to keep fixing and improving things.

Regards,

Tvrtko

