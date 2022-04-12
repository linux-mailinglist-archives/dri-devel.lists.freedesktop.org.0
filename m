Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F1C4FEA33
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 00:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1666B10EC81;
	Tue, 12 Apr 2022 22:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6AE10EC81
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 22:59:30 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id i20so666119ybj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 15:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=67uj+ODJKAoJfsGq0mgokodnfsfzexhVZc4yfZMP5Vs=;
 b=DTX7npfLpY1BrJWiBCCqdFbeD0T+a+0TC8CBYj5GRcgXhHG+cylx7+9ln8680oh++G
 YRVt2bJ9Qijviugbq6DuYFrZ4t2beqmfbvhW+kfrETtfLH3aaTcFSJvrgYWXX6SqRTDQ
 VNNkHYWZ6NBjUNRSoxJbZ1gSlb7tEFaNnhD0YBIjtRhZa2RU2/3bzfqMVBaxPcBLlp4q
 gYh9k4YdvFwWTHX1I8ZNdHkeRiGhgbfO541bjtwNVus961Yw11Ll62cNkZuc1ban6Q5N
 eIkuz8dbBg4WSz4613JSdmX6AWpOcglf82YmMCGKSy85JHaT4+uo897j4dYsagZhos+2
 WMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=67uj+ODJKAoJfsGq0mgokodnfsfzexhVZc4yfZMP5Vs=;
 b=sP3XcfF1ERTTLMQ2dkJIlSdWZ0gZk+3SrrJJ5JUwPTau5cphSfBXiFJFviFWK6ASjy
 w7HW5pu1zW2B3Myrq0bwMix4reATJ3js4FqEaqTRw7nTtwDnkoTyGBPp7WsEqQP9/188
 CDUZ5lhum6bza5fIReIfamPD/HYXL2HP8T4JY/tL6MlhbKmoDAn0If1DHPMDWM5ISI3q
 pRy0gn6Vw1XAyeSk2gyBHLHv36qcmwYNKFCXq8GAku+1HAxY5GVHQ7i4q8Kcf934/tZO
 X+isQjr+Qu4pLAIrxbIeLmDogqRDPFCJP+QCEM7Uk5tXOjVgIDTnoytN+fJFm1NZLJf/
 3UNw==
X-Gm-Message-State: AOAM531sd0/8HDF8YGVc79n8hDPw9KLD8fUlfwCJ1z1A14CUIPiQztwg
 vZgzMdkilSTQkolUsWRLbxIhQ6VMjL0hErX5JLo=
X-Google-Smtp-Source: ABdhPJxA3TnyYl5vFu8RdrtHkJRQMKjG5mMTUlovdrThCqA4a3Mhh048V8dAtXy5cq7W9qaIvtdd+JKskmCRu3d7AV0=
X-Received: by 2002:a25:ccc9:0:b0:641:2b90:4765 with SMTP id
 l192-20020a25ccc9000000b006412b904765mr11645877ybf.44.1649804369431; Tue, 12
 Apr 2022 15:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <064d8958-a288-64e1-b2a4-c2302a456d5b@amd.com>
 <a04733af-5ff1-a1b4-527d-68b28a037231@collabora.com>
 <f6de2b9a-005f-d1f5-9818-cfbee2bdddc5@amd.com>
In-Reply-To: <f6de2b9a-005f-d1f5-9818-cfbee2bdddc5@amd.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 13 Apr 2022 00:59:17 +0200
Message-ID: <CAK4VdL3VOtVGi36SY0TEL4P2jW33dM4TOmFXYmewE7cGNhY4Zw@mail.gmail.com>
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 9:41 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
>
> On 2022-04-12 14:20, Dmitry Osipenko wrote:
> > On 4/12/22 19:51, Andrey Grodzovsky wrote:
> >> On 2022-04-11 18:15, Dmitry Osipenko wrote:
> >>> Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
> >>> mutex when job is released, and thus, that code can sleep. This results
> >>> into "BUG: scheduling while atomic" if locks are contented while job is
> >>> freed. There is no good reason for releasing scheduler's jobs in IRQ
> >>> context, hence use normal context to fix the trouble.
> >>
> >> I am not sure this is the beast Idea to leave job's sw fence signalling
> >> to be
> >> executed in system_wq context which is prone to delays of executing
> >> various work items from around the system. Seems better to me to leave the
> >> fence signaling within the IRQ context and offload only the job freeing or,
> >> maybe handle rescheduling to thread context within drivers implemention
> >> of .free_job cb. Not really sure which is the better.
> > We're talking here about killing jobs when driver destroys context,
> > which doesn't feel like it needs to be a fast path. I could move the
> > signalling into drm_sched_entity_kill_jobs_cb() and use unbound wq, but
> > do we really need this for a slow path?
>
>
> You can't move the signaling back to drm_sched_entity_kill_jobs_cb
> since this will bring back the lockdep splat that 'drm/sched: Avoid
> lockdep spalt on killing a processes'
> was fixing.
>
> I see your point and i guess we can go this way too. Another way would
> be to add to
> panfrost and msm job a  work_item and reschedule to thread context from
> within their
> .free_job callbacks but that probably to cumbersome to be justified here.

FWIW since this mentioned individual drivers, commit 'drm/sched: Avoid
lockdep spalt on killing a processes' also introduced problems for
lima.
There were some occurrences in our CI
https://gitlab.freedesktop.org/mesa/mesa/-/jobs/20980982/raw .
Later I found it also reproducible on normal usage when just closing
applications, so it may be affecting users too.

I tested this patch and looks like it fixes things for lima.

Thanks

Erico
