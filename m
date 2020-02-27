Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DCD172A68
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 22:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D3B6ED64;
	Thu, 27 Feb 2020 21:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DA76ED6B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 21:45:42 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32D23246A2;
 Thu, 27 Feb 2020 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582839942;
 bh=8XJZBF9Gy8hHoZDUS0PtRMxPXrviaenqitevpAhxcrA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oh2cP+xNjLkr5DLqrVw8GSSgWIyZSUkYd06gSRiC7EPSttnb1vKm1R/K1dS9HZmLI
 RzDlZa8eC1Ocxwi3gvHx5wKKrn+dw2U5xRwBqxJh78fues/UxHkn4QcJ9GQL/kiXul
 DCvEqnj240qrEUFUdNWY40I51KthAn/iKmDtCdbg=
Date: Thu, 27 Feb 2020 13:45:41 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Cong Wang <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
Message-Id: <20200227134541.82309165d59b3ce10848563a@linux-foundation.org>
In-Reply-To: <CAM_iQpU7kXXGuxeOVvAGLoBRvjrhpuw2D=ih=PagGXKK-g_muw@mail.gmail.com>
References: <20200225204446.11378-1-xiyou.wangcong@gmail.com>
 <20200225175418.2d3af2180cbf895b727ce4b1@linux-foundation.org>
 <CAM_iQpU7kXXGuxeOVvAGLoBRvjrhpuw2D=ih=PagGXKK-g_muw@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Chenbo Feng <fengc@google.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Feb 2020 13:38:03 -0800 Cong Wang <xiyou.wangcong@gmail.com> wrote:

> On Tue, Feb 25, 2020 at 5:54 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Tue, 25 Feb 2020 12:44:46 -0800 Cong Wang <xiyou.wangcong@gmail.com> wrote:
> >
> > > dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
> > > it never gets freed.
> > >
> > > Free it in dma_buf_release().
> > >
> > > ...
> > >
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
> > >               dma_resv_fini(dmabuf->resv);
> > >
> > >       module_put(dmabuf->owner);
> > > +     kfree(dmabuf->name);
> > >       kfree(dmabuf);
> > >       return 0;
> > >  }
> >
> > ow.  Is that ioctl privileged?
> 
> It looks unprivileged to me, as I don't see capable() called along
> the path.
> 

OK, thanks.  I added cc:stable to my copy.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
