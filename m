Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1945F2A3EA4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EB96EC2C;
	Tue,  3 Nov 2020 08:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF04D6E105
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 15:52:58 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id bl9so6296615qvb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 07:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f4bAkyYQ5JW+w3wAB0B3Wuqs9gDAq+dCKVKb1szgdTE=;
 b=hqSP56ncN1Xesc0LR+LCBrLcoSGV6TopG9RG3GGTAjXZawK07x4FedOxx8+KwVozhh
 yTaXjjMacA7HSrB+GRFpwykUXEgHjYuiJRUfTBK6bxwzQkDVZZxpNeA6oR5zy06hcsRr
 +OWzKfZs32d+rXtNU6sG16vNSbBVRNjen0md3oJEh5m3qEuLJBFDAZd22drwYUhFMUM8
 jihAo1Zpdxicjpm3k0zP51jRIixb81HpWfJ8CKClqtFak5XKxto5Xo7s7pUz3s+srShN
 1BUfFqWebwl5tOah1zDSpMj6M1bL9GXyO8wQDz9s59OVdbT9CJgBaBWOD1bIDFUY/B+7
 N2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f4bAkyYQ5JW+w3wAB0B3Wuqs9gDAq+dCKVKb1szgdTE=;
 b=rVyUcXprgnR2YvFbSjYPgeiqQJg8/tetkL1bEUXETOj2LW5QBhs8otq/W22zGQ/45M
 6+EKf0Azf1uZpUxQJYyLpIhB0Z97bLdPBQvBqv3HOoQAFnRPonIWDWyj/V3TWhf0tfA1
 hBMxWx43bWD1+m3M4ke/0JkW2Jy/TdqpxRgIYXralA6qhbWSKoKo8FS8H+zmabtfyt/P
 jiqqebuLgdF3MyPtNZdeJtIrf/4iEphfDMgX4MpjhzhOf9jRrgY8MVBG2ca9EI6Fxa3R
 lA/FsmvPYA6J1yZAxVYj5BXaxTTTyQzz19cbZGn4YmGfQt5dkmshK7un5egrhIlh32Ke
 tC5w==
X-Gm-Message-State: AOAM533gsDc1XJr9v+jLSSx70+fJQHTJ66ar8FBVxkr3myPQIzN1DJ9N
 Fuc9NO8fzA9zS8wllyH6YGevZA==
X-Google-Smtp-Source: ABdhPJywaNhw5aFpN/pYIk6/MJ/bkf/gh0tZ3udL0VlE8QqDUlZAs/BeSFGHSpJn56VGOhuQYMqcFg==
X-Received: by 2002:a0c:a261:: with SMTP id f88mr23351432qva.56.1604332377746; 
 Mon, 02 Nov 2020 07:52:57 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id v92sm8169357qte.33.2020.11.02.07.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 07:52:56 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kZc8e-00F975-6s; Mon, 02 Nov 2020 11:52:56 -0400
Date: Mon, 2 Nov 2020 11:52:56 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v5 08/15] mm: Add unsafe_follow_pfn
Message-ID: <20201102155256.GG36674@ziepe.ca>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
 <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
 <20201102130115.GC36674@ziepe.ca>
 <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHeL=w7GoBaY4XrbRcpJabR9UWnP+oQ9Fg51OzL7=KxiA@mail.gmail.com>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 KVM list <kvm@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Linux MM <linux-mm@kvack.org>,
 J??r??me Glisse <jglisse@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 02:23:58PM +0100, Daniel Vetter wrote:
> On Mon, Nov 2, 2020 at 2:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Mon, Nov 02, 2020 at 01:56:10PM +0100, Daniel Vetter wrote:
> > > On Mon, Nov 2, 2020 at 8:29 AM Christoph Hellwig <hch@infradead.org> wrote:
> > > >
> > > > On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> > > > > Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> > > > > that by drivers/modules is together with an mmu_notifier, and that's
> > > > > all _GPL stuff.
> > > >
> > > > I also think it also needs to be renamed to explicitly break any existing
> > > > users out of tree or int the submission queue.
> > >
> > > Ok I looked at the mmu notifier locking again and noticed that
> > > mm->subscriptions has its own spinlock. Since there usually shouldn't
> > > be a huge pile of these I think it's feasible to check for the mmu
> > > notifier in follow_pfn. And that would stuff this gap for good. I'll
> > > throw that on top as a final patch and see what people think.
> >
> > Probably the simplest is to just check mm_has_notifiers() when in
> > lockdep or something very simple like that
> 
> lockdep feels wrong, was locking more at CONFIG_DEBUG_VM. And since
> generally you only have 1 mmu notifier (especially for kvm) I think we
> can also pay the 2nd cacheline miss and actually check the right mmu
> notifier is registered.

Need to hold the lock to check that and there are two ways to register
notifiers these days, so it feels to expensive to me.

CH's 'export symbol only for kvm' really does seem the most robust way
to handle this though.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
