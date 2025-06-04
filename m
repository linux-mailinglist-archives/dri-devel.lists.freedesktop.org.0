Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1600ACE739
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 01:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD22410E88E;
	Wed,  4 Jun 2025 23:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KTkevKoi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9C110E89B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 23:35:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2645F61139;
 Wed,  4 Jun 2025 23:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA23C4CEE4;
 Wed,  4 Jun 2025 23:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1749080143;
 bh=Al+b9iBLmj7gkjnUaYuFmAa3gwdNmm1ixJqx06DYImg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KTkevKoiGVaAt/gwIotZ7GoH52+lXpkIp6geyI4MgOgZOuco6/xu+wvQPq9XWJRZ3
 uRH/9BBUxhOz7uAiSrp7RJde2kikpnWWC/y1y5pMIWPSPh4ItI5N8bjujTzei5hgMW
 Seq8rQCI6h/wPxe3nn8G7YCxmDA+b43zAfIJ6ufE=
Date: Wed, 4 Jun 2025 16:35:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>, David
 Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 1/3] mm/hugetlb: Make hugetlb_reserve_pages() return
 nr of entries updated
Message-Id: <20250604163543.62d543d7ecce5afb835aae98@linux-foundation.org>
In-Reply-To: <20250521052119.1105530-2-vivek.kasireddy@intel.com>
References: <20250521052119.1105530-1-vivek.kasireddy@intel.com>
 <20250521052119.1105530-2-vivek.kasireddy@intel.com>
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

On Tue, 20 May 2025 22:19:35 -0700 Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:

> Currently, hugetlb_reserve_pages() returns a bool to indicate whether
> the reservation map update for the range [from, to] was successful or
> not. This is not sufficient for the case where the caller needs to
> determine how many entries were updated for the range.
> 
> Therefore, have hugetlb_reserve_pages() return the number of entries
> updated in the reservation map associated with the range [from, to].
> Also, update the callers of hugetlb_reserve_pages() to handle the new
> return value.

Everyone has forgotten, so please refresh, retest and resend after
-rc1?

Also, patch [2/3] addresses a BUG which was introduced into 6.12. 
Presumably we want to backport the fix into -stable?  If so, it's
better to present this as a standalone patch, including the cc:stable
tag.  This is because I'd be looking to fast-track the fix into the
6.16-rcX cycle whereas less urgent things would be routed into
6.17-rc1.

Also, [2/3] has

	Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com

which is kind of annoying if one wishes to see the syzbot report.  OK,
it takes takes 30 seconds of googling, but adding a Closes: link is
nice.

