Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139284B76C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9F7112C2E;
	Tue,  6 Feb 2024 14:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="k6ljQFPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1510112BDD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:30:40 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-40fd3b294beso6909765e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 05:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707226238; x=1707831038; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RsYkGdM7KmCkPXBNIy3sTIvZdpa98vAWS2UDOyFOwHA=;
 b=k6ljQFPyIcS8BOntKK8uW5exkp/JqkOnL5gpFu1mlSWOGZqeN/gfwl4YzGnDjaUGe4
 AgRXOnQ1OftlZJtdPCcKKD8rtqW+ptP4p9FiGNOl4VF0NG+dx0arJOjYIp/4Hxiy41//
 SA81Y5sCdJqMpY2gOB7krl+mWWrFLG+j7XMyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226238; x=1707831038;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RsYkGdM7KmCkPXBNIy3sTIvZdpa98vAWS2UDOyFOwHA=;
 b=J9xScY5wbdGewsdOxP6I343OCNcF5zNMo87agPVNnhW3aqmUG5anPdGQSN/b2sAO3m
 J3Cc5uNAoSSAmymGtTwSMrTzP3xwjs0tAHLyMRjXdqsXQcSnOFKqXPTElT4eRWyBMYvs
 QC5QiHt4olNCdFIoAYItu4iPhQMCS2O3RHDAXdh7kpdMTk2jkxvH+eao3mbceJncO9iv
 dn1hvi62BDCXcLQUfdHZE2LZbb/ULiFlbU7mHJIkCI/p069Wkn8f5W8/8dy4Md97DGBv
 IYEfHzITig3HtlNmzsQe+z9QwWAOB+5fC+1C01xIqCFMFMBBY1Ztz0/tBPCBzE5s+6xy
 EKGA==
X-Gm-Message-State: AOJu0YzS3Ul7600ejZ/eXy/0qJSO9qac9jmmgWQGO1ZzLVrrWGCL0zR+
 URKX63xCgEMtAt6ALH4EZ6F4XomwTv7IU4xnlJANPhB2ESQRmf37Ubo+1rCq454=
X-Google-Smtp-Source: AGHT+IFCB8s+7sYgzNhmn05fwzPqkFwBua36HlUBmKHloMm2zsA1gvjmRfvfqWQexeDh34pLU/c2ZA==
X-Received: by 2002:a05:600c:1c26:b0:40f:c34a:b69 with SMTP id
 j38-20020a05600c1c2600b0040fc34a0b69mr2207987wms.2.1707226238239; 
 Tue, 06 Feb 2024 05:30:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW9ivc+6+iu6716dc1/tI0KbY0A0fOWnFDVQoS2EZ1M99VQHAA3w5RZ2QIIU44dUIugWh2hLn+8np5ftqBJn3iHpjS9s4KFAltpBndMrtQwMd6CDwuUr6iaj0cV5KuETT0DDBRKpaWad8xVNzRATz3SwBdZJnvnGXpraY2U0fAiTPUxJs3o9czz1YhSiyjHF/o/5iHs+pmT2FD2cQunIUxLsrBpeDpo2A==
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 c11-20020adfa30b000000b0033b14f22180sm2160974wrb.20.2024.02.06.05.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:30:37 -0800 (PST)
Date: Tue, 6 Feb 2024 14:30:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dave Airlie <airlied@gmail.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, daniel@ffwll.ch,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/mgag200: Flush the cache to improve latency
Message-ID: <ZcI0e7VG_hE3bJh-@phenom.ffwll.local>
Mail-Followup-To: Dave Airlie <airlied@gmail.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, airlied@redhat.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20231019135655.313759-1-jfalempe@redhat.com>
 <660c0260-0e22-4e9c-ab13-157adaa0b14d@suse.de>
 <74b367bd-ac80-478b-8f82-e98cb6e40475@redhat.com>
 <f19a2cb4-57b6-427c-b69c-47a848420530@redhat.com>
 <CAPM=9twkLUFP+4aeKt+BRi4sO1c3hypq-dD33JKabHVQZ3oV9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twkLUFP+4aeKt+BRi4sO1c3hypq-dD33JKabHVQZ3oV9A@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
X-Mailman-Approved-At: Tue, 06 Feb 2024 14:08:39 +0000
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

