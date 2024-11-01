Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C269B9606
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 17:58:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4110610E9E5;
	Fri,  1 Nov 2024 16:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="p6BC5Tlk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6C310E9E5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O29dCXx+phviG21mQhq8obCWSt3spMP5spSqVzL91xU=; b=p6BC5TlkYl1DzocJbUreIvt+mi
 QUQiD0X/QqVmAhFfPnCZ0DyuPHPVxcnHzKJTX/fRHHEJVi+LWZZniaI6ZUEQdH8tf44MPaga+ZUMj
 ySQK/up940WgZ4PCL+0aZt81SPtTbPe9oEzbihUalr1uYIZZFReb3bpLOXAeFNZ9JsRkI95c639/U
 /OFsyRR2hq+0+T2EIGYWzWIuN4F98W+cBP3IYlg93OwCFZc3dXF5e1VnCLHa2O6CuPiXolUXFD4wJ
 KDoQlnKnfojnzTuBXLo/muxVEAlqtrxx68QdYsqySbyJyb+eU8uTTvBcDO/fQF6iKZeuwehieC/M0
 9f2QG4Iw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t6uyD-000VPu-14; Fri, 01 Nov 2024 17:57:57 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>,
 Barry Song <baohua@kernel.org>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lance Yang <ioworker0@gmail.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v5 2/5] mm: shmem: control THP support through the kernel
 command line
Date: Fri,  1 Nov 2024 13:54:06 -0300
Message-ID: <20241101165719.1074234-4-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241101165719.1074234-2-mcanal@igalia.com>
References: <20241101165719.1074234-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add a new kernel command line to control the hugepage allocation policy
for the internal shmem mount, ``transparent_hugepage_shmem``. The
parameter is similar to ``transparent_hugepage`` and has the following
format:

transparent_hugepage_shmem=<policy>

where ``<policy>`` is one of the seven valid policies available for
shmem.

Configuring the default huge page allocation policy for the internal
shmem mount can be beneficial for DRM GPU drivers. Just as CPU
architectures, GPUs can also take advantage of huge pages, but this is
possible only if DRM GEM objects are backed by huge pages.

Since GEM uses shmem to allocate anonymous pageable memory, having control
over the default huge page allocation policy allows for the exploration of
huge pages use on GPUs that rely on GEM objects backed by shmem.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 .../admin-guide/kernel-parameters.txt         |  7 ++
 Documentation/admin-guide/mm/transhuge.rst    |  6 ++
 mm/shmem.c                                    | 72 +++++++++++++------
 3 files changed, 62 insertions(+), 23 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1666576acc0e..acabb04d0dd4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6926,6 +6926,13 @@
 			See Documentation/admin-guide/mm/transhuge.rst
 			for more details.
 
+	transparent_hugepage_shmem= [KNL]
+			Format: [always|within_size|advise|never|deny|force]
+			Can be used to control the hugepage allocation policy for
+			the internal shmem mount.
+			See Documentation/admin-guide/mm/transhuge.rst
+			for more details.
+
 	trusted.source=	[KEYS]
 			Format: <string>
 			This parameter identifies the trust source as a backend
diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index abdf10a1c7db..9c6f6da612c4 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -326,6 +326,12 @@ PMD_ORDER THP policy will be overridden. If the policy for PMD_ORDER
 is not defined within a valid ``thp_anon``, its policy will default to
 ``never``.
 
+Similarly to ``transparent_hugepage``, you can control the hugepage
+allocation policy for the internal shmem mount by using the kernel parameter
+``transparent_hugepage_shmem=<policy>``, where ``<policy>`` is one of the
+seven valid policies for shmem (``always``, ``within_size``, ``advise``,
+``never``, ``deny``, and ``force``).
+
 Hugepages in tmpfs/shmem
 ========================
 
diff --git a/mm/shmem.c b/mm/shmem.c
index 275251abd596..dfcc88ec6e34 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -582,24 +582,39 @@ static bool shmem_huge_global_enabled(struct inode *inode, pgoff_t index,
 	}
 }
 
-#if defined(CONFIG_SYSFS)
 static int shmem_parse_huge(const char *str)
 {
+	int huge;
+
+	if (!str)
+		return -EINVAL;
+
 	if (!strcmp(str, "never"))
-		return SHMEM_HUGE_NEVER;
-	if (!strcmp(str, "always"))
-		return SHMEM_HUGE_ALWAYS;
-	if (!strcmp(str, "within_size"))
-		return SHMEM_HUGE_WITHIN_SIZE;
-	if (!strcmp(str, "advise"))
-		return SHMEM_HUGE_ADVISE;
-	if (!strcmp(str, "deny"))
-		return SHMEM_HUGE_DENY;
-	if (!strcmp(str, "force"))
-		return SHMEM_HUGE_FORCE;
-	return -EINVAL;
+		huge = SHMEM_HUGE_NEVER;
+	else if (!strcmp(str, "always"))
+		huge = SHMEM_HUGE_ALWAYS;
+	else if (!strcmp(str, "within_size"))
+		huge = SHMEM_HUGE_WITHIN_SIZE;
+	else if (!strcmp(str, "advise"))
+		huge = SHMEM_HUGE_ADVISE;
+	else if (!strcmp(str, "deny"))
+		huge = SHMEM_HUGE_DENY;
+	else if (!strcmp(str, "force"))
+		huge = SHMEM_HUGE_FORCE;
+	else
+		return -EINVAL;
+
+	if (!has_transparent_hugepage() &&
+	    huge != SHMEM_HUGE_NEVER && huge != SHMEM_HUGE_DENY)
+		return -EINVAL;
+
+	/* Do not override huge allocation policy with non-PMD sized mTHP */
+	if (huge == SHMEM_HUGE_FORCE &&
+	    huge_shmem_orders_inherit != BIT(HPAGE_PMD_ORDER))
+		return -EINVAL;
+
+	return huge;
 }
-#endif
 
 #if defined(CONFIG_SYSFS) || defined(CONFIG_TMPFS)
 static const char *shmem_format_huge(int huge)
@@ -5066,15 +5081,7 @@ static ssize_t shmem_enabled_store(struct kobject *kobj,
 
 	huge = shmem_parse_huge(tmp);
 	if (huge == -EINVAL)
-		return -EINVAL;
-	if (!has_transparent_hugepage() &&
-			huge != SHMEM_HUGE_NEVER && huge != SHMEM_HUGE_DENY)
-		return -EINVAL;
-
-	/* Do not override huge allocation policy with non-PMD sized mTHP */
-	if (huge == SHMEM_HUGE_FORCE &&
-	    huge_shmem_orders_inherit != BIT(HPAGE_PMD_ORDER))
-		return -EINVAL;
+		return huge;
 
 	shmem_huge = huge;
 	if (shmem_huge > SHMEM_HUGE_DENY)
@@ -5171,6 +5178,25 @@ struct kobj_attribute thpsize_shmem_enabled_attr =
 	__ATTR(shmem_enabled, 0644, thpsize_shmem_enabled_show, thpsize_shmem_enabled_store);
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE && CONFIG_SYSFS */
 
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE)
+
+static int __init setup_transparent_hugepage_shmem(char *str)
+{
+	int huge;
+
+	huge = shmem_parse_huge(str);
+	if (huge == -EINVAL) {
+		pr_warn("transparent_hugepage_shmem= cannot parse, ignored\n");
+		return huge;
+	}
+
+	shmem_huge = huge;
+	return 1;
+}
+__setup("transparent_hugepage_shmem=", setup_transparent_hugepage_shmem);
+
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
 #else /* !CONFIG_SHMEM */
 
 /*
-- 
2.46.2

