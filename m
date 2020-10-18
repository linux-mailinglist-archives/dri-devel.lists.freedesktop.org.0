Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BBC2918C2
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 20:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98CC6E81B;
	Sun, 18 Oct 2020 18:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D50236E81B
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 18:06:11 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id l4so8299081ota.7
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rVsl1Axinthci9ar7nU6pr8nf93oOM7p1lKKnFskbys=;
 b=CmaAZeigOTVUGcvHTiNeVQ8JXczmVCbe+BXq1uR+3GfDhE9h1O1purZG2Nilm6Xh+B
 KuQ6COjqqls8sLyIJbD7gNNvIN1q5Urjfi+8FWUhmzCblBnYRSU1ZrjRl+72vuNnXPQo
 P/ChD3WGwiEAkWmT62cwi7DTIEXr1I6+BTAIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rVsl1Axinthci9ar7nU6pr8nf93oOM7p1lKKnFskbys=;
 b=IL+VRYT2duYOJv4yuQjX3HSBmOnqFGaatb/zsJp7vEqMZCsyDhJB6WeEr1exiTLrRO
 Pr/7A0UpVEF0duxDy5pp832PjK+yY+P1VO5fQiehuhv2EJwIoujNcdRWfdMXYkTrbjaO
 Q7W3ud2OocT7WF2/Qp7GFfoq9uuIOO2eV54GeF12qXFNWqSNHgVexiYPPT5wpmPKPfcC
 dqbhvg/xRNkULBu0dHNQgtwa1zlhjJGJvYBbD5SHRWifi+K62MAMgj+EBqptiqC0CmRq
 1mZifBQrfYpggz3Vygm4juK9FrTR7jXrgDd1hEoI25yp2JwNsJcwcY9b6IgUvpKfwJHz
 zugQ==
X-Gm-Message-State: AOAM530JemDvJl6Hc1BZ9l66Nz6xszg7MKM4zckHRHP9r1rhE0mEMJlz
 Ib3fQYiWx9o7B5YPX+cMV/TrUVnY8R01dhIVFv3y1g==
X-Google-Smtp-Source: ABdhPJyKixzQxvE+GzxQcaMU2aZfWmNr+/lmh7CXPMS+AZFRiCTXM6Pe4OwS4J4aBsJ0OG1/00t5O5iRLJTHRvxSQa8=
X-Received: by 2002:a05:6830:8b:: with SMTP id
 a11mr9322980oto.303.1603044370984; 
 Sun, 18 Oct 2020 11:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <1602799365-138199-1-git-send-email-jianxin.xiong@intel.com>
 <20201016185959.GC37159@ziepe.ca>
In-Reply-To: <20201016185959.GC37159@ziepe.ca>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 18 Oct 2020 20:05:59 +0200
Message-ID: <CAKMK7uHvvtOQgoG4SLA_y0DmfusjOHd=xeN14Jsq7jC=J58HTA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 17, 2020 at 9:05 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Oct 15, 2020 at 03:02:45PM -0700, Jianxin Xiong wrote:
>
> > +static void ib_umem_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
> > +{
> > +     struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> > +
> > +     dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> > +
> > +     ib_umem_dmabuf_unmap_pages(&umem_dmabuf->umem, true);
> > +     queue_work(ib_wq, &umem_dmabuf->work);
>
> Do we really want to queue remapping or should it wait until there is
> a page fault?
>
> What do GPUs do?

Atm no gpu drivers in upstream that use buffer-based memory management
and support page faults in the hw. So we have to pull the entire thing
in anyway and use the dma_fence stuff to track what's busy.

For faulting hardware I'd wait until the first page fault and then map
in the entire range again (you get the entire thing anyway). Since the
move_notify happened because the buffer is moving, you'll end up
stalling anyway. Plus if you prefault right away you need some
thrashing limiter to not do that when you get immediate move_notify
again. As a first thing I'd do the same thing you do for mmu notifier
ranges, since it's kinda similarish.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
