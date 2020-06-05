Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C8B1F0F25
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95676E423;
	Sun,  7 Jun 2020 19:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2BA6E96D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 18:52:09 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id n24so12969191lji.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jun 2020 11:52:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VDO4czZARJ92nQWa2/saOEN9Dw2btZE7+XJd2+JWZwg=;
 b=aFRgbDXWmMdwwpnfnkgTgPL1LROAMLW3Yq1qhujHVtzAWrne338eQ5JQDlXT0VIs7P
 GLJ+gsK9d6dv409VOp1HxKPg3gRLufH/+5TvluMPiMZFvnCEDiYblUq1dLcCgncYHMbn
 PPxFfN0aRzuIjiBUxmVtJXESkWOOG3Tn1FlG4mr4iDlR/2rtxKhdVAXvDhlGjChGtOeL
 GTbWZwc3135rXYbxTYOTuyHCd7mGqu3umGG9s/FCCpi+GwGg4u6mIgQv5pIyY3Wm35af
 CvXM4X5eh3j7Moh7bwLkaQF6lO9zI7bKQ9oAapOBuaLW/k4DBcTm9sB3lu4WXPN+xEbU
 Athg==
X-Gm-Message-State: AOAM531aHMUnlAVsuB/iF1idYo4t6MML6iv8nctY7cbIv0A0xC1JBcD6
 8Dj2miQTbkKFQWLauIScxEc=
X-Google-Smtp-Source: ABdhPJyIan/7VLcAaDDYG9UbJg5UdB3j2H3sSeQLJ35gqhMbLfIWcVftnxCOgq6DW3rAJlcuOVAA/w==
X-Received: by 2002:a2e:9786:: with SMTP id y6mr5299018lji.398.1591383128001; 
 Fri, 05 Jun 2020 11:52:08 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru.
 [37.110.38.130])
 by smtp.googlemail.com with ESMTPSA id z22sm1273460lfi.96.2020.06.05.11.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 11:52:07 -0700 (PDT)
From: Denis Efremov <efremov@linux.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panfrost: Use kvfree() to free bo->sgts in
 panfrost_mmu_map_fault_addr()
Date: Fri,  5 Jun 2020 21:52:07 +0300
Message-Id: <20200605185207.76661-1-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
kvmalloc_array().

Fixes: 187d2929206e ("drm/panfrost: Add support for GPU heap allocations")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Efremov <efremov@linux.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
