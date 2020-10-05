Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41E82838C7
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 17:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB30F6E039;
	Mon,  5 Oct 2020 15:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1EE6E039
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:03:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73158AB95;
 Mon,  5 Oct 2020 15:03:31 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1B7271E12EF; Mon,  5 Oct 2020 17:03:31 +0200 (CEST)
Date: Mon, 5 Oct 2020 17:03:31 +0200
From: Jan Kara <jack@suse.cz>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
Message-ID: <20201005150331.GE4225@quack2.suse.cz>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
 <20201002180603.GL9916@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002180603.GL9916@ziepe.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

On Fri 02-10-20 15:06:03, Jason Gunthorpe wrote:
> This get_vaddr_frames() thing looks impossible to use properly. How on
> earth does a driver guarentee
> 
>  "If @start belongs to VM_IO | VM_PFNMAP vma, we don't touch page
>  structures and the caller must make sure pfns aren't reused for
>  anything else while he is using them."
> 
> The only possible way to do that is if the driver restricts the VMAs
> to ones it owns and interacts with the vm_private data to refcount
> something.
> 
> Since every driver does this wrong anything that uses this is creating
> terrifying security issues.
> 
> IMHO this whole API should be deleted :(

So I'm the one guilty for introducing this API. The API was created to
factor out code in several (mostly V4L AFAIR) drivers thus reducing amount
of drivers poking into MM internals and getting things wrong in various
cases. It may well be that the API is still broken from "can driver ensure
this" POV - I tried to keep things things as they were before in this
regard as I have very little knowledge in how these drivers are supposed to
work.

Anyway, if you can make this go away, sure go ahead :)

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
