Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D413286858
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 21:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F436E904;
	Wed,  7 Oct 2020 19:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C49C6E904
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 19:33:20 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id u8so4675580ejg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RmnEZ1FdPT1UPs7kQcpuXD7GC8rLG+yumUNPCpNpOGc=;
 b=N8r/yrLDPKroMQCnakJtgQlEsxQFffAa7XjZXv3NwJKYhW6cGY3P32N/wys8kUmeLc
 Z3cf4MV0FjcxNYHuUtP7Oj2/h/K2d2euOJU/PSS52ypyRDR0EBh1cJO1YDWaJVba6fQ/
 H6alqkWn1zpA9cwsKPV0dohBNC66x1N6cRfq2ZiKrJCwD803V9/8UX+b9D3jMVPIj2FY
 NiVc6lfVxwhoQC3sLujKgSkr8KPyal/ezBglcD4d9hDhYk/CQ3pPnvtXwA7Ku8FHDzUO
 W0Kvwl/89Un3CcMfnS9Y//x9EccKgDRIV41sKknRM3LIym9lfBoDuNoTYkQr+aKovhyr
 Mbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RmnEZ1FdPT1UPs7kQcpuXD7GC8rLG+yumUNPCpNpOGc=;
 b=P5TDu5hU751iIF5arx08qvpDei6ZpQs3zsXB32GYXt4cxtyJGr+sVs1r3oc7BdswrY
 CH0GlWdiW0WEkogYFucqgoqm5ryOnofNOzJmWNZcJSqxQzwun07Veo/+Rf2mciLVQ2Bj
 uqx/Qvcr8xNa3TVKZfFTsaTjrZavHP73aDsR+jlFhTYpZ5HK4QwIO5X1FQ5rpO7dACMH
 k37SmhQCV6xI9hBGDBze5qtf6ddwCIycvuxhhDVNEfluC25bxbWe1iXW5ydL00cTLoKI
 Kc91G3ttAE6JzA/xC7Yk42pGh6eX/eYtNe1DWgWLNYXQGR6p6a3hUzAccK7vmNrsEovV
 bOTQ==
X-Gm-Message-State: AOAM532nJX4Uj7ENgXDPHWeoiOUdTeKXZw/6CAWd1HYMw5lCbsIQEMfM
 kqDaxE+622aathOsT8ubo/PaZ2t9pYwPY41strYsX87U8hk=
X-Google-Smtp-Source: ABdhPJwxGpDKjE8M6aFCtzChdIqpmhlJGveNVqW3bvq/Ql2n/UAIW/iMsi5CJ7xIyexOlAXnBF03c4LTBSDYYkOBolI=
X-Received: by 2002:a17:906:1a0b:: with SMTP id
 i11mr4984968ejf.472.1602099198813; 
 Wed, 07 Oct 2020 12:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
In-Reply-To: <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 7 Oct 2020 12:33:06 -0700
Message-ID: <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 7, 2020 at 11:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> the region") /dev/kmem zaps ptes when the kernel requests exclusive
> acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> the default for all driver uses.
>
> Except there's two more ways to access pci bars: sysfs and proc mmap
> support. Let's plug that hole.

Ooh, yes, lets.

>
> For revoke_devmem() to work we need to link our vma into the same
> address_space, with consistent vma->vm_pgoff. ->pgoff is already
> adjusted, because that's how (io_)remap_pfn_range works, but for the
> mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> at ->open time, but that's a bit tricky here with all the entry points
> and arch code. So instead create a fake file and adjust vma->vm_file.

I don't think you want to share the devmem inode for this, this should
be based off the sysfs inode which I believe there is already only one
instance per resource. In contrast /dev/mem can have multiple inodes
because anyone can just mknod a new character device file, the same
problem does not exist for sysfs.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
