Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C111893B6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 02:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DA86E266;
	Wed, 18 Mar 2020 01:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C8F6E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 17:32:16 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id z8so14786543qto.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 10:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q/uuGRZEOsDl+bE2n4dBjQindS2U+dSkshg9e/3rsJY=;
 b=FU4iUBgbL/YDOzKu+bjTnxXn9TflPig4spFWJmilzk34kRefbe53ABssDpnYq4RxiZ
 n+O0F9b3g0saj53WHsCNw5lj/7/hY9KDJgPbxFKg1RV/01pre5JdZmlAkXMNQHxWapmi
 GprzttsXWQT9FXf/jK4VEXwggJDPRtExDhINmyI8LiapOrpi52Hmxmp/qtYxgvT0ClFa
 00xf+UmfedAWNC5qQzvH5yQdL0FIMlujhU3Kt/3E0lniCZy7MVtlf7dJy6MDyLvq5A+d
 NsyuTABobaFq0uYwqJPFhHf545MhX77WFDFIuE4jQpUv4U9urn5L79qq79pmeF23Wts7
 R4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q/uuGRZEOsDl+bE2n4dBjQindS2U+dSkshg9e/3rsJY=;
 b=kbAayPJ01sY7Hk2fgGCg3e8PrfKVq/dREljfNKTVlHlEDKko4GC7+zHZ2q1B1VhxXU
 mzupNkcpToOIPgvFbGOBc7A07z8F06CX1UmrR34PNVJNHkn5H0v+TXm3+OTEHZcVpaeC
 chtpTzCx3yWfDXNxI3cyyKnbZzLwrg9CPrSzg345QIgu1pNmGGHRDKAMjfxoxXozIHvl
 8R1pXq/TV6KPiKLQ7Ri8Pd0iOXA4qDuF+zDiAwBqkxnwPhSNUhPw76jvrI5VaJKz2CdR
 7240GkS0d2A2fsbzbhnlny1ScpaYjNk4RB571kyoT51cmNAZb2v0ZB9MpDNDIoFu4/az
 1+GA==
X-Gm-Message-State: ANhLgQ0X9hpvH4zvK+iWQJWebQAzWLk6w4obcn+X+Cwtge1WAZwY+uoZ
 J54o82/iO99llbbB4opVdIOyAg==
X-Google-Smtp-Source: ADFU+vvQkJHNXbvVdLtnlJMGZHp70Sk2ysRUXTAeHVBKUuaYuYs7P0Nymi41g21wcvfTtdp5N+dboA==
X-Received: by 2002:ac8:184f:: with SMTP id n15mr190677qtk.371.1584466335681; 
 Tue, 17 Mar 2020 10:32:15 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id z1sm2584388qtc.51.2020.03.17.10.32.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Mar 2020 10:32:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jEG4c-0006CT-8g; Tue, 17 Mar 2020 14:32:14 -0300
Date: Tue, 17 Mar 2020 14:32:14 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Message-ID: <20200317173214.GT20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de>
 <20200317122813.GA11866@lst.de> <20200317124755.GR20941@ziepe.ca>
 <20200317125955.GA12847@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317125955.GA12847@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 18 Mar 2020 01:38:24 +0000
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 01:59:55PM +0100, Christoph Hellwig wrote:
> On Tue, Mar 17, 2020 at 09:47:55AM -0300, Jason Gunthorpe wrote:
> > I've been using v7 of Ralph's tester and it is working well - it has
> > DEVICE_PRIVATE support so I think it can test this flow too. Ralph are
> > you able?
> > 
> > This hunk seems trivial enough to me, can we include it now?
> 
> I can send a separate patch for it once the tester covers it.  I don't
> want to add it to the original patch as it is a significant behavior
> change compared to the existing code.

Okay. I'm happy enough for now that amdgpu will get ERROR on
device_private pages. That is a bug fix in of itself.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
