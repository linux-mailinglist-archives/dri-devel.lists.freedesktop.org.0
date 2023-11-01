Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE327DDB0E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 03:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224A510E61B;
	Wed,  1 Nov 2023 02:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437AC10E099;
 Wed,  1 Nov 2023 02:37:32 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50939d39d0fso990199e87.1; 
 Tue, 31 Oct 2023 19:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698806250; x=1699411050; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RhToUgDGewUPgf6OgyTbPtKvOyKo7IWG8IUQAlqOJOY=;
 b=P35+hqu12tiZ8QK+re9+advRRW/PEt4Jw0NXnADV4pNB6c3f0FF/TR/8V4XWIOo2yn
 i0lePYn7r5ds+TAu6i58aoilsaU5HxmnZcw7q9OuA5CZxw+1vKWHkbjECJ6iVcClY44M
 I02UbFv/naXj2PWzWDXe99sejKSC30qMjoQ0ZQxrwUipmaRaJNWnRTwMCazzmHpb51xp
 NtXraME1FRxTRwjt+p/iFyDtTChj6qm7nbvdF1oVqUbFDZYwf9rCAaZc6CMDmxLHSnEg
 HF/ca1YKQ9d9fz081zLMDwqpbWqvV2lrB1T+18xFRmtTeBYrDgF+AijuXnQD7ceezglq
 b67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698806250; x=1699411050;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RhToUgDGewUPgf6OgyTbPtKvOyKo7IWG8IUQAlqOJOY=;
 b=kgQTvZrh1qS7rd+9PxD4OEzO2hb/SLGDjymU4zvx1r9swfFvMdbbbxK3XarPzvbnAg
 GJ1NJ+QSjYheUX59Is/gixr4jhCmaqtz+YMKc40ntBCYOjYBQk80U3fHr7EWyWVK/NlK
 iLCoyi5aJwF5ABMKBicDV+y3Rzf2IC8MnDAxNK888HkXmIOFAOheKHK0SDszYTz0m+i1
 /8jS2+nts3TfO0ihVWfHd6XWoLQfUgX9XP1BjoQ5/j2eQssu2hMOwO8G2gl6TCx3RsAl
 VYMQhbzHrP/9wnvE/KLHYV2C02tWWhbLl02vubYzmuzge1bfjMJFwYKSwEWDW6dL3xVn
 s4OA==
X-Gm-Message-State: AOJu0YyxaZl7S2n1DqllTx/qSfJqkWOXwI8Iv/XJyxXVsLJEHSmfoVWs
 5Wz2WY1qL1ExN4YeQb2wnTjtot29dX6mVMsE+5E=
X-Google-Smtp-Source: AGHT+IFeh9ikxIDnkDlTHkH1PXpR/kgi5gze/lZYbODyZgaDnbprmcGirGJlGwiGQ95RhKrHlfaYPFytDVNE91zQ2Q8=
X-Received: by 2002:a05:6512:4845:b0:500:acf1:b432 with SMTP id
 ep5-20020a056512484500b00500acf1b432mr11708881lfb.63.1698806250074; Tue, 31
 Oct 2023 19:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231023032251.164775-1-luben.tuikov@amd.com>
 <8f53f7ef-7621-4f0b-bdef-d8d20bc497ff@redhat.com>
 <6f3e9b93-2be5-46b2-bbd9-d61d2603c14a@gmail.com>
 <c57c7217-bfb9-4770-b17e-587f3b8a038c@redhat.com>
 <bef15942-9543-4118-89c9-62c63c6215d4@gmail.com>
In-Reply-To: <bef15942-9543-4118-89c9-62c63c6215d4@gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 1 Nov 2023 12:37:18 +1000
Message-ID: <CAPM=9ty3X6ods9e9g47PNEZO0Kr35a36ffq+o4b0wNg6B+zsyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Convert the GPU scheduler to variable number
 of run-queues
To: Luben Tuikov <ltuikov89@gmail.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Emma Anholt <emma@anholt.net>,
 lima@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, etnaviv@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Danilo Krummrich <dakr@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 1 Nov 2023 at 11:46, Luben Tuikov <ltuikov89@gmail.com> wrote:
>
> On 2023-10-31 09:33, Danilo Krummrich wrote:
> >
> > On 10/26/23 19:25, Luben Tuikov wrote:
> >> On 2023-10-26 12:39, Danilo Krummrich wrote:
> >>> On 10/23/23 05:22, Luben Tuikov wrote:
> >>>> The GPU scheduler has now a variable number of run-queues, which are set up at
> >>>> drm_sched_init() time. This way, each driver announces how many run-queues it
> >>>> requires (supports) per each GPU scheduler it creates. Note, that run-queues
> >>>> correspond to scheduler "priorities", thus if the number of run-queues is set
> >>>> to 1 at drm_sched_init(), then that scheduler supports a single run-queue,
> >>>> i.e. single "priority". If a driver further sets a single entity per
> >>>> run-queue, then this creates a 1-to-1 correspondence between a scheduler and
> >>>> a scheduled entity.
> >>>
> >>> Generally, I'm fine with this patch and how it replaces / generalizes the single
> >>> entity approach.
> >>
> >> Great!
> >>
> >>> However, I'm not quite sure how to properly use this. What is a driver supposed to
> >>> do, which previously took advantage of DRM_SCHED_POLICY_SINGLE_ENTITY?
> >>>
> >>> Is it supposed to call drm_sched_init() with num_rqs=1? If so, what's the correct way
> >>
> >> Yes, you call drm_sched_init() with num_rqs set to 1.
> >>
> >>> to initialize the drm_sched_entity then? Calling drm_sched_entity_init() with priority=0?
> >>
> >> Yes, with priority set to 0.
> >>
> >> One unfortunate fact I noticed when doing this patch is that the numerical values
> >> assigned to enum drm_sched_priority is that the names to values are upside down.
> >> Instead of min being 0, normal:1, high:2, kernel:3, it should've been kernel:0 (highest),
> >> high:1, normal:2, low:4, and so on.
> >>
> >> The reason for this is absolutely clear: if you had a single priority, it would be
> >> 0, the kernel, one, highest one. This is similar to how lanes in a highway are counted:
> >> you always have lane 1. Similarly to nice(1) and kernel priorities...
> >>
> >>> Any other priority consequently faults in drm_sched_job_arm().
> >>
> >> drm_sched_job_arm() faults on !ENTITY, but the "priority" is just
> >> assigned to s_priority:
> >>      job->s_priority = entity->priority;
> >>
> >>
> >>> While I might sound like a broken record (sorry for that), I really think everything
> >>> related to Matt's series needs documentation, as in:
> >>
> >> Yes, I agree.
> >
> > Great! Do you plan to send a subsequent patch adding some documentation for this one? I
> > think it'd be good to get all the above documented.
>
> A lot of this would be the magic sauce of drivers and hardware--as we've seen with Xe,
> and it would be presumptuous of me to write down to the detail of what and how this
> and that should be used.

Nope it wouldn't be. Please feel free to persume how drivers might
work in the form of documentation.

At some point the scheduler needs to be documented and so far two
maintainers have avoided doing so, and it's causing no end of
problems.

Write documentation, this goes for Xe scheduler patches, Danilo's work.

When someone asks you for docs, consider it a blocker on getting stuff
merged, because this stuff isn't obvious.

Dave.
