Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0EC2CCACE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 01:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA716EB20;
	Thu,  3 Dec 2020 00:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2586EB22
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 00:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606953760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5DH0t8qqaEn3RqUMO5KivnbVKgQ9Z9+5Q+gHm3Vh9Tw=;
 b=SdVUTV06atTn/Zx3CvY7YwfLXRP9CWpf7xRL8THgpHZIJ6lrFdP/8l6FURUnZxvcvxd4wJ
 350J9zT4ws2kbNkM20sRBzEyxRJ0VSUHuskXVrIHPO4WD9t5beHem6U3hTLjlCm/RfwIWw
 xqzZ2Lg7MYJhpIezokhNrlftQ6GSdVk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-8Wf3GMDNO5GU6ErKsWYgcg-1; Wed, 02 Dec 2020 19:02:38 -0500
X-MC-Unique: 8Wf3GMDNO5GU6ErKsWYgcg-1
Received: by mail-qt1-f199.google.com with SMTP id c11so173353qtw.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Dec 2020 16:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5DH0t8qqaEn3RqUMO5KivnbVKgQ9Z9+5Q+gHm3Vh9Tw=;
 b=aQSialn7/ZNgcyaWJYsNmdyUrbAlN5S+baY+GS+cvZ5lIGOLX8weJlU52/+Nq8W37D
 G254IkCcUGcY66u0/C1YpEFXWPv3uax1Yr8s45HjSgxs01ACUQglwi0rxJbSk730CGWM
 v8XXOk0WQVizWtv53Um0d7fuBLMKIe4P1ClS+eqb0/kupvDnr5iFTCFzmFifV9wX7IRm
 Ou5b3TWV+8+TsuzPnJPyh+izfOBIUmMZ4/m5zR5RbHr7L8FNF/mbsluaOt52KjWQ7nZy
 8UVHLEIg2+Ax39hfEKspB1LVp2rUM+9OdQCXOwcnAnQLXjJkgvqQPGr+QuVkxVB9sX+S
 wgsw==
X-Gm-Message-State: AOAM532b7zYxToO12hsTuqCM4+9HsE3csHpx9nrJE/yiYm0o3GVK2b8P
 TF/SDcILAD9mIqHHz/xivlUDuUU5QiAToD1wemWddssPnZMVl9sPzdVyKVwPx6qHiWbygPqYlDV
 J2xl9xuN3hPkm48e4rRlVnKqQuSsZ
X-Received: by 2002:ae9:de03:: with SMTP id s3mr368158qkf.218.1606953757267;
 Wed, 02 Dec 2020 16:02:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxk/AL4kcxqZ1ogOOJxv1t1HGunHRRWZ5UdQ0lVVre8JW7SManmMIHEc30+Z/HknHhrJOet2A==
X-Received: by 2002:ae9:de03:: with SMTP id s3mr368133qkf.218.1606953757014;
 Wed, 02 Dec 2020 16:02:37 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a638:b301:9966:d978:493:6a3d])
 by smtp.gmail.com with ESMTPSA id y3sm222428qkl.110.2020.12.02.16.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 16:02:35 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] drm/nouveau: avoid a use-after-free when BO init fails
Date: Wed,  2 Dec 2020 19:02:20 -0500
Message-Id: <20201203000220.18238-1-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jeremy Cline <jcline@redhat.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

nouveau_bo_init() is backed by ttm_bo_init() and ferries its return code
back to the caller. On failures, ttm_bo_init() invokes the provided
destructor which should de-initialize and free the memory.

Thus, when nouveau_bo_init() returns an error the gem object has already
been released and the memory freed by nouveau_bo_del_ttm().

Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 787d05eefd9c..d30157cc7169 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -211,10 +211,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	}
 
 	ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
-	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
+	if (ret)
 		return ret;
-	}
 
 	/* we restrict allowed domains on nv50+ to only the types
 	 * that were requested at creation time.  not possibly on
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
