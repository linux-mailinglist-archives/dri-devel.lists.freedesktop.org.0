Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A29E29FFBF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263606ECEB;
	Fri, 30 Oct 2020 08:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
 [202.108.3.165])
 by gabe.freedesktop.org (Postfix) with SMTP id 590066E93E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 02:47:55 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([103.193.190.174])
 by sina.com with ESMTP
 id 5F9B7ED80001B06B; Fri, 30 Oct 2020 10:47:54 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 271796629001
From: Hillf Danton <hdanton@sina.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v4 7/7] dma-buf: system_heap: Add a system-uncached heap
 re-using the system heap
Date: Fri, 30 Oct 2020 10:47:46 +0800
Message-Id: <20201030024746.3128-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: James Jones <jajones@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Liam Mark <lmark@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Oct 2020 15:28:34 -0700 John Stultz wrote:
> On Thu, Oct 29, 2020 at 12:10 AM Hillf Danton <hdanton@sina.com> wrote:
> > On Thu, 29 Oct 2020 00:16:24 +0000 John Stultz wrote:
> > > @@ -194,6 +210,9 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> > >       struct sg_page_iter piter;
> > >       int ret;
> > >
> > > +     if (buffer->uncached)
> > > +             vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
> > > +
> >
> > Wonder why you turn back to dma_mmap_wc() and friends?
> 
> Sorry, can you expand on what you are proposing here instead?  I'm not
> sure I see how dma_alloc/mmap/*_wc() quite fits here.

I just wondered if *_wc() could save you two minutes or three. Can you
shed some light on your concerns about their unfitness?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
