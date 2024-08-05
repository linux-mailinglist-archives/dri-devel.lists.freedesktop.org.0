Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774519480BB
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E956210E26F;
	Mon,  5 Aug 2024 17:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LB7smZ3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 837AE10E26F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:53:34 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5b1a00750a4so4657a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722880413; x=1723485213; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cEa+YT/mVCcUD9GpjPevIJZLtJmVc6lmcDDNejfBO+w=;
 b=LB7smZ3S3EfTCfaKEiKnkRlc8RZV6UZlgFnCiElX+H+oQj2gZfGVODlemvb4GFLNxj
 KzUXS6ubRakmELtrIM9Hr5y46xMFI1Mett+DpE+/fP6Lce9gzE9a0dnwg17IIsVAwVkm
 94h6yyZ21R7qyNqq8WcjYGkizv9MJZyXMb/s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722880413; x=1723485213;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cEa+YT/mVCcUD9GpjPevIJZLtJmVc6lmcDDNejfBO+w=;
 b=Tbn1B4HzfYdhYBid1GgEGgKMfyqHwcBURRVNTOTapHFn1xbUG25dKp2Z8l254TQFKb
 Ibbor8K+bkfM4sq/vUpixJIrXjFT22szHkt1NXXmY8444dHFtauvuHV/L2oSH+ON4N7/
 Vm8Y44CPUFHXtXUCjXo4i/0wa8YYW77MSfiXJsuUwVDZxY1n4C1q6NUTPcEVUr4CRtCK
 M0mOWDKjmYzC+T5plYV9Coq7v8oRwP5L9/y1n4jaUVdiz1ko71dBIVOFcT6c5RcIzEZS
 boETjMuJAJvo8MNyLDUYrrSfalHGmtOKn50rxAiMToUq75/jgP7HH9qt4RfkqV2xSzdp
 rg4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYuVGWRlqb1vrzfApQ+XCkoltxp21TUbQfa+l+nh9xG1O06R2PLjGgDeBV2+hmugQmVLa06AMUVjtb6B9X4o5PTCgL3I69GlAHkBpw3M8U
X-Gm-Message-State: AOJu0YwgiGjGVMObIokNd25eZ4VnW0viS7VYKR3St5VZ20UjJFOEdCwb
 o9/cbsDY1o1QQPO5upe7xhM/+J1FHuuEdDpMMmORVrFGjunBbD4aiEU3uhDA834=
X-Google-Smtp-Source: AGHT+IGlF5DiKdBDow/gpp4uHOITP01+3OGMKycpIkbo2FerV/n9VK31oyha5PyJpYnERo4T2I9irQ==
X-Received: by 2002:a17:907:3f29:b0:a72:499a:e5ba with SMTP id
 a640c23a62f3a-a7dc50f07d0mr706646266b.7.1722880412461; 
 Mon, 05 Aug 2024 10:53:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bcc86asm472899466b.28.2024.08.05.10.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 10:53:31 -0700 (PDT)
Date: Mon, 5 Aug 2024 19:53:30 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Huan Yang <link@vivo.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
Message-ID: <ZrERmndxBS5xUvuE@phenom.ffwll.local>
Mail-Followup-To: Huan Yang <link@vivo.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <Zqiqv7fomIp1IPS_@phenom.ffwll.local>
 <25cf34bd-b11f-4097-87b5-39e6b4a27d85@vivo.com>
 <37b07e69-df85-45fc-888d-54cb7c4be97a@vivo.com>
 <Zqqing7M2notp6Ou@phenom.ffwll.local>
 <4e83734a-d0cf-4f8a-9731-d370e1064d65@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e83734a-d0cf-4f8a-9731-d370e1064d65@vivo.com>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Thu, Aug 01, 2024 at 10:53:45AM +0800, Huan Yang wrote:
> 
> 在 2024/8/1 4:46, Daniel Vetter 写道:
> > On Tue, Jul 30, 2024 at 08:04:04PM +0800, Huan Yang wrote:
> > > 在 2024/7/30 17:05, Huan Yang 写道:
> > > > 在 2024/7/30 16:56, Daniel Vetter 写道:
> > > > > [????????? daniel.vetter@ffwll.ch ?????????
> > > > > https://aka.ms/LearnAboutSenderIdentification?????????????]
> > > > > 
> > > > > On Tue, Jul 30, 2024 at 03:57:44PM +0800, Huan Yang wrote:
> > > > > > UDMA-BUF step:
> > > > > >     1. memfd_create
> > > > > >     2. open file(buffer/direct)
> > > > > >     3. udmabuf create
> > > > > >     4. mmap memfd
> > > > > >     5. read file into memfd vaddr
> > > > > Yeah this is really slow and the worst way to do it. You absolutely want
> > > > > to start _all_ the io before you start creating the dma-buf, ideally
> > > > > with
> > > > > everything running in parallel. But just starting the direct I/O with
> > > > > async and then creating the umdabuf should be a lot faster and avoid
> > > > That's greate,  Let me rephrase that, and please correct me if I'm wrong.
> > > > 
> > > > UDMA-BUF step:
> > > >    1. memfd_create
> > > >    2. mmap memfd
> > > >    3. open file(buffer/direct)
> > > >    4. start thread to async read
> > > >    3. udmabuf create
> > > > 
> > > > With this, can improve
> > > I just test with it. Step is:
> > > 
> > > UDMA-BUF step:
> > >    1. memfd_create
> > >    2. mmap memfd
> > >    3. open file(buffer/direct)
> > >    4. start thread to async read
> > >    5. udmabuf create
> > > 
> > >    6 . join wait
> > > 
> > > 3G file read all step cost 1,527,103,431ns, it's greate.
> > Ok that's almost the throughput of your patch set, which I think is close
> > enough. The remaining difference is probably just the mmap overhead, not
> > sure whether/how we can do direct i/o to an fd directly ... in principle
> > it's possible for any file that uses the standard pagecache.
> 
> Yes, for mmap, IMO, now that we get all folios and pin it. That's mean all
> pfn it's got when udmabuf created.
> 
> So, I think mmap with page fault is helpless for save memory but increase
> the mmap access cost.(maybe can save a little page table's memory)
> 
> I want to offer a patchset to remove it and more suitable for folios
> operate(And remove unpin list). And contains some fix patch.
> 
> I'll send it when I test it's good.
> 
> 
> About fd operation for direct I/O, maybe use sendfile or copy_file_range?
> 
> sendfile base pipe buffer, it's low performance when I test is.
> 
> copy_file_range can't work due to it's not the same file system.
> 
> So, I can't find other way to do it. Can someone give some suggestions?

Yeah direct I/O to pagecache without an mmap might be too niche to be
supported. Maybe io_uring has something, but I guess as unlikely as
anything else.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
