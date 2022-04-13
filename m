Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B2D4FEF36
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 08:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9041121D0;
	Wed, 13 Apr 2022 06:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02A41121CD
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 06:05:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 3EE3C1F44C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649829950;
 bh=h6yCUcAcN6iaR3DQkh+xpCyBQk8JfcLMxbGWf++mfDM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jMVQuRfWn5ob7ywAWnQ4xvadET+t9PxuKd4Yumb2zwEGZwGkefQlF4p+oKw8vT8gt
 AbQ0XoyYyRYvYxIUKG86ENbVE3riGczfeVt617sOMoKKc7uLvEaD1omvHHkkmCl1ra
 6vDBajXKYLJdG2wl0n08JIB4LohicDYP4LNMgYnvUhVAOZjIvWwhz+GbQ4N2AEizv5
 CdP3hDzqnBHbm1Yjg7WYACdDDSWcyp056qAACKATm+T2Hrsn6kjetJt2Np3/bRrxu9
 QCtJEuW1lz4wA0HV44Bw3KCC4gn3U85I1OqPaifplAgo3iZMFRVie0zpS7P6nCb9+p
 QRFaxCjhyxBIg==
Message-ID: <7f0d7ade-1d59-2c43-c1b2-1fa847eb741a@collabora.com>
Date: Wed, 13 Apr 2022 09:05:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Erico Nunes <nunes.erico@gmail.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <064d8958-a288-64e1-b2a4-c2302a456d5b@amd.com>
 <a04733af-5ff1-a1b4-527d-68b28a037231@collabora.com>
 <f6de2b9a-005f-d1f5-9818-cfbee2bdddc5@amd.com>
 <CAK4VdL3VOtVGi36SY0TEL4P2jW33dM4TOmFXYmewE7cGNhY4Zw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAK4VdL3VOtVGi36SY0TEL4P2jW33dM4TOmFXYmewE7cGNhY4Zw@mail.gmail.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 01:59, Erico Nunes wrote:
> On Tue, Apr 12, 2022 at 9:41 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>>
>> On 2022-04-12 14:20, Dmitry Osipenko wrote:
>>> On 4/12/22 19:51, Andrey Grodzovsky wrote:
>>>> On 2022-04-11 18:15, Dmitry Osipenko wrote:
>>>>> Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
>>>>> mutex when job is released, and thus, that code can sleep. This results
>>>>> into "BUG: scheduling while atomic" if locks are contented while job is
>>>>> freed. There is no good reason for releasing scheduler's jobs in IRQ
>>>>> context, hence use normal context to fix the trouble.
>>>>
>>>> I am not sure this is the beast Idea to leave job's sw fence signalling
>>>> to be
>>>> executed in system_wq context which is prone to delays of executing
>>>> various work items from around the system. Seems better to me to leave the
>>>> fence signaling within the IRQ context and offload only the job freeing or,
>>>> maybe handle rescheduling to thread context within drivers implemention
>>>> of .free_job cb. Not really sure which is the better.
>>> We're talking here about killing jobs when driver destroys context,
>>> which doesn't feel like it needs to be a fast path. I could move the
>>> signalling into drm_sched_entity_kill_jobs_cb() and use unbound wq, but
>>> do we really need this for a slow path?
>>
>>
>> You can't move the signaling back to drm_sched_entity_kill_jobs_cb
>> since this will bring back the lockdep splat that 'drm/sched: Avoid
>> lockdep spalt on killing a processes'
>> was fixing.
>>
>> I see your point and i guess we can go this way too. Another way would
>> be to add to
>> panfrost and msm job a  work_item and reschedule to thread context from
>> within their
>> .free_job callbacks but that probably to cumbersome to be justified here.
> 
> FWIW since this mentioned individual drivers, commit 'drm/sched: Avoid
> lockdep spalt on killing a processes' also introduced problems for
> lima.
> There were some occurrences in our CI
> https://gitlab.freedesktop.org/mesa/mesa/-/jobs/20980982/raw .
> Later I found it also reproducible on normal usage when just closing
> applications, so it may be affecting users too.
> 
> I tested this patch and looks like it fixes things for lima.

This patch indeed should fix that lima bug. Feel free to give yours
tested-by :)
