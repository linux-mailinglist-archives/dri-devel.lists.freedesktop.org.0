Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A11286F2C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 09:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3EE6E0B8;
	Thu,  8 Oct 2020 07:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EC66E073
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 16:53:19 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 188so3506817qkk.12
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 09:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aA5/IKqeJTcjHMODAliv+D9oxsXiJBjU0Q/RoQOchc4=;
 b=ThVHp0Bf6+g4+R33mQIvIX8CheiSQQTMUuTCia9X1IqJrBuFaGelh/l39LBTeYKkvK
 NaMOGfKlUrf0z4iE8OxQVYLuzZ/JlM7sUpAQwKcFn4cRIEuVLL6aIerNL35v1pmwUkj+
 wDrYDlD+5FNGiiz175SjQIUqXASz3MvdF3eYJh+ukkwcF83qjZnM9uioklIntUHKaRya
 Zg9rg6+eKKInIDWli/ZJm1h6yck77cdzU9Fs3bEWsRArMtEGioYwK8tfNazOHk/B4xtt
 Mf7AVxNkG0ee/JcnZSnMywZa9C4+2enXUIhuG1wGpzdJZvOcjJkPsfCeezTM2uT5xq7S
 MUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aA5/IKqeJTcjHMODAliv+D9oxsXiJBjU0Q/RoQOchc4=;
 b=f+BgJ/JLNlh4l3tfa0CVETxvFYIA3Ign3s3DrCj8YrApVo5ygF9wuFQdcPXNlu+teB
 Z2tdjAvOGFuhDy2psYvjDFKlLhkeBDDhMHyhbmtTNxBpzPMXgh8OZPy2W6nVL+kWsb20
 7s6dOOMAe6Oagv5mR5ramTe3Y3wZhKlaitD2NaVJH84G5NJ+Lea+GcdhFiLHER3kDDiC
 cWuahokjWdoHkanhwrElbymj/XeOvXuXcZ58Mpc8AwNnPOHY4apxROIhw1usk4WBYruf
 gPyEpdIpB+RloVwBJswnHbMxzfE4wdbbEFZO+QUvdDmRjPPOT+g0R59lPcEH180h1QpY
 sQ3g==
X-Gm-Message-State: AOAM531QbWpwJo6yeqEy/DGOtsXDB4j9KL5oUrbIWJnZ5EbPO1ME+P28
 gsPG9HgiiEU5XTLSKYRF7hQxTg==
X-Google-Smtp-Source: ABdhPJxixhkZJXYtJ75yqJVriDbZSDlnfap0MWWWiSIn4wzaboeX7oTS66SiExjVo2w4rTtFpjs6Eg==
X-Received: by 2002:a37:aec2:: with SMTP id x185mr3746059qke.73.1602089598574; 
 Wed, 07 Oct 2020 09:53:18 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id x75sm232893qka.59.2020.10.07.09.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:53:17 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kQCgm-0010EB-Tr; Wed, 07 Oct 2020 13:53:16 -0300
Date: Wed, 7 Oct 2020 13:53:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 05/13] mm/frame-vector: Use FOLL_LONGTERM
Message-ID: <20201007165316.GT5177@ziepe.ca>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007164426.1812530-6-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Thu, 08 Oct 2020 07:20:54 +0000
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
Cc: =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>, kvm@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 07, 2020 at 06:44:18PM +0200, Daniel Vetter wrote:
>  
> -	/*
> -	 * While get_vaddr_frames() could be used for transient (kernel
> -	 * controlled lifetime) pinning of memory pages all current
> -	 * users establish long term (userspace controlled lifetime)
> -	 * page pinning. Treat get_vaddr_frames() like
> -	 * get_user_pages_longterm() and disallow it for filesystem-dax
> -	 * mappings.
> -	 */
> -	if (vma_is_fsdax(vma)) {
> -		ret = -EOPNOTSUPP;
> -		goto out;
> -	}
> -
> -	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> -		vec->got_ref = true;
> -		vec->is_pfns = false;
> -		ret = pin_user_pages_locked(start, nr_frames,
> -			gup_flags, (struct page **)(vec->ptrs), &locked);
> -		goto out;
> -	}

The vm_flags still need to be checked before going into the while
loop. If the break is taken then nothing would check vm_flags

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
