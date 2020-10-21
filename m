Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BCD2952E3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 21:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6C66F4B6;
	Wed, 21 Oct 2020 19:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4466F4B4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 19:24:20 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id l4so2891745ota.7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 12:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sYM9cUyMSOj9mKCWCe707+J8b20m45BOShUil5OYiuY=;
 b=UcRTFA71oa+ZohVvqr5nTk2VrlQIDJZuL8YbFFB6slZWA8umJ/bN/qbSbMlqTB7z0q
 bIxgy64Kmi9zqOgOlY5HP3Sd823hLvIZ4IY3eeEDdvu0znOIz4Dey+GMkJlQfrWVVWss
 6QNEH9JVNXJd4SlM1j+HDRzTJLUTR8870k28s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sYM9cUyMSOj9mKCWCe707+J8b20m45BOShUil5OYiuY=;
 b=R/KZ95fXvePqcO8UPgrfiBwZXUDoKMrPUysnb7psZ58EDPqS8x2uQWXkAPHoZcN81x
 fibaHKDNmk/zNEzoyrwMUMJaggNvFGJdcm8tjVkPU8RU24/oiVo9pjd2SQyMs/xPhYDy
 D2tiAnKrxODpN5IqNybZdhRGB05MasMq7Psv3HgjTQPqwZnUsAEMhVzTiJvh3/LYD1/v
 bPogWJavHn7X2KhaVkasJsA86vHBVVujUuXK+3fOHXD0AUctKsV5lhaviykUV8W3jH3b
 C7gnbG5cE9oZgc8tAhjo5HeaVfSM/1md52f27s5ANK7hZuKnqx6PFzhesLmqRAMJK0js
 FUZg==
X-Gm-Message-State: AOAM5338+sTvU+RK3fNcjk0Pc3OEEbcqLTtcgt0sv8qwyUBRM5fLMT2i
 Gl06zfce9nZuiEFTbJr97KJ0fNw3ewKGQI/NKiTNLQ==
X-Google-Smtp-Source: ABdhPJwJGiQE46eBJclvgjHXJJ+j87WJ+7cjHqpCSH7v0fZi8HkcRkC+gln/SdoBFVWEgA88/UYBf7mOSQSqgr0L7bk=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr3877970otr.281.1603308259478; 
 Wed, 21 Oct 2020 12:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
 <20201021125030.GK36674@ziepe.ca>
 <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
 <20201021151352.GL36674@ziepe.ca>
 <CAKMK7uGq0=ks7Zj1Et44k7x9FwE9u_ua4zANSqrLRri0v01V+Q@mail.gmail.com>
 <20201021163702.GM36674@ziepe.ca>
In-Reply-To: <20201021163702.GM36674@ziepe.ca>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 21 Oct 2020 21:24:08 +0200
Message-ID: <CAKMK7uEjE5sHUq0hV_bnYjPKRxYyBnty0sLre+owANGZjLJg9Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.com>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 6:37 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 21, 2020 at 05:54:54PM +0200, Daniel Vetter wrote:
>
> > The trouble is that io_remap_pfn adjust vma->pgoff, so we'd need to
> > split that. So ideally ->mmap would never set up any ptes.
>
> /dev/mem makes pgoff == pfn so it doesn't get changed by remap.
>
> pgoff doesn't get touched for MAP_SHARED either, so there are other
> users that could work like this - eg anyone mmaping IO memory is
> probably OK.

I was more generally thinking for io_remap_pfn_users because of the
mkwrite use-case we might have in fbdev emulation in drm.

> > I guess one option would be if remap_pfn_range would steal the
> > vma->vm_ops pointer for itself, then it could set up the correct
> > ->install_ptes hook. But there's tons of callers for that, so not sure
> > that's a bright idea.
>
> The caller has to check that the mapping is still live, and I think
> hold a lock across the remap? Auto-defering it doesn't seem feasible.

Right auto-defering reopens the race, so making this work
automatically is a bit much. I guess just splitting this into a
setup/install part and then doing the install of all the ptes at first
fault should be good enough. We don't really need a new install_pages
for that, just an io_remap_pfn_range that's split in two parts.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
