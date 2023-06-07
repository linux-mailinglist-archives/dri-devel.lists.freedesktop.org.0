Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B332A726F8D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD1E10E0FB;
	Wed,  7 Jun 2023 21:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCC310E0FB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 21:00:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C3CB64886;
 Wed,  7 Jun 2023 21:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2252BC433D2;
 Wed,  7 Jun 2023 21:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1686171602;
 bh=K7QsNx354p5UJb+W0jt0jJmIo1DtPxXeGq1FHy48xWw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KTNvxPinFizEuJn1y1ca+OL7HSvTz45fSL1nS4DIvD+mRfKBSBF+XQsXofn0uAWLw
 Cm9GZS4khbbCdQlp00yyEJPPiS6HTZ5LXu/afx0eqEv2zq4yCcTz2jcQkzb3crBfLf
 mwoI4754n1XsqP8Oqd8DCAaT0ZMyvzV3fKt5xAJg=
Date: Wed, 7 Jun 2023 14:00:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH] mm: fix hugetlb page unmap count balance issue
Message-Id: <20230607140001.6685b0a058511f125a005da4@linux-foundation.org>
In-Reply-To: <20230607205310.GA4122@monkey>
References: <20230512072036.1027784-1-junxiao.chang@intel.com>
 <CADrL8HV25JyeaT=peaR7NWhUiaBz8LzpyFosYZ3_0ACt+twU6w@mail.gmail.com>
 <20230512232947.GA3927@monkey> <20230515170259.GA3848@monkey>
 <20230516223440.GA30624@monkey>
 <20230607120312.6da5cea7677ec1a3da35b92c@linux-foundation.org>
 <20230607205310.GA4122@monkey>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: mhocko@suse.com, jmarchan@redhat.com, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-mm@kvack.org,
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kirill.shutemov@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 7 Jun 2023 13:53:10 -0700 Mike Kravetz <mike.kravetz@oracle.com> wrote:

> > 
> > BUGs aren't good.  Can we please find a way to push this along?
> > 
> > Have we heard anything from any udmabuf people?
> > 
> 
> I have not heard anything.  When this issue popped up, it took me by surprise.
> 
> udmabuf maintainer (Gerd Hoffmann), the people who added hugetlb support and
> the list where udmabuf was developed (dri-devel@lists.freedesktop.org) have
> been on cc.

Maybe Greg can suggest a way forward.

> My 'gut reaction' would be to remove hugetlb support from udmabuf.  From a
> quick look, if we really want this support then there will need to be some
> API changes.  For example UDMABUF_CREATE should be hugetlb page aligned
> and a multiple of hugetlb page size if using a hugetlb mapping.
> 
> It would be good to know about users of the driver.

So disabling "hugetlb=on" (and adding an explanatory printk) would
suffice for now?
