Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34962295916
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82526F3DD;
	Thu, 22 Oct 2020 07:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CDA6EDC2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 15:13:55 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id m9so2360263qth.7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9cFTuFdatbaYuigk9l9CABG/jzUgOpY0t/i9Osy6B3k=;
 b=Dq8HyCXnjlFLiivieMejfqNvFko0IRtuvvtRMPLqBJU503Zw8AdmXj9PAYUvq+vrGw
 tLWr/P2KX0xliFL4v7zLPYR93TGo1limVOCOZFomvItA47uQ8nJhdHWU27ngiu6ooAYG
 WjN4a1HHzcaoYLAcnuo5e5/2eLC1r22+kDR6gTWfx0ZcGZTpX8rwEwqmUSs71ZqiLJX+
 OUQrP6EnxmCsgNh+3+fwOT/kOJSDKYJueSTL+OCpFozN4nNmHro2xix1p70w/08ytcHi
 qOQrid57zrk+FvzkIWYUgPoh4k6ET94WA33BXpQ3Dtpr1Jlt52u7OEBqAEPaddsrqv0i
 gSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9cFTuFdatbaYuigk9l9CABG/jzUgOpY0t/i9Osy6B3k=;
 b=Y2dAXuiyMgThuUr7auQa27w5JFjCwcnMyYWLlHeK1/oQdIKn5d3Ax+RjPv1hFWLz/+
 jOI4WP+7oQGp/sP+2udIpBmJzzzBmr+Rne2CQSn4R/hFI8bchO8jXf43dmYGtysefDKV
 ziF+uRgYkQnJVKRXMpFveXdzo3hpUq3EQIvJ2ry58HAyPq93ywg8KUi57X5BV+ZDYXmd
 FAxfvVNz6NOgV6m54bSfpq/LTAAd2dRNG58ZrTFqGOushnujF8JLZ1mzwWYr1WZ4A8nS
 lsR6+XKfoNuirkZNoWoJu9S8367VF7ldekSPdiWiencR4Bx4qM/lJPXnL8ra1E5s0h/a
 fvgw==
X-Gm-Message-State: AOAM531YjH7waeHm2j/+YVYkwdfrPMvwn/G4xq6zp7GlpgpKfnNe/hPs
 KBKA7MrImgg1g2GkqsF9XNCb/Q==
X-Google-Smtp-Source: ABdhPJxKUYsuh5jtMPkvFgL62ClnoaVVE83XzZ8FQCHOArCd8sBp94Ul/GCOzlaoYcDR7rbZz0mkwQ==
X-Received: by 2002:ac8:8c7:: with SMTP id y7mr3515722qth.278.1603293234456;
 Wed, 21 Oct 2020 08:13:54 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id b14sm1405612qkn.123.2020.10.21.08.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 08:13:53 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kVFoG-003XHy-SZ; Wed, 21 Oct 2020 12:13:52 -0300
Date: Wed, 21 Oct 2020 12:13:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
Message-ID: <20201021151352.GL36674@ziepe.ca>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch>
 <20201021125030.GK36674@ziepe.ca>
 <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
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

On Wed, Oct 21, 2020 at 04:42:11PM +0200, Daniel Vetter wrote:

> Uh yes. In drivers/gpu this isn't a problem because we only install
> ptes from the vm_ops->fault handler. So no races. And I don't think
> you can fix this otherwise through holding locks: mmap_sem we can't
> hold because before vma_link we don't even know which mm_struct is
> involved, so can't solve the race. Plus this would be worse that
> mm_take_all_locks used by mmu notifier. And the address_space
> i_mmap_lock is also no good since it's not held during the ->mmap
> callback, when we write the ptes. And the resource locks is even less
> useful, since we're not going to hold that at vma_link() time for
> sure.
> 
> Hence delaying the pte writes after the vma_link, which means ->fault
> time, looks like the only way to close this gap.

> Trouble is I have no idea how to do this cleanly ...

How about add a vm_ops callback 'install_pages'/'prefault_pages' ?

Call it after vm_link() - basically just move the remap_pfn, under
some other lock, into there.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
