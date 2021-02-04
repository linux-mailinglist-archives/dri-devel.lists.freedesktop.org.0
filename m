Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56130FDFA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 21:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CE06EE66;
	Thu,  4 Feb 2021 20:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814F76EE67
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 20:20:09 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id k25so5026407oik.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 12:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wpgT6Yz8SEv8X0iAsr6guPodAvl5pFjIWmhOvi/hibA=;
 b=Xpi3ivwmVLdqOvs1N6dWfJPh+KUCL6ESv/15EWzkk0SYh5UrDZbnAFeuQ0LjKLDPJ7
 De9JuaYPvilTUPbN7e/X9v+MAUVlzWXjljZf3QA9W/YfZZpTGY/2YH7tJ7fp5LhhaJ1E
 TecADaHNqVMOJ3iZ/L1xhrSQ2gaVbYy3ceflA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wpgT6Yz8SEv8X0iAsr6guPodAvl5pFjIWmhOvi/hibA=;
 b=qQHUbf7NDH07B0Hh9qlbSOHiNnrQTV8qMBlFxht/Oba3tYK39qtcr6EQoOV4uhWBpU
 GBSS/VfYbcO9NmBGr3AywS0fK1nP04V0R6rLSiOCgN3PRkAPEJBXyEVcEV+HqdKloRGd
 19v7OlO1mQbRHjIRvhb26VW0Be5NnvImWXqcxMfglAFEZtkDGb8H3N+ZFWZI4XZf+Xjc
 uUz6BAkNsXFZ7WGxZ3Xyka2RIs3myFRKtpgAn3cYNJkhyqqt0whNT5q9TeW0i0zKTbyo
 PM2RwxZyDq4qxWGfU8k6XmFF88BDoVL6O5Vu7bq5y9ERABuaFcPzABSrThUofINdJLOq
 xVMA==
X-Gm-Message-State: AOAM5337EXeX9kKKKKdz7foKNarn4rWr1hJYX6xpsncdbRoB+kRK7nKj
 XnJeF2JGrxyq6IEKf7uvq3lkvVET0SmyvSMivPsjXA==
X-Google-Smtp-Source: ABdhPJx/eLdhIzXnP9kqJ04S5q7V3UVm0UNcMndwh3kT46QCp6BCgQGHr/UZJ84rtpMCXuoIRTD3gtusKXypuS6WNDw=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr845032oia.14.1612470008816; 
 Thu, 04 Feb 2021 12:20:08 -0800 (PST)
MIME-Version: 1.0
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca>
 <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
 <20210204183808.GY4718@ziepe.ca>
 <CAKMK7uFBzF00zTzAE5b7PJFUfmxp5ExbSQxfcOfd_P6dPm7k9A@mail.gmail.com>
 <20210204200918.GA4718@ziepe.ca>
In-Reply-To: <20210204200918.GA4718@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 4 Feb 2021 21:19:57 +0100
Message-ID: <CAKMK7uEU_TJEUF2go6WRuVn+=-DSD5kRw1beJhC_1Y4HTXbYVQ@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 9:09 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Feb 04, 2021 at 08:59:59PM +0100, Daniel Vetter wrote:
>
> > So I think just checking for VM_PFNMAP after the vma is set up should
> > be enough to guarantee we'll only have pte_special ptes in there,
> > ever. But I'm not sure, this stuff all isn't really documented much
> > and the code is sometimes a maze (to me at least).
>
> Yes, that makes sense. VM_PFNMAP and !VM_MIXEDMAP seems like the right
> check after the VMA is populated
>
> But how do you stuff special pfns into a VMA outside the fault
> handler?

Many drivers we have don't have dynamic buffer management (kinda
overkill for a few framebuffers on a display-only IP block), so the
just remap_pfn_range on ->mmap, and don't have a fault handler at all.

Or I'm not understanding what you're asking?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
