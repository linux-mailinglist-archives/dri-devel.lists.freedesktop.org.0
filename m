Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F02C3B7D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B166E879;
	Wed, 25 Nov 2020 09:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F1A6E879
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 09:00:54 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id h19so1599324otr.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 01:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cb0IyYfwRRpwkSMXLoK5meWkqSB6m3aHpp32lgtuG5E=;
 b=JkicOjiQYuUe4qC0NCYmxG5Jf2Qdd6VpUQG0aEBdA3L/hZkGUrza6gxYa2hMmPMY/s
 ewVWRJYqWnQURjTZ+yFTAdl1Ez4sxo1/0FaXREz0psNNjo/Ewp3/C0rJLjM2dFGW9gyu
 BSTEd4SBqAlo0o+/0PsIWfkx3MMZ6g5rTd+P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cb0IyYfwRRpwkSMXLoK5meWkqSB6m3aHpp32lgtuG5E=;
 b=tL13aMPaxJnBhYhQ+fDBWpDScFK8fbilokBPEHqG3uJ1YxEjwDP1zrA8JmDLCHv7mI
 1VjdZGy+Cpd4mXVmtwWG8cFUAkR+7ioQvUD7vYCeoZYa9siZoyivWRnGJ38uSkTYlEvf
 XHF03s0cdmgqytb6YK7SpXTL7TCAuWPJPdFcIRiPx9c/T+cSpogPd5qpdUtmDf4yOMW0
 Foi579jWG3qWSehLdKPA5o4tIvsU8stppnqIj3s2yaCjwC/hzPYk7DJkYiFZvFQmWiUA
 pFz7OKqJ/sf8pottl1GwQ3x0Z3mlPZdzctwNNFb6yCJwjRk570He/dRTi1QXZ5PpY90n
 xAUA==
X-Gm-Message-State: AOAM532BaUqvhhLs8Cw06tp0Lvmp5Dl65dLZslAAInQdySlowCCC3nJt
 2+B/Ely7UDFVwkL94RhDYmE0VPxeUsHDoPMZmLWsqg==
X-Google-Smtp-Source: ABdhPJzdLrBChJNmwAufHSFyRkbYFLtVRK1HD1rbwhJfrbBBuHxsolU3fINxVDwgeq07RNzsEDacWevGKQb60NxLVLQ=
X-Received: by 2002:a05:6830:3155:: with SMTP id
 c21mr2109430ots.281.1606294853508; 
 Wed, 25 Nov 2020 01:00:53 -0800 (PST)
MIME-Version: 1.0
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-18-daniel.vetter@ffwll.ch>
 <20201120183029.GQ244516@ziepe.ca>
 <20201124142814.GM401619@phenom.ffwll.local> <20201124155526.GH5487@ziepe.ca>
In-Reply-To: <20201124155526.GH5487@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 25 Nov 2020 10:00:42 +0100
Message-ID: <CAKMK7uESguiML9eBonfU59T9fcfP4x18t=+nLdV8kMSc4mrs8A@mail.gmail.com>
Subject: Re: [PATCH v6 17/17] RFC: mm: add mmu_notifier argument to follow_pfn
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 KVM list <kvm@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 9:13 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Nov 24, 2020 at 03:28:14PM +0100, Daniel Vetter wrote:
> > On Fri, Nov 20, 2020 at 02:30:29PM -0400, Jason Gunthorpe wrote:
> > > On Thu, Nov 19, 2020 at 03:41:46PM +0100, Daniel Vetter wrote:
> > > > @@ -4805,21 +4824,15 @@ EXPORT_SYMBOL(follow_pte_pmd);
> > > >   * Return: zero and the pfn at @pfn on success, -ve otherwise.
> > > >   */
> > > >  int follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > > > - unsigned long *pfn)
> > > > + unsigned long *pfn, struct mmu_notifier *subscription)
> > > >  {
> > > > - int ret = -EINVAL;
> > > > - spinlock_t *ptl;
> > > > - pte_t *ptep;
> > > > + if (WARN_ON(!subscription->mm))
> > > > +         return -EINVAL;
> > > >
> > > > + if (WARN_ON(subscription->mm != vma->vm_mm))
> > > > +         return -EINVAL;
> > >
> > > These two things are redundant right? vma->vm_mm != NULL?
> >
> > Yup, will remove.
> >
> > > BTW, why do we even have this for nommu? If the only caller is kvm,
> > > can you even compile kvm on nommu??
> >
> > Kinda makes sense, but I have no idea how to make sure with compile
> > testing this is really the case. And I didn't see any hard evidence in
> > Kconfig or Makefile that mmu notifiers requires CONFIG_MMU. So not sure
> > what to do here.
>
> It looks like only some arches have selectable CONFIG_MMU: arm,
> m68k, microblaze, riscv, sh
>
> If we look at arches that work with HAVE_KVM, I only see: arm64, mips,
> powerpc, s390, x86
>
> So my conclusion is there is no intersection between !MMU and HAVE_KVM?
>
> > Should I just remove the nommu version of follow_pfn and see what happens?
> > We can't remove it earlier since it's still used by other
> > subsystems.
>
> This is what I was thinking might work

Makes sense, I'll do that for the next round.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
