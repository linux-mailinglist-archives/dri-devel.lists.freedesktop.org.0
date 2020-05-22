Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C371DDF32
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 07:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0927A6E090;
	Fri, 22 May 2020 05:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972D66E090;
 Fri, 22 May 2020 05:19:33 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec760530000>; Thu, 21 May 2020 22:17:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 May 2020 22:19:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 May 2020 22:19:33 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 May
 2020 05:19:32 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 22 May 2020 05:19:32 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.182]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ec760e40002>; Thu, 21 May 2020 22:19:32 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/4] mm/gup, drm/i915: refactor gup_fast,
 convert to pin_user_pages()
Date: Thu, 21 May 2020 22:19:27 -0700
Message-ID: <20200522051931.54191-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590124628; bh=hhCuG4lTr8DGvhmADVoRUDXJfb9QfkbC0ipkPVPTT7E=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=FdOAmhGrmXVMJza0Fp11gi+KN7tPFZCcxwJ84N3GZOaBBjhCcAkKDPUSALSQYikAU
 MzT0Zbeo5nS3tAjstxwkYQ8FA8wrGmkUzrf9deBBmgnpmHBkK5mydRsXFWDPKBnudG
 p1GvWq8+hVB3Bl9d9Tr47KvpTBKuS9fU3pJqPA4pNQxhqQ3ESaHIIOeURRW+rbP6Ua
 kmolkd/z3pcX2mE9bz5e1E4P40PUlMtpjg+SKJN75igFfPsWSdJiAoU+IyFynQ93uQ
 pqb8YqUVrl+Fa97koH4oxUZEg0J7tk5+Y2oIeWBII3a+M8IXtIAIh79z60ir5gA5BI
 2SVPpX0yT9bHQ==
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
Cc: Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 linux-mm@kvack.org, Souptick Joarder <jrdr.linux@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The purpose of posting this series is to launch a test in the
intel-gfx-ci tree. (The patches have already been merged into Andrew's
linux-mm tree.)

This applies to today's linux.git (note the base-commit tag at the
bottom).

Changes since V1:

* Fixed a bug in the refactoring patch: added FOLL_FAST_ONLY to the
  list of gup_flags *not* to WARN() on. This lead to a failure in the
  first intel-gfx-ci test run [1].

[1] https://lore.kernel.org/r/159008745422.32320.5724805750977048669@build.alporthouse.com

Original cover letter:

This needs to go through Andrew's -mm tree, due to adding a new gup.c
routine. However, I would really love to have some testing from the
drm/i915 folks, because I haven't been able to run-time test that part
of it.

Otherwise, though, the series has passed my basic run time testing:
some LTP tests, some xfs and etx4 non-destructive xfstests, and an
assortment of other smaller ones: vm selftests, io_uring_register, a
few more. But that's only on one particular machine. Also, cross-compile
tests for half a dozen arches all pass.

Details:

In order to convert the drm/i915 driver from get_user_pages() to
pin_user_pages(), a FOLL_PIN equivalent of __get_user_pages_fast() was
required. That led to refactoring __get_user_pages_fast(), with the
following goals:

1) As above: provide a pin_user_pages*() routine for drm/i915 to call,
   in place of __get_user_pages_fast(),

2) Get rid of the gup.c duplicate code for walking page tables with
   interrupts disabled. This duplicate code is a minor maintenance
   problem anyway.

3) Make it easy for an upcoming patch from Souptick, which aims to
   convert __get_user_pages_fast() to use a gup_flags argument, instead
   of a bool writeable arg.  Also, if this series looks good, we can
   ask Souptick to change the name as well, to whatever the consensus
   is. My initial recommendation is: get_user_pages_fast_only(), to
   match the new pin_user_pages_only().

John Hubbard (4):
  mm/gup: move __get_user_pages_fast() down a few lines in gup.c
  mm/gup: refactor and de-duplicate gup_fast() code
  mm/gup: introduce pin_user_pages_fast_only()
  drm/i915: convert get_user_pages() --> pin_user_pages()

 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  22 +--
 include/linux/mm.h                          |   3 +
 mm/gup.c                                    | 153 ++++++++++++--------
 3 files changed, 109 insertions(+), 69 deletions(-)


base-commit: 051143e1602d90ea71887d92363edd539d411de5
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
