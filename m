Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E160628ED70
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 09:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F34B6EC2B;
	Thu, 15 Oct 2020 07:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E886E955
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 00:09:42 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id 140so1041322qko.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 17:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=D7q4upZx4LUmHy2sbcBxGXxr7CK8polpuI+TBJh2iFg=;
 b=VY1qyIeCcrX28JfPsmo/gMmvUMC4KhNWUx2AWTC7SFuNhKKNC7E5pi4i351EUrbB2J
 iQEeEBv2iqbPt4yG9cu9z6JKaTTcI0uH0ifbEwEuYd7uQ+JCfqlrCKPwMTRONzTIq1+2
 r10P6EtGAwdMqLqGZOKON3zvZUuPyniSm0E4b9X4QVYcKPq5x9sxgp/64dd/q9ifg4bh
 6h21xPcqmh90YO0WNB5wNN8lxy2kzpTs2joeQm0QgPxqx6k5VPT8scnHtsXoGOHGppiW
 EBkQ8XI+pghayLloQzkOY+ZWhXI0lRPbg5OXZafpWC/LHi0yuGDtirCrwS4LepbltR1w
 8p9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D7q4upZx4LUmHy2sbcBxGXxr7CK8polpuI+TBJh2iFg=;
 b=p8cF5EhLcD++fp8GG94ksKHeN8ZfFyWuxNKPdN9PZtkPM9NuWEvfvL6lpCy6tdzdlr
 5tId008ZGMAMgYpZYBrgDKljo+Nj8biuXkDgp3BCB+Tg8kjzsa1CfS+Rle7WMKXxY680
 NUgX+ElpIrPMZYawfGdT2vCNzSFWtNVzQYrtrAyXBJGWXV+GHYrdPbQwlnP4mwhpZNV3
 9f5Uyyfc0S+DXofhEc9GLASllwS9nAobcLfJlzeHIwSO+lPT1ioeiEf9ZSGLQKaBoXNu
 +KbQmMDgJuFeHWhoWDdzI54DBzsSNlPd/H58OqxcVd+pdDk4GpljJrjcikXOgLCmeWO7
 eoyw==
X-Gm-Message-State: AOAM5328ysxgm4oK2ma/ypNFU5YNt+k8OLbS+ajw4M+uDQaC7KH6DMV+
 P50dBu/WN7sSuBtAMYSPgJcX7Q==
X-Google-Smtp-Source: ABdhPJz1YpfemWgv6ITHdO1cDHAUR6b7J4qWqW/ErSGbJ1yD3QFJwI22cUMtAvpN9oIOH7a/n3cIYg==
X-Received: by 2002:a05:620a:2e3:: with SMTP id
 a3mr1513988qko.117.1602720581354; 
 Wed, 14 Oct 2020 17:09:41 -0700 (PDT)
Received: from ziepe.ca ([142.177.128.188])
 by smtp.gmail.com with ESMTPSA id y44sm525252qtb.50.2020.10.14.17.09.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Oct 2020 17:09:40 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1kSqpv-0002GP-8c; Wed, 14 Oct 2020 21:09:39 -0300
Date: Wed, 14 Oct 2020 21:09:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 14/17] resource: Move devmem revoke code to resource
 framework
Message-ID: <20201015000939.GD6763@ziepe.ca>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-15-daniel.vetter@ffwll.ch>
 <20201009123109.GO5177@ziepe.ca>
 <CAKMK7uFpPP-Q0jC0vM7vYPEcg0m4NzTw+Ld=swdTF3BgMX5Qug@mail.gmail.com>
 <20201009143209.GS5177@ziepe.ca>
 <CAPcyv4j54O8ac6WB3LEeNud2r11V26gA0PRKK9bhyEMF67AXtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4j54O8ac6WB3LEeNud2r11V26gA0PRKK9bhyEMF67AXtQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:08:24 +0000
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, David Hildenbrand <david@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 11:28:54AM -0700, Dan Williams wrote:
> On Fri, Oct 9, 2020 at 7:32 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Oct 09, 2020 at 04:24:45PM +0200, Daniel Vetter wrote:
> > > On Fri, Oct 9, 2020 at 2:31 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Fri, Oct 09, 2020 at 09:59:31AM +0200, Daniel Vetter wrote:
> > > >
> > > > > +struct address_space *iomem_get_mapping(void)
> > > > > +{
> > > > > +     return iomem_inode->i_mapping;
> > > >
> > > > This should pair an acquire with the release below
> > > >
> > > > > +     /*
> > > > > +      * Publish /dev/mem initialized.
> > > > > +      * Pairs with smp_load_acquire() in revoke_iomem().
> > > > > +      */
> > > > > +     smp_store_release(&iomem_inode, inode);
> > > >
> > > > However, this seems abnormal, initcalls rarely do this kind of stuff
> > > > with global data..
> > > >
> > > > The kernel crashes if this fs_initcall is raced with
> > > > iomem_get_mapping() due to the unconditional dereference, so I think
> > > > it can be safely switched to a simple assignment.
> > >
> > > Ah yes I checked this all, but forgot to correctly annotate the
> > > iomem_get_mapping access. For reference, see b34e7e298d7a ("/dev/mem:
> > > Add missing memory barriers for devmem_inode").
> >
> > Oh yikes, so revoke_iomem can run concurrently during early boot,
> > tricky.
> 
> It runs early because request_mem_region() can run before fs_initcall.
> Rather than add an unnecessary lock just arrange for the revoke to be
> skipped before the inode is initialized. The expectation is that any
> early resource reservations will block future userspace mapping
> attempts.

Actually, on this point a simple WRITE_ONCE/READ_ONCE pairing is OK,
Paul once explained that the pointer chase on the READ_ONCE side is
required to be like an acquire - this is why rcu_dereference is just
READ_ONCE

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
