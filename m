Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A836285E9F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 14:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF5B6E8C8;
	Wed,  7 Oct 2020 12:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE136E8C8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 12:01:56 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id m13so1883703otl.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BPNKg367DCdKIY1liYpuVsKddqsM3ARJiczmrER9Tlk=;
 b=PyaZ/nvZm2QUtaJTzV68PXra5E6nusMzfq2GtX+T4KHdWVm++EJydv/8XaGh5nYPu2
 kpLCfkP523at8+kzTLYGiJF/U5HARJ4ZwyhXlTfgO1W6ZvOLzle/fawTahYRmxpmawyG
 M2mKVfCZhp95638KHshmfZX9XnDxeTLsbzpOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BPNKg367DCdKIY1liYpuVsKddqsM3ARJiczmrER9Tlk=;
 b=nAXz6ebwK4ytQi2riaxk2TIPgpdPKfUH5O53Mc8R101EleXBFsD/Weh+vHviM7Ke7P
 vXEqJ4hoznAONW77i8qPv8P4/qQg6I2EIF5LsoVDWCHjJPspSR84HA2kG3m99GGgNl9D
 xjLIdVV3aQ8PeyxsV90an5Ax31hJHL5gDhTqqZA4aeQpZHn2Zj0tsq7xd1yk/Xt1SWTK
 OSLrYTCyz8J91nyCtdO0g/DdVwPj8IW157WO2hn8i5FfoZcsF/1N++LIPiQQ4qjSTT5O
 mhChUY9PjCtQEeYIr7lMLRDW8YrnXqal5wXfCMm/19zTR6NbEy5WfzgR77RKIzwlUmm/
 tWPQ==
X-Gm-Message-State: AOAM5322t5ADiKcez+ZwXLUmFtmZWc/OqfkjvP/mg+a7Wzy/YfuM+B/p
 0K/fJW76750TdMoLmx39ZiKZJ4VrTNr/WF4JUTcvXg==
X-Google-Smtp-Source: ABdhPJwz1+Mjs5/TsMc3YtWSj3uN1hN+EFq4HjqQKny0ZO2DNmwXaAg21800jfJ4gXIzTu9U81dtoIfG8VEkup1Khs8=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr1747283ote.188.1602072115550; 
 Wed, 07 Oct 2020 05:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
 <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
 <20201002233118.GM9916@ziepe.ca>
 <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
 <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
 <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
In-Reply-To: <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Oct 2020 14:01:44 +0200
Message-ID: <CAKMK7uF+a1PSn+e-6F+YhkSXn9vC7etS-z0AFBMCU+Vzb2PwqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Pawel Osciak <pawel@osciak.com>, Linux MM <linux-mm@kvack.org>,
 John Hubbard <jhubbard@nvidia.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 7, 2020 at 12:47 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Daniel,
>
> On 03.10.2020 11:40, Daniel Vetter wrote:
> >> After he three places above should use pin_user_pages_fast(), then
> >> this whole broken API should be moved into videobuf2-memops.c and a
> >> big fat "THIS DOESN'T WORK" stuck on it.
> >>
> >> videobuf2 should probably use P2P DMA buf for this instead.
> > Yup this should be done with dma_buf instead, and v4l has that.
>
> Yes, V4L2 has dma_buf support NOW. That days, using so called V4L2
> USERPTR method was the only way to achieve zero copy buffer sharing
> between devices, so this is just a historical baggage. I've been
> actively involved in implementing that. I've tried to make it secure as
> much as possible assuming the limitation of that approach. With a few
> assumptions it works fine. Buffers are refcounted both by the
> vm_ops->open or by incrementing the refcount of the vm->file. This
> basically works with any sane driver, which doesn't free the mmaped
> buffer until the file is released. This is true for V4L2 and FBdev devices.

I'm not seeing any of that vm->file refcounting going on, so not
seeing anything that prevents the mmap area from being removed. Can
you pls give me some pointers about which code you're thinking of?
-Daniel

> This API is considered as deprecated in V4L2 world, so I think
> supporting this hack can be removed one day as nowadays userspace should
> use dma buf.
>
>  > ...
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
