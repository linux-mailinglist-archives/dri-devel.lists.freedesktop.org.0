Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069C6AD108E
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 02:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A044810E0B4;
	Sun,  8 Jun 2025 00:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="1orMmb9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F6810E0B4
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 00:25:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59CB36113A;
 Sun,  8 Jun 2025 00:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB0EC4CEE4;
 Sun,  8 Jun 2025 00:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1749342322;
 bh=+360ibve8eKuNngTPzgVcpWCkrLyJ0dIH7RHpjAMhpg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=1orMmb9nFXlZ5UvyjRTRyl8oNxJAoLW9WgCsvJmHpYfu2z/HI4B3OAtANyXjS/Odd
 N/Pn3ObSTfXczlJoe49jPxabXivXOjObuRWTZcElJi6z2cnOAR+St2rGqK91GSVDSK
 oWdv+R+mN/QZZ2wFKq0UBrnFLN/JpPmCWUjs9sl4=
Date: Sat, 7 Jun 2025 17:25:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Steve Sistare
 <steven.sistare@oracle.com>, Muchun Song <muchun.song@linux.dev>,
 "David Hildenbrand" <david@redhat.com>
Subject: Re: [PATCH v3 1/3] mm/hugetlb: Make hugetlb_reserve_pages() return
 nr of entries updated
Message-Id: <20250607172521.605b6094b442386b4014613e@linux-foundation.org>
In-Reply-To: <IA0PR11MB7185D6156828CB310CDBEB41F86EA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250521052119.1105530-1-vivek.kasireddy@intel.com>
 <20250521052119.1105530-2-vivek.kasireddy@intel.com>
 <20250604163543.62d543d7ecce5afb835aae98@linux-foundation.org>
 <IA0PR11MB7185D6156828CB310CDBEB41F86EA@IA0PR11MB7185.namprd11.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 6 Jun 2025 06:14:06 +0000 "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote:

> > Also, patch [2/3] addresses a BUG which was introduced into 6.12.
> > Presumably we want to backport the fix into -stable?  If so, it's
> > better to present this as a standalone patch, including the cc:stable
> > tag.  This is because I'd be looking to fast-track the fix into the
> > 6.16-rcX cycle whereas less urgent things would be routed into
> > 6.17-rc1.
> Unless I merge patches #1 and #2, I don't think I can come up with a
> standalone fix to address the BUG. So, I don't mind having this short
> series deferred until 6.17-rc1.

If I understand correctly, we have a way in which unprivileged
userspace can trigger a BUG.  Unless we're very lucky, this wrecks the
running kernel.  So fixing this in shipped kernels is very important.

So if I indeed understand correctly, please try to find a minimal fix
which is suitable for backporting and then, as a separate series,
propose any changes which you think would improve things going forward.

Thanks.
