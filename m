Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95811CDA17
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 14:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050E36E233;
	Mon, 11 May 2020 12:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0F06E233;
 Mon, 11 May 2020 12:37:52 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x17so10770082wrt.5;
 Mon, 11 May 2020 05:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WudCDKNIwltqXyIC4sQmrbpS3pV2CUnNxCEdHAnQUy4=;
 b=mZOCtuOYeQFrMdo7vUDcjGR/z4NHAHfhoEAuZycbrWaagbg6QpIKT+ZGRgL3JZ4Fqr
 bfqG4S7lQF2W66AvtBncKd/JQyRgGsLp5Hhplwxj2Iy8k2dPKBHIT/6mu2uuhYkClfPr
 p4ynpQoowfRu3zO5ntd1Xc0sy575WYhifa6NJH6yXtP+J17d39ikTYGZVzlPIeCm9pCy
 H6bxp1igS3Hc2m6ype4rDWzCZIkvg11FT5ZGWCUI2AtAy2D9/pXivMyulsltV0y+06OZ
 fbpDKU/Tyh6KZAwtoAskeHG4Z8TjuDNhUbDfqZMDsS6sv1ayU91WJGn8rpol6V/DCr2M
 vRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WudCDKNIwltqXyIC4sQmrbpS3pV2CUnNxCEdHAnQUy4=;
 b=lIDJmNNmCPPBUGCQiH+pH6tMvMetsF9OtFdTV7CKkWD8SfC66j5/MEP7mdEyGtc0TO
 7qifBhf00q77u0KPGsCVCcEnuu687nRJRrHxAYvqnyIhSmxHHNO6JmMpEKsMTB4U5iv/
 0KdrzqkVJClYX/vafgHPcXSpt/3B0dxrBn63dK3ywDJlkPo6CiZnxrffv6eGy0mHugV7
 EucxZsDohIrU8rO18/QV2M0xlhNDEZHrysYVFtkDwmML9JPTP7dF84Jy8vQEOQaOE4QW
 Gr/aIum6JSCzvsvFP3w4y7c0IwUHMIaoty2qYBM3EX15mb69pOYxOBysak/5OPU1+0jA
 Ixdw==
X-Gm-Message-State: AGi0PuZFjR3USaOP6JUZzjedN/5EFqKhaNq+QGPomG/fhyrnstjiHjGg
 zrI8LGO0Fb5h5PA2aPoHR2Q=
X-Google-Smtp-Source: APiQypJ1RLhv+eW1TsuHlL9e31WY/kp/20I/CtCBpc1+BVpOMZUIWxDjCKGW3YThyDvPEw8Yrsfg7w==
X-Received: by 2002:adf:8563:: with SMTP id 90mr18295265wrh.74.1589200671321; 
 Mon, 11 May 2020 05:37:51 -0700 (PDT)
Received: from localhost.localdomain.at
 (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id y70sm27981473wmc.36.2020.05.11.05.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 05:37:50 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: fix perfmon domain interation
Date: Mon, 11 May 2020 14:37:33 +0200
Message-Id: <20200511123744.96246-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: stable@vger.kernel.or, David Airlie <airlied@linux.ie>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GC860 has one GPU device which has a 2d and 3d core. In this case
we want to expose perfmon information for both cores.

The driver has one array which contains all possible perfmon domains
with some meta data - doms_meta. Here we can see that for the GC860
two elements of that array are relevant:

  doms_3d: is at index 0 in the doms_meta array with 8 perfmon domains
  doms_2d: is at index 1 in the doms_meta array with 1 perfmon domain

The userspace driver wants to get a list of all perfmon domains and
their perfmon signals. This is done by iterating over all domains and
their signals. If the userspace driver wants to access the domain with
id 8 the kernel driver fails and returns invalid data from doms_3d with
and invalid offset.

This results in:
  Unable to handle kernel paging request at virtual address 00000000

On such a device it is not possible to use the userspace driver at all.

The fix for this off-by-one error is quite simple.

Reported-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Fixes: ed1dd899baa3 ("drm/etnaviv: rework perfmon query infrastructure")
Cc: stable@vger.kernel.or
Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_perfmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
index e6795bafcbb9..35f7171e779a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_perfmon.c
@@ -453,7 +453,7 @@ static const struct etnaviv_pm_domain *pm_domain(const struct etnaviv_gpu *gpu,
 		if (!(gpu->identity.features & meta->feature))
 			continue;
 
-		if (meta->nr_domains < (index - offset)) {
+		if ((meta->nr_domains - 1) < (index - offset)) {
 			offset += meta->nr_domains;
 			continue;
 		}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
