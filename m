Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 105E1388166
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 22:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC606EC9B;
	Tue, 18 May 2021 20:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854A76EC9A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 20:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621369761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Byh3RXtf3e9z9fGxHtn9E4dig0desEcXbiOegyYPxxI=;
 b=Rv/9ROR/ZI0xopmJW5nSTJRlY38y53FNySt8lPZX0xjOq/oPIKZoWzbdJdwpOx8xufl2mH
 v4nzRt5vRVG1pUcRk7RAzmIw87TaZaSfnnKS7Q+ruiC5HHQjV+jhDE+nEJYjkYWXaKfMyl
 fxTTN0UxW2dIJ6Hx5lXhb0p7yEd0LO0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-8aqad39EMTyN6_unZ1JRAg-1; Tue, 18 May 2021 16:29:17 -0400
X-MC-Unique: 8aqad39EMTyN6_unZ1JRAg-1
Received: by mail-qk1-f200.google.com with SMTP id
 4-20020a370d040000b02902fa09aa4ad4so8020577qkn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 13:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Byh3RXtf3e9z9fGxHtn9E4dig0desEcXbiOegyYPxxI=;
 b=Mu8sBrvUvT7NBWD6ug4cknTyIjfvXNZ1ZNnZ3VC8qT9t7ksXmbuTNE9fO3i5hM6c+E
 UJqb8r9GUlcbOIhdcILqYlck/gi8YrPAr5G5meCI4z/6JUZOTgFq8HjriyyiaUfuAQdc
 Ea+GivlBpJYe1SO4NcL3l3sYi0hyma/gtXLLC9wHrWhF1jA7C0Ft/6NWa1Mi9CBzcW16
 wam84ASkZyBFiO0UD2M2y1XTz5zmPinHqtPHJcrWKOw+iW2Nbq4QYft8kP5Rox0a4AV4
 pmwzw5djYVVG2Ho5c84qzT7K4CYB/1c8mwzqIC1BYaWs2k37I5+LL7Mz8KC+rfHrMD8s
 KEVw==
X-Gm-Message-State: AOAM5311eRuTefxJn5cO6tKC9tbT6AGZ7fUFRBIAE48hHxZkBm+0+Zl9
 nOJxB7qaQTTeN/QdrDwOIUH0GXujN1UeJGc+mKfvQOu21YpncOpqLcTWsUZZNmIzMT4xSsGGR1q
 JMxfjko/0tD/3m9lms8ca/Fv7/6db
X-Received: by 2002:a37:9a44:: with SMTP id c65mr7481944qke.368.1621369757340; 
 Tue, 18 May 2021 13:29:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+5f5TscVPJ0ONHm5jVyCffJB6cEfYzjhEVjEsWtXZ+lJNcysTexL/nbuPh+rIA0ZMrBojSg==
X-Received: by 2002:a37:9a44:: with SMTP id c65mr7481922qke.368.1621369757048; 
 Tue, 18 May 2021 13:29:17 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id g13sm13522617qtp.31.2021.05.18.13.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 13:29:16 -0700 (PDT)
Date: Tue, 18 May 2021 16:29:14 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKQjmtMo+YQGx/wZ@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-6-apopple@nvidia.com>
 <YKMhorngO2DVrxac@t490s> <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s> <20210518173334.GE1002214@nvidia.com>
 <YKQBACJCjsxeM3ro@t490s> <20210518194509.GF1002214@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210518194509.GF1002214@nvidia.com>
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
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 04:45:09PM -0300, Jason Gunthorpe wrote:
> On Tue, May 18, 2021 at 02:01:36PM -0400, Peter Xu wrote:
> > > > Indeed it'll be odd for a COW page since for COW page then it means after
> > > > parent/child writting to the page it'll clone into two, then it's a mistery on
> > > > which one will be the one that "exclusived owned" by the device..
> > > 
> > > For COW pages it is like every other fork case.. We can't reliably
> > > write-protect the device_exclusive page during fork so we must copy it
> > > at fork time.
> > > 
> > > Thus three reasonable choices:
> > >  - Copy to a new CPU page
> > >  - Migrate back to a CPU page and write protect it
> > >  - Copy to a new device exclusive page
> > 
> > IMHO the ownership question would really help us to answer this one..
> 
> I'm confused about what device ownership you are talking about

My question was more about the user scenario rather than anything related to
the kernel code, nor does it related to page struct at all.

Let me try to be a little bit more verbose...

Firstly, I think one simple solution to handle fork() of device exclusive ptes
is to do just like device private ptes: if COW we convert writable ptes into
readable ptes.  Then when CPU access happens (in either parent/child) page
restore triggers which will convert those readable ptes into read-only present
ptes (with the original page backing it).  Then do_wp_page() will take care of
page copy.

However... if you see that also means parent/child have the equal opportunity
to reuse that original page: who access first will do COW because refcount>1
for that page (note! it's possible that mapcount==1 here, as we drop mapcount
when converting to device exclusive ptes; however with the most recent
do_wp_page change from Linus where we'll also check page_count(), we'll still
do COW just like when this page was GUPed by someone else).  While that matters
because the device is writting to that original page only, not the COWed one.

Then here comes the ownership question: If we still want to have the parent
process behave like before it fork()ed, IMHO we must make sure that original
page (that exclusively owned by the device once) still belongs to the parent
process not the child.  That's why I think if that's the case we'd do early cow
in fork(), because it guarantees that.

I can't say I fully understand the whole picture, so sorry if I missed
something important there.

Thanks,

-- 
Peter Xu

