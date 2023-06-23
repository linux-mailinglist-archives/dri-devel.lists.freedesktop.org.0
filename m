Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E7973C8D6
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 10:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2400C10E0A5;
	Sat, 24 Jun 2023 08:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-45.mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7089C10E636
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 10:17:06 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1687514910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qr4AdEHTYoG685b8wdwNQJqh58lsMzRbl2ELqoqnYBI=;
 b=S70026q2IZpnkxGa9L2vVHlHbIqeZLtj7NDD/D9SQI7G7Tlyz5UxodTgl/a/1XqOL3vBdE
 9pVN1uud4BRdZSfLq54XxFbC0yNm0/EzpuD5nJLxGT02xA9NVBCuJLpQzib+Nqn3qMuouD
 yRlg0UhlRSB//HARQF/0Ta571pGYlL4=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 1/8] drm/etnaviv: Using the size_t variable to store the
 number of pages
Date: Fri, 23 Jun 2023 18:08:15 +0800
Message-Id: <20230623100822.274706-2-sui.jingfeng@linux.dev>
In-Reply-To: <20230623100822.274706-1-sui.jingfeng@linux.dev>
References: <20230623100822.274706-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 24 Jun 2023 08:15:48 +0000
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
Cc: loongson-kernel@lists.loongnix.cn, Sui Jingfeng <suijingfeng@loongson.cn>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Because the etnaviv_gem_new_private() function receives the size_t argument
for the number of pages. And the number of pages should be unsigned.

Note that Most 32-bit architectures use "unsigned int" size_t,
and all 64-bit architectures use "unsigned long" size_t.
So, let's keep the argument and parameter consistent.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 3524b5811682..b003481adc2b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -114,7 +114,8 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 {
 	struct etnaviv_gem_object *etnaviv_obj;
 	size_t size = PAGE_ALIGN(attach->dmabuf->size);
-	int ret, npages;
+	size_t npages = size / PAGE_SIZE;
+	int ret;
 
 	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
 				      &etnaviv_gem_prime_ops, &etnaviv_obj);
@@ -123,8 +124,6 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 
 	lockdep_set_class(&etnaviv_obj->lock, &etnaviv_prime_lock_class);
 
-	npages = size / PAGE_SIZE;
-
 	etnaviv_obj->sgt = sgt;
 	etnaviv_obj->pages = kvmalloc_array(npages, sizeof(struct page *), GFP_KERNEL);
 	if (!etnaviv_obj->pages) {
-- 
2.25.1

