Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2040ADF9F7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 02:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5495410E1FE;
	Thu, 19 Jun 2025 00:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JrwfRcOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A279710E1FE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 00:02:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 24A3D4A40E;
 Thu, 19 Jun 2025 00:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA656C4CEE7;
 Thu, 19 Jun 2025 00:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1750291369;
 bh=FmmE7IcSSBNVAxWNeeYRAofAhA7QramU9ViCwXa+Dys=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JrwfRcOxX33CPFzX9PJ7i1WA8k2xEl10PvklNKm6TqQgAHGyEGImFnxuHYnXwnJzt
 ubu5E+Qnfrtj88xfTyoWVDTzDHFJMNu4yWJkDAPySqX5iGyHprDtYtSZ2U+6x+/RL5
 Sw8j9+rU2HOYfTa6IN5RPuipDKhMXU9o/kCq+itE=
Date: Wed, 18 Jun 2025 17:02:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, David
 Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] mm/hugetlb: Don't crash when allocating a folio if
 there are no resv
Message-Id: <20250618170248.89ff5c3d3fe23233424fd4da@linux-foundation.org>
In-Reply-To: <99b9f7c8-62e0-4500-b4f1-0efdb73bf502@arm.com>
References: <20250618052840.1036164-1-vivek.kasireddy@intel.com>
 <99b9f7c8-62e0-4500-b4f1-0efdb73bf502@arm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Jun 2025 12:14:49 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> > Therefore, prevent the above crash by replacing the VM_BUG_ON()
> > with WARN_ON_ONCE() as there is no need to crash the system in
> > this situation and instead we could just warn and fail the
> > allocation.
> 
> Why there are no reserved huge pages in such situations and also how
> likely this might happen ? Is it recoverable ?

I'm suspecting we don't know.

> > 
> > Fixes: 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios resv_huge_pages leak")

How was this arrived at?  This is merely the patch which added the assertion.

> > Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=a504cb5bae4fe117ba94

I can't find any mailing report/discussion of this.  The Closes: takes
us to the syskaller report which is a bit of a dead end.

I agree with the patch - converting a BUG into a WARN+recover is a good
thing but as far as I can tell, we don't know what's causing this
situation.

syskaller has a C reproducer, if anyone is feeling brave.
