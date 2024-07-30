Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2DB940C65
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 10:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD2F10E244;
	Tue, 30 Jul 2024 08:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="V3YZRlCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0EF10E244
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 08:56:35 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-368633ca4ffso450083f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 01:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722329794; x=1722934594; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WgtHQjzcSzhXJxDV9mdj343ETcHxolzhEYRr9t1Zx5Q=;
 b=V3YZRlCycKsVEEbNdLiXWNsNu9DYUY3FXNpw3ipjfoXiV0I8K1qkQDQ84VzY603MJ0
 nQFKmH+rf61pZFfF9n284ZwDCWmyp2ZsSqMJJZbTfeTWFCUyguPCNm2wqHodDcRhCkeS
 z/uDw6t9JsLltyAAdCviK92Wd6+qTcPHG2X9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722329794; x=1722934594;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WgtHQjzcSzhXJxDV9mdj343ETcHxolzhEYRr9t1Zx5Q=;
 b=c4pVHN9sKglMAVCclqn9UP4hG+hzk9H+MNOg8Emwns5vRKrGru5UJMow+KD2pK/79W
 dShE2eGe4eZGUX0D5RqWjk6iPMRi3cBfbENjq2Otxm5o/RGxOUvclrLXxOnJlkPkjJOp
 UtCi2aJVfbvyp0+Getth4pXEhBIkQhRTIMYu5m6UlN3Xs+MyynPiwQzlWuIFWZdbHtgo
 ctNJIkClWbOjMQkx0HUripekPRTgfQhQBi5Wimfi1UZgymQlEtNS6rWFmRkTF/q1d5Qc
 xejdMEJKPfSv389MMjhz1IsoA9r+D+nVtdipJ2pbOzurjl8FUoe6FoxTns4Z88a7Qrnz
 15Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/rahMcK6XapiGi6m9dhRG0dBA9LhWfhUYkV1Oqap18RTEE2e0fh9OF3g0prN93Ldgqvxz0lkJDs4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAJnyEr/bS3CyEUqM5ZQt6tiL7qCvxGNmcfYjjJOMDuB520JXF
 6Qfb+bAw50uX8j4pDFulr81xOxwZ8CJcfRR3JCeSoHVLkewGc2L6+mF2dXO0RhE=
X-Google-Smtp-Source: AGHT+IHIY4OWsp+8at+vnJLgPPIkNjmZcLBJITV+uKHf3I0BGxZGznhKnrOaDTRFuZSQOzI7tUwvqA==
X-Received: by 2002:a5d:5f53:0:b0:368:aa2:2b4e with SMTP id
 ffacd0b85a97d-36b34d23accmr6470380f8f.4.1722329794226; 
 Tue, 30 Jul 2024 01:56:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367c028bsm14070438f8f.24.2024.07.30.01.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 01:56:33 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:56:31 +0200
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
Message-ID: <Zqiqv7fomIp1IPS_@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730075755.10941-1-link@vivo.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Tue, Jul 30, 2024 at 03:57:44PM +0800, Huan Yang wrote:
> UDMA-BUF step:
>   1. memfd_create
>   2. open file(buffer/direct)
>   3. udmabuf create
>   4. mmap memfd
>   5. read file into memfd vaddr

Yeah this is really slow and the worst way to do it. You absolutely want
to start _all_ the io before you start creating the dma-buf, ideally with
everything running in parallel. But just starting the direct I/O with
async and then creating the umdabuf should be a lot faster and avoid
needlessly serialization operations.

The other issue is that the mmap has some overhead, but might not be too
bad.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
