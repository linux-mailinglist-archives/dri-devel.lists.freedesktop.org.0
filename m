Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC15BDBDE9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 02:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D7A10E6B2;
	Wed, 15 Oct 2025 00:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="B+5vnFa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B741910E6B2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:10:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760487029; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AbIMEgzChvM3oeaJI9Bd8EODazdIp8H7BBEVDAJoLkajUpuM/LB/owZ48LafIfIz9vrDaslhGdT78Si9r/0INA/JTnS/iwTVknaDLBO5LHMYKhQ4sU7vWaLAR2R0BbfvtxorNpZxa/1mEHfWV/J0Xn0zACfvFdj2+XZK80mhZ/A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760487029;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=iYU8Y6fdfg6t9q0eb4oUSrrpbJyFoasUUDRYSuiHHv4=; 
 b=j2JDCCxSifFpCxlDx/pL+xJRPRKzLLD67ZG94IC3hZX9yk9ZxYvctrg8fQiNXqRNgGp+BY0ZrEun0vqc5AF7KDylRR4dD+jUEQROS4Y5uNRB4IZMRcbWwxMtx2DKfVJKwHPTIfAOpA/XjQeOuEjm26C4zQUmx2KKEP462bpvd4o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760487029; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=iYU8Y6fdfg6t9q0eb4oUSrrpbJyFoasUUDRYSuiHHv4=;
 b=B+5vnFa3GxYM7iSjilhT7iNfQVLahRNbZjswycHLTtgVd9HESnXzsVFzAne+PnQq
 d+Vt6uP7B5HurNQVLV+C0gzXCLIGECZBXcERyygl1MNLSMpmO1K4n2SCKjcQ2DNTkHm
 tljQFv0sy7nvWsF6b042g5nU3R0C91JvhF2E8FQQ=
Received: by mx.zohomail.com with SMTPS id 1760487028919256.12883687539625;
 Tue, 14 Oct 2025 17:10:28 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v6 05/12] drm/panfrost: Check sgt to know whether pages are
 already mapped
Date: Wed, 15 Oct 2025 01:09:11 +0100
Message-ID: <20251015000930.356073-6-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015000930.356073-1-adrian.larumbe@collabora.com>
References: <20251015000930.356073-1-adrian.larumbe@collabora.com>
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

In the MMU's page fault ISR for a heap object, determine whether the
faulting address belongs to a 2MiB block that was already mapped by
checking its corresponding sgt in the Panfrost BO.

This is done in preparation for a future commit in which the MMU mapping
helper might fail, but the page array is left populated, so this cannot
be used as a check for an early bail-out.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index cf272b167feb..ba32d99ed854 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -600,10 +600,12 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		refcount_set(&bo->base.pages_use_count, 1);
 	} else {
 		pages = bo->base.pages;
-		if (pages[page_offset]) {
-			/* Pages are already mapped, bail out. */
-			goto out;
-		}
+	}
+
+	sgt = &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
+	if (sgt->sgl) {
+		/* Pages are already mapped, bail out. */
+		goto out;
 	}
 
 	mapping = bo->base.base.filp->f_mapping;
@@ -625,7 +627,6 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		}
 	}
 
-	sgt = &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
 	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
 					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
 	if (ret)
-- 
2.51.0

