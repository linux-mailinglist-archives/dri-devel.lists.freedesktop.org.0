Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D43286FD3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415AC6EA3C;
	Thu,  8 Oct 2020 07:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597A36EA3E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 07:50:07 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id o18so4848717edq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 00:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=grdLjPbma4xWpmrd4kIhxHd3k84viXKhZjuHjyaNtUE=;
 b=OpyjCwq7o157Xb/2yloDuUEV/w+tdNn7bUkqj6LGjYZdXbdkHQlqz4Xs0Zg4Edt33w
 0nqk5otSDvrBFIDqX3NWTcYGdyooPoOy++oKoeLN7+9FcA3Y2j9gM2FY12udB5BbTLzF
 o4Fgw3h+eUO3zgDHQ6b7I7KPL5f+fMHf9I0lTVCozAWjOJH1Lu9JW2FcOGR5M99QQ9cG
 2z2FugDTtkLvyx7A5kfM8jqHqXj/RdTCprPD7XpZha+SBgeMVVhbtPHFs1tz0HiaUe6C
 BI4I++Hc0Q/c9P8rPs6vNR5tBGxtF7FZ8cn1qblN1zBUwaF08Qp+hX6dqbT1VyZULWij
 t42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=grdLjPbma4xWpmrd4kIhxHd3k84viXKhZjuHjyaNtUE=;
 b=YzKQF5XinD8WWOM0IAeG0YZwOsfpHHsNxmkURPYp9Hf3N895rVlr11owHE+XrTW09O
 3jOeCwx/2W9rKZ/hRkbGUJ7wdxinMnEOt/mH5wT6N43oUF/MqybTQo3Tavl36+WJWDIy
 f8munGbuR5f+TgMypu5jp1LQqxe0DA1j8ZH3Ce3lcHmgM4YjUqzdz54OH+X5tiyuUdaJ
 ocGXhNbgjlvPjyBPWBkJRKGnse7uEyexdEV+L4w/7s3eK0V5tqpJHYxO88b0k1J+MvY6
 QRsFkx8pewSolT9VkxhY9I1zpZVvilg4BiiP/Ea55+ARZwJCwjdx4a2nztJuYta9CEGk
 l1MQ==
X-Gm-Message-State: AOAM531LzsSoLEoKTBi1b4og9y5sYTr2v8RhApnBKKiuDU12HOqb/Pbv
 rxuK6/o/Th8zvdfss99T/T/7Q0yJ8MEe1anOVShIJw==
X-Google-Smtp-Source: ABdhPJysuJa5L2PxuxTzTLWSnwn1TbnDhi3QjUi/pDReBeAUTyUIbYuBaOL8Vyczi/qAthRLw4c82m5S1UkBlboYvQw=
X-Received: by 2002:aa7:cd1a:: with SMTP id b26mr960294edw.97.1602143405978;
 Thu, 08 Oct 2020 00:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
 <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
 <20201007232448.GC5177@ziepe.ca>
In-Reply-To: <20201007232448.GC5177@ziepe.ca>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 8 Oct 2020 00:49:54 -0700
Message-ID: <CAPcyv4jA9fe40r_2SfrCtOaeE85V88TA3NNQZOmQMNj=MdsPyw@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 7, 2020 at 4:25 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 07, 2020 at 12:33:06PM -0700, Dan Williams wrote:
> > On Wed, Oct 7, 2020 at 11:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> > > the region") /dev/kmem zaps ptes when the kernel requests exclusive
> > > acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> > > the default for all driver uses.
> > >
> > > Except there's two more ways to access pci bars: sysfs and proc mmap
> > > support. Let's plug that hole.
> >
> > Ooh, yes, lets.
> >
> > >
> > > For revoke_devmem() to work we need to link our vma into the same
> > > address_space, with consistent vma->vm_pgoff. ->pgoff is already
> > > adjusted, because that's how (io_)remap_pfn_range works, but for the
> > > mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> > > at ->open time, but that's a bit tricky here with all the entry points
> > > and arch code. So instead create a fake file and adjust vma->vm_file.
> >
> > I don't think you want to share the devmem inode for this, this should
> > be based off the sysfs inode which I believe there is already only one
> > instance per resource. In contrast /dev/mem can have multiple inodes
> > because anyone can just mknod a new character device file, the same
> > problem does not exist for sysfs.
>
> The inode does not come from the filesystem char/mem.c creates a
> singular anon inode in devmem_init_inode()

That's not quite right, An inode does come from the filesystem I just
arranged for that inode's i_mapping to be set to a common instance.

> Seems OK to use this more widely, but it feels a bit weird to live in
> char/memory.c.

Sure, now that more users have arrived it should move somewhere common.

> This is what got me thinking maybe this needs to be a bit bigger
> generic infrastructure - eg enter this scheme from fops mmap and
> everything else is in mm/user_iomem.c

It still requires every file that can map physical memory to have its
->open fop do

       inode->i_mapping = devmem_inode->i_mapping;
       filp->f_mapping = inode->i_mapping;

I don't see how you can centralize that part.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
