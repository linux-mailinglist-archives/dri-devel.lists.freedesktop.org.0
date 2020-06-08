Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DFB1F34F4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49CC96E265;
	Tue,  9 Jun 2020 07:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66DE6E961
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 15:17:41 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id j18so7911630lji.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 08:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsWMPsmZoyIJzuygJAaRJCsAmuz070EmkzRigfL9BXc=;
 b=iDyKOBeHuXUDNKl5PR0lYiVwXy2RD46s7Em+1Vt+ZYvhuBD1cunEFbVa2BJFYqSvPM
 delRsi9U3vgKhVZVDsIptpvIYJbOY+KyHWOVUmqPLNo064x1nHiK9adIJ6I89REfvDw/
 8yn9iKJhfFxR7ndqz5U0gUX5Dzf9gwx54PPbcYEO3Q3OEj2EQBdh8CbqPZvKIyh0eK76
 fWhnJSDdeMyrKe46P3HcwdIhDxzHlvWgt0nAYXOC3tcoSTby0EvH1/b2TXOk6XPRolam
 BDz94R/awBq/2nlA/xde0xdtz2W7DYEtREutZWFwuXeD5anjufhPtL1WKIg5unbdzmL6
 ZK6g==
X-Gm-Message-State: AOAM533Il6Xlob8nKhj9LZia4o74FYIDMLMZn0KzBiwPBsirHGdvLQcg
 hViBgHqtiC4h0OYvDtbOjhM=
X-Google-Smtp-Source: ABdhPJzDUCdm1G2TGpfofl/wlFzlXPT1eIy4dTUHaK0MG2U+WNevg620xxVGee8AVKlTDm/4kibqzg==
X-Received: by 2002:a2e:2f0a:: with SMTP id v10mr11160069ljv.163.1591629460131; 
 Mon, 08 Jun 2020 08:17:40 -0700 (PDT)
Received: from localhost.localdomain ([213.87.137.116])
 by smtp.googlemail.com with ESMTPSA id x28sm4416704lfg.86.2020.06.08.08.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 08:17:39 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/panfrost: Use kvfree() to free bo->sgts
Date: Mon,  8 Jun 2020 18:17:28 +0300
Message-Id: <20200608151728.234026-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200605185207.76661-1-efremov@linux.com>
References: <20200605185207.76661-1-efremov@linux.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Denis Efremov <efremov@linux.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use kvfree() to free bo->sgts, because the memory is allocated with
kvmalloc_array() in panfrost_mmu_map_fault_addr().

Fixes: 187d2929206e ("drm/panfrost: Add support for GPU heap allocations")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Efremov <efremov@linux.com>
---
Change in v2:
 - kvfree() fixed in panfrost_gem_free_object(), thanks to Steven Price

 drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 17b654e1eb94..556181ea4a07 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -46,7 +46,7 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 				sg_free_table(&bo->sgts[i]);
 			}
 		}
-		kfree(bo->sgts);
+		kvfree(bo->sgts);
 	}
 
 	drm_gem_shmem_free_object(obj);
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index ed28aeba6d59..3c8ae7411c80 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -486,7 +486,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
 				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
 		if (!pages) {
-			kfree(bo->sgts);
+			kvfree(bo->sgts);
 			bo->sgts = NULL;
 			mutex_unlock(&bo->base.pages_lock);
 			ret = -ENOMEM;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
