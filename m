Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205D4943753
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 22:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2748810E6C8;
	Wed, 31 Jul 2024 20:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="G+DIwsvI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA2510E6C8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 20:46:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-42803adb420so5974115e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 13:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722458785; x=1723063585; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZxpiuYMhfG8wroCEpsj+T0XsF8n6WcrGB7EkeYVEIFg=;
 b=G+DIwsvI3jzmWBqLWJlzOnhz8plB5x8pPWOSIaBOwZ0ktCw1XqM1oavKKow9JtZHa6
 3EGMhhIlK7Kun+KUuKp4caD/z5CZHJOpeCkB2ZSkkTJes4z+c/d4ARJV74s6J1DrGnwZ
 9RkeVrex6N9BNsgHncivJAl2pF/YxYjF1EKC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722458785; x=1723063585;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZxpiuYMhfG8wroCEpsj+T0XsF8n6WcrGB7EkeYVEIFg=;
 b=AeP+UIrkevSZSfD2ETPStidzphr6llZxlYXRSM09ZDwc/8qR7DnH2wFtrlBBpTd4VA
 MAG5ct2BkKcswxyMo/YsKXJT7V8d36UMIye1mmQ1NgUJeOgnAXXyPoTnj6TvN+VfFidB
 4m2mTdTwn7/GPN8Ck8xz+shC5Vamu1gUJg/D5Becr5/+ODEG053A0b47rgx8PWPrCr28
 9MsKIyVg+5H2mVrJvaP5LmMUZ0r0zlKbA2a0O1ZAf0nmV0u0Wn75RQR+vZo+ssuu5h15
 5Bem/sKA2qpwLHYl+GD1WnmBTK/8Jp5sYC4Jk9V7zjdP4OcjdRmzHOqT+z8Dv7WuN0Vx
 aARw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3Hgc0TCyGtzDYXZ4DUOY+C7ZpmR3dNHH3CuWHSCsS7Ohlf1r9p7mroQKvauMFzTGUPGX/UAFB5l0Hs2eoDjkfb5u/HfBUyICmnRkb2qwK
X-Gm-Message-State: AOJu0YzOZq7xv9wlYEpKJy2XqTyyu3hzOqK79om2kb5ok+USMhvAMnKl
 TTHauyTZujumlJJWz/jc4HkhxMbH9rFnDi2n7ialMETB95idJXvIY2+Hw1GUZcg=
X-Google-Smtp-Source: AGHT+IEOfnwTGBUJMCvgdzsVYm/9gkwgL+/zq/em2Ac2MZaEU7lsjUilDMlqzOjNzanNWiAy/HCT3A==
X-Received: by 2002:a05:600c:458e:b0:426:6358:7c5d with SMTP id
 5b1f17b1804b1-428b4ae9a29mr2485615e9.4.1722458785050; 
 Wed, 31 Jul 2024 13:46:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282b8a246asm33360225e9.3.2024.07.31.13.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 13:46:24 -0700 (PDT)
Date: Wed, 31 Jul 2024 22:46:22 +0200
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
Message-ID: <Zqqing7M2notp6Ou@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37b07e69-df85-45fc-888d-54cb7c4be97a@vivo.com>
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

On Tue, Jul 30, 2024 at 08:04:04PM +0800, Huan Yang wrote:
> 
> 在 2024/7/30 17:05, Huan Yang 写道:
> > 
> > 在 2024/7/30 16:56, Daniel Vetter 写道:
> > > [????????? daniel.vetter@ffwll.ch ?????????
> > > https://aka.ms/LearnAboutSenderIdentification?????????????]
> > > 
> > > On Tue, Jul 30, 2024 at 03:57:44PM +0800, Huan Yang wrote:
> > > > UDMA-BUF step:
> > > >    1. memfd_create
> > > >    2. open file(buffer/direct)
> > > >    3. udmabuf create
> > > >    4. mmap memfd
> > > >    5. read file into memfd vaddr
> > > Yeah this is really slow and the worst way to do it. You absolutely want
> > > to start _all_ the io before you start creating the dma-buf, ideally
> > > with
> > > everything running in parallel. But just starting the direct I/O with
> > > async and then creating the umdabuf should be a lot faster and avoid
> > That's greate,  Let me rephrase that, and please correct me if I'm wrong.
> > 
> > UDMA-BUF step:
> >   1. memfd_create
> >   2. mmap memfd
> >   3. open file(buffer/direct)
> >   4. start thread to async read
> >   3. udmabuf create
> > 
> > With this, can improve
> 
> I just test with it. Step is:
> 
> UDMA-BUF step:
>   1. memfd_create
>   2. mmap memfd
>   3. open file(buffer/direct)
>   4. start thread to async read
>   5. udmabuf create
> 
>   6 . join wait
> 
> 3G file read all step cost 1,527,103,431ns, it's greate.

Ok that's almost the throughput of your patch set, which I think is close
enough. The remaining difference is probably just the mmap overhead, not
sure whether/how we can do direct i/o to an fd directly ... in principle
it's possible for any file that uses the standard pagecache.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
