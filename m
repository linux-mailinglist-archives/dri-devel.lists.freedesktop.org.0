Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AF30D599
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590586EA16;
	Wed,  3 Feb 2021 08:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF656EA16
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 08:52:33 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id 36so22636835otp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 00:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gXUrCQnAejSUnzy7G5KQj25VP/AJcEkhVg3Q+PK8vz4=;
 b=h89NNkJ28dLA7gdauHFsbCLgf6ShwELHkxmLj9kk3FjCsOPPRSFu5NoS75J7NXyryC
 AnUfyRIg5e9tkqHC6oD1I2yEEZn92J7PRB0ijtGjwLJswlozN8neKq3iV/DJEG8czCN9
 nMTjMXEZmZc7MnsH32Y4HaCC9Qg5+gP1bAYds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gXUrCQnAejSUnzy7G5KQj25VP/AJcEkhVg3Q+PK8vz4=;
 b=X10f9+QAGmg80yrtCGWm8oMHKu49ldEjZh1Sk/MVeuKW8lv1kfuJ6mL5ppC3msysrP
 KF7wIHvw3JXkUydhzChCn7rs/nvnh4LfyyKM8mrMvQoBiNoKZPCXGLLgbijCeSixWXzh
 MkUW33F/6kq5xYLQpxzYTMhrNn5yJFwmqn2j+WE/dZjIkQqtASfDk5gcoVWaZ7VO4Qs7
 mWx6TPhufaWcsGOAAVpi3jEoRYYX0nJ9UkRxl1E8En/R2vzZDLJJz4WgbFOC215oPjuS
 lpzhW5Dj/YBO15jizJ6hzWrNfXl48oCADWSST7b4j4z8iyOAWwZKtDD/qQ7Q60vnHbuV
 lkEQ==
X-Gm-Message-State: AOAM533YsNp54bqus2HI5plkNlvNd9rx2GHNuOJIH4EtUPPD1gvOEvN/
 uCofnqV3J19uH1TJJQ8skZ1tVdrDkOVTVwjPcseqwA==
X-Google-Smtp-Source: ABdhPJxq0ZEI6IC6j0hBli9D1xyK0kKminNBfdIJ8J0cuKUE95JWskdN1yRslq7D4jprmId2dxKIg9w+bU/AkYBdsjY=
X-Received: by 2002:a9d:2265:: with SMTP id o92mr1340983ota.188.1612342353066; 
 Wed, 03 Feb 2021 00:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203015553.GX308988@casper.infradead.org>
In-Reply-To: <20210203015553.GX308988@casper.infradead.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 3 Feb 2021 09:52:22 +0100
Message-ID: <CAKMK7uHnNdjOYX5Rhj=uGMz7hSz12JhgkZJCfiqgkpjXnMfL4A@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] mm: replace BUG_ON in vm_insert_page
 with a return of an error
To: Matthew Wilcox <willy@infradead.org>
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
 Linux MM <linux-mm@kvack.org>, Suren Baghdasaryan <surenb@google.com>,
 James Jones <jajones@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Minchan Kim <minchan@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Android Kernel Team <kernel-team@android.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 3, 2021 at 2:57 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Feb 02, 2021 at 04:31:33PM -0800, Suren Baghdasaryan wrote:
> > Replace BUG_ON(vma->vm_flags & VM_PFNMAP) in vm_insert_page with
> > WARN_ON_ONCE and returning an error. This is to ensure users of the
> > vm_insert_page that set VM_PFNMAP are notified of the wrong flag usage
> > and get an indication of an error without panicing the kernel.
> > This will help identifying drivers that need to clear VM_PFNMAP before
> > using dmabuf system heap which is moving to use vm_insert_page.
>
> NACK.
>
> The system may not _panic_, but it is clearly now _broken_.  The device
> doesn't work, and so the system is useless.  You haven't really improved
> anything here.  Just bloated the kernel with yet another _ONCE variable
> that in a normal system will never ever ever be triggered.

Also, what the heck are you doing with your drivers? dma-buf mmap must
call dma_buf_mmap(), even for forwarded/redirected mmaps from driver
char nodes. If that doesn't work we have some issues with the calling
contract for that function, not in vm_insert_page.

Finally why exactly do we need to make this switch for system heap?
I've recently looked at gup usage by random drivers, and found a lot
of worrying things there. gup on dma-buf is really bad idea in
general.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
