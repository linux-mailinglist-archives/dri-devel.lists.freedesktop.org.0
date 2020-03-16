Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4879B188713
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B58A6E14E;
	Tue, 17 Mar 2020 14:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAD96E210
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 18:07:15 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s11so16532321qks.8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 11:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BL4dn+rFA5hNgcpGIcpSUF3dGv9P3+nzjxB+rkZXdM4=;
 b=DKEnDkSOlfzjpgSnrXBEjUC1923pN4NQuhu8yekYIb9Cl/gcjD29oe7Zwom9ayo1l6
 ii/cMSB9TjmDtSmwKOfTrPDuuuDeMFvopq04LstsyTdRjPRJ3uMeZZgL6GohqV80EcBA
 ckySb0cXjAfeZzaSxXhVL0vckuNrSqYx+CTuNhNhQ8glRsJSUgFoipt9jfreFxXj+wzr
 +6+mSPQyLs/j+LIHlg/ZEFHwtEkLK/uwwz06tBZw7JOq2pDMUDodMqQ78UusyshS4ecy
 0YdLlpeOTbhQpt6Btu4zmOeR/h1+J13FplibFTzuwj/MzVZ3OTbxBvz9zD/JX6ulW387
 iQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BL4dn+rFA5hNgcpGIcpSUF3dGv9P3+nzjxB+rkZXdM4=;
 b=kMN3MLJX8qOmP6MwfDj7Uglwg0RHfTEEweFjtaanM+4e6bGbLx6nmpCOMAmuYf4Vqb
 Zy+C3hjUodXEUGHIdu4uS10NrJaLg1AqpCYIs8fxZJICiv61nV0oN9VtEWhzmpD8Iwnb
 ehg672UfPA1ngPxqUj28d7NZQmw11v6iuANTCwbioj/b1/5gd/cBEvFOu8Ycw6O+dK2p
 a53bBKJDSiKicJ7RBhBtWd4Zes9eGOzUxiElN0i2YTntRW6JGbSq0Qg4LPXCdSW5pgJN
 /dx6rouzBkSf2PBjRwMH89CZnnMwDBuFSohw1P7ak080ToUoGtnI/ZACb1TT5Adp/ojr
 HRFg==
X-Gm-Message-State: ANhLgQ1aobTSuHthroGjCfmSn+EW+NX/WK+egy645asAikAC1V21SFTA
 0+6ZcpMEL+gFDWarZIqDi7k0Ag==
X-Google-Smtp-Source: ADFU+vtIq8ax1/sBMUy0L6xn/rwaL8F9DxFBkYRulC2VO6q8JD8eKOdnZIYjW2re88h1P9q0ynL8UA==
X-Received: by 2002:a37:9d8f:: with SMTP id g137mr902005qke.133.1584382034472; 
 Mon, 16 Mar 2020 11:07:14 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 68sm254723qkh.75.2020.03.16.11.07.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 11:07:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jDu8v-0005Nz-7D; Mon, 16 Mar 2020 15:07:13 -0300
Date: Mon, 16 Mar 2020 15:07:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH  hmm 2/8] mm/hmm: don't free the cached pgmap while
 scanning
Message-ID: <20200316180713.GI20941@ziepe.ca>
References: <20200311183506.3997-1-jgg@ziepe.ca>
 <20200311183506.3997-3-jgg@ziepe.ca>
 <20200316090250.GB12439@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316090250.GB12439@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 10:02:50AM +0100, Christoph Hellwig wrote:
> On Wed, Mar 11, 2020 at 03:35:00PM -0300, Jason Gunthorpe wrote:
> > @@ -694,6 +672,15 @@ long hmm_range_fault(struct hmm_range *range, unsigned int flags)
> >  			return -EBUSY;
> >  		ret = walk_page_range(mm, hmm_vma_walk.last, range->end,
> >  				      &hmm_walk_ops, &hmm_vma_walk);
> > +		/*
> > +		 * A pgmap is kept cached in the hmm_vma_walk to avoid expensive
> > +		 * searching in the probably common case that the pgmap is the
> > +		 * same for the entire requested range.
> > +		 */
> > +		if (hmm_vma_walk.pgmap) {
> > +			put_dev_pagemap(hmm_vma_walk.pgmap);
> > +			hmm_vma_walk.pgmap = NULL;
> > +		}
> >  	} while (ret == -EBUSY);
> 
> In which case it should only be put on return, and not for every loop.

I chose this to be simple without having to goto unwind it.

So, instead like this:

@@ -683,21 +661,33 @@ long hmm_range_fault(struct hmm_range *range, unsigned int flags)
 		.flags = flags,
 	};
 	struct mm_struct *mm = range->notifier->mm;
-	int ret;
+	long ret;
 
 	lockdep_assert_held(&mm->mmap_sem);
 
 	do {
 		/* If range is no longer valid force retry. */
 		if (mmu_interval_check_retry(range->notifier,
-					     range->notifier_seq))
-			return -EBUSY;
+					     range->notifier_seq)) {
+			ret = -EBUSY;
+			goto out;
+		}
 		ret = walk_page_range(mm, hmm_vma_walk.last, range->end,
 				      &hmm_walk_ops, &hmm_vma_walk);
 	} while (ret == -EBUSY);
 
 	if (ret)
-		return ret;
-	return (hmm_vma_walk.last - range->start) >> PAGE_SHIFT;
+		goto out;
+	ret = (hmm_vma_walk.last - range->start) >> PAGE_SHIFT;
+
+out:
+	/*
+	 * A pgmap is kept cached in the hmm_vma_walk to avoid expensive
+	 * searching in the probably common case that the pgmap is the
+	 * same for the entire requested range.
+	 */
+	if (hmm_vma_walk.pgmap)
+		put_dev_pagemap(hmm_vma_walk.pgmap);
+	return ret;
 }
 EXPORT_SYMBOL(hmm_range_fault);

?

> I still think the right fix is to just delete all the unused and broken
> pgmap handling code.  If we ever need to add it back it can be added
> in a proper understood and tested way.

What I want to add is something like

 if (pgmap != walk->required_pgmap)
     cpu_flags = 0
 hmm_range_need_fault(..., cpu_flags, ...)

Which will fix a bug in nouveau where it blindly assumes any device
pages are its own, IIRC.

I think Ralph observed it needs to be here, because if the pgmap
doesn't match then it should trigger migration, in a single call,
rather than iterating.

I'm mostly expecting to replace all the other pgmap code, but keep the
pgmap caching. The existing pgmap stuff seems approx right, but
useless..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
