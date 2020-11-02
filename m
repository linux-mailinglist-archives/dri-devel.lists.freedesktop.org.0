Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1792A2BC4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCEB6EB78;
	Mon,  2 Nov 2020 13:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8686E4F9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 13:01:17 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r7so11352895qkf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 05:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ywfiDbg6XCEWmoBx9eC29OtR/MyEWOW93XTelnAXaBk=;
 b=ir3GR39YhTRDVVIubqbd2b6fYJQqoYzGlGzQhJGPgx/IpIwERjn3x6j0FKgwPju8tJ
 K346RwtLd1HrF6IYofhsCSTJj3QK+10oMg2YllJh/KpA3n62CbFQnKL6ivWZ5KZSOniq
 QwLvLlA6x1j/aJc2hKzXChvGjpbbw6GWq/KNk/8R9NhESFTt0yrJ0KQKjkdmTuloLwW/
 Zwps2gbtqPniuVum2Pfu8S68SKxWxd0HMyfFBAbv4qCeVCCuOZxQnUab9RNI4DYrsJao
 v2N/I2zDZif6Md4+OJsi4IvpXjI5tOvsKPLa0IKjhrcIMk4ZoUB68GDdMIbIvaBwF1NM
 /xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ywfiDbg6XCEWmoBx9eC29OtR/MyEWOW93XTelnAXaBk=;
 b=a0tguKZJT3a5XxvpKHvasCJzUxR3uBaD5JOa9vinB9RwCaAg2kiJTEkbs8/dynBJ9y
 4/GFhUg5sf8Z7dUv++r71lv9jtlFqv6aImdULl6WBRELrXwqQlCNoV0kCmVIRuZcM/T2
 +aFlmrsVrOS28/F7mXz9CQctEnrFry+viugEz6SpnpaE+RmKptUJyAIrYNLTORBeQqAQ
 7Vf2Swbyzf4T+JzjdRX56sP2i18eExobwV7Z1AegTfr9m7op5NNjvh3LbA4+1umNA5E3
 2ez+eNUwoQ93UrQ2/cv+xEaLsSO2+qY0NcGmxWHdiGI1W2w7Pe+9zmcXfcSGPXwhuX1M
 3VFA==
X-Gm-Message-State: AOAM530jjuy5KYUZaYy+kHSxC9mf1y47Hw6XjqRELsEOoWQVwIdL54iP
 Ga5Gw1efzTsd+L6c35SGalkKvQ==
X-Google-Smtp-Source: ABdhPJzRrsH3Zfgny2Ycg3bBy2Q+SuhdpwI09cYL0ZnBVzwrgv7GmXDFxfx3kiLU2YMRfbo6u8i3PQ==
X-Received: by 2002:a37:8c41:: with SMTP id o62mr13561782qkd.240.1604322076971; 
 Mon, 02 Nov 2020 05:01:16 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id b8sm7742829qkn.133.2020.11.02.05.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 05:01:16 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kZZSV-00EvRo-QJ; Mon, 02 Nov 2020 09:01:15 -0400
Date: Mon, 2 Nov 2020 09:01:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v5 08/15] mm: Add unsafe_follow_pfn
Message-ID: <20201102130115.GC36674@ziepe.ca>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
 <20201030100815.2269-9-daniel.vetter@ffwll.ch>
 <20201102072931.GA16419@infradead.org>
 <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEe5FQuukYU7RhL90ttC9XyWw6wvdQrZ2JpP0jpbYTO6g@mail.gmail.com>
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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

On Mon, Nov 02, 2020 at 01:56:10PM +0100, Daniel Vetter wrote:
> On Mon, Nov 2, 2020 at 8:29 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Fri, Oct 30, 2020 at 11:08:08AM +0100, Daniel Vetter wrote:
> > > Also mark up follow_pfn as EXPORT_SYMBOL_GPL. The only safe way to use
> > > that by drivers/modules is together with an mmu_notifier, and that's
> > > all _GPL stuff.
> >
> > I also think it also needs to be renamed to explicitly break any existing
> > users out of tree or int the submission queue.
> 
> Ok I looked at the mmu notifier locking again and noticed that
> mm->subscriptions has its own spinlock. Since there usually shouldn't
> be a huge pile of these I think it's feasible to check for the mmu
> notifier in follow_pfn. And that would stuff this gap for good. I'll
> throw that on top as a final patch and see what people think.

Probably the simplest is to just check mm_has_notifiers() when in
lockdep or something very simple like that

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
