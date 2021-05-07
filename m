Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41EA37687C
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 18:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D65E6E3B2;
	Fri,  7 May 2021 16:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FFE6E3B2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 16:13:51 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso7471227wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 09:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FUW3a1jiCrK1Tn1N2NaYa8UBta2jEUU1Vka07ztzquU=;
 b=g4WfSpbdEojj9t6SkLNDXVSN8j4goD0Y1aN3I2Imymf6okgQfMLTQILeVaPIdzjjyy
 rc5FgeK00c/1rW3oWDgK0rM6pqpYTXnlKBGM3lzF7JRr0lP4t2KJLEo8glyppHIXAZg5
 OlL+tz1UDPB06Xitnob+iK9BxCUL/sEKyEcCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FUW3a1jiCrK1Tn1N2NaYa8UBta2jEUU1Vka07ztzquU=;
 b=PUZ1HuA+pja1wmM1OIryddqZMLXTbKMBx3zE0DMG/8e9FsHANDGsFgkyzeTiJE22hi
 wPAZ3EqIimXMtL3rslwbfhkV90I8gZ8sVVm8DwLYjvQLjCZKMy8z/DmGKJ0yrEIvmla3
 k1q+7ysFNKaBiefLLqMny5Ao00OaCo3Zhm0gtb9r2wg8dxoyaDmpk874wwSX/XLYWlld
 dPo//BSeHdKDmxDeMLN9cuOvBdwCapAvXU/ab1elpv+g8ioPWYPzFgRJEl677IGmaZZw
 Vr0i9gzaDtjxldgtuwt+IxG2TlswNoz6esc1PhW0+hDBoaxwJm1yLJHNWAUYbFMoNwY/
 tu2A==
X-Gm-Message-State: AOAM531Kcl7/73xaP/vAoGWoVegCihI6yIE3pQap41tAA8WlOWTnlHoB
 qzm0aYyOSIp6i1agSnLiYRmNfg==
X-Google-Smtp-Source: ABdhPJw2OfJqYx5ZIercYhhRlQ/JLOdMXNxUQ/ODYD+AnW2ThepPqF7/0dUanJkd40jtM214KjqXYQ==
X-Received: by 2002:a05:600c:2154:: with SMTP id
 v20mr10712151wml.86.1620404030299; 
 Fri, 07 May 2021 09:13:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l66sm7286905wmf.20.2021.05.07.09.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 09:13:49 -0700 (PDT)
Date: Fri, 7 May 2021 18:13:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Kenny Ho <y2kenny@gmail.com>
Subject: Re: [RFC] Add BPF_PROG_TYPE_CGROUP_IOCTL
Message-ID: <YJVnO+TCRW83S6w4@phenom.ffwll.local>
References: <CAOWid-djQ_NRfCbOTnZQ-A8Pr7jMP7KuZEJDSsvzWkdw7qc=yA@mail.gmail.com>
 <20201103232805.6uq4zg3gdvw2iiki@ast-mbp.dhcp.thefacebook.com>
 <YBgU9Vu0BGV8kCxD@phenom.ffwll.local>
 <CAOWid-eXMqcNpjFxbcuUDU7Y-CCYJRNT_9mzqFYm1jeCPdADGQ@mail.gmail.com>
 <YBqEbHyIjUjgk+es@phenom.ffwll.local>
 <CAOWid-c4Nk717xUah19B=z=2DtztbtU=_4=fQdfhqpfNJYN2gw@mail.gmail.com>
 <CAKMK7uFEhyJChERFQ_DYFU4UCA2Ox4wTkds3+GeyURH5xNMTCA@mail.gmail.com>
 <CAOWid-fL0=OM2XiOH+NFgn_e2L4Yx8sXA-+HicUb9bzhP0t8Bw@mail.gmail.com>
 <YJUBer3wWKSAeXe7@phenom.ffwll.local>
 <CAOWid-dmRsZUjF3cJ8+mx5FM9ksNQ_P9xY3jqxFiFMvN29SaLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOWid-dmRsZUjF3cJ8+mx5FM9ksNQ_P9xY3jqxFiFMvN29SaLw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Kenny Ho <Kenny.Ho@amd.com>,
 "open list:CONTROL GROUP \(CGROUP\)" <cgroups@vger.kernel.org>,
 Brian Welty <brian.welty@intel.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Martin KaFai Lau <kafai@fb.com>,
 Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Network Development <netdev@vger.kernel.org>, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 07, 2021 at 11:33:46AM -0400, Kenny Ho wrote:
> On Fri, May 7, 2021 at 4:59 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Hm I missed that. I feel like time-sliced-of-a-whole gpu is the easier gpu
> > cgroups controler to get started, since it's much closer to other cgroups
> > that control bandwidth of some kind. Whether it's i/o bandwidth or compute
> > bandwidht is kinda a wash.
> sriov/time-sliced-of-a-whole gpu does not really need a cgroup
> interface since each slice appears as a stand alone device.  This is
> already in production (not using cgroup) with users.  The cgroup
> proposal has always been parallel to that in many sense: 1) spatial
> partitioning as an independent but equally valid use case as time
> sharing, 2) sub-device resource control as opposed to full device
> control motivated by the workload characterization paper.  It was
> never about time vs space in terms of use cases but having new API for
> users to be able to do spatial subdevice partitioning.
> 
> > CU mask feels a lot more like an isolation/guaranteed forward progress
> > kind of thing, and I suspect that's always going to be a lot more gpu hw
> > specific than anything we can reasonably put into a general cgroups
> > controller.
> The first half is correct but I disagree with the conclusion.  The
> analogy I would use is multi-core CPU.  The capability of individual
> CPU cores, core count and core arrangement may be hw specific but
> there are general interfaces to support selection of these cores.  CU
> mask may be hw specific but spatial partitioning as an idea is not.
> Most gpu vendors have the concept of sub-device compute units (EU, SE,
> etc.); OpenCL has the concept of subdevice in the language.  I don't
> see any obstacle for vendors to implement spatial partitioning just
> like many CPU vendors support the idea of multi-core.
> 
> > Also for the time slice cgroups thing, can you pls give me pointers to
> > these old patches that had it, and how it's done? I very obviously missed
> > that part.
> I think you misunderstood what I wrote earlier.  The original proposal
> was about spatial partitioning of subdevice resources not time sharing
> using cgroup (since time sharing is already supported elsewhere.)

Well SRIOV time-sharing is for virtualization. cgroups is for
containerization, which is just virtualization but with less overhead and
more security bugs.

More or less.

So either I get things still wrong, or we'll get time-sharing for
virtualization, and partitioning of CU for containerization. That doesn't
make that much sense to me.

Since time-sharing is the first thing that's done for virtualization I
think it's probably also the most reasonable to start with for containers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
