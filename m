Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F0727960
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA73910E205;
	Thu,  8 Jun 2023 07:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED27A10E205
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 07:59:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00A53649AF;
 Thu,  8 Jun 2023 07:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E548BC433D2;
 Thu,  8 Jun 2023 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1686211171;
 bh=QZuWevEGbS7eH2QLlHDqrU/R3vNNbwBkMxJ4axuXrX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dF3xz25m+LQkLdlwXOwbZZjt1/wv+xR4bFflH2QjCLC+7NriFigEBzeRodOtmVBhJ
 v2yYDfpCcf02TcZrie+aIln2HvEM9QmHJcxtTKElYUGlHKrf9CRezjgXJ9GKaYjbtg
 czaVrAG6gxS/9Ulo3AwVRZbPDlD6x9AfQYMDu23I=
Date: Thu, 8 Jun 2023 09:59:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] mm: fix hugetlb page unmap count balance issue
Message-ID: <2023060803-trailing-ladder-2d53@gregkh>
References: <20230512072036.1027784-1-junxiao.chang@intel.com>
 <CADrL8HV25JyeaT=peaR7NWhUiaBz8LzpyFosYZ3_0ACt+twU6w@mail.gmail.com>
 <20230512232947.GA3927@monkey> <20230515170259.GA3848@monkey>
 <20230516223440.GA30624@monkey>
 <20230607120312.6da5cea7677ec1a3da35b92c@linux-foundation.org>
 <20230607205310.GA4122@monkey>
 <20230607140001.6685b0a058511f125a005da4@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607140001.6685b0a058511f125a005da4@linux-foundation.org>
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
 kirill.shutemov@linux.intel.com, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 07, 2023 at 02:00:01PM -0700, Andrew Morton wrote:
> On Wed, 7 Jun 2023 13:53:10 -0700 Mike Kravetz <mike.kravetz@oracle.com> wrote:
> 
> > > 
> > > BUGs aren't good.  Can we please find a way to push this along?
> > > 
> > > Have we heard anything from any udmabuf people?
> > > 
> > 
> > I have not heard anything.  When this issue popped up, it took me by surprise.
> > 
> > udmabuf maintainer (Gerd Hoffmann), the people who added hugetlb support and
> > the list where udmabuf was developed (dri-devel@lists.freedesktop.org) have
> > been on cc.
> 
> Maybe Greg can suggest a way forward.

I'm guessing that no one is using this code then, so why don't we just
remove it entirely?

thanks,

greg k-h
