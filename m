Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839C51DDB1B
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 01:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EEB6E060;
	Thu, 21 May 2020 23:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF416E060;
 Thu, 21 May 2020 23:38:44 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec710b40001>; Thu, 21 May 2020 16:37:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 May 2020 16:38:44 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 May 2020 16:38:44 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 May
 2020 23:38:43 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Thu, 21 May 2020 23:38:43 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.182]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ec711020004>; Thu, 21 May 2020 16:38:43 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] mm/gup: fixup gup.c for "mm/gup: refactor and de-duplicate
 gup_fast() code"
Date: Thu, 21 May 2020 16:38:41 -0700
Message-ID: <20200521233841.1279742-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590104244; bh=oK3cn3yjsB7kmSIMJxAJI0j+n+7vBZVJ7t2DXnyjgUI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=izCdN89AWfExilHUwGQewVpC/TR2eV0PG31JIjZgDPHNR7BymtQsj13yg+A1XApO1
 Ygum2vlEXMeDgkBjbCncWJsg8iHcSjtXVdwiUhGhkaTGTM/gu+LdUcnevDhwXTwJAU
 d/FJRU0sldpoVEw2n7Wdu0aVAs224oYw4bvIo0h1mFTXZMxU1Rd9ARWwIXMvdR6m5b
 17W3ETWgvQmu4GR+nl3xiJHeV/jEEhdSpBhO/Z+Mq0xT76DGr99gH5WkZEb6C0xA2s
 brVRbZiat6q0a7vVARoEq+/4dtxXTO5rlj529m9CGd6dXmOVYIlW8xHp7/e3OAtZUW
 rnXmFsdDGOFAA==
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

Include FOLL_FAST_ONLY in the list of flags to *not* WARN()
on, in internal_get_user_pages_fast().

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---

Hi Andrew, Chris,

Andrew: This is a fixup that applies to today's (20200521) linux-next.
In that tree, this fixes up:

commit dfb8dfe80808 ("mm/gup: refactor and de-duplicate gup_fast() code")

Chris: I'd like to request another CI run for the drm/i915 changes, so
for that, would you prefer that I post a v2 of the series [1], or
is it easier for you to just apply this patch here, on top of [2]?

[1] https://lore.kernel.org/r/20200519002124.2025955-1-jhubbard@nvidia.com

[2] https://lore.kernel.org/r/158985123351.31239.10766458886430429630@emeril.freedesktop.org

thanks,
John Hubbard
NVIDIA

 mm/gup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index dd8895f2fafa1..ada6aa79576dc 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2724,7 +2724,8 @@ static int internal_get_user_pages_fast(unsigned long start, int nr_pages,
 	int nr_pinned = 0, ret = 0;
 
 	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM |
-				       FOLL_FORCE | FOLL_PIN | FOLL_GET)))
+				       FOLL_FORCE | FOLL_PIN | FOLL_GET |
+				       FOLL_FAST_ONLY)))
 		return -EINVAL;
 
 	start = untagged_addr(start) & PAGE_MASK;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
