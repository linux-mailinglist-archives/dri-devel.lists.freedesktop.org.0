Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05367388FC7
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8436E1CE;
	Wed, 19 May 2021 14:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355296E1CE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621433089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q0X6ufyJH5fadmIknxn4nGcWs1xnqbL6wQGkTAtdW1c=;
 b=YJ9Sl+UpqDhjLciNBRI3ns8McCD2kWDjznAOgNh1Zr7HeAjoLj2REOkLLmsVAXAIcReH+L
 23Oygl8Ahgdt5OI2riy467QCWxoEDJi+6dddMhwiQCpf/dYFuWK3yMwfyhCLdfFiC1l2JZ
 LDxSQ27MewB2MRLysdCr8IaM+RFt3i0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-2Nj8MUucN0aUFV8s0v2Ytw-1; Wed, 19 May 2021 10:04:34 -0400
X-MC-Unique: 2Nj8MUucN0aUFV8s0v2Ytw-1
Received: by mail-qv1-f71.google.com with SMTP id
 fi6-20020a0562141a46b02901f064172b74so5522587qvb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 07:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q0X6ufyJH5fadmIknxn4nGcWs1xnqbL6wQGkTAtdW1c=;
 b=Nu5QhcugeII1Ea+uxm+3an+Hyozkg4Ane1VBDgrcX/3zCp13No+UbMva+Mb7DXA20y
 ZTpEDI7bmZSVBG1R5bb6jDXEnKh57aC5dqAjZr6w4B9Gs3cxgtMa+IGaU+OB0yNI3p8M
 9c2AEm11u4d2yFGmC+xd5C87Byml/rHW1d2P4ORTvTbQ7Ws4J2Fl3hRMBMa5A9Bq3+zr
 M6HtF2ED5TkVA4JHooy/b4vt1CCHBTDaSznoyvR72OzBnPOFYvno1n67AhgEu0/0KX+J
 9INmaffiJti8CFA8L6cGo28A1Pb2GazGKgRUQhQXPpd4nBc93SVy0j3AQ77wJZJsH65f
 XVCw==
X-Gm-Message-State: AOAM532QVdz06LDO+cm9lpwpOcyWH72Gd/puUfLs1khwghnIUrEiM92p
 WlJiZyUau+WqZPEdrvb5odY5Y3Il+NK6L8Zmir18f8mpTdHjrdKnfFKuj4+Z6sqa6JhrDSsX6Z0
 1PbqXmrKf8Ip0iSgyUoafrz+cFTgw
X-Received: by 2002:a05:6214:d87:: with SMTP id
 e7mr13037375qve.53.1621433074137; 
 Wed, 19 May 2021 07:04:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6J2iQWttFbTggjwn9zrUjjmVN+9VOim38VY5Z448bl6PpUs3xqQHJcSoYTLuhDbSvYY+iNA==
X-Received: by 2002:a05:6214:d87:: with SMTP id
 e7mr13037337qve.53.1621433073770; 
 Wed, 19 May 2021 07:04:33 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id b13sm802748qkl.16.2021.05.19.07.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:04:33 -0700 (PDT)
Date: Wed, 19 May 2021 10:04:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKUa8HZjfFW2Dhb1@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <2235357.HsqDk0zIjc@nvdebian> <YKUBbVuvm5FUJRMl@t490s>
 <2569629.VzlulnA7BY@nvdebian>
MIME-Version: 1.0
In-Reply-To: <2569629.VzlulnA7BY@nvdebian>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, bsingharora@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 Jason Gunthorpe <jgg@nvidia.com>, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 11:11:55PM +1000, Alistair Popple wrote:
> On Wednesday, 19 May 2021 10:15:41 PM AEST Peter Xu wrote:
> > External email: Use caution opening links or attachments
> > 
> > On Wed, May 19, 2021 at 09:04:53PM +1000, Alistair Popple wrote:
> > > Failing fork() because we couldn't take a lock doesn't seem like the right
> > > approach though, especially as there is already existing code that
> > > retries. I get this adds complexity though, so would be happy to take a
> > > look at cleaning copy_pte_range() up in future.
> > 
> > Yes, I proposed that as this one won't affect any existing applications
> > (unlike the existing ones) but only new userspace driver apps that will use
> > this new atomic feature.
> > 
> > IMHO it'll be a pity to add extra complexity and maintainance burden into
> > fork() if only for keeping the "logical correctness of fork()" however the
> > code never triggers. If we start with trylock we'll know whether people
> > will use it, since people will complain with a reason when needed; however
> > I still doubt whether a sane userspace device driver should fork() within
> > busy interaction with the device underneath..
> 
> I will refrain from commenting on the sanity or otherwise of doing that :-)
> 
> Agree such a scenario seems unlikely in practice (and possibly unreasonable). 
> Keeping the "logical correctness of fork()" still seems worthwhile to me, but 
> if the added complexity/maintenance burden for an admittedly fairly specific 
> feature is going to stop progress here I am happy to take the fail fork 
> approach. I could then possibly fix it up as a future clean up to 
> copy_pte_range(). Perhaps others have thoughts?

Yes, it's more about making this series easier to be accepted, and it'll be
great to have others' input.

Btw, just to mention that I don't even think fail fork() on failed trylock() is
against "logical correctness of fork()": IMHO it's still 100% correct just like
most syscalls can return with -EAGAIN, that suggests the userspace to try again
the syscall, and I hope that also works for fork().  I'd be more than glad to
be corrected too.

-- 
Peter Xu

