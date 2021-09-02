Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B313FE75A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 04:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C4B8994D;
	Thu,  2 Sep 2021 02:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7A28994D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 02:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=8jUKRG59iHwqmgF692omQt7SzopfyVzzs32Eyg39CYc=; b=p/3AJPXNQIzMu4hHzTQ/0BqHeF
 Q/y0Voyy9tAQjHJo/Kzd9mssQ3kcm8Nj6bqq+ZRk+zWGRr2HX+MMeHY2QIZqsynhkW0NZeVYB0fq/
 lNiwIQajkL5mWQ4sg7jDVLkQZohi/vTdnAGSsOd0mSbH+vXlfMoX7LFhIHy21JD2hsy7YVVzPMQ/L
 1D9+0PoIpTzBaYRUmycGv9XzPcXi1RIj8HC6g748muedfld69/dTZPL7HwOj3PVI3uqC1RwO+JiBB
 bewGXMmBm+JPhnK45PQpVXqtJ13TYqY0LcUZFruM6NE9w84JlqhhQ8Fe31wF3b7u9wR3IHcmZNuLL
 Yid+JlZA==;
Received: from [2601:1c0:6280:3f0:e65e:37ff:febd:ee53]
 (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLc2k-0089k8-Rs; Thu, 02 Sep 2021 02:01:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-um@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/ttm: provide default page protection for UML
Date: Wed,  1 Sep 2021 19:01:29 -0700
Message-Id: <20210902020129.25952-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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

boot_cpu_data [struct cpuinfo_um (on UML)] does not have a struct
member named 'x86', so provide a default page protection mode
for CONFIG_UML.

Mends this build error:
../drivers/gpu/drm/ttm/ttm_module.c: In function ‘ttm_prot_from_caching’:
../drivers/gpu/drm/ttm/ttm_module.c:59:24: error: ‘struct cpuinfo_um’ has no member named ‘x86’
  else if (boot_cpu_data.x86 > 3)
                        ^

Fixes: 3bf3710e3718 ("drm/ttm: Add a generic TTM memcpy move for page-based iomem")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: linux-um@lists.infradead.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_module.c |    4 ++++
 1 file changed, 4 insertions(+)

--- linux-next-20210901.orig/drivers/gpu/drm/ttm/ttm_module.c
+++ linux-next-20210901/drivers/gpu/drm/ttm/ttm_module.c
@@ -53,6 +53,9 @@ pgprot_t ttm_prot_from_caching(enum ttm_
 	if (caching == ttm_cached)
 		return tmp;
 
+#ifdef CONFIG_UML
+	tmp = pgprot_noncached(tmp);
+#else
 #if defined(__i386__) || defined(__x86_64__)
 	if (caching == ttm_write_combined)
 		tmp = pgprot_writecombine(tmp);
@@ -69,6 +72,7 @@ pgprot_t ttm_prot_from_caching(enum ttm_
 #if defined(__sparc__)
 	tmp = pgprot_noncached(tmp);
 #endif
+#endif
 	return tmp;
 }
 
