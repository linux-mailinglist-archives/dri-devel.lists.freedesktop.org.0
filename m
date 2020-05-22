Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE11DDF33
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 07:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4424E6E2EF;
	Fri, 22 May 2020 05:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55736E2E1;
 Fri, 22 May 2020 05:19:33 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec760d90002>; Thu, 21 May 2020 22:19:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 21 May 2020 22:19:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 21 May 2020 22:19:33 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 May
 2020 05:19:32 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 22 May 2020 05:19:33 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.48.182]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ec760e40005>; Thu, 21 May 2020 22:19:32 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 3/4] mm/gup: introduce pin_user_pages_fast_only()
Date: Thu, 21 May 2020 22:19:30 -0700
Message-ID: <20200522051931.54191-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200522051931.54191-1-jhubbard@nvidia.com>
References: <20200522051931.54191-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590124761; bh=P+1HL8fttghTGec3+ulNAcQAsu5wNQW/E5gKuHO8GC4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=bneeUj0Bt2z5PMpIUmj/vwnO5sjU2eO6FydftKzyTt/+yWRh37/8TrU3BzE5bfl/B
 uSdxa3bQ1gQ4KC22MqJN3KlFA4sb4JqQx15/Jq1ELclVTkxhl0EnXG5KClZE+b3BiX
 yadkefAkcQo6dA5GIpiklNkKiLHoAD++QKP0ZrShkx5Sz+cLQNcdV+ewxXqkebvquw
 5zX7knwFFD5NRVRBRXzJmjJDCIhA+hUfKKNjk6Lyp80+PGm8EvVfOkk2OOprK5q336
 StYEhVA+25VoYf5I1Pr4dGcakBPBplqg+qSFcDah/P3HtpwtA/t5+qtnM76vyQHl5j
 g2esMQrSy6HQA==
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

This is the FOLL_PIN equivalent of __get_user_pages_fast(),
except with a more descriptive name, and gup_flags instead of
a boolean "write" in the argument list.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 include/linux/mm.h |  2 ++
 mm/gup.c           | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 84b601cab699..98be7289d7e9 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1820,6 +1820,8 @@ extern int mprotect_fixup(struct vm_area_struct *vma,
  */
 int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 			  struct page **pages);
+int pin_user_pages_fast_only(unsigned long start, int nr_pages,
+			     unsigned int gup_flags, struct page **pages);
 /*
  * per-process(per-mm_struct) statistics.
  */
diff --git a/mm/gup.c b/mm/gup.c
index 4564b0dc7d0b..6fa9b2016a53 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2859,6 +2859,42 @@ int pin_user_pages_fast(unsigned long start, int nr_pages,
 }
 EXPORT_SYMBOL_GPL(pin_user_pages_fast);
 
+/*
+ * This is the FOLL_PIN equivalent of __get_user_pages_fast(). Behavior is the
+ * same, except that this one sets FOLL_PIN instead of FOLL_GET.
+ *
+ * The API rules are the same, too: no negative values may be returned.
+ */
+int pin_user_pages_fast_only(unsigned long start, int nr_pages,
+			     unsigned int gup_flags, struct page **pages)
+{
+	int nr_pinned;
+
+	/*
+	 * FOLL_GET and FOLL_PIN are mutually exclusive. Note that the API
+	 * rules require returning 0, rather than -errno:
+	 */
+	if (WARN_ON_ONCE(gup_flags & FOLL_GET))
+		return 0;
+	/*
+	 * FOLL_FAST_ONLY is required in order to match the API description of
+	 * this routine: no fall back to regular ("slow") GUP.
+	 */
+	gup_flags |= (FOLL_PIN | FOLL_FAST_ONLY);
+	nr_pinned = internal_get_user_pages_fast(start, nr_pages, gup_flags,
+						 pages);
+	/*
+	 * This routine is not allowed to return negative values. However,
+	 * internal_get_user_pages_fast() *can* return -errno. Therefore,
+	 * correct for that here:
+	 */
+	if (nr_pinned < 0)
+		nr_pinned = 0;
+
+	return nr_pinned;
+}
+EXPORT_SYMBOL_GPL(pin_user_pages_fast_only);
+
 /**
  * pin_user_pages_remote() - pin pages of a remote process (task != current)
  *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
