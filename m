Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BF34FE926
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 21:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9234010E27C;
	Tue, 12 Apr 2022 19:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9285A10E27C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 19:55:57 +0000 (UTC)
Received: from [IPV6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1] (unknown
 [IPv6:2a00:5f00:102:0:10b3:10ff:fe5d:4ec1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 618321F448EB;
 Tue, 12 Apr 2022 20:55:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649793356;
 bh=8v13VbpDfTPHFcIUff92WA/rM4Ce4zklxdlsVEskFgo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CpvT/5HWIg6oGGFy5RA4uOZ+HCrNo7pIe8W9MODaa6eFwTR6icCzJMpP7s9/fHeDD
 iyWQZrpAeHAmtrYDuhIJJpZbG/1v5eCjQYe07/8toQjKO8zIosoZUCF35UZSmoWC8z
 1jKMxdozcgfGNL7JxaMqk8mF/7QIpaTuO3D+g/3Muqb+KDrIp+2ov+NWGqpDKYxcIj
 o++aVl/CSv3Tu8mqQWAQMPN4lh1a2SdJuekJf2E2+XIuISuwJ+7Pa4qx3wERkcGVbF
 c1Jm4d1qWrlRqxzuPI2LWdExgR9c1KtOuirKx3P4NHBbFHmGyqEhlyainUOHrL7yPQ
 ypvw/VyITheSA==
Message-ID: <3076593e-9ff1-bb73-b05c-000a7a502caa@collabora.com>
Date: Tue, 12 Apr 2022 22:55:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <064d8958-a288-64e1-b2a4-c2302a456d5b@amd.com>
 <a04733af-5ff1-a1b4-527d-68b28a037231@collabora.com>
 <f6de2b9a-005f-d1f5-9818-cfbee2bdddc5@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <f6de2b9a-005f-d1f5-9818-cfbee2bdddc5@amd.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/12/22 22:40, Andrey Grodzovsky wrote:
> 
> On 2022-04-12 14:20, Dmitry Osipenko wrote:
>> On 4/12/22 19:51, Andrey Grodzovsky wrote:
>>> On 2022-04-11 18:15, Dmitry Osipenko wrote:
>>>> Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
>>>> mutex when job is released, and thus, that code can sleep. This results
>>>> into "BUG: scheduling while atomic" if locks are contented while job is
>>>> freed. There is no good reason for releasing scheduler's jobs in IRQ
>>>> context, hence use normal context to fix the trouble.
>>>
>>> I am not sure this is the beast Idea to leave job's sw fence signalling
>>> to be
>>> executed in system_wq context which is prone to delays of executing
>>> various work items from around the system. Seems better to me to
>>> leave the
>>> fence signaling within the IRQ context and offload only the job
>>> freeing or,
>>> maybe handle rescheduling to thread context within drivers implemention
>>> of .free_job cb. Not really sure which is the better.
>> We're talking here about killing jobs when driver destroys context,
>> which doesn't feel like it needs to be a fast path. I could move the
>> signalling into drm_sched_entity_kill_jobs_cb() and use unbound wq, but
>> do we really need this for a slow path?
> 
> 
> You can't move the signaling back to drm_sched_entity_kill_jobs_cb
> since this will bring back the lockdep splat that 'drm/sched: Avoid
> lockdep spalt on killing a processes'
> was fixing.

Indeed

> I see your point and i guess we can go this way too. Another way would
> be to add to
> panfrost and msm job a  work_item and reschedule to thread context from
> within their
> .free_job callbacks but that probably to cumbersome to be justified here.

Yes, there is no clear justification for doing that.

> Andrey
> 
> 
> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Thank you!
