Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F41431FA36
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 15:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5B36EB3B;
	Fri, 19 Feb 2021 14:01:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48126EB3C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 14:01:09 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id o21so3944101qtr.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 06:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Uy9+p8EYLZ+2upxXdnXYCqgGljKcN5wTbKwGZwnqinY=;
 b=I5flSyH/gLTP7kfpLHlSgh5tXtA+Jh1EsK+6uIgyy09vUXp0IZUoyofNXle2UG8+9x
 6bQcZMjTHGSnCjsIADBeVZNPoafr3TSU4gbVUKm8tx7gxct5TAh1oqibAjgx2ny24Qlv
 nA8b7dO5wJoNvKGJUaq5YdpKB1knNz20AuCjHXqPKjX/HXDnk9GUA8KprUxsiW5TqfOU
 9o+5AHrQgpJl5wOCAeVJMcNlnBgpfbhD2hv2/vQ80bpHkUbm4gdpFUasgTAZI9JejzbF
 hWMAig8ep9wZI5JeASo7p/0n5GOB7qV6LVTspTVmRmVoA3TvIzBilhfwzcUDD73XF8lP
 SRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uy9+p8EYLZ+2upxXdnXYCqgGljKcN5wTbKwGZwnqinY=;
 b=M0/lj+yihSwrgMHDAH0S7sNQsG7jcI9T3KN+Wx68UREKN/WfwT61GwaahS4Iv4VloO
 J3Jq9UlEvIr/TVdSnnyOB4ehDIFrzwKEoVYFDNheDyy6BFPn4/ALthhPTBMls+zlw8uM
 PVZ6n7a4+uqcHofjCFXEXCYiZ6MhhXg3vQ0PO8X3Z7mF9iTuCP/PKn495/xtJGR2KQ7m
 MiAx/UDqDk7q9Bxtt6jRkYpWFebgaUCuDeWkjQ4xwDRTaKNvSStzIMAJ8Pd3GlVj/MV+
 HIi+jGCb/7txCVxRtlb7A/5ZCHO0nFStltG+U0Guxsdas+hSoq4ZvDGP2gkAtmESy5CX
 ilZg==
X-Gm-Message-State: AOAM53218c/Q75cMBWHairn4W3UAfMKorPpHn2FzaeSq5x2CW1qaLRb9
 j7eCei4LXYjDAjrIi7upD6HJUg==
X-Google-Smtp-Source: ABdhPJwvDnWgEME/UBp5mpDqS0tmSE99XXBjYe+mDgcmjGaB5orYQxdcs7Ze95f3nVqD5XVW9Zc5qg==
X-Received: by 2002:a05:622a:306:: with SMTP id
 q6mr8969998qtw.15.1613743266418; 
 Fri, 19 Feb 2021 06:01:06 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id 14sm5338161qtx.84.2021.02.19.06.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:01:05 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lD6LB-00CPnQ-2t; Fri, 19 Feb 2021 10:01:05 -0400
Date: Fri, 19 Feb 2021 10:01:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 1/4] hmm: Device exclusive memory access
Message-ID: <20210219140105.GE2643399@ziepe.ca>
References: <20210219020750.16444-1-apopple@nvidia.com>
 <20210219020750.16444-2-apopple@nvidia.com>
 <20210219094741.GA641389@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219094741.GA641389@infradead.org>
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 bskeggs@redhat.com, jhubbard@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 19, 2021 at 09:47:41AM +0000, Christoph Hellwig wrote:

> > diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> > index 866a0fa104c4..5d28ff6d4d80 100644
> > +++ b/include/linux/hmm.h
> > @@ -109,6 +109,10 @@ struct hmm_range {
> >   */
> >  int hmm_range_fault(struct hmm_range *range);
> >  
> > +int hmm_exclusive_range(struct mm_struct *mm, unsigned long start,
> > +			unsigned long end, struct page **pages);
> > +vm_fault_t hmm_remove_exclusive_entry(struct vm_fault *vmf);
> 
> Can we avoid the hmm naming for new code (we should probably also kill
> it off for the existing code)?

Yes please, I'd prefer it if hmm.c was just the special page walker
and not a grab bag of unrelated things

Is there is a more natural place to put this in the mm for this idea?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
