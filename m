Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05906286892
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 21:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261426E9A3;
	Wed,  7 Oct 2020 19:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268B76E9A4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 19:47:50 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id c13so3742516oiy.6
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=orhfCBuFEmd+KVAmHbcaixIkjSSik8aIdF2Y5AlSlTI=;
 b=HqHL85aeU7x4vZRr8aFR2YVRrwspH04y26fUbXHdW1zHn9JiRP4t6c+95tolblKSFE
 g6rmEte7OQz0vHT+Gxy0F+wmZQx2vj40nuDXq6VEJEgecoLqF0as8JHJF/ZRBUJmFjHz
 fkLaTYyh9AGF6bz08/AxSynt04XwHMSoqg8zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=orhfCBuFEmd+KVAmHbcaixIkjSSik8aIdF2Y5AlSlTI=;
 b=gl+0jJmNPrb8Mq7JuxGkJbKXYXVue3yM8lhYQ5lyAx9uZTNTkxnvSqfTePM+1NK7i1
 IMdwC3hWVmoCd75+WHx41xrDgYKHTcHVFc+OATcYfS300rtoJgWY6BDBKbgmGFvxcg+P
 Yot6xX+eSWGj/4pKHLGz0B/ozWSe3fP4q27povyPyLUqLFev6I/wZYmJo6SSNgekKicv
 COQ80stcHZjRe2B3iu2ZOkJd81NhCM2zUhAlp30nAC5j7VsTWwUbRQEvuo46M/nqqtf5
 O69xm0u0zD8H2NfO5jyi8tw5MxQgGy+66tHK0YcRbom5OcJfHfzvLdo0wxvGE84DZzAb
 4W1A==
X-Gm-Message-State: AOAM531Y39qEGZ0HjujIWR4l6uaQW7si/n29M4Tc6B1GhjVQy77tUGrf
 q2eIP27OvfnBbKdgKIM7hVjGVrww+S5RMgVmJEBdKQ==
X-Google-Smtp-Source: ABdhPJxToTx3ndOy1U0dVrBcYAKX9wm3X1TZHa+mGhrb1Py/rD32WJ5mouUCMFv7wj7Vm8hLjOzC1v6C7W/A3Mayy3I=
X-Received: by 2002:aca:6083:: with SMTP id u125mr2978051oib.14.1602100069344; 
 Wed, 07 Oct 2020 12:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
 <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
In-Reply-To: <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Oct 2020 21:47:37 +0200
Message-ID: <CAKMK7uFoxiPdjO-yhd-mKqumnTpjcENEReb1sOYhOwRRCL0wpQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
To: Dan Williams <dan.j.williams@intel.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 7, 2020 at 9:33 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Wed, Oct 7, 2020 at 11:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> > the region") /dev/kmem zaps ptes when the kernel requests exclusive
> > acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> > the default for all driver uses.
> >
> > Except there's two more ways to access pci bars: sysfs and proc mmap
> > support. Let's plug that hole.
>
> Ooh, yes, lets.
>
> > For revoke_devmem() to work we need to link our vma into the same
> > address_space, with consistent vma->vm_pgoff. ->pgoff is already
> > adjusted, because that's how (io_)remap_pfn_range works, but for the
> > mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> > at ->open time, but that's a bit tricky here with all the entry points
> > and arch code. So instead create a fake file and adjust vma->vm_file.
>
> I don't think you want to share the devmem inode for this, this should
> be based off the sysfs inode which I believe there is already only one
> instance per resource. In contrast /dev/mem can have multiple inodes
> because anyone can just mknod a new character device file, the same
> problem does not exist for sysfs.

But then I need to find the right one, plus I also need to find the
right one for the procfs side. That gets messy, and I already have no
idea how to really test this. Shared address_space is the same trick
we're using in drm (where we have multiple things all pointing to the
same underlying resources, through different files), and it gets the
job done. So that's why I figured the shared address_space is the
cleaner solution since then unmap_mapping_range takes care of
iterating over all vma for us. I guess I could reimplement that logic
with our own locking and everything in revoke_devmem, but feels a bit
silly. But it would also solve the problem of having mutliple
different mknod of /dev/kmem with different address_space behind them.
Also because of how remap_pfn_range works, all these vma do use the
same pgoff already anyway.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
