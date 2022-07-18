Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFA0578BCE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 22:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E464310E594;
	Mon, 18 Jul 2022 20:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43DF10E594;
 Mon, 18 Jul 2022 20:32:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 92AE3B8179F;
 Mon, 18 Jul 2022 20:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1B2C341C0;
 Mon, 18 Jul 2022 20:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1658176356;
 bh=tVhY1ahFLjj6vTGPep6MAG7OR+bCm6MQ/EAA9xTV0WI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0dw4cFB42gg7zj8HiQLc7D+Npd1QELSrzQuuDGx8jBrtkX5XSY6IdxrkIDJPU2Cda
 tAqDaeoI64/mIBlrH5Ua4Ub73MSKc4+PLVOj1xGe4Ppk7yJT8pAdAbIMDrWigRp2+7
 0rgoEva+ImYH2rnIxXKDMOVONVzb6MdwtWcG4A/A=
Date: Mon, 18 Jul 2022 13:32:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v9 06/14] mm/gup: migrate device coherent pages when
 pinning instead of failing
Message-Id: <20220718133235.4fdbd6ec303219e5a3ba49cf@linux-foundation.org>
In-Reply-To: <225554c2-9174-555e-ddc0-df95c39211bc@redhat.com>
References: <20220715150521.18165-1-alex.sierra@amd.com>
 <20220715150521.18165-7-alex.sierra@amd.com>
 <225554c2-9174-555e-ddc0-df95c39211bc@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Jul 2022 12:56:29 +0200 David Hildenbrand <david@redhat.com> wrote:

> >  		/*
> >  		 * Try to move out any movable page before pinning the range.
> >  		 */
> > @@ -1919,7 +1948,8 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
> >  				    folio_nr_pages(folio));
> >  	}
> >  
> > -	if (!list_empty(&movable_page_list) || isolation_error_count)
> > +	if (!list_empty(&movable_page_list) || isolation_error_count
> > +		|| coherent_pages)
> 
> The common style is to
> 
> a) add the || to the end of the previous line
> b) indent such the we have a nice-to-read alignment
> 
> if (!list_empty(&movable_page_list) || isolation_error_count ||
>     coherent_pages)
> 

I missed that.  This series is now in mm-stable so any fix will need to
be a standalone followup patch, please.

> Apart from that lgtm.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>

And your reviewed-by's will be lost.  Stupid git.
