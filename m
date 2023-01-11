Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 855EA666689
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B141110E830;
	Wed, 11 Jan 2023 22:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F4D10E825
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:56:50 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x10so21645718edd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fYVYmrm8qRKhdfjNxir61IMwTDz9ljMKT2wwPAIP+WQ=;
 b=Xhqr3JG2Kex0yJQiWOcc0PM+7tyhQNxjCcJ7T8wz62d+5YQPT9Rtd4nC10zyoXLoMT
 4/vmihyklfSrZDCiyctpeidBCrvuTcUZqgtWDQJyCNaXgm6+tkBSAvDANuhYpWOmJyom
 dC+q84M7rFuFBjEUHK9o1KYkMoO2Zcisjc0WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fYVYmrm8qRKhdfjNxir61IMwTDz9ljMKT2wwPAIP+WQ=;
 b=GWGjw1uFuPBg0fjkdq7SO+Ce1TgSY7rtiyJZoFchhYN8gkiPwbFgsV3Z9U4RyPTMKj
 +7vnCkeu2/C83x3UCqv/0FeZR2HYa6/O5kRHh3GVplV5kltbcp9XDMfTTcdJPsHGpCvp
 211CDGyUxbxuOq63cKtihb/GhQG/l48v/L2u5OAZiXJkDFtaIzyuQVrw2KD7Dx/MSMC5
 6eu8hxDC6M5VCdJN5ZA/ztlJjSnRXOstAh9T6KaM+0TfZgy3vBbwCxb40l2gcDaXeMs1
 xpiOsOFiWEVOYLiL062/FXIfb1hbgpF1KNYsvuzHdsQBR6GK/wXoTRPvn8e3owKBP9rl
 8x4w==
X-Gm-Message-State: AFqh2kpT9NT2mNlmhYfo84fljIU5tZbvNjZ24bnHi3J2U2kDou2oyXg6
 IpJT/F6txznsB37mupAbhoU5/Q==
X-Google-Smtp-Source: AMrXdXvtJyhkyJcdGojea7328ZHYfQqEgGWt5WiLp900ZLPEIaZSTCU8Uhtlcr1KkDcOMzby5I7CqA==
X-Received: by 2002:a05:6402:48c:b0:483:d49f:e26c with SMTP id
 k12-20020a056402048c00b00483d49fe26cmr54924068edv.15.1673477808940; 
 Wed, 11 Jan 2023 14:56:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a3-20020aa7cf03000000b0049019b48373sm6549362edy.85.2023.01.11.14.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 14:56:48 -0800 (PST)
Date: Wed, 11 Jan 2023 23:56:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Shakeel Butt <shakeelb@google.com>
Subject: Re: [PATCH 0/4] Track exported dma-buffers with memcg
Message-ID: <Y78+rfzXPq5XGs9O@phenom.ffwll.local>
Mail-Followup-To: Shakeel Butt <shakeelb@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>, android-mm@google.com,
 jstultz@google.com, cgroups@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org
References: <20230109213809.418135-1-tjmercier@google.com>
 <CALvZod4ru7F38tAO-gM9ZFKaEhS0w3KqFbPwhwcTvgJs4xMUow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALvZod4ru7F38tAO-gM9ZFKaEhS0w3KqFbPwhwcTvgJs4xMUow@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 Roman Gushchin <roman.gushchin@linux.dev>, Carlos Llamas <cmllamas@google.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, jstultz@google.com, Zefan Li <lizefan.x@bytedance.com>,
 cgroups@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, android-mm@google.com,
 Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>,
 Martijn Coenen <maco@android.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Todd Kjos <tkjos@android.com>,
 selinux@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Eric Paris <eparis@parisplace.org>, Suren Baghdasaryan <surenb@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Muchun Song <muchun.song@linux.dev>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 04:18:12PM -0800, Shakeel Butt wrote:
> Hi T.J.,
> 
> On Mon, Jan 9, 2023 at 1:38 PM T.J. Mercier <tjmercier@google.com> wrote:
> >
> > Based on discussions at LPC, this series adds a memory.stat counter for
> > exported dmabufs. This counter allows us to continue tracking
> > system-wide total exported buffer sizes which there is no longer any
> > way to get without DMABUF_SYSFS_STATS, and adds a new capability to
> > track per-cgroup exported buffer sizes. The total (root counter) is
> > helpful for accounting in-kernel dmabuf use (by comparing with the sum
> > of child nodes or with the sum of sizes of mapped buffers or FD
> > references in procfs) in addition to helping identify driver memory
> > leaks when in-kernel use continually increases over time. With
> > per-application cgroups, the per-cgroup counter allows us to quickly
> > see how much dma-buf memory an application has caused to be allocated.
> > This avoids the need to read through all of procfs which can be a
> > lengthy process, and causes the charge to "stick" to the allocating
> > process/cgroup as long as the buffer is alive, regardless of how the
> > buffer is shared (unless the charge is transferred).
> >
> > The first patch adds the counter to memcg. The next two patches allow
> > the charge for a buffer to be transferred across cgroups which is
> > necessary because of the way most dmabufs are allocated from a central
> > process on Android. The fourth patch adds a SELinux hook to binder in
> > order to control who is allowed to transfer buffer charges.
> >
> > [1] https://lore.kernel.org/all/20220617085702.4298-1-christian.koenig@amd.com/
> >
> 
> I am a bit confused by the term "charge" used in this patch series.
> From the patches, it seems like only a memcg stat is added and nothing
> is charged to the memcg.
> 
> This leads me to the question: Why add this stat in memcg if the
> underlying memory is not charged to the memcg and if we don't really
> want to limit the usage?
> 
> I see two ways forward:
> 
> 1. Instead of memcg, use bpf-rstat [1] infra to implement the
> per-cgroup stat for dmabuf. (You may need an additional hook for the
> stat transfer).
> 
> 2. Charge the actual memory to the memcg. Since the size of dmabuf is
> immutable across its lifetime, you will not need to do accounting at
> page level and instead use something similar to the network memory
> accounting interface/mechanism (or even more simple). However you
> would need to handle the reclaim, OOM and charge context and failure
> cases. However if you are not looking to limit the usage of dmabuf
> then this option is an overkill.

I think eventually, at least for other "account gpu stuff in cgroups" use
case we do want to actually charge the memory.

The problem is a bit that with gpu allocations reclaim is essentially "we
pass the error to userspace and they get to sort the mess out". There are
some exceptions (some gpu drivers to have shrinkers) would we need to make
sure these shrinkers are tied into the cgroup stuff before we could enable
charging for them?

Also note that at least from the gpu driver side this is all a huge
endeavour, so if we can split up the steps as much as possible (and get
something interim useable that doesn't break stuff ofc), that is
practically need to make headway here. TJ has been trying out various
approaches for quite some time now already :-/
-Daniel

> Please let me know if I misunderstood something.
> 
> [1] https://lore.kernel.org/all/20220824233117.1312810-1-haoluo@google.com/
> 
> thanks,
> Shakeel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
