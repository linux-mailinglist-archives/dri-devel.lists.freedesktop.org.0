Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B74DC2B1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2610410E5E1;
	Thu, 17 Mar 2022 09:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E302110E5E1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:29:59 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q20so2754415wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PPV/3yekNxP1EceqjJGpxw/gKPSHQInEWHupNJLTBAk=;
 b=ZaBsMr07JDXPa67dzAwVceU/0XWQ7VpYQsLwMcBf/Vz6W01miH3I1FJHBB7wtNBezI
 sodGoGW9TYwAEZF+SB1xNiWpQWoX6WctRmYX9zWNomJqoyrmn6Zc425p3qc3G/JYKsqg
 oQ/2jcQhcKJ6I/gwo7+3NlRxWXiEWCfRv8dvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PPV/3yekNxP1EceqjJGpxw/gKPSHQInEWHupNJLTBAk=;
 b=gIDvcLaUZ+el/kR+KfMviho8SO46PFZgzNgnRs2QIR6aL1JXFZbg+ywZel9+qKx90D
 4GDRLg94WIgSmgs4+5W0vPyY+TNBb0gaGAjhvnacEJUicFANgUWZf78L5Ra+Rws4S0K1
 vWmI0Mm4yTIHNAStlLjZqOtmViWcro75Xm3FdpGRKVEKkLBESyEFQcc/3D6BCaPc1hsi
 ZLh2zQ6ouWv+5WgxAiuChYeXEdcun3lRlVqFSKcLTpDNoenM7kaNlBsUBKPlOS6cknDo
 /y8EvrI3z/Gtte/hd9ZsVywnZqdQu/f8QBnGUN42kNhclHvNVKT7z3qWbPQeEM+rs/Vr
 oAww==
X-Gm-Message-State: AOAM531zwuxDuYAxp4ExPs+3fXjMxGIe9yfLMFH4QfvPHwHOwfT/v57F
 jjjdG+wUpOEjYLJPbsUQateluw==
X-Google-Smtp-Source: ABdhPJxoRvRG+o/gOKpQUASU/0daU/fVdPz1QW8lZ31zZ9KKfEPD/2l8jKzGdNB0WKSsMhjcMezgeA==
X-Received: by 2002:a05:600c:4e07:b0:38c:8187:13c3 with SMTP id
 b7-20020a05600c4e0700b0038c818713c3mr508203wmq.11.1647509398135; 
 Thu, 17 Mar 2022 02:29:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c410700b0038c72ef3f15sm2702750wmi.38.2022.03.17.02.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 02:29:57 -0700 (PDT)
Date: Thu, 17 Mar 2022 10:29:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <YjL/k6kh+5RihGIV@phenom.ffwll.local>
References: <cda15a47-f469-2a7e-87b6-adf00e631ef0@amd.com>
 <CAF6AEGv3Wv+p1j2B-t22eeK+8rx-qrQHCGoXeV1-XPYp2Om7zg@mail.gmail.com>
 <20220311102709.225616cf@eldfell>
 <CADnq5_O1Qktec3kC_rcPZUQPbraBYmdhDwmj=jgp_QsaBFGUZw@mail.gmail.com>
 <20220314172647.223658d2@eldfell>
 <CADnq5_NsxipfFFXfRSXvVQin3e1gj0Q_p9p-shi3VZ2pSCwwfw@mail.gmail.com>
 <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <shashank.sharma@amd.com>,
 Amaranath Somalapuram <amaranath.somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandar Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 08:03:27AM +0100, Christian König wrote:
> Am 16.03.22 um 16:36 schrieb Rob Clark:
> > [SNIP]
> > just one point of clarification.. in the msm and i915 case it is
> > purely for debugging and telemetry (ie. sending crash logs back to
> > distro for analysis if user has crash reporting enabled).. it isn't
> > used for triggering any action like killing app or compositor.
> 
> By the way, how does msm it's memory management for the devcoredumps?

GFP_NORECLAIM all the way. It's purely best effort.

Note that the fancy new plan for i915 discrete gpu is to only support gpu
crash dumps on non-recoverable gpu contexts, i.e. those that do not
continue to the next batch when something bad happens. This is what vk
wants and also what iris now uses (we do context recovery in userspace in
all cases), and non-recoverable contexts greatly simplify the crash dump
gather: Only thing you need to gather is the register state from hw
(before you reset it), all the batchbuffer bo and indirect state bo (in
i915 you can mark which bo to capture in the CS ioctl) can be captured in
a worker later on. Which for non-recoverable context is no issue, since
subsequent batchbuffers won't trample over any of these things.

And that way you can record the crashdump (or at least the big pieces like
all the indirect state stuff) with GFP_KERNEL.

msm probably gets it wrong since embedded drivers have much less shrinker
and generally no mmu notifiers going on :-)

> I mean it is strictly forbidden to allocate any memory in the GPU reset
> path.
> 
> > I would however *strongly* recommend devcoredump support in other GPU
> > drivers (i915's thing pre-dates devcoredump by a lot).. I've used it
> > to debug and fix a couple obscure issues that I was not able to
> > reproduce by myself.
> 
> Yes, completely agree as well.

+1

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
