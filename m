Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17332728FA4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 08:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DA210E100;
	Fri,  9 Jun 2023 06:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A847910E1D6
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 06:09:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CC8A65190;
 Fri,  9 Jun 2023 06:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AD7C433D2;
 Fri,  9 Jun 2023 06:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1686290959;
 bh=VymAURH6DqwhMHojBPt5ZuPQYK69zpD8+HmhzERJHQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BUcm9vafTjmhcgggePjJmaz/CH0W+mbeHr5qrrQwiB0h1f0JVSlBxyQKzOgMopEnY
 lFRs6FwN6lXiIizorV33KI6IMNKLqQPxpXoK4tRUII5GGb3Z08TYo2zB8FwXnZmiP8
 Hwt8ucnJj7jNCiplSapmsMgpbeFiRHshdQZliN6g=
Date: Fri, 9 Jun 2023 08:09:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
Message-ID: <2023060908-pretender-boastful-cbb9@gregkh>
References: <20230608204927.88711-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608204927.88711-1-mike.kravetz@oracle.com>
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
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Junxiao Chang <junxiao.chang@intel.com>, muchun.song@linux.dev,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 kirill.shutemov@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 08, 2023 at 01:49:27PM -0700, Mike Kravetz wrote:
> This effectively reverts commit 16c243e99d33 ("udmabuf: Add support
> for mapping hugepages (v4)").  Recently, Junxiao Chang found a BUG
> with page map counting as described here [1].  This issue pointed out
> that the udmabuf driver was making direct use of subpages of hugetlb
> pages.  This is not a good idea, and no other mm code attempts such use.
> In addition to the mapcount issue, this also causes issues with hugetlb
> vmemmap optimization and page poisoning.
> 
> For now, remove hugetlb support.
> 
> If udmabuf wants to be used on hugetlb mappings, it should be changed to
> only use complete hugetlb pages.  This will require different alignment
> and size requirements on the UDMABUF_CREATE API.
> 
> [1] https://lore.kernel.org/linux-mm/20230512072036.1027784-1-junxiao.chang@intel.com/
> 
> Fixes: 16c243e99d33 ("udmabuf: Add support for mapping hugepages (v4)")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
