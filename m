Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CBC174AF5
	for <lists+dri-devel@lfdr.de>; Sun,  1 Mar 2020 05:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617C86E0D9;
	Sun,  1 Mar 2020 04:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575DF6E0D9
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2020 04:04:43 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5D5721556;
 Sun,  1 Mar 2020 04:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583035483;
 bh=v2mcxXWb+R0Vhm17A6puuY8jR6c5Oi6XU1V671GdlZ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A9ePQgV6KKC2mkpgUEeBYsaX6+itQcOiQNHySSIms4bmN2iXMXtJp8zDfWu9gN+1l
 qLpc36KbDrTZG6q6a0Kl2c7YXPNDWfnXq+av5ZtkmQ3q8vLAfkCCQVmzDloJiqH+SK
 3ISuA3wgjNsV83UMHc6LmY1VdlRzPJeOi2p8XA8s=
Date: Sat, 29 Feb 2020 20:04:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= (VMware) <thomas_os@shipmail.org>
Subject: Re: [PATCH 2/8] mm: Split huge pages on write-notify or COW
Message-Id: <20200229200442.64bf59df288962382d46fd55@linux-foundation.org>
In-Reply-To: <20191203132239.5910-3-thomas_os@shipmail.org>
References: <20191203132239.5910-1-thomas_os@shipmail.org>
 <20191203132239.5910-3-thomas_os@shipmail.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?ISO-8859-1?Q?J=E9r=F4me?= Glisse <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue,  3 Dec 2019 14:22:33 +0100 Thomas Hellstr=F6m (VMware) <thomas_os@s=
hipmail.org> wrote:

> We currently only do COW and write-notify on the PTE level, so if the
> huge_fault() handler returns VM_FAULT_FALLBACK on wp faults,
> split the huge pages and page-table entries. Also do this for huge PUDs
> if there is no huge_fault() handler and the vma is not anonymous, similar
> to how it's done for PMDs.

There is no description here of *why* we are making this change?

> Note that fs/dax.c does the splitting in the huge_fault() handler, but as
> huge_fault() is implemented by modules we need to consider whether to
> export the splitting functions for use in the modules or whether to try
> to keep calls in the core. Opt for the latter. A follow-up patch can
> remove the dax.c split_huge_pmd() if needed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