On Mon, Feb 05, 2024 at 05:02:58PM +1000, Dave Airlie wrote:
> On Mon, 6 Nov 2023 at 20:47, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> >
> > On 23/10/2023 10:30, Jocelyn Falempe wrote:
> > > On 20/10/2023 14:06, Thomas Zimmermann wrote:
> > >> (cc'ing lkml for feedback)
> > >>
> > >> Hi Jocelyn
> > >>
> > >> Am 19.10.23 um 15:55 schrieb Jocelyn Falempe:
> > >>> We found a regression in v5.10 on real-time server, using the
> > >>> rt-kernel and the mgag200 driver. It's some really specialized
> > >>> workload, with <10us latency expectation on isolated core.
> > >>> After the v5.10, the real time tasks missed their <10us latency
> > >>> when something prints on the screen (fbcon or printk)
> > >>
> > >> I'd like to hear the opinion of the RT-devs on this patch. Because
> > >> AFAIK we never did such a workaround in other drivers. And AFAIK
> > >> printk is a PITA anyway.
> > >
> > > Most other drivers uses DMA, which means this workaround can't apply to
> > > them.
> > >
> > >>
> > >> IMHO if that RT system cannot handle differences in framebuffer
> > >> caching, it's under-powered. It's just a matter of time until
> > >> something else changes and the problem returns. And (honest question)
> > >> as it's an x86-64, how do they handle System Management Mode?
> > >
> > > I think it's not a big news, that the Matrox G200 from 1999 is
> > > under-powered.
> > > I was also a bit surprised that flushing the cache would have such
> > > effect on latency. The tests we are doing can run 24h with the
> > > workaround, without any interrupt taking more than 10us. Without the
> > > workaround, every ~30s the interrupt failed its 10us target.
> > >
> > >>
> > >>>
> > >>> The regression has been bisected to 2 commits:
> > >>> 0b34d58b6c32 ("drm/mgag200: Enable caching for SHMEM pages")
> > >>> 4862ffaec523 ("drm/mgag200: Move vmap out of commit tail")
> > >>>
> > >>> The first one changed the system memory framebuffer from Write-Combine
> > >>> to the default caching.
> > >>> Before the second commit, the mgag200 driver used to unmap the
> > >>> framebuffer after each frame, which implicitly does a cache flush.
> > >>> Both regressions are fixed by the following patch, which forces a
> > >>> cache flush after each frame, reverting to almost v5.9 behavior.
> > >>
> > >> With that second commit, we essentially never unmap an active
> > >> framebuffer console. But with commit
> > >>
> > >> 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_access
> > >> with vmap")
> > >>
> > >> we now again unmap the console framebuffer after the pageflip happened.
> > >>
> > >> So how does the latest kernel behave wrt to the problem?
> > >
> > > The regression was found when upgrading the server from v5.4 to v5.14,
> > > so we didn't test with later kernels.
> > > We will test with v6.3 (which should have 359c6649cd9a ) and see what it
> > > gives.
> >
> > I don't have a clear explanation, but testing with v6.3, and forcing the
> > Write Combine, doesn't fix the latency issue. So forcing the cache flush
> > is still needed.
> >
> > Also, on some systems, they use "isolated cpu" to handle RT task, but
> > with a standard kernel (so without the CONFIG_PREEMPT_RT).
> > So I'm wondering if we can use a kernel module parameter for this,
> > so that users that wants to achieve low latency, can opt-in ?
> >
> > something like mgag200.force_cache_flush=1 or mgag200.low_latency=1 ?
> 
> I think we should either add a config option or command line parameter here.

Yeah I think the situation is cursed enough that we need that, and module
option for mgag200 sounds like the most reasonable way.

> I'd don't think adding nopat to the kernel command line is a good
> suggestion in the long run, servers often have other cards plugged
> into them like nvidia gpus or rdma etc, you don't want to cripple them
> because you want reduced latency on the crappy on-board.
> 
> I'd rather we put the default back to what it used to be, which was
> flush the cache though, I'm not sure why we have any objection to
> doing that, it used to work, it was clearly fine in operation, why
> undo it?

Uh that default is a few patches back and I think it's not great if we
change that, since it means all drivers using shadow buffers for fdbev
will again suffer from rendering fbcon into a wc instead of wb buffer.

But Jocelyn has meanwhile dug out more info in another reply, I'll reply
there.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
