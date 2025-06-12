Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06FAD727A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 15:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E7210E45F;
	Thu, 12 Jun 2025 13:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qOvo1HsZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4578110E45F;
 Thu, 12 Jun 2025 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6MLOiEcKgEGTK92EJfXESEVjUwnph+8UbZ89FGNGFIA=; b=qOvo1HsZx49RfVfCBKMhddoIYA
 h+4CZjEdSAITLzpZRV0IolJvMe2o+nz2ILDGpZW8JhRITnJEir4Q4llYle049TCWSaUuIveEeSZsC
 iL3OL3bdwhMo/bjVBuQMtOwOkSZbwLs2tpfX8df+9hSn8EdoF38nXNBEyndJ7zmehKtsrNM+Ejlef
 wW5jbiFBEUREelM3JacTBIgGjRBXwytqG+aJxkdjbHjpJD8zFM5W2vPeNJ87dsfiM8p/OtkqbUoUK
 Th9/2+qMoRebv32CiO3NUM0erBPoTpR/Ts5x6ZNjRydFOzogLavgLhmL/2rnU1DEjecaiyumyC3jS
 drGYGMEA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPiGi-002ei0-Tp; Thu, 12 Jun 2025 15:47:00 +0200
Message-ID: <e28175e3-f62a-460d-88bc-3d9d5be78e11@igalia.com>
Date: Thu, 12 Jun 2025 14:46:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/6] drm/sched: Avoid memory leaks by canceling
 job-by-job
To: Danilo Krummrich <dakr@kernel.org>, phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250603093130.100159-2-phasta@kernel.org>
 <fae980fa-e173-4921-90e2-6a4f6b8833a8@igalia.com>
 <8256799772c200103124c0c10490a9c1db04e355.camel@mailbox.org>
 <aEnzZts6acAtg3IX@cassiopeiae>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aEnzZts6acAtg3IX@cassiopeiae>
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


On 11/06/2025 22:21, Danilo Krummrich wrote:
>> On Tue, 2025-06-03 at 13:27 +0100, Tvrtko Ursulin wrote:
>>> On 03/06/2025 10:31, Philipp Stanner wrote:
>>> What I am not that ecstatic about is only getting the Suggested-by
>>> credit in 1/6. Given it is basically my patch with some cosmetic
>>> changes
>>> like the kernel doc and the cancel loop extracted to a helper.
>>
>> Sign the patch off and I give you the authorship if you want.
> 
> AFAICS, the proposal of having cancel_job() has been a review comment which has
> been clarified with a reference patch.

Right, this one:

https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@igalia.com/

> IMO, the fact that after some discussion Philipp decided to go with this
> suggestion and implement the suggestion in his patch series does not result in
> an obligation for him to hand over authorship of the patch he wrote to the
> person who suggested the change in the context of the code review.

It is fine. Just that instead of rewriting we could have also said 
something along the lines of "Okay lets go with your version after all, 
just please tweak this or that". Which in my experience would have been 
more typical.

> Anyways, it seems that Philipp did offer it however, so this seems to be
> resolved?

At the end of the day the very fact a neater solution is going in is the 
main thing for me. Authorship is not that important, only that the way 
of working I follow, both as a maintainer and a colleague, aspires to be 
more like what I described in the previous paragraph.

I am not sure I can review this version though. It feels it would be too 
much like reviewing my own code so wouldn't carry the fully weight of 
review. Technically I probably could, but in reality someone else should 
probably better do it.

Regards,

Tvrtko

