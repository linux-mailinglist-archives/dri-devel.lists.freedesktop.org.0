Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD318C88F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03AC6EAEF;
	Fri, 20 Mar 2020 08:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCA66EA5E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 18:50:18 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id t13so2756782qtn.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 11:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+iQmmyqtxCtarJ4YRBKb0yWGqnthI8hUUC43IFJE2lc=;
 b=O+T+k7QcGsKIEHBjgipyL31XPaNddanzbawgGU863gdvDPNIX7LYi3WVs/mOCkQatM
 kp3xPR0l9A+vuyX750Q+3/7jJVu4icOVMoEC/ohdQ5GVvA3ARolXe4ZZVnWtakCYOGal
 boy4qnC1A6on3cpFaP6DgucabbLC6sHg+E7Qo7m9ag0aas++wv/SLWln/6E5qDazux78
 cdzi7JujpLBWCBJqNIB5d7eOJ93n7akLN+Ctr6uYuANCJPwzugp1TU5/0Zr3jU0FqhYQ
 5GF51y82KW0QITwSWN2Y1KbEajR7yA6aP5DQTQFmk2rLd5pBravF6IH6lq8HScNN4zv7
 xo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+iQmmyqtxCtarJ4YRBKb0yWGqnthI8hUUC43IFJE2lc=;
 b=d3qljexcip+4eaYgsT6m0MLexvXha5pcgw0618ISngzOsuf0bSErvbrzc2dQJrf6Ly
 KfHo7ysEWBEmJJjtnf5Et5viFLcWbXx6ihg0GDzo7FUrqGrX1879l/O8Eyv46pwXfwtW
 0KXvtbGpqH2KPmM2YoJWAG2I66CAqsAQyiPfqJ+/8LCEnN5Oc+JmjYlBs3pTMN9/jXz5
 AmgO3D36zsqYtB29Yu/tqI8SWAqnZTjI7Hf2lV2v3jd9qTkV8W0mkZsnI0qvuovKudHo
 Iy8kn5t83o8/8+YmUco1FN617chJn2EaOOYqusTITG+NGKSh9ixebp1ZCN2ONkupgxlz
 BgHQ==
X-Gm-Message-State: ANhLgQ1VSfWsEbwqeRsTXsmFT0YEcrdlDfcjj/dUhggomo661dDPm892
 t9v/3m9NDA8wMRI0y3lBggQIYw==
X-Google-Smtp-Source: ADFU+vvq32in5Qjs8YAHdFEpYAPgT41J1WfLa2uHLd4XxlB1EmISPkcd3J2y54DRcA2TER5nFwTi4A==
X-Received: by 2002:ac8:4548:: with SMTP id z8mr4613857qtn.188.1584643817615; 
 Thu, 19 Mar 2020 11:50:17 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 82sm2177475qkd.62.2020.03.19.11.50.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 19 Mar 2020 11:50:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jF0FD-0004NT-Vw; Thu, 19 Mar 2020 15:50:15 -0300
Date: Thu, 19 Mar 2020 15:50:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: ensure device private pages have an owner v2
Message-ID: <20200319185015.GM20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200319002849.GG20941@ziepe.ca> <20200319071633.GA32522@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319071633.GA32522@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:24 +0000
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 08:16:33AM +0100, Christoph Hellwig wrote:
> On Wed, Mar 18, 2020 at 09:28:49PM -0300, Jason Gunthorpe wrote:
> > > Changes since v1:
> > >  - split out the pgmap->owner addition into a separate patch
> > >  - check pgmap->owner is set for device private mappings
> > >  - rename the dev_private_owner field in struct migrate_vma to src_owner
> > >  - refuse to migrate private pages if src_owner is not set
> > >  - keep the non-fault device private handling in hmm_range_fault
> > 
> > I'm happy enough to take this, did you have plans for a v3?
> 
> I think the only open question is if merging 3 and 4 might make sense.
> It's up to you if you want it resent that way or not.

Okay, I kept it as is and elaborated the commit messages a bit based
on the discussion

It doesn't seem like the changes outside hmm are significant enough to
need more acks

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
