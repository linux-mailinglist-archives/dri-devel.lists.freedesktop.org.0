Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC436A9E5C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 19:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688A510E155;
	Fri,  3 Mar 2023 18:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE2410E146;
 Fri,  3 Mar 2023 18:20:50 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id s8so2201761ilv.10;
 Fri, 03 Mar 2023 10:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=axdACOpDgX4dqbHNbIgw6l/7ldg/vQEmMI8fQauJgl8=;
 b=QczMEiEgQw99JTo6idDjCmdUY+sExwLtJY3/KxeKkvYdy0yKmdUEPD0dgjI7WTlutJ
 tdoXP8gPcHCyv03Mt3F59SccC5tXpCy4xMbgV/Va1gbe1xpd7QRnEuJeCjvKLDCVnxiy
 GTAst35/hfaVx/jtfzPmqmH2i3H7VA6+h6eACYF+gFiKRcy6SHcNGVuCKb632mAE5FFD
 jyMD/rneQS2DLsvlGqrApDw2hWb5Wei9gvmhqogPv1qmFtOkgQ/Wsze9U8yuRtejB+l+
 Al2mUiQ0CI6j6QyECn0Tmf0ZM/+uervRLoZ9A7RtA3ORLXu8ei5N1WedxMbhvS36QH8Q
 2FCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=axdACOpDgX4dqbHNbIgw6l/7ldg/vQEmMI8fQauJgl8=;
 b=J7szS+RRZBtuxxAOFMZ76LflkDzwkOwo3AfvXPETznOIDzbex1X7/EdE7Z4SIMHQBC
 dGK6rwoWri63F0Vbi/KqOXqO8S+yDvoCcG+OSGWwqlJR1ENzABAMhAsRKr9CaNWZIOKO
 nr7Wu4LSPGO7w7g/PX1u3QNtXDsSwwlGd/hXHPpa9v5wt7loOqHnwD+SYsHk/zVFVicI
 fC6jkGRPY9NYg+h62I2bJenR5vZj7jMo1ghEGtXOppILU99fX4diJQp2JiTOoUfC5109
 eeCVSsDXY7I5mBefYkCMqiip1HeYCtwYuZvMSfzuNhiIaVj7ySVUx4RpsX730/pShi+m
 lUvg==
X-Gm-Message-State: AO0yUKWSo1xBoc4Ecfx6UmSlHwyuCJs1S05hZer/OWxG+t0FNY9GZ1P5
 vBQqcMlYBy9eextpCnn+3qoQeoUXJo36OzhcILI=
X-Google-Smtp-Source: AK7set8Qed7nPAs7RH0XEMozjccCh754nLRwreSB3nR6IUtV2hYZym8/5UTUtz+kyz5kn3EXFUYQKPVWknxcgmIQOPA=
X-Received: by 2002:a05:6e02:130f:b0:315:9761:6965 with SMTP id
 g15-20020a056e02130f00b0031597616965mr1232665ilr.5.1677867649207; Fri, 03 Mar
 2023 10:20:49 -0800 (PST)
MIME-Version: 1.0
References: <20230302235356.3148279-1-robdclark@gmail.com>
 <20230302235356.3148279-16-robdclark@gmail.com>
 <ZAFnqbycMleLmRe9@intel.com>
 <3bded9d7-9796-4a9b-7c11-aac994d4fdc6@linux.intel.com>
 <CAF6AEGs6QYTESuwB8E9cTbv9LqQX16tz6-geeu9BCyFos9=sOA@mail.gmail.com>
 <a5ced581-4060-0fa2-d2fc-d18beee6fdb5@linux.intel.com>
In-Reply-To: <a5ced581-4060-0fa2-d2fc-d18beee6fdb5@linux.intel.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 3 Mar 2023 13:20:38 -0500
Message-ID: <CAEdQ38FLf0jX6oWCkmx+xwgF8YAH8xSwhw5RUGC3xwdDBr7NVQ@mail.gmail.com>
Subject: Re: [PATCH v9 15/15] drm/i915: Add deadline based boost support
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Rob Clark <robdclark@chromium.org>, Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 3, 2023 at 10:08=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 03/03/2023 14:48, Rob Clark wrote:
> > On Fri, Mar 3, 2023 at 1:58 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 03/03/2023 03:21, Rodrigo Vivi wrote:
> >>> On Thu, Mar 02, 2023 at 03:53:37PM -0800, Rob Clark wrote:
> >>>> From: Rob Clark <robdclark@chromium.org>
> >>>>
> >>>
> >>> missing some wording here...
> >>>
> >>>> v2: rebase
> >>>>
> >>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>> ---
> >>>>    drivers/gpu/drm/i915/i915_request.c | 20 ++++++++++++++++++++
> >>>>    1 file changed, 20 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i=
915/i915_request.c
> >>>> index 7503dcb9043b..44491e7e214c 100644
> >>>> --- a/drivers/gpu/drm/i915/i915_request.c
> >>>> +++ b/drivers/gpu/drm/i915/i915_request.c
> >>>> @@ -97,6 +97,25 @@ static bool i915_fence_enable_signaling(struct dm=
a_fence *fence)
> >>>>       return i915_request_enable_breadcrumb(to_request(fence));
> >>>>    }
> >>>>
> >>>> +static void i915_fence_set_deadline(struct dma_fence *fence, ktime_=
t deadline)
> >>>> +{
> >>>> +    struct i915_request *rq =3D to_request(fence);
> >>>> +
> >>>> +    if (i915_request_completed(rq))
> >>>> +            return;
> >>>> +
> >>>> +    if (i915_request_started(rq))
> >>>> +            return;
> >>>
> >>> why do we skip the boost if already started?
> >>> don't we want to boost the freq anyway?
> >>
> >> I'd wager Rob is just copying the current i915 wait boost logic.
> >
> > Yup, and probably incorrectly.. Matt reported fewer boosts/sec
> > compared to your RFC, this could be the bug
>
> Hm, there I have preserved this same !i915_request_started logic.
>
> Presumably it's not just fewer boosts but lower performance. How is he
> setting the deadline? Somehow from clFlush or so?
>
> Regards,
>
> Tvrtko
>
> P.S. Take note that I did not post the latest version of my RFC. The one
> where I fix the fence chain and array misses you pointed out. I did not
> think it would be worthwhile given no universal love for it, but if
> people are testing with it more widely that I was aware perhaps I should.

Yep, that would be great. We're interested in it for ChromeOS. Please
Cc me on the series when you send it.
