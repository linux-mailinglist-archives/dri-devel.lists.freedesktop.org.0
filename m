Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57A30EE6A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17886ECFE;
	Thu,  4 Feb 2021 08:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2EB6EBA7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 20:20:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id m2so1012459wmm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 12:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rQ5+s8Uk/H2oUlPmQuXd+AT/EsL+cy8XeHexkKTVc0E=;
 b=wF/rgZvrmNhkDzljRbPYVIrL/H2wS+pSUpCdb7G7+Fj6i5vSdKQnM37ReU+MD+ArRd
 2ghIxhZVuC+i53i9hTJ8wEVOvIr8QzDabNFResmUnO4dR538GmS7MxCX/njpfqRjiyAn
 aPHUyjusLDv3xbmqBaem/cNiuxjgZBbLr2dk5+fo4uFT3eJnYs1kHI3zxP+u7/URDkuS
 wosL4PpFkWfj1gWV9QDIoC/0llJ9BBwhR7ZF7y7xRkl3JqtAr55SRhXoWoMqpfYYpFZw
 OXRadXgMpftHwXMfkhrdj7EdYEV8078wDokZSAlMUQHMljaLnBxMAVzhvS/k2FB+eKEv
 g85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rQ5+s8Uk/H2oUlPmQuXd+AT/EsL+cy8XeHexkKTVc0E=;
 b=IZbGW2ktbLPKbZY6ICseKKd1AtDAuQ9nzX8MD5fxMzuqJ1+dMPlev2mAxuRWxssqC0
 bCh2QiK6uDpAhFDTZRYOHGLcs0+HFhcFKQ7gVwagbLDDIJZr8iLaw0hBdXWLyEkW9Hxi
 x5Bp3gnvSGCBzC2ghprHPZJDEbpgJ8cDkS3hugnKIsWNPr6B9gXvGPIza8YzLuTDwTjD
 9dolzku3E12szNOqBlNXFAAtzMJ2KCyqM1NhEKGDUv0W4uGq9riwAWiN+kvd5kwLFpwH
 Ah9/21It15b50nnuk6Tn2vlOINMjnqXYaxKYQQsxkjVtTfNuTgyo/VmHfcWY6H/WtQwO
 Ciqw==
X-Gm-Message-State: AOAM532fe31d0VhnRkbw5W8zJHxE4D/XowlPWHq9nTx+t4NocwHiWbrl
 XUtcY8oJP6Y8gOtCgchCv8zdC+o8PWgRrLnjVRCwNA==
X-Google-Smtp-Source: ABdhPJzotWwFJQ5FuudypJrg8p0gib5+AD54pH90o3lu7MbwZq0qzxIhjvQznVGTMfdsS9bLXHdCY/6M0s0OBT9Olnc=
X-Received: by 2002:a1c:4b05:: with SMTP id y5mr4326474wma.37.1612383612621;
 Wed, 03 Feb 2021 12:20:12 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203015553.GX308988@casper.infradead.org>
 <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
In-Reply-To: <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Feb 2021 12:20:01 -0800
Message-ID: <CAJuCfpG4GkVbeW=bB+Qrm5GPrZAwg0_rmyG05iwQmL7GrWAYHw@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
Cc: Christoph Hellwig <hch@infradead.org>, Sandeep Patil <sspatil@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Minchan Kim <minchan@kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Android Kernel Team <kernel-team@android.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 3, 2021 at 12:52 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Wed, Feb 3, 2021 at 2:57 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> > > Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> > > WARN_ON_ONCE and returning an error. This is to ensure users of the
> > > vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> > > and get an indication of an error without panicing the kernel.
> > > This will help identifying drivers that need to clear VM_PFNMAP before
> > > using dmabuf system heap which is moving to use vm_insert_page.
> >
> > NACK.
> >
> > The system may not _panic_, but it is clearly now _broken_.  The device
> > doesn't work, and so the system is useless.  You haven't really improved
> > anything here.  Just bloated the kernel with yet another _ONCE variable
> > that in a normal system will never ever ever be triggered.
>
> Also, what the heck are you doing with your drivers? dma-buf mmap must
> call dma_buf_mmap(), even for forwarded/redirected mmaps from driver
> char nodes. If that doesn't work we have some issues with the calling
> contract for that function, not in vm_insert_page.

The particular issue I observed (details were posted in
https://lore.kernel.org/patchwork/patch/1372409) is that DRM drivers
set VM_PFNMAP flag (via a call to drm_gem_mmap_obj) before calling
dma_buf_mmap. Some drivers clear that flag but some don't. I could not
find the answer to why VM_PFNMAP is required for dmabuf mappings and
maybe someone can explain that here?
If there is a reason to set this flag other than historical use of
carveout memory then we wanted to catch such cases and fix the drivers
that moved to using dmabuf heaps. However maybe there are other
reasons and if so I would be very grateful if someone could explain
them. That would help me to come up with a better solution.

> Finally why exactly do we need to make this switch for system heap?
> I've recently looked at gup usage by random drivers, and found a lot
> of worrying things there. gup on dma-buf is really bad idea in
> general.

The reason for the switch is to be able to account dmabufs allocated
using dmabuf heaps to the processes that map them. The next patch in
this series https://lore.kernel.org/patchwork/patch/1374851
implementing the switch contains more details and there is an active
discussion there. Would you mind joining that discussion to keep it in
one place?
Thanks!

> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
